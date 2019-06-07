Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BE738729
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2019 11:40:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hZBK0-0004pL-NR; Fri, 07 Jun 2019 09:38:04 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=D3ZM=UG=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hZBJy-0004pG-7R
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2019 09:38:02 +0000
X-Inumbo-ID: f0425003-8907-11e9-8980-bc764e045a96
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0e::72f])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f0425003-8907-11e9-8980-bc764e045a96;
 Fri, 07 Jun 2019 09:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Km8AtrdbY1ZidZdzjCLyzWXX908YboU+9DyeCIF4D64=;
 b=aT0bKNIIFVS9j1sMqp8NTSYcGKX3EGfPVlOV+/BkDbiEb8CoyAmWYXN9IiLdB1fjsgh4AZASK0PDwAKUXLoHTFIVEYY9qtLSbjuMwLVqdQQLQIX/PnT/YlKaFaJUxCgK8nXoPeTJ7CYXqIXihGYC6BZgFyJpnolAU8tMmXGahFw=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.106.11) by
 VI1PR0202MB3485.eurprd02.prod.outlook.com (52.134.17.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.14; Fri, 7 Jun 2019 09:37:57 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::fdcf:4771:37b7:9830]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::fdcf:4771:37b7:9830%9]) with mapi id 15.20.1965.011; Fri, 7 Jun 2019
 09:37:57 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2] x86/altp2m: Add xc_altp2m_get_vcpu_p2m_idx
