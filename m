Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE90987C510
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 23:16:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693518.1081755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rktN1-0002Cb-TT; Thu, 14 Mar 2024 22:16:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693518.1081755; Thu, 14 Mar 2024 22:16:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rktN1-00023V-Kk; Thu, 14 Mar 2024 22:16:15 +0000
Received: by outflank-mailman (input) for mailman id 693518;
 Thu, 14 Mar 2024 22:16:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y43E=KU=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rktMz-0000X2-NV
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 22:16:13 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72f8547a-e250-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 23:16:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 9C3FC8286CF5;
 Thu, 14 Mar 2024 17:16:02 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id czhFb6PbTxxG; Thu, 14 Mar 2024 17:16:00 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 3628B8286CAE;
 Thu, 14 Mar 2024 17:16:00 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id JtVqs41vqD3h; Thu, 14 Mar 2024 17:15:59 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 6F11E8286790;
 Thu, 14 Mar 2024 17:15:59 -0500 (CDT)
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
X-Inumbo-ID: 72f8547a-e250-11ee-a1ee-f123f15fe8a2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 3628B8286CAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1710454560; bh=qU6fRQlVfTPmaXGICHyYeZAo/sfzg+/2MQ1+Rm907mk=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=DeL4d2CDd0M/SK+9HBrLrwb2I5xooKHCerbnsnnHjy8vIIw2fPpaX9YCoHH5Ht1RF
	 3Da9+0ozUElYTvPsSD2KZKzfHP+6x6c0CfYMlGOinAKhoZFWxx4jBpXk9mWgRs8U3H
	 Jzgm1VS/VCPW/HQy3yDXxhxMIOm9jZwWDYFVfcuo=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v3 5/9] xen/device-tree: Move Arm's setup.c bootinfo functions to common
Date: Thu, 14 Mar 2024 17:15:43 -0500
Message-Id: <039524d4157dddb2faf6887739a727f6e993b53f.1710443965.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1710443965.git.sanastasio@raptorengineering.com>
References: <cover.1710443965.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Arm's setup.c contains a collection of functions for parsing memory map
and other boot information from a device tree. Since these routines are
generally useful on any architecture that supports device tree booting,
move them into xen/common/device-tree.

Suggested-by: Julien Grall <julien@xen.org>
Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 MAINTAINERS                       |   1 +
 xen/arch/arm/setup.c              | 419 --------------------------
 xen/common/Makefile               |   1 +
 xen/common/device-tree/Makefile   |   1 +
 xen/common/device-tree/bootinfo.c | 469 ++++++++++++++++++++++++++++++
 5 files changed, 472 insertions(+), 419 deletions(-)
 create mode 100644 xen/common/device-tree/Makefile
 create mode 100644 xen/common/device-tree/bootinfo.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 56a6932037..e85fbe6737 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -301,6 +301,7 @@ M:	Stefano Stabellini <sstabellini@kernel.org>
 M:	Julien Grall <julien@xen.org>
 S:	Supported
 F:	xen/common/libfdt/
+F:	xen/common/device-tree/setup.c
 F:	xen/common/device_tree.c
 F:	xen/common/dt-overlay.c
 F:	xen/include/xen/libfdt/
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 424744ad5e..e60184f583 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -48,8 +48,6 @@
 #include <xsm/xsm.h>
 #include <asm/acpi.h>
 
