Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B012C9739F7
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 16:35:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795661.1205093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so1x2-00065q-4J; Tue, 10 Sep 2024 14:34:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795661.1205093; Tue, 10 Sep 2024 14:34:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so1x1-00063D-Uk; Tue, 10 Sep 2024 14:34:39 +0000
Received: by outflank-mailman (input) for mailman id 795661;
 Tue, 10 Sep 2024 14:34:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FMfA=QI=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1so1x0-0005Zc-9a
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 14:34:38 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100000.outbound.protection.outlook.com
 [2a01:111:f403:c201::])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce09137f-6f81-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 16:34:37 +0200 (CEST)
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com (2603:10a6:102:26b::13)
 by AS8PR04MB7557.eurprd04.prod.outlook.com (2603:10a6:20b:294::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Tue, 10 Sep
 2024 14:34:34 +0000
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709]) by PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709%4]) with mapi id 15.20.7939.017; Tue, 10 Sep 2024
 14:34:34 +0000
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
X-Inumbo-ID: ce09137f-6f81-11ef-a0b5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NbJucn1PTRonpZ3jfTH2oJqQdLrIOmHdh81FIUqKW+alE5wx27w1pW0OZdEmJZ8E11bVK1rA/03kpdbwtVDSt4cXNYF/w4QHBiX1B74CcEwWRzNWJZda9/f6R/Q4lIrWkD2cggrBuD/BW+jkfnXGCC2Inyi5UmvjitFkU9X62JEnyp1gRbITiZ6hugSgwjAqzMwqGoS6ngmlOdbRCj00lyQ5lMOxQOVVXOhzEBlwq78Abwj58Wq0coYPOqV2QKPhZcCjG3Nc8lP6OIu1zGLpUo6bHMD8Dh+9tdso3cP9PX1VLmrsMKYXjcdZ4Yz15Vxp5/zcLzgKL824CgTTrw3ujQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TsvmVTWn708dv9V0CssDtYwVcuOhbprlociipcLD3b8=;
 b=Kp8+id+PbWf8AWBPHZ8zDM9Jzml7glc02Y/nDj7mn1qu0OJkI4KM5e0qFe6SyQGx85E0Sv8G+SgZD/qyLf+8zT8+4pat3qo+NFAH3btIV84Uh88VH8GEbJ05lxi+oMm0riph3nkSG3zeCMwUHxMnN2lH59Q2bsFGQqevQozC2RtnIJLxL18SaGylVuF8ERZd7xFPQ1JFMeopq3zjgQOrpzAymn6ga/e1CRcUJTdNlZlll/9sM64V1q0mw35ePkIuIhTdmW38hnJX0VA8lJTBJVAeG8YN2Z+PVx0Gp+33TBZQM+zOaRS3/gqEIaIFHHvygejqqhAD17bbpU4EGJMDlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TsvmVTWn708dv9V0CssDtYwVcuOhbprlociipcLD3b8=;
 b=rOpw4uHCW3HWpw4MbQoJBaQOrH9pa1uwoL/dLpJ7SlQTDuFOfHNutF43f2jOBu9pawk+V/lw9nYbVPCPO1eVbJ9eUGCkM8dQQf0IqpLAwb9W3IH2iF5RXkEcuLw/tIxrxU4SoMRkljiLMnOcG8qNA4CGlJI2ExHNMRytTdcuLCrVQzxK8EERY+lVbeRSi81M2OX57xAhbi0E+6tXC5FniYpmtX6lhz+DsJY+kKRdAEQutKYZNubRdSqHAHvSz8tTrrKUZ6b804pPsaUFyys1p5/dL+Ij1Kp11QRjT+fnXsm9Sy8fO2JdFs6XD1hg2ocFOxPAktpTC4Sp9vvsmTUSyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
From: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
To: xen-devel@lists.xenproject.org
Cc: S32@nxp.com,
	andrei.cherechesu@oss.nxp.com,
	Andrei Cherechesu <andrei.cherechesu@nxp.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 2/5] xen/arm: Add NXP LINFlexD UART early printk support
