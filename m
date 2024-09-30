Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A16098A110
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 13:48:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807252.1218596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svEsM-0000iM-46; Mon, 30 Sep 2024 11:47:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807252.1218596; Mon, 30 Sep 2024 11:47:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svEsM-0000gI-0c; Mon, 30 Sep 2024 11:47:38 +0000
Received: by outflank-mailman (input) for mailman id 807252;
 Mon, 30 Sep 2024 11:47:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=orP2=Q4=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1svEsK-0000Cy-KK
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 11:47:36 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20604.outbound.protection.outlook.com
 [2a01:111:f403:2613::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8e1ec86-7f21-11ef-a0ba-8be0dac302b0;
 Mon, 30 Sep 2024 13:47:35 +0200 (CEST)
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com (2603:10a6:102:26b::13)
 by AS8PR04MB8357.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 11:47:32 +0000
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709]) by PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709%4]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 11:47:32 +0000
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
X-Inumbo-ID: c8e1ec86-7f21-11ef-a0ba-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XnFL9mAX0A6+3PNmDCr3zbsV5TEaKxBBm11xZXDCVcP3i59NL0Pg9AokhWgMmse4EDWgKU0l4uVD53cjeTDMiz2OiP2jFV0rdrIFoSWXjgsJ/vWW/gjO8GW1g8O51IXJSWhaqOz9RwO1sxPHM1JET5dF+qR24Spc+JVkUzEQPy0qkla6iYdkY7pNIOuO8f3Xhmf9j49ycefg1GJ6rmYnRqNyfEpiCX9Z/p32qEmVm5N8x7LKivGBAXIYUwHjF6uFRU3AO2YyoVZZyu3kpRVeFxqDM1tt9cAq0QHD2il3x58ILdFEXy0YPsfMvfJS6LrorZVRNd50BO5sTTZU70wHfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XqXlCdVjUT3pnys22jpUDXfmJf7XqwEbQ1D4Bno9CNY=;
 b=k7033n+eqWqct7VXLGZtpV+jeHm3CkI+BJaCyltMuZJoK+1oWpC0VO+KtR9xN2meTUhKpfWMYgJasTBikTeGzOEie1kkEBZDzelNaoOQQbU2aQpM00an5aYTpZIwpLrh0GxUdMoeUisY3ns9OuQ1OQF+5wdXjtQL0SAW9riEzUrA2q3dZ1396lfxtxMTOfDLMExfZSF0JFblgRU5uGREJpKf2/Qxctl1/ZqrJdB+JO9sP2kjfYnDp6O7VljNnfrrUMHWfbrVxwWbVkE6L/d/i6doDPKWcf7y/EzHzzKiSG0FBzUHr1SqQChFsL6/BEJ1lWso9+SHbCzXvHL9a43aVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XqXlCdVjUT3pnys22jpUDXfmJf7XqwEbQ1D4Bno9CNY=;
 b=vKNQrVwCnup+P9M6CPo5ZktKx6m0TAhj4OdPbc1Fzu2kmC0I2kfIF6tEOmUmSAwXn2Am5aZY5OttmzOAPsI+r5bHkLJ8KZf0BGsLzRbkql59Rl/53IDogKwR6NSmHWti9QQFLXPBi9FWIAEWtZbi1oGIK4CRJEXUhDyk8thauKTvlah/C2EsTnbrIQvLQKsd3Luf7yutHm2Hj3eGTY8uZcPEJSjDT3BcUDWgOO0GU80VqibQPeF7Uoz6Kzo0YQiomRESnSUkV3Gx0Dzb4+UN0JWSyQskWJ/5kk+5I+a1YQSOxfP5Q9Cys1P2bcFbP4i3wjULKHSUZPmOXTDIi9NXWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
From: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
To: xen-devel@lists.xenproject.org
Cc: andrei.cherechesu@oss.nxp.com,
	S32@nxp.com,
	Andrei Cherechesu <andrei.cherechesu@nxp.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v2 2/8] xen/arm: Add NXP LINFlexD UART early printk support
