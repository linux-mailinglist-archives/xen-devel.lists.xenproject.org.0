Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B07B3897D
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 20:24:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096728.1451389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urKop-0000Nc-G6; Wed, 27 Aug 2025 18:24:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096728.1451389; Wed, 27 Aug 2025 18:24:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urKop-0000HJ-Bn; Wed, 27 Aug 2025 18:24:23 +0000
Received: by outflank-mailman (input) for mailman id 1096728;
 Wed, 27 Aug 2025 18:24:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+iP=3H=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1urKon-0006ki-RL
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 18:24:21 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c766d63-8373-11f0-ae26-e363de0e7a9e;
 Wed, 27 Aug 2025 20:24:20 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by MRWPR03MB11023.eurprd03.prod.outlook.com (2603:10a6:501:76::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Wed, 27 Aug
 2025 18:24:18 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9052.014; Wed, 27 Aug 2025
 18:24:18 +0000
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
X-Inumbo-ID: 0c766d63-8373-11f0-ae26-e363de0e7a9e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=stRNwQiGfgmnifNR4o/pUG8P5CPOGAKq/dS/HjSNuhH2myIDMHglHFYmnn7VwWck2GG4ssevOECy3eng2qbiCDKvjF3WbiCvLMX00GTYMdLuzUdHZSbGqstJEp9dAtx+kQA9yHgKho4sP+nfbjY+fs/5pWLed2Zj1FOxTIdfFUxzd25K36bh5usWHEdBjaqhccSgy/WOrNJpW/rxRFRodySgjqSaLHSiwgS3FaA4ftW56416n4jxV6DvPUMp8pmlj2fkhiSRM8J7I4jNJTn1t9/YX/3sjsbBSu0baV+W15kzIOkeHCnT87BNRrkpdEZsv/n/Kbkr6oz5eXaYxSdCwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jtL0A0E37mr33YnP99iRQLje8SLn7K4xvKHMnjNefTQ=;
 b=QbHAg8rGQBGD7hSe3/SV75Lh3Z4Nm6dtz95LIu/y+sCXCypEJgCGnyhYaLSLuPmZPv9AHXa3XH87WllB41QqcFrjxCecPt35B63DLGyJYoLlQz/+w5RGos0jJPBQWC2uxvIYOXxm3rRblx+Nt6agbtC8w9UkSSkAPI5BhYo876ITu9Oq3okvBp4/xRs4FktJodGdt6CDirsUcVe+w5i/31pTAxYW4d/GheZk8T0pz0uy7COXCr5OCfklYOZTs2RODCPyiuE0yUw17vUcd3vs+b346+V9JZkHZPywBdrwSvbuLvAKh1nbsYfdvLBPMvuc9y1M68G3hA6lEoY/eMUnTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jtL0A0E37mr33YnP99iRQLje8SLn7K4xvKHMnjNefTQ=;
 b=k8rsPW75Y5Mqvjwzdfsh4uBS/06EsFWvXIXJLVy06Lsi8lvxAB7nS7ZuRNzFqAR4/rt3ViI7ciU/Z8NbPWTK3fanKRottohsYuXHMnlE3W0UtcCG6Ye9fNLfabi20pEqc0J8wCqbxk8p9lzSKQ6dx5K347qBdJS25k/Fyf50WPVwUrZEQggdpXVXVzXZBs077/TVYxQnHF3SDJkFPeMVCfppyHCsQhTLOY0tedT9sCLimSZJbWsjY1Kn5PBLFEO35Cq0u5mySWjMRF3k71vxjvm0mYSJSrMn/D3nVB2+mH7BkDSnTytDFGQpISGcbLnBzia8g01zBcgAWae6UjDsZg==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 07/12] xen/arm: gicv3: modify ICH_LR_PHYSICAL_MASK to allow
 eSPI processing
Thread-Topic: [PATCH v4 07/12] xen/arm: gicv3: modify ICH_LR_PHYSICAL_MASK to
 allow eSPI processing
