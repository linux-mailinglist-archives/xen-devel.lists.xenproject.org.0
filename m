Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12358B1D7FA
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 14:33:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072934.1435933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujzoZ-0003Vk-4k; Thu, 07 Aug 2025 12:33:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072934.1435933; Thu, 07 Aug 2025 12:33:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujzoY-0003Np-R7; Thu, 07 Aug 2025 12:33:46 +0000
Received: by outflank-mailman (input) for mailman id 1072934;
 Thu, 07 Aug 2025 12:33:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SGIa=2T=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1ujzoW-0001m4-QN
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 12:33:44 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c130dc9f-738a-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 14:33:43 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by DU5PR03MB10563.eurprd03.prod.outlook.com (2603:10a6:10:51b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Thu, 7 Aug
 2025 12:33:35 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 12:33:35 +0000
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
X-Inumbo-ID: c130dc9f-738a-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LRt9tSbte8YITFuBzhM0oQ7G90D6rJPwm+X+RTFKprc1W/CA2QJv3ozGONLCJiULhsnsRBkCOPD7DHeD7o+uHpnfPZvPyljiX7K0QbcuwEwl+BOdfnV9aCW9Mb9hbb8r60m1t+H3E3XHS9jr4WVfdBXladju/6dn0NyUqUFEf8pCX58hOJY7ITLuaDV7/jvNU11Ne3cAAmPpmxHAVlLwy+Q5EF4YDXVoSluzCRf2Uaw3St070tCZiI1MEWJNq82mq23hG3lEZCQrOWti73BSNOEzt6tIvL01P2es2YlVdcBdLd14t0swQW+cbGJHn2abEozFgr32Eiv9UbbPAEoGwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/JtjGnEPiZbkJDikA07kAxuFpezaBGG4TRRB9FslJFU=;
 b=PfBWGMbawYH4sYm1MxdPI8uvfbl+3kh3484RGWaqzaEB7p5NnZY3acx3zQySUN6wn1/aP01igmZ9/DY8fQyYW+Bg1s0ei/k66jzZgNH4S7qKgsVOS94MH1gu4QRr+ffmgGCA0MW+C1dNLkLhWZbDF2EZgQDDtjy1D6rFtguXKH40pLvMSDuALHCGRWC0akpmcqgZvbUAmdwcm3a3BEqe2YXlp+RIEArikTeXQvh6pEFqxJAgIrWGTzUlwmMHGqt8VVQB9I6p2oRFqQJxMkbIQGohXyrL7BE80sMK0QXhTcI/64f0NfX+AmG8pjC914O/EJMEih1uu9L29B9RX6u1MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JtjGnEPiZbkJDikA07kAxuFpezaBGG4TRRB9FslJFU=;
 b=IT5V186ncUXIzYm9cst+y4x/YfwDZ8ftA3pSmRC7wmj1mKcx5WyzzxR1esGYXVOoCkN1LSVsEpSJ2H9DTjpa4BNbo5S/yu+kBhDg+h3pK3gc5lHTj70lLDlC6o/sor2FnKCwXvHcyXTxuoR1/Q0k6Zyl4IU/Git99ze+TMOas70XO8bqImAXy60iwnYT5XPFX0nwQ6rCQZarAggw6enzsWWOIr7ABNP8IJLyScKYVSO4lg0Y+dy6NIR+OiU5A2DqUXJV+p/zO71eRGgRwNJ3Hk9KRH3QfVkSiAnHjFO0GpN5e0A6XYnUVs0k54c6sWlt8qV8gEtgA0/WYD/o6In1bg==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 09/10] xen/arm: domain_build: adjust Dom0 IRQ handling to
 support eSPIs
Thread-Topic: [PATCH v2 09/10] xen/arm: domain_build: adjust Dom0 IRQ handling
 to support eSPIs
