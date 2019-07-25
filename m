Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DAB74FDE
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 15:43:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqe0K-0001S9-VU; Thu, 25 Jul 2019 13:41:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dOpT=VW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hqe0J-0001Rg-HF
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 13:41:55 +0000
X-Inumbo-ID: f5bc6d96-aee1-11e9-88f3-7b32163c2861
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f5bc6d96-aee1-11e9-88f3-7b32163c2861;
 Thu, 25 Jul 2019 13:41:53 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 25 Jul 2019 13:41:47 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 25 Jul 2019 13:31:22 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 25 Jul 2019 13:31:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eCRpNyembBd5lvLwu+ilYT+NCSc6WyU6bC95/SrgeDe6rQU/h3lW7TNEAyDu2f9vyWPAz8NI3s2lNgqnjupcjS602uCDKfWWuNKjlGZePTA9F6YuFjGw+5BTlCNv6Z0D3tmtNhss5PMr/JxKY5WrF8hGbssJMvqGe1wRXRkh7RchT4UDW54piDq1hCiB4N6b5xN88XaudeYREGSlsSnJX8G9FaccqmMqhJr8kqw6aRJ4ZZDRUNWZgVh0OF3SGzmqb+sCY6Lg7U2H/wxOLqn2O8xeg8urO0AJy6+oeMgdPxn9eg+weVRgZYNDfIA6DgDOuZCskJRUsHeanGCxcIuVjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jSLH4pLR/49eYUIXhVFLXPI/eLj+gH5e6hTZ9TDCgt0=;
 b=Cw8PGHQN11VBxpXQmSkV4UuddOQrYIVaVRQIVrTGbyCDE8eEEUw5VrzLg23DhinBDCUGcYWd8kUOMMXlQVlOtwT75VjeImVYb8aY/+Qai5JYFa7JJmpt+CRf4u2gbylFdEhHbH9fSCNXgrmY7R+4Yzk98saMg+2vWUcQ3/mYa5gyO2p4eEmhyiRkM4JbMQ1EKN349uUTNDqB7cC0Thn5tiZ87+R/2UKSlcHw/yqBkTJt8FwZlxg7KYJyNF2cmygHQF3/VgcvZPqYhmpPjAYdd6UXyy7Kt4Dh1+sNwt/GUjs5vP8W3I3Uj0ynSEZe697lJNJIoR4bFctdC4LRAlZLsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3171.namprd18.prod.outlook.com (10.255.137.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Thu, 25 Jul 2019 13:31:21 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Thu, 25 Jul 2019
 13:31:21 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v4 06/12] AMD/IOMMU: split amd_iommu_init_one()
Thread-Index: AQHVQu0/afOQjbo/SEW8vV3b2KmUNQ==
Date: Thu, 25 Jul 2019 13:31:21 +0000
Message-ID: <dd614c52-23ee-7bf1-8b74-f9f86342423b@suse.com>
References: <b8ae110a-f94a-4ed2-5cf9-c00ff1c0cb81@suse.com>
In-Reply-To: <b8ae110a-f94a-4ed2-5cf9-c00ff1c0cb81@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP265CA0063.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::27) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a0f9a9f6-f89c-4ae4-393a-08d7110461c8
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3171; 
x-ms-traffictypediagnostic: BY5PR18MB3171:
x-microsoft-antispam-prvs: <BY5PR18MB3171DA0E8F9F0D1A795F323AB3C10@BY5PR18MB3171.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(376002)(366004)(136003)(346002)(39860400002)(199004)(189003)(81166006)(11346002)(26005)(6116002)(478600001)(446003)(256004)(52116002)(186003)(316002)(2501003)(81156014)(476003)(5640700003)(2351001)(5660300002)(3846002)(486006)(2616005)(54906003)(66066001)(8676002)(6436002)(80792005)(66946007)(76176011)(71200400001)(31686004)(86362001)(71190400001)(99286004)(6486002)(8936002)(64756008)(66556008)(53936002)(6506007)(66446008)(2906002)(14454004)(6916009)(102836004)(7736002)(31696002)(6512007)(36756003)(305945005)(68736007)(4326008)(66476007)(14444005)(25786009)(386003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3171;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Lhf7q5+mV/iki66g3GlCjY5eWqHAeO6TLRerhDJRYYqAAC/dmVTA4aeZpwD9h2XLCrd3ic3hmOFdtsX4AYvmdoIzHwicXF0tCatY8oEb62hXVV3Xk+fastsyhUBPURRqPLPLOF8dkMVqlG2xktmNzgLjqAUJw3PXI1r5rqeDCM5lh7cxOvtpkPW4zZjCAjB2FRYONYKA9GCHG6QaardAPVuiRTOJYZ4pQp4xGtZlcABXlXRx4GK42Oh5JMiR5lYpxV8LtQg2ZpM1OLBK+41ned2Vc89ENeoFtjMAvWdAduHN8inbYaKU6Glwf1h5UtecdMfJDT2ThUJR8ZQsqj82k3+V/m22rxkdESZ9Gy3h+sWS9+fVLvLXQ+esWQoAWqLg9FzVkkSbRCsnqVb5H1ixoYfmvH+ZnXsL++rrPNwjnvM=
Content-ID: <9B59A0CE170F474F84F82DFA0609DB11@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a0f9a9f6-f89c-4ae4-393a-08d7110461c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 13:31:21.5806 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3171
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v4 06/12] AMD/IOMMU: split amd_iommu_init_one()
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

