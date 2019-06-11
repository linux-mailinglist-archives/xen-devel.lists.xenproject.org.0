Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC923D580
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 20:30:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1halUP-0004In-Pl; Tue, 11 Jun 2019 18:27:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SowN=UK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1halUO-0004Ib-8M
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 18:27:20 +0000
X-Inumbo-ID: 8a8c5348-8c76-11e9-aa6a-afb858a7ae06
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.65]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8a8c5348-8c76-11e9-aa6a-afb858a7ae06;
 Tue, 11 Jun 2019 18:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YhRFXsMSE9E7BTkHq/ZzMr0Y6aKBaTn3JNknNDtnH64=;
 b=cuViNzuKfC00vkMfXWbBbKD+ebEMTjl3mEgNkxYgthk0sZ5e5+j3BQTnEzojs6Xo0u39f5QeIM3WYqr1xL3VBYWIEyqzB8m3MX8KS07T1Dv7KxLyZuRzm9T/V7jtlOzFvwO9NHHk5Jikr+3n0IGf/rnSZ9xc1ns7auWgaQ7ZXXc=
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com (52.134.93.144) by
 AM0PR08MB3377.eurprd08.prod.outlook.com (20.177.108.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Tue, 11 Jun 2019 18:27:16 +0000
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::a52e:cd0a:64fb:a6ee]) by AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::a52e:cd0a:64fb:a6ee%5]) with mapi id 15.20.1965.017; Tue, 11 Jun 2019
 18:27:16 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: [PATCH MM-PART3 v2 01/12] xen/arm: lpae: Add a macro to generate
 offsets from an address
