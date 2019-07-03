Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C818C5E79B
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 17:17:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1higyb-0008JQ-LX; Wed, 03 Jul 2019 15:15:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vZpq=VA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1higya-0008JK-4f
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 15:15:16 +0000
X-Inumbo-ID: 5b8322b8-9da5-11e9-8980-bc764e045a96
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5b8322b8-9da5-11e9-8980-bc764e045a96;
 Wed, 03 Jul 2019 15:15:14 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Wed,  3 Jul 2019 15:14:53 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 3 Jul 2019 15:09:02 +0000
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 3 Jul 2019 15:09:02 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3138.namprd18.prod.outlook.com (10.255.137.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Wed, 3 Jul 2019 15:09:00 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Wed, 3 Jul 2019
 15:09:00 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Varad Gautam <vrd@amazon.de>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] x86: irq: Do not BUG_ON multiple unbind calls for shared
 pirqs
Thread-Index: AQHVMa4o0R39ZSG7ZU25N5g8y6f5Caa4/xgA
Date: Wed, 3 Jul 2019 15:09:00 +0000
Message-ID: <de9e2860-59dd-5bd1-e0dd-27ff710ff238@suse.com>
References: <1562165173-31383-1-git-send-email-vrd@amazon.de>
In-Reply-To: <1562165173-31383-1-git-send-email-vrd@amazon.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR05CA0023.eurprd05.prod.outlook.com
 (2603:10a6:6:14::36) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 51645eb8-2e8c-48a8-a6f3-08d6ffc8610d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3138; 
x-ms-traffictypediagnostic: BY5PR18MB3138:
x-microsoft-antispam-prvs: <BY5PR18MB31387EAEA61AB25E96AA8836B3FB0@BY5PR18MB3138.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(346002)(396003)(366004)(39860400002)(136003)(199004)(189003)(478600001)(86362001)(53936002)(81166006)(256004)(71200400001)(81156014)(71190400001)(68736007)(31696002)(6512007)(8676002)(80792005)(14444005)(25786009)(4326008)(99286004)(14454004)(2906002)(2501003)(5660300002)(8936002)(6506007)(316002)(26005)(386003)(7736002)(305945005)(6486002)(66476007)(66556008)(72206003)(54906003)(53546011)(229853002)(64756008)(66446008)(76176011)(66946007)(73956011)(66066001)(6436002)(11346002)(476003)(446003)(6246003)(110136005)(6116002)(2616005)(486006)(186003)(102836004)(3846002)(36756003)(52116002)(31686004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3138;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: diBnK0BFbxJSxlhHkbgSChv5K4nfcgq+xbzOpIZeWC2AokwPVPpUZKf7kO7zeZfOag1+dC+ZhLrW7oiq0ZWdsZe6ATIEHN+J19qJ0w7BPatqJ9rp/Z6U0q9qaLkUKpAc2bJ5Qkn1xiBaSxbMzU5kclyVC7TMkLg9J6IwLg3zM4oPbESzi9gZcrmbviI6IdcoySeYdNRnUlFQYVBvG6Sn3aprquCbAU+aBbDz/KzAWdPp54zuhY+pzWeJJyTzsvWSrRqqQGsDOjHe1CI1futvdAN0L/x62IV9qw63fHngrddqzei9YUl06i07+nWOMuobpwecR9Grq9zS7L3L/yRXdAyTCdVz/ntvsfYO1Kp1fRW0Zk33bcSJdp7k/HnyGICwNJLqNZfBATm42r47QiZ1+/GtbS9UvtYP/CDK1JKSGjE=
Content-ID: <354B59220D0EF6488486CF844A150486@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 51645eb8-2e8c-48a8-a6f3-08d6ffc8610d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 15:09:00.8249 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3138
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] x86: irq: Do not BUG_ON multiple unbind
 calls for shared pirqs
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Amit Shah <aams@amazon.de>,
 Wei Liu <wl@xen.org>, David Woodhouse <dwmw@amazon.co.uk>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDcuMjAxOSAxNjo0NiwgVmFyYWQgR2F1dGFtIHdyb3RlOg0KPiBJdCBpcyBwb3NzaWJs
