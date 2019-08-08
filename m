Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CF386588
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 17:19:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvk9C-0001mX-VE; Thu, 08 Aug 2019 15:16:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hvk9B-0001mR-DB
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 15:16:09 +0000
X-Inumbo-ID: 671d2238-b9ef-11e9-91fa-bb09c5c933a4
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 671d2238-b9ef-11e9-91fa-bb09c5c933a4;
 Thu, 08 Aug 2019 15:16:07 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Thu,  8 Aug 2019 15:15:46 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 8 Aug 2019 15:12:14 +0000
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 8 Aug 2019 15:12:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bmGkrD11MZ9DN9so5T/exjv0GXVLpSnhyj9uHUFgUPa8o2DxGsg6JG5WpW+vpkl2eb0rmd/0kVOWPO2o810eAIJWbcniaXVDc1FFcqcbND0XQOo80xtzVNXzT69+yDWsAsnyWH1i6Vmg+ZWyMv8Ujw0e29QiuPZGzj7JM7i9Y5XnIDMgJ6IPo4ZVlerZCGQix+w0mleLvQ4tN6ADSMW5BgMAvEDvstk/bwdOlsU/BQbFEjG6Tp2j4Y/HWRT4ztYPeCnsCWmls/YjmtOqAocubabhbe/0MfK8vMECnEaiEUd6Ar7KReDvglUyfSNGKnP79XOGy9CiviW8V2zOzFm1LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJQFiiL3J7JUzoPKfCiaE8db4Tm7QNhNCsYWMXaw+m4=;
 b=as14yJxbpx8dgR3YQInf8M913Bj1Z/vRpGFZNZEHYpNRMIUc4FiBaBa/hOlvmG3StzGlZn7J5MDwAnZJwWxsHazSLBEZiBvklcRbfTqlIwupOvmzowi3bqXFxROx/OdN2dNsnwUD4Sw0hzW4mLfM2hGGkprh7jeYYg2EU1N5KdOgF5Cewzw0npZvW43HU8HeuyQblQaYgAJ8WknivQv6Hl8B6alnBG2PblWzBxSfyJcXZoEdoRrZtGtLatPstz27PWweLUm+rdjCNj4RDz+Ek//SNeuLGdcL2LirOSXlr4Xf8dUplVM01f6Gv8zm15Y84fCAZDaBIzP7rrA2QPIyjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB3293.namprd18.prod.outlook.com (10.255.237.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Thu, 8 Aug 2019 15:12:13 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081%7]) with mapi id 15.20.2157.015; Thu, 8 Aug 2019
 15:12:13 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "Elnikety, Eslam" <elnikety@amazon.com>
Thread-Topic: [Xen-devel] [PATCH v2] evtchn: make support for different ABIs
 tunable
Thread-Index: AQHVTUemBo6+AevzQUaLlW2s+A9xKqbxP2QAgAAR5wCAAAtvAA==
Date: Thu, 8 Aug 2019 15:12:12 +0000
Message-ID: <bbfb372f-013f-461a-af50-5ac95c5c2d27@suse.com>
References: <20190807174223.67590-1-elnikety@amazon.com>
 <5752a9af-ec3b-1401-13d9-4b93bdd99d72@suse.com>
 <4FAA00A4-7025-4882-88C1-C8C5FEEAD18C@amazon.com>
In-Reply-To: <4FAA00A4-7025-4882-88C1-C8C5FEEAD18C@amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR05CA0093.eurprd05.prod.outlook.com
 (2603:10a6:208:136::33) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c55f9fd-8f6d-4bba-eac0-08d71c12ca5d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR18MB3293; 
