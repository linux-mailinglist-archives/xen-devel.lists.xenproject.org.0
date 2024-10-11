Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3CB999F55
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2024 10:53:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816777.1230900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szBOO-00028j-4m; Fri, 11 Oct 2024 08:53:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816777.1230900; Fri, 11 Oct 2024 08:53:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szBON-00022y-V5; Fri, 11 Oct 2024 08:52:59 +0000
Received: by outflank-mailman (input) for mailman id 816777;
 Fri, 11 Oct 2024 08:52:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rkux=RH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1szBOM-0001pc-Qd
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2024 08:52:58 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 365cef9e-87ae-11ef-a0bd-8be0dac302b0;
 Fri, 11 Oct 2024 10:52:57 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a9950d27234so258743266b.1
 for <xen-devel@lists.xenproject.org>; Fri, 11 Oct 2024 01:52:57 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99a80dc290sm186131566b.155.2024.10.11.01.52.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2024 01:52:56 -0700 (PDT)
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
X-Inumbo-ID: 365cef9e-87ae-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728636777; x=1729241577; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zUggCQPTyO9ygn34x4HeSgdbn1nIPGVC8lBKowza6Ww=;
        b=ULZgpcC2Pc+Aeh+HNXd07K/EkIz33sD8izpgx4x3Zn9Izdc1IUm7yndfjpn6AfbJzs
         4ocFyy73DRTfxHQPtpdLO87sMQZoxlx0M4kb0C5n5PFHx6gxqWK7bSF4ikZPNOe2A7hr
         FNVrSnjJwScHfvf6J/6HWV9qhtIvLWVrjJd6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728636777; x=1729241577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zUggCQPTyO9ygn34x4HeSgdbn1nIPGVC8lBKowza6Ww=;
        b=xRAbEhaGZiOnjJUiuH0/3tujEaE1wpLXznwgdD+s2vAU3374rVywQAT45NZ4bI4Krt
         ekJYY9HwjcLYSI+wFvhD7WQYveQxpa00H7XbZEXXr+t0XpKtmoDWF7lzL+2KSLLWTzjr
         1O7Y2WPnQYNeFqDA7pCezq7s6pyDxMIT6LfYZBnRxQU5tG1wpjMzRBwa3kzKp/OP1/NY
         ln4e/atGrdLMtnGAq2W62POxEfZFSudKhbkneT7EgCRiZfRHilB8iFPDp7ddTf7pBxWS
         P49WLxveELQCzQURrjtLY/pNTVjYJ7Kuxv7jYLEaz3GlhMsovEMu2X8ny3BWFa3A0xi3
         FjvQ==
X-Gm-Message-State: AOJu0Yzv/d4RrN9Ka9gh8bmDOhe/s2hH4U5LJXYDLgaAO+ykuihdM+jz
	mQ1mGJT8SBmPFJ+17r5zKDM31ZymyMqm63yf0FnRL20tkkBxbo0Mh4aHxa1AfgkVQEP6uUwFJdv
	5
X-Google-Smtp-Source: AGHT+IH65Eld8JdkIAY7cU2W6Ra7H+4tZO/nE4hRKbWIgqgRMd1GZ4mpQGirx+/zNR0Btne7p1Lvxg==
X-Received: by 2002:a17:907:7ea4:b0:a99:408c:6a16 with SMTP id a640c23a62f3a-a99b9315e79mr138590366b.12.1728636776928;
        Fri, 11 Oct 2024 01:52:56 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v3 2/5] x86/boot: Reuse code to relocate trampoline
Date: Fri, 11 Oct 2024 09:52:41 +0100
Message-Id: <20241011085244.432368-3-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241011085244.432368-1-frediano.ziglio@cloud.com>
References: <20241011085244.432368-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move code from efi-boot.h to a separate, new, reloc-trampoline.c file.
Reuse this new code to replace assembly code in head.S doing the
same thing.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/Makefile           | 12 ++++++----
 xen/arch/x86/boot/build32.lds.S      |  5 ++++
 xen/arch/x86/boot/head.S             | 23 +-----------------
 xen/arch/x86/boot/reloc-trampoline.c | 36 ++++++++++++++++++++++++++++
 xen/arch/x86/efi/efi-boot.h          | 15 ++----------
 5 files changed, 52 insertions(+), 39 deletions(-)
 create mode 100644 xen/arch/x86/boot/reloc-trampoline.c

diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index 4cf0d7e140..24b4b0cb17 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -1,14 +1,18 @@
 obj32 := cmdline.o
 obj32 += reloc.o
+obj32 += reloc-trampoline.o
+
+obj64 := reloc-trampoline.o
 
 obj-bin-y += head.o
 obj-bin-y += built_in_32.o
+obj-bin-y += $(obj64)
 
 obj32 := $(patsubst %.o,%.32.o,$(obj32))
 
-nocov-y   += $(obj32)
-noubsan-y += $(obj32)
-targets   += $(obj32)
+nocov-y   += $(obj32) $(obj64)
+noubsan-y += $(obj32) $(obj64)
+targets   += $(obj32) $(obj64)
 
 obj32 := $(addprefix $(obj)/,$(obj32))
 
@@ -55,7 +59,7 @@ $(obj)/built_in_32.o: $(obj)/built_in_32.other.bin $(obj)/built_in_32.final.bin
 		--script $(obj)/build32.final.lds \
 		--bin1 $(obj)/built_in_32.other.bin --bin2 $(obj)/built_in_32.final.bin \
 		--map $(obj)/built_in_32.final.map \
