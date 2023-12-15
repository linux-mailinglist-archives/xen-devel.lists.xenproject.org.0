Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A2E814048
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 03:52:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654842.1022317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDyJl-0004iE-Tc; Fri, 15 Dec 2023 02:52:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654842.1022317; Fri, 15 Dec 2023 02:52:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDyJl-0004aU-Ja; Fri, 15 Dec 2023 02:52:49 +0000
Received: by outflank-mailman (input) for mailman id 654842;
 Fri, 15 Dec 2023 02:52:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=onWf=H2=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rDyJk-0003SX-0U
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 02:52:48 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 061f4984-9af5-11ee-9b0f-b553b5be7939;
 Fri, 15 Dec 2023 03:52:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 45D8D8285558;
 Thu, 14 Dec 2023 20:52:45 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id yuWOP8qUYRU7; Thu, 14 Dec 2023 20:52:43 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id CA45E8286129;
 Thu, 14 Dec 2023 20:52:43 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id xn56w4kR2ohd; Thu, 14 Dec 2023 20:52:42 -0600 (CST)
Received: from raptor-ewks-026.2lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 5084F828681E;
 Thu, 14 Dec 2023 20:52:42 -0600 (CST)
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
X-Inumbo-ID: 061f4984-9af5-11ee-9b0f-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com CA45E8286129
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1702608763; bh=3Xu8/TjCiVl92nD/llN9P4dPFGZtJ2QZdU92pz36pYM=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=uyU20zW6m5aTv0JL3JQKQdyQ3ZEscKEtx/l4PeeC8JYmUU62Pj2YQ+/7JZm/TChh9
	 cHQgAwQ7f4Rp55d70fiReLcQIDACi9C1wqA3dyUnj3wM5NiWj2TTz/w7zoCy88Dt4U
	 FaDivOUHuU3syEyLX0+dPnwhsa05clvUSVviA2X4=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v2 5/7] xen/ppc: Enable bootfdt and boot allocator
Date: Thu, 14 Dec 2023 20:44:00 -0600
Message-Id: <aa67a0dacab0e3f39dabeb30e31732d617cadde1.1702607884.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1702607884.git.sanastasio@raptorengineering.com>
References: <cover.1702607884.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Move PPC off the asm-generic setup.h and enable usage of bootfdt for
populating the boot info struct from the firmware-provided device tree.
Also enable the Xen boot page allocator.

Includes minor changes to bootfdt.c's boot_fdt_info() to tolerate the
scenario in which the FDT overlaps a reserved memory region, as is the
case on PPC when booted directly from skiboot. Also includes a minor
change to record Xen's correct position on PPC where Xen relocates
itself to at the entrypoint.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/arch/ppc/include/asm/Makefile |   1 -
 xen/arch/ppc/include/asm/setup.h  | 123 +++++++++++++
 xen/arch/ppc/setup.c              | 289 +++++++++++++++++++++++++++++-
 xen/common/device-tree/bootfdt.c  |  25 ++-
 4 files changed, 434 insertions(+), 4 deletions(-)
 create mode 100644 xen/arch/ppc/include/asm/setup.h

diff --git a/xen/arch/ppc/include/asm/Makefile b/xen/arch/ppc/include/asm/Makefile
index 7167661f86..a711cfa856 100644
--- a/xen/arch/ppc/include/asm/Makefile
+++ b/xen/arch/ppc/include/asm/Makefile
@@ -6,6 +6,5 @@ generic-y += iocap.h
 generic-y += paging.h
 generic-y += percpu.h
 generic-y += random.h
-generic-y += setup.h
 generic-y += static-shmem.h
 generic-y += vm_event.h
diff --git a/xen/arch/ppc/include/asm/setup.h b/xen/arch/ppc/include/asm/setup.h
new file mode 100644
index 0000000000..c0f700fc07
--- /dev/null
+++ b/xen/arch/ppc/include/asm/setup.h
@@ -0,0 +1,123 @@
+#ifndef __ASM_PPC_SETUP_H__
+#define __ASM_PPC_SETUP_H__
+
+#define max_init_domid (0)
+
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
+    BOOTMOD_XSM,
+    BOOTMOD_GUEST_DTB,
+    BOOTMOD_UNKNOWN
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
+struct bootcmdline * __init boot_cmdline_find_by_kind(bootmodule_kind kind);
+
+/*
+ * bootfdt.c
+ */
+size_t boot_fdt_info(const void *fdt, paddr_t paddr);
+
+#endif /* __ASM_PPC_SETUP_H__ */
diff --git a/xen/arch/ppc/setup.c b/xen/arch/ppc/setup.c
index 101bdd8bb6..143f2e449e 100644
--- a/xen/arch/ppc/setup.c
+++ b/xen/arch/ppc/setup.c
@@ -1,16 +1,296 @@
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
 
