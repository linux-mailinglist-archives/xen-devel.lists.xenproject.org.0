Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 972E371F107
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 19:45:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542696.846854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4mKo-00020a-2C; Thu, 01 Jun 2023 17:43:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542696.846854; Thu, 01 Jun 2023 17:43:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4mKn-0001xL-VE; Thu, 01 Jun 2023 17:43:37 +0000
Received: by outflank-mailman (input) for mailman id 542696;
 Thu, 01 Jun 2023 17:43:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=om5G=BV=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1q4mKl-0001xF-UX
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 17:43:35 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d235581e-00a3-11ee-8611-37d641c3527e;
 Thu, 01 Jun 2023 19:43:30 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-30aeee7c8a0so942767f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 01 Jun 2023 10:43:30 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 h12-20020a5d6e0c000000b002ca864b807csm11149310wrz.0.2023.06.01.10.43.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jun 2023 10:43:29 -0700 (PDT)
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
X-Inumbo-ID: d235581e-00a3-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1685641409; x=1688233409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UWNQNSoIT/qncl/3Jg92282yi87AP2Clk3QevAJ37uU=;
        b=f96PSfWE9d8KbrTJBBBwjtTP0OJpyDZDAumXu6ietkLhhZQQJzbN3JpNmmYs14g4xU
         orPAZdpykNQExiFj4XkRaDi1bcY5hfhBc/zTJnzuKcHI6i0DtYr9ywJKTXk7N77/yd9A
         QFuthETfSeL1TAySku7piEuel9033LHfqif+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685641409; x=1688233409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UWNQNSoIT/qncl/3Jg92282yi87AP2Clk3QevAJ37uU=;
        b=J2EDOwUg42cl7PUH6CrgWcIcOzOTZqYY1ZY3kRX5HB3BAW2WgUC9Rh4jRUj5PC6ooa
         Vqugh/8Pf6XyLNG2a9HjhhpW2/id1W7j1RYXfJ+wzbfIYR2SMUd73SubsFjC8o/Tu3fu
         +aFb28Zr0zxKQqSAs1GGVgvGh5M9hkfXxEoLwty/9v191vGRymSoTb7FOvigkHV4DDci
         k6ZImqacYNwTD+ojI7RbefYVP7r7NAjck27fF/Lgn/wSRzXrF/Incrx1x7NKLtbg59dD
         OVeE5JkCaObUHpRY2KyWK2L48jnWXJEw77DjhYRiIZrbKzHbNBQxN4T508apV89q9hrQ
         OcVA==
X-Gm-Message-State: AC+VfDy8C/229K3nMeM2So+2SMpAI0AKSul6Wn3rBxIvm413i+vE7YXn
	wODERFdcVKnwoaPrvkmhAZyk16CoMjEhMr7yNLM=
X-Google-Smtp-Source: ACHHUZ7BBhLORWD4m+5oN9xiYbRt74+jV/FmGuRpjvo2BeFWX21fOG1hSjL27Xw3r7zAAFwOJTdHNA==
X-Received: by 2002:adf:fa42:0:b0:30a:d944:b765 with SMTP id y2-20020adffa42000000b0030ad944b765mr2436047wrr.15.1685641409659;
        Thu, 01 Jun 2023 10:43:29 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86: Add Kconfig option to require NX bit support
Date: Thu,  1 Jun 2023 18:43:27 +0100
Message-Id: <20230601174327.11401-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows replacing many instances of runtime checks with folded
constants. The patch asserts support for the NX bit in PTEs at boot time
and if so short-circuits cpu_has_nx to 1. This has several knock-on effects
that improve codegen:
  * _PAGE_NX matches _PAGE_NX_BIT, optimising the macro to a constant.
  * Many PAGE_HYPERVISOR_X are also folded into constants
  * A few if ( cpu_has_nx ) statements are optimised out

We save 2.5KiB off the text section and remove the runtime dependency for
applying NX, which hardens our security posture. The config option defaults
to OFF for compatibility with previous behaviour.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/arch/x86/Kconfig                  | 10 ++++++++++
 xen/arch/x86/boot/head.S              | 19 ++++++++++++++++---
 xen/arch/x86/boot/trampoline.S        |  3 ++-
 xen/arch/x86/efi/efi-boot.h           |  9 +++++++++
 xen/arch/x86/include/asm/cpufeature.h |  3 ++-
 5 files changed, 39 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 406445a358..0983915372 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -307,6 +307,16 @@ config MEM_SHARING
 	bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
 	depends on HVM
 
