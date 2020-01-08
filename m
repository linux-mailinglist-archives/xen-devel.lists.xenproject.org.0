Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 810AD1344A4
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 15:11:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipC0v-00046i-5t; Wed, 08 Jan 2020 14:08:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wfd2=25=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1ipC0t-00046E-R6
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 14:08:47 +0000
X-Inumbo-ID: 5ec384ac-3220-11ea-b7ff-12813bfff9fa
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.116]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5ec384ac-3220-11ea-b7ff-12813bfff9fa;
 Wed, 08 Jan 2020 14:08:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ThuAWbuyvaKvZHmtRN8lPCYFAHv8lSQdYqoxHIj0K761/QIZPlMJdefLBP8tmWEdWr02ACf9NG6obY/ky4ZOB9TaB3uHX5x3MIncoPysJeWcRn/zBR39AWK9jzA/gHv+9OMg861utWsLDZG7riRp9unV1R26ss4kU0xMf8XsaW0xwuXM04osWhFazplvc2xhtFwW4H2ns1ZU2n2dWK12JyEP7/icOAGYMkCNgg+zn7e6JR6blxamYzGm8NRAmIJeQqXOMUUpMr/Swpju1WTzcRDhkvTsKHqSbBmV5Yr7NKtBtIfu7N0A3SVpe4FzymVFXlgAdni00lV9VeZDFMpYKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iV7Etwd85xncHh8h3PvlemQtEvWeXHwIdFtd1Y5jAUI=;
 b=j/0OY+LgPm+ezbnnCGXqdmU7ak6FM0umGHPMk1Mg1qiWDkf6utOXYpNRKfSgqziKxlngNTE7b0MTiq8FtiRVOLYFssSNZ4GncLFsPXifphi+3z4NP/2AyMuqk5RO1JkFDOkqOQdvPhZ4CS+gHHisJwMMQKxF9KsDzdtLMVW/+hyOo6X6/y0RN0BMMkMLovM5e9Dj1B20l+ZenDUk7P3wGvrAx9JWUCM62pRATU2v0DDQOIx9jkkgGFwyOLrLkRJvWCPNlFE2ZTs0V2SHTHrgeOTsvdWkGLcEZZT5Z6bZPu+bezUShynKFe0exyeH8GdcTSnsCFeDOI5cRnGuw+ZqDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iV7Etwd85xncHh8h3PvlemQtEvWeXHwIdFtd1Y5jAUI=;
 b=TB8AuHJMFY1g1vn4w+nWsDuAENFnHOI7nQey3pibeZf5Lraxs1AzgMettg0jgAK/4fEhfc0PQnceZYWocwssCk3ZuqHWl/EcgItE0Sq9NBRLy/vodhqdKt6Bb0D8jU/Yvm+UAG4/DIiyofjsSHUpuh2uIpTwoRN1IfGWVHREW5c=
