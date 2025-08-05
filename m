Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F37B1BA61
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 20:41:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070873.1434491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujMas-0003qa-Jv; Tue, 05 Aug 2025 18:41:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070873.1434491; Tue, 05 Aug 2025 18:41:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujMas-0003lP-Fn; Tue, 05 Aug 2025 18:41:02 +0000
Received: by outflank-mailman (input) for mailman id 1070873;
 Tue, 05 Aug 2025 18:41:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6kSf=2R=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1ujMar-0003e3-Pk
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 18:41:01 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb78e5da-722b-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 20:41:00 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AS2PR03MB9719.eurprd03.prod.outlook.com (2603:10a6:20b:60d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Tue, 5 Aug
 2025 18:40:21 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 18:40:21 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: bb78e5da-722b-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qByu3emOOA7qyVbifXLhaRW1q28bincxGA1rgIZU+JZcYnNOmQW+eHjuuCCwuiI5Ba19RyK24LZdBDVEbZRG1zoc+S8qY3QKBhXXkNrFBSM7njV5+e0UHu4qdRZgCn1ptQ6KWBLJPhtqrMhX7gXimP24rIQtqzlSwoIVTMqLt3QmYC938N4uSkHo2BHxS/jw8sS4odS7FdKnYB7baVDmSFnIfqqWl2b4uwo4MVtJHR2N9eUYm0JEJ9np+qVLN7hQOf07dTaYvDakhk1YDyxZaHxtFVYxsPRY1qopxUMlUW/0PsPAFiByBYgCYFKMbFoJcaQmkLZCMkFW7tpAgiyE4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zB2KQ+scFytrUE7aWgUqxSHfQlc8SZRvYpZoxy+Fdno=;
 b=CebIJEm8wlcVPwZBiS9HqIzzpQqggWpx0Z5hzeXc9g2L4+HrvQrXBuR7KoS4s8AtmiT6ugl8+fE1DUX8gIMu+5NgB8MWtmz3ySkRG+qqMCCHfUqxHVNiduvkm5A/tI1pcEEeEUfWJZb79KhO1WuChWxBza0fLJhxV+z5GEJaUYUdrgSYsHffEbijLML5BHxaUpzpFV9raBoad/uuwL6lW9Cxc8b+muexKLZcxerTOLKNdx/7dd/kdKRrxMFB12CjRC4OB6a17EGG87qsUwoRX/cufK1KdUDs/5RnXnIhKZioP88SR0KFI787K+OD+fybmvbt0XtVPqOQjxtWshi7eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zB2KQ+scFytrUE7aWgUqxSHfQlc8SZRvYpZoxy+Fdno=;
 b=uxHjsOtKHHyZDmAFuD+9MsaJFdBT2XRn/uARG6QA9PW8Z03RTlUpMvFGLyJO2RmC8YDUc43aF8yHpgUUm4j8hYuY1dpAeb5bfBiuGtRaj8D9Z07Ot299InbDL43D1/8Lq4FXZlrR/AUmrVXPuKwBYIFlOyVHiJ0aGOMg9GtkOpt+GwxX7sz8VgGUwf9WdP4A9USu4cTAjP6mUq2BjRuiI30ZsvKaB+jv3Dw0gEEX/hFkjlJcCBe1UeEjCHDzdQH5B4BXmp7aamRUSpzOonp/OZndLOErtv85CDnP/HEgtA5Zvd3663Nr1YI7YKRzQO5Yjwv3JotJiZc/FxNI8Sg+Jw==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v2 2/3] xen/ppc: irq: drop unreachable pirq callbacks
