Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 828608013D3
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 21:01:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645683.1007939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r99gf-0001Au-OL; Fri, 01 Dec 2023 20:00:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645683.1007939; Fri, 01 Dec 2023 20:00:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r99gf-00018c-LM; Fri, 01 Dec 2023 20:00:33 +0000
Received: by outflank-mailman (input) for mailman id 645683;
 Fri, 01 Dec 2023 20:00:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dz9Y=HM=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1r99gd-0000tE-Lk
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 20:00:31 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45c4292a-9084-11ee-98e5-6d05b1d4d9a1;
 Fri, 01 Dec 2023 21:00:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 51AB982855D4;
 Fri,  1 Dec 2023 14:00:27 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id i9hgK0MiGiwf; Fri,  1 Dec 2023 14:00:25 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 021E982853A9;
 Fri,  1 Dec 2023 14:00:25 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id QnmuEvKhB_0U; Fri,  1 Dec 2023 14:00:24 -0600 (CST)
Received: from raptor-ewks-026.2lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 481C28285518;
 Fri,  1 Dec 2023 14:00:24 -0600 (CST)
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
X-Inumbo-ID: 45c4292a-9084-11ee-98e5-6d05b1d4d9a1
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 021E982853A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1701460825; bh=rrS98yFoCir+fVp7z2VJPB9bRNWgZ1ymV3ZhVtsKbi8=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=ZzTyiQNZY3UFihuh5Jxyk+elo/hdIyHYOrwBbcA1YgSCtJpOlld9jeR/HfuHzz79E
	 y6s4E4SFIBbIusgJeLUhofUgUL0ofyGXdArEbpnDVx23nXvTRJrljtaRg4WClYPWNV
	 QDxKf/jfVy0iQ0Ic3cac7x/4NdBzhJfbuLEK3cas=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 1/3] xen/ppc: Enable Boot Allocator
Date: Fri,  1 Dec 2023 13:59:54 -0600
Message-Id: <5ed3351f7824a5d0a1ff29c17cb55b2608f28109.1701384928.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1701384928.git.sanastasio@raptorengineering.com>
References: <cover.1701384928.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Adapt arm's earlyfdt parsing code to ppc64 and enable Xen's early boot
allocator. Routines for parsing arm-specific devicetree nodes (e.g.
multiboot) were excluded, reducing the overall footprint of code that
was copied.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/arch/ppc/Makefile            |   1 +
 xen/arch/ppc/bootfdt.c           | 507 +++++++++++++++++++++++++++++++
 xen/arch/ppc/include/asm/setup.h | 113 +++++++
 xen/arch/ppc/setup.c             | 109 ++++++-
 4 files changed, 729 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/ppc/bootfdt.c

diff --git a/xen/arch/ppc/Makefile b/xen/arch/ppc/Makefile
index 71feb5e2c4..8a2a809c70 100644
--- a/xen/arch/ppc/Makefile
+++ b/xen/arch/ppc/Makefile
@@ -1,5 +1,6 @@
 obj-$(CONFIG_PPC64) += ppc64/
 
+obj-y += bootfdt.o
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.init.o
 obj-y += mm-radix.o
 obj-y += opal.o
