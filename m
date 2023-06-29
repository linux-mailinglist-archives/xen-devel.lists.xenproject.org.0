Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7C574258B
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 14:17:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556810.869595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEqaS-0004pn-4E; Thu, 29 Jun 2023 12:17:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556810.869595; Thu, 29 Jun 2023 12:17:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEqaR-0004nZ-Uy; Thu, 29 Jun 2023 12:17:23 +0000
Received: by outflank-mailman (input) for mailman id 556810;
 Thu, 29 Jun 2023 12:17:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4caF=CR=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qEqaR-0004YX-3q
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 12:17:23 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e682b8bf-1676-11ee-b237-6b7b168915f2;
 Thu, 29 Jun 2023 14:17:22 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b69dcf45faso9122041fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jun 2023 05:17:22 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 c15-20020a170906528f00b0098866a94f14sm6773841ejm.125.2023.06.29.05.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jun 2023 05:17:21 -0700 (PDT)
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
X-Inumbo-ID: e682b8bf-1676-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1688041042; x=1690633042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AwoSGHZ6G/LeRP+DnNBp+JZLKpijyisI8If2qVcjwrc=;
        b=Ia4ITNouGr/++Gx6M+9NGp0ngRn7MtuhyusZFQ4XadNipiwPDJQBkJiELTTqgN8IcX
         mPHYQfOmNpPZClLWHSPN3sxB7dBok2rtPI04xB9hDSgr17gp74uMc77BYv/Hem+xCdhc
         ZOH7mpQsvrspEWFeyXm59GYIJUfLybK3YlQyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688041042; x=1690633042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AwoSGHZ6G/LeRP+DnNBp+JZLKpijyisI8If2qVcjwrc=;
        b=NnXJrddrJpab+hjc8THqHwEJ76Z2kvI/SfAhuz+5YKGDdHreiddw63YhmFMie7PvHP
         NpzxYrSfGS0+1lcNAONf2/uyQeljdbdTBbGv9loD56d5fp4sgbIr/i7SGj7uF/iY19IX
         yL93eazGEdj2cIpUyG7W7hf+mJDsHhbeq7fG9y+ZwkpoigSA3tUmPu2LVvAkcyMvUh8U
         FZqN2EvJISvtSrDKp5QtMtZpPk1oCxHzZhvw4rBFMgN23W5RoTsROajoD06bTObVrxJk
         ae+70lvrGLmMRU3CXwvYTfcmKUf/Xx1aqxZfV3aJjsjs6mNwlFWVkjjDCYvvy7qoBYUI
         Xvjw==
X-Gm-Message-State: AC+VfDyfYGMu49gmPSAWp6+fT9QzBMtyA0OcPlyiJGyIgvMTh/WM74SW
	WQtjg8cxtN4W0+QSHex44AOgnSJnpXWqK5IM5TI=
X-Google-Smtp-Source: ACHHUZ7Qy2E1RcNZwrCIWWDSTKZ38OFttujIjZVQ29ixBB9Ln4MMKEOzYfhj+NCZOIJe35HOloca7g==
X-Received: by 2002:a2e:a1c9:0:b0:2b6:a841:e690 with SMTP id c9-20020a2ea1c9000000b002b6a841e690mr7399366ljm.42.1688041041753;
        Thu, 29 Jun 2023 05:17:21 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 3/3] x86: Add Kconfig option to require NX bit support
Date: Thu, 29 Jun 2023 13:17:13 +0100
Message-Id: <20230629121713.1211-4-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230629121713.1211-1-alejandro.vallejo@cloud.com>
References: <20230629121713.1211-1-alejandro.vallejo@cloud.com>
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
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
 xen/arch/x86/Kconfig                  | 16 ++++++++++++++++
 xen/arch/x86/boot/head.S              | 15 ++++++++++++++-
 xen/arch/x86/boot/trampoline.S        |  3 ++-
 xen/arch/x86/efi/efi-boot.h           |  9 +++++++++
 xen/arch/x86/include/asm/cpufeature.h |  3 ++-
 5 files changed, 43 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 406445a358..92f3a627da 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -307,6 +307,22 @@ config MEM_SHARING
 	bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
 	depends on HVM
 
+config REQUIRE_NX
+	bool "Require NX (No eXecute) support"
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
index 0e02c28f37..2e62d07f43 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -123,6 +123,7 @@ multiboot2_header:
 .Lbad_ldr_nih: .asciz "ERR: EFI ImageHandle is not provided by bootloader!"
 .Lbad_efi_msg: .asciz "ERR: EFI IA-32 platforms are not supported!"
 .Lbag_alg_msg: .asciz "ERR: Xen must be loaded at a 2Mb boundary!"
+.Lno_nx_msg:   .asciz "ERR: Not an NX-capable CPU!"
 
         .section .init.data, "aw", @progbits
         .align 4
@@ -153,6 +154,11 @@ early_error: /* Here to improve the disassembly. */
 .Lnot_aligned:
         add     $sym_offs(.Lbag_alg_msg), %esi
         jmp     .Lget_vtb
+#ifdef CONFIG_REQUIRE_NX
+.Lno_nx:
+        add     $sym_offs(.Lno_nx_msg), %esi
+        jmp     .Lget_vtb
+#endif
 .Lmb2_no_st:
         /*
          * Here we are on EFI platform. vga_text_buffer was zapped earlier
@@ -656,7 +662,12 @@ trampoline_setup:
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
         jc     .Lgot_nx
 
@@ -695,9 +706,11 @@ trampoline_setup:
         jnc     .Lno_nx
 
 .Lgot_nx:
+#ifndef CONFIG_REQUIRE_NX
         /* Adjust EFER given that NX is present */
         orb     $EFER_NXE >> 8, 1 + sym_esi(trampoline_efer)
 .Lno_nx:
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
index e2cb8f3cc7..64e1dad225 100644
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