Received: from DB6PR02MB2999.eurprd02.prod.outlook.com (10.170.219.144) by
 DB6PR02MB3253.eurprd02.prod.outlook.com (10.170.221.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.12; Wed, 8 Jan 2020 14:08:38 +0000
Received: from DB6PR02MB2999.eurprd02.prod.outlook.com
 ([fe80::f1c2:7dd1:1131:1c1d]) by DB6PR02MB2999.eurprd02.prod.outlook.com
 ([fe80::f1c2:7dd1:1131:1c1d%7]) with mapi id 15.20.2623.008; Wed, 8 Jan 2020
 14:08:38 +0000
Received: from aisaila-Latitude-E5570.dsd.bitdefender.biz (91.199.104.6) by
 AM4PR05CA0023.eurprd05.prod.outlook.com (2603:10a6:205::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9 via Frontend Transport; Wed, 8 Jan 2020 14:08:37 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH V7 3/4] x86/mm: Pull vendor-independent altp2m code out
 of p2m-ept.c and into p2m.c
Thread-Index: AQHVxi0fbt+nN8/hdEK4zqWI7FQ36A==
Date: Wed, 8 Jan 2020 14:08:38 +0000
Message-ID: <20200108140810.6528-3-aisaila@bitdefender.com>
References: <20200108140810.6528-1-aisaila@bitdefender.com>
In-Reply-To: <20200108140810.6528-1-aisaila@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4PR05CA0023.eurprd05.prod.outlook.com (2603:10a6:205::36)
 To DB6PR02MB2999.eurprd02.prod.outlook.com
 (2603:10a6:6:17::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 19d1a749-9180-48d0-a6e4-08d7944441ff
x-ms-traffictypediagnostic: DB6PR02MB3253:|DB6PR02MB3253:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR02MB325339A21A4DAB081CC8DD01AB3E0@DB6PR02MB3253.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:243;
x-forefront-prvs: 02760F0D1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(396003)(376002)(346002)(366004)(39850400004)(189003)(199004)(66446008)(16526019)(4326008)(66556008)(54906003)(8676002)(81156014)(66476007)(316002)(64756008)(81166006)(2906002)(6506007)(6512007)(6916009)(52116002)(26005)(186003)(66946007)(5660300002)(8936002)(36756003)(1076003)(956004)(2616005)(86362001)(478600001)(6486002)(71200400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR02MB3253;
 H:DB6PR02MB2999.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Zujc8p0vy5Pq2mO0WrvhDf+WpttvfmSAGSQkFZbwHGlqJ0+EQdQ1W6DqreWfFRGVoh01b5yGdtzYJAzwro3onMn50//X5gAG4ujhPNT2LYUPGBT5+0vPkWXuNd4gWG1yuOcnnv1ChbY+8HAS9T39ABjlAPLxIkJaWdsjFNAjUU1SuDEvMyvYnKKUtUHe64zEQGblK+kFShHieRmR9gSlPlXLZg6EiR17jEnPE08d73r/e4FJZOmZtBPLaJ1Cku3D2Banx7zsJisoZLHMGrmVouTMVmef8BP4AYnPen5dkpnR0ORAciFfSw2Z7hsi5BF+THWjNOouCXFSLR7vF1GF/AfVnluMrLT56frVuov8UcauyBk7C2VcfSqYs4SEySeF3m3jl+jaYHNbj1Ty/JAXspH79dXurRSUt/lEr1zHvGVV7h95zq4qi8PdOfmNWpAu
Content-ID: <3F067D2C7894AE4EB7036F65C2866417@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19d1a749-9180-48d0-a6e4-08d7944441ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2020 14:08:38.3883 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tGHJzodaC8c3ZBf3l3IGOPm29/e3QrYivwPO6F9Xd+xPEHs4NzoY4eCgx93MIPR6jpgucLpElDZuyZaCrQNuCR+Iv3I7H8WBGRkP8WX4Eug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR02MB3253
Subject: [Xen-devel] [PATCH V7 3/4] x86/mm: Pull vendor-independent altp2m
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
cmNoL3g4Ni9tbS9wMm0tZXB0LmMgYi94ZW4vYXJjaC94ODYvbW0vcDJtLWVwdC5jDQppbmRleCAx
YzIzZWE2MTY5Li43ZjlkNTYwZGY4IDEwMDY0NA0KLS0tIGEveGVuL2FyY2gveDg2L21tL3AybS1l
cHQuYw0KKysrIGIveGVuL2FyY2gveDg2L21tL3AybS1lcHQuYw0KQEAgLTEzNTksMTMgKzEzNTks
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
bS5jIGIveGVuL2FyY2gveDg2L21tL3AybS5jDQppbmRleCAyMjNjYTBjZjRjLi4xYmVmYzA2NjQx
IDEwMDY0NA0KLS0tIGEveGVuL2FyY2gveDg2L21tL3AybS5jDQorKysgYi94ZW4vYXJjaC94ODYv
bW0vcDJtLmMNCkBAIC0yNTY0LDYgKzI1NjQsMTIgQEAgc3RhdGljIGludCBwMm1fYWN0aXZhdGVf
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
