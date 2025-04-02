Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C06FA78A3B
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 10:43:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935213.1336660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tztgS-0003BG-6p; Wed, 02 Apr 2025 08:42:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935213.1336660; Wed, 02 Apr 2025 08:42:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tztgS-00037B-12; Wed, 02 Apr 2025 08:42:52 +0000
Received: by outflank-mailman (input) for mailman id 935213;
 Wed, 02 Apr 2025 08:42:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=trQc=WU=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tztgQ-00033V-FN
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 08:42:50 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2416::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7385deb0-0f9e-11f0-9ffb-bf95429c2676;
 Wed, 02 Apr 2025 10:42:48 +0200 (CEST)
Received: from BYAPR07CA0076.namprd07.prod.outlook.com (2603:10b6:a03:12b::17)
 by DS5PPF5FAA0E762.namprd12.prod.outlook.com (2603:10b6:f:fc00::651)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Wed, 2 Apr
 2025 08:42:43 +0000
Received: from SJ1PEPF000023D8.namprd21.prod.outlook.com
 (2603:10b6:a03:12b:cafe::4a) by BYAPR07CA0076.outlook.office365.com
 (2603:10b6:a03:12b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.54 via Frontend Transport; Wed,
 2 Apr 2025 08:42:42 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D8.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8632.2 via Frontend Transport; Wed, 2 Apr 2025 08:42:42 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Apr
 2025 03:42:41 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 2 Apr 2025 03:42:40 -0500
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
X-Inumbo-ID: 7385deb0-0f9e-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ci2VW9F6hTyqDnA0aSBAhnFMY2WMqBjEoCzrH5zl26y9/NBSg4dNkSZBQLsPv3qbRDpVYImnmiQwlAEhXhiU3qzhh4gTpvgi3HDWPookGYP/vI3xbJHjvENbNtZ++si0ucHzKB05Y6W0JoIE5IzV+SO2IwMWjflaOTYFOkhP5s7T04qagutKkSM5XNJq3U57dnmQEH5nQT+nEujwxu5M+7B4qwWfZPuGEptnbkEWW6SLz4Q2b3LsH3umHbefo/m+AWT731lMV6pZqDHGZ83aPBWedvtHvxK9OmJdhwd8q/Gzcu5cRbtet+6iFv2Qyx9s/4t5K2nfrk9W3xd4CBJb9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TZljzGrNQy2MisI0mWr7E+MgWiJzUwr6Rox2FFdPBos=;
 b=o9r7bWLt4ElxKAq09CtCWBQkDjpHMTqqALK/hAOYSO1aVe71QLjcuHLSHRBEOcqe+hGQkKcwFlu2YlVQ9Nrw9iMU5++EwF/mZsFyE+mbXc8U+/vIMozyUZvoi2qn4Mo0dB7mTD913XNJ/eUQv4s9Plfsd7jBwV1LGqIGKViGLug/LmP8zRrE8KdnSpuGwwI/EahoJwLLLvfPp6+X5qf+JczCuzAA6Sqa42vpu/K6sLMtE0r8Up/9J85wP0D53YScdxTJW4VdrB2gwlsK+V5rqHG3uUd9CCWwxcYitRIqeoDeeZewgg70O1vrSuJccN+GVfDksL6AgP5K4GFgLV4uiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZljzGrNQy2MisI0mWr7E+MgWiJzUwr6Rox2FFdPBos=;
 b=pIVqOfSNKBSRDT0eS3gIyjSe7O+ZONlkZmgElGkT01+XbjPXTjQYTE0Aif1fBz9iDLpKKfGbHYVk3kP94edqwsmguGRURAwnwV5ohUbCZMQtrKtHpaB/rNp8crKRzJ4cVW96VjHVmV55Y+SnfGliWEY98M5DnxhWhRf9VPm6IxQ=
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
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] xen/arm: Drop process_shm_chosen()
Date: Wed, 2 Apr 2025 10:42:33 +0200
Message-ID: <20250402084233.114604-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250402084233.114604-1-michal.orzel@amd.com>
References: <20250402084233.114604-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D8:EE_|DS5PPF5FAA0E762:EE_
X-MS-Office365-Filtering-Correlation-Id: 393196b1-f36a-4e87-0dca-08dd71c2557b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fMzgybBru1xBuIywczwfWY6RCmhyxWywk0EczLBVthWs0QE0SYpEErM+kmZC?=
 =?us-ascii?Q?+tsc8tHeYxQ0V6r9+eC43mYp70Q8lu8KWFHONFzxsejJKS8wfkJzfrGRR7tN?=
 =?us-ascii?Q?mm5Oorcy1HVKteq3jtIDR3XYbm2D8ID7GTuyVHCGEvKm4Zj6SzvypkbvLUcn?=
 =?us-ascii?Q?AvfA7J03XBP4SAA8in8l0bjrCTEpv1SuVFZqARV7RoF06gkXbUSaPsQjKF0n?=
 =?us-ascii?Q?8AH85SJTEa7SkQnROIPC9PywkCDqoFbxZeTkkUzHtQeC5HItKPurPGQ/SmrV?=
 =?us-ascii?Q?JCXqpToglt2qKOmhS5s/MIJJAThSHQDY46H3brtW3QzrujZLgEn2tqACWKMj?=
 =?us-ascii?Q?mC0oRmIBJ5YqLMZRHzap/EcW3+QoOg3zP0C7FFKj3MaGi4Ww3X0b8c1N0ucv?=
 =?us-ascii?Q?teJjAMY7CcdynfhTTpZot9+5QHmMnvL5rsyQXwbWUOcE5kI68Z7eOR2w3skG?=
 =?us-ascii?Q?tRwJ01j1MWQUzIj6v7nV9jjjrezbYT2N5HaAi0j+HdRdTl7pI8ArGALrm4PK?=
 =?us-ascii?Q?gro/o1lnwcQ8q5PUiLy36U/IYgnnkZQUvZiQfWVLcEiO82yCa5jB1To9ZdaZ?=
 =?us-ascii?Q?xkAJjLJwDBS2OJMKUtXk4x22yHU+LCw2eAWqIFc1By7pgqDkbXTNitoyaNhd?=
 =?us-ascii?Q?HewIz6SDQMhCbDyRuXyg8q+35ATlwOwdxXeRdQrOX0Y8TElPFd6/lxqKiAf7?=
 =?us-ascii?Q?NZv8uwkSGBx2zpIegzXBPVOon9ruOIS5ef5ZR+R3R9HCyAkwNYkRqR9WyL/F?=
 =?us-ascii?Q?wzH+zIOkwjJmKq6mjzKQqxNQml7mXzMzaV+51hk1i3/PorVtga1mub0UM6Tq?=
 =?us-ascii?Q?+bcRly2WHy6wBBpkXUHGj5Vh0MFjzArdIy4bHniMFaVJ7rujJbNlvs6+8jBR?=
 =?us-ascii?Q?QQZ/pj/OyJMu95X658UdRyCt7dyY2BOaiS878zNYkzw7Noz0HbDj+LGKNGK/?=
 =?us-ascii?Q?nRyctsGPMXHwXnNJtdsGRJxhTCvjlfLlu00P2BdYhZzAVzs9cFRPIJMUQIbF?=
 =?us-ascii?Q?SBMwM937suyYSCthIW5w0Qo4nhkRp/Jkz+DbU8sWPRqU+Xmdg3c+oRBTCQD3?=
 =?us-ascii?Q?WOUPTtuBrRSind5/ltil0v33qhrKQ7QtebhKed1godBFOKjy2lUAJFyoFVIn?=
 =?us-ascii?Q?S6pkMlWWAy60BSW3Nr/l0sb1j4HEsl9vSEZWIEZDSke6+Lkv+qnnH4XSuKbh?=
 =?us-ascii?Q?+wbPx113lZ8u1dgMGdVBbg0lMMEwy3Obgip/eD+cGG5eKvhh1tIW2jUiLkvP?=
 =?us-ascii?Q?rMAKIqVxBFjoaeXdPvitLSfnK0JyIHxw1Pumr4X4b330nLFLaY04oirGk/Br?=
 =?us-ascii?Q?sMZQxTCXkC392/XrfnLEDSaqXjBo2U5JHenUIr/Y0dbqCbW+vkYvUUf1Fr60?=
 =?us-ascii?Q?4TxRafl9Y46YsJhb7Nv+sCNma7O0IY0VwDC4Trq5PHc+ySeLf1muD9/iRZRC?=
 =?us-ascii?Q?hp1Y4wqrbvvPewyBnLp9hfkb1LFZjDLnDTc8NJw3FsLR/SQSkgRv0C6+kyaW?=
 =?us-ascii?Q?P9A4UllIP/Mc+Z4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 08:42:42.6865
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 393196b1-f36a-4e87-0dca-08dd71c2557b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF5FAA0E762

