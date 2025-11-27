Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 019DEC8F80D
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 17:26:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174212.1499175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOeoK-00076l-KX; Thu, 27 Nov 2025 16:25:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174212.1499175; Thu, 27 Nov 2025 16:25:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOeoK-00074Q-Gg; Thu, 27 Nov 2025 16:25:36 +0000
Received: by outflank-mailman (input) for mailman id 1174212;
 Thu, 27 Nov 2025 16:25:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BG9e=6D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vOeoJ-00074H-FW
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 16:25:35 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2afd8fd-cbad-11f0-9d18-b5c5bf9af7f9;
 Thu, 27 Nov 2025 17:25:33 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b735b89501fso132483766b.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Nov 2025 08:25:33 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64751062261sm2326689a12.33.2025.11.27.08.25.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Nov 2025 08:25:32 -0800 (PST)
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
X-Inumbo-ID: b2afd8fd-cbad-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764260733; x=1764865533; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YL4YJzeUbKSp/fM7Qb8cgUUaRB2L9EqJ0O+LEsNjJk0=;
        b=DYeghTcDTtoX+pWJVWCvdSLzi2I2Iq9yE92+oabkKACB9l793l72ofgaP5nDxnic+L
         Zio8NAGp3AUbtVRUUE1fgPyhai4oylNiiUTA6MV2uzdWiKDxTYSRu5Clx/9e0fmClCGZ
         St3jnlTVLhXIvRFIb7f7rwfQei8IojOOVk+t/+CMwwbdMa4QojycrbmprW86/mEpT3rU
         2PxRTVnI2a0zZ5o4VsvXEyqMO1Aho/r1AKEyePRrzRde2rVj2v5NEFXxujU7q3IrzPw5
         kqwMbkptmtoKGFxWVnpOueYvCd+y6H1+HjgrEmCyam9nEvDgxdZMnLMzI/j9PLiYkKYZ
         n/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764260733; x=1764865533;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YL4YJzeUbKSp/fM7Qb8cgUUaRB2L9EqJ0O+LEsNjJk0=;
        b=n4xtHF8WYxYAKMccQb4z3VF0t8VW9gQcPk7c1I4i/FU70lnHX27+BzJn7FMslI//Gq
         e/2h2grc+Lr9BKPqXWofS+jcMkiatKj0jb76EqZ6oz37a/qC39b47W2V50jpJvvNC1FU
         e3UuaoefVX8u/RI8hpD9IOXv3g97ey9Qj6nw4jFSL9SzQoLiHeD2dXsVraadaAsFeFTA
         6O3Z7E3Mza0nmHbx8QbfMnO9kQT2/znF+CcMzvFJ+fyHtIHKjiadYNd39s0kiPl//Rs+
         UhqPULnHnDpEe4V44eD7dzwCtsiEP50wojjLumWyXa6JcgnSv2k7GUnt0IGUVu1EXeIx
         58Dw==
X-Forwarded-Encrypted: i=1; AJvYcCXxPWdbwSvdyYxWSqDBY1JYwXMzn6SyV0/Y5PlcPS/yKsOwfnmmK6ddwTyHKeajSvt9tnP7jluBa2I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxmnzYsRFbo+Or9YBVpX4fc7EIIcQPrSuwLNl81E/W9IR/nGVlo
	wTV9szMrHaYahOmUYf3IUA4QF6ttoa3lihhuZycVkMgD4y4uSIzqDikp
X-Gm-Gg: ASbGncu+7nDdN237asHCq8L0MAqLg1Hfz+FkTXmwKpJNvnqsc4VhRyTWncLyyXrVdd7
	83Nq1VQFX2rT95Eo3/+HHkEGAva1Evk0vO+Xb9wofYy1py3evbIZ4yQ0NWAXRYHkuw3WGUtlGLH
	CaO1s5dlO5nAZMQBWH3UoVHrbgqjmu1an+fnxkVd/SwOgGBAKQ06kBRX4xSMc/s8xMY59PUQOEo
	/L9GX8Iocxx14/k5Lv9hgEieqaaMJ6nhhgzjdx3d74tiFTQ/E1KbrMi1pAv/UP2+/l3VnxcJ4u9
	h22frC4coIOZluTKcTLaqR4DARqyAN9JnvQ0vYb4htGtLMcIIFZ6yebvbPopqy3vAhXnKbIOtOp
	t+NO4pft9bvB5HwDcTQ057kPwn/sOJWYXuqSV82k/ZX+m6QHzk72MmfSUw7kF86s+0z621zWXiq
	YbufmjIYh71H+p9BtLQ6qNXIgZdVD+Qhl2t5j3Fyx2+sBvvO+qjXftzNw1YWDpTOKsQcWA4IYMf
	Hg=
