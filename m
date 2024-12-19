Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C70C49F7A50
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 12:24:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861114.1273156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOEd8-00012h-K5; Thu, 19 Dec 2024 11:23:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861114.1273156; Thu, 19 Dec 2024 11:23:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOEd8-0000wy-Ej; Thu, 19 Dec 2024 11:23:46 +0000
Received: by outflank-mailman (input) for mailman id 861114;
 Thu, 19 Dec 2024 11:23:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vR1G=TM=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1tOEd6-00089J-Ql
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 11:23:44 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100000.outbound.protection.outlook.com
 [2a01:111:f403:c201::])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b43a3612-bdfb-11ef-a0d7-8be0dac302b0;
 Thu, 19 Dec 2024 12:23:43 +0100 (CET)
Received: from PA4SPRMB0023.eurprd04.prod.outlook.com (2603:10a6:102:268::8)
 by PAWPR04MB9936.eurprd04.prod.outlook.com (2603:10a6:102:38b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.15; Thu, 19 Dec
 2024 11:23:38 +0000
Received: from PA4SPRMB0023.eurprd04.prod.outlook.com
 ([fe80::fd16:4665:bad7:33ce]) by PA4SPRMB0023.eurprd04.prod.outlook.com
 ([fe80::fd16:4665:bad7:33ce%4]) with mapi id 15.20.8251.015; Thu, 19 Dec 2024
 11:23:38 +0000
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
X-Inumbo-ID: b43a3612-bdfb-11ef-a0d7-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=urH1RkzBUk+6oYu9Sp+9O7VS9INPRNMrPcWOH4cUSzBbQnO2ece4LYHe9RKx/KXFvAqrd+Cgj1IXM/FieR2ixAZpG8dQ6x3eSO1D17Z1ZQpctkKQhUsUAc1byBiDPlruuYiYZAEVcYYJD4cMaHmUDs4FotlncNKmoAVg4B+DypqCVB730O+ciH9eUaRQgbyn5NO4nGssP79W0eBRckLagnKV+izhoX9np7zoLOxgnNKP+PhBW+SlimFVOP7h8NYXc2bxk7HaKirfY/YD+b7i/PRbnHH+rmJOZ4LZDF3NOwEdyTPBcJHsDRC1rnbSRsAEJezlADiuvFI27vNEn7OKHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/W+hjvEQAfrqy6fE9YS8QKciaTcdeloCtPRibShYIg=;
 b=oIhCr1MjOVLE8ZLKBg+WbH/CfOvO9aUkYwY2URLduJG0V6O1D+Abkp9LD1AHtpHkNGJK5QD4l5iBufAA8GJ2QxB95ckA1ja4EUuv7OmC2AtBB9TfAq3hPzfc1FAAfoKuILZOPuQNWxxYVdeIOoUAuy7MwjfJnUrHJErcnAEDBAFviwS6VJHHJlMpewaOQMGjEifveJiI02Czmexhrr9/o21moYwL8xdnD+fY7YoJGeykq21U5PIdH/jucoTfjx+IDoYQa1M4Z27gV1GLBd4OsLhTzhyTQQPVnHDxHVIB16PGdHZxKAxPPd+fH+Bsb/M3Q5LVoXpefUPsSpl24g/mLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/W+hjvEQAfrqy6fE9YS8QKciaTcdeloCtPRibShYIg=;
 b=IOC+ylazakVlbPGLQ3LZU0v4IcE5VNeoCqlnqeigpgkeGCc3ZgipzSKUqOMkKTSsu7spBoTPEexomzTfogBOyefswgzXSHuKK4nLLLSI27VFFsxuDLG/i2wdlhuPgBwRWTfwlQsIqqniUgMwah5qqYa6DlBqPAhBYz30txB2hY36EoPSCaZOwoXpcV98r5YpaoV7o39c+yAPpgUp5zfDCOwT4eynuzlcqQ7dJkTauyIoYYAtnkok1qqV4k7umd+D3QCPrS0b6brT2YaRfObtwDW5qzcJXC0EI8367PhseOiMh/1gQj/OxAOvJZtPNLRskzxijohE1EdokANPd8+2iA==
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
Subject: [PATCH v4 3/6] xen/arm: platforms: Add NXP S32G3 Processors config
Date: Thu, 19 Dec 2024 13:23:12 +0200
Message-ID: <20241219112315.2461048-4-andrei.cherechesu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241219112315.2461048-1-andrei.cherechesu@oss.nxp.com>
References: <20241219112315.2461048-1-andrei.cherechesu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR04CA0039.eurprd04.prod.outlook.com
 (2603:10a6:208:1::16) To PA4SPRMB0023.eurprd04.prod.outlook.com
 (2603:10a6:102:268::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4SPRMB0023:EE_|PAWPR04MB9936:EE_
X-MS-Office365-Filtering-Correlation-Id: 78eace15-e1aa-44d0-b28d-08dd201f9435
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?C64+CwkbKASyhUzKmCrrl8EfEFFjBA20RmbxA7AHcxrh6qvlymEfgiBvK+/0?=
 =?us-ascii?Q?MqoatiQ9LyP+KSbeaUyIzNq3tCORlzJ+WzC1l0zYnUMVWOa+kk7QqUlUpHdC?=
 =?us-ascii?Q?Rhc9zO0ZeKm/9yHW+bVyPf4ov0RU+UL4soHUTnOiiKh9jfQOgdk9s63AL4J7?=
 =?us-ascii?Q?EnGdSXbzcGEJPsdm7L2VsATg0n3pep9wBmACRBOQKuIEPNS5h89s0heVQmOR?=
 =?us-ascii?Q?ry3i6V3YAkYF7bmt4+MKO/g2h+e9ZxG5SLNxv4Zoim8pbvyCQJJP+u+1AMh7?=
 =?us-ascii?Q?lG9zUQNFtDGF6ov45yp9JZ2M0UcO9ujodhkbB60r6Z3/Zv2DJDAQmFhS3/lo?=
 =?us-ascii?Q?KTulzL8AUsU4n+xz0Guo0aclc2AQai1FeH9qj845mO+9Ycha87BCFGQyMRkG?=
 =?us-ascii?Q?v3myFyMxJ436rl7t1hmmaACIJ7ZW6zwG1sJHUfYgwG9dg0fVF1LnWjNGPZQK?=
 =?us-ascii?Q?zF8yL5xWrIG/r+skPRft85rivzYKxoLAwjipVtdTCWfcDFF4xZFEk5nLLbKj?=
 =?us-ascii?Q?EB/7v4PMB0L+VpPH9qIFWUJXZwGnmDaVYIe40g8Tilt0s6JvOB9hZcczvC6t?=
 =?us-ascii?Q?Q0mYMOCs0oVbxENcQRbAjMuL+4zUEIfQL/jfWtf28MT+e7YsbiW6vMJ9Yw3r?=
 =?us-ascii?Q?5RMbxdQVl9hEpFFcG3HK1xyGGNyUgYPZYjAGnbgFHnKXU90oQsmF8HPp4nUx?=
 =?us-ascii?Q?j1tb736U9kqMDs6memiTnAL6abdI4MTqEUkU0b4KGyjPWUXagPPVqES5en3T?=
 =?us-ascii?Q?0ccQaz9+j7gxZ/8lqG2eKIAP9ETOjl8ovbtjaAw4j9xJhiJoN6mpUNLZ+Sg6?=
 =?us-ascii?Q?W+bM/9XbmazRWbeHR/rvB4z0X84O4jrx2EyeXMmQi2flBQutK3DfKkwMmGRu?=
 =?us-ascii?Q?Yr6GubVI7M/BRHiud6q/ASxV9/SdI6vsVbuSZi5dRoIs1fVIZm8AmZCjt3l7?=
 =?us-ascii?Q?1CqCG3zjt8bwzHKOEsIwkeMAVzkDCf2i9pb7S+7WcWK73wMWMIORyT1NP4h7?=
 =?us-ascii?Q?8x9jDlO42CUe9chDgOXb1WYvJTpo+4Ll9P0hpEMYqESAZqtj4Wwx9Nn+xZU3?=
 =?us-ascii?Q?d+fFYLPaci0hvdZz3pbX3puYD6WzkAXLbOQcAKyx+Xidbl3rP63+QeCrg+mF?=
 =?us-ascii?Q?Sfl+AMcMDHUkzt4eolEmNV9lTmZxIHODWJLtgcuJ3/M8gffmGnmLZrlL15AW?=
 =?us-ascii?Q?Pic165d/CeNFrWiELma/yREPWiiUXLJK8S1YhFCIElc2DRLKxZsR7yWd3Hxp?=
 =?us-ascii?Q?YndvbJqYG/uYkHSiT6bVCfkueTilGdf0hGlzumWCanRPpd26gpziHDyQPs6B?=
 =?us-ascii?Q?P9yduyGGCv5+tDRGu28TXlRRtrQSQY61jdR5JbkRvmj7bRbrkM29FGcdn74U?=
 =?us-ascii?Q?VZmKUBl86GaqSe//D3mC4IW17acAt1jYSwwBGYSWOUhm4VdNOObOMAo83Ryr?=
 =?us-ascii?Q?4bn0dMBtNqD78uIbPWpSTjV39Pt7PZK+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4SPRMB0023.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4UxHNc9T3b5o6zHqgZ5ZpIuekFfTLaPbDSWycPKDjtD5HKyAL956ME76rUlh?=
 =?us-ascii?Q?A4I76uoSjot069A6j/bSxZArK001otST+cdYHqnNCGR+SywK8KYyy+OYI82J?=
 =?us-ascii?Q?JIkjNrsxZxBjz8yzvRuA+GkEReNBpDoJ/lDXin4aPuwPMIWjcfM+fv/yXAAr?=
 =?us-ascii?Q?fuSasgfwpPXECBzsfufBtGPx1yka0KjKwSISgRk1t48TFe0/lXOVlLNEmxzZ?=
 =?us-ascii?Q?+SdxN3nNUpurs7ObotgEPCJndaBW5vjF1iD+Ta/wyRpDdLh1Kk1LlFe9i4FI?=
 =?us-ascii?Q?Prq1hPj3ozGxqY5VOP+Mn8NvQStreRWMF/U+XTPlWplbxumPERi6Fgx4HzC4?=
 =?us-ascii?Q?F/zi0Yk5sclQsRnvMEEXvy0/qnS1JQ01yoxZUSFaWhW0rOhnHhWq4mydp77B?=
 =?us-ascii?Q?phwiTjqiz+9wHRWNvEz0BUcmI6k2SV6WY6cPkKKvTdkxAIIay4otkoI0Ff1x?=
 =?us-ascii?Q?PG2gOexVyPlh4333pEpbKD4qSRgFhfbP5stHgW/AQAsJWcUfOI0rYtI6Mwnh?=
 =?us-ascii?Q?AbCamcKOCfW5PyOHCs8Oqw0bbrchMQKG6gIdPp3S2kYjHieBDam+GJoWG92W?=
 =?us-ascii?Q?pDSXc/Dk9bmr2SPOpYsjdkTu833XVMSHeW1aCcU3FDOw7GYl4KUWwWJu99J/?=
 =?us-ascii?Q?xFch+z2bhPuMVlyAjHysEJ1smQzuWVMlfWlPzSWPabik8G/+SQuMM53Fw68L?=
 =?us-ascii?Q?Ml+0R3Dvl74qsfJLCQujGOyNj+GKoAnxpltcz/UX/qB5f9xIwACnian8xHs8?=
 =?us-ascii?Q?Hk8oRESfmOyrx89r0V8Wfy7eIdUBn75kKyeH4GrYj7Nhqwgwj7jG3ASxhVo8?=
 =?us-ascii?Q?6YtnpWdpo0yZs4lNFRvRj0YoULvgqsogJWhYlLrcqDiAkr4wrTFVeRerxtst?=
 =?us-ascii?Q?2w9z5+bDsAvVKej3mChohW2yC5gIx3x1DV+ULqXsBH6oBQPAqbXCUt7nhQvq?=
 =?us-ascii?Q?UnohUFXLRsirg4m6aL3IngmJVSRzOXPsdafv0w6wkW8JGB4S/wV33TW2W13J?=
 =?us-ascii?Q?OqK8268BmYdCbvXVvAZuc1a4ewUeRotvSDPwStNe6l7uqwyvno6h4pv+8Q/T?=
 =?us-ascii?Q?zkCuKaJKkonvOBESheb15sriTaqALv3GEIctxB1KiRQikDu1L11LU6kFV7bK?=
 =?us-ascii?Q?Pagq+pILQV22Fzgar+pMLU38jzuJYwgztLSJtiZUki+F0Na5N3bVeV/LoXyg?=
 =?us-ascii?Q?TBwnJsAtMsf0L/KyzAYpD8S0pqj0VJZGzkeklaMNePUMVKUmzTUcEG+BjIc3?=
 =?us-ascii?Q?EGMhenjbkD0vWHSbYI35GNNsi2wTN1Pl2fcRHgD7qmxogpwLOnLdungYrQuZ?=
 =?us-ascii?Q?LP+IjPM4rYMBI/oUVFND2fUfGKOEh/V9dkriAOCiBvOZOEe4YNrRGnqKGW6T?=
 =?us-ascii?Q?eXaspp+5ryrxx2aJze6cHVeN8iE7hEW5Jguq0bykL5Bc0qe2ExTPOUEJ8YkS?=
 =?us-ascii?Q?1XpHst3C5OOa1THCLc5vzdJHCH2qyD8T06yR6XWAWkK7GYaKLhxCOk6OCLcP?=
 =?us-ascii?Q?GPzbyZSk4BbBno38LXY0mKLIHmkkL91+rBm3NHdqJ68SGOH5rIQeTVTSM4cP?=
 =?us-ascii?Q?YUl9UyAdOCCQj2fPgNyq80AI7U+LG3D98wR8Si9VeRm7qxmNcve3uIsbRMwZ?=
 =?us-ascii?Q?SA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78eace15-e1aa-44d0-b28d-08dd201f9435
X-MS-Exchange-CrossTenant-AuthSource: PA4SPRMB0023.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 11:23:36.0655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jg6FlOgjuR+ticnup6XPmxdGRNapzwBSh1cjy5KO68cUFRUQm/ohQtllV16D8swoC3/gPJNS2S0y39yMl2spbLz9cNuKusvMU5mmj6HphsY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9936

From: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Platforms based on NXP S32G3 processors use the NXP LINFlexD
UART driver for console by default, and rely on Dom0 having
access to SCMI services for system-level resources from
firmware at EL3.

Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
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


