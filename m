Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD32B1D7F5
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 14:33:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072931.1435911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujzoV-0002yv-L4; Thu, 07 Aug 2025 12:33:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072931.1435911; Thu, 07 Aug 2025 12:33:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujzoV-0002xq-G5; Thu, 07 Aug 2025 12:33:43 +0000
Received: by outflank-mailman (input) for mailman id 1072931;
 Thu, 07 Aug 2025 12:33:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SGIa=2T=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1ujzoT-0001m4-T9
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 12:33:42 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf692a2c-738a-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 14:33:40 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by DU5PR03MB10563.eurprd03.prod.outlook.com (2603:10a6:10:51b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Thu, 7 Aug
 2025 12:33:32 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 12:33:32 +0000
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
X-Inumbo-ID: bf692a2c-738a-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BNKtysRbipV/Qaa/yQM+tyhCdUQm7wgiq/GEdL1sn6wSnMM2utuzNSXT49scDW2FpKhOjgm7V6W7Tc19dhSdDVTw09DLrXdnq81bSi1J16qG9cbZqxonRGLKoO+KJM4uDXPBwKiEDAjY14D+JFwupT3E5dtsDisdfxNOxOaQFhahEPxWhUHzQHvzz3GjRf0R/RQHvNrubtZGeA9QG5V1HdhgjeShWS6Gj07VVM8NeZlafMyQtaH88o2BfUBagcZY3dUp4TuQ5HOju0zOfw34/aJHBehFL5aR0bRRiKYYcJCKYdMoKeQw4mk3bZN8X2a64hIzsW72xwGq9lMszO72nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Kst0HyankTjBF7MgL7OyGBFGTNSbo/6GNJ3IGOGwTQ=;
 b=icbQvXwiQqfOJLtUyvR5e8yCR1k8uw88aPWFNdZZs9u4sixrKrkRM2umErUq4JVd4/pAKQ/jJYuYAu7nfOTAR/qKWGOniv2pFDPGjfK9iLllgL+hOEmHgeYkZ4KWt5zRkjwNwk+5rlxn4Tk36qDTSzElun12zHwx/AvS4diV/v4XMQDRDraulwZMcxUB/2iyRuxR10vtEV/1rIEySfnI6FXPk7jzPtozFBE6kPYpXTiXTBPTnLtcUOZ+GcQUgfiS0ZsyOG5PWxhugJUHPOqIuxEA5fTWRPymQJuubH8hs8hDd5bc5TeoyBTsoPQ4LyVBsPerlH1H8S+P64GLJDBXOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Kst0HyankTjBF7MgL7OyGBFGTNSbo/6GNJ3IGOGwTQ=;
 b=dj7doJP9wCPWOudAdOpI8p7BylS6UIf6CsQi3soFy8zaQXOwsZeXGWHypYbhq7h5jYygVh6h8EyKR4ZRDhGF57s/ZQSsYKegeAqSH81nA9UMkuDG13KuepxMkXZ7LJFUmk7hHNbkXZ25UR925HKaR/ZOs3XZ4WNpDfCdQKZLBgV18ds7bSKnIce7WXug1ICCnzVAo3NTpcSLPI392cQ/c0sZpnET5twjw0VzB6zRoHGQNNVfjHIonuhJYuu5CwgzEbRr8DgANnltH8yYZzA6ojNOaYFKH+ZYetmBQWBjubPlGKuvAKML4QjgQnUpuWPzZaqHckoVRfMUenCF2Y+Kcw==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 05/10] xen/arm: gicv3: implement handling of GICv3.1 eSPI
Thread-Topic: [PATCH v2 05/10] xen/arm: gicv3: implement handling of GICv3.1
 eSPI
Thread-Index: AQHcB5d8tjpgMfEXfkClUacVz54EpQ==
Date: Thu, 7 Aug 2025 12:33:31 +0000
Message-ID:
 <2491bee7441f13a3c1a01fd77ece1749e7276352.1754568795.git.leonid_komarianskyi@epam.com>
References:
 <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
