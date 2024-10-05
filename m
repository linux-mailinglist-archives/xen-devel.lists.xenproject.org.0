Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBB6991538
	for <lists+xen-devel@lfdr.de>; Sat,  5 Oct 2024 10:03:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810795.1223550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swzkZ-00054r-Ui; Sat, 05 Oct 2024 08:02:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810795.1223550; Sat, 05 Oct 2024 08:02:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swzkZ-00050P-Pe; Sat, 05 Oct 2024 08:02:51 +0000
Received: by outflank-mailman (input) for mailman id 810795;
 Sat, 05 Oct 2024 08:02:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Cfp=RB=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swzkY-0004jU-GH
 for xen-devel@lists.xenproject.org; Sat, 05 Oct 2024 08:02:50 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 365b5edc-82f0-11ef-99a2-01e77a169b0f;
 Sat, 05 Oct 2024 10:02:48 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a99415adecaso12417466b.0
 for <xen-devel@lists.xenproject.org>; Sat, 05 Oct 2024 01:02:48 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9933db9c5bsm84152366b.162.2024.10.05.01.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Oct 2024 01:02:46 -0700 (PDT)
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
X-Inumbo-ID: 365b5edc-82f0-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728115368; x=1728720168; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ozqjksv56bCDRdCFqZJpI4TNrJMEv0iKvyZ9olNrAw8=;
        b=I/82Z4rezTzNX6WDj6SgSLjrgBuibZletFoCxjGjR4TEu4wvXDq8XnD3zuqDWA4/9V
         S/VnuZBMaO8Ar0GLEu/qX0xmnazAkPR2qVKlL+4rjYq+g3XaCtAiT2IDdZrIEVmbjtmE
         cftNkdVKhLB8uPPpyxQP4+FiQWAj/gDxEx3GQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728115368; x=1728720168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ozqjksv56bCDRdCFqZJpI4TNrJMEv0iKvyZ9olNrAw8=;
        b=pcp7ersHcFuNYNhlOa3nwmwlPNSiPQiYFMDtyJT2zgvdiAk3CfV+LKlJ2Opm/rYlIp
         ivjwlEBtZNE35xIztH0WbFMbA3tdE1JjcY3iA7sQjNCV4LO73o+90ruKXAdc/Y9u/MiR
         umS/4g+1UNXqNVxVY2pv0jfuUwvveoq5TqM+JxYMNEOs3NYZeJD50QG3qAz5cTVSeTdK
         +oFZ2PuhwscGEX55s4maSWxq6RhJJaul04EOcx5n5LcfsGWu1ONhh0KQbVYo3VdZ/936
         j8F0XmFjV0EfJSfkKhuDXeY3eU2+WCLYEC4O5k1dsacC2bQEhpSbj+dBEHXHrX0n5YLl
         ap3w==
X-Gm-Message-State: AOJu0Yy99vQgFCbsONwwdtAN3fVsCMaOFo0/TYDu3SkSUuyjspc2sE5x
	2tgBZY0iw9PV99KM1WeVNhl1Fj+GqYJI7LNqvm97CuHLM8sUkS5LgMAipVpD7oQvuMNRPDGYBQL
	R
X-Google-Smtp-Source: AGHT+IH6lpvgkk/MfIqEQ6PSrdBNBI4p476VJwnlh8ZlFhZ1ceiUnGQFtnqxWj+UzsYa4J2DzrMwMA==
X-Received: by 2002:a17:907:368b:b0:a8d:6372:2d38 with SMTP id a640c23a62f3a-a990a05eeb9mr832149566b.18.1728115367967;
        Sat, 05 Oct 2024 01:02:47 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 2/3] x86/boot: Reuse code to relocate trampoline
Date: Sat,  5 Oct 2024 09:02:32 +0100
Message-Id: <20241005080233.1248850-3-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241005080233.1248850-1-frediano.ziglio@cloud.com>
References: <20241005080233.1248850-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/Makefile           |  6 +++---
 xen/arch/x86/boot/build32.lds.S      |  5 +++++
 xen/arch/x86/boot/head.S             | 23 +--------------------
 xen/arch/x86/boot/reloc-trampoline.c | 30 ++++++++++++++++++++++++++++
 xen/arch/x86/efi/efi-boot.h          | 15 ++------------
 5 files changed, 41 insertions(+), 38 deletions(-)
 create mode 100644 xen/arch/x86/boot/reloc-trampoline.c

diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index da87179fef..c16c4a8595 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -1,6 +1,6 @@
-obj-bin-y += head.o cbundle.o
+obj-bin-y += head.o cbundle.o reloc-trampoline.x64.o
 
-head-bin-objs := cmdline.o reloc.o
+head-bin-objs := cmdline.o reloc.o reloc-trampoline.o
 
 nocov-y   += $(head-bin-objs)
 noubsan-y += $(head-bin-objs)
@@ -43,7 +43,7 @@ $(obj)/cbundle.o: $(head-bin-objs) $(obj)/build32.other.lds $(obj)/build32.final
 	$(PYTHON) $(srctree)/tools/combine_two_binaries \
 		--script $(obj)/build32.final.lds \
 		--bin1 $@.1.bin --bin2 $@.2.bin \
-		--map $(obj)/cbundle.map --exports cmdline_parse_early,reloc \
+		--map $(obj)/cbundle.map --exports cmdline_parse_early,reloc,reloc_trampoline32 \
 		--section-header '.section .init.text, "ax", @progbits' \
 		--output $(obj)/cbundle.s
 	$(CC) -c $(obj)/cbundle.s -o $@.tmp
diff --git a/xen/arch/x86/boot/build32.lds.S b/xen/arch/x86/boot/build32.lds.S
index fe422e3d25..2d10a75fb1 100644
--- a/xen/arch/x86/boot/build32.lds.S
+++ b/xen/arch/x86/boot/build32.lds.S
@@ -43,6 +43,11 @@ SECTIONS
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
index 0000000000..9509dfa28a
--- /dev/null
+++ b/xen/arch/x86/boot/reloc-trampoline.c
@@ -0,0 +1,30 @@
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
+    /* Apply relocations to trampoline. */
+    for ( trampoline_ptr = __trampoline_rel_start;
+          trampoline_ptr < __trampoline_rel_stop;
+          ++trampoline_ptr )
+        *(uint32_t *)(*trampoline_ptr + (long)trampoline_ptr) += phys;
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


