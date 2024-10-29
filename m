Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFC09B46DC
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 11:30:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827210.1241778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5jUB-0007Ye-0p; Tue, 29 Oct 2024 10:30:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827210.1241778; Tue, 29 Oct 2024 10:30:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5jUA-0007U8-Qe; Tue, 29 Oct 2024 10:30:02 +0000
Received: by outflank-mailman (input) for mailman id 827210;
 Tue, 29 Oct 2024 10:30:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/WX/=RZ=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t5jU9-0006t0-Bw
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 10:30:01 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bcdbf6d7-95e0-11ef-99a3-01e77a169b0f;
 Tue, 29 Oct 2024 11:29:54 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5c9850ae22eso6822389a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 03:29:54 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1dfbc7e8sm458495466b.31.2024.10.29.03.29.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 03:29:53 -0700 (PDT)
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
X-Inumbo-ID: bcdbf6d7-95e0-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzAiLCJoZWxvIjoibWFpbC1lZDEteDUzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImJjZGJmNmQ3LTk1ZTAtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMTk3Nzk0Ljc0NDE2Nywic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730197794; x=1730802594; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhWSbnJvPwHAY4fvW4OKlyERgJEwgRJ/ziSxdZab8H8=;
        b=O4AiBgY3bSIAL1udwvf/MEbjpDVWD/KuNdlDUszy2dRTYpp2N4jJplDupT3Xjk4Sst
         EwEA1+aXRktG8qXGE+5BBc79qmO9VgVefc7mEfQtMAjoby+XEx4TjxjpzTV6rBWcwLxL
         V7fXFgqAjSUFSLa2hkE73dshqnIhf+m9OMEVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730197794; x=1730802594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qhWSbnJvPwHAY4fvW4OKlyERgJEwgRJ/ziSxdZab8H8=;
        b=P2VNWXaCUpLh9Fin4SWWiNyH5lIPIOL6wkHyAox2lHWuT4CmKwaUbqQ1gculcZqa9l
         lLamNnZ7KBvhu8GdFF5jo/0pZM1RDtNOqFI0IlxJKGxdgfmPxNxBkKk/HEvTI4olaqdH
         6ikGMxhqx7BCW+fXjGha1Mf2p9OlP2PLD5PWf6l7i8uu7Xee+ugTBwtITTEoR/IZ4bNc
         ZRAxv9lf6E99EFEmTgwBTjVIBEadejHOiIJV/ft92uAzNChbhS+nVEXdP2hLkVgdpz3g
         f3iTe3WPBSnmr7ucdzsrRdDPv0aNKGADJEPNjGRZgKjpyPztmIuYdEiuMpQLZMoKYxvt
         3dZw==
X-Gm-Message-State: AOJu0YxQnm6gPyWYQ4Lq/2EWsYXoE4cTkgfgtamHfD+1CQf22ZvorKJ7
	FrDga8W7oryY6KA4XL3mJv5/G69ZdTW+5ra8yBs/XusbiQiZ0/OGznLNL8E8M5XSxSgdAUvbawM
	/
X-Google-Smtp-Source: AGHT+IEwafcwQ80FRIWYOqFJJZeeimSvtxbVohIw3MUHAXU8T8Oc41ZySLiMRn6LMBR5lL60ppBD+Q==
X-Received: by 2002:a17:907:9815:b0:a9a:9b1:f972 with SMTP id a640c23a62f3a-a9de61cf153mr974394866b.40.1730197793814;
        Tue, 29 Oct 2024 03:29:53 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v7 2/5] x86/boot: Reuse code to relocate trampoline
Date: Tue, 29 Oct 2024 10:29:39 +0000
Message-Id: <20241029102942.162912-3-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029102942.162912-1-frediano.ziglio@cloud.com>
References: <20241029102942.162912-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Move code from efi-boot.h to a separate, new, reloc-trampoline.c file.
Reuse this new code, compiling it for 32bit as well, to replace assembly
code in head.S doing the same thing.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes since v3:
- fixed a typo in comment;
- added Reviewed-by.

Changes since v5:
- do not add obj64 to targets, already done adding it to obj-bin-y.

Changes since v6:
- added Acked-by.
---
 xen/arch/x86/boot/Makefile           | 10 +++++---
 xen/arch/x86/boot/build32.lds.S      |  5 ++++
 xen/arch/x86/boot/head.S             | 23 +-----------------
 xen/arch/x86/boot/reloc-trampoline.c | 36 ++++++++++++++++++++++++++++
 xen/arch/x86/efi/efi-boot.h          | 15 ++----------
 5 files changed, 51 insertions(+), 38 deletions(-)
 create mode 100644 xen/arch/x86/boot/reloc-trampoline.c

diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index 230a99a1e5..e102bd8c70 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -1,11 +1,15 @@
 obj-bin-y += head.o
 obj-bin-y += built-in-32.o
+obj-bin-y += $(obj64)
 
 obj32 := cmdline.32.o
 obj32 += reloc.32.o
+obj32 += reloc-trampoline.32.o
 
-nocov-y   += $(obj32)
-noubsan-y += $(obj32)
+obj64 := reloc-trampoline.o
+
+nocov-y   += $(obj32) $(obj64)
+noubsan-y += $(obj32) $(obj64)
 targets   += $(obj32)
 
 obj32 := $(addprefix $(obj)/,$(obj32))
@@ -75,7 +79,7 @@ cmd_combine = \
               --bin1      $(obj)/built-in-32.base.bin \
               --bin2      $(obj)/built-in-32.offset.bin \
               --map       $(obj)/built-in-32.offset.map \
-              --exports   cmdline_parse_early,reloc \
+              --exports   cmdline_parse_early,reloc,reloc_trampoline32 \
               --output    $@
 
 targets += built-in-32.S
diff --git a/xen/arch/x86/boot/build32.lds.S b/xen/arch/x86/boot/build32.lds.S
index d1b9dc6689..27f0d7ac3c 100644
--- a/xen/arch/x86/boot/build32.lds.S
+++ b/xen/arch/x86/boot/build32.lds.S
@@ -45,6 +45,11 @@ SECTIONS
          */
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
index 0000000000..0a74c1e75a
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
+#error Unknown architecture
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
index 3b26f0b0f5..3133985c88 100644
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


