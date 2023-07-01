Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFB97447A9
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jul 2023 09:19:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557782.871492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFUst-0000p2-8U; Sat, 01 Jul 2023 07:19:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557782.871492; Sat, 01 Jul 2023 07:19:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFUss-0000hD-RG; Sat, 01 Jul 2023 07:19:06 +0000
Received: by outflank-mailman (input) for mailman id 557782;
 Sat, 01 Jul 2023 07:19:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ypVN=CT=gmail.com=christopher.w.clark.io@srs-se1.protection.inumbo.net>)
 id 1qFUsr-0006No-4Y
 for xen-devel@lists.xenproject.org; Sat, 01 Jul 2023 07:19:05 +0000
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [2607:f8b0:4864:20::736])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8dd6c1a5-17df-11ee-8611-37d641c3527e;
 Sat, 01 Jul 2023 09:19:02 +0200 (CEST)
Received: by mail-qk1-x736.google.com with SMTP id
 af79cd13be357-76243a787a7so258385885a.2
 for <xen-devel@lists.xenproject.org>; Sat, 01 Jul 2023 00:19:02 -0700 (PDT)
Received: from cog-dev.home ([70.103.208.83]) by smtp.gmail.com with ESMTPSA id
 s19-20020aa78d53000000b00673e652985bsm4108866pfe.118.2023.07.01.00.18.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jul 2023 00:19:00 -0700 (PDT)
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
X-Inumbo-ID: 8dd6c1a5-17df-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688195941; x=1690787941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNW+AYrQKnLKNbbn3YFHqN8Eo0KMGaoZgm6SWc5V5+U=;
        b=qvF+gtJkoOs75NZJtm/YNXiKKQiLpYV8Y3dP7sx/ZVMfFQucgbJ4JPROG2R+wI/TQi
         a45pGXHMyaE0jPCw7+//2MUPsVP9KgAysnKEicYtp3WZovkZQQPlxCuA719HmyD74HO1
         unyeo+6N4GSUUDY/sgkLbehx0YyLJ2o97ems715x8/oHTNjpivLHonYtCgMz+Q0f7+CG
         zAx4YUuqf3WfpkY1ZSzqlQWmphc6LSVZojpSYHpqBWmmCUsIMxlBuzfmJ2PJgkRqt/l5
         7OJ6GJKmx+qSaaNCfsdhuOKIk2hhC33IzQkm6bAfGj9Zq+7GsSRBTlI48iWkpMGpNVIl
         +8iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688195941; x=1690787941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kNW+AYrQKnLKNbbn3YFHqN8Eo0KMGaoZgm6SWc5V5+U=;
        b=LYMPLgOObjJDJQ9abW1bEqxVRVB0a0sJ6Q1OJ0TBjXzIU883r65zWgAxe0Dgj+9k+y
         ueKpRDY3oSJ3OlQFQKlp+Atnbfi/AJSLlRzFQemnaHpVsMvgaN/zJFJW1LMBC98caJ/3
         pYcRNMlyZvolvTgHNXiVYAF6ZRggXbYC14lVOjQAkvD0J6ErTL7sMpiifq6LjwTfEI1H
         I7iLX/NG45aQpBSWKrV6NHxN14xom1ak/gyiYkCEqgsQCtcrF5NJvWqqWgNDqvRVAlor
         B8EGL/guAC5wEBgFpL7Jm0leR/pMXN8U6Es4q2ZHQcPwyg53ZUk7ixVE9zexQSMvRWqI
         Z3Cg==
X-Gm-Message-State: AC+VfDw2h2rGKn68hsyPwWJY/EFLhzLRW1JQG+DcT7/BTS9HV6QKtL6g
	o94eiNEnQ+G9eAawjSpO7/uHLaFY3w0=
X-Google-Smtp-Source: APBJJlFJOLvrQlTlbqeQdDwnW6s8Hbn/JAaopGLjUO8Ra0690Bt6OVuKd2cSZp766Vnno7X0T+4SJQ==
X-Received: by 2002:a05:620a:2807:b0:767:382d:a203 with SMTP id f7-20020a05620a280700b00767382da203mr4959710qkp.36.1688195940769;
        Sat, 01 Jul 2023 00:19:00 -0700 (PDT)
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
Subject: [PATCH 10/10] x86 setup: refactor efi, pvh and multiboot entrypoints to new boot info
Date: Sat,  1 Jul 2023 00:18:35 -0700
Message-Id: <20230701071835.41599-11-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230701071835.41599-1-christopher.w.clark@gmail.com>
References: <20230701071835.41599-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Previous commits added a transition point from multiboot v1 structures
to the new boot info structures at the earliest common point for all the
x86 entrypoints. The result is that each of the entrypoints would
construct a multiboot v1 structure from the structures used by each
entrypoint.  This meant that multiboot2, EFI, and PVH all converted
their structures over to mutliboot v1 to only be converted again upon
entering __start_xen().

This commit drops the translation function and moves the population of
the new boot info structures down into the various entrypoints.

This change increases the maximum number of boot modules accepted on the
EFI entry path and the PVH entry path to the same fixed maximum number
accepted via multiboot, making it common across all x86 entry points.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

