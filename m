Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 202A8538907
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 00:51:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338906.563740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvoEY-0002YR-Sr; Mon, 30 May 2022 22:51:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338906.563740; Mon, 30 May 2022 22:51:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvoEY-0002WL-Os; Mon, 30 May 2022 22:51:34 +0000
Received: by outflank-mailman (input) for mailman id 338906;
 Mon, 30 May 2022 22:51:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=epuh=WG=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nvo6I-0006Rh-Mt
 for xen-devel@lists.xenproject.org; Mon, 30 May 2022 22:43:03 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dafb0382-e069-11ec-bd2c-47488cf2e6aa;
 Tue, 31 May 2022 00:43:00 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 165395052385312.548724071218999;
 Mon, 30 May 2022 15:42:03 -0700 (PDT)
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
X-Inumbo-ID: dafb0382-e069-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; t=1653950525; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LyctmwvFWMx31av57yID37Qi68+X4ucdKeqV6YkmP8mzN0KfeBvmJUQFbgZ+49CyC8tnGxazc80+bwKBgNUnZYFsPxJB3Pq5w43AdI+0w+4CmtzRVVKbSZZ6qhzSUYQaRe5+VcK6x9pdc8F4TkH/Z4pCTYuRbOCu9R+/BWGkEgo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1653950525; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=QsrPUqkDtUvJ+NOAy+kFxwJxYrCsp40uZ3+rvq7odxY=; 
	b=Gouo+NXbdg4kORk1NrCvGCd8GnKwhs6uvCIlbn7kPMsjLBpDDMric1xOHQd7b4dNR2pJrls+5PHVfcN9/JVTP7T4jmGKMmJfIsV5wSlU2mwXvFDo+o20jqiV+TQYffocvSlIXam0s+0u1mvEkzzdiyCTcOceQcZ1ZBIDCN6DzF8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1653950525;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=QsrPUqkDtUvJ+NOAy+kFxwJxYrCsp40uZ3+rvq7odxY=;
	b=XV2fMoPrhoslbADyC77oBQFaEqy7NYBxgk8mCNcUFhdAcoioG/AWlSqQxH2DY7PO
	+EaV/mVhQQ+WpzxNUdj04ALCmK4d2tgBmHLwshHq8k+3nKRSYbg/kVCS3DmYmN9DjvN
	PCRT7OOA2cuBUEOPJ6uyjJB2C9sxhLTo7k+iP3X8=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org,
	Wei Liu <wl@xen.org>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	scott.davis@starlab.io,
	christopher.clark@starlab.io,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC PATCH 4/4] x86: refactor entrypoints to new boot info
Date: Mon, 30 May 2022 22:41:26 -0400
Message-Id: <20220531024127.23669-5-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220531024127.23669-1-dpsmith@apertussolutions.com>
References: <20220531024127.23669-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This previous commit added a transition point from multiboot v1 structures to
the new boot info structures at the earliest common point for all the x86
entrypoints. The result is that each of the entrypoints would construct a
multiboot v1 structure from the structures used by each entrypoint.  This meant
that multiboot2, EFI, and PVH all converted their structures over to mutliboot
v1 to only be converted again upon entering __start_xen().

This commit drops the translation function and moves the population of the new
boot info structures down into the various entrypoints.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/boot/boot_info32.h           |  81 ++++++++++
 xen/arch/x86/boot/defs.h                  |  17 +-
 xen/arch/x86/boot/reloc.c                 | 187 +++++++++++++++-------
 xen/arch/x86/efi/efi-boot.h               |  96 ++++++-----
 xen/arch/x86/guest/xen/pvh-boot.c         |  58 ++++---
 xen/arch/x86/include/asm/guest/pvh-boot.h |   6 +-
 xen/arch/x86/setup.c                      |  71 +++-----
 xen/common/efi/boot.c                     |   4 +-
 8 files changed, 342 insertions(+), 178 deletions(-)
 create mode 100644 xen/arch/x86/boot/boot_info32.h

