Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EF29F6272
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 11:12:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860101.1272213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNr2p-0007d0-5k; Wed, 18 Dec 2024 10:12:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860101.1272213; Wed, 18 Dec 2024 10:12:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNr2p-0007XG-0t; Wed, 18 Dec 2024 10:12:43 +0000
Received: by outflank-mailman (input) for mailman id 860101;
 Wed, 18 Dec 2024 10:12:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M/38=TL=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1tNr2n-0006CD-9B
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 10:12:41 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20614.outbound.protection.outlook.com
 [2a01:111:f403:2612::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c97bc98-bd28-11ef-99a3-01e77a169b0f;
 Wed, 18 Dec 2024 11:12:39 +0100 (CET)
Received: from DU0PR04MB9561.eurprd04.prod.outlook.com (2603:10a6:10:312::7)
 by VI1PR04MB10026.eurprd04.prod.outlook.com (2603:10a6:800:1df::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Wed, 18 Dec
 2024 10:12:34 +0000
Received: from DU0PR04MB9561.eurprd04.prod.outlook.com
 ([fe80::9808:be1a:b32:173f]) by DU0PR04MB9561.eurprd04.prod.outlook.com
 ([fe80::9808:be1a:b32:173f%6]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 10:12:34 +0000
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
X-Inumbo-ID: 9c97bc98-bd28-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wlCoSQqz3mzdGdJHIhxwnlmMGJYNYs2cO0iI4KDAkAx4g339+rfKPfTp4w+OjRtf1pwlplpact36mTIsZp8kZVDTucmyY3+AAPKLwdVjdWfBpwRFyJIF72YsmMHT9EVmuVtpdkr591bKFFUFV0dplB3gtjx0iVXbg5Vt0HmEH7fOTs9VpnoTPE6oeiPxh7vvgQljsQ77DNGrM5QCAXZvgBR/oFt//bLw4LVm45YdLdMyom8O9LIah91qzeeqGjD6i0n5HVZ0Oq68V8mz2CqaWR1eTOEsissx6ALnF3cm3rl3j0JLlJxmWkcpv2mcSyXhu2lVap2HOswvocJu74fHdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJpPySu7rJ3nqxUBq15kb8jVZtfuU9mQxzBBdWlN/io=;
 b=h5Hc5ZehWpsJeq12ymKGea6tyXK+zPOrYTi0fVlWnVKAxc+cXxKhdWV4OEZi7thOBkIAWJNAsvDpk6yX+kPd2gLAvgSnJT8rApbsBsKx3hG0qo9lNCb5rhinQs+AfRsa2LqnqXMto2ebYS7ZiIFu1Kl6mjledwu1uzRLD3QQfWg7xh50arlSkbfqHGkoa5EsdTgCzFFGfkFklhRJTSSP1vRQP+IVG0W/Hqt66ynWpCZROPWBkCsHvjSqv0NPXnGbAfPFbW174B9NrpD1I2qjSr/fr53VMf7VZ5ZOqh+/oxdvIcxuqtO5ghB/ZkiNbSEGSgY+h4xpcErvhfzpC6HU8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJpPySu7rJ3nqxUBq15kb8jVZtfuU9mQxzBBdWlN/io=;
 b=pY3w97SwhKsa7/nPhWZ8Y6K7rS4vCrRo8yAAKIXFQ8MOHYKTAIK++Hb6maUEcItoEM2OEjxJdN7Gjm+db5WqyaYUAp7RFmZK4WFbazQmot2qjAIg1SZxaUgO0nYS0kkoNO4ihLKhqz3QvZys+n7AYCvc8A4RPUgPQ18B/2EeDS6qvYdx3CUyAg+lvBpM2VCbTmIDXzYHEPd9ACy1fy8zHmYa1cncNXqGdKlpdp8cJZEVf29qKxGV/1MA8TMV33QX7RntQvwRq7a3T1SIyZdCsQ7J0/j0EmlyZ/CKCFfX7nhK7NzgenRhhOV9L5XOwtGh113bNxh/VHt4P/VSZ7qOAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
From: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
To: xen-devel@lists.xenproject.org
Cc: S32@nxp.com,
	andrei.cherechesu@oss.nxp.com,
	Andrei Cherechesu <andrei.cherechesu@nxp.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 6/6] MAINTAINERS: Add myself as maintainer for NXP S32G3
Date: Wed, 18 Dec 2024 12:11:41 +0200
Message-ID: <20241218101142.1552618-7-andrei.cherechesu@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: a8fc64ad-e49d-4149-7a5d-08dd1f4c7d6c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NllIbjJTQHbp+BYoLdkOg//O5hslMc4UxJijfwfREp7I5Xi9kq5VHENjcx6l?=
 =?us-ascii?Q?msMtP3mRi5WEE2IboyJ4NQjfc2z4QfEuQSS9uBRtpY21B/0KUEPlk2l8XN5g?=
 =?us-ascii?Q?RMgYEOVPmIVeYex4t1mUrQdNcXie0E3e7YYnuzHYcC4Ty/y1TalEvT4vp03F?=
 =?us-ascii?Q?ldJXiUWhHuiS3q35BHNFG6As6YN/oPqs4vJlzcqsixItDUcM3wSMqqBfE+Br?=
 =?us-ascii?Q?UDQ8aMM0mpDXUqISXuFNWVL+E41akg8IgiVQsgI0FNK4JXQ2ECyq+HtafvdL?=
 =?us-ascii?Q?nOC9kOKwnKPBH+khYaT+IgElfQBayDFSGulWIQNV4C+PjzbNyW53ku3uVRHp?=
 =?us-ascii?Q?Obd+929dFOeKs3lhykiaf3GzWHI86Q97YzGsMSU7AJBBeQKjOHHpfjPzcUan?=
 =?us-ascii?Q?TRrcOM06TxJon0cJtCRWzqIab1AbjksriV4ssavtwHVrC2T9H/zoHSVUtuFQ?=
 =?us-ascii?Q?qyx8RWiNCluJS40ITnBWYegX45zigKgBkoKlwX+iA9YxEklqB5Xi0My5IXBE?=
 =?us-ascii?Q?LNgQkAU5XfZbihiFIOlhi0gF0ett1R3l4n/7hKWH5JnfWAj9FztU4xY8A9xg?=
 =?us-ascii?Q?9B0CEwa2GnRlHaCFJ6CU2uu9lg28pIza/w7HL8gnmjv0asHVPW/UceVieMkB?=
 =?us-ascii?Q?r8dnGywrN/6v1pCiCz/SbkBmOPvgi2t3spAH1jsfg2CPfaUSC+kZbKygLZQU?=
 =?us-ascii?Q?Va88bgSxuTMNDdXuiJ85pmn2VaIqBNI3FFNtK1O0XGRBPHyDSX2mREnEJ/3b?=
 =?us-ascii?Q?50/OoF3QeQfMm8GqfJh60BQVCPbPF8Tf5kMGN8L9AtnsL4GgbVEhIcqIyjy3?=
 =?us-ascii?Q?MeK1U6a+/r9/IP1jjBIx3zzbjhNI1qi8N8IQqhC7AAeX+0XNJPxIxJpjC6AW?=
 =?us-ascii?Q?g115kqXEAEYx93NevMTXgrWlCzT27a9nIgmakHHHQF7IKKMQN48M6R6JZI8W?=
 =?us-ascii?Q?CWEG5MCDePDCsq4CMTT56PNrSqf7aJ9CI+qEHP9jlgSqi4v/eel+ehbYOnaB?=
 =?us-ascii?Q?tLaH5i5iAHs8v4N4lUINrlPwbdVAw4HKisn9ds9s3d5TVb4inLGme/s/uEn8?=
 =?us-ascii?Q?h1oVJsyaAuSiOzbe7MaknNPNkUD3B4WrakJGKi5lgUT6VjRi/QktlZSkDlpV?=
 =?us-ascii?Q?5oZe1/0gckwqw0DbDIuueu2L1QsR45ZnfnDmLmF8GbOCUk727WsjH8EwkxJY?=
 =?us-ascii?Q?nHZa8HPSwGfQZInLJn7vYEWPAYuEi8bP/+pcQpaG83bD4oyG5u5BD3l3pXFb?=
 =?us-ascii?Q?qDPsNPYp96DjkdLUxydGeAwwMqtZZMtLVY7noGNuVBj33v6BdIs3nZQ+R1cQ?=
 =?us-ascii?Q?pIJFgiciiY5pZNOchxaqbDNCsHeVfh61H3c8oEuCaWSibju6A9MFqQoD3V+n?=
 =?us-ascii?Q?YssJKvNG45kiRrJ+yuKwjU85XwMg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9561.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+RdquEdzX4tg5fb8T6aI+/Ii8OqxlZkLMSln/DrWUhaOoozt4B7aMsrGhYNA?=
 =?us-ascii?Q?St1Z90juT5uH4e3ej2wSA3sy4kY7QtYbd6xd52eoiUrhP8NBAEwzMKxCTi38?=
 =?us-ascii?Q?Y6cxbQcqgQQgBNOhTlXYTuLEAjdZG47gmgMP91CI7B2RP1Lu4qjm8kNPNGlw?=
 =?us-ascii?Q?MOY8xR8jPR2Nnp71UaJXxu5e6tnbJCSwgS0/mQIiUA949NSOi6EiTVRQON9g?=
 =?us-ascii?Q?uttxu8uPAICiVTeSOkZEbsaIrO+w1aQUR1G4ZOvfKd2dTqBrTbdjZz1A/wz/?=
 =?us-ascii?Q?iI8Ar9SWsCOeV8QMjcuU/lDCZibU6BwKVjOYXQNeGsvaSGb/2Behbtxi5/2E?=
 =?us-ascii?Q?RmBRBDWNSSKZGwmQDwSmJ9woQvnoXR9ntGyzXZfKo6/VOAHPEDEJbPYpZ/b8?=
 =?us-ascii?Q?i3vWLHp7RreKTU51s2rUQQcXQt/znCGOlLCuOctFy/G0WrpqhU+Z5ayIaorZ?=
 =?us-ascii?Q?q0iCFs9eUvTpDQh9Ts93mkUHxRO3OiuivrojTcurU4u+ru0Xyqrh+hc1BqdW?=
 =?us-ascii?Q?ng1eBiGfwhpaReYHBXhs8jNb+vh8sf50hBUINR4N8vG+Po1NwHSqglNbCcd/?=
 =?us-ascii?Q?9Uxhc/K+KMIefFeO1yz4zqssnZyqHaioajxxB6huzGmLX90Tx8fxDWUd/cN6?=
 =?us-ascii?Q?isCyqqwCj2Bk+wIEuNvGorhdLUNMptDdiw6fXwgbb350N+kroQwLi4Sb2egv?=
 =?us-ascii?Q?bskb6azr/fReEYqtc3q4U4Av8I9tmrHJTQH6UqsWIibvdG0uPiqR6NhRZ+p+?=
 =?us-ascii?Q?UYNWzMdZD4tI+OSY7Meq/0epVmW5GE1RM82WkOiWkPJuhwcYNt0savkP1+h1?=
 =?us-ascii?Q?sKVeZpRvATuIRzDH14pvV+D9j8dH4LKpiHMp5Wa2JqR8CnqYnNXFSdJY2oMi?=
 =?us-ascii?Q?drM+ZxLS5LAYEFG/QrVdzDtc383KO8aiVNVLg14jPaecO8IGF0UyjUIY4aDh?=
 =?us-ascii?Q?zCDtlAaAsV5uNFnF1t6eIF5c6T0a+6guVFXkkrXXti7FIEP2u4Pbkm00gMCC?=
 =?us-ascii?Q?60/LXO1GZT5omdIBd1JLAMr2MG8e1a9yUZDXHiNl/DoxX9WJB5q1uOimQRFv?=
 =?us-ascii?Q?EB0sf0QdbqGjPcbrOFwBTZ4ROLUgVlBXuc+u0VKlRmZ+ceHChDHaEjS503DJ?=
 =?us-ascii?Q?xtAdjGnGWA9v/swcE5mwCaFjcz5YJQeCSXCsB/elqhje6qgylUFs9Jn1eJtI?=
 =?us-ascii?Q?YewtxknI8XxCtUv32ZLo48C5mj+tlghu1nr7oQEWsEz2VqgASaIPupnq1ltq?=
 =?us-ascii?Q?wsYRbGkGhh9qiQGTRxIXhP179ldVTONJXhj/NRqiZ0Q4jZmzddMbGhX+iB2W?=
 =?us-ascii?Q?1sKF6HXeLMvUt2ulNnrcWpExhKtOPW+/+DHJFyOXd9RRQmajonz4VHJu7/DL?=
 =?us-ascii?Q?DJxktMquR3hhjQHfzY9TDFpZrbiWrru/xB9s+y5F1c9zJ9frR1vlitVip8ZP?=
 =?us-ascii?Q?cEnpfuTHo0BREYFUtIJbnLJtSp5wK4i1YvPoT7sFAUWfPY9PKMHzxilwywAo?=
 =?us-ascii?Q?AEUdRAil5CEYQUP2FFeo9KzCdY+tDCu6jn5K3nJVarIjH/refZeHPNwK0E7o?=
 =?us-ascii?Q?9RjG+uWOp7712Mp55+qG1oxl7nK+FfEZ3Im4w47M356oWLhw2K3hXxDj/KCp?=
 =?us-ascii?Q?lw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8fc64ad-e49d-4149-7a5d-08dd1f4c7d6c
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9561.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 10:12:34.0479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NlOAv3E6YJ4vKPctrhUKKUxXCg933q8HYhD5RyvlyY1To3m0yYcHexLb6wEDCtD9IGZOsmcVE8JvL+7Ul7QagXxn3/fR4UkTtt22KBmi7wo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10026

From: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Add myself as maintainer for NXP S32G3 SoCs Family,
and the S32 Linux Team as relevant reviewers list.

Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 34ad49bc39..392f780f76 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -426,6 +426,12 @@ L:	minios-devel@lists.xenproject.org
 T:	git https://xenbits.xenproject.org/git-http/mini-os.git
 F:	config/MiniOS.mk
 
+NXP S32G3 PROCESSORS FAMILY SUPPORT
+M:	Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>
+L:	NXP S32 Linux Team <s32@nxp.com>
+F:	xen/arch/arm/include/asm/linflex-uart.h
+F:	xen/drivers/char/linflex-uart.c
+
 OCAML TOOLS
 M:	Christian Lindig <christian.lindig@citrix.com>
 M:	David Scott <dave@recoil.org>
-- 
2.45.2


