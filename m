Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A848D1296DB
	for <lists+xen-devel@lfdr.de>; Mon, 23 Dec 2019 15:11:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijOK9-0008Uu-NM; Mon, 23 Dec 2019 14:04:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R5un=2N=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1ijOK9-0008Up-2c
 for xen-devel@lists.xenproject.org; Mon, 23 Dec 2019 14:04:41 +0000
X-Inumbo-ID: 28afbe52-258d-11ea-96db-12813bfff9fa
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.93]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 28afbe52-258d-11ea-96db-12813bfff9fa;
 Mon, 23 Dec 2019 14:04:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kLADuOy4/qO5QYvkHDqwsNF/jyq5Xkhu+F4zGKAjFf5y4taqXK4nKie9eh4JvNeFZp5v8KLATUz2gFIrGbSVZSbdeBjSfqRYcdMzUvhzoMyxIdLJTCbCGPrGTIadKL8/pEbYJCXxro1xuAA+irqOhFSH8sdYv95XrY+2PGt/Ok1Te0AL2YR1yN3A9WaYewZI1CHuQpmWCHOWUAClsikSikmpw/Th1K/mOtxMjeTCRm4Fr5YLV+TN8E+VhLG2gHZsJecNsTkCrxvJH/atBNaA3J6MWvVbx0M3WvXfCz0t3Dy5+gg8TuwO3RiHRJoLsuXg4Y7xvJiNLxU5zQgSwN0Y4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQFJylev6DCpsdMN2FnVo6t0vxDmyNzUTEnRdCtD3zA=;
 b=Rp/z8usLgkjAZUv+EDrUQTnVA9TEe+YS/JkSosiRIAKpsj3wR4+nlu/DRoFn8uP28JvGRMkByryO/NeVQM97ayUqg+fQtwZfSTpiCU/tbu2FOIVN3JcE55oq6AB3fxsM+lR4Bj9b7sgYTntoDcBGfK+9BAUYCpyb1Uky3l1tRXKs9jmsRVSXYqiNxAjOMyBdTd4vaXm7/IMNTdTcW6jQftmay3B9YbzqW9rdYz69YjrKFZ1lngrSX90qF5oDCikx+HZck0F04jEpxoVpV+XaGzmN/d2YtSXGr5yy6XKdNrJoFHCqGOk3auoR0Ibj61o15cdAZKQRZzuSiBPNXE7PDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQFJylev6DCpsdMN2FnVo6t0vxDmyNzUTEnRdCtD3zA=;
 b=HmRdOjxiwu8ojaQ/NH9bVjbCGaXLQZAsHcqFSC9+SVvUxnIYQCUrpYKfnDslOx6oMZxHGFoXi02WkilkjGX5dk+zJXGSvN3cEpmn8H9yvOQJ5wD4a3ZXVew1d7hjzdX4bktuzUgqOAOrMeWolh4juvrsw2a7m2oXnUW7vDorVvs=
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com (10.255.30.78) by
 AM0PR02MB5170.eurprd02.prod.outlook.com (20.178.22.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14; Mon, 23 Dec 2019 14:04:38 +0000
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d]) by AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d%4]) with mapi id 15.20.2559.017; Mon, 23 Dec 2019
 14:04:38 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH V6 3/4] x86/mm: Pull out the p2m specifics from
 p2m_init_altp2m_ept
Thread-Index: AQHVuZnpQDt7SsmM9ECzADswn1jViQ==
Date: Mon, 23 Dec 2019 14:04:38 +0000
Message-ID: <20191223140409.32449-3-aisaila@bitdefender.com>
References: <20191223140409.32449-1-aisaila@bitdefender.com>
In-Reply-To: <20191223140409.32449-1-aisaila@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM3PR05CA0156.eurprd05.prod.outlook.com
 (2603:10a6:207:3::34) To AM0PR02MB5553.eurprd02.prod.outlook.com
 (2603:10a6:208:160::14)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 13071b44-4f74-485d-af29-08d787b10c1f
