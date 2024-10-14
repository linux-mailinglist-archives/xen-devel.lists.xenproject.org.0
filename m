Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2283C99C425
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2024 10:54:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.818521.1231847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0Gpq-0000P8-FV; Mon, 14 Oct 2024 08:53:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 818521.1231847; Mon, 14 Oct 2024 08:53:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0Gpq-0000NB-9l; Mon, 14 Oct 2024 08:53:50 +0000
Received: by outflank-mailman (input) for mailman id 818521;
 Mon, 14 Oct 2024 08:53:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qGCd=RK=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t0Gpo-000862-8Y
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2024 08:53:48 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3681249-8a09-11ef-a0be-8be0dac302b0;
 Mon, 14 Oct 2024 10:53:47 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a93c1cc74fdso667109566b.3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Oct 2024 01:53:47 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99a80f2446sm551817766b.206.2024.10.14.01.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 01:53:46 -0700 (PDT)
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
X-Inumbo-ID: d3681249-8a09-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728896027; x=1729500827; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TK+nbrmtQrubI4mXkXmmhgJ7U2/YQr+t6QKP18Zmwks=;
        b=J0Hei3kejJWEVBWlJIWPkgFx+Gq8LKyW2/4CP9vdti9OphBnK8QSpuj/QWpvq09Ohg
         ge9MJ30ofEeQfhiaild/45K67LQYJtrlJ2Vx41rRGZGlUiZyBPRGD/yo+HBsAzHnbYa+
         HBLEk45PttaN0WAqruiQmO96xpw/sjugCqIU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728896027; x=1729500827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TK+nbrmtQrubI4mXkXmmhgJ7U2/YQr+t6QKP18Zmwks=;
        b=iapJpn9hB8YCq3YyceiMvo6NUg0iSFd2dJEcbtJ6GUdY0CLxMBAMobCUM5PYiB5Zcs
         gOkMa2RmQUsgOWEdvAf1eTLgZVXHoG99+xIpn14z2kpFm5gkNLfXQhLGVqCcadsCkWu0
         XqoQrohHM8+v1F6YmAEspy/x/rJnzThV8vVjVOdOqKljp/K5m4z1n9dX3rJJT15Km2yN
         mKdjK6erhv5IuFqgRK3wxWaQ1suvOwu+ljXxuxzwPvfVeSdGbTm9Bp+zsRR+Z9TUj2jy
         KD1oJGMtTHh3xROGIS2gBKvoJ1y/9e+WvJbiQE/5t+mtnDlsUeYPCAa0bj74CBE3FG3e
         OnLw==
X-Gm-Message-State: AOJu0Yw3tWwL10YGYCiyCLbw/wmjy4QHcjip4eFQdHazIyXTGmS4OZas
	9VdzW+lB1UVCJZqNd3hm40YxE6Gpqrulj1tn8quOD4hcF3eq9AjH5fJZj3PZxFvDMMHJJNagem3
	i
X-Google-Smtp-Source: AGHT+IHYrbYIK/sUdXu0LMUkQtOaIozUCZSYqAN0jSzxJmBLPE2Czj5lW1Gq0OlEDuIF+bN1I7FXvw==
X-Received: by 2002:a17:907:701:b0:a99:3c32:b538 with SMTP id a640c23a62f3a-a99e3e51b56mr687084666b.42.1728896027043;
        Mon, 14 Oct 2024 01:53:47 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 4/6] x86/boot: Use boot_vid_info variable directly from C code
Date: Mon, 14 Oct 2024 09:53:30 +0100
Message-Id: <20241014085332.3254546-5-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241014085332.3254546-1-frediano.ziglio@cloud.com>
References: <20241014085332.3254546-1-frediano.ziglio@cloud.com>
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
index 1110880ad4..8c40758834 100644
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


