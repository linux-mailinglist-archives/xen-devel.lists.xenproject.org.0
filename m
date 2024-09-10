Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 504629739FA
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 16:35:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795663.1205108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so1x3-0006QK-PU; Tue, 10 Sep 2024 14:34:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795663.1205108; Tue, 10 Sep 2024 14:34:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so1x3-0006NA-JE; Tue, 10 Sep 2024 14:34:41 +0000
Received: by outflank-mailman (input) for mailman id 795663;
 Tue, 10 Sep 2024 14:34:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FMfA=QI=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1so1x2-0005Zc-9z
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 14:34:40 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100000.outbound.protection.outlook.com
 [2a01:111:f403:c201::])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf976920-6f81-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 16:34:39 +0200 (CEST)
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com (2603:10a6:102:26b::13)
 by AS8PR04MB7557.eurprd04.prod.outlook.com (2603:10a6:20b:294::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Tue, 10 Sep
 2024 14:34:36 +0000
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709]) by PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709%4]) with mapi id 15.20.7939.017; Tue, 10 Sep 2024
 14:34:36 +0000
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
X-Inumbo-ID: cf976920-6f81-11ef-a0b5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CgW4wGjH35aQLv5AuPm221lwhmdA86TnBn23zotRrhsZJUtrSzu3A5ygtLp139jHEPJshSU01DXzmZT4ziiRwY/7AiggyXL9qkiUBPYXpFJhlzEnsKHGc/P0dunh7uob/toZ23cxHXX2mY9Y4QMJeE73DWAgXFRiMP/m+YqkEWrFa/7yK6wN2HcKEA7V+bHvW3iXiAZQBv/mG43UoCQGkb4X4HjK0zIgpNy5POJXOgj8+Bz27WevCbyVe/v/UzTbXYs/+0KR5Sh+1CkaXvHR7rYUjll1re6CxvJygrLOoByd1KKgKnApnqz4TVnfDTrCfVgsGjJM7CsyaymDKunm+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UO5KBFZz/KdCTUZRSQwTx6QNHVXbOXMluYbVu8Z7lic=;
 b=enTdU5ktxm/7Kgm/kAi9Imc49I9oTGhnzzWf5fiDZjWBqcvNTuVLjAeSF7GcUIGAQDTNzsNJctgGARaQ/+M5gH1cNCudibjDRLdXHStQpDdCuYdWZ3fPPFWLwYj1nCPvVEjDnGNv+4+PsHGBN6njku18Kt6wNAWiZOPk5GJCqB1CZ47TLfnYJXb6k1CXDN87686x8WScE3lHlkLmXK2JQWPUjcboiUvFACMHbd9g85JAq5uAgnCzWQETJEJzjADiQ3N7L6GGw4It03hK7ICAcLcR4CLmkgKZE1TTDknh66epD5HB+S8o15z0nR8rOwEjbdF7ADhc4C61yuwjXGFrog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UO5KBFZz/KdCTUZRSQwTx6QNHVXbOXMluYbVu8Z7lic=;
 b=CQaPUrydyQaxJYFd2Zl4jRYC2WUoZcx26VSPdQ8N7OXOz2toIwyDC4cFvYMAsW9ggR8+XZaqWidSA0oSaGCv1twEZbTF/JWCmgfek+VbTe5tiotBW6Rc8HvX5ewbu/Ro9fwkZsnNiD4RLgsDgue1nkTGC6KLQqZ99PgZESL5UnzJPIooLMHTBDfuHQj8jhjZW5j/iizyHJAQSVPWyItZk/eGFiSLLOHNwTj9vnDxrkeZu9SJx8PVgr0CLdHrKsdgTVMKD1yFcdbMls8LCaHz3hADJm4MpQVtQ2wK8kuVRfqcioqvP2jciM2fJCtRTwN222OVQYungkr2qmEyIft3qw==
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
Subject: [PATCH v1 4/5] xen/arm: Enable early printk for S32CC via LINFlexD UART
Date: Tue, 10 Sep 2024 17:34:10 +0300
Message-ID: <20240910143411.178704-5-andrei.cherechesu@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: cd2c4e19-a358-487c-13bf-08dcd1a5b201
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IC2mtPeZTGZVOhC59l/ynVrVu4QQwKAqZzx9595lKEw50k5w9yTWW2pMbHIL?=
 =?us-ascii?Q?OQboXOrCptL7v+Sjq2oMpzy619zOZTb9poYLQtB6DD2yjiK4B+12SLgA8Vrz?=
 =?us-ascii?Q?sm0h6wRAflbUK0FAheP5WE0bk21/1Rh7ZSnCbALGDdJdr0tuzOtxpK2auezK?=
 =?us-ascii?Q?ICLT3JVNrLbSGmhMKUeFTP46hsu8p4cYkIlH3yms8aDT5n3HMiuIngjTVP/P?=
 =?us-ascii?Q?qGJqhtLd2CSHAMZBMxwBVF7r0EmPCmfb9iUl6abhO4wW+qKHezH16KLp54Tw?=
 =?us-ascii?Q?LbFhBG0RtgtpFRMHzmqTnFmuPh3IH1zW3zmwjFEGM31VB5H+7t8elNFwV2Zu?=
 =?us-ascii?Q?HTWA+ExHisEdinsq1285zVEXh98slLWv5186fpL8ddcdmtQVIKc7FFMEHGaA?=
 =?us-ascii?Q?La5K/CQQY3jTfR8hDEVMHYGFRSCnJzG4wAxA2lrBgMLKkyCa7QRvb2VIgZnW?=
 =?us-ascii?Q?KnD+Wrs+tegfVc2xLfOouEpF6vTKvfqsSF6s3JxqT1FYSQ2BaWva1AsOo2Sp?=
 =?us-ascii?Q?pysux1J3hdO9xhKPbRqQ9F5xKfTWsSwv/LsltHlGSjJfUtMZUjMU6Ecvv30j?=
 =?us-ascii?Q?S5fPY87DEure0QlfOEnACwzD2T2lFfD2KbX2ZgZ+/IjcMGyMOqvGEzww52PO?=
 =?us-ascii?Q?OD72SuNTCQI90MILGcftK+aycZ4nJ5xdkcOYvq94TnwQB+270VtVUXBn6xvz?=
 =?us-ascii?Q?4P5RzMHBlGAznBisqTHmek5Q7Bncu/W43ZohFwo9cvw0Iky7LoAMi+qezHKz?=
 =?us-ascii?Q?k64mZ0rv6QOOoj+qFnIryiOUHKoTXX7BfSN0ggyWaJCjXIiu8GgQuZJV2Eu3?=
 =?us-ascii?Q?bw2+CsaALPIlJhi+MrmraJvd8sPdCj6RLMYbZmAeN4K3VxLAkipsZLgb5MLx?=
 =?us-ascii?Q?M1L1ZI5l2iwuOOpUDFKvydYcj6LMVdguEbWxrYrHaAWqIr0t8d1FgcXlEtIH?=
 =?us-ascii?Q?HsBCb7DE84QKpLY5HzjWd/BPrSImZQfiqn/yQ2j80Nb0o/C9bzn5HGMdMLCT?=
 =?us-ascii?Q?OpS7LPk7QzkuOjKsSh/4iHiuVmKwzJGwpsE3yhseAcqZcgkQCZao2fViipe0?=
 =?us-ascii?Q?BDW9vHM3q4kCJDHDxgSizxWPmP9gCqEWKXztE3M61uyiwvpjkSqxfpg3YNNb?=
 =?us-ascii?Q?f3tOk+uJdC9Prm6LGQXFzWunFlnQyXsmBpwQQaS4J8xZSx0JPlTpUEllSi7T?=
 =?us-ascii?Q?YJ0Eih8eWc+y1ueuFMtcLE6/yro3Tc1Yctw8H3hdZ7Fj4bYiRV0bDDFeSitI?=
 =?us-ascii?Q?C3yHiyo7rL9Q4UYQwszqHPHFjWr9CxBUZ2YKC5dLhjYXn1PW+mBkWlfw0xuc?=
 =?us-ascii?Q?dmcQDnhs/Hk4ydgMSqJeBFsU7osfb25Fgn2QPU6kdnNHtR+DDJSctnCTv54c?=
 =?us-ascii?Q?Abrth/6IV4AfZusflVol9SDusW7oI3ewsmHfv7NGkOrREaHUjg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9565.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ML/LXXcStMqKubG+cY8AkLxMPhFajZ8MvCG3P7IZJddMGjlcXHqN9sl4xa/j?=
 =?us-ascii?Q?ZKHodyVKHlxYhOGsAxhWRD5zXgcR92cDnLxHT+xuGs7gFEVjyiHpYqlvQLCB?=
 =?us-ascii?Q?R39enfYYoBt87om+GD2xDxFA7h3HN/sU/W5z6BanxDR/5DbMoQBjcZonnzus?=
 =?us-ascii?Q?jbnlohSYjd1EoSBhi1ds3k4AED+woo+psJRxWdAe7Y0uQSNcCREBIpy/9/uj?=
 =?us-ascii?Q?J9LkQ4d0/0XKzAbatq8Yqi68Uyk4WPQ89Y29IYZbjPVCwmxhQagEGr4VTrlC?=
 =?us-ascii?Q?mWfTm05pehATfigpvlKZQClcpnrvoxCAastXmGUW+gd5i35+7MhW2GzK58EW?=
 =?us-ascii?Q?xvxuus9yu19z1STxc5D+RG3GRDWCk6Ty3SZaWV4zuj7rZg9kpuRSrq4T9rrj?=
 =?us-ascii?Q?fmassN8iWcpyeVJOt8jybGRCl5iEqcVsvZT2zl9ZoEhfsQeSLnsBn4GPTPAP?=
 =?us-ascii?Q?7rl1RKEl9Y8F+9z/t1O/9CSFnC3KRvmuu7aHb5o0bvJPPh7fqrONVi6QRByk?=
 =?us-ascii?Q?xXCiy2FTIHufVjMNFoyog4H9T1K/igU9o10Xow4sMWq4OhpEkeEmEV2v3YPd?=
 =?us-ascii?Q?OpgRxe1+7g5mw5wBkOsZ7zbsfYqiJPzQOmZA/gzvznxn973SprKr5SBLWivG?=
 =?us-ascii?Q?jlun7vKkTBrJnWwK7ybhjU7UQn9tOcIHnyrd/NZDw2tq3HlK12VbBD+JwiKE?=
 =?us-ascii?Q?7LPuJopmYIpbS+scxRrLkEF6NLfcCg+OEMSIEYPBGES7BdVHD4+Un06p5PWv?=
 =?us-ascii?Q?SR9S+O+5WGbqNCFX+Xp8+s6g31v3yZMtSGbVeTyWNGkBgQWjWMeQDxzZEqZh?=
 =?us-ascii?Q?XeY+zXpn5b0nbMX10P7s3BdbbmIWHYYaeNTe/YJpGnfIyqt1LJ2Mj8w0yjrT?=
 =?us-ascii?Q?ZPYp/A8VjeLx0AdCbbbd+69RbwZYehkRn2A1pXGU9I0evn4OTOuGW6dpDN+1?=
 =?us-ascii?Q?GUoL9vU99Uj220Ik8ZCiQXHZRJwjS7CRw9huoeLuHzyQ1OzC7HEgycXemiRn?=
 =?us-ascii?Q?OA4eeuA4ylZiuz/SFbBwR0WIvFI5vu5BJ+6+tehVu0nfQjn2rLfxnaUvw5hx?=
 =?us-ascii?Q?suBUymFqtR9+QIiujdVEB3FRgaRODXKBa8hc414Ck70v1fS8kknIHARcuhjD?=
 =?us-ascii?Q?7GeYpEoQpEWUND2vlD+Td8cYXDVIBxziRiLMP49xxUefztcSicXgLooBFNRl?=
 =?us-ascii?Q?cn7zNOSfuQFZ3wiCcMSDkAziPZRzjZk9YphjLQUvG6+W+Qv6zo5ftqsYLcKe?=
 =?us-ascii?Q?k1pVjqJZ7+aaEt+a3i/DidhiOOmyGy88m47pkyJkvNxrjg4H3mNbw7zHHf0D?=
 =?us-ascii?Q?is/ZZPXyaZ5E0XNUjNfLYVCw/82RdLrrkfRo3o6ENLZbbP1Z+8gEgctvZAbL?=
 =?us-ascii?Q?WYNkTvwbMm3Y6LZq1nyZUZC32MG5V65+iEUu2qGnogkAbWSple5/VdY1ysKE?=
 =?us-ascii?Q?vYMn1/mkEcke6xrYZW4/BaaZ8ShevD99C846fEkMgf+0rZG4P1uH5gl6Rcqu?=
 =?us-ascii?Q?3rLXGeW9iXtGnAJWyNNsRT/7jPMRiCSUUAdhKrbgcC3g1VuD4dD1vQ2mLjwL?=
 =?us-ascii?Q?aPpiItVDE8/b3EwjyFAEfqHg794rT+NaCvF+BcnxkikVEcnqIMGDssAIZON8?=
 =?us-ascii?Q?KQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd2c4e19-a358-487c-13bf-08dcd1a5b201
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9565.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 14:34:36.7676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MHHCRTyLG3C5uPcXwR2gFB/mHpdexSnewGmo+qQnzccqmoExVQAlG5XnL6myk+wHdWdCM9uPOtrdP1B2xTA8oWH5QlhPAP2DIHhExd3qohk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7557

