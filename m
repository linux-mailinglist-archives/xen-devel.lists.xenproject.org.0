Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1042731CC2
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 17:32:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549694.858379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9oxI-0003Wu-1f; Thu, 15 Jun 2023 15:32:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549694.858379; Thu, 15 Jun 2023 15:32:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9oxH-0003Sb-SP; Thu, 15 Jun 2023 15:32:11 +0000
Received: by outflank-mailman (input) for mailman id 549694;
 Thu, 15 Jun 2023 15:32:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IrMH=CD=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1q9oxF-00039s-N6
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 15:32:09 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9c3b99e-0b91-11ee-b232-6b7b168915f2;
 Thu, 15 Jun 2023 17:32:08 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f8cc042e2bso18181975e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jun 2023 08:32:07 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 c12-20020a05600c0acc00b003f195d540d9sm20829986wmr.14.2023.06.15.08.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 08:32:04 -0700 (PDT)
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
X-Inumbo-ID: c9c3b99e-0b91-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1686843127; x=1689435127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9QjuDeIZX/4P8TG4G2HtMpHPapdilzqZaLVcacUT5A=;
        b=JWda/emZrdxyPpI6myh4+8ZwvDUx4tFsKVOqpVE62PliCLXRk6IsNdP0eXXVSwXAQY
         KDXIvyMdn8PQ+D9MSDrzIBkC2Az3LBUJ5nWkX/z4RItxKBfEh4phpDrHQDqhxXKM86cf
         SFPzwIS866YVU8MMwZ2LC1i/ZM7qoX9AXK5c0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686843127; x=1689435127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h9QjuDeIZX/4P8TG4G2HtMpHPapdilzqZaLVcacUT5A=;
        b=Ca0I6Oz0pJYb2BH/5bGfUCpxdzkbWFRYElVzP2VIKj9Dg4Vhn7vERA92r9dBGhc890
         kh/qr0UuuqmhatscgpJygh/BNeTl8qjYoo2F8FpQbN8JD0rGNl1BDtXmZT70eYx2ijzv
         vEtTxHw3eAXgLWhp7kSWcRydW/Fqot2NTtWRhTxBOnjINAGt9bgkAcCq9MkpegyfbVlP
         ojCfnoJ3yIDTpuhbXw4k6+oedjc9kUovtUR1bCy7GL2FzUGNZ3Io7vbfm5P6dja93XT3
         LJcp3yzTsBV6E4S51kVRo7FznTKp0cTLQjq5/Miwyedhx3ElOj09bXGeMNyo6Tgbefj3
         niMg==
X-Gm-Message-State: AC+VfDyOqEtWkOJ41chTdhir4BpGoMYkQ49wSpB1PsBi0a60L0bVd+iY
	denEvjhUiMngWucT5UMLexnAuacpXtHCiwV0FfA=
X-Google-Smtp-Source: ACHHUZ5FDQrtyDzEPBl7bp48bBZpDCajSrmhz/uHslPoLUx6X9HWawCQigcplt//FqDzjSX2EeHd3A==
X-Received: by 2002:a1c:4c0c:0:b0:3f7:3699:c294 with SMTP id z12-20020a1c4c0c000000b003f73699c294mr12533886wmf.29.1686843127210;
        Thu, 15 Jun 2023 08:32:07 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/2] x86: Add Kconfig option to require NX bit support
Date: Thu, 15 Jun 2023 16:31:57 +0100
Message-Id: <20230615153157.444-3-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230615153157.444-1-alejandro.vallejo@cloud.com>
References: <20230615153157.444-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This option hardens Xen by forcing it to write secure (NX-enhanced) PTEs
regardless of the runtime NX feature bit in boot_cpu_data. This prevents an
attacker with partial write support from affecting Xen's PTE generation
logic by overriding the NX feature flag. The patch asserts support for the
NX bit in PTEs at boot time and if so short-circuits the cpu_has_nx macro
to 1.

It has the nice benefit of replacing many instances of runtime checks with
folded constants. This has several knock-on effects that improve codegen,
saving 2.5KiB off the text section.

The config option defaults to OFF for compatibility with previous
behaviour.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/arch/x86/Kconfig                  | 16 ++++++++++++++++
 xen/arch/x86/boot/head.S              | 15 ++++++++++++++-
 xen/arch/x86/boot/trampoline.S        |  3 ++-
 xen/arch/x86/efi/efi-boot.h           |  9 +++++++++
 xen/arch/x86/include/asm/cpufeature.h |  3 ++-
 5 files changed, 43 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 406445a358..fa97d4cccc 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -307,6 +307,22 @@ config MEM_SHARING
 	bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
 	depends on HVM
 
