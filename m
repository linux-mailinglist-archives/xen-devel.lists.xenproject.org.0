Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D59295BEF2
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 17:01:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hhxkw-0005Gj-98; Mon, 01 Jul 2019 14:58:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YZ94=U6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hhxku-0005Ge-Dn
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 14:58:08 +0000
X-Inumbo-ID: 9500dd04-9c10-11e9-bb20-2fe5308d9baa
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9500dd04-9c10-11e9-bb20-2fe5308d9baa;
 Mon, 01 Jul 2019 14:58:06 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  1 Jul 2019 14:57:43 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 1 Jul 2019 14:55:16 +0000
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 1 Jul 2019 14:55:16 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3203.namprd18.prod.outlook.com (10.255.137.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.18; Mon, 1 Jul 2019 14:55:14 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2008.020; Mon, 1 Jul 2019
 14:55:14 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Thread-Topic: [PATCH v5] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVMA7WPzdd4ckrE0m6/AH0OcBhs6a11zaAgAACkAA=
Date: Mon, 1 Jul 2019 14:55:14 +0000
Message-ID: <3fa5932d-174c-9b57-3cb6-aab4eb6a5238@suse.com>
References: <fb2a4d3e-b477-11a5-7b5e-4a236acd60dd@suse.com>
 <0b12721c-8820-7227-1079-0bd1f5587287@bitdefender.com>
In-Reply-To: <0b12721c-8820-7227-1079-0bd1f5587287@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB8PR06CA0062.eurprd06.prod.outlook.com
 (2603:10a6:10:120::36) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2de21ac3-66ef-4564-b4f1-08d6fe341f8b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3203; 
x-ms-traffictypediagnostic: BY5PR18MB3203:
x-microsoft-antispam-prvs: <BY5PR18MB3203753243EBBEED85765008B3F90@BY5PR18MB3203.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00851CA28B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(136003)(366004)(396003)(39860400002)(346002)(189003)(199004)(8676002)(478600001)(14444005)(71190400001)(256004)(446003)(486006)(66556008)(66446008)(66476007)(73956011)(64756008)(6116002)(99286004)(52116002)(80792005)(66946007)(66066001)(186003)(36756003)(11346002)(31696002)(26005)(54906003)(81166006)(71200400001)(229853002)(76176011)(102836004)(305945005)(31686004)(7416002)(53546011)(68736007)(81156014)(476003)(53936002)(7736002)(2906002)(316002)(386003)(6916009)(4326008)(6246003)(5660300002)(8936002)(14454004)(6436002)(3846002)(6512007)(72206003)(86362001)(2616005)(6486002)(25786009)(6506007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3203;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9mBe/lN1RcCWS2Xop4rBMJS4WiJBemuToKp3Xh8Wb3rfdbG98oE4LRZteHtHgk0UebytTBowzZ5SJdOnYZ1jSMu64tJYh9+bQOM7KS6QljGatG6wpYEnWhbZWOmolusbvmUT/0SBGUJgEb2IxDYKx+JAx3aRbSG4pVNCTWHi1gRnGA04FHKoQqkheg0tuHcEl0/QlW6AZfb4qN2VAUmKkMaSGzxIlG3rDb10N2Up9KqA5PeX7XGgbHNUcgjgsE7G4SAs0kAh+j2ONxBF/qXvEqrjnM7e+N4uX3E1zN4e0igsepQ5a3cwpXXsMw3OOMC6jdHk2wH+xCpvoVas+9HGcfm7qziDADGb9dEjdpkM3GDrikGeuy/PiIJsm+XrWndBQAjEaKJyHSpxV9fef+6QJodgh78UQ321OOLH19IbHho=
Content-ID: <E359837C9E45D2418A844CBA90A4BDD6@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de21ac3-66ef-4564-b4f1-08d6fe341f8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2019 14:55:14.3865 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3203
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v5] x86/emulate: Send vm_event from emulate
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
Cc: Wei Liu <wl@xen.org>, "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>,
 "jun.nakajima@intel.com" <jun.nakajima@intel.com>,
 "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 PaulDurrant <Paul.Durrant@citrix.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "brian.woods@amd.com" <brian.woods@amd.com>, Roger
 Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMDcuMjAxOSAxNjo0NSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6DQo+IE9u
IDAxLjA3LjIwMTkgMTY6MTMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4gT24gMDQuMDYuMTkg
YXQgMTM6NDksIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6DQo+Pj4gKyAgICBpZiAo
ICFzZW5kX2V2ZW50IHx8ICFwZmVjICkNCj4+PiArICAgICAgICByZXR1cm4gZmFsc2U7DQo+Pg0K
Pj4gSSB0aGluayBJJ3ZlIHNhaWQgYmVmb3JlIHRoYXQgdGhlICFwZmVjIHBhcnQgbmVlZCBhbiBl
eHBsYW5hdGlvbiAoaW4NCj4+IGEgY29tbWVudCkuIFdpdGhvdXQgc3VjaCBhbiBleHBsYW5hdGlv
biBJJ20gaW5jbGluZWQgdG8gc2F5IGl0DQo+PiBzaG91bGQgYmUgZGVsZXRlZC4gSWYgb3RvaCB0
aGlzIGlzIHNpbXBseSBtZWFuIHRvIGJlIGEgc2hvcnRjdXQsDQo+PiB0aGVuIHlvdSBzaG91bGQg
cmVhbGx5IGp1c3QgY2hlY2sgdGhlIHR3byBiaXRzIHlvdSBhY3R1YWxseSBjYXJlDQo+PiBhYm91
dCBmdXJ0aGVyIGRvd24uDQo+IA0KPiBUaGUgcGZlYyBjaGVjayBpcyBkb25lIGJlY2F1c2UgSSBl
bmNvdW50ZXJlZCBwZmVjIDAgaW4gdGVzdHMuIEl0IGNvdWxkDQo+IHNhdmUgc29tZSB3b3JrIGlm
IHBmZWMgPT0gMCB3aGVuIGNhbGxpbmcgdGhlIGZ1bmN0aW9uLiBJcyB0aGVyZQ0KPiBhIG11c3Qg
aW4gaGF2aW5nIHRoaXMgY2hlY2sgcmVtb3ZlZD8gSWYgc28gdGhlbiBpdCBjYW4gYmUgZG9uZS4g
VGhlDQo+IHNlbmRfZXZlbnQgd2lsbCBiZSBjaGVja2VkIGJlZm9yZSBjYWxsaW5nIHRoZSBmdW5j
dGlvbiBhcyB5b3Ugc2FpZC4NCg0KSXQncyBub3QgYSByZXF1aXJlbWVudCBmb3IgaXQgdG8gYmUg
cmVtb3ZlZCwgX2lmXyB0aGVyZSdzIGEgZ29vZA0KcmVhc29uIGZvciBpdCB0byBiZSB0aGVyZS4g
SSBkb24ndCwgaG93ZXZlciwgc2VlIGhvdyBwZmVjPTAgY291bGQNCmJlIGEgcHJvYmxlbSAtIGFm
YWljdCBpdCB3b3VsZCByZXR1cm4gZmFsc2UgYSBmZXcgbGluZXMgZnVydGhlcg0KZG93biBpbiB0
aGF0IGNhc2UuDQoNCj4+PiArICAgIGlmICggIXJlcS51Lm1lbV9hY2Nlc3MuZmxhZ3MgKQ0KPj4+
ICsgICAgICAgIHJldHVybiBmYWxzZTsgLyogbm8gdmlvbGF0aW9uICovDQo+Pg0KPj4gSG93IGlz
IHRoZSAiZmFsc2UiIGhlcmUgKEkgdGhpbmsgdGhpcyBpcyB0aGUgb25lIHRoZSBkZXNjcmlwdGlv
biB0YWxrcw0KPj4gYWJvdXQpIG1hdGNoaW5nIHVwIHdpdGggdGhlIHZhcmlvdXMgb3RoZXIgb25l
cyBpbiB0aGUgZnVuY3Rpb24/DQo+IA0KPiBUaGVyZSBzaG91bGQgYmUgbm8gZXZlbnQgaWYgdGhl
cmUgaXMgbm8gYWNjZXNzIHZpb2xhdGlvbi4gU28gaW4gdGhpcw0KPiBjYXNlIHRoZSBlbXVsYXRp
b24gaXMgY29udGludWVkIGFzIGV4cGVjdGVkLg0KDQpCdXQgdGhpcyBkb2Vzbid0IGFuc3dlciBt
eSBxdWVzdGlvbjogWW91IHVzZSAiZmFsc2UiIGFzIHJldHVybiB2YWx1ZQ0KdG8gaW5kaWNhdGUg
ZGlmZmVyZW50IHRoaW5ncy4gT25seSB0aGUgb25lIGhlcmUgbWVhbnMgIm5vIGFjY2Vzcw0Kdmlv
bGF0aW9uIi4NCg0KPj4+IEBAIC02MTUsNiArNjY5LDEzIEBAIHN0YXRpYyB2b2lkICpodm1lbXVs
X21hcF9saW5lYXJfYWRkcigNCj4+PiAgICANCj4+PiAgICAgICAgICAgIGlmICggcGZlYyAmIFBG
RUNfd3JpdGVfYWNjZXNzICkNCj4+PiAgICAgICAgICAgIHsNCj4+PiArICAgICAgICAgICAgaWYg
KCBodm1fZW11bGF0ZV9zZW5kX3ZtX2V2ZW50KGFkZHIsIGdmbiwgcGZlYywNCj4+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGh2bWVtdWxfY3R4dC0+c2VuZF9l
dmVudCkgKQ0KPj4+ICsgICAgICAgICAgICB7DQo+Pj4gKyAgICAgICAgICAgICAgICBlcnIgPSBF
UlJfUFRSKH5YODZFTVVMX1JFVFJZKTsNCj4+PiArICAgICAgICAgICAgICAgIGdvdG8gb3V0Ow0K
Pj4+ICsgICAgICAgICAgICB9DQo+Pg0KPj4gSG93IGNvbWUgdGhpcyBzaXRzIG9ubHkgb24gdGhl
IHdyaXRlIHBhdGg/DQo+IA0KPiBXZSBhcmUgaW50ZXJlc3RlZCBvbmx5IGZvciB0aGUgd3JpdGUg
YWNjZXNzIG9uIHRoaXMgcGF0aC4gVGhpcyBhbHNvDQo+IGVuc3VyZXMgdGhhdCBwZmVjIGlzIHNl
dC4NCg0KSSdtIHNvcnJ5LCBidXQgdGhlIGV2ZW50IHNlbmRpbmcgc2hvdWxkIG5vdCBiZSB0YWls
b3JlZCB0byB3aGF0IHlvdQ0KbmVlZCBvciB3YW50LiBPciBpZiBzbyAoaS5lLiBpZiBhZ3JlZWQg
dXBvbiBhbW9uZyB0aGUgVk0gZXZlbnQNCm1haW50YWluZXJzKSB0aGVuIHRoaXMgcmVzdHJpY3Rp
b24gc2hvdWxkIGJlIGNsZWFybHkgc3BlbGxlZCBvdXQuDQoNCkphbg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