-struct bootinfo __initdata bootinfo;
-
 /*
  * Sanitized version of cpuinfo containing only features available on all
  * cores (only on arm64 as there is no sanitization support on arm32).
@@ -203,309 +201,6 @@ static void __init processor_id(void)
     processor_setup();
 }
 
-static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
-                                         void (*cb)(paddr_t ps, paddr_t pe),
-                                         unsigned int first)
-{
-    unsigned int i, nr;
-    int rc;
-
-    rc = fdt_num_mem_rsv(device_tree_flattened);
-    if ( rc < 0 )
-        panic("Unable to retrieve the number of reserved regions (rc=%d)\n",
-              rc);
-
-    nr = rc;
-
-    for ( i = first; i < nr ; i++ )
-    {
-        paddr_t r_s, r_e;
-
-        if ( fdt_get_mem_rsv_paddr(device_tree_flattened, i, &r_s, &r_e ) < 0 )
-            /* If we can't read it, pretend it doesn't exist... */
-            continue;
-
-        r_e += r_s; /* fdt_get_mem_rsv_paddr returns length */
-
-        if ( s < r_e && r_s < e )
-        {
-            dt_unreserved_regions(r_e, e, cb, i+1);
-            dt_unreserved_regions(s, r_s, cb, i+1);
-            return;
-        }
-    }
-
-    /*
-     * i is the current bootmodule we are evaluating across all possible
-     * kinds.
-     *
-     * When retrieving the corresponding reserved-memory addresses
-     * below, we need to index the bootinfo.reserved_mem bank starting
-     * from 0, and only counting the reserved-memory modules. Hence,
-     * we need to use i - nr.
-     */
-    for ( ; i - nr < bootinfo.reserved_mem.nr_banks; i++ )
-    {
-        paddr_t r_s = bootinfo.reserved_mem.bank[i - nr].start;
-        paddr_t r_e = r_s + bootinfo.reserved_mem.bank[i - nr].size;
-
-        if ( s < r_e && r_s < e )
-        {
-            dt_unreserved_regions(r_e, e, cb, i + 1);
-            dt_unreserved_regions(s, r_s, cb, i + 1);
-            return;
-        }
-    }
-
-    cb(s, e);
-}
-
-/*
- * TODO: '*_end' could be 0 if the bank/region is at the end of the physical
- * address space. This is for now not handled as it requires more rework.
- */
-static bool __init meminfo_overlap_check(struct meminfo *meminfo,
-                                         paddr_t region_start,
-                                         paddr_t region_size)
-{
-    paddr_t bank_start = INVALID_PADDR, bank_end = 0;
-    paddr_t region_end = region_start + region_size;
-    unsigned int i, bank_num = meminfo->nr_banks;
-
-    for ( i = 0; i < bank_num; i++ )
-    {
-        bank_start = meminfo->bank[i].start;
-        bank_end = bank_start + meminfo->bank[i].size;
-
-        if ( region_end <= bank_start || region_start >= bank_end )
-            continue;
-        else
-        {
-            printk("Region: [%#"PRIpaddr", %#"PRIpaddr") overlapping with bank[%u]: [%#"PRIpaddr", %#"PRIpaddr")\n",
-                   region_start, region_end, i, bank_start, bank_end);
-            return true;
-        }
-    }
-
-    return false;
-}
-
-/*
- * TODO: '*_end' could be 0 if the module/region is at the end of the physical
- * address space. This is for now not handled as it requires more rework.
- */
-static bool __init bootmodules_overlap_check(struct bootmodules *bootmodules,
-                                             paddr_t region_start,
-                                             paddr_t region_size)
-{
-    paddr_t mod_start = INVALID_PADDR, mod_end = 0;
-    paddr_t region_end = region_start + region_size;
-    unsigned int i, mod_num = bootmodules->nr_mods;
-
-    for ( i = 0; i < mod_num; i++ )
-    {
-        mod_start = bootmodules->module[i].start;
-        mod_end = mod_start + bootmodules->module[i].size;
-
-        if ( region_end <= mod_start || region_start >= mod_end )
-            continue;
-        else
-        {
-            printk("Region: [%#"PRIpaddr", %#"PRIpaddr") overlapping with mod[%u]: [%#"PRIpaddr", %#"PRIpaddr")\n",
-                   region_start, region_end, i, mod_start, mod_end);
-            return true;
-        }
-    }
-
-    return false;
-}
-
-void __init fw_unreserved_regions(paddr_t s, paddr_t e,
-                                  void (*cb)(paddr_t ps, paddr_t pe),
-                                  unsigned int first)
-{
-    if ( acpi_disabled )
-        dt_unreserved_regions(s, e, cb, first);
-    else
-        cb(s, e);
-}
-
-/*
- * Given an input physical address range, check if this range is overlapping
- * with the existing reserved memory regions defined in bootinfo.
- * Return true if the input physical address range is overlapping with any
- * existing reserved memory regions, otherwise false.
- */
-bool __init check_reserved_regions_overlap(paddr_t region_start,
-                                           paddr_t region_size)
-{
-    /* Check if input region is overlapping with bootinfo.reserved_mem banks */
-    if ( meminfo_overlap_check(&bootinfo.reserved_mem,
-                               region_start, region_size) )
-        return true;
-
-    /* Check if input region is overlapping with bootmodules */
-    if ( bootmodules_overlap_check(&bootinfo.modules,
-                                   region_start, region_size) )
-        return true;
-
-#ifdef CONFIG_ACPI
-    /* Check if input region is overlapping with ACPI EfiACPIReclaimMemory */
-    if ( meminfo_overlap_check(&bootinfo.acpi, region_start, region_size) )
-        return true;
-#endif
-
-    return false;
-}
-
-struct bootmodule __init *add_boot_module(bootmodule_kind kind,
-                                          paddr_t start, paddr_t size,
-                                          bool domU)
-{
-    struct bootmodules *mods = &bootinfo.modules;
-    struct bootmodule *mod;
-    unsigned int i;
-
-    if ( mods->nr_mods == MAX_MODULES )
-    {
-        printk("Ignoring %s boot module at %"PRIpaddr"-%"PRIpaddr" (too many)\n",
-               boot_module_kind_as_string(kind), start, start + size);
-        return NULL;
-    }
-
-    if ( check_reserved_regions_overlap(start, size) )
-        return NULL;
-
-    for ( i = 0 ; i < mods->nr_mods ; i++ )
-    {
-        mod = &mods->module[i];
-        if ( mod->kind == kind && mod->start == start )
-        {
-            if ( !domU )
-                mod->domU = false;
-            return mod;
-        }
-    }
-
-    mod = &mods->module[mods->nr_mods++];
-    mod->kind = kind;
-    mod->start = start;
-    mod->size = size;
-    mod->domU = domU;
-
-    return mod;
-}
-
-/*
- * boot_module_find_by_kind can only be used to return Xen modules (e.g
- * XSM, DTB) or Dom0 modules. This is not suitable for looking up guest
- * modules.
- */
-struct bootmodule * __init boot_module_find_by_kind(bootmodule_kind kind)
-{
-    struct bootmodules *mods = &bootinfo.modules;
-    struct bootmodule *mod;
-    int i;
-    for (i = 0 ; i < mods->nr_mods ; i++ )
-    {
-        mod = &mods->module[i];
-        if ( mod->kind == kind && !mod->domU )
-            return mod;
-    }
-    return NULL;
-}
-
-void __init add_boot_cmdline(const char *name, const char *cmdline,
-                             bootmodule_kind kind, paddr_t start, bool domU)
-{
-    struct bootcmdlines *cmds = &bootinfo.cmdlines;
-    struct bootcmdline *cmd;
-
-    if ( cmds->nr_mods == MAX_MODULES )
-    {
-        printk("Ignoring %s cmdline (too many)\n", name);
-        return;
-    }
-
-    cmd = &cmds->cmdline[cmds->nr_mods++];
-    cmd->kind = kind;
-    cmd->domU = domU;
-    cmd->start = start;
-
-    ASSERT(strlen(name) <= DT_MAX_NAME);
-    safe_strcpy(cmd->dt_name, name);
-
-    if ( strlen(cmdline) > BOOTMOD_MAX_CMDLINE )
-        panic("module %s command line too long\n", name);
-    safe_strcpy(cmd->cmdline, cmdline);
-}
-
-/*
- * boot_cmdline_find_by_kind can only be used to return Xen modules (e.g
- * XSM, DTB) or Dom0 modules. This is not suitable for looking up guest
- * modules.
- */
-struct bootcmdline * __init boot_cmdline_find_by_kind(bootmodule_kind kind)
-{
-    struct bootcmdlines *cmds = &bootinfo.cmdlines;
-    struct bootcmdline *cmd;
-    int i;
-
-    for ( i = 0 ; i < cmds->nr_mods ; i++ )
-    {
-        cmd = &cmds->cmdline[i];
-        if ( cmd->kind == kind && !cmd->domU )
-            return cmd;
-    }
-    return NULL;
-}
-
-struct bootcmdline * __init boot_cmdline_find_by_name(const char *name)
-{
-    struct bootcmdlines *mods = &bootinfo.cmdlines;
-    struct bootcmdline *mod;
-    unsigned int i;
-
-    for (i = 0 ; i < mods->nr_mods ; i++ )
-    {
-        mod = &mods->cmdline[i];
-        if ( strcmp(mod->dt_name, name) == 0 )
-            return mod;
-    }
-    return NULL;
-}
-
-struct bootmodule * __init boot_module_find_by_addr_and_kind(bootmodule_kind kind,
-                                                             paddr_t start)
-{
-    struct bootmodules *mods = &bootinfo.modules;
-    struct bootmodule *mod;
-    unsigned int i;
-
-    for (i = 0 ; i < mods->nr_mods ; i++ )
-    {
-        mod = &mods->module[i];
-        if ( mod->kind == kind && mod->start == start )
-            return mod;
-    }
-    return NULL;
-}
-
-const char * __init boot_module_kind_as_string(bootmodule_kind kind)
-{
-    switch ( kind )
-    {
-    case BOOTMOD_XEN:     return "Xen";
-    case BOOTMOD_FDT:     return "Device Tree";
-    case BOOTMOD_KERNEL:  return "Kernel";
-    case BOOTMOD_RAMDISK: return "Ramdisk";
-    case BOOTMOD_XSM:     return "XSM";
-    case BOOTMOD_GUEST_DTB:     return "DTB";
-    case BOOTMOD_UNKNOWN: return "Unknown";
-    default: BUG();
-    }
-}
-
 void __init discard_initial_modules(void)
 {
     struct bootmodules *mi = &bootinfo.modules;
@@ -544,40 +239,6 @@ static void * __init relocate_fdt(paddr_t dtb_paddr, size_t dtb_size)
     return fdt;
 }
 
