Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C0F74258F
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 14:17:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556812.869615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEqaT-0005KS-LD; Thu, 29 Jun 2023 12:17:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556812.869615; Thu, 29 Jun 2023 12:17:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEqaT-0005Hf-FE; Thu, 29 Jun 2023 12:17:25 +0000
Received: by outflank-mailman (input) for mailman id 556812;
 Thu, 29 Jun 2023 12:17:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4caF=CR=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qEqaR-0004fh-UE
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 12:17:23 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5ed28f2-1676-11ee-8611-37d641c3527e;
 Thu, 29 Jun 2023 14:17:21 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9928abc11deso79611466b.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jun 2023 05:17:21 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 c15-20020a170906528f00b0098866a94f14sm6773841ejm.125.2023.06.29.05.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jun 2023 05:17:20 -0700 (PDT)
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
X-Inumbo-ID: e5ed28f2-1676-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1688041041; x=1690633041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BzrdtU96n40B5f0Aax6fU5SmE6wgwpYc6Is6WaPAmEM=;
        b=OOTdQp+tu60q/YhuncmY1njlApzM15wUPRmmmUqJDfUajOpmtHLuzEkxAEwHxPm0DW
         +mhO17ZOeKKY5jGRbxPKJG4459IIrdDlxaQ++dFLHApuQxWI4MMtj+nQv9nXLpdeb+aN
         eTPUAPau5WGYZke0OjfRq8vS4eWIpn9TwgZ6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688041041; x=1690633041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BzrdtU96n40B5f0Aax6fU5SmE6wgwpYc6Is6WaPAmEM=;
        b=e+L9O3tXJoaXVfGMcIT+CV5QQ/neD7dXT98zGD8UHwb63V8ULpcFbDj+SOrHUrsoKD
         dYxW+cwZKHzAFALkea+/sQbxL6SJDePFsAL/65eHS36TnXQ/3r1dA7/ds0kbLSmA0P6j
         FAk/Eg4A722r7mvNlXsUDcZe48Qg0lkaDBDg4TpzUGjcUoKHrTwttvM747IMGrM4tGuf
         C1bTPIy1pODUnQyfHtbJdRGWYVIjCq3xiOjXOPf+upbcPnBo5QaD+Dwh3UaXcvCWzClc
         r45guyd1Sqdj/YK/eesLkNHygBiOV3CugVRoQfSWSJHJG8hPooOVpBD5DEwwkL10lcmF
         4YUA==
X-Gm-Message-State: AC+VfDwrjmZjBnj9zleNcKBgn3UkcCQcvbZAwUvtLEA4+TFB1pxhpYsX
	clpuW5x+yHvb1nfnAtnCgtbBHS7Sz00Na4hvSIA=
X-Google-Smtp-Source: ACHHUZ62hBOMhM4lRAjuzlrmK0IRmL5f342eqkwqJpAYDOw14d0gjM7ODQtbH6WX+mlGfa1OOwRkKQ==
X-Received: by 2002:a17:907:9309:b0:97e:aace:b6bc with SMTP id bu9-20020a170907930900b0097eaaceb6bcmr32766075ejc.53.1688041040890;
        Thu, 29 Jun 2023 05:17:20 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [PATCH v3 2/3] x86/boot: Clear XD_DISABLE from the early boot path
Date: Thu, 29 Jun 2023 13:17:12 +0100
Message-Id: <20230629121713.1211-3-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230629121713.1211-1-alejandro.vallejo@cloud.com>
References: <20230629121713.1211-1-alejandro.vallejo@cloud.com>
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

