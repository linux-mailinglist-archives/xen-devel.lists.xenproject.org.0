Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 833959739F8
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 16:35:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795664.1205122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so1x5-0006pR-37; Tue, 10 Sep 2024 14:34:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795664.1205122; Tue, 10 Sep 2024 14:34:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so1x4-0006kY-Ta; Tue, 10 Sep 2024 14:34:42 +0000
Received: by outflank-mailman (input) for mailman id 795664;
 Tue, 10 Sep 2024 14:34:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FMfA=QI=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1so1x3-0005Zc-AB
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 14:34:41 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100000.outbound.protection.outlook.com
 [2a01:111:f403:c201::])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfc7f10a-6f81-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 16:34:39 +0200 (CEST)
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com (2603:10a6:102:26b::13)
 by AS8PR04MB7557.eurprd04.prod.outlook.com (2603:10a6:20b:294::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Tue, 10 Sep
 2024 14:34:37 +0000
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709]) by PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709%4]) with mapi id 15.20.7939.017; Tue, 10 Sep 2024
 14:34:37 +0000
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
X-Inumbo-ID: cfc7f10a-6f81-11ef-a0b5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aDQONnsmRVV8XlxxhZcK5/sMIpYr+l1DkuMEXwtFctTpSzFXie/aW246wSheGwbc0ztasAL0Xx1ulxItkjgMTltjMJ3kp/MKwl29DZO4dEGdaQrpbMCsmkHaiESg1GYfKOkLG9tXKI/R5JmXsMZJEvacqDOsbGfpWzoyhW3bmfiPoTvZBidgZDcznJipevqBRwrgqktq5Wg2RmE9icogaKqTumRR4h79eObj6XRDwfy6/p1YfXa3uzIYmOmLLDt59SIOs2rVuNx3H/TA+OJAWwiH6FesdZbmiNkKvowwuCFwFO1WRcFRNLiO9kjrs8V5ggu7UvhFydqNzYxK279eow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+M0p4M9/KTzMT2MUJuAS4GEfF3uhmw6ACxjVW3y97u0=;
 b=f6SP5urcvPJSr/J3e753GSf18PTtCDgIS+g4q3j0Ak2XnW+c6Yk4pE2etxb8Ll6g7Z0+pkhdpcpGDvSYdNEaCoqtrzTiVI0xBArWSP4ME30p1ZWYL0lQU5IgiDMMKrwp31aSTomTaRJ43M99vaoeYXviRobiGptIBMV67LlTW/fBuNALeRuK5POc0uS0mCiNSmYKR/fJs/qFdZi0u0Q7WdR5DOg1ijvvlnKm9ClSH0MHrXACDboWNtz2dFTmP57iToZSZ8QNO3pNCYi+7z/xu4pp+yW6EaTWe40r0s0/7+/bhFp+MAsHJApElicpNtTHlNmtnOUESlbIU1zJyyPWPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+M0p4M9/KTzMT2MUJuAS4GEfF3uhmw6ACxjVW3y97u0=;
 b=H3x6vpvScarqMa7wTciOMgh3G7UZMwsV4RcL5ypU/CcQxAHfXgrRIbjoRTT9bS00CItpxGUXb29jMFEadOmY6eokR7bPpNKju9jipV75s15RkiDTutJfd+vLHu7molAqMK//T74pz5hS+fXrhhbgB5gANtFXtH/MaP6ROgk06xcn5DtV9vABOvD8qmHyCwwnDFPu4BucKYsA6uTleJA/aR2AdM3ip8K6x9dmhZ/LaUA4X4LgqkE4jzQ+ziqEjTqvDDF0WH+tjaCnjFBmYk4BNvnuW3JAurPAQo7DfpL6de2ipcv1vftbricZT/6RWdetoLCtDp1pzGCfkq9jLPP6cQ==
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
Subject: [PATCH v1 5/5] xen/arm: Enable workaround for Cortex-A53 erratum #1530924
Date: Tue, 10 Sep 2024 17:34:11 +0300
Message-ID: <20240910143411.178704-6-andrei.cherechesu@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: f6f0c1e1-7a95-4f92-34e7-08dcd1a5b2a1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hMx12jk+PTUSKThh1Nahh4X5Qybg8LZoqFDAjXsI8CJaAcUn7tg14IfC9sy3?=
 =?us-ascii?Q?A9zLDfGzEZ3xkt3fe+5sie+noqLogkrMFEiBGo6Bqri72YYGIzPmsO6jysZh?=
 =?us-ascii?Q?bUWDgX1PLnqhvTB00ObhKD0Fnc9Q6qEhFUHzxJPWNGLCRlvBkccxhOzob1lH?=
 =?us-ascii?Q?ci0NdEC4LTlD7Ce/xhD8wifCgp7aur4jGe/lvRQRzLeSDKb0uUpoAHUdQcCU?=
 =?us-ascii?Q?Q//mkHBUOMNtjsGvagMQEIwZVZeajzVZWtHKxVr7DkO+qqz2DZnWhI6caM+x?=
 =?us-ascii?Q?3voutE26Od5+cmchRoaoQKLvsU9cy4WoYOlExpYB7a7FLH2jfXi7eQsgc/xE?=
 =?us-ascii?Q?OlP4s+XNahdWzK1eO0Cc4kTa7We+o/IFvE2tbb9q6lyxFKdEQKdnxPTsuMOu?=
 =?us-ascii?Q?hJxwxom4OE4Q/eTsqaioGQ7Li6Q3y+rZB/LzW08NK4L9V6WZ6KzuDN8R3odO?=
 =?us-ascii?Q?SkKxzWyFYTvYcuTpmjBA4ViKSGNrhhkCCdqBr+y7o1k3M9TlLji0JEeKHqg3?=
 =?us-ascii?Q?57y/5uyYjy+S9ErCCbRCqDjrvf/ncjyNvSA1MGfM8vcRKARr+/Dqk0jDnzAc?=
 =?us-ascii?Q?NAwZKyIqraFyZeLtDyutkwMU8nvdHSwTC5AHh1Xd6XpVG8mYG3dC7QfajAil?=
 =?us-ascii?Q?vseovmrhgX+qCmjceZfnXIyF0l7ij8kb7Z69Ab2tJHaOqlAswh3zE1iIR3D5?=
 =?us-ascii?Q?y7w1aYWnHbSnfATgGqsmRhbj7n6QNLWYmPJXPlTOUioUwi7KcAf3xObT9mC8?=
 =?us-ascii?Q?AhSbB/pT6SL8xQJK3wNAj0qeFcqiDryKQUq5hSIVsy0QPg9CxXO9Ht6BGCCH?=
 =?us-ascii?Q?whEyNErjWAK484KcEWfbfTd07eRAlfC32lzhs1gwIxX2pFBEf3NKTICJcQ8U?=
 =?us-ascii?Q?aDq1+gr6FrylfnjHXQKfSAynJYh9QnZwtLHjVLyLYavzbV2A3Uz6BowTlLdx?=
 =?us-ascii?Q?w/fnzhUa1H3D1c4VGuohhe9j6jaF24Lzyp055j3r5Hu75NcnKML+SScC5Mnp?=
 =?us-ascii?Q?oQVdfFbylGnoSUePvZVbHfTtrNnCbLdOXaGjRZLTWpXcxM5X1fKwxHxuLoHp?=
 =?us-ascii?Q?W/3oUxtjK3M0FvHUSPo9PTeFQuk9oQDuluC4w8Xcv41xOBtdJj8gnh8UcOBL?=
 =?us-ascii?Q?wLUUPGMwbQHZ/FC1ArTiD/xpEWtn7t7J75F/zTDG4F9z9pI5gbP1yDToQZU1?=
 =?us-ascii?Q?BtyD9mUnS+4x7G1p7yXK3z/HSEVM8m4EhmBNOqRKlzhg+N1HFQyaJ8oBqSf7?=
 =?us-ascii?Q?bWHCvmAOK/NprpzEm79ukiHBKiTgOIHVfip9YX3PD484d5WWnxxUhMvvi2BD?=
 =?us-ascii?Q?1eoiXV0HtvNzwOTgv73FiD+LsgUWzuqBqX+D9oXuKA0eS4G4GvaHaEKSy2bc?=
 =?us-ascii?Q?Runjd0ZXbzcn1CruDuWDe9ldgcSLlN72i0EQ6unCQ/sKkH+ilw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9565.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vhVvMGyLmOmADyXjBfI9OTcQJs/qmEov9KLfrUpR+P8d+zZNJlR+0+m6yG1u?=
 =?us-ascii?Q?8Oo7KiBDFprXsTJ5Flym/Wi6IeJH8AZR+1dw/wkp8boszV86s4oF6gv5nIlR?=
 =?us-ascii?Q?UTWXEmT2rIxPXDGnrzdHYX11oC5OmeJJH1yOBoBHiYj53mkSH90DLG7yTzjN?=
 =?us-ascii?Q?2jjZo7pQ9YCi7SH57iU5bwYyzWvlg4I/vHCPQAnEWcldCBr0lstX5MIEwBt+?=
 =?us-ascii?Q?3Qop0gkzH5CNA3cMtf0sDOGwIDYLv3zOaEbfTmkyzKNrtcaIiCoj58sNUoyF?=
 =?us-ascii?Q?+a3lCIdt8h6h4OukPbB9xrjJjieV/jVH8lJVZs5fOnIQQRqvBw+tUXAOntqb?=
 =?us-ascii?Q?GRAbwzU3JOIL/5mksE0TrgwYP2qUVFFzhcLU8Oqp1azI6djZs5KPMNYLZqGs?=
 =?us-ascii?Q?55bbREx9a7advwa6HmI13eAjqz6JSqE3i0XjyOXCkUPsHFSshbyIobtUifsz?=
 =?us-ascii?Q?IPQyz+xC6usZGkEZwrZxcPWmFwglhfHkCAd1EDSghexXbN75oL1sDP66t2JQ?=
 =?us-ascii?Q?obWkCDH3RgqFAkr424dldq+IiXyfsvo9GdMic3r9ICWQv7328QtH722M3anW?=
 =?us-ascii?Q?5ornX1QdlNQIZVqfm8hFZUeZsx+zOu9bPe/ckWyRk18xSToE0zQbBZU20N4t?=
 =?us-ascii?Q?40IXOQ126gESLnG1suyECtB4rHFa9gjJgEH+6ywZtnYvszv0mvLNqlq2H+uX?=
 =?us-ascii?Q?1ohgtH0uhRo1jWu5agIsMSWYTyDxQaZDgaLQlIZf2O969WNKkEoSlJT7Vb//?=
 =?us-ascii?Q?WIFzi2+Ix09+Sms522ZJGHqWVA5tHqmogIKcGdEp+h6474vsRCVbe6MKQeHW?=
 =?us-ascii?Q?Y4u3Ke7mXi0ujLe6o6SO550fL6jFazjKs/rKLAAFzWw6z4rqhcYdZrJvyhTf?=
 =?us-ascii?Q?D2mWncLrVFwL4Ehf+6oaqu0H6xgZc5//Ukq0e9DZ4HyVeLCRPwUcdrPuMrRs?=
 =?us-ascii?Q?YCLpFKsOq6RdTDUuYHoTft++6LtXotqjuqjIF2W/N+C2pvM5lIEmutlYdXMs?=
 =?us-ascii?Q?xBGmnMtMuCwa1RsVz1QWFlnJxm66Nh16sUxANVCsYNksEQag+If+jNR4Bcly?=
 =?us-ascii?Q?kodBdv+0oDnPIg8OgN4Xp22lFz2OleS1pbDTH27OdNGteH+twDZX8sVLACub?=
 =?us-ascii?Q?byXNVmL/UPb0pKddy/A3zWeOkRZvf5Q8lyp8i/k07BLaMlIKMHN9ScM+AP8P?=
 =?us-ascii?Q?NZTiGcczbU3k9K0lXVHXnw961y3qdd+vI2Kbb1jPLrsYrbrtn+N+HTWQBnEF?=
 =?us-ascii?Q?lKnOKCrn1lWfoyqDohn0yl8IqS4JAOiS6rVyAUg2G1fkW3uf5mt7x9u66Khl?=
 =?us-ascii?Q?RYZk4QIsCNOyMkv3jHtPy38rjqAw7ifwsa5oHY3pVkoxw+WzMq30zjLxRHzh?=
 =?us-ascii?Q?VjBmXZCwCbj0qIfEkRaCioCKaNTxTJ0MBgRmQP80RAO3HTyRaE3NAMpMionH?=
 =?us-ascii?Q?LKJ69wTqfVjGUNL2y48W7xutimXe9AirR/Y96cSTcYkGx9LXz97ig1DbauPD?=
 =?us-ascii?Q?kNMWkj0QDEoWBkNuq0csl89OXXJ+grSXgmCI7hIt5u5Qnlyrj2luSuB9EydA?=
 =?us-ascii?Q?JE0gTvcGlMHtHZ2WlEcLfNW1fL2I5gb7b7hpZZcL7NFFKRRI00QvdjUMMO5S?=
 =?us-ascii?Q?6w=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6f0c1e1-7a95-4f92-34e7-08dcd1a5b2a1
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9565.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 14:34:37.7923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 05qkrmz+22bKVGUXlSFPBfIQdK34O+kppjLAP2T/7rUe+bE7KofhDM/7XCMn9HyVVIGsUx2aCpTBQjG159ixGZ7ttKmlhh6DVnC/jqJsFY0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7557

