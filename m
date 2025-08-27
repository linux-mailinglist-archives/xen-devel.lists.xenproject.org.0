Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A12B38977
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 20:24:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096722.1451360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urKok-0007xE-30; Wed, 27 Aug 2025 18:24:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096722.1451360; Wed, 27 Aug 2025 18:24:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urKoj-0007vc-SY; Wed, 27 Aug 2025 18:24:17 +0000
Received: by outflank-mailman (input) for mailman id 1096722;
 Wed, 27 Aug 2025 18:24:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+iP=3H=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1urKoi-000703-7p
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 18:24:16 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08e80296-8373-11f0-aeb2-fb57b961d000;
 Wed, 27 Aug 2025 20:24:14 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by MRWPR03MB11023.eurprd03.prod.outlook.com (2603:10a6:501:76::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Wed, 27 Aug
 2025 18:24:12 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9052.014; Wed, 27 Aug 2025
 18:24:12 +0000
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
X-Inumbo-ID: 08e80296-8373-11f0-aeb2-fb57b961d000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EYQ6XegoCr2RhXzcTHNLi15iEStY8CXT8JJcOpB4HrKl8EWJpABlF2HF8j4MhIfSEBl+1R1KehKAK5OynO3PFRz8Ju47CDTsAwz33uwycAHIfIHq/I3/HswLolbbNVMcCVq+EZaJW3z7nG0AMJ3Tz1GXuuslFmej9wJXSxKoxm8lTwxSqOLDrHhUnzeR9CYEkNpqagw9jMpVUGRPM7NK1BiOEmBAujOm85V2BDOD7vWIQ38F5shDajxFDoDHwI+cqkQqv3tsBpidN7RBF7Hf39itW4248/DH4vtm8rqcIJjj2jK6dEOjxcEuHDHJ3quopPsTINVBx1ECRDfnyb+ZnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MyzvRD3goWG0CAbjT5ybklt5dHwN3er0gQFoa1Mh8U8=;
 b=cBp/lLoT0xhjdy/0ezH55yCZPEdfIPjcZcTf1E8qLTHs/66z73fGTmGCsJCXGEsPPAlSBnoHaux8nnDkKmGChS9whNLlHTl4vZJSpuDRmz3je7vp85gk/a9Fd53HtEePaLo8Z+LSlr28NjVYS8/+37T6C697Q7VVBer1imVHvttZwEdvz06TiHb+x3dc3fJPLOdc6XVaEotNRZQfzBACMla89Ckb0q2efhqNHsgMONcHeyL7dYK/5V587vknmDVaPWbOc8U0aOfpil946ZIX3SOroF9ok7rGv4jAsgWTHKBjTQ6b4BEZ4W3/sTTBZhrbhOVpRuyIEU5TK4irh/FsBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MyzvRD3goWG0CAbjT5ybklt5dHwN3er0gQFoa1Mh8U8=;
 b=jPDWb3n39P8dmfBN7KiuiR7KZvdvmy2Qjbh3F14groL3yGjmKjoj8AP82o1dpAj9iWl2nV6++S1ESqkhLL9tB2GJXGKKMfyvqMFZtIXSCvNAGtJqf8+1Jt+5cwYezg9HNyvgVrVPC42snduDUitS130k7qceDnXYgp6+rWxoZNo/By6GhvKTBDzbaomHuo5mcCEa9+wN7GMucoL8uaguIdvi3l2fcxYAI6KSfwjQHSMVlfsWBizW6HeoqCYplMhyMKUCUvDZjNOXKY0/XrFWw0c4CEuLzE9OXFIP+7fjasY8kXXhApMCKfpL7+useBdUYWtr+UCi50xZmgsTBdXLuQ==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 04/12] xen/arm/irq: add handling for IRQs in the eSPI range
Thread-Topic: [PATCH v4 04/12] xen/arm/irq: add handling for IRQs in the eSPI
 range
