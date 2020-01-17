Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72ADA140AC7
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 14:34:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isRiv-0004CR-Be; Fri, 17 Jan 2020 13:31:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Pu3f=3G=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1isRit-0004C7-Ff
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 13:31:39 +0000
X-Inumbo-ID: ad3aa048-392d-11ea-b833-bc764e2007e4
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1b::70f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ad3aa048-392d-11ea-b833-bc764e2007e4;
 Fri, 17 Jan 2020 13:31:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fMJ7zACMW9zipM9JLRm1udhuVb/Nc+3U1J1QMvvgh7Aht1VnhffYusRMefJ2AsrIe1lV/LPGVoLO4qIRE415/s5btZyWKdYX4kuZ3nikD0E0IAtQUQsTnOsXkzzRKVnIgP2LY31HDh7036BxmgtEjrHhzhXRbRlPwa5RhY9r4PJUimRU1iCObdqA9LTvNEJQZ3dZtejvzRIKhiozfw6M3k3PRpZPFsZ/6XFy1ivgfXThRLkBefwpN9gvEF8jn2Zd42GURE5Rie//daSgEUqI+hDvlfzcpQ2aaRNE6qWNO1NDPfdNmSMdNvRwV4BXjB9xwZXGvXfbnCWvLENhH3+zRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zak+i1VwAM5Dez896o8r9BagCFc4u+w82IQ3EmvKg9M=;
 b=LcGVOkkrq65UDmjUZpCCpSLReJRCYeG+NAk9o0OlZK7A9ux/tv/TqgkOPkRwTwQ24kN/kOeNRyWhdBM4YYKSxwAjv5xqX9XFdqzYIqo9yG5vzkxSpH9yAPLfZR/j8+cvUtepXHc3Gfr/Ht7/MYRrvIwpIkVqI89H019lj2M0aDabdpqds4hUEVEIWLn3j62WxJ6vPEld0jqbhdgZw2iPOvmFH10ZUDXphcyW1np4MvndFtWbEC+36f+C693WcycCetLxB9vdTHIEITD55QY2NDE1XeN8xuyGdMK4Ze+dWMjDy6J07lA5QwHmeI5lvB9CSXYgGWjRIDCGhsmtxmT6hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zak+i1VwAM5Dez896o8r9BagCFc4u+w82IQ3EmvKg9M=;
 b=D8kPQGEoIrptRSc1jhOr6aqduosoH+lJGtp4Y3/bYUwLXrG1bP91TDspmxEqQuq7HQzHRQhRPViGSSsksg1QZG6Prdj2TclM9fwAkmZgTt03aJ9rrR17USFfqQQIt/GDJx943GOg4/QlqQUnvT/kBgK/l8p+cxPs/C4KEJ5hylw=