diff --git a/xen/arch/ppc/bootfdt.c b/xen/arch/ppc/bootfdt.c
new file mode 100644
index 0000000000..791e1ca61f
--- /dev/null
+++ b/xen/arch/ppc/bootfdt.c
@@ -0,0 +1,507 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Early Device Tree and boot info bookkeeping.
+ * Derived from arch/arm/bootfdt.c and setup.c.
+ *
+ * Copyright (C) 2012-2014 Citrix Systems, Inc.
+ * Copyright (C) Raptor Engineering LLC
+ */
+
+#include <xen/types.h>
+#include <xen/lib.h>
+#include <xen/kernel.h>
+#include <xen/init.h>
+#include <xen/efi.h>
+#include <xen/device_tree.h>
+#include <xen/lib.h>
+#include <xen/libfdt/libfdt-xen.h>
+#include <xen/sort.h>
+#include <xsm/xsm.h>
+#include <asm/setup.h>
+
+struct bootinfo __initdata bootinfo;
+
+struct bootmodule __init *add_boot_module(bootmodule_kind kind,
+                                          paddr_t start, paddr_t size,
+                                          bool domU)
+{
+    struct bootmodules *mods = &bootinfo.modules;
+    struct bootmodule *mod;
+    unsigned int i;
+
+    if ( mods->nr_mods == MAX_MODULES )
+    {
+        printk("Ignoring %s boot module at %"PRIpaddr"-%"PRIpaddr" (too many)\n",
+               boot_module_kind_as_string(kind), start, start + size);
+        return NULL;
+    }
+
+    if ( check_reserved_regions_overlap(start, size) )
+        return NULL;
+
+    for ( i = 0 ; i < mods->nr_mods ; i++ )
+    {
+        mod = &mods->module[i];
+        if ( mod->kind == kind && mod->start == start )
+        {
+            if ( !domU )
+                mod->domU = false;
+            return mod;
+        }
+    }
+
+    mod = &mods->module[mods->nr_mods++];
+    mod->kind = kind;
+    mod->start = start;
+    mod->size = size;
+    mod->domU = domU;
+
+    return mod;
+}
+
+const char * __init boot_module_kind_as_string(bootmodule_kind kind)
+{
+    switch ( kind )
+    {
+    case BOOTMOD_XEN:     return "Xen";
+    case BOOTMOD_FDT:     return "Device Tree";
+    case BOOTMOD_KERNEL:  return "Kernel";
+    default: BUG();
+    }
+}
+
+/*
+ * TODO: '*_end' could be 0 if the module/region is at the end of the physical
+ * address space. This is for now not handled as it requires more rework.
+ */
+static bool __init bootmodules_overlap_check(struct bootmodules *bootmodules,
+                                             paddr_t region_start,
+                                             paddr_t region_size)
+{
+    paddr_t mod_start = INVALID_PADDR, mod_end = 0;
+    paddr_t region_end = region_start + region_size;
+    unsigned int i, mod_num = bootmodules->nr_mods;
+
+    for ( i = 0; i < mod_num; i++ )
+    {
+        mod_start = bootmodules->module[i].start;
+        mod_end = mod_start + bootmodules->module[i].size;
+
+        if ( region_end <= mod_start || region_start >= mod_end )
+            continue;
+        else
+        {
+            printk("Region: [%#"PRIpaddr", %#"PRIpaddr") overlapping with"
+                   " mod[%u]: [%#"PRIpaddr", %#"PRIpaddr")\n", region_start,
+                   region_end, i, mod_start, mod_end);
+            return true;
+        }
+    }
+
+    return false;
+}
+
+/*
+ * TODO: '*_end' could be 0 if the bank/region is at the end of the physical
+ * address space. This is for now not handled as it requires more rework.
+ */
+static bool __init meminfo_overlap_check(struct meminfo *meminfo,
+                                         paddr_t region_start,
+                                         paddr_t region_size)
+{
+    paddr_t bank_start = INVALID_PADDR, bank_end = 0;
+    paddr_t region_end = region_start + region_size;
+    unsigned int i, bank_num = meminfo->nr_banks;
+
+    for ( i = 0; i < bank_num; i++ )
+    {
+        bank_start = meminfo->bank[i].start;
+        bank_end = bank_start + meminfo->bank[i].size;
+
+        if ( region_end <= bank_start || region_start >= bank_end )
+            continue;
+        else
+        {
+            printk("Region: [%#"PRIpaddr", %#"PRIpaddr") overlapping with"
+                   " bank[%u]: [%#"PRIpaddr", %#"PRIpaddr")\n", region_start,
+                   region_end, i, bank_start, bank_end);
+            return true;
+        }
+    }
+
+    return false;
+}
+
+/*
+ * Given an input physical address range, check if this range is overlapping
+ * with the existing reserved memory regions defined in bootinfo.
+ * Return true if the input physical address range is overlapping with any
+ * existing reserved memory regions, otherwise false.
+ */
+bool __init check_reserved_regions_overlap(paddr_t region_start,
+                                           paddr_t region_size)
+{
+    /* Check if input region is overlapping with bootinfo.reserved_mem banks */
+    if ( meminfo_overlap_check(&bootinfo.reserved_mem,
+                               region_start, region_size) )
+        return true;
+
+    /* Check if input region is overlapping with bootmodules */
+    if ( bootmodules_overlap_check(&bootinfo.modules,
+                                   region_start, region_size) )
+        return true;
+
+    return false;
+}
+
+static bool __init device_tree_node_matches(const void *fdt, int node,
+                                            const char *match)
+{
+    const char *name;
+    size_t match_len;
+
+    name = fdt_get_name(fdt, node, NULL);
+    match_len = strlen(match);
+
+    /*
+     * Match both "match" and "match@..." patterns but not
+     * "match-foo".
+     */
+    return strncmp(name, match, match_len) == 0
+        && (name[match_len] == '@' || name[match_len] == '\0');
+}
+
+void __init device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
+                                uint32_t size_cells, paddr_t *start,
+                                paddr_t *size)
+{
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
+        printk("Physical address greater than max width supported\n");
+        WARN();
+    }
+
+    if ( dt_size != (paddr_t)dt_size )
+    {
+        printk("Physical size greater than max width supported\n");
+        WARN();
+    }
+
+    /*
+     * Xen will truncate the address/size if it is greater than the maximum
+     * supported width and it will give an appropriate warning.
+     */
+    *start = dt_start;
+    *size = dt_size;
+}
+
+static int __init device_tree_get_meminfo(const void *fdt, int node,
+                                          const char *prop_name,
+                                          uint32_t address_cells, uint32_t size_cells,
+                                          void *data, enum membank_type type)
+{
+    const struct fdt_property *prop;
+    unsigned int i, banks;
+    const __be32 *cell;
+    uint32_t reg_cells = address_cells + size_cells;
+    paddr_t start, size;
+    struct meminfo *mem = data;
+
+    if ( address_cells < 1 || size_cells < 1 )
+    {
+        printk("fdt: property `%s': invalid #address-cells or #size-cells",
+               prop_name);
+        return -EINVAL;
+    }
+
+    prop = fdt_get_property(fdt, node, prop_name, NULL);
+    if ( !prop )
+        return -ENOENT;
+
+    cell = (const __be32 *)prop->data;
+    banks = fdt32_to_cpu(prop->len) / (reg_cells * sizeof(uint32_t));
+
+    for ( i = 0; i < banks && mem->nr_banks < NR_MEM_BANKS; i++ )
+    {
+        device_tree_get_reg(&cell, address_cells, size_cells, &start, &size);
+        if ( mem == &bootinfo.reserved_mem &&
+             check_reserved_regions_overlap(start, size) )
+            return -EINVAL;
+        /* Some DT may describe empty bank, ignore them */
+        if ( !size )
+            continue;
+        mem->bank[mem->nr_banks].start = start;
+        mem->bank[mem->nr_banks].size = size;
+        mem->bank[mem->nr_banks].type = type;
+        mem->nr_banks++;
+    }
+
+    if ( i < banks )
+    {
+        printk("Warning: Max number of supported memory regions reached.\n");
+        return -ENOSPC;
+    }
+
+    return 0;
+}
+
+uint32_t __init device_tree_get_uint32_t(const void *fdt, int node,
+                               const char *prop_name, uint32_t dflt)
+{
+    const struct fdt_property *prop;
+
+    prop = fdt_get_property(fdt, node, prop_name, NULL);
+    if ( !prop || prop->len < sizeof(uint32_t) )
+        return dflt;
+
+    return fdt32_to_cpu(*(uint32_t*)prop->data);
+}
+
+/**
+ * device_tree_for_each_node - iterate over all device tree sub-nodes
+ * @fdt: flat device tree.
+ * @node: parent node to start the search from
+ * @func: function to call for each sub-node.
+ * @data: data to pass to @func.
+ *
+ * Any nodes nested at DEVICE_TREE_MAX_DEPTH or deeper are ignored.
+ *
+ * Returns 0 if all nodes were iterated over successfully.  If @func
+ * returns a value different from 0, that value is returned immediately.
+ */
+int __init device_tree_for_each_node(const void *fdt, int node,
+                                     device_tree_node_func func,
+                                     void *data)
+{
+    /*
+     * We only care about relative depth increments, assume depth of
+     * node is 0 for simplicity.
+     */
+    int depth = 0;
+    const int first_node = node;
+    uint32_t address_cells[DEVICE_TREE_MAX_DEPTH];
+    uint32_t size_cells[DEVICE_TREE_MAX_DEPTH];
+    int ret;
+
+    do {
+        const char *name = fdt_get_name(fdt, node, NULL);
+        uint32_t as, ss;
+
+        if ( depth >= DEVICE_TREE_MAX_DEPTH )
+        {
+            printk("Warning: device tree node `%s' is nested too deep\n",
+                   name);
+            continue;
+        }
+
+        as = depth > 0 ? address_cells[depth-1] : DT_ROOT_NODE_ADDR_CELLS_DEFAULT;
+        ss = depth > 0 ? size_cells[depth-1] : DT_ROOT_NODE_SIZE_CELLS_DEFAULT;
+
+        address_cells[depth] = device_tree_get_uint32_t(fdt, node,
+                                                   "#address-cells", as);
+        size_cells[depth] = device_tree_get_uint32_t(fdt, node,
+                                                "#size-cells", ss);
+
+        /* skip the first node */
+        if ( node != first_node )
+        {
+            ret = func(fdt, node, name, depth, as, ss, data);
+            if ( ret != 0 )
+                return ret;
+        }
+
+        node = fdt_next_node(fdt, node, &depth);
+    } while ( node >= 0 && depth > 0 );
+
+    return 0;
+}
+
+static int __init process_memory_node(const void *fdt, int node,
+                                      const char *name, int depth,
+                                      uint32_t address_cells, uint32_t size_cells,
+                                      void *data)
+{
+    return device_tree_get_meminfo(fdt, node, "reg", address_cells, size_cells,
+                                   data, MEMBANK_DEFAULT);
+}
+
+static int __init process_reserved_memory_node(const void *fdt, int node,
+                                               const char *name, int depth,
+                                               uint32_t address_cells,
+                                               uint32_t size_cells,
+                                               void *data)
+{
+    int rc;
+
+    rc = process_memory_node(fdt, node, name, depth, address_cells,
+                                 size_cells, data);
+
+
+    if ( rc == -ENOSPC )
+        panic("Max number of supported reserved-memory regions reached.\n");
+    else if ( rc != -ENOENT )
+        return rc;
+    return 0;
+}
+
+static int __init process_reserved_memory(const void *fdt, int node,
+                                          const char *name, int depth,
+                                          uint32_t address_cells, uint32_t size_cells)
+{
+    return device_tree_for_each_node(fdt, node,
+                                     process_reserved_memory_node,
+                                     &bootinfo.reserved_mem);
+}
+
+static int __init process_chosen_node(const void *fdt, int node,
+                                      const char *name,
+                                      uint32_t address_cells, uint32_t size_cells)
+{
+    const struct fdt_property *prop;
+    paddr_t start, end;
+    int len;
+
+    printk("Checking for initrd in /chosen\n");
+
+    prop = fdt_get_property(fdt, node, "linux,initrd-start", &len);
+    if ( !prop )
+        /* No initrd present. */
+        return 0;
+    if ( len != sizeof(uint32_t) && len != sizeof(uint64_t) )
+    {
+        printk("linux,initrd-start property has invalid length %d\n", len);
+        return -EINVAL;
+    }
+    start = dt_read_paddr((void *)&prop->data, dt_size_to_cells(len));
+
+    prop = fdt_get_property(fdt, node, "linux,initrd-end", &len);
+    if ( !prop )
+    {
+        printk("linux,initrd-end not present but -start was\n");
+        return -EINVAL;
+    }
+    if ( len != sizeof(uint32_t) && len != sizeof(uint64_t) )
+    {
+        printk("linux,initrd-end property has invalid length %d\n", len);
+        return -EINVAL;
+    }
+    end = dt_read_paddr((void *)&prop->data, dt_size_to_cells(len));
+
+    if ( start >= end )
+    {
+        printk("linux,initrd limits invalid: %"PRIpaddr" >= %"PRIpaddr"\n",
+                  start, end);
+        return -EINVAL;
+    }
+
+    printk("Initrd %"PRIpaddr"-%"PRIpaddr"\n", start, end);
+
+    add_boot_module(BOOTMOD_RAMDISK, start, end-start, false);
+
+    return 0;
+}
+
+static int __init early_scan_node(const void *fdt,
+                                  int node, const char *name, int depth,
+                                  uint32_t address_cells, uint32_t size_cells,
+                                  void *data)
+{
+    int rc = 0;
+
+    if( device_tree_node_matches(fdt, node, "memory") )
+        rc = process_memory_node(fdt, node, name, depth,
+                                 address_cells, size_cells, &bootinfo.mem);
+    else if ( depth == 1 && !dt_node_cmp(name, "reserved-memory") )
+        rc = process_reserved_memory(fdt, node, name, depth,
+                                     address_cells, size_cells);
+    else if ( depth == 1 && device_tree_node_matches(fdt, node, "chosen") )
+        rc = process_chosen_node(fdt, node, name, address_cells, size_cells);
+
+    if ( rc < 0 )
+        printk("fdt: node `%s': parsing failed\n", name);
+    return rc;
+}
+
+static void __init early_print_info(void)
+{
+    struct meminfo *mi = &bootinfo.mem;
+    struct meminfo *mem_resv = &bootinfo.reserved_mem;
+    struct bootmodules *mods = &bootinfo.modules;
+    struct bootcmdlines *cmds = &bootinfo.cmdlines;
+    unsigned int i, j;
+
+    for ( i = 0; i < mi->nr_banks; i++ )
+        printk("RAM: %"PRIpaddr" - %"PRIpaddr"\n",
+                mi->bank[i].start,
+                mi->bank[i].start + mi->bank[i].size - 1);
+    printk("\n");
+    for ( i = 0 ; i < mods->nr_mods; i++ )
+        printk("MODULE[%d]: %"PRIpaddr" - %"PRIpaddr" %-12s\n",
+                i,
+                mods->module[i].start,
+                mods->module[i].start + mods->module[i].size,
+                boot_module_kind_as_string(mods->module[i].kind));
+
+    for ( j = 0; j < mem_resv->nr_banks; j++, i++ )
+    {
+        printk(" RESVD_[%u]: %"PRIpaddr" - %"PRIpaddr"\n", i,
+               mem_resv->bank[j].start,
+               mem_resv->bank[j].start + mem_resv->bank[j].size - 1);
+    }
+    printk("\n");
+    for ( i = 0 ; i < cmds->nr_mods; i++ )
+        printk("CMDLINE[%"PRIpaddr"]:%s %s\n", cmds->cmdline[i].start,
+               cmds->cmdline[i].dt_name,
+               &cmds->cmdline[i].cmdline[0]);
+    printk("\n");
+}
+
+/**
+ * boot_fdt_init - initialize bootinfo from a DTB
+ * @fdt: flattened device tree binary
+ * @paddr: physical address of device tree binary
+ *
+ * Returns the size of the DTB.
+ */
+size_t __init boot_fdt_init(const void *fdt, paddr_t paddr)
+{
+    int ret;
+    paddr_t xen_start, xen_end;
+
+    ret = fdt_check_header(fdt);
+    if ( ret < 0 )
+        panic("No valid device tree\n");
+
+    device_tree_for_each_node((void *)fdt, 0, early_scan_node, NULL);
+
+    /*
+     * The device tree passed to us may have been allocated by skiboot, in which
+     * case it will exist within a reserved region and this call will fail. This
+     * is fine, however, since either way the allocator will know not to step on
+     * the device tree.
+     */
+    add_boot_module(BOOTMOD_FDT, paddr, fdt_totalsize(fdt), false);
+
+    /*
+     * Xen relocates itself at the ppc64 entrypoint, so we need to manually mark
+     * the kernel module.
+     */
+    xen_start = __pa(_start);
+    xen_end = PAGE_ALIGN(__pa(_end));
+    if ( !add_boot_module(BOOTMOD_KERNEL, xen_start, xen_end, false) )
+        panic("Xen overlaps reserved memory! %016lx - %016lx\n", xen_start,
+              xen_end);
+
+    early_print_info();
+
+    return fdt_totalsize(fdt);
+}
diff --git a/xen/arch/ppc/include/asm/setup.h b/xen/arch/ppc/include/asm/setup.h
index e4f64879b6..f6e1940fa9 100644
--- a/xen/arch/ppc/include/asm/setup.h
+++ b/xen/arch/ppc/include/asm/setup.h
@@ -3,4 +3,117 @@
 
 #define max_init_domid (0)
 
