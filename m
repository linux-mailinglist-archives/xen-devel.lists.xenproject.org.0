Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9529ECA27
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 11:18:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854328.1267559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLJn7-0006q8-O3; Wed, 11 Dec 2024 10:18:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854328.1267559; Wed, 11 Dec 2024 10:18:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLJn7-0006nV-LH; Wed, 11 Dec 2024 10:18:01 +0000
Received: by outflank-mailman (input) for mailman id 854328;
 Wed, 11 Dec 2024 10:18:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HaM=TE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLJn6-0006nP-Lx
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 10:18:00 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 326ac184-b7a9-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 11:17:59 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-385deda28b3so4860142f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 02:17:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725e7efb381sm5737540b3a.117.2024.12.11.02.17.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 02:17:58 -0800 (PST)
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
X-Inumbo-ID: 326ac184-b7a9-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733912279; x=1734517079; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TmwKGqF6AW3IbD/rb2R5K+/4oOCjyt+s+wwmxJjKZqw=;
        b=WHBbSdivPbj8QnfyI4nJs7kYN9keDWnxKOHsvM9r7jLOISJCTSUTUUV6R2iiAuxZUv
         wGAzwD1AfQAfg0j/r4DvFrE/eallWF+hz6ZYvFs93jikpMhathCKdXU/weonKp2pmEqF
         3DQut5BxEL2Wej3qVxASuH5v5WeBareGOM1O7vRqhUp7X+45Z55FuSffLOrVuz1Z84v5
         FJiP/YQof4bSuhxjBYkPDyMlpCzNbyoZyy8oLN4vawarXktfzEfUD5+B6OqxR1qCmczx
         6T0LgpAWLHf0kbacCRlokrTSQET199oUVO5b1UlWC1B1kSdvEg1fFnzNm7bxN78qfZgb
         NOqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733912279; x=1734517079;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TmwKGqF6AW3IbD/rb2R5K+/4oOCjyt+s+wwmxJjKZqw=;
        b=PYykFGtEm1M0Hm4bBihyFvejB7z8TaEBSfZUuI62l4s5Lb0iHsbIbUyMqRPmdG0gVB
         edmAxPPwtJNTFjOKeMBdzY81ld0k9Poc3f2bQY+8HjFPxPsnI1q/3eFuQbtUqQTMU7A9
         LLiuGoE7XiDTTeeysiB+fWFioiuht8zf7Nz2/S2laJpEvOqpAKkkYvax0C1IxSD34Xno
         c6IQFv+bXBiJKPY4/zFFF/UYvAb5NgajB5TzQKfIOQTx+yjhaqydNCt+aDNqKCYmWsEU
         2YnLBzMjQVm8+ITnDf0TcTKgwGCUrGb+BtpR/XDGMkl4hiGajOYsmnGyAHeNgNfbcLeZ
         dxow==
X-Gm-Message-State: AOJu0Ywgy3FikTeb0uVlFm4EcVA21AKAWK7IWjriAzPd86Tg+CTspUje
	BrdAIW4uBtuV1Wj54ZGgKwje5GLMiVaCQvwfe5tXVYdd2iVUDELrSnokj/LZUH5wwAVLYEM/qf4
	=
X-Gm-Gg: ASbGncudO08ioTxUvtedtQ5uuqutMIMIQvAyQKGceOJKXmhXxsuSz5ayOF1+LOLjPdM
	vmXqJTrTBkffPvL/jB9Odm1euzfJB10GVoTOYY/cjf/3J1vjzA2UZwVDchK5XtjuC72DgU78OWI
	bIP7H2n5WEfbJf7dOeIvc/kt0IL2ob3WRRXrpNCDTeZyPrMDrhNnFZOXkunXo/3tsmjHKKsOUqI
	dlnzH+MGVC1Od1U1K3/XcyRR4vWChTfeJpm7MrWvdrMkUaBJaoIzcr8trTf0FgmC/PsgViU3ebt
	zkYy6ioQnQkUjmJotqxn7cDxnrSBSMcKI2TFmBg=
X-Google-Smtp-Source: AGHT+IHYns+zJ5XF2WPWdcbChZWerdH81qBQTWuW0SCyy4+qXESeEqWRgnO/PWMjzFjdWwZV1Hu7Ow==
X-Received: by 2002:a05:6000:440e:b0:385:fae2:f443 with SMTP id ffacd0b85a97d-3864cea43dcmr1329849f8f.34.1733912278995;
        Wed, 11 Dec 2024 02:17:58 -0800 (PST)