Thread-Index: AQHcB5d9D2bB2ytT+0KvuTkMlpIiHw==
Date: Thu, 7 Aug 2025 12:33:34 +0000
Message-ID:
 <abba685916e6637eedbd831352bed2e968eeb7dc.1754568795.git.leonid_komarianskyi@epam.com>
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
x-ms-office365-filtering-correlation-id: efd5c5b2-565e-4628-7a5f-08ddd5aea0e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?G7DaQxRNAe+W6CYtYICjhQ2xsXoTCHdRkxsQIWdx1iDvYzyFD0iOfVy+jH?=
 =?iso-8859-1?Q?ncNnZ75hacRKr8RlvY5LB+YbqR4c0cWSp2kgoMqzqsCl0y62eaZPgLX7mj?=
 =?iso-8859-1?Q?rAYtujQxKvhL/xpX3zmyI5Y2Siu3ObFBaHEBZ7FkGDv4WBwmCEX2liy/D6?=
 =?iso-8859-1?Q?pQzFYr4O2MhRqedb8ZqOEmmCWrPu+FBVYAyN5EPne7SC3zfhoq2aKCStr5?=
 =?iso-8859-1?Q?Cj58B3cTAwc5omB8+LZC6Ji5s3yPQVqpblqVihNE1ZXuDjZ49GojUOGmJ1?=
 =?iso-8859-1?Q?SeetZC4ctflGJ0MxumC00g8uhlk+mIgRk2oaMbon71i3NyMhpExbvLNxrP?=
 =?iso-8859-1?Q?z1xHM0b+PTThbUwttLElvUW5EGCwB1A1Jf6QE3hXlBbNSdq/DobCjhc3mj?=
 =?iso-8859-1?Q?4cXuz8k528Jeq9Tms2ABJRSL4kXf0RJKtIIBUElR4jg9LQnAnhp9Az6b9j?=
 =?iso-8859-1?Q?dVuZ1ZBocFjwG8OqoHYEuLXcUadmJA5wwOT0ikSIc9y6vqLO4sA2QoO9yD?=
 =?iso-8859-1?Q?vQHK3f6zM/A1NlPCL0BLaIbIwv/dJLTcUCXT7Jbtmp7+8qeyKEVzcnnv+0?=
 =?iso-8859-1?Q?pibc/lSYMwuec4yfSgQg3DM/0HeuL7i5vIxVoIGBhkws5AiZC2uwxHS/p0?=
 =?iso-8859-1?Q?p4kSFRHz4T2Ksp59z6Y9f7ByNR7+7ml4YQj0TgPJGnqD2K9k0NPtz0yy1O?=
 =?iso-8859-1?Q?bla96sm1PEzxQQSHfp80dB7YEvVXwXT8X4PqXSoRRqJpjXUPv8caGP9v0M?=
 =?iso-8859-1?Q?2xsrMFtfzXqWNsv/VOYgWq7nTUMoW67eY8qRWtukGm0qtMs+59j4066Bbf?=
 =?iso-8859-1?Q?HqE8icKlwVEGFuxl9FTc0WXvkRhu9m5JTbzjS1Cl+KmwuKmjgox28Hpdz1?=
 =?iso-8859-1?Q?W7Ci6j+RUy+je1bQvVZ0GavEnqviYn5E7hY9FUfTOLXMHqoTfYnloYe8EW?=
 =?iso-8859-1?Q?4JR4ZKuEmwz8a1Lm3N7SShGmMPVKHuOFs+w62y2T8I4dHMSzHrqxEnPFK7?=
 =?iso-8859-1?Q?AKLJXJRC8xItsaaD0RDV+y600GAcD3Yrg03qEPaMTRnCNgYDLdBNJxdI95?=
 =?iso-8859-1?Q?86hFbjsoLsZ+ISo+Brd9cn0o/xIKvO9BF2ddbBstj2YOzW5g5DL194kUGm?=
 =?iso-8859-1?Q?Xygdt2CJj7vyuUehvq0wvCKz0yER4kEAkmFEH/s2cwqFpM7L4TTBC8WPfV?=
 =?iso-8859-1?Q?x3losqzvgw5kgrOmcAcLqsybfRoFSFpP9QHJQqoPPFhSAEYZTb/9if8wRm?=
 =?iso-8859-1?Q?5zWaZJxZ4ez1zIwga+JfzvuTZ+TTBDjhpAXatNIRU/sFv9irxYbrvQ4Edw?=
 =?iso-8859-1?Q?iDhADx/6NuROesH+2GvTW7+wPVB0Xl6doeztEj26fM5zrJLqnR8anxICZU?=
 =?iso-8859-1?Q?fGktl1jbX4VrXnB3IXeBuwwgNuMvn/Wpy+nlaR/9hIGWzmHcR8Ts8ExqqZ?=
 =?iso-8859-1?Q?lgcNSnxtGvr/NdI79W/LUY+2SuZOss4wAMqIDExGTYwWujKOCQNFV+fEIj?=
 =?iso-8859-1?Q?viGFIxxKCUPOL8ItV3nw3nHkvK6MEAZ7qaX1xC3edUCw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Hj4QnoJNhK+Rf9aiuDMOBLlGZR88I7aH2Y6kFuVlRHZWGXzVW6kNkNecRN?=
 =?iso-8859-1?Q?HPoBwl0uCTniDxHhvappjCrn7CzOX//Wz3JQiWnIj7fzR/znp4Nsq2Q+vM?=
 =?iso-8859-1?Q?mmn2zFycE4VhONyNz7CXG9Zs5u7IxZnqNPcvQOgPl3gwHwpvE3GWrJVNx8?=
 =?iso-8859-1?Q?QaNCelaSScTrR6wOJCkflMur5PGzEqLSZsOh9p+Yjxxy6UAbqaBqwNVb2K?=
 =?iso-8859-1?Q?M54+hVgg+aBOQXXRMUbV6hW4q/McRny/ltrqiE0K5o2DTca7hmYFyAcVhX?=
 =?iso-8859-1?Q?3ddHbMc0Uzd2nsnPYqBU1syE8u2OkklPm3cbEEQ5Hwe7q27yZMRc4/BoIB?=
 =?iso-8859-1?Q?L5UALBKfg9LIC2FqHal3Q02P/W/DOED39Ggt5pGmjhg0WUeNapkCMyXZEd?=
 =?iso-8859-1?Q?9z4S5YTe+MXd9N+l7vPioMG+KHdZ8hDmsRN8VldeomqtYukSfrB5m36B2h?=
 =?iso-8859-1?Q?nY/2AsXpKH8pSZnrNtukCEEN4EMnUVpo+MP7s3PRxhlKGR6ddKeyBVyfK3?=
 =?iso-8859-1?Q?ovuoDOlZqRPb3LaG2cZ5E03SrLuHVDU2Tm5mnP2HJjy10bI6ULUGBIjVsB?=
 =?iso-8859-1?Q?OpCwxlEJ5FAHdKT4DFJWCNoBKui5m92ireaiZWCV46/NAhIkhV8SwKZ3Zw?=
 =?iso-8859-1?Q?8xr5RgDj5fxemHy/3FI5ItHGDunpG2+0y4VAg+5g4o97v4zVbtJUSSQ9YR?=
 =?iso-8859-1?Q?NYZKE0U/wDUSDMpSF8YAoObkHKE+W3j5alxrJZewpyHpEWCXke9VeKkTZc?=
 =?iso-8859-1?Q?843yvQZ3S7qn+RNbwbDl0dFWNqtUVwh7HPQA8eFwmj0AHRZAWX4/1TSpZa?=
 =?iso-8859-1?Q?SME58YVBoolx9I9CNkE27ZbyTc9U/mgcJLxi23I2buHrq74dk9REqwbG9U?=
 =?iso-8859-1?Q?g9a0zEP9jVo+WEdweTAv7xNQmPXpgO7RFqJgZJkcwJQ+xJ4AHyLzWhcQCF?=
 =?iso-8859-1?Q?jwWzE/28ORNnv7VrJwOeOO9DYXjMXF8gnfl9pM+ypC5BKVQ8VGnugz9uYd?=
 =?iso-8859-1?Q?GnALbEapotGIqHCfwoNZygfXgArMVT7rsthGXadsZ/ITcU3Lfz7R/g/uOI?=
 =?iso-8859-1?Q?umVRaH6rfVDW2WCY1wrv5/8rx73BlJv3NqasoHe+i4kq8NcXq4PuiFI448?=
 =?iso-8859-1?Q?7HdZoZ9iIfYAfbylw6f+nS1Zy03erHiKD2v6lekIe4F/KzhIlO5/GP1muX?=
 =?iso-8859-1?Q?GrzLbs8r5w4dTrsYV5y8ZhV2sEIpnZqpqTqZmuGM6LFVTw6WFpgVX7o0yI?=
 =?iso-8859-1?Q?4REBD7cQtN2ru6kMoICFFN34frGC0ACT4LFdsKsx09wgJHzVyrMZ4BMkFU?=
 =?iso-8859-1?Q?9hKh/nRngQQnB5bjwdoV9BxTrOhBkCBKfFaBh0IeftiX+4tId3IREiAHW5?=
 =?iso-8859-1?Q?szU6NHtsBHlEEXhAhVsI+saBdA81Tra2osyNteyBLFo1shcxgQuOdwQjCD?=
 =?iso-8859-1?Q?iBcBTLkVGOTk82O8UT9wnVOSQd/DJ9wJXAc7LbFrcA8n7/9tY2HW3XlWsn?=
 =?iso-8859-1?Q?mIQTbw2xpS0ZlgbVy2pNBmgJ16FfCZ75k2zL7uMck2uH2bpSsPT71owqDW?=
 =?iso-8859-1?Q?STE7mdUw72ZD2H5BrWCVAYOxQD/gxyCJ+LVHK3VJ1gSvNQCiDF46Wm3MD0?=
 =?iso-8859-1?Q?ZaCZQ6OPtCtPujlunb5I1vmwBoFCxVPDN2PLUfmnogzv32xAPdKL9bUXE6?=
 =?iso-8859-1?Q?ScY9y8iyENZJjS3JNUM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efd5c5b2-565e-4628-7a5f-08ddd5aea0e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2025 12:33:34.1414
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g7pje8ZJQnjSkxk+8e6FUi6h6GOSNdO8q4j4EEVXs1gIcs0sWX71GaHRG2wFch4ySfqmznBvSgkRO1eLMaMefPJzvC3usXiXqgoauIpe/us=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR03MB10563