Thread-Index: AQHcF3/JNF+Qat2pckartE+JXKhKmg==
Date: Wed, 27 Aug 2025 18:24:12 +0000
Message-ID:
 <a5570863b6884ac115b8dba320c04eea55005d70.1756317702.git.leonid_komarianskyi@epam.com>
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
x-ms-office365-filtering-correlation-id: 2f0459ad-5133-44c6-799c-08dde596ebd7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?WibnUA58nXtE1jvedygY8iI8CuIabIUp+WLO2H8xOuNWn8rLHgG4leZb0m?=
 =?iso-8859-1?Q?KpINXo9B2KxogE7LR+U7b4rtmsVupcamvefmispZqcjfPxjnbJ/JZC4ctf?=
 =?iso-8859-1?Q?S7UcHax4mCRbkGRLYEkVcLRf0RjQ5MV7PbJlej0dq2b1afhPVGAIxCPqV+?=
 =?iso-8859-1?Q?Lnosga2JAz1+RJCXYTk6OOaqxpKmHD0zDn/Y6pRwqv3qb+17PMJh/uAaoU?=
 =?iso-8859-1?Q?fujFEwPcrstCGcaUSzXa4vquuZejhJZLrNWheFAavkvLb51rzQ/70ZL20P?=
 =?iso-8859-1?Q?2xzKC2+ENiD1bZ/2KWD+mMm0l0nY0eh42wXXuuniieKh9fukQTb2Gji1Om?=
 =?iso-8859-1?Q?C18oS8bi94po2uHPKJcHb8FeOkK/91gggRsH0bAFwCr/5L+++WNAt/b2+T?=
 =?iso-8859-1?Q?6+sPvIG2cCZpaY38FJaPNE0A9d/1T5Vno9FWwngxovlZpuGNAtPPwXs5Zq?=
 =?iso-8859-1?Q?jofLdGGNK0cJMQC6WE91FjjQkCjcWsHOzL0r48GKKeRM08uX8znMhYfvni?=
 =?iso-8859-1?Q?8W/W4SJMPJBLbg3AZoNXjI+vZnKlLnqXYuvbeNNQMP6I/pkF5+zeAUQwSY?=
 =?iso-8859-1?Q?V7rV4MHOueLMMA1+sXcU3nr4ghiGLhnJA3a3ndvXbn0th8kOQ+7LmTZtvl?=
 =?iso-8859-1?Q?6rlHDAsWElXG79Oq2ZZtHpi5u/iSyC0u6rIRhK/cAJjNyqOZ1n0kA+kayo?=
 =?iso-8859-1?Q?WA9lfFEFzsS0p7aJrF/ZxUfzoS1axUHYKrae6EGrzWjuO3nPNgnwHqaniq?=
 =?iso-8859-1?Q?wyXyE7lLLsVeZgp5q/bDuYa6MFRBYf8Dt6bma+c/K9xQdjGDFhAuXLMZEc?=
 =?iso-8859-1?Q?Q5qV5SBGVb5XMDuoDSUeByQP+dtJ/AsGAB7JrNTi+0suLCRSQRRBRt6DEB?=
 =?iso-8859-1?Q?LLIorTYHBGL2psov66cAW4gopOaZu/CV0PEA+m7SecMdph6mH04Nw4TiqZ?=
 =?iso-8859-1?Q?ceGb90Yqjl0L/QADCrATRoz3cePynKCLt33fFehMNfk1JudSSSuE0mPNgc?=
 =?iso-8859-1?Q?C3RdvOKI8kELNkBIAbDw69D6NFoffa4vlwDyTENoPY3oP6SfsyP54Tw3Wl?=
 =?iso-8859-1?Q?hzh1w2Hp6T5c88qIVCZCOHm4bbLcvd9ODhcYlDabfbEYJGBx7aTMm81YpL?=
 =?iso-8859-1?Q?KcSvx5ZrZ3gVeQ48hLBSEnTVXkJ5QtftZzLEqOjupTKT4Tj4+yztJLTzB2?=
 =?iso-8859-1?Q?Ia1bC5Ks8lA7eLgU7hWoFmA9W1pbqofc8R1Xj0xZeV2hrdhqVHx+cbz+R+?=
 =?iso-8859-1?Q?Pe9tuM5RTYVHjXV9tASE5bnfAtR3CEAIGc85KSMpobI7d4MGrDcn6fJsR/?=
 =?iso-8859-1?Q?m4ySbepHAcp1rqPApvN59nOULz5P5TU8GOnInVgC0XObUgaoARMk+HOMhd?=
 =?iso-8859-1?Q?zOjSR81nFrXA41WCI4n24is6dmBZIQIiDAhe8aIfncrFr0P+aJ0b2zBQwP?=
 =?iso-8859-1?Q?DKvE7cmyGTHjR7nGf+6a1Z/HplGk9HW1K2iaOCS613p7ibAnzI7BruRhaw?=
 =?iso-8859-1?Q?g9WvoEt6OUB9lrg6Wq7/ig6iMlSINcGt9FSucEZ9EtIrdjUn7widvdHXSW?=
 =?iso-8859-1?Q?tLQKiYs=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Ps+SMne+ZPvXzli+J1EFcLTIhCIDhuoW6g1LLOtjEDg6gDXG0gtmFi2QcT?=
 =?iso-8859-1?Q?cmKziU54LVA5Q1TL9uZBPW1+JvPkPVfXlDbCT1OHL3yYdlQxMqZW9uePy2?=
 =?iso-8859-1?Q?OQHV8mVifkUEbHptI8Q/5lNe8blNEFV+TUKEznUl2i/dgYDaO/oSDCwZYm?=
 =?iso-8859-1?Q?7OW0ffBsl1kpHFTWjJNZd0/3t07rwabqNfOstXvktNRrYAI4QMx/ZDjloe?=
 =?iso-8859-1?Q?fToe0HNX28NLolCNXHfTCO0xaItoAosJ5PWPlpViqlYJHzGAMqDI48DBIZ?=
 =?iso-8859-1?Q?Ssgd6fDTxDzVLaMetIdWlFUS82645s4kBDh6YgKMoiv6pL1RzeTZTR9yy7?=
 =?iso-8859-1?Q?nxvBB/D0nSaDiwaBLyxqx2h2XU+L0kCKqcC4v1Ehol5nWf0UzUc/0vBTfP?=
 =?iso-8859-1?Q?K3uuQNy3DdVJadNo/tZQ1hEagK55xipTStanlCazPIKy2rnMSOkSic0FGh?=
 =?iso-8859-1?Q?iGMdD+EpflxIynecZ6T3vG5J9MwKqGLw8Q2XZ17fInSVl6yKuvn0gyHusz?=
 =?iso-8859-1?Q?680nztvnfx3dYL2XgXMH4wcn0kg+0cI8PiLin46wKnPmmLEkEb9iUCbWUy?=
 =?iso-8859-1?Q?/mHk99rI85wNrSuwikT+77r61f91kz8andBP63E162RGXtcvwLZzEMN4oy?=
 =?iso-8859-1?Q?AKtzv78tPTIqjc5X9B5oH2aqW4zzxGrPFtsMJMe4PCMsMSa3u9zILYfxYH?=
 =?iso-8859-1?Q?7copZetW8ad02y1nYrN1o4q0crzQRPc0ou9ZwOhdQX6O5T+UwT5pauJDC0?=
 =?iso-8859-1?Q?wtNuJcoODYAJELHxIV5ylCNBGjKFw4wRt0ILAVOCeMaxg8D0XD34nSPt8W?=
 =?iso-8859-1?Q?JRotjVQ3wyR/PXGHR3TdWN2GmpBy3RNT8kCIpkjy+uV1x0x8yuJ+y4vrNJ?=
 =?iso-8859-1?Q?hJ/6U94TfndxOpV+Yo/RU1wHepMhsqZ5BFi0h6P4y8whOtGsMAwndIJx7N?=
 =?iso-8859-1?Q?iGMUWX721VEilN58MubzMIvH7M1dnEx2nslfyLb5ILO+GPWUGuw9HaRwjc?=
 =?iso-8859-1?Q?WjCyVh2qesCQPEZSvdYK7v2u4arhqSLlV0JR4GJQSlM1A4HBmKFSfnyRzm?=
 =?iso-8859-1?Q?nQutCrD7qyvPp6AzNpy6p8HwVPU4/jWj87DXtWDC8LS0MYeGxYzxxihHzT?=
 =?iso-8859-1?Q?We4kDFNN2bmpOs7UelOhXKj1SF2ny1n5mrfgZqSRiKYyP4ElftT4TNW51t?=
 =?iso-8859-1?Q?coWOevEu9k6mGvN98x6/No8huE7omwZoKk26cPKWygHydqgrkWtjachwRp?=
 =?iso-8859-1?Q?tofv8HuQ+eeTSiZ1l2Ni8qmPTe1T8/ZqV9QJZ1mM5qf2u0k9C4FOmukb2L?=
 =?iso-8859-1?Q?/PBLA/tUMWqJ4X87em3H7bGsRyKO6C/RIqTcJswZgzYPlsUrUmzeWeiEiB?=
 =?iso-8859-1?Q?kKgfZeMk7phA1BevF9GxOq8zcxgXy3HcqeDc4oebhsKZPO3QZ7h0AdvAeA?=
 =?iso-8859-1?Q?ja3u8QLVy07xtt0k+mq+IJqoQpcXrJasvhhzgslCVySfIp0KG7KYx84vVi?=
 =?iso-8859-1?Q?PNEP4ZMuODagKY72GqwwCadp5U0ZImHCWIKzDk3MqxARq4nBy0tFxRPMmr?=
 =?iso-8859-1?Q?4yTgyE7bfhJ/b5G9KhKEO5zhzYetBMQ7dOkRzyyut18+AtlVFUg3wKtH/+?=
 =?iso-8859-1?Q?1uDs2RYxjDT5CeEM+v05jkib9Xyw3hSC5AKurpEvXeYjVtdTITOKFyRr/s?=
 =?iso-8859-1?Q?j8yW/xWhksSYoaLGEjY=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f0459ad-5133-44c6-799c-08dde596ebd7
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2025 18:24:12.0554
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E9KeFiwjgVGyEE1yYcI9DcwH2XAFBIV20u8i++ynnR8zb36D/XZ/pNz3I0gmWZ6YKTd6m3lNzZGEOOXd7ZzhFDu60WgBzO9/JOqCU5uETRE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR03MB11023

