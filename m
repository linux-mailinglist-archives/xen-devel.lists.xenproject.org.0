Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 332676ACF7
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 18:42:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnQUh-0002lc-G8; Tue, 16 Jul 2019 16:39:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LiPz=VN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hnQUg-0002lU-B1
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 16:39:58 +0000
X-Inumbo-ID: 57c5bd39-a7e8-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 57c5bd39-a7e8-11e9-8980-bc764e045a96;
 Tue, 16 Jul 2019 16:39:56 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 16 Jul 2019 16:39:55 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 16 Jul 2019 16:37:27 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 16 Jul 2019 16:37:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AnEDs38BXRfIOf5GfJ2wM48jTVUasEWpKTc0WRHw0HAheReGm/mfnhZhusydu9Tt531WXnn8cZR/Tr3O5nPgClE7iNjc3wIedJ2PY9PBGawt30Z6DJZe3KHBmACJAlumh9o7n6uyJ8N46Q/rlkuSXiAoaaqCu6PbTC7tBK8Sr40/aBzPVLfyvnVZBF/esK+2Lpvf2xCVBoRLdykCwKVq0whHtwLKinttDgOBiRwPKZ4wJnuuvmw0lFa+Ab1i3ypVPAFw+2/tQ25FomAvIsSZ/e3Vl59BjBIN1UUWzR8od1BLNGC21GvstLbrXb41NyWv+kojJ/EG2FNWpHrqkno35A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=74tPzzI88SGeLujMDy+MkuBhcruVjVhC7jmG06u5pj0=;
 b=LiIBUcr5Qz5z579NQIV06osFySQBCm5Sfemkyy5wiVF9KVGgFwKyA5q99ZL4njXN1dmOJjVZrTaP0o/Rsja7X0+/dUaNhFVY7EsmpF7hcFWLLRATXokcgSE6PzzwPFaV4W518+flPzJ2wux7/IEMykTrWgAzUML4ZWJ7KLmKMu+YcIu8jxbtTTGl7woFXhZmKDYQW1jpJdUBceFtvY/21u/+ygypu5O2KCgtWJO1A07uz8o5SJLTawIemYAKqYBA33LsZRzvVCqZUYPBGtKMEoucbl74uIEzpYPcbhAkubyg1OUxaktSfn/mx8mXsp6aH75l5wVEZqItbDWYFh3L0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3164.namprd18.prod.outlook.com (10.255.172.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Tue, 16 Jul 2019 16:37:26 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 16:37:26 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v3 06/14] AMD/IOMMU: pass IOMMU to
 amd_iommu_alloc_intremap_table()