---
Changes since v1: patch is based on v1 series patch 4.
- use main bootinfo headers in boot logic instead of adding a 32-bit version
- apply packing to boot structures here rather than in earlier changes
- use a defined maximum number of boot modules rather than Kconfig'd variable

 xen/arch/arm/efi/efi-boot.h               |   6 +
 xen/arch/x86/boot/defs.h                  |   1 +
 xen/arch/x86/boot/reloc.c                 | 192 +++++++++++++++-------
 xen/arch/x86/efi/efi-boot.h               |  95 ++++++-----
 xen/arch/x86/guest/xen/pvh-boot.c         |  64 +++++---
 xen/arch/x86/include/asm/bootinfo.h       |   7 +-
 xen/arch/x86/include/asm/guest/pvh-boot.h |   6 +-
 xen/arch/x86/setup.c                      |  73 +++-----
 xen/common/efi/boot.c                     |   4 +-
 xen/include/xen/bootinfo.h                |   9 +-
 10 files changed, 278 insertions(+), 179 deletions(-)

diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index bb64925d70..d931fe06ed 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -1003,6 +1003,12 @@ static void __init efi_arch_flush_dcache_area(const void *vaddr, UINTN size)
     __flush_dcache_area(vaddr, size);
 }
 
+static struct boot_info __init *efi_arch_bootinfo_init(void)
+{
+    /* boot modules not currently in use on Arm so no init required here */
+    return NULL;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/boot/defs.h b/xen/arch/x86/boot/defs.h
index bc0f1b5cf8..519ca4dae6 100644
--- a/xen/arch/x86/boot/defs.h
+++ b/xen/arch/x86/boot/defs.h
@@ -44,6 +44,7 @@
         _x > _y ? _x : _y; })
 
 #define _p(val)		((void *)(unsigned long)(val))
+#define _addr(val)  ((unsigned long)(void *)(val))
 
 #define tolower(c)	((c) | 0x20)
 
diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
index e22bb974bf..8a48572d5f 100644
--- a/xen/arch/x86/boot/reloc.c
+++ b/xen/arch/x86/boot/reloc.c
@@ -27,6 +27,8 @@ asm (
     );
 
 #include "defs.h"
+#include "../include/asm/bootinfo.h"
+#include "../../../include/xen/bootinfo.h"
 #include "../../../include/xen/multiboot.h"
 #include "../../../include/xen/multiboot2.h"
 
@@ -138,65 +140,116 @@ static struct hvm_start_info *pvh_info_reloc(u32 in)
     return out;
 }
 
-static multiboot_info_t *mbi_reloc(u32 mbi_in)
+static struct boot_info *mbi_reloc(u32 mbi_in)
 {
+    const multiboot_info_t *mbi = _p(mbi_in);
+    struct boot_info *binfo;
+    struct arch_boot_info *arch_binfo;
     int i;
-    multiboot_info_t *mbi_out;
+    uint32_t ptr;
 
-    mbi_out = _p(copy_mem(mbi_in, sizeof(*mbi_out)));
+    ptr = alloc_mem(sizeof(*binfo));
+    zero_mem(ptr, sizeof(*binfo));
+    binfo = _p(ptr);
 
-    if ( mbi_out->flags & MBI_CMDLINE )
-        mbi_out->cmdline = copy_string(mbi_out->cmdline);
+    ptr = alloc_mem(sizeof(*arch_binfo));
+    zero_mem(ptr, sizeof(*arch_binfo));
+    binfo->arch = ptr;
+    arch_binfo = _p(ptr);
 
-    if ( mbi_out->flags & MBI_MODULES )
+    if ( mbi->flags & MBI_CMDLINE )
+    {
+        ptr = copy_string(mbi->cmdline);
+        binfo->cmdline = ptr;
+        arch_binfo->flags |= BOOTINFO_FLAG_X86_CMDLINE;
+    }
+
+    if ( mbi->flags & MBI_MODULES )
     {
         module_t *mods;
+        struct boot_module *bi_mods;
+        struct arch_bootmodule *arch_bi_mods;
+
+        /*
+         * We have to allocate one more module slot here. At some point
+         * __start_xen() may put Xen image placement into it.
+         */
+        ptr = alloc_mem((mbi->mods_count + 1) * sizeof(*bi_mods));
+        binfo->nr_mods = mbi->mods_count;
+        binfo->mods = ptr;
+        bi_mods = _p(ptr);
 
-        mbi_out->mods_addr = copy_mem(mbi_out->mods_addr,
-                                      mbi_out->mods_count * sizeof(module_t));
+        ptr = alloc_mem((mbi->mods_count + 1) * sizeof(*arch_bi_mods));
+        arch_bi_mods = _p(ptr);
 
-        mods = _p(mbi_out->mods_addr);
+        /* map the +1 allocated for Xen image */
+        bi_mods[mbi->mods_count].arch = _addr(&arch_bi_mods[mbi->mods_count]);
 
-        for ( i = 0; i < mbi_out->mods_count; i++ )
+        arch_binfo->flags |= BOOTINFO_FLAG_X86_MODULES;
+
+        mods = _p(mbi->mods_addr);
+
+        for ( i = 0; i < mbi->mods_count; i++ )
         {
+            bi_mods[i].start = mods[i].mod_start;
+            bi_mods[i].size = mods[i].mod_end - mods[i].mod_start;
+
             if ( mods[i].string )
-                mods[i].string = copy_string(mods[i].string);
+            {
+                int j;
+                char *c = _p(mods[i].string);
+
+                for ( j = 0; *c != '\0'; j++, c++ )
+                    bi_mods[i].string.bytes[j] = *c;
+
+                bi_mods[i].string.len = j + 1;
+            }
+
+            bi_mods[i].arch = _addr(&arch_bi_mods[i]);
         }
     }
 
-    if ( mbi_out->flags & MBI_MEMMAP )
-        mbi_out->mmap_addr = copy_mem(mbi_out->mmap_addr, mbi_out->mmap_length);
-
-    if ( mbi_out->flags & MBI_LOADERNAME )
-        mbi_out->boot_loader_name = copy_string(mbi_out->boot_loader_name);
+    if ( mbi->flags & MBI_MEMMAP )
+    {
+        arch_binfo->mmap_addr = copy_mem(mbi->mmap_addr, mbi->mmap_length);
+        arch_binfo->mmap_length = mbi->mmap_length;
+        arch_binfo->flags |= BOOTINFO_FLAG_X86_MEMMAP;
+    }
 
-    /* Mask features we don't understand or don't relocate. */
-    mbi_out->flags &= (MBI_MEMLIMITS |
-                       MBI_CMDLINE |
-                       MBI_MODULES |
-                       MBI_MEMMAP |
-                       MBI_LOADERNAME);
+    if ( mbi->flags & MBI_LOADERNAME )
+    {
+        ptr = copy_string(mbi->boot_loader_name);
+        arch_binfo->boot_loader_name = ptr;
+        arch_binfo->flags |= BOOTINFO_FLAG_X86_LOADERNAME;
+    }
 
-    return mbi_out;
+    return binfo;
 }
 
