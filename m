Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C62CC8B29C
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 18:15:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173274.1498355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOJ7N-0004Pi-6y; Wed, 26 Nov 2025 17:15:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173274.1498355; Wed, 26 Nov 2025 17:15:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOJ7N-0004O1-2z; Wed, 26 Nov 2025 17:15:49 +0000
Received: by outflank-mailman (input) for mailman id 1173274;
 Wed, 26 Nov 2025 17:15:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+ZBX=6C=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vOJ7L-0003vq-7M
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 17:15:47 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c21311a-caeb-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 18:15:46 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-477a219dbcaso62500325e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 09:15:46 -0800 (PST)
Received: from localhost.localdomain (host-92-29-237-183.as13285.net.
 [92.29.237.183]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fa3592sm40370605f8f.21.2025.11.26.09.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Nov 2025 09:15:44 -0800 (PST)
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
X-Inumbo-ID: 8c21311a-caeb-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1764177346; x=1764782146; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ip84DOjD4cQt+cdz0xdh6gwO6w4ONZR8zS3FhMktakg=;
        b=JgiUwJ76s6q5buTxrn4/V9QrLvj0lGhgAGPHiNJRZIpnZ8KpdkRMS6CH1GzG2br1uA
         X2xxtlm0c6vi8jxFto3R1CXRhQWdGqHiluOONBgCWU5naNSxhzya0AcBQOcaUxEVPxoN
         0rEDH21w+xcTRyMyKXqh2QHFdfi2s4sRzpuN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764177346; x=1764782146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ip84DOjD4cQt+cdz0xdh6gwO6w4ONZR8zS3FhMktakg=;
        b=RyxiMrDoEQGDDUlWt0sIxg45G/cMVWsxgX2Mgs5YXrWatiPt6ERs9h+cpgCWdrQqSL
         BHgoyWoiRYQtNP+ElEnnxh5LGWgyu/hmT/WLWXQgU7G595EJkSOykLjUEVNFDBxMAkwg
         sSswdnlwdQLnUZE7VKJJ/9kTTY5lgr+PQ2NLhOcKIO0t22YCxER7NaWdvVMFU7t+PpcH
         EvE/Kt25tqExXbab9gTfyV2rqvL7yclnD+TIvHkULeqznht3AbPVdzewSlJs4yEDKxgR
         ifjNY4SH7xGYK3lB9vq6xnuIdT0sE0eQ15Gi4UMrviI+O0CRia/Z56fGWAEG0raIwskm
         iDkw==
X-Gm-Message-State: AOJu0YwgeyMY43f4a2XNFqxVaTJfb2TSsqTtvZw7k1WVQVypw1/3DAd0
	lCfrNQTC9/k/9Pf8f0KNgpsPLnEBEKKlaIg3Nu43fYVhy8KOhGVA+5ecsWzEvdQhASPYmgFAotB
	2JJoG
X-Gm-Gg: ASbGnctlp1rklAnVh3bWK1wtbauXX7/VxJBorsW58MlBQNlFUTU+X6q6A5UGVnymA0I
	JihXGNZcvNeqUOp51U6JEhYTDENUyLnAxgtLRGSa3ZLmYA/bnI1xjFwdMznnp/8X4jYZgPfqNFp
	WJlGHlKPLcbzUvGuhMQq4ehTGAU+13Fx2h46QXZcts6z01ZLtNbOsLNbB80ZHIyWyqrenwj20XC
	kxOirikNsmQl94KQAcTbiVVlR2XggN13nWoTVaRYcsCauCSYDB9HMGjDg4KdhqbRPxnMfVs7ckv
	z3+RYOC1fWBeJVCwZxhFahMig22IUu1X9b8eVVV7zSX/nmrq/01HYpSJd0OItlJwMPfwivGRDbN
	Z9Nj5o4PtRxae3za0lcp0ddxQqZ9BG4CNQ/LQWf9CvcaDJWPH8QbK18ay8rDi18dilaEwF35hnF
	rGt1AYCNvWFTZnPmJNgCrCLPybpmfqN2OHZRl/VnwyY5UHB1NwRkNzkWcM/6wdqQ==
X-Google-Smtp-Source: AGHT+IElM8AuIaz4uExKRPuzRn5jniyiPYBkXX2WrQQzcksee9FpBppZ8NhOPqV0czfBHidVuJJSYA==
X-Received: by 2002:a05:600c:1f85:b0:477:9c73:267f with SMTP id 5b1f17b1804b1-477c01ff629mr177076745e9.33.1764177345490;
        Wed, 26 Nov 2025 09:15:45 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 3/3] x86/amd: Drop the cpuid_mask_* command line options