Currently, Xen does not support eSPI interrupts, leading
to a data abort when such interrupts are defined in the DTS.

This patch introduces a separate array to initialize up to
1024 interrupt descriptors in the eSPI range and adds the
necessary defines and helper function. These changes lay the
groundwork for future implementation of full eSPI interrupt
support. As this GICv3.1 feature is not required by all vendors,
all changes are guarded by ifdefs, depending on the corresponding
Kconfig option.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---
Changes in V4:
- removed redundant line with 'default n' in Kconfig, as it is disabled
  by default, without explicit specification
- added reviewed-by from Volodymyr Babchuk

Changes in V3:
- introduced a new define NR_ESPI_IRQS to avoid confusion, like in the
  case of using NR_IRQS for espi_desc array
- implemented helper functions espi_to_desc and init_espi_data to make
  it possible to add stubs with the same name, and as a result, reduce
  the number of #ifdefs
- disable CONFIG_GICV3_ESPI default value to n

Changes in V2:
- use (ESPI_MAX_INTID + 1) instead of (ESPI_BASE_INTID + NR_IRQS)
- remove unnecessary comment for nr_irqs initialization
---
 xen/arch/arm/Kconfig           |  8 ++++++
 xen/arch/arm/include/asm/irq.h | 26 +++++++++++++++++
 xen/arch/arm/irq.c             | 52 +++++++++++++++++++++++++++++++++-
 3 files changed, 85 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 17df147b25..43b05533b1 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -135,6 +135,14 @@ config GICV3
 	  Driver for the ARM Generic Interrupt Controller v3.
 	  If unsure, use the default setting.
