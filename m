Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FCEB3675B
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 16:05:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094534.1449851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uquJ1-0007jZ-S8; Tue, 26 Aug 2025 14:05:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094534.1449851; Tue, 26 Aug 2025 14:05:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uquJ1-0007dT-Kt; Tue, 26 Aug 2025 14:05:47 +0000
Received: by outflank-mailman (input) for mailman id 1094534;
 Tue, 26 Aug 2025 14:05:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kqrf=3G=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uquIz-00072q-Ta
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 14:05:46 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c261d229-8285-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 16:05:45 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by PAXPR03MB7887.eurprd03.prod.outlook.com (2603:10a6:102:216::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Tue, 26 Aug
 2025 14:05:38 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9052.014; Tue, 26 Aug 2025
 14:05:38 +0000
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
X-Inumbo-ID: c261d229-8285-11f0-a32c-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rgAD36Ae+9HEE5a92Xjzoli3kH0rhDNur41HE4G0dI6JRX/exbMReHHOL0z2KI5dkZNclj4fTn81zicCu4lPOoX059OeyTfxFp2bNvgSbgLyXtih3JjDflLOPHPf3r4yZpEQXrk78C+6sk7ZQ6UhgVyv3rZUNq34nNhgis1/lZCzoM6MRTciYi8iQ2XV5jwIVU3uJjVa1wa3cwJAxvdSB+6kSKzk4T4SpIXPSZLgC5l1eVJXyIlGo6w2LN7eLtas40RjjhymHf/H2f2knaexjcqoMFWZx9iRceZivQV95gcXIwScMDtgbZTpPhu+sKOI6wUBJ67OVBBgupnPOwoOyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FMk51RIA6ygHaObn4VSaWkqpg16Vq01EcqFdjO2oeIE=;
 b=Xs6XNqJxUD2ieDVRugAJWBtFM4/+I81WUGAIAW7OGtwuM9zIbgjMxOlAfKH5s3Jegh86Dc5WiBbgP0kXS5ODycm5rKU5ndWhaO6shHzdWufePzQlbukVBWtHLQoTOqFQOQjw0KzzkT8pbtWFeb9gR92fbKrptNCmsjJy1vx3Aks4ab+WVC1lbE1A687JNtuGTXTkGx0Z2SsjvCWlRQoRuUoyknPvm9q/67CeYrnXbkvZ2XuUoV7vcRlEUafQuLXSI6xkpHxkKmG0lWH2AlOkcZBFFizw+uo65h4cUM++Skb+jvJTuDl2Yux35E4/k2/Em0lmycQMRiNb+VQgdmoOIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMk51RIA6ygHaObn4VSaWkqpg16Vq01EcqFdjO2oeIE=;
 b=tf7jQKyJDx6dMHzfDoelcertxWDOhRNuDai+IgZsspiizBfXqTRHk4KL1lr6HlvMK919BngB84qItnLat5J59MvhKG/w4Gg8Q2BQyyuhbHrTvlp82C+G7aNqM0t2YyJMzi92oZtzGlNTTJu6MOQnGwI6dyT1DNwR56EWfpODP8zpcl8AHljCiep5kq9QYXmaTM9hAcq4boq/aj9LCr9jojtJ+BmdvKPUFbfjWtLDgoiBqU1W/mGADePigo+rtXrnqiNcsnUNJ4aLK+ew0Xsv+ACz1rsf7fONwS490HzTFRhBSi2tqAI0XPaYX/ZyXiBrTfDQ84qagP6PXvA0YeHSLg==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 05/11] xen/arm: gicv3: implement handling of GICv3.1 eSPI
Thread-Topic: [PATCH v3 05/11] xen/arm: gicv3: implement handling of GICv3.1
 eSPI
Thread-Index: AQHcFpJ/0RYrIev2JkmWYheOK3kVZw==
Date: Tue, 26 Aug 2025 14:05:37 +0000
Message-ID:
 <398ad09617f4f97d57d13fa9f3771bd2db83916b.1756216943.git.leonid_komarianskyi@epam.com>
