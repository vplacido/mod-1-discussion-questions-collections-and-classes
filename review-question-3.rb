# begin to build a simple program that models Instagram
# you should have a User class, a Photo class and a comment class


class User

    @@all = []
    attr_reader :name

    def initialize(user)
        @name = user
        @@all << self
    end

    def self.all
        @@all
    end 

    def photos
        Photo.all.select { |photo| photo.user == self}
    end 


end 

class Photo

    attr_accessor :user

    @@all = []


    def initialize
        @@all << self
        @user = nil
    end 

    def self.all
        @@all
    end

    def comments
        Comment.all.select { |comment| comment.photo == self}
    end

    def make_comment(comment)
         Comment.new(self, comment)

    end 
    
end

class Comment

    attr_reader :photo, :comment

    @@all = []
    def initialize(photo_instance, comment_string)
        @photo = photo_instance
        @comment = comment_string

        @@all << self
    end

    def self.all
        @@all
    end
end

sandwich_photo = Photo.new
sophie = User.new("Sophie")
sandwich_photo.user = sophie
sandwich_photo.user.name
# => "Sophie"
sophie.photos
# => [#<Photo:0x00007fae2880b370>]


sandwich_photo.comments
# => []

sandwich_photo.make_comment("this is such a beautiful photo of your lunch!! I love photos of other people's lunch")
sandwich_photo.comments
# => [#<Comment:0x00007fae28043700>]

Comment.all
#=> [#<Comment:0x00007fae28043700>]
