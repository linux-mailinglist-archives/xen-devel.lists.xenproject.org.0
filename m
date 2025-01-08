Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA38A054E1
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 08:58:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866941.1278326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVQwb-0001b7-Vo; Wed, 08 Jan 2025 07:57:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866941.1278326; Wed, 08 Jan 2025 07:57:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVQwb-0001Yg-TC; Wed, 08 Jan 2025 07:57:37 +0000
Received: by outflank-mailman (input) for mailman id 866941;
 Wed, 08 Jan 2025 07:57:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kklb=UA=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tVQwa-0001Ya-Eo
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 07:57:36 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20614.outbound.protection.outlook.com
 [2a01:111:f403:200a::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37baebbf-cd96-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 08:57:35 +0100 (CET)
Received: from SJ0PR05CA0122.namprd05.prod.outlook.com (2603:10b6:a03:33d::7)
 by LV3PR12MB9412.namprd12.prod.outlook.com (2603:10b6:408:211::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Wed, 8 Jan
 2025 07:57:30 +0000
Received: from SJ1PEPF00002310.namprd03.prod.outlook.com
 (2603:10b6:a03:33d:cafe::b6) by SJ0PR05CA0122.outlook.office365.com
 (2603:10b6:a03:33d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.17 via Frontend Transport; Wed,
 8 Jan 2025 07:57:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002310.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Wed, 8 Jan 2025 07:57:29 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 8 Jan
 2025 01:57:28 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 8 Jan
 2025 01:57:28 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 8 Jan 2025 01:57:26 -0600
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
X-Inumbo-ID: 37baebbf-cd96-11ef-a0df-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uKbHv1urItayJlibtDVWyRpC1PQ9xokreZEwIBPdO5WPkoXLlGJfwlYmnpntwUjfZhLbstI66QnVxoJIViD85A1/MlbwjT8fOj/E+6ZJyEB/++L+5gbYG0s1bkuQBqiLSem9vaBG/mHeDt2gd1aGgRZ2gxBFnxvL5KADxsoV2AOmTg7uqI9hSo/MOzbfhhsQ2DQ1b/QQNA/NEwqqGqhElxQljXqkA7m9pb4U+4JWOZwSGp0W9yjjkLqfz5bg/MiGbXv9zi/W7hse/zFS2WVIyp7tORrTzRj1/1Y3Yq6IkJnJfrUpRr8SVYhnO0yjruz6x6BvpN1VsR15nC9+5pP+aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AMBfchd/5Our57Z312dT0WCT9dM6EG4jVn22t+Qcvs4=;
 b=PtgSX83qI0bx/gyGfXmC7+LucDQ75v/RRFjjYY7tq6gc3RNguyMYry1Wn3hm8JxMUft8L/XZ3JmSTeRnejezuulg//w0iWRpRXRtdCNXJ1lcjV2U3ypuQHyWHi0RFAVCP7qfyVAUNU2iaYOdNyPCcD5kxhMiTmqVZN/CIR3QTOQQ3hFIEYgCAbs+1GXEOIzHP7A3emjZCLNSKVNb8hm8bTIeaZ4zLIl19PyFPC8m2n1jseJEd0mmFvug+I0A+YQv7bC3kt6/aPVYbRj22owvWi61iDou9AWEYNSBXPMAY9yYRXIrYJz6kd+7LSHUiWjb8nDrRpKJHiMi7TZheCkd3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AMBfchd/5Our57Z312dT0WCT9dM6EG4jVn22t+Qcvs4=;
 b=h+bT2lMQ3PP6VAuVGAcb42ugAH+x5RCpfvFyoeJ3tjb+ez2XAoBiVsWJoWw9vWVxLM4RxJNHE5QozDx3GDl/0W8FcwnFqOukCnXcajXN+YH0IDAYFjk7u0seNLR4Z2PRcqyeqqO934wNBFF8RhL/d5HeDDyGh5dElDfatKCJeQw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	<oleksii.kurochko@gmail.com>
Subject: [for-4.20][PATCH] xen/arm64: Drop relocate_and_switch_ttbr() stub
Date: Wed, 8 Jan 2025 08:57:19 +0100
Message-ID: <20250108075719.84967-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002310:EE_|LV3PR12MB9412:EE_
X-MS-Office365-Filtering-Correlation-Id: 2377795a-3724-4356-2404-08dd2fba197d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YBRyyQy7OMUJRld289fZgAfWVq5hY24gz9WUTtKNu3f2NDd5SuusYcG5LDTo?=
 =?us-ascii?Q?kuiSYomzYCSiylLAMqSq3liTSo25/3SYDqM1pkOWOVAawCp9zcS0H4EGDb70?=
 =?us-ascii?Q?s2O/IssyVtkpJ1fsaFzh0s74CUKbTU/od7t1AWKMrs23PPivxpiMilInUAIm?=
 =?us-ascii?Q?cxM9jIdQzo2xf44QrurFh9b1ZyPopB0CGLDX6kQDbr4pnQS0XIdMdDgMO+1y?=
 =?us-ascii?Q?ahf58paNtj35y+C3w4S/qo0Y2g6WndYznnWpDOcLFzJqiQlwGNImPxCqs6UK?=
 =?us-ascii?Q?j3o6wL02sWx16r29bI3rWCbAIE57vE5PAv6LOLtVPkqaVOWDhWaQVWXO+fos?=
 =?us-ascii?Q?d2LeTI2oaKDXmPuniKtmv46xf3/RGxrRkMTuhXm57vxbzCnTaxyLbDUdsE3k?=
 =?us-ascii?Q?Dc1qZ2yCSALiSsv5G/BGNKql6IaW9iLXV04ujJQN+GmdhKDioDHXqiM6zGbh?=
 =?us-ascii?Q?BFsvUCMi4pE2+rq3A+eEoYiUV36DdzyPYsEUNQBHtwhi4ByWsH0KQ9AAiPzj?=
 =?us-ascii?Q?nkaEcPGc3v4Y83qNRLlxyCAhEBY1jN2ZohU01JwiTT4flQltpHE63JDFjDns?=
 =?us-ascii?Q?fzurBfgvWwtsGvb6r80qk/tNZOM3njmgbVw2U2WEVX0qoclT7eCon/Q7Z6G8?=
 =?us-ascii?Q?ImsbH9zeV4FZ2sOauFp8w/Vh/vwd30y21lrsQNdOgO700eoa51QOn37cb/lU?=
 =?us-ascii?Q?ZqAVOr0HRLancL+ejLqpd1rOPtvRIIKLHjLQbr/fLlrt0roUj5kts2ZzjcMd?=
 =?us-ascii?Q?laTwWK/nJZtBYqhWPufh8fQP7WDRg4zcWaj0FTQagRZbpZ3ALS0XJ7vksjgC?=
 =?us-ascii?Q?x9DukFw9G2HfCOEUz2qWoXvnyJdkZhT4Df3O5n4mxBMoHf2MaW2mijFlFhKe?=
 =?us-ascii?Q?NH8SD5RDPh1Z3eGKUWlQYV4NHeU0WBkiEBil0frbVixem8th5kfi55TZnZSl?=
 =?us-ascii?Q?XUzcPW8d1rOnsrjCgah/i9FZfXXKfJk9dYDe0iKHXSm2t3oqyTCGG2cpQbTD?=
 =?us-ascii?Q?2AEz7qsspMTO78bR/x+IMAMXPeDNt6HLRJDo32H9FnUxHxbzzFZV//2cEuzS?=
 =?us-ascii?Q?hWfNOpMtamAucUrXXPym893vVKOlnm3q8vjY+vgBnh4nwuiMkQw0MrwRtn+b?=
 =?us-ascii?Q?iWesSrt/qvpskavY3CzmnWSxEVeNNjX067U7tvmxu1xCoEifBBE1//QoBDrI?=
 =?us-ascii?Q?FH3KDUJoab9vPzkqVaDJ7yEDg/SIQr0KwP9BumRKt8P9wp/7uFBR+QpYvAii?=
 =?us-ascii?Q?lw78PZ+xvQ9bon2z0S/6HWdni5wFHOY5v9c/S1PSxZ8p7P/Z0GTeUyPJhfaC?=
 =?us-ascii?Q?735tngrZ2/P+RZBW/qThA+NMFfYd1mx1WQlMYU794i3VxSPknXSia9DRyrB8?=
 =?us-ascii?Q?czvXWZE8tHbX8QRq9Vn8WlCU6oZd97aPPrKWEuiYinwf8EGqDkoFbsIeJ4l0?=
 =?us-ascii?Q?qTVS7p+u/BhZL/MExNvaEti+zfabIkPLZC8+aPCUFSRzGDFj6E2Gb5lek5fX?=
 =?us-ascii?Q?vcRWihBwUA5hmB0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 07:57:29.2970
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2377795a-3724-4356-2404-08dd2fba197d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002310.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9412

In the original patch e7a80636f16e ("xen/arm: add cache coloring support
for Xen image"), the stub was added under wrong assumption that DCE
won't remove the function call if it's not static. This assumption is
incorrect as we already rely on DCE for cases like this one. Therefore
drop the stub, that otherwise would be a place potentially prone to
errors in the future.

Suggested-by: Julien Grall <julien@xen.org>
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
As suggested by Julien, we should have it for 4.20. Leaving a stub like that
without something like BUG_ON inside can potentially lead to problems in
the future provided the function misuse slipped through the review process.
---
 xen/arch/arm/arm64/mmu/mm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
index 26361c4fe4c0..c1efa1348aee 100644
--- a/xen/arch/arm/arm64/mmu/mm.c
+++ b/xen/arch/arm/arm64/mmu/mm.c
@@ -171,8 +171,6 @@ void __init relocate_and_switch_ttbr(uint64_t ttbr)
      */
     update_identity_mapping(false);
 }
-#else
-void __init relocate_and_switch_ttbr(uint64_t ttbr) {}
 #endif
 
 void __init switch_ttbr(uint64_t ttbr)
-- 
2.25.1