-static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
+static struct boot_info *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
 {
     const multiboot2_fixed_t *mbi_fix = _p(mbi_in);
     const multiboot2_memory_map_t *mmap_src;
     const multiboot2_tag_t *tag;
-    module_t *mbi_out_mods = NULL;
     memory_map_t *mmap_dst;
-    multiboot_info_t *mbi_out;
+    struct boot_info *binfo;
+    struct arch_boot_info *arch_binfo;
+    struct boot_module *bi_mods;
+    struct arch_bootmodule *arch_bi_mods;
 #ifdef CONFIG_VIDEO
     struct boot_video_info *video = NULL;
 #endif
     u32 ptr;
     unsigned int i, mod_idx = 0;
 
-    ptr = alloc_mem(sizeof(*mbi_out));
-    mbi_out = _p(ptr);
-    zero_mem(ptr, sizeof(*mbi_out));
+    ptr = alloc_mem(sizeof(*binfo));
+    zero_mem(ptr, sizeof(*binfo));
+    binfo = _p(ptr);
+
+    ptr = alloc_mem(sizeof(*arch_binfo));
+    zero_mem(ptr, sizeof(*arch_binfo));
+    binfo->arch = ptr;
+    arch_binfo = _p(ptr);
 
     /* Skip Multiboot2 information fixed part. */
     ptr = ALIGN_UP(mbi_in + sizeof(*mbi_fix), MULTIBOOT2_TAG_ALIGN);
@@ -206,21 +259,28 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
           tag = _p(ALIGN_UP((u32)tag + tag->size, MULTIBOOT2_TAG_ALIGN)) )
     {
         if ( tag->type == MULTIBOOT2_TAG_TYPE_MODULE )
-            ++mbi_out->mods_count;
+            ++binfo->nr_mods;
         else if ( tag->type == MULTIBOOT2_TAG_TYPE_END )
             break;
     }
 
-    if ( mbi_out->mods_count )
+    if ( binfo->nr_mods )
     {
-        mbi_out->flags |= MBI_MODULES;
         /*
          * We have to allocate one more module slot here. At some point
          * __start_xen() may put Xen image placement into it.
          */
-        mbi_out->mods_addr = alloc_mem((mbi_out->mods_count + 1) *
-                                       sizeof(*mbi_out_mods));
-        mbi_out_mods = _p(mbi_out->mods_addr);
+        ptr = alloc_mem((binfo->nr_mods + 1) * sizeof(*bi_mods));
+        binfo->mods = ptr;
+        bi_mods = _p(ptr);
+
+        ptr = alloc_mem((binfo->nr_mods + 1) * sizeof(*arch_bi_mods));
+        arch_bi_mods = _p(ptr);
+
+        /* map the +1 allocated for Xen image */
+        bi_mods[binfo->nr_mods].arch = _addr(&arch_bi_mods[binfo->nr_mods]);
+
+        arch_binfo->flags |= BOOTINFO_FLAG_X86_MODULES;
     }
 
     /* Skip Multiboot2 information fixed part. */
