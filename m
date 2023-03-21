Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 115156C339C
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 15:04:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512667.792751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pecbT-0005Kw-7r; Tue, 21 Mar 2023 14:04:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512667.792751; Tue, 21 Mar 2023 14:04:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pecbT-0005I9-43; Tue, 21 Mar 2023 14:04:43 +0000
Received: by outflank-mailman (input) for mailman id 512667;
 Tue, 21 Mar 2023 14:04:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CsWt=7N=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pecbR-0004P0-6D
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 14:04:41 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51e0de28-c7f1-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 15:04:39 +0100 (CET)
Received: from DS7PR03CA0026.namprd03.prod.outlook.com (2603:10b6:5:3b8::31)
 by LV2PR12MB5965.namprd12.prod.outlook.com (2603:10b6:408:172::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 14:04:36 +0000
Received: from DS1PEPF0000B077.namprd05.prod.outlook.com
 (2603:10b6:5:3b8:cafe::d8) by DS7PR03CA0026.outlook.office365.com
 (2603:10b6:5:3b8::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Tue, 21 Mar 2023 14:04:36 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0000B077.mail.protection.outlook.com (10.167.17.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.26 via Frontend Transport; Tue, 21 Mar 2023 14:04:35 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 21 Mar
 2023 09:04:35 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 21 Mar 2023 09:04:33 -0500
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
X-Inumbo-ID: 51e0de28-c7f1-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KazxDeyxAEIhuUt2sVHyxo7P6A80SkhwPXH/S2YH8ai75alZAHESkd4k0TyyDBMAnfN2QvQJTZ29YCNWJRaX6YA3ERhhFXYAcFk4O0UYHY7iXTjJI3wXVw3oNEzvc7tLDg3/8nTNRU0YmrqaD3DCU8zmblQramMf/MFI2LvFopHWXRS+8NK3GPNtgBkCImkxa7RpGq249UwpPsGYKDSz4itNQkOmtVGc8m8l2uUuVHapl2l6FiGPhX6UEN95a7dqrhUH6LdNWkX/zSuMm4OaoWkjz1k08n1TYJ7McKbyc24tF8an0kXAs7EpXU+0EnTwCaAgDAen7VBPc/VwZgFr2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i56Rnyyp+qPWCXZNTAn/ehxYyAtGLo/fwDvX12J2mo0=;
 b=Ple4srQY2552nvbftlT8o75xnYS3kcJyO+/3Guar6sWNMmI+xR22QN9G5CxIHAXe7YzxRpsJIlj63L91MYmlrWtQUvnaGO8eCAv0wtM88UoH45Ya3EQ1yJOzsxNJP++vjG/oKpJBonwyDsbWZ2TIFlyjME+3y4wwzO91EgUBEmz4AukftPg54DgX8OgJlVFf8fNVl5vLjUj/5aVbgGuI2C+5F9DlGltbFOEvnDACp0qznFZQBtndgVFfJI2RRhSw6o/ObjWX1V8Foq7Ly73nCkO0omujNmbaZTAgLW84gaK1k1D482YeCXl88m/zt8DAYIofwnWg199AULdUgwo3pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i56Rnyyp+qPWCXZNTAn/ehxYyAtGLo/fwDvX12J2mo0=;
 b=kWq+vITNgkErC1/fJJIm8rPU65ATcT06H6bL7AaemrE4vGR8RYS21N10vBBzuKf0Ip1q1SQs7pO9A63tp9Hkaej5zlyU7bWFdILZWYOGCNsL1IjhHIFRSZ84WbminciTxBvxDxD+tDXZMXaBlSJEteBLYH7rHP2kc8202lDhonE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v4 02/11] xen/arm: domain_build: Track unallocated pages using the frame number
Date: Tue, 21 Mar 2023 14:03:48 +0000
Message-ID: <20230321140357.24094-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230321140357.24094-1-ayan.kumar.halder@amd.com>
References: <20230321140357.24094-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000B077:EE_|LV2PR12MB5965:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e1394ce-77dd-4191-09aa-08db2a15340c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BXRLJ4PEFZ9vsDvRrhvtdkSGg39sw9whwx4TQ7S3mGPzM8ec7wVpoYKYrSmWStRdsXoe5E3Zg/Mi1QFyfm8qL8bf+I5NUUAl6MKyPyoIaLsDeffT3UHjWkVvuwgB5yHWWeA3md7w69DZsc27v3qChqm/yO9HClLP1173YVW9n6e+zoJvI93tD0/kNHBLZeYroJRcYx/L3Kok76QxPwoTmqt59RL4Dt6drkpMATY7DeLujtTx7dXDVC7dOaeK6Zf+F2P4VpgjYwYb0xFKJVespH5e0+i1lxH4kxxzJIMvuWgDVllkp0cNvS5FTQlBK5euM0LBIrKJtRt2x6GDL2c9cGIYm3+cxgTB/0iWKEXP9yk+KBPhrxBaycrzVZHHs47JKiADGeImoPYDWUatl/ozB/Q4xOtUcFhtx+Ho8fSTfYHXmqnxXb1aNiF2hrwa2X7mb0EPS+NkMgtGF++yt9ewauLfjFmvZiV5rHwcFYm3l3kAnIqqjTQDMipRod7AqMbF3R6jrxySaqhyAZzWbWnRiEM+Te93hjawN3QghwmYlM4FiVHePE15ZGek+hY161X8t0CB0EMAkTNix+sTfhAl9fz5Zo6wDJY+FsXfwnlzrmCTgfEvb8Rna2nEjo+1N1b1mhbIus+cNKMFasrWsJcWe2jRkHAbVWliVO8mi2hcqGkm+dISt4DaTGToi9Ebykj1x69R/7zESg5V1UDQH1MOpjF/MSauFKK7I4MbdKC050LD/gZoyF7ym76NmireF59a
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(396003)(136003)(346002)(451199018)(36840700001)(40470700004)(46966006)(478600001)(316002)(426003)(36756003)(26005)(1076003)(54906003)(47076005)(70586007)(8676002)(6916009)(4326008)(82740400003)(70206006)(966005)(83380400001)(36860700001)(2906002)(81166007)(86362001)(356005)(82310400005)(2616005)(40460700003)(41300700001)(7416002)(186003)(336012)(40480700001)(6666004)(8936002)(103116003)(5660300002)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 14:04:35.8159
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e1394ce-77dd-4191-09aa-08db2a15340c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000B077.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5965

rangeset_{xxx}_range() functions are invoked with 'start' and 'size' as
arguments which are either 'uint64_t' or 'paddr_t'. However, the function
accepts 'unsigned long' for 'start' and 'size'. 'unsigned long' is 32 bits for
ARM_32. Thus, there is an implicit downcasting from 'uint64_t'/'paddr_t' to
'unsigned long' when invoking rangeset_{xxx}_range().

So, it may seem there is a possibility of lose of data due to truncation.

In reality, 'start' and 'size' are always page aligned. And ARM_32 currently
supports 40 bits as the width of physical address.
So if the addresses are page aligned, the last 12 bits contain zeroes.
Thus, we could instead pass page frame number which will contain 28 bits (40-12
on Arm_32) and this can be represented using 'unsigned long'.

On Arm_64, this change will not induce any adverse side effect as the width of
physical address is 48 bits. Thus, the width of 'mfn' (ie 48 - 12 = 36) can be
represented using 'unsigned long' (which is 64 bits wide).

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from -

v3 - 1. Extracted the patch from https://lists.xenproject.org/archives/html/xen-devel/2023-02/msg00657.html
and added it to this series.
2. Modified add_ext_regions(). This accepts a frame number instead of physical
address.

 xen/arch/arm/domain_build.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 15fa88e977..24b12b7512 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1500,10 +1500,13 @@ static int __init make_resv_memory_node(const struct domain *d,
     return res;
 }
 
-static int __init add_ext_regions(unsigned long s, unsigned long e, void *data)
+static int __init add_ext_regions(unsigned long s_pfn, unsigned long e_pfn,
+                                  void *data)
 {
     struct meminfo *ext_regions = data;
     paddr_t start, size;
+    paddr_t s = PFN_UP(s_pfn);
+    paddr_t e = PFN_UP(e_pfn);
 
     if ( ext_regions->nr_banks >= ARRAY_SIZE(ext_regions->bank) )
         return 0;
@@ -1566,7 +1569,8 @@ static int __init find_unallocated_memory(const struct kernel_info *kinfo,
     {
         start = bootinfo.mem.bank[i].start;
         end = bootinfo.mem.bank[i].start + bootinfo.mem.bank[i].size;
-        res = rangeset_add_range(unalloc_mem, start, end - 1);
+        res = rangeset_add_range(unalloc_mem, PFN_DOWN(start),
+                                 PFN_DOWN(end - 1));
         if ( res )
         {
             printk(XENLOG_ERR "Failed to add: %#"PRIpaddr"->%#"PRIpaddr"\n",
@@ -1580,7 +1584,8 @@ static int __init find_unallocated_memory(const struct kernel_info *kinfo,
     {
         start = assign_mem->bank[i].start;
         end = assign_mem->bank[i].start + assign_mem->bank[i].size;
-        res = rangeset_remove_range(unalloc_mem, start, end - 1);
+        res = rangeset_remove_range(unalloc_mem, PFN_DOWN(start),
+                                    PFN_DOWN(end - 1));
         if ( res )
         {
             printk(XENLOG_ERR "Failed to remove: %#"PRIpaddr"->%#"PRIpaddr"\n",
@@ -1595,7 +1600,8 @@ static int __init find_unallocated_memory(const struct kernel_info *kinfo,
         start = bootinfo.reserved_mem.bank[i].start;
         end = bootinfo.reserved_mem.bank[i].start +
             bootinfo.reserved_mem.bank[i].size;
-        res = rangeset_remove_range(unalloc_mem, start, end - 1);
+        res = rangeset_remove_range(unalloc_mem, PFN_DOWN(start),
+                                    PFN_DOWN(end - 1));
         if ( res )
         {
             printk(XENLOG_ERR "Failed to remove: %#"PRIpaddr"->%#"PRIpaddr"\n",
@@ -1607,7 +1613,7 @@ static int __init find_unallocated_memory(const struct kernel_info *kinfo,
     /* Remove grant table region */
     start = kinfo->gnttab_start;
     end = kinfo->gnttab_start + kinfo->gnttab_size;
-    res = rangeset_remove_range(unalloc_mem, start, end - 1);
+    res = rangeset_remove_range(unalloc_mem, PFN_DOWN(start), PFN_DOWN(end - 1));
     if ( res )
     {
         printk(XENLOG_ERR "Failed to remove: %#"PRIpaddr"->%#"PRIpaddr"\n",
@@ -1617,7 +1623,7 @@ static int __init find_unallocated_memory(const struct kernel_info *kinfo,
 
     start = 0;
     end = (1ULL << p2m_ipa_bits) - 1;
-    res = rangeset_report_ranges(unalloc_mem, start, end,
+    res = rangeset_report_ranges(unalloc_mem, PFN_DOWN(start), PFN_DOWN(end),
                                  add_ext_regions, ext_regions);
     if ( res )
         ext_regions->nr_banks = 0;
@@ -1639,7 +1645,7 @@ static int __init handle_pci_range(const struct dt_device_node *dev,
 
     start = addr & PAGE_MASK;
     end = PAGE_ALIGN(addr + len);
-    res = rangeset_remove_range(mem_holes, start, end - 1);
+    res = rangeset_remove_range(mem_holes, PFN_DOWN(start), PFN_DOWN(end - 1));
     if ( res )
     {
         printk(XENLOG_ERR "Failed to remove: %#"PRIpaddr"->%#"PRIpaddr"\n",
@@ -1677,7 +1683,7 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
     /* Start with maximum possible addressable physical memory range */
     start = 0;
     end = (1ULL << p2m_ipa_bits) - 1;
-    res = rangeset_add_range(mem_holes, start, end);
+    res = rangeset_add_range(mem_holes, PFN_DOWN(start), PFN_DOWN(end));
     if ( res )
     {
         printk(XENLOG_ERR "Failed to add: %#"PRIpaddr"->%#"PRIpaddr"\n",
@@ -1708,7 +1714,8 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
 
             start = addr & PAGE_MASK;
             end = PAGE_ALIGN(addr + size);
-            res = rangeset_remove_range(mem_holes, start, end - 1);
+            res = rangeset_remove_range(mem_holes, PFN_DOWN(start),
+                                        PFN_DOWN(end - 1));
             if ( res )
             {
                 printk(XENLOG_ERR "Failed to remove: %#"PRIpaddr"->%#"PRIpaddr"\n",
@@ -1735,7 +1742,7 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
 
     start = 0;
     end = (1ULL << p2m_ipa_bits) - 1;
-    res = rangeset_report_ranges(mem_holes, start, end,
+    res = rangeset_report_ranges(mem_holes, PFN_DOWN(start), PFN_DOWN(end),
                                  add_ext_regions,  ext_regions);
     if ( res )
         ext_regions->nr_banks = 0;
-- 
2.17.1


