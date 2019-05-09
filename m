Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F0019374
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 22:35:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOpic-0002np-H5; Thu, 09 May 2019 20:32:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Kt3J=TJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hOpib-0002nk-0F
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 20:32:41 +0000
X-Inumbo-ID: 95f8cc86-7299-11e9-8980-bc764e045a96
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.50]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 95f8cc86-7299-11e9-8980-bc764e045a96;
 Thu, 09 May 2019 20:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector1-arm-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MqH+r+Dt4OAd/gC98BKi32yr/+M5Fw8FuKgigahYlg0=;
 b=Oq2FhAB9qCxKiK/I1feDxGzQ5OAH+V6GQ481lWnNTezZeux3SazD29feSd+Lj72LW2svS9xbGg82TWjzgDbz3MoxAactDHR+nzAQOEERu8BS3wDuDeJnfQFvTILgBc1hYCMVssN5DFQvTvnV0f0gKEVk0ob7b40JqLq+9dc3KzY=
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com (52.134.93.144) by
 AM0PR08MB4530.eurprd08.prod.outlook.com (20.179.33.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Thu, 9 May 2019 20:32:25 +0000
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::3498:cf18:7cd6:d98b]) by AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::3498:cf18:7cd6:d98b%7]) with mapi id 15.20.1878.022; Thu, 9 May 2019
 20:32:25 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: [PATCH v2 4/7] xen/arm: page: Clarify the Xen TLBs helpers name
Thread-Index: AQHVBbleI/E+c66c/k2S05mcqExj0KZjO/yAgAAFLQA=
Date: Thu, 9 May 2019 20:32:25 +0000
Message-ID: <5fe19f3a-e17b-04b5-ff15-5579ebe789eb@arm.com>
References: <20190508161603.21964-1-julien.grall@arm.com>
 <20190508161603.21964-5-julien.grall@arm.com>
 <alpine.DEB.2.21.1905091307080.25766@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1905091307080.25766@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0074.eurprd07.prod.outlook.com
 (2603:10a6:6:2b::12) To AM0PR08MB3139.eurprd08.prod.outlook.com
 (2603:10a6:208:5d::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.100.41.95]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a8e20c5-be64-4131-78df-08d6d4bd7224
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR08MB4530; 
x-ms-traffictypediagnostic: AM0PR08MB4530:
nodisclaimer: True
x-microsoft-antispam-prvs: <AM0PR08MB4530F8718EF949F81DE580F080330@AM0PR08MB4530.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 003245E729
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(39860400002)(376002)(346002)(136003)(189003)(199004)(6486002)(66556008)(64756008)(66446008)(54906003)(66946007)(73956011)(229853002)(72206003)(14454004)(256004)(14444005)(71190400001)(71200400001)(478600001)(7736002)(99286004)(6916009)(66066001)(31696002)(186003)(36756003)(81166006)(86362001)(11346002)(2616005)(446003)(6116002)(66476007)(3846002)(486006)(8936002)(476003)(44832011)(53936002)(305945005)(6512007)(68736007)(6246003)(52116002)(6506007)(386003)(53546011)(76176011)(5660300002)(6436002)(316002)(2906002)(26005)(8676002)(81156014)(31686004)(102836004)(4326008)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB4530;
 H:AM0PR08MB3139.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5vg4MTs7xVbWayfepALPH+oBEn7cVHS1VwB7xf89evhT/MHCQDtG53nmPDamhYNjPWTUtbhY77WsTc850nY8f57V7KDU7RSO42E1ro5vvSuQX/aN8iePm5LTgd9hHryID43pMciyVDm5aNVKAALcHIeAg42sn1arQ9DbL/fLqYvDP5BW+1y1Jv/lycw4V6at7mstGemnvxPOyJJJFVV8YUKA91NzYIcKnfQ4KxslryJcZXDUTgH4iUtNGNEJdw1JNffmImvFXsZUV6kJ1oGc7qhGj4Df5/fLnkHrlNObynHmGmDn8X9uRJmF52cPIB0Bw1nOUxcbZ15g97ieOdcwvryF/cCTZHKC8GNKhiMO6QyHJuS/sm5am6KakKxHxiCQwziZvUQM5uKPZONPQ6xu+EWuP7S72Gh3UcchXjPD/J8=