Thread-Index: AQHVClD4J2dKRqQIvUm9vtHtaq6pzKaW8DcAgAABvAA=
Date: Tue, 11 Jun 2019 18:27:16 +0000
Message-ID: <2dc87e51-7a13-344c-8dc0-f62a456edb56@arm.com>
References: <20190514123125.29086-1-julien.grall@arm.com>
 <20190514123125.29086-2-julien.grall@arm.com>
 <alpine.DEB.2.21.1906111120290.13737@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1906111120290.13737@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0099.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::15) To AM0PR08MB3139.eurprd08.prod.outlook.com
 (2603:10a6:208:5d::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7fe36ef8-be3d-4756-d968-08d6ee9a6e03
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR08MB3377; 
x-ms-traffictypediagnostic: AM0PR08MB3377:
nodisclaimer: True
x-microsoft-antispam-prvs: <AM0PR08MB3377D8AF14110E3FA5DCC54680ED0@AM0PR08MB3377.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 006546F32A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(346002)(39860400002)(136003)(376002)(366004)(199004)(189003)(53546011)(54906003)(256004)(14454004)(2906002)(316002)(186003)(73956011)(6512007)(5660300002)(3846002)(72206003)(478600001)(476003)(71200400001)(229853002)(11346002)(86362001)(486006)(2616005)(446003)(31696002)(6116002)(71190400001)(8936002)(44832011)(76176011)(6246003)(102836004)(6436002)(68736007)(53936002)(66066001)(99286004)(31686004)(26005)(6506007)(52116002)(66446008)(81156014)(4326008)(66946007)(66476007)(66556008)(6916009)(8676002)(64756008)(36756003)(25786009)(305945005)(81166006)(386003)(7736002)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3377;
 H:AM0PR08MB3139.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9M9At/u7JGoPK1aMFecFsrYstDHp05ArzXcdvgkLkYdnsfu98ciQJGbZf5o0ZYG5viYTma1KgcqN8iDJuUYvBUaQhDUN9UkfkSf3E5B5hPeu08NAAHONH49M7Lb5abI9+KEyn/7Zw2BaiQw8RXzJgriCGWea+AeAMqZ6h7D7GX7u/wGX5Pz0JcRQDaU/gQjCmL+v7pw2fPjDQq8aNFO0n8PqoIr5VMoBX8j1tpAT8bK72SZq8+xbb5zMfsU9ahGrgpiXSlkSx9VH3PrHBIRmV9pJWm7O2EjQuY70foybN4i9VkJMo9SQqv4Ggtik0lL1H6tom+p9avJ66SG3Dp24tXxiYNsqRALqqSBC5s4cL2HQl09lf2KptSqRQs8GI/7RawwKp1i2g/67+JlktEGPFzzqA5v6bt101xt0O4IE6+k=
Content-ID: <CDD8FC29BC3E1B40AC53DB52FF1DA3A5@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fe36ef8-be3d-4756-d968-08d6ee9a6e03
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2019 18:27:16.1282 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Julien.Grall@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3377
Subject: Re: [Xen-devel] [PATCH MM-PART3 v2 01/12] xen/arm: lpae: Add a
 macro to generate offsets from an address
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

SGkgU3RlZmFubywNCg0KT24gMTEvMDYvMjAxOSAxOToyMSwgU3RlZmFubyBTdGFiZWxsaW5pIHdy
b3RlOg0KPiBPbiBUdWUsIDE0IE1heSAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+PiBUaGVy
ZSBhcmUgZmV3IHBsYWNlcyByZXF1aXJpbmcgdG8gZ2VuZXJhdGUgb2Zmc2V0cyBmcm9tIGFuIGFk
ZHJlc3MuDQo+PiBSYXRoZXIgdGhhbiBvcGVuLWNvZGluZyBldmVyeXdoZXJlLCB3ZSBjYW4gaW50
cm9kdWNlIGEgbWFjcm8gdG8gZG8gdGhlDQo+PiBqb2IgZm9yIHVzLg0KPj4NCj4+IFNpZ25lZC1v
ZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+DQo+PiBSZXZpZXdlZC1i
eTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4NCj4+DQo+PiAtLS0NCj4+
ICAgICAgQ2hhbmdlcyBpbiB2MjoNCj4+ICAgICAgICAgIC0gQWRkIEFuZHJpaSdzIHJldmlld2Vk
LWJ5DQo+PiAtLS0NCj4+ICAgeGVuL2FyY2gvYXJtL3AybS5jICAgICAgICAgfCAyMyArKystLS0t
LS0tLS0tLS0tLS0tLS0tLQ0KPj4gICB4ZW4vaW5jbHVkZS9hc20tYXJtL2xwYWUuaCB8ICA5ICsr
KysrKysrKw0KPj4gICAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDIwIGRlbGV0
aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vcDJtLmMgYi94ZW4vYXJj
aC9hcm0vcDJtLmMNCj4+IGluZGV4IDkyYzI0MTNmMjAuLjA2ZmEzNDJhOGYgMTAwNjQ0DQo+PiAt
LS0gYS94ZW4vYXJjaC9hcm0vcDJtLmMNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9wMm0uYw0KPj4g
QEAgLTM2OCwxMiArMzY4LDcgQEAgbWZuX3QgcDJtX2dldF9lbnRyeShzdHJ1Y3QgcDJtX2RvbWFp
biAqcDJtLCBnZm5fdCBnZm4sDQo+PiAgICAgICBwMm1fdHlwZV90IF90Ow0KPj4gICANCj4+ICAg
ICAgIC8qIENvbnZlbmllbmNlIGFsaWFzZXMgKi8NCj4gDQo+IEkgZG9uJ3Qga25vdyBpZiB5b3Ug
d2FudCB0byBrZWVwIHRoaXMgY29tbWVudCwgd2UgY291bGQgZ2V0IHJpZCBvZiBpdC4NCg0KSXQg
aXMgcHJvYmFibHkgdXNlbGVzcyBub3cuIEkgd2lsbCBkcm9wIGl0IGFsb25nIHdpdGggdGhlIG5l
d2xpbmUgb24gdG9wLg0KDQo+IEVpdGhlciB3YXk6DQo+IA0KPiBBY2tlZC1ieTogU3RlZmFubyBT
dGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KDQpUaGFuayB5b3UhDQoNCkNoZWVy
cywNCg0KLS0gDQpKdWxpZW4gR3JhbGwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
