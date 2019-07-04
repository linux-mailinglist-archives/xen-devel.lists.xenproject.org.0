Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B835F590
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 11:26:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hixxD-00088h-15; Thu, 04 Jul 2019 09:22:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SvFn=VB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hixxB-00088c-NF
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 09:22:57 +0000
X-Inumbo-ID: 4c0db66a-9e3d-11e9-9aca-27aa766c0d4d
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4c0db66a-9e3d-11e9-9aca-27aa766c0d4d;
 Thu, 04 Jul 2019 09:22:53 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Thu,  4 Jul 2019 09:22:51 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 4 Jul 2019 09:18:53 +0000
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 4 Jul 2019 09:18:53 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3379.namprd18.prod.outlook.com (10.255.136.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Thu, 4 Jul 2019 09:18:52 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Thu, 4 Jul 2019
 09:18:52 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Paul Durrant <Paul.Durrant@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2] x86/HVM: p2m_ram_ro is incompatible with device
 pass-through
Thread-Index: AQHVMZODenL8esX3CUGEt7b/0uHdFaa5AV1ggAEucAA=
Date: Thu, 4 Jul 2019 09:18:52 +0000
Message-ID: <0f165d9f-6bfc-1ca0-648e-a64d05d204ed@suse.com>
References: <808bb731-c5a7-86cf-5c5a-25253ea8ff17@suse.com>
 <ee14bec6e2db4064a539f91a78d021f7@AMSPEX02CL03.citrite.net>
