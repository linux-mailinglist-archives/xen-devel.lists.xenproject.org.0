Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C52964390
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 13:53:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785701.1195175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjdi2-0005t4-Ey; Thu, 29 Aug 2024 11:53:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785701.1195175; Thu, 29 Aug 2024 11:53:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjdi2-0005qr-BX; Thu, 29 Aug 2024 11:53:02 +0000
Received: by outflank-mailman (input) for mailman id 785701;
 Thu, 29 Aug 2024 11:53:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dlBE=P4=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sjdi0-0005ql-Kc
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 11:53:00 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c26f364-65fd-11ef-99a0-01e77a169b0f;
 Thu, 29 Aug 2024 13:52:58 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5c210e23651so556647a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Aug 2024 04:52:58 -0700 (PDT)
Received: from fziglio-xenia-fedora.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226ccfe78sm616104a12.69.2024.08.29.04.52.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 04:52:57 -0700 (PDT)
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
X-Inumbo-ID: 3c26f364-65fd-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724932378; x=1725537178; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t4OqEWyZVMJYP4Q1dCFXbk9bU+PaTs6KjTWg21ZmJh4=;
        b=iaKNbYMAkB84Q9XDyiK0WGKIocZ4XZx2jJbHgo+j14JE6mA+NPkQpEk9Z982IyrHuW
         Gs7Gp35isDXMlX7uFowMTvhfr1SxxhMQADRL9IW4BypnjLZM3nuSBFZmLM11CfqqssCn
         n9RXB8dFq+Fly1RjXQJnVZ5L+A+Q4DydBVTnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724932378; x=1725537178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t4OqEWyZVMJYP4Q1dCFXbk9bU+PaTs6KjTWg21ZmJh4=;
        b=ums1RbCfa/CCOU1QcYjmBgEMnovSmPcLgzSNN5LclUra9PeQ+AMZuBZxrsgDhX015V
         3GHi5Eb6XNLwEFxNOaqOPDY+eKUCBT/k+PMOeqpv5UwI9j6SCFCZ2RNFB8pHaYrbdXhq
         ExBwXnNbwQiISZfWkxrp2Xp8ZUM9e89ZLBg1eRdf6SPKC3xty+uh2cflpxBYoPdbKkZQ
         xQlHckmXaBNz7OtPqeJ0Wo47GX3fZNd8mPuO/dx3BrCHwgRvAhyJzr7LenuNz+DdmzoL
         PU6k36SY4QJTfu4ERpW1mgHQZbsLuyv+ueZdUaFniC3MY5el6Laclc2CP5tEnuxoH0nv
         C9og==
X-Gm-Message-State: AOJu0Yz2BbCtg5vFqf52afw80l95rAnJn0NZL5nhuS7lmCxnCSVQ6xC6
	2B0c2FZIojGmO6CZQXLoqH0lTeXcLU8rY2ZpTFMBDx8thRfjY+ihSj3BgokQ2m0AGJrafa5aDo1
	c
X-Google-Smtp-Source: AGHT+IHpIyPbAlSbhyV3XURLXvebXe2XRgkMpd6IIEIdby5cc/qYAgdnr5Vc8CjlYbg+0x50U7G0eg==
X-Received: by 2002:a05:6402:3481:b0:5be:e01c:6b5e with SMTP id 4fb4d7f45d1cf-5c21eda3441mr2093762a12.35.1724932377470;
        Thu, 29 Aug 2024 04:52:57 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/boot: Use C99 types for integers
Date: Thu, 29 Aug 2024 12:52:44 +0100
Message-ID: <20240829115247.168608-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Just style update, no functional change.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/cmdline.c | 30 ++++++++++++++---------------
 xen/arch/x86/boot/defs.h    |  2 +-
 xen/arch/x86/boot/reloc.c   | 38 ++++++++++++++++++-------------------
 3 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/xen/arch/x86/boot/cmdline.c b/xen/arch/x86/boot/cmdline.c
