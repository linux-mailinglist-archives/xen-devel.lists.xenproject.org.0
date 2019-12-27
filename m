Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6783612B28C
	for <lists+xen-devel@lfdr.de>; Fri, 27 Dec 2019 09:06:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ikkbS-0000is-20; Fri, 27 Dec 2019 08:04:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j2i0=2R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ikkbQ-0000im-Cx
 for xen-devel@lists.xenproject.org; Fri, 27 Dec 2019 08:04:08 +0000
X-Inumbo-ID: 6f2f8944-287f-11ea-88e7-bc764e2007e4
Received: from m9a0013g.houston.softwaregrp.com (unknown [15.124.64.91])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f2f8944-287f-11ea-88e7-bc764e2007e4;
 Fri, 27 Dec 2019 08:03:59 +0000 (UTC)
Received: FROM m9a0013g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0013g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 27 Dec 2019 08:03:07 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 27 Dec 2019 08:01:33 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 27 Dec 2019 08:01:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ktnTgTfpoed5d4PNHoLYUGH+fxbyGdIxk3N4QxI7dtbGQ20PAJT3MWXNRLu+F7HQnyEXZi4hn9fQfBBcRu1DsxBKkEv6beS4Z1RDq7FAQzq3G8Jrk+/XuqSROpRuQgftjLcaNtK235tczz1mnHfHWWMT2p87gDJ0GX1LNhE6N6Jb8e3yO4pSuCLp7oQ7cb042HCqP+K8IorBjPJSDLZk8vC+t9gOVJr5KzNIp2vnOabgXm76WsrerovlWkJxjxeW7vaieHpDv9QI6Dyt5/zuVMdvbF/8TC4/2dGuLUGNTw4s9nkFhigPtSfg0vd8d/X1xiUNPAfU+Ku6XQZbOzWFXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1R+WnFAW0h3lrx9E5V9ouU0t6/ZRtrCVv2m5bYIdfx4=;
 b=oN3Euxy1v0erePCG7iQlORJ+Ih9N0xcr0/h6MJ8pbba1FDOwnTbjx26Pf3Mqs5+75uWkqSkp4lSDATdzve5cFdssqwPBZnZhZ35TRwtrpWHlcTxD8QH+VYT+u/xHi7vH+QVyl/V6ACuSItI2IScvhPi5/fIJzWRGPenAm1IZuaPn/u9OAvSS3HBxU39fsHsyjw2TR0sYsErYKaf2EL94E96z2zKbnVM9GSpiemIpDMg1YmEMdSmcHqb/fxlMzxIGQEtnAbM2Q/X4dA7HF4dVIXBAETQhn2/FVCYUo3KuGnoqtwi4+SCgLYS+FWxAjaEExuSdAE4/4joiW1g4QRU7Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.237.86) by
 MN2PR18MB2624.namprd18.prod.outlook.com (20.179.83.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.11; Fri, 27 Dec 2019 08:01:32 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::19f2:b9fd:38db:7461]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::19f2:b9fd:38db:7461%4]) with mapi id 15.20.2581.007; Fri, 27 Dec 2019
 08:01:32 +0000
Received: from [10.156.60.99] (37.24.206.209) by
 LO2P265CA0446.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:e::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.11 via Frontend Transport; Fri, 27 Dec 2019 08:01:30 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Thread-Topic: [PATCH V6 1/4] x86/mm: Add array_index_nospec to guest provided
 index values
