Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A51DC5BA7D
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 13:21:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hhuKo-0000Us-RB; Mon, 01 Jul 2019 11:18:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YZ94=U6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hhuKm-0000UM-Ts
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 11:18:56 +0000
X-Inumbo-ID: 02543ca8-9bf2-11e9-845d-ffa8aaba34e3
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 02543ca8-9bf2-11e9-845d-ffa8aaba34e3;
 Mon, 01 Jul 2019 11:18:53 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  1 Jul 2019 11:18:48 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 1 Jul 2019 11:17:41 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 1 Jul 2019 11:17:39 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3186.namprd18.prod.outlook.com (10.255.137.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Mon, 1 Jul 2019 11:17:35 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2008.020; Mon, 1 Jul 2019
 11:17:35 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v9 03/23] x86emul: prepare for AVX512F S/G insns
Thread-Index: AQHVL/6VoYYbZC5xR0iv2pB+lHETIg==
Date: Mon, 1 Jul 2019 11:17:34 +0000
Message-ID: <9e808d89-016f-ff94-6475-e5228e9bfcb6@suse.com>
References: <f69ca82f-e2db-e85e-ff98-2060a8dc28a5@suse.com>
In-Reply-To: <f69ca82f-e2db-e85e-ff98-2060a8dc28a5@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6P18901CA0016.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:4:16::26) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 554dc50a-e820-42bf-9d8f-08d6fe15b79d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3186; 
x-ms-traffictypediagnostic: BY5PR18MB3186:
x-microsoft-antispam-prvs: <BY5PR18MB31864036587F705314843489B3F90@BY5PR18MB3186.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00851CA28B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(366004)(39860400002)(376002)(396003)(136003)(189003)(199004)(2351001)(8676002)(186003)(102836004)(2906002)(54906003)(256004)(6512007)(14444005)(6916009)(71190400001)(2501003)(66946007)(6506007)(66476007)(66556008)(81156014)(3846002)(53936002)(52116002)(486006)(71200400001)(6116002)(80792005)(11346002)(305945005)(4326008)(81166006)(446003)(26005)(386003)(31696002)(73956011)(64756008)(66446008)(2616005)(36756003)(476003)(5640700003)(68736007)(5660300002)(6436002)(31686004)(86362001)(7736002)(66066001)(478600001)(72206003)(6486002)(99286004)(8936002)(14454004)(25786009)(316002)(76176011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3186;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: J/q+Eyxi9dUpmtqF67rjV7wpe3YMh5RHDOUNjepXX/PO+6TFCvlblTIsOr44tUVmSzCvgSfwBK5FuI5e30kHgnmlI/6LD1jLOJphbK0W10FVtREA8RSVBatPasLEADFa9DAgCC9WZ73eRjBe+ZU7YBfiKG9ueFzjx+Uq4+0etdWGWJVpB6b8t+Tr5MkxzE7p1sjNbkEfSJ6fEcQOC8AdW6OUwGKa84gjWcphXKLi9olfj/PCIufKEnGNWPO2khTZg8/yTAatX3w+0rVmUpOLXp74tKmAoIR3+kCBwLn0y2bMH6f/q/HyN/Sm41cxFzsWobAEXI3o2YO5JBDh1s2bZEtmvUPeb/6XOCVdMiUHd5vL4WcRWlSQHOgCpSsdGfl9Ac0LFKOIQNlr0Pw3fzRgB0+YDbKufmcE250v2pXBOXQ=
Content-ID: <0319E2035CE74341A4F216FE5789657C@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 554dc50a-e820-42bf-9d8f-08d6fe15b79d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2019 11:17:34.9980 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3186
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v9 03/23] x86emul: prepare for AVX512F S/G insns
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

