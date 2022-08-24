Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4474359F463
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 09:32:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392230.630449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQkrr-0000pZ-D1; Wed, 24 Aug 2022 07:32:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392230.630449; Wed, 24 Aug 2022 07:32:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQkrr-0000m1-9l; Wed, 24 Aug 2022 07:32:03 +0000
Received: by outflank-mailman (input) for mailman id 392230;
 Wed, 24 Aug 2022 07:32:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pSDv=Y4=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oQkrp-0000ky-RQ
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 07:32:02 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id d62fdb6d-237e-11ed-9250-1f966e50362f;
 Wed, 24 Aug 2022 09:31:58 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E9C4A1063;
 Wed, 24 Aug 2022 00:32:01 -0700 (PDT)
Received: from entos-skylake.shanghai.arm.com (entos-skylake.shanghai.arm.com
 [10.169.212.207])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5C0313F718;
 Wed, 24 Aug 2022 00:31:55 -0700 (PDT)
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
X-Inumbo-ID: d62fdb6d-237e-11ed-9250-1f966e50362f
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <Wei.Chen@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH 1/2] docs, xen/arm: Introduce reserved heap memory
Date: Wed, 24 Aug 2022 07:31:26 +0000
Message-Id: <20220824073127.16762-2-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220824073127.16762-1-Henry.Wang@arm.com>
References: <20220824073127.16762-1-Henry.Wang@arm.com>

This commit introduces the reserved heap memory, which is parts of RAM
reserved in the beginning of the boot time for heap.

A new boolean field `xen_heap` in `struct membank` is added to store the
configuration telling if the memory bank is reserved as heap through
`xen,static-mem` property in device tree `chosen` node.

Also, this commit introduces the logic to parse the reserved heap
configuation in device tree by reusing the device tree entry definition
of the static memory allocation feature:

- Add a boolean parameter `xen_heap` to `device_tree_get_meminfo` to
reflect whether the memory bank is reserved as heap.

- Use `device_tree_get_meminfo` to parse the reserved heap configuation
in `chosen` node of the device tree.

- In order to reuse the function `device_tree_get_meminfo`, the
return type of `process_chosen_node` is changed from void to int.

A documentation section is added, describing the definition of reserved
heap memory and the method of enabling the reserved heap memory through
device tree at boot time.

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
The name of the device tree property was chosen because we want to
reuse as much as the device tree parsing helpers from the static
memory allocation feature, but we would like to hear the upstream
reviewers' opinion about if using "xen,static-heap" is better.
---
Changes from RFC to v1:
- Rename the terminology to reserved heap.
---
 docs/misc/arm/device-tree/booting.txt | 46 +++++++++++++++++++++++++
 xen/arch/arm/bootfdt.c                | 49 +++++++++++++++++++++------
 xen/arch/arm/domain_build.c           |  5 +--
 xen/arch/arm/include/asm/setup.h      |  1 +
 4 files changed, 89 insertions(+), 12 deletions(-)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 98253414b8..e064f64d9a 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -378,3 +378,49 @@ device-tree:
 
 This will reserve a 512MB region starting at the host physical address
 0x30000000 to be exclusively used by DomU1.
+
+
+Reserved Heap Memory
+====================
+
+The reserved heap memory (also known as the statically-configured heap) refers
+to parts of RAM reserved in the beginning for heap. The memory is reserved by
+configuration in the device tree using physical address ranges.
+
+The reserved heap memory declared in the device tree defines the memory areas
+that will be reserved to be used exclusively as heap.
+
+- For Arm32, since there can be seperated heaps, the reserved heap will be used
+for both domheap and xenheap.
+- For Arm64, since domheap and xenheap are the same, the defined reserved heap
+areas shall always go to the heap allocator.
+
+The reserved heap memory is an optional feature and can be enabled by adding a
+device tree property in the `chosen` node. Currently, this feature reuses the
+static memory allocation device tree configuration.
+
+The dtb property should look like as follows:
+
+- property name
+
+    "xen,static-mem" (Should be used in the `chosen` node)
+
+- cells
+
+    Specify the start address and the length of the reserved heap memory.
+    The number of cells for the address and the size should be defined
+    using the properties `#xen,static-mem-address-cells` and
+    `#xen,static-mem-size-cells` respectively.
+
+Below is an example on how to specify the reserved heap in device tree:
+
+    / {
+        chosen {
+            #xen,static-mem-address-cells = <0x2>;
+            #xen,static-mem-size-cells = <0x2>;
+            xen,static-mem = <0x0 0x30000000 0x0 0x40000000>;
+        };
+    };
+
+RAM at 0x30000000 of 1G size will be reserved as heap.
+
diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index ec81a45de9..33704ca487 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -64,7 +64,8 @@ void __init device_tree_get_reg(const __be32 **cell, u32 address_cells,
 static int __init device_tree_get_meminfo(const void *fdt, int node,
                                           const char *prop_name,
                                           u32 address_cells, u32 size_cells,
-                                          void *data, bool xen_domain)
+                                          void *data, bool xen_domain,
+                                          bool xen_heap)
 {
     const struct fdt_property *prop;
     unsigned int i, banks;
@@ -96,6 +97,7 @@ static int __init device_tree_get_meminfo(const void *fdt, int node,
         mem->bank[mem->nr_banks].start = start;
         mem->bank[mem->nr_banks].size = size;
         mem->bank[mem->nr_banks].xen_domain = xen_domain;
+        mem->bank[mem->nr_banks].xen_heap = xen_heap;
         mem->nr_banks++;
     }
 
@@ -185,7 +187,7 @@ static int __init process_memory_node(const void *fdt, int node,
                                       void *data)
 {
     return device_tree_get_meminfo(fdt, node, "reg", address_cells, size_cells,
-                                   data, false);
+                                   data, false, false);
 }
 
 static int __init process_reserved_memory_node(const void *fdt, int node,
@@ -293,7 +295,7 @@ static void __init process_multiboot_node(const void *fdt, int node,
                      kind, start, domU);
 }
 