Date: Tue, 10 Sep 2024 17:34:08 +0300
Message-ID: <20240910143411.178704-3-andrei.cherechesu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240910143411.178704-1-andrei.cherechesu@oss.nxp.com>
References: <20240910143411.178704-1-andrei.cherechesu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0P190CA0019.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::29) To PA4PR04MB9565.eurprd04.prod.outlook.com
 (2603:10a6:102:26b::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9565:EE_|AS8PR04MB7557:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f05d158-cd0c-402f-6169-08dcd1a5b0c8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MloTrjUU3CyMd2oWBjqDRe3kU0Inqw7+SI92lO+E2SSEWujtbsrhOhBzs44P?=
 =?us-ascii?Q?R1cZlrknv84XQHpm31A4PrA5qiIHXDYWuU1g+yh1hZU9ocrJ2gzQ2H7UBmg7?=
 =?us-ascii?Q?+MJvZ04hzqWllFrOD/pePqg3QyjL0fwJrjIVpz4UVCNffFzmC78XO/wQyugm?=
 =?us-ascii?Q?bCdRmHvQXS7aOeZAAf7p+k6MBmjkOiYRNqr6LmA/kH0nRVh91csO5U4L8VWs?=
 =?us-ascii?Q?bybleHIhI0Cptzh1+wV2DjYodderY93QLbPls1t/50xMOPBiLpYSAMV1K4im?=
 =?us-ascii?Q?VNdPZnv9Kc1aXBiKz0HTzgXILVO0qcMZRZRLj8s2OQE/+PqCR2ZQ6GvG4STP?=
 =?us-ascii?Q?Cato3QR3ky/zdGZpEFlEDU6LOWBWH90hEIXNIbAYciSxQ/5IqMqQjV6NyZPE?=
 =?us-ascii?Q?yfxOxL/hei96px4AxpzgHiFn1kS56uIXpI4irMQ7L6shpPVw3byEDqb0E9ti?=
 =?us-ascii?Q?wvHqfi+RgklZl5KPBBU7D2YMQr2LYo13WzM3RyqFAMUnrJ2/pk96hwpmdwwC?=
 =?us-ascii?Q?UrgdVzGFWhyeaYYO097HRFc96JW0LOV7dl906r8nHCPjbocELVgtloHbYXeG?=
 =?us-ascii?Q?najYWTwRuCskespnFBKSXxq/eZqGYXb8jX/WIRA2Pwx9hN4wWDgKSGtI62qX?=
 =?us-ascii?Q?57nWpHMHrqDwP3ojx65CtvgN73Urz+yTgGOKoaf1ptF4ZksNBwORdJa6/FIn?=
 =?us-ascii?Q?ertj087AXiwcUBsA8IvOGhw4Oqag/sa77iB5BTHWzkMCvCaxTvy7JnEUE148?=
 =?us-ascii?Q?Nh8VPlVoqZnaEOOHjzabErstzc65wTlkDlQcoTMFpGKHbYG+b7kcIIXCr8rP?=
 =?us-ascii?Q?gi47b1y1WuiSNGCHAcksrcwo67NGCRs5qPC5tILanyfrDqt+BaSKQhzoiR9a?=
 =?us-ascii?Q?jC5mrzzpyn9FOSuXviAQLitNd7YP/HRQ7ZFJFRpOyzJvcsh2wJuiLVcYcESX?=
 =?us-ascii?Q?afk4zo71irjsl+REmkTjOgp7kaH0EtV8JZW6bDRN486FQY8Q1JHGFlzi2Bh0?=
 =?us-ascii?Q?NbTEanaQGXBa8h8CX7Gms0OXBtkzx9HDJkIu6MT0QUXiTGv8/KyYKdVhgqC+?=
 =?us-ascii?Q?mQQ8qWH8TlRzVjpLOxyyHGXT7kTED3zI1ZNd20NvEjPZRU3w+1SLtwKR7LiW?=
 =?us-ascii?Q?R1kIyLBfkU1PH70B5K93aJUhSAcbXAncWijsR4VEBKSBMjw7lMet6Al2CD8j?=
 =?us-ascii?Q?0GCoF+5nHUo0Z+FKQylVyhRAtpBrXJpwNUhqUmm5sA0zOVslXvOfXnHKjMtJ?=
 =?us-ascii?Q?lNvS3Rp7QCCOkNf+T1UeG9E9Ho3tOFbft+ZJuLB7z9bNCoBOhqmFFumejoEb?=
 =?us-ascii?Q?CNxw8el+tt3l+grAfdiMlMzSSksG5Jzk+WBPE9lgBT1cI7PT+AFKdTGm84gE?=
 =?us-ascii?Q?Umm7u1OSoAELGTpj3jhOGjAgMVonL05irpbAS1PkxwooBvhE7g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9565.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?n5/t7wQSQ3MGfQeFvIEo3KnoegH+hgqh8X8/VSwWdr9bdTlny0mJiOFWXcUA?=
 =?us-ascii?Q?IVzZhhsILCUiXNViOOS0Af2eSIb7qADs32MLjNC4BySmQe3x6XtLrBplWLdq?=
 =?us-ascii?Q?wqphkOzzyOOI/pillJh3Z4CKIYEk+uhwgkFli0ESCJDJPp6W/FtSjv8sLhuP?=
 =?us-ascii?Q?aMuOgfawedZCD9P4DUaZPsb+tPl0Iq1K2i1BxSiXKuf5RFQME42+/+1conL+?=
 =?us-ascii?Q?wacUkKYfOogJUiTDWVfLcv0oBwybh40ZnqNqMMvUKxDb2q+Kb4fxuIGm35rY?=
 =?us-ascii?Q?rUtrma+AcVwqhXlWXhlC9B4SDkpAG+7z4WrQF2X25GuAxmNnZxg3d176NPlz?=
 =?us-ascii?Q?PvS8EeooQeIWpVA58Neq3cmd/U9qt8jXGYH6JeaN5drSn9KDRJbwJ7oDNwLg?=
 =?us-ascii?Q?QAoX8t253qpD3KasPboDMhjf0oMNY52PuSFdNZQi+p0WI/9xzDL8xMf/GxIl?=
 =?us-ascii?Q?CoNiD7gsI4qDDn8EMwWCScAKH4ikKIWa2llF76NnjgbBFIMRGgJE4+xWVq8r?=
 =?us-ascii?Q?DFxJiPvNBdF23oBWlR6I6iFjS5mDcQLT18Wj67AWFKpOx2qzfTzew4V4XhhF?=
 =?us-ascii?Q?/lJ29yd9g9KRefWLoa5q1cgj2xbgwOKUJbwlAk4wcK7+J1gaDcS/+5Qp5Ku1?=
 =?us-ascii?Q?nrGeMS2ZAjrnuZokHlSH1LjtpNdX2IOuOmSOSALCF51rBVeesUD+LW3wzCXe?=
 =?us-ascii?Q?KZkQOpPMSgYtQEDU+EvaTkg586kZgz7IL+2yhDrqyiNSHEILGesqIXj1Rywt?=
 =?us-ascii?Q?ywaNYyot2xmEhyNP8EUP5mv7zLg5njoU2lqB2Hwjl2PfFDXB7udvliXVmPSw?=
 =?us-ascii?Q?9uvqg6Xt1QuFLfZoLlMIgDktDnbTvOLAB5XtKKxaz0EEpOxY769ELd/r+yZS?=
 =?us-ascii?Q?dR/+UMifBC/zb1gfjcEu6J12MrpOi5Ld46Wsa4e+hhIppsEKF2OU8QUzMSla?=
 =?us-ascii?Q?ESGo4i/5lXGPyiWIYX0EaYvrYLyWsEdXBJueDccdrWUe4P0uMKzJZBE16lia?=
 =?us-ascii?Q?8YCG21a6ecbPBKBxiQgR9jEomB/fzXy3C+i+NaKTfyZ2+OeWLuGDoCysws4Q?=
 =?us-ascii?Q?vIVW3n+CGbNpc+llH6GWDynZxkSzH5SKK1g7NddZ2Jn8Qk5+xWZN/lIInabW?=
 =?us-ascii?Q?Z0D89m4UX5o4/gRoK9aodSdgUdMGSLsUy1MNr96qSRNccM5/MeatgfWGEKlc?=
 =?us-ascii?Q?zHmdfOzJIgAmtVlNm3cylCEeU0FM+Px0hl/m7Iinewgn+E7872DvQHu1o8Np?=
 =?us-ascii?Q?k4wtKCvBKLCb8DiXY6ZDk3FiFvKqaKXtCDbPeyFxR+WFUrVJgXROoUcjSmuY?=
 =?us-ascii?Q?dM0C+4ect28BD4TCnzLwJjdqHocJFJKVDhmc8FTGs/dcqkPgaUpcu4+4r1oJ?=
 =?us-ascii?Q?sfJZnIkbDBfQj5PuaByR9Klk3UJZ20hDAw7YdMSbPNjeKl3fqHQDwaDu5jCn?=
 =?us-ascii?Q?w5cyNAselMrOFgZG21p10gj4scj0/6oeOTpY5fGlkCAS6dwPR59kjs8xzYKE?=
 =?us-ascii?Q?RE1MKYs1/H7TYqKQAnHg4NnFUVXUFH5h+7g5TeBX+89CjaMfDgUJs9fvby7A?=
 =?us-ascii?Q?Djye1rW3FnjhIPiyP1aryxlEYcFJNJu+SAk0Gxar20m2+EaVKCh+A8E7aOzp?=
 =?us-ascii?Q?wQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f05d158-cd0c-402f-6169-08dcd1a5b0c8
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9565.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 14:34:34.6854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZiXL5d+BcK0fvvJBCnZvYgI/u0mhUjUQAVDQxwtrS3Ts/c7ksyZHCeogBaox1Q8DsxuUktZWn6a8KJJaqeLGDIwP2hELtu2T75iVm2+zcgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7557

From: Andrei Cherechesu <andrei.cherechesu@nxp.com>

This adds support for early printk debug via the NXP LINFlexD
UART controller.

Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
Signed-off-by: Peter van der Perk <peter.vander.perk@nxp.com>
---
 xen/arch/arm/Kconfig.debug           | 14 +++++++
 xen/arch/arm/arm64/debug-linflex.inc | 58 ++++++++++++++++++++++++++++
 2 files changed, 72 insertions(+)
 create mode 100644 xen/arch/arm/arm64/debug-linflex.inc

diff --git a/xen/arch/arm/Kconfig.debug b/xen/arch/arm/Kconfig.debug
index eec860e88e..a309f67f90 100644
--- a/xen/arch/arm/Kconfig.debug
+++ b/xen/arch/arm/Kconfig.debug
@@ -68,6 +68,16 @@ choice
 			provide the parameters for the i.MX LPUART rather than
 			selecting one of the platform specific options below if
 			you know the parameters for the port.
+	config EARLY_UART_CHOICE_LINFLEX
+		select EARLY_UART_LINFLEX
+		depends on ARM_64
+		bool "Early printk via NXP LINFlexD UART"
+		help
+			Say Y here if you wish the early printk to direct their
+			output to an NXP LINFlexD UART. You can use this option to
+			provide the parameters for the NXP LINFlexD UART rather than
+			selecting one of the platform specific options below if
+			you know the parameters for the port.
 	config EARLY_UART_CHOICE_MESON
 		select EARLY_UART_MESON
 		depends on ARM_64
@@ -199,6 +209,9 @@ config EARLY_UART_EXYNOS4210
 config EARLY_UART_IMX_LPUART
 	select EARLY_PRINTK
 	bool
+config EARLY_UART_LINFLEX
+	select EARLY_PRINTK
+	bool
 config EARLY_UART_MESON
 	select EARLY_PRINTK
 	bool
@@ -304,6 +317,7 @@ config EARLY_PRINTK_INC
 	default "debug-cadence.inc" if EARLY_UART_CADENCE
 	default "debug-exynos4210.inc" if EARLY_UART_EXYNOS4210
 	default "debug-imx-lpuart.inc" if EARLY_UART_IMX_LPUART
+	default "debug-linflex.inc" if EARLY_UART_LINFLEX
 	default "debug-meson.inc" if EARLY_UART_MESON
 	default "debug-mvebu.inc" if EARLY_UART_MVEBU
 	default "debug-pl011.inc" if EARLY_UART_PL011
diff --git a/xen/arch/arm/arm64/debug-linflex.inc b/xen/arch/arm/arm64/debug-linflex.inc
new file mode 100644
index 0000000000..6ed704e104
--- /dev/null
+++ b/xen/arch/arm/arm64/debug-linflex.inc
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * xen/arch/arm/arm64/debug-linflex.inc
+ *
+ * NXP LINFlexD UART specific debug code
+ *
+ * Andrei Cherechesu <andrei.cherechesu@nxp.com>
+ * Copyright 2018, 2021, 2023-2024 NXP
+ */
+
+#include <asm/asm_defns.h>
+#include <asm/linflex-uart.h>
+
+/*
+ * wait LINFlexD UART to be ready to transmit
+ * xb: register which contains the UART base address
+ * c: scratch register number
+ */
+.macro early_uart_ready xb, c
+    ldr   w\c, [\xb, #UARTCR]       /* <= Control Register */
+    and   w\c, w\c, #UARTCR_TFBM    /* Check Buffer/FIFO (0/1) Mode */
+    cbz   w\c, 2f                   /* Buffer Mode => return */
+1:
+    ldrb  w\c, [\xb, #UARTSR]       /* <= Status Register */
+    tst   w\c, #UARTSR_DTFTFF       /* FIFO Mode => Check DTF bit */
+    b.ne  1b
+2:
+.endm
+
+/*
+ * LINFlexD UART transmit character
+ * xb: register which contains the UART base address
+ * wt: register which contains the character to transmit
+ */
+.macro early_uart_transmit xb, wt
+    strb  \wt, [\xb, #BDRL]
+
+    ldr   \wt, [\xb, #UARTCR]       /* <= Control Register */
+    and   \wt, \wt, #UARTCR_TFBM    /* Check Buffer/FIFO (0/1) Mode */
+    cbnz  \wt, 2f                   /* FIFO Mode => goto exit */
+
+3:  /* Buffer Mode */
+    ldrb  \wt, [\xb, #UARTSR]       /* <= Status Register */
+    and   \wt, \wt, #UARTSR_DTFTFF  /* Check Transmission Completed */
+    cbz   \wt, 3b
+
+    ldr   \wt, [\xb, #UARTSR]       /* <= Status Register */
+    orr   \wt, \wt, #UARTSR_DTFTFF  /* Clear DTF bit */
+    str   \wt, [\xb, #UARTSR]
+2:
+.endm
+
+/*
+ * Local variables:
+ * mode: ASM
+ * indent-tabs-mode: nil
+ * End:
+ */
\ No newline at end of file
-- 
2.45.2


