Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F615B23A6
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 18:33:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403474.645604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWKSe-0002p6-WF; Thu, 08 Sep 2022 16:33:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403474.645604; Thu, 08 Sep 2022 16:33:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWKSe-0002n6-RR; Thu, 08 Sep 2022 16:33:04 +0000
Received: by outflank-mailman (input) for mailman id 403474;
 Thu, 08 Sep 2022 16:33:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fLS5=ZL=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oWKSd-0002V6-NJ
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 16:33:03 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id d0f4d5c1-2f7d-11ed-9760-273f2230c3a0;
 Thu, 08 Sep 2022 15:54:54 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F804106F;
 Thu,  8 Sep 2022 06:55:34 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E6AFF3F7B4;
 Thu,  8 Sep 2022 06:55:24 -0700 (PDT)
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
X-Inumbo-ID: d0f4d5c1-2f7d-11ed-9760-273f2230c3a0
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v8 1/9] xen/arm: introduce static shared memory
Date: Thu,  8 Sep 2022 21:55:05 +0800
Message-Id: <20220908135513.1800511-2-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220908135513.1800511-1-Penny.Zheng@arm.com>
References: <20220908135513.1800511-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series introduces a new feature: setting up static
shared memory on a dom0less system, through device tree configuration.

This commit parses shared memory node at boot-time, and reserve it in
bootinfo.reserved_mem to avoid other use.

This commits proposes a new Kconfig CONFIG_STATIC_SHM to wrap
static-shm-related codes, and this option depends on static memory(
CONFIG_STATIC_MEMORY). That's because that later we want to reuse a few
helpers, guarded with CONFIG_STATIC_MEMORY, like acquire_staticmem_pages, etc,
on static shared memory.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v8 changes:
- return errno immediately when overflow checks meet
- remove pointless WARN()
---
v7 changes:
- add docs about checking for region overlap, etc
- update docs to reflect that the host physical address is optional
- end/bank_end may end up to be lower than paddr/mem->bank[i].start, So check
that they don't overflow.
- replace strcmp with strncmp since the string has already be validated
- provide a dummy helper for process_shm_node() when !CONFIG_STATIC_SHM
- remove useless #ifdef CONFIG_STATIC_SHM
- change the order of property xen,shared-mem to
xen,shared-mem = < [host physical address] [guest address] [size] >
---
v6 change:
- when host physical address is ommited, output the error message since
xen doesn't support it at the moment
- add the following check: 1) The shm ID matches and the region exactly match
2) The shm ID doesn't match and the region doesn't overlap
- change it to "unsigned int" to be aligned with nr_banks
- check the len of the property to confirm is it big enough to
contain "paddr", "size", and "gaddr"
- shm_id defined before nr_shm_domain, so we could re-use the existing hole and
avoid increasing the size of the structure.
- change "nr_shm_domain" to "nr_shm_borrowers", to not increment if the role
is owner in parsing code
- make "xen,shm_id" property as arbitrary string, with a strict limit on
the number of characters, MAX_SHM_ID_LENGTH
---
v5 change:
- no change
---
v4 change:
- nit fix on doc
---
v3 change:
- make nr_shm_domain unsigned int
---
v2 change:
- document refinement
- remove bitmap and use the iteration to check
- add a new field nr_shm_domain to keep the number of shared domain
---
 docs/misc/arm/device-tree/booting.txt | 132 ++++++++++++++++++++
 xen/arch/arm/Kconfig                  |   6 +
 xen/arch/arm/bootfdt.c                | 167 ++++++++++++++++++++++++++
 xen/arch/arm/include/asm/setup.h      |   7 ++
 4 files changed, 312 insertions(+)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 5ba7d186aa..0acd42f1a8 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -426,3 +426,135 @@ Below is an example on how to specify the static heap in device tree:
 
 RAM starting from the host physical address 0x30000000 of 1GB size will
 be reserved as static heap.
