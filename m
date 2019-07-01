Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDB95BA7B
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 13:21:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hhuKk-0000Tl-Fo; Mon, 01 Jul 2019 11:18:54 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YZ94=U6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hhuKj-0000Td-Ng
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 11:18:53 +0000
X-Inumbo-ID: 01d8fd83-9bf2-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 01d8fd83-9bf2-11e9-8980-bc764e045a96;
 Mon, 01 Jul 2019 11:18:52 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  1 Jul 2019 11:18:47 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 1 Jul 2019 11:18:15 +0000
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 1 Jul 2019 11:18:15 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3363.namprd18.prod.outlook.com (10.255.139.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.18; Mon, 1 Jul 2019 11:18:13 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2008.020; Mon, 1 Jul 2019
 11:18:13 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v9 04/23] x86emul: test harness adjustments for AVX512F
 S/G insns
Thread-Index: AQHVL/6r8GG6+sBCO0auOI6oTGNNMA==
Date: Mon, 1 Jul 2019 11:18:12 +0000
Message-ID: <d1e6867c-7ace-e8c1-5139-e38a249e4398@suse.com>
References: <f69ca82f-e2db-e85e-ff98-2060a8dc28a5@suse.com>
In-Reply-To: <f69ca82f-e2db-e85e-ff98-2060a8dc28a5@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR01CA0061.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:46::38) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c8cb038a-7897-4706-029a-08d6fe15ce3e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3363; 
x-ms-traffictypediagnostic: BY5PR18MB3363:
x-microsoft-antispam-prvs: <BY5PR18MB3363C059290114BA8F5CD11DB3F90@BY5PR18MB3363.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 00851CA28B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(346002)(39860400002)(376002)(136003)(366004)(199004)(189003)(14444005)(25786009)(2616005)(5640700003)(6486002)(256004)(66066001)(6436002)(486006)(36756003)(72206003)(11346002)(476003)(446003)(2501003)(3846002)(6116002)(66946007)(386003)(76176011)(52116002)(81156014)(8676002)(14454004)(8936002)(71190400001)(80792005)(2906002)(81166006)(305945005)(99286004)(31696002)(7736002)(102836004)(26005)(186003)(6506007)(86362001)(54906003)(478600001)(4326008)(316002)(66476007)(5660300002)(64756008)(66446008)(68736007)(73956011)(6512007)(71200400001)(31686004)(6916009)(53936002)(66556008)(2351001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3363;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Cao1m4JNvRmBW+lzbBuuzDQq+2oam1KsGKFh9MRsHP6rV4JV8gzfAseQva4sm/xM6egMe+++LzriJWMWUq6ohgoTfjbeVWcSFwzJiQwawPg3FDClXkn6uXWQdcVN5V5V9+mqxvwsV9THj1uKWZxE84yXbm1RJxgdADaBGKhpiSe68Oz15O1o4zIevURCkMRR9os+nzIaLjL9+g8/M+hrjWXxV01g8gQ3D4EzGq6Bu7QLCZaZIqze7qir4845/Y9Zs1WuuKXqTpTiMCnjit5dJqJ7Y3nJu7OUTJb7YXaTE6QU8KVbXx3Jpyf9m8ObrndSw7TLM+oHi2PhIGDyCkvHJ1isLhyAF+OURGTY6uoLt3ao/B8LFZPQASM+72QjDtkMKDT8vS15O8IGF+NIZ0MH8MGmJLKFG0khgAdAqd1qAnw=
Content-ID: <F2F8D19E57E5A2499D352CE00659C817@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c8cb038a-7897-4706-029a-08d6fe15ce3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2019 11:18:12.9571 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3363
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v9 04/23] x86emul: test harness adjustments for
 AVX512F S/G insns
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

