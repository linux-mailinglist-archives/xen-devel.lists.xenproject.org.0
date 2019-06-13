Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BB644E51
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 23:23:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbX9i-0007dl-Vh; Thu, 13 Jun 2019 21:21:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xsGU=UM=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hbX9h-0007dg-AD
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 21:21:09 +0000
X-Inumbo-ID: 2814634c-8e21-11e9-8980-bc764e045a96
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe02::62f])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2814634c-8e21-11e9-8980-bc764e045a96;
 Thu, 13 Jun 2019 21:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nr03jOq4CD8J6YY047qFz41bcnAayFPFVDDFYL2lQLM=;
 b=ckCReANqyIhtT/J5DcqKJLRPKPGTx/9yCBkjpyvxfJjb4NjO7uQpQH2k6QRT9oELV5NJaFlUBVahA6SfuE7ZppQyA240Xxug8AvTVa0/xKE4BJDUZomwBrQziK16FgDd/9ux5kxflPsDNiBWRW7VyEGC1DYeXyrA85ewlMGv07I=
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com (52.134.93.144) by
 AM0PR08MB5233.eurprd08.prod.outlook.com (20.179.39.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Thu, 13 Jun 2019 21:21:05 +0000
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::a52e:cd0a:64fb:a6ee]) by AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::a52e:cd0a:64fb:a6ee%5]) with mapi id 15.20.1987.010; Thu, 13 Jun 2019
 21:21:05 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: [PATCH MM-PART3 v2 11/12] xen/arm: mm: Don't open-code Xen PT
 update in {set, clear}_fixmap()