From: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Enabled the support for debug through early printk on S32CC
platforms via the NXP LINFlexD UART driver.

Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
---
 xen/arch/arm/Kconfig.debug | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/arm/Kconfig.debug b/xen/arch/arm/Kconfig.debug
index a309f67f90..9725f4193c 100644
--- a/xen/arch/arm/Kconfig.debug
+++ b/xen/arch/arm/Kconfig.debug
@@ -168,6 +168,9 @@ choice
 	config EARLY_PRINTK_RCAR3
 		bool "Early printk with SCIF2 on Renesas R-Car Gen3 processors"
 		select EARLY_UART_SCIF
+	config EARLY_PRINTK_S32CC
+		bool "Early printk with NXP LINFlexD UART on NXP S32CC processors"
+		select EARLY_UART_LINFLEX
 	config EARLY_PRINTK_SEATTLE
 		bool "Early printk with pl011 for AMD Seattle processor"
 		select EARLY_UART_PL011
@@ -243,6 +246,7 @@ config EARLY_UART_BASE_ADDRESS
 	default 0xd0012000 if EARLY_PRINTK_MVEBU
 	default 0x48020000 if EARLY_PRINTK_OMAP5432
 	default 0xe6e88000 if EARLY_PRINTK_RCAR3
+	default 0x401c8000 if EARLY_PRINTK_S32CC
 	default 0xe1010000 if EARLY_PRINTK_SEATTLE
 	default 0x01c28000 if EARLY_PRINTK_SUN6I
 	default 0x01c28000 if EARLY_PRINTK_SUN7I
-- 
2.45.2


