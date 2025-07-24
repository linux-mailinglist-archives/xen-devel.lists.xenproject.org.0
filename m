Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFD1B10E38
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 17:01:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056233.1424447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uexRf-0004wg-Al; Thu, 24 Jul 2025 15:01:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056233.1424447; Thu, 24 Jul 2025 15:01:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uexRf-0004nr-1a; Thu, 24 Jul 2025 15:01:19 +0000
Received: by outflank-mailman (input) for mailman id 1056233;
 Thu, 24 Jul 2025 14:57:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PMfj=2F=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uexNz-0003AJ-4T
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 14:57:31 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 857ed430-689e-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 16:57:30 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by AS8PR03MB8370.eurprd03.prod.outlook.com (2603:10a6:20b:50a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Thu, 24 Jul
 2025 14:57:27 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.8943.029; Thu, 24 Jul 2025
 14:57:27 +0000
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
X-Inumbo-ID: 857ed430-689e-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MvAzEhnh52A18rgg6WKXpfSm2+p4qmfpmTV1jiptdA342zG8gtJ+DT8fjW8FCooEQJ07Cq4vpmwxDimWZYBFqpPn4SRC2L19p16uAMC1ROajMKqEXHMprrHYNXRvYKcoq5S8sCwPC3GSJ3D+4eqI6egxMDTSOgIsOO+QuEuSKP7Te0pLifOiK6TwdP4wxXNj6VO1qrAIGp5zMtCBZvPAUcyH/6U3gELxAUshq2CAA8Wdsd8b5euzKxoYuuzRCF6ohhWYGtariF0QnGfCNLivBKylFLFfl07ppyl5T+0s3yrhGI40EqwK7nl67ZF3Shq3c/1j6s1LvwX7G/7VsksTUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6S09mXpqN6JFsA+d/cmSMr+x1LOLHHmyPbgmJCCy2GU=;
 b=CiyljdAEwSSHnBD9V8OhX09fefyIOa3aG7dmDLF+5Bp0qwhFuUYUVzm9EzhZ6tRwQmU7/I/++KW7EVf8EA22MEraEy8gY/5kksVmx9wqn2JjJoB83EqhbkA71Swo63jSSC7PFjsf3DjO+F0MJPAiKEy9JuHGi1OKf/IrcH54DU1bfT7G9PJwfVKzC5n3lW5WkC5jaH6RW/hhoMD3QrX0OhUHqTYzlBR9tdU/PDQG1EX9qFaqxl1mIVm2+KQ2nK4O/91byjF12gf2r7zBfpfDpwEXkJgEvw3ySEm1WTUSJtL8Oq0N3pf/tzwzL2Ea0z3ee/lKFOLcZhBEm/V3D4tBOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6S09mXpqN6JFsA+d/cmSMr+x1LOLHHmyPbgmJCCy2GU=;
 b=Xz1geIj9n83B2gzVHVUZcVqMzkyDqxedQP1oAyxgKeGXkuNsuFzTWvUlzyX31XAbEAKEU94gslOn81I6pSXQaJwhsdgK4jcOPjT73kJHo2pq7d0TiSBopfF/RwxtsoMd5bmH4HzEQmAJZAMXJ7Y/TV8Z2lSz+A1SDV06uc1biCyBl1yrM7y7/o/vvzTvpTUFHIcNyqtVpNC6n1TzgIAgsI/GtQtV51T2NLlpdcoyEGOl2MYLnftG+Yj+DlJTt1sCTu+VIjVYK1JqAv+yayN7hgBA4YFkBnF6Wk7jNzVVFixibacsJIMqEgPc7Nqtd16jfoLmzaf2uFdV6VqX1/Yytw==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 05/10] xen/arm: gic/irq: permit routing of eSPI interrupts to
 Xen and domains
Thread-Topic: [PATCH 05/10] xen/arm: gic/irq: permit routing of eSPI
 interrupts to Xen and domains
Thread-Index: AQHb/KtE4U8sM114rk+e2GRvEynFEA==
Date: Thu, 24 Jul 2025 14:57:26 +0000
Message-ID:
 <2217fb937ec2cd9e17206233d837118350de75cc.1753367178.git.leonid_komarianskyi@epam.com>
