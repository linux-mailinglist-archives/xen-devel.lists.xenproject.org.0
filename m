Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 207DB1296D4
	for <lists+xen-devel@lfdr.de>; Mon, 23 Dec 2019 15:08:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijOK6-0008Uj-DE; Mon, 23 Dec 2019 14:04:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R5un=2N=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1ijOK4-0008Ue-4M
 for xen-devel@lists.xenproject.org; Mon, 23 Dec 2019 14:04:36 +0000
X-Inumbo-ID: 25902e82-258d-11ea-96db-12813bfff9fa
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.99]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 25902e82-258d-11ea-96db-12813bfff9fa;
 Mon, 23 Dec 2019 14:04:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NfoCuACDTIwgeSNph6Xg8TVtEcmqIv9QyvbDJPDkYmId95E5X7ctHYUpnb/lONmC0IC7xZZYqolcomGeOSqXPnFYX1NhFypDRQIniQL8teIqKcEGNcRzh8r1lqekOHzRvbCabZ8T5SaXWS7//TiQ+kf3cD4Vi5b/k/ctthh17bZa7UzLlIQ8+ZPoQ/OpqI7xV7eaAYtuLxF9K2y0AQgQ7XA0IPEBc73i2q7D4jq84BP2z1ipueuvz5JQfH79Xt66jRuX0oaWg20Q9mBwDntZ0/Ki7nmmhH6NP3QWX6E1D2ibXv4n4V15Wzbz1krX226ngzN276HJSjJ/qjN6TlP/Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VvIfy5a/YfPlkUI9jOTuVnKpUn1kMUymiCTxMS6hw1g=;
 b=Hr6CkJmP2qlDUepa82atRpbMUGTVRcKQtHe1aE2PE6958Nc7o/f6DiXbLlCLDVp/bwv0H8EFkKNhp51ClKNL2GAbFisxzF+G3QTwJ6qBgchEsNtAOMgEaPINHXLRGhcPFga/iWsOvqQgjoWhT9N2tjiV1iLrbdVgdozRD4sEN7mOX7NnrEU2RkPJisIr3vW3cDLGJpDrIUfbRrLR/nLOD3bSAwn+wnlpCJxBkQ+cgd1Ff//W3+va96HPqXnqFGFiSIG54j93e+o4PGy3v49NDxb33ktPvI61gC4rbbBGaB3IOrmL4b3w00Qb1TBqZxyJPcOViNZMwU7PwODCv5FU3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VvIfy5a/YfPlkUI9jOTuVnKpUn1kMUymiCTxMS6hw1g=;
 b=R2nRh41vYlkI0AmwlWMgYlFZiftegf1biSZaSZmjuESyNJMlGfHaAAZpl0WT/nt6wCaD8nDWMPkst1Wq/1Ml/3rsAHgAtLtjSKtEoy3SB59JDppt1vKG2T6zDZ6/1i9zOHYIcLzwoVZpzTMRL/E1qfcJPnB7FIP2sEJnkCqYzW4=
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com (10.255.30.78) by
 AM0PR02MB4964.eurprd02.prod.outlook.com (20.178.22.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.20; Mon, 23 Dec 2019 14:04:32 +0000
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d]) by AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d%4]) with mapi id 15.20.2559.017; Mon, 23 Dec 2019
 14:04:32 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH V6 1/4] x86/mm: Add array_index_nospec to guest provided
 index values
Thread-Index: AQHVuZnmK7OgfjFiuE29BC4XwHoq4Q==
Date: Mon, 23 Dec 2019 14:04:31 +0000
Message-ID: <20191223140409.32449-1-aisaila@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM3PR05CA0156.eurprd05.prod.outlook.com
 (2603:10a6:207:3::34) To AM0PR02MB5553.eurprd02.prod.outlook.com
 (2603:10a6:208:160::14)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4cb410f1-6f6a-4f8b-e6ab-08d787b1087b