In-Reply-To:
 <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|DU5PR03MB10563:EE_
x-ms-office365-filtering-correlation-id: 3246f53f-888d-498e-ae8b-08ddd5ae9f15
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?c4t+V3gH+cTynBEJQA+87Aitixn51++pNP8c5w0l643MBIM4ZTCLw6q0O5?=
 =?iso-8859-1?Q?AuiZXtWsehxt1inikR84I3d0K8ofZDKWesqmuKpIubtw3dfMzyoHLeAXUW?=
 =?iso-8859-1?Q?/wFXWLcBhhrt186ehFvs7EXpNq/fEhsl+ZxQRLdVNiAxP8LTHFfoucykxT?=
 =?iso-8859-1?Q?LCFB/ZH8EtXL9PZYBXYJkrgIQxcc/h9Z8o5mKiHDhyH3kHCge6jbW5fpau?=
 =?iso-8859-1?Q?YWjo8kt9eiTSY9bzjrzasRxy9uL0E2kyGqn59fi5pt7nZb1oPsq2C2mTmb?=
 =?iso-8859-1?Q?3hh+JbU/uyjSoAKKLcBnkUio+F09F1tm2kyQ7u3w7vUlxjygLTKLm3Mq+N?=
 =?iso-8859-1?Q?OeUK1158xdMlhn3cvOvJGVEeLOb3qdHf0gLgeVF0YV7YEFSKXrW0N2SxqP?=
 =?iso-8859-1?Q?VHc9xEd420yKL9+gfP26SNRKtAOBwtVj/rpZXddzzfzkC6DPC0f39skJLw?=
 =?iso-8859-1?Q?dkRCy5vthRy+//4BMvk5LF41bHOnvCjGbUdh5uDB9ND9aQTys9wzAXpCcO?=
 =?iso-8859-1?Q?mYZvEd8nYoWmlvL9jztm9cRO78d9EoiB19Ri1U/TOIe8soYSA26HjeoaCE?=
 =?iso-8859-1?Q?YjqrylyhfCvooO/AZtVf2zBRvEPdILTvHvGrzzmv6RaBdJN6tCjXazanbN?=
 =?iso-8859-1?Q?/p3PS2rrhdffuDOVvV+9zWz1e/1NRMh50XFN5sRFcbW1cmi5VWGHd8a1kd?=
 =?iso-8859-1?Q?9becohVSiK6H/i/6ToZhU94E75hB0bjep9MIujhjy7EqoofNGjPPseqWpW?=
 =?iso-8859-1?Q?RHamjgs2dlP2dCnoxiIaEN5vfH6EB3d7Tfamo9WR4Un4Vb/sfIZ13ATicP?=
 =?iso-8859-1?Q?9Mq0tUlyt/I9nH2HjcCxZep+eR30qgXOTKSgb6QLC+iZy6Yy93qJspHMpw?=
 =?iso-8859-1?Q?PmtwpW6JQcx79VBSnGHAhOsKAbkBdEgOznGR6mMf6UYhqFn+GCCamr74dE?=
 =?iso-8859-1?Q?zvlySHd/oyLXdWnoqcXuP5giTbEA2dsi2JJnp3ep09GLrKBHVPp/d35sjx?=
 =?iso-8859-1?Q?UldxktRe3OdWB8Yrpf+RYFbyS0EQWsMngwJmgIr5aKhYNXfoYwveoUvcqX?=
 =?iso-8859-1?Q?TPvx9UNAdGXGK9xm1xoLybyS9z7PU75JEGWdnGq+xDwVpwapfESdZ1rLlW?=
 =?iso-8859-1?Q?Rp1l+cvdoIU0hQ9ajROlsMznvTRFnV4yF1qNfcS1Myjdt895eFt/guVj3N?=
 =?iso-8859-1?Q?7cf94JIOTJkuPVGl0O6aiL0BnzxPJC03G9UxdxqfQNsZbMrgE4YJJjfH7M?=
 =?iso-8859-1?Q?k7W+AvVaX5iqBMLKx1x4md6J630vSDC0nQc2kpxviUmF0GuyEDxtkTXOrV?=
 =?iso-8859-1?Q?sTA+VIS+HQZyDtll9lefB1dIBwvqh3hxbEg/aOJmYyvsNlBy03zk8XYDiD?=
 =?iso-8859-1?Q?HXcdi1EoDrSW+3VuuT9uNcAJ1Xw5uPZe8EaioqbF/K7MHvJW4rfiwiJDSb?=
 =?iso-8859-1?Q?jcNq02sK5ax3jMKQOGuIY7BmQ1QwHxZjkBrllPyRnhXXIjCwiRliPxA1jt?=
 =?iso-8859-1?Q?YzZl6oCCbA/+N37Z7jPdUdaF2RkJUe2ZeCh8eGkPFkkw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?CjamkyDkc8ZZxjxT6K/NCpsLO0SS+Q/wI1PYHuU7xcwZ4KXrFG5TEqqNMq?=
 =?iso-8859-1?Q?5YsedxGF6a0VVi2b7R5LYvjnqJo5Mwrv3E/CJsTXJNYBcFZlPBmPa9JJne?=
 =?iso-8859-1?Q?76J/AO2ysuUqxF/LtrmTaooF0ljYRx5W8gu+v6JLIZiIrUBD0RLGVnyhFy?=
 =?iso-8859-1?Q?ClSCr0HWk6I1iMQzb/hBCL9cV6wU9954MwHyZxf9WFgtRpnCx4ZCKIv4fg?=
 =?iso-8859-1?Q?VBZp8NJxFR8xMdQbp/LwGdRz+EgpTZXTuHAdzrPMmTr3gK80zg9FT5wUFm?=
 =?iso-8859-1?Q?PC5vZcBDU59Lw//+Q5YMLFvA+BjgErJAkXY29TgJenR4Ar3avI/C3eERwQ?=
 =?iso-8859-1?Q?ph1ruVorAWh/gTST0fq4K0vMsH6VUItuUqef+ym4qcoyOfWH4KIQskIwA8?=
 =?iso-8859-1?Q?uvYDGwyUjK3g/23LRvfzvri3vUb+aYFb024vNS0NZ+fuALDEdNAhVYqy7l?=
 =?iso-8859-1?Q?1Q0ghsi8DtGhuLV0IlrRN7Yr3Aei4UL7YJX4HNTzFYGhEEyG67cNV3w8YV?=
 =?iso-8859-1?Q?9LKT4LF5wzuCt7C341EKSi0nS8VezydMNx/VHNfgUVo1twuxQfJrbJ9zVb?=
 =?iso-8859-1?Q?nmJtYh9kjIg1Us5b27lbH1O20ps4qZ7aHTC8a9NGt/klOfeA7oGnJVCdwa?=
 =?iso-8859-1?Q?YQ5trie5i2YnTYC7MSsexolCd8rsqZYyV1m10zh1RoYjUQTNq9C3cKV/aG?=
 =?iso-8859-1?Q?nfLDLa5/NdzO6hrH2swTO+4bNmljMGRi57QGOENFRm62GlJaaAJeh4nGrK?=
 =?iso-8859-1?Q?IgllrNXow+fcEcF72SvlhYLWw8xpqwFQptgOq4wPRB0nDA4CZjoZoJlSk9?=
 =?iso-8859-1?Q?wSAQ2UtEPa42tqI27c4k9ssNCVi8i/D7s6/S92X9xsIkPi88P4cVbXzYOP?=
 =?iso-8859-1?Q?OiFsKyUbSe/8FoSTQMATPQibU5VblvMcAEARjZuwVSQDG3yEwD4iVzsrDY?=
 =?iso-8859-1?Q?EQQyYF0bh2QEZP3EIIypm5pjl8iFLN+XHLgT5i0pac5UmK4q8kR0e0pKaG?=
 =?iso-8859-1?Q?GDOw7bDVOn8CFq4JOqPqkJy0ev5XvmlYMXV1F5oVlc/rn4xURwCkB0PlSM?=
 =?iso-8859-1?Q?HOA7//Abh4rgiQvBdZTVQWOy3qoa89EFy6ys/2qqjdToSeQxHGcvacVxxQ?=
 =?iso-8859-1?Q?Yn33LaHxce+bgPAazq42/2QQ7IQ6fUWBFWW8gyynp/KGg+AZIeljTdKEPU?=
 =?iso-8859-1?Q?9sBR6xgCMqdrr9bccz/3hH2K6StKh37TOKabkYZTi5DO3kX5xWZg1Xxri+?=
 =?iso-8859-1?Q?MrhIFlNbhEvxAbIDRLhhaibILu+upRlpz0ry1DnvJlQViT/ow0UIFUsOUF?=
 =?iso-8859-1?Q?3gIlmVpQKmqb9TCBtt021IDxaN65lcrqd7Jy/DLGQI4/2uS8eBIMNGEPlG?=
 =?iso-8859-1?Q?toZass7OhNGccmcsG71pd0JFoY1e0mPZHxLQZGYJdSp0g5RGZMPoHeSAHS?=
 =?iso-8859-1?Q?UHw8Vdl2UGfyNwfhv0ZRsH0vZkCHkpv6Zz1rQ15zuEn/nazL17pj+EVrPi?=
 =?iso-8859-1?Q?3ZO0kF9kXD+l+jdXskwLQA5pYxvA1RCBRvKiwYBAih4/mT5Rg0aGTYpQKZ?=
 =?iso-8859-1?Q?1BDp6eN2IUs0/ZQjb8+aVVYJ6SXGzXsK9tyEEFC+xNItd2I374iYVfqGvU?=
 =?iso-8859-1?Q?/5m+pZk6FA1bm8a/pSuNkqqwrskFdG6oVXW2p1ZC24K2AsfSSCzHITA2sN?=
 =?iso-8859-1?Q?al3Msi2OlWsukv1nXJ4=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3246f53f-888d-498e-ae8b-08ddd5ae9f15
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2025 12:33:31.6838
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PT3pEVwh66/j8LhrC5hwqJ8VUaXoqD03bjQpnkBDcRQdnke3XqzbkhfQg/O7O5HNtC1hvTpiT9pH+GdLwDSM/xJic9NbJpB0S9nsfbzo28w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR03MB10563

