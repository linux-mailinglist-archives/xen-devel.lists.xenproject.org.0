Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BF8122FE0
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 16:14:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihEWq-0008El-WE; Tue, 17 Dec 2019 15:12:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=P3aS=2H=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1ihEWp-0008EM-Al
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 15:12:51 +0000
X-Inumbo-ID: ac1f9af8-20df-11ea-b6f1-bc764e2007e4
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.102]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ac1f9af8-20df-11ea-b6f1-bc764e2007e4;
 Tue, 17 Dec 2019 15:12:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UsqQ+JVzdelMk0G3Moh1xKAmfnKsezG16wWxRv/mqjT3V6s2GNwUqgNT+lpp4SZpq2doC/OIMysd4ppbyqYrx/VfZhprsIiHvlJGlOaRrL4lBtr6j4KY9+IosqGWAV1EuDzu70MfKSQ48uqiMHy41joCZpN7LjbP9JDokV1bQdeMKVZ8m+Y2M2KSKnc8fLYohKy9CD8n+/Y12lpTK1GC8jsV2WCVD6BJSCZ54lVS7H5gO4IsVWB3BtKDpBQX9I6i44cBm9lsYNgyy4d4dgRzz3ynS2JdAtjOqaP3w1sLmklcYS6yB5wPU9pCVl6Ne5hcEC1fYVxDLDbHAmjACglAJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQQcj/kCLuqhEOjPzK84oKJ2erIYwHMpYTAxWNLBGWk=;
 b=E6pimmRW2Xk6NXhv8fQkEsbdZfI93flSsEdqhhdYiXQY/6ZMPzK/sr6f9ITblpDFrhlmP4BtZkAYFo1xzzSd2s6ziav2lgYS75uEl/iiUJkFtOT5ORsA5JiwaSsp90ftLrchYoJk3idKNdGJaWNlXbPv9AGh5vwxLWfVmByCV5a0DN77OffXEedL/Y87K+kKtd2nj53EoxCIZqEK9xqRHDtDOLM5vHFKlTMuPyoe8FNdAVlNRovc6UwQu4mOkEnCy6v5Cw1oSE8LagCEQ/UZ9rE0aeAQf1HQmwveWAMA8GCkRSufPY38641qL0AUr2kA8br2R3Tvctz0uBZrGZ6z4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQQcj/kCLuqhEOjPzK84oKJ2erIYwHMpYTAxWNLBGWk=;
 b=Y7dOKjYJJF5FwSMiO13NJpsd8Yri4gT2C2k6jXt/RpFvg6bycBzZ/DStHEhyHYFo99o1z9zLibHaS78rNwLPwbovGtADgKEVA6MKtQEqok3C7h8WVvBia3fq6VJBcjdPAY4TtP7DNMN2MD9GndKt7zAS4Ww4IpnMQI0pmA+fHWE=
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com (10.255.30.78) by
 AM0PR02MB4386.eurprd02.prod.outlook.com (20.178.17.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.20; Tue, 17 Dec 2019 15:12:35 +0000
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d]) by AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d%4]) with mapi id 15.20.2538.019; Tue, 17 Dec 2019
 15:12:35 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH V4 3/4] x86/mm: Pull out the p2m specifics from
 p2m_init_altp2m_ept
Thread-Index: AQHVtOxpSoGNE4L+skG6HNN4NefFyg==
Date: Tue, 17 Dec 2019 15:12:34 +0000
Message-ID: <20191217151144.9781-3-aisaila@bitdefender.com>
References: <20191217151144.9781-1-aisaila@bitdefender.com>
In-Reply-To: <20191217151144.9781-1-aisaila@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR01CA0067.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:e6::44) To AM0PR02MB5553.eurprd02.prod.outlook.com
 (2603:10a6:208:160::14)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c1a01afe-51c6-4cc6-89c2-08d783038bb2
