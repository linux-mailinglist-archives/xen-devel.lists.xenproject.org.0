Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 307CD9ECA0B
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 11:14:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854299.1267549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLJjd-00067a-6p; Wed, 11 Dec 2024 10:14:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854299.1267549; Wed, 11 Dec 2024 10:14:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLJjd-00065N-3F; Wed, 11 Dec 2024 10:14:25 +0000
Received: by outflank-mailman (input) for mailman id 854299;
 Wed, 11 Dec 2024 10:14:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HaM=TE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLJjc-00060E-G7
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 10:14:24 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1b1f941-b7a8-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 11:14:23 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-38632b8ae71so3132864f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 02:14:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725e438f169sm6062727b3a.168.2024.12.11.02.14.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 02:14:22 -0800 (PST)
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
X-Inumbo-ID: b1b1f941-b7a8-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733912063; x=1734516863; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LdaGVXA10IBcCRzlLDHPVJ5Jo7qKqPrDjPHTX/kabAE=;
        b=aqHMLQpQjpM4sfwpdhSJ+e7aRqxDVSVEBc78CSADlAUOIkPNivpcqHfw0fxHe0vrK8
         7prCNT4CEVMVOQRrXp2d9ND9u+C0I8sQIASMfQVy1hUEUkfn5ul7blXlv496kk8J3XR0
         8paY8fgnr/s3wyFi1275c3OO+MCg2rAbesoUEVaa80EztLe91BGGNyh2chk3hoWwqnhq
         dcx7SWYKJpsuaKwRkOwBhCfbk/80JdNF2knfpa6pXJFKP6/E3jhn18vuCs0HEu5p6ySo
         Zzr21EnLOJ9ejNgyDquXtWxEjLrOHXq/YL4Mw2zMNZ6lrnUlbtuJ1u2b3Q2lioTezri1
         5hrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733912063; x=1734516863;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LdaGVXA10IBcCRzlLDHPVJ5Jo7qKqPrDjPHTX/kabAE=;
        b=aEbkHQgiAWjDPyGzp++1or2YwdZfTCdsH26AzkrKisjkCkD0KWh9ELE1E7D+xYwWhE
         yZVuHvEiRTsD6inO9EBr0xEerZ7AW3Fbiheg9ngA/BQidYw8Ro5KofakIY7hpfpm2ofq
         FsEW97Q1mPOjHcTcCXh2D0pNt4nSXL2S/A+kBoOnW87/+7dvl120sz0Ljc1vwPV+dZYU
         6xZ3/qvZ1Vt5KwaLJIDRsYpBrQ0CEiOXzC2jJRY+tzftA37eLl/QB+NxO55AXGtTAYe4
         OMeEJ/FOHjh901mCCPeBIM/RzjCkEFuFk8xk84nG0KKiNm6jYfQ9hb1kEURzFmbvPjKh
         XVgg==
X-Gm-Message-State: AOJu0YygmxPc3BOTARsC4h8f3+tBt0dhCYHFzJ1GPytKwNIdfpEcl7IF
	MQnM1zLVOvQkFrS8rQ7LUD61FbsWUQ5pZmfttwruKStw2ASVp0Oi2JIQ9EXJd4Ay0G2BuLVRmJQ
	=
X-Gm-Gg: ASbGnctIgVsKHHBmzG7Kbq7o5dAjt5ogDtzntXNjncVOgoE8+HfNyDHRLo7Zxx31vnF
	RT2I607qqyWmuh6vTu+nlktNHzngiI3ybAaLb6ReH7xkf5yyNgdO6BqG/BBfu9V9UwXbLcb5TKs
	LYlz8Icg1z/tPEscWhyxTdDdJuida639R4N6dybEEFDDE4RfQzzVEIgnSFnqwBOkqsIz16gbiZL
	///tzEieaFkM7+pghv+yt82pkvfCGB6zu/K6M9Ryw2TRs4UIRgoEICIIPFmnnOcum9M9aJfcsr2
	QynPa2W0IPa98opUTzIulIWdCjCJoScubHz3tnc=
X-Google-Smtp-Source: AGHT+IHbmK8rQyhYlnEZ/56i71MHJERRZ3R+gFaRtnYt48oWR9ePFEk/7foCXiqMM7Lketo+OfwWbA==
X-Received: by 2002:a05:6000:18ae:b0:385:fd07:8616 with SMTP id ffacd0b85a97d-3864cdeb11fmr1770022f8f.0.1733912063058;
        Wed, 11 Dec 2024 02:14:23 -0800 (PST)