Thread-Topic: [PATCH v2 2/3] xen/ppc: irq: drop unreachable pirq callbacks
Thread-Index: AQHcBjhlE9g3QIsKXEqpdrUXZNRhXA==
Date: Tue, 5 Aug 2025 18:40:20 +0000
Message-ID: <20250805184003.202839-3-grygorii_strashko@epam.com>
References: <20250805184003.202839-1-grygorii_strashko@epam.com>
In-Reply-To: <20250805184003.202839-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|AS2PR03MB9719:EE_
x-ms-office365-filtering-correlation-id: 6d8b61c2-a3c5-4535-6ad8-08ddd44f88ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?VAIUk8u+P5Q1mFy+kthC4K58QSYTsSsNSZIFPTjAmDKju8KlB2KKx2/NAU?=
 =?iso-8859-1?Q?+Ot/iUAkAoUPeNqWrvRe7d/3soOi/TKTW+Ijj1EngdKi/s0vcqBEDaCJOJ?=
 =?iso-8859-1?Q?SIxb6dpwkdD/5SPd5bO9f5GtTqBiHjh9aq6gKVE5k5bLvJhuxd/78eSgy8?=
 =?iso-8859-1?Q?78fe+M2V5VoxVxyHoyspcyjRhrkQLBvw1ShHs3dao0L1N2/rg2jl5UeoNl?=
 =?iso-8859-1?Q?aX/vxVoFDncMlAwg2SNH6fWN0x1kmET9P6OaITvP4cQxSTeMrMu+YdBQsR?=
 =?iso-8859-1?Q?fam6htLpzcE9fZnIVraX5rx2Ja28iXdX6sIcAZnkFRrxLrvNXukv67ylJz?=
 =?iso-8859-1?Q?jqD5dVkw6Xi6oPt8WmNPMyMNIVoxW8zU5zEUYeBTs/mWhIdGbMA7q73NUb?=
 =?iso-8859-1?Q?y+BySZ66VZTGMQVYw0LXKGfPQIaia3c5iDF6zAPw9XAuHL73m8RAKYnqNm?=
 =?iso-8859-1?Q?TZRtGpWFajtna1ibKtQrjIfKTbNCgkp83z2tj1i4w6d0+v7l+ApaINSmAh?=
 =?iso-8859-1?Q?ne3WP5lBKYtFmlP/UWHrE0CK0sdJQ3fZ8AP8+qHHErxy9S4+W+dG7dyRfU?=
 =?iso-8859-1?Q?lPof/1hZS4WKOfsB0zP+E/mFnvbHmk1jrk8mOpeneg8BFmfKD8O3ylByEQ?=
 =?iso-8859-1?Q?reUvz7fv+b1oHNdkdNhuXHemE9vyOjiS9QEe5aaC2suJ4RqhlWfOOgUQMh?=
 =?iso-8859-1?Q?mZbkJJ3Myx9IlgxGbRskecuy1GcqwCg2gdI4hW9NBWlfNGTSttfASUGl/d?=
 =?iso-8859-1?Q?2B53+yfATyERH6V8UpnwBLQlaqrArPnYaQWBBOgZqLPzclt0cEYImR64hR?=
 =?iso-8859-1?Q?FJJ6C+MoWkBgP+O6jQvVpFRvIKNaQH/S3VgellWhR0L1yZpMgDzZRNmiJQ?=
 =?iso-8859-1?Q?X+m3o/4afxkWvwHcIBMlwCrkBl20S3NybZLUTQ4LJPQUQa6eSKKcUOYIu9?=
 =?iso-8859-1?Q?1nbr++qe9FrQwErlC9/9KpjBL06nhYUqOhLOIWLJh14Me8IyYpVfMZn7Iy?=
 =?iso-8859-1?Q?ibcL1PLV1aKtLe3IaITLLzsVaM9A21iDiMaQ7EWNh/aXMvCbQ0rClRPw5X?=
 =?iso-8859-1?Q?kURcjAYkHxd+mq+2RjH8dSLfLe/RHEFY4nffiuXZMjCJII+mCXa37gOp58?=
 =?iso-8859-1?Q?buV5S/sulXVf2uFliuEC3EzilhnBzEFqG87NBNBZAlyqvP1/EST/0xsWD2?=
 =?iso-8859-1?Q?7OFU640QThxfDEuj+F5x7oRWAGBRKjx5o+3kzxSdgTGfClt31XSyAdiWXF?=
 =?iso-8859-1?Q?FOll8bWEzJM1o6jiHOSARyjcvOSdxN+qqhBn0Xwu2O67NtrUZ2TaX6ydOG?=
 =?iso-8859-1?Q?1oP0IvLZfc5NFC2w5+ZKW26BG/H6JoEHqklXob0tQzgt4j0PC+p4hl2Oao?=
 =?iso-8859-1?Q?7hTulIr0BY3ut/dMoBgiJVeqkR1V56pMcymCXVhdlAzNyfug58kOtyWxqX?=
 =?iso-8859-1?Q?Kh9cMNsU47gHLVAt61hebWiUlPIl3czndzFWBsCoVu5oWgzOJFe6lsMzvd?=
 =?iso-8859-1?Q?jX+kUABuemYjGKLMkooYAoClu1z7Du9OBVeb3vL6SZKA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Tl0n6PXgWDNw6hal7dKtIf9ushJHiKZusQp4TlKaVpWQ+Wj0n1B9gfxRhH?=
 =?iso-8859-1?Q?XORuUKHsCvNQWyfuXw1ufntD9xNOWCONuIPQf8FQ2wRfFpJhKHJw8jHmQM?=
 =?iso-8859-1?Q?Fccrj0mA+SGgphMu+tnD8K4Sx092Bwv9+zDlNPq5/JOe6OnnLZwXvNn5Cz?=
 =?iso-8859-1?Q?Zt/9m9b+EBJEXhpl3duq1LE39yA1+X0teJj39t4qskMm0ppPEI4MWJZfQB?=
 =?iso-8859-1?Q?csfW3er7el5+VlljkB6dd8EmWUGcn3GQGKdo2ShEZNX8RwFood1vuE1UQ8?=
 =?iso-8859-1?Q?LAiw7yDplmGBwU/FxXu3k0UyyjEpN8rWIIOZt+lRv6u77ZyFfKNmjXhrIA?=
 =?iso-8859-1?Q?PxeBtVqNn5zl/INkl8aDmQonxKsQ0QjTYheTUbVuVE+rK8CDDYC5lJl2DF?=
 =?iso-8859-1?Q?tzZfRIxryvUHoWV6jW2EmezGrW0BUlEcDTVX3KBDYJhZnqVNc8oSe6pwLg?=
 =?iso-8859-1?Q?qpo5kOFhKE5LxihKa0ZGa/IqoFgKasUL87O0HalTbAFamAZKwaJIYrynEM?=
 =?iso-8859-1?Q?RS1iEWIQlPabQrtLLDTMrL8wAldK0fQCS+JyHHRyX0UboPHr+kLw2fJkYj?=
 =?iso-8859-1?Q?t16anAZbYbEOck4kZFx5tu9AzuGmJsySt8smII0B1+oQK0gFBbf8+AZ2I/?=
 =?iso-8859-1?Q?EkMcujQas0++YE/PJP5c8urizzmDxj7+v81OgjLJ4/ro6j8VHLVGkLCb0z?=
 =?iso-8859-1?Q?hYYrmmmC6zwzoJha2yPngikGTOqu29d4InXIouRD1yNXxImtTf3uIIjYei?=
 =?iso-8859-1?Q?Xuo/nFw3boLe/w5YuJP8/Mf1/epDNGpTcCliFNALPYUQnzsXYnDKfJ4VT8?=
 =?iso-8859-1?Q?haBCb8HXYGWwaVD5fe9BEZ3ToaXAyw0khqj7CcyC+Zol2GjeA6BGeIslnw?=
 =?iso-8859-1?Q?fWS2Wg40Krd8n1/1JQT5SB+Bfz5pglia72Rt/XU8ri10LGXdBiJEHtyhdI?=
 =?iso-8859-1?Q?oXr1pvRLPmlJYZ6RC0s8vGjrLa+I26bXzAE/zUK8EuWCEdtBYfl/i4DqWw?=
 =?iso-8859-1?Q?vYXMTToWh1cu+XGic9QpxCjij1hzUh4oE14JDNcYFKoOIsunYE6gdBr+jJ?=
 =?iso-8859-1?Q?Tru0202rWAc1/kae+yR85Pok+1cI3p1+iZRiYiHX1DYmAmCC+lFz+a3D/Y?=
 =?iso-8859-1?Q?wPsOLvtbYp6j/Y/EheOAPLkpH5ZZ+BLgJkPI9zXRaw0YFi8KItgYkoTULg?=
 =?iso-8859-1?Q?q+YYJezeynFVmbV6f62VraMxMOySXo4lqHKaXd+ArZ6sm/EPNxwL+2qowl?=
 =?iso-8859-1?Q?LrmX2ER1GH3eZHxI4ts7nTJhDJjnR9zPll+gsilB4XS/Pu9kM19O8UL7iW?=
 =?iso-8859-1?Q?P66y54QFWH49mcdDdEiqdiFoI5Y96hrScNspngMpeGyvNJbZZmVM84Fq+T?=
 =?iso-8859-1?Q?Tc7SjQRlvVTHyp71kBN+hmsBzKAt7Wzjp8smNltdatdH3/zk7+sMJIymQR?=
 =?iso-8859-1?Q?Dfjvg7PEznt0/VxeF8prpOSVJR91ANnWdHjl2DSPxfR9GgNpviOvBm3/2n?=
 =?iso-8859-1?Q?/UV9+ADdiGCMnOJ/oZP2IaqRswa0Vb0MlNGe/Y5CrsHgzcEXtMMpmNMfr2?=
 =?iso-8859-1?Q?7EptV//NZS+0rUhiGlsqAih3ki82TemRi55J7ElH2udWp1xW7q+IOciqhZ?=
 =?iso-8859-1?Q?E3gtuOiZUZwPcOEUfoc4/q5gVQseZ6E497ZVJocBac0nx0vpU/v6uwJA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d8b61c2-a3c5-4535-6ad8-08ddd44f88ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2025 18:40:21.0006
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GzTWbXlh1uecGRtza6qgW/tLmAJyk/GqJpXVJRB8vvZRvzSzunk4IAYl4XG6yuMqHPMMtH+ApL7qnT0gy+youoKrkEZKiUZ27PgbHJQajM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9719

From: Grygorii Strashko <grygorii_strashko@epam.com>

Since commit 341f271cf86f ("xen/evtchn: fully restrict concept of pIRQ for
arches with pIRQ support only"), the corresponding PPC arch pIRQ callbacks
become unreachable, so drop them.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/ppc/stubs.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
index 671e71aa0a60..bdaf474c5cc0 100644
--- a/xen/arch/ppc/stubs.c
+++ b/xen/arch/ppc/stubs.c
@@ -103,26 +103,6 @@ void smp_send_call_function_mask(const cpumask_t *mask=
)
=20
 /* irq.c */
=20
-struct pirq *alloc_pirq_struct(struct domain *d)
-{
-    BUG_ON("unimplemented");
-}
-
-int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
-{
-    BUG_ON("unimplemented");
-}
-
-void pirq_guest_unbind(struct domain *d, struct pirq *pirq)
-{
-    BUG_ON("unimplemented");
-}
-
-void pirq_set_affinity(struct domain *d, int pirq, const cpumask_t *mask)
-{
-    BUG_ON("unimplemented");
-}
-
 void irq_ack_none(struct irq_desc *desc)
 {
     BUG_ON("unimplemented");
--=20
2.34.1