VGhlcmUgd2FzIGFuIGVuY29kaW5nIG1pc3Rha2UgaW4gdGhlIEVWRVggRGlzcDggdGVzdCBjb2Rl
LCB3aGljaCB3YXMNCmJlbmlnbiAoZHVlIHRvICVyZHggZ2V0dGluZyBzZXQgdG8gemVybykgdG8g
YWxsIG5vbi12U0lCIHRlc3RzIGFzIGl0DQptaXN0YWtlbmx5IGVuY29kZWQgPGRpc3A4PiglcmR4
LCVyZHgpIGluc3RlYWQgb2YgPGRpc3A4PiglcmR4LCVyaXopLiBJbg0KdGhlIHZTSUIgY2FzZSB0
aGlzIG1lYW50IDxkaXNwOD4oJXJkeCwlem1tMikgaW5zdGVhZCBvZiB0aGUgaW50ZW5kZWQNCjxk
aXNwOD4oJXJkeCwlem1tNCkuDQoNCkxpa2V3aXNlIHRoZSBhY2Nlc3MgY291bnQgY2hlY2sgd2Fz
bid0IGVudGlyZWx5IGNvcnJlY3QgZm9yIHRoZSBTL0cNCmNhc2U6IEluIHRoZSBxdWFkLXdvcmQt
aW5kZXggYnV0IGR3b3JkLWRhdGEgY2FzZSBvbmx5IGhhbGYgdGhlIG51bWJlcg0Kb2YgZnVsbCB2
ZWN0b3IgZWxlbWVudHMgZ2V0IGFjY2Vzc2VkLg0KDQpBcyBhbiB1bnJlbGF0ZWQgY2hhbmdlIGlu
IHRoZSBtYWluIHRlc3QgaGFybmVzcyBzb3VyY2UgZmlsZSBkaXN0aW5ndWlzaA0KdGhlICJuL2Ei
IG1lc3NhZ2VzIGJ5IGJpdG5lc3MuDQoNClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4NCi0tLQ0Kdjk6IE5ldywgc3BsaXQgZnJvbSBtYWluIGdhdGhlciBwYXRj
aC4NCg0KLS0tIGEvdG9vbHMvdGVzdHMveDg2X2VtdWxhdG9yL2V2ZXgtZGlzcDguYw0KKysrIGIv
dG9vbHMvdGVzdHMveDg2X2VtdWxhdG9yL2V2ZXgtZGlzcDguYw0KQEAgLTY5OCw3ICs2OTgsNyBA
QCBzdGF0aWMgdm9pZCB0ZXN0X29uZShjb25zdCBzdHJ1Y3QgdGVzdCAqDQogICAgICBpbnN0clsz
XSA9IGV2ZXgucmF3WzJdOw0KICAgICAgaW5zdHJbNF0gPSB0ZXN0LT5vcGM7DQogICAgICBpbnN0
cls1XSA9IDB4NDQgfCAodGVzdC0+ZXh0IDw8IDMpOyAvKiBNb2RSL00gKi8NCi0gICAgaW5zdHJb
Nl0gPSAweDEyOyAvKiBTSUI6IGJhc2UgckRYLCBpbmRleCBub25lIC8geE1NNCAqLw0KKyAgICBp
bnN0cls2XSA9IDB4MjI7IC8qIFNJQjogYmFzZSByRFgsIGluZGV4IG5vbmUgLyB4TU00ICovDQog
ICAgICBpbnN0cls3XSA9IDE7IC8qIERpc3A4ICovDQogICAgICBpbnN0cls4XSA9IDA7IC8qIGlt
bWVkaWF0ZSwgaWYgYW55ICovDQogIA0KQEAgLTcxOCw3ICs3MTgsOCBAQCBzdGF0aWMgdm9pZCB0
ZXN0X29uZShjb25zdCBzdHJ1Y3QgdGVzdCAqDQogICAgICAgICAgIGlmICggYWNjZXNzZWRbaV0g
KQ0KICAgICAgICAgICAgICAgZ290byBmYWlsOw0KICAgICAgZm9yICggOyBpIDwgKHRlc3QtPnNj
YWxlID09IFNDX3ZsID8gdnN6IDogZXN6KSArIChzZyA/IGVzeiA6IHZzeik7ICsraSApDQotICAg
ICAgICAgaWYgKCBhY2Nlc3NlZFtpXSAhPSAoc2cgPyB2c3ogLyBlc3ogOiAxKSApDQorICAgICAg
ICAgaWYgKCBhY2Nlc3NlZFtpXSAhPSAoc2cgPyAodnN6IC8gZXN6KSA+PiAodGVzdC0+b3BjICYg
MSAmICFldmV4LncpDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgOiAxKSApDQog
ICAgICAgICAgICAgICBnb3RvIGZhaWw7DQogICAgICBmb3IgKCA7IGkgPCBBUlJBWV9TSVpFKGFj
Y2Vzc2VkKTsgKytpICkNCiAgICAgICAgICAgaWYgKCBhY2Nlc3NlZFtpXSApDQotLS0gYS90b29s
cy90ZXN0cy94ODZfZW11bGF0b3IvdGVzdF94ODZfZW11bGF0b3IuYw0KKysrIGIvdG9vbHMvdGVz
dHMveDg2X2VtdWxhdG9yL3Rlc3RfeDg2X2VtdWxhdG9yLmMNCkBAIC00MjYwLDcgKzQyNjAsNyBA
QCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpDQogIA0KICAgICAgICAgIGlmICggIWJs
b2JzW2pdLnNpemUgKQ0KICAgICAgICAgIHsNCi0gICAgICAgICAgICBwcmludGYoIiUtMzlzIG4v
YVxuIiwgYmxvYnNbal0ubmFtZSk7DQorICAgICAgICAgICAgcHJpbnRmKCIlLTM5cyBuL2EgKCV1
LWJpdClcbiIsIGJsb2JzW2pdLm5hbWUsIGJsb2JzW2pdLmJpdG5lc3MpOw0KICAgICAgICAgICAg
ICBjb250aW51ZTsNCiAgICAgICAgICB9DQogIA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
