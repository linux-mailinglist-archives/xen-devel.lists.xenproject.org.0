Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0726E13A0
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 19:38:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520853.808919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn0tW-0000vb-Gp; Thu, 13 Apr 2023 17:38:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520853.808919; Thu, 13 Apr 2023 17:38:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn0tW-0000sP-DF; Thu, 13 Apr 2023 17:38:02 +0000
Received: by outflank-mailman (input) for mailman id 520853;
 Thu, 13 Apr 2023 17:38:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2GAK=AE=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pn0tV-0000a4-4r
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 17:38:01 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20626.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee2535ea-da21-11ed-b21e-6b7b168915f2;
 Thu, 13 Apr 2023 19:37:59 +0200 (CEST)
Received: from BN9PR03CA0953.namprd03.prod.outlook.com (2603:10b6:408:108::28)
 by MN2PR12MB4343.namprd12.prod.outlook.com (2603:10b6:208:26f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 17:37:55 +0000
Received: from BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:108:cafe::38) by BN9PR03CA0953.outlook.office365.com
 (2603:10b6:408:108::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.31 via Frontend
 Transport; Thu, 13 Apr 2023 17:37:55 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT012.mail.protection.outlook.com (10.13.177.55) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.33 via Frontend Transport; Thu, 13 Apr 2023 17:37:55 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 13 Apr
 2023 12:37:54 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 13 Apr 2023 12:37:53 -0500
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
X-Inumbo-ID: ee2535ea-da21-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tf+hTJOTwnRQItM+0d9OL6rf+uqcqFfFY8B3hFtgght/vCOqFTiUl4X0OTy0K3oe7sADIjbffvBBBStswj6hogWzeiTjaap1mNC6F7sR/rUWASzit3f+XyW+dIuopljfr7Vq6TLjeJ0NvPNoOUgiw3ZO1EbSzc8a42plAL/igTHQNS6C/jmj+hoV+HCJEqefOz983DZwLGcYs+dY/5mcf7yEFP5VemhgwOR/b5ng5wTMEBk/pZL1/xy0XWyVifD7p/QjfpX8v1X8FvR2N1+jdtZS6BODYSlRbHvuovO2gYPTK28sySBVpp8HR3PbyBtyc/1EK2IDfOJfUBIUt7g7ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QaWVuZvjIQT6qz1jrl/Hs9hItflDrISzlZiBLoKD23Y=;
 b=NEUCe6ByQVb5PrMDbGElKhQrITSDKEHbRwtX8bjZo/RI/h7njFhybD8KBGJawUCSiQvEKx4byUSRTM6Tl+DLwG6FeuJksTVFQT6SpRUIUTrC6RPS7SmNV3FGl5vDLHo6uCEeT0ObrPMpE3Q3a1kHjFKJyFxu6InndeFEFIYNpSnWX3KGp58oEJcUxGKNdDigEg8EB69Sy3SFS9kqGgSubcCmUIA61glU+JFuD5eu10DbMabt9dW/ZpEqPdGwXsdHfRDbuy/MsLgyomILs41NikUIyuF9SHmhhXdPz0w7BOjPbjCIJjMyp5jsEzANTrrLQv3tTYLHWhWH3MOrXfjD3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QaWVuZvjIQT6qz1jrl/Hs9hItflDrISzlZiBLoKD23Y=;
 b=kS9duPNvN38Fih7IQ9M6X2HKpaUg0SbzuqXORINOQhk6stZ6mQpEeYYvuFhGQjXu2KOebS3W1colCLvVGX4qsgEgn7UFBmP9FEEPt6LzAufDSGLZqQlUll6NdKL0nLy4LJuUK8FnR2FU90nqL8Jo4mKRoBV98COjxOXUzFG2byU=
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
Subject: [XEN v5 02/10] xen/arm: Typecast the DT values into paddr_t
Date: Thu, 13 Apr 2023 18:37:27 +0100
Message-ID: <20230413173735.48387-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230413173735.48387-1-ayan.kumar.halder@amd.com>
References: <20230413173735.48387-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT012:EE_|MN2PR12MB4343:EE_
X-MS-Office365-Filtering-Correlation-Id: 56f16cf2-22ed-4bf8-c163-08db3c45d0a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	l/ZiAlgGXaOYtpDMdgJKswLeprohb+3vZgBiSE0Wf2KqO2NbXmOJ0Y45107MH0fM/dphPxMdzpmT9tqvWCISGClSxuBCsn6Hgl6ZtJe/1ciiV3/RsFtIyMJJ0gsmSbTD1u8/RalZfXiyKDCVTKVBy+kqwXFgBlD38vEBNZ89eTTWd2ezb18UBXJqJIpJYTIuRH/gJoCiQY+Upmf/G7A7n1heG5KkHtZOEEFeIDV95fkOIuyo2VQ1PNdIW5USzs1OROQTxBB5kUAVnq0UKrNtMKJYV/uTACyyOG5XZeIWgjIJE5kU6VaAxwRnFljlOYR2ivmYe/BryGzbrXjGTEZ9SqL/LAb6xIyfqULWhBpeaSA4XnK3vKYUMMAJUR8QXPjABAdz08SqtkVSvKxu+Etp0s2deaZdG1lzJd0POBZU9cSZR30s9GCWR4ir4FhQcXKSooGa6YcU6uyjOtF1v/3ehnp//oBFyIB2HLAg3ObzzjCqndfuBWHsQW2i9F8gfuYoACGWzYrR4HLNHay0JI0kgAAPVWvDMcLkCH0fsABCaO2no+v/zPxoI64vbJ6wiKyyHJj/ljBIpTFV8MWLQP3GQ3h9Sn8xKRE4QzZE1xkjktfCTAQreuvT/lLdfe57skoJ8emEeTjXJ/oojFYH5esZlZYOUtBarDzvLMQqvQwEHgAkSJFAGdbPzoYvDhKUBFm++YsUKUSj25rJOvYygbVeFoF2M5nBKhOqkMTLpGh3j1c=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(39860400002)(346002)(451199021)(36840700001)(40470700004)(46966006)(316002)(6916009)(4326008)(82740400003)(70206006)(70586007)(2616005)(47076005)(426003)(336012)(5660300002)(41300700001)(82310400005)(6666004)(36756003)(86362001)(40460700003)(54906003)(40480700001)(26005)(186003)(1076003)(103116003)(2906002)(83380400001)(30864003)(7416002)(8676002)(8936002)(36860700001)(478600001)(356005)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 17:37:55.3350
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56f16cf2-22ed-4bf8-c163-08db3c45d0a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4343

The DT functions (dt_read_number(), device_tree_get_reg(), fdt_get_mem_rsv())
currently accept or return 64-bit values.

In future when we support 32-bit physical address, these DT functions are
expected to accept/return 32-bit or 64-bit values (depending on the width of
physical address). Also, we wish to detect if any truncation has occurred
(i.e. while parsing 32-bit physical addresses from 64-bit values read from DT).

device_tree_get_reg() should now be able to return paddr_t. This is invoked by
various callers to get DT address and size.

For fdt_get_mem_rsv(), we have introduced a wrapper named
fdt_get_mem_rsv_paddr() which will invoke fdt_get_mem_rsv() and translate
uint64_t to paddr_t. The reason being we cannot modify fdt_get_mem_rsv() as it
has been imported from external source.

For dt_read_number(), we have also introduced a wrapper named dt_read_paddr()
dt_read_paddr() to read physical addresses. We chose not to modify the original
function as it is used in places where it needs to specifically read 64-bit
values from dt (For e.g. dt_property_read_u64()).

Xen prints warning when it detects truncation in cases where it is not able to
return error.

Also, replaced u32/u64 with uint32_t/uint64_t in the functions touched
by the code changes.

Also, initialized variables to fix the warning "-Werror=maybe-uninitialized".

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

v4 - 1. Added a WARN() when truncation is detected.
2. Always check the return value of fdt_get_mem_rsv().

 xen/arch/arm/bootfdt.c              | 48 +++++++++++++++++++------
 xen/arch/arm/domain_build.c         |  2 +-
 xen/arch/arm/include/asm/setup.h    |  4 +--
 xen/arch/arm/setup.c                | 18 +++++-----
 xen/arch/arm/smpboot.c              |  2 +-
 xen/include/xen/device_tree.h       | 23 ++++++++++++
 xen/include/xen/libfdt/libfdt-xen.h | 55 +++++++++++++++++++++++++++++
 7 files changed, 129 insertions(+), 23 deletions(-)
 create mode 100644 xen/include/xen/libfdt/libfdt-xen.h

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index 0085c28d74..ac8148da55 100644
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
@@ -52,11 +52,37 @@ static bool __init device_tree_node_compatible(const void *fdt, int node,
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
+     * dt_next_cell will return uint64_t whereas paddr_t may not be 64-bit.
+     * Thus, there is an implicit cast from uint64_t to paddr_t.
+     */
+    dt_start = dt_next_cell(address_cells, cell);
+    dt_size = dt_next_cell(size_cells, cell);
+
+    if ( dt_start != (paddr_t)dt_start )
+    {
+        printk("Error: Physical address greater than max width supported\n");
+        WARN();
+    }
+
+    if ( dt_size != (paddr_t)dt_size )
+    {
+        printk("Error: Physical size greater than max width supported\n");
+        WARN();
+    }
+
+    /*
+     * Xen will truncate the address/size if it is greater than the maximum
+     * supported width and it will give an appropriate warning.
+     */
+    *start = dt_start;
+    *size = dt_size;
 }
 
 static int __init device_tree_get_meminfo(const void *fdt, int node,
@@ -326,7 +352,7 @@ static int __init process_chosen_node(const void *fdt, int node,
         printk("linux,initrd-start property has invalid length %d\n", len);
         return -EINVAL;
     }
-    start = dt_read_number((void *)&prop->data, dt_size_to_cells(len));
+    start = dt_read_paddr((void *)&prop->data, dt_size_to_cells(len));
 
     prop = fdt_get_property(fdt, node, "linux,initrd-end", &len);
     if ( !prop )
@@ -339,7 +365,7 @@ static int __init process_chosen_node(const void *fdt, int node,
         printk("linux,initrd-end property has invalid length %d\n", len);
         return -EINVAL;
     }
-    end = dt_read_number((void *)&prop->data, dt_size_to_cells(len));
+    end = dt_read_paddr((void *)&prop->data, dt_size_to_cells(len));
 
     if ( start >= end )
     {
@@ -593,10 +619,12 @@ static void __init early_print_info(void)
     nr_rsvd = fdt_num_mem_rsv(device_tree_flattened);
     for ( i = 0; i < nr_rsvd; i++ )
     {
-        paddr_t s, e;
-        if ( fdt_get_mem_rsv(device_tree_flattened, i, &s, &e) < 0 )
+        paddr_t s = 0, e = 0;
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
index c8f08d8ee2..15c8bdd9e4 100644
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
index 1f26f67b90..d2a3d8c340 100644
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
@@ -220,13 +220,13 @@ static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
 
     for ( i = first; i < nr ; i++ )
     {
-        paddr_t r_s, r_e;
+        paddr_t r_s = 0, r_e = 0;
 
-        if ( fdt_get_mem_rsv(device_tree_flattened, i, &r_s, &r_e ) < 0 )
+        if ( fdt_get_mem_rsv_paddr(device_tree_flattened, i, &r_s, &r_e ) < 0 )
             /* If we can't read it, pretend it doesn't exist... */
             continue;
 
-        r_e += r_s; /* fdt_get_mem_rsv returns length */
+        r_e += r_s; /* fdt_get_mem_rsv_paddr returns length */
 
         if ( s < r_e && r_s < e )
         {
@@ -500,15 +500,15 @@ static paddr_t __init consider_modules(paddr_t s, paddr_t e,
 
     for ( ; i < mi->nr_mods + nr; i++ )
     {
-        paddr_t mod_s, mod_e;
+        paddr_t mod_s = 0, mod_e = 0;
 
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
index 19a74909ce..11bda2fd3d 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -241,6 +241,29 @@ static inline u64 dt_read_number(const __be32 *cell, int size)
     return r;
 }
 
+/* Wrapper for dt_read_number() to return paddr_t (instead of uint64_t) */
+static inline paddr_t dt_read_paddr(const __be32 *cell, int size)
+{
+    uint64_t dt_r = 0;
+    paddr_t r;
+
+    dt_r = dt_read_number(cell, size);
+
+    if ( dt_r != (paddr_t)dt_r )
+    {
+        printk("Error: Physical address greater than max width supported\n");
+        WARN();
+    }
+
+    /*
+     * Xen will truncate the address/size if it is greater than the maximum
+     * supported width and it will give an appropriate warning.
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
index 0000000000..3296a368a6
--- /dev/null
+++ b/xen/include/xen/libfdt/libfdt-xen.h
@@ -0,0 +1,55 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-only
+ *
+ * xen/include/xen/libfdt/libfdt-xen.h
+ *
+ * Wrapper functions for device tree. This helps to convert dt values
+ * between uint64_t and paddr_t.
+ *
+ * Copyright (C) 2023, Advanced Micro Devices, Inc. All Rights Reserved.
+ */
+
+#ifndef LIBFDT_XEN_H
+#define LIBFDT_XEN_H
+
+#include <xen/libfdt/libfdt.h>
+
+static inline int fdt_get_mem_rsv_paddr(const void *fdt, int n,
+                                        paddr_t *address,
+                                        paddr_t *size)
+{
+    uint64_t dt_addr;
+    uint64_t dt_size;
+    int ret = 0;
+
+    ret = fdt_get_mem_rsv(fdt, n, &dt_addr, &dt_size);
+    if ( ret )
+        return ret;
+
+    if ( dt_addr != (paddr_t)dt_addr )
+    {
+        printk("Error: Physical address greater than max width supported\n");
+        return -FDT_ERR_MAX;
+    }
+
+    if ( dt_size != (paddr_t)dt_size )
+    {
+        printk("Error: Physical size greater than max width supported\n");
+        return -FDT_ERR_MAX;
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


