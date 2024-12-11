Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE399ECA05
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 11:12:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854270.1267518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLJhD-0004Nt-A0; Wed, 11 Dec 2024 10:11:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854270.1267518; Wed, 11 Dec 2024 10:11:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLJhD-0004LD-6p; Wed, 11 Dec 2024 10:11:55 +0000
Received: by outflank-mailman (input) for mailman id 854270;
 Wed, 11 Dec 2024 10:11:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HaM=TE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLJhB-0003z3-P5
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 10:11:54 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53ce5ed7-b7a8-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 11:11:46 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-434a736518eso72550585e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 02:11:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725e67ec497sm6093103b3a.125.2024.12.11.02.11.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 02:11:49 -0800 (PST)
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
X-Inumbo-ID: 53ce5ed7-b7a8-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733911910; x=1734516710; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qZjwkU1zfDESdoMN4mfxEFe4CEUvDIL1q+y4iBCYT98=;
        b=KdN2bVHef7NAfewwsvC3q6vz/02EDCZshLk23Vtgsj1ByxrHA6mpMXk8rwHvKW8fuX
         BMZIX1CjYPf/h+9X8oajJvfEJiKcavqsBVLsdTyA+ngifWF4JBOT5Xj1l7vRn3iRndtZ
         A/U1hYXJPKYyLVd4HxESLO+lj0fnp0bXHgi3ouxj2geILgs0q93/Dck4YNfunY2ikgva
         tLK56HuRJOYld+nBCLOP0WSTO7pfOHeqhpEMdE5Tenm++vq4WAsb0ojtStUh4VbnsBT0
         zP5gOdQmHRANXnAZVsdtCnsdlx9EvfjzCT7bQpr9CGRjLORxmDwP6zlr9YscqZBkqrDt
         zHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733911910; x=1734516710;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qZjwkU1zfDESdoMN4mfxEFe4CEUvDIL1q+y4iBCYT98=;
        b=OnTLjMDnnt77Ch2aa0jNHsOjSB8HJJyzUpa9ys52CCrB98R9Rt6wcWiheNje2D90T3
         48soC4L6O0geYKlJ61RxM41BQ8+VadiVg9fTE1rl5e44g6yhbG5qYdMDdTKwcOiM/QiQ
         9DelmGA/Ur+sDLcew4gHh4oyenvyxVQXQZliaTzHrrkWq7UPgpYxKloSID0E0ny3x/D6
         atgOt1aBvRtVuH+eC3ggahv3rnyrT16iXcPxfNEjzADRhCyU8YjwA/AaKNNrZWz/MUoB
         7FKGohK5kzbszvdrz76HuAWiQi5yzW8ctxmWVA8zynWp9dl4sRztKas4QbsdwxIqJtg+
         3XRA==
X-Gm-Message-State: AOJu0YyEGMqb1u6aTTvPY1dkdCg0z4Ha1CG6xLsnO18lG4lGQKNTDrg8
	fowRpyHXYcPedk6mAls1AEID2DFFMXthKGfiNpNgnsMMfhNXX2eMZkj7hcLBaVzz73qdHYy7+6M
	=
X-Gm-Gg: ASbGncueAaWzcCWQ8IymcUnYPl3mQI1z+V8HY1XP4LH/r3Tvubtk/eBbYhk6LIXYCx1
	IBvOTXAz+WnBXrYGZ6gv02+V4qa04Z8nbUMCMQhU/Q8xLxBbaDThxrfIlWkiC0XE3tPiqVZTIw9
	UeAr+BXETnSDqXAN8MjGqxTqWBOCq2OGHqKyoQXzTJ9F9ThK2MiIB7oAXwBJMPE4B9+Ih2imama
	5EpLbXg57PQvmaEyCrTHhNrWU8832i8lI9juidwKTLh13I26Kv/d9R5a0PUsdzarlZYs7mtym2q
	3C2jhkTPmqSYQ1LQroMDn+9ruB7X/1cuYkDewgY=
X-Google-Smtp-Source: AGHT+IGzov3JM+76iGkVOVPnrySD2x8Umb9bZ43hO3YHGzCCM6SFVFHotA7HMpKq6U74eAJ2hUjDCQ==
X-Received: by 2002:a05:6000:1fae:b0:385:e88a:7037 with SMTP id ffacd0b85a97d-3864ce888a6mr1669008f8f.6.1733911910122;
        Wed, 11 Dec 2024 02:11:50 -0800 (PST)
Message-ID: <d1211eb7-3da0-43ab-a137-2c4b20cf8fa6@suse.com>
Date: Wed, 11 Dec 2024 11:11:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 02/16] x86emul: support AVX10.1
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <516b7f9a-048e-409d-8a4e-89aeb8ffacc4@suse.com>
Content-Language: en-US
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <516b7f9a-048e-409d-8a4e-89aeb8ffacc4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This requires relaxing various pre-existing AVX512* checks, as AVX10.1
covers all AVX512* except PF, ER, 4FMAPS, 4VNNIW (support for all of
which was removed meanwhile anyway), and VP2INTERSECT. Yet potentially
with only less than 512-bit vector width, while otoh guaranteeing more
narrow widths being available when wider are (i.e. unlike AVX512VL being
an add-on feature on top of AVX512F).

Note that visa_check(), replacing host_and_vcpu_must_have() uses, checks
only the guest capability: We wouldn't expose AVX512* (nor AVX10)
without the hardware supporting it. Similarly in vlen_check() the
original host_and_vcpu_must_have() is reduced to the equivalent of just
vcpu_must_have(). This also simplifies (resulting) code in the test and
fuzzing harnesses, as there the XCR0 checks that are part of
cpu_has_avx512* are only needed in local code, not in the emulator
itself (where respective checking occurs elsewhere anyway, utilizing
emul_test_read_xcr()).

While in most cases the changes to x86_emulate() are entirely
mechanical, for opmask insns earlier unconditional AVX512F checks are
converted into "else" clauses to existing if/else-if ones.

To be certain that no uses remain, also drop respective cpu_has_avx512*
(except in the test harness) and vcpu_has_avx512*().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Probably avx512_vlen_check() should have the avx512_ prefix dropped, now
that it also covers AVX10. But if so that wants to be either a prereq or
a follow-on patch.

visa_check() won't cover AVX10.2 and higher, but probably we will want
independent checking logic for that anyway.

Spec version 2 still leaves unclear what the xstate components are which
would need enabling for AVX10/256. x86emul_get_fpu() is therefore
untouched for now.

Since it'll be reducing code size, we may want to further convert
host_and_vcpu_must_have() to just vcpu_must_have() where appropriate
(should be [almost?] everywhere).
---
v3: Add ChangeLog entry.
v2: Drop use of vsz128 field. Re-base, in particular over dropping of
    Xeon Phi support.

