Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DED992E9D
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 16:16:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812037.1224736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxoWq-000494-TO; Mon, 07 Oct 2024 14:16:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812037.1224736; Mon, 07 Oct 2024 14:16:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxoWq-00041v-NY; Mon, 07 Oct 2024 14:16:04 +0000
Received: by outflank-mailman (input) for mailman id 812037;
 Mon, 07 Oct 2024 14:16:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aWQm=RD=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sxoWp-0002yM-JU
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 14:16:03 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af1ecbae-84b6-11ef-a0bb-8be0dac302b0;
 Mon, 07 Oct 2024 16:16:03 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5c40aea5c40so8749903a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2024 07:16:03 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c8e05c119esm3386204a12.55.2024.10.07.07.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2024 07:16:01 -0700 (PDT)
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
X-Inumbo-ID: af1ecbae-84b6-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728310562; x=1728915362; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jmMdYCt1I0XZA3ClyzHKp7S/KpmvK5I8XHuXhKfs8dM=;
        b=QQHoR0UXxrdhfBXf1bycse/+4+40fS+x4bO8xs1rmoGDsdZ8O98y6OPqCFliyoJa+W
         saixbiEQATQLtZcgxuSmP3vWQ/2BThuAU6Mbe7ulorqxs8b2Sr4mE7kiEjJIz/1YpzSS
         QY9JNuGar0zNtTU5VBf1aoanUOadTYASlPvAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728310562; x=1728915362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jmMdYCt1I0XZA3ClyzHKp7S/KpmvK5I8XHuXhKfs8dM=;
        b=HARfZtmUPFzxP9+KU/cqvG0LGXZQ/0z1FjNI9rcUfOYaJDJe7Q5UpD5h55DwOuh4/9
         dp4JgimBcSvnR2stJTIxSSOvkMKrt5uif+0w5U/eB5PPlDHSBsTewuC45mPYk9AP8wut
         sk9V8i52zLdueIpluRuXdEl8ieGmq19EYBXAwzEaQXOPOumfMsT38MXdT0o+JBWmFpyA
         N0DY/KNr1LApKXvR4T56jJsV57UKLaPeSKz0GjerK7KEpX2yrR/NSmnCwu5CJrllPZjo
         n6JLL7VJrPcgxBQar+ClQW1oPxWt+Ge4aRrHY70gko7Tz1xISeR2a3JJcC7s2pDm3aFJ
         zniQ==
X-Gm-Message-State: AOJu0YzLretnQVwUDIqtV4jBvm8OxoTwU4p/ZwKjYveTqX7QxORwrdlO
	Di8JBXgyOCzHeyL2adY/nRGRCOuY9qCzT79F/+njT6M71MuyCxYcQTWe8j4i/6THRbpGRSzBZD0
	j
X-Google-Smtp-Source: AGHT+IFPRmj/tcAamcM2IaLVdwc5e0ZRbueK5DWj7yl1eChU2Au+DckDwtKwMAHqsfJe28ghGrgmww==
X-Received: by 2002:a05:6402:5250:b0:5c5:c444:4e3a with SMTP id 4fb4d7f45d1cf-5c8d2e5523bmr13554093a12.0.1728310562231;
        Mon, 07 Oct 2024 07:16:02 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 6/6] x86/boot: Use boot_vid_info variable directly from C code
Date: Mon,  7 Oct 2024 15:15:39 +0100
Message-Id: <20241007141539.1899350-7-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241007141539.1899350-1-frediano.ziglio@cloud.com>
References: <20241007141539.1899350-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No more need to pass from assembly code.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/build32.lds.S |  1 +
 xen/arch/x86/boot/head.S        |  9 +--------
 xen/arch/x86/boot/reloc.c       | 12 +++++-------
 3 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/boot/build32.lds.S b/xen/arch/x86/boot/build32.lds.S