From: Andrei Cherechesu <andrei.cherechesu@nxp.com>

All versions of Cortex-A53 cores are affected by the speculative
AT instruction erratum, as mentioned in the Cortex-A53 Revision r0
SDEN v21 documentation.

Enabled ARM64_WORKAROUND_AT_SPECULATE for all versions of Cortex-A53
cores, to avoid corrupting the TLB if performing a speculative AT
instruction during a guest context switch.

Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
---
 docs/misc/arm/silicon-errata.txt | 1 +
 xen/arch/arm/cpuerrata.c         | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/docs/misc/arm/silicon-errata.txt b/docs/misc/arm/silicon-errata.txt
index fffca09656..853e06aec1 100644
--- a/docs/misc/arm/silicon-errata.txt
+++ b/docs/misc/arm/silicon-errata.txt
@@ -46,6 +46,7 @@ stable hypervisors.
 | ARM            | Cortex-A53      | #824069         | ARM64_ERRATUM_824069    |
 | ARM            | Cortex-A53      | #819472         | ARM64_ERRATUM_819472    |
 | ARM            | Cortex-A53      | #843419         | ARM64_ERRATUM_843419    |
+| ARM            | Cortex-A53      | #1530924        | N/A                     |
 | ARM            | Cortex-A55      | #1530923        | N/A                     |
 | ARM            | Cortex-A57      | #852523         | N/A                     |
 | ARM            | Cortex-A57      | #832075         | ARM64_ERRATUM_832075    |
diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
index 2b7101ea25..afd0605922 100644
--- a/xen/arch/arm/cpuerrata.c
+++ b/xen/arch/arm/cpuerrata.c
@@ -683,6 +683,12 @@ static const struct arm_cpu_capabilities arm_errata[] = {
         .capability = ARM64_WORKAROUND_AT_SPECULATE,
         MIDR_ALL_VERSIONS(MIDR_CORTEX_A55),
     },
+    {
+        /* Cortex-A53 (All versions) */
+        .desc = "ARM erratum 1530924",
+        .capability = ARM64_WORKAROUND_AT_SPECULATE,
+        MIDR_ALL_VERSIONS(MIDR_CORTEX_A53),
+    },
     {},
 };
 
-- 
2.45.2