x-ms-traffictypediagnostic: MN2PR18MB3293:
x-microsoft-antispam-prvs: <MN2PR18MB3293C736F9BD8E5115B44C55B3D70@MN2PR18MB3293.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:820;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(376002)(346002)(396003)(39860400002)(366004)(189003)(199004)(6436002)(86362001)(66066001)(31696002)(71190400001)(71200400001)(2906002)(7416002)(54906003)(316002)(99286004)(80792005)(52116002)(186003)(26005)(76176011)(102836004)(53546011)(6506007)(31686004)(386003)(478600001)(14454004)(305945005)(7736002)(8936002)(6116002)(66946007)(486006)(81166006)(36756003)(446003)(229853002)(11346002)(2616005)(6246003)(476003)(81156014)(3846002)(4326008)(14444005)(256004)(25786009)(5660300002)(8676002)(6916009)(66446008)(6486002)(6512007)(66556008)(64756008)(66476007)(53936002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB3293;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Oc9RKT2Qrd+WMTriIT+VV/F5zJFumIspXqfqDDlKbSlvaYlM/mWVRIrq0NuU2Tr3TflMtZsjilkOOJXTfN2F/F4zTLoXF92AoFFfAGQ3sLmkVz4GHN1K/j41b4z9RPml5cWpNkwhq3kRvr7bn0B1GkZjid3yWjEChIZ63RoYrN5Bkb2R2JoUqvTpaoEljApbRHIoTLA7Vua2R88s87ypus7sPlm9IlJvYGCB6sue5fT6fXjIPPc09+jxA4PpDCyMJ//wD2psEkCI8P78vmkd9TIE7JzzsSFq3yH0+3t3L9c4RRGiHzXsHFnhv81TBRWVrQHKU2GEvlzKEJFNML6ClY8qHF8cm4bAeRps9PGzdgxjQgOpp8sMT1pqwepwGMmW8RNqSljf8eHDMDgeQR+A93YSveaGYYGoIAfE6oh4/mA=
x-ms-exchange-transport-forked: True
Content-ID: <3557C367858ABE46A8B09D61EFE305B5@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c55f9fd-8f6d-4bba-eac0-08d71c12ca5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 15:12:12.8285 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AVnEmDPQEuaA4QZ2TVxTPjsOaN8fGTTfw2JFcHbbzwNz9HGWkqjKR2lmJiOni7uNMHcbdVqFkBPXpRuoyHYGoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB3293
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2] evtchn: make support for different ABIs
 tunable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDguMjAxOSAxNjozMSwgIEVsbmlrZXR5LCBFc2xhbSAgd3JvdGU6DQoNCkZpcnN0IG9m
