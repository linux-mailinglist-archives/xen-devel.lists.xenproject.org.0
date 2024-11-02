Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 481CF9BA1B2
	for <lists+xen-devel@lfdr.de>; Sat,  2 Nov 2024 18:26:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829561.1244567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7HtQ-0005eO-Ng; Sat, 02 Nov 2024 17:26:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829561.1244567; Sat, 02 Nov 2024 17:26:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7HtQ-0005cS-J5; Sat, 02 Nov 2024 17:26:32 +0000
Received: by outflank-mailman (input) for mailman id 829561;
 Sat, 02 Nov 2024 17:26:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RajI=R5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t7HtP-0004r4-6f
 for xen-devel@lists.xenproject.org; Sat, 02 Nov 2024 17:26:31 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96d410c4-993f-11ef-99a3-01e77a169b0f;
 Sat, 02 Nov 2024 18:26:27 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 173056836207092.5618760022054;
 Sat, 2 Nov 2024 10:26:02 -0700 (PDT)
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
X-Inumbo-ID: 96d410c4-993f-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijk2ZDQxMGM0LTk5M2YtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwNTY4Mzg4LjA1MDgxNCwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1730568370; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dUI3wqdDoph7S1XYVUqdxX/7PlP8MddaQqSm1ootBmufcxdXEaJMqVw8K34vjdI4KBqq7zLwtU7lhEcOH/pWe8Pl3rDZac4Bfc3Hranus3s4scONhAktbyEv87yZu5Az4wq/eBnyIjjKLsFC2PdaVNrexZs11cp56Gkh3xGfEdE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730568370; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jNx/3SoBTvToEoU/tE6YgPkXOEv7nkcy+Lso0iBfWHw=; 
	b=UR/wiT+YM+Y65CIH865oeH3gvFR5Nitkv+sVej56QIeOq/9yNljGY1kwA6DqcHJUzLgRHllIOsRZDquPEJKiFzur66RQJkpcxDjm7fcJGWo9+TFkXCJTW5rlyaR1n/A04fEB9uhrrv+ZQLNFqH+noLTReSKnL5dRsQFz9VTGcm8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730568370;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=jNx/3SoBTvToEoU/tE6YgPkXOEv7nkcy+Lso0iBfWHw=;
	b=l2cIrvL8nj8VguIribLhqPtiBZT8nVI2hnN3x49fw0YdwUYHRll3Nat6vQb3GKjp
	k7BoL9fuw+dFuCLdUokcD19fXNzdwmyaoHVv9iy2bjcn6kNcZP9RYaqwPWUxfkh2S9H
	R57L9dfAH64Cfb+OKc5fODglwxhOcFPDC0K7XDxE=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 02/12] x86/boot: eliminate module_map
Date: Sat,  2 Nov 2024 13:25:41 -0400
Message-Id: <20241102172551.17233-3-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241102172551.17233-1-dpsmith@apertussolutions.com>
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

With all boot modules now labeled by type, it is no longer necessary to
track whether a boot module was identified via the module_map bitmap.

Introduce a set of helpers to search the list of boot modules based on type and
the reference type, pointer or array index, desired. Then drop all uses of
setting a bit in module_map and replace its use for looping with the helpers.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
Changes since v7:
- collapse the three module_map patches into one,
  - x86/boot: remove module_map usage from microcode loading
  - x86/boot: remove module_map usage from xsm policy loading
  - x86/boot: remove module_map usage by ramdisk loading
