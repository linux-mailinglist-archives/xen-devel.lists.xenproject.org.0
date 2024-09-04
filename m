Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B3296BC45
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 14:28:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790191.1199902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slp7k-0005zo-C8; Wed, 04 Sep 2024 12:28:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790191.1199902; Wed, 04 Sep 2024 12:28:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slp7k-0005x0-8m; Wed, 04 Sep 2024 12:28:36 +0000
Received: by outflank-mailman (input) for mailman id 790191;
 Wed, 04 Sep 2024 12:28:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1slp7j-0005XG-8X
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 12:28:35 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3334457b-6ab9-11ef-99a1-01e77a169b0f;
 Wed, 04 Sep 2024 14:28:33 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a8695cc91c8so666866066b.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 05:28:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89891d77fasm802019666b.167.2024.09.04.05.28.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 05:28:32 -0700 (PDT)
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
X-Inumbo-ID: 3334457b-6ab9-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725452913; x=1726057713; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ACmABf3et7G3EUpWzG3zDr9KMbMjoVSdxW82uutbSTY=;
        b=ToIK/6PDiUzWev7yn/swIWk3NXWpUUZLSnVfM6rD4/hjcrwahqbWh4dFqcaqFtysyp
         JOB0mqHJhqrEiscPSV9kl8ro8L+aLR96IrkyTFC7Hn+c1IWr/Orrt0OFqr/ZfqI1fZMA
         6DNepMP7ljoCfZ/MxE3E91/AQQcKD8jhe0bkr3uzHgU23thhKfPkxsEGKmcy5dksC0Th
         GkkDY+3zgc9GffDIMB1pnTIRw+yA1pz8iG/jXqmc7jlRsbEWMv2VbgvS/xSntMRwYl0s
         s/wZaNn9iziprL9Lb1vugnUZ9XXxFd1HC4sl4kO/tsNqs0tJyNrkN/myyNM4n9j2XYVt
         wdDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725452913; x=1726057713;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ACmABf3et7G3EUpWzG3zDr9KMbMjoVSdxW82uutbSTY=;
        b=jvyn90RzXbaNvw45FWcvcP/tZs8GwkCnVsprKzzaTeg7o4kltxsxk//YrKyeQ1b2GK
         IO2Ic8BpMl83lMRY0FdwhnKlMLu3+DEL/wP0OAx+BZGw4UpmAmmENN5943+x5o+g+ddB
         WUZnSdwdxbxeZrxNuH6YerWtAApF0TpG7Of5ZTJvh/gi67QIXzA0xgxU8FX7KBiMQeS6
         XqiI3dWDF4KGo1rdM/h4JO7sBlu6QOc65tdUhlkaU1o3oKVG4hvYMWeb7SKqjkUPHgpa
         2kJ0c4yFabku25fj6Dty7ERQdqsFryFxcz1vs3J5X/Ln1eEzhWlMxIqtm56V0kRe3s1O
         sYiw==
X-Gm-Message-State: AOJu0Yzw117O9V1cjsFtrpfQQQKgU5tRKj12CCTYM1oq4maTwqESLYLt
	C/YlaGwAxjfD6gVeQQldpE3GqDHgDt9LyyJ+S1A0y0P5ppsF92uS7QNUE5QCP8cF2GJw1i3/QWE
	=
X-Google-Smtp-Source: AGHT+IFqvs3v6icHeAJFKuGiS2Aiq9Uq1xt7BUcyHdqOMaNDlt4ZUmdEuyiVJ4oBaStraADX1rycxw==
X-Received: by 2002:a17:907:968c:b0:a77:b01b:f949 with SMTP id a640c23a62f3a-a897f920183mr1744095466b.35.1725452912459;
        Wed, 04 Sep 2024 05:28:32 -0700 (PDT)
Message-ID: <313dc5c3-0a40-4313-b5b5-6d6fa52859d1@suse.com>
Date: Wed, 4 Sep 2024 14:28:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 2/7] x86emul: support CMPccXADD
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <0b9a0ae8-a39c-49d8-b4e7-f2a463128058@suse.com>
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
In-Reply-To: <0b9a0ae8-a39c-49d8-b4e7-f2a463128058@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Unconditionally wire this through the ->rmw() hook. Since x86_emul_rmw()
now wants to construct and invoke a stub, make stub_exn available to it
via a new field in the emulator state structure.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v5: Re-base.
v3: Add dependency on LM. Re-base.
v2: Use X86_EXC_*. Move past introduction of stub_exn in struct
    x86_emulate_state. Keep feature at just "a" for now.
---
SDE: -grr or -srf