--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -18,6 +18,7 @@ The format is based on [Keep a Changelog
    - Experimental support for Armv8-R.
  - On x86:
    - xl suspend/resume subcommands.
+   - Add support for AVX10.1. (Experimental)
 
 ### Removed
  - On x86:
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -133,29 +133,18 @@ static inline bool boot_cpu_has(unsigned
 #define cpu_has_pqe             boot_cpu_has(X86_FEATURE_PQE)
 #define cpu_has_fpu_sel         (!boot_cpu_has(X86_FEATURE_NO_FPU_SEL))
 #define cpu_has_mpx             boot_cpu_has(X86_FEATURE_MPX)
-#define cpu_has_avx512f         boot_cpu_has(X86_FEATURE_AVX512F)
-#define cpu_has_avx512dq        boot_cpu_has(X86_FEATURE_AVX512DQ)
 #define cpu_has_rdseed          boot_cpu_has(X86_FEATURE_RDSEED)
 #define cpu_has_smap            boot_cpu_has(X86_FEATURE_SMAP)
-#define cpu_has_avx512_ifma     boot_cpu_has(X86_FEATURE_AVX512_IFMA)
 #define cpu_has_clflushopt      boot_cpu_has(X86_FEATURE_CLFLUSHOPT)
 #define cpu_has_clwb            boot_cpu_has(X86_FEATURE_CLWB)
-#define cpu_has_avx512cd        boot_cpu_has(X86_FEATURE_AVX512CD)
 #define cpu_has_proc_trace      boot_cpu_has(X86_FEATURE_PROC_TRACE)
 #define cpu_has_sha             boot_cpu_has(X86_FEATURE_SHA)
-#define cpu_has_avx512bw        boot_cpu_has(X86_FEATURE_AVX512BW)
-#define cpu_has_avx512vl        boot_cpu_has(X86_FEATURE_AVX512VL)
 
 /* CPUID level 0x00000007:0.ecx */
-#define cpu_has_avx512_vbmi     boot_cpu_has(X86_FEATURE_AVX512_VBMI)
 #define cpu_has_pku             boot_cpu_has(X86_FEATURE_PKU)
-#define cpu_has_avx512_vbmi2    boot_cpu_has(X86_FEATURE_AVX512_VBMI2)
 #define cpu_has_gfni            boot_cpu_has(X86_FEATURE_GFNI)
 #define cpu_has_vaes            boot_cpu_has(X86_FEATURE_VAES)
 #define cpu_has_vpclmulqdq      boot_cpu_has(X86_FEATURE_VPCLMULQDQ)
-#define cpu_has_avx512_vnni     boot_cpu_has(X86_FEATURE_AVX512_VNNI)
-#define cpu_has_avx512_bitalg   boot_cpu_has(X86_FEATURE_AVX512_BITALG)
-#define cpu_has_avx512_vpopcntdq boot_cpu_has(X86_FEATURE_AVX512_VPOPCNTDQ)
 #define cpu_has_rdpid           boot_cpu_has(X86_FEATURE_RDPID)
 #define cpu_has_movdiri         boot_cpu_has(X86_FEATURE_MOVDIRI)
 #define cpu_has_movdir64b       boot_cpu_has(X86_FEATURE_MOVDIR64B)
@@ -180,7 +169,6 @@ static inline bool boot_cpu_has(unsigned
 #define cpu_has_tsx_force_abort boot_cpu_has(X86_FEATURE_TSX_FORCE_ABORT)
 #define cpu_has_serialize       boot_cpu_has(X86_FEATURE_SERIALIZE)
 #define cpu_has_hybrid          boot_cpu_has(X86_FEATURE_HYBRID)
-#define cpu_has_avx512_fp16     boot_cpu_has(X86_FEATURE_AVX512_FP16)
 #define cpu_has_arch_caps       boot_cpu_has(X86_FEATURE_ARCH_CAPS)
 
 /* CPUID level 0x00000007:1.eax */
@@ -188,7 +176,6 @@ static inline bool boot_cpu_has(unsigned
 #define cpu_has_sm3             boot_cpu_has(X86_FEATURE_SM3)
 #define cpu_has_sm4             boot_cpu_has(X86_FEATURE_SM4)
 #define cpu_has_avx_vnni        boot_cpu_has(X86_FEATURE_AVX_VNNI)
-#define cpu_has_avx512_bf16     boot_cpu_has(X86_FEATURE_AVX512_BF16)
 #define cpu_has_cmpccxadd       boot_cpu_has(X86_FEATURE_CMPCCXADD)
 #define cpu_has_avx_ifma        boot_cpu_has(X86_FEATURE_AVX_IFMA)
 
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -562,26 +562,15 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_invpcid()     (ctxt->cpuid->feat.invpcid)
 #define vcpu_has_rtm()         (ctxt->cpuid->feat.rtm)
 #define vcpu_has_mpx()         (ctxt->cpuid->feat.mpx)
-#define vcpu_has_avx512f()     (ctxt->cpuid->feat.avx512f)
-#define vcpu_has_avx512dq()    (ctxt->cpuid->feat.avx512dq)
 #define vcpu_has_rdseed()      (ctxt->cpuid->feat.rdseed)
 #define vcpu_has_adx()         (ctxt->cpuid->feat.adx)
 #define vcpu_has_smap()        (ctxt->cpuid->feat.smap)
-#define vcpu_has_avx512_ifma() (ctxt->cpuid->feat.avx512_ifma)
 #define vcpu_has_clflushopt()  (ctxt->cpuid->feat.clflushopt)
 #define vcpu_has_clwb()        (ctxt->cpuid->feat.clwb)
-#define vcpu_has_avx512cd()    (ctxt->cpuid->feat.avx512cd)
 #define vcpu_has_sha()         (ctxt->cpuid->feat.sha)
-#define vcpu_has_avx512bw()    (ctxt->cpuid->feat.avx512bw)
-#define vcpu_has_avx512vl()    (ctxt->cpuid->feat.avx512vl)
-#define vcpu_has_avx512_vbmi() (ctxt->cpuid->feat.avx512_vbmi)
-#define vcpu_has_avx512_vbmi2() (ctxt->cpuid->feat.avx512_vbmi2)
 #define vcpu_has_gfni()        (ctxt->cpuid->feat.gfni)
 #define vcpu_has_vaes()        (ctxt->cpuid->feat.vaes)
 #define vcpu_has_vpclmulqdq()  (ctxt->cpuid->feat.vpclmulqdq)
-#define vcpu_has_avx512_vnni() (ctxt->cpuid->feat.avx512_vnni)
-#define vcpu_has_avx512_bitalg() (ctxt->cpuid->feat.avx512_bitalg)
-#define vcpu_has_avx512_vpopcntdq() (ctxt->cpuid->feat.avx512_vpopcntdq)
 #define vcpu_has_rdpid()       (ctxt->cpuid->feat.rdpid)
 #define vcpu_has_movdiri()     (ctxt->cpuid->feat.movdiri)
 #define vcpu_has_movdir64b()   (ctxt->cpuid->feat.movdir64b)
@@ -589,12 +578,10 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_avx512_vp2intersect() (ctxt->cpuid->feat.avx512_vp2intersect)
 #define vcpu_has_serialize()   (ctxt->cpuid->feat.serialize)
 #define vcpu_has_tsxldtrk()    (ctxt->cpuid->feat.tsxldtrk)
-#define vcpu_has_avx512_fp16() (ctxt->cpuid->feat.avx512_fp16)
 #define vcpu_has_sha512()      (ctxt->cpuid->feat.sha512)
 #define vcpu_has_sm3()         (ctxt->cpuid->feat.sm3)
 #define vcpu_has_sm4()         (ctxt->cpuid->feat.sm4)
 #define vcpu_has_avx_vnni()    (ctxt->cpuid->feat.avx_vnni)
-#define vcpu_has_avx512_bf16() (ctxt->cpuid->feat.avx512_bf16)
 #define vcpu_has_cmpccxadd()   (ctxt->cpuid->feat.cmpccxadd)
 #define vcpu_has_lkgs()        (ctxt->cpuid->feat.lkgs)
 #define vcpu_has_wrmsrns()     (ctxt->cpuid->feat.wrmsrns)
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -1126,19 +1126,40 @@ static unsigned long *decode_vex_gpr(
     return decode_gpr(regs, ~vex_reg & (mode_64bit() ? 0xf : 7));
 }
 
-#define avx512_vlen_check(lig) do { \
-    switch ( evex.lr ) \
-    { \
-    default: \
-        generate_exception(X86_EXC_UD); \
-    case 2: \
-        break; \
-    case 0: case 1: \
-        if ( !(lig) ) \
-            host_and_vcpu_must_have(avx512vl); \
-        break; \
-    } \
-} while ( false )
+#define visa_check(subfeat) \
+        generate_exception_if(!cp->feat.avx512 ## subfeat && !cp->feat.avx10, \
+                              X86_EXC_UD)
+
+static bool _vlen_check(
+    const struct x86_emulate_state *s,
+    const struct cpu_policy *cp,
+    bool lig)
+{
+    if ( s->evex.lr > 2 )
+        return false;
+
+    if ( lig )
+        return true;
+
+    if ( cp->feat.avx10 )
+        switch ( s->evex.lr )
+        {
+        case 0:
+        case 1:
+            if ( cp->avx10.vsz256 )
+                return true;
+            /* fall through */
+        case 2:
+            if ( cp->avx10.vsz512 )
+                return true;
+            break;
+        }
+
+    return s->evex.lr == 2 || cp->feat.avx512vl;
+}
+
+#define avx512_vlen_check(lig) \
+        generate_exception_if(!_vlen_check(state, cp, lig), X86_EXC_UD)
 
 static bool is_branch_step(struct x86_emulate_ctxt *ctxt,
                            const struct x86_emulate_ops *ops)
@@ -1370,7 +1391,9 @@ x86_emulate(
         /* KMOV{W,Q} %k<n>, (%rax) */
         stb[0] = 0xc4;
         stb[1] = 0xe1;
-        stb[2] = cpu_has_avx512bw ? 0xf8 : 0x78;
+        stb[2] = cp->feat.avx512bw || cp->feat.avx10
+                 ? 0xf8 /* L0.NP.W1 - kmovq */
+                 : 0x78 /* L0.NP.W0 - kmovw */;
         stb[3] = 0x91;
         stb[4] = evex.opmsk << 3;
         insn_bytes = 5;
@@ -3395,7 +3418,7 @@ x86_emulate(
                                (ea.type != OP_REG && evex.brs &&
                                 (evex.pfx & VEX_PREFIX_SCALAR_MASK))),
                               X86_EXC_UD);
-        host_and_vcpu_must_have(avx512f);
+        visa_check(f);
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(evex.pfx & VEX_PREFIX_SCALAR_MASK);
     simd_zmm:
@@ -3451,7 +3474,7 @@ x86_emulate(
         generate_exception_if((evex.lr || evex.opmsk || evex.brs ||
                                evex.w != (evex.pfx & VEX_PREFIX_DOUBLE_MASK)),
                               X86_EXC_UD);
-        host_and_vcpu_must_have(avx512f);
+        visa_check(f);
         if ( (d & DstMask) != DstMem )
             d &= ~TwoOp;
         op_bytes = 8;
@@ -3478,7 +3501,7 @@ x86_emulate(
         generate_exception_if((evex.brs ||
                                evex.w != (evex.pfx & VEX_PREFIX_DOUBLE_MASK)),
                               X86_EXC_UD);
-        host_and_vcpu_must_have(avx512f);
+        visa_check(f);
         avx512_vlen_check(false);
         d |= TwoOp;
         op_bytes = !(evex.pfx & VEX_PREFIX_DOUBLE_MASK) || evex.lr
@@ -3515,7 +3538,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x64): /* vpblendm{d,q} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x65): /* vblendmp{s,d} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     avx512f_no_sae:
-        host_and_vcpu_must_have(avx512f);
+        visa_check(f);
         generate_exception_if(ea.type != OP_MEM && evex.brs, X86_EXC_UD);
         avx512_vlen_check(false);
         goto simd_zmm;
@@ -3595,13 +3618,13 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_F3(5, 0x2a):      /* vcvtsi2sh r/m,xmm,xmm */
     case X86EMUL_OPC_EVEX_F3(5, 0x7b):      /* vcvtusi2sh r/m,xmm,xmm */
-        host_and_vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         /* fall through */
     CASE_SIMD_SCALAR_FP(_EVEX, 0x0f, 0x2a): /* vcvtsi2s{s,d} r/m,xmm,xmm */
     CASE_SIMD_SCALAR_FP(_EVEX, 0x0f, 0x7b): /* vcvtusi2s{s,d} r/m,xmm,xmm */
         generate_exception_if(evex.opmsk || (ea.type != OP_REG && evex.brs),
                               X86_EXC_UD);
-        host_and_vcpu_must_have(avx512f);
+        visa_check(f);
         if ( !evex.brs )
             avx512_vlen_check(true);
         get_fpu(X86EMUL_FPU_zmm);
@@ -3711,7 +3734,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_F3(5, 0x2d):      /* vcvtsh2si xmm/mem,reg */
     case X86EMUL_OPC_EVEX_F3(5, 0x78):      /* vcvttsh2usi xmm/mem,reg */
     case X86EMUL_OPC_EVEX_F3(5, 0x79):      /* vcvtsh2usi xmm/mem,reg */
-        host_and_vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         /* fall through */
     CASE_SIMD_SCALAR_FP(_EVEX, 0x0f, 0x2c): /* vcvtts{s,d}2si xmm/mem,reg */
     CASE_SIMD_SCALAR_FP(_EVEX, 0x0f, 0x2d): /* vcvts{s,d}2si xmm/mem,reg */
@@ -3721,7 +3744,7 @@ x86_emulate(
                                evex.opmsk ||
                                (ea.type != OP_REG && evex.brs)),
                               X86_EXC_UD);
-        host_and_vcpu_must_have(avx512f);
+        visa_check(f);
         if ( !evex.brs )
             avx512_vlen_check(true);
         get_fpu(X86EMUL_FPU_zmm);
@@ -3787,7 +3810,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX(5, 0x2e): /* vucomish xmm/m16,xmm */
     case X86EMUL_OPC_EVEX(5, 0x2f): /* vcomish xmm/m16,xmm */
-        host_and_vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         generate_exception_if(evex.w, X86_EXC_UD);
         /* fall through */
     CASE_SIMD_PACKED_FP(_EVEX, 0x0f, 0x2e): /* vucomis{s,d} xmm/mem,xmm */
@@ -3796,7 +3819,7 @@ x86_emulate(
                                (ea.type != OP_REG && evex.brs) ||
                                evex.w != evex.pfx),
                               X86_EXC_UD);
-        host_and_vcpu_must_have(avx512f);
+        visa_check(f);
         if ( !evex.brs )
             avx512_vlen_check(true);
         get_fpu(X86EMUL_FPU_zmm);
@@ -3940,7 +3963,7 @@ x86_emulate(
 
     case X86EMUL_OPC_VEX(0x0f, 0x4a):    /* kadd{w,q} k,k,k */
         if ( !vex.w )
-            host_and_vcpu_must_have(avx512dq);
+            visa_check(dq);
         /* fall through */
     case X86EMUL_OPC_VEX(0x0f, 0x41):    /* kand{w,q} k,k,k */
     case X86EMUL_OPC_VEX_66(0x0f, 0x41): /* kand{b,d} k,k,k */
@@ -3956,11 +3979,12 @@ x86_emulate(
         generate_exception_if(!vex.l, X86_EXC_UD);
     opmask_basic:
         if ( vex.w )
-            host_and_vcpu_must_have(avx512bw);
+            visa_check(bw);
         else if ( vex.pfx )
-            host_and_vcpu_must_have(avx512dq);
+            visa_check(dq);
+        else
+            visa_check(f);
     opmask_common:
-        host_and_vcpu_must_have(avx512f);
         generate_exception_if(!vex.r || (mode_64bit() && !(vex.reg & 8)) ||
                               ea.type != OP_REG, X86_EXC_UD);
 
@@ -3983,13 +4007,14 @@ x86_emulate(
         generate_exception_if(vex.l || vex.reg != 0xf, X86_EXC_UD);
         goto opmask_basic;
 
-    case X86EMUL_OPC_VEX(0x0f, 0x4b):    /* kunpck{w,d}{d,q} k,k,k */
+    case X86EMUL_OPC_VEX(0x0f, 0x4b):    /* kunpck{wd,dq} k,k,k */
         generate_exception_if(!vex.l, X86_EXC_UD);
-        host_and_vcpu_must_have(avx512bw);
+        visa_check(bw);
         goto opmask_common;
 
     case X86EMUL_OPC_VEX_66(0x0f, 0x4b): /* kunpckbw k,k,k */
         generate_exception_if(!vex.l || vex.w, X86_EXC_UD);
+        visa_check(f);
         goto opmask_common;
 
 #endif /* X86EMUL_NO_SIMD */
@@ -4057,7 +4082,7 @@ x86_emulate(
         generate_exception_if((evex.w != (evex.pfx & VEX_PREFIX_DOUBLE_MASK) ||
                                (ea.type != OP_MEM && evex.brs)),
                               X86_EXC_UD);
-        host_and_vcpu_must_have(avx512dq);
+        visa_check(dq);
         avx512_vlen_check(false);
         goto simd_zmm;
 
@@ -4096,12 +4121,12 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_F2(0x0f, 0x7a): /* vcvtudq2ps [xyz]mm/mem,[xyz]mm{k} */
                                           /* vcvtuqq2ps [xyz]mm/mem,{x,y}mm{k} */
         if ( evex.w )
-            host_and_vcpu_must_have(avx512dq);
+            visa_check(dq);
         else
         {
     case X86EMUL_OPC_EVEX(0x0f, 0x78):    /* vcvttp{s,d}2udq [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX(0x0f, 0x79):    /* vcvtp{s,d}2udq [xyz]mm/mem,[xyz]mm{k} */
-            host_and_vcpu_must_have(avx512f);
+            visa_check(f);
         }
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(false);
@@ -4318,7 +4343,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x0b): /* vpmulhrsw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x1c): /* vpabsb [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x1d): /* vpabsw [xyz]mm/mem,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512bw);
+        visa_check(bw);
         generate_exception_if(evex.brs, X86_EXC_UD);
         elem_bytes = 1 << (b & 1);
         goto avx512f_no_sae;
@@ -4350,7 +4375,7 @@ x86_emulate(
             generate_exception_if(b != 0x27 && evex.w != (b & 1), X86_EXC_UD);
             goto avx512f_no_sae;
         }
-        host_and_vcpu_must_have(avx512bw);
+        visa_check(bw);
         generate_exception_if(evex.brs, X86_EXC_UD);
         elem_bytes = 1 << (ext == ext_0f ? b & 1 : evex.w);
         avx512_vlen_check(false);
@@ -4423,7 +4448,7 @@ x86_emulate(
             dst.bytes = 2;
         /* fall through */
     case X86EMUL_OPC_EVEX_66(5, 0x6e): /* vmovw r/m16,xmm */
-        host_and_vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         generate_exception_if(evex.w, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f, 0x6e): /* vmov{d,q} r/m,xmm */
@@ -4431,7 +4456,7 @@ x86_emulate(
         generate_exception_if((evex.lr || evex.opmsk || evex.brs ||
                                evex.reg != 0xf || !evex.RX),
                               X86_EXC_UD);
-        host_and_vcpu_must_have(avx512f);
+        visa_check(f);
         get_fpu(X86EMUL_FPU_zmm);
 
         opc = init_evex(stub);
@@ -4489,7 +4514,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_F2(0x0f, 0x6f): /* vmovdqu{8,16} [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_F2(0x0f, 0x7f): /* vmovdqu{8,16} [xyz]mm,[xyz]mm/mem{k} */
-        host_and_vcpu_must_have(avx512bw);
+        visa_check(bw);
         elem_bytes = 1 << evex.w;
         goto vmovdqa;
 
@@ -4582,7 +4607,7 @@ x86_emulate(
             generate_exception_if(evex.w, X86_EXC_UD);
         else
         {
-            host_and_vcpu_must_have(avx512bw);
+            visa_check(bw);
             generate_exception_if(evex.brs, X86_EXC_UD);
         }
         d = (d & ~SrcMask) | SrcMem | TwoOp;
@@ -4830,7 +4855,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_F3(0x0f, 0xe6):   /* vcvtdq2pd {x,y}mm/mem,[xyz]mm{k} */
                                             /* vcvtqq2pd [xyz]mm/mem,[xyz]mm{k} */
         if ( evex.pfx != vex_f3 )
-            host_and_vcpu_must_have(avx512f);
+            visa_check(f);
         else if ( evex.w )
         {
     case X86EMUL_OPC_EVEX_66(0x0f, 0x78):   /* vcvttps2uqq {x,y}mm/mem,[xyz]mm{k} */
@@ -4841,11 +4866,11 @@ x86_emulate(
                                             /* vcvttpd2qq [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f, 0x7b):   /* vcvtps2qq {x,y}mm/mem,[xyz]mm{k} */
                                             /* vcvtpd2qq [xyz]mm/mem,[xyz]mm{k} */
-            host_and_vcpu_must_have(avx512dq);
+            visa_check(dq);
         }
         else
         {
-            host_and_vcpu_must_have(avx512f);
+            visa_check(f);
             generate_exception_if(ea.type != OP_MEM && evex.brs, X86_EXC_UD);
         }
         if ( ea.type != OP_REG || !evex.brs )
@@ -4883,7 +4908,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f, 0xd6): /* vmovq xmm,xmm/m64 */
         generate_exception_if(evex.lr || !evex.w || evex.opmsk || evex.brs,
                               X86_EXC_UD);
-        host_and_vcpu_must_have(avx512f);
+        visa_check(f);
         d |= TwoOp;
         op_bytes = 8;
         goto simd_zmm;
@@ -4909,19 +4934,21 @@ x86_emulate(
     case X86EMUL_OPC_VEX(0x0f, 0x90):    /* kmov{w,q} k/mem,k */
     case X86EMUL_OPC_VEX_66(0x0f, 0x90): /* kmov{b,d} k/mem,k */
         generate_exception_if(vex.l || !vex.r, X86_EXC_UD);
-        host_and_vcpu_must_have(avx512f);
         if ( vex.w )
         {
-            host_and_vcpu_must_have(avx512bw);
+            visa_check(bw);
             op_bytes = 4 << !vex.pfx;
         }
         else if ( vex.pfx )
         {
-            host_and_vcpu_must_have(avx512dq);
+            visa_check(dq);
             op_bytes = 1;
         }
         else
+        {
+            visa_check(f);
             op_bytes = 2;
+        }
 
         get_fpu(X86EMUL_FPU_opmask);
 
@@ -4943,14 +4970,15 @@ x86_emulate(
         generate_exception_if(vex.l || !vex.r || vex.reg != 0xf ||
                               ea.type != OP_REG, X86_EXC_UD);
 
-        host_and_vcpu_must_have(avx512f);
         if ( vex.pfx == vex_f2 )
-            host_and_vcpu_must_have(avx512bw);
+            visa_check(bw);
         else
         {
             generate_exception_if(vex.w, X86_EXC_UD);
             if ( vex.pfx )
-                host_and_vcpu_must_have(avx512dq);
+                visa_check(dq);
+            else
+                visa_check(f);
         }
 
         get_fpu(X86EMUL_FPU_opmask);
@@ -4982,10 +5010,9 @@ x86_emulate(
         dst = ea;
         dst.reg = decode_gpr(&_regs, modrm_reg);
 
-        host_and_vcpu_must_have(avx512f);
         if ( vex.pfx == vex_f2 )
         {
-            host_and_vcpu_must_have(avx512bw);
+            visa_check(bw);
             dst.bytes = 4 << (mode_64bit() && vex.w);
         }
         else
@@ -4993,7 +5020,9 @@ x86_emulate(
             generate_exception_if(vex.w, X86_EXC_UD);
             dst.bytes = 4;
             if ( vex.pfx )
-                host_and_vcpu_must_have(avx512dq);
+                visa_check(dq);
+            else
+                visa_check(f);
         }
 
         get_fpu(X86EMUL_FPU_opmask);
@@ -5015,20 +5044,18 @@ x86_emulate(
         ASSERT(!state->simd_size);
         break;
 
-    case X86EMUL_OPC_VEX(0x0f, 0x99):    /* ktest{w,q} k,k */
-        if ( !vex.w )
-            host_and_vcpu_must_have(avx512dq);
-        /* fall through */
     case X86EMUL_OPC_VEX(0x0f, 0x98):    /* kortest{w,q} k,k */
     case X86EMUL_OPC_VEX_66(0x0f, 0x98): /* kortest{b,d} k,k */
+    case X86EMUL_OPC_VEX(0x0f, 0x99):    /* ktest{w,q} k,k */
     case X86EMUL_OPC_VEX_66(0x0f, 0x99): /* ktest{b,d} k,k */
         generate_exception_if(vex.l || !vex.r || vex.reg != 0xf ||
                               ea.type != OP_REG, X86_EXC_UD);
-        host_and_vcpu_must_have(avx512f);
         if ( vex.w )
-            host_and_vcpu_must_have(avx512bw);
-        else if ( vex.pfx )
-            host_and_vcpu_must_have(avx512dq);
+            visa_check(bw);
+        else if ( vex.pfx || (b & 1) )
+            visa_check(dq);
+        else
+            visa_check(f);
 
         get_fpu(X86EMUL_FPU_opmask);
 
@@ -5366,7 +5393,7 @@ x86_emulate(
                                 (evex.pfx & VEX_PREFIX_SCALAR_MASK)) ||
                                !evex.r || !evex.R || evex.z),
                               X86_EXC_UD);
-        host_and_vcpu_must_have(avx512f);
+        visa_check(f);
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(evex.pfx & VEX_PREFIX_SCALAR_MASK);
     simd_imm8_zmm:
@@ -5410,9 +5437,9 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x22): /* vpinsr{d,q} $imm8,r/m,xmm,xmm */
         generate_exception_if(evex.lr || evex.opmsk || evex.brs, X86_EXC_UD);
         if ( b & 2 )
-            host_and_vcpu_must_have(avx512dq);
+            visa_check(dq);
         else
-            host_and_vcpu_must_have(avx512bw);
+            visa_check(bw);
         if ( !mode_64bit() )
             evex.w = 0;
         memcpy(mmvalp, &src.val, src.bytes);
@@ -5449,7 +5476,7 @@ x86_emulate(
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x25): /* vpternlog{d,q} $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     avx512f_imm8_no_sae:
-        host_and_vcpu_must_have(avx512f);
+        visa_check(f);
         generate_exception_if(ea.type != OP_MEM && evex.brs, X86_EXC_UD);
         avx512_vlen_check(false);
         goto simd_imm8_zmm;
@@ -5548,7 +5575,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f, 0xe4): /* vpmulhuw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f, 0xea): /* vpminsw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f, 0xee): /* vpmaxsw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512bw);
+        visa_check(bw);
         generate_exception_if(evex.brs, X86_EXC_UD);
         elem_bytes = b & 0x10 ? 1 : 2;
         goto avx512f_no_sae;
@@ -5773,7 +5800,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x10): /* vpsrlvw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x11): /* vpsravw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x12): /* vpsllvw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512bw);
+        visa_check(bw);
         generate_exception_if(!evex.w || evex.brs, X86_EXC_UD);
         elem_bytes = 2;
         goto avx512f_no_sae;
@@ -5783,7 +5810,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_F3(0x0f38, 0x20): /* vpmovswb [xyz]mm,{x,y}mm/mem{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x30): /* vpmovzxbw {x,y}mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_F3(0x0f38, 0x30): /* vpmovwb [xyz]mm,{x,y}mm/mem{k} */
-        host_and_vcpu_must_have(avx512bw);
+        visa_check(bw);
         if ( evex.pfx != vex_f3 )
         {
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x21): /* vpmovsxbd xmm/mem,[xyz]mm{k} */
@@ -5831,7 +5858,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x13): /* vcvtph2ps {x,y}mm/mem,[xyz]mm{k} */
         generate_exception_if(evex.w || (ea.type != OP_REG && evex.brs), X86_EXC_UD);
-        host_and_vcpu_must_have(avx512f);
+        visa_check(f);
         if ( !evex.brs )
             avx512_vlen_check(false);
         op_bytes = 8 << evex.lr;
@@ -5885,7 +5912,7 @@ x86_emulate(
             op_bytes = 8;
         generate_exception_if(evex.brs, X86_EXC_UD);
         if ( !evex.w )
-            host_and_vcpu_must_have(avx512dq);
+            visa_check(dq);
         goto avx512_broadcast;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x1a): /* vbroadcastf32x4 m128,{y,z}mm{k} */
@@ -5895,7 +5922,7 @@ x86_emulate(
         generate_exception_if(ea.type != OP_MEM || !evex.lr || evex.brs,
                               X86_EXC_UD);
         if ( evex.w )
-            host_and_vcpu_must_have(avx512dq);
+            visa_check(dq);
         goto avx512_broadcast;
 
     case X86EMUL_OPC_VEX_66(0x0f38, 0x20): /* vpmovsxbw xmm/mem,{x,y}mm */
@@ -5920,9 +5947,9 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_F3(0x0f38, 0x28): /* vpmovm2{b,w} k,[xyz]mm */
     case X86EMUL_OPC_EVEX_F3(0x0f38, 0x38): /* vpmovm2{d,q} k,[xyz]mm */
         if ( b & 0x10 )
-            host_and_vcpu_must_have(avx512dq);
+            visa_check(dq);
         else
-            host_and_vcpu_must_have(avx512bw);
+            visa_check(bw);
         generate_exception_if(evex.opmsk || ea.type != OP_REG, X86_EXC_UD);
         d |= TwoOp;
         op_bytes = 16 << evex.lr;
@@ -5965,7 +5992,7 @@ x86_emulate(
         fault_suppression = false;
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x44): /* vplzcnt{d,q} [xyz]mm/mem,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512cd);
+        visa_check(cd);
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_VEX_66(0x0f38, 0x2c): /* vmaskmovps mem,{x,y}mm,{x,y}mm */
@@ -6041,7 +6068,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xba): /* vfmsub231p{s,d} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xbc): /* vfnmadd231p{s,d} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xbe): /* vfnmsub231p{s,d} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512f);
+        visa_check(f);
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(false);
         goto simd_zmm;
@@ -6060,7 +6087,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xbb): /* vfmsub231s{s,d} xmm/mem,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xbd): /* vfnmadd231s{s,d} xmm/mem,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xbf): /* vfnmsub231s{s,d} xmm/mem,xmm,xmm{k} */
-        host_and_vcpu_must_have(avx512f);
+        visa_check(f);
         generate_exception_if(ea.type != OP_REG && evex.brs, X86_EXC_UD);
         if ( !evex.brs )
             avx512_vlen_check(true);
@@ -6074,14 +6101,14 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x3a): /* vpminuw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x3c): /* vpmaxsb [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x3e): /* vpmaxuw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512bw);
+        visa_check(bw);
         generate_exception_if(evex.brs, X86_EXC_UD);
         elem_bytes = b & 2 ?: 1;
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x40): /* vpmull{d,q} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         if ( evex.w )
-            host_and_vcpu_must_have(avx512dq);
+            visa_check(dq);
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_66(0x0f38, 0xdb):     /* aesimc xmm/m128,xmm */
@@ -6121,7 +6148,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x51): /* vpdpbusds [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x52): /* vpdpwssd [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x53): /* vpdpwssds [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512_vnni);
+        visa_check(_vnni);
         generate_exception_if(evex.w, X86_EXC_UD);
         goto avx512f_no_sae;
 
@@ -6133,7 +6160,7 @@ x86_emulate(
             d |= TwoOp;
         /* fall through */
     case X86EMUL_OPC_EVEX_F3(0x0f38, 0x52): /* vdpbf16ps [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512_bf16);
+        visa_check(_bf16);
         generate_exception_if(evex.w, X86_EXC_UD);
         op_bytes = 16 << evex.lr;
         goto avx512f_no_sae;
@@ -6150,7 +6177,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x4d): /* vrcp14s{s,d} xmm/mem,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x4f): /* vrsqrt14s{s,d} xmm/mem,xmm,xmm{k} */
-        host_and_vcpu_must_have(avx512f);
+        visa_check(f);
         generate_exception_if(evex.brs, X86_EXC_UD);
         avx512_vlen_check(true);
         goto simd_zmm;
@@ -6159,16 +6186,16 @@ x86_emulate(
         generate_exception_if(evex.w || !evex.r || !evex.R || evex.z, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x54): /* vpopcnt{b,w} [xyz]mm/mem,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512_bitalg);
+        visa_check(_bitalg);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x66): /* vpblendm{b,w} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512bw);
+        visa_check(bw);
         generate_exception_if(evex.brs, X86_EXC_UD);
         elem_bytes = 1 << evex.w;
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x55): /* vpopcnt{d,q} [xyz]mm/mem,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512_vpopcntdq);
+        visa_check(_vpopcntdq);
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_VEX_66(0x0f38, 0x5a): /* vbroadcasti128 m128,ymm */
@@ -6177,14 +6204,14 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x62): /* vpexpand{b,w} [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x63): /* vpcompress{b,w} [xyz]mm,[xyz]mm/mem{k} */
-        host_and_vcpu_must_have(avx512_vbmi2);
+        visa_check(_vbmi2);
         elem_bytes = 1 << evex.w;
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x88): /* vexpandp{s,d} [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x89): /* vpexpand{d,q} [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x8a): /* vcompressp{s,d} [xyz]mm,[xyz]mm/mem{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x8b): /* vpcompress{d,q} [xyz]mm,[xyz]mm/mem{k} */
-        host_and_vcpu_must_have(avx512f);
+        visa_check(f);
         generate_exception_if(evex.brs, X86_EXC_UD);
         avx512_vlen_check(false);
         /*
@@ -6218,7 +6245,7 @@ x86_emulate(
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x71): /* vpshldv{d,q} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x73): /* vpshrdv{d,q} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512_vbmi2);
+        visa_check(_vbmi2);
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_VEX   (0x0f38, 0xb0): /* vcvtneoph2ps mem,[xy]mm */
@@ -6238,16 +6265,16 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x7d): /* vpermt2{b,w} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x8d): /* vperm{b,w} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         if ( !evex.w )
-            host_and_vcpu_must_have(avx512_vbmi);
+            visa_check(_vbmi);
         else
-            host_and_vcpu_must_have(avx512bw);
+            visa_check(bw);
         generate_exception_if(evex.brs, X86_EXC_UD);
         fault_suppression = false;
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x78): /* vpbroadcastb xmm/m8,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x79): /* vpbroadcastw xmm/m16,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512bw);
+        visa_check(bw);
         generate_exception_if(evex.w || evex.brs, X86_EXC_UD);
         op_bytes = elem_bytes = 1 << (b & 1);
         /* See the comment at the avx512_broadcast label. */
@@ -6256,14 +6283,14 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x7a): /* vpbroadcastb r32,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x7b): /* vpbroadcastw r32,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512bw);
+        visa_check(bw);
         generate_exception_if(evex.w, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x7c): /* vpbroadcast{d,q} reg,[xyz]mm{k} */
         generate_exception_if((ea.type != OP_REG || evex.brs ||
                                evex.reg != 0xf || !evex.RX),
                               X86_EXC_UD);
-        host_and_vcpu_must_have(avx512f);
+        visa_check(f);
         avx512_vlen_check(false);
         get_fpu(X86EMUL_FPU_zmm);
 
@@ -6332,7 +6359,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x83): /* vpmultishiftqb [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         generate_exception_if(!evex.w, X86_EXC_UD);
-        host_and_vcpu_must_have(avx512_vbmi);
+        visa_check(_vbmi);
         fault_suppression = false;
         goto avx512f_no_sae;
 
@@ -6490,8 +6517,8 @@ x86_emulate(
                                evex.reg != 0xf ||
                                modrm_reg == state->sib_index),
                               X86_EXC_UD);
+        visa_check(f);
         avx512_vlen_check(false);
-        host_and_vcpu_must_have(avx512f);
         get_fpu(X86EMUL_FPU_zmm);
 
         /* Read destination and index registers. */
@@ -6652,8 +6679,8 @@ x86_emulate(
                                evex.reg != 0xf ||
                                modrm_reg == state->sib_index),
                               X86_EXC_UD);
