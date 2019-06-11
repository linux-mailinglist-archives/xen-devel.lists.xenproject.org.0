Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB733D758
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 21:58:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hamsY-0005LZ-6j; Tue, 11 Jun 2019 19:56:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SowN=UK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hamsV-0005LQ-SY
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 19:56:19 +0000
X-Inumbo-ID: f97e3dda-8c82-11e9-8980-bc764e045a96
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1e::62f])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f97e3dda-8c82-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 19:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FcFiSxFwHI6RarmXgE/zWy72XT/vq26iXX9K6/OC5fI=;
 b=H+p+Wq51TqD62RqwNx+FVNyaAEdQ/Zg29mLtWBcr4u2s3sAZZfOGE/meZCqYgNpQM75kc4K+uzS1spPkBCQLn4O5n1quK9I9pBuWoWWyxzcXeu54w9Hkhc6a8m7vfxGDkWI9DwocQ3WZlCirAi+uTrLl5jMKF6Z79NNffzOCl58=
Received: from VI1PR08MB3150.eurprd08.prod.outlook.com (52.133.15.31) by
 VI1PR08MB3568.eurprd08.prod.outlook.com (20.177.61.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.15; Tue, 11 Jun 2019 19:56:14 +0000
Received: from VI1PR08MB3150.eurprd08.prod.outlook.com
 ([fe80::9c:1daf:27e8:c496]) by VI1PR08MB3150.eurprd08.prod.outlook.com
 ([fe80::9c:1daf:27e8:c496%5]) with mapi id 15.20.1965.017; Tue, 11 Jun 2019
 19:56:14 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: Checking INVALID_MFN in mfn_add (WAS: Re: [PATCH MM-PART3 v2
 04/12] xen/arm: mm: Only increment mfn when valid in xen_pt_update)
Thread-Index: AQHVII+5a+iK1TpUVU2YDMVP8tE+jw==
Date: Tue, 11 Jun 2019 19:56:14 +0000
Message-ID: <6ad24adc-dfb7-a2da-b4c8-2fe49c61a31f@arm.com>
References: <20190514123125.29086-1-julien.grall@arm.com>
 <20190514123125.29086-5-julien.grall@arm.com>
 <alpine.DEB.2.21.1906111134410.13737@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1906111134410.13737@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0194.eurprd07.prod.outlook.com
 (2603:10a6:6:42::24) To VI1PR08MB3150.eurprd08.prod.outlook.com
 (2603:10a6:803:46::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.100.41.95]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0a872e69-db90-4f45-a3f6-08d6eea6dbfc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB3568; 
x-ms-traffictypediagnostic: VI1PR08MB3568:
nodisclaimer: True
x-microsoft-antispam-prvs: <VI1PR08MB3568F4572B40244CEB422DE080ED0@VI1PR08MB3568.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 006546F32A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(366004)(396003)(39860400002)(136003)(376002)(189003)(199004)(478600001)(6916009)(102836004)(25786009)(68736007)(71190400001)(86362001)(72206003)(71200400001)(3846002)(6116002)(6506007)(31696002)(4326008)(5660300002)(66066001)(14454004)(2906002)(386003)(53546011)(36756003)(53936002)(186003)(256004)(66476007)(8936002)(6486002)(66946007)(73956011)(76176011)(476003)(81166006)(26005)(14444005)(81156014)(8676002)(66446008)(66556008)(64756008)(7736002)(11346002)(99286004)(305945005)(31686004)(52116002)(316002)(2616005)(446003)(486006)(6512007)(44832011)(6436002)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3568;
 H:VI1PR08MB3150.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YGOEv6c6VXVZN5b05pjuPRy2/9otlLd7ggaPaORqOI0o3n1IrL3KmMCH+ttY1YfdrbhcioTWRerlRQOSeaUrld2nxBk2gDIJ6ljTFBcUrGYWXnFZh4ERtk8YY3IwvnKgEWbqYiSDdX5b9qUu93gA6njd8AwMYFy9LDqDNGqFDu58txm1JhrsXfTNVdnsEfLwVhFYzuSqT6gzPjjAbeqsg7bXzeheIozSMis7j7IfOQc/M4dobzmFEtyLYevgtVvk5ynGEG6/Fixxar4PBT6H+pfnQ98Rvv3QRuEadn8h81ohwOfYA+/2WJbhmrXpKoftyIyJf65rKvcZbPl5AtfD5OYBYat5CQe4oYkwxLpYFm8mYDsX0HtGe3HpIJ4HMSRL3kRP/+Ybm+WUO1t4445Cj5qkZgRv9wVxIPqYSdvU8/Y=
Content-ID: <3A50FEF95E68EB4B9EFC41D9A11876AF@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a872e69-db90-4f45-a3f6-08d6eea6dbfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2019 19:56:14.5900 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Julien.Grall@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3568
Subject: [Xen-devel] Checking INVALID_MFN in mfn_add (WAS: Re: [PATCH
 MM-PART3 v2 04/12] xen/arm: mm: Only increment mfn when valid in
 xen_pt_update)
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
Cc: Andrii Anisov <Andrii_Anisov@epam.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "Oleksandr_Tyshchenko@epam.com" <Oleksandr_Tyshchenko@epam.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksDQoNCk9uIDExLzA2LzIwMTkgMTk6MzcsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4g
T24gVHVlLCAxNCBNYXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4gQ3VycmVudGx5LCB0
aGUgTUZOIHdpbGwgYmUgaW5jcmVtZW50ZWQgZXZlbiBpZiBpdCBpcyBpbnZhbGlkLiBUaGlzIHdp
bGwNCj4+IHJlc3VsdCB0byBoYXZlIGEgdmFsaWQgTUZOIGFmdGVyIHRoZSBmaXJzdCBpdGVyYXRp
b24uDQo+Pg0KPj4gV2hpbGUgdGhpcyBpcyBub3QgYSBtYWpvciBwcm9ibGVtIHRvZGF5LCB0aGlz
IHdpbGwgYmUgaW4gdGhlIGZ1dHVyZSBpZg0KPj4gdGhlIGNvZGUgZXhwZWN0IGFuIGludmFsaWQg
TUZOIGF0IGV2ZXJ5IGl0ZXJhdGlvbi4NCj4+DQo+PiBTdWNoIGJlaGF2aW9yIGlzIHByZXZlbnRl
ZCBieSBhdm9pZGluZyB0byBpbmNyZW1lbnQgYW4gaW52YWxpZCBNRk4uDQo+Pg0KPj4gU2lnbmVk
LW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4NCj4+IFJldmlld2Vk
LWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPg0KPj4NCj4+IC0tLQ0K
Pj4gICAgICBDaGFuZ2VzIGluIHYyOg0KPj4gICAgICAgICAgLSBNb3ZlIHRoZSBwYXRjaCBlYXJs
aWVyIG9uIGluIHRoZSBzZXJpZXMNCj4+ICAgICAgICAgIC0gQWRkIEFuZHJpaSdzIHJldmlld2Vk
LWJ5DQo+PiAtLS0NCj4+ICAgeGVuL2FyY2gvYXJtL21tLmMgfCA1ICsrKystDQo+PiAgIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+DQo+PiBkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvYXJtL21tLmMgYi94ZW4vYXJjaC9hcm0vbW0uYw0KPj4gaW5kZXggZjk1
NmFhNjM5OS4uOWRlMmExMTUwZiAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9tbS5jDQo+
PiArKysgYi94ZW4vYXJjaC9hcm0vbW0uYw0KPj4gQEAgLTEwNTEsMTEgKzEwNTEsMTQgQEAgc3Rh
dGljIGludCB4ZW5fcHRfdXBkYXRlKGVudW0geGVubWFwX29wZXJhdGlvbiBvcCwNCj4+ICAgDQo+
PiAgICAgICBzcGluX2xvY2soJnhlbl9wdF9sb2NrKTsNCj4+ICAgDQo+PiAtICAgIGZvcig7IGFk
ZHIgPCBhZGRyX2VuZDsgYWRkciArPSBQQUdFX1NJWkUsIG1mbiA9IG1mbl9hZGQobWZuLCAxKSkN
Cj4+ICsgICAgZm9yKCA7IGFkZHIgPCBhZGRyX2VuZDsgYWRkciArPSBQQUdFX1NJWkUgKQ0KPj4g
ICAgICAgew0KPj4gICAgICAgICAgIHJjID0geGVuX3B0X3VwZGF0ZV9lbnRyeShvcCwgYWRkciwg
bWZuLCBmbGFncyk7DQo+PiAgICAgICAgICAgaWYgKCByYyApDQo+PiAgICAgICAgICAgICAgIGJy
ZWFrOw0KPj4gKw0KPj4gKyAgICAgICAgaWYgKCAhbWZuX2VxKG1mbiwgSU5WQUxJRF9NRk4pICkN
Cj4+ICsgICAgICAgICAgICBtZm4gPSBtZm5fYWRkKG1mbiwgMSk7DQo+PiAgICAgICB9DQo+IA0K
PiBUaGlzIGlzIE9LIGJ1dCBnb3QgbWUgdGhpbmtpbmc6IHNob3VsZCB3ZSBiZSB1cGRhdGluZyB0
aGUgbWZuIGluIG1mbl9hZGQNCj4gaWYgdGhlIG1mbiBpcyBJTlZBTElEPyBUaGUgbWZuX2VxKG1m
biwgSU5WQUxJRF9NRk4pIGNvdWxkIGxpdmUgaW5zaWRlDQo+IHRoZSBzdGF0aWMgaW5saW5lIG1m
bl90IG1mbl9hZGQgZnVuY3Rpb24uIFdoYXQgZG8geW91IHRoaW5rPyBJIGRvbid0DQo+IHRoaW5r
IHRoZXJlIGFyZSBhbnkgdmFsaWQgc2NlbmFyaW9zIHdoZXJlIHdlIHdhbnQgdG8gaW5jcmVtZW50
DQo+IElOVkFMSURfTUZOLi4uDQoNCk15IGZpcnN0IHRob3VnaHQgaXMgbWZuX2FkZCguLi4pIG1h
eSBiZSB1c2VkIGluIHBsYWNlIHdoZXJlIHdlIGtub3cgdGhlIA0KbWZuIGlzIG5vdCBJTlZBTElE
X01GTi4gU28gd2Ugd291bGQgYWRkIGV4dHJhIGNoZWNrIHdoZW4gaXQgbWF5IG5vdCBiZSANCm5l
Y2Vzc2FyeS4gQWx0aG91Z2gsIEkgYW0gbm90IHN1cmUgaWYgaXQgaXMgaW1wb3J0YW50Lg0KDQpJ
IGhhdmUgYWRkZWQgQW5kcmV3ICYgSmFuIHRvIGdldCBhbnkgb3BpbmlvbnMuDQoNCkNoZWVycywN
Cg0KLS0gDQpKdWxpZW4gR3JhbGwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