X-Google-Smtp-Source: AGHT+IG+j7q6EQ1TcULlnISzMxTGQYINabb8NmlkaNAiZXc2jmtsD9XlGdqCnwTtYAAFyv+nFgbNLw==
X-Received: by 2002:a17:907:94c1:b0:b72:de4f:cea6 with SMTP id a640c23a62f3a-b76c555e67cmr1314143966b.48.1764260732656;
        Thu, 27 Nov 2025 08:25:32 -0800 (PST)
Message-ID: <2671e43a-a9f0-42cd-8764-4274c14a86ec@gmail.com>
Date: Thu, 27 Nov 2025 17:25:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] x86/amd: Drop the cpuid_mask_* command line options
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20251126171539.890253-1-andrew.cooper3@citrix.com>
 <20251126171539.890253-4-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20251126171539.890253-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/26/25 6:15 PM, Andrew Cooper wrote:
> As noted in the command line documentation, these are both deprecated since
> Xen 4.7 (2016), and are not fully effective on AMD CPUs starting from 2011.
>
> Not realised at the time of writing the docs was that their use is also
> incompatible with certain errata workarounds which edit the CPUID MSRs after
> the levelling defaults are calculated.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>   CHANGELOG.md                      |   4 ++

for CHANGELOG.md:

Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii



>   docs/misc/xen-command-line.pandoc |  40 ------------
>   xen/arch/x86/cpu/amd.c            | 104 ------------------------------
>   xen/arch/x86/include/asm/amd.h    |  90 --------------------------
>   4 files changed, 4 insertions(+), 234 deletions(-)
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index adaad5ee8923..3aaf5986231c 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -11,6 +11,10 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   ### Added
>   
>   ### Removed
> + - On x86:
> +   - The cpuid_mask_* command line options for legacy AMD CPUs.  These were
> +     deprecated in Xen 4.7 and noted not to work correctly with AMD CPUs from
> +     2011 onwards.
>   
>   ## [4.21.0](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.21.0) - 2025-11-19
>   
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index 34004ce282be..e92b6d55b556 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -587,46 +587,6 @@ applicable.  They can all be ignored.
>       in its positive form to override Xen's default behaviour on these systems,
>       and make the feature fully usable.
>   
> -### cpuid_mask_cpu
> -> `= fam_0f_rev_[cdefg] | fam_10_rev_[bc] | fam_11_rev_b`
> -
> -> Applicability: AMD
> -
> -If none of the other **cpuid_mask_\*** options are given, Xen has a set of
> -pre-configured masks to make the current processor appear to be
> -family/revision specified.
> -
> -See below for general information on masking.
> -
> -**Warning: This option is not fully effective on Family 15h processors or
> -later.**
> -
> -### cpuid_mask_ecx
> -### cpuid_mask_edx
> -### cpuid_mask_ext_ecx
> -### cpuid_mask_ext_edx
> -### cpuid_mask_l7s0_eax
> -### cpuid_mask_l7s0_ebx
> -### cpuid_mask_thermal_ecx
> -### cpuid_mask_xsave_eax
> -> `= <integer>`
> -
> -> Applicability: x86.  Default: `~0` (all bits set)
> -
> -The availability of these options are model specific.  Some processors don't
> -support any of them, and no processor supports all of them.  Xen will ignore
> -options on processors which are lacking support.
> -
> -These options can be used to alter the features visible via the `CPUID`
> -instruction.  Settings applied here take effect globally, including for Xen
> -and all guests.
> -
> -Note: Since Xen 4.7, it is no longer necessary to mask a host to create
> -migration safety in heterogeneous scenarios.  All necessary CPUID settings
> -should be provided in the VM configuration file.  Furthermore, it is
> -recommended not to use this option, as doing so causes an unnecessary
> -reduction of features at Xen's disposal to manage guests.
> -
>   ### cpuidle (x86)
>   > `= <boolean>`
>   
> diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
> index a32e5fa208d5..2b5aa07a4a13 100644
> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -20,32 +20,6 @@
>   
>   #include "cpu.h"
>   
> -/*
> - * Pre-canned values for overriding the CPUID features
> - * and extended features masks.
> - *
> - * Currently supported processors:
> - *
> - * "fam_0f_rev_c"
> - * "fam_0f_rev_d"
> - * "fam_0f_rev_e"
> - * "fam_0f_rev_f"
> - * "fam_0f_rev_g"
> - * "fam_10_rev_b"
> - * "fam_10_rev_c"
> - * "fam_11_rev_b"
> - */
> -static char __initdata opt_famrev[14];
> -string_param("cpuid_mask_cpu", opt_famrev);
> -
> -static unsigned int __initdata opt_cpuid_mask_l7s0_eax = ~0u;
> -integer_param("cpuid_mask_l7s0_eax", opt_cpuid_mask_l7s0_eax);
> -static unsigned int __initdata opt_cpuid_mask_l7s0_ebx = ~0u;
> -integer_param("cpuid_mask_l7s0_ebx", opt_cpuid_mask_l7s0_ebx);
> -
> -static unsigned int __initdata opt_cpuid_mask_thermal_ecx = ~0u;
> -integer_param("cpuid_mask_thermal_ecx", opt_cpuid_mask_thermal_ecx);
> -
>   /* 1 = allow, 0 = don't allow guest creation, -1 = don't allow boot */
>   int8_t __read_mostly opt_allow_unsafe;
>   boolean_param("allow_unsafe", opt_allow_unsafe);
> @@ -114,51 +88,6 @@ static void wrmsr_amd(unsigned int msr, uint64_t val)
>   		     "d" (val >> 32), "D" (0x9c5a203a));
>   }
>   
> -static const struct cpuidmask {
> -	uint16_t fam;
> -	char rev[2];
> -	unsigned int ecx, edx, ext_ecx, ext_edx;
> -} pre_canned[] __initconst = {
> -#define CAN(fam, id, rev) { \
> -		fam, #rev, \
> -		AMD_FEATURES_##id##_REV_##rev##_ECX, \
> -		AMD_FEATURES_##id##_REV_##rev##_EDX, \
> -		AMD_EXTFEATURES_##id##_REV_##rev##_ECX, \
> -		AMD_EXTFEATURES_##id##_REV_##rev##_EDX \
> -	}
> -#define CAN_FAM(fam, rev) CAN(0x##fam, FAM##fam##h, rev)
> -#define CAN_K8(rev)       CAN(0x0f,    K8,          rev)
> -	CAN_FAM(11, B),
> -	CAN_FAM(10, C),
> -	CAN_FAM(10, B),
> -	CAN_K8(G),
> -	CAN_K8(F),
> -	CAN_K8(E),
> -	CAN_K8(D),
> -	CAN_K8(C)
> -#undef CAN
> -};
> -
> -static const struct cpuidmask *__init noinline get_cpuidmask(const char *opt)
> -{
> -	unsigned long fam;
> -	char rev;
> -	unsigned int i;
> -
> -	if (strncmp(opt, "fam_", 4))
> -		return NULL;
> -	fam = simple_strtoul(opt + 4, &opt, 16);
> -	if (strncmp(opt, "_rev_", 5) || !opt[5] || opt[6])
> -		return NULL;
> -	rev = toupper(opt[5]);
> -
> -	for (i = 0; i < ARRAY_SIZE(pre_canned); ++i)
> -		if (fam == pre_canned[i].fam && rev == *pre_canned[i].rev)
> -			return &pre_canned[i];
> -
> -	return NULL;
> -}
> -
>   /*
>    * Sets caps in expected_levelling_cap, probes for the specified mask MSR, and
>    * set caps in levelling_caps if it is found.  Processors prior to Fam 10h
> @@ -295,8 +224,6 @@ static const typeof(ctxt_switch_masking) __initconst_cf_clobber __used csm =
>    */
>   static void __init noinline amd_init_levelling(void)
>   {
> -	const struct cpuidmask *m = NULL;
> -
>   	/*
>   	 * If there's support for CpuidUserDis or CPUID faulting then
>   	 * we can skip levelling because CPUID accesses are trapped anyway.
> @@ -318,26 +245,11 @@ static void __init noinline amd_init_levelling(void)
>   
>   	probe_masking_msrs();
>   
> -	if (*opt_famrev != '\0') {
> -		m = get_cpuidmask(opt_famrev);
> -
> -		if (!m)
> -			printk("Invalid processor string: %s\n", opt_famrev);
> -	}
> -
>   	if ((levelling_caps & LCAP_1cd) == LCAP_1cd) {
>   		uint32_t ecx, edx, tmp;
>   
>   		cpuid(0x00000001, &tmp, &tmp, &ecx, &edx);
>   
> -		if (~(opt_cpuid_mask_ecx & opt_cpuid_mask_edx)) {
> -			ecx &= opt_cpuid_mask_ecx;
> -			edx &= opt_cpuid_mask_edx;
> -		} else if (m) {
> -			ecx &= m->ecx;
> -			edx &= m->edx;
> -		}
> -
>   		/* Fast-forward bits - Must be set. */
>   		if (ecx & cpufeat_mask(X86_FEATURE_XSAVE))
>   			ecx |= cpufeat_mask(X86_FEATURE_OSXSAVE);
> @@ -351,14 +263,6 @@ static void __init noinline amd_init_levelling(void)
>   
>   		cpuid(0x80000001, &tmp, &tmp, &ecx, &edx);
>   
> -		if (~(opt_cpuid_mask_ext_ecx & opt_cpuid_mask_ext_edx)) {
> -			ecx &= opt_cpuid_mask_ext_ecx;
> -			edx &= opt_cpuid_mask_ext_edx;
> -		} else if (m) {
> -			ecx &= m->ext_ecx;
> -			edx &= m->ext_edx;
> -		}
> -
>   		/* Fast-forward bits - Must be set. */
>   		edx |= cpufeat_mask(X86_FEATURE_APIC);
>   
> @@ -370,20 +274,12 @@ static void __init noinline amd_init_levelling(void)
>   
>   		cpuid(0x00000007, &eax, &ebx, &tmp, &tmp);
>   
> -		if (~(opt_cpuid_mask_l7s0_eax & opt_cpuid_mask_l7s0_ebx)) {
> -			eax &= opt_cpuid_mask_l7s0_eax;
> -			ebx &= opt_cpuid_mask_l7s0_ebx;
> -		}
> -
>   		cpuidmask_defaults._7ab0 &= ((uint64_t)eax << 32) | ebx;
>   	}
>   
>   	if ((levelling_caps & LCAP_6c) == LCAP_6c) {
>   		uint32_t ecx = cpuid_ecx(6);
>   
> -		if (~opt_cpuid_mask_thermal_ecx)
> -			ecx &= opt_cpuid_mask_thermal_ecx;
> -
>   		cpuidmask_defaults._6c &= (~0ULL << 32) | ecx;
>   	}
>   
> diff --git a/xen/arch/x86/include/asm/amd.h b/xen/arch/x86/include/asm/amd.h
> index 72df42a6f6c9..4036dd549835 100644
> --- a/xen/arch/x86/include/asm/amd.h
> +++ b/xen/arch/x86/include/asm/amd.h
> @@ -7,96 +7,6 @@
>   
>   #include <asm/cpufeature.h>
>   
> -/* CPUID masked for use by AMD-V Extended Migration */
> -
> -/* Family 0Fh, Revision C */
> -#define AMD_FEATURES_K8_REV_C_ECX  0
> -#define AMD_FEATURES_K8_REV_C_EDX (					     \
> -	cpufeat_mask(X86_FEATURE_FPU)   | cpufeat_mask(X86_FEATURE_VME)    | \
> -	cpufeat_mask(X86_FEATURE_DE)    | cpufeat_mask(X86_FEATURE_PSE)    | \
> -	cpufeat_mask(X86_FEATURE_TSC)   | cpufeat_mask(X86_FEATURE_MSR)    | \
> -	cpufeat_mask(X86_FEATURE_PAE)   | cpufeat_mask(X86_FEATURE_MCE)    | \
> -	cpufeat_mask(X86_FEATURE_CX8)   | cpufeat_mask(X86_FEATURE_APIC)   | \
> -	cpufeat_mask(X86_FEATURE_SEP)   | cpufeat_mask(X86_FEATURE_MTRR)   | \
> -	cpufeat_mask(X86_FEATURE_PGE)   | cpufeat_mask(X86_FEATURE_MCA)    | \
> -	cpufeat_mask(X86_FEATURE_CMOV)  | cpufeat_mask(X86_FEATURE_PAT)    | \
> -	cpufeat_mask(X86_FEATURE_PSE36) | cpufeat_mask(X86_FEATURE_CLFLUSH)| \
> -	cpufeat_mask(X86_FEATURE_MMX)   | cpufeat_mask(X86_FEATURE_FXSR)   | \
> -	cpufeat_mask(X86_FEATURE_SSE)   | cpufeat_mask(X86_FEATURE_SSE2))
> -#define AMD_EXTFEATURES_K8_REV_C_ECX  0
> -#define AMD_EXTFEATURES_K8_REV_C_EDX  (					       \
> -	cpufeat_mask(X86_FEATURE_FPU)	   | cpufeat_mask(X86_FEATURE_VME)   | \
> -	cpufeat_mask(X86_FEATURE_DE)	   | cpufeat_mask(X86_FEATURE_PSE)   | \
> -	cpufeat_mask(X86_FEATURE_TSC)	   | cpufeat_mask(X86_FEATURE_MSR)   | \
> -	cpufeat_mask(X86_FEATURE_PAE)	   | cpufeat_mask(X86_FEATURE_MCE)   | \
> -	cpufeat_mask(X86_FEATURE_CX8)	   | cpufeat_mask(X86_FEATURE_APIC)  | \
> -	cpufeat_mask(X86_FEATURE_SYSCALL)  | cpufeat_mask(X86_FEATURE_MTRR)  | \
> -	cpufeat_mask(X86_FEATURE_PGE)	   | cpufeat_mask(X86_FEATURE_MCA)   | \
> -	cpufeat_mask(X86_FEATURE_CMOV)	   | cpufeat_mask(X86_FEATURE_PAT)   | \
> -	cpufeat_mask(X86_FEATURE_PSE36)	   | cpufeat_mask(X86_FEATURE_NX)    | \
> -	cpufeat_mask(X86_FEATURE_MMXEXT)   | cpufeat_mask(X86_FEATURE_MMX)   | \
> -	cpufeat_mask(X86_FEATURE_FXSR)	   | cpufeat_mask(X86_FEATURE_LM)    | \
> -	cpufeat_mask(X86_FEATURE_3DNOWEXT) | cpufeat_mask(X86_FEATURE_3DNOW))
> -
> -/* Family 0Fh, Revision D */
> -#define AMD_FEATURES_K8_REV_D_ECX         AMD_FEATURES_K8_REV_C_ECX
> -#define AMD_FEATURES_K8_REV_D_EDX         AMD_FEATURES_K8_REV_C_EDX
> -#define AMD_EXTFEATURES_K8_REV_D_ECX     (AMD_EXTFEATURES_K8_REV_C_ECX |\
> -	cpufeat_mask(X86_FEATURE_LAHF_LM))
> -#define AMD_EXTFEATURES_K8_REV_D_EDX     (AMD_EXTFEATURES_K8_REV_C_EDX |\
> -	cpufeat_mask(X86_FEATURE_FFXSR))
> -
> -/* Family 0Fh, Revision E */
> -#define AMD_FEATURES_K8_REV_E_ECX        (AMD_FEATURES_K8_REV_D_ECX |	\
> -	cpufeat_mask(X86_FEATURE_SSE3))
> -#define AMD_FEATURES_K8_REV_E_EDX        (AMD_FEATURES_K8_REV_D_EDX | 	\
> -	cpufeat_mask(X86_FEATURE_HTT))
> -#define AMD_EXTFEATURES_K8_REV_E_ECX     (AMD_EXTFEATURES_K8_REV_D_ECX |\
> -	cpufeat_mask(X86_FEATURE_CMP_LEGACY))
> -#define AMD_EXTFEATURES_K8_REV_E_EDX      AMD_EXTFEATURES_K8_REV_D_EDX
> -
> -/* Family 0Fh, Revision F */
> -#define AMD_FEATURES_K8_REV_F_ECX        (AMD_FEATURES_K8_REV_E_ECX | 	\
> -	cpufeat_mask(X86_FEATURE_CX16))
> -#define AMD_FEATURES_K8_REV_F_EDX         AMD_FEATURES_K8_REV_E_EDX
> -#define AMD_EXTFEATURES_K8_REV_F_ECX     (AMD_EXTFEATURES_K8_REV_E_ECX |\
> -	cpufeat_mask(X86_FEATURE_SVM) | cpufeat_mask(X86_FEATURE_EXTAPIC) | \
> -	cpufeat_mask(X86_FEATURE_CR8_LEGACY))
> -#define AMD_EXTFEATURES_K8_REV_F_EDX     (AMD_EXTFEATURES_K8_REV_E_EDX |\
> -	cpufeat_mask(X86_FEATURE_RDTSCP))
> -
> -/* Family 0Fh, Revision G */
> -#define AMD_FEATURES_K8_REV_G_ECX         AMD_FEATURES_K8_REV_F_ECX
> -#define AMD_FEATURES_K8_REV_G_EDX         AMD_FEATURES_K8_REV_F_EDX
> -#define AMD_EXTFEATURES_K8_REV_G_ECX     (AMD_EXTFEATURES_K8_REV_F_ECX |\
> -	cpufeat_mask(X86_FEATURE_3DNOWPREFETCH))
> -#define AMD_EXTFEATURES_K8_REV_G_EDX      AMD_EXTFEATURES_K8_REV_F_EDX
> -
> -/* Family 10h, Revision B */
> -#define AMD_FEATURES_FAM10h_REV_B_ECX    (AMD_FEATURES_K8_REV_F_ECX | 	\
> -	cpufeat_mask(X86_FEATURE_POPCNT) | cpufeat_mask(X86_FEATURE_MONITOR))
> -#define AMD_FEATURES_FAM10h_REV_B_EDX     AMD_FEATURES_K8_REV_F_EDX
> -#define AMD_EXTFEATURES_FAM10h_REV_B_ECX (AMD_EXTFEATURES_K8_REV_F_ECX |\
> -	cpufeat_mask(X86_FEATURE_ABM) | cpufeat_mask(X86_FEATURE_SSE4A) | \
> -	cpufeat_mask(X86_FEATURE_MISALIGNSSE) | cpufeat_mask(X86_FEATURE_OSVW) |\
> -	cpufeat_mask(X86_FEATURE_IBS))
> -#define AMD_EXTFEATURES_FAM10h_REV_B_EDX (AMD_EXTFEATURES_K8_REV_F_EDX |\
> -	cpufeat_mask(X86_FEATURE_PAGE1GB))
> -
> -/* Family 10h, Revision C */
> -#define AMD_FEATURES_FAM10h_REV_C_ECX     AMD_FEATURES_FAM10h_REV_B_ECX
> -#define AMD_FEATURES_FAM10h_REV_C_EDX     AMD_FEATURES_FAM10h_REV_B_EDX
> -#define AMD_EXTFEATURES_FAM10h_REV_C_ECX (AMD_EXTFEATURES_FAM10h_REV_B_ECX |\
> -	cpufeat_mask(X86_FEATURE_SKINIT) | cpufeat_mask(X86_FEATURE_WDT))
> -#define AMD_EXTFEATURES_FAM10h_REV_C_EDX  AMD_EXTFEATURES_FAM10h_REV_B_EDX
> -
> -/* Family 11h, Revision B */
> -#define AMD_FEATURES_FAM11h_REV_B_ECX     AMD_FEATURES_K8_REV_G_ECX
> -#define AMD_FEATURES_FAM11h_REV_B_EDX     AMD_FEATURES_K8_REV_G_EDX
> -#define AMD_EXTFEATURES_FAM11h_REV_B_ECX (AMD_EXTFEATURES_K8_REV_G_ECX |\
> -	cpufeat_mask(X86_FEATURE_SKINIT))
> -#define AMD_EXTFEATURES_FAM11h_REV_B_EDX  AMD_EXTFEATURES_K8_REV_G_EDX
> -
>   /* AMD errata checking
>    *
>    * Errata are defined using the AMD_LEGACY_ERRATUM() or AMD_OSVW_ERRATUM()

