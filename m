Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9E55BAB6
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 13:31:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hhuU6-0002qF-Eq; Mon, 01 Jul 2019 11:28:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YZ94=U6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hhuU4-0002q5-WA
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 11:28:33 +0000
X-Inumbo-ID: 063c9648-9bf3-11e9-8177-67e3e774c0c8
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 063c9648-9bf3-11e9-8177-67e3e774c0c8;
 Mon, 01 Jul 2019 11:28:31 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  1 Jul 2019 11:26:04 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 1 Jul 2019 11:24:15 +0000
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 1 Jul 2019 11:24:15 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3299.namprd18.prod.outlook.com (10.255.138.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.18; Mon, 1 Jul 2019 11:24:14 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2008.020; Mon, 1 Jul 2019
 11:24:14 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v9 15/23] x86emul: support AVX512_4VNNIW insns
Thread-Index: AQHVL/+D8Osp4JfG2U6ZXkuQ/whzHA==
Date: Mon, 1 Jul 2019 11:24:14 +0000
Message-ID: <621d4542-3947-168c-4656-ec8158bad271@suse.com>
References: <f69ca82f-e2db-e85e-ff98-2060a8dc28a5@suse.com>
In-Reply-To: <f69ca82f-e2db-e85e-ff98-2060a8dc28a5@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6P189CA0022.EURP189.PROD.OUTLOOK.COM (2603:10a6:6:2e::35)
 To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cbc12cdb-dc41-4154-8272-08d6fe16a58f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3299; 
x-ms-traffictypediagnostic: BY5PR18MB3299:
x-microsoft-antispam-prvs: <BY5PR18MB32994CA9D6C0354E33ED8992B3F90@BY5PR18MB3299.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 00851CA28B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(136003)(396003)(366004)(376002)(39860400002)(189003)(199004)(6916009)(478600001)(5660300002)(256004)(14444005)(76176011)(486006)(7736002)(80792005)(8676002)(4326008)(2501003)(66556008)(64756008)(66946007)(2906002)(66476007)(71190400001)(8936002)(71200400001)(66446008)(25786009)(73956011)(3846002)(446003)(68736007)(36756003)(81166006)(81156014)(66066001)(14454004)(6116002)(31686004)(11346002)(99286004)(305945005)(86362001)(31696002)(6436002)(386003)(6506007)(53936002)(102836004)(2616005)(54906003)(52116002)(6512007)(72206003)(316002)(476003)(186003)(6486002)(5640700003)(26005)(2351001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3299;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ohvp6T8afFiQOOjdqnfXVNiSjKHfMoVYQe19Gq9UCd2Us2WWHLUevRhTKtgs3NtutkNTYlOEtjFuXtXrxTdMgoieT/MpA2qKWU8auUXuaStdQieBJrzsxB2mSekS5KlZPxE3Qr8C7XYWFCGtA9D6KPCTrBeE931TTOOTgxNO9IXYNIiZT923cbB4JwnrevsVnXFhUFCFIE2/m4UC06TyeKJ8OGO0HxLmXE9+mjmuzDTNchlCCnNrc3bGqpTzCxqXcmft6LfahlAqTAMQ5taAaLKBmOpWLVmc4RIKMVQmgUEryWnR7aOtlhixL3SSdQOe6fRvEx3mysOlVjxESfum0t1T2fVbLGJFJof7+N9gCHQec/9+Cuk8xzc1eOCQLmFqKbCyVbFvRtCqA8/GN9xzfV6+9QpmbYa37mVSDKiPgU0=
Content-ID: <F25B561A5957944D9816BE653593EBF6@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: cbc12cdb-dc41-4154-8272-08d6fe16a58f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2019 11:24:14.2243 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3299
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v9 15/23] x86emul: support AVX512_4VNNIW insns
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

