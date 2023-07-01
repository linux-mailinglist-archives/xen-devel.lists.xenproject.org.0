Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B9B7447A3
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jul 2023 09:19:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557772.871412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFUsi-0006u5-IN; Sat, 01 Jul 2023 07:18:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557772.871412; Sat, 01 Jul 2023 07:18:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFUsi-0006sI-Ex; Sat, 01 Jul 2023 07:18:56 +0000
Received: by outflank-mailman (input) for mailman id 557772;
 Sat, 01 Jul 2023 07:18:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ypVN=CT=gmail.com=christopher.w.clark.io@srs-se1.protection.inumbo.net>)
 id 1qFUsg-0006No-Gx
 for xen-devel@lists.xenproject.org; Sat, 01 Jul 2023 07:18:54 +0000
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [2607:f8b0:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87ad859c-17df-11ee-8611-37d641c3527e;
 Sat, 01 Jul 2023 09:18:52 +0200 (CEST)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-6687446eaccso2060682b3a.3
 for <xen-devel@lists.xenproject.org>; Sat, 01 Jul 2023 00:18:52 -0700 (PDT)
Received: from cog-dev.home ([70.103.208.83]) by smtp.gmail.com with ESMTPSA id
 s19-20020aa78d53000000b00673e652985bsm4108866pfe.118.2023.07.01.00.18.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jul 2023 00:18:49 -0700 (PDT)
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
X-Inumbo-ID: 87ad859c-17df-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688195930; x=1690787930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y6HSin/PPuTe3wUBWgklxdNFxDnMlcE+0e39paE0fXc=;
        b=rsJIkClYspba3EEC1R7kK3NAtOk5jq9qbQKs6V3a1+OyaOU9EdE4lyaLRwCxYjjR5y
         waqpW/joeTxkdrxBi10PoK/AZjaG5MFU0TAC4LNcWBKn/PdHFbpAAomjyxPEv6v8d6Wc
         My/L3c/7RcgdXVx8B4gdBlsXxc3Kyv5vQA3JMgm+XixOc9HLxFkHCAmkV/0cvQs3bmfF
         deiblMs2mJRWQ7elSOZskM4iJObW2t7Xd8DwX7/zQtYw3KUtyw9NnAup3AVYAzNlHXKQ
         eX9C1FZmaQKqFUMAAfRY08tDeXn8UUqcTPaQmf6U/vydMK1vxc+SUhlED09efS3rWVsM
         a/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688195930; x=1690787930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y6HSin/PPuTe3wUBWgklxdNFxDnMlcE+0e39paE0fXc=;
        b=E/UuqHWhozUqX7eS/KnX0J7d5LjhTtQfG+MHTtD8xQpvICPYsOrN1EjbdotvgZFLyz
         frB2sMfEr5L896R7go33msGrw2Ge4XJuGZ18nC4f98Ft66gDNEEaSzS4+33ziKhRaeQd
         VOFonzS0pHphu3y8JY/LwKX8cOzMtBZnFR59HmVCLUCIZ2fydoGyjtOTkXuYe38K9KHS
         qco0w9MHe5vpG/KckdRI935qgkRXpCj+5IXCw3gGXAeki2SS5By/lSiMMqg/IlDWMFiI
         Rr9tp1YMgWZ4lYA9zQ37X+fChUb0jFWPOhxO9ZSqYUifEkmtyh5gjRxveh+/WvO01/cp
         MSVw==
X-Gm-Message-State: ABy/qLaSAYxV1Qs7XMUcnRwz34tjvR57xcLzRBH1GF7b887T4SWpT/5K
	p6R4uNAq1WxwJi6vi6xuYmZm2seU060=
X-Google-Smtp-Source: APBJJlGazLVsxb16uFiIRgEsb22Vr4uL3fUVX8OBI0LxxvRLHfsnva3PurQ+L5rtOrS/CANPnVhzgw==
X-Received: by 2002:a05:6a00:24c9:b0:682:37be:c9fe with SMTP id d9-20020a056a0024c900b0068237bec9femr6300448pfv.10.1688195930443;
        Sat, 01 Jul 2023 00:18:50 -0700 (PDT)
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
Subject: [PATCH 02/10] x86 setup: per-arch bootmodule structure, headroom field
Date: Sat,  1 Jul 2023 00:18:27 -0700
Message-Id: <20230701071835.41599-3-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230701071835.41599-1-christopher.w.clark@gmail.com>
References: <20230701071835.41599-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Next step in incremental work towards adding a non-multiboot internal
representation of boot modules, converting the fields being accessed for
the startup calculations.

Add a new array of structs for per-boot-module state, though only
allocate space for a single array entry in this change since that is all
that is required for functionality modified in this patch: moving the
headroom field for the image decompression calculation into a new
per-arch boot module struct and then using it in x86 dom0 construction.

Introduces a per-arch header for x86 for arch-specific boot module
structures, and add a member to the common boot module structure for
access to it.

No functional change intended.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

---
Changes since v1: patch is a subset of v1 series patches 2 and 3.

 xen/arch/x86/bzimage.c              | 10 +++++-----
 xen/arch/x86/hvm/dom0_build.c       |  3 ++-
 xen/arch/x86/include/asm/bootinfo.h | 18 ++++++++++++++++++
 xen/arch/x86/include/asm/bzimage.h  |  2 +-
 xen/arch/x86/pv/dom0_build.c        |  3 ++-
 xen/arch/x86/setup.c                | 23 ++++++++++++++++-------
 xen/include/xen/bootinfo.h          | 11 +++++++++++
 7 files changed, 55 insertions(+), 15 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/bootinfo.h

diff --git a/xen/arch/x86/bzimage.c b/xen/arch/x86/bzimage.c
index ac4fd428be..dac2399b89 100644
--- a/xen/arch/x86/bzimage.c
+++ b/xen/arch/x86/bzimage.c
@@ -69,8 +69,6 @@ static __init int bzimage_check(struct setup_header *hdr, unsigned long len)
     return 1;
 }
 
