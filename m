Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6A974459D
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jul 2023 02:32:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557668.871236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFOWj-0000Ak-69; Sat, 01 Jul 2023 00:31:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557668.871236; Sat, 01 Jul 2023 00:31:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFOWj-0008Vc-1o; Sat, 01 Jul 2023 00:31:49 +0000
Received: by outflank-mailman (input) for mailman id 557668;
 Sat, 01 Jul 2023 00:31:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ypVN=CT=gmail.com=christopher.w.clark.io@srs-se1.protection.inumbo.net>)
 id 1qFOWh-0007yM-QK
 for xen-devel@lists.xenproject.org; Sat, 01 Jul 2023 00:31:47 +0000
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [2607:f8b0:4864:20::112a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7cb92e4-17a6-11ee-8611-37d641c3527e;
 Sat, 01 Jul 2023 02:31:44 +0200 (CEST)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-5701e8f2b79so27334707b3.0
 for <xen-devel@lists.xenproject.org>; Fri, 30 Jun 2023 17:31:44 -0700 (PDT)
Received: from cog-dev.home ([70.103.208.83]) by smtp.gmail.com with ESMTPSA id
 s68-20020a632c47000000b0055b61cd99a1sm1824296pgs.81.2023.06.30.17.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 17:31:42 -0700 (PDT)
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
X-Inumbo-ID: a7cb92e4-17a6-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688171503; x=1690763503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqQqqF0IyJ/PuKXVXwFAfGVp5jzTeAtO0YKlHbSfXAU=;
        b=d+tq/rbAfNr5yHLcrKURrSqr0rJdRYKlNsfHaEao/XBIfLlqSHBeZDOh6Co8fB7AdZ
         lUj+VBO5+5quL7CbuIRyuJOG5+akeVBPPcpaF/fItBEAOdlsGJ/j0yvO5SBKTGS/DrwT
         k/ZGa6qjJ1yABSQNwvhpdip4eF2079ZAJ5g5EpA5x3sw4EvMMV7JSxZ5ZhrAw1GPJWeu
         xFH9LrxE8SIjPMBeE4wDYtpzOsDrD1yY5JDc2rqoqcfcHmDhrztTG+cKFyacpwW0NDAT
         rPe2NjV6ePCwpCbYnrfg7Rxh/2EH2dA0G5DJM4YStZR20n7Vu4oVD9XZwPZ3jtH9tc6b
         WarA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688171503; x=1690763503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sqQqqF0IyJ/PuKXVXwFAfGVp5jzTeAtO0YKlHbSfXAU=;
        b=BeRPAKMC7NkuJh14+53YHyJRxcftOMh1U67mwx62IeCagdlroJQKwcYRgx5S/ov8Bd
         IbzWJAplB+qGjxz/Lvvq/ECzU4vlzlYjqIrCe/ziOSmWPuPJoeqBQF65lqkh8R4f24qg
         p6Xpd7H7sJkW3J6zRSjgQkV5zX0FY1OrAgOthRk28p05oeEf0fqNzhM2iLXeNc9ftnpE
         vB+dhrH0cbFkuOXxxFtEh7H94qHK9C39Jt1XOUR8Cz1qOrYe/BwI5VsJqHUzGtPd5eUJ
         AXyqn4A+7SGS6e6yTU/6WcwCERc21H/RQJjXVuBqZuV3t/HjVQHYCP4JeavU/FeDObg/
         7awA==
X-Gm-Message-State: ABy/qLbH3/KLIHZw+ttmPzoyQVmgujsAf5ukPLWVqRJJ63koMZGse5/t
	oZuIwIogHBShvJ/jLyr8FJ6WXIq6f/4=
X-Google-Smtp-Source: APBJJlGhQ1CFMj7J8a/Nqrkm+dSxRfTiP6kfcYG7qn5RNbcc78vyoNL6EmmGS4YOue+8pyYX/4D9jw==
X-Received: by 2002:a81:de49:0:b0:56d:2981:e2e2 with SMTP id o9-20020a81de49000000b0056d2981e2e2mr3897669ywl.6.1688171503257;
        Fri, 30 Jun 2023 17:31:43 -0700 (PDT)
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
Subject: [PATCH 03/11] x86 setup: change bootstrap map to accept new boot module structures
Date: Fri, 30 Jun 2023 17:31:24 -0700
Message-Id: <20230701003132.2210306-4-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230701003132.2210306-1-christopher.w.clark@gmail.com>
References: <20230701003132.2210306-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To convert the x86 boot logic from multiboot to boot module structures,
change the bootstrap map function to accept a boot module parameter.

To allow incremental change from multiboot to boot modules across all
x86 setup logic, provide a temporary inline wrapper that still accepts a
multiboot module parameter and use it where necessary. The wrapper is
placed in a new arch/x86 header <asm/boot.h> to avoid putting a static
inline function into an existing header that has no such functions
already. This new header will be expanded with additional functions in
subsequent patches in this series.

No functional change intended.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

changes since v1:
- new patch so v1 patch 3 can be implemented via incremental series
---
 xen/arch/x86/cpu/microcode/core.c |  7 ++++---
 xen/arch/x86/hvm/dom0_build.c     |  4 +++-
 xen/arch/x86/include/asm/boot.h   | 32 +++++++++++++++++++++++++++++++
 xen/arch/x86/include/asm/setup.h  |  3 ++-
 xen/arch/x86/pv/dom0_build.c      |  3 ++-
 xen/arch/x86/setup.c              | 18 +++++++++--------
 xen/include/xen/bootinfo.h        |  3 +++
 xen/xsm/xsm_policy.c              |  3 ++-
 8 files changed, 58 insertions(+), 15 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/boot.h

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index cd456c476f..e720a89167 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -34,6 +34,7 @@
 #include <xen/watchdog.h>
 
 #include <asm/apic.h>
+#include <asm/boot.h>
 #include <asm/cpu-policy.h>
 #include <asm/delay.h>
 #include <asm/nmi.h>
@@ -180,7 +181,7 @@ void __init microcode_scan_module(
         if ( !test_bit(i, module_map) )
             continue;
 
-        _blob_start = bootstrap_map(&mod[i]);
+        _blob_start = bootstrap_map_multiboot(&mod[i]);
         _blob_size = mod[i].mod_end;
         if ( !_blob_start )
         {
@@ -794,7 +795,7 @@ int __init microcode_init_cache(unsigned long *module_map,
         microcode_scan_module(module_map, mbi);
 
     if ( ucode_mod.mod_end )
-        rc = early_update_cache(bootstrap_map(&ucode_mod),
+        rc = early_update_cache(bootstrap_map_multiboot(&ucode_mod),
                                 ucode_mod.mod_end);
     else if ( ucode_blob.size )
         rc = early_update_cache(ucode_blob.data, ucode_blob.size);
@@ -817,7 +818,7 @@ static int __init early_microcode_update_cpu(void)
     else if ( ucode_mod.mod_end )
     {
         len = ucode_mod.mod_end;
-        data = bootstrap_map(&ucode_mod);
+        data = bootstrap_map_multiboot(&ucode_mod);
     }
 
     if ( !data )
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index bf08998862..56fe89632b 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -16,6 +16,7 @@
 
 #include <acpi/actables.h>
 
+#include <asm/boot.h>
 #include <asm/bzimage.h>
 #include <asm/dom0_build.h>
 #include <asm/hvm/support.h>
@@ -1208,7 +1209,8 @@ int __init dom0_construct_pvh(struct domain *d, const module_t *image,
         return rc;
     }
 
-    rc = pvh_load_kernel(d, image, image_headroom, initrd, bootstrap_map(image),
+    rc = pvh_load_kernel(d, image, image_headroom, initrd,
+                         bootstrap_map_multiboot(image),
                          cmdline, &entry, &start_info);
     if ( rc )
     {
diff --git a/xen/arch/x86/include/asm/boot.h b/xen/arch/x86/include/asm/boot.h
new file mode 100644
index 0000000000..10b17f12b2
--- /dev/null
+++ b/xen/arch/x86/include/asm/boot.h
@@ -0,0 +1,32 @@
+#ifndef __ASM_X86_BOOT_H__
+#define __ASM_X86_BOOT_H__
+
+#include <xen/bootinfo.h>
+#include <xen/multiboot.h>
+
+#include <asm/setup.h>
+
+static inline void *bootstrap_map_multiboot(const module_t *mod)
+{
+    struct boot_module bm;
+
+    if ( !mod )
+        return bootstrap_map(NULL);
+
+    bm.start = mod->mod_start << PAGE_SHIFT;
+    bm.size = mod->mod_end;
+
+    return bootstrap_map(&bm);
+}
+
+#endif
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index ae0dd3915a..80d0bb2a21 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -1,6 +1,7 @@
 #ifndef __X86_SETUP_H_
 #define __X86_SETUP_H_
 
+#include <xen/bootinfo.h>
 #include <xen/multiboot.h>
 #include <asm/numa.h>
 
@@ -40,7 +41,7 @@ void setup_io_bitmap(struct domain *d);
 
 unsigned long initial_images_nrpages(nodeid_t node);
 void discard_initial_images(void);
-void *bootstrap_map(const module_t *mod);
+void *bootstrap_map(const struct boot_module *mod);
 
 int xen_in_range(unsigned long mfn);
 
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 6ed9f8bbed..4fe806b60d 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -14,6 +14,7 @@
 #include <xen/sched.h>
 #include <xen/softirq.h>
 
+#include <asm/boot.h>
 #include <asm/bzimage.h>
 #include <asm/dom0_build.h>
 #include <asm/guest.h>
@@ -374,7 +375,7 @@ int __init dom0_construct_pv(struct domain *d,
     unsigned int flush_flags = 0;
     start_info_t *si;
     struct vcpu *v = d->vcpu[0];
-    void *image_base = bootstrap_map(image);
+    void *image_base = bootstrap_map_multiboot(image);
     unsigned long image_len = image->mod_end;
     void *image_start = image_base + image_headroom;
     unsigned long initrd_len = initrd ? initrd->mod_end : 0;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index c0e8fc6ab7..3b623a4149 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -32,6 +32,7 @@
 #include <compat/xen.h>
 #endif
 #include <xen/bitops.h>
+#include <asm/boot.h>
 #include <asm/smp.h>
 #include <asm/processor.h>
 #include <asm/mpspec.h>
@@ -405,14 +406,14 @@ static void __init normalise_cpu_order(void)
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
@@ -421,8 +422,8 @@ void *__init bootstrap_map(const module_t *mod)
         return NULL;
     }
 
-    start = (uint64_t)mod->mod_start << PAGE_SHIFT;
-    end = start + mod->mod_end;
+    start = (uint64_t)mod->start;
+    end = start + mod->size;
     if ( start >= end )
         return NULL;
 
@@ -460,7 +461,7 @@ static void __init move_memory(
         if ( mod.mod_end > blksz )
             mod.mod_end = blksz;
         sz = mod.mod_end - soffs;
-        s = bootstrap_map(&mod);
+        s = bootstrap_map_multiboot(&mod);
 
         mod.mod_start = (dst - doffs) >> PAGE_SHIFT;
         mod.mod_end = doffs + size;
@@ -468,7 +469,7 @@ static void __init move_memory(
             mod.mod_end = blksz;
         if ( sz > mod.mod_end - doffs )
             sz = mod.mod_end - doffs;
-        d = bootstrap_map(&mod);
+        d = bootstrap_map_multiboot(&mod);
 
         memmove(d + doffs, s + soffs, sz);
 
@@ -1360,8 +1361,9 @@ void __init noreturn __start_xen(unsigned long mbi_p)
         mod[boot_info->nr_mods].mod_end = __2M_rwdata_end - _stext;
     }
 
-    boot_info->mods[0].arch->headroom = bzimage_headroom(bootstrap_map(mod),
-                                                         mod->mod_end);
+    boot_info->mods[0].arch->headroom =
+        bzimage_headroom(bootstrap_map_multiboot(mod), mod->mod_end);
+
     bootstrap_map(NULL);
 
 #ifndef highmem_start
diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h
index b72ae31a66..eb93cc3439 100644
--- a/xen/include/xen/bootinfo.h
+++ b/xen/include/xen/bootinfo.h
@@ -10,6 +10,9 @@
 #endif
 
 struct boot_module {
+    paddr_t start;
+    size_t size;
+
     struct arch_bootmodule *arch;
 };
 
diff --git a/xen/xsm/xsm_policy.c b/xen/xsm/xsm_policy.c
index 8dafbc9381..c6df8c6e06 100644
--- a/xen/xsm/xsm_policy.c
+++ b/xen/xsm/xsm_policy.c
@@ -20,6 +20,7 @@
 
 #include <xsm/xsm.h>
 #ifdef CONFIG_MULTIBOOT
+#include <asm/boot.h>
 #include <xen/multiboot.h>
 #include <asm/setup.h>
 #endif
@@ -49,7 +50,7 @@ int __init xsm_multiboot_policy_init(
         if ( !test_bit(i, module_map) )
             continue;
 
-        _policy_start = bootstrap_map(mod + i);
+        _policy_start = bootstrap_map_multiboot(mod + i);
         _policy_len   = mod[i].mod_end;
 
         if ( (xsm_magic_t)(*_policy_start) == XSM_MAGIC )
-- 
2.25.1


