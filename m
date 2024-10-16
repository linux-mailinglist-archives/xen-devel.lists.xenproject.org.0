Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1B79A0548
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 11:22:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819756.1233214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t10EP-0001Z0-Jq; Wed, 16 Oct 2024 09:22:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819756.1233214; Wed, 16 Oct 2024 09:22:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t10EP-0001Su-FW; Wed, 16 Oct 2024 09:22:13 +0000
Received: by outflank-mailman (input) for mailman id 819756;
 Wed, 16 Oct 2024 09:22:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zOTK=RM=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t10EM-0001Po-Ss
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 09:22:10 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e4cb635-8ba0-11ef-99a3-01e77a169b0f;
 Wed, 16 Oct 2024 11:22:09 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2fb559b0b00so22815681fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Oct 2024 02:22:09 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c98d7b735dsm1500429a12.81.2024.10.16.02.22.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2024 02:22:07 -0700 (PDT)
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
X-Inumbo-ID: 1e4cb635-8ba0-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729070528; x=1729675328; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a7VcpN6y0URlDmG4dL4A6Jp+RGqHH6gYK9P+8EaJqbU=;
        b=O8a09peI15Tqu5tarB83vv2VkJlMSbx+RNuuhQaBxmne4pCOyVsnYcgcFN0o08zizp
         3AY/LcI1/JzWy0xhVURONIjqXH/xa5WGL5d1zeeBqx1Y8zdmOVnZkqpP5Ai6XXpv+sRx
         +djRbbMjsWr4yiwDLo0gWPvUZkdo1KaoSuUaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729070528; x=1729675328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a7VcpN6y0URlDmG4dL4A6Jp+RGqHH6gYK9P+8EaJqbU=;
        b=wMv3byJeUR9p1vDGzkkWnmZ6vtsAFXMJAjSRZacCVXI40gZLy1n4jveqZaf/rrQsR0
         s7ePTUzooQlb9HWJM64pT3r96vqCMMP7m1CRNjGQYStYHhitji7VwToGx42rm2tg009v
         SX/NewKNXz/+1LNgxPtFNS7PrI0ibRLguH+CtZWOy+s0A5RCA3+A8Ml+M3/+9CbCkRd5
         opMwHmM3hzK/rK3gQN1vL5hTFuLDfCMsVCQjezT2cAn3Va88N4Mj7HbrjQdzFhJYZ/eV
         12Mqh5tQIPRrbwD+NX0cT5wRmmJxMuXFPmmGdjh8RnudxKwIqPCxFJfYRecuRUBjPQ0l
         UhMQ==
X-Gm-Message-State: AOJu0YwcazoalfEt1Nii3+bufV0aUzfkMEAYsVBATDqpRR+cZDWMXk7w
	QyRTpCqOh1nxD9JsLXEmxq8s44Dx9cEkDN4QYv6tcRvY6nqUAAgsnNU/mxjFKvWjHdp8YmR1xzU
	2
X-Google-Smtp-Source: AGHT+IEOuhxjvaPkF0dYqQwfl81tkFDF31y8g8xuONjSKZq1ep8sAPuF7lVlLUs/1457fR1wsgjAFw==
X-Received: by 2002:a2e:4609:0:b0:2fb:2bda:3872 with SMTP id 38308e7fff4ca-2fb3f31e022mr49194961fa.45.1729070528058;
        Wed, 16 Oct 2024 02:22:08 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v5 2/5] x86/boot: Reuse code to relocate trampoline
Date: Wed, 16 Oct 2024 10:21:51 +0100
Message-Id: <20241016092154.1493035-3-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241016092154.1493035-1-frediano.ziglio@cloud.com>
References: <20241016092154.1493035-1-frediano.ziglio@cloud.com>
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
---
 xen/arch/x86/boot/Makefile           | 12 ++++++----
 xen/arch/x86/boot/build32.lds.S      |  5 ++++
 xen/arch/x86/boot/head.S             | 23 +-----------------
 xen/arch/x86/boot/reloc-trampoline.c | 36 ++++++++++++++++++++++++++++
 xen/arch/x86/efi/efi-boot.h          | 15 ++----------
 5 files changed, 52 insertions(+), 39 deletions(-)
 create mode 100644 xen/arch/x86/boot/reloc-trampoline.c

diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index c665a9b420..c57c9f83d3 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -1,12 +1,16 @@
 obj-bin-y += head.o
 obj-bin-y += built-in-32.o
+obj-bin-y += $(obj64)
 
 obj32 := cmdline.32.o
 obj32 += reloc.32.o
+obj32 += reloc-trampoline.32.o
 
-nocov-y   += $(obj32)
-noubsan-y += $(obj32)
-targets   += $(obj32)
+obj64 := reloc-trampoline.o
+
+nocov-y   += $(obj32) $(obj64)
+noubsan-y += $(obj32) $(obj64)
+targets   += $(obj32) $(obj64)
 
 obj32 := $(addprefix $(obj)/,$(obj32))
 
@@ -57,7 +61,7 @@ $(obj)/built-in-32.S: $(obj)/built-in-32.other.bin $(obj)/built-in-32.final.bin
 		--bin1 $(obj)/built-in-32.other.bin \
 		--bin2 $(obj)/built-in-32.final.bin \
 		--map $(obj)/built-in-32.final.map \
-		--exports cmdline_parse_early,reloc \
+		--exports cmdline_parse_early,reloc,reloc_trampoline32 \
 		--output $@
 
 clean-files := built-in-32.*.bin built-in-32.*.map build32.*.lds
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


