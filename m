Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF5097C831
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2024 12:45:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800601.1210572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srEfI-0004sZ-CV; Thu, 19 Sep 2024 10:45:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800601.1210572; Thu, 19 Sep 2024 10:45:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srEfI-0004pO-8i; Thu, 19 Sep 2024 10:45:36 +0000
Received: by outflank-mailman (input) for mailman id 800601;
 Thu, 19 Sep 2024 10:45:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9goU=QR=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1srEfG-00043V-DB
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2024 10:45:34 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2416::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ab526a4-7674-11ef-99a2-01e77a169b0f;
 Thu, 19 Sep 2024 12:45:32 +0200 (CEST)
Received: from MW4PR04CA0246.namprd04.prod.outlook.com (2603:10b6:303:88::11)
 by PH7PR12MB9074.namprd12.prod.outlook.com (2603:10b6:510:2f4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Thu, 19 Sep
 2024 10:45:28 +0000
Received: from SJ5PEPF000001EB.namprd05.prod.outlook.com
 (2603:10b6:303:88:cafe::9d) by MW4PR04CA0246.outlook.office365.com
 (2603:10b6:303:88::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.26 via Frontend
 Transport; Thu, 19 Sep 2024 10:45:27 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001EB.mail.protection.outlook.com (10.167.242.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 19 Sep 2024 10:45:27 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Sep
 2024 05:45:26 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Sep
 2024 05:45:25 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 19 Sep 2024 05:45:24 -0500
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
X-Inumbo-ID: 4ab526a4-7674-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BV2TD623yCKhf50tyHuXh+Ue52zd95akzrxfhDBrd2MPvbNlTsSMxo9zvu9Sr4fIF61jhjk7Cx+Ha+EVztRrtvTMgGbaL7Ye6umyutJTLfBCDliXTNkgHMZ6R1t1hfd59cYMYpi2TpZsrWBbnx8EnQve4ib0YHxh8VIdGA11Aq1lEjR6kRouaiJq57u2QIt1O0IWdxAVOIIhrirHhRfxmD/LKb4FmbaIsNnx1FbQlaj2zet1FsHGiX3jZmIr5FEJl+jhMIRVNXwElCtXiqO2HTd4ET6K8WytLpo93FwZaZttpjzwfy2ZYxy/mVsPoSgtFv3llcZGCRiw4czYpWAWZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQjI7cMFWl7vGE3FBptt0AMsIehS9gCRp7pEUcchVYw=;
 b=KKQear7I3QTcnyiSfDvOvF8XK3ZuymRap2kKeOQWfeE2X/SCmBP3u6v3/KvyAreaFwXNMKUxaHo/GVr3ytmmSRZxry8fCp12IavLXp8coLVl5MSw1fi7nyufhf9yPmyFZ+xLZvQm16JaycZvofSApVmJ0CardFOGFlBrklggOh0FIuHlRSsl599epqRqlKSOzufOE7wM3LJuUBFc+Z7co6xlnFPUb2M3a5TvIzYxPxxvooEIF5Q3amQd128H1Le5hf42haZsTBtrpVr1O/dR57mPEr53Y9/e/Rx85ZSHuf9kMgkwy4B6YIoOnspy9SEMnnwdts2UjKhQG2gUnWMi3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DQjI7cMFWl7vGE3FBptt0AMsIehS9gCRp7pEUcchVYw=;
 b=p2ZB0zD+sn9RfEekLS3CJksmPRRWmeJwl/+e9q61tapzTQsHq2lG1aHt2SyqH1s+L6zzHqvHBN1c+TUI0Il+ezH2ogz+SElGGInmGVzWkgfDMfftaaUaP+8k80/sMTwzv81HWWIEUuXFNtUidR9Y/93vDRzHTgj1mz2Iwj2GeAQ=
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
	<bertrand.marquis@arm.com>
Subject: [PATCH 4/4] dt-overlay: Support target-path being root node
Date: Thu, 19 Sep 2024 12:42:38 +0200
Message-ID: <20240919104238.232704-5-michal.orzel@amd.com>
X-Mailer: git-send-email 2.37.6
In-Reply-To: <20240919104238.232704-1-michal.orzel@amd.com>
References: <20240919104238.232704-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EB:EE_|PH7PR12MB9074:EE_
X-MS-Office365-Filtering-Correlation-Id: 5da4be19-0aeb-4e4c-dfc9-08dcd8982c85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Nxb9Sdg/7MFMrb8lNA7D+MyNwLrjnJFBERfKRlANtrBNU5p+aTQjKSjpTz9b?=
 =?us-ascii?Q?zq/HBaZoCZdGTdC8KkJ/S1wKAwoM4H5Bc0rkwLcCa5uc9Lx8onTZNMD1QYCS?=
 =?us-ascii?Q?NJtP0bGmvB92IwIugM9zlj/TuAYrJHC2fAyLSMc1m8ITe3L/iseAIMRZFzd1?=
 =?us-ascii?Q?Wajhq1Y5bb1NKB/G7O+gbWt5un1Moztc2mn/dA2TfgGA94426Wsgc2YbBDeQ?=
 =?us-ascii?Q?rLzEHUhKF8vy9Pc3mdayCmQlruz5IT5bJzART1hDEPjTQSQwpteq/w9KHC1R?=
 =?us-ascii?Q?vCRGlgd8jJiB5pvZ0M0JgyacXqHC/3BM1LbTReVIXujErxOI0KZCIJ2d3sgM?=
 =?us-ascii?Q?mTySgKMawbeXZZ2DyZ1AMP1Pi3v49SfLRILQkO6yh/XVBvO+EGUPQ1jN0M/n?=
 =?us-ascii?Q?aw3665F2V+7RQmBQAH4wtRsmfjBco8awa7MXF9PS979zJn+FAvPQwb/U/AJ8?=
 =?us-ascii?Q?nkENKJ8gU1dZV1do9WzcgoqX0L6y6n3h/aWgxo38QgTStYMG9oBfMc8s5y8Q?=
 =?us-ascii?Q?xDb4iwOA0okpykQfdZGeZegHyz7pMizpD3wIZmKXYMHtb+vP4odyBGJJddZZ?=
 =?us-ascii?Q?mUHbg1i2lZDz6yoazU+vrEcAP8z4M/mxAnLrYXkF9mkGrifEHU4YcL0U9yvH?=
 =?us-ascii?Q?Ayxf1CUCNyCf6u0Dx49aIV85B1eQDR3n0z4cfynKqj0ORcykqrktEoo3pz9e?=
 =?us-ascii?Q?UqTDSMYogzBu+qboPVIqjkcKTKzxgvpjYJboOdFS8JfAzZZs01nBGjvY0eGg?=
 =?us-ascii?Q?EfacgeSw+qK4ImVl/DZFkkGn0JYtm/hqnHQJf8ncsvIaSHUlbMv5L/mmkVj9?=
 =?us-ascii?Q?FBaL5l+orW0n5sEqxF4it+mM67gc7WAVdHBe5uIO7wZBx4lL/i/LXtbF+IC1?=
 =?us-ascii?Q?ZdHZz33aHK/ZO47CjdKcBML7yoplBME1Ytm7+5dLIGuoitfnjqR5qJIC3J8z?=
 =?us-ascii?Q?dwi3/ST++M+XHiGCicUIM3tP59fJi+YpVyqmu9giIFUeNmzsvSyM6zwPwmll?=
 =?us-ascii?Q?waL/2a32tSgVw+sTMWTRlVsMcmR6Kt1wVz7GAL1C6WB9rTpxff8Y6Vzqbutg?=
 =?us-ascii?Q?O0KbQiEk46Zp2YLjmY7LStQ5Qiq6tPsqP2N0dpQNfZbc5Eep9lfJlBb4Do2e?=
 =?us-ascii?Q?H1prPegTlkeCuBp9HNk+/iiCz5GMgHRgMa/Iu1MzTHLxaOXajT9lQaxVKbmi?=
 =?us-ascii?Q?BsVz+HWJd8d820n0ttju3vIdzJPgXxp/Qp/h2tX+a9XuSppg85h9m4u7GeKU?=
 =?us-ascii?Q?69iFUcTiWhm8HXKM6g/ab9HnYx4BGe4h0mH86u8HZCZ1BTxIgO5zGlwEATsZ?=
 =?us-ascii?Q?iG0488m73V9RORuQoy6dKv5D8pttYqnqUZfGUDPLovT7mykHW/qI31ONQEXj?=
 =?us-ascii?Q?llB93WL6/uhx9qeGuXGEzJEEmsN32lWkrFt4exH87oBkAcqOmK8bYZCw3Aeb?=
 =?us-ascii?Q?dd9KR5J1AoGuGwTTnL0fAsIAAdzJxzuD?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 10:45:27.1804
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5da4be19-0aeb-4e4c-dfc9-08dcd8982c85
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9074

Even though in most cases device nodes are not present directly under
the root node, it's a perfectly valid configuration (e.g. Qemu virt
machine dtb). At the moment, we don't handle this scenario which leads
to unconditional addition of extra leading '/' in the node full path.
This makes the attempt to add such device overlay to fail.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/common/dt-overlay.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
index d18bd12bd38d..63b28889de90 100644
--- a/xen/common/dt-overlay.c
+++ b/xen/common/dt-overlay.c
@@ -325,6 +325,7 @@ static int overlay_get_nodes_info(const void *fdto, char **nodes_full_path)
             int node_name_len;
             unsigned int target_path_len = strlen(target_path);
             unsigned int node_full_name_len;
+            unsigned int extra_len;
 
             node_name = fdt_get_name(fdto, subnode, &node_name_len);
 
@@ -332,10 +333,13 @@ static int overlay_get_nodes_info(const void *fdto, char **nodes_full_path)
                 return node_name_len;
 
             /*
-             * Magic number 2 is for adding '/' and '\0'. This is done to keep
-             * the node_full_path in the correct full node name format.
+             * Extra length is for adding '/' and '\0' unless the target path is
+             * root in which case we don't add the '/' at the beginning. This is
+             * done to keep the node_full_path in the correct full node name
+             * format.
              */
-            node_full_name_len = target_path_len + node_name_len + 2;
+            extra_len = (target_path_len > 1) + 1;
+            node_full_name_len = target_path_len + node_name_len + extra_len;
 
             nodes_full_path[node_num] = xmalloc_bytes(node_full_name_len);
 
@@ -344,9 +348,11 @@ static int overlay_get_nodes_info(const void *fdto, char **nodes_full_path)
 
             memcpy(nodes_full_path[node_num], target_path, target_path_len);
 
-            nodes_full_path[node_num][target_path_len] = '/';
+            /* Target is not root - add separator */
+            if ( target_path_len > 1 )
+                nodes_full_path[node_num][target_path_len++] = '/';
 
-            memcpy(nodes_full_path[node_num] + target_path_len + 1,
+            memcpy(nodes_full_path[node_num] + target_path_len,
                     node_name, node_name_len);
 
             nodes_full_path[node_num][node_full_name_len - 1] = '\0';
-- 
2.37.6


