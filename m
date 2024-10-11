Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC3B999F58
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2024 10:53:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816778.1230915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szBOP-0002aa-Iz; Fri, 11 Oct 2024 08:53:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816778.1230915; Fri, 11 Oct 2024 08:53:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szBOP-0002Xx-Cv; Fri, 11 Oct 2024 08:53:01 +0000
Received: by outflank-mailman (input) for mailman id 816778;
 Fri, 11 Oct 2024 08:52:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rkux=RH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1szBON-0001pc-Qg
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2024 08:52:59 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36c4745f-87ae-11ef-a0bd-8be0dac302b0;
 Fri, 11 Oct 2024 10:52:58 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5398b589032so3083021e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 11 Oct 2024 01:52:58 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99a80dc290sm186131566b.155.2024.10.11.01.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2024 01:52:57 -0700 (PDT)
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
X-Inumbo-ID: 36c4745f-87ae-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728636778; x=1729241578; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lRozCPE4hLmDkWuRsnYBmVRqJbay8YlPxBu7rNpVYHk=;
        b=j8oRP/zvijd4/gyzqIqGO08n+9NwH/QrAW4apd4wVReRtorYq7OShF+PNI4dX1BY5o
         z9j7jiQoWpphrj/Hl3YhFFHZfTe4Q4e0ZL+J15dvPW6wf9UD9rfOtaEPs0N9PExvi43t
         OlUR8j8ASDVbCA+CzOYyTO8f7TA8bihFBhfDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728636778; x=1729241578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lRozCPE4hLmDkWuRsnYBmVRqJbay8YlPxBu7rNpVYHk=;
        b=dF5X2MKx95CqGBmrysz/XpHKjMPeIw2XViJoTacyO86RxGrd10/e8iZ4fyQ2AWGUey
         e/TeMdchO4erBCwbrsxnnNCYLNSpTLIQpWZKHyZMlFalUZvPnnIcvz1umcdSYCju5N+p
         iOEh0v7VG9UbT6vbBsdIwF9XuP3g/zih6u75V1u0WTsn4tq0Yy5FOR4KWwfgZXA7B9qD
         fceyPW9NjIhI/KJvXQcP54udBBUrGsDLZQEJJBi5qZZ7goETXMGAvvAQHgER0MrZfwQg
         pTFhFCOhlUS5yJ7KlEsqpKp7y5X6Go9NMbYX3PV0bsWirhuGCib/kopRPAFpTSXU2gCH
         R1aA==
X-Gm-Message-State: AOJu0Ywon4fBEwDHq/8t4ug/FwhSfrzmma+gA4mzUCWcVuLOlI9Qtlh0
	nO6qWgMfuvCDobYws7u61NfENF0zvXb12UalvT1UB1yRvPaDZq90qU1pkfIGLgtV5k4DfivwcBI
	e
X-Google-Smtp-Source: AGHT+IGDJrAsvWMO6oVkUaso7GKsUX42/Ol93PeUTzRMQ/Xv3G8+ltoWMcNCFuW8P4t0E1tmoaMuEw==
X-Received: by 2002:a05:6512:3992:b0:536:a695:9414 with SMTP id 2adb3069b0e04-539da3b205amr1335442e87.6.1728636777686;
        Fri, 11 Oct 2024 01:52:57 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 3/5] x86/boot: Use boot_vid_info variable directly from C code
Date: Fri, 11 Oct 2024 09:52:42 +0100
Message-Id: <20241011085244.432368-4-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241011085244.432368-1-frediano.ziglio@cloud.com>
References: <20241011085244.432368-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No more need to pass from assembly code.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
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


