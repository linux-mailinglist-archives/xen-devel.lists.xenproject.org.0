Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B24F74FAE
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 15:38:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqdtu-0007sD-Fu; Thu, 25 Jul 2019 13:35:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dOpT=VW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hqdts-0007rw-Pn
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 13:35:16 +0000
X-Inumbo-ID: 08c60e32-aee1-11e9-8980-bc764e045a96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 08c60e32-aee1-11e9-8980-bc764e045a96;
 Thu, 25 Jul 2019 13:35:15 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 25 Jul 2019 13:35:13 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 25 Jul 2019 13:31:48 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 25 Jul 2019 13:31:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ca8oLKDEm+902raRTguKMvnBT+yjrMdOAmbRaQKsgd5BDCgYKeJBFi0kfyRrnaAQvbbOoUecX0MOa+oXs/1AYOryPCxr8UrJ6rR0CQHAJVSbSO3uwusKPbv4+/Ik++Tfcg4C9R11dzIGXu+SJyR5p2qOcssPtKNCHJ1vQx62eKMNl/xA/cOcohwwFDovj3+IUXOqhePJjmLFbTCOqp8kCPgTXOKCXapL2OdH5chAC7hds21sNxHr6o8taL4wYi68JRJSjVtFsdRYUBbJbzjq39jPwLgfNaRXvYJQIagNkZs0cFLRDQXnalLeJWbndHBLvVaIDAvao5+0KXq9lIKZyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+16m4J1UQL0y0DjKMtw2xecGJyRvK95vVAUiGBfATUw=;
 b=J/8gx1UBoRiOcSU1sAFwdiqKzoEIF1vBZDjX1x6JaK9+nm/zIRjZ1xXIN6Zr9PM8VYRzfsWKLE8o8QEdI5gLUPmDJDQEormDBQUEY33KPpXIobeK8lKz2vuWIgAwIyeENPVck5Z4fjuDhaU9aBrpGc5k2bQbh4QSVAYy9eD2PyMWCjRB5Att62/QP2xpNctPtc+gx3KFHx5MzBi0tm/1iu54gnendseYGrqv9At3w2jragss1OxWaBMikjPPlaKX0KE6eWZl1rCO+/DpQVNXTUTSd139TtZt+xsNaHzTp9Xw3ykscvxCtzbq9tbonUKRkQKCcFEn2fXGl59JTxrj4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3171.namprd18.prod.outlook.com (10.255.137.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Thu, 25 Jul 2019 13:31:47 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Thu, 25 Jul 2019
 13:31:47 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v4 07/12] AMD/IOMMU: allow enabling with IRQ not yet set
 up
Thread-Index: AQHVQu1OpEi140kijkWlFrEVN+FxhA==
Date: Thu, 25 Jul 2019 13:31:47 +0000
Message-ID: <c291ed9d-cb2c-2b63-fe8f-a6d6b778f504@suse.com>
References: <b8ae110a-f94a-4ed2-5cf9-c00ff1c0cb81@suse.com>
In-Reply-To: <b8ae110a-f94a-4ed2-5cf9-c00ff1c0cb81@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP265CA0051.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::15) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fd5d145f-e5d4-45db-a11b-08d71104713b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3171; 
x-ms-traffictypediagnostic: BY5PR18MB3171:
x-microsoft-antispam-prvs: <BY5PR18MB3171FF15E20C259F945C7893B3C10@BY5PR18MB3171.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(376002)(366004)(136003)(346002)(39860400002)(199004)(189003)(81166006)(11346002)(26005)(6116002)(478600001)(446003)(256004)(52116002)(186003)(316002)(2501003)(81156014)(476003)(5640700003)(2351001)(5660300002)(3846002)(486006)(2616005)(54906003)(66066001)(8676002)(6436002)(80792005)(66946007)(76176011)(71200400001)(31686004)(86362001)(71190400001)(99286004)(6486002)(8936002)(64756008)(66556008)(53936002)(6506007)(66446008)(2906002)(14454004)(6916009)(102836004)(7736002)(31696002)(6512007)(36756003)(305945005)(68736007)(4326008)(66476007)(14444005)(25786009)(386003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3171;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KtTPRZBhe5po2qKw7seFtzLls7Doayv/D0C6aN8tocBwSGDysxxCaM1otKIjMYnoueGswmEfoVb0Lq474HE3mjuUwksPbPU3CMNb9L+BNED02kbRfTtdfpI3N+oCnlmxcNVUCOZGsU9Qu6gStdlqQP5sbISmuqF5GBHNDOnfm0ILB4iZFMOJF85SRyKh4csDwU4IW6LpAd3kg457PDqN+jxilcmQ0fMCGii+c7xTAffiPcytZSXkmmZr2MVQT16m/U6u/+qhA3d9ctYhHal1+kSX89LpZFr7W9cojtHQsmvpSoRj/ljMJWnbdf2+oMcl87aSXO0c9b1+nyuA2NCRVCEoH0FYpQ3ma+fqgPnAXVmslMfo0UmCsrV9qwzel1fNheeN6xT31AQ87vgmQmT4mgpq4OvWyCnhmzb9iU4br/c=
Content-ID: <7778D3377B511447929674775A58C86C@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fd5d145f-e5d4-45db-a11b-08d71104713b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 13:31:47.5078 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3171
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v4 07/12] AMD/IOMMU: allow enabling with IRQ not
 yet set up
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

