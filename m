Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10164AAFB32
	for <lists+xen-devel@lfdr.de>; Thu,  8 May 2025 15:21:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979388.1366041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uD1Bn-0006ah-CW; Thu, 08 May 2025 13:21:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979388.1366041; Thu, 08 May 2025 13:21:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uD1Bn-0006XF-92; Thu, 08 May 2025 13:21:27 +0000
Received: by outflank-mailman (input) for mailman id 979388;
 Thu, 08 May 2025 13:21:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IqQS=XY=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uD1Bm-0005gg-6D
 for xen-devel@lists.xenproject.org; Thu, 08 May 2025 13:21:26 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20630.outbound.protection.outlook.com
 [2a01:111:f403:2412::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 555ebded-2c0f-11f0-9ffb-bf95429c2676;
 Thu, 08 May 2025 15:21:23 +0200 (CEST)
Received: from BYAPR08CA0009.namprd08.prod.outlook.com (2603:10b6:a03:100::22)
 by SJ5PPF28EF61683.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::98e) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Thu, 8 May
 2025 13:21:13 +0000
Received: from SJ1PEPF00002323.namprd03.prod.outlook.com
 (2603:10b6:a03:100:cafe::bc) by BYAPR08CA0009.outlook.office365.com
 (2603:10b6:a03:100::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.32 via Frontend Transport; Thu,
 8 May 2025 13:21:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002323.mail.protection.outlook.com (10.167.242.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Thu, 8 May 2025 13:21:13 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 May
 2025 08:21:12 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 8 May 2025 08:21:11 -0500
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
X-Inumbo-ID: 555ebded-2c0f-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gYSZY/IaWV1JmK2nvjWIcKYTOX1umU5ouK+cCenZrgyd9XLLlr44oU7U9UUKEk2g2/X1mIfmrL3Q9LegyBwFhSAXdllNsiwl3HWD0Yq7SFQyN9RHSDPJLHBlE5TsoMdMZzXQUGYWcWRGyAxDz3gtI/wiuYDjJXgztgDykbO26/3oNNX67om6SNhqp572wyiy8ptt4FZpdFroZEuNT7m2stpQXTOk3WXVUHKgFO27Eg2qWNZrUPlUTECBiPMudJCYlb7Oxn7lIZ3w4eWi8y1M3RPKfhwCfXoWgqyrxVAxeYmGi+6mJem5XZi0lCvAiUizC5o2rXJJ1RfN8wB5OosLdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s98qA+3lKzwYOBQMdaI/VMDUPTm2nFYBtd/o5egu+bU=;
 b=faqfcsseKWdg4QWxnJ4rd5jVoSnohmxHqm+8MN0qNOSxTjewo/ATvEjWNxeOOlacQ7xALIhFoVVi9bt8oAzd9f/fJf7EK46GbdmQBAu2lITtfBjoxQ8WRjhU1FhoBnB4Q11VHXj9b0ilVQi3/5XtQA3sK05n4zDW0SNj7cmOuK3EqvWU+2V6sNRB0siUrkWlrlup7zdSs6Kb+WN00qMJcW8uG9VgFPNiGBZKYFhIOnBTMdDkoA5JVuIzQSdJzvBHeM2cz5c8JzvoG70C1n2RzCZGQg9/XpyHtIPaHxAruzEQIkyqHO9H80SsCK1IqAnEMcOGsVxzVv+OpiknEh+/vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s98qA+3lKzwYOBQMdaI/VMDUPTm2nFYBtd/o5egu+bU=;
 b=kp3pMFaGj1gmBZ89EW7aEF02uA+jzBs30w3yjwuJxxLgbYHsaeqrAEewoRJaG9n5rM9X0l147LTbxBiMHcqYWbaj9uq49gNZlID+rDVS8/f47Z7VuYjDkovI8mntmbZkXrkNoLHWXyZoc5jgDsBqM/QlA83qTXrD18t4Mcr5ESg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 3/6] xen/arm: switch find_domU_holes to rangesets
Date: Thu, 8 May 2025 09:20:32 -0400
Message-ID: <20250508132040.532898-4-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250508132040.532898-1-stewart.hildebrand@amd.com>
References: <20250508132040.532898-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002323:EE_|SJ5PPF28EF61683:EE_
X-MS-Office365-Filtering-Correlation-Id: 869a1447-e7e2-42a9-ca06-08dd8e3334d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?naOKwUJ/J8MOtg/MKPER9fJbyjQklQ8X5hsMEJcobXMTzKmI9MnGBt4avzBd?=
 =?us-ascii?Q?He4C5KMeqJDBQtgv9b89DVpEl9WRN4qqFIcm+Ebk7pBp8LsXYM3SEIOebp9f?=
 =?us-ascii?Q?AupqZPEzDD0o22QSB9+bFDNYZk1FMW6N2PzgRbG6z2yFKqwywNqcdVeTctK7?=
 =?us-ascii?Q?NmJzbgSJbCjJUE4oNP7pPQVNv3bixP6ppTZp44uwzUM97SrdpdMm+ay2VW/C?=
 =?us-ascii?Q?5tVWrhvD1b1tXcmlTxhPvujeAmJEPB5RQJBhZHUhVcEc6gmdyMqJHHywZNrK?=
 =?us-ascii?Q?VkyAyRsd5vGJsefOw0zlrxvjTkBV7wP3O0xTcy6JnYUS//MhRpUVdoSTSFTx?=
 =?us-ascii?Q?+7cv9vPoVOsJpD7UFKDbbHkUGrll8fwpkKJOD7idhl1uIU1ZmACyjG1dEwcO?=
 =?us-ascii?Q?eMkD29vL2uBtw/lbbvVtXL/mZHrLv0+06JPGlZSxqUTMCNrDYs3/7zXmuzue?=
 =?us-ascii?Q?DbdF/X/UihBnj6pBykbIw+KpwWJUyXLluUV7WPOJBioVAdVtZ8x1/b2r3IxS?=
 =?us-ascii?Q?VuRSlHTNlGzKKbIZ+r1b1t01SXYmyVTuZOqblZCh++m02x1agspvAnYGIPAD?=
 =?us-ascii?Q?2/5PD7cyD3tysyWrdfSOB3mYgJVh0sXqoNjcfihAPsEaC+T0CuQ+37z/zMnO?=
 =?us-ascii?Q?SqPZOfNmPbpOxK9Tyyc9bOfWqQE+0jPNbzcVy2eYWm7JD45DgEIs+ZaO9DV1?=
 =?us-ascii?Q?SOeedEt4lI/g5wkpcoLbc3OS9tEq0D2FaPOgZHtwon/gKyc67AGtu84KlkGQ?=
 =?us-ascii?Q?YNMFHRKbAvLQ4gmjEIQY2dhYeYJP2FL/abcUaCHmRu8h29kgoQQpcpOPicZN?=
 =?us-ascii?Q?8yYv887sYvJAb2c4yJeqdJEx68o1Y1RHfVYSfhWLykBMz8iWy86mTSEYFWKz?=
 =?us-ascii?Q?3WYsCtUyKE+3nV7jz8G2JRVwUNO8slqMs8eSYBf/vhYFCaPPXWA9SCiRFTOT?=
 =?us-ascii?Q?m2xHrUOmawQY7dTiYndq49IjgcWBi6B78+s5xVqJ5bZ4UPjVilmygOoLq7ob?=
 =?us-ascii?Q?Cmlx7Iq0neHU15CReXriQPwn6m6Tv58QtqqoDnmfsWwEi3tNvPbfcc3pAvH3?=
 =?us-ascii?Q?x0B3tmpKFvH5F5ykMrEj8eCh8hTGyzhTcMwfnLVvr1kv+Aj81927uNooxvXN?=
 =?us-ascii?Q?YE9em5k4GE1ISU/ELx9NKnge3a5SKqLzpaddqn9BKynRToYnBGhzly9AUE4w?=
 =?us-ascii?Q?sFXEW2xPTf/ZOzGm7twKEOsVUNLyoTexYoTSwzNq+LoasMLKepIYXnR4VfcE?=
 =?us-ascii?Q?E8jmNK93u+usselNeo61ueL4RwKtQVVobCsFW+2ph8WfgD8+PXIF/qBxWVt3?=
 =?us-ascii?Q?Ep/oWOuP09k57AeJWweWEUaSRKuFIWhka7z5BzV8uiefozjD498TmfqHbO1e?=
 =?us-ascii?Q?M8e6Vjj8+XUvfcfmChPo2nnyhMxzkZi3P9fWDdx8okYE7ht1E+Pio40UgWGl?=
 =?us-ascii?Q?ZIvebXc+xjV57YHrDHj53ksr9U69blQPWG5TwuPQ2FGk4OiBWM2k+cSfnLzG?=
 =?us-ascii?Q?sMddWsfOWVx6Ha7fu2du1c03BXl/4RAOkclM?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 13:21:13.6015
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 869a1447-e7e2-42a9-ca06-08dd8e3334d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002323.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF28EF61683

remove_shm_holes_for_domU() is unnecessarily complex: it re-creates the
extended regions from scratch.

Move the rangeset into find_domU_holes() and create the extended regions
only once. This makes is simpler to further manipulate the rangeset for
removing other regions.

Remove now-unused remove_shm_holes_for_domU().

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v1->v2:
* add Stefano's R-b
---
 xen/arch/arm/domain_build.c             | 46 ++++++++++++-----
 xen/arch/arm/include/asm/static-shmem.h |  9 ----
 xen/arch/arm/static-shmem.c             | 65 -------------------------
 3 files changed, 35 insertions(+), 85 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 2f2b021dec3e..05a77a4f92c6 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -933,34 +933,58 @@ static int __init find_domU_holes(const struct kernel_info *kinfo,
                                   struct membanks *ext_regions)
 {
     unsigned int i;
-    uint64_t bankend;
     const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
     const uint64_t banksize[] = GUEST_RAM_BANK_SIZES;
     const struct membanks *kinfo_mem = kernel_info_get_mem_const(kinfo);
-    int res = -ENOENT;
+    struct rangeset *mem_holes;
+    int res;
+
+    mem_holes = rangeset_new(NULL, NULL, 0);
+    if ( !mem_holes )
+        return -ENOMEM;
 
     for ( i = 0; i < GUEST_RAM_BANKS; i++ )
     {
-        struct membank *ext_bank = &(ext_regions->bank[ext_regions->nr_banks]);
+        uint64_t bankend, start, size = 0;
 
-        ext_bank->start = ROUNDUP(bankbase[i] + kinfo_mem->bank[i].size, SZ_2M);
+        start = ROUNDUP(bankbase[i] + kinfo_mem->bank[i].size, SZ_2M);
 
         bankend = ~0ULL >> (64 - p2m_ipa_bits);
         bankend = min(bankend, bankbase[i] + banksize[i] - 1);
-        if ( bankend > ext_bank->start )
-            ext_bank->size = bankend - ext_bank->start + 1;
+
+        if ( bankend > start )
+            size = bankend - start + 1;
 
         /* 64MB is the minimum size of an extended region */
-        if ( ext_bank->size < MB(64) )
+        if ( size < MB(64) )
             continue;
-        ext_regions->nr_banks++;
-        res = 0;
+
+        res = rangeset_add_range(mem_holes, PFN_DOWN(start), PFN_DOWN(bankend));
+        if ( res )
+        {
+            printk(XENLOG_ERR "Failed to add: %#"PRIx64"->%#"PRIx64"\n",
+                   start, start + size - 1);
+            goto out;
+        }
     }
 
+    /* Remove static shared memory regions */
+    res = remove_shm_from_rangeset(kinfo, mem_holes);
     if ( res )
-        return res;
+        goto out;
+
+    res = rangeset_report_ranges(mem_holes, 0,
+                                 PFN_DOWN((1ULL << p2m_ipa_bits) - 1),
+                                 add_ext_regions, ext_regions);
+    if ( res )
+        ext_regions->nr_banks = 0;
+    else if ( !ext_regions->nr_banks )
+        res = -ENOENT;
 
-    return remove_shm_holes_for_domU(kinfo, ext_regions);
+ out:
+    rangeset_destroy(mem_holes);
+
+    return res;
 }
 
 static int __init find_host_extended_regions(const struct kernel_info *kinfo,
diff --git a/xen/arch/arm/include/asm/static-shmem.h b/xen/arch/arm/include/asm/static-shmem.h
index 4034cec32f87..6a4c33cca8c2 100644
--- a/xen/arch/arm/include/asm/static-shmem.h
+++ b/xen/arch/arm/include/asm/static-shmem.h
@@ -27,9 +27,6 @@ void init_sharedmem_pages(void);
 int remove_shm_from_rangeset(const struct kernel_info *kinfo,
                              struct rangeset *rangeset);
 
-int remove_shm_holes_for_domU(const struct kernel_info *kinfo,
-                              struct membanks *ext_regions);
-
 int make_shm_resv_memory_node(const struct kernel_info *kinfo, int addrcells,
                               int sizecells);
 
@@ -73,12 +70,6 @@ static inline int remove_shm_from_rangeset(const struct kernel_info *kinfo,
     return 0;
 }
 
-static inline int remove_shm_holes_for_domU(const struct kernel_info *kinfo,
-                                            struct membanks *ext_regions)
-{
-    return 0;
-}
-
 static inline int make_shm_resv_memory_node(const struct kernel_info *kinfo,
                                             int addrcells, int sizecells)
 {
diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
index 1f8441d92046..32ec6d4bc69f 100644
--- a/xen/arch/arm/static-shmem.c
+++ b/xen/arch/arm/static-shmem.c
@@ -822,71 +822,6 @@ int __init remove_shm_from_rangeset(const struct kernel_info *kinfo,
     return 0;
 }
 
-int __init remove_shm_holes_for_domU(const struct kernel_info *kinfo,
-                                     struct membanks *ext_regions)
-{
-    const struct membanks *shm_mem = kernel_info_get_shm_mem_const(kinfo);
-    struct rangeset *guest_holes;
-    unsigned int i;
-    paddr_t start;
-    paddr_t end;
-    int res;
-
-    /* No static shared memory region. */
-    if ( shm_mem->nr_banks == 0 )
-        return 0;
-
-    dt_dprintk("Remove static shared memory holes from extended regions of DomU\n");
-
-    guest_holes = rangeset_new(NULL, NULL, 0);
-    if ( !guest_holes )
-        return -ENOMEM;
-
-    /* Copy extended regions sets into the rangeset */
-    for ( i = 0; i < ext_regions->nr_banks; i++ )
-    {
-        start = ext_regions->bank[i].start;
-        end = start + ext_regions->bank[i].size;
-
-        res = rangeset_add_range(guest_holes, PFN_DOWN(start),
-                                 PFN_DOWN(end - 1));
-        if ( res )
-        {
-            printk(XENLOG_ERR
-                   "Failed to add: %#"PRIpaddr"->%#"PRIpaddr", error: %d\n",
-                   start, end, res);
-            goto out;
-        }
-    }
-
-    /* Remove static shared memory regions */
-    res = remove_shm_from_rangeset(kinfo, guest_holes);
-    if ( res )
-        goto out;
-
-    /*
-     * Take the interval of memory starting from the first extended region bank
-     * start address and ending to the end of the last extended region bank.
-     */
-    i = ext_regions->nr_banks - 1;
-    start = ext_regions->bank[0].start;
-    end = ext_regions->bank[i].start + ext_regions->bank[i].size - 1;
-
-    /* Reset original extended regions to hold new value */
-    ext_regions->nr_banks = 0;
-    res = rangeset_report_ranges(guest_holes, PFN_DOWN(start), PFN_DOWN(end),
-                                 add_ext_regions, ext_regions);
-    if ( res )
-        ext_regions->nr_banks = 0;
-    else if ( !ext_regions->nr_banks )
-        res = -ENOENT;
-
- out:
-    rangeset_destroy(guest_holes);
-
-    return res;
-}
-
 void __init shm_mem_node_fill_reg_range(const struct kernel_info *kinfo,
                                         __be32 *reg, int *nr_cells,
                                         int addrcells, int sizecells)
-- 
2.49.0


