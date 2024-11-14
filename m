Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4AE9C8B02
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 13:50:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836420.1252336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBZIZ-00033p-HC; Thu, 14 Nov 2024 12:50:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836420.1252336; Thu, 14 Nov 2024 12:50:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBZIZ-00030n-Bd; Thu, 14 Nov 2024 12:50:11 +0000
Received: by outflank-mailman (input) for mailman id 836420;
 Thu, 14 Nov 2024 12:50:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Deeb=SJ=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tBZIX-0001tD-01
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 12:50:09 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8ec2a90-a286-11ef-99a3-01e77a169b0f;
 Thu, 14 Nov 2024 13:50:05 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43193678216so5727155e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 04:50:05 -0800 (PST)
Received: from localhost.localdomain (99.149.115.87.dyn.plus.net.
 [87.115.149.99]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821ae1685csm1416809f8f.83.2024.11.14.04.50.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 04:50:04 -0800 (PST)
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
X-Inumbo-ID: f8ec2a90-a286-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmMiLCJoZWxvIjoibWFpbC13bTEteDMyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImY4ZWMyYTkwLWEyODYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNTg4NjA1Ljk0NjE1OSwic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731588605; x=1732193405; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rLYetKdXRISWvqivl/6DtEP61NuYrlAS1Q0ZpWaKKIQ=;
        b=Ssgn7d9UqR1xEJJh/b3ncDlU3qIim6TdFrvCWC6UuZALmLub3YINTh7zpTJBYyMFlw
         tzdy4828xzikW2bkJLPu3VauvyhVP59eS3AX7dkmBWNYfItzKKAjFFYEFMvuLESUMHtc
         TwkraGvQpUBKAIPq5d0nq8PTLFWU9JIGYLE44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731588605; x=1732193405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rLYetKdXRISWvqivl/6DtEP61NuYrlAS1Q0ZpWaKKIQ=;
        b=Hsx5pWuPZuHJ8ySOIXmXxCYEE/3BQ9e7xW1JEfoqhLKD5LCibgJNqOhCGiNitdjfhi
         aRkWPJiSq85mq1LN8u5dD6kAfd6oYgrE0hsJMFR8ufE87X5PAbMST1xaOzwswS5hO55J
         Tmh0MFHLoGxwMZv2s6nGYtnN30f0UOoNiAu3rgM38NFuq30JC4zFpHW24u8sCzWVZCbq
         LBs2Sq0vZ42WnOqAsbz9vDOxy9RXOgcdLL8riFRhi5XF1B2HjUv0OOIvpwa7Uc69eKzO
         kJnGYrpb8ItusPlUgzci5CXq1G03AovWLHPIEJC3Fe19UpCQki2RMbmQa3VXoOqwILCL
         EtcQ==
X-Gm-Message-State: AOJu0Yx2sH7hF/iESqORPakNp43N0+48xwlvtol524zgB6hVr4/tQ8hL
	YRE0pOmbHohD2JeRx4Ngbv/pU++R6NDo1efDJ4Ui3geaBP3h42aq8bi0Sd0YNCf6xBbTPoY8Q0U
	HVwU=
X-Google-Smtp-Source: AGHT+IEE2eQuQ0ylILh+xi7FBs+sI5MZ06cbiMMpngQuOUiHGfLx6c4+jyT/W6NLqTTOGlE7g9i65w==
X-Received: by 2002:a05:600c:35d3:b0:42c:b1ee:4b04 with SMTP id 5b1f17b1804b1-432b751c264mr188593465e9.28.1731588604848;
        Thu, 14 Nov 2024 04:50:04 -0800 (PST)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 3/4] x86/boot: Move some settings to C
Date: Thu, 14 Nov 2024 12:49:49 +0000
Message-Id: <20241114124950.24808-4-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114124950.24808-1-frediano.ziglio@cloud.com>
References: <20241114124950.24808-1-frediano.ziglio@cloud.com>
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
index dcda91cfda..f86910294f 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -515,16 +515,6 @@ trampoline_setup:
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
         /*
          * Now trampoline_phys points to the following structure (lowest address
          * is at the bottom):
diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
index e50e161b27..a03ef71a4c 100644
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
@@ -347,28 +349,42 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, memctx *ctx)
 }
 
 /* SAF-1-safe */
-void *reloc(uint32_t magic, uint32_t in)
+void reloc(uint32_t magic, uint32_t in)
 {
     /* Get bottom-most low-memory stack address. */
     memctx ctx = { trampoline_phys + TRAMPOLINE_SPACE };
 
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