Date: Mon, 30 Sep 2024 14:47:08 +0300
Message-ID: <20240930114715.642978-3-andrei.cherechesu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240930114715.642978-1-andrei.cherechesu@oss.nxp.com>
References: <20240930114715.642978-1-andrei.cherechesu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR10CA0016.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::26) To PA4PR04MB9565.eurprd04.prod.outlook.com
 (2603:10a6:102:26b::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9565:EE_|AS8PR04MB8357:EE_
X-MS-Office365-Filtering-Correlation-Id: 11fbbcbf-a3b8-4934-f894-08dce145ab64
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RsYE4EDMQwmD93BnqXN7njHfjj1rOK///GDoy2PxInVmbWPRgaNlvAYQ0wdP?=
 =?us-ascii?Q?fC1xT38Wh3H4yu9K+No+R3vXIkQtmlU5OZ7PN9T6hRABNHxw/lAYZvEDTMlz?=
 =?us-ascii?Q?THk1T+N+1XzxYWhEY2rGWazqtNmQcLqXY1tOHe4moTZbJCqHvrmvyv/u7y+g?=
 =?us-ascii?Q?V5VRXVMtsVUP8P8heUjoDIEplz+nQSmQU2DDFp9afazNle6DTKUfcEOJSV8v?=
 =?us-ascii?Q?QKGQC/9zGcEC25tJu1GEMsYDVG9vK2I1VWpX8lrYuRALhSGc7RiXlaovHgu9?=
 =?us-ascii?Q?D4vJ+u/e396ysnebSJULdBciI+E1FhCP7Iu/x6gXMQtT/EHiGPkp4WDeDvIc?=
 =?us-ascii?Q?sUv87Tfu8JYptKGCWVIkf0ACjGg4LMy3Xp9zzb/2CrMHNanQkOBoV9ZLX9G6?=
 =?us-ascii?Q?6UhQXtSguOLq0KpWFS1yc8pOEqz/YIGecjuzvZotHiWka7wOY22XzHlnKZ5Z?=
 =?us-ascii?Q?jyKbpnvbc9F1cv8mshz+TyyxMLgMVAwqMz7N9Rp9zWRyFkNYSY/qjZd/Yewo?=
 =?us-ascii?Q?mijA9MR6BOOsp5M9OWLyFCeRbQ74ECYO22qJIsYd+ftWsGcqcE4pNeLtgQK1?=
 =?us-ascii?Q?+pmEHrCgUT36cadjF6wkCbhvQYvu9n9lkPMf99d57JatBRBRyCR/a9IlmrnK?=
 =?us-ascii?Q?/LcLQEPbUZ53wOvgRzec/E/g9GWb4ounpzccbWXIFWdHnTXeKbmiysom9Vby?=
 =?us-ascii?Q?4KZbn4VbQEesUXCWk7IKJdAOYytck7lH7JaTeG071A2gSzAvQ6qWHWL1jyKi?=
 =?us-ascii?Q?3Alk09c91YTllIru8hNA4Lt+r7qG5jBxM2y/pgu6rbrClVSgvLtVywSQB39z?=
 =?us-ascii?Q?9UuktIacMmq4nJnZOIdJcPWnkfIuY+SuvP006XXP6sWeNVm8RWIJlkzZdTeK?=
 =?us-ascii?Q?Xgr9NYB+pQT0jH8Betw64zuMt6dFRuFimz1bLPBDKImR6GnYTuujyI9q3Zzi?=
 =?us-ascii?Q?e3/kQP8tp2g3QQVT84iVTBFJ2lUnLTtbUvpGvuGcHlJtmGMFk7lnj+K/I5ZJ?=
 =?us-ascii?Q?b+54za7Ug04w4joID5Pdb/88LP3KNf5YwRG5allRVTJ3/GvR3tA9gZYBNGcI?=
 =?us-ascii?Q?7pUgiEaLJLsDn6K5pWN/7HSsJygZjRQzQnlzIxa7o4/ATAVc7SzIYU+9q9PN?=
 =?us-ascii?Q?uEHX6enm8YtbAkkHiJTFpUQ76S3zbztyI5/qbivV3lqAmJzPwlwi1MhI25nG?=
 =?us-ascii?Q?6BKJXCn5sG8L76Kc1RISlhPwKWUufKxy1+sWfwSvnO9yFz++BncMW4cO6sdc?=
 =?us-ascii?Q?pHLUxOsKsmYdmN2LsYCd84dWs6f+9MFJi5MpiyIGxXRrrhcGZ3GdZRlISfd5?=
 =?us-ascii?Q?lz8K7Z4rSkIQgCyK26aFn9zx4g6sOxCbJY2xqrWoZHqx+A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9565.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bxyLSXUGR+CSjGtt8M8P+1rnKyTUiIDotuJyfPriDkbnyqRQ3VCrmPhfRmfL?=
 =?us-ascii?Q?Af1xOiO8GbDD4cY55LJSPJvK4u9hfgPSCNBnEMwDTdQkr2LCJ/xjxCXMxLE6?=
 =?us-ascii?Q?gu4t2aBw6UxMXLNjgYyZVNmegqTcS/0lIwqIqysA+yYw3MsOZcZJZGDEeKT0?=
 =?us-ascii?Q?Z2U7WcntVj6nw/Xm3ZSCAzfmEJ0iusmP6gmBJufNSk7WBBK7R9NvPGenptfE?=
 =?us-ascii?Q?xCBGEtyMvpCfSJB4Slqy9nNMvoEN0AzTgobCqnnJjZlmqF/WYMDz+p/oksIy?=
 =?us-ascii?Q?Mk9glV7y468ydKrPqSrKWyAyM3RLueGaE7FFqb3TgaufocCgLGx5Udx24l2x?=
 =?us-ascii?Q?ipRqvTJCReROD51lbmNbJK2FkdZGmlFydJswf8FcQGCKzC7ZCZ+0ThIX8tY3?=
 =?us-ascii?Q?x3FCl5EKPN9ooKeY6d9HnPfgJLLnWSAkD1Z9UANjP9DiJQb2USnJsL0vpM/P?=
 =?us-ascii?Q?Wt4Q7KcP4Yl8qPtY0Ltdu3XI+3fakJRYKfNSCWxuVp3+MiEkLDXztw1amFDx?=
 =?us-ascii?Q?u3kZ0p/hx2OCp2ziQofyf6NMj94BCSl8N7RNi29H60uiEOHtElPBe7oYeyO0?=
 =?us-ascii?Q?+Ie4hIoTDqWhoVmoZm4ykp7kvqY68NnugPuDWSn4KBV7vXBjimQROKgSJQvH?=
 =?us-ascii?Q?3lX1Rvsl6z8ImwoYuLX1RTv/0V+WY4PblnX6LsIQ7dgb7B3etMbBnCWu5mQO?=
 =?us-ascii?Q?0bPQeipjSy1/ZdhsHaO9IL6WNaWWLf1FI+Xvl16MrwxSJEliKesFE4F49dkk?=
 =?us-ascii?Q?ekcUrpw1tWHQZQKirhQguqDC71NCQsYbUSDBj6LjvuhU/XQ3lnudUtNBw3RR?=
 =?us-ascii?Q?N2tss4XgqPxzL1nUiwJnPVv0Q3CwqInnc1qhO+qW7Sv3p8MKfAZdTI9lwojz?=
 =?us-ascii?Q?OODLg37cpk4CzWsmaofldTsqo5I9Hovm3fOMH/hrDD8Nwv/pi4bzUpP+9hVl?=
 =?us-ascii?Q?nAQPm5rG91nrxx3j73J9TDExoaZ46fs65TJJoxgtKpXUJBfWthIwEJM+mWGG?=
 =?us-ascii?Q?7iP0/z+mO3lxidyuu+ctRqbSO/pC2WlY3iwWcA8DIVVoitxnYuKOJYs2I33w?=
 =?us-ascii?Q?7CDyYO96EgRlLLmkfkaUbwckxQlbfybvG+K/Wn/EgsCoct8Q2uztcaT7gJo6?=
 =?us-ascii?Q?AofCAoOTReukVsUMRmEmCK2Em/iNkuIhmPylIw/qh8+pCLHVGb/Z3G40sETn?=
 =?us-ascii?Q?a4xq00kclYQxvSsQDPkq0g6GLSIoAWkAOo/cqyDldHxP9INSFJecljOTruRy?=
 =?us-ascii?Q?uVL0auNUJUhEJo4vhLPaft68Y8we+DUg6Xn9Crb/mivwogg8BM/yMrIDeN8q?=
 =?us-ascii?Q?juN9wiimLQ870SipyyYnC1QRpb1Iskjd0QTNSdbtX5nZDajAa3Rv18iFxvXQ?=
 =?us-ascii?Q?R7XSIBtPOZe3J3YFvArCZSHFxZcEhfc38AvjkgOlaWSyUlP5dpXAP99xOgUY?=
 =?us-ascii?Q?Gh3FBe12DTfICdrJWSmqc9zJXe3cv5LF1lG4Z7C2AkvKdhwGJ0IwqnV/eGVL?=
 =?us-ascii?Q?OnvvqvUzBgUEIm3W71p6jKLmgAsN8IBqF1cLBdA2QQMrZnFJ4EZbX1reHcaM?=
 =?us-ascii?Q?x6qJDJOhB5JSdKveXVzsZTgw6Bu84dsZ5aQLX5CStkJIUuotblItIJIFBU+f?=
 =?us-ascii?Q?Iw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11fbbcbf-a3b8-4934-f894-08dce145ab64
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9565.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 11:47:32.6137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RivES07KSmjU35HVIKyjgIz9UJSNM6nWeKhqP8Z+6/vSyCDrGow4OlM1OQaaKX8hMSey5ilRPb4CquXF+jMV3rusTZKhFy1OOnNinJgpzgI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8357

From: Andrei Cherechesu <andrei.cherechesu@nxp.com>

This adds support for early printk debug via the NXP LINFlexD
UART controller.

Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
Signed-off-by: Peter van der Perk <peter.vander.perk@nxp.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/Kconfig.debug           | 12 ++++++
 xen/arch/arm/arm64/debug-linflex.inc | 58 ++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+)
 create mode 100644 xen/arch/arm/arm64/debug-linflex.inc

