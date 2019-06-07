Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0D938859
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2019 12:58:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hZCWc-00039w-8M; Fri, 07 Jun 2019 10:55:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=D3ZM=UG=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hZCWb-00039r-1c
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2019 10:55:09 +0000
X-Inumbo-ID: b4c4648c-8912-11e9-a351-a7c6f19d0e43
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.101]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b4c4648c-8912-11e9-a351-a7c6f19d0e43;
 Fri, 07 Jun 2019 10:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOmDZVbbd1VkcYWVxPCrygTt0IMNXK0G5G9i4eDp2Uo=;
 b=i8axOcsFThHJ+j9/xXOzl5GMuEd3q5XZr9IaAzgh20xR8b6mug2jisRbqZhHdR8IemcEGHMWhBj2DBI9ejHBjA2hJL7v5yd92v8kl79RV4qV8qVlyI+45iyPRTbtD+k+5c4n2oI827VmctDKVWnwLli6aq9YMcocy6mU+vqVsOw=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.106.11) by
 VI1PR0202MB2525.eurprd02.prod.outlook.com (10.173.78.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Fri, 7 Jun 2019 10:55:02 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::fdcf:4771:37b7:9830]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::fdcf:4771:37b7:9830%9]) with mapi id 15.20.1965.011; Fri, 7 Jun 2019
 10:55:02 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v3] x86/altp2m: Add a new hypercall to get the active
 altp2m index