=20
+config GICV3_ESPI
+	bool "Extended SPI range support"
+	depends on GICV3 && !NEW_VGIC
+	help
+	  Allow Xen and domains to use interrupt numbers from the extended SPI
+	  range, from 4096 to 5119. This feature is introduced in GICv3.1
+	  architecture.
+
 config HAS_ITS
         bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORT=
ED
         depends on GICV3 && !NEW_VGIC && !ARM_32
diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.=
h
index 5bc6475eb4..221dbf23a2 100644
--- a/xen/arch/arm/include/asm/irq.h
+++ b/xen/arch/arm/include/asm/irq.h
@@ -32,6 +32,15 @@ struct arch_irq_desc {
 #define SPI_MAX_INTID   1019
 #define LPI_OFFSET      8192
=20
+#ifdef CONFIG_GICV3_ESPI
+#define ESPI_BASE_INTID 4096
+#define ESPI_MAX_INTID  5119
+#define NR_ESPI_IRQS    1024
+
+#define ESPI_INTID2IDX(intid) ((intid) - ESPI_BASE_INTID)
+#define ESPI_IDX2INTID(idx)   ((idx) + ESPI_BASE_INTID)
+#endif
+
 /* LPIs are always numbered starting at 8192, so 0 is a good invalid case.=
 */
 #define INVALID_LPI     0
=20
@@ -39,7 +48,15 @@ struct arch_irq_desc {
 #define INVALID_IRQ     1023
=20
 extern const unsigned int nr_irqs;
+#ifdef CONFIG_GICV3_ESPI
+/*
+ * This will also cover the eSPI range, as some critical devices
+ * for booting Xen (e.g., serial) may use this type of interrupts.
+ */
+#define nr_static_irqs (ESPI_MAX_INTID + 1)
+#else
 #define nr_static_irqs NR_IRQS
+#endif
=20
 struct irq_desc;
 struct irqaction;
@@ -55,6 +72,15 @@ static inline bool is_lpi(unsigned int irq)
     return irq >=3D LPI_OFFSET;
 }
=20
+static inline bool is_espi(unsigned int irq)
+{
+#ifdef CONFIG_GICV3_ESPI
+    return (irq >=3D ESPI_BASE_INTID && irq <=3D ESPI_MAX_INTID);
+#else
+    return false;
+#endif
+}
+
 #define domain_pirq_to_irq(d, pirq) (pirq)
=20
 bool is_assignable_irq(unsigned int irq);
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index b8eccfc924..adb5e49ea3 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -19,7 +19,11 @@
 #include <asm/gic.h>
 #include <asm/vgic.h>
=20
+#ifdef CONFIG_GICV3_ESPI
+const unsigned int nr_irqs =3D ESPI_MAX_INTID + 1;
+#else
 const unsigned int nr_irqs =3D NR_IRQS;
+#endif
=20
 static unsigned int local_irqs_type[NR_LOCAL_IRQS];
 static DEFINE_SPINLOCK(local_irqs_type_lock);
@@ -46,6 +50,49 @@ void irq_end_none(struct irq_desc *irq)
 }
