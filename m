Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB2B9D5C06
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2024 10:34:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841796.1257320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEQ3V-0004Cz-Nn; Fri, 22 Nov 2024 09:34:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841796.1257320; Fri, 22 Nov 2024 09:34:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEQ3V-00041W-GE; Fri, 22 Nov 2024 09:34:25 +0000
Received: by outflank-mailman (input) for mailman id 841796;
 Fri, 22 Nov 2024 09:34:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o6Qa=SR=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tEQ3T-0003h5-Ts
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2024 09:34:23 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f33284cc-a8b4-11ef-99a3-01e77a169b0f;
 Fri, 22 Nov 2024 10:34:20 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43168d9c6c9so16785675e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 22 Nov 2024 01:34:20 -0800 (PST)
Received: from localhost.localdomain ([87.115.149.99])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433cde16abasm21427775e9.19.2024.11.22.01.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2024 01:34:18 -0800 (PST)
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
X-Inumbo-ID: f33284cc-a8b4-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmYiLCJoZWxvIjoibWFpbC13bTEteDMyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImYzMzI4NGNjLWE4YjQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMjY4MDYwLjE0NjMyNCwic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1732268059; x=1732872859; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S9P+7ZFehIpPa+fzpjshgI13fOA+PXjg5ryC8YmcWr4=;
        b=Il5WZ2+8NYx/DNyb9RgrRxOSmxSRVqphu9Y8+GBARLKiqEJ4IIskLZkDGLP026/foB
         V8eySMFYsa1RwK0gQX1y+PUsNyS/fCrD61k8DNTRbCxh5VTV4+nVKulD96X5x6RdW6jJ
         T5oCbNxYMha0y3dm1TfMCO7ccxLbdGEj9b2U8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732268059; x=1732872859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S9P+7ZFehIpPa+fzpjshgI13fOA+PXjg5ryC8YmcWr4=;
        b=pehJEpyecBnboSc6cUOPhzi4Y57l6RtsG+wfdVsxKVmYSh9A90t4JMCy53viBu7iJW
         8dD5DQf1wVN64rEZ6vUGmYGxg/IHuESEYSOtEWZH+DcHyLc3B9z9Zkuhnaz0ZUTEueAK
         Wl+cCvnrlw4ypo2HH6RxGWxh1ZMN/OOlOBnsWmBTmmxAng/sS0ag4Lg7lbI0kYhnun6r
         rAiFXfTltANnz/EgQ2i3FM3WnGaHq3gW9Uyk0OiPv7Ns+farmkJK205Y/mwv8tbuiNE1
         4tnQsQ8EQBuLtL1Zz6n4bhaxXhUhJ6kbI07SSVeLTK6ZCW7dnbHVGsfSwmR4QJ8T8U/V
         yJ2Q==
X-Gm-Message-State: AOJu0Yyj+E7V5/teMxBMlv3pwwsY+PwwPyV/qZfXD2zS6DtzRj3d4Ruw
	mw6WvpvFZRgspf+whgpMcXFkOsi/kWM2q10eMLdjnpjiyc4qMsIA/mE6EfpLbYO3fEm3El2G5PI
	t6DE=
X-Gm-Gg: ASbGnctM+rZGzqY/pJIgJtX5/2/bz67zUrLdeV12y85Ee4rrA1Cu4RNARsJNbhpJMhy
	5gyNXqatps9LIHIXF9fOfySfxnbNlBhuuc12RHBCxQ3c56jaoHCeDxMKE7f+q0VLY0anYghAWDH
	VFllJEMQiVx8QKc6Ngj+nlS7bkDn1gDUlxHBONDzsjuIHWFiETMG3bwGeOxn+n++WZPvpoRyPLu
	EYG3MuXj9bX/yY4AQ2EC5PGykRvizas99NR0NaujTau8Ov30vGKyJG7pt4EYS1Xl1DjbQ==
X-Google-Smtp-Source: AGHT+IHquO76tm3Afjb8UWXeMVBPqDiBL7+TVDSGOJO4rtyIk5MtI0LS7cuGChe6gYm0cm3DnxCoqw==
X-Received: by 2002:a05:600c:3b94:b0:433:6cf9:5e65 with SMTP id 5b1f17b1804b1-433ce4af3bfmr15568005e9.29.1732268059305;
        Fri, 22 Nov 2024 01:34:19 -0800 (PST)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 3/4] x86/boot: Move some settings to C
