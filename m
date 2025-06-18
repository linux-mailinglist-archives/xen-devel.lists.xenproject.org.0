Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 551D2ADE43E
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 09:07:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018858.1395739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRmtT-0007AM-Tg; Wed, 18 Jun 2025 07:07:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018858.1395739; Wed, 18 Jun 2025 07:07:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRmtT-000784-QH; Wed, 18 Jun 2025 07:07:35 +0000
Received: by outflank-mailman (input) for mailman id 1018858;
 Wed, 18 Jun 2025 07:07:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBi2=ZB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRmtS-00077n-DW
 for xen-devel@lists.xenproject.org; Wed, 18 Jun 2025 07:07:34 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e80ec7f4-4c12-11f0-a30a-13f23c93f187;
 Wed, 18 Jun 2025 09:07:33 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a4f71831abso5863280f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Jun 2025 00:07:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2365d8a5b26sm92610185ad.87.2025.06.18.00.07.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jun 2025 00:07:32 -0700 (PDT)
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
X-Inumbo-ID: e80ec7f4-4c12-11f0-a30a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750230453; x=1750835253; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kzoqyNL2bozGaoyRe3gin1wz6oRTYFxHZ457waajCrA=;
        b=FpJDOarmjCeCE5n0y6Xm33JhxrwFKil/XBgNGduB92z2qkJMosOX643wX6bXv/+TrP
         SRhHzBorq1hm0IdzNwGUgwlu9lA9VUj/UlTBNI/sL+S92Bo7y19ELIHkfjhcSvqBniIL
         b4UHg4r0267HcaDSaKGejw1ALvbcL91EqmfD5LvSzv+4C4clK5JpMVng0jFpWybefGxh
         bCD57eQHPksceFN+EB/IEnQWIaJnx4jWloYFwanL5lKRq2kjgoZ8P0ZB4sv/dIN7EgV6
         xKICv9X8Q9UByX2NKX5D09hDqXnlfcbzNRWtIofsBNK4ypxBz4hSpiCHP/5AyZeXEtrf
         IOpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750230453; x=1750835253;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kzoqyNL2bozGaoyRe3gin1wz6oRTYFxHZ457waajCrA=;
        b=gLrpxFAewYY1Dgn5nOwxc5U0OFpV9Y8JV6TMK914ZTpiv9zkycQ/+GhJMkwtB5taXf
         DCgrOD+kIq8kcR3olvWbwG8ah0CLFUiimFBaLOwfurHEPiDGd8JETNo5GZUB4lii1RNM
         rloWA6lmRS3ymJ4H8qEF3XT/0+HMjAGnFfrnL2yzV5GLAQWOJeU3vKejfIh3rJ0K3yhO
         ELVktidTl768mxATEsPuxTuaJqXb26yEu5rwuLE83O0FfVy0JZ3boXB1qkC3JZxs20Th
         B5p2Cg11Jf9IyhyF3c/ISBOya24aiDzcLyGXT31zEzyombTC322QIY1iVhjf3hr+4VFQ
         ny0g==
X-Gm-Message-State: AOJu0YyNPsWnDwUZB268rsaMdov1gBdtXBBxH3lTZYtX66jCCmMB4cuR
	zKQH4s2ErGEp6DT4/xbPBAvXCQ1ec3HrlYiZBMgxcvH9i3g4a8xxt7WA2+y9Nt2C0hGpE2FbJmI
	W490=
X-Gm-Gg: ASbGncsiy+uLAsAIwwOHGarupH5Hsq3zGbncUvU3eS4g9ZL3BjZPPUO4PuadarZLNYc
	pLBMlQjGzHZnMJED52dfcZopvgOK/ZjjLyJ3sGMY6/efoS+PegjTw2a6CFuwcR6O118/U6NX0l3
	KBCOaK9FQP6rUQQ8ZHiGYoLytZWSWtk2mnMF+ErMmlF6q+VQAD/Wo2MHQgOXunMD55zRiWTnrb5
	GXZfy3xj35GrVAqLJe5hLElSMPZ0j/yq/V07tkXoi3hkO+U99BBtyuQaCCmJIweGkt9grThymHF
	Kji4W2KH5kUS8qFufZzb9HYcWBN0xBDg8TimO97i23UxvciEZbbzwPYewZqjt+Hb1Gomp0MK0Wf
	U0NufKqWoBUaSAnhYQlE8hnLyIWgANFIjXeyQ+816nQ4zA2w=