=20
 static irq_desc_t irq_desc[NR_IRQS - NR_LOCAL_IRQS];
+#ifdef CONFIG_GICV3_ESPI
+static irq_desc_t espi_desc[NR_ESPI_IRQS];
+
+static struct irq_desc *espi_to_desc(unsigned int irq)
+{
+    return &espi_desc[ESPI_INTID2IDX(irq)];
+}
+
+static int __init init_espi_data(void)
+{
+    int irq;
+
+    for ( irq =3D ESPI_BASE_INTID; irq <=3D ESPI_MAX_INTID; irq++ )
+    {
+        struct irq_desc *desc =3D irq_to_desc(irq);
+        int rc =3D init_one_irq_desc(desc);
+
+        if ( rc )
+            return rc;
+
+        desc->irq =3D irq;
+        desc->action  =3D NULL;
+    }
+
+    return 0;
+}
+#else
+/*
+ * This function is stub and will not be called if CONFIG_GICV3_ESPI=3Dn,
+ * because in this case, is_espi will always return false.
+ */
+static struct irq_desc *espi_to_desc(unsigned int irq)
+{
+    ASSERT_UNREACHABLE();
+    return NULL;
+}
+
+static int __init init_espi_data(void)
+{
+    return 0;
+}
+#endif
+
 static DEFINE_PER_CPU(irq_desc_t[NR_LOCAL_IRQS], local_irq_desc);
=20
 struct irq_desc *__irq_to_desc(unsigned int irq)
@@ -53,6 +100,9 @@ struct irq_desc *__irq_to_desc(unsigned int irq)
     if ( irq < NR_LOCAL_IRQS )
         return &this_cpu(local_irq_desc)[irq];
=20
+    if ( is_espi(irq) )
+        return espi_to_desc(irq);
+
     return &irq_desc[irq-NR_LOCAL_IRQS];
 }
=20
@@ -79,7 +129,7 @@ static int __init init_irq_data(void)
         desc->action  =3D NULL;
     }
=20
-    return 0;
+    return init_espi_data();
 }
=20
 static int init_local_irq_data(unsigned int cpu)
--=20
2.34.1

