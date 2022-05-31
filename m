Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1B9538906
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 00:51:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338916.563763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvoEj-0003F5-MT; Mon, 30 May 2022 22:51:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338916.563763; Mon, 30 May 2022 22:51:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvoEj-0003Ci-GR; Mon, 30 May 2022 22:51:45 +0000
Received: by outflank-mailman (input) for mailman id 338916;
 Mon, 30 May 2022 22:51:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=epuh=WG=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nvo5z-0006Rh-OJ
 for xen-devel@lists.xenproject.org; Mon, 30 May 2022 22:42:44 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf2a065c-e069-11ec-bd2c-47488cf2e6aa;
 Tue, 31 May 2022 00:42:40 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1653950522594696.5498699912004;
 Mon, 30 May 2022 15:42:02 -0700 (PDT)
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
X-Inumbo-ID: cf2a065c-e069-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; t=1653950523; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=E/BunImJSl5fmbZFKPm/Ab/bh32c/HTZgu/DUPvDGyj8BuYI1UixOyD+xZU4QJG7pwaOlahwe8ygDuZ7YCAKx3SBmWDF/hGp7HlsXEijJLLqZB2pS6eYkYC/dRu+VtntrJ/T/uUGMkFuCsaXhhmdPr5co+GKzWRVDoqJmF019DQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1653950523; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=uWZhwVvs+kMg/Fm6P9a8fRK9wIT+9jMYCWMw8CQL0M0=; 
	b=WY0BN37i/RORGEsWjkDLf/NXj1bBVO3XMCXJQooB5fsW042MivY0NeCCQWQyLjqE+5xlAowwaYyUF3wHVsYkEcoMPtTJeZV12yCdL76v+pXUGP6Az0rhj1aOkuLKv5/yYpRjpqvzvhjMz+nuR9mJzUqTyJyjpkDluD3iSCZNMm8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1653950523;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=uWZhwVvs+kMg/Fm6P9a8fRK9wIT+9jMYCWMw8CQL0M0=;
	b=ofEpTkpvhNVYeIsq+XbWq3MdAgEmCBDxWQKQ4LUJXeT77AlcohC3IUyHp101QkLG
	smIia3M07LZ2eE+eWTTTRGOfUNwH8s3bDCTu6oFE8cda0mylemWHMbE40DI1qO9ER8W
	tmybM0RDqtYn/gwjT9NoRGHdUquJorKZs9114v1w=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org,
	Wei Liu <wl@xen.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io,
	christopher.clark@starlab.io,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: [RFC PATCH 3/4] x86: adopt new boot info structures
Date: Mon, 30 May 2022 22:41:25 -0400
Message-Id: <20220531024127.23669-4-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220531024127.23669-1-dpsmith@apertussolutions.com>
References: <20220531024127.23669-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This commit replaces the use of the multiboot v1 structures starting
at __start_xen(). The majority of this commit is converting the fields
being accessed for the startup calculations. While adapting the ucode
boot module location logic, this code was refactored to reduce some
of the unnecessary complexity.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/bzimage.c                |  16 +-
 xen/arch/x86/cpu/microcode/core.c     | 134 ++++++++------
 xen/arch/x86/dom0_build.c             |  13 +-
 xen/arch/x86/hvm/dom0_build.c         |  42 ++---
 xen/arch/x86/include/asm/bzimage.h    |   5 +-
 xen/arch/x86/include/asm/dom0_build.h |  15 +-
 xen/arch/x86/include/asm/setup.h      |  14 +-
 xen/arch/x86/pv/dom0_build.c          |  34 ++--
 xen/arch/x86/setup.c                  | 249 +++++++++++++++-----------
 xen/include/xen/bootinfo.h            |  47 +++++
 xen/include/xsm/xsm.h                 |  26 ++-
 xen/xsm/xsm_core.c                    |  22 ++-
 xen/xsm/xsm_policy.c                  |  44 ++---
 13 files changed, 391 insertions(+), 270 deletions(-)

diff --git a/xen/arch/x86/bzimage.c b/xen/arch/x86/bzimage.c
index ac4fd428be..c742a04687 100644
--- a/xen/arch/x86/bzimage.c
+++ b/xen/arch/x86/bzimage.c
@@ -69,10 +69,8 @@ static __init int bzimage_check(struct setup_header *hdr, unsigned long len)
     return 1;
 }
 
