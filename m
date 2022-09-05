Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8C95ACC14
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 09:27:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.398529.639401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oV6Ve-0001rT-EX; Mon, 05 Sep 2022 07:27:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 398529.639401; Mon, 05 Sep 2022 07:27:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oV6Ve-0001ow-Aj; Mon, 05 Sep 2022 07:27:06 +0000
Received: by outflank-mailman (input) for mailman id 398529;
 Mon, 05 Sep 2022 07:27:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cA+y=ZI=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oV6Vd-0001oQ-6q
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 07:27:05 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 2348637a-2cec-11ed-a016-b9edf5238543;
 Mon, 05 Sep 2022 09:27:03 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43DA0ED1;
 Mon,  5 Sep 2022 00:27:09 -0700 (PDT)
Received: from entos-skylake.shanghai.arm.com (entos-skylake.shanghai.arm.com
 [10.169.212.207])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C40923F73D;
 Mon,  5 Sep 2022 00:27:28 -0700 (PDT)
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
X-Inumbo-ID: 2348637a-2cec-11ed-a016-b9edf5238543
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v2 1/4] docs, xen/arm: Introduce reserved heap memory
Date: Mon,  5 Sep 2022 07:26:32 +0000
Message-Id: <20220905072635.16294-2-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220905072635.16294-1-Henry.Wang@arm.com>
References: <20220905072635.16294-1-Henry.Wang@arm.com>

This commit introduces the reserved heap memory, which is parts of RAM
reserved in the beginning of the boot time for heap.

Firstly, since a new type of memory bank is needed for marking the
memory bank solely as the heap, this commit defines `enum membank_type`
and use this enum in function device_tree_get_meminfo(). Changes of
code are done accordingly following the introduction of this enum.

Also, this commit introduces the logic to parse the reserved heap
configuration in device tree by reusing the device tree entry definition
of the static memory allocation feature. If the memory bank is reserved
as heap through `xen,static-heap` property in device tree `chosen` node,
the memory will be marked as heap type.

A documentation section is added, describing the definition of reserved
heap memory and the method of enabling the reserved heap memory through
device tree at boot time.

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
Changes from v1 to v2:
- Rename the device tree property to xen,static-heap to avoid confusion.
- Change of commit msg and doc wording, correct typo in commit msg.
- Do not change the process_chosen_node() return type.
- Add an empty line in make_memory_node() memory type check to improve
  readability.
- Use enum membank_type to make the memory type cleaner.
Changes from RFC to v1:
- Rename the terminology to reserved heap.
---
 docs/misc/arm/device-tree/booting.txt | 45 +++++++++++++++++++++++++++
 xen/arch/arm/bootfdt.c                | 31 +++++++++++++++---
 xen/arch/arm/domain_build.c           |  8 +++--
 xen/arch/arm/include/asm/setup.h      |  7 ++++-
 xen/arch/arm/setup.c                  |  2 +-
 5 files changed, 84 insertions(+), 9 deletions(-)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 98253414b8..ff7ca36715 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -378,3 +378,48 @@ device-tree:
 
 This will reserve a 512MB region starting at the host physical address
 0x30000000 to be exclusively used by DomU1.
