Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F27A77743
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 11:10:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933790.1335638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzXcz-0001D2-9Y; Tue, 01 Apr 2025 09:09:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933790.1335638; Tue, 01 Apr 2025 09:09:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzXcz-0001AQ-6p; Tue, 01 Apr 2025 09:09:49 +0000
Received: by outflank-mailman (input) for mailman id 933790;
 Tue, 01 Apr 2025 09:09:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yHas=WT=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tzXcx-0001AK-79
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 09:09:47 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2413::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0da11553-0ed9-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 11:09:44 +0200 (CEST)
Received: from BL6PEPF00013E11.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:17) by DS4PR12MB9684.namprd12.prod.outlook.com
 (2603:10b6:8:281::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 09:09:41 +0000
Received: from BN3PEPF0000B069.namprd21.prod.outlook.com
 (2a01:111:f403:c803::1) by BL6PEPF00013E11.outlook.office365.com
 (2603:1036:903:4::4) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8583.39 via Frontend Transport; Tue,
 1 Apr 2025 09:09:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B069.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8632.2 via Frontend Transport; Tue, 1 Apr 2025 09:09:40 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Apr
 2025 04:09:39 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 1 Apr 2025 04:09:38 -0500
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
X-Inumbo-ID: 0da11553-0ed9-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EkG/I8ehET7N/0ntQI5GQ8Uj5I0/qeyDo8RC0k5Hytt6IDqEokLk4dcPP/FNHvb9Sk5VXbDFetz66NyMjIpqwmh/ZdxwgcCiMR4RaQ5G8JMY4jVADBgh1eyQeqYZTBABG95hAkmBna9BdlmEnP4/O/TUQFGjteemNTIN6TgoaV0X2VuTA/zjdW4PLj3uZ0oauQgiYvsQ6z+/0Q2bwxDC/ZF2mMzmq1qL/UpmIurp4Jv4UlYvLEiA2+kWAiam56hvHErGQbVxHNYb6ZaUf4+86eaD0JizIWSPEBb/ULA4rVx+uItdYJu0HjWcu6XW+C13N6VNevsxQIenv09EPB9XOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1xofejERuiNYRNRtkzxZ8405VkZ3ajr+w43Np80D7Zg=;
 b=VGfcBoz/ZuhjklbMiawrXU/zKqhA5nZecmCZUowK0ldms1BifIQIG7wu5dYUgV97TnQwigPunw5/biKjgx1i5YQ+cx1Pv0avI9RyhDvUfK8kfsclUO53kawttRVQLT75EHSDMZ25h4FK5aGBs/d4mr4Km2ieFfS/sYFOeMHDYCh39njOy8bMb3/ML6uaSskFw1oShBLgLo3TmFaos9dAsVneeKkmeujblckhOV20V8N5rmklE02HBs3HeaEAi7u/8JxKZuKC6Lh9mAuICYpewgsgAFzkQ4mvY1g7VWlkTmdzKwLR46LFm24ej7ATYyquq5dxXuEELsjVYPp6qwXIRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xofejERuiNYRNRtkzxZ8405VkZ3ajr+w43Np80D7Zg=;
 b=cpidvbtuo5lJVX60Myy7cDl6xtHKpwmS2EDG6VxCHjI3cpUodT0NKkBM1zfWRHmSXKeOC8QbenST7O0fX+Yu/6G7UjO1eIvuYfSynBeoYdEF6YloYcsZKqE9AK4BygKv9tdOChJ+MypP3D5azNabUGcBTF/owQQ/bqQBfgYxUoI=
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
Subject: [PATCH] xen/arm: Drop process_shm_chosen()
Date: Tue, 1 Apr 2025 11:09:37 +0200
Message-ID: <20250401090937.105187-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B069:EE_|DS4PR12MB9684:EE_
X-MS-Office365-Filtering-Correlation-Id: 3143e36a-62bf-4e12-069d-08dd70fcef56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2zaCbIFbqlsoaKNrQfrJhhnGlCsKqck/504OxMIi1UrBF6GA7c36o2lBw7hh?=
 =?us-ascii?Q?V2o2Lb+P9q0RCrzBpmSpxATMk3VDI6+vLuVuvdaRyphAT36fc2poRZf23wTM?=
 =?us-ascii?Q?5kr5mzw+hYYlf3qw04jhlqa5CrTQyjknxVeiPUT6E/jLHcnz96lexz1ro/9t?=
 =?us-ascii?Q?IvhtFL0RyDKyc9pKKGVIWPhN3/OSyjccUq/gZ5HnJs7cjcr4oLy2P4KV6xzy?=
 =?us-ascii?Q?BoU5iEgb1bYodsPJWn24s06QHkqQGtkB3dLHAfbiJC+mRumBcahFHL44G6Iw?=
 =?us-ascii?Q?AWZuxJ2fFExPb4zCijCwxAT/F3zfQ7Ew7KeMAms5uS5p7e43lQVtfCej0KHl?=
 =?us-ascii?Q?VBGF5SEASsGAXOaJJSFJf6szSpcwFFYF4epnoWHkcfYEIeJRzYl5XP3If4J2?=
 =?us-ascii?Q?rmNYUlODQMEa51m6Num7Xzwml+OxOiFQHlN4aT2lfePmCzZh6FyiR1sLqggf?=
 =?us-ascii?Q?SmAv8D0KMSuPO8lVEWbAhGpftpnA/QAgwsKOPBQIAFJ2HWRCweg0t1ksuhNS?=
 =?us-ascii?Q?vMda4XiaOQWLK7cJo1LVhk4+hyGtm6Ha2YXAdz0c6qb2j4yPGAfpMd254tM6?=
 =?us-ascii?Q?c+3oKQvF6skhifoGWh6o79+TakTWUgn6HVGLk1fHEXkkf0A/bgoOkPVgt3n2?=
 =?us-ascii?Q?T5R/Eev8OBplu0lK+ynwCekxHE+9mNqg0RvHQHcJ0m7McycLsDyAiuoD/ui2?=
 =?us-ascii?Q?XbsdXgvOqFH0mUHkTOZZ2vZyvfbrhlAZPn5hewJ7u2y4QK6Qnh4czZpDpmsM?=
 =?us-ascii?Q?hQ+aEHxNU804g/hp8CEYKq/QudgXjuXikEATmQk+r4DZbXLas63Dnzj/XxPw?=
 =?us-ascii?Q?umXfE+gCBuOw8Zg6rFaoBSbJOGLTjwPQb084j9bVmaQ7iQvYgyYcNHOGQ3NV?=
 =?us-ascii?Q?Vh9b5y6cDsrWbBpudIa0Abi73b+uM1hzUZg63P7ciAFEZLT+jkL1aulFrO6N?=
 =?us-ascii?Q?WtQl90Qq3W2nwFx2HDXM54FHpZ1O94R7cP0iFDfwy2LiwotyeoHSgOusUn8j?=
 =?us-ascii?Q?SE5BHj1QFo+fS1VuqYdh0KfsLMKSBYoI5oCsMB+hL6AsdoleWitfxUyQxRMM?=
 =?us-ascii?Q?h9cw1l/6aveTcDWwR8Kd/5kG2vL/ezCnNqq+jNWBosHyUO4sUsmNSY9Jiaaj?=
 =?us-ascii?Q?zk08NPX8FszmaDzB98ydyCkngYOWQGKg6OAofT8EZfVWI1ZZjZaWSrXnxvKm?=
 =?us-ascii?Q?tC+0MgXvj1/oMxuU27F++GLzGgaAIjq7TzpO0B88nhckBX86lyrid3+/XYkb?=
 =?us-ascii?Q?dDJpPsbHkpLO4V+V3RABmxmEhG37/42VonwDj2+JHZh7EUI4hjAiQK/oQkUC?=
 =?us-ascii?Q?jEIaWWJPW+4h1EeBFrNP3xeNQUwMMp/g21aCMnc3tP5cd+7y2aoL/44vuCSn?=
 =?us-ascii?Q?EB5jd5cFZxYLqKVfLFIQJccI3RHE/w6NvCBUQnW5VF6K8hPnibIrdbga2i7Y?=
 =?us-ascii?Q?RanbE0e0q4DEi8GHtz6Y2dhBiwrt2SHF7pnGjnQ3Lz9w3SmJPP6w2M9nVdj0?=
 =?us-ascii?Q?ExVdCC0CE7LAhco=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 09:09:40.5519
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3143e36a-62bf-4e12-069d-08dd70fcef56
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B069.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9684

There's no benefit in having process_shm_chosen() next to process_shm().
The former is just a helper to pass "/chosen" node to the latter for
hwdom case. Drop process_shm_chosen() and instead use process_shm()
passing NULL as node parameter, which will result in searching for and
using /chosen to find shm node (the DT full path search is done in
process_shm() to avoid expensive lookup if !CONFIG_STATIC_SHM). This
will simplify future handling of hw/control domain separation.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/domain_build.c             |  2 +-
 xen/arch/arm/include/asm/static-shmem.h | 14 --------------
 xen/arch/arm/static-shmem.c             |  4 ++++
 3 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 2b5b4331834f..7f9e17e1de4d 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2325,7 +2325,7 @@ int __init construct_hwdom(struct kernel_info *kinfo)
     else
         allocate_memory(d, kinfo);
 
-    rc = process_shm_chosen(d, kinfo);
+    rc = process_shm(d, kinfo, NULL);
     if ( rc < 0 )
         return rc;
 
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
index c74fa13d4847..cda90105923d 100644
--- a/xen/arch/arm/static-shmem.c
+++ b/xen/arch/arm/static-shmem.c
@@ -297,6 +297,10 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
 {
     struct dt_device_node *shm_node;
 
+    /* Hwdom case - shm node under /chosen */
+    if ( !node )
+        node = dt_find_node_by_path("/chosen");
+
     dt_for_each_child_node(node, shm_node)
     {
         const struct membank *boot_shm_bank;
-- 
2.25.1


