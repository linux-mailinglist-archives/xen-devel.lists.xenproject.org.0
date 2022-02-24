Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1C64C20F6
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 02:31:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277853.474707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nN2xq-0006GA-8v; Thu, 24 Feb 2022 01:30:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277853.474707; Thu, 24 Feb 2022 01:30:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nN2xq-0006EJ-4r; Thu, 24 Feb 2022 01:30:38 +0000
Received: by outflank-mailman (input) for mailman id 277853;
 Thu, 24 Feb 2022 01:30:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=85Ek=TH=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1nN2xo-0005yB-F8
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 01:30:36 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 5c91a113-9511-11ec-8eb8-a37418f5ba1a;
 Thu, 24 Feb 2022 02:30:34 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9A671509;
 Wed, 23 Feb 2022 17:30:33 -0800 (PST)
Received: from entos-skylake.shanghai.arm.com (entos-skylake.shanghai.arm.com
 [10.169.212.207])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6798D3F5A1;
 Wed, 23 Feb 2022 17:30:31 -0800 (PST)
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
X-Inumbo-ID: 5c91a113-9511-11ec-8eb8-a37418f5ba1a
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org,
	sstabellini@kernel.org,
	julien@xen.org
Cc: Bertrand.Marquis@arm.com,
	wei.chen@arm.com,
	penny.zheng@arm.com,
	Henry.Wang@arm.com
Subject: [RFC PATCH 1/2] docs, xen/arm: Introduce reserved Xenheap memory
Date: Thu, 24 Feb 2022 01:30:22 +0000
Message-Id: <20220224013023.50920-2-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220224013023.50920-1-Henry.Wang@arm.com>
References: <20220224013023.50920-1-Henry.Wang@arm.com>

This commit introduces the reserved Xenheap memory, which is parts
of RAM reserved in the beginning of the boot time for Xenheap.

A new boolean field `xen_heap` in `struct membank` is added to store
the configuration telling if the memory bank is reserved as Xenheap
through `xen,static-mem` in device tree `chosen` node.

Also, this commit introduces the logic to parse the reserved Xenheap
configuation in device tree by reusing the device tree entry definition
of the static memory allocation feature:

- Add a boolean parameter `xen_heap` to `device_tree_get_meminfo`
to reflect whether the memory bank is reserved as the Xenheap.

- Use `device_tree_get_meminfo` to parse the reserved Xenheap
configuation in `chosen` node of the device tree.

- In order to reuse the function `device_tree_get_meminfo`, the
return type of `process_chosen_node` is changed from void to int.

A documentation section is added, describing the definition of
reserved Xenheap memory and the method of enabling the reserved
Xenheap memory through device tree on AArch64 at boot time.

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
For reviewers:
The name of the device tree property was chosen because we want to
reuse as much as the device tree parsing helpers from the static
memory allocation feature, but we would like to hear the upstream
reviewers' opinion about if using "xen,static-heap" is better,
although this will add another checking path in `early_scan_node`.
---
 docs/misc/arm/device-tree/booting.txt | 43 +++++++++++++++++++++++
 xen/arch/arm/bootfdt.c                | 50 +++++++++++++++++++++------
 xen/arch/arm/include/asm/setup.h      |  1 +
 3 files changed, 84 insertions(+), 10 deletions(-)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index a94125394e..c8c4a90bf4 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -355,3 +355,46 @@ device-tree:
 
 This will reserve a 512MB region starting at the host physical address
 0x30000000 to be exclusively used by DomU1.