Introduced appropriate register definitions, helper macros,
and initialization of required GICv3.1 distributor registers
to support eSPI. This type of interrupt is handled in the
same way as regular SPI interrupts, with the following
differences:

1) eSPIs can have up to 1024 interrupts, starting from the
beginning of the range, whereas regular SPIs use INTIDs from
32 to 1019, totaling 988 interrupts;
2) eSPIs start at INTID 4096, necessitating additional interrupt
index conversion during register operations.

In case if appropriate config is disabled, or GIC HW doesn't
support eSPI, the existing functionality will remain the same.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>

---
Changes in V2:
- move gic_number_espis function from
  [PATCH 08/10] xen/arm: vgic: add resource management for extended SPIs
  to use it in the newly introduced gic_is_valid_espi
- add gic_is_valid_espi which checks if IRQ number is in supported
  by HW eSPI range
- update gic_is_valid_irq conditions to allow operations with eSPIs
---
 xen/arch/arm/gic-v3.c                  | 73 ++++++++++++++++++++++++++
 xen/arch/arm/include/asm/gic.h         | 17 ++++++
 xen/arch/arm/include/asm/gic_v3_defs.h | 33 ++++++++++++
 3 files changed, 123 insertions(+)

diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 8fd78aba44..a0e8ee1a1e 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -485,6 +485,36 @@ static void __iomem *get_addr_by_offset(struct irq_des=
c *irqd, u32 offset)
         default:
             break;
         }
