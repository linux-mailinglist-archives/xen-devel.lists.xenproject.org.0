Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36570731CC1
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 17:32:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549692.858363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9oxF-0003Cd-E8; Thu, 15 Jun 2023 15:32:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549692.858363; Thu, 15 Jun 2023 15:32:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9oxF-00039t-BL; Thu, 15 Jun 2023 15:32:09 +0000
Received: by outflank-mailman (input) for mailman id 549692;
 Thu, 15 Jun 2023 15:32:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IrMH=CD=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1q9oxD-00039m-A6
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 15:32:07 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7fb31f9-0b91-11ee-8611-37d641c3527e;
 Thu, 15 Jun 2023 17:32:05 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f8d17639feso21127155e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jun 2023 08:32:05 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 c12-20020a05600c0acc00b003f195d540d9sm20829986wmr.14.2023.06.15.08.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 08:32:03 -0700 (PDT)
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
X-Inumbo-ID: c7fb31f9-0b91-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1686843124; x=1689435124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VCA3Pf6f+/2jMpccddEtY1bpoEHdgMvPsL2NvMFA0ds=;
        b=eZdtVCr1JhpBPaxe9XBEMlAw+4qe7kNox3jZMl5eGgM89Ndr+4/PPxHNQi9KhHX5R4
         ShSIBE560xCNEfW0jXQhLyQz0Vwr3epY8ITcE6nzXqttZjVZw2u1V4fMkEm8AovjSqIG
         JakfoJq0rtTvOJzDDtWnsAgGvf1PYVFqQBvyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686843124; x=1689435124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VCA3Pf6f+/2jMpccddEtY1bpoEHdgMvPsL2NvMFA0ds=;
        b=fYZc1PCGb6rjdoHlpdjug+GxNLEKJpDTWCcW1LsL1Y8xRSajuyPOg9d+amHJQUh8YL
         4ZKAGhepJz3UgW7rjbg6Ftc0x6bHvdLf+bRQ+OsUjEgMtvYTwKqJab99QLnoA7DRE3x4
         7665DO1VXPmMrbC6BNqQTOQMfzuK1STViXfNz+uc7VEzphTnPVf9ysyCCiQoxaBlSofe
         s6yJQA3hM57XctUbSNlPrI2Yqm7eaX38lCI8LC93TSl5RqMHVwKg8dZHcWfHt3ZrIFaG
         SO5fNMljYKl54KIX71RfLi9BhNaf7GOxbr/8GNyKXw8dIlgTfOhtuDbc6Fgany5STs2m
         1vzw==
X-Gm-Message-State: AC+VfDz0o5yhjgmt9iwYA5/zTsziBoIhCwqyWESXR8BipyJL2KlQ55Zl
	NOUFTtc+Ets2HftnA0peOHhXbHcHGq+RcfoeNT8=
X-Google-Smtp-Source: ACHHUZ7j8Mg7a1iQPH7GpjiWhoddlxY/xWGWBScW/EqDDoh/y4Ts5y4CGQjbr9Had6L60tbnY5oPWQ==
X-Received: by 2002:a05:600c:2186:b0:3f7:2323:e012 with SMTP id e6-20020a05600c218600b003f72323e012mr14014139wme.5.1686843124127;
        Thu, 15 Jun 2023 08:32:04 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/2] x86/boot: Clear XD_DISABLE from the early boot path
Date: Thu, 15 Jun 2023 16:31:56 +0100
Message-Id: <20230615153157.444-2-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230615153157.444-1-alejandro.vallejo@cloud.com>
References: <20230615153157.444-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Intel CPUs have a bit in MSR_IA32_MISC_ENABLE that may prevent the NX bit
from being advertised. Clear it unconditionally if we can't find the NX
feature right away on boot.

The conditions for the MSR being read on early boot are (in this order):

* Long Mode is supported
* NX isn't advertised
* The vendor is Intel

The order of checks has been chosen carefully so a virtualized Xen on a
hypervisor that doesn't emulate that MSR (but supports NX) doesn't triple
fault trying to access the non-existing MSR.

