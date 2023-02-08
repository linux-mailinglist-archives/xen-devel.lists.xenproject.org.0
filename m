Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E4868EE77
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 13:06:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491720.760997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPjDD-0006HZ-GU; Wed, 08 Feb 2023 12:06:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491720.760997; Wed, 08 Feb 2023 12:06:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPjDD-0006Fa-Cm; Wed, 08 Feb 2023 12:06:07 +0000
Received: by outflank-mailman (input) for mailman id 491720;
 Wed, 08 Feb 2023 12:06:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/3BG=6E=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pPjDB-0005Yt-1b
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 12:06:05 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20628.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f47fd19a-a7a8-11ed-93b5-47a8fe42b414;
 Wed, 08 Feb 2023 13:06:02 +0100 (CET)
Received: from BN8PR16CA0022.namprd16.prod.outlook.com (2603:10b6:408:4c::35)
 by BL3PR12MB6570.namprd12.prod.outlook.com (2603:10b6:208:38d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Wed, 8 Feb
 2023 12:05:59 +0000
Received: from BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:4c:cafe::3a) by BN8PR16CA0022.outlook.office365.com
 (2603:10b6:408:4c::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36 via Frontend
 Transport; Wed, 8 Feb 2023 12:05:59 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT034.mail.protection.outlook.com (10.13.176.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.17 via Frontend Transport; Wed, 8 Feb 2023 12:05:59 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 8 Feb
 2023 06:05:59 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 8 Feb
 2023 06:05:58 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Wed, 8 Feb 2023 06:05:57 -0600
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
X-Inumbo-ID: f47fd19a-a7a8-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RJd1wz7dMYsgPPH1/FcBi9+9O9ULUMg0c77k+X9K9F+hfHdy1+ZhaViJyyTdfelUYhECIF+iwQKqNpk5he6+gA7qnhzE0HLFNRG9p3/7z73E5LzJLPbJJV+Ykr0bAMDxGsmImoD2FsykU6ubavO8FjvLYpBz+zSExSoaZzzXDjE1urVvdsZbpsi4FeMwqH2d+AdjkoZoWaVzj7j0S9EM7LpTAYzzLeoV4R0p2Cfn/kzhCzLF6KE1ycFGoRfTCv82SNeipR96pkCwwqbzHnrLVDrgETZIeQIp+5bhSB6fTDR/+Vl7mnCy+Htuugm7D1R/hujD51ApUEtCORHxx2YKCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9HEXd6ARAjfD8fn3nNtPFsJDRaX64he8Jp0qXxsvYyY=;
 b=eChyWCmIVpr+pwH3iJEVuB4TuedcENhOhCEncOQbMzV5OSqQU8AjOdD4HSP4qZ/C99Uwy/qjvfD9dQa0rDLjOZo2U77F3qi7Ltj1FIzJ2YABRlxjVurVWZm8n2bVVXf8awPcwJb2uXdb2iyRWp9AEmaiZaa9lnH13cMbcUnTeuXfQUdvA3zf4ZjBcDnB1yGWAM2Cgd/NdOqFLofFU+/N8ayvvOX58wQbA5SnNbuJfi+SNmUt4fBpqLiSJu59I92WgARIZ/6oo6A6Vzt/qvcR/uNNBS9/TWkdiI5LqOQQEb3Q85jV96W4kns/lLuwXpupi4tJz8VK/4JyvxjMT8dycw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HEXd6ARAjfD8fn3nNtPFsJDRaX64he8Jp0qXxsvYyY=;
 b=nFDGpSRUG2nGXfxaDZlY5R3t9bdkbWDQR4Ynxp7Qbk39RGL/gk+gwtOHDVnY5gZPLBrIUCbrg1Uh8lcmkF6uvDTLPDp2KoMusGKGXfpFuXtM4HzsJ2y8VqZwcaSHl33bASDeY1dlMC9OUeQO6ZW4+Sg9d62Sa3HCyyGKGuBOGfM=
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
Subject: [XEN v3 2/9] xen/arm: Typecast the DT values into paddr_t
Date: Wed, 8 Feb 2023 12:05:22 +0000
Message-ID: <20230208120529.22313-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230208120529.22313-1-ayan.kumar.halder@amd.com>
References: <20230208120529.22313-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT034:EE_|BL3PR12MB6570:EE_
X-MS-Office365-Filtering-Correlation-Id: f3d5b161-4b80-4449-1244-08db09ccd761
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cK1l4WaKlaywofelyy6RJ+RTF3I9JRpKsgTFq2V8usSL6xJ0+XxIurE0thc/D1Beq8MFPh60GeW89rlbozKwr5aqc994tPXG0TqOTaVP73OPMbp/j2le8hbPcBqhTdDJxV9625vUsmod4K+1g1+P1lS/0FbZxRIw/k4IvrgoMwBaahSy9sTTJmhmUm4df2SPxSEtDTs80+xe7MYZzQKOPQ9DM8s6Xq+WVDrCJd2/EQ+E3W0QWP1QNwlH+VhahcPZWkNPfB53iHPx3AVSy7hVvbta/D/AZNt+f3ETl4wUsaIuhQC9dPkPNCfVshv0/ddBbmwt00WyE9fnIXvAJWudUlscxX4ie4rU9Ozl8XkIf5D6NafbEXEahwjneGzW5xlhngaLEVVhDzmC6YBPG3JdzzAw3MzNuLhfB/ptbbrFJZwvs9EjdRzCEjbRtbag6CjhMg2hC5MgP0r27MutLaApMEkAnYiotX2T87HL2ah8lSazcJrBW1p4R1CJ61OZXKkmZmJniHyBm4suzQfkkJoIvJla8QkeQAL7hexdfuKY38ye35Ys/091wvuIKBBb0ne4EHsxpeF586VIr9+73JxzmrpdvpILaYroewpPECc1UtjAfg41bTlrUq3h2LpIGbjIcRlDYbNPZTjeRrMc5sP//asJbZ25C4a2cAgx+CUf9mGYWAVQBucANqdMGgT9SeOqnCXQmmti06mGoprMYaPAoxixSozEtde/J45Yuhp62R4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(376002)(136003)(346002)(451199018)(36840700001)(40470700004)(46966006)(5660300002)(47076005)(30864003)(36756003)(7416002)(2906002)(426003)(81166007)(83380400001)(1076003)(40480700001)(2616005)(336012)(356005)(82740400003)(8676002)(36860700001)(4326008)(70206006)(70586007)(54906003)(6916009)(316002)(8936002)(103116003)(41300700001)(6666004)(186003)(82310400005)(26005)(40460700003)(478600001)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 12:05:59.4186
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3d5b161-4b80-4449-1244-08db09ccd761
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6570

In future, we wish to support 32 bit physical address.
However, the current dt and fdt functions can only read u64 values.
We wish to make the DT functions read u64 as well u32 values (depending
on the width of physical address). Also, we wish to detect if any
truncation has occurred (ie while reading u32 physical addresses from
u64 values read from DT).

device_tree_get_reg() should now be able to return paddr_t. This is
invoked by various callers to get DT address and size.

For fdt_get_mem_rsv(), we have introduced wrapper ie
fdt_get_mem_rsv_paddr() while will invoke fdt_get_mem_rsv() and translate
u64 to paddr_t. The reason being we cannot modify fdt_get_mem_rsv() as
it has been imported from external source.

For dt_read_number(), we have also introduced a wrapper ie
dt_read_paddr() to read physical addresses. We chose not to modify the
original function as it been used in places where it needs to
specifically u64 values from dt (For eg dt_property_read_u64()).

Xen prints an error when it detects a truncation (during typecast
between u64 and paddr_t). It is not possible to return an error in all
scenarios. So, it is user's responsibility to check the error logs.

To detect truncation, we right shift physical address by
"PADDR_BITS - 1" and then if the resulting number is greater than 1,
we know that truncation has occurred and an appropriate error log is
printed.

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

 xen/arch/arm/bootfdt.c              | 38 ++++++++++++++++-----
 xen/arch/arm/domain_build.c         |  2 +-
 xen/arch/arm/include/asm/setup.h    |  2 +-
 xen/arch/arm/setup.c                | 14 ++++----
 xen/arch/arm/smpboot.c              |  2 +-
 xen/include/xen/device_tree.h       | 21 ++++++++++++
 xen/include/xen/libfdt/libfdt_xen.h | 52 +++++++++++++++++++++++++++++
 xen/include/xen/types.h             |  2 ++
 8 files changed, 115 insertions(+), 18 deletions(-)
 create mode 100644 xen/include/xen/libfdt/libfdt_xen.h

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index 0085c28d74..f63da3e831 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -11,7 +11,7 @@
 #include <xen/efi.h>
 #include <xen/device_tree.h>
 #include <xen/lib.h>
-#include <xen/libfdt/libfdt.h>
+#include <xen/libfdt/libfdt_xen.h>
 #include <xen/sort.h>
 #include <xsm/xsm.h>
 #include <asm/setup.h>
@@ -53,10 +53,30 @@ static bool __init device_tree_node_compatible(const void *fdt, int node,
 }
 
 void __init device_tree_get_reg(const __be32 **cell, u32 address_cells,
-                                u32 size_cells, u64 *start, u64 *size)
+                                u32 size_cells, paddr_t *start, paddr_t *size)
 {
-    *start = dt_next_cell(address_cells, cell);
-    *size = dt_next_cell(size_cells, cell);
+    u64 dt_start, dt_size;
+
+    /*
+     * dt_next_cell will return u64 whereas paddr_t may be u64 or u32. Thus,
+     * there is an implicit cast from u64 to paddr_t.
+     */
+    dt_start = dt_next_cell(address_cells, cell);
+    dt_size = dt_next_cell(size_cells, cell);
+
+    if ( (dt_start >> (PADDR_SHIFT - 1)) > 1 )
+        printk("Error: Physical address greater than max width supported\n");
+
+    if ( (dt_size >> (PADDR_SHIFT - 1)) > 1 )
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
@@ -326,7 +346,7 @@ static int __init process_chosen_node(const void *fdt, int node,
         printk("linux,initrd-start property has invalid length %d\n", len);
         return -EINVAL;
     }
-    start = dt_read_number((void *)&prop->data, dt_size_to_cells(len));
+    start = dt_read_paddr((void *)&prop->data, dt_size_to_cells(len));
 
     prop = fdt_get_property(fdt, node, "linux,initrd-end", &len);
     if ( !prop )
@@ -339,7 +359,7 @@ static int __init process_chosen_node(const void *fdt, int node,
         printk("linux,initrd-end property has invalid length %d\n", len);
         return -EINVAL;
     }
-    end = dt_read_number((void *)&prop->data, dt_size_to_cells(len));
+    end = dt_read_paddr((void *)&prop->data, dt_size_to_cells(len));
 
     if ( start >= end )
     {
@@ -594,9 +614,11 @@ static void __init early_print_info(void)
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
index a798e0b256..4d7e67560f 100644
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
index a926f30a2b..6105e5cae3 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -158,7 +158,7 @@ extern uint32_t hyp_traps_vector[];
 void init_traps(void);
 
 void device_tree_get_reg(const __be32 **cell, u32 address_cells,
-                         u32 size_cells, u64 *start, u64 *size);
+                         u32 size_cells, paddr_t *start, paddr_t *size);
 
 u32 device_tree_get_u32(const void *fdt, int node,
                         const char *prop_name, u32 dflt);
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 1f26f67b90..5ade20e6e7 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -29,7 +29,7 @@
 #include <xen/virtual_region.h>
 #include <xen/vmap.h>
 #include <xen/trace.h>
-#include <xen/libfdt/libfdt.h>
+#include <xen/libfdt/libfdt_xen.h>
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
index a28937d12a..b61bac2931 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -244,6 +244,27 @@ static inline u64 dt_read_number(const __be32 *cell, int size)
     return r;
 }
 
+/* Wrapper for dt_read_number() to return paddr_t (instead of u64) */
+static inline paddr_t dt_read_paddr(const __be32 *cell, int size)
+{
+    u64 dt_r = 0;
+    paddr_t r;
+
+    dt_r = dt_read_number(cell, size);
+
+    if ( (dt_r >> (PADDR_SHIFT - 1)) > 1 )
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
diff --git a/xen/include/xen/libfdt/libfdt_xen.h b/xen/include/xen/libfdt/libfdt_xen.h
new file mode 100644
index 0000000000..a3196dd96c
--- /dev/null
+++ b/xen/include/xen/libfdt/libfdt_xen.h
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * xen/include/xen/libfdt/libfdt_xen.h
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
+    if ( (dt_addr >> (PADDR_SHIFT - 1)) > 1 )
+    {
+        printk("Error: Physical address greater than max width supported\n");
+        return -1;
+    }
+
+    if ( (dt_size >> (PADDR_SHIFT - 1)) > 1 )
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
diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h
index 6aba80500a..b7255c7c38 100644
--- a/xen/include/xen/types.h
+++ b/xen/include/xen/types.h
@@ -71,4 +71,6 @@ typedef bool bool_t;
 #define test_and_set_bool(b)   xchg(&(b), true)
 #define test_and_clear_bool(b) xchg(&(b), false)
 
+#define PADDR_SHIFT PADDR_BITS
+
 #endif /* __TYPES_H__ */
-- 
2.17.1