diff --git a/xen/arch/x86/boot/boot_info32.h b/xen/arch/x86/boot/boot_info32.h
new file mode 100644
index 0000000000..76c78e2cae
--- /dev/null
+++ b/xen/arch/x86/boot/boot_info32.h
@@ -0,0 +1,81 @@
+#ifndef __BOOT_INFO32_H__
+#define __BOOT_INFO32_H__
+
+#include "defs.h"
+
+typedef enum {
+    BOOTMOD_UNKNOWN,
+    BOOTMOD_XEN,
+    BOOTMOD_FDT,
+    BOOTMOD_KERNEL,
+    BOOTMOD_RAMDISK,
+    BOOTMOD_XSM,
+    BOOTMOD_UCODE,
+    BOOTMOD_GUEST_DTB,
+}  bootmodule_kind;
+
+typedef enum {
+    BOOTSTR_EMPTY,
+    BOOTSTR_STRING,
+    BOOTSTR_CMDLINE,
+} bootstring_kind;
+
+#define BOOTMOD_MAX_STRING 1024
+struct boot_string {
+    u32 kind;
+    u64 arch;
+
+    char bytes[BOOTMOD_MAX_STRING];
+    u64 len;
+};
+
+struct arch_bootmodule {
+    bool relocated;
+    u32 flags;
+#define BOOTMOD_FLAG_X86_RELOCATED      1U << 0
+    u32 headroom;
+};
+
+struct boot_module {
+    u32 kind;
+    u64 start;
+    u64 mfn;
+    u64 size;
+
+    u64 arch;
+    struct boot_string string;
+};
+
+struct arch_boot_info {
+    u32 flags;
+#define BOOTINFO_FLAG_X86_MEMLIMITS  	1U << 0
+#define BOOTINFO_FLAG_X86_BOOTDEV    	1U << 1
+#define BOOTINFO_FLAG_X86_CMDLINE    	1U << 2
+#define BOOTINFO_FLAG_X86_MODULES    	1U << 3
+#define BOOTINFO_FLAG_X86_AOUT_SYMS  	1U << 4
+#define BOOTINFO_FLAG_X86_ELF_SYMS   	1U << 5
+#define BOOTINFO_FLAG_X86_MEMMAP     	1U << 6
+#define BOOTINFO_FLAG_X86_DRIVES     	1U << 7
+#define BOOTINFO_FLAG_X86_BIOSCONFIG 	1U << 8
+#define BOOTINFO_FLAG_X86_LOADERNAME 	1U << 9
+#define BOOTINFO_FLAG_X86_APM        	1U << 10
+
+    u64 boot_loader_name;
+
+    u32 mem_lower;
+    u32 mem_upper;
+
+    u32 mmap_length;
+    u64 mmap_addr;
+};
+
+struct boot_info {
+    u64 cmdline;
+
+    u32 nr_mods;
+    u64 mods;
+
+    u64 arch;
+};
+
+#endif
diff --git a/xen/arch/x86/boot/defs.h b/xen/arch/x86/boot/defs.h
index f9840044ec..d742a2b52a 100644
--- a/xen/arch/x86/boot/defs.h
+++ b/xen/arch/x86/boot/defs.h
@@ -22,11 +22,11 @@
 
 #include "../../../include/xen/stdbool.h"
 
-#define __maybe_unused	__attribute__((__unused__))
-#define __packed	__attribute__((__packed__))
-#define __stdcall	__attribute__((__stdcall__))
+#define __maybe_unused  __attribute__((__unused__))
+#define __packed        __attribute__((__packed__))
+#define __stdcall       __attribute__((__stdcall__))
 
-#define NULL		((void *)0)
+#define NULL            ((void *)0)
 
 #define ALIGN_UP(arg, align) \
                 (((arg) + (align) - 1) & ~((typeof(arg))(align) - 1))
@@ -43,9 +43,10 @@
         (void) (&_x == &_y);            \
         _x > _y ? _x : _y; })
 
-#define _p(val)		((void *)(unsigned long)(val))
+#define _p(val)     ((void *)(unsigned long)(val))
+#define _addr(val)  ((unsigned long)(void *)(val))
 
-#define tolower(c)	((c) | 0x20)
+#define tolower(c)  ((c) | 0x20)
 
 typedef unsigned char u8;
 typedef unsigned short u16;
@@ -57,7 +58,7 @@ typedef u16 uint16_t;
 typedef u32 uint32_t;
 typedef u64 uint64_t;
 
-#define U16_MAX		((u16)(~0U))
-#define UINT_MAX	(~0U)
+#define U16_MAX     ((u16)(~0U))
+#define UINT_MAX    (~0U)
 
 #endif /* __BOOT_DEFS_H__ */
diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
index e22bb974bf..4c40cadff6 100644
--- a/xen/arch/x86/boot/reloc.c
+++ b/xen/arch/x86/boot/reloc.c
@@ -27,6 +27,7 @@ asm (
     );
 
 #include "defs.h"
+#include "boot_info32.h"
 #include "../../../include/xen/multiboot.h"
 #include "../../../include/xen/multiboot2.h"
 