Date: Wed, 26 Nov 2025 17:15:39 +0000
Message-Id: <20251126171539.890253-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251126171539.890253-1-andrew.cooper3@citrix.com>
References: <20251126171539.890253-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As noted in the command line documentation, these are both deprecated since
Xen 4.7 (2016), and are not fully effective on AMD CPUs starting from 2011.

Not realised at the time of writing the docs was that their use is also
incompatible with certain errata workarounds which edit the CPUID MSRs after
the levelling defaults are calculated.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 CHANGELOG.md                      |   4 ++
 docs/misc/xen-command-line.pandoc |  40 ------------
 xen/arch/x86/cpu/amd.c            | 104 ------------------------------
 xen/arch/x86/include/asm/amd.h    |  90 --------------------------
 4 files changed, 4 insertions(+), 234 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index adaad5ee8923..3aaf5986231c 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -11,6 +11,10 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 ### Added
 
 ### Removed
+ - On x86:
+   - The cpuid_mask_* command line options for legacy AMD CPUs.  These were
+     deprecated in Xen 4.7 and noted not to work correctly with AMD CPUs from
+     2011 onwards.
 
 ## [4.21.0](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.21.0) - 2025-11-19
 
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 34004ce282be..e92b6d55b556 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -587,46 +587,6 @@ applicable.  They can all be ignored.
     in its positive form to override Xen's default behaviour on these systems,
     and make the feature fully usable.
 
-### cpuid_mask_cpu
-> `= fam_0f_rev_[cdefg] | fam_10_rev_[bc] | fam_11_rev_b`
-
-> Applicability: AMD
-
-If none of the other **cpuid_mask_\*** options are given, Xen has a set of
-pre-configured masks to make the current processor appear to be
-family/revision specified.
-
-See below for general information on masking.
-
-**Warning: This option is not fully effective on Family 15h processors or
-later.**
-
-### cpuid_mask_ecx
-### cpuid_mask_edx
-### cpuid_mask_ext_ecx
-### cpuid_mask_ext_edx
-### cpuid_mask_l7s0_eax
-### cpuid_mask_l7s0_ebx
-### cpuid_mask_thermal_ecx
-### cpuid_mask_xsave_eax
-> `= <integer>`
-
-> Applicability: x86.  Default: `~0` (all bits set)
-
-The availability of these options are model specific.  Some processors don't
-support any of them, and no processor supports all of them.  Xen will ignore
-options on processors which are lacking support.
-
-These options can be used to alter the features visible via the `CPUID`
-instruction.  Settings applied here take effect globally, including for Xen
-and all guests.
-
-Note: Since Xen 4.7, it is no longer necessary to mask a host to create
-migration safety in heterogeneous scenarios.  All necessary CPUID settings
-should be provided in the VM configuration file.  Furthermore, it is
-recommended not to use this option, as doing so causes an unnecessary
-reduction of features at Xen's disposal to manage guests.
-
 ### cpuidle (x86)
 > `= <boolean>`
 
diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index a32e5fa208d5..2b5aa07a4a13 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -20,32 +20,6 @@
 
 #include "cpu.h"
 
