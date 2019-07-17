Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 258696B6BF
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 08:37:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hndWf-0004UF-GD; Wed, 17 Jul 2019 06:34:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H7Ci=VO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hndWd-0004U4-Nh
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 06:34:51 +0000
X-Inumbo-ID: f82b92cc-a85c-11e9-8cfd-7f3e53b4ef77
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f82b92cc-a85c-11e9-8cfd-7f3e53b4ef77;
 Wed, 17 Jul 2019 06:34:47 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 17 Jul 2019 06:34:45 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 17 Jul 2019 06:34:17 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 17 Jul 2019 06:34:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E9q9E0e1uLn1j6ln9gHxFrz09QhKn++mardVR5VBBi2QhVAyOE6g9U8/Tf2BCoW3O7Fyx/3OJdmQapnT4G1HwzuXWmaVmg3Enrvjsf1n6UpD9aSV/r86oJ0X6s4Ks1uhwNNNv+R1jgPLNJ23XAnObbZtp39fopjpMgZMoJ6WA5++ZdNuEIOLqvDJM+we70nlkoKO9Y2HZwZviehq7iNRsDi69cJsA9pE+3NIioLWEitRLJCr0fV4PppWkOxlbPTAWXpP2/PSxI91W7ky+4SQVzxgPfeear4PjrmsbonD/AMl1yHCmDvP7SbLHZv/YDwrbabI+IGbuyMVYfCFmRbFaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n5zmGlXL/rpSCLZigx5f+cganVwC2ruD+KJu1EbX0qQ=;
 b=ZdwEA3Xi4t+v7dbs4L40XRrwjLIY2p8uD7eOUENxT5OT08eu2kQ01cv+exujSY8kMzx3Qh1KCqqeRzQN2aieQQ8h9l+UhMDSeLvHkMaCT91RkCH3q/MjwQ6wgnbXmQMWRO7r11+5JP0hEG91ENrxhsxjD9+SZLQfKy0epyXpf88HPkfkvbO9yrft5pQNp+h5dS2kIwRT/0V+AAEvKKUvT8oAP+f5vK8OtIz1woMQiMTTD5W1ztAZ8LvCultUEaRPdqqcP7Ug1cNY3hVcTTEeZ1ACkYuM0twqZOkwD0v8VR/mGSNpGvrRsPYOnnCQBkYuBM1jfZEBSXd2UzWPn5niGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3196.namprd18.prod.outlook.com (10.255.172.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 06:34:16 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 06:34:16 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v10 03/13] x86emul: support remaining AVX512_VBMI2 insns
Thread-Index: AQHVPGmo2cQ5cfTv6UaFE2PHA/Hb8Q==
Date: Wed, 17 Jul 2019 06:34:16 +0000
Message-ID: <56df531b-f1fc-f70a-ce98-3d29335109b0@suse.com>
References: <0ccca19e-7bbb-ab1e-c0bb-a568b02874e0@suse.com>
In-Reply-To: <0ccca19e-7bbb-ab1e-c0bb-a568b02874e0@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB3PR0102CA0019.eurprd01.prod.exchangelabs.com
 (2603:10a6:8::32) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7dba667b-3778-4fb9-56ab-08d70a80ca77
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR18MB3196; 
x-ms-traffictypediagnostic: DM6PR18MB3196:
x-microsoft-antispam-prvs: <DM6PR18MB31965A04B251982529766C0AB3C90@DM6PR18MB3196.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(199004)(189003)(6116002)(5660300002)(53936002)(31686004)(256004)(476003)(8936002)(66946007)(2616005)(446003)(81156014)(99286004)(486006)(11346002)(66066001)(6512007)(3846002)(478600001)(186003)(81166006)(4326008)(14444005)(54906003)(316002)(86362001)(7736002)(102836004)(8676002)(6506007)(36756003)(80792005)(68736007)(6916009)(2501003)(6486002)(26005)(76176011)(31696002)(386003)(64756008)(71200400001)(66446008)(6436002)(66476007)(25786009)(2906002)(66556008)(305945005)(14454004)(5640700003)(2351001)(71190400001)(52116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3196;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VEANueL9wIgTnvrn3aHqp7TZD9FY1Hmrk214/NKzr22pZ+v8iJEzDr3KMuf2cLX9vyMsO/us0J34166uneE7NtOPVtQggHXqLLIQvLMYu8xQY0H84163qXFgT5109bK+579KzNZ/FxF4ZuJVuZahLdYMXHdbQCOk/QC7yD7XzTw2OLeHYm1qMc6qcnmsPg8c+yIdU9ffbigWEOjWKFUF7EfoH7nqJcAQ7RyvEHhQcp0ulUJGcQAWPztI4r1yv84tiR0spUsAepd7FVfLbaff6enz62oyMLqWa1K+hDTbYb7VSlT4oqbvjqiKbGTZWQR9vHXKERIwKCpVZcqw4XAVEoJ84nSUDWZQoiX6YKppFu8tSd4/LeEjhhAsGfb/HEBaT+9VRp8JosM+8ZH5jdbic2k6CgalOTbreBfyZ03fmD8=
Content-ID: <B8A1D9E672CAFF479C802B3F337F8136@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dba667b-3778-4fb9-56ab-08d70a80ca77
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 06:34:16.6364 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3196
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v10 03/13] x86emul: support remaining
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
