Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D59B8992E9E
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 16:16:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812036.1224730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxoWq-00042I-In; Mon, 07 Oct 2024 14:16:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812036.1224730; Mon, 07 Oct 2024 14:16:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxoWq-0003xR-C2; Mon, 07 Oct 2024 14:16:04 +0000
Received: by outflank-mailman (input) for mailman id 812036;
 Mon, 07 Oct 2024 14:16:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aWQm=RD=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sxoWo-0002dC-Sm
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 14:16:02 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae238ce7-84b6-11ef-99a2-01e77a169b0f;
 Mon, 07 Oct 2024 16:16:01 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5c89bdb9019so5457342a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2024 07:16:01 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c8e05c119esm3386204a12.55.2024.10.07.07.15.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2024 07:16:00 -0700 (PDT)
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
X-Inumbo-ID: ae238ce7-84b6-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728310560; x=1728915360; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q5/3n16EnUjBRG5AvCw7/t22OjOl8ho/k7P3Cayw7x4=;
        b=JMotmb1zXRpyEXRBchG+DiWRiJ66nUNB07SzW6pOc3fGZgD3ORIe3IHJ8I+9n0Irbe
         6/5Xt2G5U+xBocjNfbOIPzRV7k6Z9SCFnuSv1qs3+ynlm5dm6i56Ocb1LiRZauZpDucX
         joEpFnVBF4a/idQILV5X3SkAy/fJKYBBTmUtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728310560; x=1728915360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q5/3n16EnUjBRG5AvCw7/t22OjOl8ho/k7P3Cayw7x4=;
        b=wAlbi2HXjH557nKDyp8ZZYP7cbuBmj4X1thne8i9N0sPermzt0ZWiaQ36akPAO2S2h
         XNSNuYaXBD/N1KJZyRIdG48LZXYCOYtgRrzZQ7PLRtGJi27nNDDUxOlbBbhZ2bCFoj19
         EhWi/d1csQLBroVmoU4KPbdEQDOZac9g6CmeiLJ9zTSEZP8bBwSkIGF4a15CxWLAo9Jh
         6Z/wJzZBUQMfVT3xpD0/lpmMmDn+sZenfL2iHm182PeBGWGyadgcnTdmObvcOLUpfqfD
         m2fdsImQfBmbtzuyTjKjAMWj+NtTcYx+YUcBMHGZooEP4wGyYlSxNSGs0PlUmIcJIlIt
         YDng==
X-Gm-Message-State: AOJu0Yx8DhKD6qm71Q/jlBi6VMAFy2CEeaohy6ffI7eNlJFxR+9SlQwv
	DJWw4IxDYkMiH59OEe9JBZKj1zbm09PgMdfoxQ/XzUSi1so737NGAs0uhH8gO/o7cGeJDHtayVW
	h
X-Google-Smtp-Source: AGHT+IHhLmA9sj29joNRSENtbo+EU9iWrDMzaKaKjUrgFrbDBZuEVwcfQuKSr9IZpyP9F4R+RHO9WQ==
X-Received: by 2002:a05:6402:3582:b0:5c8:9515:cbe with SMTP id 4fb4d7f45d1cf-5c8d2dfbf42mr9281339a12.3.1728310560431;
        Mon, 07 Oct 2024 07:16:00 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v2 4/6] x86/boot: Reuse code to relocate trampoline
Date: Mon,  7 Oct 2024 15:15:37 +0100
Message-Id: <20241007141539.1899350-5-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241007141539.1899350-1-frediano.ziglio@cloud.com>
References: <20241007141539.1899350-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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


