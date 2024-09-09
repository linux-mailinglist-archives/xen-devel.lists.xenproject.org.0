Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A89FD97155D
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 12:31:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794224.1203007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snbfz-0004Jj-Lu; Mon, 09 Sep 2024 10:31:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794224.1203007; Mon, 09 Sep 2024 10:31:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snbfz-0004HG-HX; Mon, 09 Sep 2024 10:31:19 +0000
Received: by outflank-mailman (input) for mailman id 794224;
 Mon, 09 Sep 2024 10:31:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dA/l=QH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1snbfx-00046N-Op
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 10:31:17 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4b2c9a2-6e96-11ef-99a1-01e77a169b0f;
 Mon, 09 Sep 2024 12:31:16 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5becd359800so3719959a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 03:31:16 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d258318aesm319413366b.45.2024.09.09.03.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 03:31:14 -0700 (PDT)
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
X-Inumbo-ID: a4b2c9a2-6e96-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725877875; x=1726482675; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bwRJoM0PMJv/f/AbKck9Y9EWTznz04JiqAuIcav9b18=;
        b=D9Femfrjb4+NYmWf93mcHw4xB6ufQfksUYjOAsQoyowX54oYBJfBxJbjggI7hWL0MT
         bU+J2143ZyKL2pE2iVEs6cDdf+pleML+IIZj2TEWQQRau6HIn0+rEcACZ1mV6lmG/eBl
         7FRutsKykbJ4/rv60XXgFAcKPgFSS5C2x5DtI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725877875; x=1726482675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bwRJoM0PMJv/f/AbKck9Y9EWTznz04JiqAuIcav9b18=;
        b=iVUzK+19/06mftegIvoNVXIb1xFkvHDjsuL82nTNXdijhRt3yNLu3MFTNWSFwYOf4a
         e1Uj+sYp2CiF7TYt+CqEqBOTccHRXADm/9pn24LvAPR/K2kfI1fSKD4TyAzDVc/dc2x5
         YT8KhuugL9XrHXdeUP7ffFxpn60/hfx86Q8l7dChSkSVI9v5kOJvLMweWFdPYABgiPn1
         Ho5URISjliZodssavOW3I+DvmPEJMQMK/CEtR5THoFSTU7x1M4gtGUVNfGlxQuYfhH2i
         a7gM7UCHuDW7zz2yEUtG57ai4CAzvPxS5yGwfEEhL07VJUK3ja/NZZBkKlO9OSmjjESR
         d3dQ==
X-Gm-Message-State: AOJu0Yy9/z/ohmGyUN84pV5rAI/e+Hv4HyjXrUhOW1ayMvUjhaqUx7gR
	CLYn7i5yiqqEvPUIVsWOtpR37u9xrH0tetl+fEkQlOImg5wmzXShSxIA6FXLi+5uXbi22Sj+ful
	E
X-Google-Smtp-Source: AGHT+IHtf1/81NLAPV9JzY8NybR80v9l89xpkG6kcr4yLMkGfgpLEMEtgHYuhz6x7N6jq7lLhMzzeQ==
X-Received: by 2002:a17:907:7f03:b0:a8d:5f69:c854 with SMTP id a640c23a62f3a-a8d5f69cb55mr128417966b.24.1725877874683;
        Mon, 09 Sep 2024 03:31:14 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3] x86/boot: Avoid usage of global in reloc.c
Date: Mon,  9 Sep 2024 11:30:59 +0100
Message-Id: <20240909103059.54577-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All code and dat from this file will go into a text section
which we want to not be writeable.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/reloc.c | 67 +++++++++++++++++++++------------------
 1 file changed, 37 insertions(+), 30 deletions(-)
---
Changes since v1:
- add comment;
- change "alloc" name to "ptr".

Changes since v2:
- fixed comment style.

diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
index 201e38d544..8c58affcd9 100644
--- a/xen/arch/x86/boot/reloc.c
+++ b/xen/arch/x86/boot/reloc.c
@@ -72,11 +72,18 @@ struct vesa_mode_info {
 #define get_mb2_data(tag, type, member)   (((const multiboot2_tag_##type##_t *)(tag))->member)
 #define get_mb2_string(tag, type, member) ((uint32_t)get_mb2_data(tag, type, member))
 
-static uint32_t alloc;
+typedef struct memctx {
+    /*
+     * Simple bump allocator.
+     *
+     * It starts from the base of the trampoline and allocates downwards.
+     */
+    uint32_t ptr;
+} memctx;
 
-static uint32_t alloc_mem(uint32_t bytes)
+static uint32_t alloc_mem(uint32_t bytes, memctx *ctx)
 {
-    return alloc -= ROUNDUP(bytes, 16);
+    return ctx->ptr -= ROUNDUP(bytes, 16);
 }
 
 static void zero_mem(uint32_t s, uint32_t bytes)
@@ -85,11 +92,11 @@ static void zero_mem(uint32_t s, uint32_t bytes)
         *(char *)s++ = 0;
 }
 
-static uint32_t copy_mem(uint32_t src, uint32_t bytes)
+static uint32_t copy_mem(uint32_t src, uint32_t bytes, memctx *ctx)
 {
     uint32_t dst, dst_ret;
 
-    dst = alloc_mem(bytes);
+    dst = alloc_mem(bytes, ctx);
     dst_ret = dst;
 
     while ( bytes-- )
@@ -98,7 +105,7 @@ static uint32_t copy_mem(uint32_t src, uint32_t bytes)
     return dst_ret;
 }
 
-static uint32_t copy_string(uint32_t src)
+static uint32_t copy_string(uint32_t src, memctx *ctx)
 {
     uint32_t p;
 
@@ -108,17 +115,17 @@ static uint32_t copy_string(uint32_t src)
     for ( p = src; *(char *)p != '\0'; p++ )
         continue;
 
-    return copy_mem(src, p - src + 1);
+    return copy_mem(src, p - src + 1, ctx);
 }
 
-static struct hvm_start_info *pvh_info_reloc(uint32_t in)
+static struct hvm_start_info *pvh_info_reloc(uint32_t in, memctx *ctx)
 {
     struct hvm_start_info *out;
 
-    out = _p(copy_mem(in, sizeof(*out)));
+    out = _p(copy_mem(in, sizeof(*out), ctx));
 
     if ( out->cmdline_paddr )
-        out->cmdline_paddr = copy_string(out->cmdline_paddr);
+        out->cmdline_paddr = copy_string(out->cmdline_paddr, ctx);
 
     if ( out->nr_modules )
     {
@@ -127,51 +134,51 @@ static struct hvm_start_info *pvh_info_reloc(uint32_t in)
 
         out->modlist_paddr =
             copy_mem(out->modlist_paddr,
-                     out->nr_modules * sizeof(struct hvm_modlist_entry));
+                     out->nr_modules * sizeof(struct hvm_modlist_entry), ctx);
 
         mods = _p(out->modlist_paddr);
 
         for ( i = 0; i < out->nr_modules; i++ )
         {
             if ( mods[i].cmdline_paddr )
-                mods[i].cmdline_paddr = copy_string(mods[i].cmdline_paddr);
+                mods[i].cmdline_paddr = copy_string(mods[i].cmdline_paddr, ctx);
         }
     }
 
     return out;
 }
 
-static multiboot_info_t *mbi_reloc(uint32_t mbi_in)
+static multiboot_info_t *mbi_reloc(uint32_t mbi_in, memctx *ctx)
 {
     int i;
     multiboot_info_t *mbi_out;
 
-    mbi_out = _p(copy_mem(mbi_in, sizeof(*mbi_out)));
+    mbi_out = _p(copy_mem(mbi_in, sizeof(*mbi_out), ctx));
 
     if ( mbi_out->flags & MBI_CMDLINE )
-        mbi_out->cmdline = copy_string(mbi_out->cmdline);
+        mbi_out->cmdline = copy_string(mbi_out->cmdline, ctx);
 
     if ( mbi_out->flags & MBI_MODULES )
     {
         module_t *mods;
 
         mbi_out->mods_addr = copy_mem(mbi_out->mods_addr,
-                                      mbi_out->mods_count * sizeof(module_t));
+                                      mbi_out->mods_count * sizeof(module_t), ctx);
 
         mods = _p(mbi_out->mods_addr);
 
         for ( i = 0; i < mbi_out->mods_count; i++ )
         {
             if ( mods[i].string )
-                mods[i].string = copy_string(mods[i].string);
+                mods[i].string = copy_string(mods[i].string, ctx);
         }
     }
 
     if ( mbi_out->flags & MBI_MEMMAP )
