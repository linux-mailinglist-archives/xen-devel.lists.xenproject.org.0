Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 369C412B281
	for <lists+xen-devel@lfdr.de>; Fri, 27 Dec 2019 08:59:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ikkSP-0007ds-5I; Fri, 27 Dec 2019 07:54:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j2i0=2R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ikkSN-0007dn-Hp
 for xen-devel@lists.xenproject.org; Fri, 27 Dec 2019 07:54:47 +0000
X-Inumbo-ID: 1fa4ac84-287e-11ea-a914-bc764e2007e4
Received: from m4a0072g.houston.softwaregrp.com (unknown [15.124.2.130])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1fa4ac84-287e-11ea-a914-bc764e2007e4;
 Fri, 27 Dec 2019 07:54:36 +0000 (UTC)
Received: FROM m4a0072g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0072g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 27 Dec 2019 07:53:34 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 27 Dec 2019 07:53:00 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 27 Dec 2019 07:53:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HIyxPY7DOlyKi19GX/ZY28iXjdXsrV5th6gULXrlPLWEFFBuk1BL5IcTMCCNf2V7932A3LgvF8Vq+bliL8oKDGwdQFLwAKMdH9LW1UfdC6qjRMEvL4ybRYc8hELkjYqYgcssT8ivFpjUsbT0HTQdM9bLgptrOT23JG6gCww9aMhOTNZ1bOKZ5B/9bAkzh5PBwObpLI2eopuTyFE2QGKS0DPrgRUES0o5vwZj2iEFbnVpxEylfXPoGNza932V9WiOz4b4IZ3bNS2hmKT4fyrR6li9k2h0OrO/PBFq6kBdxi42hc6Gmy0ub56oqfpQfMtN5EOxeYONGwAqDsT56ajQgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UJhK7118H9hvsr7HS5/4d6+JU56yDwtNOifgEE5SYcI=;
 b=KJgwyu/QbQOciUO5JxzbKZXrBYPObUJev82Bbbn3x/VOvlXHMvYLaezSDmF/AXJVAJH/9dAkylIsy8KgtSwsPBO5qT9diSmzhO6NI3JM53kjV438ghud2Il6kT/Kdc43zZCoQ0vmYe2Xb9PpNnj0YsAb8/+YeLsEIf7/qrFdiocyINxi3hxp7AMIzDHWlt0VwORdnI5547WQljDWhaefcG2aS6S+e6Sh58VlXGg0QunxOw1p+Dz0e4wzOOChV49PV/NqenYcWCYMvy8/RdHSbMxPMANcvlynvvdgoKjZolGokA5gjZ8pvTQ2pxc+DXlhpur3Ubyrir5792zYrTctFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.237.86) by
 MN2PR18MB3134.namprd18.prod.outlook.com (10.255.236.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.17; Fri, 27 Dec 2019 07:52:59 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::19f2:b9fd:38db:7461]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::19f2:b9fd:38db:7461%4]) with mapi id 15.20.2581.007; Fri, 27 Dec 2019
 07:52:59 +0000
Received: from [10.156.60.99] (37.24.206.209) by
 LO2P265CA0057.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:60::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.11 via Frontend Transport; Fri, 27 Dec 2019 07:52:57 +0000
From: Jan Beulich <JBeulich@suse.com>
To: George Dunlap <george.dunlap@citrix.com>
Thread-Topic: [PATCH V6 1/4] x86/mm: Add array_index_nospec to guest provided
 index values
Thread-Index: AQHVuZnmK7OgfjFiuE29BC4XwHoq4afIBKEAgAWdmQA=
Date: Fri, 27 Dec 2019 07:52:59 +0000
Message-ID: <f392b2b8-a185-9e57-f44e-644e4b7e80cb@suse.com>
References: <20191223140409.32449-1-aisaila@bitdefender.com>
 <1e097c0e-1a99-2251-68f7-72f99f64c3bd@citrix.com>