x-ms-traffictypediagnostic: AM0PR02MB5170:|AM0PR02MB5170:|AM0PR02MB5170:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR02MB51705182BFA569B564AC6B5BAB2E0@AM0PR02MB5170.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:243;
x-forefront-prvs: 0260457E99
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(376002)(136003)(366004)(396003)(39860400002)(189003)(199004)(81156014)(8676002)(81166006)(6506007)(66446008)(64756008)(66476007)(66556008)(66946007)(186003)(26005)(478600001)(8936002)(36756003)(4326008)(71200400001)(2616005)(2906002)(1076003)(6512007)(86362001)(5660300002)(54906003)(316002)(6486002)(52116002)(6916009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB5170;
 H:AM0PR02MB5553.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xJ9YDb0u0UcUI8lMULI7HPp6hxwQdS/qF95oqLUU7S4KIb7CQxiPVQ1sPoFKWns0e7U1UaDWHRd9nzHDR6yVQtrlVdh7driTjrsAO1zDZpI6wwoZIGQ2sT8bV0zBoPEF4hr9flwOR30xWczdJk5QuvIPLxU3zs+7BsQIiXW1Mi2CHksfN/KHUZa1tY7j1sYdIYgZPCb2+LGVMkxtxSsVRVZ/AKa50PcKGLMbIWsWoMPQog0wR6VOZsaT0siFu2a83YgCQKUuPDe5Lcr2/UVgkO9ep1w81GghiRGGtZzzTR93xU//PTC38OmDaFoGiiCgipo5lS+s8AjZwdu/B86skXENzRo8oFKCCsDk6YmH/OcpqHNKjtX4pjh1LUgk29bSDo3Bn5a6CKBaM1Z5rBlVrnrZo1AtAfEQF7uYnQ1QIsaDSzlf0kRzSP0CEYyRQZLJ
Content-ID: <8F2D2C75AB004F40AE14551D0CA6805B@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13071b44-4f74-485d-af29-08d787b10c1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2019 14:04:38.2276 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aj1xs6c8bG32rgsPplK3jn37W7JP1B7UoVNyy/+O7EU345HPCvV69S5k9JkYEsj0Pmp0U/RkWaWTt461NgvdRk3SWBnIiuynrMZsBJZ84WE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5170
Subject: [Xen-devel] [PATCH V6 3/4] x86/mm: Pull out the p2m specifics from
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

UmVxdWVzdGVkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQpTaWduZWQtb2Zm
LWJ5OiBBbGV4YW5kcnUgSXNhaWxhIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4NClJldmlld2Vk
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNCi0tLQ0KQ0M6IEp1biBOYWth
amltYSA8anVuLm5ha2FqaW1hQGludGVsLmNvbT4NCkNDOiBLZXZpbiBUaWFuIDxrZXZpbi50aWFu
QGludGVsLmNvbT4NCkNDOiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGV1LmNpdHJpeC5j
b20+DQpDQzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KQ0M6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4N
CkNDOiAiUm9nZXIgUGF1IE1vbm7DqSIgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KLS0tDQogeGVu
L2FyY2gveDg2L21tL3AybS1lcHQuYyB8IDYgLS0tLS0tDQogeGVuL2FyY2gveDg2L21tL3AybS5j
ICAgICB8IDYgKysrKysrDQogMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVs
ZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vcDJtLWVwdC5jIGIveGVu
L2FyY2gveDg2L21tL3AybS1lcHQuYw0KaW5kZXggYjU1MTc3NjljOS4uZDg2MWNkN2I1MSAxMDA2
NDQNCi0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0tZXB0LmMNCisrKyBiL3hlbi9hcmNoL3g4Ni9t
bS9wMm0tZXB0LmMNCkBAIC0xMzU3LDEzICsxMzU3LDcgQEAgdm9pZCBwMm1faW5pdF9hbHRwMm1f
ZXB0KHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCBpKQ0KICAgICBzdHJ1Y3QgcDJtX2Rv
bWFpbiAqaG9zdHAybSA9IHAybV9nZXRfaG9zdHAybShkKTsNCiAgICAgc3RydWN0IGVwdF9kYXRh
ICplcHQ7DQogDQotICAgIHAybS0+ZGVmYXVsdF9hY2Nlc3MgPSBob3N0cDJtLT5kZWZhdWx0X2Fj
Y2VzczsNCi0gICAgcDJtLT5kb21haW4gPSBob3N0cDJtLT5kb21haW47DQotDQotICAgIHAybS0+
Z2xvYmFsX2xvZ2RpcnR5ID0gaG9zdHAybS0+Z2xvYmFsX2xvZ2RpcnR5Ow0KICAgICBwMm0tPmVw
dC5hZCA9IGhvc3RwMm0tPmVwdC5hZDsNCi0gICAgcDJtLT5taW5fcmVtYXBwZWRfZ2ZuID0gZ2Zu
X3goSU5WQUxJRF9HRk4pOw0KLSAgICBwMm0tPm1heF9tYXBwZWRfcGZuID0gcDJtLT5tYXhfcmVt
YXBwZWRfZ2ZuID0gMDsNCiAgICAgZXB0ID0gJnAybS0+ZXB0Ow0KICAgICBlcHQtPm1mbiA9IHBh
Z2V0YWJsZV9nZXRfcGZuKHAybV9nZXRfcGFnZXRhYmxlKHAybSkpOw0KICAgICBkLT5hcmNoLmFs
dHAybV9lcHRwW2ldID0gZXB0LT5lcHRwOw0KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9w
Mm0uYyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYw0KaW5kZXggZGU4MzJkY2M2ZC4uNWI5OWQxZWI5
NyAxMDA2NDQNCi0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYw0KKysrIGIveGVuL2FyY2gveDg2
L21tL3AybS5jDQpAQCAtMjU2Miw2ICsyNTYyLDEyIEBAIHN0YXRpYyBpbnQgcDJtX2FjdGl2YXRl
X2FsdHAybShzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgaWR4KQ0KICAgICAgICAgZ290
byBvdXQ7DQogICAgIH0NCiANCisgICAgcDJtLT5kZWZhdWx0X2FjY2VzcyA9IGhvc3RwMm0tPmRl
ZmF1bHRfYWNjZXNzOw0KKyAgICBwMm0tPmRvbWFpbiA9IGhvc3RwMm0tPmRvbWFpbjsNCisgICAg
cDJtLT5nbG9iYWxfbG9nZGlydHkgPSBob3N0cDJtLT5nbG9iYWxfbG9nZGlydHk7DQorICAgIHAy
bS0+bWluX3JlbWFwcGVkX2dmbiA9IGdmbl94KElOVkFMSURfR0ZOKTsNCisgICAgcDJtLT5tYXhf
bWFwcGVkX3BmbiA9IHAybS0+bWF4X3JlbWFwcGVkX2dmbiA9IDA7DQorDQogICAgIHAybV9pbml0
X2FsdHAybV9lcHQoZCwgaWR4KTsNCiANCiAgb3V0Og0KLS0gDQoyLjE3LjENCg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