+#ifdef CONFIG_GICV3_ESPI
+    case ESPI_BASE_INTID ... ESPI_MAX_INTID:
+    {
+        u32 irq_index =3D ESPI_INTID2IDX(irqd->irq);
+
+        switch ( offset )
+        {
+        case GICD_ISENABLER:
+            return (GICD + GICD_ISENABLERnE + (irq_index / 32) * 4);
+        case GICD_ICENABLER:
+            return (GICD + GICD_ICENABLERnE + (irq_index / 32) * 4);
+        case GICD_ISPENDR:
+            return (GICD + GICD_ISPENDRnE + (irq_index / 32) * 4);
+        case GICD_ICPENDR:
+            return (GICD + GICD_ICPENDRnE + (irq_index / 32) * 4);
+        case GICD_ISACTIVER:
+            return (GICD + GICD_ISACTIVERnE + (irq_index / 32) * 4);
+        case GICD_ICACTIVER:
+            return (GICD + GICD_ICACTIVERnE + (irq_index / 32) * 4);
+        case GICD_ICFGR:
+            return (GICD + GICD_ICFGRnE + (irq_index / 16) * 4);
+        case GICD_IROUTER:
+            return (GICD + GICD_IROUTERnE + irq_index * 8);
+        case GICD_IPRIORITYR:
+            return (GICD + GICD_IPRIORITYRnE + irq_index);
+        default:
+            break;
+        }
+    }
+#endif
     default:
         break;
     }