+
+Static Shared Memory
+====================
+
+The static shared memory device tree nodes allow users to statically set up
+shared memory on dom0less system, enabling domains to do shm-based
+communication.
+
+- compatible
+
+    "xen,domain-shared-memory-v1"
+
+- xen,shm-id
+
+    An arbitrary string that represents the unique identifier of the shared
+    memory region, with a strict limit on the number of characters(\0 included),
+    `MAX_SHM_ID_LENGTH(16)`. e.g. "xen,shm-id = "my-shared-mem-1"".
+
+- xen,shared-mem
+
+    An array takes a physical address, which is the base address of the
+    shared memory region in host physical address space, a size, and a guest
+    physical address, as the target address of the mapping.
+    e.g. xen,shared-mem = < [host physical address] [guest address] [size] >
+
+    It shall also meet the following criteria:
+    1) If the SHM ID matches with an existing region, the address range of the
+    region shall also exactly match.
+    2) If the SHM ID does not match with any other existing region, it should
+    also not overlap with any other regions.
+
+    The number of cells for the host address (and size) is the same as the
+    guest pseudo-physical address and they are inherited from the parent node.
+
+    Host physical address is optional, when missing Xen decides the location
+    (currently unimplemented).
+
+- role (Optional)
+
+    A string property specifying the ownership of a shared memory region,
+    the value must be one of the following: "owner", or "borrower"
+    A shared memory region could be explicitly backed by one domain, which is
+    called "owner domain", and all the other domains who are also sharing
+    this region are called "borrower domain".
+    If not specified, the default value is "borrower" and owner is
+    DOMID_IO, a system domain.
+
+As an example:
+
+chosen {
+    #address-cells = <0x1>;
+    #size-cells = <0x1>;
+    xen,xen-bootargs = "console=dtuart dtuart=serial0 bootscrub=0";
+
+    ......
+
+    /* this is for Dom0 */
+    dom0-shared-mem@10000000 {
+        compatible = "xen,domain-shared-memory-v1";
+        role = "owner";
+        xen,shm-id = "my-shared-mem-0";
+        xen,shared-mem = <0x10000000 0x10000000 0x10000000>;
+    }
+
+    domU1 {
+        compatible = "xen,domain";
+        #address-cells = <0x1>;
+        #size-cells = <0x1>;
+        memory = <0 131072>;
+        cpus = <2>;
+        vpl011;
+
+        /*
+         * shared memory region identified as 0x0(xen,shm-id = <0x0>)
+         * is shared between Dom0 and DomU1.
+         */
+        domU1-shared-mem@10000000 {
+            compatible = "xen,domain-shared-memory-v1";
+            role = "borrower";
+            xen,shm-id = "my-shared-mem-0";
+            xen,shared-mem = <0x10000000 0x50000000 0x10000000>;
+        }
+
+        /*
+         * shared memory region identified as 0x1(xen,shm-id = <0x1>)
+         * is shared between DomU1 and DomU2.
+         */
+        domU1-shared-mem@50000000 {
+            compatible = "xen,domain-shared-memory-v1";
+            xen,shm-id = "my-shared-mem-1";
+            xen,shared-mem = <0x50000000 0x60000000 0x20000000>;
+        }
+
+        ......
+
+    };
+
+    domU2 {
+        compatible = "xen,domain";
+        #address-cells = <0x1>;
+        #size-cells = <0x1>;
+        memory = <0 65536>;
+        cpus = <1>;
+
+        /*
+         * shared memory region identified as 0x1(xen,shm-id = <0x1>)
+         * is shared between domU1 and domU2.
+         */
+        domU2-shared-mem@50000000 {
+            compatible = "xen,domain-shared-memory-v1";
+            xen,shm-id = "my-shared-mem-1";
+            xen,shared-mem = <0x50000000 0x70000000 0x20000000>;
+        }
+
+        ......
+    };
+};
+
+This is an example with two static shared memory regions.
+
+For the static shared memory region identified as "my-shared-mem-0", host
+physical address starting at 0x10000000 of 256MB will be reserved to be
+shared between Dom0 and DomU1. It will get mapped at 0x10000000 in Dom0 guest
+physical address space, and at 0x50000000 in DomU1 guest physical address space.
+Dom0 is explicitly defined as the owner domain, and DomU1 is the borrower domain.
+
+For the static shared memory region identified as "my-shared-mem-1", host
+physical address starting at 0x50000000 of 512MB will be reserved to be
+shared between DomU1 and DomU2. It will get mapped at 0x60000000 in DomU1 guest
+physical address space, and at 0x70000000 in DomU2 guest physical address space.
+DomU1 and DomU2 are both the borrower domain, the owner domain is the default
+owner domain DOMID_IO.
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 33e004d702..1fe5faf847 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -140,6 +140,12 @@ config TEE
 
 source "arch/arm/tee/Kconfig"
 