References: <cover.1756216942.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1756216942.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|PAXPR03MB7887:EE_
x-ms-office365-filtering-correlation-id: 4eef1d79-47d3-48fb-fc14-08dde4a9a2a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?AXK8ro1ZExEGMAUha6UbrGOifEhOjEYgVNhD/88VN+HzjBZou9sXrNHdQO?=
 =?iso-8859-1?Q?My/rFrqOvXqZVtYQbaEbmPkxpNL0xdL8WhFx4Y3zeN8ZZoopIrbZcXzYKn?=
 =?iso-8859-1?Q?A4Am1g647OX1EjumMx4Lbq6SaVKrrMg1RJkjSYCOoNDCp9G0VkQNeTso1p?=
 =?iso-8859-1?Q?al8MlzOMQ4Okp84oAgrB3F2TjDh3M/PdFeh54TaF18N/O8zKUIXwGrul1h?=
 =?iso-8859-1?Q?5tdT2qMSoUH+GtbqwYEx9Kk3TKWaRH/okcCdxgfxR4itdiHilDQXFVpEZx?=
 =?iso-8859-1?Q?3uRAgtdJx3OuS+Bfb8jH5+Tyu+ODJxXtDPUpjjO4bR68DRx0fU36/ReMO2?=
 =?iso-8859-1?Q?bt5etF3cmgGZ6yClHlI9LY1AnkMAywMmmKBiGPvHgjWTCIgiTTSudEniLL?=
 =?iso-8859-1?Q?E5toqs0l/SgvJfPxIx0NwgF/kA/2sDo0WlBwq2TDTSvaNonVdtmDsmFSMT?=
 =?iso-8859-1?Q?4sNup0hd2mscA/YQEeNTj5Y1C9lVhQp2C7c9vLu1JvhOltqNdT+YkeLUrw?=
 =?iso-8859-1?Q?2YRrM7GgE23VKzrCxWnff4cCNJup6/egNGEQ/zDkqPmz9Gmesz05mwaesA?=
 =?iso-8859-1?Q?8qGAksVnFY1wArmpo8UrO+dwC4s07sfBBD5Qa1D/y5SvfDm5lPQw5nJ7+V?=
 =?iso-8859-1?Q?nyf5i6Q5rfv2cIfrhPDPFuMTxDaFzNcFbZL4Hjla/XPDrNto1TAvbu1y+G?=
 =?iso-8859-1?Q?JPPp1vT3IjvL3DFvKvF9vU0T+L6l7ZVDcrrMyLYAycbzMRJQFy+V1NHONA?=
 =?iso-8859-1?Q?75VPsNXOuhvoqNaeCdeyCkUEVpNYp2koqlXZRekuwVwEbocs/6xu6Z4nHG?=
 =?iso-8859-1?Q?tWqxYJbvIVqn3WKKLIouPKufjqNGncfKm7XcxF9F7CCHKkalkTy1yM1jjr?=
 =?iso-8859-1?Q?HauFalZNAC/oU1yktdt7RGi5llA+OhqQA92hTLyF8X3wpIXoww1y62PKzy?=
 =?iso-8859-1?Q?o/9FS25m1xI3br7+qV3/TE8oYHF4mo7SWZz6hdXAEx3O/9yfK8dm61cm0d?=
 =?iso-8859-1?Q?eQuv4oi5DNwzvjiDL+AwSifiSSS7BNLChHjRo9KQuVFAiwmItu6mDUsgvH?=
 =?iso-8859-1?Q?rU1rQ06pu/XbcF7D9O6ruGpSde2d9muh5/+s5Z47ByPmSW4rOzdr5qRfCM?=
 =?iso-8859-1?Q?Z8/2ALwpmjTM5A7iKurUEYyIF6k0fjLzLhkl/LVr55bhXPYQia6YeF9yhH?=
 =?iso-8859-1?Q?8pIhdRqJItDQ2Bj5vUG43h9Crwq93WC6d5F2GNQClWCwb/jM5ZZuLFzHnO?=
 =?iso-8859-1?Q?BCV+KKcfvmuMjp/m3UK8He1kERbuaYN7YG5hjBJeKDWfuZ2AsjRm1b7StQ?=
 =?iso-8859-1?Q?PIv6mopxHoD/RB2Lu4ZX8mBE917WbqHJgBZNZkUGxYAv0F7wLmuEgZCWjM?=
 =?iso-8859-1?Q?Eh2n4Q/x2A03j9OturgeUUo5lmk1wjlQaIk4y3BumkvLW5hbP6hBdkq/kz?=
 =?iso-8859-1?Q?dBpQ9sN4EnGClDn3Js12z9hlb7PS3EHqUKMdHpCZq0Y0niF+UGnwBSnGzJ?=
 =?iso-8859-1?Q?g1cLKMAbooBBO3PD3ARv714PQsIiV65vN8pw9CQ3Jt+Q=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ilZfKI5p0vSi7uXGx2QWccBAAjrMeVb8ETaxtNH0yIPO8BdO20dkhLuirU?=
 =?iso-8859-1?Q?KEl5QrG3ZBNrFcjs7Gvn/bRAccpB0US5YoalLtZHTCnEyVm9zQSTX+SwvO?=
 =?iso-8859-1?Q?96EYW6gJobOt8fzB/xyKD2W9e2wJRUzGrRs4Qrs4bMeJLO7Ck9PQxV7vaP?=
 =?iso-8859-1?Q?0Erxd9FXd3WmfWe051YtNuDZtLwJAl7FHi23eZeRxeCqCV81OpLOBCJAA8?=
 =?iso-8859-1?Q?Wtzrh4X1KXvFHGNWJhW4Kr8AOdF617WPQSRNgOPVR+xbhRY1RQ7fKL2ugW?=
 =?iso-8859-1?Q?7QrUfAWuuTdR0y1Lg00al9cbS/esdLh+GnB/7OE1y8+lyRca0lChGWICIr?=
 =?iso-8859-1?Q?T0oq6Ei1bWsbc8D7fh+0Os7iDbOyB1uGqXn9mXD+tqEi8XIEMEvfHamI2c?=
 =?iso-8859-1?Q?0qELO4UTCg17qSsK8dsNAM9mv5wh3R+SHbqRVT+gzOyc90PafKMURtAD4H?=
 =?iso-8859-1?Q?4ts2do/UkV31Qh26AWAICQ7FGw1PjjBit69mue+3pKJ9a6xB2sgbFwyUYF?=
 =?iso-8859-1?Q?sKMVNIsTKlUqM02skIAKQDz1PKiPfgJXMYO3qai/NgawCTGswkEBedwiUN?=
 =?iso-8859-1?Q?a9uafJFM5cJKsnhOC2EHOO6hx2/J+JoU0oVYug5z8SmRLQNN3CY0hMrcRp?=
 =?iso-8859-1?Q?VQmASal8k3riR/2wALMK/7C1OJUTquYO45ZaMiDRDloKhXaU8sjFSqbHHA?=
 =?iso-8859-1?Q?fw3mwFlL8SoLF0p3LotibDkVNt+q6s7mRmVBIzyc9vrhMLqQ0w7gJh8GhU?=
 =?iso-8859-1?Q?dRVwtbVhiEoR3BNM8Aowru1UAbS979+WY750WuOm/UU6qjHrrqoFMd+tts?=
 =?iso-8859-1?Q?/VPGY7bfa7ZAkd+xqppoU0z/8OHOyoEPK4YmW6LLRqqIuTSqoX8vJjpecB?=
 =?iso-8859-1?Q?lYT+Rcg5Q32LxgLG6lKF/a0NRSVIPBCFTOPYCr/e7zhWfuJHzK7fFbp9vo?=
 =?iso-8859-1?Q?4ptNUscosduaWs+t8RNSjeO/L/1FNswAV8LVu1uk7kicUYlBdgpzE9t3Lm?=
 =?iso-8859-1?Q?UwRgvghixqF+amhGsMoyxbiWnDcj7wNYh5L1JIEFzQkQWKlkNak/7Otay5?=
 =?iso-8859-1?Q?teai3v+ZFWXlZvPrroW6h6UtVtOAM2QP/fQomCr4tj3IgRsqvDK5ia7elj?=
 =?iso-8859-1?Q?zgbwAlVoi4hxojREtJaPDr21HUukYEG/GMPIrOSgsS+pyPaCvWXjLQX3H4?=
 =?iso-8859-1?Q?7qSBWjmWFC51sshbf9K1VrWmuHGdR91kbNXLQizNlMIkL4yHQGhmkS+XT9?=
 =?iso-8859-1?Q?WPGDYAlY7yNzCk2s0eapSulCXfnzLpvfULS/ld67ZJkfhRhMXEdY2tGerC?=
 =?iso-8859-1?Q?L2CwdTNFqCf9vEN14yUwDW1qSqZAENfuG9fLKxh51sPrSdha+JTv2LEx82?=
 =?iso-8859-1?Q?028tBZWZL67rgw1qVmhqjWKpP4YEExeHKHmIOqqAwZ/nIWdgmVf266A0at?=
 =?iso-8859-1?Q?51aGHxKLxS0BVflquJpOEsaeRxo71Zqv2J/Jhjrhql1KeiAPgxGvz8owdC?=
 =?iso-8859-1?Q?tq5OBO39xitWKv9frAnA6XzNRfM0pDEbNFpfSs4AzqSr2qLxTmw3itR9Rj?=
 =?iso-8859-1?Q?xX7AkpSHPX49tXserZJKY27pBaXvIqt/JzRlS/gYNhdwBLi6Jt7OJgNkyA?=
 =?iso-8859-1?Q?J1DViWoR9GbRWJr2/LDdVJj4zgDbsY2QLIB67q3qBffxs9sRRtM1OD85M2?=
 =?iso-8859-1?Q?YmKMmImflsmL//O8dbk=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eef1d79-47d3-48fb-fc14-08dde4a9a2a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 14:05:37.7133
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G1b5x+5QoMsXzVJQgyOqZQypVg6sYNlwLplpI9K38UynoI2g0OK4xRPoyA7xMQM0tsgILXSe3Yy53AFE0QFz4yASYWa16mhGFITmQGFWalI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7887

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

