Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BF1125DFC
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 10:46:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihsL2-0003dn-Ds; Thu, 19 Dec 2019 09:43:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=datr=2J=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1ihsL1-0003dV-8P
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 09:43:19 +0000
X-Inumbo-ID: f72471e4-2243-11ea-88e7-bc764e2007e4
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.132]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f72471e4-2243-11ea-88e7-bc764e2007e4;
 Thu, 19 Dec 2019 09:43:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eOgWz16Md2YgT/YrOvG6legyeqIRDGSh6n4RFomuNA9+DftYl6jqDwrAYOb17TdbLTfSwlRMF+gAz5ydgYuABgXzCN3EbuC6aXmgRzYK31Ty1usLOCmf7BkMQ4cX6BCQ36bdsWxYSOUWZWsLbHqI1Z6Z1bmKKwIeYgSu8Oy9j0wXZqkBjGzjmwPLbIZWa4Ea0jUAn5bergRKEjtK4Uw2DbbiCCJwGO7zOAlVwDqLL5MwDEdEDrK/aAwZoluoYRr8CuByutG0HcuaaomRDlPxBzgxdLSei4BMBlJDaedFhPn0ih2qbcaiPkzx8i/RlSK0MhX9dXJp6+yfS7QERogG8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+QefLAquYG8N3ibBCmnRRNXGa63cmqz/MXsxCsF2jCY=;
 b=Btf9jxqXc09Lqyp0mMizg3ZKSofUPIVsYymN/q4Uxj0KPHfqq7n8nQqGsQD01K8hztlvKMvD4pKOtaMdLKA8p4o1QX0xrFS9L+5Fsui82IhKwzY4CIjMtk/7PZ2w79nsWKYocx5BcbezaYsIW+HhpNq8cUOvnkqkqtKvLQfrbDfuN8sxV8bc5WbSRTUMxtbiQFY3qHX0tWIEVL7GdO1bml3v1wT3iJdNbnTUJCPi1tANt8wntLqc6WFEkJP11BGNPbW2T2DN0ibiG0zXkQdHt0oy4ahnJtxWzhipdgCmGY+me1u2nDR+OGOuoY5uP5CNSd1jO8ylKBI/s4L0pDpSDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+QefLAquYG8N3ibBCmnRRNXGa63cmqz/MXsxCsF2jCY=;
 b=mU+iNWgxDRxZK7lhu/XpS+MMFAt56Mit2y9jQj12HegmkVblK8HdWFxMuFZ0biK/HyGdPW0jFviWk+/8LGLLmH1aweDzinc9qYEyIqqoqBRZQpU4nCWmlsxPqQ0XSjOKbyQLELtvLLOKJkqso0UizEVqLmbIOlUMYN+/QCTb1Bw=
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com (10.255.30.78) by
 AM0PR02MB4258.eurprd02.prod.outlook.com (20.177.111.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.18; Thu, 19 Dec 2019 09:43:00 +0000
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d]) by AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d%4]) with mapi id 15.20.2559.015; Thu, 19 Dec 2019
 09:43:00 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH V5 3/4] x86/mm: Pull out the p2m specifics from
 p2m_init_altp2m_ept
Thread-Index: AQHVtlCzfXpC8E7W8kCJQi1II8hFtw==
Date: Thu, 19 Dec 2019 09:42:59 +0000
Message-ID: <20191219094236.22002-3-aisaila@bitdefender.com>
References: <20191219094236.22002-1-aisaila@bitdefender.com>
In-Reply-To: <20191219094236.22002-1-aisaila@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR05CA0074.eurprd05.prod.outlook.com
 (2603:10a6:208:136::14) To AM0PR02MB5553.eurprd02.prod.outlook.com
 (2603:10a6:208:160::14)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 47ed198f-f8b7-4893-abe3-08d78467d59f
x-ms-traffictypediagnostic: AM0PR02MB4258:|AM0PR02MB4258:|AM0PR02MB4258:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR02MB4258BB31256D010398353B33AB520@AM0PR02MB4258.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:243;
x-forefront-prvs: 0256C18696
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(396003)(376002)(346002)(39860400002)(366004)(189003)(199004)(66556008)(26005)(5660300002)(478600001)(6512007)(2906002)(6506007)(81166006)(66946007)(52116002)(186003)(6916009)(66476007)(64756008)(6486002)(81156014)(71200400001)(8936002)(66446008)(36756003)(54906003)(316002)(8676002)(1076003)(4326008)(2616005)(86362001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB4258;
 H:AM0PR02MB5553.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KLSbjVNeakFUDRZagnjzvFK8uFxeJtiltwalTI0C8UBd2K2YIPeqw9JG8M7fSvZeG79oVabXkQf2tgbEu/KXaxxPBb0LU18bZC1LT9hm2AqpIoOK7BBDd1w7AncZYb70jdMhm2BjHOf37hJXzp1vQ96bHkUlYDr9TJVPhwJKTlMUxgB/wnAxuneTRpKqXCNGtb2ZyEToCsPC+P/+nrK8VLg2hdRxFM62KdTc5fDfZfJvDE3qbK47seZA+PN5t5QEeVm+2+p7qUPVyx+qbGjORVX/PFx0SbpC1H/cHhGN6pKJwk9Z5JLD/BmVsHWQSfmYutYytWlHn//f1832Ks0wUUXcofB8s0NyAYzOSsiX1jS6D06+5EuAQ2dwcUEmdEGqvNEFlgj+OkaTEdpP1+YzRmhRDPdKoIZELBWRqw5UI0Gsyq55V88qeh63YafMKBta
Content-ID: <F22913ECC13FFB43A012F029CFE4293E@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47ed198f-f8b7-4893-abe3-08d78467d59f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2019 09:43:00.0291 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nnjL2QbbLMnYLnsXJMEhu7c82LuC53JI2HC3d6dqP/dK6pCMq4QOmGEj8KMEgh/tVe7PYroZB9O44fs8UbvU+zS/mjxcQDsjX07by9FmFzk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB4258
Subject: [Xen-devel] [PATCH V5 3/4] x86/mm: Pull out the p2m specifics from
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
Mm0uYyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYw0KaW5kZXggZDkyNjEzZWJlNC4uY2I1YjhkNjdk
MSAxMDA2NDQNCi0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYw0KKysrIGIveGVuL2FyY2gveDg2
L21tL3AybS5jDQpAQCAtMjU1OSw2ICsyNTU5LDEyIEBAIHN0YXRpYyBpbnQgcDJtX2FjdGl2YXRl
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
