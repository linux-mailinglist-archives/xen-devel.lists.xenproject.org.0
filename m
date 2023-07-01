Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C93E7445A2
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jul 2023 02:32:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557670.871262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFOWm-0000rt-44; Sat, 01 Jul 2023 00:31:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557670.871262; Sat, 01 Jul 2023 00:31:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFOWl-0000mP-UZ; Sat, 01 Jul 2023 00:31:51 +0000
Received: by outflank-mailman (input) for mailman id 557670;
 Sat, 01 Jul 2023 00:31:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ypVN=CT=gmail.com=christopher.w.clark.io@srs-se1.protection.inumbo.net>)
 id 1qFOWk-0007yM-C9
 for xen-devel@lists.xenproject.org; Sat, 01 Jul 2023 00:31:50 +0000
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [2607:f8b0:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a96729e1-17a6-11ee-8611-37d641c3527e;
 Sat, 01 Jul 2023 02:31:47 +0200 (CEST)
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-3a1a47b33d8so1881850b6e.2
 for <xen-devel@lists.xenproject.org>; Fri, 30 Jun 2023 17:31:47 -0700 (PDT)
Received: from cog-dev.home ([70.103.208.83]) by smtp.gmail.com with ESMTPSA id
 s68-20020a632c47000000b0055b61cd99a1sm1824296pgs.81.2023.06.30.17.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 17:31:43 -0700 (PDT)
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
X-Inumbo-ID: a96729e1-17a6-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688171506; x=1690763506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y7s+a48s6nJcYJpi0CKsRE8Fk9vJ+e5NEZSgNSxP5/8=;
        b=W/Ori2UF5GdZ2XTZUYb7SeemZMmXHFyT5AmYNUYzZYR8m3DlTjhAIlYMyFrqeTXavn
         ApUJYnarY5VGN5Tu9EM1aQnNSUmAba1kJGAiVzVu3dYiGQFTOj1zZb4QCDP6qkUQsEg3
         /AYkZJiTd10O0+u5oCZzM5XUQCWyDv9QPiVV5l/W1Z/gUunTNlDLSjsGwKU5MQhQLvo4
         lNX1yE37dfgzMaBoCgFG+haXttyy7gTUaQmTx+F9FTcZarjT7WPvQSZQ+sEb1Aoyg+8H
         dYhW5gOEl7FHl4wZWB4IN/T+asWd+xews11MoYsBcLjnSnyg3ev+AM8/pT4J6RxDobpr
         BFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688171506; x=1690763506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y7s+a48s6nJcYJpi0CKsRE8Fk9vJ+e5NEZSgNSxP5/8=;
        b=jJP5mWtb3jelZ0x3lMPFBTK8MhQK8vUlW1X3/xXhkRaQeAwEuptJ9LdOjc9As/2TxQ
         MvJ8jwe1LGpqR+1UoKM9Bkp1uwnXCO0ykMy0efGQaMSiIwgVmmt/QxMz7nw+Z9cQY9+B
         AU9JM3jJyBUdsjW6OHgrkZU7RjaTJCec6Kde5K8RDVly81bbdtUOITUJz23elL7jZVj6
         Rd/QeUH/S/a6rKE2f19aw5VZmWlZny7KQOOv9ELSEOdVBRCfJPc0YBdMm7HfiqX+Mk4z
         oIsPRBAte+/77TBklb51FfqxeUZIN3baQNMwHue8QhjFYYesRfso6M/OZYcXn8AUHroE
         Y2Wg==
X-Gm-Message-State: AC+VfDyd7EWNkgijy/lTGrHDAtTrE6a673a2r9dMw7tTtl4Co5tbjJcj
	vmITOnGYG8McfZP2Oe7eV2SeneZ2iH4=
X-Google-Smtp-Source: ACHHUZ7Jdwgu9s3VF78UoKENhjUUxgTBZur8e6sBoFcYKPjtIKlqM0Dh2E7ma7w5eCQzKVE4ipK9gg==
X-Received: by 2002:a05:6808:1b0c:b0:3a1:b309:a409 with SMTP id bx12-20020a0568081b0c00b003a1b309a409mr5339601oib.4.1688171505329;
        Fri, 30 Jun 2023 17:31:45 -0700 (PDT)
Sender: Christopher Clark <christopher.w.clark.io@gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Daniel Smith <dpsmith@apertussolutions.com>,
	stefano.stabellini@amd.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Luca Fancellu <luca.fancellu@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Rich Persaud <persaur@gmail.com>
Subject: [PATCH 04/11] x86 setup: porting dom0 construction logic to boot module structures
Date: Fri, 30 Jun 2023 17:31:25 -0700
Message-Id: <20230701003132.2210306-5-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230701003132.2210306-1-christopher.w.clark@gmail.com>
References: <20230701003132.2210306-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adjust the PV and PVH dom0 construction entry points to take boot module
structures as parameters, and add further fields to the boot module
structures to plumb the data needed to support this use. Populate these
from the multiboot module data.

This change removes multiboot from the PV and PVH dom0 construction logic.

Introduce and use new inline accessor functions for navigating the boot
module structures.

The per-boot-module arrays are expanded from singletons to accommodate
all modules, up to a static maximum of 64 modules including Xen that can
be accepted from a bootloader to match the previous value from the
module map check.

The field that identifies the type of a boot module (kernel, ramdisk,
etc) is introduced to the common boot module structure and declared as a
non-enum integer type to allow the field to be of a known-size and so
structure can be packed in a subsequent patch in the series, and it will
then be reconciled with the equivalent Arm boot field type.

The command line provided by multiboot for each boot module is added
directly to the boot_module structure, which is appropriate for this
logic just replacing multiboot.

The maximum number of boot modules that a bootloader can provide in
addition to the Xen hypervisor is preserved from prior logic with the
module_map at 63.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

changes since v1: a subset of patch 3
- retains module_map for now as still used functions outside setup
- move the static inline functions to a separate dedicated header
- include mm-frame.h and compiler.h as simpler dependencies than mm.h
---
 xen/arch/x86/dom0_build.c             |  10 +-
 xen/arch/x86/hvm/dom0_build.c         |  43 +++---
 xen/arch/x86/include/asm/boot.h       |  36 +++++
 xen/arch/x86/include/asm/bootinfo.h   |  24 +++
 xen/arch/x86/include/asm/dom0_build.h |  13 +-
 xen/arch/x86/include/asm/setup.h      |   4 +-
 xen/arch/x86/pv/dom0_build.c          |  32 ++--
 xen/arch/x86/setup.c                  | 206 +++++++++++++++-----------
 xen/include/xen/bootinfo.h            |  27 ++++
 9 files changed, 254 insertions(+), 141 deletions(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 79234f18ff..b38cd1550e 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2002-2005, K A Fraser
  */
 
+#include <xen/bootinfo.h>
 #include <xen/init.h>
 #include <xen/iocap.h>
 #include <xen/libelf.h>
@@ -574,9 +575,8 @@ int __init dom0_setup_permissions(struct domain *d)
     return rc;
 }
 
-int __init construct_dom0(struct domain *d, const module_t *image,
-                          unsigned long image_headroom, module_t *initrd,
-                          char *cmdline)
+int __init construct_dom0(struct domain *d, const struct boot_module *image,
+    struct boot_module *initrd, char *cmdline)
 {
     int rc;
 
@@ -588,9 +588,9 @@ int __init construct_dom0(struct domain *d, const module_t *image,
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
index 56fe89632b..c094863bb8 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -8,9 +8,9 @@
  */
 
 #include <xen/acpi.h>
+#include <xen/bootinfo.h>
 #include <xen/init.h>
 #include <xen/libelf.h>
-#include <xen/multiboot.h>
 #include <xen/pci.h>
 #include <xen/softirq.h>
 
@@ -530,14 +530,13 @@ static paddr_t __init find_memory(
     return INVALID_PADDR;
 }
 
-static int __init pvh_load_kernel(struct domain *d, const module_t *image,
-                                  unsigned long image_headroom,
-                                  module_t *initrd, void *image_base,
-                                  char *cmdline, paddr_t *entry,
-                                  paddr_t *start_info_addr)
+static int __init pvh_load_kernel(
+    struct domain *d, const struct boot_module *image,
+    struct boot_module *initrd, void *image_base, char *cmdline, paddr_t *entry,
+    paddr_t *start_info_addr)
 {
-    void *image_start = image_base + image_headroom;
-    unsigned long image_len = image->mod_end;
+    void *image_start = image_base + image->arch->headroom;
+    unsigned long image_len = image->size;
     struct elf_binary elf;
     struct elf_dom_parms parms;
     paddr_t last_addr;
@@ -546,7 +545,7 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
     struct vcpu *v = d->vcpu[0];
     int rc;
 
-    if ( (rc = bzimage_parse(image_base, &image_start, image_headroom,
+    if ( (rc = bzimage_parse(image_base, &image_start, image->arch->headroom,
                              &image_len)) != 0 )
     {
         printk("Error trying to detect bz compressed kernel\n");
@@ -594,7 +593,7 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
      * simplify it.
      */
     last_addr = find_memory(d, &elf, sizeof(start_info) +
-                            (initrd ? ROUNDUP(initrd->mod_end, PAGE_SIZE) +
+                            (initrd ? ROUNDUP(initrd->size, PAGE_SIZE) +
                                       sizeof(mod)
                                     : 0) +
                             (cmdline ? ROUNDUP(strlen(cmdline) + 1,
@@ -608,8 +607,8 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
 
     if ( initrd != NULL )
     {
-        rc = hvm_copy_to_guest_phys(last_addr, mfn_to_virt(initrd->mod_start),
-                                    initrd->mod_end, v);
+        rc = hvm_copy_to_guest_phys(last_addr, maddr_to_virt(initrd->start),
+                                    initrd->size, v);
         if ( rc )
         {
             printk("Unable to copy initrd to guest\n");
@@ -617,11 +616,11 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
         }
 
         mod.paddr = last_addr;
-        mod.size = initrd->mod_end;
-        last_addr += ROUNDUP(initrd->mod_end, elf_64bit(&elf) ? 8 : 4);
-        if ( initrd->string )
+        mod.size = initrd->size;
+        last_addr += ROUNDUP(initrd->size, elf_64bit(&elf) ? 8 : 4);
+        if ( initrd->string.len )
         {
-            char *str = __va(initrd->string);
+            char *str = initrd->string.bytes;
             size_t len = strlen(str) + 1;
 
             rc = hvm_copy_to_guest_phys(last_addr, str, len, v);
@@ -1176,10 +1175,9 @@ static void __hwdom_init pvh_setup_mmcfg(struct domain *d)
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
@@ -1209,9 +1207,8 @@ int __init dom0_construct_pvh(struct domain *d, const module_t *image,
         return rc;
     }
 
-    rc = pvh_load_kernel(d, image, image_headroom, initrd,
-                         bootstrap_map_multiboot(image),
-                         cmdline, &entry, &start_info);
+    rc = pvh_load_kernel(d, image, initrd, bootstrap_map(image), cmdline,
+                         &entry, &start_info);
     if ( rc )
     {
         printk("Failed to load Dom0 kernel\n");
diff --git a/xen/arch/x86/include/asm/boot.h b/xen/arch/x86/include/asm/boot.h
index 10b17f12b2..bcf4f2e2e3 100644
--- a/xen/arch/x86/include/asm/boot.h
+++ b/xen/arch/x86/include/asm/boot.h
@@ -19,6 +19,42 @@ static inline void *bootstrap_map_multiboot(const module_t *mod)
     return bootstrap_map(&bm);
 }
 
+static inline unsigned long bootmodule_index(
+    const struct boot_info *info, bootmod_type_t bootmod_type,
+    unsigned long start)
+{
+    for ( ; start < info->nr_mods; start++ )
+        if ( info->mods[start].bootmod_type == bootmod_type )
+            return start;
+
+    return info->nr_mods + 1;
+}
+
+static inline struct boot_module *bootmodule_next(
+    const struct boot_info *info, bootmod_type_t bootmod_type)
+{
+    unsigned long i;
+
+    for ( i = 0; i < info->nr_mods; i++ )
+        if ( info->mods[i].bootmod_type == bootmod_type )
+            return &info->mods[i];
+
+    return NULL;
+}
+
+static inline void bootmodule_update_start(struct boot_module *bm,
+    paddr_t new_start)
+{
+    bm->start = new_start;
+    bm->mfn = maddr_to_mfn(new_start);
+}
+
+static inline void bootmodule_update_mfn(struct boot_module *bm, mfn_t new_mfn)
+{
+    bm->mfn = new_mfn;
+    bm->start = mfn_to_maddr(new_mfn);
+}
+
 #endif
 
 /*
diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index a25054f372..30c27980e0 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -2,9 +2,33 @@
 #define __ARCH_X86_BOOTINFO_H__
 
 struct arch_bootmodule {
+#define BOOTMOD_FLAG_X86_RELOCATED     1U << 0
+    uint32_t flags;
     unsigned headroom;
 };
 
+struct arch_boot_info {
+    uint32_t flags;
+#define BOOTINFO_FLAG_X86_CMDLINE      1U << 2
+#define BOOTINFO_FLAG_X86_MODULES      1U << 3
+#define BOOTINFO_FLAG_X86_MEMMAP       1U << 6
+#define BOOTINFO_FLAG_X86_LOADERNAME   1U << 9
+
+    char *boot_loader_name;
+
+    uint32_t mmap_length;
+    paddr_t mmap_addr;
+};
+
+struct __packed mb_memmap {
+    uint32_t size;
+    uint32_t base_addr_low;
+    uint32_t base_addr_high;
+    uint32_t length_low;
+    uint32_t length_high;
+    uint32_t type;
+};
+
 #endif
 
 /*
diff --git a/xen/arch/x86/include/asm/dom0_build.h b/xen/arch/x86/include/asm/dom0_build.h
index a5f8c9e67f..ca502269f2 100644
--- a/xen/arch/x86/include/asm/dom0_build.h
+++ b/xen/arch/x86/include/asm/dom0_build.h
@@ -1,6 +1,7 @@
 #ifndef _DOM0_BUILD_H_
 #define _DOM0_BUILD_H_
 
+#include <xen/bootinfo.h>
 #include <xen/libelf.h>
 #include <xen/sched.h>
 
@@ -13,15 +14,11 @@ unsigned long dom0_compute_nr_pages(struct domain *d,
                                     unsigned long initrd_len);
 int dom0_setup_permissions(struct domain *d);
 
-int dom0_construct_pv(struct domain *d, const module_t *image,
-                      unsigned long image_headroom,
-                      module_t *initrd,
-                      char *cmdline);
+int dom0_construct_pv(struct domain *d, const struct boot_module *image,
+                      struct boot_module *initrd, char *cmdline);
 
-int dom0_construct_pvh(struct domain *d, const module_t *image,
-                       unsigned long image_headroom,
-                       module_t *initrd,
-                       char *cmdline);
+int dom0_construct_pvh(struct domain *d, const struct boot_module *image,
+                       struct boot_module *initrd, char *cmdline);
 
 unsigned long dom0_paging_pages(const struct domain *d,
                                 unsigned long nr_pages);
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index 80d0bb2a21..2d620d04c7 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -34,8 +34,8 @@ static inline void vesa_init(void) {};
 
 int construct_dom0(
     struct domain *d,
-    const module_t *kernel, unsigned long kernel_headroom,
-    module_t *initrd,
+    const struct boot_module *kernel,
+    struct boot_module *initrd,
     char *cmdline);
 void setup_io_bitmap(struct domain *d);
 
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 4fe806b60d..bc0af7cf27 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -4,12 +4,12 @@
  * Copyright (c) 2002-2005, K A Fraser
  */
 
+#include <xen/bootinfo.h>
 #include <xen/console.h>
 #include <xen/domain.h>
 #include <xen/domain_page.h>
 #include <xen/init.h>
 #include <xen/libelf.h>
-#include <xen/multiboot.h>
 #include <xen/pfn.h>
 #include <xen/sched.h>
 #include <xen/softirq.h>
@@ -356,9 +356,8 @@ static struct page_info * __init alloc_chunk(struct domain *d,
 }
 
 int __init dom0_construct_pv(struct domain *d,
-                             const module_t *image,
-                             unsigned long image_headroom,
-                             module_t *initrd,
+                             const struct boot_module *image,
+                             struct boot_module *initrd,
                              char *cmdline)
 {
     int i, rc, order, machine;
@@ -375,10 +374,10 @@ int __init dom0_construct_pv(struct domain *d,
     unsigned int flush_flags = 0;
     start_info_t *si;
     struct vcpu *v = d->vcpu[0];
-    void *image_base = bootstrap_map_multiboot(image);
-    unsigned long image_len = image->mod_end;
-    void *image_start = image_base + image_headroom;
-    unsigned long initrd_len = initrd ? initrd->mod_end : 0;
+    void *image_base = bootstrap_map(image);
+    unsigned long image_len = image->size;
+    void *image_start = image_base + image->arch->headroom;
+    unsigned long initrd_len = initrd ? initrd->size : 0;
     l4_pgentry_t *l4tab = NULL, *l4start = NULL;
     l3_pgentry_t *l3tab = NULL, *l3start = NULL;
     l2_pgentry_t *l2tab = NULL, *l2start = NULL;
@@ -417,7 +416,7 @@ int __init dom0_construct_pv(struct domain *d,
 
     d->max_pages = ~0U;
 
-    if ( (rc = bzimage_parse(image_base, &image_start, image_headroom,
+    if ( (rc = bzimage_parse(image_base, &image_start, image->arch->headroom,
                              &image_len)) != 0 )
         return rc;
 
@@ -612,7 +611,7 @@ int __init dom0_construct_pv(struct domain *d,
         initrd_pfn = vinitrd_start ?
                      (vinitrd_start - v_start) >> PAGE_SHIFT :
                      domain_tot_pages(d);
-        initrd_mfn = mfn = initrd->mod_start;
+        initrd_mfn = mfn = mfn_x(initrd->mfn);
         count = PFN_UP(initrd_len);
         if ( d->arch.physaddr_bitsize &&
              ((mfn + count - 1) >> (d->arch.physaddr_bitsize - PAGE_SHIFT)) )
@@ -627,12 +626,13 @@ int __init dom0_construct_pv(struct domain *d,
                     free_domheap_pages(page, order);
                     page += 1UL << order;
                 }
-            memcpy(page_to_virt(page), mfn_to_virt(initrd->mod_start),
+            memcpy(page_to_virt(page), maddr_to_virt(initrd->start),
                    initrd_len);
-            mpt_alloc = (paddr_t)initrd->mod_start << PAGE_SHIFT;
+            mpt_alloc = (paddr_t)initrd->start;
             init_domheap_pages(mpt_alloc,
                                mpt_alloc + PAGE_ALIGN(initrd_len));
-            initrd->mod_start = initrd_mfn = mfn_x(page_to_mfn(page));
+            bootmodule_update_mfn(initrd, page_to_mfn(page));
+            initrd_mfn = mfn_x(initrd->mfn);
         }
         else
         {
@@ -640,7 +640,7 @@ int __init dom0_construct_pv(struct domain *d,
                 if ( assign_pages(mfn_to_page(_mfn(mfn++)), 1, d, 0) )
                     BUG();
         }
-        initrd->mod_end = 0;
+        initrd->size = 0;
 
         iommu_memory_setup(d, "initrd", mfn_to_page(_mfn(initrd_mfn)),
                            PFN_UP(initrd_len), &flush_flags);
@@ -654,7 +654,7 @@ int __init dom0_construct_pv(struct domain *d,
                nr_pages - domain_tot_pages(d));
     if ( initrd )
     {
-        mpt_alloc = (paddr_t)initrd->mod_start << PAGE_SHIFT;
+        mpt_alloc = initrd->start;
         printk("\n Init. ramdisk: %"PRIpaddr"->%"PRIpaddr,
                mpt_alloc, mpt_alloc + initrd_len);
     }
@@ -880,7 +880,7 @@ int __init dom0_construct_pv(struct domain *d,
         if ( pfn >= initrd_pfn )
         {
             if ( pfn < initrd_pfn + PFN_UP(initrd_len) )
-                mfn = initrd->mod_start + (pfn - initrd_pfn);
+                mfn = mfn_x(initrd->mfn) + (pfn - initrd_pfn);
             else
                 mfn -= PFN_UP(initrd_len);
         }
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 3b623a4149..f9b04daebd 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -37,6 +37,7 @@
 #include <asm/processor.h>
 #include <asm/mpspec.h>
 #include <asm/apic.h>
+#include <asm/boot.h>
 #include <asm/msi.h>
 #include <asm/desc.h>
 #include <asm/paging.h>
@@ -59,6 +60,9 @@
 #include <asm/prot-key.h>
 #include <asm/pv/domain.h>
 
+/* Max number of boot modules a bootloader can provide in addition to Xen */
+#define MAX_NR_BOOTMODS 63
+
 /* opt_nosmp: If true, secondary processors are ignored. */
 static bool __initdata opt_nosmp;
 boolean_param("nosmp", opt_nosmp);
@@ -269,20 +273,44 @@ static int __init cf_check parse_acpi_param(const char *s)
 }
 custom_param("acpi", parse_acpi_param);
 
-static const module_t *__initdata initial_images;
 static struct boot_info __initdata *boot_info;
 
-static void __init multiboot_to_bootinfo(multiboot_info_t *mbi)
+static void __init multiboot_to_bootinfo(multiboot_info_t *mbi, module_t *mods)
 {
     static struct boot_info       __initdata info;
-    static struct boot_module     __initdata boot_mods[1];
-    static struct arch_bootmodule __initdata arch_boot_mods[1];
+    static struct arch_boot_info  __initdata arch_info;
+    static struct boot_module     __initdata boot_mods[MAX_NR_BOOTMODS + 1];
+    static struct arch_bootmodule __initdata arch_boot_mods[
+                                                       MAX_NR_BOOTMODS + 1];
 
+    int i;
+
+    info.arch = &arch_info;
     info.mods = boot_mods;
 
+    info.cmdline = __va(mbi->cmdline);
+
+    /* The BOOTINFO_FLAG_X86_* flags are a 1-1 map to MBI_* */
+    arch_info.flags = mbi->flags;
+    arch_info.mmap_length = mbi->mmap_length;
+    arch_info.mmap_addr = mbi->mmap_addr;
+    arch_info.boot_loader_name = __va(mbi->boot_loader_name);
+
     info.nr_mods = mbi->mods_count;
+    for ( i = 0; i <= MAX_NR_BOOTMODS; i++ )
+    {
+        boot_mods[i].arch = &arch_boot_mods[i];
 
-    boot_mods[0].arch = &arch_boot_mods[0];
+        if ( i < info.nr_mods )
+        {
+            bootmodule_update_start(&boot_mods[i], mods[i].mod_start);
+            boot_mods[i].size = mods[i].mod_end - mods[i].mod_start;
+
+            boot_mods[i].string.len = strlcpy(boot_mods[i].string.bytes,
+                                             __va(mods[i].string),
+                                             BOOTMOD_STRING_MAX_LEN);
+        }
+    }
 
     boot_info = &info;
 }
@@ -296,8 +324,8 @@ unsigned long __init initial_images_nrpages(nodeid_t node)
 
     for ( nr = i = 0; i < boot_info->nr_mods; ++i )
     {
-        unsigned long start = initial_images[i].mod_start;
-        unsigned long end = start + PFN_UP(initial_images[i].mod_end);
+        unsigned long start = mfn_x(boot_info->mods[i].mfn);
+        unsigned long end = start + PFN_UP(boot_info->mods[i].size);
 
         if ( end > node_start && node_end > start )
             nr += min(node_end, end) - max(node_start, start);
@@ -312,14 +340,13 @@ void __init discard_initial_images(void)
 
     for ( i = 0; i < boot_info->nr_mods; ++i )
     {
-        uint64_t start = (uint64_t)initial_images[i].mod_start << PAGE_SHIFT;
+        uint64_t start = boot_info->mods[i].start;
 
         init_domheap_pages(start,
-                           start + PAGE_ALIGN(initial_images[i].mod_end));
+                           start + PAGE_ALIGN(boot_info->mods[i].size));
     }
 
     boot_info->nr_mods = 0;
-    initial_images = NULL;
 }
 
 extern unsigned char __init_begin[], __init_end[];
@@ -450,26 +477,26 @@ static void __init move_memory(
 
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
-        s = bootstrap_map_multiboot(&mod);
-
-        mod.mod_start = (dst - doffs) >> PAGE_SHIFT;
-        mod.mod_end = doffs + size;
-        if ( mod.mod_end > blksz )
-            mod.mod_end = blksz;
-        if ( sz > mod.mod_end - doffs )
-            sz = mod.mod_end - doffs;
-        d = bootstrap_map_multiboot(&mod);
+        mod.start = src - soffs;
+        mod.size = soffs + size;
+        if ( mod.size > blksz )
+            mod.size = blksz;
+        sz = mod.size - soffs;
+        s = bootstrap_map(&mod);
+
+        mod.start = dst - doffs;
+        mod.size = doffs + size;
+        if ( mod.size > blksz )
+            mod.size = blksz;
+        if ( sz > mod.size - doffs )
+            sz = mod.size - doffs;
+        d = bootstrap_map(&mod);
 
         memmove(d + doffs, s + soffs, sz);
 
@@ -602,7 +629,7 @@ static void __init noinline move_xen(void)
 #undef BOOTSTRAP_MAP_LIMIT
 
 static uint64_t __init consider_modules(
-    uint64_t s, uint64_t e, uint32_t size, const module_t *mod,
+    uint64_t s, uint64_t e, uint32_t size, const struct boot_module *mod,
     unsigned int nr_mods, unsigned int this_mod)
 {
     unsigned int i;
@@ -612,8 +639,8 @@ static uint64_t __init consider_modules(
 
     for ( i = 0; i < nr_mods ; ++i )
     {
-        uint64_t start = (uint64_t)mod[i].mod_start << PAGE_SHIFT;
-        uint64_t end = start + PAGE_ALIGN(mod[i].mod_end);
+        uint64_t start = mod[i].start;
+        uint64_t end = start + PAGE_ALIGN(mod[i].size);
 
         if ( i == this_mod )
             continue;
@@ -883,9 +910,8 @@ static unsigned int __init copy_bios_e820(struct e820entry *map, unsigned int li
     return n;
 }
 
-static struct domain *__init create_dom0(const module_t *image,
-                                         unsigned long headroom,
-                                         module_t *initrd, const char *kextra,
+static struct domain *__init create_dom0(const struct boot_info *bootinfo,
+                                         const char *kextra,
                                          const char *loader)
 {
     struct xen_domctl_createdomain dom0_cfg = {
@@ -899,9 +925,14 @@ static struct domain *__init create_dom0(const module_t *image,
             .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
         },
     };
+    struct boot_module *image = bootmodule_next(bootinfo, BOOTMOD_KERNEL);
+    struct boot_module *initrd = bootmodule_next(bootinfo, BOOTMOD_RAMDISK);
     struct domain *d;
     char *cmdline;
-    domid_t domid;
+    domid_t domid = 0;
+
+    if ( image == NULL )
+        panic("Error creating d%uv0\n", domid);
 
     if ( opt_dom0_pvh )
     {
@@ -928,7 +959,7 @@ static struct domain *__init create_dom0(const module_t *image,
         panic("Error creating d%uv0\n", domid);
 
     /* Grab the DOM0 command line. */
-    cmdline = image->string ? __va(image->string) : NULL;
+    cmdline = image->string.len ? image->string.bytes : NULL;
     if ( cmdline || kextra )
     {
         static char __initdata dom0_cmdline[MAX_GUEST_CMDLINE];
@@ -968,8 +999,7 @@ static struct domain *__init create_dom0(const module_t *image,
         write_cr4(read_cr4() & ~X86_CR4_SMAP);
     }
 
-    if ( construct_dom0(d, image, boot_info->mods[0].arch->headroom, initrd,
-                        cmdline) != 0 )
+    if ( construct_dom0(d, image, initrd, cmdline) != 0 )
         panic("Could not construct domain 0\n");
 
     if ( cpu_has_smap )
@@ -1038,14 +1068,14 @@ void __init noreturn __start_xen(unsigned long mbi_p)
         mod = __va(mbi->mods_addr);
     }
 
-    multiboot_to_bootinfo(mbi);
+    multiboot_to_bootinfo(mbi, mod);
 
-    loader = (mbi->flags & MBI_LOADERNAME)
-        ? (char *)__va(mbi->boot_loader_name) : "unknown";
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
@@ -1147,19 +1177,22 @@ void __init noreturn __start_xen(unsigned long mbi_p)
            bootsym(boot_edd_info_nr));
 
     /* Check that we have at least one Multiboot module. */
-    if ( !(mbi->flags & MBI_MODULES) || (boot_info->nr_mods == 0) )
+    if ( !(boot_info->arch->flags & BOOTINFO_FLAG_X86_MODULES) ||
+         (boot_info->nr_mods == 0) )
         panic("dom0 kernel not specified. Check bootloader configuration\n");
 
     /* Check that we don't have a silly number of modules. */
-    if ( boot_info->nr_mods > sizeof(module_map) * 8 )
+    if ( boot_info->nr_mods > MAX_NR_BOOTMODS + 1 )
     {
-        boot_info->nr_mods = sizeof(module_map) * 8;
+        boot_info->nr_mods = MAX_NR_BOOTMODS + 1;
         printk("Excessive multiboot modules - using the first %u only\n",
                boot_info->nr_mods);
     }
 
-    bitmap_fill(module_map, boot_info->nr_mods);
+    /* Dom0 kernel is the first boot module */
+    bitmap_fill(module_map, mbi->mods_count);
     __clear_bit(0, module_map); /* Dom0 kernel is always first */
+    boot_info->mods[0].bootmod_type = BOOTMOD_KERNEL;
 
     if ( pvh_boot )
     {
@@ -1189,13 +1222,13 @@ void __init noreturn __start_xen(unsigned long mbi_p)
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
@@ -1330,17 +1363,9 @@ void __init noreturn __start_xen(unsigned long mbi_p)
     set_kexec_crash_area_size((u64)nr_pages << PAGE_SHIFT);
     kexec_reserve_area(&boot_e820);
 
-    initial_images = mod;
-    boot_info->nr_mods = boot_info->nr_mods;
-
     for ( i = 0; !efi_enabled(EFI_LOADER) && i < boot_info->nr_mods; i++ )
-    {
-        if ( mod[i].mod_start & (PAGE_SIZE - 1) )
+        if ( boot_info->mods[i].start & (PAGE_SIZE - 1) )
             panic("Bootloader didn't honor module alignment request\n");
-        mod[i].mod_end -= mod[i].mod_start;
-        mod[i].mod_start >>= PAGE_SHIFT;
-        mod[i].reserved = 0;
-    }
 
     /*
      * TODO: load ucode earlier once multiboot modules become accessible
@@ -1357,12 +1382,14 @@ void __init noreturn __start_xen(unsigned long mbi_p)
          * respective reserve_e820_ram() invocation below. No need to
          * query efi_boot_mem_unused() here, though.
          */
-        mod[boot_info->nr_mods].mod_start = virt_to_mfn(_stext);
-        mod[boot_info->nr_mods].mod_end = __2M_rwdata_end - _stext;
+        bootmodule_update_start(&boot_info->mods[boot_info->nr_mods],
+                                virt_to_maddr(_stext));
+        boot_info->mods[boot_info->nr_mods].size = __2M_rwdata_end - _stext;
     }
 
     boot_info->mods[0].arch->headroom =
-        bzimage_headroom(bootstrap_map_multiboot(mod), mod->mod_end);
+        bzimage_headroom(bootstrap_map(&boot_info->mods[0]),
+                         boot_info->mods[0].size);
 
     bootstrap_map(NULL);
 
@@ -1420,7 +1447,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
         {
             /* Don't overlap with modules. */
             end = consider_modules(s, e, reloc_size + mask,
-                                   mod, boot_info->nr_mods, -1);
+                                   boot_info->mods, boot_info->nr_mods, -1);
             end &= ~mask;
         }
         else
@@ -1443,15 +1470,15 @@ void __init noreturn __start_xen(unsigned long mbi_p)
         /* Is the region suitable for relocating the multiboot modules? */
         for ( j = boot_info->nr_mods - 1; j >= 0; j-- )
         {
-            struct boot_module *boot_mods = boot_info->mods;
-            unsigned long headroom = j ? 0 : boot_mods[0].arch->headroom;
-            unsigned long size = PAGE_ALIGN(headroom + mod[j].mod_end);
+            struct boot_module *boot_mod = boot_info->mods;
+            unsigned long headroom = j ? 0 : boot_mod[0].arch->headroom;
+            unsigned long size = PAGE_ALIGN(headroom + boot_mod[j].size);
 
-            if ( mod[j].reserved )
+            if ( boot_mod[j].arch->flags & BOOTMOD_FLAG_X86_RELOCATED )
                 continue;
 
             /* Don't overlap with other modules (or Xen itself). */
-            end = consider_modules(s, e, size, mod,
+            end = consider_modules(s, e, size, boot_info->mods,
                                    boot_info->nr_mods + relocated, j);
 
             if ( highmem_start && end > highmem_start )
@@ -1459,14 +1486,14 @@ void __init noreturn __start_xen(unsigned long mbi_p)
 
             if ( s < end &&
                  (headroom ||
-                  ((end - size) >> PAGE_SHIFT) > mod[j].mod_start) )
+                  ((end - size) >> PAGE_SHIFT) > mfn_x(boot_mod[j].mfn)) )
             {
                 move_memory(end - size + headroom,
-                            (uint64_t)mod[j].mod_start << PAGE_SHIFT,
-                            mod[j].mod_end);
-                mod[j].mod_start = (end - size) >> PAGE_SHIFT;
-                mod[j].mod_end += headroom;
-                mod[j].reserved = 1;
+                            (uint64_t)boot_mod[j].start,
+                            boot_mod[j].size);
+                bootmodule_update_start(&boot_mod[j], end - size);
+                boot_mod[j].size += headroom;
+                boot_mod[j].arch->flags |= BOOTMOD_FLAG_X86_RELOCATED;
             }
         }
 
@@ -1478,7 +1505,8 @@ void __init noreturn __start_xen(unsigned long mbi_p)
         while ( !kexec_crash_area.start )
         {
             /* Don't overlap with modules (or Xen itself). */
-            e = consider_modules(s, e, PAGE_ALIGN(kexec_crash_area.size), mod,
+            e = consider_modules(s, e, PAGE_ALIGN(kexec_crash_area.size),
+                                 boot_info->mods,
                                  boot_info->nr_mods + relocated, -1);
             if ( s >= e )
                 break;
@@ -1492,13 +1520,14 @@ void __init noreturn __start_xen(unsigned long mbi_p)
 #endif
     }
 
-    if ( boot_info->mods[0].arch->headroom && !mod->reserved )
+    if ( boot_info->mods[0].arch->headroom &&
+         !(boot_info->mods[0].arch->flags & BOOTMOD_FLAG_X86_RELOCATED) )
         panic("Not enough memory to relocate the dom0 kernel image\n");
     for ( i = 0; i < boot_info->nr_mods; ++i )
     {
-        uint64_t s = (uint64_t)mod[i].mod_start << PAGE_SHIFT;
+        uint64_t s = (uint64_t)boot_info->mods[i].start;
 
-        reserve_e820_ram(&boot_e820, s, s + PAGE_ALIGN(mod[i].mod_end));
+        reserve_e820_ram(&boot_e820, s, s + PAGE_ALIGN(boot_info->mods[i].size));
     }
 
     if ( !xen_phys_start )
@@ -1565,8 +1594,8 @@ void __init noreturn __start_xen(unsigned long mbi_p)
                 map_e = boot_e820.map[j].addr + boot_e820.map[j].size;
                 for ( j = 0; j < boot_info->nr_mods; ++j )
                 {
-                    uint64_t end = pfn_to_paddr(mod[j].mod_start) +
-                                   mod[j].mod_end;
+                    uint64_t end = mfn_to_maddr(boot_info->mods[j].mfn) +
+                                   boot_info->mods[j].size;
 
                     if ( map_e < end )
                         map_e = end;
@@ -1641,11 +1670,12 @@ void __init noreturn __start_xen(unsigned long mbi_p)
 
     for ( i = 0; i < boot_info->nr_mods; ++i )
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
@@ -2022,8 +2052,12 @@ void __init noreturn __start_xen(unsigned long mbi_p)
            cpu_has_nx ? XENLOG_INFO : XENLOG_WARNING "Warning: ",
            cpu_has_nx ? "" : "not ");
 
-    initrdidx = find_first_bit(module_map, boot_info->nr_mods);
-    if ( bitmap_weight(module_map, boot_info->nr_mods) > 1 )
+    initrdidx = bootmodule_index(boot_info, BOOTMOD_UNKNOWN, 0);
+    if ( initrdidx < boot_info->nr_mods )
+        boot_info->mods[initrdidx].bootmod_type = BOOTMOD_RAMDISK;
+
+    if ( bootmodule_index(boot_info, BOOTMOD_UNKNOWN, 0) >
+            boot_info->nr_mods )
         printk(XENLOG_WARNING
                "Multiple initrd candidates, picking module #%u\n",
                initrdidx);
@@ -2032,9 +2066,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
      * We're going to setup domain0 using the module(s) that we stashed safely
      * above our heap. The second module, if present, is an initrd ramdisk.
      */
-    dom0 = create_dom0(mod, boot_info->mods[0].arch->headroom,
-                       initrdidx < boot_info->nr_mods ? mod + initrdidx : NULL,
-                       kextra, loader);
+    dom0 = create_dom0(boot_info, kextra, loader);
     if ( !dom0 )
         panic("Could not set up DOM0 guest OS\n");
 
diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h
index eb93cc3439..2f4284a91f 100644
--- a/xen/include/xen/bootinfo.h
+++ b/xen/include/xen/bootinfo.h
@@ -2,23 +2,50 @@
 #define __XEN_BOOTINFO_H__
 
 #include <xen/types.h>
+#include <xen/compiler.h>
+#include <xen/mm-frame.h>
 
 #ifdef CONFIG_X86
 #include <asm/bootinfo.h>
 #else
     struct arch_bootmodule { };
+    struct arch_boot_info { };
 #endif
 
+/* Boot module binary type / purpose */
+#define BOOTMOD_UNKNOWN     0
+#define BOOTMOD_XEN         1
+#define BOOTMOD_FDT         2
+#define BOOTMOD_KERNEL      3
+#define BOOTMOD_RAMDISK     4
+#define BOOTMOD_XSM         5
+#define BOOTMOD_UCODE       6
+#define BOOTMOD_GUEST_DTB   7
+typedef unsigned int bootmod_type_t;
+
+#define BOOTMOD_STRING_MAX_LEN 1024
+struct boot_string {
+    char bytes[BOOTMOD_STRING_MAX_LEN];
+    size_t len;
+};
+
 struct boot_module {
+    bootmod_type_t bootmod_type;
     paddr_t start;
+    mfn_t mfn;
     size_t size;
 
     struct arch_bootmodule *arch;
+    struct boot_string string;
 };
 
 struct boot_info {
+    char *cmdline;
+
     unsigned int nr_mods;
     struct boot_module *mods;
+
+    struct arch_boot_info *arch;
 };
 
 #endif
-- 
2.25.1


