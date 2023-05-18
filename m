Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B84708404
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 16:40:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536392.834671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzenH-0007PH-4i; Thu, 18 May 2023 14:39:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536392.834671; Thu, 18 May 2023 14:39:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzenH-0007MU-15; Thu, 18 May 2023 14:39:51 +0000
Received: by outflank-mailman (input) for mailman id 536392;
 Thu, 18 May 2023 14:39:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R7bG=BH=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pzenF-00074K-4e
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 14:39:49 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20608.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d61c4b9f-f589-11ed-8611-37d641c3527e;
 Thu, 18 May 2023 16:39:47 +0200 (CEST)
Received: from DS7PR03CA0179.namprd03.prod.outlook.com (2603:10b6:5:3b2::34)
 by BN9PR12MB5179.namprd12.prod.outlook.com (2603:10b6:408:11c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Thu, 18 May
 2023 14:39:43 +0000
Received: from DM6NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b2:cafe::ee) by DS7PR03CA0179.outlook.office365.com
 (2603:10b6:5:3b2::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19 via Frontend
 Transport; Thu, 18 May 2023 14:39:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT003.mail.protection.outlook.com (10.13.173.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.15 via Frontend Transport; Thu, 18 May 2023 14:39:43 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 18 May
 2023 09:39:42 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 18 May 2023 09:39:41 -0500
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
X-Inumbo-ID: d61c4b9f-f589-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lxn6bxJ9FerscYp3grHBK2B0pUXcoeNVyjdBgNvThgGyKNEALTzfU17PsiFbOT2lG77rc8pFX07dyCuog2cv1WF3zmlSRwUgc/CZmbHYHrsnT51mR9VZRgPX2amK8T+BUVmyXNvtEIytCoBrHSModYYe2pZY1DsegMVCa7l3bf40ybP7innwTfZFOqL2xoX7F+t3n32o6BpUvz73muGw2AgPLjoJeWCHbL1zEGuh83PQMWP40Jsp0pCJaFGgWdLIfqfrHpI6+YuMMg2ZBY3ecQr2JrIUL91308TUoJXSUgwnF3F+aEEnaus0QhZvlrQwpjff/f0DlqldRbj0gRZ+fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5fJWKj17VMd4J7OD9poo9yDrAqqLVEuS40vyYFKg3Cw=;
 b=Mikke4fJReDcL8VdETUDJEPJTlh97aslDxLn7mhwxEy5HdyuX0uK4/ewLn2mKE/JPizYydafvkHWn61SS2FSFPlg3pLHquoTycPXUfAea4mXsKxz4zD4+TkoXE664IBmcZkKiCu4Tq+b8PGjocVktXu6qNxmfbVOKkr0YfZIZu5SKq6XALk+H+nERAtft9V9CJA7Ax9MGviziMSX6qRjXSqNku9+XfkWUsbnlG1HMcEpyEA0Wq+khh1gbtLBXCEctIzvDGhTRmheSJqO+GdsPeqRMA0snIJFGHCQ4jMl2y3ArsxR2Kvwn9A02mJfl5wDRO5ro9xsTGMQl2x5ZHotLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5fJWKj17VMd4J7OD9poo9yDrAqqLVEuS40vyYFKg3Cw=;
 b=Cwo6uug56mruDIseFPdUnK8HMVoCkAKspB28uOoMYsrUdAW0nmCQnpp32cEe511W1dH4768pKmFaM7A++JH6INVi8ADy4aQ45/E1tDRdlSi1fCV5FdSDy1Nc6iPDVMXMc1ffeadoxVtBk3c8LNbfnHEzJbrVtWhTNmnFXrcAk44=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>, <michal.orzel@amd.com>, "Ayan Kumar
 Halder" <ayan.kumar.halder@amd.com>
Subject: [XEN v7 01/11] xen/arm: domain_build: Track unallocated pages using the frame number
Date: Thu, 18 May 2023 15:39:10 +0100
Message-ID: <20230518143920.43186-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230518143920.43186-1-ayan.kumar.halder@amd.com>
References: <20230518143920.43186-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT003:EE_|BN9PR12MB5179:EE_
X-MS-Office365-Filtering-Correlation-Id: e8295b1e-d244-40d7-87c6-08db57adb821
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yzlQW8HU0QhXF13+6fkD+BIJJyDB9q5BmFHDi0AtI3L1c0viVJqHgwFmoBPdnuGd4XcMpUBfvXK28chzRvYrOfB3W0PlqtSwSEkD7HJqlvF6ZUahdpRzCfzfCcDaD3PBgdy3YTL/2x+6VJY6vvatvwth1rysr3rq44drWufZ4ja2b3M5fHY3aOoJooIco3l22Brq4krBLwhxaajBwqfGuUbyuwH2y7cU5c95auuaeQ57FZ2DsroRnnRgviWeOUbjk/sSgwcWaaiKNmqNtAmngURLe0858O4/BnAwr2nxGEL4vvmx5/EdyrdxOFiXX4UOsDXG8Eq1cund4EDurSrEd+Z4bDITrf+pCNr5C5vOF4Y48jlzwYK8WkjgrCsFOwNRenJvGLZM7uFBIY6rrNRTu+TLDq1CAAy32eSfSzZQvtz6SqpbyzqUMk5E6AUczGqGA2wX5R09bkk1J4TYQRVQydTyAPvrd6c1tcDCvNaGAPKkP6HQtftrW7Elg/oPvneP9I7oTtmWVTbYlICdGAhkQ0+dK7xXF4WPYl135QFL2kbhvZanmrgx7iqasrKhxdZlXr4Q9XlVF5vkFyzJ+p7hGppCLUqIAV6dk5EC03lOKOKr8F71uA4FN1QvKj6XLpG3vKOP+BmLVUIWVesC5WLEz0htHcbVdyzfIRDXNGBMbZlry3ufvYjtofa8Gg/uXVoCzn2P7l1soylgdGIAE7iSDge++HKlxgedt7osKfYId2vTvV3UHNkTL+6kZXl9UmwYV7bsHm37B9eDg0nGjagDtpQAClsy678OQK5atyYQRVE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(396003)(136003)(376002)(451199021)(40470700004)(36840700001)(46966006)(86362001)(6916009)(8676002)(41300700001)(8936002)(4326008)(356005)(82740400003)(82310400005)(81166007)(54906003)(336012)(70586007)(70206006)(316002)(103116003)(7416002)(36756003)(2906002)(83380400001)(478600001)(47076005)(426003)(2616005)(36860700001)(40480700001)(6666004)(966005)(26005)(5660300002)(40460700003)(186003)(1076003)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 14:39:43.2283
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8295b1e-d244-40d7-87c6-08db57adb821
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5179

rangeset_{xxx}_range() functions are invoked with 'start' and 'size' as
arguments which are either 'uint64_t' or 'paddr_t'. However, the function
accepts 'unsigned long' for 'start' and 'size'. 'unsigned long' is 32 bits for
Arm32. Thus, there is an implicit downcasting from 'uint64_t'/'paddr_t' to
'unsigned long' when invoking rangeset_{xxx}_range().

So, it may seem there is a possibility of lose of data due to truncation.

In reality, 'start' and 'size' are always page aligned. And Arm32 currently
supports 40 bits as the width of physical address.
So if the addresses are page aligned, the last 12 bits contain zeroes.
Thus, we could instead pass page frame number which will contain 28 bits (40-12
on Arm32) and this can be represented using 'unsigned long'.

On Arm64, this change will not induce any adverse side effect as the max
supported width of physical address is 48 bits. Thus, the width of 'gfn'
(ie 48 - 12 = 36) can be represented using 'unsigned long' (which is 64 bits
wide).

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
Changes from -

v3 - 1. Extracted the patch from https://lists.xenproject.org/archives/html/xen-devel/2023-02/msg00657.html
and added it to this series.
2. Modified add_ext_regions(). This accepts a frame number instead of physical
address.

v4 - 1. Reworded the commit message to use Arm32/Arm64
(32-bit/64-bit Arm architecture).
2. Replaced pfn with gfn to denote guest frame number in add_ext_regions().
3. Use pfn_to_paddr() to return a physical address from the guest frame number.

v5 - 1. Updated the commit message. Added R-b and A-b.

v6 - 1. No changes.

 xen/arch/arm/domain_build.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 71f307a572..e0ac5db60d 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1500,10 +1500,13 @@ static int __init make_resv_memory_node(const struct domain *d,
     return res;
 }
 
-static int __init add_ext_regions(unsigned long s, unsigned long e, void *data)
+static int __init add_ext_regions(unsigned long s_gfn, unsigned long e_gfn,
+                                  void *data)
 {
     struct meminfo *ext_regions = data;
     paddr_t start, size;
+    paddr_t s = pfn_to_paddr(s_gfn);
+    paddr_t e = pfn_to_paddr(e_gfn);
 
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


