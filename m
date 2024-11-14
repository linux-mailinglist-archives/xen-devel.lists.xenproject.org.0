Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D909C8B05
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 13:50:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836421.1252343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBZIa-0003CB-2q; Thu, 14 Nov 2024 12:50:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836421.1252343; Thu, 14 Nov 2024 12:50:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBZIZ-00036y-Tk; Thu, 14 Nov 2024 12:50:11 +0000
Received: by outflank-mailman (input) for mailman id 836421;
 Thu, 14 Nov 2024 12:50:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Deeb=SJ=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tBZIY-0002Aa-RW
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 12:50:10 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f96736f3-a286-11ef-a0c7-8be0dac302b0;
 Thu, 14 Nov 2024 13:50:06 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3821c81f165so390514f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 04:50:06 -0800 (PST)
Received: from localhost.localdomain (99.149.115.87.dyn.plus.net.
 [87.115.149.99]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821ae1685csm1416809f8f.83.2024.11.14.04.50.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 04:50:05 -0800 (PST)
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
X-Inumbo-ID: f96736f3-a286-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmEiLCJoZWxvIjoibWFpbC13cjEteDQyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImY5NjczNmYzLWEyODYtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNTg4NjA2LjgzNjIyNSwic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731588606; x=1732193406; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HpeDYZanm22C28MNfmY1IgLVgt+E9w0szXnSSi/YSPs=;
        b=IjVGysZ03izP5QUc7ibPZ1xDttsFXGbL4+qWrnLJv6FOUi89nYSPBc/V0oxsYU7epn
         ZBrPdYsmt8yGR4DSsUJeXJcqOIBNH5Qe5HpvA/WPJgiYmDkbz++bINCe6zS06oPOASk+
         BcbywZU6gWAASevuBDLyrYs5+O9Hfoy6GTTiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731588606; x=1732193406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HpeDYZanm22C28MNfmY1IgLVgt+E9w0szXnSSi/YSPs=;
        b=MGmDqpJXRpSdoB5MBdY/wDvez51qvdC5/OPOYh2MuseA39tcISoB0ybHIwH/KiEA6f
         QY4i5IPzrjDrR4bYit955XoZP1JSN47cpORk9PWWiturZXAh6AakTnjWDsqFgV3W+Fey
         4jlAxciHsFfO+NYvTc3B/Ou4TIqW+i3RWnVWHZuEj6cgunt1Y+LNc0hwSqWBTv04/EP1
         cmZKbD63cpNHbhYXkFZkojPpbKYxrf+Fw0ZAb1p6kLborBp0+ELPOp0wW2brQwtkP2zs
         leNuRKHcK2Ibr4kfrS1l2tl93IjxvS/BTGFEhCV5FB4nJDks9OnWRvie8hNlWtkP0MUH
         HbHQ==
X-Gm-Message-State: AOJu0YxjAmubRPwHZBKHUoHxud5c1PSXoto/7TDe8ctrU52wT9JLujTp
	IXE9wNRHomHUoxJ5rNjGKjtyY309UPToRg9ZWltHMp1ntwFx8JCx+62cbfPFotLjdBZ2zXsF4FD
	l6nc=
X-Google-Smtp-Source: AGHT+IEO6TDY+IHrzXffukz7o50BXQ7iLKQ4LBnhl/8VwjJ3U/BMEfKgmOERURTyEowf+asOk80+FA==
X-Received: by 2002:a05:6000:1ac5:b0:37c:cfdc:19ba with SMTP id ffacd0b85a97d-3821851d1femr1885630f8f.28.1731588605856;
        Thu, 14 Nov 2024 04:50:05 -0800 (PST)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 4/4] x86/boot: Use external symbols from cmdline_parse_early
Date: Thu, 14 Nov 2024 12:49:50 +0000
Message-Id: <20241114124950.24808-5-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114124950.24808-1-frediano.ziglio@cloud.com>
References: <20241114124950.24808-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move some assembly code to C.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/build32.lds.S         |  1 +
 xen/arch/x86/boot/cmdline.c             | 14 ++++++++++++--
 xen/arch/x86/boot/head.S                |  9 +--------
 xen/arch/x86/boot/trampoline.S          |  2 +-
 xen/arch/x86/include/asm/setup.h        |  2 ++
 xen/arch/x86/include/boot/xen/cpumask.h |  1 +
 xen/arch/x86/include/boot/xen/string.h  | 10 ++++++++++
 7 files changed, 28 insertions(+), 11 deletions(-)
 create mode 100644 xen/arch/x86/include/boot/xen/cpumask.h
 create mode 100644 xen/arch/x86/include/boot/xen/string.h