QXMgaW4gYSBmZXcgY2FzZXMgYmVmb3JlLCBzaW5jZSB0aGUgaW5zbnMgaGVyZSBhbmQgaW4gcGFy
dGljdWxhciB0aGVpcg0KbWVtb3J5IGFjY2VzcyBwYXR0ZXJucyBmb2xsb3cgdGhlIEFWWDUxMl80
Rk1BUFMgc2NoZW1lLCBJIGRpZG4ndCB0aGluaw0KaXQgd2FzIG5lY2Vzc2FyeSB0byBhZGQgY29u
dHJpdmVkIHRlc3RzIHNwZWNpZmljYWxseSBmb3IgdGhlbSwgYmV5b25kDQp0aGUgRGlzcDggc2Nh
bGluZyBvbmVzLg0KDQpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+DQpBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4N
Ci0tLQ0Kdjk6IFJlLWJhc2UuDQp2ODogQ29ycmVjdCB2Y3B1X2hhc18qKCkgaW5zZXJ0aW9uIHBv
aW50Lg0Kdjc6IFJlLWJhc2UuDQp2NjogTmV3Lg0KDQotLS0gYS90b29scy90ZXN0cy94ODZfZW11
bGF0b3IvZXZleC1kaXNwOC5jDQorKysgYi90b29scy90ZXN0cy94ODZfZW11bGF0b3IvZXZleC1k
aXNwOC5jDQpAQCAtNTQ1LDYgKzU0NSwxMSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHRlc3QgYXZ4
NTEyXzRmbWFwc181DQogICAgICBJTlNOKDRmbm1hZGRzcywgZjIsIDBmMzgsIGFiLCBlbF80LCBk
LCB2bCksDQogIH07DQogIA0KK3N0YXRpYyBjb25zdCBzdHJ1Y3QgdGVzdCBhdng1MTJfNHZubml3
XzUxMltdID0gew0KKyAgICBJTlNOKHA0ZHB3c3NkLCAgZjIsIDBmMzgsIDUyLCBlbF80LCBkLCB2
bCksDQorICAgIElOU04ocDRkcHdzc2RzLCBmMiwgMGYzOCwgNTMsIGVsXzQsIGQsIHZsKSwNCit9
Ow0KKw0KICBzdGF0aWMgY29uc3Qgc3RydWN0IHRlc3QgYXZ4NTEyX2JpdGFsZ19hbGxbXSA9IHsN
CiAgICAgIElOU04ocG9wY250LCAgICAgIDY2LCAwZjM4LCA1NCwgdmwsIGJ3LCB2bCksDQogICAg
ICBJTlNOKHBzaHVmYml0cW1iLCA2NiwgMGYzOCwgOGYsIHZsLCAgYiwgdmwpLA0KQEAgLTk0OSw2
ICs5NTQsNyBAQCB2b2lkIGV2ZXhfZGlzcDhfdGVzdCh2b2lkICppbnN0ciwgc3RydWN0DQogICNk
ZWZpbmUgY3B1X2hhc19hdng1MTJwZiBjcHVfaGFzX2F2eDUxMmYNCiAgICAgIFJVTihhdng1MTJw
ZiwgNTEyKTsNCiAgICAgIFJVTihhdng1MTJfNGZtYXBzLCA1MTIpOw0KKyAgICBSVU4oYXZ4NTEy
XzR2bm5pdywgNTEyKTsNCiAgICAgIFJVTihhdng1MTJfYml0YWxnLCBhbGwpOw0KICAgICAgUlVO
KGF2eDUxMl9pZm1hLCBhbGwpOw0KICAgICAgUlVOKGF2eDUxMl92Ym1pLCBhbGwpOw0KLS0tIGEv
dG9vbHMvdGVzdHMveDg2X2VtdWxhdG9yL3g4Ni1lbXVsYXRlLmgNCisrKyBiL3Rvb2xzL3Rlc3Rz
L3g4Nl9lbXVsYXRvci94ODYtZW11bGF0ZS5oDQpAQCAtMTQ2LDYgKzE0Niw3IEBAIHN0YXRpYyBp
bmxpbmUgYm9vbCB4Y3IwX21hc2sodWludDY0X3QgbWENCiAgI2RlZmluZSBjcHVfaGFzX2F2eDUx
Ml92Ym1pMiAoY3AuZmVhdC5hdng1MTJfdmJtaTIgJiYgeGNyMF9tYXNrKDB4ZTYpKQ0KICAjZGVm
aW5lIGNwdV9oYXNfYXZ4NTEyX2JpdGFsZyAoY3AuZmVhdC5hdng1MTJfYml0YWxnICYmIHhjcjBf
bWFzaygweGU2KSkNCiAgI2RlZmluZSBjcHVfaGFzX2F2eDUxMl92cG9wY250ZHEgKGNwLmZlYXQu
YXZ4NTEyX3Zwb3BjbnRkcSAmJiB4Y3IwX21hc2soMHhlNikpDQorI2RlZmluZSBjcHVfaGFzX2F2
eDUxMl80dm5uaXcgKGNwLmZlYXQuYXZ4NTEyXzR2bm5pdyAmJiB4Y3IwX21hc2soMHhlNikpDQog
ICNkZWZpbmUgY3B1X2hhc19hdng1MTJfNGZtYXBzIChjcC5mZWF0LmF2eDUxMl80Zm1hcHMgJiYg
eGNyMF9tYXNrKDB4ZTYpKQ0KICANCiAgI2RlZmluZSBjcHVfaGFzX3hnZXRidjEgICAoY3B1X2hh
c194c2F2ZSAmJiBjcC54c3RhdGUueGdldGJ2MSkNCi0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfZW11
bGF0ZS94ODZfZW11bGF0ZS5jDQorKysgYi94ZW4vYXJjaC94ODYveDg2X2VtdWxhdGUveDg2X2Vt
dWxhdGUuYw0KQEAgLTQ3OSw2ICs0NzksNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGV4dDBmMzhf
dGFibGUgew0KICAgICAgWzB4NGRdID0geyAuc2ltZF9zaXplID0gc2ltZF9zY2FsYXJfdmV4dywg
LmQ4cyA9IGQ4c19kcSB9LA0KICAgICAgWzB4NGVdID0geyAuc2ltZF9zaXplID0gc2ltZF9wYWNr
ZWRfZnAsIC50d29fb3AgPSAxLCAuZDhzID0gZDhzX3ZsIH0sDQogICAgICBbMHg0Zl0gPSB7IC5z
aW1kX3NpemUgPSBzaW1kX3NjYWxhcl92ZXh3LCAuZDhzID0gZDhzX2RxIH0sDQorICAgIFsweDUy
IC4uLiAweDUzXSA9IHsgLnNpbWRfc2l6ZSA9IHNpbWRfMTI4LCAuZDhzID0gNCB9LA0KICAgICAg
WzB4NTQgLi4uIDB4NTVdID0geyAuc2ltZF9zaXplID0gc2ltZF9wYWNrZWRfaW50LCAudHdvX29w
ID0gMSwgLmQ4cyA9IGQ4c192bCB9LA0KICAgICAgWzB4NThdID0geyAuc2ltZF9zaXplID0gc2lt
ZF9vdGhlciwgLnR3b19vcCA9IDEsIC5kOHMgPSAyIH0sDQogICAgICBbMHg1OV0gPSB7IC5zaW1k
X3NpemUgPSBzaW1kX290aGVyLCAudHdvX29wID0gMSwgLmQ4cyA9IDMgfSwNCkBAIC0xODkyLDYg
KzE4OTMsNyBAQCBpbl9wcm90bW9kZSgNCiAgI2RlZmluZSB2Y3B1X2hhc19hdng1MTJfYml0YWxn
KCkgKGN0eHQtPmNwdWlkLT5mZWF0LmF2eDUxMl9iaXRhbGcpDQogICNkZWZpbmUgdmNwdV9oYXNf
YXZ4NTEyX3Zwb3BjbnRkcSgpIChjdHh0LT5jcHVpZC0+ZmVhdC5hdng1MTJfdnBvcGNudGRxKQ0K
ICAjZGVmaW5lIHZjcHVfaGFzX3JkcGlkKCkgICAgICAgKGN0eHQtPmNwdWlkLT5mZWF0LnJkcGlk
KQ0KKyNkZWZpbmUgdmNwdV9oYXNfYXZ4NTEyXzR2bm5pdygpIChjdHh0LT5jcHVpZC0+ZmVhdC5h
dng1MTJfNHZubml3KQ0KICAjZGVmaW5lIHZjcHVfaGFzX2F2eDUxMl80Zm1hcHMoKSAoY3R4dC0+
Y3B1aWQtPmZlYXQuYXZ4NTEyXzRmbWFwcykNCiAgDQogICNkZWZpbmUgdmNwdV9tdXN0X2hhdmUo
ZmVhdCkgXA0KQEAgLTg5MjAsNiArODkyMiwxNSBAQCB4ODZfZW11bGF0ZSgNCiAgICAgICAgICBn
ZW5lcmF0ZV9leGNlcHRpb25faWYodmV4LmwsIEVYQ19VRCk7DQogICAgICAgICAgZ290byBzaW1k
XzBmX2F2eDsNCiAgDQorICAgIGNhc2UgWDg2RU1VTF9PUENfRVZFWF9GMigweDBmMzgsIDB4NTIp
OiAvKiB2cDRkcHdzc2QgbTEyOCx6bW0rMyx6bW17a30gKi8NCisgICAgY2FzZSBYODZFTVVMX09Q
Q19FVkVYX0YyKDB4MGYzOCwgMHg1Myk6IC8qIHZwNGRwd3NzZHMgbTEyOCx6bW0rMyx6bW17a30g
Ki8NCisgICAgICAgIGhvc3RfYW5kX3ZjcHVfbXVzdF9oYXZlKGF2eDUxMl80dm5uaXcpOw0KKyAg
ICAgICAgZ2VuZXJhdGVfZXhjZXB0aW9uX2lmKChlYS50eXBlICE9IE9QX01FTSB8fCBldmV4Lncg
fHwgZXZleC5icnMgfHwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZXZleC5sciAh
PSAyKSwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBFWENfVUQpOw0KKyAgICAgICAg
b3BfbWFzayA9IG9wX21hc2sgJiAweGZmZmYgPyAweGYgOiAwOw0KKyAgICAgICAgZ290byBzaW1k
X3ptbTsNCisNCiAgICAgIGNhc2UgWDg2RU1VTF9PUENfRVZFWF82NigweDBmMzgsIDB4OGYpOiAv
KiB2cHNodWZiaXRxbWIgW3h5el1tbS9tZW0sW3h5el1tbSxre2t9ICovDQogICAgICAgICAgZ2Vu
ZXJhdGVfZXhjZXB0aW9uX2lmKGV2ZXgudyB8fCAhZXZleC5yIHx8ICFldmV4LlIgfHwgZXZleC56
LCBFWENfVUQpOw0KICAgICAgICAgIC8qIGZhbGwgdGhyb3VnaCAqLw0KLS0tIGEveGVuL2luY2x1
ZGUvYXNtLXg4Ni9jcHVmZWF0dXJlLmgNCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvY3B1ZmVh
dHVyZS5oDQpAQCAtMTE5LDYgKzExOSw3IEBADQogICNkZWZpbmUgY3B1X2hhc19pdHNjICAgICAg
ICAgICAgYm9vdF9jcHVfaGFzKFg4Nl9GRUFUVVJFX0lUU0MpDQogIA0KICAvKiBDUFVJRCBsZXZl
bCAweDAwMDAwMDA3OjAuZWR4ICovDQorI2RlZmluZSBjcHVfaGFzX2F2eDUxMl80dm5uaXcgICBi
b290X2NwdV9oYXMoWDg2X0ZFQVRVUkVfQVZYNTEyXzRWTk5JVykNCiAgI2RlZmluZSBjcHVfaGFz
X2F2eDUxMl80Zm1hcHMgICBib290X2NwdV9oYXMoWDg2X0ZFQVRVUkVfQVZYNTEyXzRGTUFQUykN
CiAgI2RlZmluZSBjcHVfaGFzX3RzeF9mb3JjZV9hYm9ydCBib290X2NwdV9oYXMoWDg2X0ZFQVRV
UkVfVFNYX0ZPUkNFX0FCT1JUKQ0KICANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