Message-ID: <6e2423e1-1dc0-44c2-b5ad-8ebae0a91566@suse.com>
Date: Wed, 11 Dec 2024 11:17:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 08/16] x86emul: support AVX10.2 scalar compare insns
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

Simply clone code from their V{,U}COMIS{S,D,H} counterparts.

While there drop a redundant EVEX.W check from V{,U}COMISH handling.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This still follows what spec version 001 says wrt embedded prefixed.
They were swapped to match other insns, yet so far no SDE is available
to run the test harness there with the flipped encoding.
---
SDE: ???
---
v3: New.

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -81,6 +81,7 @@ enum esz {
     ESZ_w,
     ESZ_bw,
     ESZ_fp16,
+#define ESZ_bf16 ESZ_fp16
 };
 
 #ifndef __i386__
@@ -711,6 +712,16 @@ static const struct test vpclmulqdq_all[
     INSN(pclmulqdq, 66, 0f3a, 44, vl, q_nb, vl)
 };
 
+static const struct test avx10_2_all[] = {
+    INSN(comsbf16,         66, map5, 2f,    el, bf16, el),
+    INSN(comxsd,           f3,   0f, 2f,    el,    q, el),
+    INSN(comxsh,           f2, map5, 2f,    el, fp16, el),
+    INSN(comxss,           f2,   0f, 2f,    el,    d, el),
+    INSN(ucomxsd,          f3,   0f, 2e,    el,    q, el),
+    INSN(ucomxsh,          f2, map5, 2e,    el, fp16, el),
+    INSN(ucomxss,          f2,   0f, 2e,    el,    d, el),
+};
+
 static const unsigned char vl_all[] = { VL_512, VL_128, VL_256 };
 static const unsigned char vl_128[] = { VL_128 };
 static const unsigned char vl_no128[] = { VL_512, VL_256 };
@@ -1130,5 +1141,8 @@ void evex_disp8_test(void *instr, struct
         RUN(vpclmulqdq, all);
 #undef RUN
     }
