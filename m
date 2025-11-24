Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BE4C81379
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 16:02:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171342.1496380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNY4s-0002fT-P8; Mon, 24 Nov 2025 15:02:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171342.1496380; Mon, 24 Nov 2025 15:02:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNY4s-0002dC-M0; Mon, 24 Nov 2025 15:02:06 +0000
Received: by outflank-mailman (input) for mailman id 1171342;
 Mon, 24 Nov 2025 15:02:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNY4r-0001E9-Au
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 15:02:05 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 899a1ef8-c946-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 16:02:04 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4779a637712so26775295e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 07:02:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fb8ff3sm30350208f8f.29.2025.11.24.07.02.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 07:02:03 -0800 (PST)
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
X-Inumbo-ID: 899a1ef8-c946-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763996524; x=1764601324; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=k/HDQ0bvh4xxkw8/g5CuyzpawDHHHpg2xe4YeTXRq0g=;
        b=eBd5OrwvGvSL1sIuwl7mJSS+Uj4VHVfy5WyryiL8Be3bCvoCUztsXJWvkykjy0edc+
         7y3kWC7xno7xbqOf9xYCRI9QFpBmhag/FubeyS6Bj3IloNcetTvmtB5/lsd35TbcB4G3
         Q1xd9XoCCglNDxV4YLTcIR5BQSixDkIjefAVLcABy8lvS0pubi1rWw7K82UFubAouMUr
         pu8g79BoLUuOpxABsAniq7M3gc3g8RB7Jw4v+LP09b375Gyj+Sv19iai44BhcVVm7cI6
         VTPqKMytrNxLNFZKMDj+kjT+5j30j70Y/5gMTmh2qdl2f/mchXvN2E5Tj4vO0rUrdrkG
         yydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763996524; x=1764601324;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/HDQ0bvh4xxkw8/g5CuyzpawDHHHpg2xe4YeTXRq0g=;
        b=wVy4ck8VM1pih6wuxwvGFvUbLMe6XsvjdAofcJttPseL4kWt5wmwQrTSTW0Qbriavx
         JOnjsnRj3jaMtevzzTUL0XkdAJyM+w9oryY6DM/3O7ybyDq2vJb9JjLxLfeSN/bAI9wZ
         VsA5U4QE9268dFy1E4iLzkYg0xdCpP6SE2IW4lpekS3gdlFT4HJMXM2suuDHPSpqlZbr
         Gj2MHzIF0qUh+jwn90VcpUhRebupSS3AdsXz0HXrpT5dHo4CcjgMzp0X3zosLzoyURIy
         EQHGY32ZPCUiEPCsU6t7XBcXyNVUcRS3xuY4kq6/ziOJzk14i4N6cAAonE4scOZaEV82
         jn5Q==
X-Gm-Message-State: AOJu0Yx8j1v+iLh73o4cmZORdl8UcxiZoe677TRbzWhmh32HcdGmXZhW
	b8SW7eR0PrMmZvMaAYuMPwngUQnXw7RogRf95kyhfQfhVobJNQP14i7zzbWnK6b8fuK+F4RgHZE
	QgY0=
X-Gm-Gg: ASbGncufCr3NH3Kd71YLATU66xyA8tkFGsKcPHH0/ZDivDfMiaONQ5m2Kv4hz3AS5jR
	opLPU8QQZxOhrtv4ZF8wZqBiYhHxyX8oIyxEO/1I329VU6OabjzgQ5B3H7kUc8b78De1Q+QhETm
	GQuDqGn+FmYLOSZA1slpSBvDECGCppGW8pNM/LpVnyYxV4En8lANbyX74Z6UXuksdiIUYu68lho
	Ca4otroAGm8B6ERdgaFIE1Xwj0TL8ENdq4XrtebJokyLdrIc3POJmE4De/dqpVeXtvvO5BBObnZ
	upbqWIC1MuTMxssXxe9m47TKOYlEYjQnAqPxE3aTOFfPmkr0F4cQBKgV0ITiFN5kd4fmtYUnHh3
	vAmnfwoeYw5sx5yfo06v5cRTobSO7pGF9/wJHya1XYbEquwCQgpijSqIPXpUEIdyfeTFwginb4U
	FWpZZUMztHtKjHEf6pmfcBoOGAl3sb7LiHUthsusOrD+hgqOug1pi5c8cI3J6jK/D9dAmjYC4Da
	EY=
