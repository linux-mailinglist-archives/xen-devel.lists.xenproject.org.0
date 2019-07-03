Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E71A5E4DD
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 15:09:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hieyR-0004lF-KV; Wed, 03 Jul 2019 13:06:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vZpq=VA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hieyQ-0004kD-CA
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 13:06:58 +0000
X-Inumbo-ID: 6f23fc58-9d93-11e9-8980-bc764e045a96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6f23fc58-9d93-11e9-8980-bc764e045a96;
 Wed, 03 Jul 2019 13:06:56 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Wed,  3 Jul 2019 13:06:55 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 3 Jul 2019 13:03:03 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 3 Jul 2019 13:03:03 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3218.namprd18.prod.outlook.com (10.255.137.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Wed, 3 Jul 2019 13:03:02 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Wed, 3 Jul 2019
 13:03:02 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 4/5] x86: allow limiting the max C-state sub-state
Thread-Index: AQHVMZ+l48br4ffcsk28PZ/9fMg8ZA==
Date: Wed, 3 Jul 2019 13:03:02 +0000
Message-ID: <b5b7560a-2418-9df7-2062-3ba1f6f0152f@suse.com>
References: <0dbf8520-89c7-753e-c10a-13399aec9cd5@suse.com>
In-Reply-To: <0dbf8520-89c7-753e-c10a-13399aec9cd5@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6P192CA0014.EURP192.PROD.OUTLOOK.COM (2603:10a6:4:b8::24)
 To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0bd5c976-5457-4eea-d6e0-08d6ffb6c7f8
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3218; 
x-ms-traffictypediagnostic: BY5PR18MB3218:
x-microsoft-antispam-prvs: <BY5PR18MB3218CBDEC142311BF6FB24A7B3FB0@BY5PR18MB3218.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:901;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(366004)(376002)(39860400002)(136003)(346002)(199004)(189003)(6486002)(31686004)(11346002)(476003)(2616005)(25786009)(4326008)(486006)(446003)(6506007)(386003)(6436002)(6916009)(26005)(14454004)(102836004)(7736002)(186003)(305945005)(99286004)(36756003)(64756008)(66556008)(66476007)(66446008)(2351001)(8936002)(8676002)(53936002)(81166006)(81156014)(2906002)(73956011)(66946007)(256004)(5660300002)(76176011)(5640700003)(31696002)(3846002)(6116002)(14444005)(54906003)(52116002)(6512007)(80792005)(86362001)(72206003)(66066001)(68736007)(2501003)(478600001)(316002)(71190400001)(71200400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3218;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5h6fTWZ6HMn5Fx5ixfo4tsWJQBjyMdtKkwcYQ8mnQ8axOe0+10maClnuEZ/qWjsRvsNh0VYyzQh+7oZwRSDX8U9FwrirkswA2sIYgy9aL/ZHBMjEgTdhx5TiSVAkXb7oNPPvcl22b6gDgvfhQ75lUZb0ZIBjlMGEGkSyONE7gqhYYlUf/UpZwDco9I+nkg8PdtVMR53bvgGGLuJv79YMdzP1V2548H4n2mC3iXQAEt682Ryt32ZZ1xuhSmQs7kvz4Jlw+ecQmbuKh3ichhTn5EX209jI9NVy2ABzWm1rWeNliS/0pFfPFVs/iaik1+T2chtcyk2Pn0S1TgvQPjh5UzShJWmVnaBIA+AnSbbSml2yONUmu3mVcf4gRDe31BRkWw5zwF9aZ/s/N1QJcxA66KXBjXHFKMHapUuAHRnOkog=
Content-ID: <55F5C9EDFC66A64387679472D5DFBB20@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bd5c976-5457-4eea-d6e0-08d6ffb6c7f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 13:03:02.5747 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3218
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v2 4/5] x86: allow limiting the max C-state
 sub-state
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
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+DQoNCkFsbG93
IGxpbWl0aW5nIHRoZSBtYXggQy1zdGF0ZSBzdWItc3RhdGUgYnkgYXBwZW5kaW5nIHRvIHRoZSBt
YXhfY3N0YXRlDQpjb21tYW5kLWxpbmUgcGFyYW1ldGVyLiBFLmcuIG1heF9jc3RhdGU9MSwwDQpU
aGUgbGltaXQgb25seSBhcHBsaWVzIHRvIHRoZSBoaWdoZXN0IGxlZ2FsIEMtc3RhdGUuIEZvciBl
eGFtcGxlOg0KICBtYXhfY3N0YXRlID0gMSwgbWF4X2NzdWJzdGF0ZSA9IDAgPT0+IEMwLCBDMSBv
a2F5LCBidXQgbm90IEMxRQ0KICBtYXhfY3N0YXRlID0gMSwgbWF4X2NzdWJzdGF0ZSA9IDEgPT0+
IEMwLCBDMSBhbmQgQzFFIG9rYXksIGJ1dCBub3QgQzINCiAgbWF4X2NzdGF0ZSA9IDIsIG1heF9j
c3Vic3RhdGUgPSAwID09PiBDMCwgQzEsIEMxRSwgQzIgb2theSwgYnV0IG5vdCBDMw0KICBtYXhf
Y3N0YXRlID0gMiwgbWF4X2NzdWJzdGF0ZSA9IDEgPT0+IEMwLCBDMSwgQzFFLCBDMiBva2F5LCBi
dXQgbm90IEMzDQoNClNpZ25lZC1vZmYtYnk6IFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vyd2Fs
bEBjaXRyaXguY29tPg0KU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPg0KLS0tDQp2MjogRXhwbGljaXRseSBsb2cgInVubGltaXRlZCIuIFBhc3MgTlVMTCBpbiB0
aGUgMm5kIHNpbXBsZV9zdHJ0b3VsKCkNCiAgICAgaW52b2NhdGlvbi4NCg0KLS0tIGEvZG9jcy9t
aXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jDQorKysgYi9kb2NzL21pc2MveGVuLWNvbW1hbmQt
bGluZS5wYW5kb2MNCkBAIC0xMzc0LDkgKzEzNzQsMTEgQEAgU3BlY2lmeSB0aGUgbWF4aW11bSBu
dW1iZXIgb2YgQ1BVcyB0aGF0DQogIFRoaXMgb3B0aW9uIGlzIGlnbm9yZWQgaW4gKipwdi1zaGlt
KiogbW9kZS4NCiAgDQogICMjIyBtYXhfY3N0YXRlICh4ODYpDQotPiBgPSA8aW50ZWdlcj5gDQor
PiBgPSA8aW50ZWdlcj5bLDxpbnRlZ2VyPl1gDQogIA0KLVNwZWNpZnkgdGhlIGRlZXBlc3QgQy1z
dGF0ZSBDUFVzIGFyZSBwZXJtaXR0ZWQgdG8gYmUgcGxhY2VkIGluLg0KK1NwZWNpZnkgdGhlIGRl
ZXBlc3QgQy1zdGF0ZSBDUFVzIGFyZSBwZXJtaXR0ZWQgdG8gYmUgcGxhY2VkIGluLCBhbmQNCitv
cHRpb25hbGx5IHRoZSBtYXhpbXVtIHN1YiBDLXN0YXRlIHRvIGJlIHVzZWQgdXNlZC4gIFRoZSBs
YXR0ZXIgb25seSBhcHBsaWVzDQordG8gdGhlIGhpZ2hlc3QgcGVybWl0dGVkIEMtc3RhdGUuDQog
IA0KICAjIyMgbWF4X2dzaV9pcnFzICh4ODYpDQogID4gYD0gPGludGVnZXI+YA0KLS0tIGEveGVu
L2FyY2gveDg2L2FjcGkvY3B1X2lkbGUuYw0KKysrIGIveGVuL2FyY2gveDg2L2FjcGkvY3B1X2lk
bGUuYw0KQEAgLTEwNCw3ICsxMDQsMTcgQEAgYm9vbCBsYXBpY190aW1lcl9pbml0KHZvaWQpDQog
IA0KICB2b2lkICgqX19yZWFkX21vc3RseSBwbV9pZGxlX3NhdmUpKHZvaWQpOw0KICB1bnNpZ25l
ZCBpbnQgbWF4X2NzdGF0ZSBfX3JlYWRfbW9zdGx5ID0gVUlOVF9NQVg7DQotaW50ZWdlcl9wYXJh
bSgibWF4X2NzdGF0ZSIsIG1heF9jc3RhdGUpOw0KK3Vuc2lnbmVkIGludCBtYXhfY3N1YnN0YXRl
IF9fcmVhZF9tb3N0bHkgPSBVSU5UX01BWDsNCisNCitzdGF0aWMgaW50IF9faW5pdCBwYXJzZV9j
c3RhdGUoY29uc3QgY2hhciAqcykNCit7DQorICAgIG1heF9jc3RhdGUgPSBzaW1wbGVfc3RydG91
bChzLCAmcywgMCk7DQorICAgIGlmICggKnMgPT0gJywnICkNCisgICAgICAgIG1heF9jc3Vic3Rh
dGUgPSBzaW1wbGVfc3RydG91bChzICsgMSwgTlVMTCwgMCk7DQorICAgIHJldHVybiAwOw0KK30N
CitjdXN0b21fcGFyYW0oIm1heF9jc3RhdGUiLCBwYXJzZV9jc3RhdGUpOw0KKw0KICBzdGF0aWMg
Ym9vbCBfX3JlYWRfbW9zdGx5IGxvY2FsX2FwaWNfdGltZXJfYzJfb2s7DQogIGJvb2xlYW5fcGFy
YW0oImxhcGljX3RpbWVyX2MyX29rIiwgbG9jYWxfYXBpY190aW1lcl9jMl9vayk7DQogIA0KQEAg
LTM0Nyw3ICszNTcsMTMgQEAgc3RhdGljIHZvaWQgZHVtcF9jeCh1bnNpZ25lZCBjaGFyIGtleSkN
CiAgDQogICAgICBwcmludGsoIiclYycgcHJlc3NlZCAtPiBwcmludGluZyBBQ1BJIEN4IHN0cnVj
dHVyZXNcbiIsIGtleSk7DQogICAgICBpZiAoIG1heF9jc3RhdGUgPCBVSU5UX01BWCApDQorICAg
IHsNCiAgICAgICAgICBwcmludGsoIm1heCBzdGF0ZTogQyV1XG4iLCBtYXhfY3N0YXRlKTsNCisg
ICAgICAgIGlmICggbWF4X2NzdWJzdGF0ZSA8IFVJTlRfTUFYICkNCisgICAgICAgICAgICBwcmlu
dGsoIm1heCBzdWItc3RhdGU6ICV1XG4iLCBtYXhfY3N1YnN0YXRlKTsNCisgICAgICAgIGVsc2UN
CisgICAgICAgICAgICBwcmludGsoIm1heCBzdWItc3RhdGU6IHVubGltaXRlZFxuIik7DQorICAg
IH0NCiAgICAgIGVsc2UNCiAgICAgICAgICBwcmludGsoIm1heCBzdGF0ZTogdW5saW1pdGVkXG4i
KTsNCiAgICAgIGZvcl9lYWNoX3ByZXNlbnRfY3B1ICggY3B1ICkNCkBAIC01OTIsNyArNjA4LDEz
IEBAIHN0YXRpYyB2b2lkIGFjcGlfcHJvY2Vzc29yX2lkbGUodm9pZCkNCiAgDQogICAgICAgICAg
ZG8gew0KICAgICAgICAgICAgICBjeCA9ICZwb3dlci0+c3RhdGVzW25leHRfc3RhdGVdOw0KLSAg
ICAgICAgfSB3aGlsZSAoIGN4LT50eXBlID4gbWF4X3N0YXRlICYmIC0tbmV4dF9zdGF0ZSApOw0K
KyAgICAgICAgfSB3aGlsZSAoIChjeC0+dHlwZSA+IG1heF9zdGF0ZSB8fA0KKyAgICAgICAgICAg
ICAgICAgICBjeC0+ZW50cnlfbWV0aG9kID09IEFDUElfQ1NUQVRFX0VNX05PTkUgfHwNCisgICAg
ICAgICAgICAgICAgICAgKGN4LT5lbnRyeV9tZXRob2QgPT0gQUNQSV9DU1RBVEVfRU1fRkZIICYm
DQorICAgICAgICAgICAgICAgICAgICBjeC0+dHlwZSA9PSBtYXhfY3N0YXRlICYmDQorICAgICAg
ICAgICAgICAgICAgICAoY3gtPmFkZHJlc3MgJiBNV0FJVF9TVUJTVEFURV9NQVNLKSA+IG1heF9j
c3Vic3RhdGUpKSAmJg0KKyAgICAgICAgICAgICAgICAgIC0tbmV4dF9zdGF0ZSApOw0KKyAgICAg
ICAgICAgIGN4ID0gJnBvd2VyLT5zdGF0ZXNbbmV4dF9zdGF0ZV07DQogICAgICAgICAgaWYgKCBu
ZXh0X3N0YXRlICkNCiAgICAgICAgICB7DQogICAgICAgICAgICAgIGlmICggY3gtPnR5cGUgPT0g
QUNQSV9TVEFURV9DMyAmJiBwb3dlci0+ZmxhZ3MuYm1fY2hlY2sgJiYNCi0tLSBhL3hlbi9hcmNo
L3g4Ni9jcHUvbXdhaXQtaWRsZS5jDQorKysgYi94ZW4vYXJjaC94ODYvY3B1L213YWl0LWlkbGUu
Yw0KQEAgLTczMSw3ICs3MzEsOSBAQCBzdGF0aWMgdm9pZCBtd2FpdF9pZGxlKHZvaWQpDQogIA0K
ICAJCWRvIHsNCiAgCQkJY3ggPSAmcG93ZXItPnN0YXRlc1tuZXh0X3N0YXRlXTsNCi0JCX0gd2hp
bGUgKGN4LT50eXBlID4gbWF4X3N0YXRlICYmIC0tbmV4dF9zdGF0ZSk7DQorCQl9IHdoaWxlICgo
Y3gtPnR5cGUgPiBtYXhfc3RhdGUgfHwgKGN4LT50eXBlID09IG1heF9jc3RhdGUgJiYNCisJCQkg
IE1XQUlUX0hJTlQyU1VCU1RBVEUoY3gtPmFkZHJlc3MpID4gbWF4X2NzdWJzdGF0ZSkpICYmDQor
CQkJIC0tbmV4dF9zdGF0ZSk7DQogIAkJaWYgKCFuZXh0X3N0YXRlKQ0KICAJCQljeCA9IE5VTEw7
DQogIAkJZWxzZSBpZiAodGJfaW5pdF9kb25lKQ0KLS0tIGEveGVuL2luY2x1ZGUveGVuL2FjcGku
aA0KKysrIGIveGVuL2luY2x1ZGUveGVuL2FjcGkuaA0KQEAgLTE0MSwxMyArMTQxLDIxIEBAIHZv
aWQgYWNwaV91bnJlZ2lzdGVyX2dzaSAodTMyIGdzaSk7DQogIA0KICAjaWZkZWYJQ09ORklHX0FD
UElfQ1NUQVRFDQogIC8qDQotICogU2V0IGhpZ2hlc3QgbGVnYWwgQy1zdGF0ZQ0KLSAqIDA6IEMw
IG9rYXksIGJ1dCBub3QgQzENCi0gKiAxOiBDMSBva2F5LCBidXQgbm90IEMyDQotICogMjogQzIg
b2theSwgYnV0IG5vdCBDMyBldGMuDQorICogbWF4X2NzdGF0ZSBzZXRzIHRoZSBoaWdoZXN0IGxl
Z2FsIEMtc3RhdGUuDQorICogbWF4X2NzdGF0ZSA9IDA6IEMwIG9rYXksIGJ1dCBub3QgQzENCisg
KiBtYXhfY3N0YXRlID0gMTogQzEgb2theSwgYnV0IG5vdCBDMg0KKyAqIG1heF9jc3RhdGUgPSAy
OiBDMiBva2F5LCBidXQgbm90IEMzIGV0Yy4NCisNCisgKiBtYXhfY3N1YnN0YXRlIHNldHMgdGhl
IGhpZ2hlc3QgbGVnYWwgQy1zdGF0ZSBzdWItc3RhdGUuIE9ubHkgYXBwbGllcyB0byB0aGUNCisg
KiBoaWdoZXN0IGxlZ2FsIEMtc3RhdGUuDQorICogbWF4X2NzdGF0ZSA9IDEsIG1heF9jc3Vic3Rh
dGUgPSAwID09PiBDMCwgQzEgb2theSwgYnV0IG5vdCBDMUUNCisgKiBtYXhfY3N0YXRlID0gMSwg
bWF4X2NzdWJzdGF0ZSA9IDEgPT0+IEMwLCBDMSBhbmQgQzFFIG9rYXksIGJ1dCBub3QgQzINCisg
KiBtYXhfY3N0YXRlID0gMiwgbWF4X2NzdWJzdGF0ZSA9IDAgPT0+IEMwLCBDMSwgQzFFLCBDMiBv
a2F5LCBidXQgbm90IEMzDQorICogbWF4X2NzdGF0ZSA9IDIsIG1heF9jc3Vic3RhdGUgPSAxID09
PiBDMCwgQzEsIEMxRSwgQzIgb2theSwgYnV0IG5vdCBDMw0KICAgKi8NCiAgDQogIGV4dGVybiB1
bnNpZ25lZCBpbnQgbWF4X2NzdGF0ZTsNCitleHRlcm4gdW5zaWduZWQgaW50IG1heF9jc3Vic3Rh
dGU7DQogIA0KICBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGludCBhY3BpX2dldF9jc3RhdGVfbGlt
aXQodm9pZCkNCiAgew0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