Changes in V3:
- add __init attribute to gicv3_dist_espi_common_init
- change open-codded eSPI register initialization to the appropriate
  gen-mask macro
- fixed formatting for lines with more than 80 symbols
- introduced gicv3_dist_espi_init_aff to be able to use stubs in case of
  CONFIG_GICV3_ESPI disabled
- renamed parameter in the GICD_TYPER_ESPI_RANGE macro to espi_range
  (name was taken from GIC specification) to avoid confusion
- changed type for i variable to unsigned int since it cannot be
  negative
---
 xen/arch/arm/gic-v3.c                  | 80 ++++++++++++++++++++++++++
 xen/arch/arm/include/asm/gic.h         | 21 +++++++
 xen/arch/arm/include/asm/gic_v3_defs.h | 34 +++++++++++
 3 files changed, 135 insertions(+)

diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index a959fefebe..3aa5cc1765 100644
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
@@ -655,6 +685,52 @@ static void gicv3_set_irq_priority(struct irq_desc *de=
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
+static void __init gicv3_dist_espi_common_init(uint32_t type)
+{
+    unsigned int espi_nr, i;
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
+        writel_relaxed(GIC_PRI_IRQ_ALL,
+                       GICD + GICD_IPRIORITYRnE + (i / 4) * 4);
+
+    for ( i =3D 0; i < espi_nr; i +=3D 32 )
+    {
+        writel_relaxed(GENMASK(31, 0), GICD + GICD_ICENABLERnE + (i / 32) =
* 4);
+        writel_relaxed(GENMASK(31, 0), GICD + GICD_ICACTIVERnE + (i / 32) =
* 4);
+    }
+
+    for ( i =3D 0; i < espi_nr; i +=3D 32 )
+        writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPRnE + (i / 32) * =
4);
+}
+
+static void __init gicv3_dist_espi_init_aff(uint64_t affinity)
+{
+    unsigned int i;
+
+    for ( i =3D 0; i < gicv3_info.nr_espi; i++ )
+        writeq_relaxed_non_atomic(affinity, GICD + GICD_IROUTERnE + i * 8)=
;
+}
+#else
+static void __init gicv3_dist_espi_common_init(uint32_t type) { }
+
+static void __init gicv3_dist_espi_init_aff(uint64_t affinity) { }
+#endif
+
 static void __init gicv3_dist_init(void)
 {
     uint32_t type;
@@ -700,6 +776,8 @@ static void __init gicv3_dist_init(void)
     for ( i =3D NR_GIC_LOCAL_IRQS; i < nr_lines; i +=3D 32 )
         writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPR + (i / 32) * 4)=