+config REQUIRE_NX_BIT
+	def_bool n
+	prompt "Require NX bit support"
+	---help---
+	  Makes Xen require NX bit support on page table entries. This
+	  allows the resulting code to have folded constants where
+	  otherwise branches are required, yielding a smaller binary as a
+	  result. Requiring NX trades compatibility with older CPUs for
+	  improvements in speed and code size.
+
 endmenu
 
 source "common/Kconfig"
diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 09bebf8635..8414266281 100644
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
+#if IS_ENABLED(CONFIG_REQUIRE_NX_BIT)
+no_nx_bit:
+        add     $sym_offs(.Lno_nx_bit_msg),%esi   # Error message
+        jmp     .Lget_vtb
+#endif
 .Lmb2_no_st:
         /*
          * Here we are on EFI platform. vga_text_buffer was zapped earlier
@@ -647,11 +653,18 @@ trampoline_setup:
         cpuid
 1:      mov     %edx, CPUINFO_FEATURE_OFFSET(X86_FEATURE_LM) + sym_esi(boot_cpu_data)
 
-        /* Check for NX. Adjust EFER setting if available. */
+        /*
+         * Check for NX:
+         *   - If Xen was compiled requiring it simply assert it's
+         *     supported. The trampoline already has the right constant.
+         *   - Otherwise, update the trampoline EFER mask accordingly.
+         */
         bt      $cpufeat_bit(X86_FEATURE_NX), %edx
-        jnc     1f
+        jnc     no_nx_bit
+#if !IS_ENABLED(CONFIG_REQUIRE_NX_BIT)
         orb     $EFER_NXE >> 8, 1 + sym_esi(trampoline_efer)
-1:
+no_nx_bit:
+#endif
 
         /* Check for availability of long mode. */
         bt      $cpufeat_bit(X86_FEATURE_LM),%edx
diff --git a/xen/arch/x86/boot/trampoline.S b/xen/arch/x86/boot/trampoline.S
index c6005fa33d..b964031085 100644
--- a/xen/arch/x86/boot/trampoline.S
+++ b/xen/arch/x86/boot/trampoline.S
@@ -147,7 +147,8 @@ GLOBAL(trampoline_misc_enable_off)
 
 /* EFER OR-mask for boot paths.  SCE conditional on PV support, NX added when available. */
 GLOBAL(trampoline_efer)
-        .long   EFER_LME | (EFER_SCE * IS_ENABLED(CONFIG_PV))
+        .long   EFER_LME | (EFER_SCE * IS_ENABLED(CONFIG_PV)) | \
+                (EFER_NXE * IS_ENABLED(CONFIG_REQUIRE_NX_BIT))
 
 GLOBAL(trampoline_xen_phys_start)
         .long   0
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index c94e53d139..641d6996c9 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -751,6 +751,15 @@ static void __init efi_arch_cpu(void)
     {
         caps[FEATURESET_e1d] = cpuid_edx(0x80000001);
 
+        /*
+         * This check purposefully doesn't use cpu_has_nx because
+         * cpu_has_nx bypasses the boot_cpu_data read if Xen was compiled
+         * with CONFIG_REQUIRE_NX_BIT
+         */
+        if ( IS_ENABLED(CONFIG_REQUIRE_NX_BIT) &&
+             !boot_cpu_has(X86_FEATURE_NX) )
+            blexit(L"This Xen build requires NX bit support");
+
         if ( cpu_has_nx )
             trampoline_efer |= EFER_NXE;
     }
diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index ace31e3b1f..166f480bbc 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -91,7 +91,8 @@ static inline bool boot_cpu_has(unsigned int feat)
 #define cpu_has_hypervisor      boot_cpu_has(X86_FEATURE_HYPERVISOR)
 
 /* CPUID level 0x80000001.edx */
-#define cpu_has_nx              boot_cpu_has(X86_FEATURE_NX)
+#define cpu_has_nx              (IS_ENABLED(CONFIG_REQUIRE_NX_BIT) || \
+                                 boot_cpu_has(X86_FEATURE_NX))
 #define cpu_has_page1gb         boot_cpu_has(X86_FEATURE_PAGE1GB)
 #define cpu_has_rdtscp          boot_cpu_has(X86_FEATURE_RDTSCP)
 #define cpu_has_3dnow_ext       boot_cpu_has(X86_FEATURE_3DNOWEXT)
-- 
2.34.1


