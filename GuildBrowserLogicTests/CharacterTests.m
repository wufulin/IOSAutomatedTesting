//
//  CharacterTests.m
//  GuildBrowser
//
//  Created by wufulin on 27/3/13.
//  Copyright (c) 2013 Charlie Fulton. All rights reserved.
//

#import "CharacterTests.h"
#import "Character.h"
#import "Item.h"

@implementation CharacterTests
{
    NSDictionary *_characterDetailJson;
}

-(void)setUp
{
    NSURL *dataServiceURL = [[NSBundle bundleForClass:self.class] URLForResource:@"character" withExtension:@"json"];
    
    NSData *sampleData = [NSData dataWithContentsOfURL:dataServiceURL];
    NSError *error;
    
    id json = [NSJSONSerialization JSONObjectWithData:sampleData
                                              options:kNilOptions
                                                error:&error];
    STAssertNotNil(json, @"invalid test data");
    
    _characterDetailJson = json;
}

-(void)tearDown
{
    _characterDetailJson = nil;
}

-(void)testCreateCharacterFromDetailJson
{
    Character *testGuy1 = [[Character alloc] initWithCharacterDetailData:_characterDetailJson];
    STAssertNotNil(testGuy1, @"Could not create character from detail json");
    
    Character *testGuy2 = [[Character alloc] initWithCharacterDetailData:nil];
    STAssertNotNil(testGuy2, @"Could not create character from nil data");
}

-(void)testCreateCharacterFromDetailJsonProps
{
    Character *_testGuy = [[Character alloc] initWithCharacterDetailData:_characterDetailJson];
    STAssertEqualObjects(_testGuy.thumbnail, @"borean-tundra/171/40508075-avatar.jpg", @"thumbnail is wrong");
    STAssertEqualObjects(_testGuy.name, @"Hagrel", @"name is wrong");
    STAssertEqualObjects(_testGuy.battleGroup, @"Emberstorm", @"battlegroup is wrong");
    STAssertEqualObjects(_testGuy.realm, @"Borean Tundra", @"realm is wrong");
    STAssertEqualObjects(_testGuy.level, @85, @"level is wrong");
}
@end