-		--exports cmdline_parse_early,reloc \
+		--exports cmdline_parse_early,reloc,reloc_trampoline32 \
 		--section-header '.section .init.text, "ax", @progbits' \
 		--output $(obj)/built_in_32.s
 	$(CC) -c $(obj)/built_in_32.s -o $@.tmp
diff --git a/xen/arch/x86/boot/build32.lds.S b/xen/arch/x86/boot/build32.lds.S
index 72a4c5c614..9d09e3adbd 100644
--- a/xen/arch/x86/boot/build32.lds.S
+++ b/xen/arch/x86/boot/build32.lds.S
@@ -41,6 +41,11 @@ SECTIONS
          * Potentially they should be all variables. */
         DECLARE_IMPORT(__base_relocs_start);
         DECLARE_IMPORT(__base_relocs_end);
+        DECLARE_IMPORT(__trampoline_rel_start);
+        DECLARE_IMPORT(__trampoline_rel_stop);
+        DECLARE_IMPORT(__trampoline_seg_start);
+        DECLARE_IMPORT(__trampoline_seg_stop);
+        DECLARE_IMPORT(trampoline_phys);
         . = . + GAP;
         *(.text)
         *(.text.*)
diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index e0776e3896..ade2c5c43d 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -706,28 +706,7 @@ trampoline_setup:
         mov     %edx, sym_offs(l1_bootmap)(%esi, %ecx, 8)
 
         /* Apply relocations to bootstrap trampoline. */
-        mov     sym_esi(trampoline_phys), %edx
-        lea     sym_esi(__trampoline_rel_start), %edi
-        lea     sym_esi(__trampoline_rel_stop), %ecx
-1:
-        mov     (%edi), %eax
-        add     %edx, (%edi, %eax)
-        add     $4,%edi
-
-        cmp     %ecx, %edi
-        jb      1b
-
-        /* Patch in the trampoline segment. */
-        shr     $4,%edx
-        lea     sym_esi(__trampoline_seg_start), %edi
-        lea     sym_esi(__trampoline_seg_stop), %ecx
-1:
-        mov     (%edi), %eax
-        mov     %dx, (%edi, %eax)
-        add     $4,%edi
-
-        cmp     %ecx, %edi
-        jb      1b
+        call    reloc_trampoline32
 
         /* Do not parse command line on EFI platform here. */
         cmpb    $0, sym_esi(efi_platform)
diff --git a/xen/arch/x86/boot/reloc-trampoline.c b/xen/arch/x86/boot/reloc-trampoline.c
new file mode 100644
index 0000000000..c899e99b08
--- /dev/null
+++ b/xen/arch/x86/boot/reloc-trampoline.c
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/compiler.h>
+#include <xen/stdint.h>
+#include <asm/trampoline.h>
+
+extern const int32_t __trampoline_rel_start[], __trampoline_rel_stop[];
+extern const int32_t __trampoline_seg_start[], __trampoline_seg_stop[];
+
+#if defined(__i386__)
+void reloc_trampoline32(void)
+#elif defined (__x86_64__)
+void reloc_trampoline64(void)
+#else
+#error Unknow architecture
+#endif
+{
+    unsigned long phys = trampoline_phys;
+    const int32_t *trampoline_ptr;
+
+    /*
+     * Apply relocations to trampoline.
+     *
+     * This modifies the trampoline in place within Xen, so that it will
+     * operate correctly when copied into place.
+     */
+    for ( trampoline_ptr = __trampoline_rel_start;
+          trampoline_ptr < __trampoline_rel_stop;
+          ++trampoline_ptr )
+        *(uint32_t *)(*trampoline_ptr + (long)trampoline_ptr) += phys;
+
+    for ( trampoline_ptr = __trampoline_seg_start;
+          trampoline_ptr < __trampoline_seg_stop;
+          ++trampoline_ptr )
+        *(uint16_t *)(*trampoline_ptr + (long)trampoline_ptr) = phys >> 4;
+}
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 94f3443364..1acceec471 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -103,27 +103,16 @@ static void __init efi_arch_relocate_image(unsigned long delta)
     }
 }
 
-extern const int32_t __trampoline_rel_start[], __trampoline_rel_stop[];
-extern const int32_t __trampoline_seg_start[], __trampoline_seg_stop[];
+void reloc_trampoline64(void);
 
 static void __init relocate_trampoline(unsigned long phys)
 {
-    const int32_t *trampoline_ptr;
-
     trampoline_phys = phys;
 
     if ( !efi_enabled(EFI_LOADER) )
         return;
 
-    /* Apply relocations to trampoline. */
-    for ( trampoline_ptr = __trampoline_rel_start;
-          trampoline_ptr < __trampoline_rel_stop;
-          ++trampoline_ptr )
-        *(u32 *)(*trampoline_ptr + (long)trampoline_ptr) += phys;
-    for ( trampoline_ptr = __trampoline_seg_start;
-          trampoline_ptr < __trampoline_seg_stop;
-          ++trampoline_ptr )
-        *(u16 *)(*trampoline_ptr + (long)trampoline_ptr) = phys >> 4;
+    reloc_trampoline64();
 }
 
 static void __init place_string(u32 *addr, const char *s)
-- 
2.34.1