index f9eee756aa..b8ad7f3a14 100644
--- a/xen/arch/x86/boot/cmdline.c
+++ b/xen/arch/x86/boot/cmdline.c
@@ -36,15 +36,15 @@ asm (
 
 /* Keep in sync with trampoline.S:early_boot_opts label! */
 typedef struct __packed {
-    u8 skip_realmode;
-    u8 opt_edd;
-    u8 opt_edid;
-    u8 padding;
+    uint8_t skip_realmode;
+    uint8_t opt_edd;
+    uint8_t opt_edid;
+    uint8_t padding;
 #ifdef CONFIG_VIDEO
-    u16 boot_vid_mode;
-    u16 vesa_width;
-    u16 vesa_height;
-    u16 vesa_depth;
+    uint16_t boot_vid_mode;
+    uint16_t vesa_width;
+    uint16_t vesa_height;
+    uint16_t vesa_depth;
 #endif
 } early_boot_opts_t;
 
@@ -214,7 +214,7 @@ static bool skip_realmode(const char *cmdline)
     return find_opt(cmdline, "no-real-mode", false) || find_opt(cmdline, "tboot=", true);
 }
 
-static u8 edd_parse(const char *cmdline)
+static uint8_t edd_parse(const char *cmdline)
 {
     const char *c;
 
@@ -229,7 +229,7 @@ static u8 edd_parse(const char *cmdline)
     return !strmaxcmp(c, "skipmbr", delim_chars);
 }
 
-static u8 edid_parse(const char *cmdline)
+static uint8_t edid_parse(const char *cmdline)
 {
     const char *c;
 
@@ -245,7 +245,7 @@ static u8 edid_parse(const char *cmdline)
 }
 
 #ifdef CONFIG_VIDEO
