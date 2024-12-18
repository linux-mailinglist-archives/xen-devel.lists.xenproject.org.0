Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AA29F6270
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 11:12:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860098.1272189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNr2l-0006qU-G3; Wed, 18 Dec 2024 10:12:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860098.1272189; Wed, 18 Dec 2024 10:12:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNr2l-0006kX-6Q; Wed, 18 Dec 2024 10:12:39 +0000
Received: by outflank-mailman (input) for mailman id 860098;
 Wed, 18 Dec 2024 10:12:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M/38=TL=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1tNr2k-0006CD-6G
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 10:12:38 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20614.outbound.protection.outlook.com
 [2a01:111:f403:2612::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ac266a9-bd28-11ef-99a3-01e77a169b0f;
 Wed, 18 Dec 2024 11:12:36 +0100 (CET)
Received: from DU0PR04MB9561.eurprd04.prod.outlook.com (2603:10a6:10:312::7)
 by VI1PR04MB10026.eurprd04.prod.outlook.com (2603:10a6:800:1df::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Wed, 18 Dec
 2024 10:12:30 +0000
Received: from DU0PR04MB9561.eurprd04.prod.outlook.com
 ([fe80::9808:be1a:b32:173f]) by DU0PR04MB9561.eurprd04.prod.outlook.com
 ([fe80::9808:be1a:b32:173f%6]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 10:12:30 +0000
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
X-Inumbo-ID: 9ac266a9-bd28-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IbOIIHWVsdGMr/RzIBs4sX4aUakJNDG7i5Hdmxo8EBLRdoHX75yrQ6HcTaQHplrKZg8KjFSYcZ1RPXJYOqJuSB53tkJmLSq7J7wSEy2vB2t/b6HDYtkt/MYVzn6wm7bihVGMbP0ktPRFIT2xWhzI912U640mP40Rqw1/tvXGcSsVjGjKVUBbVC6g6RdvUmlGS6NvPsubAJ9Jdap5hh2Bb8us4rGbk9Z6oIVJ0SlpCPucOCzIylrvZcLm9NyyjcrsG3O/WeUNpvM+cQGeXdyZmPDasD9wakmMQR9+AHp4mJ234HNHxBHx7oKBV13wfoSWzmXxN2VWrwkMVUE40Y6oGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LRb12Uxal/A5sZn+ymF9X7NeFCk+iQiwRZcfXUwRiQ8=;
 b=kA/Dk359FARQmcw4QaZe/S3+jTsjrFHrISb8mfRFWNRhtUjza4cDhwO/oKJPO6x8TWbIdDck716LS0rUwYECXgylJT5pHZGDjMFcFQm4/QdXw8rssWepzqMt67ZzttnU2+cS2/+teLvOXzwjfSgu7ZIHS0KsPCfzX26JdFTZU/bO10+JjZEEhoK8lDQtCDYXf5cKnDmUco+rR0vzPyB/QedZbre6QHT4t+qfk42IgXfzbC+w/wWQHn+j9rIOuVGN6ai8loBreNuuoGyM44WO3fF/yy0TGrg3EKGprC6j1RqeQUAQpmAUnNDvVqLNOvkMMmAvIQJaf/vF7zDoV+XhUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRb12Uxal/A5sZn+ymF9X7NeFCk+iQiwRZcfXUwRiQ8=;
 b=qUgjug18f2iqMT8w1IFgCRj3crjC7E63NtEPR4sUqPQklYsOpD2AttVP3RaMtC1bZmBYLPEnR/ObOLmzT3CO1ZhxOPKPZmUaiBDGh+qGFYs+n9PI81/hNxAr1w21GDeMU9CU0Jrj05uUYVDcU/x5PiomdRtrfJSemkajX0CrkwoxBHsoJEG5OGe3ejtlWMirFZMAtEiNAp4PERovM6JIKlQ3LXSmaQdUxSgBBRlU9UFFHHOMNMUBVEWhZYOFwnquqQ97sZclnPSvd08GM+7FOoR83CIriCvR0E5jIAQLa2ZndVFqV1DZKSFjAfl7mHvDKcqaxMAPTPbpSz9jz4gA7A==
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
Subject: [PATCH v3 3/6] xen/arm: platforms: Add NXP S32G3 Processors config
Date: Wed, 18 Dec 2024 12:11:38 +0200
Message-ID: <20241218101142.1552618-4-andrei.cherechesu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241218101142.1552618-1-andrei.cherechesu@oss.nxp.com>
References: <20241218101142.1552618-1-andrei.cherechesu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR02CA0228.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::35) To DU0PR04MB9561.eurprd04.prod.outlook.com
 (2603:10a6:10:312::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9561:EE_|VI1PR04MB10026:EE_
X-MS-Office365-Filtering-Correlation-Id: 291be8be-45a4-4c64-6e7a-08dd1f4c7b7e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SlBRvxT23KSu13l9g76fDbE/tq5nO426Y3QM7S7I1BdCtqgxDTuvkKScGl4+?=
 =?us-ascii?Q?9qIiA9dIDSkV80bbzUnGy97tvHJxzGZkqrKK0rjSkG1jt67plQK6yY8lRf+3?=
 =?us-ascii?Q?GVjDUgEYNnVBfnJKLqEN7FmbVVWuFWnSbk4kfahU5v+rlmwQ7JfdYqesOYBO?=
 =?us-ascii?Q?ZoNX35r/UoARpyDDjhfoXsEEatg6Z+lJ1o7R+wLZ6PSj3ZzSTTuGCgjmQ9nc?=
 =?us-ascii?Q?gx/1HEom486u97/zMZxawx6MpcsRByG9v0MZrSRhYnDkTjVr1fLhftndf9rs?=
 =?us-ascii?Q?Z4lm/Of8jilS9JHo/OcP5QFnspadgFVZvgmwKPxCX2MMGJj1rviZdq3IZJmG?=
 =?us-ascii?Q?T0yU429V+ty+86q1jq9zGAIm0TRF6MPjgjYHtk255S6ABccw0rK1wEp9zLAT?=
 =?us-ascii?Q?aUReKLg5JjfgBWE2MKRTwwDysjeAtYJFc+A54i20FzTz+1tnw3EEuHPUT4b8?=
 =?us-ascii?Q?aRHFZZPZLso7fSexoThgaFNqdhrfl9XFLq0bXJJt2TmoRFLg15NGjPpGaImN?=
 =?us-ascii?Q?dy9eGQ6kGmqNZcr7KENrgLxiDBknNgNDAQp4+K/4AjWtBCPm6273QVmUzGu/?=
 =?us-ascii?Q?nhWDFE6v3wBA1RMmguwtrCCyKGneoIW28rQkijNKj+/fApkj+ZI6lnpwwNmz?=
 =?us-ascii?Q?qK5EjrUSATgth4wUBUc/T6KlsGu2RT4kqen3XrU27DlAnY+1lmhlSLqwJPni?=
 =?us-ascii?Q?/RUxNSCqYeUbPT1gFhswFvpOmDlfJQmlPWSkTlGETPDL3mqWK9cNle22QVBJ?=
 =?us-ascii?Q?a6UHm5c+5MHvkts6rsKzflFXHXmj6XjSpd59w6pxvS/aVNuUnvb0tDmXyd0D?=
 =?us-ascii?Q?VXsJtOGCKfB/faO7CPYLv195oFHHWBidBLVSZlRJyiQ8yC8Ta2yjK7HdeBWt?=
 =?us-ascii?Q?kgxq/DDGu3w4B7mdvDknZ1/0stkS5UT9pecMeRp7En0FnjOLPSRalec9lTrU?=
 =?us-ascii?Q?BDx9oKsVvUJ6Dt3UP5J7/fiJJG55d+aTeREj4ctwKtZpefSEEN4EZPRIm7zk?=
 =?us-ascii?Q?/jhnki8liofQA4VdUgse7cvJOY6Gn2SUNpVY9dx4KzPYZpZtYurXfAf6VBAy?=
 =?us-ascii?Q?BrrkHTWaD4P1jteBQ+YBYSWIlqcI8ruGgH9BoWA34BXuh/G5XQOl70hystDF?=
 =?us-ascii?Q?imgjr7pB09dc5ifekvGPQ+dLz70z8urTa9siNaK5gu1SsLyEtj1hygoeBaPM?=
 =?us-ascii?Q?Hcs2tWGJm8MPoiqaIpf2kzpQiISBWRz2Szo4NZewM1FbgnNQgegn/hsnpGOp?=
 =?us-ascii?Q?551TLfzwPz3QJDgKy0oaBpUWeP1xGVcM0fxYAkOHO0lnROhYQDVKCwZ9HaFA?=
 =?us-ascii?Q?a/0PnVyb/uRhoDqsGN9vTWkXpC2p4rGi9Pk64M+4nMiPXsnEw/cpK5SAnWda?=
 =?us-ascii?Q?UDfyMu2ycCZ2vEY1VJocjGFPiLnbHvyb4DsxDmIwIK9JAPyYdCEv5HJh44YZ?=
 =?us-ascii?Q?rHN3MKTKq/Hrb0XxCHMI8jhjVmD0k7Tt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9561.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AUufk3eTSccV4vDLH1DcTcggEkLlWOjQEEZC+AJf+D6wFY24c9/CUgFMT+qF?=
 =?us-ascii?Q?pfHh3zEbR2rNHPaP4c2B/zTaq5i/7cCoOfzOJ0KuQy5G5ljVaLpirBQ32xNP?=
 =?us-ascii?Q?oIeZS0pocKAEtomDHL4Y+MaMsBz1ahnW+V2ki8/E45C7B+dOxwvxkc61hJAQ?=
 =?us-ascii?Q?AEgZVve3o1A8s/ICszoIobwOBMoPnXS81SfvS0l4nhV7G3IP1qtDAmHbcwUt?=
 =?us-ascii?Q?70lm04yYUjyAc1Acb6EvolZ/niKvoiMpVM20NWZngv2tt7hS6J/L12nEszai?=
 =?us-ascii?Q?u8RBa0fzaK3Z3OsrAYnBjUczeMVwFhnYUsdFAhZIAX0W7dRgm0+8+FjpDrhF?=
 =?us-ascii?Q?X35EOkeydbSxtIZAGaV1tdv4a58YH4NX5GYvc7sj/xJzE/Sf6IrMatPByAmU?=
 =?us-ascii?Q?LadQEjRnBtOzRi7Pg6aAwFfTzNYYIkn4H0tuFVvwlAnmBnpFQrzUklmlJIas?=
 =?us-ascii?Q?y2wU+SykZB5aW5ea7coF+vyCpOTb99xP6SDFDH9JOLvc7iL76Ut36de3PLxk?=
 =?us-ascii?Q?98b7JIK9p+FXKpURZ0logH6tzYirkqvBydl6L7Hw4bCUFVb4AKcVDNbiWsh1?=
 =?us-ascii?Q?uOAoMdeZS5HL5jQt2zlUEqM2qZAbe1SZtXTcDV88OAtpzHuUjPJKg5kFyYhC?=
 =?us-ascii?Q?KkNasRbO9MAdKNcADWo4yOAOuK3w7r5TTWY5e73IEnjKlxTdEesKKPahJ6YU?=
 =?us-ascii?Q?F3TrSAsWZ9KAsKoeRydMBIeD8avKKfPS7ru6U1gm6lCKjykDhXXS+fvWL2pA?=
 =?us-ascii?Q?ZvCRK3of8DgAEwG+JgooMvTiGeZ4Q2fMxlxpvBr+x8WIG7mp3C4NaFIVNv/M?=
 =?us-ascii?Q?rhkoAdu/beLPOACKGHlXVgG/5i9kxktQUYaz5B+XXxm03YlGpToNKMoFEQZU?=
 =?us-ascii?Q?rnGI1k0YxVXBFPg4Lo66npnH6HEVf0/uKHr+mlS9QFPRTRSh6KoD/Y06GMTa?=
 =?us-ascii?Q?cPJDhXk4/9qBf7GW+50bEKVe/M6QU8pVo1uIvLWc7iMJxzhv9h5TOBRTm1Ri?=
 =?us-ascii?Q?22Ww1y0Rye4EpqOsi0u5mWGJz4wu80BW7OaC0GrMTdrlkqPLya2jopqn9Mwy?=
 =?us-ascii?Q?i+Gg/Wr+PKQF8sE3iAytZoMowcOFoio4eAj4g5WNuz06ATzsgCARxNKzVvIV?=
 =?us-ascii?Q?inn+MAyGATGnb3o1vnJ8m1IHCcv9fjxuUht9J4gYar1w6XfVqFk9+ngbiltB?=
 =?us-ascii?Q?z4TlB7d4b02x01PhzSh2Huxs1Lfp7/K5AW1TJOoQeValIup/rSI8vSKDwxBr?=
 =?us-ascii?Q?5Xij63ECoAF5hnhzHn7UjjltTaTVaI1cI3fdn1Fh21Ikuihhfgm35xAmO9n7?=
 =?us-ascii?Q?xdc6fSuAQTcKp+P1698s3u3ssANRV6ygngyp0ih+uyWVpvSR30a1Mg7NKawL?=
 =?us-ascii?Q?j6aSbHTh1f+WK5I1zUibdfyq1Qv2GpgcPlBHQi/5U2Ai32Ww6olDg225Ldat?=
 =?us-ascii?Q?HfaOsW3HDOAT7BqGFmJkKjlMgBSc2pGLSwB3p0HtKe9YapXqRH2jNFwbDJ6i?=
 =?us-ascii?Q?O+uN4sSVfwGmYlRBI6p7V/F7EXM9HrIVC2Z3VYp1wzF1EmK9INnq6RB1e1rB?=
 =?us-ascii?Q?CtFpcq6XDsnZcpUQaR7oSlNXGRqMnSb+p0RNEkZLluaVWFAxYIEJRzjMHj85?=
 =?us-ascii?Q?lw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 291be8be-45a4-4c64-6e7a-08dd1f4c7b7e
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9561.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 10:12:30.7793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0UxvkFCU6kyZ1t6s5YrCv/qSCTEWvAF2kVSKDjSJKmXMKJIQ9RSOU1mzBpOulJJZLfRG5NIBzWRSggX+k9B/7pCRD8U28/OARfxnAWpKLZA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10026

From: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Platforms based on NXP S32G3 processors use the NXP LINFlexD
UART driver for console by default, and rely on Dom0 having
access to SCMI services for system-level resources from
firmware at EL3.

Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
---
 xen/arch/arm/platforms/Kconfig | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kconfig
index 02322c259c..6dbf6ec87b 100644
--- a/xen/arch/arm/platforms/Kconfig
+++ b/xen/arch/arm/platforms/Kconfig
@@ -37,6 +37,14 @@ config MPSOC
 	help
 	Enable all the required drivers for Xilinx Ultrascale+ MPSoC
 
+config S32G3
+	bool "NXP S32G3 Processors support"
+	depends on ARM_64
+	select HAS_LINFLEX
+	select SCMI_SMC
+	help
+	Enable all the required drivers for NXP S32G3 Processors Family
+
 config NO_PLAT
 	bool "No Platforms"
 	help
-- 
2.45.2