X-Google-Smtp-Source: AGHT+IGBvd8LY/GHCZit8xjh49F0KaXFuMkzJRz/HRK1h0wGuT/fVdIVagU/q5bxNj50RcQsKNuOpA==
X-Received: by 2002:a05:6000:3104:b0:3a4:c713:7d8 with SMTP id ffacd0b85a97d-3a572373dc4mr12163715f8f.16.1750230452913;
        Wed, 18 Jun 2025 00:07:32 -0700 (PDT)
Message-ID: <8b2b6887-a780-47d9-9ef6-bd03c644b6e6@suse.com>
Date: Wed, 18 Jun 2025 09:07:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v8 6/7] x86emul: support MSR_IMM instructions
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <585f1b0b-6768-4f9c-8f9f-bcf6e20fbfb7@suse.com>
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
In-Reply-To: <585f1b0b-6768-4f9c-8f9f-bcf6e20fbfb7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Encoding-wise these are very similar to URDMSR/UWRMSR, so existing logic
is easy to extend.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC only for now, as the VMX part is missing: The existing intercepts
can't be re-used unmodified, as those require the MSR index to be
fetched from guest ECX.
---
v8: Don't mark the feature 's' just yet. Re-base.
v7: New.

--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1519,6 +1519,8 @@ static const struct vex {
     { { 0xdf }, 3, T, R, pfx_66, WIG, Ln }, /* vaeskeygenassist */
     { { 0xf0 }, 3, T, R, pfx_f2, Wn, L0 }, /* rorx */
 }, vex_map7[] = {
+    { { 0xf6, 0xc0 }, 6, F, N, pfx_f3, W0, L0 }, /* wrmsrns */
+    { { 0xf6, 0xc0 }, 6, F, N, pfx_f2, W0, L0 }, /* rdmsr */
     { { 0xf8, 0xc0 }, 6, F, N, pfx_f3, W0, L0 }, /* uwrmsr */
     { { 0xf8, 0xc0 }, 6, F, N, pfx_f2, W0, L0 }, /* urdmsr */
 };
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -1574,6 +1574,30 @@ int main(int argc, char **argv)
     if ( (rc != X86EMUL_EXCEPTION) ||
          (regs.rip != (unsigned long)&instr[0]) )
         goto fail;
+    printf("okay\n");
+
+    printf("%-40s", "Testing rdmsr $MSR_GS_BASE,%rdx...");
+    instr[0] = 0xc4; instr[1] = 0xe7; instr[2] = 0x7b; instr[3] = 0xf6; instr[4] = 0xc2;
+    *(uint32_t *)&instr[5] = MSR_GS_BASE;
+    regs.rip = (unsigned long)&instr[0];
+    regs.rdx = ~gs_base;
+    rc = x86_emulate(&ctxt, &emulops);
+    if ( (rc != X86EMUL_OKAY) ||
+         (regs.rip != (unsigned long)&instr[9]) ||
+         (regs.rdx != gs_base) )
+        goto fail;
+    printf("okay\n");
+
+    printf("%-40s", "Testing wrmsrns %rsi,$MSR_SHADOW_GS_BASE...");
+    instr[0] = 0xc4; instr[1] = 0xe7; instr[2] = 0x7a; instr[3] = 0xf6; instr[4] = 0xc6;
+    *(uint32_t *)&instr[5] = MSR_SHADOW_GS_BASE;
+    regs.rip = (unsigned long)&instr[0];
+    regs.rsi = 0x665544332211UL;
+    rc = x86_emulate(&ctxt, &emulops);
+    if ( (rc != X86EMUL_OKAY) ||
+         (regs.rip != (unsigned long)&instr[9]) ||
+         (gs_base_shadow != 0x665544332211UL) )
+        goto fail;
 
     emulops.write_msr     = NULL;
 #endif
--- a/tools/tests/x86_emulator/x86-emulate.c
+++ b/tools/tests/x86_emulator/x86-emulate.c
@@ -88,6 +88,7 @@ bool emul_test_init(void)
     cpu_policy.feat.lkgs = true;
     cpu_policy.feat.wrmsrns = true;
     cpu_policy.feat.msrlist = true;
