Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 500E874FFD
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 15:47:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqe2h-0001ib-EP; Thu, 25 Jul 2019 13:44:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dOpT=VW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hqe2g-0001iW-Cs
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 13:44:22 +0000
X-Inumbo-ID: 4db09cfc-aee2-11e9-8a08-13adfeeaf6e3
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4db09cfc-aee2-11e9-8a08-13adfeeaf6e3;
 Thu, 25 Jul 2019 13:44:20 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 25 Jul 2019 13:44:19 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 25 Jul 2019 13:33:03 +0000
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 25 Jul 2019 13:33:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jwSqGJehYqEZ1VQl4/zKsqOZYkYK8OEQWjU8LhM8UfeNGQ3V6WHIx58GbQ8tEZ+VtI6pwMXD3+YRFMTiv49ZhR0m14Ta72cSkQIkXPTHwA3AK6yqW5zczEsRi/u/wp19AWA8OdmLjpKj0S6dTidlvBmnY9BVRTKV2CxSKmtnjBd+vDZ26BEhaSI1ePWJ1tihbJILEhFQMKNrPUl5x61BDvPAhp1NGpUDr72/fdzq1SWmpDH36fuINnM8jst7zgx7uTwQUPa3ikWWgFCkW/cAJMGpp31siwPxuSUG9eYn+ArtFPWHuc5bUS2rdxmLuO6Bxgg8xbjP7neWRAbSvQSKLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pIyqabplN14fgz4EkKbOFniT4RZ9Lfwxekxf4Eu8pFE=;
 b=irh9gEVD9GShfF294fxjeX7+smU1sdat4H+180gqukVWQV002COmp/emIYQV7zIe1ZUx0WN0wmi7heh3xyKa6b+icBMmXE7yPuP9OjdP1aAmYKw1E8HIFTMcukf5jbKgP+w4SokAneQHDVoy3a7LIHw/eKWRSnizn0ixoYiLoRojUQvwm5pFbevJtAJ0hHa4JknwQV09nlhbsAG+VefKvfV3d7CQEqbqutL4a6guDcBo+x7e++dv+S1PLzRIyO/f+IG2jY6y6WTVEk/LlZrXAt8IRIJlv+Rq6dpI5I4UIjSq7O/vGJlvn1fUj/0PTsgAjoxDFo7PNBP4PNcKZS2iKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3297.namprd18.prod.outlook.com (10.255.163.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Thu, 25 Jul 2019 13:33:02 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Thu, 25 Jul 2019
 13:33:02 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v4 10/12] AMD/IOMMU: correct IRTE updating
Thread-Index: AQHVQu17aVBEsWEaZU+c1whcO45+lA==
Date: Thu, 25 Jul 2019 13:33:02 +0000
Message-ID: <0ca33ff2-6a66-fce1-1b62-fb30394398bf@suse.com>
References: <b8ae110a-f94a-4ed2-5cf9-c00ff1c0cb81@suse.com>
In-Reply-To: <b8ae110a-f94a-4ed2-5cf9-c00ff1c0cb81@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0040.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::28) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: daf288ce-ebff-4a33-1701-08d711049dd8
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3297; 
x-ms-traffictypediagnostic: BY5PR18MB3297:
x-microsoft-antispam-prvs: <BY5PR18MB3297207F76709B291279EB35B3C10@BY5PR18MB3297.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(366004)(136003)(396003)(376002)(346002)(189003)(199004)(6436002)(53936002)(2906002)(386003)(6506007)(2501003)(86362001)(478600001)(5660300002)(64756008)(4326008)(66556008)(305945005)(6486002)(31696002)(486006)(25786009)(66066001)(6512007)(102836004)(80792005)(66946007)(5640700003)(14454004)(26005)(66446008)(7736002)(14444005)(446003)(52116002)(99286004)(76176011)(54906003)(6116002)(3846002)(31686004)(316002)(81166006)(81156014)(6916009)(8676002)(8936002)(68736007)(2616005)(66476007)(11346002)(256004)(71190400001)(71200400001)(36756003)(476003)(2351001)(186003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3297;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pb5p+OaE7wQ0BEJ70uWGiiqeiFxptqqoNL/vVTh/GxxRsw6gE0ay21943YDN7tX0dJw7HuhBBAAxVDVLtcpmisHgZOh9zLPONh701sxIjeWNNrNVNyr/3x4W8Um/RhGT9B2qtP26wnTNXyBnp+9UurqkymRfKPGAT0x+2lqyHcxXGcEUGMRek+uV8WI3c+ZndJ3t/s6x4Bz5iXhaPeuvDJJi2f8VwXgiuBRPscp0xGYIQR0PEHHga2mu9c/YBbS0AB1Y2vZ8Py2M9s2LUckcwKI/KXfuLJsBI8NsvDItrkLqWi1yBnc4tfnD7EPdfxP/xqOnGr4M5uBGrzFMH4NsLLW+0HLHpqhV54Ijs3HbR4sf7NO4kquFmt/JuRI2KyWV3oHVjpgo64h5XFwdBQ3mBSIx/eM/kQxJKmDaXvRwU/4=
Content-ID: <66DD3682B53AC945810EB96916740A6A@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: daf288ce-ebff-4a33-1701-08d711049dd8
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 13:33:02.3599 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3297
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v4 10/12] AMD/IOMMU: correct IRTE updating
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