Date: Fri, 22 Nov 2024 09:33:57 +0000
Message-Id: <20241122093358.478774-4-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241122093358.478774-1-frediano.ziglio@cloud.com>
References: <20241122093358.478774-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Initialise multiboot_ptr and pvh_start_info_pa from C code.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/build32.lds.S           |  3 +++
 xen/arch/x86/boot/head.S                  | 10 --------
 xen/arch/x86/boot/reloc.c                 | 28 ++++++++++++++++++-----
 xen/arch/x86/include/asm/guest/pvh-boot.h |  1 +
 4 files changed, 26 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/boot/build32.lds.S b/xen/arch/x86/boot/build32.lds.S
index 1e59732edd..1726c17c88 100644
--- a/xen/arch/x86/boot/build32.lds.S
+++ b/xen/arch/x86/boot/build32.lds.S
@@ -51,6 +51,9 @@ SECTIONS
         DECLARE_IMPORT(__trampoline_seg_stop);
         DECLARE_IMPORT(trampoline_phys);
         DECLARE_IMPORT(boot_vid_info);
+        DECLARE_IMPORT(multiboot_ptr);
+        DECLARE_IMPORT(pvh_boot);
+        DECLARE_IMPORT(pvh_start_info_pa);
         . = . + GAP;
         *(.text)
         *(.text.*)
diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 1b3bd16fe5..510b3cfe6c 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -517,16 +517,6 @@ trampoline_setup:
         /*      reloc(magic/eax, info/edx) using fastcall. */
         call    reloc
 
-#ifdef CONFIG_PVH_GUEST
-        cmpb    $0, sym_esi(pvh_boot)
-        je      1f
-        mov     %eax, sym_esi(pvh_start_info_pa)
-        jmp     2f
-#endif
-1:
-        mov     %eax, sym_esi(multiboot_ptr)
-2:
-
         /* Interrogate CPU extended features via CPUID. */
         mov     $1, %eax
         cpuid
diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
index 7a375ad41c..8f757813ee 100644
--- a/xen/arch/x86/boot/reloc.c
+++ b/xen/arch/x86/boot/reloc.c
@@ -17,13 +17,15 @@
 #include <xen/types.h>
 
 #include <xen/kconfig.h>
-#include <xen/multiboot.h>
 #include <xen/multiboot2.h>
 #include <xen/page-size.h>
+#include <xen/bug.h>
 
 #include <asm/trampoline.h>
+#include <asm/setup.h>
 
 #include <public/arch-x86/hvm/start_info.h>
+#include <asm/guest/pvh-boot.h>
 
 #ifdef CONFIG_VIDEO
 # include "video.h"
@@ -347,27 +349,41 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, memctx *ctx)
 }
 
 /* SAF-1-safe */
-void *reloc(uint32_t magic, uint32_t in)
+void reloc(uint32_t magic, uint32_t in)
 {
     memctx ctx = { trampoline_phys + TRAMPOLINE_HEAP_END };
 
+    void *res;
+
     switch ( magic )
     {
     case MULTIBOOT_BOOTLOADER_MAGIC:
-        return mbi_reloc(in, &ctx);
+        res = mbi_reloc(in, &ctx);
+        break;
 
     case MULTIBOOT2_BOOTLOADER_MAGIC:
-        return mbi2_reloc(in, &ctx);
+        res = mbi2_reloc(in, &ctx);
+        break;
 
     case XEN_HVM_START_MAGIC_VALUE:
         if ( IS_ENABLED(CONFIG_PVH_GUEST) )
-            return pvh_info_reloc(in, &ctx);
+        {
+            res = pvh_info_reloc(in, &ctx);
+            break;
+        }
         /* Fallthrough */
 
     default:
         /* Nothing we can do */
-        return NULL;
+        res = NULL;
     }
+
+#ifdef CONFIG_PVH_GUEST
+    if ( pvh_boot )
+        pvh_start_info_pa = (unsigned long)res;
+#endif
+
+    multiboot_ptr = (unsigned long)res;
 }
 
 /*
diff --git a/xen/arch/x86/include/asm/guest/pvh-boot.h b/xen/arch/x86/include/asm/guest/pvh-boot.h
index 247ba6899e..b5ad2b11a4 100644
--- a/xen/arch/x86/include/asm/guest/pvh-boot.h
+++ b/xen/arch/x86/include/asm/guest/pvh-boot.h
@@ -13,6 +13,7 @@
 #ifdef CONFIG_PVH_GUEST
 
 extern bool pvh_boot;
+extern uint32_t pvh_start_info_pa;
 
 void pvh_init(multiboot_info_t **mbi, module_t **mod);
 void pvh_print_info(void);
-- 
2.34.1


