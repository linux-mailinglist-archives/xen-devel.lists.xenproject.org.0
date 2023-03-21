Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C406C33A2
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 15:05:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512669.792760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pecba-0005hc-Eo; Tue, 21 Mar 2023 14:04:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512669.792760; Tue, 21 Mar 2023 14:04:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pecba-0005eF-BL; Tue, 21 Mar 2023 14:04:50 +0000
Received: by outflank-mailman (input) for mailman id 512669;
 Tue, 21 Mar 2023 14:04:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CsWt=7N=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pecbY-0005Xe-Gw
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 14:04:48 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20617.outbound.protection.outlook.com
 [2a01:111:f400:7e89::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55720ebb-c7f1-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 15:04:46 +0100 (CET)
Received: from DM5PR07CA0059.namprd07.prod.outlook.com (2603:10b6:4:ad::24) by
 DM4PR12MB8570.namprd12.prod.outlook.com (2603:10b6:8:18b::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.37; Tue, 21 Mar 2023 14:04:43 +0000
Received: from DS1PEPF0000E653.namprd02.prod.outlook.com
 (2603:10b6:4:ad:cafe::2d) by DM5PR07CA0059.outlook.office365.com
 (2603:10b6:4:ad::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Tue, 21 Mar 2023 14:04:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E653.mail.protection.outlook.com (10.167.18.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Tue, 21 Mar 2023 14:04:42 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 21 Mar
 2023 09:04:41 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 21 Mar
 2023 07:04:41 -0700
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 21 Mar 2023 09:04:39 -0500
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
X-Inumbo-ID: 55720ebb-c7f1-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TyjyT/oOzRa9Fuubniy7nv2qIHV3FjuwzTkJ4/bHrUJ3jTUFDu4JHA3Qk2QYetPPGJuXTrt3sE4VY+VAkQbUT/O0nScbwxy/nGxmRPgdxhv/1qaOrL8vpG5jx2BS4e3+wHU+YKWrUei9//IklcWacJ9gzQSvjG2KxW6CUUtBdQgGOEg8C+WDC09KWK7wNltwk4GlVmYoflpQY7A8cqxZZYYqBuMX2ax3MqQpXIX69f+E5xucqIi3CziOldp2NRS8rbiqptVF9LhDhaYYkUnTJ4AZHxjS91f9KnxqT+aDNsPDoH+lk0ZXEWMWzp3A8RqoHTaLhtqHkKx1sZjjwF4zEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KDzxAY8EckX/4EZG10FOT1AXCf3RIv+DywbOAf1WGVU=;
 b=gu+D3i69nd8qbbqmOU0QLeS/CF3kkjONkE46pGU0md22h+rPKuj+U9QDhqJ6KxxTZK+dy9XQJX7w4R3KMpFmKz69K1S5+hhhmirvyW9ds52LiBPnMOM7yFwaL3v2xCHcNYqSBgd+WGFyvl7ob0zglS0skD4UMeby3xWmv0s66YOfmwVAJx+mMyxOW5mI9CbhPhOOfQ9Vhd2EdzDC+0awL8XYCulpK/4b5c89+vY3htY2WNOuRTjSyzuGwKWXHR9VYI0OFin8U36VO9MhX1RkraN71+AsOEd3VSnAcvame+xuaJ8kaCsxkYmcBh4FhwLEefBKVwlOVnzSDxhbyM6sfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDzxAY8EckX/4EZG10FOT1AXCf3RIv+DywbOAf1WGVU=;
 b=qlgfwxotvMcmb9quHxOomOumO2QxNzk8cCCEnIckOC6V5a8xVzG9gSToZwq+z34BVytGOFVejB+v3bv4MNhlhlB4lVnAs70AjMygIBW8B70Ur/19pTtKdPcqsFrxdtRhlpStjuucRFyvM/4jKfpWjngWICukAF7hTBc/GjOWPLs=
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
	<wl@xen.org>, <rahul.singh@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v4 03/11] xen/arm: Typecast the DT values into paddr_t
Date: Tue, 21 Mar 2023 14:03:49 +0000
Message-ID: <20230321140357.24094-4-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230321140357.24094-1-ayan.kumar.halder@amd.com>
References: <20230321140357.24094-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E653:EE_|DM4PR12MB8570:EE_
X-MS-Office365-Filtering-Correlation-Id: ad916c65-605f-4a92-8d18-08db2a153826
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Qu7nSqp7DQl1GBXTapTs2grj2MNKqrYBQMWuQ22DeYp2El4SEsxnc4OcG99FizanYYtbuPfHJdXPXrbrMXsiTk+JIHpcC94ehk1EpVpLQ5RSgIs/UNPtYHfyqLxl80/Yc0z/B9vLVu4pchVKqgSSPt/bHf+RB6ZKxxbth8gi/HN/gpV4PaGJQ+eBT8GxjaSCFFktdSPZWIDWml5PKIY9+4LagmvuFk2dBusTkmKOeunmfuy4QB2Dly/dPmmG1e6EFm1oPDXN6jwEmFy9HdU3HFNVUweykAQ7t+FYytVsen3i4E4k8sVn/Yfu4v+VxZ9HTb3blvLHnab/drF/DUGVW1XgwKhtht/TqsWIzaphR/x0EnEsKX7vCR2VlJJpTQo5fqX8EsCpSj6rtAWmIcwI57OMwst6bzjGRCasqVWD0HFRr2zeX4gLbHev2uJye7SINQOFGhFFvyJXRGBZMp4eOXNC7LJg3ZWWtwHBj3X3ySq0Pe8/XM5eZiP4SiTP0uvoicTiSrbjDBxf9T/CDzWB1TTEsgk8AF2J9iO8uzl0GNW8dPxoh33ly7h9AxM97AyAGWXDrbd02JleE+ySI4UtFw3VRUDQIFwmBBiKNV+He3kci7R0lQ5+VQtspKQgEZAPK4fKgbp+OXFfJuuD4deDGWv4FJP/syFeWyI9bqaJKDliLHvlW7VdT0NdfREuUICndz8z22dFfK0U155xWfcOKFdQwVWePUPNfwb2ZFMj9XM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(346002)(39860400002)(136003)(451199018)(36840700001)(40470700004)(46966006)(316002)(86362001)(83380400001)(36756003)(336012)(8936002)(40480700001)(41300700001)(47076005)(26005)(1076003)(186003)(2906002)(82310400005)(6916009)(4326008)(70586007)(70206006)(8676002)(40460700003)(426003)(6666004)(2616005)(30864003)(5660300002)(82740400003)(81166007)(54906003)(36860700001)(103116003)(356005)(7416002)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 14:04:42.7006
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad916c65-605f-4a92-8d18-08db2a153826
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E653.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8570

In future, we wish to support 32 bit physical address.
However, the current dt and fdt functions can only read u64 values.
We wish to make the DT functions read 32bit as well 64bit values
(depending on the width of physical address). Also, we wish to detect
if any truncation has occurred (ie while reading 32bit physical
addresses from 64bit values read from DT).

device_tree_get_reg() should now be able to return paddr_t. This is
invoked by various callers to get DT address and size.

For fdt_get_mem_rsv(), we have introduced wrapper ie
fdt_get_mem_rsv_paddr() while will invoke fdt_get_mem_rsv() and
translate uint64_t to paddr_t. The reason being we cannot modify
fdt_get_mem_rsv() as it has been imported from external source.

For dt_read_number(), we have also introduced a wrapper ie
dt_read_paddr() to read physical addresses. We chose not to modify the
original function as it been used in places where it needs to
specifically 64bit values from dt (For eg dt_property_read_u64()).

Xen prints an error when it detects a truncation (during typecast
between uint64_t and paddr_t). It is not possible to return an error in
all scenarios. So, it is user's responsibility to check the error logs.

Also, replaced u32/u64 with uint32_t/uint64_t in the functions touched
by the code changes.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---

Changes from

v1 - 1. Dropped "[XEN v1 2/9] xen/arm: Define translate_dt_address_size() for the translation between u64 and paddr_t" and
"[XEN v1 4/9] xen/arm: Use translate_dt_address_size() to translate between device tree addr/size and paddr_t", instead
this approach achieves the same purpose.

2. No need to check for truncation while converting values from u64 to paddr_t.

v2 - 1. Use "( (dt_start >> (PADDR_SHIFT - 1)) > 1 )" to detect truncation.
2. Introduced libfdt_xen.h to implement fdt_get_mem_rsv_paddr
3. Logged error messages in case truncation is detected.

v3 - 1. Renamed libfdt_xen.h to libfdt-xen.h.
2. Replaced u32/u64 with uint32_t/uint64_t
3. Use "(paddr_t)val != val" to check for truncation.
4. Removed the alias "#define PADDR_SHIFT PADDR_BITS". 

 xen/arch/arm/bootfdt.c              | 41 ++++++++++++++++++-----
 xen/arch/arm/domain_build.c         |  2 +-
 xen/arch/arm/include/asm/setup.h    |  4 +--
 xen/arch/arm/setup.c                | 14 ++++----
 xen/arch/arm/smpboot.c              |  2 +-
 xen/include/xen/device_tree.h       | 21 ++++++++++++
 xen/include/xen/libfdt/libfdt-xen.h | 52 +++++++++++++++++++++++++++++
 7 files changed, 116 insertions(+), 20 deletions(-)
 create mode 100644 xen/include/xen/libfdt/libfdt-xen.h

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index 0085c28d74..33bef1c15e 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -11,7 +11,7 @@
 #include <xen/efi.h>
 #include <xen/device_tree.h>
 #include <xen/lib.h>
-#include <xen/libfdt/libfdt.h>
+#include <xen/libfdt/libfdt-xen.h>
 #include <xen/sort.h>
 #include <xsm/xsm.h>
 #include <asm/setup.h>
@@ -52,11 +52,32 @@ static bool __init device_tree_node_compatible(const void *fdt, int node,
     return false;
 }
 
-void __init device_tree_get_reg(const __be32 **cell, u32 address_cells,
-                                u32 size_cells, u64 *start, u64 *size)
+void __init device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
+                                uint32_t size_cells, paddr_t *start,
+                                paddr_t *size)
 {
-    *start = dt_next_cell(address_cells, cell);
-    *size = dt_next_cell(size_cells, cell);
+    uint64_t dt_start, dt_size;
+
+    /*
+     * dt_next_cell will return u64 whereas paddr_t may be u64 or u32. Thus,
+     * there is an implicit cast from u64 to paddr_t.
+     */
+    dt_start = dt_next_cell(address_cells, cell);
+    dt_size = dt_next_cell(size_cells, cell);
+
+    if ( dt_start != (paddr_t)dt_start  )
+        printk("Error: Physical address greater than max width supported\n");
+
+    if ( dt_size != (paddr_t)dt_size )
+        printk("Error: Physical size greater than max width supported\n");
+
+    /*
+     * Note: It is user's responsibility to check for the error messages.
+     * Xen will sliently truncate in case if the address/size is greater than
+     * the max supported width.
+     */
+    *start = dt_start;
+    *size = dt_size;
 }
 
 static int __init device_tree_get_meminfo(const void *fdt, int node,
@@ -326,7 +347,7 @@ static int __init process_chosen_node(const void *fdt, int node,
         printk("linux,initrd-start property has invalid length %d\n", len);
         return -EINVAL;
     }
-    start = dt_read_number((void *)&prop->data, dt_size_to_cells(len));
+    start = dt_read_paddr((void *)&prop->data, dt_size_to_cells(len));
 
     prop = fdt_get_property(fdt, node, "linux,initrd-end", &len);
     if ( !prop )
@@ -339,7 +360,7 @@ static int __init process_chosen_node(const void *fdt, int node,
         printk("linux,initrd-end property has invalid length %d\n", len);
         return -EINVAL;
     }
-    end = dt_read_number((void *)&prop->data, dt_size_to_cells(len));
+    end = dt_read_paddr((void *)&prop->data, dt_size_to_cells(len));
 
     if ( start >= end )
     {
@@ -594,9 +615,11 @@ static void __init early_print_info(void)
     for ( i = 0; i < nr_rsvd; i++ )
     {
         paddr_t s, e;
-        if ( fdt_get_mem_rsv(device_tree_flattened, i, &s, &e) < 0 )
+
+        if ( fdt_get_mem_rsv_paddr(device_tree_flattened, i, &s, &e) < 0 )
             continue;
-        /* fdt_get_mem_rsv returns length */
+
+        /* fdt_get_mem_rsv_paddr returns length */
         e += s;
         printk(" RESVD[%u]: %"PRIpaddr" - %"PRIpaddr"\n", i, s, e);
     }
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 24b12b7512..6573d15302 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -949,7 +949,7 @@ static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
         BUG_ON(!prop);
         cells = (const __be32 *)prop->value;
         device_tree_get_reg(&cells, addr_cells, addr_cells, &pbase, &gbase);
-        psize = dt_read_number(cells, size_cells);
+        psize = dt_read_paddr(cells, size_cells);
         if ( !IS_ALIGNED(pbase, PAGE_SIZE) || !IS_ALIGNED(gbase, PAGE_SIZE) )
         {
             printk("%pd: physical address 0x%"PRIpaddr", or guest address 0x%"PRIpaddr" is not suitably aligned.\n",
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index a926f30a2b..7b697d879e 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -157,8 +157,8 @@ const char *boot_module_kind_as_string(bootmodule_kind kind);
 extern uint32_t hyp_traps_vector[];
 void init_traps(void);
 
-void device_tree_get_reg(const __be32 **cell, u32 address_cells,
-                         u32 size_cells, u64 *start, u64 *size);
+void device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
+                         uint32_t size_cells, paddr_t *start, paddr_t *size);
 
 u32 device_tree_get_u32(const void *fdt, int node,
                         const char *prop_name, u32 dflt);
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 1f26f67b90..755173e5a3 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -29,7 +29,7 @@
 #include <xen/virtual_region.h>
 #include <xen/vmap.h>
 #include <xen/trace.h>
-#include <xen/libfdt/libfdt.h>
+#include <xen/libfdt/libfdt-xen.h>
 #include <xen/acpi.h>
 #include <xen/warning.h>
 #include <asm/alternative.h>
@@ -222,11 +222,11 @@ static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
     {
         paddr_t r_s, r_e;
 
-        if ( fdt_get_mem_rsv(device_tree_flattened, i, &r_s, &r_e ) < 0 )
+        if ( fdt_get_mem_rsv_paddr(device_tree_flattened, i, &r_s, &r_e ) < 0 )
             /* If we can't read it, pretend it doesn't exist... */
             continue;
 
-        r_e += r_s; /* fdt_get_mem_rsv returns length */
+        r_e += r_s; /* fdt_get_mem_rsv_paddr returns length */
 
         if ( s < r_e && r_s < e )
         {
@@ -502,13 +502,13 @@ static paddr_t __init consider_modules(paddr_t s, paddr_t e,
     {
         paddr_t mod_s, mod_e;
 
-        if ( fdt_get_mem_rsv(device_tree_flattened,
-                             i - mi->nr_mods,
-                             &mod_s, &mod_e ) < 0 )
+        if ( fdt_get_mem_rsv_paddr(device_tree_flattened,
+                                   i - mi->nr_mods,
+                                   &mod_s, &mod_e ) < 0 )
             /* If we can't read it, pretend it doesn't exist... */
             continue;
 
-        /* fdt_get_mem_rsv returns length */
+        /* fdt_get_mem_rsv_paddr returns length */
         mod_e += mod_s;
 
         if ( s < mod_e && mod_s < e )
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 412ae22869..c15c177487 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -159,7 +159,7 @@ static void __init dt_smp_init_cpus(void)
             continue;
         }
 
-        addr = dt_read_number(prop, dt_n_addr_cells(cpu));
+        addr = dt_read_paddr(prop, dt_n_addr_cells(cpu));
 
         hwid = addr;
         if ( hwid != addr )
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 19a74909ce..bbc7d7377a 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -241,6 +241,27 @@ static inline u64 dt_read_number(const __be32 *cell, int size)
     return r;
 }
 
+/* Wrapper for dt_read_number() to return paddr_t (instead of u64) */
+static inline paddr_t dt_read_paddr(const __be32 *cell, int size)
+{
+    uint64_t dt_r = 0;
+    paddr_t r;
+
+    dt_r = dt_read_number(cell, size);
+
+    if ( dt_r != (paddr_t)dt_r )
+        printk("Error: Physical address greater than max width supported\n");
+
+    /*
+     * Note: It is user's responsibility to check for the error messages.
+     * Xen will sliently truncate in case if the address/size is greater than
+     * the max supported width.
+     */
+    r = dt_r;
+
+    return r;
+}
+
 /* Helper to convert a number of cells to bytes */
 static inline int dt_cells_to_size(int size)
 {
diff --git a/xen/include/xen/libfdt/libfdt-xen.h b/xen/include/xen/libfdt/libfdt-xen.h
new file mode 100644
index 0000000000..648bf41be6
--- /dev/null
+++ b/xen/include/xen/libfdt/libfdt-xen.h
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * xen/include/xen/libfdt/libfdt-xen.h
+ *
+ * Wrapper functions for device tree. This helps to convert dt values
+ * between u64 and paddr_t.
+ *
+ * Copyright (C) 2023, Advanced Micro Devices, Inc. All Rights Reserved.
+ */
+
+#ifndef LIBFDT_XEN_H
+#define LIBFDT_XEN_H
+
+#include <xen/libfdt/libfdt.h>
+
+inline int fdt_get_mem_rsv_paddr(const void *fdt, int n,
+                                 paddr_t *address,
+                                 paddr_t *size)
+{
+    uint64_t dt_addr;
+    uint64_t dt_size;
+    int ret = 0;
+
+    ret = fdt_get_mem_rsv(fdt, n, &dt_addr, &dt_size);
+
+    if ( dt_addr != (paddr_t)dt_addr )
+    {
+        printk("Error: Physical address greater than max width supported\n");
+        return -1;
+    }
+
+    if ( dt_size != (paddr_t)dt_size )
+    {
+        printk("Error: Physical size greater than max width supported\n");
+        return -1;
+    }
+
+    *address = dt_addr;
+    *size = dt_size;
+
+    return ret;
+}
+
+#endif /* LIBFDT_XEN_H */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.17.1