IGFsbCAtIGNhbiB5b3UgcGxlYXNlIHRyeSB0byBnZXQgeW91ciByZXBseSBxdW90aW5nDQppbXBy
b3ZlZCwgc3VjaCB0aGF0IHJlYWRlcnMgY2FuIGFjdHVhbGx5IHRlbGwgeW91ciByZXBsaWVzDQpm
cm9tIGNvbnRleHQ/IChJIGRpZG4ndCBjaGVjayB3aGV0aGVyIHBlcmhhcHMgeW91ciBtYWlsIHdh
cw0KYSBIVE1MIG9uZSwgYW5kIG15IHBsYWluIHRleHQgcmVhZGluZyBvZiBpdCBkaXNjYXJkZWQg
dGhlDQptYXJraW5ncy4gSWYgc28gLSBwbGVhc2UgZG9uJ3Qgc2VuZCBIVE1MIG1haWwuKQ0KDQo+
IE9uIDguIEF1ZyAyMDE5LCBhdCAxNToyNywgSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29t
PG1haWx0bzpKQmV1bGljaEBzdXNlLmNvbT4+IHdyb3RlOg0KPiBPbiAwNy4wOC4yMDE5IDE5OjQy
LCBFc2xhbSBFbG5pa2V0eSB3cm90ZToNCj4gLS0tIGEveGVuL2NvbW1vbi9ldmVudF9jaGFubmVs
LmMNCj4gKysrIGIveGVuL2NvbW1vbi9ldmVudF9jaGFubmVsLmMNCj4gQEAgLTExNzAsNiArMTE3
MCwxMSBAQCBsb25nIGRvX2V2ZW50X2NoYW5uZWxfb3AoaW50IGNtZCwgWEVOX0dVRVNUX0hBTkRM
RV9QQVJBTSh2b2lkKSBhcmcpDQo+IA0KPiAgICAgICBjYXNlIEVWVENITk9QX2luaXRfY29udHJv
bDogew0KPiAgICAgICAgICAgc3RydWN0IGV2dGNobl9pbml0X2NvbnRyb2wgaW5pdF9jb250cm9s
Ow0KPiArDQo+ICsgICAgICAgIC8qIEZhaWwgaW5pdF9jb250cm9sIGZvciBkb21haW5zIHRoYXQg
bXVzdCB1c2UgMmwgQUJJICovDQo+ICsgICAgICAgIGlmICggY3VycmVudC0+ZG9tYWluLT5vcHRp
b25zICYgWEVOX0RPTUNUTF9DREZfZGlzYWJsZV9maWZvICkNCj4gKyAgICAgICAgICAgIHJldHVy
biAtRVBFUk07DQo+ICsNCj4gICAgICAgICAgIGlmICggY29weV9mcm9tX2d1ZXN0KCZpbml0X2Nv
bnRyb2wsIGFyZywgMSkgIT0gMCApDQo+ICAgICAgICAgICAgICAgcmV0dXJuIC1FRkFVTFQ7DQo+
ICAgICAgICAgICByYyA9IGV2dGNobl9maWZvX2luaXRfY29udHJvbCgmaW5pdF9jb250cm9sKTsN
Cj4gDQo+IEkgdGhpbmsgdGhlIGNoZWNrIHdvdWxkIGJldHRlciBnbyBpbnRvIGV2dGNobl9maWZv
X2luaXRfY29udHJvbCgpLA0KPiBhdCBsZWFzdCBhcyBsb25nIGFzIHRoZSBzZXR0aW5nIHJlYWxs
eSBpcyBGSUZPLWNlbnRyaWMuIEFsc28gdGhlDQo+IA0KPiBOb3Qgc3VyZS4gSXQgaXMgdGhlIEZJ
Rk8gQUJJIHRoYXQgZGVmaW5lcyBFVlRDSE5PUF9pbml0X2NvbnRyb2wNCj4gKG5vdCBkZWZpbmVk
IGluIDJMKS4gU2hvcnQtY2lyY3VpdGluZyB0aGUgaHlwZXJjYWxsIGF0IHRoaXMgcGxhY2UNCj4g
c2VlbXMgbW9yZSBhcHByb3ByaWF0ZS4NCg0KSSdkIGV4cGVjdCBhbnkgM3JkIHZhcmlhbnQgdG8g
YWxzbyBoYXZlIGEgbmVlZCBmb3IgYW4gaW5pdC1jb250cm9sDQpvcGVyYXRpb24sIGFuZCBoZW5j
ZSBhdCB0aGF0IHBvaW50IHRoaXMgd291bGQgYmVjb21lIGEgaG9vayBsaWtlDQptYW55IG9mIHRo
ZSBvdGhlciBvcHMuIEFuZCBhdCB0aGF0IHBvaW50IHRoZSBjaGVjayB3b3VsZCBuZWVkIHRvDQpt
b3ZlIGFueXdheS4gSGVuY2UgaXQncyBiZXR0ZXIgdG8gcHV0IGl0IGluIGl0cyBsb25nIHRlcm0N
CmRlc2lnbmF0ZWQgcGxhY2UgcmlnaHQgYXdheS4NCg0KPiBNb3Jlb3ZlciwgZG9pbmcgY29weV9m
cm9tX2d1ZXN0IGFuZCBjYWxsaW5nIGludG8NCj4gZXZ0Y2huX2ZpZm9faW5pdF9jb250cm9sIG9u
bHkgdG8gcmV0dXJuIGVycm9yIGlzIG5vdCBvcHRpbWFsLg0KDQpUcnVlLCB5ZXQgZnJvbSBteSBw
b3YgdGhlIG1vcmUgbG9naWNhbCBhbHRlcm5hdGl2ZSBjb2RlIHN0cnVjdHVyZQ0KaXMgc3RpbGwg
cHJlZmVyYWJsZS4NCg0KPiBJcnJlc3BlY3RpdmUgb2YgdGhlc2UgcmVtYXJrcywgYW5kIGFsb25n
IHRoZSBsaW5lcyBvZiBjb21tZW50cyBvbg0KPiB0aGUgdjEgdGhyZWFkLCBpbnRyb2R1Y2luZyB3
aWRlciBjb250cm9sIHRoYXQgd291bGQgYWxzbyBhbGxvdw0KPiBkaXNhYmxpbmcgMi1sZXZlbCAo
Zm9yIEhWTSBndWVzdHMpIHdvdWxkIHNlZW0gYmV0dGVyIHRvIG1lLiBUaGlzDQo+IHdvdWxkIHRo
ZW4gaG9wZWZ1bGx5IGJlIGNvZGVkIHVwIGluIGEgd2F5IHRoYXQgd291bGQgbWFrZSBleHRlbmRp
bmcNCj4gaXQgc3RyYWlnaHRmb3J3YXJkLCBvbmNlIGEgM3JkIG1lY2hhbmlzbSBhcHBlYXJzLg0K
PiANCj4gSG1tbS4uLiB3ZSBjYW5ub3QgZm9yY2UgZ3Vlc3RzIHRvIGNhbGwgaW5pdF9jb250cm9s
IChpbiBvcmRlciB0byBmbGlwIGZyb20gMkwgdG8gRklGTykuIFF1b3RpbmcgZnJvbSBbMV0gNC40
IOKAnElmIHRoaXMgY2FsbCAoRVZUQ0hOT1BfaW5pdF9jb250cm9sKSBmYWlscyBvbiB0aGUgYm9v
dCBWQ1BVLCB0aGUgZ3Vlc3Qgc2hvdWxkIGNvbnRpbnVlIHRvIHVzZSB0aGUgMi1sZXZlbCBldmVu
dCBjaGFubmVsIEFCSSBmb3IgYWxsIFZDUFVzLuKAnSBTdXBwb3J0IGZvciAyTCBBQkkgZG9lcyBu
b3Qgc291bmQgbGlrZSBzb21ldGhpbmcgdGhhdCBjYW4gYmUgb3B0aW9uYWwuIE9uY2UgYSAzcmQg
bWVjaGFuaXNtIGFwcGVhcnMsIEkgaW1hZ2luZSBhZGRpbmcgYSBjb3JyZXNwb25kaW5nIGRvbWN0
bCBmbGFnIHRvIGNvbnRyb2wgc3VjaCBtZWNoYW5pc20uDQoNCkZvciBIVk0sIGV2ZW50IGNoYW5u
ZWxzIGFzIGEgd2hvbGUgc2hvdWxkIGJlIG9wdGlvbmFsOyB3ZSBzaG91bGRuJ3QNCmRlZmF1bHQg
YSBwb3NzaWJsZSBjb250cm9sIGZvciB0aGlzIHRvIG9mZiB0aG91Z2guIEZvciBQViwgdGhlDQoy
LWxldmVsIGludGVyZmFjZSBpbmRlZWQgaGFzIHRvIGJlIGNvbnNpZGVyZWQgbWFuZGF0b3J5LiBI
ZW5jZQ0KdG9kYXkgdGhlcmUgYXJlIHRoZXNlICh0aGVvcmV0aWNhbGx5KSBwb3NzaWJsZSBjb21i
aW5hdGlvbnMNCg0KCQlQVgkJSFZNDQpub3RoaW5nCQlpbnZhbGlkCQl2YWxpZA0KMi1sZXZlbCBv
bmx5CXZhbGlkCQl2YWxpZA0KRklGTyBvbmx5CT8/PwkJdmFsaWQNCmJvdGgJCXZhbGlkCQl2YWxp
ZA0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