In-Reply-To: <1e097c0e-1a99-2251-68f7-72f99f64c3bd@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0057.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::21) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:166::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: df60fd10-b3c0-4dd5-c6ed-08d78aa1ca97
x-ms-traffictypediagnostic: MN2PR18MB3134:
x-microsoft-antispam-prvs: <MN2PR18MB3134781289C15DCA12829EBFB32A0@MN2PR18MB3134.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0264FEA5C3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(376002)(136003)(346002)(366004)(39860400002)(199004)(189003)(16526019)(16576012)(316002)(6916009)(71200400001)(186003)(2906002)(81156014)(8936002)(26005)(8676002)(66946007)(31696002)(81166006)(86362001)(956004)(2616005)(66476007)(66556008)(64756008)(66446008)(54906003)(4326008)(31686004)(5660300002)(36756003)(478600001)(6486002)(53546011)(52116002)(7416002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB3134;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fa/kSqSiJ0+Y3oGqeEf5WRqzPkm8zXV1Yml1m6ma1xDY/4XMdRBKqCTCA0dHITyXxpISknMFljVex0kYohfi+tfdhkagMM3uI/GmIsOEf4qC8J6QSelJqcSvrssAMxvMl4Lp56A0EiHN4pZpdNnM3qK9wQ5uybho30oMfdNFlSe2SJSEN1R9cEnoF/KZRkXUGl11yyjefki9j2aoV5V5bOYY5+2UcMtZ1PJi5tMXyOInSWfyyyWXZQ5bc7/xOeBs4YhmA0cR4vqsKHXUrdZ20fblrai3D25mA759hXBFq3BKdqPwqfBeau2aUxF/U9nnuO5LaBtS7hN3PUOimExf886+5ggtjXXrvmMPeSxPEUDuyZoklRLbDMW2G1u5B4abo23LSIjt2E5LAoXyhqeS2ZttX07GSobjc/aHknQV+A96VqJnVDY/6MKjqj5CJCFm
x-ms-exchange-transport-forked: True
Content-ID: <B1F80B1213CF344CAE58F8AD77EED008@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: df60fd10-b3c0-4dd5-c6ed-08d78aa1ca97
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Dec 2019 07:52:59.1485 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V4ih8M50SAe949PjBA2WPak9QFL1Fr0fb2fK6d0QeIhLfA6JFa0aYGim7qCu4Kgv/HldpFxmstytW44LR2+3Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB3134
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH V6 1/4] x86/mm: Add array_index_nospec to
 guest provided index values
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Wei Liu <wl@xen.org>, Razvan COJOCARU <rcojocaru@bitdefender.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMTIuMjAxOSAxOTowOCwgR2VvcmdlIER1bmxhcCB3cm90ZToNCj4gT24gMTIvMjMvMTkg
MjowNCBQTSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6DQo+PiBUaGlzIHBhdGNoIGFp
bXMgdG8gc2FuaXRpemUgaW5kZXhlcywgcG90ZW50aWFsbHkgZ3Vlc3QgcHJvdmlkZWQNCj4+IHZh
bHVlcywgZm9yIGFsdHAybV9lcHRwW10gYW5kIGFsdHAybV9wMm1bXSBhcnJheXMuDQo+Pg0KPj4g
UmVxdWVzdGVkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+PiBTaWduZWQt
b2ZmLWJ5OiBBbGV4YW5kcnUgSXNhaWxhIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4NCj4+IC0t
LQ0KPj4gQ0M6IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4NCj4+
IENDOiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+DQo+PiBDQzogUGV0cmUg
UGlyY2FsYWJ1IDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNvbT4NCj4+IENDOiBHZW9yZ2UgRHVu
bGFwIDxnZW9yZ2UuZHVubGFwQGV1LmNpdHJpeC5jb20+DQo+PiBDQzogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPg0KPj4gQ0M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+DQo+PiBDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4NCj4+IENDOiAiUm9nZXIgUGF1
IE1vbm7DqSIgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPj4gQ0M6IEp1biBOYWthamltYSA8anVu
Lm5ha2FqaW1hQGludGVsLmNvbT4NCj4+IENDOiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVs
LmNvbT4NCj4+IC0tLQ0KPj4gQ2hhbmdlcyBzaW5jZSBWNToNCj4+IAktIEFkZCBibGFjayBsaW5l
cw0KPj4gCS0gQ2hlY2sgYWx0cDJtX2lkeCBhZ2FpbnN0IG1pbihBUlJBWV9TSVpFKGQtPmFyY2gu
YWx0cDJtX3AybSksDQo+PiBNQVhfRVBUUCkuDQo+PiAtLS0NCj4+ICB4ZW4vYXJjaC94ODYvbW0v
bWVtX2FjY2Vzcy5jIHwgMjEgKysrKysrKysrKysrLS0tLS0tLS0tDQo+PiAgeGVuL2FyY2gveDg2
L21tL3AybS5jICAgICAgICB8IDI2ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tDQo+PiAgMiBm
aWxlcyBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkNCj4+DQo+PiBk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYyBiL3hlbi9hcmNoL3g4Ni9t
bS9tZW1fYWNjZXNzLmMNCj4+IGluZGV4IDMyMGI5ZmU2MjEuLmE5NWE1MGJjYWUgMTAwNjQ0DQo+
PiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5jDQo+PiArKysgYi94ZW4vYXJjaC94
ODYvbW0vbWVtX2FjY2Vzcy5jDQo+PiBAQCAtMzY2LDExICszNjYsMTIgQEAgbG9uZyBwMm1fc2V0
X21lbV9hY2Nlc3Moc3RydWN0IGRvbWFpbiAqZCwgZ2ZuX3QgZ2ZuLCB1aW50MzJfdCBuciwNCj4+
ICAjaWZkZWYgQ09ORklHX0hWTQ0KPj4gICAgICBpZiAoIGFsdHAybV9pZHggKQ0KPj4gICAgICB7
DQo+PiAtICAgICAgICBpZiAoIGFsdHAybV9pZHggPj0gTUFYX0FMVFAyTSB8fA0KPj4gLSAgICAg
ICAgICAgICBkLT5hcmNoLmFsdHAybV9lcHRwW2FsdHAybV9pZHhdID09IG1mbl94KElOVkFMSURf
TUZOKSApDQo+PiArICAgICAgICBpZiAoIGFsdHAybV9pZHggPj0gIG1pbihBUlJBWV9TSVpFKGQt
PmFyY2guYWx0cDJtX3AybSksIE1BWF9FUFRQKSB8fA0KPj4gKyAgICAgICAgICAgICBkLT5hcmNo
LmFsdHAybV9lcHRwW2FycmF5X2luZGV4X25vc3BlYyhhbHRwMm1faWR4LCBNQVhfRVBUUCldID09
DQo+PiArICAgICAgICAgICAgIG1mbl94KElOVkFMSURfTUZOKSApDQo+PiAgICAgICAgICAgICAg
cmV0dXJuIC1FSU5WQUw7DQo+IA0KPiBJIHJlYWxpemUgSmFuIGFza2VkIGZvciBzb21ldGhpbmcg
bGlrZSB0aGlzLCBhbmQgSSdtIHNvcnJ5IEkgZGlkbid0IGhhdmUNCj4gdGltZSB0byBicmluZyBp
dCB1cCB0aGVuLCBidXQgdGhpcyBzZWVtcyByZWFsbHkgc2lsbHkuICBJZiB3ZSdyZSB3b3JyaWVk
DQo+IGFib3V0IHRoaXMsIHdvdWxkbid0IGl0IGJlIGJldHRlciB0byBoYXZlIGEgQlVJTERfQlVH
X09OKE1BWF9BTFRQMk0gPg0KPiBNQVhfRVBUUCk/DQoNCkkgd291bGRuJ3QgbWluZCB0aGlzIEJV
SUxEX0JVR19PTigpIGFwcHJvYWNoIGFzIGFuIGFsdGVybmF0aXZlLA0KYnV0IGltbyBvbmUgc3Vj
aCBpbnN0YW5jZSB3b3VsZCB0aGVuIG5lZWQgYXR0YWNoaW5nIHRvIGV2ZXJ5DQpzaXRlLg0KDQo+
IEFsc28sIHRoaXMgYml0IHdoZXJlIHdlIGNoZWNrIHRoZSBhcnJheSB2YWx1ZSBhbmQgdGhlbiBy
ZS1tYXNrIHRoZSBpbmRleA0KPiBsYXRlciBzZWVtcyByZWFsbHkgcmVkdW5kYW50Ow0KDQpCdXQg
dGhhdCdzIHRoZSBpZGVhIGJlaGluZCB0aGUgKl9ub3NwZWMoKSBhZGRpdGlvbnM6IFRoZXkgYXJl
IHRvDQpndWFyZCBhZ2FpbnN0IHNwZWN1bGF0aW9uLCBpLmUuIGJvdGggdGhlIGJvdW5kcyBjaGVj
ayBhbmQgdGhlDQptYXNraW5nIG9mIHRoZSBpbmRleCBoYXZlIHRoZWlyIChkaXN0aW5jdCkgcmVh
c29uLg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