+
+
+Reserved Heap Memory
+====================
+
+The reserved heap memory (also known as the statically-configured heap) refers
+to parts of RAM reserved in the beginning of boot time for heap. The memory is
+reserved by configuration in the device tree using physical address ranges.
+
+The reserved heap memory declared in the device tree defines the memory areas
+that will be reserved to be used exclusively as heap.
+
+- For Arm32, since there are seperated heaps, the reserved heap will be used
+for both domheap and xenheap.
+- For Arm64, since there is a single heap, the defined reserved heap areas
+shall always go to the heap allocator.
+
+The reserved heap memory is an optional feature and can be enabled by adding
+below device tree properties in the `chosen` node.
+
+The dtb should have the following properties:
+
+- xen,static-heap
+
+    Property under the top-level "chosen" node. It specifies the address
+    and size of Xen reserved heap memory.
+
+- #xen,static-heap-address-cells and #xen,static-heap-size-cells
+
+    Specify the number of cells used for the address and size of the
+    "xen,static-heap" property under "chosen".
+
+Below is an example on how to specify the reserved heap in device tree:
+
+    / {
+        chosen {
+            #xen,static-heap-address-cells = <0x2>;
+            #xen,static-heap-size-cells = <0x2>;
+            xen,static-heap = <0x0 0x30000000 0x0 0x40000000>;
+            ...
+        };
+    };
+
+RAM starting from the host physical address 0x30000000 of 1GB size will
+be reserved as heap.
diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index ec81a45de9..5af71dc8ba 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -64,7 +64,7 @@ void __init device_tree_get_reg(const __be32 **cell, u32 address_cells,
 static int __init device_tree_get_meminfo(const void *fdt, int node,
                                           const char *prop_name,
                                           u32 address_cells, u32 size_cells,
-                                          void *data, bool xen_domain)
+                                          void *data, membank_type type)
 {
     const struct fdt_property *prop;
     unsigned int i, banks;
@@ -95,7 +95,7 @@ static int __init device_tree_get_meminfo(const void *fdt, int node,
             continue;
         mem->bank[mem->nr_banks].start = start;
         mem->bank[mem->nr_banks].size = size;
-        mem->bank[mem->nr_banks].xen_domain = xen_domain;
+        mem->bank[mem->nr_banks].type = type;
         mem->nr_banks++;
     }
 
@@ -185,7 +185,7 @@ static int __init process_memory_node(const void *fdt, int node,
                                       void *data)
 {
     return device_tree_get_meminfo(fdt, node, "reg", address_cells, size_cells,
-                                   data, false);
+                                   data, MEMBANK_MEMORY);
 }
 
 static int __init process_reserved_memory_node(const void *fdt, int node,
@@ -301,6 +301,28 @@ static void __init process_chosen_node(const void *fdt, int node,
     paddr_t start, end;
     int len;
 
+    if ( fdt_get_property(fdt, node, "xen,static-heap", NULL) )
+    {
+        u32 address_cells = device_tree_get_u32(fdt, node,
+                                "#xen,static-heap-address-cells", 0);
+        u32 size_cells = device_tree_get_u32(fdt, node,
+                                             "#xen,static-heap-size-cells", 0);
+
+        printk("Checking for reserved heap in /chosen\n");
+        if ( address_cells < 1 || size_cells < 1 )
+        {
+            printk("fdt: node `%s': invalid #xen,static-heap-address-cells or #xen,static-heap-size-cells\n",
+                   name);
+            return;
+        }
+
+        if ( device_tree_get_meminfo(fdt, node, "xen,static-heap",
+                                     address_cells, size_cells,
+                                     &bootinfo.reserved_mem,
+                                     MEMBANK_RSVD_HEAP) )
+            return;
+    }
+
     printk("Checking for initrd in /chosen\n");
 
     prop = fdt_get_property(fdt, node, "linux,initrd-start", &len);
@@ -358,7 +380,8 @@ static int __init process_domain_node(const void *fdt, int node,
                                      "#xen,static-mem-size-cells", 0);
 
     return device_tree_get_meminfo(fdt, node, "xen,static-mem", address_cells,
-                                   size_cells, &bootinfo.reserved_mem, true);
+                                   size_cells, &bootinfo.reserved_mem,
+                                   MEMBANK_XEN_DOMAIN);
 }
 
 static int __init early_scan_node(const void *fdt,
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 3fd1186b53..1e46b95f0b 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1038,9 +1038,11 @@ static int __init make_memory_node(const struct domain *d,
     if ( mem->nr_banks == 0 )
         return -ENOENT;
 
-    /* find first memory range not bound to a Xen domain */
-    for ( i = 0; i < mem->nr_banks && mem->bank[i].xen_domain; i++ )
+    /* find first memory range not bound to a Xen domain nor heap */
+    for ( i = 0; i < mem->nr_banks &&
+                 (mem->bank[i].type != MEMBANK_MEMORY); i++ )
         ;
+
     if ( i == mem->nr_banks )
         return 0;
 
@@ -1062,7 +1064,7 @@ static int __init make_memory_node(const struct domain *d,
         u64 start = mem->bank[i].start;
         u64 size = mem->bank[i].size;
 
-        if ( mem->bank[i].xen_domain )
+        if ( mem->bank[i].type == MEMBANK_XEN_DOMAIN )
             continue;
 
         dt_dprintk("  Bank %d: %#"PRIx64"->%#"PRIx64"\n",
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 5815ccf8c5..d0cc556833 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -22,11 +22,16 @@ typedef enum {
     BOOTMOD_UNKNOWN
 }  bootmodule_kind;
 
+typedef enum {
+    MEMBANK_MEMORY,
+    MEMBANK_XEN_DOMAIN, /* whether the memory bank is bound to a Xen domain. */
+    MEMBANK_RSVD_HEAP, /* whether the memory bank is reserved as heap. */
+} membank_type;
 
 struct membank {
     paddr_t start;
     paddr_t size;
-    bool xen_domain; /* whether the memory bank is bound to a Xen domain. */
+    membank_type type;
 };
 
 struct meminfo {
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 6e0398f3f6..8d3f859982 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -644,7 +644,7 @@ static void __init init_staticmem_pages(void)
 
     for ( bank = 0 ; bank < bootinfo.reserved_mem.nr_banks; bank++ )
     {
-        if ( bootinfo.reserved_mem.bank[bank].xen_domain )
+        if ( bootinfo.reserved_mem.bank[bank].type == MEMBANK_XEN_DOMAIN )
         {
             mfn_t bank_start = _mfn(PFN_UP(bootinfo.reserved_mem.bank[bank].start));
             unsigned long bank_pages = PFN_DOWN(bootinfo.reserved_mem.bank[bank].size);
-- 
2.17.1