x-ms-traffictypediagnostic: AM0PR02MB4386:|AM0PR02MB4386:|AM0PR02MB4386:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR02MB4386E6445AB0E784035C3BB8AB500@AM0PR02MB4386.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:243;
x-forefront-prvs: 02543CD7CD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(136003)(396003)(39860400002)(346002)(376002)(189003)(199004)(6512007)(52116002)(64756008)(86362001)(186003)(8936002)(6486002)(4326008)(2906002)(54906003)(66476007)(71200400001)(66556008)(66946007)(36756003)(26005)(81156014)(81166006)(5660300002)(8676002)(6506007)(478600001)(66446008)(1076003)(2616005)(316002)(6916009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB4386;
 H:AM0PR02MB5553.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e4pRuDFPAcL6s+eDgRdWK3fVdAhp9PxWUVaUrBJ8R5xNELg4IptDimz7SKD228T4Mpu6Womhg+nTd26dw3AwKmKNSXgG73rYgL4fZQXMe3Ncf7gxEARtqag0B9o6wgkEtiQI0iEKr6169waPvlC/h48IFkK/rSvQq99igiuHkuqsAaoTPgkcNt0hV4ufdfedgvdTCut3dH8xZEiKaNyYAVcHuFIgDZHatGAcTxt1gxbD6/BMAPepgbakhrLvuuZQNawEBVh/CAKMJmTbvyHiDYPtvsi41b2HIFmIZCZ5TNafvWgOMb0HEk8psx2STVw6EmY2cxld+RSTsx+Ywh9OIC4vTHpjh1pgoBVbmopuZh+KRepkpyfc5Fyw4bN51UGiji+AnyNUCfrunjJ07uwzGbd97E1nDKfjVP8HKcPFwe7rEI/wPtjMN184qVNLhgbB
Content-ID: <6723024B440EC240AB191EC15FBD9BD3@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1a01afe-51c6-4cc6-89c2-08d783038bb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2019 15:12:34.9937 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AIk4KbwPHZV1QNglVJtBdgpq7WvRljvY6i1yFB0WJcRsn/GofL6SYt8pNdcGp0kqrHAE8UHto4fQoDcD/9yAsno8UxJeFIXN5kZFObrfYm0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB4386
Subject: [Xen-devel] [PATCH V4 3/4] x86/mm: Pull out the p2m specifics from
 p2m_init_altp2m_ept
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

U2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+
DQotLS0NCkNDOiBKdW4gTmFrYWppbWEgPGp1bi5uYWthamltYUBpbnRlbC5jb20+DQpDQzogS2V2
aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQpDQzogR2VvcmdlIER1bmxhcCA8Z2Vvcmdl
LmR1bmxhcEBldS5jaXRyaXguY29tPg0KQ0M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4NCkNDOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KQ0M6IFdl
aSBMaXUgPHdsQHhlbi5vcmc+DQpDQzogIlJvZ2VyIFBhdSBNb25uw6kiIDxyb2dlci5wYXVAY2l0
cml4LmNvbT4NCi0tLQ0KIHhlbi9hcmNoL3g4Ni9tbS9wMm0tZXB0LmMgfCA2IC0tLS0tLQ0KIHhl
bi9hcmNoL3g4Ni9tbS9wMm0uYyAgICAgfCA2ICsrKysrKw0KIDIgZmlsZXMgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2
L21tL3AybS1lcHQuYyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0tZXB0LmMNCmluZGV4IGUwODhhNjNm
NTYuLjM2MmY3MDc5YWIgMTAwNjQ0DQotLS0gYS94ZW4vYXJjaC94ODYvbW0vcDJtLWVwdC5jDQor
KysgYi94ZW4vYXJjaC94ODYvbW0vcDJtLWVwdC5jDQpAQCAtMTM1OCwxMyArMTM1OCw3IEBAIHZv
aWQgcDJtX2luaXRfYWx0cDJtX2VwdChzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgaSkN
CiAgICAgc3RydWN0IHAybV9kb21haW4gKmhvc3RwMm0gPSBwMm1fZ2V0X2hvc3RwMm0oZCk7DQog
ICAgIHN0cnVjdCBlcHRfZGF0YSAqZXB0Ow0KIA0KLSAgICBwMm0tPmRlZmF1bHRfYWNjZXNzID0g
aG9zdHAybS0+ZGVmYXVsdF9hY2Nlc3M7DQotICAgIHAybS0+ZG9tYWluID0gaG9zdHAybS0+ZG9t
YWluOw0KLQ0KLSAgICBwMm0tPmdsb2JhbF9sb2dkaXJ0eSA9IGhvc3RwMm0tPmdsb2JhbF9sb2dk
aXJ0eTsNCiAgICAgcDJtLT5lcHQuYWQgPSBob3N0cDJtLT5lcHQuYWQ7DQotICAgIHAybS0+bWlu
X3JlbWFwcGVkX2dmbiA9IGdmbl94KElOVkFMSURfR0ZOKTsNCi0gICAgcDJtLT5tYXhfbWFwcGVk
X3BmbiA9IHAybS0+bWF4X3JlbWFwcGVkX2dmbiA9IDA7DQogICAgIGVwdCA9ICZwMm0tPmVwdDsN
CiAgICAgZXB0LT5tZm4gPSBwYWdldGFibGVfZ2V0X3BmbihwMm1fZ2V0X3BhZ2V0YWJsZShwMm0p
KTsNCiAgICAgZC0+YXJjaC5hbHRwMm1fZXB0cFthcnJheV9pbmRleF9ub3NwZWMoaSwgTUFYX0VQ
VFApXSA9IGVwdC0+ZXB0cDsNCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMgYi94
ZW4vYXJjaC94ODYvbW0vcDJtLmMNCmluZGV4IDI1M2NhYjM0NTguLmQzODFmNjg3N2YgMTAwNjQ0
DQotLS0gYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMNCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0u
Yw0KQEAgLTI1NTksNiArMjU1OSwxMiBAQCBzdGF0aWMgaW50IHAybV9hY3RpdmF0ZV9hbHRwMm0o
c3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IGlkeCkNCiAgICAgICAgIGdvdG8gb3V0Ow0K
ICAgICB9DQogDQorICAgIHAybS0+ZGVmYXVsdF9hY2Nlc3MgPSBob3N0cDJtLT5kZWZhdWx0X2Fj
Y2VzczsNCisgICAgcDJtLT5kb21haW4gPSBob3N0cDJtLT5kb21haW47DQorICAgIHAybS0+Z2xv
YmFsX2xvZ2RpcnR5ID0gaG9zdHAybS0+Z2xvYmFsX2xvZ2RpcnR5Ow0KKyAgICBwMm0tPm1pbl9y
ZW1hcHBlZF9nZm4gPSBnZm5feChJTlZBTElEX0dGTik7DQorICAgIHAybS0+bWF4X21hcHBlZF9w
Zm4gPSBwMm0tPm1heF9yZW1hcHBlZF9nZm4gPSAwOw0KKw0KICAgICBwMm1faW5pdF9hbHRwMm1f
ZXB0KGQsIGlkeCk7DQogDQogIG91dDoNCi0tIA0KMi4xNy4xDQoNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
