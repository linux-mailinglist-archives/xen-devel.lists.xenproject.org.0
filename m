Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAB27F0ABB
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 03:55:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636377.991843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4uRv-0004Ei-26; Mon, 20 Nov 2023 02:55:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636377.991843; Mon, 20 Nov 2023 02:55:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4uRu-0004AM-Rl; Mon, 20 Nov 2023 02:55:46 +0000
Received: by outflank-mailman (input) for mailman id 636377;
 Mon, 20 Nov 2023 02:55:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N0Aw=HB=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1r4uRi-0007WE-Tl
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 02:55:34 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 457dd832-8750-11ee-9b0e-b553b5be7939;
 Mon, 20 Nov 2023 03:55:33 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A6551042;
 Sun, 19 Nov 2023 18:56:18 -0800 (PST)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E45863F6C4;
 Sun, 19 Nov 2023 18:55:29 -0800 (PST)
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
X-Inumbo-ID: 457dd832-8750-11ee-9b0e-b553b5be7939
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH v6 12/17] xen/arm: enable device tree based NUMA in system init
Date: Mon, 20 Nov 2023 10:54:26 +0800
Message-Id: <20231120025431.14845-13-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231120025431.14845-1-Henry.Wang@arm.com>
References: <20231120025431.14845-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Chen <wei.chen@arm.com>

In this patch, we can start to create NUMA system that is
based on device tree.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
v5 -> v6:
- Rebase on top of staging without code changes.
v1 -> v5:
- Fix coding style: label indented by 1 space.
- replace ~0 by INVALID_PADDR.
- only print error messages for invalid dtb data.
- remove unnecessary return.
- remove the parameter of numa_init.
---
 xen/arch/arm/include/asm/numa.h |  5 +++
 xen/arch/arm/numa.c             | 57 +++++++++++++++++++++++++++++++++
 xen/arch/arm/setup.c            |  7 ++++
 3 files changed, 69 insertions(+)

diff --git a/xen/arch/arm/include/asm/numa.h b/xen/arch/arm/include/asm/numa.h
index 15308f5a36..55ac4665db 100644
--- a/xen/arch/arm/include/asm/numa.h
+++ b/xen/arch/arm/include/asm/numa.h
@@ -45,6 +45,7 @@ extern void numa_set_distance(nodeid_t from, nodeid_t to,
                               unsigned int distance);
 extern void numa_detect_cpu_node(unsigned int cpu);
 extern int numa_device_tree_init(const void *fdt);
+extern void numa_init(void);
 
 #else
 
@@ -90,6 +91,10 @@ static inline void numa_detect_cpu_node(unsigned int cpu)
 {
 }
 
+static inline void numa_init(void)
+{
+}
+
 #endif
 
 #define arch_want_default_dmazone() (false)
diff --git a/xen/arch/arm/numa.c b/xen/arch/arm/numa.c
index 08e15ebbb0..13a167fc4f 100644
--- a/xen/arch/arm/numa.c
+++ b/xen/arch/arm/numa.c
@@ -18,7 +18,11 @@
  *
  */
 #include <xen/init.h>
+#include <xen/device_tree.h>
+#include <xen/nodemask.h>
 #include <xen/numa.h>
+#include <xen/pfn.h>
+#include <xen/acpi.h>
 
 enum dt_numa_status __ro_after_init device_tree_numa = DT_NUMA_DEFAULT;
 
@@ -104,6 +108,59 @@ unsigned char __node_distance(nodeid_t from, nodeid_t to)
     return node_distance_map[from][to];
 }
 
+void __init numa_init(void)
+{
+    unsigned int idx;
+    paddr_t ram_start = INVALID_PADDR;
+    paddr_t ram_size = 0;
+    paddr_t ram_end = 0;
+
+    /* NUMA has been turned off through Xen parameters */
+    if ( numa_off )
+        goto mem_init;
+
+    /* Initialize NUMA from device tree when system is not ACPI booted */
+    if ( acpi_disabled )
+    {
+        int ret = numa_device_tree_init(device_tree_flattened);
+        if ( ret )
+        {
+            numa_off = true;
+            if ( ret == -EINVAL )
+                printk(XENLOG_WARNING
+                       "Init NUMA from device tree failed, ret=%d\n", ret);
+        }
+    }
+    else
+    {
+        /* We don't support NUMA for ACPI boot currently */
+        printk(XENLOG_WARNING
+               "ACPI NUMA has not been supported yet, NUMA off!\n");
+        numa_off = true;
+    }
+
+ mem_init:
+    /*
+     * Find the minimal and maximum address of RAM, NUMA will
+     * build a memory to node mapping table for the whole range.
+     */
+    ram_start = bootinfo.mem.bank[0].start;
+    ram_size  = bootinfo.mem.bank[0].size;
+    ram_end   = ram_start + ram_size;
+    for ( idx = 1 ; idx < bootinfo.mem.nr_banks; idx++ )
+    {
+        paddr_t bank_start = bootinfo.mem.bank[idx].start;
+        paddr_t bank_size = bootinfo.mem.bank[idx].size;
+        paddr_t bank_end = bank_start + bank_size;
+
+        ram_size  = ram_size + bank_size;
+        ram_start = min(ram_start, bank_start);
+        ram_end   = max(ram_end, bank_end);
+    }
+
+    numa_initmem_init(PFN_UP(ram_start), PFN_DOWN(ram_end));
+}
+
 int __init arch_get_ram_range(unsigned int idx, paddr_t *start, paddr_t *end)
 {
     if ( idx >= bootinfo.mem.nr_banks )
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 02bc887725..01affc12d9 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -1124,6 +1124,13 @@ void __init start_xen(unsigned long boot_phys_offset,
     /* Parse the ACPI tables for possible boot-time configuration */
     acpi_boot_table_init();
 
+    /*
+     * Try to initialize NUMA system, if failed, the system will
+     * fallback to uniform system which means system has only 1
+     * NUMA node.
+     */
+    numa_init();
+
     end_boot_allocator();
 
     /*
-- 
2.25.1


