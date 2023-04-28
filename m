Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F876F1DB5
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 19:57:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527436.820015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psSLS-00064i-G1; Fri, 28 Apr 2023 17:57:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527436.820015; Fri, 28 Apr 2023 17:57:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psSLS-00062t-CQ; Fri, 28 Apr 2023 17:57:22 +0000
Received: by outflank-mailman (input) for mailman id 527436;
 Fri, 28 Apr 2023 17:57:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SG5/=AT=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1psSLR-0005xG-IF
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 17:57:21 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1dd676a4-e5ee-11ed-8611-37d641c3527e;
 Fri, 28 Apr 2023 19:57:19 +0200 (CEST)
Received: from BN9PR03CA0781.namprd03.prod.outlook.com (2603:10b6:408:13f::6)
 by PH0PR12MB5450.namprd12.prod.outlook.com (2603:10b6:510:e8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.24; Fri, 28 Apr
 2023 17:57:14 +0000
Received: from BL02EPF000145B8.namprd05.prod.outlook.com
 (2603:10b6:408:13f:cafe::a2) by BN9PR03CA0781.outlook.office365.com
 (2603:10b6:408:13f::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.24 via Frontend
 Transport; Fri, 28 Apr 2023 17:57:13 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF000145B8.mail.protection.outlook.com (10.167.241.208) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.15 via Frontend Transport; Fri, 28 Apr 2023 17:57:12 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 28 Apr
 2023 12:57:12 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 28 Apr
 2023 12:57:12 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Fri, 28 Apr 2023 12:57:10 -0500
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
X-Inumbo-ID: 1dd676a4-e5ee-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=he8wUTrQyxRNVmeXe7Ck5g+D0hKqRwEnakTT1wUjuvoFcA+IJAwPljG7v3ECpqNcNK6PL1BC3N0k8PJLMNdY/VfMiKCXDYFkP6ywx8f09orF5dirJAOWcmtkAFeAbicWMjrPIi0+cJe0HwP06hcXY4yiBKEruJXPlt8t5+v/Astg0JnqOFqgMxcHLTpYa6oI94ecFZk39MKk9iNp0tPTWQ3cxdZE9B6mQZawlUCjrFWVDNgC5xBEp9XbDjJ0EajHjz13LoRQpgqAL4tF2W2WN8DNfJ1GcWYh+ErubZm+GeKAQVlNqu/9whOWI533bWAYPK//JC242HjzpNonKaFDbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RLOopyrCxXrFnZHqu61vRHbngeDUKnfARgP4fYXLREo=;
 b=FybGUtgmqipk6hdUXR3/shyYOHw0XPKvD9h4HIcwveVWYkFTFJboEuq9eXF2ukhBcHKovfjS4uSJFpoHDQol3igESY63KDFZUtLImacm23XpwBE58JnoPOxDawX301eN3/vfwX0R4e3fhoG7sKb9m3AXFSCDuqGtdcBK+ltW2HXUf0nURdwydwQXjFRUzXKdh52d3u6Ao06GT2gy+5mxOAZ5GW5nur9kB7zGe1M9Ikdatf0ong8WLdptM2Z83b6N+KNBKfxB1gUxWoMFHNBt/eo/SeycEJxx4i+zhnFptOxFNu30tKCSVTXBkpl3u3aFnOi0/EmzwFdnHt5MurU3Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLOopyrCxXrFnZHqu61vRHbngeDUKnfARgP4fYXLREo=;
 b=uJXBbTqwwF+Byazy7H5LHgoPgnwUbUKuXbg5xZom5YbzUva56uB35qku4C/owetAUoOMxjSg8bisDY87Zi/7sihCxm0MyUs3jCT8OYLgXMxeVc58kdkIoSCqEjpqIWWk0cezVawb6TVqMCQ9FrQwLlC7tN+pq0Ks8XK2r5ONk2k=
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
Subject: [XEN v6 01/12] xen/arm: domain_build: Track unallocated pages using the frame number
Date: Fri, 28 Apr 2023 18:55:32 +0100
Message-ID: <20230428175543.11902-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230428175543.11902-1-ayan.kumar.halder@amd.com>
References: <20230428175543.11902-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000145B8:EE_|PH0PR12MB5450:EE_
X-MS-Office365-Filtering-Correlation-Id: fa3189f5-981d-4e8f-e130-08db4811feb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OiUpvXG3+lXoq17BnlvYznR4NfscNYqeRm5aEnuaqhyTML+zfRfomIWIXWLTSFjYcQe6i4XwWBmkJ28iie0zeKHm0/lFR1+iW+jKBkhDjaJM474trp/b17aNuHb/T7Taax0hZbJO5ddM/1i8zfFdCn/WE/F322e8FbJW3o0NIZ1rRcr/uZtuJMWsbajoqVwNM//7ZRaEhA4862drXLwu7+a7XVzxx2AR4oDUvkPb+USgiktt6sVcpTtH09mhoIw6SRuMlGFCmZ0NifZ9ryY5hWF1CSjGS/s6BUIrZDaHlFUbofoHTfdz6hyo9QS1UpU7qGcEOEAVSL56DWyFB88zF2V6BW4IxSgAHlNQ2lQr+5Uh6TbTO6JlzwAhWnG3lqt6wJFsXdddku2otmU3q3AILZYfNCYfiOKzfy3qwtkGdZa4sBBvSLFSwfDuO6YLJGbSc49pgQcLR2c1e3URQQJGtD+BqVtOBnMPdT+SZi3YXL6CgpSxswTw1gvF5XAdUlEqxS7S7GD5AuMqCq7NJy5t1HRMNGRt5PIzl3OjVI//tjAOQEZrpPdGohWDxnRrIby69TKxJt37ReobZ2f8CmYstrhkT6Iz82kDk+3XElGpjTpYN2bE56x+nxTcDOsMPIGHWMqdLbD1/uhvQ1+UII4vVoJ6Rb92uHy3bd28TKgVdAnMy+xo7wZykD+xi6lBMS9eZkiei3776VB7GT/OMSuaFfVcMEt7mZvj/Tptg1Z7cUZ+uuORQCcfTOKkskpDYQ80
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(396003)(376002)(136003)(451199021)(46966006)(36840700001)(40470700004)(8676002)(8936002)(7416002)(41300700001)(82740400003)(356005)(81166007)(36860700001)(316002)(2906002)(70206006)(70586007)(5660300002)(6916009)(82310400005)(4326008)(47076005)(83380400001)(426003)(336012)(2616005)(103116003)(54906003)(40480700001)(186003)(40460700003)(36756003)(86362001)(966005)(6666004)(1076003)(478600001)(26005)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2023 17:57:12.7564
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa3189f5-981d-4e8f-e130-08db4811feb5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF000145B8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5450

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

 xen/arch/arm/domain_build.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index f80fdd1af2..494611a3e5 100644
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