+
+
+Reserved Xenheap Memory
+=======================
+
+The reserved Xenheap memory (also known as statically configured Xenheap)
+refers to parts of RAM reserved in the beginning for Xenheap. The memory is
+reserved by configuration in the device tree using physical address ranges.
+
+The definition of reserved Xenheap memory in the device tree indicates:
+
+(1) Only the defined reserved memory areas will be used as Xenheap.
+
+(2) The defined reserved heap areas shall always go to the heap allocator
+and only be used as Xenheap.
+
+The reserved Xenheap memory is an optional feature and can be enabled by
+adding a device tree property in the `chosen` node. Currently, this feature
+is only supported on AArch64 and this feature reuses the static memory
+allocation device tree configuration.
+
+The dtb property should look like as follows:
+
+- property name
+
+    "xen,static-mem" (Should be used in the `chosen` node)
+
+- cells
+
+    Specify the start address and the length of the reserved Xenheap memory.
+    The number of cells for the address and the size should be defined
+    using the properties `#xen,static-mem-address-cells` and
+    `#xen,static-mem-size-cells` respectively.
+
+Below is an example on how to specify the reserved Xenheap in device tree:
+
+        chosen {
+                #xen,static-mem-address-cells = <0x2>;
+                #xen,static-mem-size-cells = <0x2>;
+                xen,static-mem = <0x0 0x30000000 0x0 0x40000000>;
+        };
+
+RAM at 0x30000000 of 1G size will be reserved as Xenheap.
diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index e318ef9603..cc360cfd07 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -66,7 +66,8 @@ void __init device_tree_get_reg(const __be32 **cell, u32 address_cells,
 static int __init device_tree_get_meminfo(const void *fdt, int node,
                                           const char *prop_name,
                                           u32 address_cells, u32 size_cells,
-                                          void *data, bool xen_domain)
+                                          void *data, bool xen_domain,
+                                          bool xen_heap)
 {
     const struct fdt_property *prop;
     unsigned int i, banks;
@@ -98,6 +99,7 @@ static int __init device_tree_get_meminfo(const void *fdt, int node,
         mem->bank[mem->nr_banks].start = start;
         mem->bank[mem->nr_banks].size = size;
         mem->bank[mem->nr_banks].xen_domain = xen_domain;
+        mem->bank[mem->nr_banks].xen_heap = xen_heap;
         mem->nr_banks++;
     }
 
@@ -187,7 +189,7 @@ static int __init process_memory_node(const void *fdt, int node,
                                       void *data)
 {
     return device_tree_get_meminfo(fdt, node, "reg", address_cells, size_cells,
-                                   data, false);
+                                   data, false, false);
 }
 
 static int __init process_reserved_memory_node(const void *fdt, int node,
@@ -295,7 +297,7 @@ static void __init process_multiboot_node(const void *fdt, int node,
                      kind, start, domU);
 }
 
-static void __init process_chosen_node(const void *fdt, int node,
+static int __init process_chosen_node(const void *fdt, int node,
                                        const char *name,
                                        u32 address_cells, u32 size_cells)
 {
@@ -303,16 +305,41 @@ static void __init process_chosen_node(const void *fdt, int node,
     paddr_t start, end;
     int len;
 
+    printk("Checking for reserved Xenheap in /chosen\n");
+
+    if ( fdt_get_property(fdt, node, "xen,static-mem", NULL) )
+    {
+        u32 address_cells = device_tree_get_u32(fdt, node,
+                                                "#xen,static-mem-address-cells",
+                                                0);
+        u32 size_cells = device_tree_get_u32(fdt, node,
+                                             "#xen,static-mem-size-cells", 0);
+        int rc;
+
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
 
@@ -320,12 +347,12 @@ static void __init process_chosen_node(const void *fdt, int node,
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
 
@@ -333,12 +360,14 @@ static void __init process_chosen_node(const void *fdt, int node,
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
@@ -360,7 +389,8 @@ static int __init process_domain_node(const void *fdt, int node,
                                      "#xen,static-mem-size-cells", 0);
 
     return device_tree_get_meminfo(fdt, node, "xen,static-mem", address_cells,
-                                   size_cells, &bootinfo.reserved_mem, true);
+                                   size_cells, &bootinfo.reserved_mem, true,
+                                   false);
 }
 
 static int __init early_scan_node(const void *fdt,
@@ -380,7 +410,7 @@ static int __init early_scan_node(const void *fdt,
               device_tree_node_compatible(fdt, node, "multiboot,module" )))
         process_multiboot_node(fdt, node, name, address_cells, size_cells);
     else if ( depth == 1 && device_tree_node_matches(fdt, node, "chosen") )
-        process_chosen_node(fdt, node, name, address_cells, size_cells);
+        rc = process_chosen_node(fdt, node, name, address_cells, size_cells);
     else if ( depth == 2 && device_tree_node_compatible(fdt, node, "xen,domain") )
         rc = process_domain_node(fdt, node, name, address_cells, size_cells);
 
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 7a1e1d6798..188a85c51c 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -27,6 +27,7 @@ struct membank {
     paddr_t start;
     paddr_t size;
     bool xen_domain; /* whether the memory bank is bound to a Xen domain. */
+    bool xen_heap;   /* whether the memory bank is reserved as Xenheap. */
 };
 
 struct meminfo {
-- 
2.17.1


