Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4037A82B194
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 16:19:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666359.1036945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNwqG-00028S-QF; Thu, 11 Jan 2024 15:19:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666359.1036945; Thu, 11 Jan 2024 15:19:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNwqG-00026H-NU; Thu, 11 Jan 2024 15:19:36 +0000
Received: by outflank-mailman (input) for mailman id 666359;
 Thu, 11 Jan 2024 15:19:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNwqF-000262-BS
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 15:19:35 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d21e50e1-b094-11ee-9b0f-b553b5be7939;
 Thu, 11 Jan 2024 16:19:32 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40e5f746ac4so8728675e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 07:19:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fk10-20020a05600c0cca00b0040e5a0ebabesm4245126wmb.21.2024.01.11.07.19.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 07:19:31 -0800 (PST)
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
X-Inumbo-ID: d21e50e1-b094-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704986372; x=1705591172; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iLAsDjDx3KHcDn4LadRWIqxkpK4/Gwrx0sSyUHW5eu8=;
        b=PfPziIDepPtDD0FJmNLpCGy2pMLbu6AcE/F8SdUSr30QjhTYb9EJMzGg5ydo4DWUHi
         qnSN8ErcwDZVNppM0hG2wUT3t+D4QPSxAfGXV6+SK0I3ppMI1eZwnJ+Q7ZowO+XvkdpY
         oxSKM6zn6NrHyfv0QmW5yeNWoYI3dXBIOr3mSpRtGc5LN3c1Nd4k0vRyUxGpAeAiu5Qu
         REI2+/+nGklLryVYw2HA2ZnyL7D00yL5cBDBdzvV4FjJfGKBfvmUDnZDynlOq8WsIhiZ
         XY9b2AccOvS1Y5jxnp5E/Uo+IcLuGwR3xtbpomsuu/LI52gnvdqWrB58kTn9qiiKAHK6
         fuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704986372; x=1705591172;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iLAsDjDx3KHcDn4LadRWIqxkpK4/Gwrx0sSyUHW5eu8=;
        b=Ax28BJeXlPQFZyZD1NzWhqdiFo1f4jePLfORC4emWK2RVrQtUHEOo6pRJvz+FK9bNY
         rrGPl0FeVnuP3t3M5Qyh5lx4pF3ibm8EZTIVcOloIlT2vG7zSgLYe2nzYXG5HJhn5LoC
         IDi0pxPvMuH7wxlgBzJ5+xlwAz3fKzVTE52gspgBYjo1Dxa2ZUwd+mvtAQak3i4Guxpj
         IgAqUosvWTUf5ME7kodvbokFFexE0Ge1kBVRDM+kbXw6hr/M71dDCJOXgRlXn9NuNjar
         yengbSLBk2sh83yEsJw+nXRtij6S2MDPTIc11cXGHyOJj0+vM9mNyGHChDFdiso8pQ0a
         kfTA==
X-Gm-Message-State: AOJu0YxqoW5jyQANw7MRzNBrNbYeKEGGKDZHBIA4aOkH3Xx7kVrlSdmA
	IyivntneAusoF5sTcXxs4p0SYJfcWJOjif92uArnt9xxQQ==
X-Google-Smtp-Source: AGHT+IF19Ju8s0TvKjRZHkOR50UcUaQcHzdvU7eL8u2aCeDA6u2LneJRh75ZUagI8H9nhZ4fHy0fZA==
X-Received: by 2002:a05:600c:a44:b0:40d:60c3:3d53 with SMTP id c4-20020a05600c0a4400b0040d60c33d53mr561022wmq.103.1704986371620;
        Thu, 11 Jan 2024 07:19:31 -0800 (PST)
Message-ID: <b4562cfe-10e1-46f2-81f6-193768c32bc7@suse.com>
Date: Thu, 11 Jan 2024 16:19:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 4/8] x86emul: support AVX10.1
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <298db76f-d0ee-4d47-931f-1baa1a7546cf@suse.com>
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
In-Reply-To: <298db76f-d0ee-4d47-931f-1baa1a7546cf@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This requires relaxing various pre-existing AVX512* checks, as AVX10.1
covers all AVX512* except except PF, ER, 4FMAPS, 4VNNIW, and
VP2INTERSECT. Yet potentially with only less than 512-bit vector width,
while otoh guaranteeing more narrow widths being available when wider
are (i.e. unlike AVX512VL being an add-on feature on top of AVX512F).

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