There's no benefit in having process_shm_chosen() next to process_shm().
The former is just a helper to pass "/chosen" node to the latter for
hwdom case. Drop process_shm_chosen() and instead use process_shm()
passing NULL as node parameter, which will result in searching for and
using /chosen to find shm node (the DT full path search is done in
process_shm() to avoid expensive lookup if !CONFIG_STATIC_SHM). This
will simplify future handling of hw/control domain separation.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
 - rebase on ACPI fix
 - add BUG_ON for !/chosen
---
 xen/arch/arm/domain_build.c             |  2 +-
 xen/arch/arm/include/asm/static-shmem.h | 14 --------------
 xen/arch/arm/static-shmem.c             |  7 +++++++
 3 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 85f423214a44..634333cddef3 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2327,7 +2327,7 @@ int __init construct_hwdom(struct kernel_info *kinfo)
 
     if ( acpi_disabled )
     {
-        rc = process_shm_chosen(d, kinfo);
+        rc = process_shm(d, kinfo, NULL);
         if ( rc < 0 )
             return rc;
     }
diff --git a/xen/arch/arm/include/asm/static-shmem.h b/xen/arch/arm/include/asm/static-shmem.h
index fd0867c4f26b..94eaa9d500f9 100644
--- a/xen/arch/arm/include/asm/static-shmem.h
+++ b/xen/arch/arm/include/asm/static-shmem.h
@@ -18,14 +18,6 @@ int make_resv_memory_node(const struct kernel_info *kinfo, int addrcells,
 int process_shm(struct domain *d, struct kernel_info *kinfo,
                 const struct dt_device_node *node);
 
-static inline int process_shm_chosen(struct domain *d,
-                                     struct kernel_info *kinfo)
-{
-    const struct dt_device_node *node = dt_find_node_by_path("/chosen");
-
-    return process_shm(d, kinfo, node);
-}
-
 int process_shm_node(const void *fdt, int node, uint32_t address_cells,
                      uint32_t size_cells);
 
@@ -74,12 +66,6 @@ static inline int process_shm(struct domain *d, struct kernel_info *kinfo,
     return 0;
 }
 
-static inline int process_shm_chosen(struct domain *d,
-                                     struct kernel_info *kinfo)
-{
-    return 0;
-}
-
 static inline void init_sharedmem_pages(void) {};
 
 static inline int remove_shm_from_rangeset(const struct kernel_info *kinfo,
diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
index c74fa13d4847..e8d4ca3ba3ff 100644
--- a/xen/arch/arm/static-shmem.c
+++ b/xen/arch/arm/static-shmem.c
@@ -297,6 +297,13 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
 {
     struct dt_device_node *shm_node;
 
+    /* Hwdom case - shm node under /chosen */
+    if ( !node )
+    {
+        node = dt_find_node_by_path("/chosen");
+        BUG_ON(!node);
+    }
+
     dt_for_each_child_node(node, shm_node)
     {
         const struct membank *boot_shm_bank;
-- 
2.25.1