Thread-Index: AQHVClEBnC3N9D2eAEWnP3d7IEmdJKaYyPWAgAC4EwCAAJxRgIAAKdIA
Date: Thu, 13 Jun 2019 21:21:05 +0000
Message-ID: <7aaa0b13-9960-7204-dcd1-78e08964fc5b@arm.com>
References: <20190514123125.29086-1-julien.grall@arm.com>
 <20190514123125.29086-12-julien.grall@arm.com>
 <alpine.DEB.2.21.1906121528260.13737@sstabellini-ThinkPad-T480s>
 <a7874b6c-08b4-28a0-cb5f-ea7f7b23e2e7@arm.com>
 <alpine.DEB.2.21.1906131140290.13737@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1906131140290.13737@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0179.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::23) To AM0PR08MB3139.eurprd08.prod.outlook.com
 (2603:10a6:208:5d::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c46ba45c-29cd-4a48-d128-08d6f0450b28
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR08MB5233; 
x-ms-traffictypediagnostic: AM0PR08MB5233:
nodisclaimer: True
x-microsoft-antispam-prvs: <AM0PR08MB523305650BDCF019DCEDFE8C80EF0@AM0PR08MB5233.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(346002)(39860400002)(396003)(136003)(366004)(189003)(199004)(11346002)(446003)(2616005)(44832011)(81166006)(81156014)(476003)(8676002)(8936002)(31686004)(486006)(6486002)(6436002)(72206003)(229853002)(14454004)(6512007)(478600001)(305945005)(7736002)(68736007)(31696002)(86362001)(6116002)(2906002)(53936002)(3846002)(5660300002)(66446008)(64756008)(66556008)(73956011)(4326008)(66476007)(6916009)(25786009)(6246003)(66066001)(66946007)(54906003)(36756003)(71190400001)(71200400001)(99286004)(186003)(102836004)(386003)(6506007)(53546011)(26005)(52116002)(76176011)(14444005)(256004)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB5233;
 H:AM0PR08MB3139.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gtZ9IRsNf1LSIp02liOgFgf0FDXbxbOlI1pCmnDowBny5OmHdIfXobcBkNrciez/J00P+/Hzsvrpf+QW2GfIR18IXxzSOlXnxVNyEPpnofa02pXCzhFwBM9PFOrp1j4tt7B3hx128uCvH9igeyB60/kJaSF/fqrXsPSiEPlZG9sQGxgXUrcGsHn7dQnYh/t2yGFQjNGWGcJIXOsSO1/whEU8eoL9F9JwuMi55FrHDkMFQIZY++4geG9Yf/GV/0uZ8spTYl+VkmXoWaLcdP+Wduk+TggvnLVdsDR2TgmMogAX0WmNwUKIPTwZf2zWhhYlh7xyl8xMTi11Eg5lI3Feu8O28K6ILMPPb1r6/L8NlXdi45/VdA6k6V1D4ybeSVoCSW/rKfGkbL5reUVbgljUQhw9aTQsDgAQYV5Wjo1jQ2k=
Content-ID: <8CF3AEB079C30A4DA031DF6C40C8E722@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c46ba45c-29cd-4a48-d128-08d6f0450b28
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2019 21:21:05.3146 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Julien.Grall@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5233
Subject: Re: [Xen-devel] [PATCH MM-PART3 v2 11/12] xen/arm: mm: Don't
 open-code Xen PT update in {set, clear}_fixmap()
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

SGkgU3RlZmFubywNCg0KT24gMTMvMDYvMjAxOSAxOTo1MSwgU3RlZmFubyBTdGFiZWxsaW5pIHdy
b3RlOg0KPiBPbiBUaHUsIDEzIEp1biAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+PiBPbiA2
LzEyLzE5IDExOjMzIFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+Pj4gT24gVHVlLCAx
NCBNYXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBJIHRoaW5rIHRoZSBiYXNpYyBwcmlu
Y2lwbGUgaXMgdGhhdCB3aXRoIEJVR19PTiBpcyAiZWFzeSIgZm9yIGEgZ3Vlc3QgdG8NCj4gYmUg
YWJsZSB0byB0cmlnZ2VyIGl0LCBwb3RlbnRpYWxseSBjYXVzaW5nIGEgRE9TLiBXaXRob3V0IHRo
ZSBCVUdfT04sDQo+IHRoZSBndWVzdCBpcyB1bmxpa2VseSB0byBiZSBhYmxlIHRvIHRyaWdnZXIg
YSBjcmFzaC4gSG93ZXZlciwgaWYgYWxsIHRoZQ0KPiBjYWxscyBoYXBwZW4gZHVyaW5nIGJvb3Qg
aW4gcmVnYXJkcyB0byBvcGVyYXRpb25zIHRoYXQgaGF2ZSBub3RoaW5nIHRvDQo+IGRvIHdpdGgg
Z3Vlc3RzIGJlaGF2aW9yLCB0aGVuIGl0IGlzIGZpbmUuDQoNClNhZGx5LCB3ZSBkb24ndCBzZWVt
IHRvIGhhdmUgdXNlZCB0aGF0IGFwcHJvYWNoIG9uIEFybSBzbyBmYXIuIFdlIGhhdmUgDQpxdWl0
ZSBhIGZldyBCVUdfT04oKSB0aGF0IGNvdWxkIGJlIHRyaWdnZXJlZCBieSB0aGUgZ3Vlc3QuIEZv
ciBpbnN0YW5jZSwgDQp3ZSB1c2VkIGl0IHRvIGNvbmZpcm0gdGhhdCB3ZSBpbnRlcnByZXRlZCBj
b3JyZWN0bHkgdGhlIHNwZWMuLi4gKHNlZSANCkdVRVNUX0JVR19PTikuIFRoZSByYXRpb25hbGUg
d2FzIHRoYXQgYSBET1MgaXMgYmV0dGVyIHRoYW4gZGF0YSBsZWFrLg0KDQpJIGhhdmUgYSBzZXJp
ZXMgdG8gdHJ5IHRvIHJlZHVjZSBzdWNoIEJVR19PTi4NCg0KPiANCj4gSSBjaGVja2VkIGFsbCB0
aGUgY2FsbCBzaXRlcyBhbmQgSSBhZ3JlZSB0aGF0IGluIHRoaXMgY2FzZSB0aGV5IGFyZSBhbGwN
Cj4gZG9uZSBkdXJpbmcgYm9vdCBvbmx5LiBTbyBpbiB0aGlzIGNhc2UgaXQgaXMgT0sgdG8gaGF2
ZSB0aGUNCj4gcGFuaWMvQlVHX09OLg0KDQpDYW4gSSBjb25zaWRlciB0aGlzIGFzIGFuIGFja2Vk
LWJ5L3Jldmlld2VkLWJ5Pw0KDQpDaGVlcnMsDQoNCi0tIA0KSnVsaWVuIEdyYWxsDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