-/*
- * Return the end of the non-module region starting at s. In other
- * words return s the start of the next modules after s.
- *
- * On input *end is the end of the region which should be considered
- * and it is updated to reflect the end of the module, clipped to the
- * end of the region if it would run over.
- */
-static paddr_t __init next_module(paddr_t s, paddr_t *end)
-{
-    struct bootmodules *mi = &bootinfo.modules;
-    paddr_t lowest = ~(paddr_t)0;
-    int i;
-
-    for ( i = 0; i < mi->nr_mods; i++ )
-    {
-        paddr_t mod_s = mi->module[i].start;
-        paddr_t mod_e = mod_s + mi->module[i].size;
-
-        if ( !mi->module[i].size )
-            continue;
-
-        if ( mod_s < s )
-            continue;
-        if ( mod_s > lowest )
-            continue;
-        if ( mod_s > *end )
-            continue;
-        lowest = mod_s;
-        *end = min(*end, mod_e);
-    }
-    return lowest;
-}
-
 void __init init_pdx(void)
 {
     paddr_t bank_start, bank_size, bank_end;
@@ -622,86 +283,6 @@ void __init init_pdx(void)
     }
 }
 
-/*
- * Populate the boot allocator.
- * If a static heap was not provided by the admin, all the RAM but the
- * following regions will be added:
- *  - Modules (e.g., Xen, Kernel)
- *  - Reserved regions
- *  - Xenheap (arm32 only)
- * If a static heap was provided by the admin, populate the boot
- * allocator with the corresponding regions only, but with Xenheap excluded
- * on arm32.
- */
-void __init populate_boot_allocator(void)
-{
-    unsigned int i;
-    const struct meminfo *banks = &bootinfo.mem;
-    paddr_t s, e;
-
-    if ( bootinfo.static_heap )
-    {
-        for ( i = 0 ; i < bootinfo.reserved_mem.nr_banks; i++ )
-        {
-            if ( bootinfo.reserved_mem.bank[i].type != MEMBANK_STATIC_HEAP )
-                continue;
-
-            s = bootinfo.reserved_mem.bank[i].start;
-            e = s + bootinfo.reserved_mem.bank[i].size;
-#ifdef CONFIG_ARM_32
-            /* Avoid the xenheap, note that the xenheap cannot across a bank */
-            if ( s <= mfn_to_maddr(directmap_mfn_start) &&
-                 e >= mfn_to_maddr(directmap_mfn_end) )
-            {
-                init_boot_pages(s, mfn_to_maddr(directmap_mfn_start));
-                init_boot_pages(mfn_to_maddr(directmap_mfn_end), e);
-            }
-            else
-#endif
-                init_boot_pages(s, e);
-        }
-
-        return;
-    }
-
-    for ( i = 0; i < banks->nr_banks; i++ )
-    {
-        const struct membank *bank = &banks->bank[i];
-        paddr_t bank_end = bank->start + bank->size;
-
-        s = bank->start;
-        while ( s < bank_end )
-        {
-            paddr_t n = bank_end;
-
-            e = next_module(s, &n);
-
-            if ( e == ~(paddr_t)0 )
-                e = n = bank_end;
-
-            /*
-             * Module in a RAM bank other than the one which we are
-             * not dealing with here.
-             */
-            if ( e > bank_end )
-                e = bank_end;
-
-#ifdef CONFIG_ARM_32
-            /* Avoid the xenheap */
-            if ( s < mfn_to_maddr(directmap_mfn_end) &&
-                 mfn_to_maddr(directmap_mfn_start) < e )
-            {
-                e = mfn_to_maddr(directmap_mfn_start);
-                n = mfn_to_maddr(directmap_mfn_end);
-            }
-#endif
-
-            fw_unreserved_regions(s, e, init_boot_pages, 0);
-            s = n;
-        }
-    }
-}
-
 size_t __read_mostly dcache_line_bytes;
 
 /* C entry point for boot CPU */