Thread-Index: AQHVHR91gFCC2wnfik6rp2c4QxPTkg==
Date: Fri, 7 Jun 2019 10:55:02 +0000
Message-ID: <20190607105449.28167-1-aisaila@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM6P193CA0113.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::18) To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:e3::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac0992f7-c90e-477a-534d-08d6eb369779
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR0202MB2525; 
x-ms-traffictypediagnostic: VI1PR0202MB2525:|VI1PR0202MB2525:
x-microsoft-antispam-prvs: <VI1PR0202MB25250F0B0F511A9D1D5707E5AB100@VI1PR0202MB2525.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:949;
x-forefront-prvs: 0061C35778
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(346002)(39860400002)(396003)(376002)(136003)(189003)(199004)(86362001)(6512007)(71200400001)(478600001)(53936002)(5660300002)(5640700003)(6486002)(66066001)(6436002)(64756008)(73956011)(2501003)(71190400001)(6916009)(7416002)(25786009)(54906003)(3846002)(6116002)(81166006)(316002)(81156014)(8936002)(8676002)(305945005)(14454004)(7736002)(107886003)(2906002)(476003)(2616005)(50226002)(14444005)(256004)(66946007)(66476007)(386003)(6506007)(36756003)(2351001)(66446008)(68736007)(186003)(66556008)(102836004)(26005)(99286004)(4326008)(486006)(1076003)(52116002)(15583001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB2525;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7cme8tavcT/j9XuBTZ/YlerLHuYdy/KUPnkKK6M+IAp5BpOkn65xnXwMaqYA3mQcNcwI1i/egHd/5MmcXZtjhHTmtQ2DKfGicWaMRMtkR95QJMxjwI3/o+iPWOXRg5wpzRfI7uKRnDYB7G3pFDsxgx3KGCVqz7+auihAjNgV0LGQe4i4zp/IbKtShhhqQb6yDochQkwTvq/w/hCv7qr2S+wx0vUT/mw8x88szJ6KaMU5i4rOfVMGvlzXbl62iKLHd0tsgWMCW84BTZ8/pmnNcS8YfaXX/8kP9RMJb0WSsq4oywzHOunfB0MvxQIt6LkWV5yuIEMrBBEOe8CjMjARWOaDBl6H3/RLxXjQZEhnp1lSUWa/obnyZJzsrshAEA1bOh6PV1+b1+YuGV+Kuep/ojqBsKtCbdMjvO9COTiGqi4=
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac0992f7-c90e-477a-534d-08d6eb369779
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2019 10:55:02.4718 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisaila@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB2525
Subject: [Xen-devel] [PATCH v3] x86/altp2m: Add a new hypercall to get the
 active altp2m index
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

VGhlIHBhdGNoIGFkZHMgYSBuZXcgbGliIHhjIGZ1bmN0aW9uICh4Y19hbHRwMm1fZ2V0X3ZjcHVf
cDJtX2lkeCkgdGhhdA0KdXNlcyBhIG5ldyBodm1vcCAoSFZNT1BfYWx0cDJtX2dldF9wMm1faWR4
KSB0byBnZXQgdGhlIGFjdGl2ZSBhbHRwMm0NCmluZGV4IGZyb20gYSBnaXZlbiB2Y3B1Lg0KDQpT
aWduZWQtb2ZmLWJ5OiBBbGV4YW5kcnUgSXNhaWxhIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4N
Cg0KLS0tDQpDaGFuZ2VzIHNpbmNlIFYyOg0KCS0gVXBkYXRlIGNvbW1lbnQgYW5kIHRpdGxlDQoJ
LSBSZW1vdmUgcmVkdW5kYW50IG1heF92Y3B1IGNoZWNrLg0KLS0tDQogdG9vbHMvbGlieGMvaW5j
bHVkZS94ZW5jdHJsLmggICB8ICAyICsrDQogdG9vbHMvbGlieGMveGNfYWx0cDJtLmMgICAgICAg
ICB8IDI1ICsrKysrKysrKysrKysrKysrKysrKysrKysNCiB4ZW4vYXJjaC94ODYvaHZtL2h2bS5j
ICAgICAgICAgIHwgMjMgKysrKysrKysrKysrKysrKysrKysrKysNCiB4ZW4vaW5jbHVkZS9wdWJs
aWMvaHZtL2h2bV9vcC5oIHwgIDggKysrKysrKysNCiA0IGZpbGVzIGNoYW5nZWQsIDU4IGluc2Vy
dGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhjL2luY2x1ZGUveGVuY3RybC5oIGIv
dG9vbHMvbGlieGMvaW5jbHVkZS94ZW5jdHJsLmgNCmluZGV4IDUzODAwN2E2ZGMuLjg3NTI2YWY0
YjQgMTAwNjQ0DQotLS0gYS90b29scy9saWJ4Yy9pbmNsdWRlL3hlbmN0cmwuaA0KKysrIGIvdG9v
bHMvbGlieGMvaW5jbHVkZS94ZW5jdHJsLmgNCkBAIC0xOTQyLDYgKzE5NDIsOCBAQCBpbnQgeGNf
YWx0cDJtX2dldF9tZW1fYWNjZXNzKHhjX2ludGVyZmFjZSAqaGFuZGxlLCB1aW50MzJfdCBkb21p
ZCwNCiBpbnQgeGNfYWx0cDJtX2NoYW5nZV9nZm4oeGNfaW50ZXJmYWNlICpoYW5kbGUsIHVpbnQz
Ml90IGRvbWlkLA0KICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MTZfdCB2aWV3X2lkLCB4
ZW5fcGZuX3Qgb2xkX2dmbiwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgeGVuX3Bmbl90IG5l
d19nZm4pOw0KK2ludCB4Y19hbHRwMm1fZ2V0X3ZjcHVfcDJtX2lkeCh4Y19pbnRlcmZhY2UgKmhh
bmRsZSwgdWludDMyX3QgZG9taWQsDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVp
bnQzMl90IHZjcHVpZCwgdWludDE2X3QgKnAybWlkeCk7DQogDQogLyoqIA0KICAqIE1lbSBwYWdp
bmcgb3BlcmF0aW9ucy4NCmRpZmYgLS1naXQgYS90b29scy9saWJ4Yy94Y19hbHRwMm0uYyBiL3Rv
b2xzL2xpYnhjL3hjX2FsdHAybS5jDQppbmRleCBhODY1MjBjMjMyLi4wOWRhZDAzNTVlIDEwMDY0
NA0KLS0tIGEvdG9vbHMvbGlieGMveGNfYWx0cDJtLmMNCisrKyBiL3Rvb2xzL2xpYnhjL3hjX2Fs
dHAybS5jDQpAQCAtMzUyLDMgKzM1MiwyOCBAQCBpbnQgeGNfYWx0cDJtX2dldF9tZW1fYWNjZXNz
KHhjX2ludGVyZmFjZSAqaGFuZGxlLCB1aW50MzJfdCBkb21pZCwNCiAgICAgeGNfaHlwZXJjYWxs
X2J1ZmZlcl9mcmVlKGhhbmRsZSwgYXJnKTsNCiAgICAgcmV0dXJuIHJjOw0KIH0NCisNCitpbnQg
eGNfYWx0cDJtX2dldF92Y3B1X3AybV9pZHgoeGNfaW50ZXJmYWNlICpoYW5kbGUsIHVpbnQzMl90
IGRvbWlkLA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCB2Y3B1aWQs
IHVpbnQxNl90ICphbHRwMm1faWR4KQ0KK3sNCisgICAgaW50IHJjOw0KKw0KKyAgICBERUNMQVJF
X0hZUEVSQ0FMTF9CVUZGRVIoeGVuX2h2bV9hbHRwMm1fb3BfdCwgYXJnKTsNCisNCisgICAgYXJn
ID0geGNfaHlwZXJjYWxsX2J1ZmZlcl9hbGxvYyhoYW5kbGUsIGFyZywgc2l6ZW9mKCphcmcpKTsN
CisgICAgaWYgKCBhcmcgPT0gTlVMTCApDQorICAgICAgICByZXR1cm4gLTE7DQorDQorICAgIGFy
Zy0+dmVyc2lvbiA9IEhWTU9QX0FMVFAyTV9JTlRFUkZBQ0VfVkVSU0lPTjsNCisgICAgYXJnLT5j
bWQgPSBIVk1PUF9hbHRwMm1fZ2V0X3AybV9pZHg7DQorICAgIGFyZy0+ZG9tYWluID0gZG9taWQ7
DQorICAgIGFyZy0+dS5nZXRfdmNwdV9wMm1faWR4LnZjcHVfaWQgPSB2Y3B1aWQ7DQorDQorICAg
IHJjID0geGVuY2FsbDIoaGFuZGxlLT54Y2FsbCwgX19IWVBFUlZJU09SX2h2bV9vcCwgSFZNT1Bf
YWx0cDJtLA0KKyAgICAgICAgICAgICAgICAgSFlQRVJDQUxMX0JVRkZFUl9BU19BUkcoYXJnKSk7
DQorICAgIGlmICggIXJjICkNCisgICAgICAgICphbHRwMm1faWR4ID0gYXJnLT51LmdldF92Y3B1
X3AybV9pZHguYWx0cDJtX2lkeDsNCisNCisgICAgeGNfaHlwZXJjYWxsX2J1ZmZlcl9mcmVlKGhh
bmRsZSwgYXJnKTsNCisgICAgcmV0dXJuIHJjOw0KK30NCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94
ODYvaHZtL2h2bS5jIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYw0KaW5kZXggMDI5ZWVhM2I4NS4u
NGVlN2U2Y2U0NyAxMDA2NDQNCi0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMNCisrKyBiL3hl
bi9hcmNoL3g4Ni9odm0vaHZtLmMNCkBAIC00NTAwLDYgKzQ1MDAsNyBAQCBzdGF0aWMgaW50IGRv
X2FsdHAybV9vcCgNCiAgICAgY2FzZSBIVk1PUF9hbHRwMm1fc2V0X21lbV9hY2Nlc3NfbXVsdGk6
DQogICAgIGNhc2UgSFZNT1BfYWx0cDJtX2dldF9tZW1fYWNjZXNzOg0KICAgICBjYXNlIEhWTU9Q
X2FsdHAybV9jaGFuZ2VfZ2ZuOg0KKyAgICBjYXNlIEhWTU9QX2FsdHAybV9nZXRfcDJtX2lkeDoN
CiAgICAgICAgIGJyZWFrOw0KIA0KICAgICBkZWZhdWx0Og0KQEAgLTQ3MzUsNiArNDczNiwyOCBA
QCBzdGF0aWMgaW50IGRvX2FsdHAybV9vcCgNCiAgICAgICAgICAgICAgICAgICAgIF9nZm4oYS51
LmNoYW5nZV9nZm4ub2xkX2dmbiksDQogICAgICAgICAgICAgICAgICAgICBfZ2ZuKGEudS5jaGFu
Z2VfZ2ZuLm5ld19nZm4pKTsNCiAgICAgICAgIGJyZWFrOw0KKw0KKyAgICBjYXNlIEhWTU9QX2Fs
dHAybV9nZXRfcDJtX2lkeDoNCisgICAgew0KKyAgICAgICAgc3RydWN0IHZjcHUgKnY7DQorDQor
ICAgICAgICBpZiAoICFhbHRwMm1fYWN0aXZlKGQpICkNCisgICAgICAgIHsNCisgICAgICAgICAg
ICByYyA9IC1FT1BOT1RTVVBQOw0KKyAgICAgICAgICAgIGJyZWFrOw0KKyAgICAgICAgfQ0KKw0K
KyAgICAgICAgaWYgKCAodiA9IGRvbWFpbl92Y3B1KGQsIGEudS5nZXRfdmNwdV9wMm1faWR4LnZj
cHVfaWQpKSA9PSBOVUxMICkNCisgICAgICAgIHsNCisgICAgICAgICAgICByYyA9IC1FSU5WQUw7
DQorICAgICAgICAgICAgYnJlYWs7DQorICAgICAgICB9DQorDQorICAgICAgICBhLnUuZ2V0X3Zj
cHVfcDJtX2lkeC5hbHRwMm1faWR4ID0gYWx0cDJtX3ZjcHVfaWR4KHYpOw0KKyAgICAgICAgcmMg
PSBfX2NvcHlfdG9fZ3Vlc3QoYXJnLCAmYSwgMSkgPyAtRUZBVUxUIDogMDsNCisgICAgICAgIGJy
ZWFrOw0KKyAgICB9DQorDQogICAgIGRlZmF1bHQ6DQogICAgICAgICBBU1NFUlRfVU5SRUFDSEFC
TEUoKTsNCiAgICAgfQ0KZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3B1YmxpYy9odm0vaHZtX29w
LmggYi94ZW4vaW5jbHVkZS9wdWJsaWMvaHZtL2h2bV9vcC5oDQppbmRleCBjNmNkMTJmNTk2Li4z
NTNmODAzNGQ5IDEwMDY0NA0KLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2h2bS9odm1fb3AuaA0K
KysrIGIveGVuL2luY2x1ZGUvcHVibGljL2h2bS9odm1fb3AuaA0KQEAgLTMwNCw2ICszMDQsMTEg
QEAgc3RydWN0IHhlbl9odm1fYWx0cDJtX2NoYW5nZV9nZm4gew0KIHR5cGVkZWYgc3RydWN0IHhl
bl9odm1fYWx0cDJtX2NoYW5nZV9nZm4geGVuX2h2bV9hbHRwMm1fY2hhbmdlX2dmbl90Ow0KIERF
RklORV9YRU5fR1VFU1RfSEFORExFKHhlbl9odm1fYWx0cDJtX2NoYW5nZV9nZm5fdCk7DQogDQor
c3RydWN0IHhlbl9odm1fYWx0cDJtX2dldF92Y3B1X3AybV9pZHggew0KKyAgICB1aW50MzJfdCB2
Y3B1X2lkOw0KKyAgICB1aW50MTZfdCBhbHRwMm1faWR4Ow0KK307DQorDQogc3RydWN0IHhlbl9o
dm1fYWx0cDJtX29wIHsNCiAgICAgdWludDMyX3QgdmVyc2lvbjsgICAvKiBIVk1PUF9BTFRQMk1f
SU5URVJGQUNFX1ZFUlNJT04gKi8NCiAgICAgdWludDMyX3QgY21kOw0KQEAgLTMzMiw2ICszMzcs
OCBAQCBzdHJ1Y3QgeGVuX2h2bV9hbHRwMm1fb3Agew0KICNkZWZpbmUgSFZNT1BfYWx0cDJtX2dl
dF9tZW1fYWNjZXNzICAgICAgIDEyDQogLyogRGlzYWJsZSBhbHRwMm0gZXZlbnQgbm90aWZpY2F0
aW9ucyBmb3IgYSBnaXZlbiBWQ1BVICovDQogI2RlZmluZSBIVk1PUF9hbHRwMm1fdmNwdV9kaXNh
YmxlX25vdGlmeSAgMTMNCisvKiBHZXQgdGhlIGFjdGl2ZSB2Y3B1IHAybSBpbmRleCAqLw0KKyNk
ZWZpbmUgSFZNT1BfYWx0cDJtX2dldF9wMm1faWR4ICAgICAgICAgIDE0DQogICAgIGRvbWlkX3Qg
ZG9tYWluOw0KICAgICB1aW50MTZfdCBwYWQxOw0KICAgICB1aW50MzJfdCBwYWQyOw0KQEAgLTM0
Nyw2ICszNTQsNyBAQCBzdHJ1Y3QgeGVuX2h2bV9hbHRwMm1fb3Agew0KICAgICAgICAgc3RydWN0
IHhlbl9odm1fYWx0cDJtX3NldF9tZW1fYWNjZXNzX211bHRpIHNldF9tZW1fYWNjZXNzX211bHRp
Ow0KICAgICAgICAgc3RydWN0IHhlbl9odm1fYWx0cDJtX3N1cHByZXNzX3ZlICAgICAgICAgIHN1
cHByZXNzX3ZlOw0KICAgICAgICAgc3RydWN0IHhlbl9odm1fYWx0cDJtX3ZjcHVfZGlzYWJsZV9u
b3RpZnkgIGRpc2FibGVfbm90aWZ5Ow0KKyAgICAgICAgc3RydWN0IHhlbl9odm1fYWx0cDJtX2dl
dF92Y3B1X3AybV9pZHggICAgIGdldF92Y3B1X3AybV9pZHg7DQogICAgICAgICB1aW50OF90IHBh
ZFs2NF07DQogICAgIH0gdTsNCiB9Ow0KLS0gDQoyLjE3LjENCg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
