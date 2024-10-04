Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A679902DA
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 14:23:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810343.1223055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swhKW-0006m2-NH; Fri, 04 Oct 2024 12:22:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810343.1223055; Fri, 04 Oct 2024 12:22:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swhKW-0006fA-JH; Fri, 04 Oct 2024 12:22:44 +0000
Received: by outflank-mailman (input) for mailman id 810343;
 Fri, 04 Oct 2024 12:22:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=djJ5=RA=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1swhKV-00068r-78
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 12:22:43 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20629.outbound.protection.outlook.com
 [2a01:111:f403:2414::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59696586-824b-11ef-99a2-01e77a169b0f;
 Fri, 04 Oct 2024 14:22:41 +0200 (CEST)
Received: from BL0PR1501CA0015.namprd15.prod.outlook.com
 (2603:10b6:207:17::28) by PH7PR12MB8121.namprd12.prod.outlook.com
 (2603:10b6:510:2b5::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Fri, 4 Oct
 2024 12:22:37 +0000
Received: from BN2PEPF000055DC.namprd21.prod.outlook.com
 (2603:10b6:207:17:cafe::52) by BL0PR1501CA0015.outlook.office365.com
 (2603:10b6:207:17::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16 via Frontend
 Transport; Fri, 4 Oct 2024 12:22:36 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF000055DC.mail.protection.outlook.com (10.167.245.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.2 via Frontend Transport; Fri, 4 Oct 2024 12:22:36 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Oct
 2024 07:22:33 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Oct
 2024 07:22:33 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Fri, 4 Oct 2024 07:22:32 -0500
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
X-Inumbo-ID: 59696586-824b-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ayrvRtm/FEIs5YtgeD8OvCq9IXNE3lwjuacSb1LGre09rW0RwOBpOSozJNmLC5gSXSyJESHDqpAg6gXaOEihabrsiK5oB8z4OldyhDDQGBbHnFYwl/YxP1/zyxpXtwKZANPaBi8z8j2llPcwqlNb0pfF254H0rD7wBl5UxbWiUrctt6ruiFOS22EbxAzl975xfj43OE7iZ3LYeoCQPFwtcsp2lEjZQQ1cGx4XR1bhtf2r9B5dwECmUERKnlxeB3vTbAtJFQniDGAVhyw9iNPuEdFNzdGA1rE4I7e/6BUwkpLhgQ7yk6cg8yP5ogf4Qx4tsBX+gh/9bqjvnDw1BDLXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RdOa3RV+tWRNRzTlY1JHgYomlKbBfTaAePYvs1PDYVw=;
 b=GY6R7tJbjTg2U9cW3OIh6LHRiLJ3lPriGGo6UuCy/9wVMvEZ0zFdymCrYiEl4N84p7VQvYGGAgZpGJqwh0rf5eGei8YWpw5tD5ay5Qv31vjxrH33yhe5HkQNcS7j2LdgvMdnopxnkamQghWxbqzHHpvOIeQqG5al8scqb9djx9l7JoJX+5LyVzzj9f8iOOPGAGBANKahgH4J7SnFX9au6U4F3gp75kuwqFvgQXaRnxFXHb6eJjNxL1motM6sNMFl3DZklzaEY0r8WXndyM5I0NPd5K87IJhEuBH4lNMUTFRWdBBYKOL+HqIa5aAP0/m4rCP77/bVhEkz27tsjJf8aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RdOa3RV+tWRNRzTlY1JHgYomlKbBfTaAePYvs1PDYVw=;
 b=R7lWF1l0Xd4gkZ5u437TfVOUMLl55qgy+MPWeRJfrK3FKFZW2/MV0hvWfqMB/Ir5MspoMzlVbl2KlUx47tlPWYXkmNeusNkPv6+5hpsVNNXNNJg5JOjM8YJdd6xBlB/6up5yYEACnvwlNzWWCMghlMEi/hpOvvEytITq3g2AQ14=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v2 3/6] dt-overlay: Remove ASSERT_UNREACHABLE from add_nodes()
Date: Fri, 4 Oct 2024 14:22:17 +0200
Message-ID: <20241004122220.234817-4-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241004122220.234817-1-michal.orzel@amd.com>
References: <20241004122220.234817-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DC:EE_|PH7PR12MB8121:EE_
X-MS-Office365-Filtering-Correlation-Id: 05dd4bc0-71fd-450d-0b34-08dce46f3aec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u60ByXVVJx60MSC/4Cam0TgnSebUnKXj3y2HjJfL6epzz+hdx+T+1PIQvC9Y?=
 =?us-ascii?Q?hUpmNK5rnHKazc8I4GzEmItwQRQMaWjpGtIPLBEYTO6iicAelzmSDm7dbS+U?=
 =?us-ascii?Q?yJEaDAtq6JiZdpLR1QWZFOvSuLterS87XANaAIVp/Pn38vcGeMS6JDWLMTJd?=
 =?us-ascii?Q?JtfU0x0OW3v6DJyETYBczz9o4TBLqRDPM3BhZcQok+v23gPXf1PdctsHPzIC?=
 =?us-ascii?Q?KsL1PFtAaBHeAyZh8dcaRjv8eqb2UkAWf4UINySChPbRUDInUxVsgISMRmFI?=
 =?us-ascii?Q?9fxZXLsOeFTmL90CuWquCRswGEhqclD3U81X6th//7wi4UNo9LFz1RTFjIbK?=
 =?us-ascii?Q?V4OeTDCnuCK2IVhFqBSjPogdoYCkdwxhp9TuFYW4Ftjk2ZlYTOhTJPi3RySJ?=
 =?us-ascii?Q?dZFtXCB9sNTISL0TxlA0danfSVK5kaWuUCHrT9uK0aNRWzbSxZd3qmoU2j3W?=
 =?us-ascii?Q?7pmV4h9Rjc7GZtOkWHeIQ3XQy5ytfyPfN1GRVm8+gA4/TxvX9AwiulMdJe/Z?=
 =?us-ascii?Q?gN6Pm3sPMZWCh8LoIsG9blgQgkMelrBfnS245IvKv8mnhF/IIfOwHdP5EhQA?=
 =?us-ascii?Q?9YizLpR00E2PtXU7j1OnsAgJ+p41f3O6b1LCjPRLblYO+NBBDwhkVxudFfHz?=
 =?us-ascii?Q?DcXC2iQZKYFP6PlJQyzYU4NfNZLoaYKLY2/fIYntbAKcp3Xwh8eo7uVcwQfs?=
 =?us-ascii?Q?8afrEHNDd+wHIkoUH8yne+epD0xoIWs48rTChlEjSFrhvBYU1Bud70IMxAVM?=
 =?us-ascii?Q?zFfuCbC1e7V3ebxZZxQyRvtlX/CsVp/xs3pBxnsZPB0wYq0LuDLuFm7PS0w2?=
 =?us-ascii?Q?VV0jjfxMxICntfmMhBci5uCDibhNom1dz5hfo1mrnucriEYvyp0KB6Ti5ddU?=
 =?us-ascii?Q?tfdutDhE4rM0q4bg7IdEsGz+GUXUxIJc9N8Ujn4n/AXa6bnLXjTep9GsEP91?=
 =?us-ascii?Q?kX/Bjj3XKJqQ49K6dBCNvAGA7dEGDKgFULSZoaJ3xsWvDoF/i/lesMZWwmel?=
 =?us-ascii?Q?wZJmSQ1VtIKDsorkX9cZyQxRQEquO5Pex6qglENW5GKeMXtwSNEC0Dp0THv7?=
 =?us-ascii?Q?OV9aGSkVP0SSY9L6QLEfDYSot4EyUNgS1Z8dAQU3vwMWoiFDASjYKpnxAePF?=
 =?us-ascii?Q?bOxpM8Y5v7BLcrSGtiVB/15ujNV3eOjWJBMO2X5grLQ8F+9kxaB1vnpSGqIo?=
 =?us-ascii?Q?2TDgzxFBgblGzLddaR1MjoKqt93fYLKxcewZpjFgzmqHo4zvssaK95tWcT2d?=
 =?us-ascii?Q?FVfZQ9NnfiQubQU/hYKQYoWYu0m5UlknGpQwqt1wzPaEKnC2T8OCe/+Bvub9?=
 =?us-ascii?Q?d8BGxK7xJYkOjxgjm6BuPFS/ly1aeG+4sJd02Uo1COij2lK0eb8goWaTwqIQ?=
 =?us-ascii?Q?Oz1yx8wUCyFg7/RcubZdxd8SYaTI?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 12:22:36.0193
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05dd4bc0-71fd-450d-0b34-08dce46f3aec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8121

The assumption stated in the comment that the code will never get there
is incorrect. In overlay_get_nodes_info() we manually combine path from
target-path property with the node path by adding '/' as a separator.
This can differ from a path obtained by libfdt due to more advanced
logic used there which can for instance get rid of excessive slashes.
In case of incorrect target-path (e.g. target-path = "//axi"), the
comparison in dt_find_node_by_path_from() can fail triggering the assert
in debug builds.

Fixes: 0c0facdab6f5 ("xen/arm: Implement device tree node addition functionalities")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Julien Grall <jgrall@amazon.com>
---
Changes in v2:
 - Add Rb,Ab
---
 xen/common/dt-overlay.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
index 8606b14d1e8e..d18bd12bd38d 100644
--- a/xen/common/dt-overlay.c
+++ b/xen/common/dt-overlay.c
@@ -596,11 +596,7 @@ static long add_nodes(struct overlay_track *tr, char **nodes_full_path)
         overlay_node = dt_find_node_by_path_from(tr->dt_host_new,
                                                  nodes_full_path[j]);
         if ( overlay_node == NULL )
-        {
-            /* Sanity check. But code will never come here. */
-            ASSERT_UNREACHABLE();
             return -EFAULT;
-        }
 
         /*
          * Find previous and next node to overlay_node in dt_host_new. We will
-- 
2.25.1