@@ -645,6 +675,40 @@ static void gicv3_set_irq_priority(struct irq_desc *de=
sc,
     spin_unlock(&gicv3.lock);
 }
=20
+#ifdef CONFIG_GICV3_ESPI
+unsigned int gic_number_espis(void)
+{
+    return gic_hw_ops->info->nr_espi;
+}
+
+static void gicv3_dist_espi_common_init(uint32_t type)
+{
+    unsigned int espi_nr;
+    int i;
+
+    espi_nr =3D min(1024U, GICD_TYPER_ESPIS_NUM(type));
+    gicv3_info.nr_espi =3D espi_nr;
+    /* The GIC HW doesn't support eSPI, so we can leave from here */
+    if ( gicv3_info.nr_espi =3D=3D 0 )
+        return;
+
+    for ( i =3D 0; i < espi_nr; i +=3D 16 )
+        writel_relaxed(0, GICD + GICD_ICFGRnE + (i / 16) * 4);
+
+    for ( i =3D 0; i < espi_nr; i +=3D 4 )
+        writel_relaxed(GIC_PRI_IRQ_ALL, GICD + GICD_IPRIORITYRnE + (i / 4)=
 * 4);
+
+    for ( i =3D 0; i < espi_nr; i +=3D 32 )
+    {
+        writel_relaxed(0xffffffffU, GICD + GICD_ICENABLERnE + (i / 32) * 4=
);
+        writel_relaxed(0xffffffffU, GICD + GICD_ICACTIVERnE + (i / 32) * 4=
);
+    }
+
+    for ( i =3D 0; i < espi_nr; i +=3D 32 )
+        writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPRnE + (i / 32) * =
4);
+}
+#endif
+
 static void __init gicv3_dist_init(void)
 {
     uint32_t type;
@@ -690,6 +754,10 @@ static void __init gicv3_dist_init(void)
     for ( i =3D NR_GIC_LOCAL_IRQS; i < nr_lines; i +=3D 32 )
         writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPR + (i / 32) * 4)=
;
=20
+#ifdef CONFIG_GICV3_ESPI
+    gicv3_dist_espi_common_init(type);
+#endif
+
     gicv3_dist_wait_for_rwp();
=20
     /* Turn on the distributor */
@@ -703,6 +771,11 @@ static void __init gicv3_dist_init(void)
=20
     for ( i =3D NR_GIC_LOCAL_IRQS; i < nr_lines; i++ )
         writeq_relaxed_non_atomic(affinity, GICD + GICD_IROUTER + i * 8);
+
+#ifdef CONFIG_GICV3_ESPI
+    for ( i =3D 0; i < gicv3_info.nr_espi; i++ )
+        writeq_relaxed_non_atomic(affinity, GICD + GICD_IROUTERnE + i * 8)=
;
+#endif
 }
=20
 static int gicv3_enable_redist(void)
diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.=
h
index ac0b7b783e..2f570abf70 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -306,8 +306,21 @@ extern void gic_dump_vgic_info(struct vcpu *v);
=20
 /* Number of interrupt lines */
 extern unsigned int gic_number_lines(void);
+#ifdef CONFIG_GICV3_ESPI
+extern unsigned int gic_number_espis(void);
+
+static inline bool gic_is_valid_espi(unsigned int irq)
+{
+    return (irq >=3D ESPI_BASE_INTID && irq < ESPI_IDX2INTID(gic_number_es=
pis()));
+}
+#endif
+
 static inline bool gic_is_valid_irq(unsigned int irq)
 {
+#ifdef CONFIG_GICV3_ESPI
+    if ( gic_is_valid_espi(irq) )
+        return true;
+#endif
     return irq < gic_number_lines();
 }
=20
@@ -325,6 +338,10 @@ struct gic_info {
     enum gic_version hw_version;
     /* Number of GIC lines supported */
     unsigned int nr_lines;
+#ifdef CONFIG_GICV3_ESPI
+    /* Number of GIC eSPI supported */
+    unsigned int nr_espi;
+#endif
     /* Number of LR registers */
     uint8_t nr_lrs;
     /* Maintenance irq number */
diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/=
asm/gic_v3_defs.h
index 2af093e774..7f769b38e3 100644
--- a/xen/arch/arm/include/asm/gic_v3_defs.h
+++ b/xen/arch/arm/include/asm/gic_v3_defs.h
@@ -37,6 +37,39 @@
 #define GICD_IROUTER1019             (0x7FD8)
 #define GICD_PIDR2                   (0xFFE8)
=20
+#ifdef CONFIG_GICV3_ESPI
+/* Additional registers for GICv3.1 */
+#define GICD_IGROUPRnE               (0x1000)
+#define GICD_IGROUPRnEN              (0x107C)
+#define GICD_ISENABLERnE             (0x1200)
+#define GICD_ISENABLERnEN            (0x127C)
+#define GICD_ICENABLERnE             (0x1400)
+#define GICD_ICENABLERnEN            (0x147C)
+#define GICD_ISPENDRnE               (0x1600)
+#define GICD_ISPENDRnEN              (0x167C)
+#define GICD_ICPENDRnE               (0x1800)
+#define GICD_ICPENDRnEN              (0x187C)
+#define GICD_ISACTIVERnE             (0x1A00)
+#define GICD_ISACTIVERnEN            (0x1A7C)
+#define GICD_ICACTIVERnE             (0x1C00)
+#define GICD_ICACTIVERnEN            (0x1C7C)
+#define GICD_IPRIORITYRnE            (0x2000)
+#define GICD_IPRIORITYRnEN           (0x23FC)
+#define GICD_ICFGRnE                 (0x3000)
+#define GICD_ICFGRnEN                (0x30FC)
+#define GICD_IROUTERnE               (0x8000)
+#define GICD_IROUTERnEN              (0x9FFC)
+
+#define GICD_TYPER_ESPI_SHIFT        8
+#define GICD_TYPER_ESPI_RANGE_SHIFT  27
+#define GICD_TYPER_ESPI_RANGE_MASK   (0x1F)
+#define GICD_TYPER_ESPI              (1U << GICD_TYPER_ESPI_SHIFT)
+#define GICD_TYPER_ESPI_RANGE(typer) ((((typer) & GICD_TYPER_ESPI_RANGE_MA=
SK) + 1) * 32)
+#define GICD_TYPER_ESPIS_NUM(typer)    \
+        (((typer) & GICD_TYPER_ESPI) ? \
+        GICD_TYPER_ESPI_RANGE((typer) >> GICD_TYPER_ESPI_RANGE_SHIFT) : 0)
+#endif
+
 /* Common between GICD_PIDR2 and GICR_PIDR2 */
 #define GIC_PIDR2_ARCH_MASK         (0xf0)
 #define GIC_PIDR2_ARCH_GICv3        (0x30)
--=20
2.34.1