The Dom0 configuration logic in create_dom0() has been updated
to account for extended SPIs when supported by the hardware and
enabled with CONFIG_GICV3_ESPI. These changes ensure the proper
calculation of the maximum number of SPIs and eSPIs available for Dom0.

When eSPIs are supported by the hardware and CONFIG_GICV3_ESPI is
enabled, the maximum number of eSPI interrupts is calculated using
the ESPI_BASE_INTID offset (4096) and limited at 1024, with 32 IRQs
subtracted. To ensure compatibility with non-Dom0 domains, this
adjustment is applied by the toolstack during domain creation, while
for Dom0 it is handled directly during VGIC initialization. If eSPIs
are not supported, the calculation defaults to using the standard SPI
range, with a maximum value of 992 interrupt lines as it works now.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>

---
Changes in V2:
- no changes
---
 xen/arch/arm/domain_build.c     | 10 ++++++++++
 xen/arch/arm/include/asm/vgic.h | 11 +++++++++++
 2 files changed, 21 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index d91a71acfd..fa5abf2dfb 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2055,6 +2055,16 @@ void __init create_dom0(void)
     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
     dom0_cfg.arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
     dom0_cfg.arch.nr_spis =3D VGIC_DEF_NR_SPIS;
+#ifdef CONFIG_GICV3_ESPI
+    /*
+     * Check if the hardware supports extended SPIs (even if the appropria=
te config is set).
+     * If not, the common SPI range will be used. Otherwise overwrite the =
nr_spis with the
+     * maximum available INTID from eSPI range. In that case, the number o=
f regular SPIs will
+     * be adjusted to the maximum value during vGIC initialization.
+     */
+    if ( gic_number_espis() > 0 )
+        dom0_cfg.arch.nr_spis =3D VGIC_DEF_NR_ESPIS;
+#endif
     dom0_cfg.arch.tee_type =3D tee_get_type();
     dom0_cfg.max_vcpus =3D dom0_max_vcpus();
=20
diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgi=
c.h
index 9fa4523018..117b3aa92c 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -353,6 +353,17 @@ extern void vgic_check_inflight_irqs_pending(struct vc=
pu *v,
 /* Default number of vGIC SPIs. 32 are substracted to cover local IRQs. */
 #define VGIC_DEF_NR_SPIS (min(gic_number_lines(), VGIC_MAX_IRQS) - 32)
=20
+#ifdef CONFIG_GICV3_ESPI
+/*
+ * Returns the maximum eSPI INTID subtracted by 32. For non-Dom0 domains, =
the
+ * toolstack applies the same adjustment to cover local IRQs. We will add =
back
+ * this value during VGIC initialization. This ensures consistent handling=
 for Dom0
+ * and other domains. For the regular SPI range interrupts in this case, t=
he maximum
+ * value of VGIC_DEF_NR_SPIS will be used.
+ */
+#define VGIC_DEF_NR_ESPIS (ESPI_BASE_INTID + min(gic_number_espis(), 1024U=
) - 32)
+#endif
+
 extern bool vgic_is_valid_irq(struct domain *d, unsigned int virq);
=20
 static inline bool vgic_is_shared_irq(struct domain *d, unsigned int virq)
--=20
2.34.1