-static unsigned long __initdata orig_image_len;
-
 unsigned long __init bzimage_headroom(void *image_start,
                                       unsigned long image_length)
 {
@@ -91,7 +89,6 @@ unsigned long __init bzimage_headroom(void *image_start,
     if ( elf_is_elfbinary(image_start, image_length) )
         return 0;
 
-    orig_image_len = image_length;
     headroom = output_length(image_start, image_length);
     if (gzip_check(image_start, image_length))
     {
@@ -105,11 +102,14 @@ unsigned long __init bzimage_headroom(void *image_start,
 }
 
 int __init bzimage_parse(void *image_base, void **image_start,
+                         unsigned int headroom,
                          unsigned long *image_len)
 {
     struct setup_header *hdr = (struct setup_header *)(*image_start);
     int err = bzimage_check(hdr, *image_len);
-    unsigned long output_len;
+    unsigned long output_len, orig_image_len;
+
+    orig_image_len = *image_len - headroom;
 
     if ( err < 0 )
         return err;
@@ -125,7 +125,7 @@ int __init bzimage_parse(void *image_base, void **image_start,
 
     BUG_ON(!(image_base < *image_start));
 
-    output_len = output_length(*image_start, orig_image_len);
+    output_len = output_length(*image_start, *image_len);
 
     if ( (err = perform_gunzip(image_base, *image_start, orig_image_len)) > 0 )
         err = decompress(*image_start, orig_image_len, image_base);
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index fd2cbf68bc..bf08998862 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -545,7 +545,8 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
     struct vcpu *v = d->vcpu[0];
     int rc;
 
-    if ( (rc = bzimage_parse(image_base, &image_start, &image_len)) != 0 )
+    if ( (rc = bzimage_parse(image_base, &image_start, image_headroom,
+                             &image_len)) != 0 )
     {
         printk("Error trying to detect bz compressed kernel\n");
         return rc;
diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
new file mode 100644
index 0000000000..a25054f372
--- /dev/null
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -0,0 +1,18 @@
+#ifndef __ARCH_X86_BOOTINFO_H__
+#define __ARCH_X86_BOOTINFO_H__
+
+struct arch_bootmodule {
+    unsigned headroom;
+};
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
diff --git a/xen/arch/x86/include/asm/bzimage.h b/xen/arch/x86/include/asm/bzimage.h
index 7ed69d3910..dd784f32ef 100644
--- a/xen/arch/x86/include/asm/bzimage.h
+++ b/xen/arch/x86/include/asm/bzimage.h
@@ -5,7 +5,7 @@
 
 unsigned long bzimage_headroom(void *image_start, unsigned long image_length);
 
-int bzimage_parse(void *image_base, void **image_start,
+int bzimage_parse(void *image_base, void **image_start, unsigned int headroom,
                   unsigned long *image_len);
 
 #endif /* __X86_BZIMAGE_H__ */
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index c99135a552..6ed9f8bbed 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -416,7 +416,8 @@ int __init dom0_construct_pv(struct domain *d,
 
     d->max_pages = ~0U;
 
-    if ( (rc = bzimage_parse(image_base, &image_start, &image_len)) != 0 )
+    if ( (rc = bzimage_parse(image_base, &image_start, image_headroom,
+                             &image_len)) != 0 )
         return rc;
 
     if ( (rc = elf_init(&elf, image_start, image_len)) != 0 )
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 708639b236..c0e8fc6ab7 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -273,10 +273,16 @@ static struct boot_info __initdata *boot_info;
 
 static void __init multiboot_to_bootinfo(multiboot_info_t *mbi)
 {
-    static struct boot_info __initdata info;
+    static struct boot_info       __initdata info;
+    static struct boot_module     __initdata boot_mods[1];
+    static struct arch_bootmodule __initdata arch_boot_mods[1];
+
+    info.mods = boot_mods;
 
     info.nr_mods = mbi->mods_count;
 
+    boot_mods[0].arch = &arch_boot_mods[0];
+
     boot_info = &info;
 }
 
@@ -961,7 +967,8 @@ static struct domain *__init create_dom0(const module_t *image,
         write_cr4(read_cr4() & ~X86_CR4_SMAP);
     }
 
-    if ( construct_dom0(d, image, headroom, initrd, cmdline) != 0 )
+    if ( construct_dom0(d, image, boot_info->mods[0].arch->headroom, initrd,
+                        cmdline) != 0 )
         panic("Could not construct domain 0\n");
 
     if ( cpu_has_smap )
@@ -985,7 +992,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
     unsigned int initrdidx, num_parked = 0;
     multiboot_info_t *mbi;
     module_t *mod;
-    unsigned long nr_pages, raw_max_page, modules_headroom, module_map[1];
+    unsigned long nr_pages, raw_max_page, module_map[1];
     int i, j, e820_warn = 0, bytes = 0;
     unsigned long eb_start, eb_end;
     bool acpi_boot_table_init_done = false, relocated = false;
@@ -1353,7 +1360,8 @@ void __init noreturn __start_xen(unsigned long mbi_p)
         mod[boot_info->nr_mods].mod_end = __2M_rwdata_end - _stext;
     }
 
-    modules_headroom = bzimage_headroom(bootstrap_map(mod), mod->mod_end);
+    boot_info->mods[0].arch->headroom = bzimage_headroom(bootstrap_map(mod),
+                                                         mod->mod_end);
     bootstrap_map(NULL);
 
 #ifndef highmem_start
@@ -1433,7 +1441,8 @@ void __init noreturn __start_xen(unsigned long mbi_p)
         /* Is the region suitable for relocating the multiboot modules? */
         for ( j = boot_info->nr_mods - 1; j >= 0; j-- )
         {
-            unsigned long headroom = j ? 0 : modules_headroom;
+            struct boot_module *boot_mods = boot_info->mods;
+            unsigned long headroom = j ? 0 : boot_mods[0].arch->headroom;
             unsigned long size = PAGE_ALIGN(headroom + mod[j].mod_end);
 
             if ( mod[j].reserved )
@@ -1481,7 +1490,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
 #endif
     }
 
-    if ( modules_headroom && !mod->reserved )
+    if ( boot_info->mods[0].arch->headroom && !mod->reserved )
         panic("Not enough memory to relocate the dom0 kernel image\n");
     for ( i = 0; i < boot_info->nr_mods; ++i )
     {
@@ -2021,7 +2030,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
      * We're going to setup domain0 using the module(s) that we stashed safely
      * above our heap. The second module, if present, is an initrd ramdisk.
      */
-    dom0 = create_dom0(mod, modules_headroom,
+    dom0 = create_dom0(mod, boot_info->mods[0].arch->headroom,
                        initrdidx < boot_info->nr_mods ? mod + initrdidx : NULL,
                        kextra, loader);
     if ( !dom0 )
diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h
index 6a7d55d20e..b72ae31a66 100644
--- a/xen/include/xen/bootinfo.h
+++ b/xen/include/xen/bootinfo.h
@@ -3,8 +3,19 @@
 
 #include <xen/types.h>
 
+#ifdef CONFIG_X86
+#include <asm/bootinfo.h>
+#else
+    struct arch_bootmodule { };
+#endif
+
+struct boot_module {
+    struct arch_bootmodule *arch;
+};
+
 struct boot_info {
     unsigned int nr_mods;
+    struct boot_module *mods;
 };
 
 #endif
-- 
2.25.1