-static u16 rows2vmode(unsigned int rows)
+static uint16_t rows2vmode(unsigned int rows)
 {
     switch ( rows )
     {
@@ -300,7 +300,7 @@ static void vga_parse(const char *cmdline, early_boot_opts_t *ebo)
         {
             vesa_width = strtoui(c + strlen("gfx-"), "x", &c);
 
-            if ( vesa_width > U16_MAX )
+            if ( vesa_width > UINT16_MAX )
                 return;
 
             /*
@@ -311,12 +311,12 @@ static void vga_parse(const char *cmdline, early_boot_opts_t *ebo)
             ++c;
             vesa_height = strtoui(c, "x", &c);
 
-            if ( vesa_height > U16_MAX )
+            if ( vesa_height > UINT16_MAX )
                 return;
 
             vesa_depth = strtoui(++c, delim_chars_comma, NULL);
 
-            if ( vesa_depth > U16_MAX )
+            if ( vesa_depth > UINT16_MAX )
                 return;
 
             ebo->vesa_width = vesa_width;
@@ -328,7 +328,7 @@ static void vga_parse(const char *cmdline, early_boot_opts_t *ebo)
         {
             tmp = strtoui(c + strlen("mode-"), delim_chars_comma, NULL);
 
-            if ( tmp > U16_MAX )
+            if ( tmp > UINT16_MAX )
                 return;
 
             ebo->boot_vid_mode = tmp;
diff --git a/xen/arch/x86/boot/defs.h b/xen/arch/x86/boot/defs.h
index 239b9f8716..ee1a4da6af 100644
--- a/xen/arch/x86/boot/defs.h
+++ b/xen/arch/x86/boot/defs.h
@@ -57,7 +57,7 @@ typedef u16 uint16_t;
 typedef u32 uint32_t;
 typedef u64 uint64_t;
 
-#define U16_MAX		((u16)(~0U))
+#define UINT16_MAX	((uint16_t)(~0U))
 #define UINT_MAX	(~0U)
 
 #endif /* __BOOT_DEFS_H__ */
diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
index 4033557481..589e026ff9 100644
--- a/xen/arch/x86/boot/reloc.c
+++ b/xen/arch/x86/boot/reloc.c
@@ -68,24 +68,24 @@ struct vesa_mode_info {
 #endif /* CONFIG_VIDEO */
 
 #define get_mb2_data(tag, type, member)   (((const multiboot2_tag_##type##_t *)(tag))->member)
-#define get_mb2_string(tag, type, member) ((u32)get_mb2_data(tag, type, member))
+#define get_mb2_string(tag, type, member) ((uint32_t)get_mb2_data(tag, type, member))
 
-static u32 alloc;
+static uint32_t alloc;
 
-static u32 alloc_mem(u32 bytes)
+static uint32_t alloc_mem(uint32_t bytes)
 {
     return alloc -= ALIGN_UP(bytes, 16);
 }
 
-static void zero_mem(u32 s, u32 bytes)
+static void zero_mem(uint32_t s, uint32_t bytes)
 {
     while ( bytes-- )
         *(char *)s++ = 0;
 }
 
-static u32 copy_mem(u32 src, u32 bytes)
+static uint32_t copy_mem(uint32_t src, uint32_t bytes)
 {
-    u32 dst, dst_ret;
+    uint32_t dst, dst_ret;
 
     dst = alloc_mem(bytes);
     dst_ret = dst;
@@ -96,9 +96,9 @@ static u32 copy_mem(u32 src, u32 bytes)
     return dst_ret;
 }
 
-static u32 copy_string(u32 src)
+static uint32_t copy_string(uint32_t src)
 {
-    u32 p;
+    uint32_t p;
 
     if ( !src )
         return 0;
@@ -109,7 +109,7 @@ static u32 copy_string(u32 src)
     return copy_mem(src, p - src + 1);
 }
 
-static struct hvm_start_info *pvh_info_reloc(u32 in)
+static struct hvm_start_info *pvh_info_reloc(uint32_t in)
 {
     struct hvm_start_info *out;
 
@@ -139,7 +139,7 @@ static struct hvm_start_info *pvh_info_reloc(u32 in)
     return out;
 }
 
-static multiboot_info_t *mbi_reloc(u32 mbi_in)
+static multiboot_info_t *mbi_reloc(uint32_t mbi_in)
 {
     int i;
     multiboot_info_t *mbi_out;
@@ -192,7 +192,7 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
 #ifdef CONFIG_VIDEO
     struct boot_video_info *video = NULL;
 #endif
-    u32 ptr;
+    uint32_t ptr;
     unsigned int i, mod_idx = 0;
 
     ptr = alloc_mem(sizeof(*mbi_out));
@@ -203,8 +203,8 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
     ptr = ALIGN_UP(mbi_in + sizeof(*mbi_fix), MULTIBOOT2_TAG_ALIGN);
 
     /* Get the number of modules. */
-    for ( tag = _p(ptr); (u32)tag - mbi_in < mbi_fix->total_size;
-          tag = _p(ALIGN_UP((u32)tag + tag->size, MULTIBOOT2_TAG_ALIGN)) )
+    for ( tag = _p(ptr); (uint32_t)tag - mbi_in < mbi_fix->total_size;
+          tag = _p(ALIGN_UP((uint32_t)tag + tag->size, MULTIBOOT2_TAG_ALIGN)) )
     {
         if ( tag->type == MULTIBOOT2_TAG_TYPE_MODULE )
             ++mbi_out->mods_count;
@@ -228,8 +228,8 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
     ptr = ALIGN_UP(mbi_in + sizeof(*mbi_fix), MULTIBOOT2_TAG_ALIGN);
 
     /* Put all needed data into mbi_out. */
-    for ( tag = _p(ptr); (u32)tag - mbi_in < mbi_fix->total_size;
-          tag = _p(ALIGN_UP((u32)tag + tag->size, MULTIBOOT2_TAG_ALIGN)) )
+    for ( tag = _p(ptr); (uint32_t)tag - mbi_in < mbi_fix->total_size;
+          tag = _p(ALIGN_UP((uint32_t)tag + tag->size, MULTIBOOT2_TAG_ALIGN)) )
     {
         switch ( tag->type )
         {
@@ -272,10 +272,10 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
                 mmap_dst[i].size = sizeof(*mmap_dst);
                 mmap_dst[i].size -= sizeof(mmap_dst[i].size);
                 /* Now copy a given region data. */
-                mmap_dst[i].base_addr_low = (u32)mmap_src->addr;
-                mmap_dst[i].base_addr_high = (u32)(mmap_src->addr >> 32);
-                mmap_dst[i].length_low = (u32)mmap_src->len;
-                mmap_dst[i].length_high = (u32)(mmap_src->len >> 32);
+                mmap_dst[i].base_addr_low = (uint32_t)mmap_src->addr;
+                mmap_dst[i].base_addr_high = (uint32_t)(mmap_src->addr >> 32);
+                mmap_dst[i].length_low = (uint32_t)mmap_src->len;
+                mmap_dst[i].length_high = (uint32_t)(mmap_src->len >> 32);
                 mmap_dst[i].type = mmap_src->type;
                 mmap_src = _p(mmap_src) + get_mb2_data(tag, mmap, entry_size);
             }
-- 
2.46.0