+#include <public/version.h>
+#include <asm/p2m.h>
+#include <xen/device_tree.h>
+
+#define MIN_FDT_ALIGN 8
+#define MAX_FDT_SIZE SZ_2M
+
+#define NR_MEM_BANKS 256
+
+#define MAX_MODULES 32 /* Current maximum useful modules */
+
+typedef enum {
+    BOOTMOD_XEN,
+    BOOTMOD_FDT,
+    BOOTMOD_KERNEL,
+    BOOTMOD_RAMDISK,
+}  bootmodule_kind;
+
+enum membank_type {
+    /*
+     * The MEMBANK_DEFAULT type refers to either reserved memory for the
+     * device/firmware (when the bank is in 'reserved_mem') or any RAM (when
+     * the bank is in 'mem').
+     */
+    MEMBANK_DEFAULT,
+    /*
+     * The MEMBANK_STATIC_DOMAIN type is used to indicate whether the memory
+     * bank is bound to a static Xen domain. It is only valid when the bank
+     * is in reserved_mem.
+     */
+    MEMBANK_STATIC_DOMAIN,
+    /*
+     * The MEMBANK_STATIC_HEAP type is used to indicate whether the memory
+     * bank is reserved as static heap. It is only valid when the bank is
+     * in reserved_mem.
+     */
+    MEMBANK_STATIC_HEAP,
+};
+
+/* Indicates the maximum number of characters(\0 included) for shm_id */
+#define MAX_SHM_ID_LENGTH 16
+
+struct membank {
+    paddr_t start;
+    paddr_t size;
+    enum membank_type type;
+};
+
+struct meminfo {
+    unsigned int nr_banks;
+    struct membank bank[NR_MEM_BANKS];
+};
+
+/*
+ * The domU flag is set for kernels and ramdisks of "xen,domain" nodes.
+ * The purpose of the domU flag is to avoid getting confused in
+ * kernel_probe, where we try to guess which is the dom0 kernel and
+ * initrd to be compatible with all versions of the multiboot spec.
+ */
+#define BOOTMOD_MAX_CMDLINE 1024
+struct bootmodule {
+    bootmodule_kind kind;
+    bool domU;
+    paddr_t start;
+    paddr_t size;
+};
+
+/* DT_MAX_NAME is the node name max length according the DT spec */
+#define DT_MAX_NAME 41
+struct bootcmdline {
+    bootmodule_kind kind;
+    bool domU;
+    paddr_t start;
+    char dt_name[DT_MAX_NAME];
+    char cmdline[BOOTMOD_MAX_CMDLINE];
+};
+
+struct bootmodules {
+    int nr_mods;
+    struct bootmodule module[MAX_MODULES];
+};
+
+struct bootcmdlines {
+    unsigned int nr_mods;
+    struct bootcmdline cmdline[MAX_MODULES];
+};
+
+struct bootinfo {
+    struct meminfo mem;
+    struct meminfo reserved_mem;
+    struct bootmodules modules;
+    struct bootcmdlines cmdlines;
+    bool static_heap;
+};
+
+extern struct bootinfo bootinfo;
+
+/*
+ * setup.c
+ */
+
+bool check_reserved_regions_overlap(paddr_t region_start, paddr_t region_size);
+struct bootmodule *add_boot_module(bootmodule_kind kind,
+                                   paddr_t start, paddr_t size, bool domU);
+void add_boot_cmdline(const char *name, const char *cmdline,
+                      bootmodule_kind kind, paddr_t start, bool domU);
+const char *boot_module_kind_as_string(bootmodule_kind kind);
+
+/*
+ * bootfdt.c
+ */
+size_t boot_fdt_init(const void *fdt, paddr_t paddr);
+
 #endif /* __ASM_PPC_SETUP_H__ */