-/*
- * Pre-canned values for overriding the CPUID features 
- * and extended features masks.
- *
- * Currently supported processors:
- * 
- * "fam_0f_rev_c"
- * "fam_0f_rev_d"
- * "fam_0f_rev_e"
- * "fam_0f_rev_f"
- * "fam_0f_rev_g"
- * "fam_10_rev_b"
- * "fam_10_rev_c"
- * "fam_11_rev_b"
- */
-static char __initdata opt_famrev[14];
-string_param("cpuid_mask_cpu", opt_famrev);
-
-static unsigned int __initdata opt_cpuid_mask_l7s0_eax = ~0u;
-integer_param("cpuid_mask_l7s0_eax", opt_cpuid_mask_l7s0_eax);
-static unsigned int __initdata opt_cpuid_mask_l7s0_ebx = ~0u;
-integer_param("cpuid_mask_l7s0_ebx", opt_cpuid_mask_l7s0_ebx);
-
-static unsigned int __initdata opt_cpuid_mask_thermal_ecx = ~0u;
-integer_param("cpuid_mask_thermal_ecx", opt_cpuid_mask_thermal_ecx);
-
 /* 1 = allow, 0 = don't allow guest creation, -1 = don't allow boot */
 int8_t __read_mostly opt_allow_unsafe;
 boolean_param("allow_unsafe", opt_allow_unsafe);
@@ -114,51 +88,6 @@ static void wrmsr_amd(unsigned int msr, uint64_t val)
 		     "d" (val >> 32), "D" (0x9c5a203a));
 }
 
-static const struct cpuidmask {
-	uint16_t fam;
-	char rev[2];
-	unsigned int ecx, edx, ext_ecx, ext_edx;
-} pre_canned[] __initconst = {
-#define CAN(fam, id, rev) { \
-		fam, #rev, \
-		AMD_FEATURES_##id##_REV_##rev##_ECX, \
-		AMD_FEATURES_##id##_REV_##rev##_EDX, \
-		AMD_EXTFEATURES_##id##_REV_##rev##_ECX, \
-		AMD_EXTFEATURES_##id##_REV_##rev##_EDX \
-	}
-#define CAN_FAM(fam, rev) CAN(0x##fam, FAM##fam##h, rev)
-#define CAN_K8(rev)       CAN(0x0f,    K8,          rev)
-	CAN_FAM(11, B),
-	CAN_FAM(10, C),
-	CAN_FAM(10, B),
-	CAN_K8(G),
-	CAN_K8(F),
-	CAN_K8(E),
-	CAN_K8(D),
-	CAN_K8(C)
-#undef CAN
-};
-
-static const struct cpuidmask *__init noinline get_cpuidmask(const char *opt)
-{
-	unsigned long fam;
-	char rev;
-	unsigned int i;
-
-	if (strncmp(opt, "fam_", 4))
-		return NULL;
-	fam = simple_strtoul(opt + 4, &opt, 16);
-	if (strncmp(opt, "_rev_", 5) || !opt[5] || opt[6])
-		return NULL;
-	rev = toupper(opt[5]);
-
-	for (i = 0; i < ARRAY_SIZE(pre_canned); ++i)
-		if (fam == pre_canned[i].fam && rev == *pre_canned[i].rev)
-			return &pre_canned[i];
-
-	return NULL;
-}
-
 /*
  * Sets caps in expected_levelling_cap, probes for the specified mask MSR, and
  * set caps in levelling_caps if it is found.  Processors prior to Fam 10h
@@ -295,8 +224,6 @@ static const typeof(ctxt_switch_masking) __initconst_cf_clobber __used csm =
  */
 static void __init noinline amd_init_levelling(void)
 {
-	const struct cpuidmask *m = NULL;
-
 	/*
 	 * If there's support for CpuidUserDis or CPUID faulting then
 	 * we can skip levelling because CPUID accesses are trapped anyway.
@@ -318,26 +245,11 @@ static void __init noinline amd_init_levelling(void)
 
 	probe_masking_msrs();
 
-	if (*opt_famrev != '\0') {
-		m = get_cpuidmask(opt_famrev);
-
-		if (!m)
-			printk("Invalid processor string: %s\n", opt_famrev);
-	}
-
 	if ((levelling_caps & LCAP_1cd) == LCAP_1cd) {
 		uint32_t ecx, edx, tmp;
 
 		cpuid(0x00000001, &tmp, &tmp, &ecx, &edx);
 
-		if (~(opt_cpuid_mask_ecx & opt_cpuid_mask_edx)) {
-			ecx &= opt_cpuid_mask_ecx;
-			edx &= opt_cpuid_mask_edx;
-		} else if (m) {
-			ecx &= m->ecx;
-			edx &= m->edx;
-		}
-
 		/* Fast-forward bits - Must be set. */
 		if (ecx & cpufeat_mask(X86_FEATURE_XSAVE))
 			ecx |= cpufeat_mask(X86_FEATURE_OSXSAVE);
@@ -351,14 +263,6 @@ static void __init noinline amd_init_levelling(void)
 
 		cpuid(0x80000001, &tmp, &tmp, &ecx, &edx);
 
-		if (~(opt_cpuid_mask_ext_ecx & opt_cpuid_mask_ext_edx)) {
-			ecx &= opt_cpuid_mask_ext_ecx;
-			edx &= opt_cpuid_mask_ext_edx;
-		} else if (m) {
-			ecx &= m->ext_ecx;
-			edx &= m->ext_edx;
-		}
-
 		/* Fast-forward bits - Must be set. */
 		edx |= cpufeat_mask(X86_FEATURE_APIC);
 
@@ -370,20 +274,12 @@ static void __init noinline amd_init_levelling(void)
 
 		cpuid(0x00000007, &eax, &ebx, &tmp, &tmp);
 
-		if (~(opt_cpuid_mask_l7s0_eax & opt_cpuid_mask_l7s0_ebx)) {
-			eax &= opt_cpuid_mask_l7s0_eax;
-			ebx &= opt_cpuid_mask_l7s0_ebx;
-		}
-
 		cpuidmask_defaults._7ab0 &= ((uint64_t)eax << 32) | ebx;
 	}
 
 	if ((levelling_caps & LCAP_6c) == LCAP_6c) {
 		uint32_t ecx = cpuid_ecx(6);
 
-		if (~opt_cpuid_mask_thermal_ecx)
-			ecx &= opt_cpuid_mask_thermal_ecx;
-
 		cpuidmask_defaults._6c &= (~0ULL << 32) | ecx;
 	}
 
