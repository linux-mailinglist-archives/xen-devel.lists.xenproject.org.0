Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FB35CD59
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 12:09:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiFg0-0000up-2U; Tue, 02 Jul 2019 10:06:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lloE=U7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hiFfx-0000uk-RC
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 10:06:13 +0000
X-Inumbo-ID: fdf858dc-9cb0-11e9-85fa-7fce5a842eb8
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fdf858dc-9cb0-11e9-85fa-7fce5a842eb8;
 Tue, 02 Jul 2019 10:06:11 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Tue,  2 Jul 2019 10:05:46 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 2 Jul 2019 10:01:59 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 2 Jul 2019 10:01:59 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3138.namprd18.prod.outlook.com (10.255.137.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Tue, 2 Jul 2019 10:01:58 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Tue, 2 Jul 2019
 10:01:58 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <JGross@suse.com>
Thread-Topic: [PATCH 13/60] xen/sched: move some per-vcpu items to struct
 sched_unit
Thread-Index: AQHVMBZ1o3Yy0YSI1EOsynhkarGQtKa13jMZgAAJyQCAAPckdIAAF4MAgAAHmICAAAIWgIAAE/sAgAAF1QA=
Date: Tue, 2 Jul 2019 10:01:58 +0000
Message-ID: <43e2efa2-6e9b-4ffd-77ee-c4fb40cab7a2@suse.com>
References: <be24ad7e-9510-912c-9984-7eec792fae86@suse.com>
 <45139cf0-0b53-1ca2-c8b2-2c2e8813a82d@suse.com>
 <de741925-b823-92ee-c9be-c4cc55da859d@suse.com>
 <0bb81eb9-8303-2dae-2fba-28c73ac74050@suse.com>
 <ee6a055b-2a47-e6ee-91d4-f23bfce5243d@suse.com>
 <ace01bb733d0dd624b9e9ee07c5da4f5567a8a8a.camel@suse.com>
 <ae74f899-b3ea-6349-5352-88b07c0dc9d8@suse.com>
 <e2b690e4ecb8267c600b394c684968c01e510f81.camel@suse.com>
In-Reply-To: <e2b690e4ecb8267c600b394c684968c01e510f81.camel@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6P190CA0002.EURP190.PROD.OUTLOOK.COM (2603:10a6:6:2f::15)
 To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 81cf77b1-b28a-40ef-a69d-08d6fed451fc
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3138; 
x-ms-traffictypediagnostic: BY5PR18MB3138:
x-microsoft-antispam-prvs: <BY5PR18MB31383D6234F4056C7E6F9415B3F80@BY5PR18MB3138.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(346002)(396003)(39860400002)(366004)(136003)(189003)(199004)(478600001)(71190400001)(86362001)(53936002)(68736007)(31696002)(7416002)(6512007)(8676002)(80792005)(81166006)(81156014)(71200400001)(256004)(25786009)(99286004)(4326008)(14454004)(2906002)(5660300002)(8936002)(6506007)(316002)(26005)(386003)(7736002)(76176011)(66556008)(72206003)(54906003)(6486002)(53546011)(66476007)(66946007)(73956011)(229853002)(64756008)(66446008)(66066001)(6436002)(11346002)(476003)(446003)(110136005)(6116002)(36756003)(2616005)(486006)(186003)(305945005)(102836004)(3846002)(6246003)(52116002)(6636002)(31686004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3138;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VgUZ6dzt2ni0cJhIDfVSaiFu0STGqy3g4a17y5KHbLCPW4rHKTAnzVHODxhNedM+szGqTx0KNBzlKbSOIG8Fl0CrjnEX0+n47Uyk5raUghztvxIWI2zwstBwGjuSbRac3C2dsydi6XsjH17Q5sEbTnQq0Q/cf+G4UPgbUb1MIiZczdHr3Xo3hVmpYRKWIG3WfOePotMubjtf3PhBbq8/QoaAwkaWKtfKHH9S7vRmU7JqaHYLCZWKBte94Kx+J0gYeo/eqg8B2z+ZRx8KV/BgHJDLvPk6MOzbdhoDRhluqoUmh4lrh4uLDFHowHaUsqdTXrGgnXKsPOuzZX3dQBTA6pUjx8wgwhVKV6tsY+QQDkEkfpWDVBy5Mu4SPQg0f69GjC9No0nyIkmkGzTodn5HokeqD5TGp75eF+nNOyIbEaA=
Content-ID: <975B7C3D92E4B04FA26E395E65ED92BB@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 81cf77b1-b28a-40ef-a69d-08d6fed451fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 10:01:58.4726 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3138
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 13/60] xen/sched: move some per-vcpu items
 to struct sched_unit
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
 Konrad Wilk <konrad.wilk@oracle.com>, George
 Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 Meng Xu <mengxu@cis.upenn.edu>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDcuMjAxOSAxMTo0MCwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6DQo+IE9uIFR1ZSwgMjAx
OS0wNy0wMiBhdCAwODoyOSArMDAwMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAwMi4wNy4y
MDE5IDEwOjIxLCBEYXJpbyBGYWdnaW9saSB3cm90ZToNCj4+PiBPbiBUdWUsIDIwMTktMDctMDIg
YXQgMDc6NTQgKzAwMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pg0KPj4+PiBBbmQgYWdhaW4g
LSBpZiBzb21lb25lIHBpbnMgZXZlcnkgdkNQVSB0byBhIHNpbmdsZSBwQ1BVLCB0aGF0DQo+Pj4+
IGxhc3QNCj4+Pj4gc3VjaCBwaW5uaW5nIG9wZXJhdGlvbiB3aWxsIGJlIHdoYXQgdGFrZXMgbG9u
ZyB0ZXJtIGVmZmVjdC4gQWl1aQ0KPj4+PiBhbGwNCj4+Pj4gdkNQVS1zIGluIHRoZSB1bml0IHdp
bGwgdGhlbiBiZSBwaW5uZWQgdG8gdGhhdCBvbmUgcENQVSwgaS5lLg0KPj4+PiB0aGV5J2xsIGVp
dGhlciBhbGwgY29tcGV0ZSBmb3IgdGhlIG9uZSBwQ1BVJ3MgdGltZSwgb3Igb25seSBvbmUNCj4+
Pj4gb2YNCj4+Pj4gdGhlbSB3aWxsIGV2ZXIgZ2V0IHNjaGVkdWxlZC4NCj4+Pj4NCj4+PiBJJ20g
bm90IHN1cmUgSSdtIGdldHRpbmcgdGhpcy4gT24gYW4sIHNheSwgU01UIHN5c3RlbSwgd2l0aCA0
DQo+Pj4gdGhyZWFkcw0KPj4+IHBlciBjb3JlLCBhIHVuaXQgaXMgNCB2Q1BVcyBhbmQgYSBwQ1BV
IGlzIDQgdGhyZWFkcy4NCj4+DQo+PiBObywgdGhlIG1lYW5pbmcgb2YgcENQVSBpcyBhIHNpbmds
ZSB0aHJlYWQgb2YgYSBzaW5nbGUgY29yZS4gSS5lLg0KPj4gd2hhdCBpcyByZXByZXNlbnRlZCBi
eSBhIHNpbmdsZSBjcHVtYXNrX3QgYml0Lg0KPj4NCj4gRmluZSwgbGV0J3MgY29udGludWUgdG8g
Y2FsbCB0aGF0IGEgcENQVS4gVGhlbiwgd2hlbiBjb3JlLXNjaGVkdWxpbmcgaXMNCj4gZW5hYmxl
ZCwgdGhlcmUncyBubyA8PG11bHRpcGxlIHZDUFVzIG9mIGEgdW5pdCBiZWluZyBwaW5uZWQgdG8g
dGhlIHNhbWUNCj4gcENQVSBhbmQgYWxsIGNvbXBldGluZyBmb3IganV0IGl0cyBDUFUgdGltZT4+
Lg0KPiANCj4gVGhlcmUncyB1bml0cyBvZiA0IHZDUFVzIGJlaW5nIHBpbm5lZCB0byA0IHBDUFVz
ICh0aGUgNCBwQ1BVcyBvZiBhDQo+IGNvcmUsIG5vdCA0IHJhbmRvbSwgbm9yIGFyYml0cmFyeSwg
b25lcykuDQo+IA0KPiBUaGF0IGlzIHRoZSBwb2ludCwgQUZBSVVJLg0KDQpXZWxsLCBva2F5LCBx
dWl0ZSBwb3NzaWJsZS4gQnV0IHRoZW4gZm9yIHRoZSBleGFtcGxlIHRvcG9sb2d5DQp5b3UgZ2F2
ZSwgd2hhdCBpcyBnb2luZyB0byBiZSB0aGUgZWZmZWN0IG9mDQoNCnhsIHZjcHUtcGluIDAgMCAw
DQoNCj8gSW4gcGFydGljdWxhciBmb3IgRG9tMCBhbmQgaW4gcGFydGljdWxhciBmb3IgQ1BVIDAs
IHRoZXJlIG1heQ0KYmUgcmVhc29ucyB0byBwaW4gYSBwYXJ0aWN1bGFyIHZDUFUgdG8gaXQuDQoN
Ckphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
