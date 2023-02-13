Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AB5694622
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 13:45:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494416.764480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRYCt-00071f-Nu; Mon, 13 Feb 2023 12:45:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494416.764480; Mon, 13 Feb 2023 12:45:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRYCt-0006zu-Kx; Mon, 13 Feb 2023 12:45:19 +0000
Received: by outflank-mailman (input) for mailman id 494416;
 Mon, 13 Feb 2023 12:45:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iLJL=6J=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pRYCs-0006LH-A1
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 12:45:18 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7e88::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43455734-ab9c-11ed-93b5-47a8fe42b414;
 Mon, 13 Feb 2023 13:45:16 +0100 (CET)
Received: from DS7PR03CA0021.namprd03.prod.outlook.com (2603:10b6:5:3b8::26)
 by DS0PR12MB7536.namprd12.prod.outlook.com (2603:10b6:8:11c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 12:45:11 +0000
Received: from DM6NAM11FT102.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b8:cafe::a0) by DS7PR03CA0021.outlook.office365.com
 (2603:10b6:5:3b8::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23 via Frontend
 Transport; Mon, 13 Feb 2023 12:45:11 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT102.mail.protection.outlook.com (10.13.173.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.24 via Frontend Transport; Mon, 13 Feb 2023 12:45:10 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 13 Feb
 2023 06:45:08 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 13 Feb 2023 06:45:07 -0600
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
X-Inumbo-ID: 43455734-ab9c-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eK0raAxV1vdE+TzW9PrR0JHmSGtNORSjnOLANoOnCKHd5jtdGUWUXI5oJ8I1KMw9qzDM7yQ63F1qrThD44DR8LDL5JjVU74pU0zspsW5urfPsfqkxUrvoVjh3S0rOOHTB7PxQXiWMFaE7GLjTI1k3hobmZKpfd2sO4CSmUZZHE1HmEv6hfvxOJh3Obwg7+OhmOXUQcnMBj3MX/FmB5umtyU6/9pZUgIl0AHOzqkXMdicZ2KEAfSej18/vKkSHjU3ZTpB2CSHT3qcBFkEwfMSg17Yf5Fyq9pPUawdV9A3nWJdumGXmIcCe3eYsKex9oLYBGbtg/dVbQpYDG4nYGD/Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dDRwZ7ZvjA48oEAhFhPaFv6O7TQwmnUnkVyn+g6g4qQ=;
 b=D+KHkchKNyHyDbPYy7bUb+WC29oXcfUR0Qb3aMHwDwSdEgTHBqYxT+x0pyoWlXsXh8APLBD8EIOFWq/Ebxeq7sJDlRKKfDliqm7S7SP+MagTUJns8TSkeDmaeg7SWJYZWmdBLacTYyGP5FqbjOA41mCKI/5B6bV1lwQgQjIuxzT8fuuZMh+mfm8HQa+9SwLKB0ynzLvIaM8bxOCucgp9YKq79x/jkVdgX/a+g+PFuGWKrsbWpKh4OFZSwaUzEddYiBiMU6QJOw5lSClFmEzK7E8WePDDA4Zb4XHK6JsnPZS/tbOJmPYFC9G7xvqTk5uQlF4yst0D5qvMz0hUztQWhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dDRwZ7ZvjA48oEAhFhPaFv6O7TQwmnUnkVyn+g6g4qQ=;
 b=TreOAcegEs6wNN3yAoHGzcaRz3TdTuFeSw56nden8eQDx6WRnS2LoqZGw5WUEe7SE6fE3pu/WsQ+McqTbVvjfGofNhKsH6wYOFBI0hQq1AlJX3hOX5+oykQQVQko9rA/pixN9zRadB09KIuw7o39Bb8zG6OA0iU1MC9bAaceRQk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<Volodymyr_Babchuk@epam.com>, <jgrall@amazon.com>,
	<stefano.stabellini@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [XEN v6 2/2] xen/arm: domain_build: Use pfn start and end address for rangeset_{xxx}_range()
Date: Mon, 13 Feb 2023 12:44:38 +0000
Message-ID: <20230213124438.14836-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230213124438.14836-1-ayan.kumar.halder@amd.com>
References: <20230213124438.14836-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT102:EE_|DS0PR12MB7536:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e487a48-7a6a-4b88-33ac-08db0dc02517
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LkU8i0ra120Cn33v9/kJY2cKDt9+VHvMhjb+ficfqysykG7Nbdu7JWeh3cYz43nQoG2Bxb12JyDWsVI3vo8qt8IoXT0c2oK4DlAiyeIzng0wCw77Uc3Y6W0gI1beebeC4OG/uD0UKQwCiva/Ctivp9yUFQ89pJ4blrkgMnAEtRpHivtbB1xjrxvvK7G2FNpgeNJHfqZG4Lp59l3CVdJsC0gEINwiHgGsJn51j7NEaXMSoHMgVgsGXpJCAvvLZOIgJvSmOwFLDfUFctSSvGYm7B8ogobNmc9LZIEdu2/OT2WcsECxmWN9qFhXSD81Ew8qD96N4WqG860pou/jyfIlLGBxTD4Dt6oh7MMuFTO/TLLpgstKuDCWzSCEOENQ5SrLF3jWojWKGtPRC+jCBfTGL5Ax7kkrulHzy5tz0c6U4rA2u5qCpvj7YaNkRT5rHNzU9QGTuX5pPNnwNPwed2G2ZkUU9ZMBLANaFNAUTI79Xn4suMpgt5IGcgnsEYPmvY78qqh4OLhdUsP/+2LxUKvhfwRMmVA//n+J+btXFUJEUEhtfWfWFKrrvH/JXn1i7L6xz92DdSDxgiwoHh2RbzOrB7g2Kwh9yz7ZgFqPCsOPPYxyQRi/mYPZTAG9hg0JsszXrlG4J+9IyK87frCBXMCi+B9VawCBR1aHobHKMRm82we2yN0X0NmApFsupzEjbha+H3t25mAQjqXNYvXQf3atz9+YTzTSnBKVZ/tfWc4zzCDy6YHhJo9ZCwY3bk1MLovk0e5jZtpg5FFZ8cQkTHNCtj7hvTh95p9qSeIkw61qsNI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(396003)(39860400002)(346002)(451199018)(40470700004)(46966006)(36840700001)(36756003)(86362001)(103116003)(82310400005)(40460700003)(40480700001)(47076005)(426003)(83380400001)(70586007)(70206006)(8676002)(6916009)(4326008)(316002)(54906003)(1076003)(2616005)(186003)(26005)(336012)(6666004)(478600001)(82740400003)(2906002)(8936002)(356005)(41300700001)(5660300002)(81166007)(36860700001)(13513002)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 12:45:10.9279
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e487a48-7a6a-4b88-33ac-08db0dc02517
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT102.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7536

rangeset_{xxx}_range() functions are invoked with 'start' and 'size' as
arguments which are either 'uint64_t' or 'paddr_t'. However, the function
accepts 'unsigned long' for 'start' and 'size'. 'unsigned long' is 32 bits for
ARM_32. Thus, there is an implicit downcasting from 'uint64_t'/'paddr_t' to
'unsigned long' when invoking rangeset_{xxx}_range().

However, it may seem there is a possibility of lose of data due to truncation.

In reality, 'start' and 'size' are always page aligned. And ARM_32 currently
supports 40 bits as the width of physical address.
So if the addresses are page aligned, the last 12 bits contain zeroes.
Thus, we could instead pass page frame number which will contain 28 bits (40-12
on Arm_32) and this can be represented using 'unsigned long'.

On Arm_64, this change will not induce any adverse side effect as the width of
physical address is 48 bits. Thus, the width of 'pfn' (ie 48 - 12 = 36) can be
represented using 'unsigned long' (which is 64 bits wide).

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---

Changes from -

v1 - v5 - NA (New patch introduced in v6).

 xen/arch/arm/domain_build.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index a798e0b256..6a8c7206ae 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1566,7 +1566,8 @@ static int __init find_unallocated_memory(const struct kernel_info *kinfo,
     {
         start = bootinfo.mem.bank[i].start;
         end = bootinfo.mem.bank[i].start + bootinfo.mem.bank[i].size;
-        res = rangeset_add_range(unalloc_mem, start, end - 1);
+        res = rangeset_add_range(unalloc_mem, PFN_DOWN(start),
+                                 PFN_DOWN(end - 1));
         if ( res )
         {
             printk(XENLOG_ERR "Failed to add: %#"PRIpaddr"->%#"PRIpaddr"\n",
@@ -1580,7 +1581,8 @@ static int __init find_unallocated_memory(const struct kernel_info *kinfo,
     {
         start = assign_mem->bank[i].start;
         end = assign_mem->bank[i].start + assign_mem->bank[i].size;
-        res = rangeset_remove_range(unalloc_mem, start, end - 1);
+        res = rangeset_remove_range(unalloc_mem, PFN_DOWN(start),
+                                    PFN_DOWN(end - 1));
         if ( res )
         {
             printk(XENLOG_ERR "Failed to remove: %#"PRIpaddr"->%#"PRIpaddr"\n",
@@ -1595,7 +1597,8 @@ static int __init find_unallocated_memory(const struct kernel_info *kinfo,
         start = bootinfo.reserved_mem.bank[i].start;
         end = bootinfo.reserved_mem.bank[i].start +
             bootinfo.reserved_mem.bank[i].size;
-        res = rangeset_remove_range(unalloc_mem, start, end - 1);
+        res = rangeset_remove_range(unalloc_mem, PFN_DOWN(start),
+                                    PFN_DOWN(end - 1));
         if ( res )
         {
             printk(XENLOG_ERR "Failed to remove: %#"PRIpaddr"->%#"PRIpaddr"\n",
@@ -1607,7 +1610,7 @@ static int __init find_unallocated_memory(const struct kernel_info *kinfo,
     /* Remove grant table region */
     start = kinfo->gnttab_start;
     end = kinfo->gnttab_start + kinfo->gnttab_size;
-    res = rangeset_remove_range(unalloc_mem, start, end - 1);
+    res = rangeset_remove_range(unalloc_mem, PFN_DOWN(start), PFN_DOWN(end - 1));
     if ( res )
     {
         printk(XENLOG_ERR "Failed to remove: %#"PRIpaddr"->%#"PRIpaddr"\n",
@@ -1617,7 +1620,7 @@ static int __init find_unallocated_memory(const struct kernel_info *kinfo,
 
     start = 0;
     end = (1ULL << p2m_ipa_bits) - 1;
-    res = rangeset_report_ranges(unalloc_mem, start, end,
+    res = rangeset_report_ranges(unalloc_mem, PFN_DOWN(start), PFN_DOWN(end),
                                  add_ext_regions, ext_regions);
     if ( res )
         ext_regions->nr_banks = 0;
@@ -1639,7 +1642,7 @@ static int __init handle_pci_range(const struct dt_device_node *dev,
 
     start = addr & PAGE_MASK;
     end = PAGE_ALIGN(addr + len);
-    res = rangeset_remove_range(mem_holes, start, end - 1);
+    res = rangeset_remove_range(mem_holes, PFN_DOWN(start),PFN_DOWN(end - 1));
     if ( res )
     {
         printk(XENLOG_ERR "Failed to remove: %#"PRIpaddr"->%#"PRIpaddr"\n",
@@ -1677,7 +1680,7 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
     /* Start with maximum possible addressable physical memory range */
     start = 0;
     end = (1ULL << p2m_ipa_bits) - 1;
-    res = rangeset_add_range(mem_holes, start, end);
+    res = rangeset_add_range(mem_holes, PFN_DOWN(start), PFN_DOWN(end));
     if ( res )
     {
         printk(XENLOG_ERR "Failed to add: %#"PRIpaddr"->%#"PRIpaddr"\n",
@@ -1708,7 +1711,8 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
 
             start = addr & PAGE_MASK;
             end = PAGE_ALIGN(addr + size);
-            res = rangeset_remove_range(mem_holes, start, end - 1);
+            res = rangeset_remove_range(mem_holes, PFN_DOWN(start),
+                                        PFN_DOWN(end - 1));
             if ( res )
             {
                 printk(XENLOG_ERR "Failed to remove: %#"PRIpaddr"->%#"PRIpaddr"\n",
@@ -1735,7 +1739,7 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
 
     start = 0;
     end = (1ULL << p2m_ipa_bits) - 1;
-    res = rangeset_report_ranges(mem_holes, start, end,
+    res = rangeset_report_ranges(mem_holes, PFN_DOWN(start), PFN_DOWN(end),
                                  add_ext_regions,  ext_regions);
     if ( res )
         ext_regions->nr_banks = 0;
-- 
2.17.1