Thread-Index: AQHcF3/M1ETcfpgi90idtTPd2WZvfg==
Date: Wed, 27 Aug 2025 18:24:18 +0000
Message-ID:
 <2252a686e800a9752cb22473c68236cb27734c26.1756317702.git.leonid_komarianskyi@epam.com>
References: <cover.1756317702.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1756317702.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|MRWPR03MB11023:EE_
x-ms-office365-filtering-correlation-id: e4d14e36-eb2c-431b-cc0b-08dde596ef6f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?hinUjiR2lQxHZ+cxsZ5SbdeLz7xNuc6Tcuqd77FwHdfYuC3Ch4g9YuOb06?=
 =?iso-8859-1?Q?0kx/YN5Ir36mQL6ohXM2C2Stb+bE23eW3pwGx1erpOhHwIcVm0ca/OSDJf?=
 =?iso-8859-1?Q?lqkjzTVorZ6w4hZL2dSUbG2+0kzpEgt5AlotCRstOzUTGiLpE8m9JuuL9+?=
 =?iso-8859-1?Q?3GYn58CLKEwiVnXfw+iUHFDQcimVDH9XlgmLRg3+9q8xKp41MI96ZJ8h4Q?=
 =?iso-8859-1?Q?46yxU5oir8ZtzLjOMowGGqjZf6shrVuvHpeXQn0YuoFd8cu7V9alIq53Wh?=
 =?iso-8859-1?Q?OaUXPkzGTq1F4bGArgXGk5t2j5QpWijV0hz8ACE6UpcEuKecmULLfiuD+t?=
 =?iso-8859-1?Q?wuvI0BgKNcoevM73Pal8GxlgKOf/xsyHE40P0oRo8fClYs7kDdBeLv4812?=
 =?iso-8859-1?Q?LkoJeUGqy1Ka+2nLioeKLqJ+KRtHrCf3y2CFLfRmfcL60I8Kua3Pdffg7u?=
 =?iso-8859-1?Q?u6WB06PMEor+OKPEDdJG3k5V2p0z3/5Et99jsTq6DfddqM6tJYksBWBr/b?=
 =?iso-8859-1?Q?zjG1A3VBjbbw8ap3uDPKua21NgUB4bzCuA4cTj61Sarul5xqebZvuCnlz+?=
 =?iso-8859-1?Q?ugzQoGy792K63wHEH2nGVCQShlWnEw/GnoR72XgQ8LyPikySKH1r+7KWwl?=
 =?iso-8859-1?Q?KK0M8SXHprDu/tmCcvOr2U7XfF+4Pgb1S99KdiP8w4v1qSH3qNTRXV1RPE?=
 =?iso-8859-1?Q?ghHmQzYBiBr0n8qCli08gg/9xla5Ajk+UOyw26/tel5HjoCdIzDzP7XWF0?=
 =?iso-8859-1?Q?Ej05xLwQOgqjcgpipGvMqWM/bHZ2770O0lvLy9d+McOkCXKR3V+GbRPODs?=
 =?iso-8859-1?Q?N1XiweqX8x2qur74cVdQ6mN3+QvsTtGHdcmpuUwIYMN6+UXLNxx370h9AJ?=
 =?iso-8859-1?Q?Ka2D7dIZYZqRYTIm8Qgu7+hldn1FGxPxWbGni7H+A4d7E7P3nho+uh3/Vo?=
 =?iso-8859-1?Q?rLXM7m0HVdlFEm//DuCaplCjCHxqeUNSt/gOu2LqFofHyjRcYevwJu+oo2?=
 =?iso-8859-1?Q?z5N6Rvb1c3FV7DOiPi9ps5jPe60OyYsr8ybMHnOlJHI70A/31GhriHNYMx?=
 =?iso-8859-1?Q?7Y53NHwKbNFiAbwwJOiGrqhx6GHyTuGOAVDXNhxMDHH4rvmPAReAph4eY2?=
 =?iso-8859-1?Q?iHbXVCv4jJJhzb870bmZXx4F8L7guEM8lO5NgZP2eqTdAPoGG1ZHPX5KXF?=
 =?iso-8859-1?Q?ebCyF00e/gG8oN7GBBtldwym2BiDx4NoS6Weu0MVKhZvDfMm+U5t25HSLr?=
 =?iso-8859-1?Q?5PSb5ANIrxyqacDVlXK6+zfFMtBDBr2SgML5bgWlxdbvLsw4s8nmuds8Vi?=
 =?iso-8859-1?Q?uVk8XAlb4lxtoRxjThsJ5kulC0vuDFF9ojUyD6+j5xVV2hwH9kj/wNXN0a?=
 =?iso-8859-1?Q?0cI/OKcDYneHvj1qEbYsuYhDuViWUwJX5LP1W4PphOli8u2jGSeenSwSRG?=
 =?iso-8859-1?Q?oRGqrNBgT4pEuLJQ5gMhB1P5UBgRJdPfDtLrUZRIRj15+eAz8kTNygflnV?=
 =?iso-8859-1?Q?APsvs3k8KPZ8PmMQViq+ZWDRxm4fqQsW4LMj29KRh/kw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?45LZdY0NfjWvD1Icm5PF2X03tsrvzAaa+zHTOtLtlhZkopMgkMnVnfU70m?=
 =?iso-8859-1?Q?Nos5hr1bl9Z71PiZMv5hikpytYmS5bSps5K014mCUgHAjajgdSXv8Jfbp7?=
 =?iso-8859-1?Q?byJwq4OnH86YWO2KEjYORCbTCvyQ8jYuk5K1nFXIAbpMp4wIDMSuHYavjg?=
 =?iso-8859-1?Q?XuqbTLozVDojnIBV0pGBDJuIUcdAfbTUBAgCAgIeM4ldLteLCFzEAdoxs3?=
 =?iso-8859-1?Q?AvyqNWQybysmZBu/jKODOwL7R7ZgfV92ZO2IdVeRciKEjmlOqINydctP0T?=
 =?iso-8859-1?Q?dKgIAuKjBMOIUCsBdR2J4aZfLLSo/Ka4RcTgVPugkAvbKFWHjOzYr2PJp7?=
 =?iso-8859-1?Q?QBuLbUNG/touCOhHjAqBjbW4qdzrJUjvY7p8zmunZSu9a1qk9IE3R/bVHH?=
 =?iso-8859-1?Q?fzNg9DxcqukAPcGrXAGrVwM+yQn+oPHDcpJW2Gr+OZzgi8kAuPG7pCoRE4?=
 =?iso-8859-1?Q?EDRQl6ZY82eG9XD0rC/D/tu9yukazJTJzVHcSii/EKdvPLGPCusBXxPaZy?=
 =?iso-8859-1?Q?K7HUFB0K3iGVl9GBPSfMLd8jY3vg3PQChKn8hG50kFEVNL5d7nctoiBsHi?=
 =?iso-8859-1?Q?KE/lc8amgzO7tPAxdIJ15Uh0Taa08xUxtwqnsVDujFkd91sPnDL0tUQGab?=
 =?iso-8859-1?Q?62B5Qd94lPwIxkf1BiTv21anBv0zM7uNHJ0gzJpK5Qn0BfUFH9dpOIdiHc?=
 =?iso-8859-1?Q?Bm2zOsd8225gAt6i4XAYjxCIvjFFs3F7yd52DDntvlUmLXFEGpXP885SOj?=
 =?iso-8859-1?Q?ARuYgyxy2/Ftmf063SFIck6lAqBO5z7rUJv9UPF+uv32ri778ifAXZf1Vb?=
 =?iso-8859-1?Q?55PHuciIC90LC/rgLFH7z+ow73j+jaPK7wyDI77EiCNCRt8T2OYzanU9/K?=
 =?iso-8859-1?Q?5R1yOmjqxMa0vDRBuOS6DCgUdiA7vB2NzJdGqpgqseTL7PoNid55cTde2C?=
 =?iso-8859-1?Q?RUkXy0IS8xyL1hn7SGZ+oJ5LheE0KCYWHAxjo3Sn/hBaE892rlFHJbJWt8?=
 =?iso-8859-1?Q?i+rjoLbSCb5iYoU1khXRu7YOpSU+Z6Wp/mqmsfjZqmgfvIZ8D6K4O5XbEB?=
 =?iso-8859-1?Q?AMPjieO5lgE9lwr1d8cNHt0erJHFaLVnnvsdSrteqhtRS374Q+KgvlvWIz?=
 =?iso-8859-1?Q?Mztx+EYMWjXaH3wEexR7QrcWkZli66qCaCTgeiCPvQ4cmZA9ri/AeKr7AV?=
 =?iso-8859-1?Q?fuyBa4UPZVuVAyJny+LpJgMloWVno/bS9F+SHdub3EAjYmXk0vGC8hfOZa?=
 =?iso-8859-1?Q?3SMsY9FU5ZVUPIr+9R3HL9v3hZeHts+YmA+Wr+RRsOCw+M5m0HcNMuZGgq?=
 =?iso-8859-1?Q?q7wpkNzlm9CAOu0kxnrquDiI1Be/obpnwnmIKE70+G1Fxt/nrSq2+J0WXM?=
 =?iso-8859-1?Q?o/sVALz1tekTvetLnd7RZYkzWTf2avbs7VJO0lYfpq0K3ek1ecdqArr5PA?=
 =?iso-8859-1?Q?0HlpaipgxsJtqrFpZ9/qTTtboMdmuiGNu55IklqODH8mDgLfvdFMFqGDF6?=
 =?iso-8859-1?Q?sTpbMnruspEUvypg/i6RNWxvwnmYZCIQlU3ptwJo76j1wNGXdBWiA1WMqo?=
 =?iso-8859-1?Q?7Q4KE7JH8B+NTj66gM5VQiwLuBwOyMKgXjhz/PK69GOwV5aOJkLZFtTv5Z?=
 =?iso-8859-1?Q?jhNR3dv1jvo73XNEsbhLN9O50HOPJGQMhpL202bsdgOhc4J8WZEgXiUwBK?=
 =?iso-8859-1?Q?Dvl4SSOpLa4FR0Xh91k=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4d14e36-eb2c-431b-cc0b-08dde596ef6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2025 18:24:18.0817
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CTMOeAOqLPxZbbmdTxaJXpbr5l4BCMLomfsDGC4rlSOcE7GR7alxDzzIgHQBU+iRlr/OjzZrH5AGdlNsvKLnKP3v+VYHHysOX4oh+MC5DL0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR03MB11023

