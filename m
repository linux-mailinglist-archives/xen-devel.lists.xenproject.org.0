Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFDE96C174
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 16:57:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790436.1200185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slrRR-0001Es-WE; Wed, 04 Sep 2024 14:57:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790436.1200185; Wed, 04 Sep 2024 14:57:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slrRR-0001C3-SU; Wed, 04 Sep 2024 14:57:05 +0000
Received: by outflank-mailman (input) for mailman id 790436;
 Wed, 04 Sep 2024 14:57:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S0IR=QC=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1slrRP-0001Be-QU
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 14:57:03 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1a4bf85-6acd-11ef-a0b3-8be0dac302b0;
 Wed, 04 Sep 2024 16:57:02 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5bef295a429so1070863a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 07:57:02 -0700 (PDT)
Received: from fziglio-xenia-fedora.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3cc56c501sm18862a12.52.2024.09.04.07.57.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 07:57:01 -0700 (PDT)
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
X-Inumbo-ID: f1a4bf85-6acd-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725461822; x=1726066622; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H2XLzta5aUPYVTAfd1K28dnU5rjnLpIfui7Cf5/r5KQ=;
        b=jP8ZevKMqmmu/mAMD0kGn4lr4Zo+qcxrEJfw4TaVrxEc7QMWGsXSEiIbricKrCogXi
         if09DwlKKuhBI6exLFSecbJE87cOOqUH0sAnC2w2kZxNx5CV/SpkzI5ZXRS+2v7i0dPY
         3m/MW089iQXAYMdL6vtakwHMCe3HZJzIdZt/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725461822; x=1726066622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H2XLzta5aUPYVTAfd1K28dnU5rjnLpIfui7Cf5/r5KQ=;
        b=lBlNYQunj0Ky/eB6e+NQD4CZPUR69QhW6RfXAqvhejr5PDLc11mp8BMzUKRsdcQfS9
         RQCiVoXy+l4KnUVV1BrSPO3QoIeTnzGqgOhyG5iuBo8thtrzuMA6woVViJ9+fp08aSzg
         8zmO6cezKzzHx6BB6CwmjVsULPR5SoW8bBDAKZab6DWkv5MulVhMVF/cS1RAfvkAL/ZJ
         kN62Z1YOuLkLOe+XmTgxHQJ+pjdBejPzanjo8AR2/aC2nAvBun0ZRPoqOH9myKriR7cH
         rIQmIJMFPCmpZW/JIJFHdehodDyDAwkFSwH3106dOXIXqp0qNfYfXiZ/sHpR4zaNq5jw
         A0Sw==
X-Gm-Message-State: AOJu0YxYq5mrK7jFNFh+2GnfTU4li1aIourUIyx6fdbl3c+XQESvwDmL
	Ltn7dmGOCKg6Jlp4k+FF6uw2/G8FcOBwDzhpvsu+NBtowOdobuvwo0qrjOOoQV018CsoZQGE0OW
	4
X-Google-Smtp-Source: AGHT+IGqgeZCHMlbOlVzNCPm9aIs6RyyjIS1QCMGTLMuwlRgWzHc7PSzqeWrVWP56rm7TMUE30KSBw==
X-Received: by 2002:a05:6402:210b:b0:5c2:5ca0:807a with SMTP id 4fb4d7f45d1cf-5c2caf22e50mr2018608a12.22.1725461821752;
        Wed, 04 Sep 2024 07:57:01 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC 1/5] Avoid usage of global in reloc.c
Date: Wed,  4 Sep 2024 15:56:44 +0100
Message-ID: <20240904145648.33707-2-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240904145648.33707-1-frediano.ziglio@cloud.com>
References: <20240904145648.33707-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All code and dat from this file will go into a text section
which we want to not be writeable.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/reloc.c | 62 ++++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 30 deletions(-)

diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
index 201e38d544..de8487483a 100644
--- a/xen/arch/x86/boot/reloc.c
+++ b/xen/arch/x86/boot/reloc.c
@@ -72,11 +72,13 @@ struct vesa_mode_info {
 #define get_mb2_data(tag, type, member)   (((const multiboot2_tag_##type##_t *)(tag))->member)
 #define get_mb2_string(tag, type, member) ((uint32_t)get_mb2_data(tag, type, member))
 
-static uint32_t alloc;
+typedef struct memctx {
+    uint32_t alloc;
+} memctx;
 
-static uint32_t alloc_mem(uint32_t bytes)
+static uint32_t alloc_mem(uint32_t bytes, memctx *ctx)
 {
-    return alloc -= ROUNDUP(bytes, 16);
+    return ctx->alloc -= ROUNDUP(bytes, 16);
 }
 
 static void zero_mem(uint32_t s, uint32_t bytes)
@@ -85,11 +87,11 @@ static void zero_mem(uint32_t s, uint32_t bytes)
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
@@ -98,7 +100,7 @@ static uint32_t copy_mem(uint32_t src, uint32_t bytes)
     return dst_ret;
 }
 
-static uint32_t copy_string(uint32_t src)
+static uint32_t copy_string(uint32_t src, memctx *ctx)
 {
     uint32_t p;
 
@@ -108,17 +110,17 @@ static uint32_t copy_string(uint32_t src)
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
@@ -127,51 +129,51 @@ static struct hvm_start_info *pvh_info_reloc(uint32_t in)
 
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
@@ -183,7 +185,7 @@ static multiboot_info_t *mbi_reloc(uint32_t mbi_in)
     return mbi_out;
 }
 
-static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
+static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out, memctx *ctx)
 {
     const multiboot2_fixed_t *mbi_fix = _p(mbi_in);
     const multiboot2_memory_map_t *mmap_src;
@@ -197,7 +199,7 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
     uint32_t ptr;
     unsigned int i, mod_idx = 0;
 
-    ptr = alloc_mem(sizeof(*mbi_out));
+    ptr = alloc_mem(sizeof(*mbi_out), ctx);
     mbi_out = _p(ptr);
     zero_mem(ptr, sizeof(*mbi_out));
 
@@ -222,7 +224,7 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
          * __start_xen() may put Xen image placement into it.
          */
         mbi_out->mods_addr = alloc_mem((mbi_out->mods_count + 1) *
-                                       sizeof(*mbi_out_mods));
+                                       sizeof(*mbi_out_mods), ctx);
         mbi_out_mods = _p(mbi_out->mods_addr);
     }
 
@@ -238,13 +240,13 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
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
@@ -263,7 +265,7 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
             mbi_out->mmap_length /= get_mb2_data(tag, mmap, entry_size);
             mbi_out->mmap_length *= sizeof(*mmap_dst);
 
-            mbi_out->mmap_addr = alloc_mem(mbi_out->mmap_length);
+            mbi_out->mmap_addr = alloc_mem(mbi_out->mmap_length, ctx);
 
             mmap_src = get_mb2_data(tag, mmap, entries);
             mmap_dst = _p(mbi_out->mmap_addr);
@@ -290,7 +292,7 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
             mbi_out_mods[mod_idx].mod_start = get_mb2_data(tag, module, mod_start);
             mbi_out_mods[mod_idx].mod_end = get_mb2_data(tag, module, mod_end);
             ptr = get_mb2_string(tag, module, cmdline);
-            mbi_out_mods[mod_idx].string = copy_string(ptr);
+            mbi_out_mods[mod_idx].string = copy_string(ptr, ctx);
             mbi_out_mods[mod_idx].reserved = 0;
             ++mod_idx;
             break;
@@ -356,19 +358,19 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
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
2.46.0