--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1416,6 +1416,22 @@ static const struct vex {
     { { 0xdd }, 2, T, R, pfx_66, WIG, Ln }, /* vaesenclast */
     { { 0xde }, 2, T, R, pfx_66, WIG, Ln }, /* vaesdec */
     { { 0xdf }, 2, T, R, pfx_66, WIG, Ln }, /* vaesdeclast */
+    { { 0xe0 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpoxadd */
+    { { 0xe1 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpnoxadd */
+    { { 0xe2 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpbxadd */
+    { { 0xe3 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpnbxadd */
+    { { 0xe4 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpexadd */
+    { { 0xe5 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpnexadd */
+    { { 0xe6 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpbexadd */
+    { { 0xe7 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpaxadd */
+    { { 0xe8 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpsxadd */
+    { { 0xe9 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpnsxadd */
+    { { 0xea }, 2, F, W, pfx_66, Wn, L0 }, /* cmppxadd */
+    { { 0xeb }, 2, F, W, pfx_66, Wn, L0 }, /* cmpnpxadd */
+    { { 0xec }, 2, F, W, pfx_66, Wn, L0 }, /* cmplxadd */
+    { { 0xed }, 2, F, W, pfx_66, Wn, L0 }, /* cmpgexadd */
+    { { 0xee }, 2, F, W, pfx_66, Wn, L0 }, /* cmplexadd */
+    { { 0xef }, 2, F, W, pfx_66, Wn, L0 }, /* cmpgxadd */
     { { 0xf2 }, 2, T, R, pfx_no, Wn, L0 }, /* andn */
     { { 0xf3, 0x08 }, 2, T, R, pfx_no, Wn, L0 }, /* blsr */
     { { 0xf3, 0x10 }, 2, T, R, pfx_no, Wn, L0 }, /* blsmsk */
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -1402,6 +1402,78 @@ int main(int argc, char **argv)
     }
     printf("okay\n");
 
+    printf("%-40s", "Testing cmpbxadd %rbx,%r9,(%rdx)...");
+    if ( stack_exec && cpu_has_cmpccxadd )
+    {
+        instr[0] = 0xc4; instr[1] = 0x62; instr[2] = 0xe1; instr[3] = 0xe2; instr[4] = 0x0a;
+        regs.rip = (unsigned long)&instr[0];
+        regs.eflags = EFLAGS_ALWAYS_SET;
+        res[0] = 0x11223344;
+        res[1] = 0x01020304;
+        regs.rdx = (unsigned long)res;
+        regs.r9  = 0x0001020300112233UL;
+        regs.rbx = 0x0101010101010101UL;
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) ||
+             (regs.eip != (unsigned long)&instr[5]) ||
+             (regs.r9 != 0x0102030411223344UL) ||
+             (regs.rbx != 0x0101010101010101UL) ||
+             ((regs.eflags & EFLAGS_MASK) !=
+              (X86_EFLAGS_PF | EFLAGS_ALWAYS_SET)) ||
+             (res[0] != 0x11223344) ||
+             (res[1] != 0x01020304) )
+            goto fail;
+
+        regs.rip = (unsigned long)&instr[0];
+        regs.r9 <<= 8;
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) ||
+             (regs.eip != (unsigned long)&instr[5]) ||
+             (regs.r9 != 0x0102030411223344UL) ||
+             (regs.rbx != 0x0101010101010101UL) ||
+             ((regs.eflags & EFLAGS_MASK) !=
+              (X86_EFLAGS_CF | X86_EFLAGS_PF | X86_EFLAGS_SF |
+               EFLAGS_ALWAYS_SET)) ||
+             (res[0] != 0x12233445) ||
+             (res[1] != 0x02030405) )
+            goto fail;
+        printf("okay\n");
+
+        printf("%-40s", "Testing cmpsxadd %r9d,%ebx,4(%r10)...");
+        instr[1] = 0xc2; instr[2] = 0x31; instr[3] = 0xe8; instr[4] = 0x5a; instr[5] = 0x04;
+        regs.rip = (unsigned long)&instr[0];
+        res[2] = res[0] = ~0;
+        regs.r10 = (unsigned long)res;
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) ||
+             (regs.eip != (unsigned long)&instr[6]) ||
+             (regs.r9 != 0x0102030411223344UL) ||
+             (regs.rbx != 0x02030405) ||
+             ((regs.eflags & EFLAGS_MASK) != EFLAGS_ALWAYS_SET) ||
+             (res[0] + 1) ||
+             (res[1] != 0x02030405) ||
+             (res[2] + 1) )
+            goto fail;
+
+        regs.rip = (unsigned long)&instr[0];
+        regs.rbx <<= 8;
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) ||
+             (regs.eip != (unsigned long)&instr[6]) ||
+             (regs.r9 != 0x0102030411223344UL) ||
+             (regs.rbx != 0x02030405) ||
+             ((regs.eflags & EFLAGS_MASK) !=
+              (X86_EFLAGS_CF | X86_EFLAGS_PF | X86_EFLAGS_SF |
+               EFLAGS_ALWAYS_SET)) ||
+             (res[0] + 1) ||
+             (res[1] != 0x13253749) ||
+             (res[2] + 1) )
+            goto fail;
+        printf("okay\n");
+    }
+    else
+        printf("skipped\n");
+
     emulops.write_segment = write_segment;
     emulops.write_msr     = write_msr;
 
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -177,6 +177,7 @@ void wrpkru(unsigned int val);
 #define cpu_has_sm4        (cp.feat.sm4 && xcr0_mask(6))
 #define cpu_has_avx_vnni   (cp.feat.avx_vnni && xcr0_mask(6))
 #define cpu_has_avx512_bf16 (cp.feat.avx512_bf16 && xcr0_mask(0xe6))
+#define cpu_has_cmpccxadd  cp.feat.cmpccxadd
 #define cpu_has_avx_ifma   (cp.feat.avx_ifma && xcr0_mask(6))
 #define cpu_has_avx_vnni_int8 (cp.feat.avx_vnni_int8 && xcr0_mask(6))
 #define cpu_has_avx_ne_convert (cp.feat.avx_ne_convert && xcr0_mask(6))
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -189,6 +189,7 @@ static inline bool boot_cpu_has(unsigned
 #define cpu_has_sm4             boot_cpu_has(X86_FEATURE_SM4)
 #define cpu_has_avx_vnni        boot_cpu_has(X86_FEATURE_AVX_VNNI)
 #define cpu_has_avx512_bf16     boot_cpu_has(X86_FEATURE_AVX512_BF16)
+#define cpu_has_cmpccxadd       boot_cpu_has(X86_FEATURE_CMPCCXADD)
 #define cpu_has_avx_ifma        boot_cpu_has(X86_FEATURE_AVX_IFMA)
 
 /* CPUID level 0x00000007:1.edx */
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -440,6 +440,7 @@ static const struct ext0f38_table {
     [0xda] = { .simd_size = simd_other },
     [0xdb] = { .simd_size = simd_packed_int, .two_op = 1 },
     [0xdc ... 0xdf] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0xe0 ... 0xef] = { .to_mem = 1 },
     [0xf0] = { .two_op = 1 },
     [0xf1] = { .to_mem = 1, .two_op = 1 },
     [0xf2 ... 0xf3] = {},
@@ -933,6 +934,8 @@ decode_0f38(struct x86_emulate_state *s,
             ctxt->opcode |= MASK_INSR(s->vex.pfx, X86EMUL_OPC_PFX_MASK);
         break;
 
+    case X86EMUL_OPC_VEX_66(0, 0xe0) ...
+         X86EMUL_OPC_VEX_66(0, 0xef): /* cmp<cc>xadd */
     case X86EMUL_OPC_VEX(0, 0xf2):    /* andn */
     case X86EMUL_OPC_VEX(0, 0xf3):    /* Grp 17 */
     case X86EMUL_OPC_VEX(0, 0xf5):    /* bzhi */
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -261,6 +261,7 @@ struct x86_emulate_state {
         rmw_btc,
         rmw_btr,
         rmw_bts,
+        rmw_cmpccxadd,
         rmw_dec,
         rmw_inc,
         rmw_neg,
@@ -592,6 +593,7 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_sm4()         (ctxt->cpuid->feat.sm4)
 #define vcpu_has_avx_vnni()    (ctxt->cpuid->feat.avx_vnni)
 #define vcpu_has_avx512_bf16() (ctxt->cpuid->feat.avx512_bf16)
+#define vcpu_has_cmpccxadd()   (ctxt->cpuid->feat.cmpccxadd)
 #define vcpu_has_lkgs()        (ctxt->cpuid->feat.lkgs)
 #define vcpu_has_wrmsrns()     (ctxt->cpuid->feat.wrmsrns)
 #define vcpu_has_avx_ifma()    (ctxt->cpuid->feat.avx_ifma)
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -6837,6 +6837,15 @@ x86_emulate(
 
 #endif /* !X86EMUL_NO_SIMD */
 
+    case X86EMUL_OPC_VEX_66(0x0f38, 0xe0) ...
+         X86EMUL_OPC_VEX_66(0x0f38, 0xef): /* cmp<cc>xadd r,r,m */
+        generate_exception_if(!mode_64bit() || dst.type != OP_MEM || vex.l,
+                              X86_EXC_UD);
+        host_and_vcpu_must_have(cmpccxadd);
+        fail_if(!ops->rmw);
+        state->rmw = rmw_cmpccxadd;
+        break;
+
     case X86EMUL_OPC(0x0f38, 0xf0): /* movbe m,r */
     case X86EMUL_OPC(0x0f38, 0xf1): /* movbe r,m */
         vcpu_must_have(movbe);
@@ -8116,14 +8125,20 @@ x86_emulate(
     {
         ea.val = src.val;
         op_bytes = dst.bytes;
+        state->stub_exn = &stub_exn;
         rc = ops->rmw(dst.mem.seg, dst.mem.off, dst.bytes, &_regs.eflags,
                       state, ctxt);
+#ifdef __XEN__
+        if ( rc == X86EMUL_stub_failure )
+            goto emulation_stub_failure;
+#endif
         if ( rc != X86EMUL_OKAY )
             goto done;
 
         /* Some operations require a register to be written. */
         switch ( state->rmw )
         {
+        case rmw_cmpccxadd:
         case rmw_xchg:
         case rmw_xadd:
             switch ( dst.bytes )
@@ -8398,6 +8413,7 @@ int x86_emul_rmw(
     uint32_t *eflags,
     struct x86_emulate_state *s,
     struct x86_emulate_ctxt *ctxt)
+#define stub_exn (*s->stub_exn) /* for invoke_stub() */
 {
     unsigned long *dst = ptr;
 
@@ -8463,6 +8479,37 @@ int x86_emul_rmw(
 #undef BINOP
 #undef SHIFT
 
+#ifdef __x86_64__
+    case rmw_cmpccxadd:
+    {
+        struct x86_emulate_stub stub = {};
+        uint8_t *buf = get_stub(stub);
+        typeof(s->vex) *pvex = container_of(buf + 1, typeof(s->vex),
+                                            raw[0]);
+        unsigned long dummy;
+
+        buf[0] = 0xc4;
+        *pvex = s->vex;
+        pvex->b = 1;
+        pvex->r = 1;
+        pvex->reg = 0xf; /* rAX */
+        buf[3] = ctxt->opcode;
+        buf[4] = 0x11; /* reg=rDX r/m=(%RCX) */
+        buf[5] = 0xc3;
+
+        *eflags &= ~EFLAGS_MASK;
+        invoke_stub("",
+                    _POST_EFLAGS("[eflags]", "[mask]", "[tmp]"),
+                    "+m" (*dst), "+d" (s->ea.val),
+                    [tmp] "=&r" (dummy), [eflags] "+g" (*eflags)
+                    : "a" (*decode_vex_gpr(s->vex.reg, ctxt->regs, ctxt)),
+                      "c" (dst), [mask] "i" (EFLAGS_MASK));
+
+        put_stub(stub);
+        break;
+    }
+#endif
+
     case rmw_not:
         switch ( s->op_bytes )
         {
@@ -8558,7 +8605,13 @@ int x86_emul_rmw(
 #undef JCXZ
 
     return X86EMUL_OKAY;
+
+#if defined(__XEN__) && defined(__x86_64__)
+ emulation_stub_failure:
+    return X86EMUL_stub_failure;
+#endif
 }
+#undef stub_exn
 
 static void __init __maybe_unused build_assertions(void)
 {
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -293,6 +293,7 @@ XEN_CPUFEATURE(SM3,          10*32+ 1) /
 XEN_CPUFEATURE(SM4,          10*32+ 2) /*A  SM4 Instructions */
 XEN_CPUFEATURE(AVX_VNNI,     10*32+ 4) /*A  AVX-VNNI Instructions */
 XEN_CPUFEATURE(AVX512_BF16,  10*32+ 5) /*A  AVX512 BFloat16 Instructions */
+XEN_CPUFEATURE(CMPCCXADD,    10*32+ 7) /*a  CMPccXADD Instructions */
 XEN_CPUFEATURE(FZRM,         10*32+10) /*A  Fast Zero-length REP MOVSB */
 XEN_CPUFEATURE(FSRS,         10*32+11) /*A  Fast Short REP STOSB */
 XEN_CPUFEATURE(FSRCS,        10*32+12) /*A  Fast Short REP CMPSB/SCASB */
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -274,7 +274,7 @@ def crunch_numbers(state):
         # superpages, PCID and PKU are only available in 4 level paging.
         # NO_LMSL indicates the absense of Long Mode Segment Limits, which
         # have been dropped in hardware.
-        LM: [CX16, PCID, LAHF_LM, PAGE1GB, PKU, NO_LMSL, LKGS],
+        LM: [CX16, PCID, LAHF_LM, PAGE1GB, PKU, NO_LMSL, LKGS, CMPCCXADD],
 
         # AMD K6-2+ and K6-III processors shipped with 3DNow+, beyond the
         # standard 3DNow in the earlier K6 processors.