Content-ID: <0FA6496710F12547A61E7F9C57C5488F@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a8e20c5-be64-4131-78df-08d6d4bd7224
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2019 20:32:25.0522 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4530
Subject: Re: [Xen-devel] [PATCH v2 4/7] xen/arm: page: Clarify the Xen TLBs
 helpers name
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

SGksDQoNCk9uIDA5LzA1LzIwMTkgMjE6MTMsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4g
T24gV2VkLCA4IE1heSAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+PiAgIC8qIFJlbGVhc2Ug
YWxsIF9faW5pdCBhbmQgX19pbml0ZGF0YSByYW5nZXMgdG8gYmUgcmV1c2VkICovDQo+PiBkaWZm
IC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9hcm0zMi9wYWdlLmggYi94ZW4vaW5jbHVkZS9h
c20tYXJtL2FybTMyL3BhZ2UuaA0KPj4gaW5kZXggNDBhNzdkYWE5ZC4uMGI0MWI5MjE0YiAxMDA2
NDQNCj4+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vYXJtMzIvcGFnZS5oDQo+PiArKysgYi94
ZW4vaW5jbHVkZS9hc20tYXJtL2FybTMyL3BhZ2UuaA0KPj4gQEAgLTYxLDEyICs2MSw4IEBAIHN0
YXRpYyBpbmxpbmUgdm9pZCBpbnZhbGlkYXRlX2ljYWNoZV9sb2NhbCh2b2lkKQ0KPj4gICAgICAg
aXNiKCk7ICAgICAgICAgICAgICAgICAgICAgIC8qIFN5bmNocm9uaXplIGZldGNoZWQgaW5zdHJ1
Y3Rpb24gc3RyZWFtLiAqLw0KPj4gICB9DQo+PiAgIA0KPj4gLS8qDQo+PiAtICogRmx1c2ggYWxs
IGh5cGVydmlzb3IgbWFwcGluZ3MgZnJvbSB0aGUgZGF0YSBUTEIgb2YgdGhlIGxvY2FsDQo+PiAt
ICogcHJvY2Vzc29yLiBUaGlzIGlzIG5vdCBzdWZmaWNpZW50IHdoZW4gY2hhbmdpbmcgY29kZSBt
YXBwaW5ncyBvcg0KPj4gLSAqIGZvciBzZWxmIG1vZGlmeWluZyBjb2RlLg0KPj4gLSAqLw0KPj4g
LXN0YXRpYyBpbmxpbmUgdm9pZCBmbHVzaF94ZW5fZGF0YV90bGJfbG9jYWwodm9pZCkNCj4+ICsv
KiBGbHVzaCBhbGwgaHlwZXJ2aXNvciBtYXBwaW5ncyBmcm9tIHRoZSBUTEIgb2YgdGhlIGxvY2Fs
IHByb2Nlc3Nvci4gKi8NCj4gDQo+IEkgcmVhbGl6ZSB0aGF0IHRoZSBzdGF0ZW1lbnQgIlRoaXMg
aXMgbm90IHN1ZmZpY2llbnQgd2hlbiBjaGFuZ2luZyBjb2RlDQo+IG1hcHBpbmdzIG9yIGZvciBz
ZWxmIG1vZGlmeWluZyBjb2RlIiBpcyBub3QgcXVpdGUgYWNjdXJhdGUsIGJ1dCBJIHdvdWxkDQo+
IHByZWZlciBub3QgdG8gcmVtb3ZlIGl0IGNvbXBsZXRlbHkuIEl0IHdvdWxkIGJlIGdvb2QgdG8g
cmV0YWluIGEgd2FybmluZw0KPiBzb21ld2hlcmUgYWJvdXQgSUMgYmVlbiBuZWVkZWQgd2hlbiBj
aGFuZ2luZyBYZW4ncyBvd24gbWFwcGluZ3MuIE1heWJlDQo+IG9uIHRvcCBvZiBpbnZhbGlkYXRl
X2ljYWNoZV9sb2NhbD8NCg0KQ2FuIHlvdSBwbGVhc2UgZXhwYW5kIGluIHdoaWNoIGNpcmN1bXN0
YW5jZSB5b3UgbmVlZCB0byBpbnZhbGlkIHRoZSANCmluc3RydWN0aW9uIGNhY2hlIHdoZW4gY2hh
bmdpbmcgWGVuJ3Mgb3duIG1hcHBpbmdzPw0KDQpDaGVlcnMsDQoNCi0tIA0KSnVsaWVuIEdyYWxs
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