+config REQUIRE_NX
+	bool "Require NX bit support"
+	help
+	  No-eXecute (also called XD "eXecute Disable" and DEP "Data
+	  Execution Prevention") is a security feature designed originally
+	  to combat buffer overflow attacks by marking regions of memory
+	  which the CPU must not interpret as instructions.
+
+	  The NX feature exists in every 64bit CPU except for some very
+	  early Pentium 4 Prescott machines.
+
+	  Enabling this option will improve Xen's security by removing
+	  cases where Xen could be tricked into thinking that the feature
+	  was unavailable. However, if enabled, Xen will no longer boot on
+	  any CPU which is lacking NX support.
+
 endmenu
 
 source "common/Kconfig"
diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index ce62eae6f3..ec1e80ef68 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -123,6 +123,7 @@ multiboot2_header:
 .Lbad_ldr_nih: .asciz "ERR: EFI ImageHandle is not provided by bootloader!"
 .Lbad_efi_msg: .asciz "ERR: EFI IA-32 platforms are not supported!"
 .Lbag_alg_msg: .asciz "ERR: Xen must be loaded at a 2Mb boundary!"
+.Lno_nx_bit_msg: .asciz "ERR: Not an NX-bit capable CPU!"
 
         .section .init.data, "aw", @progbits
         .align 4
@@ -151,6 +152,11 @@ not_multiboot:
 .Lnot_aligned:
         add     $sym_offs(.Lbag_alg_msg),%esi   # Error message
         jmp     .Lget_vtb
+#ifdef CONFIG_REQUIRE_NX
+.Lno_nx_bit:
+        add     $sym_offs(.Lno_nx_bit_msg),%esi
+        jmp     .Lget_vtb
+#endif
 .Lmb2_no_st:
         /*
          * Here we are on EFI platform. vga_text_buffer was zapped earlier
@@ -651,7 +657,12 @@ trampoline_setup:
         bt      $cpufeat_bit(X86_FEATURE_LM),%edx
         jnc     .Lbad_cpu
 
-        /* Check for NX */
+        /*
+         * Check for NX
+         *   - If Xen was compiled requiring it simply assert it's
+         *     supported. The trampoline already has the right constant.
+         *   - Otherwise, update the trampoline EFER mask accordingly.
+         */
         bt      $cpufeat_bit(X86_FEATURE_NX), %edx
         jc     .Lhas_nx_bit
 
@@ -697,9 +708,11 @@ trampoline_setup:
         jnc     .Lno_nx_bit
 
 .Lhas_nx_bit:
+#ifndef CONFIG_REQUIRE_NX
         /* Adjust EFER is NX is present */
         orb     $EFER_NXE >> 8, 1 + sym_esi(trampoline_efer)
 .Lno_nx_bit:
+#endif
 
         /* Stash TSC to calculate a good approximation of time-since-boot */
         rdtsc
diff --git a/xen/arch/x86/boot/trampoline.S b/xen/arch/x86/boot/trampoline.S
index c6005fa33d..b8ab0ffdcb 100644
--- a/xen/arch/x86/boot/trampoline.S
+++ b/xen/arch/x86/boot/trampoline.S
@@ -147,7 +147,8 @@ GLOBAL(trampoline_misc_enable_off)
 
 /* EFER OR-mask for boot paths.  SCE conditional on PV support, NX added when available. */
 GLOBAL(trampoline_efer)
-        .long   EFER_LME | (EFER_SCE * IS_ENABLED(CONFIG_PV))
+        .long   EFER_LME | (EFER_SCE * IS_ENABLED(CONFIG_PV)) | \
+                (EFER_NXE * IS_ENABLED(CONFIG_REQUIRE_NX))
 
 GLOBAL(trampoline_xen_phys_start)
         .long   0
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index c94e53d139..84700559bb 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -751,6 +751,15 @@ static void __init efi_arch_cpu(void)
     {
         caps[FEATURESET_e1d] = cpuid_edx(0x80000001);
 
+        /*
+         * This check purposefully doesn't use cpu_has_nx because
+         * cpu_has_nx bypasses the boot_cpu_data read if Xen was compiled
+         * with CONFIG_REQUIRE_NX
+         */
+        if ( IS_ENABLED(CONFIG_REQUIRE_NX) &&
+             !boot_cpu_has(X86_FEATURE_NX) )
+            blexit(L"This Xen build requires NX bit support.");
+
         if ( cpu_has_nx )
             trampoline_efer |= EFER_NXE;
     }
diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index ace31e3b1f..610532da43 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -91,7 +91,8 @@ static inline bool boot_cpu_has(unsigned int feat)
 #define cpu_has_hypervisor      boot_cpu_has(X86_FEATURE_HYPERVISOR)
 
 /* CPUID level 0x80000001.edx */
-#define cpu_has_nx              boot_cpu_has(X86_FEATURE_NX)
+#define cpu_has_nx              (IS_ENABLED(CONFIG_REQUIRE_NX) || \
+                                 boot_cpu_has(X86_FEATURE_NX))
 #define cpu_has_page1gb         boot_cpu_has(X86_FEATURE_PAGE1GB)
 #define cpu_has_rdtscp          boot_cpu_has(X86_FEATURE_RDTSCP)
 #define cpu_has_3dnow_ext       boot_cpu_has(X86_FEATURE_3DNOWEXT)
-- 
2.34.1