+config STATIC_SHM
+	bool "Statically shared memory on a dom0less system" if UNSUPPORTED
+	depends on STATIC_MEMORY
+	help
+	  This option enables statically shared memory on a dom0less system.
+
 endmenu
 
 menu "ARM errata workaround via the alternative framework"
diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index 787c7b41be..882a99f22e 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -13,6 +13,7 @@
 #include <xen/init.h>
 #include <xen/efi.h>
 #include <xen/device_tree.h>
+#include <xen/lib.h>
 #include <xen/libfdt/libfdt.h>
 #include <xen/sort.h>
 #include <xsm/xsm.h>
@@ -390,6 +391,170 @@ static int __init process_domain_node(const void *fdt, int node,
                                    MEMBANK_STATIC_DOMAIN);
 }
 
+#ifdef CONFIG_STATIC_SHM
+static int __init process_shm_node(const void *fdt, int node,
+                                   uint32_t address_cells, uint32_t size_cells)
+{
+    const struct fdt_property *prop, *prop_id, *prop_role;
+    const __be32 *cell;
+    paddr_t paddr, gaddr, size;
+    struct meminfo *mem = &bootinfo.reserved_mem;
+    unsigned int i;
+    int len;
+    bool owner = false;
+    const char *shm_id;
+
+    if ( address_cells < 1 || size_cells < 1 )
+    {
+        printk("fdt: invalid #address-cells or #size-cells for static shared memory node.\n");
+        return -EINVAL;
+    }
+
+    /*
+     * "xen,shm-id" property holds an arbitrary string with a strict limit
+     * on the number of characters, MAX_SHM_ID_LENGTH
+     */
+    prop_id = fdt_get_property(fdt, node, "xen,shm-id", NULL);
+    if ( !prop_id )
+        return -ENOENT;
+    shm_id = (const char *)prop_id->data;
+    if ( strnlen(shm_id, MAX_SHM_ID_LENGTH) == MAX_SHM_ID_LENGTH )
+    {
+        printk("fdt: invalid xen,shm-id %s, it must be limited to %u characters\n",
+               shm_id, MAX_SHM_ID_LENGTH);
+        return -EINVAL;
+    }
+
+    /*
+     * "role" property is optional and if it is defined explicitly,
+     * it must be either `owner` or `borrower`.
+     */
+    prop_role = fdt_get_property(fdt, node, "role", NULL);
+    if ( prop_role )
+    {
+        if ( !strcmp(prop_role->data, "owner") )
+            owner = true;
+        else if ( strcmp(prop_role->data, "borrower") )
+        {
+            printk("fdt: invalid `role` property for static shared memory node.\n");
+            return -EINVAL;
+        }
+    }
+
+    /*
+     * xen,shared-mem = <paddr, gaddr, size>;
+     * Memory region starting from physical address #paddr of #size shall
+     * be mapped to guest physical address #gaddr as static shared memory
+     * region.
+     */
+    prop = fdt_get_property(fdt, node, "xen,shared-mem", &len);
+    if ( !prop )
+        return -ENOENT;
+
+    if ( len != dt_cells_to_size(address_cells + size_cells + address_cells) )
+    {
+        if ( len == dt_cells_to_size(size_cells + address_cells) )
+            printk("fdt: host physical address must be chosen by users at the moment.\n");
+
+        printk("fdt: invalid `xen,shared-mem` property.\n");
+        return -EINVAL;
+    }
+
+    cell = (const __be32 *)prop->data;
+    device_tree_get_reg(&cell, address_cells, address_cells, &paddr, &gaddr);
+    size = dt_next_cell(size_cells, &cell);
+
+    if ( !size )
+    {
+        printk("fdt: the size for static shared memory region can not be zero\n");
+        return -EINVAL;
+    }
+
+    for ( i = 0; i < mem->nr_banks; i++ )
+    {
+        /*
+         * Meet the following check:
+         * 1) The shm ID matches and the region exactly match
+         * 2) The shm ID doesn't match and the region doesn't overlap
+         * with an existing one
+         */
+        if ( paddr == mem->bank[i].start && size == mem->bank[i].size )
+        {
+            if ( strncmp(shm_id, mem->bank[i].shm_id, MAX_SHM_ID_LENGTH) == 0 )
+                break;
+            else
+            {
+                printk("fdt: xen,shm-id %s does not match for all the nodes using the same region.\n",
+                       shm_id);
+                return -EINVAL;
+            }
+        }
+        else
+        {
+            paddr_t end = paddr + size;
+            paddr_t bank_end = mem->bank[i].start + mem->bank[i].size;
+
+            if ( (end <= paddr) || (bank_end <= mem->bank[i].start) )
+            {
+                printk("fdt: static shared memory region %s overflow\n", shm_id);
+                return -EINVAL;
+            }
+
+            if ( (end <= mem->bank[i].start) || (paddr >= bank_end) )
+            {
+                if ( strcmp(shm_id, mem->bank[i].shm_id) != 0 )
+                    continue;
+                else
+                {
+                    printk("fdt: different shared memory region could not share the same shm ID %s\n",
+                           shm_id);
+                    return -EINVAL;
+                }
+            }
+            else
+            {
+                printk("fdt: shared memory region overlap with an existing entry %#"PRIpaddr" - %#"PRIpaddr"\n",
+                        mem->bank[i].start, bank_end);
+                return -EINVAL;
+            }
+        }
+    }
+
+    if ( i == mem->nr_banks )
+    {
+        if ( i < NR_MEM_BANKS )
+        {
+            /* Static shared memory shall be reserved from any other use. */
+            safe_strcpy(mem->bank[mem->nr_banks].shm_id, shm_id);
+            mem->bank[mem->nr_banks].start = paddr;
+            mem->bank[mem->nr_banks].size = size;
+            mem->bank[mem->nr_banks].type = MEMBANK_STATIC_DOMAIN;
+            mem->nr_banks++;
+        }
+        else
+        {
+            printk("Warning: Max number of supported memory regions reached.\n");
+            return -ENOSPC;
+        }
+    }
+    /*
+     * keep a count of the number of borrowers, which later may be used
+     * to calculate the reference count.
+     */
+    if ( !owner )
+        mem->bank[i].nr_shm_borrowers++;
+
+    return 0;
+}
+#else
+static int __init process_shm_node(const void *fdt, int node,
+                                   uint32_t address_cells, uint32_t size_cells)
+{
+    printk("CONFIG_STATIC_SHM must be enabled for parsing static shared memory nodes\n");
+    return -EINVAL;
+}
+#endif
+
 static int __init early_scan_node(const void *fdt,
                                   int node, const char *name, int depth,
                                   u32 address_cells, u32 size_cells,
@@ -415,6 +580,8 @@ static int __init early_scan_node(const void *fdt,
         rc = process_chosen_node(fdt, node, name, address_cells, size_cells);
     else if ( depth == 2 && device_tree_node_compatible(fdt, node, "xen,domain") )
         rc = process_domain_node(fdt, node, name, address_cells, size_cells);
+    else if ( depth <= 3 && device_tree_node_compatible(fdt, node, "xen,domain-shared-memory-v1") )
+        rc = process_shm_node(fdt, node, address_cells, size_cells);
 
     if ( rc < 0 )
         printk("fdt: node `%s': parsing failed\n", name);
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 9374b92441..74a052fe76 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -43,10 +43,17 @@ enum membank_type {
     MEMBANK_STATIC_HEAP,
 };
 
+/* Indicates the maximum number of characters(\0 included) for shm_id */
+#define MAX_SHM_ID_LENGTH 16
+
 struct membank {
     paddr_t start;
     paddr_t size;
     enum membank_type type;
+#ifdef CONFIG_STATIC_SHM
+    char shm_id[MAX_SHM_ID_LENGTH];
+    unsigned int nr_shm_borrowers;
+#endif
 };
 
 struct meminfo {
-- 
2.25.1


