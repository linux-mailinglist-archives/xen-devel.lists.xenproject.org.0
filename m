Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A46295BAA2
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 13:27:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hhuQE-0001yN-EA; Mon, 01 Jul 2019 11:24:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YZ94=U6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hhuQC-0001y7-WE
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 11:24:33 +0000
X-Inumbo-ID: cb7149af-9bf2-11e9-8980-bc764e045a96
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cb7149af-9bf2-11e9-8980-bc764e045a96;
 Mon, 01 Jul 2019 11:24:31 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  1 Jul 2019 11:20:56 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 1 Jul 2019 11:23:14 +0000
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 1 Jul 2019 11:23:14 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3299.namprd18.prod.outlook.com (10.255.138.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.18; Mon, 1 Jul 2019 11:23:13 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2008.020; Mon, 1 Jul 2019
 11:23:13 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v9 13/23] x86emul: support remaining AVX512_VBMI2 insns
Thread-Index: AQHVL/9eCOyjY+NQ6UW4xpEn0Db3QA==
Date: Mon, 1 Jul 2019 11:23:13 +0000
Message-ID: <9c4d708b-4ae9-5341-2c4b-bfeada164422@suse.com>
References: <f69ca82f-e2db-e85e-ff98-2060a8dc28a5@suse.com>
In-Reply-To: <f69ca82f-e2db-e85e-ff98-2060a8dc28a5@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6P189CA0029.EURP189.PROD.OUTLOOK.COM (2603:10a6:6:2e::42)
 To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 866f7999-3684-4fe5-bf7e-08d6fe168138
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3299; 
x-ms-traffictypediagnostic: BY5PR18MB3299:
x-microsoft-antispam-prvs: <BY5PR18MB32992F2A26F718B7E5FF7B36B3F90@BY5PR18MB3299.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 00851CA28B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(136003)(396003)(366004)(376002)(39860400002)(189003)(199004)(6916009)(478600001)(5660300002)(256004)(14444005)(76176011)(486006)(7736002)(80792005)(8676002)(4326008)(2501003)(66556008)(64756008)(66946007)(2906002)(66476007)(71190400001)(8936002)(71200400001)(66446008)(25786009)(73956011)(3846002)(446003)(68736007)(36756003)(81166006)(81156014)(66066001)(14454004)(6116002)(31686004)(11346002)(99286004)(305945005)(86362001)(31696002)(6436002)(386003)(6506007)(53936002)(102836004)(2616005)(54906003)(52116002)(6512007)(72206003)(316002)(476003)(186003)(6486002)(5640700003)(26005)(2351001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3299;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jlzw8ZC1pJKwBH93ngB8k1GtLHjzgtyKn58PuO7blfLEHIJNmZ1TiKeLcGPgzs2+SkRuL5I1iNltNctd+q7sIx1GcS/xNxYUe0S7jrlABPMMKtzw1W8Fy/OliuF5K/S4nfJWr7bsJ5Bi5Hn7qdsw6n/p9iEea6S41/LIpAgEejMYXwiO2IPZruactam+keh1hHWt0H2g95AvIJxWKZbuYShlNQ6CVWmotxzSYa4Vfj1XSgKiSep33e+7dEIaBjgUbbRcTVM75967UCHQtx/sdt20Z4v38ObqB1mQTezTl3NMrCKrA+FLe+j6a1fxHFelCJ+hNyoA1LtUm/GqgwkaxGlHsRqw1/pz9lAEw8FPNxYHINXhK9vQ6J89VOfLF7BdxUr8Sn7G/6pF/GU3b+SxNkk1Y4LGOdfFhAfhIziucnY=
Content-ID: <95E9DAFD0405254CA5BCCA00B17D5130@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 866f7999-3684-4fe5-bf7e-08d6fe168138
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2019 11:23:13.2598 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3299
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v9 13/23] x86emul: support remaining
 AVX512_VBMI2 insns
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
dGljdWxhciB0aGVpcg0KbWVtb3J5IGFjY2VzcyBwYXR0ZXJucyBmb2xsb3cgdGhlIHVzdWFsIHNj
aGVtZSwgSSBkaWRuJ3QgdGhpbmsgaXQgd2FzDQpuZWNlc3NhcnkgdG8gYWRkIGEgY29udHJpdmVk
IHRlc3Qgc3BlY2lmaWNhbGx5IGZvciB0aGVtLCBiZXlvbmQgdGhlDQpEaXNwOCBzY2FsaW5nIG9u
ZS4NCg0KU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KQWNr
ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQotLS0NCnY3
OiBSZS1iYXNlIG92ZXIgY2hhbmdlIGVhcmxpZXIgaW4gdGhlIHNlcmllcy4NCnY2OiBOZXcuDQoN
Ci0tLSBhL3Rvb2xzL3Rlc3RzL3g4Nl9lbXVsYXRvci9ldmV4LWRpc3A4LmMNCisrKyBiL3Rvb2xz
L3Rlc3RzL3g4Nl9lbXVsYXRvci9ldmV4LWRpc3A4LmMNCkBAIC01NTgsNiArNTU4LDE0IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgdGVzdCBhdng1MTJfdmJtaV9hbGwNCiAgc3RhdGljIGNvbnN0IHN0
cnVjdCB0ZXN0IGF2eDUxMl92Ym1pMl9hbGxbXSA9IHsNCiAgICAgIElOU04ocGNvbXByZXNzLCA2
NiwgMGYzOCwgNjMsIHZsLCBidywgZWwpLA0KICAgICAgSU5TTihwZXhwYW5kLCAgIDY2LCAwZjM4
LCA2MiwgdmwsIGJ3LCBlbCksDQorICAgIElOU04ocHNobGQsICAgICA2NiwgMGYzYSwgNzEsIHZs
LCBkcSwgdmwpLA0KKyAgICBJTlNOKHBzaGxkdiwgICAgNjYsIDBmMzgsIDcxLCB2bCwgZHEsIHZs
KSwNCisgICAgSU5TTihwc2hsZHZ3LCAgIDY2LCAwZjM4LCA3MCwgdmwsICB3LCB2bCksDQorICAg
IElOU04ocHNobGR3LCAgICA2NiwgMGYzYSwgNzAsIHZsLCAgdywgdmwpLA0KKyAgICBJTlNOKHBz
aHJkLCAgICAgNjYsIDBmM2EsIDczLCB2bCwgZHEsIHZsKSwNCisgICAgSU5TTihwc2hyZHYsICAg
IDY2LCAwZjM4LCA3MywgdmwsIGRxLCB2bCksDQorICAgIElOU04ocHNocmR2dywgICA2NiwgMGYz
OCwgNzIsIHZsLCAgdywgdmwpLA0KKyAgICBJTlNOKHBzaHJkdywgICAgNjYsIDBmM2EsIDcyLCB2
bCwgIHcsIHZsKSwNCiAgfTsNCiAgDQogIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdGVzdCBhdng1MTJf
dnBvcGNudGRxX2FsbFtdID0gew0KLS0tIGEveGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRlL3g4Nl9l
bXVsYXRlLmMNCisrKyBiL3hlbi9hcmNoL3g4Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5jDQpA
QCAtNDg3LDYgKzQ4Nyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZXh0MGYzOF90YWJsZSB7DQog
ICAgICBbMHg2Ml0gPSB7IC5zaW1kX3NpemUgPSBzaW1kX3BhY2tlZF9pbnQsIC50d29fb3AgPSAx
LCAuZDhzID0gZDhzX2J3IH0sDQogICAgICBbMHg2M10gPSB7IC5zaW1kX3NpemUgPSBzaW1kX3Bh
Y2tlZF9pbnQsIC50b19tZW0gPSAxLCAudHdvX29wID0gMSwgLmQ4cyA9IGQ4c19idyB9LA0KICAg
ICAgWzB4NjQgLi4uIDB4NjZdID0geyAuc2ltZF9zaXplID0gc2ltZF9wYWNrZWRfaW50LCAuZDhz
ID0gZDhzX3ZsIH0sDQorICAgIFsweDcwIC4uLiAweDczXSA9IHsgLnNpbWRfc2l6ZSA9IHNpbWRf
cGFja2VkX2ludCwgLmQ4cyA9IGQ4c192bCB9LA0KICAgICAgWzB4NzUgLi4uIDB4NzZdID0geyAu
c2ltZF9zaXplID0gc2ltZF9wYWNrZWRfaW50LCAuZDhzID0gZDhzX3ZsIH0sDQogICAgICBbMHg3
N10gPSB7IC5zaW1kX3NpemUgPSBzaW1kX3BhY2tlZF9mcCwgLmQ4cyA9IGQ4c192bCB9LA0KICAg
ICAgWzB4NzhdID0geyAuc2ltZF9zaXplID0gc2ltZF9vdGhlciwgLnR3b19vcCA9IDEgfSwNCkBA
IC02MTEsNiArNjEyLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBleHQwZjNhX3RhYmxlIHsNCiAg
ICAgIFsweDZhIC4uLiAweDZiXSA9IHsgLnNpbWRfc2l6ZSA9IHNpbWRfc2NhbGFyX29wYywgLmZv
dXJfb3AgPSAxIH0sDQogICAgICBbMHg2YyAuLi4gMHg2ZF0gPSB7IC5zaW1kX3NpemUgPSBzaW1k
X3BhY2tlZF9mcCwgLmZvdXJfb3AgPSAxIH0sDQogICAgICBbMHg2ZSAuLi4gMHg2Zl0gPSB7IC5z
aW1kX3NpemUgPSBzaW1kX3NjYWxhcl9vcGMsIC5mb3VyX29wID0gMSB9LA0KKyAgICBbMHg3MCAu
Li4gMHg3M10gPSB7IC5zaW1kX3NpemUgPSBzaW1kX3BhY2tlZF9pbnQsIC5kOHMgPSBkOHNfdmwg
fSwNCiAgICAgIFsweDc4IC4uLiAweDc5XSA9IHsgLnNpbWRfc2l6ZSA9IHNpbWRfcGFja2VkX2Zw
LCAuZm91cl9vcCA9IDEgfSwNCiAgICAgIFsweDdhIC4uLiAweDdiXSA9IHsgLnNpbWRfc2l6ZSA9
IHNpbWRfc2NhbGFyX29wYywgLmZvdXJfb3AgPSAxIH0sDQogICAgICBbMHg3YyAuLi4gMHg3ZF0g
PSB7IC5zaW1kX3NpemUgPSBzaW1kX3BhY2tlZF9mcCwgLmZvdXJfb3AgPSAxIH0sDQpAQCAtODk2
OSw2ICs4OTcxLDE2IEBAIHg4Nl9lbXVsYXRlKA0KICAgICAgICAgIH0NCiAgICAgICAgICBnb3Rv
IHNpbWRfem1tOw0KICANCisgICAgY2FzZSBYODZFTVVMX09QQ19FVkVYXzY2KDB4MGYzOCwgMHg3
MCk6IC8qIHZwc2hsZHZ3IFt4eXpdbW0vbWVtLFt4eXpdbW0sW3h5el1tbXtrfSAqLw0KKyAgICBj
YXNlIFg4NkVNVUxfT1BDX0VWRVhfNjYoMHgwZjM4LCAweDcyKTogLyogdnBzaHJkdncgW3h5el1t
bS9tZW0sW3h5el1tbSxbeHl6XW1te2t9ICovDQorICAgICAgICBnZW5lcmF0ZV9leGNlcHRpb25f
aWYoIWV2ZXgudywgRVhDX1VEKTsNCisgICAgICAgIGVsZW1fYnl0ZXMgPSAyOw0KKyAgICAgICAg
LyogZmFsbCB0aHJvdWdoICovDQorICAgIGNhc2UgWDg2RU1VTF9PUENfRVZFWF82NigweDBmMzgs
IDB4NzEpOiAvKiB2cHNobGR2e2QscX0gW3h5el1tbS9tZW0sW3h5el1tbSxbeHl6XW1te2t9ICov
DQorICAgIGNhc2UgWDg2RU1VTF9PUENfRVZFWF82NigweDBmMzgsIDB4NzMpOiAvKiB2cHNocmR2
e2QscX0gW3h5el1tbS9tZW0sW3h5el1tbSxbeHl6XW1te2t9ICovDQorICAgICAgICBob3N0X2Fu
ZF92Y3B1X211c3RfaGF2ZShhdng1MTJfdmJtaTIpOw0KKyAgICAgICAgZ290byBhdng1MTJmX25v
X3NhZTsNCisNCiAgICAgIGNhc2UgWDg2RU1VTF9PUENfRVZFWF82NigweDBmMzgsIDB4NzUpOiAv
KiB2cGVybWkye2Isd30gW3h5el1tbS9tZW0sW3h5el1tbSxbeHl6XW1te2t9ICovDQogICAgICBj
YXNlIFg4NkVNVUxfT1BDX0VWRVhfNjYoMHgwZjM4LCAweDdkKTogLyogdnBlcm10MntiLHd9IFt4
eXpdbW0vbWVtLFt4eXpdbW0sW3h5el1tbXtrfSAqLw0KICAgICAgY2FzZSBYODZFTVVMX09QQ19F
VkVYXzY2KDB4MGYzOCwgMHg4ZCk6IC8qIHZwZXJte2Isd30gW3h5el1tbS9tZW0sW3h5el1tbSxb
eHl6XW1te2t9ICovDQpAQCAtMTAyODEsNiArMTAyOTMsMTYgQEAgeDg2X2VtdWxhdGUoDQogICAg
ICAgICAgYXZ4NTEyX3ZsZW5fY2hlY2sodHJ1ZSk7DQogICAgICAgICAgZ290byBzaW1kX2ltbThf
em1tOw0KICANCisgICAgY2FzZSBYODZFTVVMX09QQ19FVkVYXzY2KDB4MGYzYSwgMHg3MCk6IC8q
IHZwc2hsZHcgJGltbTgsW3h5el1tbS9tZW0sW3h5el1tbSxbeHl6XW1te2t9ICovDQorICAgIGNh
c2UgWDg2RU1VTF9PUENfRVZFWF82NigweDBmM2EsIDB4NzIpOiAvKiB2cHNocmR3ICRpbW04LFt4
eXpdbW0vbWVtLFt4eXpdbW0sW3h5el1tbXtrfSAqLw0KKyAgICAgICAgZ2VuZXJhdGVfZXhjZXB0
aW9uX2lmKCFldmV4LncsIEVYQ19VRCk7DQorICAgICAgICBlbGVtX2J5dGVzID0gMjsNCisgICAg
ICAgIC8qIGZhbGwgdGhyb3VnaCAqLw0KKyAgICBjYXNlIFg4NkVNVUxfT1BDX0VWRVhfNjYoMHgw
ZjNhLCAweDcxKTogLyogdnBzaGxke2QscX0gJGltbTgsW3h5el1tbS9tZW0sW3h5el1tbSxbeHl6
XW1te2t9ICovDQorICAgIGNhc2UgWDg2RU1VTF9PUENfRVZFWF82NigweDBmM2EsIDB4NzMpOiAv
KiB2cHNocmR7ZCxxfSAkaW1tOCxbeHl6XW1tL21lbSxbeHl6XW1tLFt4eXpdbW17a30gKi8NCisg
ICAgICAgIGhvc3RfYW5kX3ZjcHVfbXVzdF9oYXZlKGF2eDUxMl92Ym1pMik7DQorICAgICAgICBn
b3RvIGF2eDUxMmZfaW1tOF9ub19zYWU7DQorDQogICAgICBjYXNlIFg4NkVNVUxfT1BDKDB4MGYz
YSwgMHhjYyk6ICAgICAvKiBzaGExcm5kczQgJGltbTgseG1tL20xMjgseG1tICovDQogICAgICAg
ICAgaG9zdF9hbmRfdmNwdV9tdXN0X2hhdmUoc2hhKTsNCiAgICAgICAgICBvcF9ieXRlcyA9IDE2
Ow0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