diff --git a/xen/arch/x86/include/asm/amd.h b/xen/arch/x86/include/asm/amd.h
index 72df42a6f6c9..4036dd549835 100644
--- a/xen/arch/x86/include/asm/amd.h
+++ b/xen/arch/x86/include/asm/amd.h
@@ -7,96 +7,6 @@
 
 #include <asm/cpufeature.h>
 
-/* CPUID masked for use by AMD-V Extended Migration */
-
-/* Family 0Fh, Revision C */
-#define AMD_FEATURES_K8_REV_C_ECX  0
-#define AMD_FEATURES_K8_REV_C_EDX (					     \
-	cpufeat_mask(X86_FEATURE_FPU)   | cpufeat_mask(X86_FEATURE_VME)    | \
-	cpufeat_mask(X86_FEATURE_DE)    | cpufeat_mask(X86_FEATURE_PSE)    | \
-	cpufeat_mask(X86_FEATURE_TSC)   | cpufeat_mask(X86_FEATURE_MSR)    | \
-	cpufeat_mask(X86_FEATURE_PAE)   | cpufeat_mask(X86_FEATURE_MCE)    | \
-	cpufeat_mask(X86_FEATURE_CX8)   | cpufeat_mask(X86_FEATURE_APIC)   | \
-	cpufeat_mask(X86_FEATURE_SEP)   | cpufeat_mask(X86_FEATURE_MTRR)   | \
-	cpufeat_mask(X86_FEATURE_PGE)   | cpufeat_mask(X86_FEATURE_MCA)    | \
-	cpufeat_mask(X86_FEATURE_CMOV)  | cpufeat_mask(X86_FEATURE_PAT)    | \
-	cpufeat_mask(X86_FEATURE_PSE36) | cpufeat_mask(X86_FEATURE_CLFLUSH)| \
-	cpufeat_mask(X86_FEATURE_MMX)   | cpufeat_mask(X86_FEATURE_FXSR)   | \
-	cpufeat_mask(X86_FEATURE_SSE)   | cpufeat_mask(X86_FEATURE_SSE2))
-#define AMD_EXTFEATURES_K8_REV_C_ECX  0
-#define AMD_EXTFEATURES_K8_REV_C_EDX  (					       \
-	cpufeat_mask(X86_FEATURE_FPU)	   | cpufeat_mask(X86_FEATURE_VME)   | \
-	cpufeat_mask(X86_FEATURE_DE)	   | cpufeat_mask(X86_FEATURE_PSE)   | \
-	cpufeat_mask(X86_FEATURE_TSC)	   | cpufeat_mask(X86_FEATURE_MSR)   | \
-	cpufeat_mask(X86_FEATURE_PAE)	   | cpufeat_mask(X86_FEATURE_MCE)   | \
-	cpufeat_mask(X86_FEATURE_CX8)	   | cpufeat_mask(X86_FEATURE_APIC)  | \
-	cpufeat_mask(X86_FEATURE_SYSCALL)  | cpufeat_mask(X86_FEATURE_MTRR)  | \
-	cpufeat_mask(X86_FEATURE_PGE)	   | cpufeat_mask(X86_FEATURE_MCA)   | \
-	cpufeat_mask(X86_FEATURE_CMOV)	   | cpufeat_mask(X86_FEATURE_PAT)   | \
-	cpufeat_mask(X86_FEATURE_PSE36)	   | cpufeat_mask(X86_FEATURE_NX)    | \
-	cpufeat_mask(X86_FEATURE_MMXEXT)   | cpufeat_mask(X86_FEATURE_MMX)   | \
-	cpufeat_mask(X86_FEATURE_FXSR)	   | cpufeat_mask(X86_FEATURE_LM)    | \
-	cpufeat_mask(X86_FEATURE_3DNOWEXT) | cpufeat_mask(X86_FEATURE_3DNOW))
-
-/* Family 0Fh, Revision D */
-#define AMD_FEATURES_K8_REV_D_ECX         AMD_FEATURES_K8_REV_C_ECX
-#define AMD_FEATURES_K8_REV_D_EDX         AMD_FEATURES_K8_REV_C_EDX
-#define AMD_EXTFEATURES_K8_REV_D_ECX     (AMD_EXTFEATURES_K8_REV_C_ECX |\
-	cpufeat_mask(X86_FEATURE_LAHF_LM))
-#define AMD_EXTFEATURES_K8_REV_D_EDX     (AMD_EXTFEATURES_K8_REV_C_EDX |\
-	cpufeat_mask(X86_FEATURE_FFXSR))
-
-/* Family 0Fh, Revision E */
-#define AMD_FEATURES_K8_REV_E_ECX        (AMD_FEATURES_K8_REV_D_ECX |	\
-	cpufeat_mask(X86_FEATURE_SSE3))
-#define AMD_FEATURES_K8_REV_E_EDX        (AMD_FEATURES_K8_REV_D_EDX | 	\
-	cpufeat_mask(X86_FEATURE_HTT))
-#define AMD_EXTFEATURES_K8_REV_E_ECX     (AMD_EXTFEATURES_K8_REV_D_ECX |\
-	cpufeat_mask(X86_FEATURE_CMP_LEGACY))
-#define AMD_EXTFEATURES_K8_REV_E_EDX      AMD_EXTFEATURES_K8_REV_D_EDX
-
-/* Family 0Fh, Revision F */
-#define AMD_FEATURES_K8_REV_F_ECX        (AMD_FEATURES_K8_REV_E_ECX | 	\
-	cpufeat_mask(X86_FEATURE_CX16))
-#define AMD_FEATURES_K8_REV_F_EDX         AMD_FEATURES_K8_REV_E_EDX
-#define AMD_EXTFEATURES_K8_REV_F_ECX     (AMD_EXTFEATURES_K8_REV_E_ECX |\
-	cpufeat_mask(X86_FEATURE_SVM) | cpufeat_mask(X86_FEATURE_EXTAPIC) | \
-	cpufeat_mask(X86_FEATURE_CR8_LEGACY))
-#define AMD_EXTFEATURES_K8_REV_F_EDX     (AMD_EXTFEATURES_K8_REV_E_EDX |\
-	cpufeat_mask(X86_FEATURE_RDTSCP))
-
-/* Family 0Fh, Revision G */
-#define AMD_FEATURES_K8_REV_G_ECX         AMD_FEATURES_K8_REV_F_ECX
-#define AMD_FEATURES_K8_REV_G_EDX         AMD_FEATURES_K8_REV_F_EDX
-#define AMD_EXTFEATURES_K8_REV_G_ECX     (AMD_EXTFEATURES_K8_REV_F_ECX |\
-	cpufeat_mask(X86_FEATURE_3DNOWPREFETCH))
-#define AMD_EXTFEATURES_K8_REV_G_EDX      AMD_EXTFEATURES_K8_REV_F_EDX
-
-/* Family 10h, Revision B */
-#define AMD_FEATURES_FAM10h_REV_B_ECX    (AMD_FEATURES_K8_REV_F_ECX | 	\
-	cpufeat_mask(X86_FEATURE_POPCNT) | cpufeat_mask(X86_FEATURE_MONITOR))
-#define AMD_FEATURES_FAM10h_REV_B_EDX     AMD_FEATURES_K8_REV_F_EDX
-#define AMD_EXTFEATURES_FAM10h_REV_B_ECX (AMD_EXTFEATURES_K8_REV_F_ECX |\
-	cpufeat_mask(X86_FEATURE_ABM) | cpufeat_mask(X86_FEATURE_SSE4A) | \
-	cpufeat_mask(X86_FEATURE_MISALIGNSSE) | cpufeat_mask(X86_FEATURE_OSVW) |\
-	cpufeat_mask(X86_FEATURE_IBS))
-#define AMD_EXTFEATURES_FAM10h_REV_B_EDX (AMD_EXTFEATURES_K8_REV_F_EDX |\
-	cpufeat_mask(X86_FEATURE_PAGE1GB))
-
-/* Family 10h, Revision C */
-#define AMD_FEATURES_FAM10h_REV_C_ECX     AMD_FEATURES_FAM10h_REV_B_ECX
-#define AMD_FEATURES_FAM10h_REV_C_EDX     AMD_FEATURES_FAM10h_REV_B_EDX
-#define AMD_EXTFEATURES_FAM10h_REV_C_ECX (AMD_EXTFEATURES_FAM10h_REV_B_ECX |\
-	cpufeat_mask(X86_FEATURE_SKINIT) | cpufeat_mask(X86_FEATURE_WDT))
-#define AMD_EXTFEATURES_FAM10h_REV_C_EDX  AMD_EXTFEATURES_FAM10h_REV_B_EDX
-
-/* Family 11h, Revision B */
-#define AMD_FEATURES_FAM11h_REV_B_ECX     AMD_FEATURES_K8_REV_G_ECX
-#define AMD_FEATURES_FAM11h_REV_B_EDX     AMD_FEATURES_K8_REV_G_EDX
-#define AMD_EXTFEATURES_FAM11h_REV_B_ECX (AMD_EXTFEATURES_K8_REV_G_ECX |\
-	cpufeat_mask(X86_FEATURE_SKINIT))
-#define AMD_EXTFEATURES_FAM11h_REV_B_EDX  AMD_EXTFEATURES_K8_REV_G_EDX
-
 /* AMD errata checking
  *
  * Errata are defined using the AMD_LEGACY_ERRATUM() or AMD_OSVW_ERRATUM()
-- 
2.39.5