+struct bootinfo __initdata bootinfo;
+
+void __init add_boot_cmdline(const char *name, const char *cmdline,
+                             bootmodule_kind kind, paddr_t start, bool domU)
+{
+    struct bootcmdlines *cmds = &bootinfo.cmdlines;
+    struct bootcmdline *cmd;
+
+    if ( cmds->nr_mods == MAX_MODULES )
+    {
+        printk("Ignoring %s cmdline (too many)\n", name);
+        return;
+    }
+
+    cmd = &cmds->cmdline[cmds->nr_mods++];
+    cmd->kind = kind;
+    cmd->domU = domU;
+    cmd->start = start;
+
+    ASSERT(strlen(name) <= DT_MAX_NAME);
+    safe_strcpy(cmd->dt_name, name);
+
+    if ( strlen(cmdline) > BOOTMOD_MAX_CMDLINE )
+        panic("module %s command line too long\n", name);
+    safe_strcpy(cmd->cmdline, cmdline);
+}
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
+ * boot_cmdline_find_by_kind can only be used to return Xen modules (e.g
+ * XSM, DTB) or Dom0 modules. This is not suitable for looking up guest
+ * modules.
+ */
+struct bootcmdline * __init boot_cmdline_find_by_kind(bootmodule_kind kind)
+{
+    struct bootcmdlines *cmds = &bootinfo.cmdlines;
+    struct bootcmdline *cmd;
+    int i;
+
+    for ( i = 0 ; i < cmds->nr_mods ; i++ )
+    {
+        cmd = &cmds->cmdline[i];
+        if ( cmd->kind == kind && !cmd->domU )
+            return cmd;
+    }
+    return NULL;
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
@@ -24,6 +304,8 @@ void __init noreturn start_xen(unsigned long r3, unsigned long r4,
                                unsigned long r5, unsigned long r6,
                                unsigned long r7)
 {
+    void *boot_fdt;
+
     if ( r5 )
     {
         /* Unsupported OpenFirmware boot protocol */
@@ -32,11 +314,16 @@ void __init noreturn start_xen(unsigned long r3, unsigned long r4,
     else
     {
         /* kexec boot protocol */
-        boot_opal_init((void *)r3);
+        boot_fdt = (void *)r3;
+        boot_opal_init(boot_fdt);
     }
 
     setup_exceptions();
 
+    boot_fdt_info(boot_fdt, r3);
+
+    populate_boot_allocator();
+
     setup_initial_pagetables();
 
     early_printk("Hello, ppc64le!\n");
diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
index 796ac01c18..7ddfcc7e2a 100644
--- a/xen/common/device-tree/bootfdt.c
+++ b/xen/common/device-tree/bootfdt.c
@@ -543,12 +543,33 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
     if ( ret < 0 )
         panic("No valid device tree\n");
 
-    add_boot_module(BOOTMOD_FDT, paddr, fdt_totalsize(fdt), false);
-
     ret = device_tree_for_each_node((void *)fdt, 0, early_scan_node, NULL);
     if ( ret )
         panic("Early FDT parsing failed (%d)\n", ret);
 
+    /*
+     * Add module for the FDT itself after the device tree has been parsed. This
+     * is required on ppc64le where the device tree passed to Xen may have been
+     * allocated by skiboot, in which case it will exist within a reserved
+     * region and this call will fail. This is fine, however, since either way
+     * the allocator will know not to step on the device tree.
+     */
+    add_boot_module(BOOTMOD_FDT, paddr, fdt_totalsize(fdt), false);
+
+    /*
+     * Xen relocates itself at the ppc64 entrypoint, so we need to manually mark
+     * the kernel module.
+     */
+    if ( IS_ENABLED(CONFIG_PPC64) ) {
+        paddr_t xen_start, xen_end;
+
+        xen_start = __pa(_start);
+        xen_end = PAGE_ALIGN(__pa(_end));
+        if ( !add_boot_module(BOOTMOD_XEN, xen_start, xen_end, false) )
+            panic("Xen overlaps reserved memory! %016lx - %016lx\n", xen_start,
+                xen_end);
+    }
+
     /*
      * On Arm64 setup_directmap_mappings() expects to be called with the lowest
      * bank in memory first. There is no requirement that the DT will provide
-- 
2.30.2