diff --git a/xen/arch/x86/boot/build32.lds.S b/xen/arch/x86/boot/build32.lds.S
index 1726c17c88..652f951e52 100644
--- a/xen/arch/x86/boot/build32.lds.S
+++ b/xen/arch/x86/boot/build32.lds.S
@@ -54,6 +54,7 @@ SECTIONS
         DECLARE_IMPORT(multiboot_ptr);
         DECLARE_IMPORT(pvh_boot);
         DECLARE_IMPORT(pvh_start_info_pa);
+        DECLARE_IMPORT(early_boot_opts);
         . = . + GAP;
         *(.text)
         *(.text.*)
diff --git a/xen/arch/x86/boot/cmdline.c b/xen/arch/x86/boot/cmdline.c
index 196c580e91..7a8a3ed97f 100644
--- a/xen/arch/x86/boot/cmdline.c
+++ b/xen/arch/x86/boot/cmdline.c
@@ -22,6 +22,9 @@
 #include <xen/kconfig.h>
 #include <xen/macros.h>
 #include <xen/types.h>
+#include <xen/multiboot.h>
+
+#include <asm/setup.h>
 
 #include "video.h"
 
@@ -39,6 +42,8 @@ typedef struct __packed {
 #endif
 } early_boot_opts_t;
 
+extern early_boot_opts_t early_boot_opts;
+
 /* Avoid pulling in all of ctypes.h for this. */
 #define tolower(c)	((c) | 0x20)
 
@@ -335,10 +340,15 @@ static void vga_parse(const char *cmdline, early_boot_opts_t *ebo)
 #endif
 
 /* SAF-1-safe */
-void cmdline_parse_early(const char *cmdline, early_boot_opts_t *ebo)
+void cmdline_parse_early(void)
 {
-    if ( !cmdline )
+    early_boot_opts_t *ebo = &early_boot_opts;
+    struct multiboot_info *mbi = (void *)multiboot_ptr;
+    const char *cmdline;
+
+    if ( !(mbi->flags & MBI_CMDLINE) || !mbi->cmdline )
         return;
+    cmdline = (void *)mbi->cmdline;
 
     ebo->skip_realmode = skip_realmode(cmdline);
     ebo->opt_edd = edd_parse(cmdline);
diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index f86910294f..b79d4884df 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -690,14 +690,7 @@ trampoline_setup:
         cmpb    $0, sym_esi(efi_platform)
         jnz     1f
 
-        /* Bail if there is no command line to parse. */
-        mov     sym_esi(multiboot_ptr), %ebx
-        testl   $MBI_CMDLINE,MB_flags(%ebx)
-        jz      1f
-
-        lea     sym_esi(early_boot_opts), %edx
-        mov     MB_cmdline(%ebx), %eax
-        /*      cmdline_parse_early(cmdline/eax, opts/edx) using fastcall. */
+        /*      cmdline_parse_early using fastcall. */
         call    cmdline_parse_early
 
 1:
diff --git a/xen/arch/x86/boot/trampoline.S b/xen/arch/x86/boot/trampoline.S
index b8ab0ffdcb..f2fa7ca07d 100644
--- a/xen/arch/x86/boot/trampoline.S
+++ b/xen/arch/x86/boot/trampoline.S
@@ -258,7 +258,7 @@ trampoline_boot_cpu_entry:
 
         .align  2
 /* Keep in sync with cmdline.c:early_boot_opts_t type! */
-early_boot_opts:
+GLOBAL(early_boot_opts)
 skip_realmode:
         .byte   0
 opt_edd:
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index 25c15ef914..a5ca007722 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -16,6 +16,8 @@ extern uint64_t boot_tsc_stamp;
 extern void *stack_start;
 extern unsigned int multiboot_ptr;
 
+struct domain;
+
 void early_cpu_init(bool verbose);
 void early_time_init(void);
 
diff --git a/xen/arch/x86/include/boot/xen/cpumask.h b/xen/arch/x86/include/boot/xen/cpumask.h
new file mode 100644
index 0000000000..046b862b78
--- /dev/null
+++ b/xen/arch/x86/include/boot/xen/cpumask.h
@@ -0,0 +1 @@
+/* Empty. */
diff --git a/xen/arch/x86/include/boot/xen/string.h b/xen/arch/x86/include/boot/xen/string.h
new file mode 100644
index 0000000000..6556d3b4af
--- /dev/null
+++ b/xen/arch/x86/include/boot/xen/string.h
@@ -0,0 +1,10 @@
+#ifndef BOOT__XEN__STRING_H
+#define BOOT__XEN__STRING_H
+
+#include <xen/types.h>	/* for size_t */
+
+void *memset(void *s, int c, size_t n);
+void *memcpy(void *dest, const void *src, size_t n);
+void *memmove(void *dest, const void *src, size_t n);
+
+#endif /* BOOT__XEN__STRING_H */
-- 
2.34.1