@@ -138,65 +139,116 @@ static struct hvm_start_info *pvh_info_reloc(u32 in)
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
@@ -206,21 +258,28 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
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
@@ -232,39 +291,38 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
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
+            arch_binfo->mem_lower = get_mb2_data(tag, basic_meminfo, mem_lower);
+            arch_binfo->mem_upper = get_mb2_data(tag, basic_meminfo, mem_upper);
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
+            for ( i = 0; i < arch_binfo->mmap_length / sizeof(*mmap_dst); i++ )
             {
                 /* Init size member properly. */
                 mmap_dst[i].size = sizeof(*mmap_dst);
@@ -280,14 +338,27 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
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
 
@@ -344,11 +415,11 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
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
index 4e1a799749..933eb30a28 100644
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
-static module_t __initdata mb_modules[CONFIG_NR_BOOTMODS + 1];
+static struct boot_module __initdata efi_mods[CONFIG_NR_BOOTMODS + 1];
+static struct arch_bootmodule __initdata efi_arch_mods[CONFIG_NR_BOOTMODS + 1];
+
+static const char *__initdata efi_loader = "PVH Directboot";
 
 static void __init edd_put_string(u8 *dst, size_t n, const char *src)
 {
@@ -269,20 +272,37 @@ static void __init noreturn efi_arch_post_exit_boot(void)
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
+    for ( i=0; i <= CONFIG_NR_BOOTMODS; i++ )
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
 
@@ -294,16 +314,15 @@ static void __init efi_arch_cfg_file_late(const EFI_LOADED_IMAGE *image,
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
 
@@ -311,10 +330,10 @@ static void __init efi_arch_handle_cmdline(CHAR16 *image_name,
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
@@ -323,16 +342,10 @@ static void __init efi_arch_handle_cmdline(CHAR16 *image_name,
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
@@ -695,9 +708,8 @@ static void __init efi_arch_memory_setup(void)
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
@@ -715,17 +727,25 @@ static void __init efi_arch_handle_module(const struct file *file,
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
+                 BOOTMOD_MAX_STRING);
     if ( options )
-        place_string(&mb_modules[mbi.mods_count].string, options);
-    place_string(&mb_modules[mbi.mods_count].string, local_name.s);
-    mb_modules[mbi.mods_count].mod_start = file->addr >> PAGE_SHIFT;
-    mb_modules[mbi.mods_count].mod_end = file->size;
-    ++mbi.mods_count;
+    {
+        strlcat(efi_bi.mods[efi_bi.nr_mods].string.bytes, " ",
+                BOOTMOD_MAX_STRING);
+        strlcat(efi_bi.mods[efi_bi.nr_mods].string.bytes, options,
+                BOOTMOD_MAX_STRING);
+    }
+    efi_bi.mods[efi_bi.nr_mods].string.kind = BOOTSTR_CMDLINE;
+
+    efi_bi.mods[efi_bi.nr_mods].start = file->addr;
+    efi_bi.mods[efi_bi.nr_mods].mfn = maddr_to_mfn(file->addr);
+    efi_bi.mods[efi_bi.nr_mods].size = file->size;
+
+    ++efi_bi.nr_mods;
     efi_bs->FreePool(ptr);
 }
 
diff --git a/xen/arch/x86/guest/xen/pvh-boot.c b/xen/arch/x86/guest/xen/pvh-boot.c
index 834b1ad16b..c7081e70d0 100644
--- a/xen/arch/x86/guest/xen/pvh-boot.c
+++ b/xen/arch/x86/guest/xen/pvh-boot.c
@@ -18,6 +18,7 @@
  *
  * Copyright (c) 2017 Citrix Systems Ltd.
  */
+#include <xen/bootinfo.h>
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/mm.h>
@@ -31,12 +32,26 @@
 bool __initdata pvh_boot;
 uint32_t __initdata pvh_start_info_pa;
 
-static multiboot_info_t __initdata pvh_mbi;
-static module_t __initdata pvh_mbi_mods[CONFIG_NR_BOOTMOD + 1];
+static struct boot_info __initdata pvh_bi;
+static struct arch_boot_info __initdata pvh_bi_arch;
+static struct boot_module __initdata pvh_mods[CONFIG_NR_BOOTMODS + 1];
+static struct arch_bootmodule __initdata pvh_arch_mods[CONFIG_NR_BOOTMODS + 1];
 static const char *__initdata pvh_loader = "PVH Directboot";
 
-static void __init convert_pvh_info(multiboot_info_t **mbi,
-                                    module_t **mod)
+static void __init init_pvh_info(void)
+{
+    int i;
+
+    pvh_bi.arch = &pvh_bi_arch;
+    pvh_bi.mods = pvh_mods;
+
+    for ( i=0; i <= CONFIG_NR_BOOTMODS; i++ )
+        pvh_bi.mods[i].arch = &pvh_arch_mods[i];
+
+    pvh_bi.arch->boot_loader_name = _p(pvh_loader);
+}
+
+static void __init convert_pvh_info(struct boot_info *bi)
 {
     const struct hvm_start_info *pvh_info = __va(pvh_start_info_pa);
     const struct hvm_modlist_entry *entry;
@@ -50,23 +65,22 @@ static void __init convert_pvh_info(multiboot_info_t **mbi,
      * required. The extra element is used to aid relocation. See
      * arch/x86/setup.c:__start_xen().
      */
-    if ( ARRAY_SIZE(pvh_mbi_mods) <= pvh_info->nr_modules )
+    if ( ARRAY_SIZE(bi->mods) <= pvh_info->nr_modules )
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
@@ -74,15 +88,20 @@ static void __init convert_pvh_info(multiboot_info_t **mbi,
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
 
-    *mbi = &pvh_mbi;
-    *mod = pvh_mbi_mods;
+    *bi = &pvh_bi;
 }
 
 static void __init get_memory_map(void)
@@ -99,9 +118,10 @@ static void __init get_memory_map(void)
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
diff --git a/xen/arch/x86/include/asm/guest/pvh-boot.h b/xen/arch/x86/include/asm/guest/pvh-boot.h
index 48ffd1a0b1..120baf4ebb 100644
--- a/xen/arch/x86/include/asm/guest/pvh-boot.h
+++ b/xen/arch/x86/include/asm/guest/pvh-boot.h
@@ -19,13 +19,13 @@
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
@@ -34,7 +34,7 @@ void pvh_print_info(void);
 
 #define pvh_boot 0
 
-static inline void pvh_init(multiboot_info_t **mbi, module_t **mod)
+static inline void __init pvh_init(struct boot_info **bi)
 {
     ASSERT_UNREACHABLE();
 }
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index a7bf698d52..e3922f3a30 100644
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
@@ -274,47 +273,6 @@ custom_param("acpi", parse_acpi_param);
 
 struct boot_info __initdata *boot_info;
 
-static struct boot_info       __initdata x86_bi;
-static struct arch_boot_info  __initdata x86_bi_arch;
-static struct boot_module     __initdata x86_mods[CONFIG_NR_BOOTMODS + 1];
-static struct arch_bootmodule __initdata x86_arch_mods[CONFIG_NR_BOOTMODS + 1];
-
-static void __init mb_to_bootinfo(multiboot_info_t *mbi, module_t *mods)
-{
-    int i;
-
-    x86_bi.arch = &x86_bi_arch;
-    x86_bi.mods = x86_mods;
-
-    x86_bi.cmdline = __va(mbi->cmdline);
-
-    /* The BOOTINFO_FLAG_X86_* flags are a 1-1 map to MBI_* */
-    x86_bi_arch.flags = mbi->flags;
-    x86_bi_arch.mem_upper = mbi->mem_upper;
-    x86_bi_arch.mem_lower = mbi->mem_lower;
-    x86_bi_arch.mmap_length = mbi->mmap_length;
-    x86_bi_arch.mmap_addr = mbi->mmap_addr;
-    x86_bi_arch.boot_loader_name = __va(mbi->boot_loader_name);
-
-    x86_bi.nr_mods = mbi->mods_count;
-    for ( i = 0; i <= CONFIG_NR_BOOTMODS; i++)
-    {
-        x86_mods[i].arch = &x86_arch_mods[i];
-
-        if ( i < x86_bi.nr_mods )
-        {
-            bootmodule_update_start(&x86_mods[i], mods[i].mod_start);
-            x86_mods[i].size = mods[i].mod_end - mods[i].mod_start;
-
-            x86_mods[i].string.len = strlcpy(x86_mods[i].string.bytes,
-                                              __va(mods[i].string),
-                                              BOOTMOD_MAX_STRING);
-        }
-    }
-
-    boot_info = &x86_bi;
-}
-
 unsigned long __init initial_images_nrpages(nodeid_t node)
 {
     unsigned long node_start = node_start_pfn(node);
@@ -897,15 +855,13 @@ static struct domain *__init create_dom0(
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
@@ -942,16 +898,29 @@ void __init noreturn __start_xen(unsigned long mbi_p)
 
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
 
-    mb_to_bootinfo(mbi, mod);
+        for ( i = 0; i <= boot_info->nr_mods; i++ )
+        {
+            boot_info->mods[i].mfn = maddr_to_mfn(boot_info->mods[i].start);
+            boot_info->mods[i].arch = __va(boot_info->mods[i].arch);
+        }
+    }
 
     loader = (boot_info->arch->flags & BOOTINFO_FLAG_X86_LOADERNAME)
         ? boot_info->arch->boot_loader_name : "unknown";
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index a25e1d29f1..287e48b49a 100644
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
@@ -1222,6 +1222,8 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
 
     efi_arch_relocate_image(0);
 
+    efi_arch_bootinfo_init();
+
     if ( use_cfg_file )
     {
         EFI_FILE_HANDLE dir_handle;
-- 
2.20.1


