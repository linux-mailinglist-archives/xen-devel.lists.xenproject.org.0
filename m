Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4DC345EF
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 13:52:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hY7x6-00051L-R5; Tue, 04 Jun 2019 11:50:04 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BOpN=UD=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hY7x4-00051C-UR
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 11:50:03 +0000
X-Inumbo-ID: e18b8e60-86be-11e9-8980-bc764e045a96
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.132]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e18b8e60-86be-11e9-8980-bc764e045a96;
 Tue, 04 Jun 2019 11:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BCX+WO5xcwiOXfl+EdbXTyd3haQStU/ghIaDygHvWJI=;
 b=xz2XJTDkFWKGfE4Ityv8ZBNY1w4zjY747p4weGMSjyAcq6Rhs3de5sKWVQhAv5EQwL92fZvjTVt4XPIKcyaahl99pJAa7Rr2FA6CObu8jEMGZIrr+dYFOBBRqAUzFdMYy6SANEdPd4S8/UlRGasTnGQWf/NNEj0GrP6HulBTOJY=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.106.11) by
 VI1PR0202MB3549.eurprd02.prod.outlook.com (52.134.18.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Tue, 4 Jun 2019 11:49:57 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::fdcf:4771:37b7:9830]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::fdcf:4771:37b7:9830%9]) with mapi id 15.20.1943.018; Tue, 4 Jun 2019
 11:49:57 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v5] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVGsuhtcaVOzv43UiBDvbMIKzJ0g==