+
+    run(cpu_has_avx10_2, avx10_2, all);
+
 #undef run
 }
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1682,8 +1682,12 @@ static const struct evex {
     { { 0x2d }, 2, T, R, pfx_f2, Wn, LIG }, /* vcvtsd2si */
     { { 0x2e }, 2, T, R, pfx_no, W0, LIG }, /* vucomiss */
     { { 0x2e }, 2, T, R, pfx_66, W1, LIG }, /* vucomisd */
+    { { 0x2e }, 2, T, R, pfx_f3, W1, LIG }, /* vucomxsd */
+    { { 0x2e }, 2, T, R, pfx_f2, W0, LIG }, /* vucomxss */
     { { 0x2f }, 2, T, R, pfx_no, W0, LIG }, /* vcomiss */
     { { 0x2f }, 2, T, R, pfx_66, W1, LIG }, /* vcomisd */
+    { { 0x2f }, 2, T, R, pfx_f3, W1, LIG }, /* vcomxsd */
+    { { 0x2f }, 2, T, R, pfx_f2, W0, LIG }, /* vcomxss */
     { { 0x51 }, 2, T, R, pfx_no, W0, Ln }, /* vsqrtps */
     { { 0x51 }, 2, T, R, pfx_66, W1, Ln }, /* vsqrtpd */
     { { 0x51 }, 2, T, R, pfx_f3, W0, LIG }, /* vsqrtss */
@@ -2100,7 +2104,10 @@ static const struct evex {
     { { 0x2c }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvttsh2si */
     { { 0x2d }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvtsh2si */
     { { 0x2e }, 2, T, R, pfx_no, W0, LIG }, /* vucomish */
+    { { 0x2e }, 2, T, R, pfx_f2, W0, LIG }, /* vucomxsh */
     { { 0x2f }, 2, T, R, pfx_no, W0, LIG }, /* vcomish */
+    { { 0x2f }, 2, T, R, pfx_66, W0, LIG }, /* vcomsbf16 */
+    { { 0x2f }, 2, T, R, pfx_f2, W0, LIG }, /* vcomxsh */
     { { 0x51 }, 2, T, R, pfx_no, W0, Ln }, /* vsqrtph */
     { { 0x51 }, 2, T, R, pfx_f3, W0, LIG }, /* vsqrtsh */
     { { 0x58 }, 2, T, R, pfx_no, W0, Ln }, /* vaddph */
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -213,6 +213,8 @@ void wrpkru(unsigned int val);
                                      (cpu_policy.avx10.vsz256 || \
                                       cpu_policy.avx10.vsz512))
 #define cpu_has_avx10_1_512         (cpu_has_avx10_1 && cpu_policy.avx10.vsz512)
+#define cpu_has_avx10_2             (cpu_policy.avx10.version >= 2 && \
+                                     xcr0_mask(0xe6))
 
 #define cpu_has_xgetbv1             (cpu_has_xsave && cpu_policy.xstate.xgetbv1)
 
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -1521,9 +1521,8 @@ int x86emul_decode(struct x86_emulate_st
                     s->fp16 = true;
                 break;
 
-            case 0x2e: case 0x2f: /* v{,u}comish */
-                if ( !s->evex.pfx )
-                    s->fp16 = true;
+            case 0x2e: case 0x2f: /* v{,u}com{i,x}sh, vcomsbf16 */
+                s->fp16 = true;
                 s->simd_size = simd_none;
                 break;
 
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -304,7 +304,7 @@ struct x86_emulate_state {
     bool lock_prefix;
     bool not_64bit; /* Instruction not available in 64bit. */
     bool fpu_ctrl;  /* Instruction is an FPU control one. */
-    bool fp16;      /* Instruction has half-precision FP source operand. */
+    bool fp16;      /* Instruction has half-precision FP or BF16 source. */
     opcode_desc_t desc;
     union vex vex;
     union evex evex;
@@ -596,8 +596,8 @@ amd_like(const struct x86_emulate_ctxt *
 
 #define vcpu_has_avx10(minor)  (ctxt->cpuid->avx10.version >= (minor))
 
-#define vcpu_must_have(feat) \
-    generate_exception_if(!vcpu_has_##feat(), X86_EXC_UD)
+#define vcpu_must_have(feat, ...) \
+    generate_exception_if(!vcpu_has_##feat(__VA_ARGS__), X86_EXC_UD)
 
 #ifdef __XEN__
 /*
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -3813,7 +3813,6 @@ x86_emulate(
     case X86EMUL_OPC_EVEX(5, 0x2e): /* vucomish xmm/m16,xmm */
     case X86EMUL_OPC_EVEX(5, 0x2f): /* vcomish xmm/m16,xmm */
         visa_check(_fp16);
-        generate_exception_if(evex.w, X86_EXC_UD);
         /* fall through */
     CASE_SIMD_PACKED_FP(_EVEX, 0x0f, 0x2e): /* vucomis{s,d} xmm/mem,xmm */
     CASE_SIMD_PACKED_FP(_EVEX, 0x0f, 0x2f): /* vcomis{s,d} xmm/mem,xmm */
@@ -3821,6 +3820,7 @@ x86_emulate(
                                evex.w != evex.pfx),
                               X86_EXC_UD);
         visa_check(f);
+    vcomi_evex:
         if ( !evex.brs )
             avx512_vlen_check(true);
         else
@@ -3831,6 +3831,17 @@ x86_emulate(
         op_bytes = 2 << (!state->fp16 + evex.w);
         goto vcomi;
 
+    CASE_SIMD_SCALAR_FP(_EVEX, 0x0f, 0x2e): /* vucomxs{s,d} xmm/mem,xmm */
+    CASE_SIMD_SCALAR_FP(_EVEX, 0x0f, 0x2f): /* vcomxs{s,d} xmm/mem,xmm */
+    case X86EMUL_OPC_EVEX_F2(5, 0x2e):      /* vucomxsh xmm/m16,xmm */
+    case X86EMUL_OPC_EVEX_66(5, 0x2f):      /* vcomsbf16 xmm/m16,xmm */
+    case X86EMUL_OPC_EVEX_F2(5, 0x2f):      /* vcomxsh xmm/m16,xmm */
+        generate_exception_if((evex.reg != 0xf || !evex.RX || evex.opmsk ||
+                               evex.w != !(evex.pfx & 1)),
+                              X86_EXC_UD);
+        vcpu_must_have(avx10, 2);
+        goto vcomi_evex;
+
 #endif
 
     case X86EMUL_OPC(0x0f, 0x30): /* wrmsr */


