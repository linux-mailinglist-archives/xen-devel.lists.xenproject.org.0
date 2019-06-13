Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5420C44E8F
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 23:36:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbXLE-0000A2-Ex; Thu, 13 Jun 2019 21:33:04 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xsGU=UM=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hbXLC-00009w-WA
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 21:33:03 +0000
X-Inumbo-ID: d19439d6-8e22-11e9-8980-bc764e045a96
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0c::610])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d19439d6-8e22-11e9-8980-bc764e045a96;
 Thu, 13 Jun 2019 21:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AcaWNCYuIBU9fK0YHWoWGTHp7kKaqa9Vza5BCLNnxwc=;
 b=GFxBBrYs+WdxrSU4d62YBTSk18R1x2eyd5vTCKRlJlm0Lp9/e3NaucErXyqKI9LY65Cp0XYG/R3+biOg40MNxKqrGFeMm5LjBU4RDDXIafj+7gsGCEeHVMNE0giPh0UPjI/0zV5qw+N951BK9QncyL7bXMs1tjNsCv82my4OCiM=
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com (52.134.93.144) by
 AM0PR08MB5060.eurprd08.prod.outlook.com (10.255.29.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Thu, 13 Jun 2019 21:32:59 +0000
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::a52e:cd0a:64fb:a6ee]) by AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::a52e:cd0a:64fb:a6ee%5]) with mapi id 15.20.1987.010; Thu, 13 Jun 2019
 21:32:59 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: [PATCH MM-PART3 v2 10/12] xen/arm: mm: Rework Xen page-tables
 walk during update