diff --git a/xen/arch/ppc/setup.c b/xen/arch/ppc/setup.c
index 101bdd8bb6..90de99051e 100644
--- a/xen/arch/ppc/setup.c
+++ b/xen/arch/ppc/setup.c
@@ -1,16 +1,116 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 #include <xen/init.h>
 #include <xen/lib.h>
+#include <xen/libfdt/libfdt.h>
 #include <xen/mm.h>
 #include <public/version.h>
 #include <asm/boot.h>
 #include <asm/early_printk.h>
 #include <asm/mm.h>
 #include <asm/processor.h>
+#include <asm/setup.h>
 
 /* Xen stack for bringing up the first CPU. */
 unsigned char __initdata cpu0_boot_stack[STACK_SIZE] __aligned(STACK_SIZE);
 
+/*
+ * Return the end of the non-module region starting at s. In other
+ * words return s the start of the next modules after s.
+ *
+ * On input *end is the end of the region which should be considered
+ * and it is updated to reflect the end of the module, clipped to the
+ * end of the region if it would run over.
+ */
+static paddr_t __init next_module(paddr_t s, paddr_t *end)
+{
+    struct bootmodules *mi = &bootinfo.modules;
+    paddr_t lowest = ~(paddr_t)0;
+    int i;
+
+    for ( i = 0; i < mi->nr_mods; i++ )
+    {
+        paddr_t mod_s = mi->module[i].start;
+        paddr_t mod_e = mod_s + mi->module[i].size;
+
+        if ( !mi->module[i].size )
+            continue;
+
+        if ( mod_s < s )
+            continue;
+        if ( mod_s > lowest )
+            continue;
+        if ( mod_s > *end )
+            continue;
+        lowest = mod_s;
+        *end = min(*end, mod_e);
+    }
+    return lowest;
+}
+
+static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
+                                         void (*cb)(paddr_t ps, paddr_t pe),
+                                         unsigned int first)
+{
+    unsigned int i;
+
+    for ( i = 0 ; i < bootinfo.reserved_mem.nr_banks; i++ )
+    {
+        paddr_t r_s = bootinfo.reserved_mem.bank[i].start;
+        paddr_t r_e = r_s + bootinfo.reserved_mem.bank[i].size;
+
+        if ( s < r_e && r_s < e )
+        {
+            dt_unreserved_regions(r_e, e, cb, i + 1);
+            dt_unreserved_regions(s, r_s, cb, i + 1);
+            return;
+        }
+    }
+
+    cb(s, e);
+}
+
+/*
+ * Populate the boot allocator. Based on arch/arm/setup.c's
+ * populate_boot_allocator.
+ * All RAM but the following regions will be added to the boot allocator:
+ *  - Modules (e.g., Xen, Kernel)
+ *  - Reserved regions
+ */
+static void __init populate_boot_allocator(void)
+{
+    unsigned int i;
+    const struct meminfo *banks = &bootinfo.mem;
+    paddr_t s, e;
+
+    for ( i = 0; i < banks->nr_banks; i++ )
+    {
+        const struct membank *bank = &banks->bank[i];
+        paddr_t bank_end = bank->start + bank->size;
+
+        s = bank->start;
+        while ( s < bank_end )
+        {
+            paddr_t n = bank_end;
+
+            e = next_module(s, &n);
+
+            if ( e == ~(paddr_t)0 )
+                e = n = bank_end;
+
+            /*
+             * Module in a RAM bank other than the one which we are
+             * not dealing with here.
+             */
+            if ( e > bank_end )
+                e = bank_end;
+
+            dt_unreserved_regions(s, e, init_boot_pages, 0);
+
+            s = n;
+        }
+    }
+}
+
 void setup_exceptions(void)
 {
     unsigned long lpcr;
@@ -24,6 +124,8 @@ void __init noreturn start_xen(unsigned long r3, unsigned long r4,
                                unsigned long r5, unsigned long r6,
                                unsigned long r7)
 {
+    void *boot_fdt;
+
     if ( r5 )
     {
         /* Unsupported OpenFirmware boot protocol */
@@ -32,11 +134,16 @@ void __init noreturn start_xen(unsigned long r3, unsigned long r4,
     else
     {
         /* kexec boot protocol */
-        boot_opal_init((void *)r3);
+        boot_fdt = (void *)r3;
+        boot_opal_init(boot_fdt);
     }
 
     setup_exceptions();
 
+    boot_fdt_init(boot_fdt, r3);
+
+    populate_boot_allocator();
+
     setup_initial_pagetables();
 
     early_printk("Hello, ppc64le!\n");
-- 
2.30.2