---
 xen/arch/x86/cpu/microcode/core.c   | 12 ++++-----
 xen/arch/x86/include/asm/bootinfo.h | 42 ++++++++++++++++++++++++++++-
 xen/arch/x86/setup.c                | 28 +++++++++++--------
 xen/xsm/xsm_policy.c                | 19 +++++--------
 4 files changed, 70 insertions(+), 31 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index f46464241557..b09cf83249f6 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -790,15 +790,13 @@ static int __init early_microcode_load(struct boot_info *bi)
 
     if ( opt_scan ) /* Scan for a CPIO archive */
     {
-        for ( idx = 1; idx < bi->nr_modules; ++idx )
+        for_each_boot_module_by_type(idx, bi, BOOTMOD_UNKNOWN)
         {
+            struct boot_module *bm = &bi->mods[idx];
             struct cpio_data cd;
 
-            if ( !test_bit(idx, bi->module_map) )
-                continue;
-
-            size = bi->mods[idx].mod->mod_end;
-            data = bootstrap_map_bm(&bi->mods[idx]);
+            size = bm->mod->mod_end;
+            data = bootstrap_map_bm(bm);
             if ( !data )
             {
                 printk(XENLOG_WARNING "Microcode: Could not map module %d, size %zu\n",
@@ -840,7 +838,7 @@ static int __init early_microcode_load(struct boot_info *bi)
             return -ENODEV;
         }
 
-        if ( !__test_and_clear_bit(idx, bi->module_map) )
+        if ( bi->mods[idx].type != BOOTMOD_UNKNOWN )
         {
             printk(XENLOG_WARNING "Microcode: Chosen module %d already used\n", idx);
             return -ENODEV;
diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index fc74e3b224e7..37dfcc14fa7d 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -43,10 +43,50 @@ struct boot_info {
     size_t memmap_length;
 
     unsigned int nr_modules;
-    unsigned long *module_map; /* Temporary */
     struct boot_module mods[MAX_NR_BOOTMODS + 1];
 };
 
+/*
+ * next_boot_module_index:
+ *     Finds the next boot module of type t, starting at array index start.
+ *
+ * Returns:
+ *      Success - index in boot_module array
+ *      Failure - a value greater than MAX_NR_BOOTMODS
+ */
+static inline unsigned int __init next_boot_module_index(
+    const struct boot_info *bi, enum bootmod_type t, unsigned int start)
+{
+    unsigned int i;
+
+    if ( t == BOOTMOD_XEN )
+        return bi->nr_modules;
+
+    for ( i = start; i < bi->nr_modules; i++ )
+    {
+        if ( bi->mods[i].type == t )
+            return i;
+    }
+
+    return MAX_NR_BOOTMODS + 1;
+}
+
+/*
+ * first_boot_module_index:
+ *     Finds the first boot module of type t.
+ *
+ * Returns:
+ *      Success - index in boot_module array
+ *      Failure - a value greater than MAX_NR_BOOTMODS
+ */
+#define first_boot_module_index(bi, t)              \
+    next_boot_module_index(bi, t, 0)
+
+#define for_each_boot_module_by_type(i, b, t)       \
+    for ( i = first_boot_module_index(b, t);        \
+          i <= (b)->nr_modules;                     \
+          i = next_boot_module_index(b, t, i + 1) )
+
 #endif /* X86_BOOTINFO_H */
 
 /*
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index fac08b6242e9..92dbdfe12a3d 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1034,7 +1034,7 @@ void asmlinkage __init noreturn __start_xen(void)
     struct cpu_info *info = get_cpu_info(), *bsp_info;
     unsigned int initrdidx, num_parked = 0;
     struct boot_info *bi;
-    unsigned long nr_pages, raw_max_page, modules_headroom, module_map[1];
+    unsigned long nr_pages, raw_max_page, modules_headroom;
     int i, j, e820_warn = 0, bytes = 0;
     unsigned long eb_start, eb_end;
     bool acpi_boot_table_init_done = false, relocated = false;
@@ -1097,8 +1097,6 @@ void asmlinkage __init noreturn __start_xen(void)
         ASSERT(multiboot_ptr < MB(1) || xen_phys_start);
     }
 
-    bi->module_map = module_map; /* Temporary */
-
     /* Parse the command-line options. */
     if ( (kextra = strstr(bi->cmdline, " -- ")) != NULL )
     {
@@ -1216,8 +1214,7 @@ void asmlinkage __init noreturn __start_xen(void)
                bi->nr_modules);
     }
 
-    bitmap_fill(module_map, bi->nr_modules);
-    __clear_bit(0, module_map); /* Dom0 kernel is always first */
+    /* Dom0 kernel is always first */
     bi->mods[0].type = BOOTMOD_KERNEL;
 
     if ( pvh_boot )
@@ -2098,13 +2095,22 @@ void asmlinkage __init noreturn __start_xen(void)
            cpu_has_nx ? XENLOG_INFO : XENLOG_WARNING "Warning: ",
            cpu_has_nx ? "" : "not ");
 
-    initrdidx = find_first_bit(module_map, bi->nr_modules);
-    if ( initrdidx < bi->nr_modules )
+    /*
+     * At this point all capabilities that consume boot modules should have
+     * claimed their boot modules. Find the first unclaimed boot module and
+     * claim it as the initrd ramdisk. Do a second search to see if there are
+     * any remaining unclaimed boot modules, and report them as unusued initrd
+     * candidates.
+     */
+    initrdidx = first_boot_module_index(bi, BOOTMOD_UNKNOWN);
+    if ( initrdidx < MAX_NR_BOOTMODS )
+    {
         bi->mods[initrdidx].type = BOOTMOD_RAMDISK;
-    if ( bitmap_weight(module_map, bi->nr_modules) > 1 )
-        printk(XENLOG_WARNING
-               "Multiple initrd candidates, picking module #%u\n",
-               initrdidx);
+        if ( first_boot_module_index(bi, BOOTMOD_UNKNOWN) < MAX_NR_BOOTMODS )
+            printk(XENLOG_WARNING
+                   "Multiple initrd candidates, picking module #%u\n",
+                   initrdidx);
+    }
 
     /*
      * We're going to setup domain0 using the module(s) that we stashed safely
diff --git a/xen/xsm/xsm_policy.c b/xen/xsm/xsm_policy.c
index 4c195411d05b..12c9de5a1fbf 100644
--- a/xen/xsm/xsm_policy.c
+++ b/xen/xsm/xsm_policy.c
@@ -33,22 +33,18 @@
 int __init xsm_multiboot_policy_init(
     struct boot_info *bi, void **policy_buffer, size_t *policy_size)
 {
-    int i;
+    unsigned int i;
     int rc = 0;
     u32 *_policy_start;
     unsigned long _policy_len;
 
-    /*
-     * Try all modules and see whichever could be the binary policy.
-     * Adjust module_map for the module that is the binary policy.
-     */
-    for ( i = bi->nr_modules - 1; i >= 1; i-- )
+    /* Try all unknown modules and see whichever could be the binary policy. */
+    for_each_boot_module_by_type(i, bi, BOOTMOD_UNKNOWN)
     {
-        if ( !test_bit(i, bi->module_map) )
-            continue;
+        struct boot_module *bm = &bi->mods[i];
 
-        _policy_start = bootstrap_map(bi->mods[i].mod);
-        _policy_len   = bi->mods[i].mod->mod_end;
+        _policy_start = bootstrap_map(bm->mod);
+        _policy_len   = bm->mod->mod_end;
 
         if ( (xsm_magic_t)(*_policy_start) == XSM_MAGIC )
         {
@@ -58,8 +54,7 @@ int __init xsm_multiboot_policy_init(
             printk("Policy len %#lx, start at %p.\n",
                    _policy_len,_policy_start);
 
-            __clear_bit(i, bi->module_map);
-            bi->mods[i].type = BOOTMOD_XSM_POLICY;
+            bm->type = BOOTMOD_XSM_POLICY;
             break;
 
         }
-- 
2.30.2