Thread-Index: AQHVuZnmK7OgfjFiuE29BC4XwHoq4afNpKMA
Date: Fri, 27 Dec 2019 08:01:32 +0000
Message-ID: <39338776-edcd-0b5d-5c39-7d3ef7706525@suse.com>
References: <20191223140409.32449-1-aisaila@bitdefender.com>
In-Reply-To: <20191223140409.32449-1-aisaila@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0446.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::26) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:166::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a492b67a-185a-434c-ad8e-08d78aa2fc6a
x-ms-traffictypediagnostic: MN2PR18MB2624:
x-microsoft-antispam-prvs: <MN2PR18MB26247C89C152CD55EE0A30B9B32A0@MN2PR18MB2624.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0264FEA5C3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(396003)(136003)(376002)(366004)(39860400002)(189003)(199004)(66946007)(186003)(16526019)(26005)(66446008)(64756008)(66476007)(478600001)(6916009)(8936002)(52116002)(4326008)(66556008)(31686004)(31696002)(2616005)(956004)(86362001)(16576012)(316002)(5660300002)(2906002)(53546011)(54906003)(81166006)(71200400001)(6486002)(7416002)(8676002)(36756003)(81156014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB2624;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JnqqWlfaeaSZ2HfYmUiBu7NTcJX/GjJOd8QxeoW2QlJGislzlCL4G2Je9yKd9hUA/qWErefLGPWPv5tFZjNEM7Idib9GZw4fzm4tz+9TBZu8HteH0twuieSUJR27srykHdbfbHLugcxO8WMY/9LDgK7mUR4CXX/tmUgv4G3qEypZHXUjsLfb1tXUNq7X74GnyX7VONyg48+Sq+SEePmtO8MYVYLmP6irTM9wVxfPpoG2Nt5zWc1AfVZRgYmz6Zo8vobhRQhcFnmuNasZtfdCyTCuutfw7Sps2iuKTiiEzu/92RnGu7DLAjjy+rCeAw6CxU+GB/lfC9Rb8Qejc+mJLUsxxAVMwcqByQzkWaLDMcgW3uPVr7c99QNpIjONYqW4UL2fNvxLV1iJUeewAcDvNVpn+MKkgn8HGUIZLV5yfo1JpOOeHkTnkZiNP0XOcQ6l
x-ms-exchange-transport-forked: True
Content-ID: <D27EEB04D32F034A99C214FD9F13F0AA@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a492b67a-185a-434c-ad8e-08d78aa2fc6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Dec 2019 08:01:32.2228 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qDcC764bxq10+l1TDJW8bZcItoxvWKLP3r+7+P9zP+IpEHizE3a+ux6ZOgtNE+l0XYD8F7T/NfBEDa0YTboE4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB2624
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KHJlLXNlbmRpbmcsIGFzIEkgc3RpbGwgZG9uJ3Qgc2VlIHRoZSBtYWlsIGhhdmluZyBhcHBlYXJl
ZCBvbiB0aGUgbGlzdCkNCg0KT24gMjMuMTIuMjAxOSAxNTowNCwgQWxleGFuZHJ1IFN0ZWZhbiBJ
U0FJTEEgd3JvdGU6DQo+IENoYW5nZXMgc2luY2UgVjU6DQo+IAktIEFkZCBibGFjayBsaW5lcw0K
DQpMdWNraWx5IG5vIGNvbG9yIGNvbWVzIHRocm91Z2ggaW4gcGxhaW4gdGV4dCBtYWlscyA7LSkN
Cg0KPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5jDQo+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9tbS9tZW1fYWNjZXNzLmMNCj4gQEAgLTM2NiwxMSArMzY2LDEyIEBAIGxvbmcgcDJtX3Nl
dF9tZW1fYWNjZXNzKHN0cnVjdCBkb21haW4gKmQsIGdmbl90IGdmbiwgdWludDMyX3QgbnIsDQo+
ICAjaWZkZWYgQ09ORklHX0hWTQ0KPiAgICAgIGlmICggYWx0cDJtX2lkeCApDQo+ICAgICAgew0K
PiAtICAgICAgICBpZiAoIGFsdHAybV9pZHggPj0gTUFYX0FMVFAyTSB8fA0KPiAtICAgICAgICAg
ICAgIGQtPmFyY2guYWx0cDJtX2VwdHBbYWx0cDJtX2lkeF0gPT0gbWZuX3goSU5WQUxJRF9NRk4p
ICkNCj4gKyAgICAgICAgaWYgKCBhbHRwMm1faWR4ID49ICBtaW4oQVJSQVlfU0laRShkLT5hcmNo
LmFsdHAybV9wMm0pLCBNQVhfRVBUUCkgfHwNCg0KU3RyYXkgYmxhbmsgYWZ0ZXIgPj0gLg0KDQo+
ICsgICAgICAgICAgICAgZC0+YXJjaC5hbHRwMm1fZXB0cFthcnJheV9pbmRleF9ub3NwZWMoYWx0
cDJtX2lkeCwgTUFYX0VQVFApXSA9PQ0KDQpJIGFjY2VwdCB5b3UgY2FuJ3QgKGN1cnJlbnRseSkg
dXNlIGFycmF5X2FjY2Vzc19ub3NwZWMoKSBoZXJlLA0KYnV0IC4uLg0KDQo+ICsgICAgICAgICAg
ICAgbWZuX3goSU5WQUxJRF9NRk4pICkNCj4gICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0K
PiAgDQo+IC0gICAgICAgIGFwMm0gPSBkLT5hcmNoLmFsdHAybV9wMm1bYWx0cDJtX2lkeF07DQo+
ICsgICAgICAgIGFwMm0gPSBkLT5hcmNoLmFsdHAybV9wMm1bYXJyYXlfaW5kZXhfbm9zcGVjKGFs
dHAybV9pZHgsIE1BWF9BTFRQMk0pXTsNCg0KLi4uIEkgZG9uJ3Qgc2VlIHdoeSB5b3Ugc3RpbGwg
ZWZmZWN0aXZlbHkgb3Blbi1jb2RlIGl0IGhlcmUuDQoNCj4gQEAgLTQyNSwxMSArNDI2LDEyIEBA
IGxvbmcgcDJtX3NldF9tZW1fYWNjZXNzX211bHRpKHN0cnVjdCBkb21haW4gKmQsDQo+ICAjaWZk
ZWYgQ09ORklHX0hWTQ0KPiAgICAgIGlmICggYWx0cDJtX2lkeCApDQo+ICAgICAgew0KPiAtICAg
ICAgICBpZiAoIGFsdHAybV9pZHggPj0gTUFYX0FMVFAyTSB8fA0KPiAtICAgICAgICAgICAgIGQt
PmFyY2guYWx0cDJtX2VwdHBbYWx0cDJtX2lkeF0gPT0gbWZuX3goSU5WQUxJRF9NRk4pICkNCj4g
KyAgICAgICAgaWYgKCBhbHRwMm1faWR4ID49ICBtaW4oQVJSQVlfU0laRShkLT5hcmNoLmFsdHAy
bV9wMm0pLCBNQVhfRVBUUCkgfHwNCj4gKyAgICAgICAgICAgICBkLT5hcmNoLmFsdHAybV9lcHRw
W2FycmF5X2luZGV4X25vc3BlYyhhbHRwMm1faWR4LCBNQVhfRVBUUCldID09DQo+ICsgICAgICAg
ICAgICAgbWZuX3goSU5WQUxJRF9NRk4pICkNCj4gICAgICAgICAgICAgIHJldHVybiAtRUlOVkFM
Ow0KPiAgDQo+IC0gICAgICAgIGFwMm0gPSBkLT5hcmNoLmFsdHAybV9wMm1bYWx0cDJtX2lkeF07
DQo+ICsgICAgICAgIGFwMm0gPSBkLT5hcmNoLmFsdHAybV9wMm1bYXJyYXlfaW5kZXhfbm9zcGVj
KGFsdHAybV9pZHgsIE1BWF9BTFRQMk0pXTsNCg0KU2FtZSB0d28gcmVtYXJrcyBoZXJlIHRoZW4s
IGFuZCBhZ2FpbiBmdXJ0aGVyIGRvd24uDQoNCj4gLS0tIGEveGVuL2FyY2gveDg2L21tL3AybS5j
DQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYw0KPiBAQCAtMjU3Nyw2ICsyNTc3LDggQEAg
aW50IHAybV9pbml0X2FsdHAybV9ieV9pZChzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQg
aWR4KQ0KPiAgICAgIGlmICggaWR4ID49IE1BWF9BTFRQMk0gKQ0KPiAgICAgICAgICByZXR1cm4g
cmM7DQo+ICANCj4gKyAgICBpZHggPSBhcnJheV9pbmRleF9ub3NwZWMoaWR4LCBNQVhfQUxUUDJN
KTsNCj4gKw0KPiAgICAgIGFsdHAybV9saXN0X2xvY2soZCk7DQo+ICANCj4gICAgICBpZiAoIGQt
PmFyY2guYWx0cDJtX2VwdHBbaWR4XSA9PSBtZm5feChJTlZBTElEX01GTikgKQ0KDQpXaGF0IGFi
b3V0IHRoaXMgYXJyYXkgYWNjZXNzPw0KDQo+IEBAIC0yNjE4LDYgKzI2MjAsOCBAQCBpbnQgcDJt
X2Rlc3Ryb3lfYWx0cDJtX2J5X2lkKHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCBpZHgp
DQo+ICAgICAgaWYgKCAhaWR4IHx8IGlkeCA+PSBNQVhfQUxUUDJNICkNCj4gICAgICAgICAgcmV0
dXJuIHJjOw0KPiAgDQo+ICsgICAgaWR4ID0gYXJyYXlfaW5kZXhfbm9zcGVjKGlkeCwgTUFYX0FM
VFAyTSk7DQoNClRoZXJlJ3MgYSBkLT5hcmNoLmFsdHAybV9lcHRwW10gYWNjZXNzIGRvd24gZnJv
bSBoZXJlIHRvby4gSSdtIG5vdA0KZ29pbmcgdG8gbG9vayBmdXJ0aGVyLiBQbGVhc2UgZ2V0IHRo
aW5ncyBpbnRvIGNvbnNpc3RlbnQgc2hhcGUgd2hpbGUNCnlvdSBkbyB0aGlzIHRyYW5zZm9ybWF0
aW9uLg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
