Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5172E991536
	for <lists+xen-devel@lfdr.de>; Sat,  5 Oct 2024 10:03:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810796.1223564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swzkb-0005TX-9u; Sat, 05 Oct 2024 08:02:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810796.1223564; Sat, 05 Oct 2024 08:02:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swzkb-0005QT-6M; Sat, 05 Oct 2024 08:02:53 +0000
Received: by outflank-mailman (input) for mailman id 810796;
 Sat, 05 Oct 2024 08:02:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Cfp=RB=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swzkZ-0004jU-9N
 for xen-devel@lists.xenproject.org; Sat, 05 Oct 2024 08:02:51 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36dd114d-82f0-11ef-99a2-01e77a169b0f;
 Sat, 05 Oct 2024 10:02:49 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a98f6f777f1so370744266b.2
 for <xen-devel@lists.xenproject.org>; Sat, 05 Oct 2024 01:02:49 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9933db9c5bsm84152366b.162.2024.10.05.01.02.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Oct 2024 01:02:48 -0700 (PDT)
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
X-Inumbo-ID: 36dd114d-82f0-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728115369; x=1728720169; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AkgUENXQdE4QNGEH0p3QPPSrj4g3gLBF4EM9E5qv2+o=;
        b=Veiw+osfA1vrHrn5cQHIbvkCqiXUGZgJ2lBqpFrIU2J7wmhZwLwb023od9yO9EmoQ2
         BX74MinEZ/pL00pBn8hFNWghjO5DuKchsGj5wiHvXimfT2PzZ4VNNDWRlYjnXOE9+RwJ
         CgziziehXIs4KtMZo1o3r/PhkmiLSyDTM+6xg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728115369; x=1728720169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AkgUENXQdE4QNGEH0p3QPPSrj4g3gLBF4EM9E5qv2+o=;
        b=wXVw9VqDTArLeUB5pmKgMpP1YciwpFgTpb3f/GK3pcmI/uo4iJutatlUEqIQizPgEs
         sRf4ckdBNYmGXw9+DN5LQkD2tYhiMOyyRkKjY13Mz/U6OOcfHqZV7oBKBStglLHXWZzx
         GOUq0tzdUyHi8jHtngxY1M0Qw/7n8oQfUCV15NIgdIHkQ4Gxl5rCY+qvk9Z7JXVe/wH0
         PcVFjCqmJVPAhwCqa1ig+CYvrj/iHf+8vi4zPIWGaJeSGuOcI4LPv+8WSgDsaNy71URr
         XPDDMR3ePW6pNeGmR0xx3I0gKFU6zhyVJuOfkb2HfiUjEZUM0HQYRHrkxsYB8L607E5D
         GSeA==
X-Gm-Message-State: AOJu0YyZZDUWj5CQxeGUDQ0ZudWmuqcN/mkBjSod750Q9LN/TEWno/0r
	tGbPsLSAfQeKtyq++YwU6OPJhwh893mX/cFedkGJ4efrJ/22hjTO5/P+jiUJYwVyPLLeXbl84KV
	I
X-Google-Smtp-Source: AGHT+IGD10/+6BTK/Sv5XM2Jfi9l3GfoJjMZkSYzWZkmpgTC0u0ELD7e4hZqsapGvK8h5xPPOjmnUg==
X-Received: by 2002:a17:907:9492:b0:a8d:2ec3:94f4 with SMTP id a640c23a62f3a-a991c07445amr555138766b.54.1728115368882;
        Sat, 05 Oct 2024 01:02:48 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 3/3] x86/boot: Use boot_vid_info and trampoline_phys variables directly from C code
Date: Sat,  5 Oct 2024 09:02:33 +0100
Message-Id: <20241005080233.1248850-4-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241005080233.1248850-1-frediano.ziglio@cloud.com>
References: <20241005080233.1248850-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No more need to pass from assembly code.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/build32.lds.S |  1 +
 xen/arch/x86/boot/head.S        | 14 +-------------
 xen/arch/x86/boot/reloc.c       | 19 ++++++++++---------
 3 files changed, 12 insertions(+), 22 deletions(-)