Date: Tue, 4 Jun 2019 11:49:57 +0000
Message-ID: <20190604114943.4840-1-aisaila@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR08CA0274.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::47) To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:e3::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ba10de0-c826-48b6-37af-08d6e8e2c40f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR0202MB3549; 
x-ms-traffictypediagnostic: VI1PR0202MB3549:|VI1PR0202MB3549:
x-microsoft-antispam-prvs: <VI1PR0202MB3549ED4D66A38232C2F95E54AB150@VI1PR0202MB3549.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:294;
x-forefront-prvs: 0058ABBBC7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(366004)(346002)(396003)(376002)(39860400002)(199004)(189003)(36756003)(66066001)(8676002)(305945005)(81166006)(81156014)(2351001)(6916009)(7736002)(6436002)(50226002)(2616005)(5640700003)(4326008)(6512007)(7416002)(107886003)(6486002)(53936002)(25786009)(8936002)(53946003)(476003)(1076003)(71190400001)(71200400001)(30864003)(5660300002)(73956011)(52116002)(66476007)(64756008)(486006)(2501003)(66556008)(66446008)(99286004)(316002)(386003)(6506007)(14444005)(256004)(102836004)(14454004)(2906002)(68736007)(26005)(54906003)(186003)(6116002)(3846002)(86362001)(478600001)(66946007)(309714004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB3549;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gb9BlyIVnEiiBEMFrltabDxPvepUn5soTuTsGZJGd/vpX5dI3BQ+vFukyTorEGXEAMuabG15IeyeKif7Mp0uMp/tGVA9FF7ptj6lpb12nWzo1z7BeWehzf7ey1x5mqmW+7mLDCHrdKK2abMqKjqP3Y/k2hB5kWAY7yK3mVbwCkbyl5kiElXCwtnrmqpJ8yxrN7oUqXohg2J/z8uOXXSB6Km5zYecfmt/YWw7w/t+112OOSTRTqM0nI4/nsFVAgNGPHb4CagAWsejjtjWHU8et6ePY3OGlP6VwB+YhqQQJR3fjsAZLkoqqCZaKc6qGvfWQ9YFxGmJyv+SVc8tiV4q2fujrLgqechMlXsj+tQmI7wqmexR8C+Wn7pNjd0ogZG62CVmts2SLCXw45BRVFZtNHJMAietYsg3SPQSaYU7iGQ=
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ba10de0-c826-48b6-37af-08d6e8e2c40f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2019 11:49:57.1930 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisaila@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB3549
Subject: [Xen-devel] [PATCH v5] x86/emulate: Send vm_event from emulate
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
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "wl@xen.org" <wl@xen.org>, "jun.nakajima@intel.com" <jun.nakajima@intel.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>,
 "tim@xen.org" <tim@xen.org>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "brian.woods@amd.com" <brian.woods@amd.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBwYXRjaCBhaW1zIHRvIGhhdmUgbWVtIGFjY2VzcyB2bSBldmVudHMgc2VudCBmcm9tIHRo
ZSBlbXVsYXRvci4NClRoaXMgaXMgdXNlZnVsIHdoZXJlIHdlIHdhbnQgdG8gb25seSBlbXVsYXRl
IGEgcGFnZSB3YWxrIHdpdGhvdXQNCmNoZWNraW5nIHRoZSBFUFQsIGJ1dCB3ZSBzdGlsbCB3YW50
IHRvIGNoZWNrIHRoZSBFUFQgd2hlbiBlbXVsYXRpbmcNCnRoZSBpbnN0cnVjdGlvbiB0aGF0IGNh
dXNlZCB0aGUgcGFnZSB3YWxrLiBJbiB0aGlzIGNhc2UsIHRoZSBvcmlnaW5hbA0KRVBUIGZhdWx0
IGlzIGNhdXNlZCBieSB0aGUgd2FsayB0cnlpbmcgdG8gc2V0IHRoZSBhY2Nlc3NlZCBvciBkaXJ0
eQ0KYml0cywgYnV0IGV4ZWN1dGluZyB0aGUgaW5zdHJ1Y3Rpb24gaXRzZWxmIG1pZ2h0IGFsc28g
Y2F1c2UgYW4gRVBUDQpmYXVsdCBpZiBwZXJtaXR0ZWQgdG8gcnVuLCBhbmQgdGhpcyBzZWNvbmQg
ZmF1bHQgc2hvdWxkIG5vdCBiZSBsb3N0Lg0KDQpXZSB1c2UgaHZtZW11bF9tYXBfbGluZWFyX2Fk
ZHIoKSB0byBpbnRlcmNlcHQgci93IGFjY2VzcyBhbmQNCl9faHZtX2NvcHkoKSB0byBpbnRlcmNl
cHQgZXhlYyBhY2Nlc3MuDQoNCkZpcnN0IHdlIHRyeSB0byBzZW5kIGEgdm0gZXZlbnQgYW5kIGlm
IHRoZSBldmVudCBpcyBzZW50IHRoZW4gZW11bGF0aW9uDQpyZXR1cm5zIFg4NkVNVUxfUkVUUlkg
aW4gb3JkZXIgdG8gc3RvcCBlbXVsYXRpb24gb24gaW5zdHJ1Y3Rpb25zIHRoYXQNCnVzZSBhY2Nl
c3MgcHJvdGVjdGVkIHBhZ2VzLiBJZiB0aGUgZXZlbnQgaXMgbm90IHNlbnQgdGhlbiB0aGUNCmVt
dWxhdGlvbiBnb2VzIG9uIGFzIGV4cGVjdGVkLg0KDQpTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcnUg
SXNhaWxhIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4NCg0KLS0tDQpDaGFuZ2VzIHNpbmNlIFY0
Og0KCS0gTW92ZSB0aGUgZXhlYyBpbnRlcmNlcHRpb24gdG8gX19odm1fY29weSgpDQoJLSBSZW1v
dmUgdGhlIHBhZ2Utd2FsayBpbiBodm1fZW11bGF0ZV9zZW5kX3ZtX2V2ZW50KCkgYW5kIGdldA0K
dGhlIG5lZWRlZCBhZGRyZXNzIGZyb20gdGhlIGV4aXN0aW5nIHBhZ2Ugd2Fsaw0KCS0gQWRkIHNl
bmRfZXZlbnQgcGFyYW0gdG8gX19odm1fY29weSgpIGFuZA0KaHZtX2NvcHlfZnJvbV9ndWVzdF9s
aW5lYXIoKQ0KCS0gRHJvcCBYODZFTVVMX0FDQ0VTU19FWENFUFRJT04gYW5kIHVzZSBYODZFTVVM
X1JFVFJZIGluc3RlYWQuDQotLS0NCiB4ZW4vYXJjaC94ODYvaHZtL2VtdWxhdGUuYyAgICAgICAg
fCA3MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tDQogeGVuL2FyY2gveDg2L2h2bS9o
dm0uYyAgICAgICAgICAgIHwgMjcgKysrKysrKy0tLS0tDQogeGVuL2FyY2gveDg2L2h2bS9zdm0v
c3ZtLmMgICAgICAgIHwgIDIgKy0NCiB4ZW4vYXJjaC94ODYvaHZtL3ZtX2V2ZW50LmMgICAgICAg
fCAgMiArLQ0KIHhlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYyAgICAgICB8ICAyICstDQogeGVu
L2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYyAgICAgIHwgIDMgKy0NCiB4ZW4vYXJjaC94ODYvbW0v
c2hhZG93L2NvbW1vbi5jICAgfCAgNCArLQ0KIHhlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvaHZtLmMg
ICAgICB8ICAyICstDQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vZW11bGF0ZS5oIHwgIDkgKysr
LQ0KIHhlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3N1cHBvcnQuaCB8ICAyICstDQogMTAgZmlsZXMg
Y2hhbmdlZCwgMTAxIGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L2h2bS9lbXVsYXRlLmMgYi94ZW4vYXJjaC94ODYvaHZtL2VtdWxhdGUu
Yw0KaW5kZXggODY1OWM4OTg2Mi4uOWIyZDhjMjAxNCAxMDA2NDQNCi0tLSBhL3hlbi9hcmNoL3g4
Ni9odm0vZW11bGF0ZS5jDQorKysgYi94ZW4vYXJjaC94ODYvaHZtL2VtdWxhdGUuYw0KQEAgLTEy
LDkgKzEyLDExIEBADQogI2luY2x1ZGUgPHhlbi9pbml0Lmg+DQogI2luY2x1ZGUgPHhlbi9saWIu
aD4NCiAjaW5jbHVkZSA8eGVuL3NjaGVkLmg+DQorI2luY2x1ZGUgPHhlbi9tb25pdG9yLmg+DQog
I2luY2x1ZGUgPHhlbi9wYWdpbmcuaD4NCiAjaW5jbHVkZSA8eGVuL3RyYWNlLmg+DQogI2luY2x1
ZGUgPHhlbi92bV9ldmVudC5oPg0KKyNpbmNsdWRlIDxhc20vYWx0cDJtLmg+DQogI2luY2x1ZGUg
PGFzbS9ldmVudC5oPg0KICNpbmNsdWRlIDxhc20vaTM4Ny5oPg0KICNpbmNsdWRlIDxhc20veHN0
YXRlLmg+DQpAQCAtNTMwLDYgKzUzMiw1NyBAQCBzdGF0aWMgaW50IGh2bWVtdWxfZG9fbW1pb19h
ZGRyKHBhZGRyX3QgbW1pb19ncGEsDQogICAgIHJldHVybiBodm1lbXVsX2RvX2lvX2FkZHIoMSwg
bW1pb19ncGEsIHJlcHMsIHNpemUsIGRpciwgZGYsIHJhbV9ncGEpOw0KIH0NCiANCitib29sIGh2
bV9lbXVsYXRlX3NlbmRfdm1fZXZlbnQodW5zaWduZWQgbG9uZyBnbGEsIGdmbl90IGdmbiwNCisg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgcGZlYywgYm9vbCBzZW5kX2V2
ZW50KQ0KK3sNCisgICAgeGVubWVtX2FjY2Vzc190IGFjY2VzczsNCisgICAgdm1fZXZlbnRfcmVx
dWVzdF90IHJlcSA9IHt9Ow0KKyAgICBwYWRkcl90IGdwYSA9ICgoZ2ZuX3goZ2ZuKSA8PCBQQUdF
X1NISUZUKSB8IChnbGEgJiB+UEFHRV9NQVNLKSk7DQorDQorICAgIGlmICggIXNlbmRfZXZlbnQg
fHwgIXBmZWMgKQ0KKyAgICAgICAgcmV0dXJuIGZhbHNlOw0KKw0KKyAgICBpZiAoIHAybV9nZXRf
bWVtX2FjY2VzcyhjdXJyZW50LT5kb21haW4sIGdmbiwgJmFjY2VzcywNCisgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgYWx0cDJtX3ZjcHVfaWR4KGN1cnJlbnQpKSAhPSAwICkNCisgICAgICAg
IHJldHVybiBmYWxzZTsNCisNCisgICAgc3dpdGNoICggYWNjZXNzICkgew0KKyAgICBjYXNlIFhF
Tk1FTV9hY2Nlc3NfeDoNCisgICAgY2FzZSBYRU5NRU1fYWNjZXNzX3J4Og0KKyAgICAgICAgaWYg
KCBwZmVjICYgUEZFQ193cml0ZV9hY2Nlc3MgKQ0KKyAgICAgICAgICAgIHJlcS51Lm1lbV9hY2Nl
c3MuZmxhZ3MgPSBNRU1fQUNDRVNTX1IgfCBNRU1fQUNDRVNTX1c7DQorICAgICAgICBicmVhazsN
CisNCisgICAgY2FzZSBYRU5NRU1fYWNjZXNzX3c6DQorICAgIGNhc2UgWEVOTUVNX2FjY2Vzc19y
dzoNCisgICAgICAgIGlmICggcGZlYyAmIFBGRUNfaW5zbl9mZXRjaCApDQorICAgICAgICAgICAg
cmVxLnUubWVtX2FjY2Vzcy5mbGFncyA9IE1FTV9BQ0NFU1NfWDsNCisgICAgICAgIGJyZWFrOw0K
Kw0KKyAgICBjYXNlIFhFTk1FTV9hY2Nlc3NfcjoNCisgICAgY2FzZSBYRU5NRU1fYWNjZXNzX246
DQorICAgICAgICBpZiAoIHBmZWMgJiBQRkVDX3dyaXRlX2FjY2VzcyApDQorICAgICAgICAgICAg
cmVxLnUubWVtX2FjY2Vzcy5mbGFncyB8PSBNRU1fQUNDRVNTX1IgfCBNRU1fQUNDRVNTX1c7DQor
ICAgICAgICBpZiAoIHBmZWMgJiBQRkVDX2luc25fZmV0Y2ggKQ0KKyAgICAgICAgICAgIHJlcS51
Lm1lbV9hY2Nlc3MuZmxhZ3MgfD0gTUVNX0FDQ0VTU19YOw0KKyAgICAgICAgYnJlYWs7DQorDQor
ICAgIGRlZmF1bHQ6DQorICAgICAgICByZXR1cm4gZmFsc2U7DQorICAgIH0NCisNCisgICAgaWYg
KCAhcmVxLnUubWVtX2FjY2Vzcy5mbGFncyApDQorICAgICAgICByZXR1cm4gZmFsc2U7IC8qIG5v
IHZpb2xhdGlvbiAqLw0KKw0KKyAgICByZXEucmVhc29uID0gVk1fRVZFTlRfUkVBU09OX01FTV9B
Q0NFU1M7DQorICAgIHJlcS51Lm1lbV9hY2Nlc3MuZ2ZuID0gZ2ZuX3goZ2ZuKTsNCisgICAgcmVx
LnUubWVtX2FjY2Vzcy5mbGFncyB8PSBNRU1fQUNDRVNTX0ZBVUxUX1dJVEhfR0xBIHwgTUVNX0FD
Q0VTU19HTEFfVkFMSUQ7DQorICAgIHJlcS51Lm1lbV9hY2Nlc3MuZ2xhID0gZ2xhOw0KKyAgICBy
ZXEudS5tZW1fYWNjZXNzLm9mZnNldCA9IGdwYSAmICgoMSA8PCBQQUdFX1NISUZUKSAtIDEpOw0K
Kw0KKyAgICByZXR1cm4gbW9uaXRvcl90cmFwcyhjdXJyZW50LCB0cnVlLCAmcmVxKSA+PSAwOw0K
K30NCisNCiAvKg0KICAqIE1hcCB0aGUgZnJhbWUocykgY292ZXJpbmcgYW4gaW5kaXZpZHVhbCBs
aW5lYXIgYWNjZXNzLCBmb3Igd3JpdGVhYmxlDQogICogYWNjZXNzLiAgTWF5IHJldHVybiBOVUxM
IGZvciBNTUlPLCBvciBFUlJfUFRSKH5YODZFTVVMXyopIGZvciBvdGhlciBlcnJvcnMNCkBAIC01
NDcsNiArNjAwLDcgQEAgc3RhdGljIHZvaWQgKmh2bWVtdWxfbWFwX2xpbmVhcl9hZGRyKA0KICAg
ICB1bnNpZ25lZCBpbnQgbnJfZnJhbWVzID0gKChsaW5lYXIgKyBieXRlcyAtICEhYnl0ZXMpID4+
IFBBR0VfU0hJRlQpIC0NCiAgICAgICAgIChsaW5lYXIgPj4gUEFHRV9TSElGVCkgKyAxOw0KICAg
ICB1bnNpZ25lZCBpbnQgaTsNCisgICAgZ2ZuX3QgZ2ZuOw0KIA0KICAgICAvKg0KICAgICAgKiBt
Zm4gcG9pbnRzIHRvIHRoZSBuZXh0IGZyZWUgc2xvdC4gIEFsbCB1c2VkIHNsb3RzIGhhdmUgYSBw
YWdlIHJlZmVyZW5jZQ0KQEAgLTU4NSw3ICs2MzksNyBAQCBzdGF0aWMgdm9pZCAqaHZtZW11bF9t
YXBfbGluZWFyX2FkZHIoDQogICAgICAgICBBU1NFUlQobWZuX3goKm1mbikgPT0gMCk7DQogDQog
ICAgICAgICByZXMgPSBodm1fdHJhbnNsYXRlX2dldF9wYWdlKGN1cnIsIGFkZHIsIHRydWUsIHBm
ZWMsDQotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZwZmluZm8sICZwYWdl
LCBOVUxMLCAmcDJtdCk7DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZw
ZmluZm8sICZwYWdlLCAmZ2ZuLCAmcDJtdCk7DQogDQogICAgICAgICBzd2l0Y2ggKCByZXMgKQ0K
ICAgICAgICAgew0KQEAgLTYxNSw2ICs2NjksMTMgQEAgc3RhdGljIHZvaWQgKmh2bWVtdWxfbWFw
X2xpbmVhcl9hZGRyKA0KIA0KICAgICAgICAgaWYgKCBwZmVjICYgUEZFQ193cml0ZV9hY2Nlc3Mg
KQ0KICAgICAgICAgew0KKyAgICAgICAgICAgIGlmICggaHZtX2VtdWxhdGVfc2VuZF92bV9ldmVu
dChhZGRyLCBnZm4sIHBmZWMsDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGh2bWVtdWxfY3R4dC0+c2VuZF9ldmVudCkgKQ0KKyAgICAgICAgICAgIHsNCisgICAg
ICAgICAgICAgICAgZXJyID0gRVJSX1BUUih+WDg2RU1VTF9SRVRSWSk7DQorICAgICAgICAgICAg
ICAgIGdvdG8gb3V0Ow0KKyAgICAgICAgICAgIH0NCisNCiAgICAgICAgICAgICBpZiAoIHAybV9p
c19kaXNjYXJkX3dyaXRlKHAybXQpICkNCiAgICAgICAgICAgICB7DQogICAgICAgICAgICAgICAg
IGVyciA9IEVSUl9QVFIoflg4NkVNVUxfT0tBWSk7DQpAQCAtMTExNSw3ICsxMTc2LDggQEAgc3Rh
dGljIGludCBsaW5lYXJfcmVhZCh1bnNpZ25lZCBsb25nIGFkZHIsIHVuc2lnbmVkIGludCBieXRl
cywgdm9pZCAqcF9kYXRhLA0KICAgICAgKiBjbGVhbiB1cCBhbnkgaW50ZXJpbSBzdGF0ZS4NCiAg
ICAgICovDQogICAgIGlmICggIWh2bWVtdWxfZmluZF9tbWlvX2NhY2hlKHZpbywgYWRkciwgSU9S
RVFfUkVBRCwgZmFsc2UpICkNCi0gICAgICAgIHJjID0gaHZtX2NvcHlfZnJvbV9ndWVzdF9saW5l
YXIocF9kYXRhLCBhZGRyLCBieXRlcywgcGZlYywgJnBmaW5mbyk7DQorICAgICAgICByYyA9IGh2
bV9jb3B5X2Zyb21fZ3Vlc3RfbGluZWFyKHBfZGF0YSwgYWRkciwgYnl0ZXMsIHBmZWMsICZwZmlu
Zm8sDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGh2bWVtdWxfY3R4
dC0+c2VuZF9ldmVudCk7DQogDQogICAgIHN3aXRjaCAoIHJjICkNCiAgICAgew0KQEAgLTI1MDks
MTIgKzI1NzEsMTMgQEAgaW50IGh2bV9lbXVsYXRlX29uZV9tbWlvKHVuc2lnbmVkIGxvbmcgbWZu
LCB1bnNpZ25lZCBsb25nIGdsYSkNCiB9DQogDQogdm9pZCBodm1fZW11bGF0ZV9vbmVfdm1fZXZl
bnQoZW51bSBlbXVsX2tpbmQga2luZCwgdW5zaWduZWQgaW50IHRyYXBuciwNCi0gICAgdW5zaWdu
ZWQgaW50IGVycmNvZGUpDQorICAgIHVuc2lnbmVkIGludCBlcnJjb2RlLCBib29sIHNlbmRfZXZl
bnQpDQogew0KICAgICBzdHJ1Y3QgaHZtX2VtdWxhdGVfY3R4dCBjdHggPSB7eyAwIH19Ow0KICAg
ICBpbnQgcmM7DQogDQogICAgIGh2bV9lbXVsYXRlX2luaXRfb25jZSgmY3R4LCBOVUxMLCBndWVz
dF9jcHVfdXNlcl9yZWdzKCkpOw0KKyAgICBjdHguc2VuZF9ldmVudCA9IHNlbmRfZXZlbnQ7DQog
DQogICAgIHN3aXRjaCAoIGtpbmQgKQ0KICAgICB7DQpAQCAtMjYyOSw3ICsyNjkyLDcgQEAgdm9p
ZCBodm1fZW11bGF0ZV9pbml0X3Blcl9pbnNuKA0KICAgICAgICAgICAgICBodm1fY29weV9mcm9t
X2d1ZXN0X2xpbmVhcihodm1lbXVsX2N0eHQtPmluc25fYnVmLCBhZGRyLA0KICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplb2YoaHZtZW11bF9jdHh0LT5pbnNuX2J1
ZiksDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBmZWMgfCBQRkVD
X2luc25fZmV0Y2gsDQotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE5V
TEwpID09IEhWTVRSQU5TX29rYXkpID8NCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgTlVMTCwgZmFsc2UpID09IEhWTVRSQU5TX29rYXkpID8NCiAgICAgICAgICAgICBz
aXplb2YoaHZtZW11bF9jdHh0LT5pbnNuX2J1ZikgOiAwOw0KICAgICB9DQogICAgIGVsc2UNCmRp
ZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL2h2bS5jIGIveGVuL2FyY2gveDg2L2h2bS9odm0u
Yw0KaW5kZXggMDI5ZWVhM2I4NS4uZjZkZjU3YjQ0MiAxMDA2NDQNCi0tLSBhL3hlbi9hcmNoL3g4
Ni9odm0vaHZtLmMNCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMNCkBAIC0yOTQyLDcgKzI5
NDIsNyBAQCB2b2lkIGh2bV90YXNrX3N3aXRjaCgNCiAgICAgfQ0KIA0KICAgICByYyA9IGh2bV9j
b3B5X2Zyb21fZ3Vlc3RfbGluZWFyKA0KLSAgICAgICAgJnRzcywgcHJldl90ci5iYXNlLCBzaXpl
b2YodHNzKSwgUEZFQ19wYWdlX3ByZXNlbnQsICZwZmluZm8pOw0KKyAgICAgICAgJnRzcywgcHJl
dl90ci5iYXNlLCBzaXplb2YodHNzKSwgUEZFQ19wYWdlX3ByZXNlbnQsICZwZmluZm8sIGZhbHNl
KTsNCiAgICAgaWYgKCByYyA9PSBIVk1UUkFOU19iYWRfbGluZWFyX3RvX2dmbiApDQogICAgICAg
ICBodm1faW5qZWN0X3BhZ2VfZmF1bHQocGZpbmZvLmVjLCBwZmluZm8ubGluZWFyKTsNCiAgICAg
aWYgKCByYyAhPSBIVk1UUkFOU19va2F5ICkNCkBAIC0yOTg5LDcgKzI5ODksNyBAQCB2b2lkIGh2
bV90YXNrX3N3aXRjaCgNCiAgICAgICAgIGdvdG8gb3V0Ow0KIA0KICAgICByYyA9IGh2bV9jb3B5
X2Zyb21fZ3Vlc3RfbGluZWFyKA0KLSAgICAgICAgJnRzcywgdHIuYmFzZSwgc2l6ZW9mKHRzcyks
IFBGRUNfcGFnZV9wcmVzZW50LCAmcGZpbmZvKTsNCisgICAgICAgICZ0c3MsIHRyLmJhc2UsIHNp
emVvZih0c3MpLCBQRkVDX3BhZ2VfcHJlc2VudCwgJnBmaW5mbywgZmFsc2UpOw0KICAgICBpZiAo
IHJjID09IEhWTVRSQU5TX2JhZF9saW5lYXJfdG9fZ2ZuICkNCiAgICAgICAgIGh2bV9pbmplY3Rf
cGFnZV9mYXVsdChwZmluZm8uZWMsIHBmaW5mby5saW5lYXIpOw0KICAgICAvKg0KQEAgLTMxODAs
NyArMzE4MCw3IEBAIGVudW0gaHZtX3RyYW5zbGF0aW9uX3Jlc3VsdCBodm1fdHJhbnNsYXRlX2dl
dF9wYWdlKA0KICNkZWZpbmUgSFZNQ09QWV9saW5lYXIgICAgICgxdTw8MikNCiBzdGF0aWMgZW51
bSBodm1fdHJhbnNsYXRpb25fcmVzdWx0IF9faHZtX2NvcHkoDQogICAgIHZvaWQgKmJ1ZiwgcGFk
ZHJfdCBhZGRyLCBpbnQgc2l6ZSwgc3RydWN0IHZjcHUgKnYsIHVuc2lnbmVkIGludCBmbGFncywN
Ci0gICAgdWludDMyX3QgcGZlYywgcGFnZWZhdWx0X2luZm9fdCAqcGZpbmZvKQ0KKyAgICB1aW50
MzJfdCBwZmVjLCBwYWdlZmF1bHRfaW5mb190ICpwZmluZm8sIGJvb2wgc2VuZF9ldmVudCkNCiB7
DQogICAgIGdmbl90IGdmbjsNCiAgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGFnZTsNCkBAIC0zMjI0
LDYgKzMyMjQsMTIgQEAgc3RhdGljIGVudW0gaHZtX3RyYW5zbGF0aW9uX3Jlc3VsdCBfX2h2bV9j
b3B5KA0KICAgICAgICAgICAgIHJldHVybiBIVk1UUkFOU19iYWRfZ2ZuX3RvX21mbjsNCiAgICAg
ICAgIH0NCiANCisgICAgICAgIGlmICggaHZtX2VtdWxhdGVfc2VuZF92bV9ldmVudChhZGRyLCBn
Zm4sIHBmZWMsIHNlbmRfZXZlbnQpICkNCisgICAgICAgIHsNCisgICAgICAgICAgICBwdXRfcGFn
ZShwYWdlKTsNCisgICAgICAgICAgICByZXR1cm4gSFZNVFJBTlNfZ2ZuX3BhZ2VkX291dDsNCisg
ICAgICAgIH0NCisNCiAgICAgICAgIHAgPSAoY2hhciAqKV9fbWFwX2RvbWFpbl9wYWdlKHBhZ2Up
ICsgKGFkZHIgJiB+UEFHRV9NQVNLKTsNCiANCiAgICAgICAgIGlmICggZmxhZ3MgJiBIVk1DT1BZ
X3RvX2d1ZXN0ICkNCkBAIC0zMjY3LDE0ICszMjczLDE0IEBAIGVudW0gaHZtX3RyYW5zbGF0aW9u
X3Jlc3VsdCBodm1fY29weV90b19ndWVzdF9waHlzKA0KICAgICBwYWRkcl90IHBhZGRyLCB2b2lk
ICpidWYsIGludCBzaXplLCBzdHJ1Y3QgdmNwdSAqdikNCiB7DQogICAgIHJldHVybiBfX2h2bV9j
b3B5KGJ1ZiwgcGFkZHIsIHNpemUsIHYsDQotICAgICAgICAgICAgICAgICAgICAgIEhWTUNPUFlf
dG9fZ3Vlc3QgfCBIVk1DT1BZX3BoeXMsIDAsIE5VTEwpOw0KKyAgICAgICAgICAgICAgICAgICAg
ICBIVk1DT1BZX3RvX2d1ZXN0IHwgSFZNQ09QWV9waHlzLCAwLCBOVUxMLCBmYWxzZSk7DQogfQ0K
IA0KIGVudW0gaHZtX3RyYW5zbGF0aW9uX3Jlc3VsdCBodm1fY29weV9mcm9tX2d1ZXN0X3BoeXMo
DQogICAgIHZvaWQgKmJ1ZiwgcGFkZHJfdCBwYWRkciwgaW50IHNpemUpDQogew0KICAgICByZXR1
cm4gX19odm1fY29weShidWYsIHBhZGRyLCBzaXplLCBjdXJyZW50LA0KLSAgICAgICAgICAgICAg
ICAgICAgICBIVk1DT1BZX2Zyb21fZ3Vlc3QgfCBIVk1DT1BZX3BoeXMsIDAsIE5VTEwpOw0KKyAg
ICAgICAgICAgICAgICAgICAgICBIVk1DT1BZX2Zyb21fZ3Vlc3QgfCBIVk1DT1BZX3BoeXMsIDAs
IE5VTEwsIGZhbHNlKTsNCiB9DQogDQogZW51bSBodm1fdHJhbnNsYXRpb25fcmVzdWx0IGh2bV9j
b3B5X3RvX2d1ZXN0X2xpbmVhcigNCkBAIC0zMjgzLDE2ICszMjg5LDE3IEBAIGVudW0gaHZtX3Ry
YW5zbGF0aW9uX3Jlc3VsdCBodm1fY29weV90b19ndWVzdF9saW5lYXIoDQogew0KICAgICByZXR1
cm4gX19odm1fY29weShidWYsIGFkZHIsIHNpemUsIGN1cnJlbnQsDQogICAgICAgICAgICAgICAg
ICAgICAgIEhWTUNPUFlfdG9fZ3Vlc3QgfCBIVk1DT1BZX2xpbmVhciwNCi0gICAgICAgICAgICAg
ICAgICAgICAgUEZFQ19wYWdlX3ByZXNlbnQgfCBQRkVDX3dyaXRlX2FjY2VzcyB8IHBmZWMsIHBm
aW5mbyk7DQorICAgICAgICAgICAgICAgICAgICAgIFBGRUNfcGFnZV9wcmVzZW50IHwgUEZFQ193
cml0ZV9hY2Nlc3MgfCBwZmVjLCBwZmluZm8sDQorICAgICAgICAgICAgICAgICAgICAgIGZhbHNl
KTsNCiB9DQogDQogZW51bSBodm1fdHJhbnNsYXRpb25fcmVzdWx0IGh2bV9jb3B5X2Zyb21fZ3Vl
c3RfbGluZWFyKA0KICAgICB2b2lkICpidWYsIHVuc2lnbmVkIGxvbmcgYWRkciwgaW50IHNpemUs
IHVpbnQzMl90IHBmZWMsDQotICAgIHBhZ2VmYXVsdF9pbmZvX3QgKnBmaW5mbykNCisgICAgcGFn
ZWZhdWx0X2luZm9fdCAqcGZpbmZvLCBib29sIHNlbmRfZXZlbnQpDQogew0KICAgICByZXR1cm4g
X19odm1fY29weShidWYsIGFkZHIsIHNpemUsIGN1cnJlbnQsDQogICAgICAgICAgICAgICAgICAg
ICAgIEhWTUNPUFlfZnJvbV9ndWVzdCB8IEhWTUNPUFlfbGluZWFyLA0KLSAgICAgICAgICAgICAg
ICAgICAgICBQRkVDX3BhZ2VfcHJlc2VudCB8IHBmZWMsIHBmaW5mbyk7DQorICAgICAgICAgICAg
ICAgICAgICAgIFBGRUNfcGFnZV9wcmVzZW50IHwgcGZlYywgcGZpbmZvLCBzZW5kX2V2ZW50KTsN
CiB9DQogDQogdW5zaWduZWQgbG9uZyBjb3B5X3RvX3VzZXJfaHZtKHZvaWQgKnRvLCBjb25zdCB2
b2lkICpmcm9tLCB1bnNpZ25lZCBpbnQgbGVuKQ0KQEAgLTMzMzMsNyArMzM0MCw3IEBAIHVuc2ln
bmVkIGxvbmcgY29weV9mcm9tX3VzZXJfaHZtKHZvaWQgKnRvLCBjb25zdCB2b2lkICpmcm9tLCB1
bnNpZ25lZCBsZW4pDQogICAgICAgICByZXR1cm4gMDsNCiAgICAgfQ0KIA0KLSAgICByYyA9IGh2
bV9jb3B5X2Zyb21fZ3Vlc3RfbGluZWFyKHRvLCAodW5zaWduZWQgbG9uZylmcm9tLCBsZW4sIDAs
IE5VTEwpOw0KKyAgICByYyA9IGh2bV9jb3B5X2Zyb21fZ3Vlc3RfbGluZWFyKHRvLCAodW5zaWdu
ZWQgbG9uZylmcm9tLCBsZW4sIDAsIE5VTEwsIGZhbHNlKTsNCiAgICAgcmV0dXJuIHJjID8gbGVu
IDogMDsgLyogZmFrZSBhIGNvcHlfZnJvbV91c2VyKCkgcmV0dXJuIGNvZGUgKi8NCiB9DQogDQpA
QCAtMzcwNyw3ICszNzE0LDcgQEAgdm9pZCBodm1fdWRfaW50ZXJjZXB0KHN0cnVjdCBjcHVfdXNl
cl9yZWdzICpyZWdzKQ0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
aXplb2Yoc2lnKSwgaHZtX2FjY2Vzc19pbnNuX2ZldGNoLA0KICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBjcywgJmFkZHIpICYmDQogICAgICAgICAgICAgIChodm1fY29w
eV9mcm9tX2d1ZXN0X2xpbmVhcihzaWcsIGFkZHIsIHNpemVvZihzaWcpLA0KLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgd2FsaywgTlVMTCkgPT0gSFZNVFJBTlNfb2th
eSkgJiYNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHdhbGssIE5V
TEwsIGZhbHNlKSA9PSBIVk1UUkFOU19va2F5KSAmJg0KICAgICAgICAgICAgICAobWVtY21wKHNp
ZywgIlx4Zlx4YnhlbiIsIHNpemVvZihzaWcpKSA9PSAwKSApDQogICAgICAgICB7DQogICAgICAg
ICAgICAgcmVncy0+cmlwICs9IHNpemVvZihzaWcpOw0KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4
Ni9odm0vc3ZtL3N2bS5jIGIveGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMNCmluZGV4IGNkNmE2
YjM4MmIuLmQwZDFkN2UwYTcgMTAwNjQ0DQotLS0gYS94ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0u
Yw0KKysrIGIveGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMNCkBAIC0xMjU1LDcgKzEyNTUsNyBA
QCBzdGF0aWMgdm9pZCBzdm1fZW11bF9zd2ludF9pbmplY3Rpb24oc3RydWN0IHg4Nl9ldmVudCAq
ZXZlbnQpDQogICAgICAgICBnb3RvIHJhaXNlX2V4Y2VwdGlvbjsNCiANCiAgICAgcmMgPSBodm1f
Y29weV9mcm9tX2d1ZXN0X2xpbmVhcigmaWR0ZSwgaWR0ZV9saW5lYXJfYWRkciwgaWR0ZV9zaXpl
LA0KLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBGRUNfaW1wbGljaXQsICZw
ZmluZm8pOw0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBGRUNfaW1wbGlj
aXQsICZwZmluZm8sIGZhbHNlKTsNCiAgICAgaWYgKCByYyApDQogICAgIHsNCiAgICAgICAgIGlm
ICggcmMgPT0gSFZNVFJBTlNfYmFkX2xpbmVhcl90b19nZm4gKQ0KZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL3g4Ni9odm0vdm1fZXZlbnQuYyBiL3hlbi9hcmNoL3g4Ni9odm0vdm1fZXZlbnQuYw0KaW5k
ZXggMTIxZGUyMzA3MS4uNmQyMDNlOGRiNSAxMDA2NDQNCi0tLSBhL3hlbi9hcmNoL3g4Ni9odm0v
dm1fZXZlbnQuYw0KKysrIGIveGVuL2FyY2gveDg2L2h2bS92bV9ldmVudC5jDQpAQCAtODcsNyAr
ODcsNyBAQCB2b2lkIGh2bV92bV9ldmVudF9kb19yZXN1bWUoc3RydWN0IHZjcHUgKnYpDQogICAg
ICAgICAgICAga2luZCA9IEVNVUxfS0lORF9TRVRfQ09OVEVYVF9JTlNOOw0KIA0KICAgICAgICAg
aHZtX2VtdWxhdGVfb25lX3ZtX2V2ZW50KGtpbmQsIFRSQVBfaW52YWxpZF9vcCwNCi0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBYODZfRVZFTlRfTk9fRUMpOw0KKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFg4Nl9FVkVOVF9OT19FQywgZmFsc2UpOw0KIA0KICAgICAg
ICAgdi0+YXJjaC52bV9ldmVudC0+ZW11bGF0ZV9mbGFncyA9IDA7DQogICAgIH0NCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92
dm14LmMNCmluZGV4IDdiY2E1NzJkODguLjA0YmU4Yjk4YjYgMTAwNjQ0DQotLS0gYS94ZW4vYXJj
aC94ODYvaHZtL3ZteC92dm14LmMNCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYw0K
QEAgLTQyNiw3ICs0MjYsNyBAQCBzdGF0aWMgaW50IGRlY29kZV92bXhfaW5zdChzdHJ1Y3QgY3B1
X3VzZXJfcmVncyAqcmVncywNCiAgICAgICAgIHsNCiAgICAgICAgICAgICBwYWdlZmF1bHRfaW5m
b190IHBmaW5mbzsNCiAgICAgICAgICAgICBpbnQgcmMgPSBodm1fY29weV9mcm9tX2d1ZXN0X2xp
bmVhcihwb3BlcmFuZFMsIGJhc2UsIHNpemUsDQotICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgMCwgJnBmaW5mbyk7DQorICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgMCwgJnBmaW5mbywgZmFsc2UpOw0KIA0KICAgICAg
ICAgICAgIGlmICggcmMgPT0gSFZNVFJBTlNfYmFkX2xpbmVhcl90b19nZm4gKQ0KICAgICAgICAg
ICAgICAgICBodm1faW5qZWN0X3BhZ2VfZmF1bHQocGZpbmZvLmVjLCBwZmluZm8ubGluZWFyKTsN
CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5jIGIveGVuL2FyY2gveDg2
L21tL21lbV9hY2Nlc3MuYw0KaW5kZXggMDE0NGY5MmI5OC4uYzk5NzJiYWI4YyAxMDA2NDQNCi0t
LSBhL3hlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMNCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS9t
ZW1fYWNjZXNzLmMNCkBAIC0yMTQsNyArMjE0LDggQEAgYm9vbCBwMm1fbWVtX2FjY2Vzc19jaGVj
ayhwYWRkcl90IGdwYSwgdW5zaWduZWQgbG9uZyBnbGEsDQogICAgICAgICAgZC0+YXJjaC5tb25p
dG9yLmluZ3Vlc3RfcGFnZWZhdWx0X2Rpc2FibGVkICYmDQogICAgICAgICAgbnBmZWMua2luZCAh
PSBucGZlY19raW5kX3dpdGhfZ2xhICkgLyogZG9uJ3Qgc2VuZCBhIG1lbV9ldmVudCAqLw0KICAg
ICB7DQotICAgICAgICBodm1fZW11bGF0ZV9vbmVfdm1fZXZlbnQoRU1VTF9LSU5EX05PUk1BTCwg
VFJBUF9pbnZhbGlkX29wLCBYODZfRVZFTlRfTk9fRUMpOw0KKyAgICAgICAgaHZtX2VtdWxhdGVf
b25lX3ZtX2V2ZW50KEVNVUxfS0lORF9OT1JNQUwsIFRSQVBfaW52YWxpZF9vcCwNCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBYODZfRVZFTlRfTk9fRUMsIHRydWUpOw0KIA0KICAg
ICAgICAgcmV0dXJuIHRydWU7DQogICAgIH0NCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0v
c2hhZG93L2NvbW1vbi5jIGIveGVuL2FyY2gveDg2L21tL3NoYWRvdy9jb21tb24uYw0KaW5kZXgg
Nzk1MjAxZGM4Mi4uMmJiODBhY2NmMCAxMDA2NDQNCi0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9zaGFk
b3cvY29tbW9uLmMNCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvY29tbW9uLmMNCkBAIC0x
NjYsNyArMTY2LDcgQEAgY29uc3Qgc3RydWN0IHg4Nl9lbXVsYXRlX29wcyAqc2hhZG93X2luaXRf
ZW11bGF0aW9uKA0KICAgICAgICAgICAgIGh2bV9hY2Nlc3NfaW5zbl9mZXRjaCwgc2hfY3R4dCwg
JmFkZHIpICYmDQogICAgICAgICAgIWh2bV9jb3B5X2Zyb21fZ3Vlc3RfbGluZWFyKA0KICAgICAg
ICAgICAgICBzaF9jdHh0LT5pbnNuX2J1ZiwgYWRkciwgc2l6ZW9mKHNoX2N0eHQtPmluc25fYnVm
KSwNCi0gICAgICAgICAgICAgUEZFQ19pbnNuX2ZldGNoLCBOVUxMKSkNCisgICAgICAgICAgICAg
UEZFQ19pbnNuX2ZldGNoLCBOVUxMLCBmYWxzZSkpDQogICAgICAgICA/IHNpemVvZihzaF9jdHh0
LT5pbnNuX2J1ZikgOiAwOw0KIA0KICAgICByZXR1cm4gJmh2bV9zaGFkb3dfZW11bGF0b3Jfb3Bz
Ow0KQEAgLTIwMSw3ICsyMDEsNyBAQCB2b2lkIHNoYWRvd19jb250aW51ZV9lbXVsYXRpb24oc3Ry
dWN0IHNoX2VtdWxhdGVfY3R4dCAqc2hfY3R4dCwNCiAgICAgICAgICAgICAgICAgaHZtX2FjY2Vz
c19pbnNuX2ZldGNoLCBzaF9jdHh0LCAmYWRkcikgJiYNCiAgICAgICAgICAgICAgIWh2bV9jb3B5
X2Zyb21fZ3Vlc3RfbGluZWFyKA0KICAgICAgICAgICAgICAgICAgc2hfY3R4dC0+aW5zbl9idWYs
IGFkZHIsIHNpemVvZihzaF9jdHh0LT5pbnNuX2J1ZiksDQotICAgICAgICAgICAgICAgICBQRkVD
X2luc25fZmV0Y2gsIE5VTEwpKQ0KKyAgICAgICAgICAgICAgICAgUEZFQ19pbnNuX2ZldGNoLCBO
VUxMLCBmYWxzZSkpDQogICAgICAgICAgICAgPyBzaXplb2Yoc2hfY3R4dC0+aW5zbl9idWYpIDog
MDsNCiAgICAgICAgIHNoX2N0eHQtPmluc25fYnVmX2VpcCA9IHJlZ3MtPnJpcDsNCiAgICAgfQ0K
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvaHZtLmMgYi94ZW4vYXJjaC94ODYv
bW0vc2hhZG93L2h2bS5jDQppbmRleCBjNjQ2OWM4NDZjLi4zODQxZDBjZWI3IDEwMDY0NA0KLS0t
IGEveGVuL2FyY2gveDg2L21tL3NoYWRvdy9odm0uYw0KKysrIGIveGVuL2FyY2gveDg2L21tL3No
YWRvdy9odm0uYw0KQEAgLTEyNSw3ICsxMjUsNyBAQCBodm1fcmVhZChlbnVtIHg4Nl9zZWdtZW50
IHNlZywNCiAgICAgcmMgPSBodm1fY29weV9mcm9tX2d1ZXN0X2xpbmVhcihwX2RhdGEsIGFkZHIs
IGJ5dGVzLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChhY2Nlc3NfdHlw
ZSA9PSBodm1fYWNjZXNzX2luc25fZmV0Y2gNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgPyBQRkVDX2luc25fZmV0Y2ggOiAwKSwNCi0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAmcGZpbmZvKTsNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAmcGZpbmZvLCBmYWxzZSk7DQogDQogICAgIHN3aXRjaCAoIHJjICkNCiAgICAgew0KZGlm
ZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2VtdWxhdGUuaCBiL3hlbi9pbmNsdWRl
L2FzbS14ODYvaHZtL2VtdWxhdGUuaA0KaW5kZXggYjM5YTFhMDMzMS4uOWJlZDBhYTgzZSAxMDA2
NDQNCi0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2VtdWxhdGUuaA0KKysrIGIveGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9odm0vZW11bGF0ZS5oDQpAQCAtNDcsNiArNDcsNyBAQCBzdHJ1Y3QgaHZt
X2VtdWxhdGVfY3R4dCB7DQogICAgIHVpbnQzMl90IGludHJfc2hhZG93Ow0KIA0KICAgICBib29s
X3Qgc2V0X2NvbnRleHQ7DQorICAgIGJvb2wgc2VuZF9ldmVudDsNCiB9Ow0KIA0KIGVudW0gZW11
bF9raW5kIHsNCkBAIC02Myw3ICs2NCw4IEBAIGludCBodm1fZW11bGF0ZV9vbmUoDQogICAgIHN0
cnVjdCBodm1fZW11bGF0ZV9jdHh0ICpodm1lbXVsX2N0eHQpOw0KIHZvaWQgaHZtX2VtdWxhdGVf
b25lX3ZtX2V2ZW50KGVudW0gZW11bF9raW5kIGtpbmQsDQogICAgIHVuc2lnbmVkIGludCB0cmFw
bnIsDQotICAgIHVuc2lnbmVkIGludCBlcnJjb2RlKTsNCisgICAgdW5zaWduZWQgaW50IGVycmNv
ZGUsDQorICAgIGJvb2wgc2VuZF9ldmVudCk7DQogLyogTXVzdCBiZSBjYWxsZWQgb25jZSB0byBz
ZXQgdXAgaHZtZW11bCBzdGF0ZS4gKi8NCiB2b2lkIGh2bV9lbXVsYXRlX2luaXRfb25jZSgNCiAg
ICAgc3RydWN0IGh2bV9lbXVsYXRlX2N0eHQgKmh2bWVtdWxfY3R4dCwNCkBAIC04MCw2ICs4Miwx
MSBAQCBzdHJ1Y3Qgc2VnbWVudF9yZWdpc3RlciAqaHZtZW11bF9nZXRfc2VnX3JlZygNCiAgICAg
ZW51bSB4ODZfc2VnbWVudCBzZWcsDQogICAgIHN0cnVjdCBodm1fZW11bGF0ZV9jdHh0ICpodm1l
bXVsX2N0eHQpOw0KIGludCBodm1fZW11bGF0ZV9vbmVfbW1pbyh1bnNpZ25lZCBsb25nIG1mbiwg
dW5zaWduZWQgbG9uZyBnbGEpOw0KK2Jvb2wgaHZtX2VtdWxhdGVfc2VuZF92bV9ldmVudCgNCisg
ICAgdW5zaWduZWQgbG9uZyBnbGEsDQorICAgIGdmbl90IGdmbiwNCisgICAgdWludDMyX3QgcGZl
YywNCisgICAgYm9vbCBzZW5kX2V2ZW50KTsNCiANCiBzdGF0aWMgaW5saW5lIGJvb2wgaGFuZGxl
X21taW8odm9pZCkNCiB7DQpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vc3Vw
cG9ydC5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vc3VwcG9ydC5oDQppbmRleCBlOTg5YWE3
MzQ5Li45MTRmMzg4OTIxIDEwMDY0NA0KLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vc3Vw
cG9ydC5oDQorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9zdXBwb3J0LmgNCkBAIC05OSw3
ICs5OSw3IEBAIGVudW0gaHZtX3RyYW5zbGF0aW9uX3Jlc3VsdCBodm1fY29weV90b19ndWVzdF9s
aW5lYXIoDQogICAgIHBhZ2VmYXVsdF9pbmZvX3QgKnBmaW5mbyk7DQogZW51bSBodm1fdHJhbnNs
YXRpb25fcmVzdWx0IGh2bV9jb3B5X2Zyb21fZ3Vlc3RfbGluZWFyKA0KICAgICB2b2lkICpidWYs
IHVuc2lnbmVkIGxvbmcgYWRkciwgaW50IHNpemUsIHVpbnQzMl90IHBmZWMsDQotICAgIHBhZ2Vm
YXVsdF9pbmZvX3QgKnBmaW5mbyk7DQorICAgIHBhZ2VmYXVsdF9pbmZvX3QgKnBmaW5mbywgYm9v
bCBzZW5kX2V2ZW50KTsNCiANCiAvKg0KICAqIEdldCBhIHJlZmVyZW5jZSBvbiB0aGUgcGFnZSB1
bmRlciBhbiBIVk0gcGh5c2ljYWwgb3IgbGluZWFyIGFkZHJlc3MuICBJZg0KLS0gDQoyLjE3LjEN
Cg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
