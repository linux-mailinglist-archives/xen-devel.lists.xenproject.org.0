Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A191037400
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 14:19:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYrJj-0003Lb-GM; Thu, 06 Jun 2019 12:16:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K3Qq=UF=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hYrJh-0003LU-4H
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 12:16:25 +0000
X-Inumbo-ID: e5b4f0ce-8854-11e9-8980-bc764e045a96
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe02::700])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e5b4f0ce-8854-11e9-8980-bc764e045a96;
 Thu, 06 Jun 2019 12:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJ93Yf06jEVwHQTXFcGknz31EbXbJELG/3KSem3twwA=;
 b=QTN3K9SZezogJcq88H+vPRJdFBnoMN2+btd+UZHJSUPFF6Fb9pMyIcpD8ENQhxoo+aUY/dfTsjUgH5IT/QvVcjI0kImkvlqMAAG8+H/Hi6SDoylc3hMaC416uRySYKCJz4JNUiVhU3kRkot1599Rr+sC+nrEJKbsez6/3+It/+s=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.106.11) by
 VI1PR0202MB3327.eurprd02.prod.outlook.com (52.134.15.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Thu, 6 Jun 2019 12:16:19 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::fdcf:4771:37b7:9830]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::fdcf:4771:37b7:9830%9]) with mapi id 15.20.1965.011; Thu, 6 Jun 2019
 12:16:19 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v1] x86/altp2m: Add xc_altp2m_get_vcpu_p2m_idx
