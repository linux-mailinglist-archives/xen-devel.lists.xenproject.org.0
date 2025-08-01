Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E794DB18550
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 17:55:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1067311.1432154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhs5f-0001lx-1v; Fri, 01 Aug 2025 15:54:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1067311.1432154; Fri, 01 Aug 2025 15:54:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhs5e-0001jn-V8; Fri, 01 Aug 2025 15:54:38 +0000
Received: by outflank-mailman (input) for mailman id 1067311;
 Fri, 01 Aug 2025 15:54:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eZgs=2N=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1uhs5d-0001jh-5W
 for xen-devel@lists.xenproject.org; Fri, 01 Aug 2025 15:54:37 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0b3a4dc-6eef-11f0-b897-0df219b8e170;
 Fri, 01 Aug 2025 17:54:35 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by VI1PR03MB6256.eurprd03.prod.outlook.com (2603:10a6:800:132::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.13; Fri, 1 Aug
 2025 15:54:30 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8989.015; Fri, 1 Aug 2025
 15:54:30 +0000
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
X-Inumbo-ID: d0b3a4dc-6eef-11f0-b897-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rLQwBtsgYIOz8TZcIqDyZwEoct7NIFkMebD+w8l3kFJEcK9slvj2CmesjIA2gap718DBfFW5bS7RdvDCdc+AhHzD1E5ggbDpgUbwPglFBdgkYerp9klGrvP9/nzkVIucj6XiLtnV51zDqLdZNoCYpJH6A0J/xzSkD10FaowMAUUtUBjK7SXxwmxJ9UqwynPB9wxkau0TxK3Ep1dA8tQZT6ZFkICf5uh1Bap/1UePVg9/p3uWROeJh6cHah+EyjNREPbjuMd6/631tJaTJ39IvVfkA7ZBB64XrVy+ai1VvLGIrhys4QhN5zln5+vvXPh6jH/opzCO/zYxaf2wPJzILA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1txnkNA9XkWs7+KkGsJh9zAHr2VJctTrXf7Kp842qRk=;
 b=q5tKUnDHZ7gwNirCIum49D4aVAhbGNPu6MOwq3ffjXji0q7kOi8JggG0EbYoluAwVTaPfltS88iaLEpNyLB6uy0UUUdANH75e8ukCuTX9W7l0lfvSYMtzXiBaVCVwZ0K3uVNtCD+g6LkU+H4BHgqke75JyaikeJDQAWCNsHbzImHB2eikyCqKMWIrwvgCMEQURmxkvyofnfQtDOLLHv/xzmc23SC9HUlTOaQBq50nmvz8Fmm65Ftf2+TCJ6qA+C0AiSu+3n1Q+u/AiWdGBFMgWNOpbtMbGi1P52HrNZ882rpw7E/QbqPZR9WIzyUsrp/zQSf9UDwqFFYLDtE5iaWdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1txnkNA9XkWs7+KkGsJh9zAHr2VJctTrXf7Kp842qRk=;
 b=iArffmrG6whVM3EYdNTID++fP8s3MPJmFFp/hYP6ZMM58UEYBJVEbyfcbE/XK/MJgtyCiERvxreSBo/PqPVeoIieGLAjeLv1aob31e7nRpwTO6s8OC/9VLjIzJb5z8wjfNUN/4PjdDqJdTc/ssTtMNlpCrZpIvNLhiTyRiNi3rUVhKNwSULHLcWE9sucZKMKX3u9SowJ6Ie/Ca+TFuLGnNbVn5Giz/P8doVzA2Xnaxd8lVc/wSY/JDkb1WiMo1zMpUNapRBtHN1RW5drJZJolhUc6sMN7A93aC+LxLaYncsoR0Vv3B1r9bJormHGU7FNe1pnClK+uStSLvhr09J1AQ==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [XEN][PATCH] xen/dom0less: arm: fix hwdom 1:1 low memory allocation
Thread-Topic: [XEN][PATCH] xen/dom0less: arm: fix hwdom 1:1 low memory
 allocation
Thread-Index: AQHcAvyR/OgiYXqFFUajtgPjc1Xchg==
Date: Fri, 1 Aug 2025 15:54:30 +0000
Message-ID: <20250801155429.1402395-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|VI1PR03MB6256:EE_
x-ms-office365-filtering-correlation-id: d792ad7c-8d91-4cc4-896b-08ddd113b3a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?TSLRCAm7wYq5y3fu7aGPqQWo/nCqk3Bc4QZzlPozBYIeaD6pfu90vfncD/?=
 =?iso-8859-1?Q?e2OhxQUsqZjpUE+hVRGANxePPPMapkKmErBIPbqzntyD7Q6NASD3JoeIqV?=
 =?iso-8859-1?Q?VCzGBB0EUpCD9/NhWzs/MMYo/R+RdmsrsqtEWH/FkxNSs0HfjG1OzkJwRn?=
 =?iso-8859-1?Q?UWrKnFElFNdk4Z2gCOnHuCEoC80qf5qV5QxvegogsFhkm7/iGEJiSOE0kK?=
 =?iso-8859-1?Q?Xb+2uhBi8D1Q7+1xyTl/yNcEEgnolO0949v7bIU+6IUhsC207P8P+7HvHU?=
 =?iso-8859-1?Q?ysift3L5Z77qsBfaQnAsi24I7oB0ioVWOXo/PzhsJiJNaP+MAr2vUPrc2h?=
 =?iso-8859-1?Q?CCJMdezu7bly3TMQY92hx8bbbQmFyaMDEAuxEGzdkCNwxXQRDipni7TXZi?=
 =?iso-8859-1?Q?z7oEbBiRVHYrPc3L6RX0x+wyiJsDd4VIGwwYfztSpwAR1rNzWAhM8GHjkI?=
 =?iso-8859-1?Q?azofEde/BEVD36Z1O+S2oQUIQZ+gP676mY1YXdx6y3/ktWn8Xheni/2B1Q?=
 =?iso-8859-1?Q?0y9OBUE4DuhN5OeBiZ4ilKoS2vjfO/UmkkSGTM7B5A1wmhBPutRfXtcMUf?=
 =?iso-8859-1?Q?LdleMaKHbtxN1+h7ur0Qb6+ZcfJRvnXw4hhLfRvfHmaPeldMhHKc5yKGpB?=
 =?iso-8859-1?Q?8792qWplBOw1eB/jKBXVTnGqhKm6LGsgd+DKB83S4WAz2DAjCFQSghZKpa?=
 =?iso-8859-1?Q?oacGVONdgD5Xq3INVUi1zdc9VOJooYFwPWq/whzFe3ucBR0CqsQKS6l/fD?=
 =?iso-8859-1?Q?a8as+vQhZN9GYnhAfLHLEd4fLWOl8o8MTg7b6m3sUU+cYCHlvaAZ2mI81i?=
 =?iso-8859-1?Q?rznwdWZi4wDcN3ZNtOWA0mfMSDj9jQQpBDKGUTdNN68qzWMuH72NGjw5+k?=
 =?iso-8859-1?Q?bKhEqxmpXlKwlpTfWDE9eJYMXvUGrZX8QNqPAU868S0rB8bREDQR8IOR/3?=
 =?iso-8859-1?Q?gSOF4NDxxs6fwpS9zB04cwpC62HS7gYhZvZKHint8BEaN37GugmNk/8zSg?=
 =?iso-8859-1?Q?/7SVnZrdJPgbZCPiB8S0CUp1sUW1Q3K/vAkGm66l9LuW56tGhDhAlRL0hz?=
 =?iso-8859-1?Q?y+I2H5GSY1itfxOjAEmY4iB2CmgdyS8b3ELBav0A0t3QJRZVcoPgOknooE?=
 =?iso-8859-1?Q?xYSwgMMOdtpLpFNZCYiMzZNlsSW8IH8stUkDx7ZrZ6GhR6PtXRdGce1DS9?=
 =?iso-8859-1?Q?gqsAeEfoSfSA7IjVSUm8ev1WwkDmWHCuUr7ji08CARB4IUU9kmo5SxTP8v?=
 =?iso-8859-1?Q?5UEc0C4LDqSZq5Mzdn1CSpmu026jUvZeilhERk1FF+tgTqeN0oSfS3IdXh?=
 =?iso-8859-1?Q?ZBq81TUsJ3nAspAFMKPFkyUyJeoLm3zE9RH7EIF0JVpxc7CBGTzTU1LJFu?=
 =?iso-8859-1?Q?+71b6ErOw84dtNilkPz3FMcVyi+rl21pNlyMPH1btCAqXOUqVqfZsoWaaO?=
 =?iso-8859-1?Q?9dLgD3OKSR7QazhQ7eSubhbEojKefuJtCRqZgeqOrVEGL49bUzgqkmXOnT?=
 =?iso-8859-1?Q?Z9/1RopLV7HP3Jrh0JyfdQnkYPyCfi2gCwBZBDsoRQRA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?y5K8Apg2orbMQKiDXsHN4EwHunG/NEv6HPi2mK7kZwKl1g2+pPTXVIrmNR?=
 =?iso-8859-1?Q?54uMYU25Iw97fC25VuL4wTORxF1lvAS5YF+utcpSG6Eo65WV6njpe8N8Uy?=
 =?iso-8859-1?Q?lyhJOdyhnIhLMMLLh+A5iDyK8yK1IJEy9ceLKydRyVK/v+nOmwiZt495Td?=
 =?iso-8859-1?Q?aZa4OCeU0ms0NrCexFM2+2HQmNhNSccNy3Ki5KWqcOyB+o78IpTmzN/rcg?=
 =?iso-8859-1?Q?/lkOrhrn+oyrgkpYyW0Vbmj096utkAN1UfU56wIRGQaJmbw6VonMKi/soO?=
 =?iso-8859-1?Q?2zhNIFw5G+VLaFAPwvr+76KQHdKmcRBhu7/pnvumRBbpNfMZh6d0BBSwWP?=
 =?iso-8859-1?Q?2duwJJGlCHVkgOKBdDY0yKTwFKM4W42Omvd73IzxfLsMvhRYT20+vDLoxc?=
 =?iso-8859-1?Q?fg0GkDWTtW8n2dbMpQX+Woz2GMLVIGyXssALlo+m0tEKGEOxRN3dYF/Mv6?=
 =?iso-8859-1?Q?KftRLlFbzd4QSjFZl/1C7u1eiYsrzj82zHUuobCT55Wl5cBjWUmWlqon6p?=
 =?iso-8859-1?Q?rF5BpchZbRdIhinTdSAPO8QQGB/Wxd5G6mMEDzT1nyf+5Wh6I7qGTEiBVC?=
 =?iso-8859-1?Q?KzsSOi6r5bVTPBZTd52n6aI6p/8X3fE8OmWIGfpCMQlbYX9gIkBWX9SyCT?=
 =?iso-8859-1?Q?G2wM1QrUupyEenr0ET+Tv6RT7IKDU1vVGHyUL0TaGMFXRD1MrgvRctm8U8?=
 =?iso-8859-1?Q?ymbm0cfLn/C8lgq2WSRg8QcZl2Yd9bwIbLDhJ+6DLXN82AphaKELgp2X9r?=
 =?iso-8859-1?Q?ulnamqNX+q/a8Jnrlipn/NmeP0lCVCiPrcLBpIZkk9loJDJs07dFzgYkf2?=
 =?iso-8859-1?Q?m7Fhi8BESLzD8BeOSXU6dtUzehD1rRnpShsm0iYHbTBhu8Q0oUkM5gwH4H?=
 =?iso-8859-1?Q?AuC8vF66/SLO1BGJHNAIIAUuWMZvKTohl6Iho1ejiTAjb8EU4Sa9MhSO8k?=
 =?iso-8859-1?Q?QEXJu279hnDeKT2hMFcQXttf2ltfoQKIImV29s931Xd00LgOA+iGHGou6U?=
 =?iso-8859-1?Q?pzxIDnQaOxUOl8Co+4gxBN39h5JO7Tq8SEtISUPJgcHJmJktbYKycHU4GZ?=
 =?iso-8859-1?Q?S4p3m4+VgqYOfTyJ0n6rXCUxTspW183XhMv3MzS7ty+AmaAINTYggx9TOF?=
 =?iso-8859-1?Q?idpjIYGJrgDbUz7VlDwN8QVAJ1ppeipnIwgYvJoBfURDhIWQyozqz/DV7Q?=
 =?iso-8859-1?Q?wxOnCTcRPcr3PhqqZkYuP9Z8Nw0qeNcGamnV1BpeIJKGcFSDb0kCTTiLMY?=
 =?iso-8859-1?Q?S5iof4DrWaygJnm8DoyeENH82s7AF6DNiJQqNDuWj75fPzLEH3P1zciCkH?=
 =?iso-8859-1?Q?b4pwth7zPFptHsmgm2N3fGy7pZgDX4NN8DwGoxBn9nBKGCJJcT8BDPy8Hg?=
 =?iso-8859-1?Q?8OxlqaTi894W63mdzHciE8v3z4gaHDRV4R2b3UvFm6a5ZT00chfJpG/eGS?=
 =?iso-8859-1?Q?9PzPpAnEJAzXgPrU31DsPq8ZsHYjVTgWH86KVZlUtP4arkBUnmVqTkk6vP?=
 =?iso-8859-1?Q?cd88nYhxp43xea/j8C7BYCmMB+IVNHxOjNKotZdFNaqTi+YUlfln4Vv5kX?=
 =?iso-8859-1?Q?tIZT62GMFkZRRwpe5ZXOgc3lMsILjY6p9C1ACcLmnhGn1P3opG5yEhCzU7?=
 =?iso-8859-1?Q?qDrvtuRagAdoYDPKevUQqMzUc0v7wTyVykeyW9Qhce+H6oTsX7OVLoeg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d792ad7c-8d91-4cc4-896b-08ddd113b3a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2025 15:54:30.4519
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lU8lp1iDpPGe63N7QS8S9Wt/vo8RE0H2Pb4DEJqEjjacLaefoHJhoGstyAsB+165DAtesyCwEqFJ3vN6tdKNMxazyFbOV584P32kAFr8Dv0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6256

From: Grygorii Strashko <grygorii_strashko@epam.com>

Call stack for dom0less hwdom case (1:1) memory:
create_domUs
|-construct_domU
  |-construct_hwdom()
    |-allocate_memory_11()

And allocate_memory_11() uses "dom0_mem" as:
min_low_order =3D
  get_order_from_bytes(min_t(paddr_t, dom0_mem, MB(128)));

In case of dom0less boot the "dom0_mem" is not used and defaulted to 0,
which causes min_low_order to get high value > order and so no allocations
happens from low memory.

Fix it, by using kinfo->unassigned_mem instead of "dom0_mem" has correct
memory size in both cases: regular dom0 boot and dom0less boot.

Fixes: 43afe6f030244 ("xen/common: dom0less: introduce common dom0less-buil=
d.c")
Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/arch/arm/domain_build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 801a09071a50..0a555d1ae0e5 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -278,7 +278,7 @@ static void __init allocate_memory_11(struct domain *d,
                                       struct kernel_info *kinfo)
 {
     const unsigned int min_low_order =3D
-        get_order_from_bytes(min_t(paddr_t, dom0_mem, MB(128)));
+        get_order_from_bytes(min_t(paddr_t, kinfo->unassigned_mem, MB(128)=
));
     const unsigned int min_order =3D get_order_from_bytes(MB(4));
     struct membanks *mem =3D kernel_info_get_mem(kinfo);
     struct page_info *pg;
--=20
2.34.1