Thread-Index: AQHVO/TAIRl5Ah5EYkaFnnBT6ODwsg==
Date: Tue, 16 Jul 2019 16:37:26 +0000
Message-ID: <56c60443-083e-7e86-636c-4095a399f048@suse.com>
References: <6272c301-a905-38cf-dd1a-645f3d703241@suse.com>
In-Reply-To: <6272c301-a905-38cf-dd1a-645f3d703241@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0062.eurprd07.prod.outlook.com
 (2603:10a6:6:2a::24) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a451fa1a-ab55-46de-d266-08d70a0be2ee
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3164; 
x-ms-traffictypediagnostic: DM6PR18MB3164:
x-microsoft-antispam-prvs: <DM6PR18MB316433CFFFD777F530D8EB9DB3CE0@DM6PR18MB3164.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(39860400002)(136003)(376002)(396003)(366004)(199004)(189003)(31696002)(14444005)(256004)(6512007)(36756003)(86362001)(53936002)(8676002)(6436002)(486006)(6486002)(66556008)(66946007)(66476007)(64756008)(5640700003)(66446008)(6506007)(66066001)(2906002)(446003)(6916009)(31686004)(2616005)(476003)(81156014)(386003)(11346002)(81166006)(3846002)(2351001)(71190400001)(80792005)(2501003)(186003)(4326008)(26005)(8936002)(52116002)(305945005)(25786009)(68736007)(54906003)(14454004)(316002)(478600001)(7736002)(102836004)(99286004)(76176011)(71200400001)(5660300002)(6116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3164;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2tNJdnVQOAu7+I6YBRYiN8gYZiHDMOg7HZ/FQ64nmSAjLenXATXuixj1Bfkt3UcSfPZy7N47EUE3Ey66KK0e9klYi5wPSZMVDllRYQnBr00VwlsxIv8rOZjvO6fWd3GmNpqJTkf5yoWM7r+YGnTXeqwvrkBA8xKt/1I/8ndyQa8HfE79onhy7A+iTnF5obKG+AkJwFC69EG4MWE5Jy74FotEWqp6H5jy7z7iXlVF5nFUe2hCw2r1JaF2TIn2q7D3c3/40Mo7T0HsW7qRftp22GIPjk5R+VEhEmvq7r/dbHF2mj1eae/C6Fm6tQ2oJd+jdFwZ5fWggdG5scBvg7HOUO6exHqUgW/Ilyiik2j12/gosxVASLhYzjSXPBkYSO7ShhZOC4p5hTckpJMSGTduaKZnsqIHz378Hnqc6yEH8pI=
Content-ID: <0D03648D6723FC408CFAA019DEE64E46@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a451fa1a-ab55-46de-d266-08d70a0be2ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 16:37:26.5464 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3164
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v3 06/14] AMD/IOMMU: pass IOMMU to
 amd_iommu_alloc_intremap_table()
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGZ1bmN0aW9uIHdpbGwgd2FudCB0byBrbm93IElPTU1VIHByb3BlcnRpZXMgKHNwZWNpZmlj
YWxseSB0aGUgSVJURQ0Kc2l6ZSkgc3Vic2VxdWVudGx5Lg0KDQpDb3JyZWN0IGluZGVudGF0aW9u
IG9mIG9uZSBvZiB0aGUgY2FsbCBzaXRlcyBhdCB0aGlzIG9jY2FzaW9uLg0KDQpTaWduZWQtb2Zm
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQotLS0NCnYzOiBOZXcuDQoNCi0t
LSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9hY3BpLmMNCisrKyBiL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9hY3BpLmMNCkBAIC03NCwxMiArNzQsMTQgQEAg
c3RhdGljIHZvaWQgX19pbml0IGFkZF9pdnJzX21hcHBpbmdfZW50cg0KICAgICAgICAgICAvKiBh
bGxvY2F0ZSBwZXItZGV2aWNlIGludGVycnVwdCByZW1hcHBpbmcgdGFibGUgKi8NCiAgICAgICAg
ICAgaWYgKCBhbWRfaW9tbXVfcGVyZGV2X2ludHJlbWFwICkNCiAgICAgICAgICAgICAgIGl2cnNf
bWFwcGluZ3NbYWxpYXNfaWRdLmludHJlbWFwX3RhYmxlID0NCi0gICAgICAgICAgICAgICAgYW1k
X2lvbW11X2FsbG9jX2ludHJlbWFwX3RhYmxlKA0KLSAgICAgICAgICAgICAgICAgICAgJml2cnNf
bWFwcGluZ3NbYWxpYXNfaWRdLmludHJlbWFwX2ludXNlKTsNCisgICAgICAgICAgICAgICAgIGFt
ZF9pb21tdV9hbGxvY19pbnRyZW1hcF90YWJsZSgNCisgICAgICAgICAgICAgICAgICAgICBpb21t
dSwNCisgICAgICAgICAgICAgICAgICAgICAmaXZyc19tYXBwaW5nc1thbGlhc19pZF0uaW50cmVt
YXBfaW51c2UpOw0KICAgICAgICAgICBlbHNlDQogICAgICAgICAgIHsNCiAgICAgICAgICAgICAg
IGlmICggc2hhcmVkX2ludHJlbWFwX3RhYmxlID09IE5VTEwgICkNCiAgICAgICAgICAgICAgICAg
ICBzaGFyZWRfaW50cmVtYXBfdGFibGUgPSBhbWRfaW9tbXVfYWxsb2NfaW50cmVtYXBfdGFibGUo
DQorICAgICAgICAgICAgICAgICAgICAgaW9tbXUsDQogICAgICAgICAgICAgICAgICAgICAgICZz
aGFyZWRfaW50cmVtYXBfaW51c2UpOw0KICAgICAgICAgICAgICAgaXZyc19tYXBwaW5nc1thbGlh
c19pZF0uaW50cmVtYXBfdGFibGUgPSBzaGFyZWRfaW50cmVtYXBfdGFibGU7DQogICAgICAgICAg
ICAgICBpdnJzX21hcHBpbmdzW2FsaWFzX2lkXS5pbnRyZW1hcF9pbnVzZSA9IHNoYXJlZF9pbnRy
ZW1hcF9pbnVzZTsNCi0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbnRy
LmMNCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbnRyLmMNCkBAIC02
MzIsNyArNjMyLDggQEAgaW50IF9faW5pdCBhbWRfaW9tbXVfZnJlZV9pbnRyZW1hcF90YWJsZQ0K
ICAgICAgcmV0dXJuIDA7DQogIH0NCiAgDQotdm9pZCogX19pbml0IGFtZF9pb21tdV9hbGxvY19p
bnRyZW1hcF90YWJsZSh1bnNpZ25lZCBsb25nICoqaW51c2VfbWFwKQ0KK3ZvaWQgKl9faW5pdCBh
bWRfaW9tbXVfYWxsb2NfaW50cmVtYXBfdGFibGUoDQorICAgIGNvbnN0IHN0cnVjdCBhbWRfaW9t
bXUgKmlvbW11LCB1bnNpZ25lZCBsb25nICoqaW51c2VfbWFwKQ0KICB7DQogICAgICB2b2lkICp0
YjsNCiAgICAgIHRiID0gX19hbGxvY19hbWRfaW9tbXVfdGFibGVzKElOVFJFTUFQX1RBQkxFX09S
REVSKTsNCi0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3N2bS9hbWQtaW9tbXUtcHJvdG8u
aA0KKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vc3ZtL2FtZC1pb21tdS1wcm90by5oDQpA
QCAtOTcsNyArOTcsOCBAQCBzdHJ1Y3QgYW1kX2lvbW11ICpmaW5kX2lvbW11X2Zvcl9kZXZpY2Uo
DQogIA0KICAvKiBpbnRlcnJ1cHQgcmVtYXBwaW5nICovDQogIGludCBhbWRfaW9tbXVfc2V0dXBf
aW9hcGljX3JlbWFwcGluZyh2b2lkKTsNCi12b2lkICphbWRfaW9tbXVfYWxsb2NfaW50cmVtYXBf
dGFibGUodW5zaWduZWQgbG9uZyAqKik7DQordm9pZCAqYW1kX2lvbW11X2FsbG9jX2ludHJlbWFw
X3RhYmxlKA0KKyAgICBjb25zdCBzdHJ1Y3QgYW1kX2lvbW11ICosIHVuc2lnbmVkIGxvbmcgKiop
Ow0KICBpbnQgYW1kX2lvbW11X2ZyZWVfaW50cmVtYXBfdGFibGUoDQogICAgICBjb25zdCBzdHJ1
Y3QgYW1kX2lvbW11ICosIHN0cnVjdCBpdnJzX21hcHBpbmdzICopOw0KICB2b2lkIGFtZF9pb21t
dV9pb2FwaWNfdXBkYXRlX2lyZSgNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