index 9d09e3adbd..26ef609523 100644
--- a/xen/arch/x86/boot/build32.lds.S
+++ b/xen/arch/x86/boot/build32.lds.S
@@ -46,6 +46,7 @@ SECTIONS
         DECLARE_IMPORT(__trampoline_seg_start);
         DECLARE_IMPORT(__trampoline_seg_stop);
         DECLARE_IMPORT(trampoline_phys);
+        DECLARE_IMPORT(boot_vid_info);
         . = . + GAP;
         *(.text)
         *(.text.*)
diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 32b658fa2b..dcda91cfda 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -510,16 +510,9 @@ trampoline_setup:
         mov     %esi, sym_esi(xen_phys_start)
         mov     %esi, sym_esi(trampoline_xen_phys_start)
 
-        /* Boot video info to be filled from MB2. */
-#ifdef CONFIG_VIDEO
-        lea     sym_esi(boot_vid_info), %ecx
-#else
-        xor     %ecx, %ecx
-#endif
-
         /* Save Multiboot / PVH info struct (after relocation) for later use. */
         mov     %ebx, %edx          /* Multiboot / PVH information address. */
-        /*      reloc(magic/eax, info/edx, video/stk) using fastcall. */
+        /*      reloc(magic/eax, info/edx) using fastcall. */
         call    reloc
 
 #ifdef CONFIG_PVH_GUEST
diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
index 4cca61adec..8527fa8d01 100644
--- a/xen/arch/x86/boot/reloc.c
+++ b/xen/arch/x86/boot/reloc.c
@@ -179,7 +179,7 @@ static multiboot_info_t *mbi_reloc(uint32_t mbi_in, memctx *ctx)
     return mbi_out;
 }
 
-static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out, memctx *ctx)
+static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, memctx *ctx)
 {
     const multiboot2_fixed_t *mbi_fix = _p(mbi_in);
     const multiboot2_memory_map_t *mmap_src;
@@ -188,7 +188,7 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out, memctx
     memory_map_t *mmap_dst;
     multiboot_info_t *mbi_out;
 #ifdef CONFIG_VIDEO
-    struct boot_video_info *video = NULL;
+    struct boot_video_info *video = &boot_vid_info;
 #endif
     uint32_t ptr;
     unsigned int i, mod_idx = 0;
@@ -293,12 +293,11 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out, memctx
 
 #ifdef CONFIG_VIDEO
         case MULTIBOOT2_TAG_TYPE_VBE:
-            if ( video_out )
+            if ( video )
             {
                 const struct vesa_ctrl_info *ci;
                 const struct vesa_mode_info *mi;
 
-                video = _p(video_out);
                 ci = (const void *)get_mb2_data(tag, vbe, vbe_control_info);
                 mi = (const void *)get_mb2_data(tag, vbe, vbe_mode_info);
 
@@ -324,7 +323,6 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out, memctx
             if ( (get_mb2_data(tag, framebuffer, framebuffer_type) !=
                   MULTIBOOT2_FRAMEBUFFER_TYPE_RGB) )
             {
-                video_out = 0;
                 video = NULL;
             }
             break;
@@ -349,7 +347,7 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out, memctx
 }
 
 /* SAF-1-safe */
-void *reloc(uint32_t magic, uint32_t in, uint32_t video_info)
+void *reloc(uint32_t magic, uint32_t in)
 {
     /* Get bottom-most low-memory stack address. */
     memctx ctx = { (uint32_t)((long)trampoline_phys + TRAMPOLINE_SPACE) };
@@ -360,7 +358,7 @@ void *reloc(uint32_t magic, uint32_t in, uint32_t video_info)
         return mbi_reloc(in, &ctx);
 
     case MULTIBOOT2_BOOTLOADER_MAGIC:
-        return mbi2_reloc(in, video_info, &ctx);
+        return mbi2_reloc(in, &ctx);
 
     case XEN_HVM_START_MAGIC_VALUE:
         if ( IS_ENABLED(CONFIG_PVH_GUEST) )
-- 
2.34.1