Thread-Index: AQHVHRSwfhPesTKM7U69gwFU2tlnGA==
Date: Fri, 7 Jun 2019 09:37:57 +0000
Message-ID: <20190607093741.9976-1-aisaila@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4PR08CA0064.eurprd08.prod.outlook.com
 (2603:10a6:205:2::35) To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:e3::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 40e4b25e-3981-4c14-ebe9-08d6eb2bd2b4
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR0202MB3485; 
x-ms-traffictypediagnostic: VI1PR0202MB3485:|VI1PR0202MB3485:
x-microsoft-antispam-prvs: <VI1PR0202MB34856BC4248FA3CC4B730DF8AB100@VI1PR0202MB3485.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:580;
x-forefront-prvs: 0061C35778
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(346002)(366004)(376002)(396003)(136003)(189003)(199004)(50226002)(478600001)(3846002)(2616005)(6116002)(102836004)(36756003)(14444005)(386003)(7736002)(256004)(86362001)(2501003)(2906002)(5640700003)(2351001)(6436002)(1076003)(6512007)(66066001)(5660300002)(14454004)(6486002)(186003)(54906003)(8936002)(53936002)(25786009)(316002)(68736007)(107886003)(26005)(81166006)(81156014)(6506007)(6916009)(52116002)(66476007)(4326008)(73956011)(476003)(7416002)(305945005)(71190400001)(8676002)(99286004)(486006)(66446008)(66946007)(64756008)(71200400001)(66556008)(70780200001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB3485;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iNs76HAx5fkHgWGUJ3WwL0f/jKnFmfllU40ZsleoWKOqBFY8U22Ir0UbX51mYO/wZ9PJYqn/3WIeviK+0LyKreR+5uB/xul8SwCrnFgI4DMhyD+UObcfPJFmxH5r1rZ+B2BP8ReNNHszr3QA2P/z8EZrCCAyiKDa1SjxduouypypjqFBil6cODpTZTDp2ye9C2cAstVrRcJStoTHTj+GaUc8rbxVigxaWNz/XDf/H9cML/fxHhH/TLntjDMVfvj15CoEgdHQqzb+oPLMEvk8P+NlsOGks1zUclIM/OeYaMQkQcCQSCgSpmIUNVgbn09qxeJ2hfDDG/ljt/4LwROw7DaoKNQGPocBFY1WG6lVSzKZMaSb1ZqeH0xYrqn9rlQaZ77S9GFlmNAi/lnaH4plx8ZdJDRH081diVZfLZaR/jY=
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40e4b25e-3981-4c14-ebe9-08d6eb2bd2b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2019 09:37:57.5481 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisaila@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB3485
Subject: [Xen-devel] [PATCH v2] x86/altp2m: Add xc_altp2m_get_vcpu_p2m_idx
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "wl@xen.org" <wl@xen.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>, "julien.grall@arm.com" <julien.grall@arm.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBuZXcgZnVuY3Rpb24gcmV0dXJucyB0aGUgYWN0aXZlIGFsdHAybSBpbmRleCBmb3JtIGEg
Z2l2ZW4gdmNwdS4NCg0KU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBi
aXRkZWZlbmRlci5jb20+DQoNCi0tLQ0KQ2hhbmdlcyBzaW5jZSBWMzoNCgktIFVzZSBkb21haW5f
dmNwdSgpDQoJLSBEcm9wIHhlbl9odm1fYWx0cDJtX2dldF92Y3B1X3AybV9pZHhfdC4NCi0tLQ0K
IHRvb2xzL2xpYnhjL2luY2x1ZGUveGVuY3RybC5oICAgfCAgMiArKw0KIHRvb2xzL2xpYnhjL3hj
X2FsdHAybS5jICAgICAgICAgfCAyNSArKysrKysrKysrKysrKysrKysrKysrKysrDQogeGVuL2Fy
Y2gveDg2L2h2bS9odm0uYyAgICAgICAgICB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysrKw0K
IHhlbi9pbmNsdWRlL3B1YmxpYy9odm0vaHZtX29wLmggfCAgOCArKysrKysrKw0KIDQgZmlsZXMg
Y2hhbmdlZCwgNTkgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGMvaW5j
bHVkZS94ZW5jdHJsLmggYi90b29scy9saWJ4Yy9pbmNsdWRlL3hlbmN0cmwuaA0KaW5kZXggNTM4
MDA3YTZkYy4uODc1MjZhZjRiNCAxMDA2NDQNCi0tLSBhL3Rvb2xzL2xpYnhjL2luY2x1ZGUveGVu
Y3RybC5oDQorKysgYi90b29scy9saWJ4Yy9pbmNsdWRlL3hlbmN0cmwuaA0KQEAgLTE5NDIsNiAr
MTk0Miw4IEBAIGludCB4Y19hbHRwMm1fZ2V0X21lbV9hY2Nlc3MoeGNfaW50ZXJmYWNlICpoYW5k
bGUsIHVpbnQzMl90IGRvbWlkLA0KIGludCB4Y19hbHRwMm1fY2hhbmdlX2dmbih4Y19pbnRlcmZh
Y2UgKmhhbmRsZSwgdWludDMyX3QgZG9taWQsDQogICAgICAgICAgICAgICAgICAgICAgICAgIHVp
bnQxNl90IHZpZXdfaWQsIHhlbl9wZm5fdCBvbGRfZ2ZuLA0KICAgICAgICAgICAgICAgICAgICAg
ICAgICB4ZW5fcGZuX3QgbmV3X2dmbik7DQoraW50IHhjX2FsdHAybV9nZXRfdmNwdV9wMm1faWR4
KHhjX2ludGVyZmFjZSAqaGFuZGxlLCB1aW50MzJfdCBkb21pZCwNCisgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdWludDMyX3QgdmNwdWlkLCB1aW50MTZfdCAqcDJtaWR4KTsNCiANCiAv
KiogDQogICogTWVtIHBhZ2luZyBvcGVyYXRpb25zLg0KZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhj
L3hjX2FsdHAybS5jIGIvdG9vbHMvbGlieGMveGNfYWx0cDJtLmMNCmluZGV4IGE4NjUyMGMyMzIu
LjA5ZGFkMDM1NWUgMTAwNjQ0DQotLS0gYS90b29scy9saWJ4Yy94Y19hbHRwMm0uYw0KKysrIGIv
dG9vbHMvbGlieGMveGNfYWx0cDJtLmMNCkBAIC0zNTIsMyArMzUyLDI4IEBAIGludCB4Y19hbHRw
Mm1fZ2V0X21lbV9hY2Nlc3MoeGNfaW50ZXJmYWNlICpoYW5kbGUsIHVpbnQzMl90IGRvbWlkLA0K
ICAgICB4Y19oeXBlcmNhbGxfYnVmZmVyX2ZyZWUoaGFuZGxlLCBhcmcpOw0KICAgICByZXR1cm4g
cmM7DQogfQ0KKw0KK2ludCB4Y19hbHRwMm1fZ2V0X3ZjcHVfcDJtX2lkeCh4Y19pbnRlcmZhY2Ug
KmhhbmRsZSwgdWludDMyX3QgZG9taWQsDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHVpbnQzMl90IHZjcHVpZCwgdWludDE2X3QgKmFsdHAybV9pZHgpDQorew0KKyAgICBpbnQgcmM7
DQorDQorICAgIERFQ0xBUkVfSFlQRVJDQUxMX0JVRkZFUih4ZW5faHZtX2FsdHAybV9vcF90LCBh
cmcpOw0KKw0KKyAgICBhcmcgPSB4Y19oeXBlcmNhbGxfYnVmZmVyX2FsbG9jKGhhbmRsZSwgYXJn
LCBzaXplb2YoKmFyZykpOw0KKyAgICBpZiAoIGFyZyA9PSBOVUxMICkNCisgICAgICAgIHJldHVy
biAtMTsNCisNCisgICAgYXJnLT52ZXJzaW9uID0gSFZNT1BfQUxUUDJNX0lOVEVSRkFDRV9WRVJT
SU9OOw0KKyAgICBhcmctPmNtZCA9IEhWTU9QX2FsdHAybV9nZXRfcDJtX2lkeDsNCisgICAgYXJn
LT5kb21haW4gPSBkb21pZDsNCisgICAgYXJnLT51LmdldF92Y3B1X3AybV9pZHgudmNwdV9pZCA9
IHZjcHVpZDsNCisNCisgICAgcmMgPSB4ZW5jYWxsMihoYW5kbGUtPnhjYWxsLCBfX0hZUEVSVklT
T1JfaHZtX29wLCBIVk1PUF9hbHRwMm0sDQorICAgICAgICAgICAgICAgICBIWVBFUkNBTExfQlVG
RkVSX0FTX0FSRyhhcmcpKTsNCisgICAgaWYgKCAhcmMgKQ0KKyAgICAgICAgKmFsdHAybV9pZHgg
PSBhcmctPnUuZ2V0X3ZjcHVfcDJtX2lkeC5hbHRwMm1faWR4Ow0KKw0KKyAgICB4Y19oeXBlcmNh
bGxfYnVmZmVyX2ZyZWUoaGFuZGxlLCBhcmcpOw0KKyAgICByZXR1cm4gcmM7DQorfQ0KZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5jDQpp
bmRleCAwMjllZWEzYjg1Li41ZDYzMWMwNTVlIDEwMDY0NA0KLS0tIGEveGVuL2FyY2gveDg2L2h2
bS9odm0uYw0KKysrIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYw0KQEAgLTQ1MDAsNiArNDUwMCw3
IEBAIHN0YXRpYyBpbnQgZG9fYWx0cDJtX29wKA0KICAgICBjYXNlIEhWTU9QX2FsdHAybV9zZXRf
bWVtX2FjY2Vzc19tdWx0aToNCiAgICAgY2FzZSBIVk1PUF9hbHRwMm1fZ2V0X21lbV9hY2Nlc3M6
DQogICAgIGNhc2UgSFZNT1BfYWx0cDJtX2NoYW5nZV9nZm46DQorICAgIGNhc2UgSFZNT1BfYWx0
cDJtX2dldF9wMm1faWR4Og0KICAgICAgICAgYnJlYWs7DQogDQogICAgIGRlZmF1bHQ6DQpAQCAt
NDczNSw2ICs0NzM2LDI5IEBAIHN0YXRpYyBpbnQgZG9fYWx0cDJtX29wKA0KICAgICAgICAgICAg
ICAgICAgICAgX2dmbihhLnUuY2hhbmdlX2dmbi5vbGRfZ2ZuKSwNCiAgICAgICAgICAgICAgICAg
ICAgIF9nZm4oYS51LmNoYW5nZV9nZm4ubmV3X2dmbikpOw0KICAgICAgICAgYnJlYWs7DQorDQor
ICAgIGNhc2UgSFZNT1BfYWx0cDJtX2dldF9wMm1faWR4Og0KKyAgICB7DQorICAgICAgICBzdHJ1
Y3QgdmNwdSAqdjsNCisNCisgICAgICAgIGlmICggYS51LmdldF92Y3B1X3AybV9pZHgudmNwdV9p
ZCA+PSBkLT5tYXhfdmNwdXMgKQ0KKyAgICAgICAgew0KKyAgICAgICAgICAgIHJjID0gLUVJTlZB
TDsNCisgICAgICAgICAgICBicmVhazsNCisgICAgICAgIH0NCisNCisgICAgICAgIGlmICggIWFs
dHAybV9hY3RpdmUoZCkgKQ0KKyAgICAgICAgew0KKyAgICAgICAgICAgIHJjID0gLUVPUE5PVFNV
UFA7DQorICAgICAgICAgICAgYnJlYWs7DQorICAgICAgICB9DQorDQorICAgICAgICB2ID0gZG9t
YWluX3ZjcHUoZCwgYS51LmdldF92Y3B1X3AybV9pZHgudmNwdV9pZCk7DQorICAgICAgICBhLnUu
Z2V0X3ZjcHVfcDJtX2lkeC5hbHRwMm1faWR4ID0gYWx0cDJtX3ZjcHVfaWR4KHYpOw0KKyAgICAg
ICAgcmMgPSBfX2NvcHlfdG9fZ3Vlc3QoYXJnLCAmYSwgMSkgPyAtRUZBVUxUIDogMDsNCisgICAg
ICAgIGJyZWFrOw0KKyAgICB9DQorDQogICAgIGRlZmF1bHQ6DQogICAgICAgICBBU1NFUlRfVU5S
RUFDSEFCTEUoKTsNCiAgICAgfQ0KZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3B1YmxpYy9odm0v
aHZtX29wLmggYi94ZW4vaW5jbHVkZS9wdWJsaWMvaHZtL2h2bV9vcC5oDQppbmRleCBjNmNkMTJm
NTk2Li4zNTNmODAzNGQ5IDEwMDY0NA0KLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2h2bS9odm1f
b3AuaA0KKysrIGIveGVuL2luY2x1ZGUvcHVibGljL2h2bS9odm1fb3AuaA0KQEAgLTMwNCw2ICsz
MDQsMTEgQEAgc3RydWN0IHhlbl9odm1fYWx0cDJtX2NoYW5nZV9nZm4gew0KIHR5cGVkZWYgc3Ry
dWN0IHhlbl9odm1fYWx0cDJtX2NoYW5nZV9nZm4geGVuX2h2bV9hbHRwMm1fY2hhbmdlX2dmbl90
Ow0KIERFRklORV9YRU5fR1VFU1RfSEFORExFKHhlbl9odm1fYWx0cDJtX2NoYW5nZV9nZm5fdCk7
DQogDQorc3RydWN0IHhlbl9odm1fYWx0cDJtX2dldF92Y3B1X3AybV9pZHggew0KKyAgICB1aW50
MzJfdCB2Y3B1X2lkOw0KKyAgICB1aW50MTZfdCBhbHRwMm1faWR4Ow0KK307DQorDQogc3RydWN0
IHhlbl9odm1fYWx0cDJtX29wIHsNCiAgICAgdWludDMyX3QgdmVyc2lvbjsgICAvKiBIVk1PUF9B
TFRQMk1fSU5URVJGQUNFX1ZFUlNJT04gKi8NCiAgICAgdWludDMyX3QgY21kOw0KQEAgLTMzMiw2
ICszMzcsOCBAQCBzdHJ1Y3QgeGVuX2h2bV9hbHRwMm1fb3Agew0KICNkZWZpbmUgSFZNT1BfYWx0
cDJtX2dldF9tZW1fYWNjZXNzICAgICAgIDEyDQogLyogRGlzYWJsZSBhbHRwMm0gZXZlbnQgbm90
aWZpY2F0aW9ucyBmb3IgYSBnaXZlbiBWQ1BVICovDQogI2RlZmluZSBIVk1PUF9hbHRwMm1fdmNw
dV9kaXNhYmxlX25vdGlmeSAgMTMNCisvKiBHZXQgdGhlIGFjdGl2ZSB2Y3B1IHAybSBpbmRleCAq
Lw0KKyNkZWZpbmUgSFZNT1BfYWx0cDJtX2dldF9wMm1faWR4ICAgICAgICAgIDE0DQogICAgIGRv
bWlkX3QgZG9tYWluOw0KICAgICB1aW50MTZfdCBwYWQxOw0KICAgICB1aW50MzJfdCBwYWQyOw0K
QEAgLTM0Nyw2ICszNTQsNyBAQCBzdHJ1Y3QgeGVuX2h2bV9hbHRwMm1fb3Agew0KICAgICAgICAg
c3RydWN0IHhlbl9odm1fYWx0cDJtX3NldF9tZW1fYWNjZXNzX211bHRpIHNldF9tZW1fYWNjZXNz
X211bHRpOw0KICAgICAgICAgc3RydWN0IHhlbl9odm1fYWx0cDJtX3N1cHByZXNzX3ZlICAgICAg
ICAgIHN1cHByZXNzX3ZlOw0KICAgICAgICAgc3RydWN0IHhlbl9odm1fYWx0cDJtX3ZjcHVfZGlz
YWJsZV9ub3RpZnkgIGRpc2FibGVfbm90aWZ5Ow0KKyAgICAgICAgc3RydWN0IHhlbl9odm1fYWx0
cDJtX2dldF92Y3B1X3AybV9pZHggICAgIGdldF92Y3B1X3AybV9pZHg7DQogICAgICAgICB1aW50
OF90IHBhZFs2NF07DQogICAgIH0gdTsNCiB9Ow0KLS0gDQoyLjE3LjENCg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