-        mbi_out->mmap_addr = copy_mem(mbi_out->mmap_addr, mbi_out->mmap_length);
+        mbi_out->mmap_addr = copy_mem(mbi_out->mmap_addr, mbi_out->mmap_length, ctx);
 
     if ( mbi_out->flags & MBI_LOADERNAME )
-        mbi_out->boot_loader_name = copy_string(mbi_out->boot_loader_name);
+        mbi_out->boot_loader_name = copy_string(mbi_out->boot_loader_name, ctx);
 
     /* Mask features we don't understand or don't relocate. */
     mbi_out->flags &= (MBI_MEMLIMITS |
@@ -183,7 +190,7 @@ static multiboot_info_t *mbi_reloc(uint32_t mbi_in)
     return mbi_out;
 }
 
-static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
+static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out, memctx *ctx)
 {
     const multiboot2_fixed_t *mbi_fix = _p(mbi_in);
     const multiboot2_memory_map_t *mmap_src;
@@ -197,7 +204,7 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
     uint32_t ptr;
     unsigned int i, mod_idx = 0;
 
-    ptr = alloc_mem(sizeof(*mbi_out));
+    ptr = alloc_mem(sizeof(*mbi_out), ctx);
     mbi_out = _p(ptr);
     zero_mem(ptr, sizeof(*mbi_out));
 
@@ -222,7 +229,7 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
          * __start_xen() may put Xen image placement into it.
          */
         mbi_out->mods_addr = alloc_mem((mbi_out->mods_count + 1) *
-                                       sizeof(*mbi_out_mods));
+                                       sizeof(*mbi_out_mods), ctx);
         mbi_out_mods = _p(mbi_out->mods_addr);
     }
 
@@ -238,13 +245,13 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
         case MULTIBOOT2_TAG_TYPE_BOOT_LOADER_NAME:
             mbi_out->flags |= MBI_LOADERNAME;
             ptr = get_mb2_string(tag, string, string);
-            mbi_out->boot_loader_name = copy_string(ptr);
+            mbi_out->boot_loader_name = copy_string(ptr, ctx);
             break;
 
         case MULTIBOOT2_TAG_TYPE_CMDLINE:
             mbi_out->flags |= MBI_CMDLINE;
             ptr = get_mb2_string(tag, string, string);
-            mbi_out->cmdline = copy_string(ptr);
+            mbi_out->cmdline = copy_string(ptr, ctx);
             break;
 
         case MULTIBOOT2_TAG_TYPE_BASIC_MEMINFO:
@@ -263,7 +270,7 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
             mbi_out->mmap_length /= get_mb2_data(tag, mmap, entry_size);
             mbi_out->mmap_length *= sizeof(*mmap_dst);
 
-            mbi_out->mmap_addr = alloc_mem(mbi_out->mmap_length);
+            mbi_out->mmap_addr = alloc_mem(mbi_out->mmap_length, ctx);
 
             mmap_src = get_mb2_data(tag, mmap, entries);
             mmap_dst = _p(mbi_out->mmap_addr);
@@ -290,7 +297,7 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
             mbi_out_mods[mod_idx].mod_start = get_mb2_data(tag, module, mod_start);
             mbi_out_mods[mod_idx].mod_end = get_mb2_data(tag, module, mod_end);
             ptr = get_mb2_string(tag, module, cmdline);
-            mbi_out_mods[mod_idx].string = copy_string(ptr);
+            mbi_out_mods[mod_idx].string = copy_string(ptr, ctx);
             mbi_out_mods[mod_idx].reserved = 0;
             ++mod_idx;
             break;
@@ -356,19 +363,19 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
 void *reloc(uint32_t magic, uint32_t in, uint32_t trampoline,
             uint32_t video_info)
 {
-    alloc = trampoline;
+    memctx ctx = { trampoline };
 
     switch ( magic )
     {
     case MULTIBOOT_BOOTLOADER_MAGIC:
-        return mbi_reloc(in);
+        return mbi_reloc(in, &ctx);
 
     case MULTIBOOT2_BOOTLOADER_MAGIC:
-        return mbi2_reloc(in, video_info);
+        return mbi2_reloc(in, video_info, &ctx);
 
     case XEN_HVM_START_MAGIC_VALUE:
         if ( IS_ENABLED(CONFIG_PVH_GUEST) )
-            return pvh_info_reloc(in);
+            return pvh_info_reloc(in, &ctx);
         /* Fallthrough */
 
     default:
-- 
2.34.1