Rmx1c2hpbmcgZGlkbid0IGdldCBkb25lIGFsb25nIHRoZSBsaW5lcyBvZiB3aGF0IHRoZSBzcGVj
aWZpY2F0aW9uIHNheXMuDQpNYXJrIGVudHJpZXMgdG8gYmUgdXBkYXRlZCBhcyBub3QgcmVtYXBw
ZWQgKHdoaWNoIHdpbGwgcmVzdWx0IGluDQppbnRlcnJ1cHQgcmVxdWVzdHMgdG8gZ2V0IHRhcmdl
dCBhYm9ydGVkLCBidXQgdGhlIGludGVycnVwdHMgc2hvdWxkIGJlDQptYXNrZWQgYW55d2F5IGF0
IHRoYXQgcG9pbnQgaW4gdGltZSksIGlzc3VlIHRoZSBmbHVzaCwgYW5kIG9ubHkgdGhlbg0Kd3Jp
dGUgdGhlIG5ldyBlbnRyeS4NCg0KSW4gdXBkYXRlX2ludHJlbWFwX2VudHJ5X2Zyb21fbXNpX21z
ZygpIGFsc28gZm9sZCB0aGUgZHVwbGljYXRlIGluaXRpYWwNCmxvY2sgZGV0ZXJtaW5hdGlvbiBh
bmQgYWNxdWlyZSBpbnRvIGp1c3QgYSBzaW5nbGUgaW5zdGFuY2UuDQoNClNpZ25lZC1vZmYtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCkFja2VkLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KLS0tDQpSRkM6IFB1dHRpbmcgdGhlIGZsdXNo
IGludm9jYXRpb25zIGluIGxvb3BzIGlzbid0IG92ZXJseSBuaWNlLCBidXQgSQ0KICAgICAgZG9u
J3QgdGhpbmsgdGhpcyBjYW4gcmVhbGx5IGJlIGFidXNlZCwgc2luY2UgY2FsbGVycyB1cCB0aGUg
c3RhY2sNCiAgICAgIGhvbGQgZnVydGhlciBsb2Nrcy4gTmV2ZXJ0aGVsZXNzIEknZCBsaWtlIHRv
IGFzayBmb3IgYmV0dGVyDQogICAgICBzdWdnZXN0aW9ucy4NCi0tLQ0KdjQ6IFJlLWJhc2UuDQp2
MzogUmVtb3ZlIHN0YWxlIHBhcnRzIG9mIGRlc2NyaXB0aW9uLiBSZS1iYXNlLg0KdjI6IFBhcnRz
IG1vcnBoZWQgaW50byBlYXJsaWVyIHBhdGNoLg0KDQotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC9hbWQvaW9tbXVfaW50ci5jDQorKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQv
aW9tbXVfaW50ci5jDQpAQCAtMjEzLDE1ICsyMTMsMTMgQEAgc3RhdGljIHZvaWQgdXBkYXRlX2lu
dHJlbWFwX2VudHJ5KGNvbnN0DQogICAgICAgICAgICAgIH0sDQogICAgICAgICAgfTsNCiAgDQot
ICAgICAgICBBQ0NFU1NfT05DRShlbnRyeS5wdHIxMjgtPnJhd1swXSkgPSAwOw0KKyAgICAgICAg
QVNTRVJUKCFlbnRyeS5wdHIxMjgtPmZ1bGwucmVtYXBfZW4pOw0KKyAgICAgICAgZW50cnkucHRy
MTI4LT5yYXdbMV0gPSBpcnRlLnJhd1sxXTsNCiAgICAgICAgICAvKg0KLSAgICAgICAgICogTG93
IGhhbGYsIGluIHBhcnRpY3VsYXIgUmVtYXBFbiwgbmVlZHMgdG8gYmUgY2xlYXJlZCBmaXJzdC4g
IFNlZQ0KKyAgICAgICAgICogSGlnaCBoYWxmIG5lZWRzIHRvIGJlIHNldCBiZWZvcmUgbG93IG9u
ZSAoY29udGFpbmluZyBSZW1hcEVuKS4gIFNlZQ0KICAgICAgICAgICAqIGNvbW1lbnQgaW4gZnJl
ZV9pbnRyZW1hcF9lbnRyeSgpIHJlZ2FyZGluZyB0aGUgY2hvaWNlIG9mIGJhcnJpZXIuDQogICAg
ICAgICAgICovDQogICAgICAgICAgc21wX3dtYigpOw0KLSAgICAgICAgZW50cnkucHRyMTI4LT5y
YXdbMV0gPSBpcnRlLnJhd1sxXTsNCi0gICAgICAgIC8qIEhpZ2ggaGFsZiBuZWVkcyB0byBiZSBz
ZXQgYmVmb3JlIGxvdyBvbmUgKGNvbnRhaW5pbmcgUmVtYXBFbikuICovDQotICAgICAgICBzbXBf
d21iKCk7DQogICAgICAgICAgQUNDRVNTX09OQ0UoZW50cnkucHRyMTI4LT5yYXdbMF0pID0gaXJ0
ZS5yYXdbMF07DQogICAgICB9DQogICAgICBlbHNlDQpAQCAtMjk2LDYgKzI5NCwyMCBAQCBzdGF0
aWMgaW50IHVwZGF0ZV9pbnRyZW1hcF9lbnRyeV9mcm9tX2lvDQogICAgICB9DQogIA0KICAgICAg
ZW50cnkgPSBnZXRfaW50cmVtYXBfZW50cnkoaW9tbXUsIHJlcV9pZCwgb2Zmc2V0KTsNCisNCisg
ICAgLyogVGhlIFJlbWFwRW4gZmllbGRzIG1hdGNoIGZvciBhbGwgZm9ybWF0cy4gKi8NCisgICAg
d2hpbGUgKCBpb21tdS0+ZW5hYmxlZCAmJiBlbnRyeS5wdHIzMi0+Zmxkcy5yZW1hcF9lbiApDQor
ICAgIHsNCisgICAgICAgIGVudHJ5LnB0cjMyLT5mbGRzLnJlbWFwX2VuID0gZmFsc2U7DQorICAg
ICAgICBzcGluX3VubG9jayhsb2NrKTsNCisNCisgICAgICAgIHNwaW5fbG9jaygmaW9tbXUtPmxv
Y2spOw0KKyAgICAgICAgYW1kX2lvbW11X2ZsdXNoX2ludHJlbWFwKGlvbW11LCByZXFfaWQpOw0K
KyAgICAgICAgc3Bpbl91bmxvY2soJmlvbW11LT5sb2NrKTsNCisNCisgICAgICAgIHNwaW5fbG9j
ayhsb2NrKTsNCisgICAgfQ0KKw0KICAgICAgaWYgKCBmcmVzaCApDQogICAgICAgICAgLyogbm90
aGluZyAqLzsNCiAgICAgIGVsc2UgaWYgKCAhbG9fdXBkYXRlICkNCkBAIC0zMjUsMTMgKzMzNyw2
IEBAIHN0YXRpYyBpbnQgdXBkYXRlX2ludHJlbWFwX2VudHJ5X2Zyb21faW8NCiAgDQogICAgICBz
cGluX3VubG9ja19pcnFyZXN0b3JlKGxvY2ssIGZsYWdzKTsNCiAgDQotICAgIGlmICggaW9tbXUt
PmVuYWJsZWQgJiYgIWZyZXNoICkNCi0gICAgew0KLSAgICAgICAgc3Bpbl9sb2NrX2lycXNhdmUo
JmlvbW11LT5sb2NrLCBmbGFncyk7DQotICAgICAgICBhbWRfaW9tbXVfZmx1c2hfaW50cmVtYXAo
aW9tbXUsIHJlcV9pZCk7DQotICAgICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZpb21tdS0+
bG9jaywgZmxhZ3MpOw0KLSAgICB9DQotDQogICAgICBzZXRfcnRlX2luZGV4KHJ0ZSwgb2Zmc2V0
KTsNCiAgDQogICAgICByZXR1cm4gMDsNCkBAIC01ODcsMTkgKzU5MiwyNyBAQCBzdGF0aWMgaW50
IHVwZGF0ZV9pbnRyZW1hcF9lbnRyeV9mcm9tX21zDQogICAgICByZXFfaWQgPSBnZXRfZG1hX3Jl
cXVlc3Rvcl9pZChpb21tdS0+c2VnLCBiZGYpOw0KICAgICAgYWxpYXNfaWQgPSBnZXRfaW50cmVt
YXBfcmVxdWVzdG9yX2lkKGlvbW11LT5zZWcsIGJkZik7DQogIA0KKyAgICBsb2NrID0gZ2V0X2lu
dHJlbWFwX2xvY2soaW9tbXUtPnNlZywgcmVxX2lkKTsNCisgICAgc3Bpbl9sb2NrX2lycXNhdmUo
bG9jaywgZmxhZ3MpOw0KKw0KICAgICAgaWYgKCBtc2cgPT0gTlVMTCApDQogICAgICB7DQotICAg
ICAgICBsb2NrID0gZ2V0X2ludHJlbWFwX2xvY2soaW9tbXUtPnNlZywgcmVxX2lkKTsNCi0gICAg
ICAgIHNwaW5fbG9ja19pcnFzYXZlKGxvY2ssIGZsYWdzKTsNCiAgICAgICAgICBmb3IgKCBpID0g
MDsgaSA8IG5yOyArK2kgKQ0KICAgICAgICAgICAgICBmcmVlX2ludHJlbWFwX2VudHJ5KGlvbW11
LCByZXFfaWQsICpyZW1hcF9pbmRleCArIGkpOw0KICAgICAgICAgIHNwaW5fdW5sb2NrX2lycXJl
c3RvcmUobG9jaywgZmxhZ3MpOw0KLSAgICAgICAgZ290byBkb25lOw0KLSAgICB9DQogIA0KLSAg
ICBsb2NrID0gZ2V0X2ludHJlbWFwX2xvY2soaW9tbXUtPnNlZywgcmVxX2lkKTsNCisgICAgICAg
IGlmICggaW9tbXUtPmVuYWJsZWQgKQ0KKyAgICAgICAgew0KKyAgICAgICAgICAgIHNwaW5fbG9j
a19pcnFzYXZlKCZpb21tdS0+bG9jaywgZmxhZ3MpOw0KKyAgICAgICAgICAgIGFtZF9pb21tdV9m
bHVzaF9pbnRyZW1hcChpb21tdSwgcmVxX2lkKTsNCisgICAgICAgICAgICBpZiAoIGFsaWFzX2lk
ICE9IHJlcV9pZCApDQorICAgICAgICAgICAgICAgIGFtZF9pb21tdV9mbHVzaF9pbnRyZW1hcChp
b21tdSwgYWxpYXNfaWQpOw0KKyAgICAgICAgICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmlv
bW11LT5sb2NrLCBmbGFncyk7DQorICAgICAgICB9DQorDQorICAgICAgICByZXR1cm4gMDsNCisg
ICAgfQ0KICANCi0gICAgc3Bpbl9sb2NrX2lycXNhdmUobG9jaywgZmxhZ3MpOw0KICAgICAgZGVz
dF9tb2RlID0gKG1zZy0+YWRkcmVzc19sbyA+PiBNU0lfQUREUl9ERVNUTU9ERV9TSElGVCkgJiAw
eDE7DQogICAgICBkZWxpdmVyeV9tb2RlID0gKG1zZy0+ZGF0YSA+PiBNU0lfREFUQV9ERUxJVkVS
WV9NT0RFX1NISUZUKSAmIDB4MTsNCiAgICAgIHZlY3RvciA9IChtc2ctPmRhdGEgPj4gTVNJX0RB
VEFfVkVDVE9SX1NISUZUKSAmIE1TSV9EQVRBX1ZFQ1RPUl9NQVNLOw0KQEAgLTYyMyw2ICs2MzYs
MjIgQEAgc3RhdGljIGludCB1cGRhdGVfaW50cmVtYXBfZW50cnlfZnJvbV9tcw0KICAgICAgfQ0K
ICANCiAgICAgIGVudHJ5ID0gZ2V0X2ludHJlbWFwX2VudHJ5KGlvbW11LCByZXFfaWQsIG9mZnNl
dCk7DQorDQorICAgIC8qIFRoZSBSZW1hcEVuIGZpZWxkcyBtYXRjaCBmb3IgYWxsIGZvcm1hdHMu
ICovDQorICAgIHdoaWxlICggaW9tbXUtPmVuYWJsZWQgJiYgZW50cnkucHRyMzItPmZsZHMucmVt
YXBfZW4gKQ0KKyAgICB7DQorICAgICAgICBlbnRyeS5wdHIzMi0+Zmxkcy5yZW1hcF9lbiA9IGZh
bHNlOw0KKyAgICAgICAgc3Bpbl91bmxvY2sobG9jayk7DQorDQorICAgICAgICBzcGluX2xvY2so
JmlvbW11LT5sb2NrKTsNCisgICAgICAgIGFtZF9pb21tdV9mbHVzaF9pbnRyZW1hcChpb21tdSwg
cmVxX2lkKTsNCisgICAgICAgIGlmICggYWxpYXNfaWQgIT0gcmVxX2lkICkNCisgICAgICAgICAg
ICBhbWRfaW9tbXVfZmx1c2hfaW50cmVtYXAoaW9tbXUsIGFsaWFzX2lkKTsNCisgICAgICAgIHNw
aW5fdW5sb2NrKCZpb21tdS0+bG9jayk7DQorDQorICAgICAgICBzcGluX2xvY2sobG9jayk7DQor
ICAgIH0NCisNCiAgICAgIHVwZGF0ZV9pbnRyZW1hcF9lbnRyeShpb21tdSwgZW50cnksIHZlY3Rv
ciwgZGVsaXZlcnlfbW9kZSwgZGVzdF9tb2RlLCBkZXN0KTsNCiAgICAgIHNwaW5fdW5sb2NrX2ly
cXJlc3RvcmUobG9jaywgZmxhZ3MpOw0KICANCkBAIC02NDIsMTYgKzY3MSw2IEBAIHN0YXRpYyBp
bnQgdXBkYXRlX2ludHJlbWFwX2VudHJ5X2Zyb21fbXMNCiAgICAgICAgICAgICAgICAgZ2V0X2l2
cnNfbWFwcGluZ3MoaW9tbXUtPnNlZylbYWxpYXNfaWRdLmludHJlbWFwX3RhYmxlKTsNCiAgICAg
IH0NCiAgDQotZG9uZToNCi0gICAgaWYgKCBpb21tdS0+ZW5hYmxlZCApDQotICAgIHsNCi0gICAg
ICAgIHNwaW5fbG9ja19pcnFzYXZlKCZpb21tdS0+bG9jaywgZmxhZ3MpOw0KLSAgICAgICAgYW1k
X2lvbW11X2ZsdXNoX2ludHJlbWFwKGlvbW11LCByZXFfaWQpOw0KLSAgICAgICAgaWYgKCBhbGlh
c19pZCAhPSByZXFfaWQgKQ0KLSAgICAgICAgICAgIGFtZF9pb21tdV9mbHVzaF9pbnRyZW1hcChp
b21tdSwgYWxpYXNfaWQpOw0KLSAgICAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmaW9tbXUt
PmxvY2ssIGZsYWdzKTsNCi0gICAgfQ0KLQ0KICAgICAgcmV0dXJuIDA7DQogIH0NCiAgDQoNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