RWFybHkgZW5hYmxpbmcgKHRvIGVudGVyIHgyQVBJQyBtb2RlKSByZXF1aXJlcyBkZWZlcnJpbmcg
b2YgdGhlIElSUQ0Kc2V0dXAuIENvZGUgdG8gYWN0dWFsbHkgZG8gdGhhdCBzZXR1cCBpbiB0aGUg
eDJBUElDIGNhc2Ugd2lsbCBnZXQgYWRkZWQNCnN1YnNlcXVlbnRseS4NCg0KU2lnbmVkLW9mZi1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KQWNrZWQtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQpBY2tlZC1ieTogQnJpYW4gV29vZHMgPGJy
aWFuLndvb2RzQGFtZC5jb20+DQotLS0NCnYzOiBSZS1iYXNlLg0KDQotLS0gYS94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5pdC5jDQorKysgYi94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC9hbWQvaW9tbXVfaW5pdC5jDQpAQCAtODEzLDcgKzgxMyw2IEBAIHN0YXRpYyB2b2lkIGFt
ZF9pb21tdV9lcnJhdHVtXzc0Nl93b3JrYXINCiAgc3RhdGljIHZvaWQgZW5hYmxlX2lvbW11KHN0
cnVjdCBhbWRfaW9tbXUgKmlvbW11KQ0KICB7DQogICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOw0K
LSAgICBzdHJ1Y3QgaXJxX2Rlc2MgKmRlc2M7DQogIA0KICAgICAgc3Bpbl9sb2NrX2lycXNhdmUo
JmlvbW11LT5sb2NrLCBmbGFncyk7DQogIA0KQEAgLTgzMywxOSArODMyLDI3IEBAIHN0YXRpYyB2
b2lkIGVuYWJsZV9pb21tdShzdHJ1Y3QgYW1kX2lvbW0NCiAgICAgIGlmICggaW9tbXUtPmZlYXR1
cmVzLmZsZHMucHByX3N1cCApDQogICAgICAgICAgcmVnaXN0ZXJfaW9tbXVfcHByX2xvZ19pbl9t
bWlvX3NwYWNlKGlvbW11KTsNCiAgDQotICAgIGRlc2MgPSBpcnFfdG9fZGVzYyhpb21tdS0+bXNp
LmlycSk7DQotICAgIHNwaW5fbG9jaygmZGVzYy0+bG9jayk7DQotICAgIHNldF9tc2lfYWZmaW5p
dHkoZGVzYywgTlVMTCk7DQotICAgIHNwaW5fdW5sb2NrKCZkZXNjLT5sb2NrKTsNCisgICAgaWYg
KCBpb21tdS0+bXNpLmlycSA+IDAgKQ0KKyAgICB7DQorICAgICAgICBzdHJ1Y3QgaXJxX2Rlc2Mg
KmRlc2MgPSBpcnFfdG9fZGVzYyhpb21tdS0+bXNpLmlycSk7DQorDQorICAgICAgICBzcGluX2xv
Y2soJmRlc2MtPmxvY2spOw0KKyAgICAgICAgc2V0X21zaV9hZmZpbml0eShkZXNjLCBOVUxMKTsN
CisgICAgICAgIHNwaW5fdW5sb2NrKCZkZXNjLT5sb2NrKTsNCisgICAgfQ0KICANCiAgICAgIGFt
ZF9pb21tdV9tc2lfZW5hYmxlKGlvbW11LCBJT01NVV9DT05UUk9MX0VOQUJMRUQpOw0KICANCiAg
ICAgIHNldF9pb21tdV9odF9mbGFncyhpb21tdSk7DQogICAgICBzZXRfaW9tbXVfY29tbWFuZF9i
dWZmZXJfY29udHJvbChpb21tdSwgSU9NTVVfQ09OVFJPTF9FTkFCTEVEKTsNCi0gICAgc2V0X2lv
bW11X2V2ZW50X2xvZ19jb250cm9sKGlvbW11LCBJT01NVV9DT05UUk9MX0VOQUJMRUQpOw0KICAN
Ci0gICAgaWYgKCBpb21tdS0+ZmVhdHVyZXMuZmxkcy5wcHJfc3VwICkNCi0gICAgICAgIHNldF9p
b21tdV9wcHJfbG9nX2NvbnRyb2woaW9tbXUsIElPTU1VX0NPTlRST0xfRU5BQkxFRCk7DQorICAg
IGlmICggaW9tbXUtPm1zaS5pcnEgPiAwICkNCisgICAgew0KKyAgICAgICAgc2V0X2lvbW11X2V2
ZW50X2xvZ19jb250cm9sKGlvbW11LCBJT01NVV9DT05UUk9MX0VOQUJMRUQpOw0KKw0KKyAgICAg
ICAgaWYgKCBpb21tdS0+ZmVhdHVyZXMuZmxkcy5wcHJfc3VwICkNCisgICAgICAgICAgICBzZXRf
aW9tbXVfcHByX2xvZ19jb250cm9sKGlvbW11LCBJT01NVV9DT05UUk9MX0VOQUJMRUQpOw0KKyAg
ICB9DQogIA0KICAgICAgaWYgKCBpb21tdS0+ZmVhdHVyZXMuZmxkcy5ndF9zdXAgKQ0KICAgICAg
ICAgIHNldF9pb21tdV9ndWVzdF90cmFuc2xhdGlvbl9jb250cm9sKGlvbW11LCBJT01NVV9DT05U
Uk9MX0VOQUJMRUQpOw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
