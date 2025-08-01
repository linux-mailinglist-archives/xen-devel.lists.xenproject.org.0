Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DD8B17FEF
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 12:09:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1067068.1432051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhmhC-00064E-Pd; Fri, 01 Aug 2025 10:09:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1067068.1432051; Fri, 01 Aug 2025 10:09:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhmhC-0005ze-Ll; Fri, 01 Aug 2025 10:09:02 +0000
Received: by outflank-mailman (input) for mailman id 1067068;
 Fri, 01 Aug 2025 10:09:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eZgs=2N=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1uhmhB-0005WC-Vk
 for xen-devel@lists.xenproject.org; Fri, 01 Aug 2025 10:09:01 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ac81a28-6ebf-11f0-a320-13f23c93f187;
 Fri, 01 Aug 2025 12:08:59 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by PR3PR03MB6604.eurprd03.prod.outlook.com (2603:10a6:102:7e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Fri, 1 Aug
 2025 10:08:56 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8989.015; Fri, 1 Aug 2025
 10:08:56 +0000
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
X-Inumbo-ID: 8ac81a28-6ebf-11f0-a320-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JCKsWRakLwyYzf4BTYs5H1H1zUCCpImRQV5w5PFHnffAngJIQuKJPp62EktN4WP5PSW3qsk26dj2Q38g4lXOaoxrRlTPG1X6AEBZ7Crtw8MmfUe3Otkk486Li+s5Jofa5RBBMGKXJXi/IyF3aU5zQIXNfejjmDyuhTnUymIUsDtMx5lnd5SUBYtajvJXMjaILl3wyFINcJ/wzDLvn5X7bv+1UOSA1hujGo/rxeZUd+yEj9lstyWKV+aFr2Xq2I4dIOVYBDnAu4xduqwOsXQ/8AaE2TqZYvffCOr74w/8ePToxtBkwTlIDMkBh6Rhp2GsrAZDmYJiGnJ0R2Yk4Kh+kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wrNY2qY3WqE1c+RRbuRXMYRfegzBRCI7aEFy15xy6dw=;
 b=re3jIyab3tH2RTDII9RkyzeirmGZfzi9xK32UwWG7rv+b1Ahrk0yKIBFJZnOS1HFISEICRBZdLaPfEGDPmtcN89CaA8074r6CbxmAYoToF1b2Rh09S5dGUzLx99NqZyHgWqSJ6zpSQkmvxr7tjCzaP/LtXpW/jIeoQAaJ3u96oRo7BZwzf72fJi4YSzmQdIKsMKmKNS1M8mXUnMuKWw9CBLh6GBw10Bzgq3Wt6RyEuet8QG6qn7jQhxdfSpSTJOtiSLBGDFiRVJLof6FeT0R665kIKOVmYA+FGuaxSq7+rmAr752Ar9dAI1gmJM3WcCMjUwsxNoJ4fYWC0YLL3wewQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wrNY2qY3WqE1c+RRbuRXMYRfegzBRCI7aEFy15xy6dw=;
 b=LcwbJ0BMr4AizCH6XM4mNw1xsFZYxUfdYYtqSirVCeUqupdBRTAe9h9nI244Wpdcnf8+NKXmkYD+8eWyUSgtc7TQkHqq5KQ7deMm1oXJdBSH+mPk81eOPawUc4co+wp7muNucLLpzYsbio+T8dvJvCmok6r3eTdKXxOTtzn8F7K1CfZeEcs4YLxIT6i8fxfeLcyU6ZEJVZOprY6aodxt6mOrUvjLfO9l8wIVPK3pTlaCM9Q4WMDK3yBG8WjbjxZ0iHM8WpJWsGIJwic64I5Ic6O/45eLKGOAUc8bzKD8h78HDyC8FmOgEI9tsZo0OQKSHlhdAR64ReFrdDTZ/eWaXg==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Connor
 Davis <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: [XEN][PATCH 3/3] xen/riscv: irq: drop unreachable pirq callbacks
Thread-Topic: [XEN][PATCH 3/3] xen/riscv: irq: drop unreachable pirq callbacks
Thread-Index: AQHcAsxKoBNPnM+NO0mt/czZMWhDgg==
Date: Fri, 1 Aug 2025 10:08:55 +0000
Message-ID: <20250801100852.1260544-4-grygorii_strashko@epam.com>
References: <20250801100852.1260544-1-grygorii_strashko@epam.com>
In-Reply-To: <20250801100852.1260544-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|PR3PR03MB6604:EE_
x-ms-office365-filtering-correlation-id: 54cab3d1-c786-4819-7b75-08ddd0e36d00
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?5XH+YROZARqVBuCmeMVdOGKnX3oQ26Kg9aSl9SFLAg5J37c2eyUwDj9XjK?=
 =?iso-8859-1?Q?Gj5H/0pT0I8irstW7XgxK3spClZFMdN1445CtK+KebCG07J1GPq8njezcx?=
 =?iso-8859-1?Q?Jdb2Bt8GPaGiBzaKc3M6IwyQheKZfmiIHqYDL4WSyBWrMkHHMuQ4ecSFDq?=
 =?iso-8859-1?Q?8l2Jon8FLB7CyC6aAYHgKWdioRxlFAUsaP5X/JMcqykECzjOsuEBWqMVxD?=
 =?iso-8859-1?Q?r5LHtrxRRVZSketFsaV0HQSROydzPeKhDm89ib7piMnkvYsY19Qrftznfh?=
 =?iso-8859-1?Q?nyT0sOyG+rM01TobdpqpP9LBGbAvJ3pualNzbnOWafJZYhsVwm6agi1ZFg?=
 =?iso-8859-1?Q?D3kqOM5y+t29EcZjyXbWsehvwDS+8wRxXa5ph8NdgBS3P3x2ebmmbGZDcg?=
 =?iso-8859-1?Q?KO5Q0m/oBqQM0Q9p6Bk0tD2fbz9+8UyTKNLOhZE+xB+2NKbzmR1J0OwCD/?=
 =?iso-8859-1?Q?6Aksn67uESir83j9wxnSctT70udEF1w0/BKYofs7kkmGUy9emaxUmvzkxQ?=
 =?iso-8859-1?Q?WJoPrH2d2Wgd/WnAGy5R0Lx1YtjglQXKe4KjNJkaAydzBWMmNMmxHmNBKf?=
 =?iso-8859-1?Q?yP1z+ET179FTPr07i0+V5f4lDb0uQ2zKET8jIvzK5VX4K5A2ctDICjNxtP?=
 =?iso-8859-1?Q?ybLpxhamGZxWl9f7qa6l3X2TFbBZPyCpQOuk3eUhTatm8iIEHDLBPtkx/v?=
 =?iso-8859-1?Q?gNY+cjcWBijLknzIoWNTN/6lxKPU4RtJgwRbmH1ZMFS/SLYv5l+Jt1Daeu?=
 =?iso-8859-1?Q?spHhPof8Uf3Mwfiu2zaTIivmFA7hcnxZerNCA8jEEPnAknlhBQLHfC30eI?=
 =?iso-8859-1?Q?E9ud8tsU2ZshfQQxafitt+QU0W4UgXDwg1FWGdcSCcUFhHtgzCmB0ptgJk?=
 =?iso-8859-1?Q?EJVWDerhk7ZxAVf1wkUZFbiH+jByJxpl9Kqk9djQTegIN9T12/HCzcfpWW?=
 =?iso-8859-1?Q?nFrr7R32WglSkOJatwQDR7e7vVXPO7q7PFrG4O17+TfU99cOQgv3a3hMOR?=
 =?iso-8859-1?Q?xxsafkEzi/SlEXgqs/kvaRogTvMJIIUm0MTfbbj0diMOfBBid2mn8gmz6b?=
 =?iso-8859-1?Q?N71xhpPiJsSmTpAmSVzMkf+IM8BhG72g/AIsjan/GfHIMShjCl0C93AedK?=
 =?iso-8859-1?Q?qg/strH3iKT2ggaBlmc99i/VsdiPJZnumO/58zWSRhugAMT5TMtHvPjBOm?=
 =?iso-8859-1?Q?F8Kb06hFmRFLb/xUsh1nxq2MAXSvLxfrD3tJXeYVvCLgAe91xcbwOWRqnn?=
 =?iso-8859-1?Q?0jjME4iKaPub5N33+AeEV1s+7oGqsWeGvdsCkISdE3F3qXu1jeVFK12hEA?=
 =?iso-8859-1?Q?GM5iNkT6P2bXy2u9jqB6gRnTdCc2noL/mW8zG54wqBhCeYmX6lr4GtVgi2?=
 =?iso-8859-1?Q?Q69VilLQCVYvYQKJusHdLAzgmQ8sAI5To6g/28rkJGyzdqeLVaOc0GE35a?=
 =?iso-8859-1?Q?uWE3JwfpcRCmLoeHtlN126CaNs/v3DlMj3RYw6zIUE5A1ae/9ybNlzC1xz?=
 =?iso-8859-1?Q?F8kog6WC2t/m1lDmvttJfPbZPK2q2BkWx1zofY5Ao9uw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?eMJomuLNs0KAWW6ceqcDoyBGUQiKKdrw9KXx7SvR/Bra5xr6sg4Z8eemAX?=
 =?iso-8859-1?Q?x923XbfTyV0hNJwvV4mFEKX1ZCsE9KzzOeGe8TXq4yh83q9a8H30vdZo0F?=
 =?iso-8859-1?Q?pnX78WWJcVD0BihTH7CGGdWbeW6xocREwWYUdkdhBIi8zRKHDIEcf7o6G0?=
 =?iso-8859-1?Q?P+qd9bra/HXnPgT4gxrOX7rpslRA/UaIQtUMvwBirmXGruaXVxsJ0TgD6v?=
 =?iso-8859-1?Q?hXjfvHA4/8IRkQ3KdLhQQLzcuzLrupw/PFQfA6tvaBZ7WjeuLbhQoeo7+l?=
 =?iso-8859-1?Q?BhF6GCzJ4T4zKaFoHoH+ToaKYXd6uO9bGLkBw+xdAkDo2lXLKFAZrp8gev?=
 =?iso-8859-1?Q?qLYBo32VSzn6KmMMIM1Nbp3BVnAEqjRiLO3n7QMcUm0KB16mVLC0cQhxXB?=
 =?iso-8859-1?Q?Igdq28obUW5cw23qgLWXCX03zwI3HaxfTrj2FPJpuNwYtBLqaucSDHne/Y?=
 =?iso-8859-1?Q?N8cMHnt94sP+urA/RjR2Xx2vA5tHxon7jg+XbEJtzTkQwfPL0BWYoIdV4q?=
 =?iso-8859-1?Q?dhEZ8vilUDjeQuBd+mLLOBzXZbY+ZcorOmWzWlLFLt0kD2xC3ViyIIOsH5?=
 =?iso-8859-1?Q?6iV7OlyYHz+WqDV4BI2sJD1OZEPzS/21wx9cPxTZH07TP1/xdtTfzYSROP?=
 =?iso-8859-1?Q?g8Ef5dDwInFmIygTWHQ1Whe+BBj2hqfe+WkYqEFOBSIjqgCm68QI5sB/Qs?=
 =?iso-8859-1?Q?+Z6f/bc4im3PPfmRQXi4Oj3cE+hTqKYaqyQk0HY5YbQlm5Q7h2bo9+3Neo?=
 =?iso-8859-1?Q?AWTIvEty4gO2Wv1j9ihq8d4DDmXtI/2Kdki4sIkiCNDYxy50iBWj7x9w74?=
 =?iso-8859-1?Q?JfcfubUtC2IeNaeOifF+3hr0nBYQZdD6jcxg2+WLN2F0Td2bWs7S+m4VTo?=
 =?iso-8859-1?Q?fOLK1U32wuwE7wRXm+2L5fM6sg6KkD3gCedmD2MIEMyzPal1Rc2OOcr/nR?=
 =?iso-8859-1?Q?x3I7wxFvzfG3iogueKN1HzrN/SgQ4OWG5cxACBrS43H3jQwbMAy4Ldxv4a?=
 =?iso-8859-1?Q?EaU+nAPwu0/uojKXsssVQBBvv7ob5F4U/dnFCCpETh4NgWf78HA7DuMxUf?=
 =?iso-8859-1?Q?a0Ue3P0gWaWiLOmcjNKbyTgmgX6XGvH8F8RlA6HMecPEN5G0EDxbQolxTz?=
 =?iso-8859-1?Q?aRmOyCAggzK+gGbsvjCkUryCwSLzv75rzoXQfAMQliBhJrGEDjn8ZebTLk?=
 =?iso-8859-1?Q?of7gT6up60KxsIZJV+tQzfZYxKI4WprmIitzQtRaldjWQwpj9QR/Ublzl4?=
 =?iso-8859-1?Q?Q/IGAxLMvC6ExoLRaJRtMo2Z/FVfofPGryAeIsqZHKib3GFTJr9POh53Nb?=
 =?iso-8859-1?Q?veDhNj4dNP9IWiMqQdKCrNfcFivEBwf2eGwQKumcaI/LJOQo2l4GOtgf40?=
 =?iso-8859-1?Q?Xu5h3osKhnwyKt++rf02y6akUJT9Xwyf+P3Q9Z2JCnQse70VRpDzZBjUKm?=
 =?iso-8859-1?Q?djBJ5svvlIIzx4mkQrLXrLnWYhZtvFVKnbINK8aRGGuhY+5IkOVdWkI3IO?=
 =?iso-8859-1?Q?ZU0jlGihsqCithkiMsLubURaQeCvKgSHScaXKYE9/3zRsGOz8XS6xsrIev?=
 =?iso-8859-1?Q?f9e8/k4FGoTY6gE6sk92Schu4iP1hxrUuvBF/GLkP5lemV7b1rGEtBqSGv?=
 =?iso-8859-1?Q?06BWVmgNctSEFseCFzoQP1q5KdCyv9gewjRRw0JL9EA481mpFIueKzLg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54cab3d1-c786-4819-7b75-08ddd0e36d00
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2025 10:08:55.6840
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R514XdBWZSAbClVlvqXQQu42eGb3pw1aT4JIcIA3SxJJSs7H+igddqoHg64OiIuSSr5gt14pbCF0peeF/7D+MIyfTUoy1IdICajgVGCnCcM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6604

From: Grygorii Strashko <grygorii_strashko@epam.com>

Hence all common pIRQ code is under CONFIG_HAS_PIRQ idefs corresponding
RISCV arch pIRQ callbacks become unreachable, so drop them.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/arch/riscv/stubs.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index 8918cebf35c6..1a8c86cd8da2 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -82,26 +82,6 @@ void smp_send_call_function_mask(const cpumask_t *mask)
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