;
=20
+    gicv3_dist_espi_common_init(type);
+
     gicv3_dist_wait_for_rwp();
=20
     /* Turn on the distributor */
@@ -713,6 +791,8 @@ static void __init gicv3_dist_init(void)
=20
     for ( i =3D NR_GIC_LOCAL_IRQS; i < nr_lines; i++ )
         writeq_relaxed_non_atomic(affinity, GICD + GICD_IROUTER + i * 8);
+
+    gicv3_dist_espi_init_aff(affinity);
 }
=20
 static int gicv3_enable_redist(void)
diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.=
h
index c7e3b4ff0d..3f1269f0c8 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -306,8 +306,25 @@ extern void gic_dump_vgic_info(struct vcpu *v);
=20
 /* Number of interrupt lines */
 extern unsigned int gic_number_lines(void);
+#ifdef CONFIG_GICV3_ESPI
+extern unsigned int gic_number_espis(void);
+
+static inline bool gic_is_valid_espi(unsigned int irq)
+{
+    return (irq >=3D ESPI_BASE_INTID &&
+            irq < ESPI_IDX2INTID(gic_number_espis()));
+}
+#else
+static inline bool gic_is_valid_espi(unsigned int irq)
+{
+    return false;
+}
+#endif
 static inline bool gic_is_valid_line(unsigned int irq)
 {
+    if ( gic_is_valid_espi(irq) )
+        return true;
+
     return irq < gic_number_lines();
 }
=20
@@ -325,6 +342,10 @@ struct gic_info {
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
index 2af093e774..d38a3d08c7 100644
--- a/xen/arch/arm/include/asm/gic_v3_defs.h
+++ b/xen/arch/arm/include/asm/gic_v3_defs.h
@@ -37,6 +37,40 @@
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
+#define GICD_TYPER_ESPI_RANGE(espi_range) ((((espi_range) & \
+        GICD_TYPER_ESPI_RANGE_MASK) + 1) * 32)
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