Received: from DB6PR02MB2999.eurprd02.prod.outlook.com (10.170.219.144) by
 DB6PR02MB3207.eurprd02.prod.outlook.com (10.175.234.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.18; Fri, 17 Jan 2020 13:31:32 +0000
Received: from DB6PR02MB2999.eurprd02.prod.outlook.com
 ([fe80::f1c2:7dd1:1131:1c1d]) by DB6PR02MB2999.eurprd02.prod.outlook.com
 ([fe80::f1c2:7dd1:1131:1c1d%7]) with mapi id 15.20.2644.023; Fri, 17 Jan 2020
 13:31:32 +0000
Received: from aisaila-Latitude-E5570.dsd.bitdefender.biz (91.199.104.6) by
 AM0PR0402CA0004.eurprd04.prod.outlook.com (2603:10a6:208:15::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.20 via Frontend
 Transport; Fri, 17 Jan 2020 13:31:31 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH V8 3/4] x86/mm: Pull vendor-independent altp2m code out
 of p2m-ept.c and into p2m.c
Thread-Index: AQHVzTpu4N3BdlWD2E+51bjjxJHR2g==
Date: Fri, 17 Jan 2020 13:31:31 +0000
Message-ID: <20200117133059.14602-3-aisaila@bitdefender.com>
References: <20200117133059.14602-1-aisaila@bitdefender.com>
In-Reply-To: <20200117133059.14602-1-aisaila@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR0402CA0004.eurprd04.prod.outlook.com
 (2603:10a6:208:15::17) To DB6PR02MB2999.eurprd02.prod.outlook.com
 (2603:10a6:6:17::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b4cc1fb3-506b-4d8c-51f9-08d79b5190ad
x-ms-traffictypediagnostic: DB6PR02MB3207:|DB6PR02MB3207:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR02MB3207E957250A8A4BB294AC7CAB310@DB6PR02MB3207.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:243;
x-forefront-prvs: 0285201563
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(376002)(396003)(366004)(136003)(39850400004)(199004)(189003)(71200400001)(1076003)(52116002)(956004)(2616005)(66476007)(66556008)(36756003)(66446008)(64756008)(54906003)(478600001)(86362001)(6486002)(5660300002)(4326008)(8936002)(316002)(16526019)(66946007)(81156014)(26005)(81166006)(186003)(6916009)(8676002)(2906002)(6512007)(6506007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR02MB3207;
 H:DB6PR02MB2999.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZIh0uFhBI5T14mRJJbTl7jLEEdoe7So0nWou938hSvGIXOycTR6WcFl9aluT5PylByhIroUTm5WX9PHa+1PmxZpG+ZyLfi0PgA+sOK3pBlXmmY8Di0F5QIEi29V4KcHDGhnSOf6BWprUVrihXaHu4OeeOaGSHzNauY9GFjvutk3S5rfMwW8sh8UfYLnYWpKXHcZUK+FPrusep2WhNB6UYpHbmt8jYSf4/3IvfL1WS/puRZRREoKpFSa5FhATZz4jORuBoRtRMT4MzQdnLwB8Jb2+RW2nBDU+kRHb853w0JCJtbeOvCNCtp5niZK8vC9k7NPrgqi1RnIMh9CnwTjWKYvX11fV35KJSa1mglWQeVmIJdbnpFnioac/P2ib+qoPJ2If70obsbntD8ZhKB26gu0kPOA+1bdMBJkclIRqL40EGlKCEDeZvPc3xO7d+kV8
Content-ID: <2F84694402926F47815D097CD83A135B@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4cc1fb3-506b-4d8c-51f9-08d79b5190ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2020 13:31:31.9667 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AsoW9lVOMs2zE5je8hfHhmhsqb1QweSkXM8d3Lna2xYLjtSYVf1BCh054oaGM7675vVSkPLgEgvm0gxcIA5Wn7BBk0S/L1Ye1WUxsgd+SUg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR02MB3207
Subject: [Xen-devel] [PATCH V8 3/4] x86/mm: Pull vendor-independent altp2m
 code out of p2m-ept.c and into p2m.c
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2VzLg0KDQpSZXF1ZXN0ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4NClNpZ25lZC1vZmYtYnk6IEFsZXhhbmRydSBJc2FpbGEgPGFpc2FpbGFA
Yml0ZGVmZW5kZXIuY29tPg0KUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4NCg0KLS0tDQpDQzogSnVuIE5ha2FqaW1hIDxqdW4ubmFrYWppbWFAaW50ZWwuY29tPg0K
Q0M6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0KQ0M6IEdlb3JnZSBEdW5sYXAg
PGdlb3JnZS5kdW5sYXBAZXUuY2l0cml4LmNvbT4NCkNDOiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+DQpDQzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4N
CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KQ0M6ICJSb2dlciBQYXUgTW9ubsOpIiA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+DQotLS0NCiB4ZW4vYXJjaC94ODYvbW0vcDJtLWVwdC5jIHwgNiAtLS0t
LS0NCiB4ZW4vYXJjaC94ODYvbW0vcDJtLmMgICAgIHwgNiArKysrKysNCiAyIGZpbGVzIGNoYW5n
ZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL3g4Ni9tbS9wMm0tZXB0LmMgYi94ZW4vYXJjaC94ODYvbW0vcDJtLWVwdC5jDQppbmRleCBi
MDc4YTlhNTllLi4wNWE1NTI2ZTA4IDEwMDY0NA0KLS0tIGEveGVuL2FyY2gveDg2L21tL3AybS1l
cHQuYw0KKysrIGIveGVuL2FyY2gveDg2L21tL3AybS1lcHQuYw0KQEAgLTEzNTcsMTMgKzEzNTcs
NyBAQCB2b2lkIHAybV9pbml0X2FsdHAybV9lcHQoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQg
aW50IGkpDQogICAgIHN0cnVjdCBwMm1fZG9tYWluICpob3N0cDJtID0gcDJtX2dldF9ob3N0cDJt
KGQpOw0KICAgICBzdHJ1Y3QgZXB0X2RhdGEgKmVwdDsNCiANCi0gICAgcDJtLT5kZWZhdWx0X2Fj
Y2VzcyA9IGhvc3RwMm0tPmRlZmF1bHRfYWNjZXNzOw0KLSAgICBwMm0tPmRvbWFpbiA9IGhvc3Rw
Mm0tPmRvbWFpbjsNCi0NCi0gICAgcDJtLT5nbG9iYWxfbG9nZGlydHkgPSBob3N0cDJtLT5nbG9i
YWxfbG9nZGlydHk7DQogICAgIHAybS0+ZXB0LmFkID0gaG9zdHAybS0+ZXB0LmFkOw0KLSAgICBw
Mm0tPm1pbl9yZW1hcHBlZF9nZm4gPSBnZm5feChJTlZBTElEX0dGTik7DQotICAgIHAybS0+bWF4
X21hcHBlZF9wZm4gPSBwMm0tPm1heF9yZW1hcHBlZF9nZm4gPSAwOw0KICAgICBlcHQgPSAmcDJt
LT5lcHQ7DQogICAgIGVwdC0+bWZuID0gcGFnZXRhYmxlX2dldF9wZm4ocDJtX2dldF9wYWdldGFi
bGUocDJtKSk7DQogICAgIGQtPmFyY2guYWx0cDJtX2VwdHBbYXJyYXlfaW5kZXhfbm9zcGVjKGks
IE1BWF9FUFRQKV0gPSBlcHQtPmVwdHA7DQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL3Ay
bS5jIGIveGVuL2FyY2gveDg2L21tL3AybS5jDQppbmRleCAzYTI5MjljMzY1Li42OTY5NDY2OTdh
IDEwMDY0NA0KLS0tIGEveGVuL2FyY2gveDg2L21tL3AybS5jDQorKysgYi94ZW4vYXJjaC94ODYv
bW0vcDJtLmMNCkBAIC0yNTYyLDYgKzI1NjIsMTIgQEAgc3RhdGljIGludCBwMm1fYWN0aXZhdGVf
YWx0cDJtKHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCBpZHgpDQogICAgICAgICBnb3Rv
IG91dDsNCiAgICAgfQ0KIA0KKyAgICBwMm0tPmRlZmF1bHRfYWNjZXNzID0gaG9zdHAybS0+ZGVm
YXVsdF9hY2Nlc3M7DQorICAgIHAybS0+ZG9tYWluID0gaG9zdHAybS0+ZG9tYWluOw0KKyAgICBw
Mm0tPmdsb2JhbF9sb2dkaXJ0eSA9IGhvc3RwMm0tPmdsb2JhbF9sb2dkaXJ0eTsNCisgICAgcDJt
LT5taW5fcmVtYXBwZWRfZ2ZuID0gZ2ZuX3goSU5WQUxJRF9HRk4pOw0KKyAgICBwMm0tPm1heF9t
YXBwZWRfcGZuID0gcDJtLT5tYXhfcmVtYXBwZWRfZ2ZuID0gMDsNCisNCiAgICAgcDJtX2luaXRf
YWx0cDJtX2VwdChkLCBpZHgpOw0KIA0KICBvdXQ6DQotLSANCjIuMTcuMQ0KDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