Thread-Index: AQHVHGGlu0NbVCknh0ips2+nSWSJiQ==
Date: Thu, 6 Jun 2019 12:16:19 +0000
Message-ID: <20190606121548.2075-1-aisaila@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0202CA0021.eurprd02.prod.outlook.com
 (2603:10a6:803:14::34) To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:e3::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ed38a1b7-98d9-448e-f0ef-08d6ea78c7ce
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR0202MB3327; 
x-ms-traffictypediagnostic: VI1PR0202MB3327:|VI1PR0202MB3327:
x-microsoft-antispam-prvs: <VI1PR0202MB33276419D6F8E78E9EA47142AB170@VI1PR0202MB3327.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:580;
x-forefront-prvs: 00603B7EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(396003)(39860400002)(376002)(136003)(366004)(189003)(199004)(3846002)(186003)(53936002)(6506007)(386003)(7416002)(6116002)(2501003)(8676002)(26005)(486006)(8936002)(66066001)(102836004)(5660300002)(7736002)(478600001)(6512007)(6916009)(99286004)(14454004)(66946007)(52116002)(54906003)(107886003)(2616005)(73956011)(316002)(68736007)(6436002)(256004)(6486002)(50226002)(2906002)(36756003)(86362001)(2351001)(64756008)(305945005)(66446008)(66476007)(66556008)(25786009)(14444005)(81156014)(81166006)(1076003)(476003)(71200400001)(71190400001)(4326008)(5640700003)(70780200001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB3327;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nB8FZYN+SVi281zN+tlERxwLdZn1vH0L61CVMA0eRb743LY/HO15yub17x7GNa8kKNmeclWRlGPXyq8QpXo+4uyH1w3/O8mP6mvyeGY7GNLzQsLO/ZWbCTYZ25rVTzplIhcsU3BbqwOEPHtNgqfcYEx/x+Up1uitON2MBktuiq2sCOXJe1kp6mvaXpLoDiCWjPu84DEXvGcDeCE1m4rKW326wE01hsFjfnmwL1C7Kz2A5yrDvrsn+DwbpuX5+KUC+Zu8A4Ylkd+R73p8HNcZHCOQ4szidGSryKKz1rM9oQpQckKvLHbYh+AVgkWnHaoHYWeiOIF8P1Pz1txi5I8dRNR3LPH0TN9aHbDeVc/qiEYcx2Hhg1UmxsAB+y1cM/ImrDhd9MO+2FJV5jTqwsu3ioXF5f5yn32wFagCAS1J2c4=
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed38a1b7-98d9-448e-f0ef-08d6ea78c7ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2019 12:16:19.1889 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisaila@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB3327
Subject: [Xen-devel] [PATCH v1] x86/altp2m: Add xc_altp2m_get_vcpu_p2m_idx
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
Z2l2ZW4gdmNwLg0KDQpTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcnUgSXNhaWxhIDxhaXNhaWxhQGJp
dGRlZmVuZGVyLmNvbT4NCi0tLQ0KIHRvb2xzL2xpYnhjL2luY2x1ZGUveGVuY3RybC5oICAgfCAg
MiArKw0KIHRvb2xzL2xpYnhjL3hjX2FsdHAybS5jICAgICAgICAgfCAyNSArKysrKysrKysrKysr
KysrKysrKysrKysrDQogeGVuL2FyY2gveDg2L2h2bS9odm0uYyAgICAgICAgICB8IDI0ICsrKysr
KysrKysrKysrKysrKysrKysrKw0KIHhlbi9pbmNsdWRlL3B1YmxpYy9odm0vaHZtX29wLmggfCAx
MSArKysrKysrKysrKw0KIDQgZmlsZXMgY2hhbmdlZCwgNjIgaW5zZXJ0aW9ucygrKQ0KDQpkaWZm
IC0tZ2l0IGEvdG9vbHMvbGlieGMvaW5jbHVkZS94ZW5jdHJsLmggYi90b29scy9saWJ4Yy9pbmNs
dWRlL3hlbmN0cmwuaA0KaW5kZXggNTM4MDA3YTZkYy4uODc1MjZhZjRiNCAxMDA2NDQNCi0tLSBh
L3Rvb2xzL2xpYnhjL2luY2x1ZGUveGVuY3RybC5oDQorKysgYi90b29scy9saWJ4Yy9pbmNsdWRl
L3hlbmN0cmwuaA0KQEAgLTE5NDIsNiArMTk0Miw4IEBAIGludCB4Y19hbHRwMm1fZ2V0X21lbV9h
Y2Nlc3MoeGNfaW50ZXJmYWNlICpoYW5kbGUsIHVpbnQzMl90IGRvbWlkLA0KIGludCB4Y19hbHRw
Mm1fY2hhbmdlX2dmbih4Y19pbnRlcmZhY2UgKmhhbmRsZSwgdWludDMyX3QgZG9taWQsDQogICAg
ICAgICAgICAgICAgICAgICAgICAgIHVpbnQxNl90IHZpZXdfaWQsIHhlbl9wZm5fdCBvbGRfZ2Zu
LA0KICAgICAgICAgICAgICAgICAgICAgICAgICB4ZW5fcGZuX3QgbmV3X2dmbik7DQoraW50IHhj
X2FsdHAybV9nZXRfdmNwdV9wMm1faWR4KHhjX2ludGVyZmFjZSAqaGFuZGxlLCB1aW50MzJfdCBk
b21pZCwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgdmNwdWlkLCB1
aW50MTZfdCAqcDJtaWR4KTsNCiANCiAvKiogDQogICogTWVtIHBhZ2luZyBvcGVyYXRpb25zLg0K
ZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhjL3hjX2FsdHAybS5jIGIvdG9vbHMvbGlieGMveGNfYWx0
cDJtLmMNCmluZGV4IGE4NjUyMGMyMzIuLjA5ZGFkMDM1NWUgMTAwNjQ0DQotLS0gYS90b29scy9s
aWJ4Yy94Y19hbHRwMm0uYw0KKysrIGIvdG9vbHMvbGlieGMveGNfYWx0cDJtLmMNCkBAIC0zNTIs
MyArMzUyLDI4IEBAIGludCB4Y19hbHRwMm1fZ2V0X21lbV9hY2Nlc3MoeGNfaW50ZXJmYWNlICpo
YW5kbGUsIHVpbnQzMl90IGRvbWlkLA0KICAgICB4Y19oeXBlcmNhbGxfYnVmZmVyX2ZyZWUoaGFu
ZGxlLCBhcmcpOw0KICAgICByZXR1cm4gcmM7DQogfQ0KKw0KK2ludCB4Y19hbHRwMm1fZ2V0X3Zj
cHVfcDJtX2lkeCh4Y19pbnRlcmZhY2UgKmhhbmRsZSwgdWludDMyX3QgZG9taWQsDQorICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IHZjcHVpZCwgdWludDE2X3QgKmFsdHAy
bV9pZHgpDQorew0KKyAgICBpbnQgcmM7DQorDQorICAgIERFQ0xBUkVfSFlQRVJDQUxMX0JVRkZF
Uih4ZW5faHZtX2FsdHAybV9vcF90LCBhcmcpOw0KKw0KKyAgICBhcmcgPSB4Y19oeXBlcmNhbGxf
YnVmZmVyX2FsbG9jKGhhbmRsZSwgYXJnLCBzaXplb2YoKmFyZykpOw0KKyAgICBpZiAoIGFyZyA9
PSBOVUxMICkNCisgICAgICAgIHJldHVybiAtMTsNCisNCisgICAgYXJnLT52ZXJzaW9uID0gSFZN
T1BfQUxUUDJNX0lOVEVSRkFDRV9WRVJTSU9OOw0KKyAgICBhcmctPmNtZCA9IEhWTU9QX2FsdHAy
bV9nZXRfcDJtX2lkeDsNCisgICAgYXJnLT5kb21haW4gPSBkb21pZDsNCisgICAgYXJnLT51Lmdl
dF92Y3B1X3AybV9pZHgudmNwdV9pZCA9IHZjcHVpZDsNCisNCisgICAgcmMgPSB4ZW5jYWxsMiho
YW5kbGUtPnhjYWxsLCBfX0hZUEVSVklTT1JfaHZtX29wLCBIVk1PUF9hbHRwMm0sDQorICAgICAg
ICAgICAgICAgICBIWVBFUkNBTExfQlVGRkVSX0FTX0FSRyhhcmcpKTsNCisgICAgaWYgKCAhcmMg
KQ0KKyAgICAgICAgKmFsdHAybV9pZHggPSBhcmctPnUuZ2V0X3ZjcHVfcDJtX2lkeC5hbHRwMm1f
aWR4Ow0KKw0KKyAgICB4Y19oeXBlcmNhbGxfYnVmZmVyX2ZyZWUoaGFuZGxlLCBhcmcpOw0KKyAg
ICByZXR1cm4gcmM7DQorfQ0KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMgYi94
ZW4vYXJjaC94ODYvaHZtL2h2bS5jDQppbmRleCAwMjllZWEzYjg1Li4yOGFlMjMwODdjIDEwMDY0
NA0KLS0tIGEveGVuL2FyY2gveDg2L2h2bS9odm0uYw0KKysrIGIveGVuL2FyY2gveDg2L2h2bS9o
dm0uYw0KQEAgLTQ1MDAsNiArNDUwMCw3IEBAIHN0YXRpYyBpbnQgZG9fYWx0cDJtX29wKA0KICAg
ICBjYXNlIEhWTU9QX2FsdHAybV9zZXRfbWVtX2FjY2Vzc19tdWx0aToNCiAgICAgY2FzZSBIVk1P
UF9hbHRwMm1fZ2V0X21lbV9hY2Nlc3M6DQogICAgIGNhc2UgSFZNT1BfYWx0cDJtX2NoYW5nZV9n
Zm46DQorICAgIGNhc2UgSFZNT1BfYWx0cDJtX2dldF9wMm1faWR4Og0KICAgICAgICAgYnJlYWs7
DQogDQogICAgIGRlZmF1bHQ6DQpAQCAtNDczNSw2ICs0NzM2LDI5IEBAIHN0YXRpYyBpbnQgZG9f
YWx0cDJtX29wKA0KICAgICAgICAgICAgICAgICAgICAgX2dmbihhLnUuY2hhbmdlX2dmbi5vbGRf
Z2ZuKSwNCiAgICAgICAgICAgICAgICAgICAgIF9nZm4oYS51LmNoYW5nZV9nZm4ubmV3X2dmbikp
Ow0KICAgICAgICAgYnJlYWs7DQorDQorICAgIGNhc2UgSFZNT1BfYWx0cDJtX2dldF9wMm1faWR4
Og0KKyAgICB7DQorICAgICAgICBzdHJ1Y3QgdmNwdSAqdjsNCisNCisgICAgICAgIGlmICggYS51
LmdldF92Y3B1X3AybV9pZHgudmNwdV9pZCA+PSBkLT5tYXhfdmNwdXMgKQ0KKyAgICAgICAgew0K
KyAgICAgICAgICAgIHJjID0gLUVJTlZBTDsNCisgICAgICAgICAgICBicmVhazsNCisgICAgICAg
IH0NCisNCisgICAgICAgIGlmICggIWFsdHAybV9hY3RpdmUoZCkgKQ0KKyAgICAgICAgew0KKyAg
ICAgICAgICAgIHJjID0gLUVPUE5PVFNVUFA7DQorICAgICAgICAgICAgYnJlYWs7DQorICAgICAg
ICB9DQorDQorICAgICAgICB2ID0gZC0+dmNwdVthLnUuZ2V0X3ZjcHVfcDJtX2lkeC52Y3B1X2lk
XTsNCisgICAgICAgIGEudS5nZXRfdmNwdV9wMm1faWR4LmFsdHAybV9pZHggPSBhbHRwMm1fdmNw
dV9pZHgodik7DQorICAgICAgICByYyA9IF9fY29weV90b19ndWVzdChhcmcsICZhLCAxKSA/IC1F
RkFVTFQgOiAwOw0KKyAgICAgICAgYnJlYWs7DQorICAgIH0NCisNCiAgICAgZGVmYXVsdDoNCiAg
ICAgICAgIEFTU0VSVF9VTlJFQUNIQUJMRSgpOw0KICAgICB9DQpkaWZmIC0tZ2l0IGEveGVuL2lu
Y2x1ZGUvcHVibGljL2h2bS9odm1fb3AuaCBiL3hlbi9pbmNsdWRlL3B1YmxpYy9odm0vaHZtX29w
LmgNCmluZGV4IGM2Y2QxMmY1OTYuLjI2ZDVhNTgwZGMgMTAwNjQ0DQotLS0gYS94ZW4vaW5jbHVk
ZS9wdWJsaWMvaHZtL2h2bV9vcC5oDQorKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvaHZtL2h2bV9v
cC5oDQpAQCAtMzA0LDYgKzMwNCwxNCBAQCBzdHJ1Y3QgeGVuX2h2bV9hbHRwMm1fY2hhbmdlX2dm
biB7DQogdHlwZWRlZiBzdHJ1Y3QgeGVuX2h2bV9hbHRwMm1fY2hhbmdlX2dmbiB4ZW5faHZtX2Fs
dHAybV9jaGFuZ2VfZ2ZuX3Q7DQogREVGSU5FX1hFTl9HVUVTVF9IQU5ETEUoeGVuX2h2bV9hbHRw
Mm1fY2hhbmdlX2dmbl90KTsNCiANCitzdHJ1Y3QgeGVuX2h2bV9hbHRwMm1fZ2V0X3ZjcHVfcDJt
X2lkeCB7DQorICAgIHVpbnQzMl90IHZjcHVfaWQ7DQorICAgIHVpbnQxNl90IGFsdHAybV9pZHg7
DQorfTsNCit0eXBlZGVmIHN0cnVjdCB4ZW5faHZtX2FsdHAybV9nZXRfdmNwdV9wMm1faWR4DQor
ICAgICAgICAgICAgICAgeGVuX2h2bV9hbHRwMm1fZ2V0X3ZjcHVfcDJtX2lkeF90Ow0KK0RFRklO
RV9YRU5fR1VFU1RfSEFORExFKHhlbl9odm1fYWx0cDJtX2dldF92Y3B1X3AybV9pZHhfdCk7DQor
DQogc3RydWN0IHhlbl9odm1fYWx0cDJtX29wIHsNCiAgICAgdWludDMyX3QgdmVyc2lvbjsgICAv
KiBIVk1PUF9BTFRQMk1fSU5URVJGQUNFX1ZFUlNJT04gKi8NCiAgICAgdWludDMyX3QgY21kOw0K
QEAgLTMzMiw2ICszNDAsOCBAQCBzdHJ1Y3QgeGVuX2h2bV9hbHRwMm1fb3Agew0KICNkZWZpbmUg
SFZNT1BfYWx0cDJtX2dldF9tZW1fYWNjZXNzICAgICAgIDEyDQogLyogRGlzYWJsZSBhbHRwMm0g
ZXZlbnQgbm90aWZpY2F0aW9ucyBmb3IgYSBnaXZlbiBWQ1BVICovDQogI2RlZmluZSBIVk1PUF9h
bHRwMm1fdmNwdV9kaXNhYmxlX25vdGlmeSAgMTMNCisvKiBHZXQgdGhlIGFjdGl2ZSB2Y3B1IHAy
bSBpbmRleCAqLw0KKyNkZWZpbmUgSFZNT1BfYWx0cDJtX2dldF9wMm1faWR4ICAgICAgICAgIDE0
DQogICAgIGRvbWlkX3QgZG9tYWluOw0KICAgICB1aW50MTZfdCBwYWQxOw0KICAgICB1aW50MzJf
dCBwYWQyOw0KQEAgLTM0Nyw2ICszNTcsNyBAQCBzdHJ1Y3QgeGVuX2h2bV9hbHRwMm1fb3Agew0K
ICAgICAgICAgc3RydWN0IHhlbl9odm1fYWx0cDJtX3NldF9tZW1fYWNjZXNzX211bHRpIHNldF9t
ZW1fYWNjZXNzX211bHRpOw0KICAgICAgICAgc3RydWN0IHhlbl9odm1fYWx0cDJtX3N1cHByZXNz
X3ZlICAgICAgICAgIHN1cHByZXNzX3ZlOw0KICAgICAgICAgc3RydWN0IHhlbl9odm1fYWx0cDJt
X3ZjcHVfZGlzYWJsZV9ub3RpZnkgIGRpc2FibGVfbm90aWZ5Ow0KKyAgICAgICAgc3RydWN0IHhl
bl9odm1fYWx0cDJtX2dldF92Y3B1X3AybV9pZHggICAgIGdldF92Y3B1X3AybV9pZHg7DQogICAg
ICAgICB1aW50OF90IHBhZFs2NF07DQogICAgIH0gdTsNCiB9Ow0KLS0gDQoyLjE3LjENCg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