-static unsigned long __initdata orig_image_len;
-
-unsigned long __init bzimage_headroom(void *image_start,
-                                      unsigned long image_length)
+unsigned long __init bzimage_headroom(
+    void *image_start, unsigned long image_length)
 {
     struct setup_header *hdr = (struct setup_header *)image_start;
     int err;
@@ -91,7 +89,6 @@ unsigned long __init bzimage_headroom(void *image_start,
     if ( elf_is_elfbinary(image_start, image_length) )
         return 0;
 
-    orig_image_len = image_length;
     headroom = output_length(image_start, image_length);
     if (gzip_check(image_start, image_length))
     {
@@ -104,12 +101,15 @@ unsigned long __init bzimage_headroom(void *image_start,
     return headroom;
 }
 
-int __init bzimage_parse(void *image_base, void **image_start,
-                         unsigned long *image_len)
+int __init bzimage_parse(
+    void *image_base, void **image_start, unsigned int headroom,
+    unsigned long *image_len)
 {
     struct setup_header *hdr = (struct setup_header *)(*image_start);
     int err = bzimage_check(hdr, *image_len);
-    unsigned long output_len;
+    unsigned long output_len, orig_image_len;
+
+    orig_image_len = *image_len - headroom;
 
     if ( err < 0 )
         return err;
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 452a7ca773..f773eb89e8 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -22,6 +22,7 @@
  */
 
 #include <xen/alternative-call.h>
+#include <xen/bootinfo.h>
 #include <xen/cpu.h>
 #include <xen/earlycpio.h>
 #include <xen/err.h>
@@ -32,6 +33,7 @@
 #include <xen/stop_machine.h>
 #include <xen/watchdog.h>
 
+
 #include <asm/apic.h>
 #include <asm/delay.h>
 #include <asm/nmi.h>
@@ -54,7 +56,6 @@
  */
 #define MICROCODE_UPDATE_TIMEOUT_US 1000000
 
-static module_t __initdata ucode_mod;
 static signed int __initdata ucode_mod_idx;
 static bool_t __initdata ucode_mod_forced;
 static unsigned int nr_cores;
@@ -147,74 +148,113 @@ static int __init cf_check parse_ucode(const char *s)
 }
 custom_param("ucode", parse_ucode);
 
-void __init microcode_scan_module(
-    unsigned long *module_map,
-    const multiboot_info_t *mbi)
+#define MICROCODE_MODULE_MATCH 1
+#define MICROCODE_MODULE_NONMATCH 0
+
+static int __init microcode_check_module(struct boot_module *mod)
 {
-    module_t *mod = (module_t *)__va(mbi->mods_addr);
     uint64_t *_blob_start;
     unsigned long _blob_size;
-    struct cpio_data cd;
+    struct cpio_data cd = { NULL, 0 };
     long offset;
     const char *p = NULL;
-    int i;
-
-    ucode_blob.size = 0;
-    if ( !ucode_scan )
-        return;
 
     if ( boot_cpu_data.x86_vendor == X86_VENDOR_AMD )
         p = "kernel/x86/microcode/AuthenticAMD.bin";
     else if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
         p = "kernel/x86/microcode/GenuineIntel.bin";
     else
+        return -EFAULT;
+
+    _blob_start = bootstrap_map(mod);
+    _blob_size = mod->size;
+    if ( !_blob_start )
+    {
+        printk("Could not map multiboot module (0x%lx) (size: %ld)\n",
+               mod->start, _blob_size);
+        /* Non-fatal error, so just say no match */
+        return MICROCODE_MODULE_NONMATCH;
+    }
+
+    cd = find_cpio_data(p, _blob_start, _blob_size, &offset /* ignore */);
+
+    if ( cd.data )
+    {
+        ucode_blob.size = cd.size;
+        ucode_blob.data = cd.data;
+
+        mod->kind = BOOTMOD_UCODE;
+        return MICROCODE_MODULE_MATCH;
+    }
+
+    bootstrap_map(NULL);
+
+    return 0;
+}
+
+void __init microcode_scan_module(struct boot_info *bi)
+{
+    int idx = 0;
+
+    if ( !ucode_scan )
         return;
 
     /*
-     * Try all modules and see whichever could be the microcode blob.
+     * Try unidentified modules and see which could be the microcode blob.
      */
-    for ( i = 1 /* Ignore dom0 kernel */; i < mbi->mods_count; i++ )
+    idx = bootmodule_next_idx_by_kind(bi, BOOTMOD_UNKNOWN, idx);
+    while ( idx < bi->nr_mods )
     {
-        if ( !test_bit(i, module_map) )
-            continue;
+        int ret;
 
-        _blob_start = bootstrap_map(&mod[i]);
-        _blob_size = mod[i].mod_end;
-        if ( !_blob_start )
+        ret = microcode_check_module(&bi->mods[idx]);
+        switch ( ret )
         {
-            printk("Could not map multiboot module #%d (size: %ld)\n",
-                   i, _blob_size);
+        case MICROCODE_MODULE_MATCH:
+            return;
+        case MICROCODE_MODULE_NONMATCH:
+            idx = bootmodule_next_idx_by_kind(bi, BOOTMOD_UNKNOWN, ++idx);
             continue;
+        default:
+            printk("%s: (err: %d) unable to check microcode\n",
+                   __func__, ret);
+            return;
         }
-        cd.data = NULL;
-        cd.size = 0;
-        cd = find_cpio_data(p, _blob_start, _blob_size, &offset /* ignore */);
-        if ( cd.data )
-        {
-            ucode_blob.size = cd.size;
-            ucode_blob.data = cd.data;
-            break;
-        }
-        bootstrap_map(NULL);
     }
 }
-void __init microcode_grab_module(
-    unsigned long *module_map,
-    const multiboot_info_t *mbi)
+
+void __init microcode_grab_module(struct boot_info *bi)
 {
-    module_t *mod = (module_t *)__va(mbi->mods_addr);
+    ucode_blob.size = 0;
 
     if ( ucode_mod_idx < 0 )
-        ucode_mod_idx += mbi->mods_count;
-    if ( ucode_mod_idx <= 0 || ucode_mod_idx >= mbi->mods_count ||
-         !__test_and_clear_bit(ucode_mod_idx, module_map) )
-        goto scan;
-    ucode_mod = mod[ucode_mod_idx];
-scan:
+        ucode_mod_idx += bi->nr_mods;
+    if ( ucode_mod_idx >= 0 &&  ucode_mod_idx <= bi->nr_mods &&
+         bi->mods[ucode_mod_idx].kind == BOOTMOD_UNKNOWN )
+    {
+        int ret = microcode_check_module(&bi->mods[ucode_mod_idx]);
+
+        switch ( ret )
+        {
+        case MICROCODE_MODULE_MATCH:
+            return;
+        case MICROCODE_MODULE_NONMATCH:
+            break;
+        default:
+            printk("%s: (err: %d) unable to check microcode\n",
+                   __func__, ret);
+            return;
+        }
+    }
+
     if ( ucode_scan )
-        microcode_scan_module(module_map, mbi);
+        microcode_scan_module(bi);
 }
 
+/* Undefining as they are not needed anymore */
+#undef MICROCODE_MODULE_MATCH
+#undef MICROCODE_MODULE_NONMATCH
+
 static struct microcode_ops __ro_after_init ucode_ops;
 
 static DEFINE_SPINLOCK(microcode_mutex);
@@ -711,11 +751,6 @@ static int __init cf_check microcode_init(void)
         ucode_blob.size = 0;
         ucode_blob.data = NULL;
     }
-    else if ( ucode_mod.mod_end )
-    {
-        bootstrap_map(NULL);
-        ucode_mod.mod_end = 0;
-    }
 
     return 0;
 }
@@ -745,11 +780,6 @@ static int __init early_microcode_update_cpu(void)
         len = ucode_blob.size;
         data = ucode_blob.data;
     }
-    else if ( ucode_mod.mod_end )
-    {
-        len = ucode_mod.mod_end;
-        data = bootstrap_map(&ucode_mod);
-    }
 
     if ( !data )
         return -ENOMEM;
@@ -799,7 +829,7 @@ int __init early_microcode_init(void)
 
     alternative_vcall(ucode_ops.collect_cpu_info);
 
-    if ( ucode_mod.mod_end || ucode_blob.size )
+    if ( ucode_blob.size )
         rc = early_microcode_update_cpu();
 
     return rc;
diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 79234f18ff..5a27e50e32 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -1,9 +1,10 @@
 /******************************************************************************
  * dom0_build.c
- * 
+ *
  * Copyright (c) 2002-2005, K A Fraser
  */
 
+#include <xen/bootinfo.h>
 #include <xen/init.h>
 #include <xen/iocap.h>
 #include <xen/libelf.h>
@@ -574,9 +575,9 @@ int __init dom0_setup_permissions(struct domain *d)
     return rc;
 }
 