-static void __init process_chosen_node(const void *fdt, int node,
+static int __init process_chosen_node(const void *fdt, int node,
                                        const char *name,
                                        u32 address_cells, u32 size_cells)
 {
@@ -301,16 +303,40 @@ static void __init process_chosen_node(const void *fdt, int node,
     paddr_t start, end;
     int len;
 
+    if ( fdt_get_property(fdt, node, "xen,static-mem", NULL) )
+    {
+        u32 address_cells = device_tree_get_u32(fdt, node,
+                                                "#xen,static-mem-address-cells",
+                                                0);
+        u32 size_cells = device_tree_get_u32(fdt, node,
+                                             "#xen,static-mem-size-cells", 0);
+        int rc;
+
+        printk("Checking for reserved heap in /chosen\n");
+        if ( address_cells < 1 || size_cells < 1 )
+        {
+            printk("fdt: node `%s': invalid #xen,static-mem-address-cells or #xen,static-mem-size-cells\n",
+                   name);
+            return -EINVAL;
+        }
+
+        rc = device_tree_get_meminfo(fdt, node, "xen,static-mem", address_cells,
+                                     size_cells, &bootinfo.reserved_mem, false,
+                                     true);
+        if ( rc )
+            return rc;
+    }
+
     printk("Checking for initrd in /chosen\n");
 
     prop = fdt_get_property(fdt, node, "linux,initrd-start", &len);
     if ( !prop )
         /* No initrd present. */
-        return;
+        return 0;
     if ( len != sizeof(u32) && len != sizeof(u64) )
     {
         printk("linux,initrd-start property has invalid length %d\n", len);
-        return;
+        return -EINVAL;
     }
     start = dt_read_number((void *)&prop->data, dt_size_to_cells(len));
 
@@ -318,12 +344,12 @@ static void __init process_chosen_node(const void *fdt, int node,
     if ( !prop )
     {
         printk("linux,initrd-end not present but -start was\n");
-        return;
+        return -EINVAL;
     }
     if ( len != sizeof(u32) && len != sizeof(u64) )
     {
         printk("linux,initrd-end property has invalid length %d\n", len);
-        return;
+        return -EINVAL;
     }
     end = dt_read_number((void *)&prop->data, dt_size_to_cells(len));
 
@@ -331,12 +357,14 @@ static void __init process_chosen_node(const void *fdt, int node,
     {
         printk("linux,initrd limits invalid: %"PRIpaddr" >= %"PRIpaddr"\n",
                   start, end);
-        return;
+        return -EINVAL;
     }
 
     printk("Initrd %"PRIpaddr"-%"PRIpaddr"\n", start, end);
 
     add_boot_module(BOOTMOD_RAMDISK, start, end-start, false);
+
+    return 0;
 }
 
 static int __init process_domain_node(const void *fdt, int node,
@@ -358,7 +386,8 @@ static int __init process_domain_node(const void *fdt, int node,
                                      "#xen,static-mem-size-cells", 0);
 
     return device_tree_get_meminfo(fdt, node, "xen,static-mem", address_cells,
-                                   size_cells, &bootinfo.reserved_mem, true);
+                                   size_cells, &bootinfo.reserved_mem, true,
+                                   false);
 }
 
 static int __init early_scan_node(const void *fdt,
@@ -383,7 +412,7 @@ static int __init early_scan_node(const void *fdt,
               device_tree_node_compatible(fdt, node, "multiboot,module" )))
         process_multiboot_node(fdt, node, name, address_cells, size_cells);
     else if ( depth == 1 && device_tree_node_matches(fdt, node, "chosen") )
-        process_chosen_node(fdt, node, name, address_cells, size_cells);
+        rc = process_chosen_node(fdt, node, name, address_cells, size_cells);
     else if ( depth == 2 && device_tree_node_compatible(fdt, node, "xen,domain") )
         rc = process_domain_node(fdt, node, name, address_cells, size_cells);
 
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 3fd1186b53..6f97f5f06a 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1038,8 +1038,9 @@ static int __init make_memory_node(const struct domain *d,
     if ( mem->nr_banks == 0 )
         return -ENOENT;
 
-    /* find first memory range not bound to a Xen domain */
-    for ( i = 0; i < mem->nr_banks && mem->bank[i].xen_domain; i++ )
+    /* find first memory range not bound to neither a Xen domain nor heap */
+    for ( i = 0; i < mem->nr_banks &&
+                 (mem->bank[i].xen_domain || mem->bank[i].xen_heap); i++ )
         ;
     if ( i == mem->nr_banks )
         return 0;
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 2bb01ecfa8..e80f3d6201 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -27,6 +27,7 @@ struct membank {
     paddr_t start;
     paddr_t size;
     bool xen_domain; /* whether the memory bank is bound to a Xen domain. */
+    bool xen_heap;   /* whether the memory bank is reserved as heap. */
 };
 
 struct meminfo {
-- 
2.17.1