References: <cover.1753367178.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1753367178.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|AS8PR03MB8370:EE_
x-ms-office365-filtering-correlation-id: 6c499ce9-b237-419c-3edd-08ddcac267dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?X0MyRY0+JKkIqEA8WQFPG83O4mA248WH8X3lp2JPo8nnJdNj9yiXBXsbJ4?=
 =?iso-8859-1?Q?9X59IwpsERwmAUtHlp7YICW38aAhPDT6WgRjvUAScseOfillDw2ORTUjNc?=
 =?iso-8859-1?Q?o32EVdrC4HPvJ3T8bwiHc02HBwNyNeCVdE3Muyd08FKvXJ9isjWkHjei3X?=
 =?iso-8859-1?Q?4e8KZspdJ53IBCysJQ4eIVCrJimj/NjrwIjpTgt0PQvv96C1Libcl0YaRW?=
 =?iso-8859-1?Q?G3lv2PAvHbFq5U6lr/u4m8nL6k7Vq+hxlzT1L7EhuwC1qcMn2X/F6CJqcU?=
 =?iso-8859-1?Q?ANSM/bo9t/xJlUTMxBxGO2dFzwgynvD8URAd6IozKr9sfI+k6d7N3x1q7d?=
 =?iso-8859-1?Q?ijdokOQMaIk8vmKg1IXzvDl3Qs3Z5hBAryb2nG+mLaugxzsRjuDmT/cC2N?=
 =?iso-8859-1?Q?aEz8SwVNiQCNbpsJd5W7dUDst9vifjC24MM1wNI+YahjWTG9my1Bbu2/k/?=
 =?iso-8859-1?Q?HtMejD6XiYKTyuZD2klzBIs1Q5oKy9vN0XPsUBMqxPji997IrjbTvpO0NC?=
 =?iso-8859-1?Q?JB7QlUzWMcqH7EaU7Apk+kq69JYDgPHoxng+DmOsdJUxMR76W0eWbLA69D?=
 =?iso-8859-1?Q?roiAYcCH0JvOjho0oZiCbf+fk6O8S7r+uUl49g2WYTmHrB/2c85DxwOawI?=
 =?iso-8859-1?Q?Zn4hudb7YI1Vb+U3+UEYPLL8oKHg6lnXjNUb9sYv6E+toSPVSKqqa7Lu28?=
 =?iso-8859-1?Q?nxrnxwtcOjReS9ukTSoi5ekUtT1ysrNHerG2/sbwRuaZbH9Lrr6mm1uEm5?=
 =?iso-8859-1?Q?s5DqN7UCCy5KFasD/rhUErbJSVGSbHzinrJjGkx70xUVFg5R6bYQRu7+hh?=
 =?iso-8859-1?Q?9WVS7Oj1/1abNExn1a2MSCF5O1SyI9x3OLbNLTFrL5zkr4mkLYNXALWHbt?=
 =?iso-8859-1?Q?goetCnEmQKjRrx29I/OY8Jz+k+YQFg+iL04KSMjoDcyD6bLa144h9mD7cZ?=
 =?iso-8859-1?Q?WKKfcXAyZQ/9IIIm6GvLuLNy7DzFALcTCd/0RmK7TC0nqtk36OxvmI529O?=
 =?iso-8859-1?Q?G+gwjzbDKwsZdelICGVZC84NOH1k52yybyHoHUpTN2GkDLU2OG2t3QONgz?=
 =?iso-8859-1?Q?USDNAfEEAz99j3LiTNj9cajV85+RU4sC35A4NC9b+86mW3+qi1Is9v6aQs?=
 =?iso-8859-1?Q?5VQpsv3eyGE4lgTHtT3TIjcUbj6tzipb5aai5R8FUik2Mu4DK4GU/i56TB?=
 =?iso-8859-1?Q?eapjljevNtJowln59qiuFE5iMz64fR/9iyBy6htZs7nLGI2iOkUIATr/s+?=
 =?iso-8859-1?Q?oUPxDfnBCEc69dFSrawjB+hJ8Dd2nJ1O7n+jfBuHATD+NvvjsQ6AFM8Du0?=
 =?iso-8859-1?Q?M38d1JLO72Ra94STiD4JggrQ46mZTnCRAalGKz5yYAouBNHTrBl3XSALlZ?=
 =?iso-8859-1?Q?YsU1om7t2gXEqaTh5G0S9Eyh3ow3fJtxrEXT05xDxBS09DZyD12ZqHn3gs?=
 =?iso-8859-1?Q?A9FNXErzpxcjHWUiwamNdVpTu4R6VH2TEQyAQPX3nTZHiicFHqqrz0R4dt?=
 =?iso-8859-1?Q?5AFIrD3ONb7enGOxYWaOY3pkkSeKpP6CUM4FA30beCFQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?20lI5FWqfCA6b6Qq0Ki5WxnxOX/SFlExIXcbIWWN1SYmFWluXKj0Mdk/ns?=
 =?iso-8859-1?Q?MzVv/tuFCIuxeJ3zu9k0VBkd5uT02WLce+NUHxztxbEcskceDRN6JS0P5Z?=
 =?iso-8859-1?Q?kn6QKnHX/DBbMT/ihAs91wvkIElC8yAE/3S3PFqcpXP++Wka/tZs+IId2G?=
 =?iso-8859-1?Q?XAKpEpExVg9kXvZ1t5xSonZu80vcHkFE1fv89bnMnAJooqYT1YyVI6pgN/?=
 =?iso-8859-1?Q?bgO2BqHjW2vFkyuI7oThdOz8qkKDPylDT804OuJza1JGeMtoJWoLcfYxu1?=
 =?iso-8859-1?Q?7NW03PFucruQle5oyaFyNOsaRJfpMkP1ZNEcverKjy8HvY751Ij+Ae4a8Q?=
 =?iso-8859-1?Q?h4OXZ2rK+C0W4AZyUEK46z9FvZ4RsyvTeYpxp/saZrjaIcNJFK8qxm162z?=
 =?iso-8859-1?Q?NS6b0SA8vQgrO8GfwDBlGh3/vIXFWPpS9Ax19URP0AmDnpdmJh26gQ/lQZ?=
 =?iso-8859-1?Q?fIU749no/6neZdjBLi3mZsL74qEgCqFzc02MSvJeMyjd8GQeePz9Iuvzoo?=
 =?iso-8859-1?Q?kKROTNRedS2howgHID808xnXzP9aCf98KFpyxcqM0hsonE5NpwyzBz86fx?=
 =?iso-8859-1?Q?pXPc7maLa5P488mJRmYAnVIOGdG8r5UcaHPhjDsZXNusKUWpwZbQFW/Zby?=
 =?iso-8859-1?Q?CAI9q8zLA6sXpisUnPAQ2eM6QnMyq5iP3lQ4JHoRE8KBGDrn5MPmLwParJ?=
 =?iso-8859-1?Q?QA8jloukRejzWYiUJrp4APgQtY+Itb3nRvPhOd+FxIFtTIv9VSq/tBPSYH?=
 =?iso-8859-1?Q?URLiBSF9TqHjSbe9FGA7U+2MiFu24awyw0Ypf+xLt/oY3cUdHHgKMr/caR?=
 =?iso-8859-1?Q?OUdBpa5a2lecn2fQhzXDdrzb+1izb6OOqwnir76qUcbSjuVDy2n2h8ubNN?=
 =?iso-8859-1?Q?3UbDOdEOwYYBdVsG7+6XYCL/vt3j0iHuW1fM6gmAGgVrP5eWTUQ3a5hTz4?=
 =?iso-8859-1?Q?x3GyJ3oMIknM5ildzzHz31U4jPgeJPNt60dGm+arvOGjK3fOkt9J98l5oD?=
 =?iso-8859-1?Q?QYBgBPQje7DQQ5ENn0lx0j9ytkaHfQBott/epZPkjWLcG6dWrpHTaKBhyg?=
 =?iso-8859-1?Q?lHLwg7pq9QaKedu6T9h2QGat5+2YxyMryVzCr0g+4UUjkmbGpdLGbeRSoI?=
 =?iso-8859-1?Q?VcqIGRuXJqe2yjRsJ/ewGtiBmDILL/zHJhGb0ndRAMOTYXcsiBvqjMw38x?=
 =?iso-8859-1?Q?sOO6bHLFec+py+D6uyo1XcUDJCBBnUnMkLKT73TM6nSFqA7MjpJ3idqy+q?=
 =?iso-8859-1?Q?C7YESqKEAggKI+02C45j5zQ8aIgvTTKniLxFfXgnRMtT+LuokjdsHUFOmV?=
 =?iso-8859-1?Q?+/JC11Hv6k1gM9JV4IyjsBOCZVmZd0IRJTwzA7/Ov+4nZeiRM3shY13CqA?=
 =?iso-8859-1?Q?1Nrl9RianG+EC8xwT41zqEdHwjCiaqIHjsbZnWAejzGdZwI3Yrnf5UJ830?=
 =?iso-8859-1?Q?hjSnOtS817kVVIjVAuEE2q2KD6t7WMMAXFMYqHTqPfTKflr5XS626ggkRX?=
 =?iso-8859-1?Q?UyKJVWj91O2YueMP/ZmpNDP9aJDQZqqeT8/513u3qHTdBTK64txUiC3P/Y?=
 =?iso-8859-1?Q?HWBO9PWgeoppO5lYFAC+wk9CT2O35Taj+WXv7mXVhaS5DxLZ/osE10/nMO?=
 =?iso-8859-1?Q?0f7BmI5PQM5ySLy+haSSbNKDxeSUTMotL/cUgxIp1ReYOWizQGtUgRpIaB?=
 =?iso-8859-1?Q?+VI0nCr3BHuamDlQdws=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c499ce9-b237-419c-3edd-08ddcac267dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2025 14:57:26.2441
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R+1MljyaGDFD6vBXfrfABX4ZYhIGvbj3hx251KlZfYohQktQzaM+MxTeLeHYSNZn6zqqITufRMG+zjNuX2s3KOMaEDT3jIxA/+mDNLE/wts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8370