X-Google-Smtp-Source: AGHT+IFDJ1wD90QRR28daYvDiHSlTJQ6N0uBIlnqZIl2e0KRaa+7YPShx3Zx+aNuwIiVlWWjK6ALtA==
X-Received: by 2002:a05:600c:1ca0:b0:477:75eb:a643 with SMTP id 5b1f17b1804b1-477c0165b4emr142895485e9.4.1763996523347;
        Mon, 24 Nov 2025 07:02:03 -0800 (PST)
Message-ID: <732d56d9-d200-410e-8b52-48c5e25bcf5c@suse.com>
Date: Mon, 24 Nov 2025 16:02:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v9 10/10] x86emul: support AVX512-BMM
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <926a2315-a2b7-4aad-87e6-d686c9da9e3a@suse.com>
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
In-Reply-To: <926a2315-a2b7-4aad-87e6-d686c9da9e3a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

EVEX.W meaning is unusual for VBMAC{,X}OR16x16x16, but that needs taking
care of only in the test harness.

Like already proposed in "x86emul: support AVX10.1", use just
vcpu_must_have(), not host_and_vcpu_must_have().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The Disp8Shift settings are guesswork; the binutils submission bogusly(?)
suggests no scaling at all.

No idea how to test this without having access to capable hardware. AMD,
to my knowledge, offers no equivalent to Intel's SDE.
---
v9: New.

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -689,6 +689,15 @@ static const struct test avx512_fp16_128
     INSN(movw, 66, map5, 7e, el, fp16, el),
 };
 
