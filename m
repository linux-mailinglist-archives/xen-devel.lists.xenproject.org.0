Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E0899C423
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2024 10:54:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.818522.1231853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0Gpq-0000UO-OR; Mon, 14 Oct 2024 08:53:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 818522.1231853; Mon, 14 Oct 2024 08:53:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0Gpq-0000P6-Ja; Mon, 14 Oct 2024 08:53:50 +0000
Received: by outflank-mailman (input) for mailman id 818522;
 Mon, 14 Oct 2024 08:53:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qGCd=RK=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t0Gpo-00086D-IE
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2024 08:53:48 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2e7e01e-8a09-11ef-99a2-01e77a169b0f;
 Mon, 14 Oct 2024 10:53:47 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2fb4af0b6beso8593321fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Oct 2024 01:53:47 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99a80f2446sm551817766b.206.2024.10.14.01.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 01:53:45 -0700 (PDT)
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
X-Inumbo-ID: d2e7e01e-8a09-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728896026; x=1729500826; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oySDyT4GmL2tsmRjXkrGrh0QdsSZG+8keHHypj0A/K8=;
        b=Gs4f4U4Ug7Ie82u9os/ec70JMWhcVnX5QSa+LqCNITRycmjzf2NwsxuxPHUkDw4dfA
         b9k3mCMvrPH+HhjFPNq3iuClSewe/I02zfYbYbd1t4xL0x3cgteyWWcA0RSsF0CMNWHn
         D/6r8GbJB8JLPzxhdKdDXHubt+ST/yYCK6JgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728896026; x=1729500826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oySDyT4GmL2tsmRjXkrGrh0QdsSZG+8keHHypj0A/K8=;
        b=VEEkZI0VQ4YFEXyyW+eWCJkBAgvG/QVznNxTHDwZpxkU1DcqhaSCk/jm9fuwIUYZwl
         GkwrFRIblC38X6UmJKSGKqSOKk0tOFDzgbWzzT/dw1sleVV0jGvrau/ucbI+y9GS/3pJ
         Z47Eewi2nc2Snvreh29CztNMmXqTJOPx8l59ETImfR2eU+LFLNYT2p5PGDXOKtsr1Jjr
         3uEd6kYb4oGXqOEcgyzzkDJP8A3zqLKUW4PM69uqh6oNmFVtGV8KojfcqJROTeJanb/O
         wU4UXmNqUmKHJyzazgSevZsDxAiLkF/CHw32a4XoWjEJcFPW6fCMvHZe49VAwZdpMl3s
         roBQ==
X-Gm-Message-State: AOJu0YytfXtAc2k78J8XmCeq1e/62OaQak0YEIwyk2kfNqS2pCvNuvWE
	EzspUgI5ON2vmH2llFBtbsZANb9aZBUXr9Lohrc7LECxYpexBbmkdBwkHpoh7phGXJBxVvftmg7
	Q
X-Google-Smtp-Source: AGHT+IH9NQoAnD2hbWSP0lmRunEYSkPbvCyiHCPSppmlkL1GMwO06hGOyc9V+oWZYD1MXxkljcKICw==
X-Received: by 2002:a05:651c:2220:b0:2fb:3881:35d5 with SMTP id 38308e7fff4ca-2fb3f2c725emr29536201fa.35.1728896026013;
        Mon, 14 Oct 2024 01:53:46 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v4 3/6] x86/boot: Reuse code to relocate trampoline
Date: Mon, 14 Oct 2024 09:53:29 +0100
Message-Id: <20241014085332.3254546-4-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241014085332.3254546-1-frediano.ziglio@cloud.com>
References: <20241014085332.3254546-1-frediano.ziglio@cloud.com>
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
index 23ad274c89..ca258a9729 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -1,12 +1,16 @@
 obj-bin-y += head.o
 obj-bin-y += built_in_32.o
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
 
@@ -50,7 +54,7 @@ $(obj)/built_in_32.S: $(obj)/built_in_32.other.bin $(obj)/built_in_32.final.bin
 		--bin1 $(obj)/built_in_32.other.bin \
 		--bin2 $(obj)/built_in_32.final.bin \
 		--map $(obj)/built_in_32.final.map \
-		--exports cmdline_parse_early,reloc \
+		--exports cmdline_parse_early,reloc,reloc_trampoline32 \
 		--output $@
 
 clean-files := built_in_32.*.bin built_in_32.*.map build32.*.lds
diff --git a/xen/arch/x86/boot/build32.lds.S b/xen/arch/x86/boot/build32.lds.S
index 50c167aef0..1110880ad4 100644
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