+        visa_check(f);
         avx512_vlen_check(false);
-        host_and_vcpu_must_have(avx512f);
         get_fpu(X86EMUL_FPU_zmm);
 
         /* Read source and index registers. */
@@ -6769,7 +6796,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xb4): /* vpmadd52luq [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xb5): /* vpmadd52huq [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512_ifma);
+        visa_check(_ifma);
         generate_exception_if(!evex.w, X86_EXC_UD);
         goto avx512f_no_sae;
 
@@ -7239,7 +7266,7 @@ x86_emulate(
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x08): /* vrndscaleps $imm8,[xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x09): /* vrndscalepd $imm8,[xyz]mm/mem,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512f);
+        visa_check(f);
         generate_exception_if(evex.w != (b & 1), X86_EXC_UD);
         avx512_vlen_check(b & 2);
         goto simd_imm8_zmm;
@@ -7248,7 +7275,7 @@ x86_emulate(
         generate_exception_if(ea.type != OP_REG && evex.brs, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX(0x0f3a, 0x08): /* vrndscaleph $imm8,[xyz]mm/mem,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         generate_exception_if(evex.w, X86_EXC_UD);
         avx512_vlen_check(b & 2);
         goto simd_imm8_zmm;
@@ -7361,11 +7388,11 @@ x86_emulate(
                                evex.opmsk || evex.brs),
                               X86_EXC_UD);
         if ( !(b & 2) )
-            host_and_vcpu_must_have(avx512bw);
+            visa_check(bw);
         else if ( !(b & 1) )
-            host_and_vcpu_must_have(avx512dq);
+            visa_check(dq);
         else
-            host_and_vcpu_must_have(avx512f);
+            visa_check(f);
         get_fpu(X86EMUL_FPU_zmm);
         opc = init_evex(stub);
         goto pextr;
@@ -7379,7 +7406,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x39): /* vextracti32x4 $imm8,{y,z}mm,xmm/m128{k} */
                                             /* vextracti64x2 $imm8,{y,z}mm,xmm/m128{k} */
         if ( evex.w )