+static const struct test avx512_bmm_all[] = {
+    INSN(bitrev,   , map6, 81, vl, b, vl),
+};
+
+static const struct test avx512_bmm_no128[] = {
+    INSN(bmacor16x16x16,    , map6, 81, vl, w, vl),
+    INSN(bmacxor16x16x16,   , map6, 81, vl, w, vl),
+};
+
 static const struct test gfni_all[] = {
     INSN(gf2p8affineinvqb, 66, 0f3a, cf, vl, q, vl),
     INSN(gf2p8affineqb,    66, 0f3a, ce, vl, q, vl),
@@ -817,6 +826,12 @@ static void test_one(const struct test *
 
     case ESZ_w:
         evex.w = 1;
+        /*
+         * VBMAC{,X}OR16x16x16 don't follow the general pattern: EVEX.W controls
+         * reduction kind there, not element size.
+         */
+        if ( test->spc == SPC_map6 && !test->pfx && test->opc == 0x80 )
+            evex.w = test->mnemonic[4] == 'x';
         /* fall through */
     case ESZ_fp16:
         esz = 2;
@@ -1087,6 +1102,8 @@ void evex_disp8_test(void *instr, struct
     RUN(avx512_vpopcntdq, all);
     RUN(avx512_fp16, all);
     RUN(avx512_fp16, 128);
+    RUN(avx512_bmm, all);
+    RUN(avx512_bmm, no128);
 
     if ( cpu_has_avx512f )
     {
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -2157,6 +2157,9 @@ static const struct evex {
     { { 0x56 }, 2, T, R, pfx_f2, W0, Ln }, /* vfcmaddcph */
     { { 0x57 }, 2, T, R, pfx_f3, W0, LIG }, /* vfmaddcsh */
     { { 0x57 }, 2, T, R, pfx_f2, W0, LIG }, /* vfcmaddcsh */
+    { { 0x80 }, 2, T, R, pfx_no, W0, L1 | L2 }, /* vbmacor16x16x16 */
+    { { 0x80 }, 2, T, R, pfx_no, W1, L1 | L2 }, /* vbmacxor16x16x16 */
+    { { 0x81 }, 2, T, R, pfx_no, W0, Ln }, /* vbitrev */
     { { 0x96 }, 2, T, R, pfx_66, W0, Ln }, /* vfmaddsub132ph */
     { { 0x97 }, 2, T, R, pfx_66, W0, Ln }, /* vfmsubadd132ph */
     { { 0x98 }, 2, T, R, pfx_66, W0, Ln }, /* vfmadd132ph */
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -223,6 +223,8 @@ void wrpkru(unsigned int val);
 #define cpu_has_xop                 (cpu_policy.extd.xop  && xcr0_mask(6))
 #define cpu_has_fma4                (cpu_policy.extd.fma4 && xcr0_mask(6))
 #define cpu_has_tbm                  cpu_policy.extd.tbm
+#define cpu_has_avx512_bmm          (cpu_policy.extd.avx512_bmm && \
+                                     xcr0_mask(0xe6))
 
 int emul_test_cpuid(
     uint32_t leaf,
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -334,6 +334,7 @@ XEN_CPUFEATURE(CPUID_USER_DIS,     11*32
 XEN_CPUFEATURE(EPSF,               11*32+18) /*A  Enhanced Predictive Store Forwarding */
 XEN_CPUFEATURE(FSRSC,              11*32+19) /*A  Fast Short REP SCASB */
 XEN_CPUFEATURE(AMD_PREFETCHI,      11*32+20) /*A  PREFETCHIT{0,1} Instructions */
+XEN_CPUFEATURE(AVX512_BMM,         11*32+23) /*a  AVX512 Bitmap Manipulation Instructions */
 XEN_CPUFEATURE(SBPB,               11*32+27) /*A  Selective Branch Predictor Barrier */
 XEN_CPUFEATURE(IBPB_BRTYPE,        11*32+28) /*A  IBPB flushes Branch Type predictions too */
 XEN_CPUFEATURE(SRSO_NO,            11*32+29) /*A  Hardware not vulnerable to Speculative Return Stack Overflow */
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -308,7 +308,7 @@ def crunch_numbers(state):
         # dependents of AVX512BW (as to requiring wider than 16-bit mask
         # registers), despite the SDM not formally making this connection.
         AVX512BW: [AVX512_VBMI, AVX512_VBMI2, AVX512_BITALG, AVX512_BF16,
-                   AVX512_FP16],
+                   AVX512_FP16, AVX512_BMM],
 
         # Extensions with VEX/EVEX encodings keyed to a separate feature
         # flag are made dependents of their respective legacy feature.
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -387,6 +387,7 @@ static const struct ext0f38_table {
     [0x7a ... 0x7c] = { .simd_size = simd_none, .two_op = 1 },
     [0x7d ... 0x7e] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
     [0x7f] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
+    [0x80 ... 0x81] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
     [0x82] = { .simd_size = simd_other },
     [0x83] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
     [0x88] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_dq },
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -568,6 +568,7 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_clzero()      (ctxt->cpuid->extd.clzero)
 #define vcpu_has_wbnoinvd()    (ctxt->cpuid->extd.wbnoinvd)
 #define vcpu_has_nscb()        (ctxt->cpuid->extd.nscb)
+#define vcpu_has_avx512_bmm()  (ctxt->cpuid->extd.avx512_bmm)
 
 #define vcpu_has_bmi1()        (ctxt->cpuid->feat.bmi1)
 #define vcpu_has_hle()         (ctxt->cpuid->feat.hle)
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -7990,6 +7990,19 @@ x86_emulate(
         goto simd_zmm;
     }
 
+    case X86EMUL_OPC_EVEX(6, 0x80): /* vbmac{,x}or16x16x16 [xyz]mm/mem,[xyz]mm,[xyz]mm */
+        vcpu_must_have(avx512_bmm);
+        generate_exception_if(!evex.lr || evex.brs || evex.opmsk, X86_EXC_UD);
+        avx512_vlen_check(false);
+        goto simd_zmm;
+
+    case X86EMUL_OPC_EVEX(6, 0x81): /* vbitrev [xyz]mm/mem,[xyz]mm */
+        vcpu_must_have(avx512_bmm);
+        generate_exception_if(evex.w || evex.brs || evex.reg != 0xf || !evex.RX,
+                              X86_EXC_UD);
+        avx512_vlen_check(false);
+        goto simd_zmm;
+
     case X86EMUL_OPC_XOP(08, 0x85): /* vpmacssww xmm,xmm/m128,xmm,xmm */
     case X86EMUL_OPC_XOP(08, 0x86): /* vpmacsswd xmm,xmm/m128,xmm,xmm */
     case X86EMUL_OPC_XOP(08, 0x87): /* vpmacssdql xmm,xmm/m128,xmm,xmm */


