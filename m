Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 626769A23D6
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 15:31:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820593.1234145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1QbN-00080a-Pi; Thu, 17 Oct 2024 13:31:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820593.1234145; Thu, 17 Oct 2024 13:31:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1QbN-0007v8-Gp; Thu, 17 Oct 2024 13:31:41 +0000
Received: by outflank-mailman (input) for mailman id 820593;
 Thu, 17 Oct 2024 13:31:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZcP3=RN=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t1QbL-0007Yl-98
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 13:31:39 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 223c76a0-8c8c-11ef-99a3-01e77a169b0f;
 Thu, 17 Oct 2024 15:31:37 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5c99be0a4bbso1367226a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2024 06:31:37 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a29817036sm299115166b.124.2024.10.17.06.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 06:31:35 -0700 (PDT)
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
X-Inumbo-ID: 223c76a0-8c8c-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729171896; x=1729776696; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XzEVlEnNeKtsG4oZ8vIN3HV3hoDau6dk7zOGpeVNZ9s=;
        b=fi+RtnsGWTd6Jcj4TsDLuflGNx5hUaGq1/kX2kcJwcQydiTEtlZ/+n1CV5ejVNFxyO
         Tw2EL55WZcUz56mpg2JPbTdgqgLuOLIfz+BssnovXM7L5CE/cx9GLb7Fe4++7SYkbp5v
         W3mlGfWca0Da/AeUPDWhs8JdLGqfI/VUoT6EE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729171896; x=1729776696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XzEVlEnNeKtsG4oZ8vIN3HV3hoDau6dk7zOGpeVNZ9s=;
        b=dnu5gP4ivCdqyGwG0CbNHDrprDly0RxdKZxojUj/Vnlqg2HVjneK09CPVIHOdsL90j
         22+iQpOW086TcOka2bQWrN659Y7UJ0g/JOaakCrxJfZbpaHNI5v27/FDqZc7PwdXIa5J
         +B2ytRQZ/zhd+mWQy3G86pnluxvoZb7P3vcK3/FiE71qsA/BNfbuoyEuG310GS1M2OvZ
         e91hGIVgtq+0vNRNiW7EJzI4X2d0VtpCZZ4aaqfx2kKrAZ9RZGwQUivvbtscgwBhDVHO
         9kJK94Ea/jMSHtjl5B0bphQBp3HXqDeIpWaAA0xCEXj0MBTmx7CaOzM55iuMAdsyhTyh
         iJkA==
X-Gm-Message-State: AOJu0YzPQsQHEaeTrDul+UoV/tjIXNnSdBd3doH79wuut7CwITiU1PKf
	0+C832pWF3TuFE4hk7ZwZLf+bPIqfUnBS4ceie2OIM2OyHIDOGea45F2ZGj0O3M+QfQRGti93sn
	m
X-Google-Smtp-Source: AGHT+IGWyhuxM7dJJSlPTmg2r0XRuRDKeUhaUqGi1S7DhQ/mgftCJznObm2bf8PG4/w9z+TZwuU/jw==
X-Received: by 2002:a17:907:940c:b0:a9a:f53:a5c6 with SMTP id a640c23a62f3a-a9a0f53a8d2mr1364462866b.65.1729171896126;
        Thu, 17 Oct 2024 06:31:36 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 3/5] x86/boot: Use boot_vid_info variable directly from C code
Date: Thu, 17 Oct 2024 14:31:21 +0100
Message-Id: <20241017133123.1946204-4-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241017133123.1946204-1-frediano.ziglio@cloud.com>
References: <20241017133123.1946204-1-frediano.ziglio@cloud.com>
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


