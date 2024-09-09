Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D449714BF
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 12:04:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794134.1202854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snbGF-00076V-9F; Mon, 09 Sep 2024 10:04:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794134.1202854; Mon, 09 Sep 2024 10:04:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snbGF-00070K-4n; Mon, 09 Sep 2024 10:04:43 +0000
Received: by outflank-mailman (input) for mailman id 794134;
 Mon, 09 Sep 2024 10:04:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dA/l=QH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1snbGD-0006vS-CQ
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 10:04:41 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed354519-6e92-11ef-99a1-01e77a169b0f;
 Mon, 09 Sep 2024 12:04:39 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a8d24f98215so220459166b.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 03:04:39 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25ce96a7sm317744566b.158.2024.09.09.03.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 03:04:38 -0700 (PDT)
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
X-Inumbo-ID: ed354519-6e92-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725876279; x=1726481079; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3vJw186ObmYEr7Uk33IEzCtjEXUm1aGB1hGcKpPTafA=;
        b=iXYYgBAvQO8TPqR1K7EOT9n+jqgyMh6DkYybgtwuelLHwF6yL7mP2g9SCnMbScnzBv
         PBQN6tInkdWaIqTpG/o0le88PWp1emqttpuEW4EyJ0Au7qkejlOxlxxd5Wqxe909pycx
         W4xBh8lzwaWaOFwxJ3MXo0oUULDCDyh239MkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725876279; x=1726481079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3vJw186ObmYEr7Uk33IEzCtjEXUm1aGB1hGcKpPTafA=;
        b=aifyvkL60bLd6C8+JM/Wy1NGRcFHBa8tRmIpCn1slFbx1hwGWwc2Vow6MrOZvJsJsY
         +KtdDLE5YA+cdo293lgUzRWtSlLpjUMco6rGJK58CBnNEqLs5DbRmoT5CWA8I9Gz184n
         TVRw3IwaU38u++6aANzdep0cmjPyBq5qm1GnAXL5YsFyy3rOmdVBR23+d2sRqvR7rA3+
         rB8Y6MJdK2iVJrwfDvZ1RinM4RUHEPEaenlsSdurWZZNiJdT6gIe0KQoWxt86l4Oj6OG
         qB6+oXenORATDqWzIkG7lHhTa03EbLNJJzKsO6SMpt9sYK14YF2Hl5RImmLjlbSBgDLw
         cKUQ==
X-Gm-Message-State: AOJu0YwLhggRvyQc3PGxndQ6gTSLJMHni3IqyRoJDOsmDPpDtvEACmxv
	PS/K+ZMjZIr3Io0H0zoLEUvLtEfPfDrKByUCmGfcvo0rWzVn4GJpAMKHf5GCQCqijtQ69B6DSiG
	0
X-Google-Smtp-Source: AGHT+IEw4UEnN8nALZKbSq4rq63lD6JG8EIRCMLjlcuY0EBuFaqRUb0Ks0qcySRbHb5e8KEoHm5gNw==
X-Received: by 2002:a17:906:bc19:b0:a77:c95e:9b1c with SMTP id a640c23a62f3a-a8d2457d48cmr428352866b.27.1725876278704;
        Mon, 09 Sep 2024 03:04:38 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/boot: Avoid usage of global in reloc.c
Date: Mon,  9 Sep 2024 11:04:27 +0100
Message-Id: <20240909100428.47102-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All code and dat from this file will go into a text section
which we want to not be writeable.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/reloc.c | 65 +++++++++++++++++++++------------------
 1 file changed, 35 insertions(+), 30 deletions(-)

diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
index 201e38d544..c906c2a218 100644
--- a/xen/arch/x86/boot/reloc.c
+++ b/xen/arch/x86/boot/reloc.c
@@ -72,11 +72,16 @@ struct vesa_mode_info {
 #define get_mb2_data(tag, type, member)   (((const multiboot2_tag_##type##_t *)(tag))->member)
 #define get_mb2_string(tag, type, member) ((uint32_t)get_mb2_data(tag, type, member))
 
-static uint32_t alloc;
+typedef struct memctx {
+    /* Simple bump allocator.  It starts from the base of the trampoline and
+     * allocates downwards.
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
@@ -85,11 +90,11 @@ static void zero_mem(uint32_t s, uint32_t bytes)
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
@@ -98,7 +103,7 @@ static uint32_t copy_mem(uint32_t src, uint32_t bytes)
     return dst_ret;
 }
 
-static uint32_t copy_string(uint32_t src)
+static uint32_t copy_string(uint32_t src, memctx *ctx)
 {
     uint32_t p;
 
@@ -108,17 +113,17 @@ static uint32_t copy_string(uint32_t src)
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
@@ -127,51 +132,51 @@ static struct hvm_start_info *pvh_info_reloc(uint32_t in)
 
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
@@ -183,7 +188,7 @@ static multiboot_info_t *mbi_reloc(uint32_t mbi_in)
     return mbi_out;
 }
 
-static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
+static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out, memctx *ctx)
 {
     const multiboot2_fixed_t *mbi_fix = _p(mbi_in);
     const multiboot2_memory_map_t *mmap_src;
@@ -197,7 +202,7 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
     uint32_t ptr;
     unsigned int i, mod_idx = 0;
 
-    ptr = alloc_mem(sizeof(*mbi_out));
+    ptr = alloc_mem(sizeof(*mbi_out), ctx);
     mbi_out = _p(ptr);
     zero_mem(ptr, sizeof(*mbi_out));
 
@@ -222,7 +227,7 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
          * __start_xen() may put Xen image placement into it.
          */
         mbi_out->mods_addr = alloc_mem((mbi_out->mods_count + 1) *
-                                       sizeof(*mbi_out_mods));
+                                       sizeof(*mbi_out_mods), ctx);
         mbi_out_mods = _p(mbi_out->mods_addr);
     }
 
@@ -238,13 +243,13 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
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
@@ -263,7 +268,7 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
             mbi_out->mmap_length /= get_mb2_data(tag, mmap, entry_size);
             mbi_out->mmap_length *= sizeof(*mmap_dst);
 
-            mbi_out->mmap_addr = alloc_mem(mbi_out->mmap_length);
+            mbi_out->mmap_addr = alloc_mem(mbi_out->mmap_length, ctx);
 
             mmap_src = get_mb2_data(tag, mmap, entries);
             mmap_dst = _p(mbi_out->mmap_addr);
@@ -290,7 +295,7 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
             mbi_out_mods[mod_idx].mod_start = get_mb2_data(tag, module, mod_start);
             mbi_out_mods[mod_idx].mod_end = get_mb2_data(tag, module, mod_end);
             ptr = get_mb2_string(tag, module, cmdline);
-            mbi_out_mods[mod_idx].string = copy_string(ptr);
+            mbi_out_mods[mod_idx].string = copy_string(ptr, ctx);
             mbi_out_mods[mod_idx].reserved = 0;
             ++mod_idx;
             break;
@@ -356,19 +361,19 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
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