Message-ID: <995a7961-2a28-426c-85b8-2ee3dd505f4b@suse.com>
Date: Wed, 11 Dec 2024 11:14:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 07/16] x86emul: support AVX10.2 256-bit embedded rounding /
 SAE
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
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

AVX10.2 (along with APX) assigns new meaning to the bit that previsouly
distinguished EVEX from the Phi co-processor's MVEX. Therefore
evex_encoded() now needs to key off of something else: Use the opcode
mapping field for this, leveraging that map 0 has no assigned opcodes
(and appears unlikely to gain any).

Place the check of EVEX.U such that it'll cover most insns. EVEX.b is
being checked for individual insns as applicable - whenever that's valid
for (register-only) 512-bit forms, it becomes valid for 256-bit forms as
well when AVX10.2 is permitted for a guest. Scalar insns permitting
embedded rounding / SAE, otoh, have individual EVEX.U checks added (where
applicable with minor adjustments to the logic to avoid - where easily
possible - testing the same bit multiple times).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
To raise the question early: It is entirely unclear to me how we want to
allow control over the AVX10 minor version number from guest configs, as
that's not a boolean field and hence not suitable for simple bit-wise
masking of feature sets.
---
v3: Take care of scalar insns individually.
v2: New.

--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -16,7 +16,7 @@
 # define ERR_PTR(val) NULL
 #endif
 
