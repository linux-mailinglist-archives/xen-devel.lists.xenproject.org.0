Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF18AA8B2C
	for <lists+xen-devel@lfdr.de>; Mon,  5 May 2025 04:57:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.975751.1363098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBm1K-0001VH-Be; Mon, 05 May 2025 02:57:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 975751.1363098; Mon, 05 May 2025 02:57:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBm1K-0001SI-7R; Mon, 05 May 2025 02:57:30 +0000
Received: by outflank-mailman (input) for mailman id 975751;
 Mon, 05 May 2025 02:57:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LKXI=XV=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uBm1I-0000Iv-G1
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 02:57:28 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20625.outbound.protection.outlook.com
 [2a01:111:f403:2417::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ada391d3-295c-11f0-9eb4-5ba50f476ded;
 Mon, 05 May 2025 04:57:27 +0200 (CEST)
Received: from MW4PR04CA0301.namprd04.prod.outlook.com (2603:10b6:303:82::6)
 by DS5PPF016FC81DF.namprd12.prod.outlook.com (2603:10b6:f:fc00::644) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Mon, 5 May
 2025 02:57:22 +0000
Received: from SJ5PEPF000001CC.namprd05.prod.outlook.com
 (2603:10b6:303:82:cafe::44) by MW4PR04CA0301.outlook.office365.com
 (2603:10b6:303:82::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.29 via Frontend Transport; Mon,
 5 May 2025 02:57:22 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CC.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Mon, 5 May 2025 02:57:21 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 4 May
 2025 21:57:20 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 4 May
 2025 21:57:20 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 4 May 2025 21:57:19 -0500
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
X-Inumbo-ID: ada391d3-295c-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l7S1c23z2/MzThGcLxfrhXjof6dIVOG1d95xFOA1IeAIsIWFZg05d77BaBPaJQeBaVriFsyTEKmV3sj/htiTjOrpQkgAU3FYlmy3GDOM2dzCZ1sAgMnJttke7kdYxRO+JdWhDeR4va7HLe/cz5bpQ+w0y64QYXlvhaJhHmzind4ZX3qqd4z244qjWMM8CP5NNl65DyG0eocy08HqIVBwrK3X/PEEX1H5Sj7S5EjW4LqZn+rGOAow6ed7LjLtBqRb0SRB/5gk0JrXH6HevNm3R9Qo7Pc2tbBQ69v3c152S/SYU0MiJoBQA87lSovNawOjOVPBxm+Z9qgmxy5K943YbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k7EpWyUGojUhK3l4AHNyX8h5cPPVtoJRAwdIaI1JfS0=;
 b=iUNwykf8gb0Nfzlzku9q0/YxEH7xTRrcUUFY4niBi7V04B5JX66y+i2Kxk0vGz+RvAp8H0FiWdYdc5AQFdUOwHM/GwJrLuygEUmEupPCAIxHgMaez6m47Gr0a+cS4nNZDg4/dLkMoDPHI6sfLFaHdRS+7zgdkUzdRex3nd25VUfFA6WNW6WhybtgjwBAh7NfhJIIciRMfmAyr0gqPVSs0FOCPe5g2sMnvpGRiPbhyNXCtB/shuV2AIlIHhD+49vqKhcVHYibmMmxvsGMcYavTpVB9qU+w1zMKpWDtC8aysRVHijV/q2va/otjB+JqKNKWtOTCFSAarTiysIHUp5/xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k7EpWyUGojUhK3l4AHNyX8h5cPPVtoJRAwdIaI1JfS0=;
 b=jtEr/HD1/VF7+mBfcpscXnWv4vLyuaT05n5zBnDR7jw/w7PyAEmCprQuyyN3Qqpu+gw+TEdU/N8lykp4+yb3vOPM4B/mvEu7p5hFAOWE4Y3oCYYQ9QSy1j5sEL5K5iKssSfSLDzYUqO0s2X8n+9sKyafQ/4ZUbYeRFs7k9iRo8Q=
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
Subject: [PATCH 3/6] xen/arm: switch find_domU_holes to rangesets
Date: Sun, 4 May 2025 22:56:26 -0400
Message-ID: <20250505025631.207529-4-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250505025631.207529-1-stewart.hildebrand@amd.com>
References: <20250505025631.207529-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CC:EE_|DS5PPF016FC81DF:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b997295-dd6a-46b7-e582-08dd8b808e44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ETmDyZ3v27FcrbsAqFHVkSIc0GSkE33R4eaTVS09MkVMOBnzdtumC+Qvg+oC?=
 =?us-ascii?Q?9ganNQMmraBiHRC4YkakhPAeKoCWP4Lo6qD6KuxT7v1+NpNT2woDEB0PjW7C?=
 =?us-ascii?Q?exWvivf7Dm3EzFTjkKs57w4kmHiJb5E0hsbIU/sgPESW132tvQtQgM0l1Hor?=
 =?us-ascii?Q?4qenJ1aQoKjlLzfcLysq30knjlTZAdQX52+V8+ZXebmBWJhFb15voqZW21aq?=
 =?us-ascii?Q?6P1uyqq4g/2SADLAcS8MK1LOdA01YrPoUEHH81bopcTUgMCXEW+JNgOHb4UY?=
 =?us-ascii?Q?V02pMUmX3Afs3e4Z9t91bYSF+s1OfJZ4xKjMFxlxEGl+5eyKEF4E4KMTlfYk?=
 =?us-ascii?Q?dJ1G7mm7/8TPZgcRirJDiAveCd7FU++Nu1/hKxh8DRhe4xYQBFEgVyqFZ9nn?=
 =?us-ascii?Q?+M856kt1kg/ULXmwEHRTtTtrVhjkJlqwCDIuRqkxHoKpENmmJKuPB8y008rM?=
 =?us-ascii?Q?tCqkEbK+AaW1nO3LSjOcZo3X5jKgCm5n6sDOx0CTT0zN17I7+DHdjZEDJwDU?=
 =?us-ascii?Q?HXmts4LvR/52fmYUPpWOsW7SVpIHYKR8cxirh8rabdhm9BBdl/76VKy2zZ4I?=
 =?us-ascii?Q?QDU/yEvkSEDFjtIfu8mi6vlmfLASed9h4x0Fc850rKGL3zKN0WkpaC205AeB?=
 =?us-ascii?Q?zVknmJGqyKTSPX0/6V6UDrCxFAtrYadvFT65ETe467Mw0HH4fUMiwqMIAohZ?=
 =?us-ascii?Q?xXHNK/GkzLD8ujMwrvB0SErEL/C0c05QrKYg/Kb0nwMxf6AU4McCNETwC18I?=
 =?us-ascii?Q?kbTjLYqXI1egudnxPLgNQPO4N2AgHO32yqX+musFnR6VMVZuV/m+t6JOfMf8?=
 =?us-ascii?Q?SVZGMBYqhZV9c7j1dSN5lRXeNhMcsrVTnFHN/8zt8eM9iQMgkveE/wH2IZZM?=
 =?us-ascii?Q?ZMdsAikfXHCGB4QSZNwavq3rPlYHBzJlqAFzPlRvkML9lZW6UySuMDnw88zr?=
 =?us-ascii?Q?5DaQrcqp+nrO+jOR50k5QN4/W3wFRxYneVxkIyOMdFaOYuyEmOmXbKgVYtu6?=
 =?us-ascii?Q?XQNQ+ukwy7U62LG8/+8iksP4LoF1pBBapW5GYDP/WYF2D8JHfv+9g+Wl7fSC?=
 =?us-ascii?Q?aWR5AJN91oVUr0BJIBNpA8BT7UYU7tC2dcJqfBv7xBGCGhkZt1y+81NP7Lm0?=
 =?us-ascii?Q?WYJmRjDdrJ7NVCWg3PucmUpt4fYHsfNwdQnEftZC91JdtUnmcG+6D6GWGU5S?=
 =?us-ascii?Q?TWxY7ZffEtHpbTfn11zy/2ZdGKSnvvPSkR4z5BfavuW4tZmOPC5JU91Ko9i0?=
 =?us-ascii?Q?+tQqOyxknv9UYw5zmti1tqYchjAcSd9W54cdhPdLeRmCw2G5l11elTW24JtX?=
 =?us-ascii?Q?4XXKCmC0nhA951SKwD6nfeJ+gIaeE+CAgEmaMjqPMfVbFxTMBAq1lwlLlPsr?=
 =?us-ascii?Q?Y8fwKTYU3Ehj7tJ+/DWx6P/ra5IWllhcpiAfDsnSCwhKohJe+3jGlpRGzi7l?=
 =?us-ascii?Q?K6YjyoyKEiwMa7AtLiIXXcMCayB9HUEjY0630kEA1O418OxR3zDO/UfUIDJ8?=
 =?us-ascii?Q?yPTO5f9k6pZpkW+AnM1GxR6A1ixTdQvImz0M?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 02:57:21.4099
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b997295-dd6a-46b7-e582-08dd8b808e44
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF016FC81DF

remove_shm_holes_for_domU() is unnecessarily complex: it re-creates the
extended regions from scratch.

Move the rangeset into find_domU_holes() and create the extended regions
only once. This makes is simpler to further manipulate the rangeset for
removing other regions.

Remove now-unused remove_shm_holes_for_domU().

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
 xen/arch/arm/domain_build.c             | 46 ++++++++++++-----
 xen/arch/arm/include/asm/static-shmem.h |  9 ----
 xen/arch/arm/static-shmem.c             | 65 -------------------------
 3 files changed, 35 insertions(+), 85 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index a0f3c074337d..3dcdd7a8c46f 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1256,34 +1256,58 @@ static int __init find_domU_holes(const struct kernel_info *kinfo,
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
index 94eaa9d500f9..ad8267c6bfbe 100644
--- a/xen/arch/arm/include/asm/static-shmem.h
+++ b/xen/arch/arm/include/asm/static-shmem.h
@@ -28,9 +28,6 @@ void init_sharedmem_pages(void);
 int remove_shm_from_rangeset(const struct kernel_info *kinfo,
                              struct rangeset *rangeset);
 
-int remove_shm_holes_for_domU(const struct kernel_info *kinfo,
-                              struct membanks *ext_regions);
-
 int make_shm_resv_memory_node(const struct kernel_info *kinfo, int addrcells,
                               int sizecells);
 
@@ -74,12 +71,6 @@ static inline int remove_shm_from_rangeset(const struct kernel_info *kinfo,
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
index e8d4ca3ba3ff..06f32be097c8 100644
--- a/xen/arch/arm/static-shmem.c
+++ b/xen/arch/arm/static-shmem.c
@@ -820,71 +820,6 @@ int __init remove_shm_from_rangeset(const struct kernel_info *kinfo,
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