To properly deactivate guest interrupts and allow them to be retriggered
after the initial trigger, the LR needs to be updated. The current
implementation ignores interrupts outside the range specified by the mask
0x3FF, which only covers IRQ numbers up to 1023. To enable processing of
eSPI interrupts, this patch updates the mask to 0x13FF.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---
Changes in V4:
- added reviewed-by from Volodymyr Babchuk

Changes in V3:
- no changes

Changes in V2:
- remove unnecessary CONFIG_GICV3_ESPI ifdef guard
---
 xen/arch/arm/include/asm/gic_v3_defs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/=
asm/gic_v3_defs.h
index c10db9bd05..eedb7af1fe 100644
--- a/xen/arch/arm/include/asm/gic_v3_defs.h
+++ b/xen/arch/arm/include/asm/gic_v3_defs.h
@@ -211,7 +211,7 @@
 #define ICH_LR_VIRTUAL_SHIFT         0
 #define ICH_LR_CPUID_MASK            0x7
 #define ICH_LR_CPUID_SHIFT           10
-#define ICH_LR_PHYSICAL_MASK         0x3ff
+#define ICH_LR_PHYSICAL_MASK         0x13ff
 #define ICH_LR_PHYSICAL_SHIFT        32
 #define ICH_LR_STATE_MASK            0x3
 #define ICH_LR_STATE_SHIFT           62
--=20
2.34.1