-            host_and_vcpu_must_have(avx512dq);
+            visa_check(dq);
         generate_exception_if(evex.brs, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x23): /* vshuff32x4 $imm8,{y,z}mm/mem,{y,z}mm,{y,z}mm{k} */
@@ -7399,7 +7426,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x3b): /* vextracti32x8 $imm8,zmm,ymm/m256{k} */
                                             /* vextracti64x4 $imm8,zmm,ymm/m256{k} */
         if ( !evex.w )
-            host_and_vcpu_must_have(avx512dq);
+            visa_check(dq);
         generate_exception_if(evex.lr != 2 || evex.brs, X86_EXC_UD);
         fault_suppression = false;
         goto avx512f_imm8_no_sae;
@@ -7415,7 +7442,7 @@ x86_emulate(
             generate_exception_if((evex.w || evex.reg != 0xf || !evex.RX ||
                                    (ea.type != OP_REG && (evex.z || evex.brs))),
                                   X86_EXC_UD);
-            host_and_vcpu_must_have(avx512f);
+            visa_check(f);
             avx512_vlen_check(false);
             opc = init_evex(stub);
         }
@@ -7507,7 +7534,7 @@ x86_emulate(
         if ( !(b & 0x20) )
             goto avx512f_imm8_no_sae;
     avx512bw_imm:
-        host_and_vcpu_must_have(avx512bw);
+        visa_check(bw);
         generate_exception_if(evex.brs, X86_EXC_UD);
         elem_bytes = 1 << evex.w;
         avx512_vlen_check(false);
@@ -7546,7 +7573,7 @@ x86_emulate(
         goto simd_0f_imm8_avx;
 
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x21): /* vinsertps $imm8,xmm/m32,xmm,xmm */
-        host_and_vcpu_must_have(avx512f);
+        visa_check(f);
         generate_exception_if(evex.lr || evex.w || evex.opmsk || evex.brs,
                               X86_EXC_UD);
         op_bytes = 4;
@@ -7554,18 +7581,18 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x50): /* vrangep{s,d} $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x56): /* vreducep{s,d} $imm8,[xyz]mm/mem,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512dq);
+        visa_check(dq);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x26): /* vgetmantp{s,d} $imm8,[xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x54): /* vfixupimmp{s,d} $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512f);
+        visa_check(f);
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(false);
         goto simd_imm8_zmm;
 
     case X86EMUL_OPC_EVEX(0x0f3a, 0x26): /* vgetmantph $imm8,[xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX(0x0f3a, 0x56): /* vreduceph $imm8,[xyz]mm/mem,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         generate_exception_if(evex.w, X86_EXC_UD);
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(false);
@@ -7573,11 +7600,11 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x51): /* vranges{s,d} $imm8,xmm/mem,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x57): /* vreduces{s,d} $imm8,xmm/mem,xmm,xmm{k} */
-        host_and_vcpu_must_have(avx512dq);
+        visa_check(dq);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x27): /* vgetmants{s,d} $imm8,xmm/mem,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x55): /* vfixupimms{s,d} $imm8,xmm/mem,xmm,xmm{k} */
-        host_and_vcpu_must_have(avx512f);
+        visa_check(f);
         generate_exception_if(ea.type != OP_REG && evex.brs, X86_EXC_UD);
         if ( !evex.brs )
             avx512_vlen_check(true);
