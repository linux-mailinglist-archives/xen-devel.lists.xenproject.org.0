Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 058905BA8E
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 13:26:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hhuP6-0001hj-5A; Mon, 01 Jul 2019 11:23:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YZ94=U6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hhuP5-0001hS-7R
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 11:23:23 +0000
X-Inumbo-ID: a19c22a7-9bf2-11e9-8980-bc764e045a96
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a19c22a7-9bf2-11e9-8980-bc764e045a96;
 Mon, 01 Jul 2019 11:23:21 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  1 Jul 2019 11:19:46 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 1 Jul 2019 11:21:10 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 1 Jul 2019 11:21:10 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3363.namprd18.prod.outlook.com (10.255.139.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.18; Mon, 1 Jul 2019 11:21:08 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2008.020; Mon, 1 Jul 2019
 11:21:08 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v9 09/23] x86emul: support AVX512CD insns
Thread-Index: AQHVL/8UtFdM7gHSZ0CfPRVBHC+jJg==
Date: Mon, 1 Jul 2019 11:21:08 +0000
Message-ID: <c1ee1ab3-b415-503b-f609-e0feb4c62a79@suse.com>
References: <f69ca82f-e2db-e85e-ff98-2060a8dc28a5@suse.com>
In-Reply-To: <f69ca82f-e2db-e85e-ff98-2060a8dc28a5@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0270.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::18) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: edc5eaf6-7896-44c6-9e05-08d6fe1636ca
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3363; 
x-ms-traffictypediagnostic: BY5PR18MB3363:
x-microsoft-antispam-prvs: <BY5PR18MB3363B9D16A386C3E71C759BEB3F90@BY5PR18MB3363.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 00851CA28B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(346002)(39860400002)(376002)(136003)(366004)(199004)(189003)(14444005)(25786009)(2616005)(5640700003)(6486002)(256004)(66066001)(6436002)(486006)(36756003)(72206003)(11346002)(476003)(446003)(2501003)(3846002)(6116002)(66946007)(386003)(76176011)(52116002)(81156014)(8676002)(14454004)(8936002)(71190400001)(80792005)(2906002)(81166006)(305945005)(99286004)(31696002)(7736002)(102836004)(26005)(186003)(6506007)(86362001)(54906003)(478600001)(4326008)(316002)(66476007)(5660300002)(64756008)(66446008)(68736007)(73956011)(6512007)(71200400001)(31686004)(6916009)(53936002)(66556008)(2351001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3363;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VsVq+a7vgwpGrJ/IOSwnrPzK/+9f9vvjFI+t97YJqRwv17rFYRXbCam+HgYCeDPOpURzWRmz6g2XtZj17vz/UZUg/PmJhNDpz6ryl6E3G0qpHVVVWAzrcWDo/pPNaAmslvJoMAlhBlNFaNJWk3GHmZf7utC4zRSlJurzkyDDv+zAvr6QEtvZrrUuCaF1UsXfyFq1YjEFTjArvM5tGXZ0xClSx2mh0YNSd6RburV58ljmhq8b6nS1AEm+nWUQEpqGTYgcRdxyHjQO9sS730J6vK6sJSUI24m2qYvmzUkoLt9S+n8eTrWOOO6qxc3MXwMzi2pYtrspZmMvL6M90tZMQB3Uc7d/4sAj67MoD9OlgvIt4mGrPU9xsq5Ia51AnUPZ7TPVavPd/y6u+L4+LJnHcX/wQyF0dgXpo9DGwbgznK8=
Content-ID: <154BD2540347724DA318503A6EC9BFDB@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: edc5eaf6-7896-44c6-9e05-08d6fe1636ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2019 11:21:08.5685 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3363
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v9 09/23] x86emul: support AVX512CD insns
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 RogerPau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2luY2UgdGhlIGluc25zIGhlcmUgYW5kIGluIHBhcnRpY3VsYXIgdGhlaXIgbWVtb3J5IGFjY2Vz
cyBwYXR0ZXJucw0KZm9sbG93IHRoZSB1c3VhbCBzY2hlbWUgSSBkaWRuJ3QgdGhpbmsgaXQgd2Fz
IG5lY2Vzc2FyeSB0byBhZGQNCmNvbnRyaXZlZCB0ZXN0cyBzcGVjaWZpY2FsbHkgZm9yIHRoZW0s
IGJleW9uZCB0aGUgRGlzcDggc2NhbGluZyBvbmVzLg0KDQpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQpBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4NCi0tLQ0Kdjk6IFJlLWJhc2UuDQp2NjogTmV3Lg0KDQotLS0g
YS90b29scy90ZXN0cy94ODZfZW11bGF0b3IvZXZleC1kaXNwOC5jDQorKysgYi90b29scy90ZXN0
cy94ODZfZW11bGF0b3IvZXZleC1kaXNwOC5jDQpAQCAtNDU4LDYgKzQ1OCwxMyBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IHRlc3QgYXZ4NTEyYndfMTI4W10NCiAgICAgIElOU04ocGluc3J3LCA2Niwg
ICAwZiwgYzQsIGVsLCB3LCBlbCksDQogIH07DQogIA0KK3N0YXRpYyBjb25zdCBzdHJ1Y3QgdGVz
dCBhdng1MTJjZF9hbGxbXSA9IHsNCisvLyAgICAgICBwYnJvYWRjYXN0bWIycSwgZjMsIDBmMzgs
IDJhLCAgICAgIHENCisvLyAgICAgICBwYnJvYWRjYXN0bXcyZCwgZjMsIDBmMzgsIDNhLCAgICAg
IGQNCisgICAgSU5TTihwY29uZmxpY3QsICAgICAgNjYsIDBmMzgsIGM0LCB2bCwgZHEsIHZsKSwN
CisgICAgSU5TTihwbHpjbnQsICAgICAgICAgNjYsIDBmMzgsIDQ0LCB2bCwgZHEsIHZsKSwNCit9
Ow0KKw0KICBzdGF0aWMgY29uc3Qgc3RydWN0IHRlc3QgYXZ4NTEyZHFfYWxsW10gPSB7DQogICAg
ICBJTlNOX1BGUChhbmQsICAgICAgICAgICAgICAwZiwgNTQpLA0KICAgICAgSU5TTl9QRlAoYW5k
biwgICAgICAgICAgICAgMGYsIDU1KSwNCkBAIC05MDMsNiArOTEwLDcgQEAgdm9pZCBldmV4X2Rp
c3A4X3Rlc3Qodm9pZCAqaW5zdHIsIHN0cnVjdA0KICAgICAgUlVOKGF2eDUxMmYsIDUxMik7DQog
ICAgICBSVU4oYXZ4NTEyYncsIGFsbCk7DQogICAgICBSVU4oYXZ4NTEyYncsIDEyOCk7DQorICAg
IFJVTihhdng1MTJjZCwgYWxsKTsNCiAgICAgIFJVTihhdng1MTJkcSwgYWxsKTsNCiAgICAgIFJV
Tihhdng1MTJkcSwgMTI4KTsNCiAgICAgIFJVTihhdng1MTJkcSwgbm8xMjgpOw0KLS0tIGEvdG9v
bHMvdGVzdHMveDg2X2VtdWxhdG9yL3g4Ni1lbXVsYXRlLmgNCisrKyBiL3Rvb2xzL3Rlc3RzL3g4
Nl9lbXVsYXRvci94ODYtZW11bGF0ZS5oDQpAQCAtMTM4LDYgKzEzOCw3IEBAIHN0YXRpYyBpbmxp
bmUgYm9vbCB4Y3IwX21hc2sodWludDY0X3QgbWENCiAgI2RlZmluZSBjcHVfaGFzX2F2eDUxMmYg
ICAoY3AuZmVhdC5hdng1MTJmICAmJiB4Y3IwX21hc2soMHhlNikpDQogICNkZWZpbmUgY3B1X2hh
c19hdng1MTJkcSAgKGNwLmZlYXQuYXZ4NTEyZHEgJiYgeGNyMF9tYXNrKDB4ZTYpKQ0KICAjZGVm
aW5lIGNwdV9oYXNfYXZ4NTEyZXIgIChjcC5mZWF0LmF2eDUxMmVyICYmIHhjcjBfbWFzaygweGU2
KSkNCisjZGVmaW5lIGNwdV9oYXNfYXZ4NTEyY2QgIChjcC5mZWF0LmF2eDUxMmNkICYmIHhjcjBf
bWFzaygweGU2KSkNCiAgI2RlZmluZSBjcHVfaGFzX2F2eDUxMmJ3ICAoY3AuZmVhdC5hdng1MTJi
dyAmJiB4Y3IwX21hc2soMHhlNikpDQogICNkZWZpbmUgY3B1X2hhc19hdng1MTJ2bCAgKGNwLmZl
YXQuYXZ4NTEydmwgJiYgeGNyMF9tYXNrKDB4ZTYpKQ0KICAjZGVmaW5lIGNwdV9oYXNfYXZ4NTEy
X3ZibWkgKGNwLmZlYXQuYXZ4NTEyX3ZibWkgJiYgeGNyMF9tYXNrKDB4ZTYpKQ0KLS0tIGEveGVu
L2FyY2gveDg2L3g4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMNCisrKyBiL3hlbi9hcmNoL3g4Ni94
ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5jDQpAQCAtNDczLDYgKzQ3Myw3IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgZXh0MGYzOF90YWJsZSB7DQogICAgICBbMHg0MV0gPSB7IC5zaW1kX3NpemUgPSBz
aW1kX3BhY2tlZF9pbnQsIC50d29fb3AgPSAxIH0sDQogICAgICBbMHg0Ml0gPSB7IC5zaW1kX3Np
emUgPSBzaW1kX3BhY2tlZF9mcCwgLnR3b19vcCA9IDEsIC5kOHMgPSBkOHNfdmwgfSwNCiAgICAg
IFsweDQzXSA9IHsgLnNpbWRfc2l6ZSA9IHNpbWRfc2NhbGFyX3ZleHcsIC5kOHMgPSBkOHNfZHEg
fSwNCisgICAgWzB4NDRdID0geyAuc2ltZF9zaXplID0gc2ltZF9wYWNrZWRfaW50LCAudHdvX29w
ID0gMSwgLmQ4cyA9IGQ4c192bCB9LA0KICAgICAgWzB4NDUgLi4uIDB4NDddID0geyAuc2ltZF9z
aXplID0gc2ltZF9wYWNrZWRfaW50LCAuZDhzID0gZDhzX3ZsIH0sDQogICAgICBbMHg0Y10gPSB7
IC5zaW1kX3NpemUgPSBzaW1kX3BhY2tlZF9mcCwgLnR3b19vcCA9IDEsIC5kOHMgPSBkOHNfdmwg
fSwNCiAgICAgIFsweDRkXSA9IHsgLnNpbWRfc2l6ZSA9IHNpbWRfc2NhbGFyX3ZleHcsIC5kOHMg
PSBkOHNfZHEgfSwNCkBAIC01MjUsNiArNTI2LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBleHQw
ZjM4X3RhYmxlIHsNCiAgICAgIFsweGJkXSA9IHsgLnNpbWRfc2l6ZSA9IHNpbWRfc2NhbGFyX3Zl
eHcsIC5kOHMgPSBkOHNfZHEgfSwNCiAgICAgIFsweGJlXSA9IHsgLnNpbWRfc2l6ZSA9IHNpbWRf
cGFja2VkX2ZwLCAuZDhzID0gZDhzX3ZsIH0sDQogICAgICBbMHhiZl0gPSB7IC5zaW1kX3NpemUg
PSBzaW1kX3NjYWxhcl92ZXh3LCAuZDhzID0gZDhzX2RxIH0sDQorICAgIFsweGM0XSA9IHsgLnNp
bWRfc2l6ZSA9IHNpbWRfcGFja2VkX2ludCwgLnR3b19vcCA9IDEsIC5kOHMgPSBkOHNfdmwgfSwN
CiAgICAgIFsweGM2IC4uLiAweGM3XSA9IHsgLnNpbWRfc2l6ZSA9IHNpbWRfb3RoZXIsIC52c2li
ID0gMSwgLmQ4cyA9IGQ4c19kcSB9LA0KICAgICAgWzB4YzhdID0geyAuc2ltZF9zaXplID0gc2lt
ZF9wYWNrZWRfZnAsIC50d29fb3AgPSAxLCAuZDhzID0gZDhzX3ZsIH0sDQogICAgICBbMHhjOV0g
PSB7IC5zaW1kX3NpemUgPSBzaW1kX290aGVyIH0sDQpAQCAtMTg3NCw2ICsxODc2LDcgQEAgaW5f
cHJvdG1vZGUoDQogICNkZWZpbmUgdmNwdV9oYXNfY2x3YigpICAgICAgICAoY3R4dC0+Y3B1aWQt
PmZlYXQuY2x3YikNCiAgI2RlZmluZSB2Y3B1X2hhc19hdng1MTJwZigpICAgIChjdHh0LT5jcHVp
ZC0+ZmVhdC5hdng1MTJwZikNCiAgI2RlZmluZSB2Y3B1X2hhc19hdng1MTJlcigpICAgIChjdHh0
LT5jcHVpZC0+ZmVhdC5hdng1MTJlcikNCisjZGVmaW5lIHZjcHVfaGFzX2F2eDUxMmNkKCkgICAg
KGN0eHQtPmNwdWlkLT5mZWF0LmF2eDUxMmNkKQ0KICAjZGVmaW5lIHZjcHVfaGFzX3NoYSgpICAg
ICAgICAgKGN0eHQtPmNwdWlkLT5mZWF0LnNoYSkNCiAgI2RlZmluZSB2Y3B1X2hhc19hdng1MTJi
dygpICAgIChjdHh0LT5jcHVpZC0+ZmVhdC5hdng1MTJidykNCiAgI2RlZmluZSB2Y3B1X2hhc19h
dng1MTJ2bCgpICAgIChjdHh0LT5jcHVpZC0+ZmVhdC5hdng1MTJ2bCkNCkBAIC04NzkyLDYgKzg3
OTUsMjAgQEAgeDg2X2VtdWxhdGUoDQogICAgICAgICAgZXZleC5vcGN4ID0gdmV4XzBmOw0KICAg
ICAgICAgIGdvdG8gdm1vdmRxYTsNCiAgDQorICAgIGNhc2UgWDg2RU1VTF9PUENfRVZFWF9GMygw
eDBmMzgsIDB4MmEpOiAvKiB2cGJyb2FkY2FzdG1iMnEgayxbeHl6XW1tICovDQorICAgIGNhc2Ug
WDg2RU1VTF9PUENfRVZFWF9GMygweDBmMzgsIDB4M2EpOiAvKiB2cGJyb2FkY2FzdG13MmQgayxb
eHl6XW1tICovDQorICAgICAgICBnZW5lcmF0ZV9leGNlcHRpb25faWYoKGVhLnR5cGUgIT0gT1Bf
UkVHIHx8IGV2ZXgub3Btc2sgfHwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZXZl
eC53ID09ICgoYiA+PiA0KSAmIDEpKSwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBF
WENfVUQpOw0KKyAgICAgICAgZCB8PSBUd29PcDsNCisgICAgICAgIC8qIGZhbGwgdGhyb3VnaCAq
Lw0KKyAgICBjYXNlIFg4NkVNVUxfT1BDX0VWRVhfNjYoMHgwZjM4LCAweGM0KTogLyogdnBjb25m
bGljdHtkLHF9IFt4eXpdbW0vbWVtLFt4eXpdbW17a30gKi8NCisgICAgICAgIGZhdWx0X3N1cHBy
ZXNzaW9uID0gZmFsc2U7DQorICAgICAgICAvKiBmYWxsIHRocm91Z2ggKi8NCisgICAgY2FzZSBY
ODZFTVVMX09QQ19FVkVYXzY2KDB4MGYzOCwgMHg0NCk6IC8qIHZwbHpjbnR7ZCxxfSBbeHl6XW1t
L21lbSxbeHl6XW1te2t9ICovDQorICAgICAgICBob3N0X2FuZF92Y3B1X211c3RfaGF2ZShhdng1
MTJjZCk7DQorICAgICAgICBnb3RvIGF2eDUxMmZfbm9fc2FlOw0KKw0KICAgICAgY2FzZSBYODZF
TVVMX09QQ19WRVhfNjYoMHgwZjM4LCAweDJjKTogLyogdm1hc2ttb3ZwcyBtZW0se3gseX1tbSx7
eCx5fW1tICovDQogICAgICBjYXNlIFg4NkVNVUxfT1BDX1ZFWF82NigweDBmMzgsIDB4MmQpOiAv
KiB2bWFza21vdnBkIG1lbSx7eCx5fW1tLHt4LHl9bW0gKi8NCiAgICAgIGNhc2UgWDg2RU1VTF9P
UENfVkVYXzY2KDB4MGYzOCwgMHgyZSk6IC8qIHZtYXNrbW92cHMge3gseX1tbSx7eCx5fW1tLG1l
bSAqLw0KLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9jcHVmZWF0dXJlLmgNCisrKyBiL3hlbi9p
bmNsdWRlL2FzbS14ODYvY3B1ZmVhdHVyZS5oDQpAQCAtMTAyLDYgKzEwMiw3IEBADQogICNkZWZp
bmUgY3B1X2hhc19yZHNlZWQgICAgICAgICAgYm9vdF9jcHVfaGFzKFg4Nl9GRUFUVVJFX1JEU0VF
RCkNCiAgI2RlZmluZSBjcHVfaGFzX3NtYXAgICAgICAgICAgICBib290X2NwdV9oYXMoWDg2X0ZF
QVRVUkVfU01BUCkNCiAgI2RlZmluZSBjcHVfaGFzX2F2eDUxMmVyICAgICAgICBib290X2NwdV9o
YXMoWDg2X0ZFQVRVUkVfQVZYNTEyRVIpDQorI2RlZmluZSBjcHVfaGFzX2F2eDUxMmNkICAgICAg
ICBib290X2NwdV9oYXMoWDg2X0ZFQVRVUkVfQVZYNTEyQ0QpDQogICNkZWZpbmUgY3B1X2hhc19z
aGEgICAgICAgICAgICAgYm9vdF9jcHVfaGFzKFg4Nl9GRUFUVVJFX1NIQSkNCiAgI2RlZmluZSBj
cHVfaGFzX2F2eDUxMmJ3ICAgICAgICBib290X2NwdV9oYXMoWDg2X0ZFQVRVUkVfQVZYNTEyQlcp
DQogICNkZWZpbmUgY3B1X2hhc19hdng1MTJ2bCAgICAgICAgYm9vdF9jcHVfaGFzKFg4Nl9GRUFU
VVJFX0FWWDUxMlZMKQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