VGhleSByZXF1aXJlIGdldHRpbmcgbW9kcm1fcmVnIGFuZCBzaWJfaW5kZXggc2V0IGNvcnJlY3Rs
eSBpbiB0aGUgRVZFWA0KY2FzZSwgdG8gYWNjb3VudCBmb3IgdGhlIGhpZ2ggMTYgW1hZWl1NTSBy
ZWdpc3RlcnMgd2hlbiB1c2VkIGFzDQphZGRyZXNzaW5nIGluZGV4IHJlZ2lzdGVyLiBFeHRlbmQg
dGhlIGFkanVzdG1lbnRzIHRvIG1vZHJtX3JtIGFzIHdlbGwsDQpzdWNoIHRoYXQgeDg2X2luc25f
bW9kcm0oKSB3b3VsZCBjb3JyZWN0bHkgcmVwb3J0IHJlZ2lzdGVyIG51bWJlcnMgKHRoaXMNCndh
cyBhIGxhdGVudCBpc3N1ZSBvbmx5IGFzIHdlIGRvbid0IGN1cnJlbnRseSBoYXZlIGNhbGxlcnMg
b2YgdGhhdA0KZnVuY3Rpb24gd2hpY2ggd291bGQgY2FyZSBhYm91dCBhbiBFVkVYIGNhc2UpLg0K
DQpUaGUgYWRqdXN0bWVudCBpbiB0dXJuIHJlcXVpcmVzIGRyb3BwaW5nIHRoZSBhc3NlcnRpb24g
ZnJvbSBkZWNvZGVfZ3ByKCkNCmFzIHdlbGwgYXMgcmUtaW50cm9kdWNpbmcgdGhlIGV4cGxpY2l0
IG1hc2tpbmcsIGFzIHdlIG5vdyBuZWVkIHRvDQphY3RpdmVseSBtYXNrIG9mZiB0aGUgaGlnaCBi
aXQgd2hlbiBhIEdQUiBpcyBtZWFudC4NCg0KX2RlY29kZV9ncHIoKSBpbnZvY2F0aW9ucyBhbHNv
IG5lZWQgc2xpZ2h0IGFkanVzdG1lbnRzLCB3aGVuIGludm9rZWQgaW4NCmdlbmVyaWMgY29kZSBh
aGVhZCBvZiB0aGUgbWFpbiBzd2l0Y2goKS4gQWxsIG90aGVyIHVzZXMgb2YgbW9kcm1fcmVnIGFu
ZA0KbW9kcm1fcm0gYWxyZWFkeSBnZXQgc3VpdGFibHkgbWFza2VkIHdoZXJlIG5lY2Vzc2FyeS4N
Cg0KU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KLS0tDQp2
OTogTmV3LCBzcGxpdCBmcm9tIG1haW4gZ2F0aGVyIHBhdGNoLg0KDQotLS0gYS94ZW4vYXJjaC94
ODYveDg2X2VtdWxhdGUveDg2X2VtdWxhdGUuYw0KKysrIGIveGVuL2FyY2gveDg2L3g4Nl9lbXVs
YXRlL3g4Nl9lbXVsYXRlLmMNCkBAIC0zMDIyLDcgKzMwMjIsOCBAQCB4ODZfZGVjb2RlKA0KICAN
CiAgICAgICAgICBkICY9IH5Nb2RSTTsNCiAgI3VuZGVmIE1vZFJNIC8qIE9ubHkgaXRzIGFsaWFz
ZXMgYXJlIHZhbGlkIHRvIHVzZSBmcm9tIGhlcmUgb24uICovDQotICAgICAgICBtb2RybV9yZWcg
PSAoKHJleF9wcmVmaXggJiA0KSA8PCAxKSB8ICgobW9kcm0gJiAweDM4KSA+PiAzKTsNCisgICAg
ICAgIG1vZHJtX3JlZyA9ICgocmV4X3ByZWZpeCAmIDQpIDw8IDEpIHwgKChtb2RybSAmIDB4Mzgp
ID4+IDMpIHwNCisgICAgICAgICAgICAgICAgICAgICgoZXZleF9lbmNvZGVkKCkgJiYgIWV2ZXgu
UikgPDwgNCk7DQogICAgICAgICAgbW9kcm1fcm0gID0gbW9kcm0gJiAweDA3Ow0KICANCiAgICAg
ICAgICAvKg0KQEAgLTMxOTIsNyArMzE5Myw4IEBAIHg4Nl9kZWNvZGUoDQogICAgICAgICAgaWYg
KCBtb2RybV9tb2QgPT0gMyApDQogICAgICAgICAgew0KICAgICAgICAgICAgICBnZW5lcmF0ZV9l
eGNlcHRpb25faWYoZCAmIHZTSUIsIEVYQ19VRCk7DQotICAgICAgICAgICAgbW9kcm1fcm0gfD0g
KHJleF9wcmVmaXggJiAxKSA8PCAzOw0KKyAgICAgICAgICAgIG1vZHJtX3JtIHw9ICgocmV4X3By
ZWZpeCAmIDEpIDw8IDMpIHwNCisgICAgICAgICAgICAgICAgICAgICAgICAoZXZleF9lbmNvZGVk
KCkgJiYgIWV2ZXgueCkgPDwgNDsNCiAgICAgICAgICAgICAgZWEudHlwZSA9IE9QX1JFRzsNCiAg
ICAgICAgICB9DQogICAgICAgICAgZWxzZSBpZiAoIGFkX2J5dGVzID09IDIgKQ0KQEAgLTMyNTcs
NyArMzI1OSwxMCBAQCB4ODZfZGVjb2RlKA0KICANCiAgICAgICAgICAgICAgICAgIHN0YXRlLT5z
aWJfaW5kZXggPSAoKHNpYiA+PiAzKSAmIDcpIHwgKChyZXhfcHJlZml4IDw8IDIpICYgOCk7DQog
ICAgICAgICAgICAgICAgICBzdGF0ZS0+c2liX3NjYWxlID0gKHNpYiA+PiA2KSAmIDM7DQotICAg
ICAgICAgICAgICAgIGlmICggc3RhdGUtPnNpYl9pbmRleCAhPSA0ICYmICEoZCAmIHZTSUIpICkN
CisgICAgICAgICAgICAgICAgaWYgKCB1bmxpa2VseShkICYgdlNJQikgKQ0KKyAgICAgICAgICAg
ICAgICAgICAgc3RhdGUtPnNpYl9pbmRleCB8PSAobW9kZV82NGJpdCgpICYmIGV2ZXhfZW5jb2Rl
ZCgpICYmDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAhZXZleC5S
WCkgPDwgNDsNCisgICAgICAgICAgICAgICAgZWxzZSBpZiAoIHN0YXRlLT5zaWJfaW5kZXggIT0g
NCApDQogICAgICAgICAgICAgICAgICB7DQogICAgICAgICAgICAgICAgICAgICAgZWEubWVtLm9m
ZiA9ICpkZWNvZGVfZ3ByKHN0YXRlLT5yZWdzLCBzdGF0ZS0+c2liX2luZGV4KTsNCiAgICAgICAg
ICAgICAgICAgICAgICBlYS5tZW0ub2ZmIDw8PSBzdGF0ZS0+c2liX3NjYWxlOw0KQEAgLTM1NjAs
NyArMzU2NSw3IEBAIHg4Nl9lbXVsYXRlKA0KICAgICAgZ2VuZXJhdGVfZXhjZXB0aW9uX2lmKHN0
YXRlLT5ub3RfNjRiaXQgJiYgbW9kZV82NGJpdCgpLCBFWENfVUQpOw0KICANCiAgICAgIGlmICgg
ZWEudHlwZSA9PSBPUF9SRUcgKQ0KLSAgICAgICAgZWEucmVnID0gX2RlY29kZV9ncHIoJl9yZWdz
LCBtb2RybV9ybSwgKGQgJiBCeXRlT3ApICYmICFyZXhfcHJlZml4KTsNCisgICAgICAgIGVhLnJl
ZyA9IF9kZWNvZGVfZ3ByKCZfcmVncywgbW9kcm1fcm0sIChkICYgQnl0ZU9wKSAmJiAhcmV4X3By
ZWZpeCAmJiAhdmV4Lm9wY3gpOw0KICANCiAgICAgIG1lbXNldChtbXZhbHAsIDB4YWEgLyogYXJi
aXRyYXJ5ICovLCBzaXplb2YoKm1tdmFscCkpOw0KICANCkBAIC0zNTc0LDcgKzM1NzksNyBAQCB4
ODZfZW11bGF0ZSgNCiAgICAgICAgICBzcmMudHlwZSA9IE9QX1JFRzsNCiAgICAgICAgICBpZiAo
IGQgJiBCeXRlT3AgKQ0KICAgICAgICAgIHsNCi0gICAgICAgICAgICBzcmMucmVnID0gX2RlY29k
ZV9ncHIoJl9yZWdzLCBtb2RybV9yZWcsICFyZXhfcHJlZml4KTsNCisgICAgICAgICAgICBzcmMu
cmVnID0gX2RlY29kZV9ncHIoJl9yZWdzLCBtb2RybV9yZWcsICFyZXhfcHJlZml4ICYmICF2ZXgu
b3BjeCk7DQogICAgICAgICAgICAgIHNyYy52YWwgPSAqKHVpbnQ4X3QgKilzcmMucmVnOw0KICAg
ICAgICAgICAgICBzcmMuYnl0ZXMgPSAxOw0KICAgICAgICAgIH0NCkBAIC0zNjgxLDcgKzM2ODYs
NyBAQCB4ODZfZW11bGF0ZSgNCiAgICAgICAgICBkc3QudHlwZSA9IE9QX1JFRzsNCiAgICAgICAg
ICBpZiAoIGQgJiBCeXRlT3AgKQ0KICAgICAgICAgIHsNCi0gICAgICAgICAgICBkc3QucmVnID0g
X2RlY29kZV9ncHIoJl9yZWdzLCBtb2RybV9yZWcsICFyZXhfcHJlZml4KTsNCisgICAgICAgICAg
ICBkc3QucmVnID0gX2RlY29kZV9ncHIoJl9yZWdzLCBtb2RybV9yZWcsICFyZXhfcHJlZml4ICYm
ICF2ZXgub3BjeCk7DQogICAgICAgICAgICAgIGRzdC52YWwgPSAqKHVpbnQ4X3QgKilkc3QucmVn
Ow0KICAgICAgICAgICAgICBkc3QuYnl0ZXMgPSAxOw0KICAgICAgICAgIH0NCi0tLSBhL3hlbi9h
cmNoL3g4Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5oDQorKysgYi94ZW4vYXJjaC94ODYveDg2
X2VtdWxhdGUveDg2X2VtdWxhdGUuaA0KQEAgLTY2Miw4ICs2NjIsNiBAQCBzdGF0aWMgaW5saW5l
IHVuc2lnbmVkIGxvbmcgKmRlY29kZV9ncHIoDQogICAgICBCVUlMRF9CVUdfT04oQVJSQVlfU0la
RShjcHVfdXNlcl9yZWdzX2dwcl9vZmZzZXRzKSAmDQogICAgICAgICAgICAgICAgICAgKEFSUkFZ
X1NJWkUoY3B1X3VzZXJfcmVnc19ncHJfb2Zmc2V0cykgLSAxKSk7DQogIA0KLSAgICBBU1NFUlQo
bW9kcm0gPCBBUlJBWV9TSVpFKGNwdV91c2VyX3JlZ3NfZ3ByX29mZnNldHMpKTsNCi0NCiAgICAg
IC8qIE5vdGUgdGhhdCB0aGlzIGFsc28gYWN0cyBhcyBhcnJheV9hY2Nlc3Nfbm9zcGVjKCkgc3Rh
bmQtaW4uICovDQogICAgICBtb2RybSAmPSBBUlJBWV9TSVpFKGNwdV91c2VyX3JlZ3NfZ3ByX29m
ZnNldHMpIC0gMTsNCiAgDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