x-ms-traffictypediagnostic: AM0PR02MB4964:|AM0PR02MB4964:|AM0PR02MB4964:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR02MB49645A2CEE564EE83A6D33CCAB2E0@AM0PR02MB4964.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1388;
x-forefront-prvs: 0260457E99
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(396003)(136003)(376002)(39860400002)(346002)(199004)(189003)(66446008)(186003)(66476007)(6506007)(26005)(64756008)(2906002)(1076003)(478600001)(2616005)(52116002)(66946007)(66556008)(5660300002)(316002)(6916009)(8936002)(4326008)(81156014)(54906003)(81166006)(6512007)(71200400001)(36756003)(86362001)(8676002)(6486002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB4964;
 H:AM0PR02MB5553.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9XF7NQKUKnMzQaUeAe96jjv5A4qRMFj0xynqlMBPgEDEz5TEL/r2/WXe9gmn0CjKrDVJMuqUaxCpUFL7EEewwdIZq7RJZCALbmntJ+F5Hm0RNB9gJJk3+J0mZLe5kd1d1J3f8lzhI+xBJloqfdWwrSQlbq2eIYz3Rxv4rIBWTUE+RV4EoPyqps+ba+0YmTyEutAsS1pTYdV5je84uM+w5RDZGlJ+wYkjkir7VqdL5EOthkB0qp7hxRBRPb1dqkHqsdm8kiEGMW2eO0AL/Rd2ItIHw6scmFFjtlKgy0bfMrrkNGv+87EQ0VXMEMVC3keepaNCOA8a49LrY6Rk+N/tRBxW8YWdvGKbaVooJJr+8OsCHFcigniy1532gQd+cLGhCHVW1Oz7S6giJkPsN09NLO4gSLkSA92J8lUD+0XHKpI5mQcS9k2J9HKpi6QSUc/k
Content-ID: <1481ED27BA624F4693A04423057E5698@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cb410f1-6f6a-4f8b-e6ab-08d787b1087b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2019 14:04:32.3080 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bC+Lcp+4WLirVJHu9HYdhq0bG8TVnfU4t3SKGvRjUGZscHkU8U01EmQcrd6SmLu6CHQAF2KwmE8BFU75AcfRmsonDsxDxiNeyHph/bo+Fy4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB4964
Subject: [Xen-devel] [PATCH V6 1/4] x86/mm: Add array_index_nospec to guest
 provided index values
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBwYXRjaCBhaW1zIHRvIHNhbml0aXplIGluZGV4ZXMsIHBvdGVudGlhbGx5IGd1ZXN0IHBy
b3ZpZGVkDQp2YWx1ZXMsIGZvciBhbHRwMm1fZXB0cFtdIGFuZCBhbHRwMm1fcDJtW10gYXJyYXlz
Lg0KDQpSZXF1ZXN0ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NClNpZ25l
ZC1vZmYtYnk6IEFsZXhhbmRydSBJc2FpbGEgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPg0KLS0t
DQpDQzogUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPg0KQ0M6IFRh
bWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4NCkNDOiBQZXRyZSBQaXJjYWxhYnUg
PHBwaXJjYWxhYnVAYml0ZGVmZW5kZXIuY29tPg0KQ0M6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5k
dW5sYXBAZXUuY2l0cml4LmNvbT4NCkNDOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
DQpDQzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCkNDOiBXZWkg
TGl1IDx3bEB4ZW4ub3JnPg0KQ0M6ICJSb2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJp
eC5jb20+DQpDQzogSnVuIE5ha2FqaW1hIDxqdW4ubmFrYWppbWFAaW50ZWwuY29tPg0KQ0M6IEtl
dmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0KLS0tDQpDaGFuZ2VzIHNpbmNlIFY1Og0K
CS0gQWRkIGJsYWNrIGxpbmVzDQoJLSBDaGVjayBhbHRwMm1faWR4IGFnYWluc3QgbWluKEFSUkFZ
X1NJWkUoZC0+YXJjaC5hbHRwMm1fcDJtKSwNCk1BWF9FUFRQKS4NCi0tLQ0KIHhlbi9hcmNoL3g4
Ni9tbS9tZW1fYWNjZXNzLmMgfCAyMSArKysrKysrKysrKystLS0tLS0tLS0NCiB4ZW4vYXJjaC94
ODYvbW0vcDJtLmMgICAgICAgIHwgMjYgKysrKysrKysrKysrKysrKysrLS0tLS0tLS0NCiAyIGZp
bGVzIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0t
Z2l0IGEveGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYyBiL3hlbi9hcmNoL3g4Ni9tbS9tZW1f
YWNjZXNzLmMNCmluZGV4IDMyMGI5ZmU2MjEuLmE5NWE1MGJjYWUgMTAwNjQ0DQotLS0gYS94ZW4v
YXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5jDQorKysgYi94ZW4vYXJjaC94ODYvbW0vbWVtX2FjY2Vz
cy5jDQpAQCAtMzY2LDExICszNjYsMTIgQEAgbG9uZyBwMm1fc2V0X21lbV9hY2Nlc3Moc3RydWN0
IGRvbWFpbiAqZCwgZ2ZuX3QgZ2ZuLCB1aW50MzJfdCBuciwNCiAjaWZkZWYgQ09ORklHX0hWTQ0K
ICAgICBpZiAoIGFsdHAybV9pZHggKQ0KICAgICB7DQotICAgICAgICBpZiAoIGFsdHAybV9pZHgg
Pj0gTUFYX0FMVFAyTSB8fA0KLSAgICAgICAgICAgICBkLT5hcmNoLmFsdHAybV9lcHRwW2FsdHAy
bV9pZHhdID09IG1mbl94KElOVkFMSURfTUZOKSApDQorICAgICAgICBpZiAoIGFsdHAybV9pZHgg
Pj0gIG1pbihBUlJBWV9TSVpFKGQtPmFyY2guYWx0cDJtX3AybSksIE1BWF9FUFRQKSB8fA0KKyAg
ICAgICAgICAgICBkLT5hcmNoLmFsdHAybV9lcHRwW2FycmF5X2luZGV4X25vc3BlYyhhbHRwMm1f
aWR4LCBNQVhfRVBUUCldID09DQorICAgICAgICAgICAgIG1mbl94KElOVkFMSURfTUZOKSApDQog
ICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQogDQotICAgICAgICBhcDJtID0gZC0+YXJjaC5h
bHRwMm1fcDJtW2FsdHAybV9pZHhdOw0KKyAgICAgICAgYXAybSA9IGQtPmFyY2guYWx0cDJtX3Ay
bVthcnJheV9pbmRleF9ub3NwZWMoYWx0cDJtX2lkeCwgTUFYX0FMVFAyTSldOw0KICAgICB9DQog
I2Vsc2UNCiAgICAgQVNTRVJUKCFhbHRwMm1faWR4KTsNCkBAIC00MjUsMTEgKzQyNiwxMiBAQCBs
b25nIHAybV9zZXRfbWVtX2FjY2Vzc19tdWx0aShzdHJ1Y3QgZG9tYWluICpkLA0KICNpZmRlZiBD
T05GSUdfSFZNDQogICAgIGlmICggYWx0cDJtX2lkeCApDQogICAgIHsNCi0gICAgICAgIGlmICgg
YWx0cDJtX2lkeCA+PSBNQVhfQUxUUDJNIHx8DQotICAgICAgICAgICAgIGQtPmFyY2guYWx0cDJt
X2VwdHBbYWx0cDJtX2lkeF0gPT0gbWZuX3goSU5WQUxJRF9NRk4pICkNCisgICAgICAgIGlmICgg
YWx0cDJtX2lkeCA+PSAgbWluKEFSUkFZX1NJWkUoZC0+YXJjaC5hbHRwMm1fcDJtKSwgTUFYX0VQ
VFApIHx8DQorICAgICAgICAgICAgIGQtPmFyY2guYWx0cDJtX2VwdHBbYXJyYXlfaW5kZXhfbm9z
cGVjKGFsdHAybV9pZHgsIE1BWF9FUFRQKV0gPT0NCisgICAgICAgICAgICAgbWZuX3goSU5WQUxJ
RF9NRk4pICkNCiAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCiANCi0gICAgICAgIGFwMm0g
PSBkLT5hcmNoLmFsdHAybV9wMm1bYWx0cDJtX2lkeF07DQorICAgICAgICBhcDJtID0gZC0+YXJj
aC5hbHRwMm1fcDJtW2FycmF5X2luZGV4X25vc3BlYyhhbHRwMm1faWR4LCBNQVhfQUxUUDJNKV07
DQogICAgIH0NCiAjZWxzZQ0KICAgICBBU1NFUlQoIWFsdHAybV9pZHgpOw0KQEAgLTQ5MSwxMSAr
NDkzLDEyIEBAIGludCBwMm1fZ2V0X21lbV9hY2Nlc3Moc3RydWN0IGRvbWFpbiAqZCwgZ2ZuX3Qg
Z2ZuLCB4ZW5tZW1fYWNjZXNzX3QgKmFjY2VzcywNCiAgICAgfQ0KICAgICBlbHNlIGlmICggYWx0
cDJtX2lkeCApIC8qIGFsdHAybSB2aWV3IDAgaXMgdHJlYXRlZCBhcyB0aGUgaG9zdHAybSAqLw0K
ICAgICB7DQotICAgICAgICBpZiAoIGFsdHAybV9pZHggPj0gTUFYX0FMVFAyTSB8fA0KLSAgICAg
ICAgICAgICBkLT5hcmNoLmFsdHAybV9lcHRwW2FsdHAybV9pZHhdID09IG1mbl94KElOVkFMSURf
TUZOKSApDQorICAgICAgICBpZiAoIGFsdHAybV9pZHggPj0gIG1pbihBUlJBWV9TSVpFKGQtPmFy
Y2guYWx0cDJtX3AybSksIE1BWF9FUFRQKSB8fA0KKyAgICAgICAgICAgICBkLT5hcmNoLmFsdHAy
bV9lcHRwW2FycmF5X2luZGV4X25vc3BlYyhhbHRwMm1faWR4LCBNQVhfRVBUUCldID09DQorICAg
ICAgICAgICAgIG1mbl94KElOVkFMSURfTUZOKSApDQogICAgICAgICAgICAgcmV0dXJuIC1FSU5W
QUw7DQogDQotICAgICAgICBwMm0gPSBkLT5hcmNoLmFsdHAybV9wMm1bYWx0cDJtX2lkeF07DQor
ICAgICAgICBwMm0gPSBkLT5hcmNoLmFsdHAybV9wMm1bYXJyYXlfaW5kZXhfbm9zcGVjKGFsdHAy
bV9pZHgsIE1BWF9BTFRQMk0pXTsNCiAgICAgfQ0KICNlbHNlDQogICAgIEFTU0VSVCghYWx0cDJt
X2lkeCk7DQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL3AybS5jIGIveGVuL2FyY2gveDg2
L21tL3AybS5jDQppbmRleCAzMTE5MjY5MDczLi40ZmM5MTlhOWM1IDEwMDY0NA0KLS0tIGEveGVu
L2FyY2gveDg2L21tL3AybS5jDQorKysgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMNCkBAIC0yNTc3
LDYgKzI1NzcsOCBAQCBpbnQgcDJtX2luaXRfYWx0cDJtX2J5X2lkKHN0cnVjdCBkb21haW4gKmQs
IHVuc2lnbmVkIGludCBpZHgpDQogICAgIGlmICggaWR4ID49IE1BWF9BTFRQMk0gKQ0KICAgICAg
ICAgcmV0dXJuIHJjOw0KIA0KKyAgICBpZHggPSBhcnJheV9pbmRleF9ub3NwZWMoaWR4LCBNQVhf
QUxUUDJNKTsNCisNCiAgICAgYWx0cDJtX2xpc3RfbG9jayhkKTsNCiANCiAgICAgaWYgKCBkLT5h
cmNoLmFsdHAybV9lcHRwW2lkeF0gPT0gbWZuX3goSU5WQUxJRF9NRk4pICkNCkBAIC0yNjE4LDYg
KzI2MjAsOCBAQCBpbnQgcDJtX2Rlc3Ryb3lfYWx0cDJtX2J5X2lkKHN0cnVjdCBkb21haW4gKmQs
IHVuc2lnbmVkIGludCBpZHgpDQogICAgIGlmICggIWlkeCB8fCBpZHggPj0gTUFYX0FMVFAyTSAp
DQogICAgICAgICByZXR1cm4gcmM7DQogDQorICAgIGlkeCA9IGFycmF5X2luZGV4X25vc3BlYyhp
ZHgsIE1BWF9BTFRQMk0pOw0KKw0KICAgICByYyA9IGRvbWFpbl9wYXVzZV9leGNlcHRfc2VsZihk
KTsNCiAgICAgaWYgKCByYyApDQogICAgICAgICByZXR1cm4gcmM7DQpAQCAtMjY4OSwxMSArMjY5
MywxMyBAQCBpbnQgcDJtX2NoYW5nZV9hbHRwMm1fZ2ZuKHN0cnVjdCBkb21haW4gKmQsIHVuc2ln
bmVkIGludCBpZHgsDQogICAgIG1mbl90IG1mbjsNCiAgICAgaW50IHJjID0gLUVJTlZBTDsNCiAN
Ci0gICAgaWYgKCBpZHggPj0gTUFYX0FMVFAyTSB8fCBkLT5hcmNoLmFsdHAybV9lcHRwW2lkeF0g
PT0gbWZuX3goSU5WQUxJRF9NRk4pICkNCisgICAgaWYgKCBpZHggPj0gIG1pbihBUlJBWV9TSVpF
KGQtPmFyY2guYWx0cDJtX3AybSksIE1BWF9FUFRQKSB8fA0KKyAgICAgICAgIGQtPmFyY2guYWx0
cDJtX2VwdHBbYXJyYXlfaW5kZXhfbm9zcGVjKGlkeCwgTUFYX0VQVFApXSA9PQ0KKyAgICAgICAg
IG1mbl94KElOVkFMSURfTUZOKSApDQogICAgICAgICByZXR1cm4gcmM7DQogDQogICAgIGhwMm0g
PSBwMm1fZ2V0X2hvc3RwMm0oZCk7DQotICAgIGFwMm0gPSBkLT5hcmNoLmFsdHAybV9wMm1baWR4
XTsNCisgICAgYXAybSA9IGQtPmFyY2guYWx0cDJtX3AybVthcnJheV9pbmRleF9ub3NwZWMoaWR4
LCBNQVhfQUxUUDJNKV07DQogDQogICAgIHAybV9sb2NrKGhwMm0pOw0KICAgICBwMm1fbG9jayhh
cDJtKTsNCkBAIC0zMDMyLDExICszMDM4LDEzIEBAIGludCBwMm1fc2V0X3N1cHByZXNzX3ZlKHN0
cnVjdCBkb21haW4gKmQsIGdmbl90IGdmbiwgYm9vbCBzdXBwcmVzc192ZSwNCiANCiAgICAgaWYg
KCBhbHRwMm1faWR4ID4gMCApDQogICAgIHsNCi0gICAgICAgIGlmICggYWx0cDJtX2lkeCA+PSBN
QVhfQUxUUDJNIHx8DQotICAgICAgICAgICAgIGQtPmFyY2guYWx0cDJtX2VwdHBbYWx0cDJtX2lk
eF0gPT0gbWZuX3goSU5WQUxJRF9NRk4pICkNCisgICAgICAgIGlmICggYWx0cDJtX2lkeCA+PSAg
bWluKEFSUkFZX1NJWkUoZC0+YXJjaC5hbHRwMm1fcDJtKSwgTUFYX0VQVFApIHx8DQorICAgICAg
ICAgICAgIGQtPmFyY2guYWx0cDJtX2VwdHBbYXJyYXlfaW5kZXhfbm9zcGVjKGFsdHAybV9pZHgs
IE1BWF9FUFRQKV0gPT0NCisgICAgICAgICAgICAgbWZuX3goSU5WQUxJRF9NRk4pICkNCiAgICAg
ICAgICAgICByZXR1cm4gLUVJTlZBTDsNCiANCi0gICAgICAgIHAybSA9IGFwMm0gPSBkLT5hcmNo
LmFsdHAybV9wMm1bYWx0cDJtX2lkeF07DQorICAgICAgICBwMm0gPSBhcDJtID0gZC0+YXJjaC5h
bHRwMm1fcDJtW2FycmF5X2luZGV4X25vc3BlYyhhbHRwMm1faWR4LA0KKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTUFYX0FMVFAyTSld
Ow0KICAgICB9DQogICAgIGVsc2UNCiAgICAgICAgIHAybSA9IGhvc3RfcDJtOw0KQEAgLTMwNzUs
MTEgKzMwODMsMTMgQEAgaW50IHAybV9nZXRfc3VwcHJlc3NfdmUoc3RydWN0IGRvbWFpbiAqZCwg
Z2ZuX3QgZ2ZuLCBib29sICpzdXBwcmVzc192ZSwNCiANCiAgICAgaWYgKCBhbHRwMm1faWR4ID4g
MCApDQogICAgIHsNCi0gICAgICAgIGlmICggYWx0cDJtX2lkeCA+PSBNQVhfQUxUUDJNIHx8DQot
ICAgICAgICAgICAgIGQtPmFyY2guYWx0cDJtX2VwdHBbYWx0cDJtX2lkeF0gPT0gbWZuX3goSU5W
QUxJRF9NRk4pICkNCisgICAgICAgIGlmICggYWx0cDJtX2lkeCA+PSAgbWluKEFSUkFZX1NJWkUo
ZC0+YXJjaC5hbHRwMm1fcDJtKSwgTUFYX0VQVFApIHx8DQorICAgICAgICAgICAgIGQtPmFyY2gu
YWx0cDJtX2VwdHBbYXJyYXlfaW5kZXhfbm9zcGVjKGFsdHAybV9pZHgsIE1BWF9FUFRQKV0gPT0N
CisgICAgICAgICAgICAgbWZuX3goSU5WQUxJRF9NRk4pICkNCiAgICAgICAgICAgICByZXR1cm4g
LUVJTlZBTDsNCiANCi0gICAgICAgIHAybSA9IGFwMm0gPSBkLT5hcmNoLmFsdHAybV9wMm1bYWx0
cDJtX2lkeF07DQorICAgICAgICBwMm0gPSBhcDJtID0gZC0+YXJjaC5hbHRwMm1fcDJtW2FycmF5
X2luZGV4X25vc3BlYyhhbHRwMm1faWR4LA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTUFYX0FMVFAyTSldOw0KICAgICB9DQogICAg
IGVsc2UNCiAgICAgICAgIHAybSA9IGhvc3RfcDJtOw0KLS0gDQoyLjE3LjENCg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