In-Reply-To: <ee14bec6e2db4064a539f91a78d021f7@AMSPEX02CL03.citrite.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DBBPR09CA0039.eurprd09.prod.outlook.com
 (2603:10a6:10:d4::27) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5274f26e-dfdb-4a2f-9fbe-08d70060a149
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BY5PR18MB3379; 
x-ms-traffictypediagnostic: BY5PR18MB3379:
x-microsoft-antispam-prvs: <BY5PR18MB337999B59C5F846659B32D27B3FA0@BY5PR18MB3379.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0088C92887
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(346002)(39860400002)(136003)(366004)(396003)(13464003)(189003)(199004)(66066001)(4326008)(476003)(2616005)(36756003)(446003)(99286004)(11346002)(256004)(86362001)(66476007)(14444005)(486006)(66946007)(66556008)(478600001)(66446008)(110136005)(31696002)(71190400001)(5660300002)(6246003)(64756008)(25786009)(73956011)(6116002)(2906002)(71200400001)(53546011)(68736007)(102836004)(8936002)(14454004)(7736002)(54906003)(76176011)(229853002)(52116002)(6512007)(53936002)(6436002)(6486002)(6506007)(186003)(316002)(81166006)(2501003)(31686004)(80792005)(26005)(8676002)(3846002)(72206003)(386003)(81156014)(305945005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3379;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: s0EP0E3CvnpBNGysi9INQdYYKAf5ZUiCm70YqWC0SaHp0pWIS3R+OEldc/Lbm1FAR4mPGqnA7QRMcPiqgw3znzo/XK+UcYEckTjSFL5wY1aNfRksuVZcc9uBTgUXrUDB6ELNVIa61aDN6N7MI3v3wTTHL3HC0fIo+7eHG43ETKb7VU0fFSIpb7/hYBIEr5Jo58mdFy7EB9VxUVJZBXGGLLKw6evuic7+YHlc/HGbIUQLmlvyg5E5uKlx1Gypg8UAvmepkRBTMK1MMs6DE/sutAyvX1MJr2CtFmmZEQxbFlEHD3d4pG0xtbi78z+581+Q1LtDGghImK36MEECzpOAJB2qt895B6rshPr1yjS4FaLrWwWF9GHUkSUGDU1NGL+oyDD77AQbwNJV4gAjLBVWEJitWgw+rLoPCLsFl4DIOwM=
Content-ID: <1977D0C8DA5A58479F54D3A8008D977B@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5274f26e-dfdb-4a2f-9fbe-08d70060a149
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2019 09:18:52.0720 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3379
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2] x86/HVM: p2m_ram_ro is incompatible with
 device pass-through
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDcuMjAxOSAxNzoyMiwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4+IEZyb206IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4N
Cj4+IFNlbnQ6IDAzIEp1bHkgMjAxOSAxMjozNg0KPj4gVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZw0KPj4gQ2M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNv
bT47IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+OyBBbmRyZXcgQ29vcGVy
DQo+PiA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBS
b2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPj4gU3ViamVjdDogW1BBVENI
IHYyXSB4ODYvSFZNOiBwMm1fcmFtX3JvIGlzIGluY29tcGF0aWJsZSB3aXRoIGRldmljZSBwYXNz
LXRocm91Z2gNCj4+DQo+PiBUaGUgd3JpdGUtZGlzY2FyZCBwcm9wZXJ0eSBvZiB0aGUgdHlwZSBj
YW4ndCBiZSByZXByZXNlbnRlZCBpbiBJT01NVQ0KPj4gcGFnZSB0YWJsZSBlbnRyaWVzLiBNYWtl
IHN1cmUgdGhlIHJlc3BlY3RpdmUgY2hlY2tzIC8gdHJhY2tpbmcgY2FuJ3QNCj4+IHJhY2UsIGJ5
IHV0aWxpemluZyB0aGUgZG9tYWluIGxvY2suIFRoZSBvdGhlciBzaWRlcyBvZiB0aGUgc2hhcmlu
Zy8NCj4+IHBhZ2luZy9sb2ctZGlydHkgZXhjbHVzaW9uIGNoZWNrcyBzaG91bGQgc3Vic2VxdWVu
dGx5IHBlcmhhcHMgYWxzbyBiZQ0KPj4gcHV0IHVuZGVyIHRoYXQgbG9jayB0aGVuLg0KPj4NCj4+
IFRha2UgdGhlIG9wcG9ydHVuaXR5IGFuZCBhbHNvIGNvbnZlcnQgbmVpZ2hib3JpbmcgYm9vbF90
IHRvIGJvb2wgaW4NCj4+IHN0cnVjdCBodm1fZG9tYWluLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4+IC0tLQ0KPj4gdjI6IERvbid0IHNl
dCBwMm1fcmFtX3JvX3VzZWQgd2hlbiBmYWlsaW5nIHRoZSByZXF1ZXN0Lg0KPj4NCj4+IC0tLSBh
L3hlbi9hcmNoL3g4Ni9odm0vZG0uYw0KPj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9kbS5jDQo+
PiBAQCAtMjU1LDE2ICsyNTUsMzMgQEAgc3RhdGljIGludCBzZXRfbWVtX3R5cGUoc3RydWN0IGRv
bWFpbiAqZA0KPj4NCj4+ICAgICAgICBtZW1fdHlwZSA9IGFycmF5X2luZGV4X25vc3BlYyhkYXRh
LT5tZW1fdHlwZSwgQVJSQVlfU0laRShtZW10eXBlKSk7DQo+Pg0KPj4gLSAgICBpZiAoIG1lbV90
eXBlID09IEhWTU1FTV9pb3JlcV9zZXJ2ZXIgKQ0KPj4gKyAgICBzd2l0Y2ggKCBtZW1fdHlwZSAp
DQo+PiAgICAgICAgew0KPj4gICAgICAgICAgICB1bnNpZ25lZCBpbnQgZmxhZ3M7DQo+Pg0KPj4g
KyAgICBjYXNlIEhWTU1FTV9pb3JlcV9zZXJ2ZXI6DQo+PiAgICAgICAgICAgIGlmICggIWhhcF9l
bmFibGVkKGQpICkNCj4+ICAgICAgICAgICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsNCj4+DQo+
PiAgICAgICAgICAgIC8qIERvIG5vdCBjaGFuZ2UgdG8gSFZNTUVNX2lvcmVxX3NlcnZlciBpZiBu
byBpb3JlcSBzZXJ2ZXIgbWFwcGVkLiAqLw0KPj4gICAgICAgICAgICBpZiAoICFwMm1fZ2V0X2lv
cmVxX3NlcnZlcihkLCAmZmxhZ3MpICkNCj4+ICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFM
Ow0KPj4gKw0KPj4gKyAgICAgICAgYnJlYWs7DQo+PiArDQo+PiArICAgIGNhc2UgSFZNTUVNX3Jh
bV9ybzoNCj4+ICsgICAgICAgIC8qIHAybV9yYW1fcm8gY2FuJ3QgYmUgcmVwcmVzZW50ZWQgaW4g
SU9NTVUgbWFwcGluZ3MuICovDQo+PiArICAgICAgICBkb21haW5fbG9jayhkKTsNCj4+ICsgICAg
ICAgIGlmICggaGFzX2lvbW11X3B0KGQpICkNCj4+ICsgICAgICAgICAgICByYyA9IC1FWERFVjsN
Cj4+ICsgICAgICAgIGVsc2UNCj4+ICsgICAgICAgICAgICBkLT5hcmNoLmh2bS5wMm1fcmFtX3Jv
X3VzZWQgPSB0cnVlOw0KPiANCj4gRG8gd2UgcmVhbGx5IHdhbnQgdGhpcyB0byBiZSBhIG9uZS13
YXkgdHJpcD8gT24gdGhlIGZhY2Ugb2YgaXQsIGl0DQo+IHdvdWxkIHNlZW0gdGhhdCBrZWVwaW5n
IGEgY291bnQgb2YgcDJtX3JhbV9ybyBlbnRyaWVzIHdvdWxkIGJlIG1vcmUNCj4gZGVzaXJhYmxl
IHN1Y2ggdGhhdCwgb25jZSB0aGUgbGFzdCBvbmUgaXMgZ29uZSwgZGV2aWNlcyBjYW4gYmUNCj4g
YXNzaWduZWQgYWdhaW4/DQoNCldlbGwsIGF0IHRoaXMgcG9pbnQgSSdtIG5vdCByZWFsbHkgdXAg
dG8gaW50cm9kdWNpbmcgYWNjb3VudGluZyBvZg0KdGhlIG51bWJlciBvZiB1c2VzIG9mIHAybV9y
YW1fcm8uIFRoaXMgY291bGQgYmUgYSBmdXJ0aGVyIHN0ZXAgdG8NCmJlIGRvbmUgaW4gdGhlIGZ1
dHVyZSwgaWYgbmVjZXNzYXJ5Lg0KDQo+IElmIG5vdCBtYXliZSBpdCdzIHRpbWUgdG8gZ28gYWxs
IHRoZSB3YXkgYW5kIG1ha2UgaW9tbXUgcGFnZSB0YWJsZQ0KPiBjb25zdHJ1Y3Rpb24gcGFydCBv
ZiBkb21haW4gY3JlYXRlIGFuZCB0aGVuIHdlIHNpbXBsaWZ5IGEgbG90IG9mDQo+IGNvZGUgYW5k
IHdlIGRvbid0IG5lZWQgYW55IGZsYWcvcmVmY291bnQgbGlrZSB0aGlzIGF0IGFsbC4NCg0KSSd2
ZSBzYWlkIHRoaXMgYmVmb3JlOiBJIGRvbid0IHRoaW5rIGl0IHNob3VsZCBiZSBhIHJlcXVpcmVt
ZW50IHRvDQprbm93IGF0IHRoZSB0aW1lIG9mIHRoZSBjcmVhdGlvbiBvZiBhIFZNIHdoZXRoZXIg
aXQnbGwgZXZlbnR1YWxseQ0KaGF2ZSBhIHBhc3MtdGhyb3VnaCBkZXZpY2UgYXNzaWduZWQuIEZ1
cnRoZXJtb3JlIHlvdSByZWFsaXplIHRoYXQNCnRoaXMgc3VnZ2VzdGlvbiBvZiB5b3VycyBpcyBj
b250cmFyeSB0byB3aGF0IHlvdSd2ZSBzYWlkIGZ1cnRoZXIgdXA6DQpUaGlzIHdheSB5b3UnZCBt
YWtlIHRoZSB0d28gdGhpbmdzIGV4Y2x1c2l2ZSBvZiBvbmUgYW5vdGhlciB3aXRob3V0DQphbnkg
cmVjb3Vyc2UuDQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