--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -132,30 +132,19 @@ static inline bool boot_cpu_has(unsigned
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
 #define cpu_has_avx512er        boot_cpu_has(X86_FEATURE_AVX512ER)
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
 #define cpu_has_rtm_always_abort boot_cpu_has(X86_FEATURE_RTM_ALWAYS_ABORT)
 #define cpu_has_tsx_force_abort boot_cpu_has(X86_FEATURE_TSX_FORCE_ABORT)
 #define cpu_has_serialize       boot_cpu_has(X86_FEATURE_SERIALIZE)
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
@@ -558,28 +558,17 @@ amd_like(const struct x86_emulate_ctxt *
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
 #define vcpu_has_avx512pf()    (ctxt->cpuid->feat.avx512pf)
 #define vcpu_has_avx512er()    (ctxt->cpuid->feat.avx512er)
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
@@ -1125,19 +1125,43 @@ static unsigned long *decode_vex_gpr(
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
+            if ( cp->avx10.vsz128 )
+                return true;
+            /* fall through */
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
@@ -1369,7 +1393,9 @@ x86_emulate(
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
@@ -3392,7 +3418,7 @@ x86_emulate(
                                (ea.type != OP_REG && evex.brs &&
                                 (evex.pfx & VEX_PREFIX_SCALAR_MASK))),
                               X86_EXC_UD);
-        host_and_vcpu_must_have(avx512f);
+        visa_check(f);
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(evex.pfx & VEX_PREFIX_SCALAR_MASK);
     simd_zmm:
@@ -3448,7 +3474,7 @@ x86_emulate(
         generate_exception_if((evex.lr || evex.opmsk || evex.brs ||
                                evex.w != (evex.pfx & VEX_PREFIX_DOUBLE_MASK)),
                               X86_EXC_UD);
-        host_and_vcpu_must_have(avx512f);
+        visa_check(f);
         if ( (d & DstMask) != DstMem )
             d &= ~TwoOp;
         op_bytes = 8;
@@ -3475,7 +3501,7 @@ x86_emulate(
         generate_exception_if((evex.brs ||
                                evex.w != (evex.pfx & VEX_PREFIX_DOUBLE_MASK)),
                               X86_EXC_UD);
-        host_and_vcpu_must_have(avx512f);
+        visa_check(f);
         avx512_vlen_check(false);
         d |= TwoOp;
         op_bytes = !(evex.pfx & VEX_PREFIX_DOUBLE_MASK) || evex.lr
@@ -3512,7 +3538,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x64): /* vpblendm{d,q} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x65): /* vblendmp{s,d} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     avx512f_no_sae:
-        host_and_vcpu_must_have(avx512f);
+        visa_check(f);
         generate_exception_if(ea.type != OP_MEM && evex.brs, X86_EXC_UD);
         avx512_vlen_check(false);
         goto simd_zmm;
@@ -3592,13 +3618,13 @@ x86_emulate(
 
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
@@ -3708,7 +3734,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_F3(5, 0x2d):      /* vcvtsh2si xmm/mem,reg */
     case X86EMUL_OPC_EVEX_F3(5, 0x78):      /* vcvttsh2usi xmm/mem,reg */
     case X86EMUL_OPC_EVEX_F3(5, 0x79):      /* vcvtsh2usi xmm/mem,reg */
-        host_and_vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         /* fall through */
     CASE_SIMD_SCALAR_FP(_EVEX, 0x0f, 0x2c): /* vcvtts{s,d}2si xmm/mem,reg */
     CASE_SIMD_SCALAR_FP(_EVEX, 0x0f, 0x2d): /* vcvts{s,d}2si xmm/mem,reg */
@@ -3717,7 +3743,7 @@ x86_emulate(
         generate_exception_if((evex.reg != 0xf || !evex.RX || evex.opmsk ||
                                (ea.type != OP_REG && evex.brs)),
                               X86_EXC_UD);
-        host_and_vcpu_must_have(avx512f);
+        visa_check(f);
         if ( !evex.brs )
             avx512_vlen_check(true);
         get_fpu(X86EMUL_FPU_zmm);
@@ -3783,7 +3809,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX(5, 0x2e): /* vucomish xmm/m16,xmm */
     case X86EMUL_OPC_EVEX(5, 0x2f): /* vcomish xmm/m16,xmm */
-        host_and_vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         generate_exception_if(evex.w, X86_EXC_UD);
         /* fall through */
     CASE_SIMD_PACKED_FP(_EVEX, 0x0f, 0x2e): /* vucomis{s,d} xmm/mem,xmm */
@@ -3792,7 +3818,7 @@ x86_emulate(
                                (ea.type != OP_REG && evex.brs) ||
                                evex.w != evex.pfx),
                               X86_EXC_UD);
-        host_and_vcpu_must_have(avx512f);
+        visa_check(f);
         if ( !evex.brs )
             avx512_vlen_check(true);
         get_fpu(X86EMUL_FPU_zmm);
@@ -3936,7 +3962,7 @@ x86_emulate(
 
     case X86EMUL_OPC_VEX(0x0f, 0x4a):    /* kadd{w,q} k,k,k */
         if ( !vex.w )
-            host_and_vcpu_must_have(avx512dq);
+            visa_check(dq);
         /* fall through */
     case X86EMUL_OPC_VEX(0x0f, 0x41):    /* kand{w,q} k,k,k */
     case X86EMUL_OPC_VEX_66(0x0f, 0x41): /* kand{b,d} k,k,k */
@@ -3952,11 +3978,12 @@ x86_emulate(
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
 
@@ -3979,13 +4006,14 @@ x86_emulate(
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
@@ -4053,7 +4081,7 @@ x86_emulate(
         generate_exception_if((evex.w != (evex.pfx & VEX_PREFIX_DOUBLE_MASK) ||
                                (ea.type != OP_MEM && evex.brs)),
                               X86_EXC_UD);
-        host_and_vcpu_must_have(avx512dq);
+        visa_check(dq);
         avx512_vlen_check(false);
         goto simd_zmm;
 
@@ -4092,12 +4120,12 @@ x86_emulate(
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
@@ -4314,7 +4342,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x0b): /* vpmulhrsw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x1c): /* vpabsb [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x1d): /* vpabsw [xyz]mm/mem,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512bw);
+        visa_check(bw);
         generate_exception_if(evex.brs, X86_EXC_UD);
         elem_bytes = 1 << (b & 1);
         goto avx512f_no_sae;
@@ -4346,7 +4374,7 @@ x86_emulate(
             generate_exception_if(b != 0x27 && evex.w != (b & 1), X86_EXC_UD);
             goto avx512f_no_sae;
         }
-        host_and_vcpu_must_have(avx512bw);
+        visa_check(bw);
         generate_exception_if(evex.brs, X86_EXC_UD);
         elem_bytes = 1 << (ext == ext_0f ? b & 1 : evex.w);
         avx512_vlen_check(false);
@@ -4419,7 +4447,7 @@ x86_emulate(
             dst.bytes = 2;
         /* fall through */
     case X86EMUL_OPC_EVEX_66(5, 0x6e): /* vmovw r/m16,xmm */
-        host_and_vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         generate_exception_if(evex.w, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f, 0x6e): /* vmov{d,q} r/m,xmm */
@@ -4427,7 +4455,7 @@ x86_emulate(
         generate_exception_if((evex.lr || evex.opmsk || evex.brs ||
                                evex.reg != 0xf || !evex.RX),
                               X86_EXC_UD);
-        host_and_vcpu_must_have(avx512f);
+        visa_check(f);
         get_fpu(X86EMUL_FPU_zmm);
 
         opc = init_evex(stub);
@@ -4485,7 +4513,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_F2(0x0f, 0x6f): /* vmovdqu{8,16} [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_F2(0x0f, 0x7f): /* vmovdqu{8,16} [xyz]mm,[xyz]mm/mem{k} */
-        host_and_vcpu_must_have(avx512bw);
+        visa_check(bw);
         elem_bytes = 1 << evex.w;
         goto vmovdqa;
 
@@ -4578,7 +4606,7 @@ x86_emulate(
             generate_exception_if(evex.w, X86_EXC_UD);
         else
         {
-            host_and_vcpu_must_have(avx512bw);
+            visa_check(bw);
             generate_exception_if(evex.brs, X86_EXC_UD);
         }
         d = (d & ~SrcMask) | SrcMem | TwoOp;
@@ -4826,7 +4854,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_F3(0x0f, 0xe6):   /* vcvtdq2pd {x,y}mm/mem,[xyz]mm{k} */
                                             /* vcvtqq2pd [xyz]mm/mem,[xyz]mm{k} */
         if ( evex.pfx != vex_f3 )
-            host_and_vcpu_must_have(avx512f);
+            visa_check(f);
         else if ( evex.w )
         {
     case X86EMUL_OPC_EVEX_66(0x0f, 0x78):   /* vcvttps2uqq {x,y}mm/mem,[xyz]mm{k} */
@@ -4837,11 +4865,11 @@ x86_emulate(
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
@@ -4879,7 +4907,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f, 0xd6): /* vmovq xmm,xmm/m64 */
         generate_exception_if(evex.lr || !evex.w || evex.opmsk || evex.brs,
                               X86_EXC_UD);
-        host_and_vcpu_must_have(avx512f);
+        visa_check(f);
         d |= TwoOp;
         op_bytes = 8;
         goto simd_zmm;
@@ -4905,19 +4933,21 @@ x86_emulate(
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
 
@@ -4939,14 +4969,15 @@ x86_emulate(
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
@@ -4978,10 +5009,9 @@ x86_emulate(
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
@@ -4989,7 +5019,9 @@ x86_emulate(
             generate_exception_if(vex.w, X86_EXC_UD);
             dst.bytes = 4;
             if ( vex.pfx )
-                host_and_vcpu_must_have(avx512dq);
+                visa_check(dq);
+            else
+                visa_check(f);
         }
 
         get_fpu(X86EMUL_FPU_opmask);
@@ -5011,20 +5043,18 @@ x86_emulate(
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
 
@@ -5362,7 +5392,7 @@ x86_emulate(
                                 (evex.pfx & VEX_PREFIX_SCALAR_MASK)) ||
                                !evex.r || !evex.R || evex.z),
                               X86_EXC_UD);
-        host_and_vcpu_must_have(avx512f);
+        visa_check(f);
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(evex.pfx & VEX_PREFIX_SCALAR_MASK);
     simd_imm8_zmm:
@@ -5406,9 +5436,9 @@ x86_emulate(
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
@@ -5445,7 +5475,7 @@ x86_emulate(
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x25): /* vpternlog{d,q} $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     avx512f_imm8_no_sae:
-        host_and_vcpu_must_have(avx512f);
+        visa_check(f);
         generate_exception_if(ea.type != OP_MEM && evex.brs, X86_EXC_UD);
         avx512_vlen_check(false);
         goto simd_imm8_zmm;
@@ -5544,7 +5574,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f, 0xe4): /* vpmulhuw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f, 0xea): /* vpminsw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f, 0xee): /* vpmaxsw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512bw);
+        visa_check(bw);
         generate_exception_if(evex.brs, X86_EXC_UD);
         elem_bytes = b & 0x10 ? 1 : 2;
         goto avx512f_no_sae;
@@ -5769,7 +5799,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x10): /* vpsrlvw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x11): /* vpsravw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x12): /* vpsllvw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512bw);
+        visa_check(bw);
         generate_exception_if(!evex.w || evex.brs, X86_EXC_UD);
         elem_bytes = 2;
         goto avx512f_no_sae;
@@ -5779,7 +5809,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_F3(0x0f38, 0x20): /* vpmovswb [xyz]mm,{x,y}mm/mem{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x30): /* vpmovzxbw {x,y}mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_F3(0x0f38, 0x30): /* vpmovwb [xyz]mm,{x,y}mm/mem{k} */
-        host_and_vcpu_must_have(avx512bw);
+        visa_check(bw);
         if ( evex.pfx != vex_f3 )
         {
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x21): /* vpmovsxbd xmm/mem,[xyz]mm{k} */
@@ -5827,7 +5857,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x13): /* vcvtph2ps {x,y}mm/mem,[xyz]mm{k} */
         generate_exception_if(evex.w || (ea.type != OP_REG && evex.brs), X86_EXC_UD);
-        host_and_vcpu_must_have(avx512f);
+        visa_check(f);
         if ( !evex.brs )
             avx512_vlen_check(false);
         op_bytes = 8 << evex.lr;
@@ -5881,7 +5911,7 @@ x86_emulate(
             op_bytes = 8;
         generate_exception_if(evex.brs, X86_EXC_UD);
         if ( !evex.w )
-            host_and_vcpu_must_have(avx512dq);
+            visa_check(dq);
         goto avx512_broadcast;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x1a): /* vbroadcastf32x4 m128,{y,z}mm{k} */
@@ -5891,7 +5921,7 @@ x86_emulate(
         generate_exception_if(ea.type != OP_MEM || !evex.lr || evex.brs,
                               X86_EXC_UD);
         if ( evex.w )
-            host_and_vcpu_must_have(avx512dq);
+            visa_check(dq);
         goto avx512_broadcast;
 
     case X86EMUL_OPC_VEX_66(0x0f38, 0x20): /* vpmovsxbw xmm/mem,{x,y}mm */
@@ -5916,9 +5946,9 @@ x86_emulate(
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
@@ -5960,7 +5990,7 @@ x86_emulate(
         fault_suppression = false;
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x44): /* vplzcnt{d,q} [xyz]mm/mem,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512cd);
+        visa_check(cd);
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_VEX_66(0x0f38, 0x2c): /* vmaskmovps mem,{x,y}mm,{x,y}mm */
@@ -6036,7 +6066,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xba): /* vfmsub231p{s,d} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xbc): /* vfnmadd231p{s,d} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xbe): /* vfnmsub231p{s,d} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512f);
+        visa_check(f);
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(false);
         goto simd_zmm;
@@ -6055,7 +6085,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xbb): /* vfmsub231s{s,d} xmm/mem,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xbd): /* vfnmadd231s{s,d} xmm/mem,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xbf): /* vfnmsub231s{s,d} xmm/mem,xmm,xmm{k} */
-        host_and_vcpu_must_have(avx512f);
+        visa_check(f);
     simd_zmm_scalar_sae:
         generate_exception_if(ea.type != OP_REG && evex.brs, X86_EXC_UD);
         if ( !evex.brs )
@@ -6070,14 +6100,14 @@ x86_emulate(
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
@@ -6116,7 +6146,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x51): /* vpdpbusds [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x52): /* vpdpwssd [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x53): /* vpdpwssds [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512_vnni);
+        visa_check(_vnni);
         generate_exception_if(evex.w, X86_EXC_UD);
         goto avx512f_no_sae;
 
@@ -6128,7 +6158,7 @@ x86_emulate(
             d |= TwoOp;
         /* fall through */
     case X86EMUL_OPC_EVEX_F3(0x0f38, 0x52): /* vdpbf16ps [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512_bf16);
+        visa_check(_bf16);
         generate_exception_if(evex.w, X86_EXC_UD);
         op_bytes = 16 << evex.lr;
         goto avx512f_no_sae;
@@ -6145,7 +6175,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x4d): /* vrcp14s{s,d} xmm/mem,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x4f): /* vrsqrt14s{s,d} xmm/mem,xmm,xmm{k} */
-        host_and_vcpu_must_have(avx512f);
+        visa_check(f);
         generate_exception_if(evex.brs, X86_EXC_UD);
         avx512_vlen_check(true);
         goto simd_zmm;
@@ -6163,16 +6193,16 @@ x86_emulate(
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
@@ -6181,14 +6211,14 @@ x86_emulate(
 
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
@@ -6222,7 +6252,7 @@ x86_emulate(
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x71): /* vpshldv{d,q} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x73): /* vpshrdv{d,q} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512_vbmi2);
+        visa_check(_vbmi2);
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_VEX   (0x0f38, 0xb0): /* vcvtneoph2ps mem,[xy]mm */
@@ -6242,16 +6272,16 @@ x86_emulate(
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
@@ -6260,14 +6290,14 @@ x86_emulate(
 
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
 
@@ -6336,7 +6366,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x83): /* vpmultishiftqb [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         generate_exception_if(!evex.w, X86_EXC_UD);
-        host_and_vcpu_must_have(avx512_vbmi);
+        visa_check(_vbmi);
         fault_suppression = false;
         goto avx512f_no_sae;
 
@@ -6484,8 +6514,8 @@ x86_emulate(
                                evex.reg != 0xf ||
                                modrm_reg == state->sib_index),
                               X86_EXC_UD);
+        visa_check(f);
         avx512_vlen_check(false);
-        host_and_vcpu_must_have(avx512f);
         get_fpu(X86EMUL_FPU_zmm);
 
         /* Read destination and index registers. */
@@ -6664,8 +6694,8 @@ x86_emulate(
                                evex.reg != 0xf ||
                                modrm_reg == state->sib_index),
                               X86_EXC_UD);
+        visa_check(f);
         avx512_vlen_check(false);
-        host_and_vcpu_must_have(avx512f);
         get_fpu(X86EMUL_FPU_zmm);
 
         /* Read source and index registers. */
@@ -6782,7 +6812,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xb4): /* vpmadd52luq [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xb5): /* vpmadd52huq [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512_ifma);
+        visa_check(_ifma);
         generate_exception_if(!evex.w, X86_EXC_UD);
         goto avx512f_no_sae;
 
@@ -6798,8 +6828,8 @@ x86_emulate(
 #endif
 
         ASSERT(ea.type == OP_MEM);
-        generate_exception_if((!cpu_has_avx512f || !evex.opmsk || evex.brs ||
-                               evex.z || evex.reg != 0xf || evex.lr != 2),
+        generate_exception_if((!evex.opmsk || evex.brs || evex.z ||
+                               evex.reg != 0xf || evex.lr != 2),
                               X86_EXC_UD);
 
         switch ( modrm_reg & 7 )
@@ -7315,7 +7345,7 @@ x86_emulate(
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x08): /* vrndscaleps $imm8,[xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x09): /* vrndscalepd $imm8,[xyz]mm/mem,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512f);
+        visa_check(f);
         generate_exception_if(evex.w != (b & 1), X86_EXC_UD);
         avx512_vlen_check(b & 2);
         goto simd_imm8_zmm;
@@ -7324,7 +7354,7 @@ x86_emulate(
         generate_exception_if(ea.type != OP_REG && evex.brs, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX(0x0f3a, 0x08): /* vrndscaleph $imm8,[xyz]mm/mem,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         generate_exception_if(evex.w, X86_EXC_UD);
         avx512_vlen_check(b & 2);
         goto simd_imm8_zmm;
@@ -7437,11 +7467,11 @@ x86_emulate(
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
@@ -7455,7 +7485,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x39): /* vextracti32x4 $imm8,{y,z}mm,xmm/m128{k} */
                                             /* vextracti64x2 $imm8,{y,z}mm,xmm/m128{k} */
         if ( evex.w )
-            host_and_vcpu_must_have(avx512dq);
+            visa_check(dq);
         generate_exception_if(evex.brs, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x23): /* vshuff32x4 $imm8,{y,z}mm/mem,{y,z}mm,{y,z}mm{k} */
@@ -7475,7 +7505,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x3b): /* vextracti32x8 $imm8,zmm,ymm/m256{k} */
                                             /* vextracti64x4 $imm8,zmm,ymm/m256{k} */
         if ( !evex.w )
-            host_and_vcpu_must_have(avx512dq);
+            visa_check(dq);
         generate_exception_if(evex.lr != 2 || evex.brs, X86_EXC_UD);
         fault_suppression = false;
         goto avx512f_imm8_no_sae;
@@ -7491,7 +7521,7 @@ x86_emulate(
             generate_exception_if((evex.w || evex.reg != 0xf || !evex.RX ||
                                    (ea.type != OP_REG && (evex.z || evex.brs))),
                                   X86_EXC_UD);
-            host_and_vcpu_must_have(avx512f);
+            visa_check(f);
             avx512_vlen_check(false);
             opc = init_evex(stub);
         }
@@ -7583,7 +7613,7 @@ x86_emulate(
         if ( !(b & 0x20) )
             goto avx512f_imm8_no_sae;
     avx512bw_imm:
-        host_and_vcpu_must_have(avx512bw);
+        visa_check(bw);
         generate_exception_if(evex.brs, X86_EXC_UD);
         elem_bytes = 1 << evex.w;
         avx512_vlen_check(false);
@@ -7622,7 +7652,7 @@ x86_emulate(
         goto simd_0f_imm8_avx;
 
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x21): /* vinsertps $imm8,xmm/m32,xmm,xmm */
-        host_and_vcpu_must_have(avx512f);
+        visa_check(f);
         generate_exception_if(evex.lr || evex.w || evex.opmsk || evex.brs,
                               X86_EXC_UD);
         op_bytes = 4;
@@ -7630,18 +7660,18 @@ x86_emulate(
 
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
@@ -7649,11 +7679,11 @@ x86_emulate(
 
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
@@ -7661,7 +7691,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX(0x0f3a, 0x27): /* vgetmantsh $imm8,xmm/mem,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX(0x0f3a, 0x57): /* vreducesh $imm8,xmm/mem,xmm,xmm{k} */
-        host_and_vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         generate_exception_if(evex.w, X86_EXC_UD);
         if ( !evex.brs )
             avx512_vlen_check(true);
@@ -7672,18 +7702,19 @@ x86_emulate(
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
@@ -7824,7 +7855,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x66): /* vfpclassp{s,d} $imm8,[xyz]mm/mem,k{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x67): /* vfpclasss{s,d} $imm8,xmm/mem,k{k} */
-        host_and_vcpu_must_have(avx512dq);
+        visa_check(dq);
         generate_exception_if(!evex.r || !evex.R || evex.z, X86_EXC_UD);
         if ( !(b & 1) )
             goto avx512f_imm8_no_sae;
@@ -7834,7 +7865,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX(0x0f3a, 0x66): /* vfpclassph $imm8,[xyz]mm/mem,k{k} */
     case X86EMUL_OPC_EVEX(0x0f3a, 0x67): /* vfpclasssh $imm8,xmm/mem,k{k} */
-        host_and_vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         generate_exception_if(evex.w || !evex.r || !evex.R || evex.z, X86_EXC_UD);
         if ( !(b & 1) )
             goto avx512f_imm8_no_sae;
@@ -7849,14 +7880,14 @@ x86_emulate(
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
@@ -7937,13 +7968,13 @@ x86_emulate(
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
@@ -7954,7 +7985,7 @@ x86_emulate(
                                        /* vcvtqq2ph [xyz]mm/mem,xmm{k} */
     case X86EMUL_OPC_EVEX_F2(5, 0x7a): /* vcvtudq2ph [xyz]mm/mem,[xy]mm{k} */
                                        /* vcvtuqq2ph [xyz]mm/mem,xmm{k} */
-        host_and_vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(false);
         op_bytes = 16 << evex.lr;
@@ -7964,7 +7995,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_F3(5, 0x5b): /* vcvttph2dq [xy]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX   (5, 0x78): /* vcvttph2udq [xy]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX   (5, 0x79): /* vcvtph2udq [xy]mm/mem,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         generate_exception_if(evex.w, X86_EXC_UD);
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(false);
@@ -7975,7 +8006,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(5, 0x79): /* vcvtph2uqq xmm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(5, 0x7a): /* vcvttph2qq xmm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(5, 0x7b): /* vcvtph2qq xmm/mem,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         generate_exception_if(evex.w, X86_EXC_UD);
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(false);
@@ -8012,7 +8043,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(6, 0xba): /* vfmsub231ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0xbc): /* vfnmadd231ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0xbe): /* vfnmsub231ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        host_and_vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         generate_exception_if(evex.w, X86_EXC_UD);
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(false);
@@ -8034,7 +8065,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(6, 0xbb): /* vfmsub231sh xmm/m16,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0xbd): /* vfnmadd231sh xmm/m16,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0xbf): /* vfnmsub231sh xmm/m16,xmm,xmm{k} */
-        host_and_vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         generate_exception_if(evex.w || (ea.type != OP_REG && evex.brs),
                               X86_EXC_UD);
         if ( !evex.brs )
@@ -8043,13 +8074,13 @@ x86_emulate(
 
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
@@ -8067,7 +8098,7 @@ x86_emulate(
     {
         unsigned int src1 = ~evex.reg;
 
-        host_and_vcpu_must_have(avx512_fp16);
+        visa_check(_fp16);
         generate_exception_if(evex.w || ((b & 1) && ea.type != OP_REG && evex.brs),
                               X86_EXC_UD);
         if ( mode_64bit() )
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -321,7 +321,7 @@ XEN_CPUFEATURE(AVX_VNNI_INT16,     15*32
 XEN_CPUFEATURE(PREFETCHI,          15*32+14) /*A  PREFETCHIT{0,1} Instructions */
 XEN_CPUFEATURE(USER_MSR,           15*32+15) /*s  U{RD,WR}MSR Instructions */
 XEN_CPUFEATURE(CET_SSS,            15*32+18) /*   CET Supervisor Shadow Stacks safe to use */
-XEN_CPUFEATURE(AVX10,              15*32+19) /*   AVX10 Converged Vector ISA */
+XEN_CPUFEATURE(AVX10,              15*32+19) /*a  AVX10 Converged Vector ISA */
 
 /* Intel-defined CPU features, MSR_ARCH_CAPS 0x10a.eax, word 16 */
 XEN_CPUFEATURE(RDCL_NO,            16*32+ 0) /*A  No Rogue Data Cache Load (Meltdown) */