+    cpu_policy.feat.msr_imm = true;
     cpu_policy.feat.user_msr = true;
     cpu_policy.extd.clzero = true;
 
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -1262,8 +1262,9 @@ int x86emul_decode(struct x86_emulate_st
                     case vex_map7:
                         opcode |= MASK_INSR(7, X86EMUL_OPC_EXT_MASK);
                         /*
-                         * No table lookup here for now, as there's only a single
-                         * opcode point (0xf8) populated in map 7.
+                         * No table lookup here for now, as there are only two
+                         * (very similar) opcode points (0xf6, 0xf8) populated
+                         * in map 7.
                          */
                         d = DstMem | SrcImm | ModRM | Mov;
                         s->op_bytes = 8;
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -613,6 +613,7 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_wrmsrns()     (ctxt->cpuid->feat.wrmsrns)
 #define vcpu_has_avx_ifma()    (ctxt->cpuid->feat.avx_ifma)
 #define vcpu_has_msrlist()     (ctxt->cpuid->feat.msrlist)
+#define vcpu_has_msr_imm()     (ctxt->cpuid->feat.msr_imm)
 #define vcpu_has_avx_vnni_int8() (ctxt->cpuid->feat.avx_vnni_int8)
 #define vcpu_has_avx_ne_convert() (ctxt->cpuid->feat.avx_ne_convert)
 #define vcpu_has_avx_vnni_int16() (ctxt->cpuid->feat.avx_vnni_int16)
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -7075,6 +7075,34 @@ x86_emulate(
         state->simd_size = simd_none;
         break;
 
+    case X86EMUL_OPC_VEX_F3(7, 0xf6): /* wrmsrns r64,imm32 */
+    case X86EMUL_OPC_VEX_F2(7, 0xf6): /* rdmsr imm32,r64 */
+        generate_exception_if(!mode_64bit() || ea.type != OP_REG, X86_EXC_UD);
+        generate_exception_if(vex.l || vex.w, X86_EXC_UD);
+        generate_exception_if(vex.opcx && ((modrm_reg & 7) || vex.reg != 0xf),
+                              X86_EXC_UD);
+        vcpu_must_have(msr_imm);
+        generate_exception_if(!mode_ring0(), X86_EXC_GP, 0);
+        if ( vex.pfx == vex_f2 )
+        {
+            /* urdmsr */
+            fail_if(!ops->read_msr);
+            if ( (rc = ops->read_msr(imm1, &msr_val, ctxt)) != X86EMUL_OKAY )
+                goto done;
+            dst.val = msr_val;
+            ASSERT(dst.type == OP_REG);
+            dst.bytes = 8;
+        }
+        else
+        {
+            /* wrmsrns */
+            fail_if(!ops->write_msr);
+            if ( (rc = ops->write_msr(imm1, dst.val, ctxt)) != X86EMUL_OKAY )
+                goto done;
+            dst.type = OP_NONE;
+        }
+        break;
+
     case X86EMUL_OPC_F3(0x0f38, 0xf8): /* enqcmds r,m512 / uwrmsr r64,r32 */
     case X86EMUL_OPC_F2(0x0f38, 0xf8): /* enqcmd r,m512 / urdmsr r32,r64 */
         if ( ea.type == OP_MEM )
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -351,6 +351,7 @@ XEN_CPUFEATURE(MCDT_NO,            13*32
 XEN_CPUFEATURE(UC_LOCK_DIS,        13*32+ 6) /*   UC-lock disable */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:1.ecx, word 14 */
+XEN_CPUFEATURE(MSR_IMM,            14*32+ 5) /*   RDMSR/WRMSRNS with immediate operand */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:1.edx, word 15 */
 XEN_CPUFEATURE(AVX_VNNI_INT8,      15*32+ 4) /*A  AVX-VNNI-INT8 Instructions */
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -275,7 +275,7 @@ def crunch_numbers(state):
         # NO_LMSL indicates the absense of Long Mode Segment Limits, which
         # have been dropped in hardware.
         LM: [CX16, PCID, LAHF_LM, PAGE1GB, PKU, NO_LMSL, AMX_TILE, CMPCCXADD,
-             LKGS, MSRLIST, USER_MSR],
+             LKGS, MSRLIST, USER_MSR, MSR_IMM],
 
         # AMD K6-2+ and K6-III processors shipped with 3DNow+, beyond the
         # standard 3DNow in the earlier K6 processors.