diff --git a/xen/arch/arm/Kconfig.debug b/xen/arch/arm/Kconfig.debug
index 2fa0acd2a3..7660e599c0 100644
--- a/xen/arch/arm/Kconfig.debug
+++ b/xen/arch/arm/Kconfig.debug
@@ -44,6 +44,14 @@ choice
 			Say Y here if you wish the early printk to direct their
 			output to a i.MX LPUART.
 
+	config EARLY_UART_CHOICE_LINFLEX
+		select EARLY_UART_LINFLEX
+		depends on ARM_64
+		bool "Early printk via NXP LINFlexD UART"
+		help
+			Say Y here if you wish the early printk to direct their
+			output to an NXP LINFlexD UART.
+
 	config EARLY_UART_CHOICE_MESON
 		select EARLY_UART_MESON
 		depends on ARM_64
@@ -89,6 +97,9 @@ config EARLY_UART_EXYNOS4210
 config EARLY_UART_IMX_LPUART
 	select EARLY_PRINTK
 	bool
+config EARLY_UART_LINFLEX
+	select EARLY_PRINTK
+	bool
 config EARLY_UART_MESON
 	select EARLY_PRINTK
 	bool
@@ -167,6 +178,7 @@ config EARLY_PRINTK_INC
 	default "debug-cadence.inc" if EARLY_UART_CADENCE
 	default "debug-exynos4210.inc" if EARLY_UART_EXYNOS4210
 	default "debug-imx-lpuart.inc" if EARLY_UART_IMX_LPUART
+	default "debug-linflex.inc" if EARLY_UART_LINFLEX
 	default "debug-meson.inc" if EARLY_UART_MESON
 	default "debug-mvebu.inc" if EARLY_UART_MVEBU
 	default "debug-pl011.inc" if EARLY_UART_PL011
diff --git a/xen/arch/arm/arm64/debug-linflex.inc b/xen/arch/arm/arm64/debug-linflex.inc
new file mode 100644
index 0000000000..cf4f5ce224
--- /dev/null
+++ b/xen/arch/arm/arm64/debug-linflex.inc
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
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
-- 
2.45.2