@@ -7585,7 +7612,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX(0x0f3a, 0x27): /* vgetmantsh $imm8,xmm/mem,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX(0x0f3a, 0x57): /* vreducesh $imm8,xmm/mem,xmm,xmm{k} */
-        host_and_vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         generate_exception_if(evex.w, X86_EXC_UD);
         if ( !evex.brs )
             avx512_vlen_check(true);
@@ -7596,18 +7623,19 @@ x86_emulate(
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x30): /* kshiftr{b,w} $imm8,k,k */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x32): /* kshiftl{b,w} $imm8,k,k */
         if ( !vex.w )
-            host_and_vcpu_must_have(avx512dq);
+            visa_check(dq);
+        else
+            visa_check(f);
     opmask_shift_imm:
         generate_exception_if(vex.l || !vex.r || vex.reg != 0xf ||
                               ea.type != OP_REG, X86_EXC_UD);
-        host_and_vcpu_must_have(avx512f);
         get_fpu(X86EMUL_FPU_opmask);
         op_bytes = 1; /* Any non-zero value will do. */
         goto simd_0f_imm8;
 
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x31): /* kshiftr{d,q} $imm8,k,k */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x33): /* kshiftl{d,q} $imm8,k,k */
-        host_and_vcpu_must_have(avx512bw);
+        visa_check(bw);
         goto opmask_shift_imm;
 
     case X86EMUL_OPC_66(0x0f3a, 0x44):     /* pclmulqdq $imm8,xmm/m128,xmm */