-#define evex_encoded() (s->evex.mbs)
+#define evex_encoded() (s->evex.opcx)
 
 struct x86_emulate_state *
 x86_decode_insn(
@@ -1198,8 +1198,15 @@ int x86emul_decode(struct x86_emulate_st
                         s->evex.raw[1] = s->vex.raw[1];
                         s->evex.raw[2] = insn_fetch_type(uint8_t);
 
-                        generate_exception_if(!s->evex.mbs || s->evex.mbz, X86_EXC_UD);
-                        generate_exception_if(!s->evex.opmsk && s->evex.z, X86_EXC_UD);
+                        /*
+                         * .opcx is being checked here just to be on the safe
+                         * side, especially as long as evex_encoded() uses
+                         * this field.
+                         */
+                        generate_exception_if(s->evex.mbz || !s->evex.opcx,
+                                              X86_EXC_UD);
+                        generate_exception_if(!s->evex.opmsk && s->evex.z,
+                                              X86_EXC_UD);
 
                         if ( !mode_64bit() )
                             s->evex.R = 1;
@@ -1777,6 +1784,16 @@ int x86emul_decode(struct x86_emulate_st
     if ( override_seg != x86_seg_none )
         s->ea.mem.seg = override_seg;
 
+    /*
+     * While this generic check takes care of most insns, scalar ones (with
+     * EVEX.b set) need checking individually (elsewhere).
+     */
+    generate_exception_if((evex_encoded() &&
+                           !s->evex.u &&
+                           (s->modrm_mod != 3 ||
+                            !vcpu_has_avx10(2) || !s->evex.brs)),
+                          X86_EXC_UD);
+
     /* Fetch the immediate operand, if present. */
     switch ( d & SrcMask )
     {
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -225,7 +225,7 @@ union evex {
         uint8_t x:1;     /* X */
         uint8_t r:1;     /* R */
         uint8_t pfx:2;   /* pp */
-        uint8_t mbs:1;
+        uint8_t u:1;     /* U */
         uint8_t reg:4;   /* vvvv */
         uint8_t w:1;     /* W */
         uint8_t opmsk:3; /* aaa */
@@ -594,6 +594,8 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_avx_vnni_int16() (ctxt->cpuid->feat.avx_vnni_int16)
 #define vcpu_has_user_msr()    (ctxt->cpuid->feat.user_msr)
 
+#define vcpu_has_avx10(minor)  (ctxt->cpuid->avx10.version >= (minor))
+
 #define vcpu_must_have(feat) \
     generate_exception_if(!vcpu_has_##feat(), X86_EXC_UD)
 
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -1241,7 +1241,7 @@ int cf_check x86emul_unhandleable_rw(
 #define lock_prefix (state->lock_prefix)
 #define vex (state->vex)
 #define evex (state->evex)
-#define evex_encoded() (evex.mbs)
+#define evex_encoded() (evex.opcx)
 #define ea (state->ea)
 
 /* Undo DEBUG wrapper. */
@@ -3415,8 +3415,8 @@ x86_emulate(
     CASE_SIMD_ALL_FP(_EVEX, 0x0f, 0x5f):    /* vmax{p,s}{s,d} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     avx512f_all_fp:
         generate_exception_if((evex.w != (evex.pfx & VEX_PREFIX_DOUBLE_MASK) ||
-                               (ea.type != OP_REG && evex.brs &&
-                                (evex.pfx & VEX_PREFIX_SCALAR_MASK))),
+                               ((evex.pfx & VEX_PREFIX_SCALAR_MASK) &&
+                                (ea.type != OP_REG ? evex.brs : !evex.u))),
                               X86_EXC_UD);
         visa_check(f);
         if ( ea.type != OP_REG || !evex.brs )
@@ -3622,11 +3622,12 @@ x86_emulate(
         /* fall through */
     CASE_SIMD_SCALAR_FP(_EVEX, 0x0f, 0x2a): /* vcvtsi2s{s,d} r/m,xmm,xmm */
     CASE_SIMD_SCALAR_FP(_EVEX, 0x0f, 0x7b): /* vcvtusi2s{s,d} r/m,xmm,xmm */
-        generate_exception_if(evex.opmsk || (ea.type != OP_REG && evex.brs),
-                              X86_EXC_UD);
+        generate_exception_if(evex.opmsk, X86_EXC_UD);
         visa_check(f);
         if ( !evex.brs )
             avx512_vlen_check(true);
+        else
+            generate_exception_if(ea.type != OP_REG || !evex.u, X86_EXC_UD);
         get_fpu(X86EMUL_FPU_zmm);
 
         if ( ea.type == OP_MEM )
@@ -3741,12 +3742,13 @@ x86_emulate(
     CASE_SIMD_SCALAR_FP(_EVEX, 0x0f, 0x78): /* vcvtts{s,d}2usi xmm/mem,reg */
     CASE_SIMD_SCALAR_FP(_EVEX, 0x0f, 0x79): /* vcvts{s,d}2usi xmm/mem,reg */
         generate_exception_if((evex.reg != 0xf || !evex.RX || !evex.R ||
-                               evex.opmsk ||
-                               (ea.type != OP_REG && evex.brs)),
+                               evex.opmsk),
                               X86_EXC_UD);
         visa_check(f);
         if ( !evex.brs )
             avx512_vlen_check(true);
+        else
+            generate_exception_if(ea.type != OP_REG || !evex.u, X86_EXC_UD);
         get_fpu(X86EMUL_FPU_zmm);
         opc = init_evex(stub);
         goto cvts_2si;
@@ -3816,12 +3818,13 @@ x86_emulate(
     CASE_SIMD_PACKED_FP(_EVEX, 0x0f, 0x2e): /* vucomis{s,d} xmm/mem,xmm */
     CASE_SIMD_PACKED_FP(_EVEX, 0x0f, 0x2f): /* vcomis{s,d} xmm/mem,xmm */
         generate_exception_if((evex.reg != 0xf || !evex.RX || evex.opmsk ||
-                               (ea.type != OP_REG && evex.brs) ||
                                evex.w != evex.pfx),
                               X86_EXC_UD);
         visa_check(f);
         if ( !evex.brs )
             avx512_vlen_check(true);
+        else
+            generate_exception_if(ea.type != OP_REG || !evex.u, X86_EXC_UD);
         get_fpu(X86EMUL_FPU_zmm);
 
         opc = init_evex(stub);
@@ -5389,8 +5392,8 @@ x86_emulate(
 
     CASE_SIMD_ALL_FP(_EVEX, 0x0f, 0xc2): /* vcmp{p,s}{s,d} $imm8,[xyz]mm/mem,[xyz]mm,k{k} */
         generate_exception_if((evex.w != (evex.pfx & VEX_PREFIX_DOUBLE_MASK) ||
-                               (ea.type != OP_REG && evex.brs &&
-                                (evex.pfx & VEX_PREFIX_SCALAR_MASK)) ||
+                               ((evex.pfx & VEX_PREFIX_SCALAR_MASK) &&
+                                (ea.type != OP_REG ? evex.brs : !evex.u)) ||
                                !evex.r || !evex.R || evex.z),
                               X86_EXC_UD);
         visa_check(f);
@@ -6088,9 +6091,10 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xbd): /* vfnmadd231s{s,d} xmm/mem,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xbf): /* vfnmsub231s{s,d} xmm/mem,xmm,xmm{k} */
         visa_check(f);
-        generate_exception_if(ea.type != OP_REG && evex.brs, X86_EXC_UD);
         if ( !evex.brs )
             avx512_vlen_check(true);
+        else
+            generate_exception_if(ea.type != OP_REG || !evex.u, X86_EXC_UD);
         goto simd_zmm;
 
     case X86EMUL_OPC_66(0x0f38, 0x37): /* pcmpgtq xmm/m128,xmm */
@@ -7262,7 +7266,8 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x0a): /* vrndscaless $imm8,xmm/mem,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x0b): /* vrndscalesd $imm8,xmm/mem,xmm,xmm{k} */
-        generate_exception_if(ea.type != OP_REG && evex.brs, X86_EXC_UD);
+        generate_exception_if(ea.type != OP_REG ? evex.brs : !evex.u,
+                              X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x08): /* vrndscaleps $imm8,[xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x09): /* vrndscalepd $imm8,[xyz]mm/mem,[xyz]mm{k} */
@@ -7272,7 +7277,8 @@ x86_emulate(
         goto simd_imm8_zmm;
 
     case X86EMUL_OPC_EVEX(0x0f3a, 0x0a): /* vrndscalesh $imm8,xmm/mem,xmm,xmm{k} */
-        generate_exception_if(ea.type != OP_REG && evex.brs, X86_EXC_UD);
+        generate_exception_if(ea.type != OP_REG ? evex.brs : !evex.u,
+                              X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX(0x0f3a, 0x08): /* vrndscaleph $imm8,[xyz]mm/mem,[xyz]mm{k} */
         visa_check(_fp16);
@@ -7605,9 +7611,10 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x27): /* vgetmants{s,d} $imm8,xmm/mem,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x55): /* vfixupimms{s,d} $imm8,xmm/mem,xmm,xmm{k} */
         visa_check(f);
-        generate_exception_if(ea.type != OP_REG && evex.brs, X86_EXC_UD);
         if ( !evex.brs )
             avx512_vlen_check(true);
+        else
+            generate_exception_if(ea.type != OP_REG || !evex.u, X86_EXC_UD);
         goto simd_imm8_zmm;
 
     case X86EMUL_OPC_EVEX(0x0f3a, 0x27): /* vgetmantsh $imm8,xmm/mem,xmm,xmm{k} */
@@ -7617,7 +7624,7 @@ x86_emulate(
         if ( !evex.brs )
             avx512_vlen_check(true);
         else
-            generate_exception_if(ea.type != OP_REG, X86_EXC_UD);
+            generate_exception_if(ea.type != OP_REG || !evex.u, X86_EXC_UD);
         goto simd_imm8_zmm;
 
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x30): /* kshiftr{b,w} $imm8,k,k */
@@ -7805,7 +7812,7 @@ x86_emulate(
         goto avx512f_imm8_no_sae;
 
     case X86EMUL_OPC_EVEX_F3(0x0f3a, 0xc2): /* vcmpsh $imm8,xmm/mem,xmm,k{k} */
-        generate_exception_if(ea.type != OP_REG && evex.brs, X86_EXC_UD);
+        generate_exception_if(ea.type != OP_REG ? evex.brs : !evex.u, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX(0x0f3a, 0xc2): /* vcmpph $imm8,[xyz]mm/mem,[xyz]mm,k{k} */
         visa_check(_fp16);
@@ -7982,10 +7989,11 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(6, 0xbd): /* vfnmadd231sh xmm/m16,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0xbf): /* vfnmsub231sh xmm/m16,xmm,xmm{k} */
         visa_check(_fp16);
-        generate_exception_if(evex.w || (ea.type != OP_REG && evex.brs),
-                              X86_EXC_UD);
+        generate_exception_if(evex.w, X86_EXC_UD);
         if ( !evex.brs )
             avx512_vlen_check(true);
+        else
+            generate_exception_if(ea.type != OP_REG || !evex.u, X86_EXC_UD);
         goto simd_zmm;
 
     case X86EMUL_OPC_EVEX_66(6, 0x4c): /* vrcpph [xyz]mm/mem,[xyz]mm{k} */
@@ -8015,7 +8023,9 @@ x86_emulate(
         unsigned int src1 = ~evex.reg;
 
         visa_check(_fp16);
-        generate_exception_if(evex.w || ((b & 1) && ea.type != OP_REG && evex.brs),
+        generate_exception_if((evex.w ||
+                               ((b & 1) &&
+                                (ea.type != OP_REG ? evex.brs : !evex.u))),
                               X86_EXC_UD);
         if ( mode_64bit() )
             src1 = (src1 & 0xf) | (!evex.RX << 4);