While at it, make sure we use rdmsr_safe rather than rdmsrl in the
Intel-specific init path so we don't accidentally crash if the MSR isn't
emulated while Xen is virtualized.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/arch/x86/boot/head.S             | 60 ++++++++++++++++++++++++----
 xen/arch/x86/cpu/intel.c             | 32 +++++++--------
 xen/arch/x86/include/asm/msr-index.h |  2 +-
 3 files changed, 69 insertions(+), 25 deletions(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 09bebf8635..ce62eae6f3 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -142,8 +142,8 @@ efi_platform:
 
         .section .init.text, "ax", @progbits
 
-bad_cpu:
-        add     $sym_offs(.Lbad_cpu_msg),%esi   # Error message
+.Lbad_cpu:
+        add     $sym_offs(.Lbad_cpu_msg),%esi
         jmp     .Lget_vtb
 not_multiboot:
         add     $sym_offs(.Lbad_ldr_msg),%esi   # Error message
@@ -647,15 +647,59 @@ trampoline_setup:
         cpuid
 1:      mov     %edx, CPUINFO_FEATURE_OFFSET(X86_FEATURE_LM) + sym_esi(boot_cpu_data)
 
-        /* Check for NX. Adjust EFER setting if available. */
+        /* Check for availability of long mode. */
+        bt      $cpufeat_bit(X86_FEATURE_LM),%edx
+        jnc     .Lbad_cpu
+
+        /* Check for NX */
         bt      $cpufeat_bit(X86_FEATURE_NX), %edx
+        jc     .Lhas_nx_bit
+
+        /*
+         * NX appears to be unsupported, but it might be hidden.
+         *
+         * Intel CPUs (may) implement MSR_IA32_MISC_ENABLE. Among other
+         * things this MSR has a bit that artificially hides NX support in
+         * CPUID. Xen _really_ wants that feature enabled if present, so we
+         * have to determine if (a) the MSR exists and if so (b) clear the
+         * bit.
+         *
+         * For native boots this is perfectly fine because the MSR was
+         * introduced before Netburst, which was the first family to
+         * provide 64bit support. So we're safe simply accessing it as long
+         * as long mode support has already been checked.
+         *
+         * For the virtualized case the MSR might not be emulated though,
+         * so we make sure to do an initial check for NX in order to bypass
+         * this MSR read
+         */
+        xor     %eax,%eax
+        cpuid
+        cmpl    $X86_VENDOR_INTEL_EBX,%ebx
+        jnz     .Lno_nx_bit
+        cmpl    $X86_VENDOR_INTEL_EDX,%edx
+        jnz     .Lno_nx_bit
+        cmpl    $X86_VENDOR_INTEL_ECX,%ecx
+        jnz     .Lno_nx_bit
+
+        /* Clear the XD_DISABLE bit */
+        movl    $MSR_IA32_MISC_ENABLE, %ecx
+        rdmsr
+        btrl    $2, %edx
         jnc     1f
-        orb     $EFER_NXE >> 8, 1 + sym_esi(trampoline_efer)
-1:
+        wrmsr
+        orb     $MSR_IA32_MISC_ENABLE_XD_DISABLE >> 32, 4 + sym_esi(trampoline_misc_enable_off)
 
-        /* Check for availability of long mode. */
-        bt      $cpufeat_bit(X86_FEATURE_LM),%edx
-        jnc     bad_cpu
+1:      /* Check again for NX */
+        mov     $0x80000001,%eax
+        cpuid
+        bt      $cpufeat_bit(X86_FEATURE_NX), %edx
+        jnc     .Lno_nx_bit
+
+.Lhas_nx_bit:
+        /* Adjust EFER is NX is present */
+        orb     $EFER_NXE >> 8, 1 + sym_esi(trampoline_efer)
+.Lno_nx_bit:
 
         /* Stash TSC to calculate a good approximation of time-since-boot */
         rdtsc
diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index 168cd58f36..46b0cd8dbb 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -305,23 +305,23 @@ static void cf_check early_init_intel(struct cpuinfo_x86 *c)
 		c->x86_cache_alignment = 128;
 
 	/* Unmask CPUID levels and NX if masked: */
-	rdmsrl(MSR_IA32_MISC_ENABLE, misc_enable);
-
-	disable = misc_enable & (MSR_IA32_MISC_ENABLE_LIMIT_CPUID |
-				 MSR_IA32_MISC_ENABLE_XD_DISABLE);
-	if (disable) {
-		wrmsrl(MSR_IA32_MISC_ENABLE, misc_enable & ~disable);
-		bootsym(trampoline_misc_enable_off) |= disable;
-		bootsym(trampoline_efer) |= EFER_NXE;
-	}
+	if (rdmsr_safe(MSR_IA32_MISC_ENABLE, misc_enable) == 0) {
+		disable = misc_enable & (MSR_IA32_MISC_ENABLE_LIMIT_CPUID |
+					 MSR_IA32_MISC_ENABLE_XD_DISABLE);
+		if (disable) {
+			wrmsrl(MSR_IA32_MISC_ENABLE, misc_enable & ~disable);
+			bootsym(trampoline_misc_enable_off) |= disable;
+			bootsym(trampoline_efer) |= EFER_NXE;
+		}
 
-	if (disable & MSR_IA32_MISC_ENABLE_LIMIT_CPUID)
-		printk(KERN_INFO "revised cpuid level: %d\n",
-		       cpuid_eax(0));
-	if (disable & MSR_IA32_MISC_ENABLE_XD_DISABLE) {
-		write_efer(read_efer() | EFER_NXE);
-		printk(KERN_INFO
-		       "re-enabled NX (Execute Disable) protection\n");
+		if (disable & MSR_IA32_MISC_ENABLE_LIMIT_CPUID)
+			printk(KERN_INFO "revised cpuid level: %d\n",
+			       cpuid_eax(0));
+		if (disable & MSR_IA32_MISC_ENABLE_XD_DISABLE) {
+			write_efer(read_efer() | EFER_NXE);
+			printk(KERN_INFO
+			       "re-enabled NX (Execute Disable) protection\n");
+		}
 	}
 
 	/* CPUID workaround for Intel 0F33/0F34 CPU */
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 2749e433d2..4f861c0bb4 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -502,7 +502,7 @@
 #define MSR_IA32_MISC_ENABLE_MONITOR_ENABLE (1<<18)
 #define MSR_IA32_MISC_ENABLE_LIMIT_CPUID  (1<<22)
 #define MSR_IA32_MISC_ENABLE_XTPR_DISABLE (1<<23)
-#define MSR_IA32_MISC_ENABLE_XD_DISABLE	(1ULL << 34)
+#define MSR_IA32_MISC_ENABLE_XD_DISABLE   (_AC(1, ULL) << 34)
 
 #define MSR_IA32_TSC_DEADLINE		0x000006E0
 #define MSR_IA32_ENERGY_PERF_BIAS	0x000001b0
-- 
2.34.1