diff --git a/xen/arch/x86/boot/build32.lds.S b/xen/arch/x86/boot/build32.lds.S
index 2d10a75fb1..6598a24e04 100644
--- a/xen/arch/x86/boot/build32.lds.S
+++ b/xen/arch/x86/boot/build32.lds.S
@@ -48,6 +48,7 @@ SECTIONS
         DECLARE_IMPORT(__trampoline_seg_start);
         DECLARE_IMPORT(__trampoline_seg_stop);
         DECLARE_IMPORT(trampoline_phys);
+        DECLARE_IMPORT(boot_vid_info);
         . = . + GAP;
         *(.text)
         *(.text.*)
diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index ade2c5c43d..dcda91cfda 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -510,22 +510,10 @@ trampoline_setup:
         mov     %esi, sym_esi(xen_phys_start)
         mov     %esi, sym_esi(trampoline_xen_phys_start)
 
-        /* Get bottom-most low-memory stack address. */
-        mov     sym_esi(trampoline_phys), %ecx
-        add     $TRAMPOLINE_SPACE,%ecx
-
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
+        /*      reloc(magic/eax, info/edx) using fastcall. */
         call    reloc
-        add     $4, %esp
 
 #ifdef CONFIG_PVH_GUEST
         cmpb    $0, sym_esi(pvh_boot)
diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
index 94b078d7b1..8527fa8d01 100644
--- a/xen/arch/x86/boot/reloc.c
+++ b/xen/arch/x86/boot/reloc.c
@@ -19,6 +19,9 @@
 #include <xen/kconfig.h>
 #include <xen/multiboot.h>
 #include <xen/multiboot2.h>
+#include <xen/page-size.h>
+
+#include <asm/trampoline.h>
 
 #include <public/arch-x86/hvm/start_info.h>
 
@@ -176,7 +179,7 @@ static multiboot_info_t *mbi_reloc(uint32_t mbi_in, memctx *ctx)
     return mbi_out;
 }
 
-static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out, memctx *ctx)
+static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, memctx *ctx)
 {
     const multiboot2_fixed_t *mbi_fix = _p(mbi_in);
     const multiboot2_memory_map_t *mmap_src;
@@ -185,7 +188,7 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out, memctx
     memory_map_t *mmap_dst;
     multiboot_info_t *mbi_out;
 #ifdef CONFIG_VIDEO
-    struct boot_video_info *video = NULL;
+    struct boot_video_info *video = &boot_vid_info;
 #endif
     uint32_t ptr;
     unsigned int i, mod_idx = 0;
@@ -290,12 +293,11 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out, memctx
 
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
 
@@ -321,7 +323,6 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out, memctx
             if ( (get_mb2_data(tag, framebuffer, framebuffer_type) !=
                   MULTIBOOT2_FRAMEBUFFER_TYPE_RGB) )
             {
-                video_out = 0;
                 video = NULL;
             }
             break;
@@ -346,10 +347,10 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out, memctx
 }
 
 /* SAF-1-safe */
-void *reloc(uint32_t magic, uint32_t in, uint32_t trampoline,
-            uint32_t video_info)
+void *reloc(uint32_t magic, uint32_t in)
 {
-    memctx ctx = { trampoline };
+    /* Get bottom-most low-memory stack address. */
+    memctx ctx = { (uint32_t)((long)trampoline_phys + TRAMPOLINE_SPACE) };
 
     switch ( magic )
     {
@@ -357,7 +358,7 @@ void *reloc(uint32_t magic, uint32_t in, uint32_t trampoline,
         return mbi_reloc(in, &ctx);
 
     case MULTIBOOT2_BOOTLOADER_MAGIC:
-        return mbi2_reloc(in, video_info, &ctx);
+        return mbi2_reloc(in, &ctx);
 
     case XEN_HVM_START_MAGIC_VALUE:
         if ( IS_ENABLED(CONFIG_PVH_GUEST) )
-- 
2.34.1