TWFwcGluZyB0aGUgTU1JTyBzcGFjZSBhbmQgb2J0YWluaW5nIGZlYXR1cmUgaW5mb3JtYXRpb24g
bmVlZHMgdG8gaGFwcGVuDQpzbGlnaHRseSBlYXJsaWVyLCBzdWNoIHRoYXQgZm9yIHgyQVBJQyBz
dXBwb3J0IHdlIGNhbiBzZXQgWFRFbiBwcmlvciB0bw0KY2FsbGluZyBhbWRfaW9tbXVfdXBkYXRl
X2l2cnNfbWFwcGluZ19hY3BpKCkgYW5kDQphbWRfaW9tbXVfc2V0dXBfaW9hcGljX3JlbWFwcGlu
ZygpLg0KDQpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQpS
ZXZpZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCkFj
a2VkLWJ5OiBCcmlhbiBXb29kcyA8YnJpYW4ud29vZHNAYW1kLmNvbT4NCg0KLS0tIGEveGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2luaXQuYw0KKysrIGIveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvYW1kL2lvbW11X2luaXQuYw0KQEAgLTk2OSwxNCArOTY5LDYgQEAgc3RhdGljIHZv
aWQgKiBfX2luaXQgYWxsb2NhdGVfcHByX2xvZyhzdA0KICANCiAgc3RhdGljIGludCBfX2luaXQg
YW1kX2lvbW11X2luaXRfb25lKHN0cnVjdCBhbWRfaW9tbXUgKmlvbW11KQ0KICB7DQotICAgIGlm
ICggbWFwX2lvbW11X21taW9fcmVnaW9uKGlvbW11KSAhPSAwICkNCi0gICAgICAgIGdvdG8gZXJy
b3Jfb3V0Ow0KLQ0KLSAgICBnZXRfaW9tbXVfZmVhdHVyZXMoaW9tbXUpOw0KLQ0KLSAgICBpZiAo
IGlvbW11LT5mZWF0dXJlcy5yYXcgKQ0KLSAgICAgICAgaW9tbXV2Ml9lbmFibGVkID0gMTsNCi0N
CiAgICAgIGlmICggYWxsb2NhdGVfY21kX2J1ZmZlcihpb21tdSkgPT0gTlVMTCApDQogICAgICAg
ICAgZ290byBlcnJvcl9vdXQ7DQogIA0KQEAgLTEyMDEsNiArMTE5MywyMyBAQCBzdGF0aWMgYm9v
bF90IF9faW5pdCBhbWRfc3A1MTAwX2VycmF0dW0yDQogICAgICByZXR1cm4gMDsNCiAgfQ0KICAN
CitzdGF0aWMgaW50IF9faW5pdCBhbWRfaW9tbXVfcHJlcGFyZV9vbmUoc3RydWN0IGFtZF9pb21t
dSAqaW9tbXUpDQorew0KKyAgICBpbnQgcmMgPSBhbGxvY19pdnJzX21hcHBpbmdzKGlvbW11LT5z
ZWcpOw0KKw0KKyAgICBpZiAoICFyYyApDQorICAgICAgICByYyA9IG1hcF9pb21tdV9tbWlvX3Jl
Z2lvbihpb21tdSk7DQorICAgIGlmICggcmMgKQ0KKyAgICAgICAgcmV0dXJuIHJjOw0KKw0KKyAg
ICBnZXRfaW9tbXVfZmVhdHVyZXMoaW9tbXUpOw0KKw0KKyAgICBpZiAoIGlvbW11LT5mZWF0dXJl
cy5yYXcgKQ0KKyAgICAgICAgaW9tbXV2Ml9lbmFibGVkID0gdHJ1ZTsNCisNCisgICAgcmV0dXJu
IDA7DQorfQ0KKw0KICBpbnQgX19pbml0IGFtZF9pb21tdV9pbml0KHZvaWQpDQogIHsNCiAgICAg
IHN0cnVjdCBhbWRfaW9tbXUgKmlvbW11Ow0KQEAgLTEyMzEsNyArMTI0MCw3IEBAIGludCBfX2lu
aXQgYW1kX2lvbW11X2luaXQodm9pZCkNCiAgICAgIHJhZGl4X3RyZWVfaW5pdCgmaXZyc19tYXBz
KTsNCiAgICAgIGZvcl9lYWNoX2FtZF9pb21tdSAoIGlvbW11ICkNCiAgICAgIHsNCi0gICAgICAg
IHJjID0gYWxsb2NfaXZyc19tYXBwaW5ncyhpb21tdS0+c2VnKTsNCisgICAgICAgIHJjID0gYW1k
X2lvbW11X3ByZXBhcmVfb25lKGlvbW11KTsNCiAgICAgICAgICBpZiAoIHJjICkNCiAgICAgICAg
ICAgICAgZ290byBlcnJvcl9vdXQ7DQogICAgICB9DQoNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