diff --git a/xen/common/Makefile b/xen/common/Makefile
index e5eee19a85..3a39dd35f2 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -76,6 +76,7 @@ obj-$(CONFIG_UBSAN) += ubsan/
 
 obj-$(CONFIG_NEEDS_LIBELF) += libelf/
 obj-$(CONFIG_HAS_DEVICE_TREE) += libfdt/
+obj-$(CONFIG_HAS_DEVICE_TREE) += device-tree/
 
 CONF_FILE := $(if $(patsubst /%,,$(KCONFIG_CONFIG)),$(objtree)/)$(KCONFIG_CONFIG)
 $(obj)/config.gz: $(CONF_FILE)
diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
new file mode 100644
index 0000000000..c97b2bd88c
--- /dev/null
+++ b/xen/common/device-tree/Makefile
@@ -0,0 +1 @@
+obj-y += bootinfo.o
diff --git a/xen/common/device-tree/bootinfo.c b/xen/common/device-tree/bootinfo.c
new file mode 100644
index 0000000000..a6c0fe7917
--- /dev/null
+++ b/xen/common/device-tree/bootinfo.c
@@ -0,0 +1,469 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Derived from $xen/arch/arm/setup.c.
+ *
+ * Early device tree parsing and bookkeeping routines.
+ *
+ * Tim Deegan <tim@xen.org>
+ * Copyright (c) 2011 Citrix Systems.
+ * Copyright (c) 2024 Raptor Engineering LLC
+ */
+
+#include <xen/compile.h>
+#include <xen/errno.h>
+#include <xen/device_tree.h>
+#include <xen/domain_page.h>
+#include <xen/grant_table.h>
+#include <xen/types.h>
+#include <xen/string.h>
+#include <xen/serial.h>
+#include <xen/sched.h>
+#include <xen/console.h>
+#include <xen/err.h>
+#include <xen/init.h>
+#include <xen/irq.h>
+#include <xen/mm.h>
+#include <xen/param.h>
+#include <xen/softirq.h>
+#include <xen/keyhandler.h>
+#include <xen/cpu.h>
+#include <xen/pfn.h>
+#include <xen/virtual_region.h>
+#include <xen/vmap.h>
+#include <xen/trace.h>
+#include <xen/libfdt/libfdt-xen.h>
+#include <xen/acpi.h>
+#include <xen/warning.h>
+#include <xen/hypercall.h>
+#include <asm/page.h>
+#include <asm/current.h>
+#include <asm/setup.h>
+#include <asm/setup.h>
+
+struct bootinfo __initdata bootinfo;
+
+const char * __init boot_module_kind_as_string(bootmodule_kind kind)
+{
+    switch ( kind )
+    {
+    case BOOTMOD_XEN:     return "Xen";
+    case BOOTMOD_FDT:     return "Device Tree";
+    case BOOTMOD_KERNEL:  return "Kernel";
+    case BOOTMOD_RAMDISK: return "Ramdisk";
+    case BOOTMOD_XSM:     return "XSM";
+    case BOOTMOD_GUEST_DTB:     return "DTB";
+    case BOOTMOD_UNKNOWN: return "Unknown";
+    default: BUG();
+    }
+}
+
+static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
+                                         void (*cb)(paddr_t ps, paddr_t pe),
+                                         unsigned int first)
+{
+    unsigned int i, nr;
+    int rc;
+
+    rc = fdt_num_mem_rsv(device_tree_flattened);
+    if ( rc < 0 )
+        panic("Unable to retrieve the number of reserved regions (rc=%d)\n",
+              rc);
+
+    nr = rc;
+
+    for ( i = first; i < nr ; i++ )
+    {
+        paddr_t r_s, r_e;
+
+        if ( fdt_get_mem_rsv_paddr(device_tree_flattened, i, &r_s, &r_e ) < 0 )
+            /* If we can't read it, pretend it doesn't exist... */
+            continue;
+
+        r_e += r_s; /* fdt_get_mem_rsv_paddr returns length */
+
+        if ( s < r_e && r_s < e )
+        {
+            dt_unreserved_regions(r_e, e, cb, i+1);
+            dt_unreserved_regions(s, r_s, cb, i+1);
+            return;
+        }
+    }
+
+    /*
+     * i is the current bootmodule we are evaluating across all possible
+     * kinds.
+     *
+     * When retrieving the corresponding reserved-memory addresses
+     * below, we need to index the bootinfo.reserved_mem bank starting
+     * from 0, and only counting the reserved-memory modules. Hence,
+     * we need to use i - nr.
+     */
+    for ( ; i - nr < bootinfo.reserved_mem.nr_banks; i++ )
+    {
+        paddr_t r_s = bootinfo.reserved_mem.bank[i - nr].start;
+        paddr_t r_e = r_s + bootinfo.reserved_mem.bank[i - nr].size;
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
+            printk("Region: [%#"PRIpaddr", %#"PRIpaddr") overlapping with bank[%u]: [%#"PRIpaddr", %#"PRIpaddr")\n",
+                   region_start, region_end, i, bank_start, bank_end);
+            return true;
+        }
+    }
+
+    return false;
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
+            printk("Region: [%#"PRIpaddr", %#"PRIpaddr") overlapping with mod[%u]: [%#"PRIpaddr", %#"PRIpaddr")\n",
+                   region_start, region_end, i, mod_start, mod_end);
+            return true;
+        }
+    }
+
+    return false;
+}
+
+void __init fw_unreserved_regions(paddr_t s, paddr_t e,
+                                  void (*cb)(paddr_t ps, paddr_t pe),
+                                  unsigned int first)
+{
+    if ( acpi_disabled )
+        dt_unreserved_regions(s, e, cb, first);
+    else
+        cb(s, e);
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
+#ifdef CONFIG_ACPI
+    /* Check if input region is overlapping with ACPI EfiACPIReclaimMemory */
+    if ( meminfo_overlap_check(&bootinfo.acpi, region_start, region_size) )
+        return true;
+#endif
+
+    return false;
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
+/*
+ * boot_module_find_by_kind can only be used to return Xen modules (e.g
+ * XSM, DTB) or Dom0 modules. This is not suitable for looking up guest
+ * modules.
+ */
+struct bootmodule * __init boot_module_find_by_kind(bootmodule_kind kind)
+{
+    struct bootmodules *mods = &bootinfo.modules;
+    struct bootmodule *mod;
+    int i;
+    for (i = 0 ; i < mods->nr_mods ; i++ )
+    {
+        mod = &mods->module[i];
+        if ( mod->kind == kind && !mod->domU )
+            return mod;
+    }
+    return NULL;
+}
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
+struct bootcmdline * __init boot_cmdline_find_by_name(const char *name)
+{
+    struct bootcmdlines *mods = &bootinfo.cmdlines;
+    struct bootcmdline *mod;
+    unsigned int i;
+
+    for (i = 0 ; i < mods->nr_mods ; i++ )
+    {
+        mod = &mods->cmdline[i];
+        if ( strcmp(mod->dt_name, name) == 0 )
+            return mod;
+    }
+    return NULL;
+}
+
+struct bootmodule * __init boot_module_find_by_addr_and_kind(bootmodule_kind kind,
+                                                             paddr_t start)
+{
+    struct bootmodules *mods = &bootinfo.modules;
+    struct bootmodule *mod;
+    unsigned int i;
+
+    for (i = 0 ; i < mods->nr_mods ; i++ )
+    {
+        mod = &mods->module[i];
+        if ( mod->kind == kind && mod->start == start )
+            return mod;
+    }
+    return NULL;
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
+/*
+ * Populate the boot allocator.
+ * If a static heap was not provided by the admin, all the RAM but the
+ * following regions will be added:
+ *  - Modules (e.g., Xen, Kernel)
+ *  - Reserved regions
+ *  - Xenheap (arm32 only)
+ * If a static heap was provided by the admin, populate the boot
+ * allocator with the corresponding regions only, but with Xenheap excluded
+ * on arm32.
+ */
+void __init populate_boot_allocator(void)
+{
+    unsigned int i;
+    const struct meminfo *banks = &bootinfo.mem;
+    paddr_t s, e;
+
+    if ( bootinfo.static_heap )
+    {
+        for ( i = 0 ; i < bootinfo.reserved_mem.nr_banks; i++ )
+        {
+            if ( bootinfo.reserved_mem.bank[i].type != MEMBANK_STATIC_HEAP )
+                continue;
+
+            s = bootinfo.reserved_mem.bank[i].start;
+            e = s + bootinfo.reserved_mem.bank[i].size;
+#ifdef CONFIG_ARM_32
+            /* Avoid the xenheap, note that the xenheap cannot across a bank */
+            if ( s <= mfn_to_maddr(directmap_mfn_start) &&
+                 e >= mfn_to_maddr(directmap_mfn_end) )
+            {
+                init_boot_pages(s, mfn_to_maddr(directmap_mfn_start));
+                init_boot_pages(mfn_to_maddr(directmap_mfn_end), e);
+            }
+            else
+#endif
+                init_boot_pages(s, e);
+        }
+
+        return;
+    }
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
+#ifdef CONFIG_ARM_32
+            /* Avoid the xenheap */
+            if ( s < mfn_to_maddr(directmap_mfn_end) &&
+                 mfn_to_maddr(directmap_mfn_start) < e )
+            {
+                e = mfn_to_maddr(directmap_mfn_start);
+                n = mfn_to_maddr(directmap_mfn_end);
+            }
+#endif
+
+            fw_unreserved_regions(s, e, init_boot_pages, 0);
+            s = n;
+        }
+    }
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.30.2