Thread-Index: AQHVClEA4HV8Hnj5wUOX2Typ2nK2n6aYzk8AgACvfICAAJD9gIAAO7iA
Date: Thu, 13 Jun 2019 21:32:59 +0000
Message-ID: <0208270b-1c4e-84a0-ce69-fd88c9e04983@arm.com>
References: <20190514123125.29086-1-julien.grall@arm.com>
 <20190514123125.29086-11-julien.grall@arm.com>
 <alpine.DEB.2.21.1906121541260.13737@sstabellini-ThinkPad-T480s>
 <7938b611-5ad7-86a0-14a2-c03d1953a81b@arm.com>
 <alpine.DEB.2.21.1906131056310.13737@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1906131056310.13737@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP265CA0006.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::18) To AM0PR08MB3139.eurprd08.prod.outlook.com
 (2603:10a6:208:5d::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aeb1d667-4d86-4a01-d0be-08d6f046b4d6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR08MB5060; 
x-ms-traffictypediagnostic: AM0PR08MB5060:
nodisclaimer: True
x-microsoft-antispam-prvs: <AM0PR08MB5060B6AECC30EE8670D879C880EF0@AM0PR08MB5060.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(346002)(376002)(136003)(39860400002)(52314003)(189003)(199004)(186003)(5660300002)(102836004)(316002)(486006)(44832011)(6506007)(6916009)(68736007)(476003)(76176011)(53546011)(8676002)(81166006)(53936002)(66446008)(81156014)(64756008)(26005)(54906003)(36756003)(66556008)(73956011)(2616005)(99286004)(66946007)(8936002)(14444005)(66476007)(386003)(446003)(256004)(11346002)(52116002)(6116002)(3846002)(6486002)(25786009)(7736002)(31686004)(6246003)(66066001)(229853002)(31696002)(86362001)(71200400001)(71190400001)(2906002)(6512007)(6436002)(478600001)(14454004)(72206003)(305945005)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB5060;
 H:AM0PR08MB3139.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kiSk958fbbC5gA4dn/Z7MhSuB8yGGEi0E3QB9c1nuMT63pr3j5l0XalRj2JeGI74HPSG/wf/TMhVOqtLykmBLc/aV8Dq6seSo7U1CqC+dB76X9MCFAF3qgcW/B5iqszhdyiPsZNRxd5rodzBg60R1gbU+YSU7x+T3RBx/nZrwjoynFE9FJdu2otoLGdqewIJuZRVn9MZAZ/SmM/9ZFZQ5SF/A4OuvsYMjj9yYT9izk4+dcDXO5GupwOzIoyFpDp+4hjBoZW2YvN/0FBfcS4ZZhdVUY0PKgpGVyz4+TGHraFeAliNzb+dWy2dOWTr+sTnRgFuM6LIEzH5nyw0n9VZcy492n4r2hkTOj7Iqq0ByX9IG4CSZQRqqpPC1Vl6EeyntjGvNslucIPkWhG9UI1XHDQ/7B4s86nYOzS/Danx9OI=
Content-ID: <F71269CC60969A4697BD16803B13D09F@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeb1d667-4d86-4a01-d0be-08d6f046b4d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2019 21:32:59.6355 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Julien.Grall@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5060
Subject: Re: [Xen-devel] [PATCH MM-PART3 v2 10/12] xen/arm: mm: Rework Xen
 page-tables walk during update
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Andrii Anisov <Andrii_Anisov@epam.com>,
 "Oleksandr_Tyshchenko@epam.com" <Oleksandr_Tyshchenko@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywNCg0KT24gMTMvMDYvMjAxOSAxODo1OSwgU3RlZmFubyBTdGFiZWxsaW5pIHdy
b3RlOg0KPiBPbiBUaHUsIDEzIEp1biAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6ID4+Pj4gKyAq
IFJldHVybiB2YWx1ZXM6DQo+Pj4+ICsgKiAgWEVOX1RBQkxFX01BUF9GQUlMRUQ6IEVpdGhlciBy
ZWFkX29ubHkgd2FzIHNldCBhbmQgdGhlIGVudHJ5DQo+Pj4+ICsgKiAgd2FzIGVtcHR5LCBvciBh
bGxvY2F0aW5nIGEgbmV3IHBhZ2UgZmFpbGVkLg0KPj4+PiArICogIFhFTl9UQUJMRV9OT1JNQUxf
UEFHRTogbmV4dCBsZXZlbCBtYXBwZWQgbm9ybWFsbHkNCj4+Pj4gKyAqICBYRU5fVEFCTEVfU1VQ
RVJfUEFHRTogVGhlIG5leHQgZW50cnkgcG9pbnRzIHRvIGEgc3VwZXJwYWdlLg0KPj4+PiArICov
DQo+Pj4+ICtzdGF0aWMgaW50IHhlbl9wdF9uZXh0X2xldmVsKGJvb2wgcmVhZF9vbmx5LCB1bnNp
Z25lZCBpbnQgbGV2ZWwsDQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxwYWVf
dCAqKnRhYmxlLCB1bnNpZ25lZCBpbnQgb2Zmc2V0KQ0KPj4+PiArew0KPj4+PiArICAgIGxwYWVf
dCAqZW50cnk7DQo+Pj4+ICsgICAgaW50IHJldDsNCj4+Pj4gKw0KPj4+PiArICAgIGVudHJ5ID0g
KnRhYmxlICsgb2Zmc2V0Ow0KPj4+PiArDQo+Pj4+ICsgICAgaWYgKCAhbHBhZV9pc192YWxpZCgq
ZW50cnkpICkNCj4+Pj4gKyAgICB7DQo+Pj4+ICsgICAgICAgIGlmICggcmVhZF9vbmx5ICkNCj4+
Pj4gKyAgICAgICAgICAgIHJldHVybiBYRU5fVEFCTEVfTUFQX0ZBSUxFRDsNCj4+Pj4gKw0KPj4+
PiArICAgICAgICByZXQgPSBjcmVhdGVfeGVuX3RhYmxlKGVudHJ5KTsNCj4+Pj4gKyAgICAgICAg
aWYgKCByZXQgKQ0KPj4+PiArICAgICAgICAgICAgcmV0dXJuIFhFTl9UQUJMRV9NQVBfRkFJTEVE
Ow0KPj4+PiArICAgIH0NCj4+Pj4gKw0KPj4+PiArICAgIEFTU0VSVChscGFlX2lzX3ZhbGlkKCpl
bnRyeSkpOw0KPj4+DQo+Pj4gV2h5IHRoZSBBU1NFUlQganVzdCBhZnRlciB0aGUgbHBhZV9pc192
YWxpZCBjaGVjayBhYm92ZT8NCj4+DQo+PiBXaGVuIHRoZSBlbnRyeSBpcyBpbnZhbGlkLCB0aGUg
bmV3IHBhZ2UgdGFibGUgd2lsbCBiZSBhbGxvY2F0ZWQgYW5kIHRoZSBlbnRyeQ0KPj4gd2lsbCBi
ZSBnZW5lcmF0ZWQuIFRoZSByZXN0IG9mIHRoZSBmdW5jdGlvbiB3aWxsIHRoZW4gYmUgZXhlY3V0
ZWQuIFRoZQ0KPj4gQVNTRVJUKCkgaGVyZSBjb25maXJtcyB0aGUgZW50cnkgd2UgaGF2ZSBpbiBo
YW5kIGlzIHZhbGlkIGluIGFsbCB0aGUgY2FzZXMuDQo+IA0KPiBTbyBpdCdzIHRvIGRvdWJsZS1j
aGVjayB0aGF0IGFmdGVyIGdldHRpbmcgaW50byB0aGUgYGlmJyBzdGF0ZW1lbnQsIHRoZQ0KPiBl
bnRyeSBiZWNvbWVzIHZhbGlkLCB3aGljaCBpcyBraW5kIG9mIHJlZHVuZGFudCBkdWUgdG8gdGhl
IHR3byBlcnJvcnMNCj4gY2hlY2sgYWJvdmUgYnV0IGl0IGlzIHN0aWxsIHZhbGlkLiBPSy4NCg0K
V2hpbGUgSSBhZ3JlZSB0aGF0IHdlIGhhdmUgMiBpZnMgYWJvdmUsIHdlIG9ubHkgY2hlY2sgInJj
IiBhbmQgbm90ICJlbnRyeSIuDQoNCkkgb3VnaHQgdG8gdGhpbmsgSSB3cm90ZSBwZXJmZWN0IGNv
ZGUsIHNhZGx5IHRoaXMgaXMgbm90IGFsd2F5cyB0aGUgY2FzZSA7KS4NCg0KSGVyZSwgaXQgd291
bGQgY2F0Y2ggYW55IG1pc3Rha2UgaWYgInJjIiBpcyB6ZXJvIGJ1dCAiZW50cnkiIGlzIHN0aWxs
IA0KaW52YWxpZC4gVGhlIHJpc2sgaGVyZSBpcyB0aGUgImVudHJ5IiB3b3VsZCBiZSBpbnZhbGlk
IGJ1dCB0aGUgbWlzdGFrZSANCm1heSBiZSBzcG90dGVkIGEgbG9uZyB0aW1lIGFmdGVyIChpLmUg
YW55IGFjY2VzcyB0byB0aGUgbWFwcGluZyB3aWxsIA0KZmF1bHQpLiBUaGlzIHdvdWxkIHBvdGVu
dGlhbGx5IGNvc3QgYSBsb3Qgb2YgZGVidWcuDQoNCkkgYWdyZWUgdGhpcyBpcyBwcm9iYWJseSBv
dmVyIGNhdXRpb3VzLCBJIGNhbid0IHJlbWVtYmVyIGlmIEkgaGl0IHRoZSANCnByb2JsZW0gYmVm
b3JlLiBBbnl3YXksIEkgYW0gaGFwcHkgdG8gZHJvcCB0aGUgQVNTRVJUKCkgaWYgeW91IHRoaW5r
IGl0IA0KaXMgdG9vIHJlZHVuZGFudC4NCg0KUmVnYXJkbGVzcyB0aGF0LCBhcmUgeW91IGhhcHB5
IHdpdGggdGhlIHJlc3Qgb2YgdGhlIHBhdGNoPyBJZiBzbywgY2FuIEkgDQpnZXQgeW91ciBhY2tl
ZC1ieS9yZXZpZXdlZC1ieT8NCg0KQ2hlZXJzLA0KDQotLSANCkp1bGllbiBHcmFsbA0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