@@ -7748,7 +7776,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x66): /* vfpclassp{s,d} $imm8,[xyz]mm/mem,k{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x67): /* vfpclasss{s,d} $imm8,xmm/mem,k{k} */
-        host_and_vcpu_must_have(avx512dq);
+        visa_check(dq);
         generate_exception_if(!evex.r || !evex.R || evex.z, X86_EXC_UD);
         if ( !(b & 1) )
             goto avx512f_imm8_no_sae;
@@ -7758,7 +7786,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX(0x0f3a, 0x66): /* vfpclassph $imm8,[xyz]mm/mem,k{k} */
     case X86EMUL_OPC_EVEX(0x0f3a, 0x67): /* vfpclasssh $imm8,xmm/mem,k{k} */
-        host_and_vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         generate_exception_if(evex.w || !evex.r || !evex.R || evex.z, X86_EXC_UD);
         if ( !(b & 1) )
             goto avx512f_imm8_no_sae;
@@ -7773,14 +7801,14 @@ x86_emulate(
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x71): /* vpshld{d,q} $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x73): /* vpshrd{d,q} $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512_vbmi2);
+        visa_check(_vbmi2);
         goto avx512f_imm8_no_sae;
 
     case X86EMUL_OPC_EVEX_F3(0x0f3a, 0xc2): /* vcmpsh $imm8,xmm/mem,xmm,k{k} */
         generate_exception_if(ea.type != OP_REG && evex.brs, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX(0x0f3a, 0xc2): /* vcmpph $imm8,[xyz]mm/mem,[xyz]mm,k{k} */
-        host_and_vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         generate_exception_if(evex.w || !evex.r || !evex.R || evex.z, X86_EXC_UD);
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(evex.pfx & VEX_PREFIX_SCALAR_MASK);
@@ -7856,13 +7884,13 @@ x86_emulate(
     CASE_SIMD_SINGLE_FP(_EVEX, 5, 0x5d): /* vmin{p,s}h [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     CASE_SIMD_SINGLE_FP(_EVEX, 5, 0x5e): /* vdiv{p,s}h [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     CASE_SIMD_SINGLE_FP(_EVEX, 5, 0x5f): /* vmax{p,s}h [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         generate_exception_if(evex.w, X86_EXC_UD);
         goto avx512f_all_fp;
 
     CASE_SIMD_ALL_FP(_EVEX, 5, 0x5a):  /* vcvtp{h,d}2p{h,d} [xyz]mm/mem,[xyz]mm{k} */
                                        /* vcvts{h,d}2s{h,d} xmm/mem,xmm,xmm{k} */
-        host_and_vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         if ( vex.pfx & VEX_PREFIX_SCALAR_MASK )
             d &= ~TwoOp;
         op_bytes = 2 << (((evex.pfx & VEX_PREFIX_SCALAR_MASK) ? 0 : 1 + evex.lr) +
@@ -7873,7 +7901,7 @@ x86_emulate(
                                        /* vcvtqq2ph [xyz]mm/mem,xmm{k} */
     case X86EMUL_OPC_EVEX_F2(5, 0x7a): /* vcvtudq2ph [xyz]mm/mem,[xy]mm{k} */
                                        /* vcvtuqq2ph [xyz]mm/mem,xmm{k} */
-        host_and_vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(false);
         op_bytes = 16 << evex.lr;
@@ -7883,7 +7911,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_F3(5, 0x5b): /* vcvttph2dq [xy]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX   (5, 0x78): /* vcvttph2udq [xy]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX   (5, 0x79): /* vcvtph2udq [xy]mm/mem,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         generate_exception_if(evex.w, X86_EXC_UD);
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(false);
@@ -7894,7 +7922,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(5, 0x79): /* vcvtph2uqq xmm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(5, 0x7a): /* vcvttph2qq xmm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(5, 0x7b): /* vcvtph2qq xmm/mem,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         generate_exception_if(evex.w, X86_EXC_UD);
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(false);
@@ -7931,7 +7959,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(6, 0xba): /* vfmsub231ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0xbc): /* vfnmadd231ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0xbe): /* vfnmsub231ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         generate_exception_if(evex.w, X86_EXC_UD);
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(false);
@@ -7953,7 +7981,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(6, 0xbb): /* vfmsub231sh xmm/m16,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0xbd): /* vfnmadd231sh xmm/m16,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0xbf): /* vfnmsub231sh xmm/m16,xmm,xmm{k} */
-        host_and_vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         generate_exception_if(evex.w || (ea.type != OP_REG && evex.brs),
                               X86_EXC_UD);
         if ( !evex.brs )
@@ -7962,13 +7990,13 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_66(6, 0x4c): /* vrcpph [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0x4e): /* vrsqrtph [xyz]mm/mem,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         generate_exception_if(evex.w, X86_EXC_UD);
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_EVEX_66(6, 0x4d): /* vrcpsh xmm/m16,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0x4f): /* vrsqrtsh xmm/m16,xmm,xmm{k} */
-        host_and_vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         generate_exception_if(evex.w || evex.brs, X86_EXC_UD);
         avx512_vlen_check(true);
         goto simd_zmm;
@@ -7986,7 +8014,7 @@ x86_emulate(
     {
         unsigned int src1 = ~evex.reg;
 
-        host_and_vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         generate_exception_if(evex.w || ((b & 1) && ea.type != OP_REG && evex.brs),
                               X86_EXC_UD);
         if ( mode_64bit() )
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -795,7 +795,7 @@ static void __init noinline xstate_check
     if ( cpu_has_mpx )
         check_new_xstate(&s, X86_XCR0_BNDCSR | X86_XCR0_BNDREGS);
 
-    if ( cpu_has_avx512f )
+    if ( boot_cpu_has(X86_FEATURE_AVX512F) || boot_cpu_has(X86_FEATURE_AVX10) )
         check_new_xstate(&s, X86_XCR0_HI_ZMM | X86_XCR0_ZMM | X86_XCR0_OPMASK);
 
     /*
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -355,7 +355,7 @@ XEN_CPUFEATURE(UTMR,               15*32
 XEN_CPUFEATURE(PREFETCHI,          15*32+14) /*A  PREFETCHIT{0,1} Instructions */
 XEN_CPUFEATURE(USER_MSR,           15*32+15) /*s  U{RD,WR}MSR Instructions */
 XEN_CPUFEATURE(CET_SSS,            15*32+18) /*   CET Supervisor Shadow Stacks safe to use */
-XEN_CPUFEATURE(AVX10,              15*32+19) /*   AVX10 Converged Vector ISA */
+XEN_CPUFEATURE(AVX10,              15*32+19) /*a  AVX10 Converged Vector ISA */
 
 /* Intel-defined CPU features, MSR_ARCH_CAPS 0x10a.eax, word 16 */
 XEN_CPUFEATURE(RDCL_NO,            16*32+ 0) /*A  No Rogue Data Cache Load (Meltdown) */


