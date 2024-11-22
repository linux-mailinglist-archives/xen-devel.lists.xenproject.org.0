Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1B09D5C07
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2024 10:34:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841795.1257312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEQ3V-00041g-9a; Fri, 22 Nov 2024 09:34:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841795.1257312; Fri, 22 Nov 2024 09:34:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEQ3V-0003wD-3I; Fri, 22 Nov 2024 09:34:25 +0000
Received: by outflank-mailman (input) for mailman id 841795;
 Fri, 22 Nov 2024 09:34:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o6Qa=SR=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tEQ3T-0003Ql-G6
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2024 09:34:23 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3c6f407-a8b4-11ef-a0cc-8be0dac302b0;
 Fri, 22 Nov 2024 10:34:21 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2fb561f273eso21419161fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 22 Nov 2024 01:34:20 -0800 (PST)
Received: from localhost.localdomain ([87.115.149.99])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433cde16abasm21427775e9.19.2024.11.22.01.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2024 01:34:19 -0800 (PST)
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
X-Inumbo-ID: f3c6f407-a8b4-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMzQiLCJoZWxvIjoibWFpbC1sajEteDIzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImYzYzZmNDA3LWE4YjQtMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMjY4MDYxLjAwMDg4LCJzZW5kZXIiOiJmcmVkaWFuby56aWdsaW9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1732268060; x=1732872860; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=clkfofX0J3fQFkdU29C0Xri5NVrLAF8Z8Fjb/kEwIZk=;
        b=Dma3tjPv0YP5AJqWv9hKS05qHGVQX8qvHcb5++A2jGyjwzMAp3idfL+5RhbC509tWz
         WdG9azBSQ16n9T11xzeAIXN+TDuNAtCa8WU0gcov1XubghOCzaGLFoq/BYhYpoCTd+H9
         zxyEzus2TauhpDZOswWjHO7USGxhdznGTMfH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732268060; x=1732872860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=clkfofX0J3fQFkdU29C0Xri5NVrLAF8Z8Fjb/kEwIZk=;
        b=BpLBfBKlZbYOhl7gEJy9LbVvqhp3nuYG+nQkHoci5G2+uVEbxf3d8SxwNoc3IK2AFX
         UZKMMdQmSnICGGUqYclhA/q0kqY6wUOenW/3JzH/2/i6OqfUQwzep91j5dryj0tawWva
         5vB2Xj8bYDV9rGpD2TlfrvWRSaAcrAQitqf+KrvFy6c557vViRzRsCVUN7UduMNFDU6O
         7L3yOFdDe/mPhIAAFtfGzEZFhehchWXKRYibLw1L3kT0Kkkkb1wqJgsuNk7Nz2QZXv1W
         zOGykndht6eurVTML4VHefvsWxivLs6Bzj/g5ASsWY32m6hT1xvgTyZB/maGF5SDcolq
         K4fg==
X-Gm-Message-State: AOJu0YxEQEkOvYFS7SoMEL3TCYVm0d07Dy+kL92+mdPqgD6jZ4ixRCrJ
	soJqHLgnP94AwYd/5jc58pSB65haCfmHY25z19t/hMoVyC+gvzu3bec8AhKoWTCyBzDUawjVEFo
	Hft4=
X-Gm-Gg: ASbGncvrOhmOApumJcQXz5OxRsZ3ZQMlRN9Y275rpOWRdp+U7dTi3UPi6GhpyrP3uWZ
	fZ7NhRLLhG6y6qvkHwBzdxvKp/0uyvt7TFpz0U89NOorjaTOtRxA+rvCbedqugnk95L27mT5Bfg
	qQQ8dbdYE64wD1v6AWMPIbe/Wwi5iOZep534lV9PLij3trVHA5rlvgGN3Qutn7qlNbLlO/tFQ5U
	y3ia7VZzGjVOtS9zCpULxfOLryBmqSz9apW3kzPl3HyEPijZQ+Jnq5FebM5RtpWTO309A==
X-Google-Smtp-Source: AGHT+IFWNhUfxz6SzEBDhFQYxqPUTQB9b5y15PAsd+iSkDTyNeK7GmIgCcorcvcRJz/Jv7TNTiPKqg==
X-Received: by 2002:a2e:7a0e:0:b0:2ff:a928:a23e with SMTP id 38308e7fff4ca-2ffa928a3ebmr5385491fa.25.1732268060088;
        Fri, 22 Nov 2024 01:34:20 -0800 (PST)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 4/4] x86/boot: Use external symbols from cmdline_parse_early
Date: Fri, 22 Nov 2024 09:33:58 +0000
Message-Id: <20241122093358.478774-5-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241122093358.478774-1-frediano.ziglio@cloud.com>
References: <20241122093358.478774-1-frediano.ziglio@cloud.com>
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
index 510b3cfe6c..49bacee225 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -675,14 +675,7 @@ trampoline_setup:
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
index 924bda37c1..204c9bc889 100644
--- a/xen/arch/x86/boot/trampoline.S
+++ b/xen/arch/x86/boot/trampoline.S
@@ -255,7 +255,7 @@ trampoline_boot_cpu_entry:
 
         .align  2
 /* Keep in sync with cmdline.c:early_boot_opts_t type! */
-early_boot_opts:
+GLOBAL(early_boot_opts)
 skip_realmode:
         .byte   0
 opt_edd:
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index 5c2391a868..c461d5d3a7 100644
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