-int __init construct_dom0(struct domain *d, const module_t *image,
-                          unsigned long image_headroom, module_t *initrd,
-                          char *cmdline)
+int __init construct_dom0(
+    struct domain *d, const struct boot_module *image,
+    struct boot_module *initrd, char *cmdline)
 {
     int rc;
 
@@ -588,9 +589,9 @@ int __init construct_dom0(struct domain *d, const module_t *image,
     process_pending_softirqs();
 
     if ( is_hvm_domain(d) )
-        rc = dom0_construct_pvh(d, image, image_headroom, initrd, cmdline);
+        rc = dom0_construct_pvh(d, image, initrd, cmdline);
     else if ( is_pv_domain(d) )
-        rc = dom0_construct_pv(d, image, image_headroom, initrd, cmdline);
+        rc = dom0_construct_pv(d, image, initrd, cmdline);
     else
         panic("Cannot construct Dom0. No guest interface available\n");
 
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 1864d048a1..4e903a848d 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -19,9 +19,9 @@
  */
 
 #include <xen/acpi.h>
+#include <xen/bootinfo.h>
 #include <xen/init.h>
 #include <xen/libelf.h>
-#include <xen/multiboot.h>
 #include <xen/pci.h>
 #include <xen/softirq.h>
 
@@ -543,14 +543,13 @@ static paddr_t __init find_memory(
     return INVALID_PADDR;
 }
 
-static int __init pvh_load_kernel(struct domain *d, const module_t *image,
-                                  unsigned long image_headroom,
-                                  module_t *initrd, void *image_base,
-                                  char *cmdline, paddr_t *entry,
-                                  paddr_t *start_info_addr)
+static int __init pvh_load_kernel(
+    struct domain *d, const struct boot_module *image,
+    struct boot_module *initrd, void *image_base, char *cmdline,
+    paddr_t *entry, paddr_t *start_info_addr)
 {
-    void *image_start = image_base + image_headroom;
-    unsigned long image_len = image->mod_end;
+    void *image_start = image_base + image->arch->headroom;
+    unsigned long image_len = image->size;
     struct elf_binary elf;
     struct elf_dom_parms parms;
     paddr_t last_addr;
@@ -559,7 +558,9 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
     struct vcpu *v = d->vcpu[0];
     int rc;
 
-    if ( (rc = bzimage_parse(image_base, &image_start, &image_len)) != 0 )
+    if ( (rc =
+          bzimage_parse(image_base, &image_start, image->arch->headroom,
+                         &image_len)) != 0 )
     {
         printk("Error trying to detect bz compressed kernel\n");
         return rc;
@@ -606,7 +607,7 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
      * simplify it.
      */
     last_addr = find_memory(d, &elf, sizeof(start_info) +
-                            (initrd ? ROUNDUP(initrd->mod_end, PAGE_SIZE) +
+                            (initrd ? ROUNDUP(initrd->size, PAGE_SIZE) +
                                       sizeof(mod)
                                     : 0) +
                             (cmdline ? ROUNDUP(strlen(cmdline) + 1,
@@ -620,8 +621,8 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
 
     if ( initrd != NULL )
     {
-        rc = hvm_copy_to_guest_phys(last_addr, mfn_to_virt(initrd->mod_start),
-                                    initrd->mod_end, v);
+        rc = hvm_copy_to_guest_phys(last_addr, maddr_to_virt(initrd->start),
+                                    initrd->size, v);
         if ( rc )
         {
             printk("Unable to copy initrd to guest\n");
@@ -629,11 +630,11 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
         }
 
         mod.paddr = last_addr;
-        mod.size = initrd->mod_end;
-        last_addr += ROUNDUP(initrd->mod_end, elf_64bit(&elf) ? 8 : 4);
-        if ( initrd->string )
+        mod.size = initrd->size;
+        last_addr += ROUNDUP(initrd->size, elf_64bit(&elf) ? 8 : 4);
+        if ( initrd->string.kind == BOOTSTR_CMDLINE )
         {
-            char *str = __va(initrd->string);
+            char *str = initrd->string.bytes;
             size_t len = strlen(str) + 1;
 
             rc = hvm_copy_to_guest_phys(last_addr, str, len, v);
@@ -1216,10 +1217,9 @@ static void __hwdom_init pvh_setup_mmcfg(struct domain *d)
     }
 }
 
-int __init dom0_construct_pvh(struct domain *d, const module_t *image,
-                              unsigned long image_headroom,
-                              module_t *initrd,
-                              char *cmdline)
+int __init dom0_construct_pvh(
+    struct domain *d, const struct boot_module *image,
+    struct boot_module *initrd, char *cmdline)
 {
     paddr_t entry, start_info;
     int rc;
@@ -1249,7 +1249,7 @@ int __init dom0_construct_pvh(struct domain *d, const module_t *image,
         return rc;
     }
 
-    rc = pvh_load_kernel(d, image, image_headroom, initrd, bootstrap_map(image),
+    rc = pvh_load_kernel(d, image, initrd, bootstrap_map(image),
                          cmdline, &entry, &start_info);
     if ( rc )
     {
diff --git a/xen/arch/x86/include/asm/bzimage.h b/xen/arch/x86/include/asm/bzimage.h
index 7ed69d3910..5a5a25b4d7 100644
--- a/xen/arch/x86/include/asm/bzimage.h
+++ b/xen/arch/x86/include/asm/bzimage.h
@@ -5,7 +5,8 @@
 
 unsigned long bzimage_headroom(void *image_start, unsigned long image_length);
 
-int bzimage_parse(void *image_base, void **image_start,
-                  unsigned long *image_len);
+int bzimage_parse(
+    void *image_base, void **image_start, unsigned int headroom,
+    unsigned long *image_len);
 
 #endif /* __X86_BZIMAGE_H__ */
diff --git a/xen/arch/x86/include/asm/dom0_build.h b/xen/arch/x86/include/asm/dom0_build.h
index a5f8c9e67f..ad33413710 100644
--- a/xen/arch/x86/include/asm/dom0_build.h
+++ b/xen/arch/x86/include/asm/dom0_build.h
@@ -1,6 +1,7 @@
 #ifndef _DOM0_BUILD_H_
 #define _DOM0_BUILD_H_
 
+#include <xen/bootinfo.h>
 #include <xen/libelf.h>
 #include <xen/sched.h>
 
@@ -13,15 +14,13 @@ unsigned long dom0_compute_nr_pages(struct domain *d,
                                     unsigned long initrd_len);
 int dom0_setup_permissions(struct domain *d);
 
-int dom0_construct_pv(struct domain *d, const module_t *image,
-                      unsigned long image_headroom,
-                      module_t *initrd,
-                      char *cmdline);
+int __init dom0_construct_pv(
+    struct domain *d, const struct boot_module *image,
+    struct boot_module *initrd, char *cmdline);
 
-int dom0_construct_pvh(struct domain *d, const module_t *image,
-                       unsigned long image_headroom,
-                       module_t *initrd,
-                       char *cmdline);
+int __init dom0_construct_pvh(
+    struct domain *d, const struct boot_module *image,
+    struct boot_module *initrd, char *cmdline);
 
 unsigned long dom0_paging_pages(const struct domain *d,
                                 unsigned long nr_pages);
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index 21037b7f31..11bdfc5723 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -1,7 +1,8 @@
 #ifndef __X86_SETUP_H_
 #define __X86_SETUP_H_
 
-#include <xen/multiboot.h>
+#include <xen/bootinfo.h>
+
 #include <asm/numa.h>
 
 extern const char __2M_text_start[], __2M_text_end[];
@@ -33,20 +34,17 @@ static inline void vesa_init(void) {};
 #endif
 
 int construct_dom0(
-    struct domain *d,
-    const module_t *kernel, unsigned long kernel_headroom,
-    module_t *initrd,
-    char *cmdline);
+    struct domain *d, const struct boot_module *image,
+    struct boot_module *initrd, char *cmdline);
 void setup_io_bitmap(struct domain *d);
 
 unsigned long initial_images_nrpages(nodeid_t node);
 void discard_initial_images(void);
-void *bootstrap_map(const module_t *mod);
+void *bootstrap_map(const struct boot_module *mod);
 
 int xen_in_range(unsigned long mfn);
 
-void microcode_grab_module(
-    unsigned long *, const multiboot_info_t *);
+void __init microcode_grab_module(struct boot_info *bi);
 
 extern uint8_t kbd_shift_flags;
 
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index e501979a86..f6131147ef 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2002-2005, K A Fraser
  */
 
+#include <xen/bootinfo.h>
 #include <xen/console.h>
 #include <xen/domain.h>
 #include <xen/domain_page.h>
@@ -294,11 +295,9 @@ static struct page_info * __init alloc_chunk(struct domain *d,
     return page;
 }
 
-int __init dom0_construct_pv(struct domain *d,
-                             const module_t *image,
-                             unsigned long image_headroom,
-                             module_t *initrd,
-                             char *cmdline)
+int __init dom0_construct_pv(
+    struct domain *d, const struct boot_module *image,
+    struct boot_module *initrd, char *cmdline)
 {
     int i, rc, order, machine;
     bool compatible, compat;
@@ -314,9 +313,9 @@ int __init dom0_construct_pv(struct domain *d,
     start_info_t *si;
     struct vcpu *v = d->vcpu[0];
     void *image_base = bootstrap_map(image);
-    unsigned long image_len = image->mod_end;
-    void *image_start = image_base + image_headroom;
-    unsigned long initrd_len = initrd ? initrd->mod_end : 0;
+    unsigned long image_len = image->size;
+    void *image_start = image_base + image->arch->headroom;
+    unsigned long initrd_len = initrd ? initrd->size : 0;
     l4_pgentry_t *l4tab = NULL, *l4start = NULL;
     l3_pgentry_t *l3tab = NULL, *l3start = NULL;
     l2_pgentry_t *l2tab = NULL, *l2start = NULL;
@@ -355,7 +354,9 @@ int __init dom0_construct_pv(struct domain *d,
 
     d->max_pages = ~0U;
 
-    if ( (rc = bzimage_parse(image_base, &image_start, &image_len)) != 0 )
+    if ( (rc =
+          bzimage_parse(image_base, &image_start, image->arch->headroom,
+                         &image_len)) != 0 )
         return rc;
 
     if ( (rc = elf_init(&elf, image_start, image_len)) != 0 )
@@ -544,7 +545,7 @@ int __init dom0_construct_pv(struct domain *d,
         initrd_pfn = vinitrd_start ?
                      (vinitrd_start - v_start) >> PAGE_SHIFT :
                      domain_tot_pages(d);
-        initrd_mfn = mfn = initrd->mod_start;
+        initrd_mfn = mfn = mfn_x(initrd->mfn);
         count = PFN_UP(initrd_len);
         if ( d->arch.physaddr_bitsize &&
              ((mfn + count - 1) >> (d->arch.physaddr_bitsize - PAGE_SHIFT)) )
@@ -559,12 +560,13 @@ int __init dom0_construct_pv(struct domain *d,
                     free_domheap_pages(page, order);
                     page += 1UL << order;
                 }
-            memcpy(page_to_virt(page), mfn_to_virt(initrd->mod_start),
+            memcpy(page_to_virt(page), maddr_to_virt(initrd->start),
                    initrd_len);
-            mpt_alloc = (paddr_t)initrd->mod_start << PAGE_SHIFT;
+            mpt_alloc = initrd->start;
             init_domheap_pages(mpt_alloc,
                                mpt_alloc + PAGE_ALIGN(initrd_len));
-            initrd->mod_start = initrd_mfn = mfn_x(page_to_mfn(page));
+            bootmodule_update_mfn(initrd, page_to_mfn(page));
+            initrd_mfn = mfn_x(initrd->mfn);
         }
         else
         {
@@ -572,7 +574,7 @@ int __init dom0_construct_pv(struct domain *d,
                 if ( assign_pages(mfn_to_page(_mfn(mfn++)), 1, d, 0) )
                     BUG();
         }
-        initrd->mod_end = 0;
+        initrd->size = 0;
     }
 
     printk("PHYSICAL MEMORY ARRANGEMENT:\n"
@@ -583,7 +585,7 @@ int __init dom0_construct_pv(struct domain *d,
                nr_pages - domain_tot_pages(d));
     if ( initrd )
     {
-        mpt_alloc = (paddr_t)initrd->mod_start << PAGE_SHIFT;
+        mpt_alloc = initrd->start;
         printk("\n Init. ramdisk: %"PRIpaddr"->%"PRIpaddr,
                mpt_alloc, mpt_alloc + initrd_len);
     }
@@ -804,7 +806,7 @@ int __init dom0_construct_pv(struct domain *d,
         if ( pfn >= initrd_pfn )
         {
             if ( pfn < initrd_pfn + PFN_UP(initrd_len) )
-                mfn = initrd->mod_start + (pfn - initrd_pfn);
+                mfn = mfn_x(initrd->mfn) + (pfn - initrd_pfn);
             else
                 mfn -= PFN_UP(initrd_len);
         }
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 3f5e602e00..a7bf698d52 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1,3 +1,4 @@
+#include <xen/bootinfo.h>
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/err.h>
@@ -271,8 +272,48 @@ static int __init cf_check parse_acpi_param(const char *s)
 }
 custom_param("acpi", parse_acpi_param);
 
-static const module_t *__initdata initial_images;
-static unsigned int __initdata nr_initial_images;
+struct boot_info __initdata *boot_info;
+
+static struct boot_info       __initdata x86_bi;
+static struct arch_boot_info  __initdata x86_bi_arch;
+static struct boot_module     __initdata x86_mods[CONFIG_NR_BOOTMODS + 1];
+static struct arch_bootmodule __initdata x86_arch_mods[CONFIG_NR_BOOTMODS + 1];
+
+static void __init mb_to_bootinfo(multiboot_info_t *mbi, module_t *mods)
+{
+    int i;
+
+    x86_bi.arch = &x86_bi_arch;
+    x86_bi.mods = x86_mods;
+
+    x86_bi.cmdline = __va(mbi->cmdline);
+
+    /* The BOOTINFO_FLAG_X86_* flags are a 1-1 map to MBI_* */
+    x86_bi_arch.flags = mbi->flags;
+    x86_bi_arch.mem_upper = mbi->mem_upper;
+    x86_bi_arch.mem_lower = mbi->mem_lower;
+    x86_bi_arch.mmap_length = mbi->mmap_length;
+    x86_bi_arch.mmap_addr = mbi->mmap_addr;
+    x86_bi_arch.boot_loader_name = __va(mbi->boot_loader_name);
+
+    x86_bi.nr_mods = mbi->mods_count;
+    for ( i = 0; i <= CONFIG_NR_BOOTMODS; i++)
+    {
+        x86_mods[i].arch = &x86_arch_mods[i];
+
+        if ( i < x86_bi.nr_mods )
+        {
+            bootmodule_update_start(&x86_mods[i], mods[i].mod_start);
+            x86_mods[i].size = mods[i].mod_end - mods[i].mod_start;
+
+            x86_mods[i].string.len = strlcpy(x86_mods[i].string.bytes,
+                                              __va(mods[i].string),
+                                              BOOTMOD_MAX_STRING);
+        }
+    }
+
+    boot_info = &x86_bi;
+}
 
 unsigned long __init initial_images_nrpages(nodeid_t node)
 {
@@ -281,10 +322,10 @@ unsigned long __init initial_images_nrpages(nodeid_t node)
     unsigned long nr;
     unsigned int i;
 
-    for ( nr = i = 0; i < nr_initial_images; ++i )
+    for ( nr = i = 0; i < boot_info->nr_mods; ++i )
     {
-        unsigned long start = initial_images[i].mod_start;
-        unsigned long end = start + PFN_UP(initial_images[i].mod_end);
+        unsigned long start = mfn_x(boot_info->mods[i].mfn);
+        unsigned long end = start + PFN_UP(boot_info->mods[i].size);
 
         if ( end > node_start && node_end > start )
             nr += min(node_end, end) - max(node_start, start);
@@ -297,16 +338,15 @@ void __init discard_initial_images(void)
 {
     unsigned int i;
 
-    for ( i = 0; i < nr_initial_images; ++i )
+    for ( i = 0; i < boot_info->nr_mods; ++i )
     {
-        uint64_t start = (uint64_t)initial_images[i].mod_start << PAGE_SHIFT;
+        uint64_t start = (uint64_t)boot_info->mods[i].start;
 
         init_domheap_pages(start,
-                           start + PAGE_ALIGN(initial_images[i].mod_end));
+                           start + PAGE_ALIGN(boot_info->mods[i].size));
     }
 
-    nr_initial_images = 0;
-    initial_images = NULL;
+    boot_info->nr_mods = 0;
 }
 
 extern char __init_begin[], __init_end[], __bss_start[], __bss_end[];
@@ -393,14 +433,14 @@ static void __init normalise_cpu_order(void)
  * Ensure a given physical memory range is present in the bootstrap mappings.
  * Use superpage mappings to ensure that pagetable memory needn't be allocated.
  */
-void *__init bootstrap_map(const module_t *mod)
+void *__init bootstrap_map(const struct boot_module *mod)
 {
     static unsigned long __initdata map_cur = BOOTSTRAP_MAP_BASE;
     uint64_t start, end, mask = (1L << L2_PAGETABLE_SHIFT) - 1;
     void *ret;
 
     if ( system_state != SYS_STATE_early_boot )
-        return mod ? mfn_to_virt(mod->mod_start) : NULL;
+        return mod ? maddr_to_virt(mod->start) : NULL;
 
     if ( !mod )
     {
@@ -409,8 +449,8 @@ void *__init bootstrap_map(const module_t *mod)
         return NULL;
     }
 
-    start = (uint64_t)mod->mod_start << PAGE_SHIFT;
-    end = start + mod->mod_end;
+    start = (uint64_t)mod->start;
+    end = start + mod->size;
     if ( start >= end )
         return NULL;
 
@@ -437,25 +477,25 @@ static void *__init move_memory(
 
     while ( size )
     {
-        module_t mod;
+        struct boot_module mod;
         unsigned int soffs = src & mask;
         unsigned int doffs = dst & mask;
         unsigned int sz;
         void *d, *s;
 
-        mod.mod_start = (src - soffs) >> PAGE_SHIFT;
-        mod.mod_end = soffs + size;
-        if ( mod.mod_end > blksz )
-            mod.mod_end = blksz;
-        sz = mod.mod_end - soffs;
+        mod.start = src - soffs;
+        mod.size = soffs + size;
+        if ( mod.size > blksz )
+            mod.size = blksz;
+        sz = mod.size - soffs;
         s = bootstrap_map(&mod);
 
-        mod.mod_start = (dst - doffs) >> PAGE_SHIFT;
-        mod.mod_end = doffs + size;
-        if ( mod.mod_end > blksz )
-            mod.mod_end = blksz;
-        if ( sz > mod.mod_end - doffs )
-            sz = mod.mod_end - doffs;
+        mod.start = dst - doffs;
+        mod.size = doffs + size;
+        if ( mod.size > blksz )
+            mod.size = blksz;
+        if ( sz > mod.size - doffs )
+            sz = mod.size - doffs;
         d = bootstrap_map(&mod);
 
         memmove(d + doffs, s + soffs, sz);
@@ -476,7 +516,7 @@ static void *__init move_memory(
 #undef BOOTSTRAP_MAP_LIMIT
 
 static uint64_t __init consider_modules(
-    uint64_t s, uint64_t e, uint32_t size, const module_t *mod,
+    uint64_t s, uint64_t e, uint32_t size, const struct boot_module *mod,
     unsigned int nr_mods, unsigned int this_mod)
 {
     unsigned int i;
@@ -486,8 +526,8 @@ static uint64_t __init consider_modules(
 
     for ( i = 0; i < nr_mods ; ++i )
     {
-        uint64_t start = (uint64_t)mod[i].mod_start << PAGE_SHIFT;
-        uint64_t end = start + PAGE_ALIGN(mod[i].mod_end);
+        uint64_t start = (uint64_t)mod[i].start;
+        uint64_t end = start + PAGE_ALIGN(mod[i].size);
 
         if ( i == this_mod )
             continue;
@@ -753,10 +793,8 @@ static unsigned int __init copy_bios_e820(struct e820entry *map, unsigned int li
     return n;
 }
 
-static struct domain *__init create_dom0(const module_t *image,
-                                         unsigned long headroom,
-                                         module_t *initrd, const char *kextra,
-                                         const char *loader)
+static struct domain *__init create_dom0(
+    const struct boot_info *bi, const char *kextra, const char *loader)
 {
     struct xen_domctl_createdomain dom0_cfg = {
         .flags = IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integrity : 0,
@@ -769,9 +807,14 @@ static struct domain *__init create_dom0(const module_t *image,
             .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
         },
     };
+    struct boot_module *image = bootmodule_next_by_kind(bi, BOOTMOD_KERNEL, 0);
+    struct boot_module *initrd = bootmodule_next_by_kind(bi, BOOTMOD_RAMDISK, 0);
     struct domain *d;
     char *cmdline;
-    domid_t domid;
+    domid_t domid = 0;
+
+    if ( image == NULL )
+        panic("Error creating d%uv0\n", domid);
 
     if ( opt_dom0_pvh )
     {
@@ -798,7 +841,8 @@ static struct domain *__init create_dom0(const module_t *image,
         panic("Error creating d%uv0\n", domid);
 
     /* Grab the DOM0 command line. */
-    cmdline = image->string ? __va(image->string) : NULL;
+    cmdline = (image->string.kind == BOOTSTR_CMDLINE) ?
+              image->string.bytes : NULL;
     if ( cmdline || kextra )
     {
         static char __initdata dom0_cmdline[MAX_GUEST_CMDLINE];
@@ -838,7 +882,7 @@ static struct domain *__init create_dom0(const module_t *image,
         write_cr4(read_cr4() & ~X86_CR4_SMAP);
     }
 
-    if ( construct_dom0(d, image, headroom, initrd, cmdline) != 0 )
+    if ( construct_dom0(d, image, initrd, cmdline) != 0 )
         panic("Could not construct domain 0\n");
 
     if ( cpu_has_smap )
@@ -862,7 +906,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
     unsigned int initrdidx, num_parked = 0;
     multiboot_info_t *mbi;
     module_t *mod;
-    unsigned long nr_pages, raw_max_page, modules_headroom, module_map[1];
+    unsigned long nr_pages, raw_max_page;
     int i, j, e820_warn = 0, bytes = 0;
     unsigned long eb_start, eb_end;
     bool acpi_boot_table_init_done = false, relocated = false;
@@ -907,12 +951,14 @@ void __init noreturn __start_xen(unsigned long mbi_p)
         mod = __va(mbi->mods_addr);
     }
 
-    loader = (mbi->flags & MBI_LOADERNAME)
-        ? (char *)__va(mbi->boot_loader_name) : "unknown";
+    mb_to_bootinfo(mbi, mod);
+
+    loader = (boot_info->arch->flags & BOOTINFO_FLAG_X86_LOADERNAME)
+        ? boot_info->arch->boot_loader_name : "unknown";
 
     /* Parse the command-line options. */
-    cmdline = cmdline_cook((mbi->flags & MBI_CMDLINE) ?
-                           __va(mbi->cmdline) : NULL,
+    cmdline = cmdline_cook((boot_info->arch->flags & BOOTINFO_FLAG_X86_CMDLINE) ?
+                            boot_info->cmdline : NULL,
                            loader);
     if ( (kextra = strstr(cmdline, " -- ")) != NULL )
     {
@@ -1013,19 +1059,22 @@ void __init noreturn __start_xen(unsigned long mbi_p)
            bootsym(boot_edd_info_nr));
 
     /* Check that we have at least one Multiboot module. */
-    if ( !(mbi->flags & MBI_MODULES) || (mbi->mods_count == 0) )
+    if ( !(boot_info->arch->flags & BOOTINFO_FLAG_X86_MODULES) ||
+         (boot_info->nr_mods == 0) )
         panic("dom0 kernel not specified. Check bootloader configuration\n");
 
     /* Check that we don't have a silly number of modules. */
-    if ( mbi->mods_count > CONFIG_NR_BOOTMODS )
+    if ( boot_info->nr_mods > CONFIG_NR_BOOTMODS )
     {
-        mbi->mods_count = CONFIG_NR_BOOTMODS;
+        boot_info->nr_mods = CONFIG_NR_BOOTMODS ;
         printk("Excessive multiboot modules - using the first %u only\n",
-               mbi->mods_count);
+               boot_info->nr_mods);
     }
 
-    bitmap_fill(module_map, mbi->mods_count);
-    __clear_bit(0, module_map); /* Dom0 kernel is always first */
+    /* Dom0 kernel is the first boot module */
+    boot_info->mods[0].kind = BOOTMOD_KERNEL;
+    if ( boot_info->mods[0].string.len )
+        boot_info->mods[0].string.kind = BOOTSTR_CMDLINE;
 
     if ( pvh_boot )
     {
@@ -1049,19 +1098,19 @@ void __init noreturn __start_xen(unsigned long mbi_p)
     }
     else if ( efi_enabled(EFI_BOOT) )
         memmap_type = "EFI";
-    else if ( (e820_raw.nr_map = 
+    else if ( (e820_raw.nr_map =
                    copy_bios_e820(e820_raw.map,
                                   ARRAY_SIZE(e820_raw.map))) != 0 )
     {
         memmap_type = "Xen-e820";
     }
-    else if ( mbi->flags & MBI_MEMMAP )
+    else if ( boot_info->arch->flags & BOOTINFO_FLAG_X86_MEMMAP )
     {
         memmap_type = "Multiboot-e820";
-        while ( bytes < mbi->mmap_length &&
+        while ( bytes < boot_info->arch->mmap_length &&
                 e820_raw.nr_map < ARRAY_SIZE(e820_raw.map) )
         {
-            memory_map_t *map = __va(mbi->mmap_addr + bytes);
+            struct mb_memmap *map = __va(boot_info->arch->mmap_addr + bytes);
 
             /*
              * This is a gross workaround for a BIOS bug. Some bootloaders do
@@ -1162,17 +1211,9 @@ void __init noreturn __start_xen(unsigned long mbi_p)
     set_kexec_crash_area_size((u64)nr_pages << PAGE_SHIFT);
     kexec_reserve_area(&boot_e820);
 
-    initial_images = mod;
-    nr_initial_images = mbi->mods_count;
-
-    for ( i = 0; !efi_enabled(EFI_LOADER) && i < mbi->mods_count; i++ )
-    {
-        if ( mod[i].mod_start & (PAGE_SIZE - 1) )
+    for ( i = 0; !efi_enabled(EFI_LOADER) && i < boot_info->nr_mods; i++ )
+        if ( boot_info->mods[i].start & (PAGE_SIZE - 1) )
             panic("Bootloader didn't honor module alignment request\n");
-        mod[i].mod_end -= mod[i].mod_start;
-        mod[i].mod_start >>= PAGE_SHIFT;
-        mod[i].reserved = 0;
-    }
 
     if ( xen_phys_start )
     {
@@ -1183,11 +1224,14 @@ void __init noreturn __start_xen(unsigned long mbi_p)
          * respective reserve_e820_ram() invocation below. No need to
          * query efi_boot_mem_unused() here, though.
          */
-        mod[mbi->mods_count].mod_start = virt_to_mfn(_stext);
-        mod[mbi->mods_count].mod_end = __2M_rwdata_end - _stext;
+        bootmodule_update_start(&boot_info->mods[boot_info->nr_mods],
+                                virt_to_maddr(_stext));
+        boot_info->mods[boot_info->nr_mods].size = __2M_rwdata_end - _stext;
     }
 
-    modules_headroom = bzimage_headroom(bootstrap_map(mod), mod->mod_end);
+    boot_info->mods[0].arch->headroom = bzimage_headroom(
+                                        bootstrap_map(&boot_info->mods[0]),
+                                        boot_info->mods[0].size);
     bootstrap_map(NULL);
 
 #ifndef highmem_start
@@ -1244,7 +1288,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
         {
             /* Don't overlap with modules. */
             end = consider_modules(s, e, reloc_size + mask,
-                                   mod, mbi->mods_count, -1);
+                                   boot_info->mods, boot_info->nr_mods, -1);
             end &= ~mask;
         }
         else
@@ -1348,31 +1392,32 @@ void __init noreturn __start_xen(unsigned long mbi_p)
         }
 
         /* Is the region suitable for relocating the multiboot modules? */
-        for ( j = mbi->mods_count - 1; j >= 0; j-- )
+        for ( j = boot_info->nr_mods - 1; j >= 0; j-- )
         {
-            unsigned long headroom = j ? 0 : modules_headroom;
-            unsigned long size = PAGE_ALIGN(headroom + mod[j].mod_end);
+            struct boot_module *mod = boot_info->mods;
+            unsigned long headroom = mod[j].arch->headroom;
+            unsigned long size = PAGE_ALIGN(headroom + mod[j].size);
 
-            if ( mod[j].reserved )
+            if ( mod[j].arch->flags & BOOTMOD_FLAG_X86_RELOCATED )
                 continue;
 
             /* Don't overlap with other modules (or Xen itself). */
             end = consider_modules(s, e, size, mod,
-                                   mbi->mods_count + relocated, j);
+                                   boot_info->nr_mods + relocated, j);
 
             if ( highmem_start && end > highmem_start )
                 continue;
 
             if ( s < end &&
                  (headroom ||
-                  ((end - size) >> PAGE_SHIFT) > mod[j].mod_start) )
+                  ((end - size) >> PAGE_SHIFT) > mfn_x(mod[j].mfn)) )
             {
                 move_memory(end - size + headroom,
-                            (uint64_t)mod[j].mod_start << PAGE_SHIFT,
-                            mod[j].mod_end, 0);
-                mod[j].mod_start = (end - size) >> PAGE_SHIFT;
-                mod[j].mod_end += headroom;
-                mod[j].reserved = 1;
+                            (uint64_t)mod[j].start,
+                            mod[j].size, 0);
+                bootmodule_update_start(&mod[j], end - size);
+                mod[j].size += headroom;
+                mod[j].arch->flags |= BOOTMOD_FLAG_X86_RELOCATED;
             }
         }
 
@@ -1384,8 +1429,9 @@ void __init noreturn __start_xen(unsigned long mbi_p)
         while ( !kexec_crash_area.start )
         {
             /* Don't overlap with modules (or Xen itself). */
-            e = consider_modules(s, e, PAGE_ALIGN(kexec_crash_area.size), mod,
-                                 mbi->mods_count + relocated, -1);
+            e = consider_modules(s, e, PAGE_ALIGN(kexec_crash_area.size),
+                                 boot_info->mods,
+                                 boot_info->nr_mods + relocated, -1);
             if ( s >= e )
                 break;
             if ( e > kexec_crash_area_limit )
@@ -1398,13 +1444,14 @@ void __init noreturn __start_xen(unsigned long mbi_p)
 #endif
     }
 
-    if ( modules_headroom && !mod->reserved )
+    if ( boot_info->mods[0].arch->headroom &&
+         !(boot_info->mods[0].arch->flags & BOOTMOD_FLAG_X86_RELOCATED) )
         panic("Not enough memory to relocate the dom0 kernel image\n");
-    for ( i = 0; i < mbi->mods_count; ++i )
+    for ( i = 0; i < boot_info->nr_mods; ++i )
     {
-        uint64_t s = (uint64_t)mod[i].mod_start << PAGE_SHIFT;
+        uint64_t s = (uint64_t)boot_info->mods[i].start;
 
-        reserve_e820_ram(&boot_e820, s, s + PAGE_ALIGN(mod[i].mod_end));
+        reserve_e820_ram(&boot_e820, s, s + PAGE_ALIGN(boot_info->mods[i].size));
     }
 
     if ( !xen_phys_start )
@@ -1469,10 +1516,10 @@ void __init noreturn __start_xen(unsigned long mbi_p)
                     ASSERT(j);
                 }
                 map_e = boot_e820.map[j].addr + boot_e820.map[j].size;
-                for ( j = 0; j < mbi->mods_count; ++j )
+                for ( j = 0; j < boot_info->nr_mods; ++j )
                 {
-                    uint64_t end = pfn_to_paddr(mod[j].mod_start) +
-                                   mod[j].mod_end;
+                    uint64_t end = mfn_to_maddr(boot_info->mods[j].mfn) +
+                                   boot_info->mods[j].size;
 
                     if ( map_e < end )
                         map_e = end;
@@ -1545,13 +1592,14 @@ void __init noreturn __start_xen(unsigned long mbi_p)
         }
     }
 
-    for ( i = 0; i < mbi->mods_count; ++i )
+    for ( i = 0; i < boot_info->nr_mods; ++i )
     {
-        set_pdx_range(mod[i].mod_start,
-                      mod[i].mod_start + PFN_UP(mod[i].mod_end));
-        map_pages_to_xen((unsigned long)mfn_to_virt(mod[i].mod_start),
-                         _mfn(mod[i].mod_start),
-                         PFN_UP(mod[i].mod_end), PAGE_HYPERVISOR);
+        set_pdx_range(mfn_x(boot_info->mods[i].mfn),
+                      mfn_x(boot_info->mods[i].mfn) +
+                      PFN_UP(boot_info->mods[i].size));
+        map_pages_to_xen((unsigned long)maddr_to_virt(boot_info->mods[i].start),
+                         boot_info->mods[i].mfn,
+                         PFN_UP(boot_info->mods[i].size), PAGE_HYPERVISOR);
     }
 
 #ifdef CONFIG_KEXEC
@@ -1561,7 +1609,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
         unsigned long e = min(s + PFN_UP(kexec_crash_area.size),
                               PFN_UP(__pa(HYPERVISOR_VIRT_END - 1)));
 
-        if ( e > s ) 
+        if ( e > s )
             map_pages_to_xen((unsigned long)__va(kexec_crash_area.start),
                              _mfn(s), e - s, PAGE_HYPERVISOR);
     }
@@ -1701,7 +1749,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
     mmio_ro_ranges = rangeset_new(NULL, "r/o mmio ranges",
                                   RANGESETF_prettyprint_hex);
 
-    if ( xsm_multiboot_init(module_map, mbi) )
+    if ( xsm_bootmodule_init(boot_info) )
         warning_add("WARNING: XSM failed to initialize.\n"
                     "This has implications on the security of the system,\n"
                     "as uncontrolled communications between trusted and\n"
@@ -1774,7 +1822,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
 
     init_IRQ();
 
-    microcode_grab_module(module_map, mbi);
+    microcode_grab_module(boot_info);
 
     timer_init();
 
@@ -1906,7 +1954,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
 
     do_initcalls();
 
-    if ( opt_watchdog ) 
+    if ( opt_watchdog )
         watchdog_setup();
 
     if ( !tboot_protect_mem_regions() )
@@ -1922,8 +1970,11 @@ void __init noreturn __start_xen(unsigned long mbi_p)
            cpu_has_nx ? XENLOG_INFO : XENLOG_WARNING "Warning: ",
            cpu_has_nx ? "" : "not ");
 
-    initrdidx = find_first_bit(module_map, mbi->mods_count);
-    if ( bitmap_weight(module_map, mbi->mods_count) > 1 )
+    initrdidx = bootmodule_next_idx_by_kind(boot_info, BOOTMOD_UNKNOWN, 0);
+    if ( initrdidx < boot_info->nr_mods )
+        boot_info->mods[initrdidx].kind = BOOTMOD_RAMDISK;
+
+    if ( bootmodule_count_by_kind(boot_info, BOOTMOD_UNKNOWN) > 1 )
         printk(XENLOG_WARNING
                "Multiple initrd candidates, picking module #%u\n",
                initrdidx);
@@ -1932,9 +1983,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
      * We're going to setup domain0 using the module(s) that we stashed safely
      * above our heap. The second module, if present, is an initrd ramdisk.
      */
-    dom0 = create_dom0(mod, modules_headroom,
-                       initrdidx < mbi->mods_count ? mod + initrdidx : NULL,
-                       kextra, loader);
+    dom0 = create_dom0(boot_info, kextra, loader);
     if ( !dom0 )
         panic("Could not set up DOM0 guest OS\n");
 
diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h
index 42b53a3ca6..dde8202f62 100644
--- a/xen/include/xen/bootinfo.h
+++ b/xen/include/xen/bootinfo.h
@@ -51,4 +51,51 @@ struct __packed boot_info {
     struct arch_boot_info *arch;
 };
 
+extern struct boot_info *boot_info;
+
+static inline unsigned long bootmodule_next_idx_by_kind(
+    const struct boot_info *bi, bootmodule_kind kind, unsigned long start)
+{
+    for ( ; start < bi->nr_mods; start++ )
+        if ( bi->mods[start].kind == kind )
+            return start;
+
+    return bi->nr_mods + 1;
+}
+
+static inline unsigned long bootmodule_count_by_kind(
+    const struct boot_info *bi, bootmodule_kind kind)
+{
+    unsigned long count = 0;
+    int i;
+
+    for ( i=0; i < bi->nr_mods; i++ )
+        if ( bi->mods[i].kind == kind )
+            count++;
+
+    return count;
+}
+
+static inline struct boot_module *bootmodule_next_by_kind(
+    const struct boot_info *bi, bootmodule_kind kind, unsigned long start)
+{
+    for ( ; start < bi->nr_mods; start++ )
+        if ( bi->mods[start].kind == kind )
+            return &bi->mods[start];
+
+    return NULL;
+}
+
+static inline void bootmodule_update_start(struct boot_module *b, paddr_t new_start)
+{
+    b->start = new_start;
+    b->mfn = maddr_to_mfn(new_start);
+}
+
+static inline void bootmodule_update_mfn(struct boot_module *b, mfn_t new_mfn)
+{
+    b->mfn = new_mfn;
+    b->start = mfn_to_maddr(new_mfn);
+}
+
 #endif
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 1676c261c9..bd72c2220e 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -16,8 +16,8 @@
 #define __XSM_H__
 
 #include <xen/alternative-call.h>
+#include <xen/bootinfo.h>
 #include <xen/sched.h>
-#include <xen/multiboot.h>
 
 /* policy magic number (defined by XSM_MAGIC) */
 typedef uint32_t xsm_magic_t;
@@ -770,15 +770,14 @@ static inline int xsm_argo_send(const struct domain *d, const struct domain *t)
 
 #endif /* XSM_NO_WRAPPERS */
 
-#ifdef CONFIG_MULTIBOOT
-int xsm_multiboot_init(
-    unsigned long *module_map, const multiboot_info_t *mbi);
-int xsm_multiboot_policy_init(
-    unsigned long *module_map, const multiboot_info_t *mbi,
-    const unsigned char *policy_buffer[], size_t *policy_size);
-#endif
+#ifndef CONFIG_HAS_DEVICE_TREE
+int xsm_bootmodule_init(const struct boot_info *bi);
+int xsm_bootmodule_policy_init(
+    const struct boot_info *bi, const unsigned char *policy_buffer[],
+    size_t *policy_size);
+
+#else
 
-#ifdef CONFIG_HAS_DEVICE_TREE
 /*
  * Initialize XSM
  *
@@ -820,15 +819,14 @@ static const inline struct xsm_ops *silo_init(void)
 
 #include <xsm/dummy.h>
 
-#ifdef CONFIG_MULTIBOOT
-static inline int xsm_multiboot_init (
-    unsigned long *module_map, const multiboot_info_t *mbi)
+#ifndef CONFIG_HAS_DEVICE_TREE
+static inline int xsm_bootmodule_init(const struct boot_info *bi)
 {
     return 0;
 }
-#endif
 
-#ifdef CONFIG_HAS_DEVICE_TREE
+#else
+
 static inline int xsm_dt_init(void)
 {
     return 0;
diff --git a/xen/xsm/xsm_core.c b/xen/xsm/xsm_core.c
index 6377895e1e..f9066738b5 100644
--- a/xen/xsm/xsm_core.c
+++ b/xen/xsm/xsm_core.c
@@ -10,6 +10,7 @@
  *  as published by the Free Software Foundation.
  */
 
+#include <xen/bootinfo.h>
 #include <xen/errno.h>
 #include <xen/hypercall.h>
 #include <xen/init.h>
@@ -136,9 +137,13 @@ static int __init xsm_core_init(const void *policy_buffer, size_t policy_size)
     return 0;
 }
 
-#ifdef CONFIG_MULTIBOOT
-int __init xsm_multiboot_init(
-    unsigned long *module_map, const multiboot_info_t *mbi)
+/*
+ * ifdef'ing this against multiboot is no longer valid as the boot module
+ * is agnostic and it will be possible to dropped the ifndef should Arm
+ * adopt boot info
+ */
+#ifndef CONFIG_HAS_DEVICE_TREE
+int __init xsm_bootmodule_init(const struct boot_info *bi)
 {
     int ret = 0;
     const unsigned char *policy_buffer;
@@ -148,8 +153,7 @@ int __init xsm_multiboot_init(
 
     if ( policy_file_required && XSM_MAGIC )
     {
-        ret = xsm_multiboot_policy_init(module_map, mbi, &policy_buffer,
-                                        &policy_size);
+        ret = xsm_bootmodule_policy_init(bi, &policy_buffer, &policy_size);
         if ( ret )
         {
             bootstrap_map(NULL);
@@ -162,9 +166,9 @@ int __init xsm_multiboot_init(
 
     return 0;
 }
-#endif
 
-#ifdef CONFIG_HAS_DEVICE_TREE
+#else
+
 int __init xsm_dt_init(void)
 {
     int ret = 0;
@@ -215,9 +219,9 @@ bool __init has_xsm_magic(paddr_t start)
 
     return false;
 }
-#endif
+#endif /* CONFIG_HAS_DEVICE_TREE */
 
-#endif
+#endif /* CONFIG_XSM */
 
 long cf_check do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
 {
diff --git a/xen/xsm/xsm_policy.c b/xen/xsm/xsm_policy.c
index 6a4f769aec..45ce013ead 100644
--- a/xen/xsm/xsm_policy.c
+++ b/xen/xsm/xsm_policy.c
@@ -18,24 +18,22 @@
  *
  */
 
-#include <xsm/xsm.h>
-#ifdef CONFIG_MULTIBOOT
-#include <xen/multiboot.h>
-#include <asm/setup.h>
-#endif
 #include <xen/bitops.h>
+#include <xen/bootinfo.h>
+#include <xsm/xsm.h>
+
 #ifdef CONFIG_HAS_DEVICE_TREE
-# include <asm/setup.h>
 # include <xen/device_tree.h>
 #endif
 
-#ifdef CONFIG_MULTIBOOT
-int __init xsm_multiboot_policy_init(
-    unsigned long *module_map, const multiboot_info_t *mbi,
-    const unsigned char *policy_buffer[], size_t *policy_size)
+# include <asm/setup.h>
+
+#ifndef CONFIG_HAS_DEVICE_TREE
+int __init xsm_bootmodule_policy_init(
+    const struct boot_info *bi, const unsigned char *policy_buffer[],
+    size_t *policy_size)
 {
-    int i;
-    module_t *mod = (module_t *)__va(mbi->mods_addr);
+    unsigned long idx = 0;
     int rc = -ENOENT;
     u32 *_policy_start;
     unsigned long _policy_len;
@@ -47,17 +45,11 @@ int __init xsm_multiboot_policy_init(
     rc = 0;
 #endif
 
-    /*
-     * Try all modules and see whichever could be the binary policy.
-     * Adjust module_map for the module that is the binary policy.
-     */
-    for ( i = mbi->mods_count-1; i >= 1; i-- )
+    idx = bootmodule_next_idx_by_kind(bi, BOOTMOD_UNKNOWN, idx);
+    while ( idx < bi->nr_mods )
     {
-        if ( !test_bit(i, module_map) )
-            continue;
-
-        _policy_start = bootstrap_map(mod + i);
-        _policy_len   = mod[i].mod_end;
+        _policy_start = bootstrap_map(&bi->mods[idx]);
+        _policy_len   = bi->mods[idx].size;
 
         if ( (xsm_magic_t)(*_policy_start) == XSM_MAGIC )
         {
@@ -67,13 +59,13 @@ int __init xsm_multiboot_policy_init(
             printk("Policy len %#lx, start at %p.\n",
                    _policy_len,_policy_start);
 
-            __clear_bit(i, module_map);
+            bi->mods[idx].kind = BOOTMOD_XSM;
             rc = 0;
             break;
-
         }
 
         bootstrap_map(NULL);
+        idx = bootmodule_next_idx_by_kind(bi, BOOTMOD_UNKNOWN, ++idx);
     }
 
     if ( rc == -ENOENT )
@@ -81,9 +73,9 @@ int __init xsm_multiboot_policy_init(
 
     return rc;
 }
-#endif
 
-#ifdef CONFIG_HAS_DEVICE_TREE
+#else
+
 int __init xsm_dt_policy_init(void **policy_buffer, size_t *policy_size)
 {
     struct bootmodule *mod = boot_module_find_by_kind(BOOTMOD_XSM);
-- 
2.20.1