@@ -232,39 +292,42 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
         switch ( tag->type )
         {
         case MULTIBOOT2_TAG_TYPE_BOOT_LOADER_NAME:
-            mbi_out->flags |= MBI_LOADERNAME;
             ptr = get_mb2_string(tag, string, string);
-            mbi_out->boot_loader_name = copy_string(ptr);
+            arch_binfo->boot_loader_name = copy_string(ptr);
+            arch_binfo->flags |= BOOTINFO_FLAG_X86_LOADERNAME;
             break;
 
         case MULTIBOOT2_TAG_TYPE_CMDLINE:
-            mbi_out->flags |= MBI_CMDLINE;
             ptr = get_mb2_string(tag, string, string);
-            mbi_out->cmdline = copy_string(ptr);
+            binfo->cmdline = copy_string(ptr);
+            arch_binfo->flags |= BOOTINFO_FLAG_X86_CMDLINE;
             break;
 
         case MULTIBOOT2_TAG_TYPE_BASIC_MEMINFO:
-            mbi_out->flags |= MBI_MEMLIMITS;
-            mbi_out->mem_lower = get_mb2_data(tag, basic_meminfo, mem_lower);
-            mbi_out->mem_upper = get_mb2_data(tag, basic_meminfo, mem_upper);
+            arch_binfo->mem_lower = get_mb2_data(tag, basic_meminfo,
+                                                    mem_lower);
+            arch_binfo->mem_upper = get_mb2_data(tag, basic_meminfo,
+                                                    mem_upper);
             break;
 
         case MULTIBOOT2_TAG_TYPE_MMAP:
             if ( get_mb2_data(tag, mmap, entry_size) < sizeof(*mmap_src) )
                 break;
 
-            mbi_out->flags |= MBI_MEMMAP;
-            mbi_out->mmap_length = get_mb2_data(tag, mmap, size);
-            mbi_out->mmap_length -= sizeof(multiboot2_tag_mmap_t);
-            mbi_out->mmap_length /= get_mb2_data(tag, mmap, entry_size);
-            mbi_out->mmap_length *= sizeof(*mmap_dst);
+            arch_binfo->mmap_length = get_mb2_data(tag, mmap, size);
+            arch_binfo->mmap_length -= sizeof(multiboot2_tag_mmap_t);
+            arch_binfo->mmap_length /= get_mb2_data(tag, mmap, entry_size);
+            arch_binfo->mmap_length *= sizeof(*mmap_dst);
 
-            mbi_out->mmap_addr = alloc_mem(mbi_out->mmap_length);
+            arch_binfo->mmap_addr = alloc_mem(arch_binfo->mmap_length);
+            arch_binfo->flags |= BOOTINFO_FLAG_X86_MEMMAP;
 
             mmap_src = get_mb2_data(tag, mmap, entries);
-            mmap_dst = _p(mbi_out->mmap_addr);
+            mmap_dst = _p(arch_binfo->mmap_addr);
 
-            for ( i = 0; i < mbi_out->mmap_length / sizeof(*mmap_dst); i++ )
+            for ( i = 0;
+                  i < arch_binfo->mmap_length / sizeof(*mmap_dst);
+                  i++ )
             {
                 /* Init size member properly. */
                 mmap_dst[i].size = sizeof(*mmap_dst);
@@ -280,14 +343,27 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
             break;
 
         case MULTIBOOT2_TAG_TYPE_MODULE:
-            if ( mod_idx >= mbi_out->mods_count )
+            if ( mod_idx >= binfo->nr_mods )
                 break;
 
-            mbi_out_mods[mod_idx].mod_start = get_mb2_data(tag, module, mod_start);
-            mbi_out_mods[mod_idx].mod_end = get_mb2_data(tag, module, mod_end);
+            bi_mods[mod_idx].start = get_mb2_data(tag, module, mod_start);
+            bi_mods[mod_idx].size = get_mb2_data(tag, module, mod_end)
+                                            - bi_mods[mod_idx].start;
+
             ptr = get_mb2_string(tag, module, cmdline);
-            mbi_out_mods[mod_idx].string = copy_string(ptr);
-            mbi_out_mods[mod_idx].reserved = 0;
+            if ( ptr )
+            {
+                int i;
+                char *c = _p(ptr);
+
+                for ( i = 0; *c != '\0'; i++, c++ )
+                    bi_mods[mod_idx].string.bytes[i] = *c;
+
+                bi_mods[mod_idx].string.len = i + 1;
+            }
+
+            bi_mods[mod_idx].arch = _addr(&arch_bi_mods[mod_idx]);
+
             ++mod_idx;
             break;
 
@@ -344,11 +420,11 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
         video->orig_video_isVGA = 0x23;
 #endif
 
-    return mbi_out;
+    return binfo;
 }
 
-void *__stdcall reloc(uint32_t magic, uint32_t in, uint32_t trampoline,
-                      uint32_t video_info)
+void *__stdcall reloc(
+    uint32_t magic, uint32_t in, uint32_t trampoline, uint32_t video_info)
 {
     alloc = trampoline;
 
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 64c1a02cf1..c05759b761 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -11,14 +11,17 @@
 #include <asm/setup.h>
 
 static struct file __initdata ucode;
-static multiboot_info_t __initdata mbi = {
-    .flags = MBI_MODULES | MBI_LOADERNAME
-};
+
+static struct boot_info __initdata efi_bi;
+static struct arch_boot_info __initdata efi_bi_arch;
 /*
  * The array size needs to be one larger than the number of modules we
  * support - see __start_xen().
  */
-static module_t __initdata mb_modules[5];
+static struct boot_module __initdata efi_mods[MAX_NR_BOOTMODS + 1];
+static struct arch_bootmodule __initdata efi_arch_mods[MAX_NR_BOOTMODS + 1];
+
+static const char *__initdata efi_loader = "PVH Directboot";
 
 static void __init edd_put_string(u8 *dst, size_t n, const char *src)
 {
@@ -271,20 +274,37 @@ static void __init noreturn efi_arch_post_exit_boot(void)
                    : [cr3] "r" (idle_pg_table),
                      [cs] "i" (__HYPERVISOR_CS),
                      [ds] "r" (__HYPERVISOR_DS),
-                     "D" (&mbi)
+                     "D" (&efi_bi)
                    : "memory" );
     unreachable();
 }
 
-static void __init efi_arch_cfg_file_early(const EFI_LOADED_IMAGE *image,
-                                           EFI_FILE_HANDLE dir_handle,
-                                           const char *section)
+static struct boot_info __init *efi_arch_bootinfo_init(void)
 {
+    int i;
+
+    efi_bi.arch = &efi_bi_arch;
+    efi_bi.mods = efi_mods;
+
+    for ( i=0; i <= MAX_NR_BOOTMODS; i++ )
+        efi_bi.mods[i].arch = &efi_arch_mods[i];
+
+    efi_bi_arch.boot_loader_name = _p(efi_loader);
+
+    efi_bi_arch.flags = BOOTINFO_FLAG_X86_MODULES |
+                        BOOTINFO_FLAG_X86_LOADERNAME;
+    return &efi_bi;
 }
 
-static void __init efi_arch_cfg_file_late(const EFI_LOADED_IMAGE *image,
-                                          EFI_FILE_HANDLE dir_handle,
-                                          const char *section)
+static void __init efi_arch_cfg_file_early(
+    const EFI_LOADED_IMAGE *image, EFI_FILE_HANDLE dir_handle,
+    const char *section)
+{
+}
+
+static void __init efi_arch_cfg_file_late(
+    const EFI_LOADED_IMAGE *image, EFI_FILE_HANDLE dir_handle,
+    const char *section)
 {
     union string name;
 
@@ -296,16 +316,15 @@ static void __init efi_arch_cfg_file_late(const EFI_LOADED_IMAGE *image,
         name.s = get_value(&cfg, "global", "ucode");
     if ( name.s )
     {
-        microcode_set_module(mbi.mods_count);
+        microcode_set_module(efi_bi.nr_mods);
         split_string(name.s);
         read_file(dir_handle, s2w(&name), &ucode, NULL);
         efi_bs->FreePool(name.w);
     }
 }
 
-static void __init efi_arch_handle_cmdline(CHAR16 *image_name,
-                                           CHAR16 *cmdline_options,
-                                           const char *cfgfile_options)
+static void __init efi_arch_handle_cmdline(
+    CHAR16 *image_name, CHAR16 *cmdline_options, const char *cfgfile_options)
 {
     union string name;
 
@@ -313,10 +332,10 @@ static void __init efi_arch_handle_cmdline(CHAR16 *image_name,
     {
         name.w = cmdline_options;
         w2s(&name);
-        place_string(&mbi.cmdline, name.s);
+        place_string((uint32_t *)efi_bi.cmdline, name.s);
     }
     if ( cfgfile_options )
-        place_string(&mbi.cmdline, cfgfile_options);
+        place_string((uint32_t *)efi_bi.cmdline, cfgfile_options);
     /* Insert image name last, as it gets prefixed to the other options. */
     if ( image_name )
     {
@@ -325,16 +344,10 @@ static void __init efi_arch_handle_cmdline(CHAR16 *image_name,
     }
     else
         name.s = "xen";
-    place_string(&mbi.cmdline, name.s);
+    place_string((uint32_t *)efi_bi.cmdline, name.s);
 
-    if ( mbi.cmdline )
-        mbi.flags |= MBI_CMDLINE;
-    /*
-     * These must not be initialized statically, since the value must
-     * not get relocated when processing base relocations later.
-     */
-    mbi.boot_loader_name = (long)"EFI";
-    mbi.mods_addr = (long)mb_modules;
+    if ( efi_bi.cmdline )
+        efi_bi_arch.flags |= BOOTINFO_FLAG_X86_CMDLINE;
 }
 
 static void __init efi_arch_edd(void)
@@ -704,9 +717,8 @@ static void __init efi_arch_memory_setup(void)
 #undef l2_4G_offset
 }
 
-static void __init efi_arch_handle_module(const struct file *file,
-                                          const CHAR16 *name,
-                                          const char *options)
+static void __init efi_arch_handle_module(
+    const struct file *file, const CHAR16 *name, const char *options)
 {
     union string local_name;
     void *ptr;
@@ -724,17 +736,24 @@ static void __init efi_arch_handle_module(const struct file *file,
     w2s(&local_name);
 
     /*
-     * If options are provided, put them in
-     * mb_modules[mbi.mods_count].string after the filename, with a space
-     * separating them.  place_string() prepends strings and adds separating
-     * spaces, so the call order is reversed.
+     * Set module string to filename and if options are provided, put them in
+     * after the filename, with a space separating them.
      */
+    strlcpy(efi_bi.mods[efi_bi.nr_mods].string.bytes, local_name.s,
+                 BOOTMOD_STRING_MAX_LEN);
     if ( options )
-        place_string(&mb_modules[mbi.mods_count].string, options);
-    place_string(&mb_modules[mbi.mods_count].string, local_name.s);
-    mb_modules[mbi.mods_count].mod_start = file->addr >> PAGE_SHIFT;
-    mb_modules[mbi.mods_count].mod_end = file->size;
-    ++mbi.mods_count;
+    {
+        strlcat(efi_bi.mods[efi_bi.nr_mods].string.bytes, " ",
+                BOOTMOD_STRING_MAX_LEN);
+        strlcat(efi_bi.mods[efi_bi.nr_mods].string.bytes, options,
+                BOOTMOD_STRING_MAX_LEN);
+    }
+
+    efi_bi.mods[efi_bi.nr_mods].start = file->addr;
+    efi_bi.mods[efi_bi.nr_mods].mfn = maddr_to_mfn(file->addr);
+    efi_bi.mods[efi_bi.nr_mods].size = file->size;
+
+    ++efi_bi.nr_mods;
     efi_bs->FreePool(ptr);
 }
 
diff --git a/xen/arch/x86/guest/xen/pvh-boot.c b/xen/arch/x86/guest/xen/pvh-boot.c
index 1ed04d035c..dd10a358da 100644
--- a/xen/arch/x86/guest/xen/pvh-boot.c
+++ b/xen/arch/x86/guest/xen/pvh-boot.c
@@ -6,6 +6,7 @@
  *
  * Copyright (c) 2017 Citrix Systems Ltd.
  */
+#include <xen/bootinfo.h>
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/mm.h>
@@ -20,12 +21,28 @@
 bool __initdata pvh_boot;
 uint32_t __initdata pvh_start_info_pa;
 
-static multiboot_info_t __initdata pvh_mbi;
-static module_t __initdata pvh_mbi_mods[8];
-static const char *__initdata pvh_loader = "PVH Directboot";
+static struct boot_info __initdata pvh_bi;
+static struct arch_boot_info __initdata arch_pvh_bi;
+static struct boot_module __initdata pvh_mods[MAX_NR_BOOTMODS + 1];
+static struct arch_bootmodule __initdata arch_pvh_mods[MAX_NR_BOOTMODS + 1];
+static char __initdata *pvh_loader = "PVH Directboot";
 
-static void __init convert_pvh_info(multiboot_info_t **mbi,
-                                    module_t **mod)
+static struct boot_info __init *init_pvh_info(void)
+{
+    int i;
+
+    pvh_bi.arch = &arch_pvh_bi;
+    pvh_bi.mods = pvh_mods;
+
+    for ( i=0; i <= MAX_NR_BOOTMODS; i++ )
+        pvh_bi.mods[i].arch = &arch_pvh_mods[i];
+
+    pvh_bi.arch->boot_loader_name = pvh_loader;
+
+    return &pvh_bi;
+}
+
+static void __init convert_pvh_info(struct boot_info *bi)
 {
     const struct hvm_start_info *pvh_info = __va(pvh_start_info_pa);
     const struct hvm_modlist_entry *entry;
@@ -39,23 +56,22 @@ static void __init convert_pvh_info(multiboot_info_t **mbi,
      * required. The extra element is used to aid relocation. See
      * arch/x86/setup.c:__start_xen().
      */
-    if ( ARRAY_SIZE(pvh_mbi_mods) <= pvh_info->nr_modules )
+    if ( ARRAY_SIZE(pvh_mods) <= pvh_info->nr_modules )
         panic("The module array is too small, size %zu, requested %u\n",
-              ARRAY_SIZE(pvh_mbi_mods), pvh_info->nr_modules);
+              ARRAY_SIZE(pvh_mods), pvh_info->nr_modules);
 
     /*
      * Turn hvm_start_info into mbi. Luckily all modules are placed under 4GB
      * boundary on x86.
      */
-    pvh_mbi.flags = MBI_CMDLINE | MBI_MODULES | MBI_LOADERNAME;
+    bi->arch->flags = BOOTINFO_FLAG_X86_CMDLINE | BOOTINFO_FLAG_X86_MODULES
+                      | BOOTINFO_FLAG_X86_LOADERNAME;
 
     BUG_ON(pvh_info->cmdline_paddr >> 32);
-    pvh_mbi.cmdline = pvh_info->cmdline_paddr;
-    pvh_mbi.boot_loader_name = __pa(pvh_loader);
+    bi->cmdline = _p(__va(pvh_info->cmdline_paddr));
 
-    BUG_ON(pvh_info->nr_modules >= ARRAY_SIZE(pvh_mbi_mods));
-    pvh_mbi.mods_count = pvh_info->nr_modules;
-    pvh_mbi.mods_addr = __pa(pvh_mbi_mods);
+    BUG_ON(pvh_info->nr_modules >= ARRAY_SIZE(pvh_mods));
+    bi->nr_mods = pvh_info->nr_modules;
 
     entry = __va(pvh_info->modlist_paddr);
     for ( i = 0; i < pvh_info->nr_modules; i++ )
@@ -63,15 +79,18 @@ static void __init convert_pvh_info(multiboot_info_t **mbi,
         BUG_ON(entry[i].paddr >> 32);
         BUG_ON(entry[i].cmdline_paddr >> 32);
 
-        pvh_mbi_mods[i].mod_start = entry[i].paddr;
-        pvh_mbi_mods[i].mod_end   = entry[i].paddr + entry[i].size;
-        pvh_mbi_mods[i].string    = entry[i].cmdline_paddr;
+        bi->mods[i].start = entry[i].paddr;
+        bi->mods[i].size  = entry[i].size;
+        if ( entry[i].cmdline_paddr)
+        {
+            char *c = _p(__va(entry[i].cmdline_paddr));
+
+            safe_strcpy(bi->mods[i].string.bytes, c);
+            bi->mods[i].string.kind = BOOTSTR_CMDLINE;
+        }
     }
 
     rsdp_hint = pvh_info->rsdp_paddr;
-
-    *mbi = &pvh_mbi;
-    *mod = pvh_mbi_mods;
 }
 
 static void __init get_memory_map(void)
@@ -88,13 +107,16 @@ static void __init get_memory_map(void)
     sanitize_e820_map(e820_raw.map, &e820_raw.nr_map);
 }
 
-void __init pvh_init(multiboot_info_t **mbi, module_t **mod)
+void __init pvh_init(struct boot_info **bi)
 {
-    convert_pvh_info(mbi, mod);
+    *bi = init_pvh_info();
+    convert_pvh_info(*bi);
 
     hypervisor_probe();
     ASSERT(xen_guest);
 
+    (*bi)->arch->xen_guest = xen_guest;
+
     get_memory_map();
 }
 
diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 989fb7a1da..c1ed76fd3e 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -1,14 +1,14 @@
 #ifndef __ARCH_X86_BOOTINFO_H__
 #define __ARCH_X86_BOOTINFO_H__
 
-struct arch_bootmodule {
+struct __packed arch_bootmodule {
 #define BOOTMOD_FLAG_X86_RELOCATED     1U << 0
     uint32_t flags;
     unsigned headroom;
 };
 DEFINE_STRUCT_PTR_TYPE(arch_bootmodule);
 
-struct arch_boot_info {
+struct __packed arch_boot_info {
     uint32_t flags;
 #define BOOTINFO_FLAG_X86_CMDLINE      1U << 2
 #define BOOTINFO_FLAG_X86_MODULES      1U << 3
@@ -17,6 +17,9 @@ struct arch_boot_info {
 
     char_ptr_t boot_loader_name;
 
+    uint32_t mem_lower;
+    uint32_t mem_upper;
+
     uint32_t mmap_length;
     paddr_t mmap_addr;
 };
diff --git a/xen/arch/x86/include/asm/guest/pvh-boot.h b/xen/arch/x86/include/asm/guest/pvh-boot.h
index 247ba6899e..c820b0bf88 100644
--- a/xen/arch/x86/include/asm/guest/pvh-boot.h
+++ b/xen/arch/x86/include/asm/guest/pvh-boot.h
@@ -8,13 +8,13 @@
 #ifndef __X86_PVH_BOOT_H__
 #define __X86_PVH_BOOT_H__
 
-#include <xen/multiboot.h>
+#include <xen/bootinfo.h>
 
 #ifdef CONFIG_PVH_GUEST
 
 extern bool pvh_boot;
 
-void pvh_init(multiboot_info_t **mbi, module_t **mod);
+void __init pvh_init(struct boot_info **bi);
 void pvh_print_info(void);
 
 #else
@@ -23,7 +23,7 @@ void pvh_print_info(void);
 
 #define pvh_boot 0
 
-static inline void pvh_init(multiboot_info_t **mbi, module_t **mod)
+static inline void __init pvh_init(struct boot_info **bi)
 {
     ASSERT_UNREACHABLE();
 }
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 50a1a124b0..05a76a5959 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -13,7 +13,6 @@
 #include <xen/console.h>
 #include <xen/serial.h>
 #include <xen/trace.h>
-#include <xen/multiboot.h>
 #include <xen/domain_page.h>
 #include <xen/version.h>
 #include <xen/hypercall.h>
@@ -60,9 +59,6 @@
 #include <asm/prot-key.h>
 #include <asm/pv/domain.h>
 
-/* Max number of boot modules a bootloader can provide in addition to Xen */
-#define MAX_NR_BOOTMODS 63
-
 /* opt_nosmp: If true, secondary processors are ignored. */
 static bool __initdata opt_nosmp;
 boolean_param("nosmp", opt_nosmp);
@@ -275,46 +271,6 @@ custom_param("acpi", parse_acpi_param);
 
 static struct boot_info __initdata *boot_info;
 
-static void __init multiboot_to_bootinfo(multiboot_info_t *mbi, module_t *mods)
-{
-    static struct boot_info       __initdata info;
-    static struct arch_boot_info  __initdata arch_info;
-    static struct boot_module     __initdata boot_mods[MAX_NR_BOOTMODS + 1];
-    static struct arch_bootmodule __initdata arch_boot_mods[
-                                                       MAX_NR_BOOTMODS + 1];
-
-    int i;
-
-    info.arch = &arch_info;
-    info.mods = boot_mods;
-
-    info.cmdline = __va(mbi->cmdline);
-
-    /* The BOOTINFO_FLAG_X86_* flags are a 1-1 map to MBI_* */
-    arch_info.flags = mbi->flags;
-    arch_info.mmap_length = mbi->mmap_length;
-    arch_info.mmap_addr = mbi->mmap_addr;
-    arch_info.boot_loader_name = __va(mbi->boot_loader_name);
-
-    info.nr_mods = mbi->mods_count;
-    for ( i = 0; i <= MAX_NR_BOOTMODS; i++ )
-    {
-        boot_mods[i].arch = &arch_boot_mods[i];
-
-        if ( i < info.nr_mods )
-        {
-            bootmodule_update_start(&boot_mods[i], mods[i].mod_start);
-            boot_mods[i].size = mods[i].mod_end - mods[i].mod_start;
-
-            boot_mods[i].string.len = strlcpy(boot_mods[i].string.bytes,
-                                             __va(mods[i].string),
-                                             BOOTMOD_STRING_MAX_LEN);
-        }
-    }
-
-    boot_info = &info;
-}
-
 unsigned long __init initial_images_nrpages(nodeid_t node)
 {
     unsigned long node_start = node_start_pfn(node);
@@ -1014,15 +970,13 @@ static struct domain *__init create_dom0(const struct boot_info *bootinfo,
 /* How much of the directmap is prebuilt at compile time. */
 #define PREBUILT_MAP_LIMIT (1 << L2_PAGETABLE_SHIFT)
 
-void __init noreturn __start_xen(unsigned long mbi_p)
+void __init noreturn __start_xen(unsigned long bi_p)
 {
     char *memmap_type = NULL;
     char *cmdline, *kextra, *loader;
     void *bsp_stack;
     struct cpu_info *info = get_cpu_info(), *bsp_info;
     unsigned int initrdidx, num_parked = 0;
-    multiboot_info_t *mbi;
-    module_t *mod;
     unsigned long nr_pages, raw_max_page;
     int i, j, e820_warn = 0, bytes = 0;
     unsigned long eb_start, eb_end;
@@ -1059,16 +1013,29 @@ void __init noreturn __start_xen(unsigned long mbi_p)
 
     if ( pvh_boot )
     {
-        ASSERT(mbi_p == 0);
-        pvh_init(&mbi, &mod);
+        ASSERT(bi_p == 0);
+        pvh_init(&boot_info);
     }
     else
     {
-        mbi = __va(mbi_p);
-        mod = __va(mbi->mods_addr);
-    }
+        /*
+         * Since addresses were setup before virtual addressing was enabled,
+         * fixup pointers to virtual addresses for proper dereferencing.
+         */
+        boot_info = __va(bi_p);
+        boot_info->cmdline = __va(boot_info->cmdline);
+        boot_info->mods = __va(boot_info->mods);
+        boot_info->arch = __va(boot_info->arch);
+
+        boot_info->arch->boot_loader_name =
+            __va(boot_info->arch->boot_loader_name);
 
-    multiboot_to_bootinfo(mbi, mod);
+        for ( i = 0; i <= boot_info->nr_mods; i++ )
+        {
+            boot_info->mods[i].mfn = maddr_to_mfn(boot_info->mods[i].start);
+            boot_info->mods[i].arch = __va(boot_info->mods[i].arch);
+        }
+    }
 
     loader = (boot_info->arch->flags & BOOTINFO_FLAG_X86_LOADERNAME)
         ? boot_info->arch->boot_loader_name : "unknown";
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index c5850c26af..09b38b497c 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -3,6 +3,7 @@
 #include <efi/efipciio.h>
 #include <public/xen.h>
 #include <xen/bitops.h>
+#include <xen/bootinfo.h>
 #include <xen/compile.h>
 #include <xen/ctype.h>
 #include <xen/dmi.h>
@@ -11,7 +12,6 @@
 #include <xen/keyhandler.h>
 #include <xen/lib.h>
 #include <xen/mm.h>
-#include <xen/multiboot.h>
 #include <xen/param.h>
 #include <xen/pci_regs.h>
 #include <xen/pfn.h>
@@ -1359,6 +1359,8 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
 
     efi_arch_relocate_image(0);
 
+    efi_arch_bootinfo_init();
+
     if ( use_cfg_file )
     {
         EFI_FILE_HANDLE dir_handle;
diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h
index bf5586a76b..6e09be6899 100644
--- a/xen/include/xen/bootinfo.h
+++ b/xen/include/xen/bootinfo.h
@@ -20,13 +20,16 @@
 #define BOOTMOD_GUEST_DTB   7
 typedef unsigned int bootmod_type_t;
 
+/* Max number of boot modules a bootloader can provide in addition to Xen */
+#define MAX_NR_BOOTMODS 63
+
 #define BOOTMOD_STRING_MAX_LEN 1024
-struct boot_string {
+struct __packed boot_string {
     char bytes[BOOTMOD_STRING_MAX_LEN];
     size_t len;
 };
 
-struct boot_module {
+struct __packed boot_module {
     bootmod_type_t bootmod_type;
     paddr_t start;
     mfn_t mfn;
@@ -37,7 +40,7 @@ struct boot_module {
 };
 DEFINE_STRUCT_PTR_TYPE(boot_module);
 
-struct boot_info {
+struct __packed boot_info {
     char_ptr_t cmdline;
 
     unsigned int nr_mods;
-- 
2.25.1


