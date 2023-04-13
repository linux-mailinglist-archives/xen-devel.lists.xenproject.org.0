Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA226E13A7
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 19:38:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520854.808929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn0tX-0001An-QA; Thu, 13 Apr 2023 17:38:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520854.808929; Thu, 13 Apr 2023 17:38:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn0tX-00018H-MF; Thu, 13 Apr 2023 17:38:03 +0000
Received: by outflank-mailman (input) for mailman id 520854;
 Thu, 13 Apr 2023 17:38:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2GAK=AE=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pn0tW-0000rf-GV
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 17:38:02 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062c.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ecbbc965-da21-11ed-8611-37d641c3527e;
 Thu, 13 Apr 2023 19:37:57 +0200 (CEST)
Received: from BN9PR03CA0958.namprd03.prod.outlook.com (2603:10b6:408:108::33)
 by DM6PR12MB4202.namprd12.prod.outlook.com (2603:10b6:5:219::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Thu, 13 Apr
 2023 17:37:51 +0000
Received: from BN8NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:108:cafe::4d) by BN9PR03CA0958.outlook.office365.com
 (2603:10b6:408:108::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.32 via Frontend
 Transport; Thu, 13 Apr 2023 17:37:50 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT044.mail.protection.outlook.com (10.13.177.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.32 via Frontend Transport; Thu, 13 Apr 2023 17:37:50 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 13 Apr
 2023 12:37:50 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 13 Apr 2023 12:37:48 -0500
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
X-Inumbo-ID: ecbbc965-da21-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YIIaANzpNZ7sR6SWB3wWxHB3yCmB4NanzJ67NrzqA3YpabBLdiWjjRb39fjG59mT43FtC/SgKuNkCyj5nQ/Nq6ffEu8A3PXth3GyHFS2rDiE5Ahnsj2rbm/lZ4+iSQMlw0gzWKCwklGAUeb3fhWKL7zokfmxMDXPMqzHEcHBJrsTJZnfG3DCrKhLqQ6MCF6+PImincO+yO+UoKXtjEUOLj3Jwl5Ka8iW/9v+z9EvRTkRGjPqkzlS6ei7aXSHq/ed7NFzFeGx6eKDSIpvq2FEqHaA3kB0ya3/KjLubx97pABg9LMoD/QB9wsnTE5Y6tVJPg8pXy2PY3ytAfhuZWKx1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h0wU8LetK/R9TLjWfaj0Ei8tmEBa20JjFHMWBU/8feQ=;
 b=S0I/hG9O6rQL6tFs0vSYCXMHCzvOTq5PMJxcvocIbENWnsg8of6C9BCo+2j5tquc0qXrkzRDbzbuS4yd6qcBDluuy+VdT9uLmgi8/kkzr/ri4FJ38m/SpsceGdSjUpf0Ho2NFlCp1x3WLbqwwuJsywRPQGeTKohQU1V6zpnLeRYrt6fJ8tgFztQDZaiN/vk53ak0NKKolQpKR7F9O90BtfKoO0jGPQMPL8LE9j+bXkxdCgDBbqDSfhxZkzwdNBV7/pD0Dgp4FUDUFq1Ub87qVJ2fEzdB0JF1RqvJlUzdSsvd5BS40/EVVhAKb3CznqP1yPRtInC9GqfU7eHHjXhxiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h0wU8LetK/R9TLjWfaj0Ei8tmEBa20JjFHMWBU/8feQ=;
 b=gVSj9zJMEzq3VGqgrDqDbbLWPo9wLAFioxbxhxUezt8zdRd9vIWrfvzDxAHN5Axll8uTiAefe8xlwLF3kAA7+CViIjyPftPrjI1g0FoKXmFM6GUzssnRC1k5WcDx4V5FGdapFLqs2GX2Lu25fbaKYEXgTRFxrJSFYCO3XB0N3Ho=
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
Subject: [XEN v5 01/10] xen/arm: domain_build: Track unallocated pages using the frame number
Date: Thu, 13 Apr 2023 18:37:26 +0100
Message-ID: <20230413173735.48387-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230413173735.48387-1-ayan.kumar.halder@amd.com>
References: <20230413173735.48387-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT044:EE_|DM6PR12MB4202:EE_
X-MS-Office365-Filtering-Correlation-Id: 8945d385-c3ad-4b0c-a44b-08db3c45cdc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WxOROidkwfJIIDo5gTWo8XScyTi5Uc7QriwwU1I31OMjNkI2xaLlDG1/ldBxFh5CKjf6h/D7EuA0yRIVAj3p4cu0aBu022IlFYTInym+ef3kp4b9nF6hWZ4uJB71cYPyB0IwO+49mBpYuoP9uXaFFelETJnuH8VNl1cPnhUBX7t94JGxCX3kvF6PbxMbAPWjJcH4ARh4JqAxmeD91Ve7H8U5PPS15qfDgwl/TC0W6+7G01pD+xWH/M0BeqdMBpOfjCXqzzdPFGo1u1/gWZOgLLbeCunO2PtMx2CF5XQ4HHgjKhWpf8i1W3rB/lcnUgHVZ/htd8y8ViKEoFc713TxQoRB42Um3aGq7naV2oZW7Z7RvZMDlyaRemIdHOJjan1yvoOiXA/CRqo1/myldWMU+kCWL4Ir9E26iXYIFY7pJMonc1fYFmYJp5z1HA3FHNeWCmKx0owupbzh2hcRlod14AEakPPyBqazziLlHyzYmQGGGh/dbG3uD79BLzaXv6Cmn6+vsgXvB+KbxoYoZu9Yk51OHR9z6fKf+W7BipUkQsGWd+9+9NcnoK6EKqoviyFRVOJXPGPvfY+o+QJ0oCZtd0Z7SsuPpLADREI8NwxWtzvrkdlrNKkdZNo0FxM/T+nZIweZUIlsxeSV11zjfpJIzWsmkBhxRbmpBosskyLlUhFx0Ui2v5qCJvwb8cdYja5hs4lvPfQ7Fv35JJz3pBWdoNgTQ0sS4Fm1hXt8QdvNgO1GK2wVH3cQHKryscQwEHos
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(136003)(396003)(376002)(451199021)(40470700004)(46966006)(36840700001)(82310400005)(5660300002)(7416002)(8936002)(41300700001)(103116003)(40460700003)(83380400001)(6916009)(4326008)(8676002)(70206006)(2906002)(70586007)(6666004)(36756003)(316002)(966005)(47076005)(478600001)(54906003)(356005)(86362001)(81166007)(36860700001)(26005)(186003)(426003)(336012)(1076003)(40480700001)(82740400003)(2616005)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 17:37:50.5214
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8945d385-c3ad-4b0c-a44b-08db3c45cdc4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4202

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

On Arm64, this change will not induce any adverse side effect as the width of
physical address is 48 bits. Thus, the width of 'gfn' (ie 48 - 12 = 36) can be
represented using 'unsigned long' (which is 64 bits wide).

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
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

 xen/arch/arm/domain_build.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 4f9d4f9d88..c8f08d8ee2 100644
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