ZSB0byByZWNlaXZlIG11bHRpcGxlIF9fcGlycV9ndWVzdF91bmJpbmQgY2FsbHMgZm9yIHRoZSBz
YW1lIHBpcnENCj4gaWYgdGhlIHBpcnEgaGFzIG5vdCB5ZXQgYmVlbiByZW1vdmVkIGZyb20gdGhl
IGRvbWFpbidzIHBpcnFfdHJlZS4NCg0KSSdkIGFwcHJlY2lhdGUgaWYgeW91IHdvdWxkIG1ha2Ug
Y2xlYXIgdW5kZXIgd2hhdCBjb25kaXRpb25zIHRoaXMgY2FuDQpoYXBwZW4sIGFzIEknbSBnZXR0
aW5nIHRoZSBpbXByZXNzaW9uIHRoYXQgaXQncyBub3QgdGhlIEJVR19PTigpIHRoYXQNCndhbnRz
IHJlbW92aW5nIGhlcmUsIGJ1dCB0aGF0IGluc3RlYWQgc29tZSBjYWxsZXIgbWF5IG5lZWQgZml4
aW5nLCBvcg0KdGhhdCBpbnN0ZWFkIHRoZSBwaXJxIHRyZWUgcmVtb3ZhbCBuZWVkcyB0byBoYXBw
ZW4gZWFybGllci4gQWZhaWN0IHRoZQ0KY2FsbCBmcm9tIGV2dGNobl9jbG9zZSgpIGNhbid0IGhh
cHBlbiBtb3JlIHRoYW4gb25jZSwgZm9yIGV4YW1wbGUsIGFuZA0KSSB3b3VsZG4ndCBiZSBzdXJw
cmlzZWQgYXQgYWxsIGlmIG9uZSBvZiB0aGUgY2FsbGVycyBmcm9tDQp4ZW4vZHJpdmVycy9wYXNz
dGhyb3VnaC8gd2Fzbid0IHN1ZmZpY2llbnRseSBnYXRlZC4NCg0KPiBUbyBhcHBseSBzdGFibGUt
NC4xMSBvbndhcmRzLg0KDQpUaGF0J3MgYmFzZWQgb24geW91IGhhdmluZyBmb3VuZCBhIGJyb2tl
biBjb21taXQgaW4gdGhlIDQuMTEgZGV2ZWxvcG1lbnQNCndpbmRvdyAoaWYgc28sIHBsZWFzZSBu
YW1lIHRoZSBjb21taXQpLCBvciBzaW1wbHkgYmVjYXVzZSA0LjEwIGlzIGFib3V0DQp0byBnbyBv
dXQgb2YgZ2VuZXJhbCBzdXBwb3J0Pw0KDQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9pcnEuYw0KPiAr
KysgYi94ZW4vYXJjaC94ODYvaXJxLmMNCj4gQEAgLTE3MTEsNyArMTcxMSwxNSBAQCBzdGF0aWMg
aXJxX2d1ZXN0X2FjdGlvbl90ICpfX3BpcnFfZ3Vlc3RfdW5iaW5kKA0KPiAgIA0KPiAgICAgICBm
b3IgKCBpID0gMDsgKGkgPCBhY3Rpb24tPm5yX2d1ZXN0cykgJiYgKGFjdGlvbi0+Z3Vlc3RbaV0g
IT0gZCk7IGkrKyApDQo+ICAgICAgICAgICBjb250aW51ZTsNCj4gLSAgICBCVUdfT04oaSA9PSBh
Y3Rpb24tPm5yX2d1ZXN0cyk7DQo+ICsgICAgaWYgKCBpID09IGFjdGlvbi0+bnJfZ3Vlc3RzICkg
ew0KPiArICAgICAgICAvKiBJbiBjYXNlIHRoZSBwaXJxIHdhcyBzaGFyZWQsIHVuYm91bmQgZm9y
IHRoaXMgZG9tYWluIGluIGFuIGVhcmxpZXIgY2FsbCwgYnV0IHN0aWxsDQo+ICsgICAgICAgICAq
IGV4aXN0ZWQgb24gdGhlIGRvbWFpbidzIHBpcnFfdHJlZSwgd2Ugc3RpbGwgcmVhY2ggaGVyZSBp
ZiB0aGVyZSBhcmUgYW55IGxhdGVyDQo+ICsgICAgICAgICAqIHVuYmluZCBjYWxscyBvbiB0aGUg
c2FtZSBwaXJxLiBSZXR1cm4gaWYgc3VjaCBhbiB1bmJpbmQgaGFwcGVucy4gKi8NCg0KU3R5bGU6
IFRoZSBvcGVuaW5nIGJyYWNlIGlzIG1pc3BsYWNlZCwgcGx1cyB0aGUgY29tbWVudCBpcyBub3QN
CnByb3Blcmx5IGZvcm1hdHRlZCBhbmQgaGFzIG92ZXJseSBsb25nIGxpbmVzLg0KDQo+ICsgICAg
ICAgIGlmICggYWN0aW9uLT5ucl9ndWVzdHMgPiAwICYmIGFjdGlvbi0+c2hhcmVhYmxlICkNCj4g
KyAgICAgICAgICAgIHJldHVybiBOVUxMOw0KDQpXaHkgZG9lcyB0aGUgc2hhcmFibGUgYXNwZWN0
IG1hdHRlciBoZXJlPyBPciBhc2tlZCBkaWZmZXJlbnRseSwgd2h5DQpjYW4gdGhlIHNhbWUgc2l0
dWF0aW9uIChtdWx0aXBsZSB1bmJpbmQgcmVxdWVzdHMpIG5vdCBhcmlzZSBmb3INCm5vbi1zaGFy
YWJsZSBJUlFzPw0KDQpTaW1pbGFyeSwgd2h5IHdvdWxkIHRoaXMgc2FtZSBzaXR1YXRpb24gbm90
IGFyaXNlIGZvciB0aGUgbGFzdCBndWVzdA0KZ2V0dGluZyB1bmJvdW5kIGZyb20gdGhlIElSUT8g
VGhlcmUgaXMgYW4gImFjdGlvbiA9PSBOVUxMIiBjaGVjaw0KZWFybGllciBvbiwgYnV0IGlmIG11
bHRpcGxlIGNhbGxzIHdlcmUgbGVnaXRpbWF0ZSwgdGhlbiB0aGUNCmRwcmludGsoKSB0aGVyZSBz
aG91bGQgZ28gYXdheSAob3IgYmUgZ2F0ZWQgc3VpdGFibHkpIGFzIHdlbGwuDQoNCkphbg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
