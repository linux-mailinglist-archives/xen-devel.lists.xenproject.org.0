Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F60B9A054B
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 11:22:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819757.1233221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t10EQ-0001f8-1b; Wed, 16 Oct 2024 09:22:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819757.1233221; Wed, 16 Oct 2024 09:22:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t10EP-0001Zy-ON; Wed, 16 Oct 2024 09:22:13 +0000
Received: by outflank-mailman (input) for mailman id 819757;
 Wed, 16 Oct 2024 09:22:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zOTK=RM=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t10EN-0001Po-NF
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 09:22:11 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1eefe474-8ba0-11ef-99a3-01e77a169b0f;
 Wed, 16 Oct 2024 11:22:10 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5c9693dc739so5118725a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Oct 2024 02:22:10 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c98d7b735dsm1500429a12.81.2024.10.16.02.22.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2024 02:22:08 -0700 (PDT)
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
X-Inumbo-ID: 1eefe474-8ba0-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729070529; x=1729675329; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XzEVlEnNeKtsG4oZ8vIN3HV3hoDau6dk7zOGpeVNZ9s=;
        b=YFiBdzIufeQCHPWIQL/0TEqbkyCu3zPagUFZsYhZLjb6/UaJEttihz156zrkgebumr
         CoakBG96Yt+sKIPZc/wv6TO5E+YW+0osaUGtSzxLOFGnmzaLuuAqBTgEFrBYITYLMFE9
         zXG3pCeMfR7wreEk8mqjTbTj6BGuPHPjEox8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729070529; x=1729675329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XzEVlEnNeKtsG4oZ8vIN3HV3hoDau6dk7zOGpeVNZ9s=;
        b=g8KigmDxEO1oXC0Zr3RyWONNOWT6RINZXinSYKbWvETs2G1+G0KXmWgMAHHuFkmcyf
         5aPD7V/XVxNShGoXYhcgNlL6sfrRiHdmCPckpOauYk/kWLC0Q/paIr/76w7R9Nu8ArLs
         KlRU6GQwKLuOexjN3QlJQWXM3kkdAMTARYe3KNriIFLxwC8WTYCEeFyM+U5rcZdmK5qH
         kFg2zG/awUWIF5MLRYB99gzm2PWbkABD01wfBZrrGHmd8OH4bsHZZSjbqfTr2O2PV8s+
         l/4aliZzrSBT0Cqup9Z7Dqqiclj/t31zGhB/sN/nLxpBT45U5AMTAkGkzHOM0BeNZMNG
         1bog==
X-Gm-Message-State: AOJu0YyphXsvdJfJaAyi7aHmwT8SbxjMEapyo3OWM8uaPCtyuMjp7GsA
	nGz1KadvrslPedc8FcdabRx7hJwfm00Hd1qLCi4HeqoVeTCKxGsdQvKFTtANBWLCzjt15VW2hsZ
	J
X-Google-Smtp-Source: AGHT+IHohGUVdY4sTxAvaiFNp1up++HCBeuU9Xmp8/ixL7XlHSMh7T3ky3iziP2QdOnDIeFlLArrAg==
X-Received: by 2002:a05:6402:3210:b0:5c5:b6a4:4ac1 with SMTP id 4fb4d7f45d1cf-5c95ac0d3eamr9519985a12.11.1729070529160;
        Wed, 16 Oct 2024 02:22:09 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 3/5] x86/boot: Use boot_vid_info variable directly from C code
Date: Wed, 16 Oct 2024 10:21:52 +0100
Message-Id: <20241016092154.1493035-4-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241016092154.1493035-1-frediano.ziglio@cloud.com>
References: <20241016092154.1493035-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No more need to pass from assembly code.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Changes since v1:
- split the 2 variable changes into 2 commits.

Changes since v2:
- revert commit order.
---
 xen/arch/x86/boot/build32.lds.S |  1 +
 xen/arch/x86/boot/head.S        | 10 +---------
 xen/arch/x86/boot/reloc.c       | 13 +++++--------
 3 files changed, 7 insertions(+), 17 deletions(-)

diff --git a/xen/arch/x86/boot/build32.lds.S b/xen/arch/x86/boot/build32.lds.S
index fa282370f4..88b1964845 100644
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
index ade2c5c43d..5da7ac138f 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -514,18 +514,10 @@ trampoline_setup:
         mov     sym_esi(trampoline_phys), %ecx
         add     $TRAMPOLINE_SPACE,%ecx
 
-#ifdef CONFIG_VIDEO
-        lea     sym_esi(boot_vid_info), %edx
-#else
-        xor     %edx, %edx
-#endif
-
         /* Save Multiboot / PVH info struct (after relocation) for later use. */
-        push    %edx                /* Boot video info to be filled from MB2. */
         mov     %ebx, %edx          /* Multiboot / PVH information address. */
-        /*      reloc(magic/eax, info/edx, trampoline/ecx, video/stk) using fastcall. */
+        /*      reloc(magic/eax, info/edx, trampoline/ecx) using fastcall. */
         call    reloc
-        add     $4, %esp
 
 #ifdef CONFIG_PVH_GUEST
         cmpb    $0, sym_esi(pvh_boot)
diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
index 94b078d7b1..707d9c5f15 100644
--- a/xen/arch/x86/boot/reloc.c
+++ b/xen/arch/x86/boot/reloc.c
@@ -176,7 +176,7 @@ static multiboot_info_t *mbi_reloc(uint32_t mbi_in, memctx *ctx)
     return mbi_out;
 }
 
-static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out, memctx *ctx)
+static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, memctx *ctx)
 {
     const multiboot2_fixed_t *mbi_fix = _p(mbi_in);
     const multiboot2_memory_map_t *mmap_src;
@@ -185,7 +185,7 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out, memctx
     memory_map_t *mmap_dst;
     multiboot_info_t *mbi_out;
 #ifdef CONFIG_VIDEO
-    struct boot_video_info *video = NULL;
+    struct boot_video_info *video = &boot_vid_info;
 #endif
     uint32_t ptr;
     unsigned int i, mod_idx = 0;
@@ -290,12 +290,11 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out, memctx
 
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
 
@@ -321,7 +320,6 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out, memctx
             if ( (get_mb2_data(tag, framebuffer, framebuffer_type) !=
                   MULTIBOOT2_FRAMEBUFFER_TYPE_RGB) )
             {
-                video_out = 0;
                 video = NULL;
             }
             break;
@@ -346,8 +344,7 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out, memctx
 }
 
 /* SAF-1-safe */
-void *reloc(uint32_t magic, uint32_t in, uint32_t trampoline,
-            uint32_t video_info)
+void *reloc(uint32_t magic, uint32_t in, uint32_t trampoline)
 {
     memctx ctx = { trampoline };
 
@@ -357,7 +354,7 @@ void *reloc(uint32_t magic, uint32_t in, uint32_t trampoline,
         return mbi_reloc(in, &ctx);
 
     case MULTIBOOT2_BOOTLOADER_MAGIC:
-        return mbi2_reloc(in, video_info, &ctx);
+        return mbi2_reloc(in, &ctx);
 
     case XEN_HVM_START_MAGIC_VALUE:
         if ( IS_ENABLED(CONFIG_PVH_GUEST) )
-- 
2.34.1


