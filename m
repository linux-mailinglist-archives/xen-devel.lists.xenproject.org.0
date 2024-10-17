Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F68D9A23D5
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 15:31:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820591.1234130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1QbL-0007gN-T4; Thu, 17 Oct 2024 13:31:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820591.1234130; Thu, 17 Oct 2024 13:31:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1QbL-0007cy-Pi; Thu, 17 Oct 2024 13:31:39 +0000
Received: by outflank-mailman (input) for mailman id 820591;
 Thu, 17 Oct 2024 13:31:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZcP3=RN=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t1QbK-0007Yl-K9
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 13:31:38 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21e28026-8c8c-11ef-99a3-01e77a169b0f;
 Thu, 17 Oct 2024 15:31:36 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5366fd6fdf1so1536290e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2024 06:31:36 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a29817036sm299115166b.124.2024.10.17.06.31.34
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
X-Inumbo-ID: 21e28026-8c8c-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729171895; x=1729776695; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fZ9CyilDRJ9hcc5UhF8AJZBpprsEzy6yq5x+V3+UrsI=;
        b=VsqWJvTFpUpAfXUeLi2nmZXtXAGgj8Gj7J7kfvj3iVP5V2T5qf2XJzc87lISwuvGvw
         7Vy7c9NN277GE4HhjovzrekxUmZtxABHKG1H43Ld7u6jSZsfyjH+WkQ+F/Df05JkK7Fm
         j0t0McbpFVxqWrJVwHYoLokvZVI6oH9N5hlao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729171895; x=1729776695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fZ9CyilDRJ9hcc5UhF8AJZBpprsEzy6yq5x+V3+UrsI=;
        b=T7pIfrPvUVL67Inwp7kb9BktCZS8KOAY/4b4pyPMn/D/S/w6ZfeHMBzsP1SY343U50
         FGPC4VvosYoXIJ2WgHG51kBhRYdQ8TuLhkzAQ0lugI3Bk2ln4T7E9T1AUKkwoAzLCydT
         pyoBzHsHfYSgNeNX34ZogPCx0HReadZUKfR6I/Oj2GKK+Un8qtiWVngV4Df/nQ6X0TVa
         1B2MTTLXjP35IMcaelXNNTQYBuxkDppT7KN2Dtd8ryCw2JKYh6mg4h3WXj9xdlCE7x/4
         AZjlIMpcXbT1G6VTsAGfhXzuauzoIMiIOr37K/i5Coi54qKcNZFJ3k9JY4FdRC1IrR0D
         Ni7Q==
X-Gm-Message-State: AOJu0YwWcC+/o8VEIAUdhnNucZgr2ECfav56bVBWzGQcckSBAm+s9Yad
	TyL3ungXmsG1M9sM3KEUOtM8qXRgL7SmmYgEsslQ2dUot/piDoMlOZm7sTaVb2h7L7+pXYjKPUf
	b
X-Google-Smtp-Source: AGHT+IErctvAnrUFXio0tyEeDTz1agZ8lWqX/qFwPX6eTI7Ki7+QcjFIYjiah0Jl/0rakksP8ZAvxQ==
X-Received: by 2002:a05:6512:2384:b0:539:ea66:597e with SMTP id 2adb3069b0e04-53a03f07225mr5393227e87.2.1729171895361;
        Thu, 17 Oct 2024 06:31:35 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v6 2/5] x86/boot: Reuse code to relocate trampoline
Date: Thu, 17 Oct 2024 14:31:20 +0100
Message-Id: <20241017133123.1946204-3-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241017133123.1946204-1-frediano.ziglio@cloud.com>
References: <20241017133123.1946204-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move code from efi-boot.h to a separate, new, reloc-trampoline.c file.
Reuse this new code, compiling it for 32bit as well, to replace assembly
code in head.S doing the same thing.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Changes since v3:
- fixed a typo in comment;
- added Reviewed-by.

Changes since v5:
- do not add obj64 to targets, already done adding it to obj-bin-y.
---
 xen/arch/x86/boot/Makefile           | 10 +++++---
 xen/arch/x86/boot/build32.lds.S      |  5 ++++
 xen/arch/x86/boot/head.S             | 23 +-----------------
 xen/arch/x86/boot/reloc-trampoline.c | 36 ++++++++++++++++++++++++++++
 xen/arch/x86/efi/efi-boot.h          | 15 ++----------
 5 files changed, 51 insertions(+), 38 deletions(-)
 create mode 100644 xen/arch/x86/boot/reloc-trampoline.c

diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index 5da19501be..98ceb1983d 100644
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
@@ -56,7 +60,7 @@ cmd_combine = \
 		--bin1 $(obj)/built-in-32.base.bin \
 		--bin2 $(obj)/built-in-32.offset.bin \
 		--map $(obj)/built-in-32.offset.map \
-		--exports cmdline_parse_early,reloc \
+		--exports cmdline_parse_early,reloc,reloc_trampoline32 \
 		--output $@
 
 targets += built-in-32.S
diff --git a/xen/arch/x86/boot/build32.lds.S b/xen/arch/x86/boot/build32.lds.S
index e3f5e55261..fa282370f4 100644
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