Current checks prevent routing of interrupts from the eSPI range to Xen
or guest domains. The addition of the is_espi condition allows verification
of whether a given index falls within the eSPI range, enabling routing of
such interrupts.

Existing behavior remains unchanged for configurations where eSPI support
is disabled, as in this case, is_espi always returns false.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
---
 xen/arch/arm/gic.c | 4 ++--
 xen/arch/arm/irq.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index e80fe0ca24..d5f2addf9f 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -111,7 +111,7 @@ static void gic_set_irq_priority(struct irq_desc *desc,=
 unsigned int priority)
 void gic_route_irq_to_xen(struct irq_desc *desc, unsigned int priority)
 {
     ASSERT(priority <=3D 0xff);     /* Only 8 bits of priority */
-    ASSERT(desc->irq < gic_number_lines());/* Can't route interrupts that =
don't exist */
+    ASSERT(desc->irq < gic_number_lines() || is_espi(desc->irq));/* Can't =
route interrupts that don't exist */
     ASSERT(test_bit(_IRQ_DISABLED, &desc->status));
     ASSERT(spin_is_locked(&desc->lock));
=20
@@ -134,7 +134,7 @@ int gic_route_irq_to_guest(struct domain *d, unsigned i=
nt virq,
     ASSERT(spin_is_locked(&desc->lock));
     /* Caller has already checked that the IRQ is an SPI */
     ASSERT(virq >=3D 32);
-    ASSERT(virq < vgic_num_irqs(d));
+    ASSERT(virq < vgic_num_irqs(d) || is_espi(virq));
     ASSERT(!is_lpi(virq));
=20
     ret =3D vgic_connect_hw_irq(d, NULL, virq, desc, true);
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 8c47eeb7c3..d4d40a4f2f 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -461,7 +461,7 @@ bool irq_type_set_by_domain(const struct domain *d)
=20
 /*
  * Route an IRQ to a specific guest.
- * For now only SPIs are assignable to the guest.
+ * For now only SPIs and eSPIs are assignable to the guest.
  */
 int route_irq_to_guest(struct domain *d, unsigned int virq,
                        unsigned int irq, const char * devname)
@@ -472,7 +472,7 @@ int route_irq_to_guest(struct domain *d, unsigned int v=
irq,
     unsigned long flags;
     int retval =3D 0;
=20
-    if ( virq >=3D vgic_num_irqs(d) )
+    if ( virq >=3D vgic_num_irqs(d) && !is_espi(virq))
     {
         printk(XENLOG_G_ERR
                "the vIRQ number %u is too high for domain %u (max =3D %u)\=
n",
--=20
2.34.1