With that done, we can remove the XD_DISABLE checks in the intel-specific
init path (as they are already done in early assembly). Keep a printk to
highlight the fact that NX was forcefully enabled.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v3:
  * In head.S: s/has_nx/got_nx and s/nx_bit/nx
  * Style changes in assembly instructions (spaces + width modifiers)
  * Big comment in head.S replaced
  * Jump directly to .Lno_nx if NX not found and XD_DISABLE not present
  * Restored rdmsrl (previously refactored into rdmsr_safe() in v2) and
    removed XD_DISABLE clearing in C (as it's now done in head.S).
  * Moved printk in intel.c to highlight the XD_DISABLE override even when
    done in head.S
---
 xen/arch/x86/boot/head.S               | 49 ++++++++++++++++++++++----
 xen/arch/x86/cpu/intel.c               | 16 ++++-----
 xen/arch/x86/include/asm/msr-index.h   |  2 +-
 xen/arch/x86/include/asm/x86-vendors.h |  6 ++--
 4 files changed, 53 insertions(+), 20 deletions(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 9fbd602ea5..0e02c28f37 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -652,16 +652,53 @@ trampoline_setup:
         cpuid
 1:      mov     %edx, CPUINFO_FEATURE_OFFSET(X86_FEATURE_LM) + sym_esi(boot_cpu_data)
 
-        /* Check for NX. Adjust EFER setting if available. */
-        bt      $cpufeat_bit(X86_FEATURE_NX), %edx
-        jnc     1f
-        orb     $EFER_NXE >> 8, 1 + sym_esi(trampoline_efer)
-1:
-
         /* Check for availability of long mode. */
         bt      $cpufeat_bit(X86_FEATURE_LM),%edx
         jnc     .Lbad_cpu
 
+        /* Check for NX */
+        bt      $cpufeat_bit(X86_FEATURE_NX), %edx
+        jc     .Lgot_nx
+
+        /*
+         * NX appears to be unsupported, but it might be hidden.
+         *
+         * The feature is part of the AMD64 spec, but the very first Intel
+         * 64bit CPUs lacked the feature, and thereafter there was a
+         * firmware knob to disable the feature. Undo the disable if
+         * possible.
+         *
+         * All 64bit Intel CPUs support this MSR. If virtualised, expect
+         * the hypervisor to either emulate the MSR or give us NX.
+         */
+        xor     %eax, %eax
+        cpuid
+        cmp     $X86_VENDOR_INTEL_EBX, %ebx
+        jnz     .Lno_nx
+        cmp     $X86_VENDOR_INTEL_EDX, %edx
+        jnz     .Lno_nx
+        cmp     $X86_VENDOR_INTEL_ECX, %ecx
+        jnz     .Lno_nx
+
+        /* Clear the XD_DISABLE bit */
+        mov    $MSR_IA32_MISC_ENABLE, %ecx
+        rdmsr
+        btr     $2, %edx
+        jnc     .Lno_nx
+        wrmsr
+        orb     $MSR_IA32_MISC_ENABLE_XD_DISABLE >> 32, 4 + sym_esi(trampoline_misc_enable_off)
+
+        /* Check again for NX */
+        mov     $0x80000001, %eax
+        cpuid
+        bt      $cpufeat_bit(X86_FEATURE_NX), %edx
+        jnc     .Lno_nx
+
+.Lgot_nx:
+        /* Adjust EFER given that NX is present */
+        orb     $EFER_NXE >> 8, 1 + sym_esi(trampoline_efer)
+.Lno_nx:
+
         /* Stash TSC to calculate a good approximation of time-since-boot */
         rdtsc
         mov     %eax,     sym_esi(boot_tsc_stamp)
diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index 168cd58f36..b2443b6831 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -304,24 +304,20 @@ static void cf_check early_init_intel(struct cpuinfo_x86 *c)
 	if (c->x86 == 15 && c->x86_cache_alignment == 64)
 		c->x86_cache_alignment = 128;
 
+	if (bootsym(trampoline_misc_enable_off) &
+	    MSR_IA32_MISC_ENABLE_XD_DISABLE)
+		printk(KERN_INFO
+		       "re-enabled NX (Execute Disable) protection\n");
+
 	/* Unmask CPUID levels and NX if masked: */
 	rdmsrl(MSR_IA32_MISC_ENABLE, misc_enable);
 
-	disable = misc_enable & (MSR_IA32_MISC_ENABLE_LIMIT_CPUID |
-				 MSR_IA32_MISC_ENABLE_XD_DISABLE);
+	disable = misc_enable & MSR_IA32_MISC_ENABLE_LIMIT_CPUID;
 	if (disable) {
 		wrmsrl(MSR_IA32_MISC_ENABLE, misc_enable & ~disable);
 		bootsym(trampoline_misc_enable_off) |= disable;
-		bootsym(trampoline_efer) |= EFER_NXE;
-	}
-
-	if (disable & MSR_IA32_MISC_ENABLE_LIMIT_CPUID)
 		printk(KERN_INFO "revised cpuid level: %d\n",
 		       cpuid_eax(0));
-	if (disable & MSR_IA32_MISC_ENABLE_XD_DISABLE) {
-		write_efer(read_efer() | EFER_NXE);
-		printk(KERN_INFO
-		       "re-enabled NX (Execute Disable) protection\n");
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
diff --git a/xen/arch/x86/include/asm/x86-vendors.h b/xen/arch/x86/include/asm/x86-vendors.h
index 0a37024cbd..9191da26d7 100644
--- a/xen/arch/x86/include/asm/x86-vendors.h
+++ b/xen/arch/x86/include/asm/x86-vendors.h
@@ -12,9 +12,9 @@
 #define X86_VENDOR_UNKNOWN 0
 
 #define X86_VENDOR_INTEL (1 << 0)
-#define X86_VENDOR_INTEL_EBX 0x756e6547U /* "GenuineIntel" */
-#define X86_VENDOR_INTEL_ECX 0x6c65746eU
-#define X86_VENDOR_INTEL_EDX 0x49656e69U
+#define X86_VENDOR_INTEL_EBX _AC(0x756e6547, U) /* "GenuineIntel" */
+#define X86_VENDOR_INTEL_ECX _AC(0x6c65746e, U)
+#define X86_VENDOR_INTEL_EDX _AC(0x49656e69, U)
 
 #define X86_VENDOR_AMD (1 << 1)
 #define X86_VENDOR_AMD_EBX 0x68747541U /* "AuthenticAMD" */
-- 
2.34.1


