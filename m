Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A019D88D4
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 16:09:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842743.1258426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFahn-0005mn-JO; Mon, 25 Nov 2024 15:08:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842743.1258426; Mon, 25 Nov 2024 15:08:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFahn-0005jg-EG; Mon, 25 Nov 2024 15:08:51 +0000
Received: by outflank-mailman (input) for mailman id 842743;
 Mon, 25 Nov 2024 15:08:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mqqh=SU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tFahm-0005MC-7b
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 15:08:50 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bc48ddd-ab3f-11ef-a0cd-8be0dac302b0;
 Mon, 25 Nov 2024 16:08:47 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5ceca0ec4e7so5680739a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2024 07:08:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d01d3fc777sm4241191a12.68.2024.11.25.07.08.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 07:08:46 -0800 (PST)
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
X-Inumbo-ID: 2bc48ddd-ab3f-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzUiLCJoZWxvIjoibWFpbC1lZDEteDUzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjJiYzQ4ZGRkLWFiM2YtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNTQ3MzI3Ljg5MDk3Niwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732547327; x=1733152127; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vMJ3nD3oKVSxJ6DebQ2MnZ/5Mpu0pbIHajJpb6pnss4=;
        b=ARYnI6ZWOtek8yx9mG7LHSJ2etAF+ivcNDv1cwpaPmdsGBBpK6K04lQk2j/wsupmHD
         dEEvll+W5KRKadAKi+8SkBaUUjfoH36+59hu51Jf1w1UhXsoDM5kLi/kP056WiyxN1OH
         NDOu8uZNPvj0jllLy6+0AcW9ix1Rn2TD0NVKLoZg6nBbcQMgA0MILMMJ/isnizWVoBOp
         5mrJtIbvw2KQaPFiEzreul8sGbHjO832yEvav5U/8sVAP/NavQbPKwR+uzhqM5faBsn8
         nymQ1TSYtTy68CBPOU5n9IKm8o8nnKrDb/KaVuZ8W6C41S3JrwK/T1vkUd4ihgH3hg4r
         lNtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732547327; x=1733152127;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vMJ3nD3oKVSxJ6DebQ2MnZ/5Mpu0pbIHajJpb6pnss4=;
        b=R9eKt2ZIUhcKEjnXJ6PYJ1qrvjNIDxNp75HgMT3e5+mV6lA1jQTXFe88+THdbW2z+h
         Ti90Zau6HtMatNEEEIxZjpHS7LhbPFza4VCXOHvKOc1/HB7kH8YjxBS3eJ1hGvkd8E46
         jH9C89PW2EuKjz4cwnrH6O+bBSvgaYbymcMF9/a3MfAE3eJHbp+GNDNTtbKkS7gJ7nWC
         Im/3fvDDdMIIPzhFwXrWAu9AdDRvWivZ7rsJbDTNu2OCC9QDhKueY0u5DKn2GD1oGXH9
         ucc9jfRCjEtIUB1kczloERM5wtBDWGRGUZq3kflt0cvoWKB44ySSLJWzXe/RtGIh5cPa
         w6/g==
X-Gm-Message-State: AOJu0YwYghbEdKhIqFdy8XkF5v6kA3hpYU97+vb3fmhdUMVKELAk0Pzd
	HwOT9WDnw1A25cTRrIl00hZlPyw/f3B1i8hW8ccdA3fJ2bdKGd46rtKQdZRip+CzOpFgvgIowMk
	=
X-Gm-Gg: ASbGncs9PZ6XJlOShsGVQ4RUuA1jJsWlkTVqsWGNhAyMaskG5BbP0w8whmyUYe+XbsQ
	p6tZHJos3LL83uC+G0VmJwsv9/lopgnHNK99N6Kj/VZmMyJW7YjAlGTHwdnYVKEQSraC0AociFD
	2PD6xs1XTT/Mf9g82HyCAiJGd29v8lKX60F/rNbH67SJYzeS6HRarpOXzuk3YyQK7aKvmGi/8wX
	amF0+mTH5K9v6ut2zumeLb36t3gWwv/5nMryZ/BmE5TPsYsFUYWVveRpzAOE0+ngTwR4QiCEO00
	hUAPHMDJ2Fxpt5XvBYroNzCa6fTMZrZWTqo=
X-Google-Smtp-Source: AGHT+IEvrrblXIuhRKqzlcEf+hyAoxalwdpP27w/SMOLuII8r5QjF3HFfrX9VELiuhg//manfbsrow==
X-Received: by 2002:a05:6402:1ed2:b0:5cf:e13b:eec1 with SMTP id 4fb4d7f45d1cf-5d0205a80cfmr14247020a12.3.1732547327253;
        Mon, 25 Nov 2024 07:08:47 -0800 (PST)
Message-ID: <b44232f8-5175-4365-9542-f1fae44b7aaa@suse.com>
Date: Mon, 25 Nov 2024 16:08:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v7 7/7] x86emul: support non-SIMD MOVRS
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <3a25cd59-e1cb-4bfc-b868-fb11599d22f5@suse.com>
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
In-Reply-To: <3a25cd59-e1cb-4bfc-b868-fb11599d22f5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

As we ignore cachability aspects of insns, they're treated like simple
MOVs.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v7: New.

--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -843,6 +843,9 @@ static const struct {
     { { 0x80 }, { 2, 2 }, T, R, pfx_66 }, /* invept */
     { { 0x81 }, { 2, 2 }, T, R, pfx_66 }, /* invvpid */
     { { 0x82 }, { 2, 2 }, T, R, pfx_66 }, /* invpcid */
+    { { 0x8a }, { 2, 2 }, T, R, pfx_no }, /* movrsb */
+    { { 0x8b }, { 2, 2 }, T, R, pfx_no }, /* movrs{d,q} */
+    { { 0x8b }, { 2, 2 }, T, R, pfx_66 }, /* movrsw */
     { { 0xc8 }, { 2, 2 }, T, R, pfx_no }, /* sha1nexte */
     { { 0xc9 }, { 2, 2 }, T, R, pfx_no }, /* sha1msg1 */
     { { 0xca }, { 2, 2 }, T, R, pfx_no }, /* sha1msg2 */
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -1864,6 +1864,29 @@ int main(int argc, char **argv)
     }
     else
         printf("skipped\n");
+
+    {
+        /* For the non-SIMD forms the emulator doesn't itself use MOVRS. */
+        bool movrs = cpu_policy.feat.movrs;
+
+        cpu_policy.feat.movrs = true;
+
+        printf("%-40s", "Testing movrs 6(%rdi),%si...");
+        instr[0] = 0x66; instr[1] = 0x0f; instr[2] = 0x38;
+        instr[3] = 0x8b; instr[4] = 0x77; instr[5] = 0x06;
+        regs.rip = (unsigned long)&instr[0];
+        regs.rsi = 0x8888777766665555UL;
+        regs.rdi = (unsigned long)res;
+        res[1]   = 0x88777788U;
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) ||
+             (regs.eip != (unsigned long)&instr[6]) ||
+             (regs.rsi != 0x8888777766668877UL) )
+            goto fail;
+        printf("okay\n");
+
+        cpu_policy.feat.movrs = movrs;
+    }
 #endif /* x86-64 */
 
     printf("%-40s", "Testing shld $1,%ecx,(%edx)...");
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -901,7 +901,8 @@ decode_0f38(struct x86_emulate_state *s,
 {
     switch ( ctxt->opcode & X86EMUL_OPC_MASK )
     {
-    case 0x00 ... 0xef:
+    case 0x00 ... 0x89:
+    case 0x8c ... 0xef:
     case 0xf2 ... 0xf5:
     case 0xf7:
     case 0xfa ... 0xff:
@@ -912,6 +913,13 @@ decode_0f38(struct x86_emulate_state *s,
         ctxt->opcode |= MASK_INSR(s->vex.pfx, X86EMUL_OPC_PFX_MASK);
         break;
 
+    case 0x8a ... 0x8b: /* movrs */
+        s->desc = DstReg | SrcMem | Mov;
+        if ( !(ctxt->opcode & 1) )
+            s->desc |= ByteOp;
+        s->simd_size = simd_none;
+        break;
+
     case X86EMUL_OPC_VEX_66(0, 0x2d): /* vmaskmovpd */
         s->simd_size = simd_packed_fp;
         break;
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -600,6 +600,7 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_wrmsrns()     (ctxt->cpuid->feat.wrmsrns)
 #define vcpu_has_avx_ifma()    (ctxt->cpuid->feat.avx_ifma)
 #define vcpu_has_msrlist()     (ctxt->cpuid->feat.msrlist)
+#define vcpu_has_movrs()       (ctxt->cpuid->feat.movrs)
 #define vcpu_has_msr_imm()     (ctxt->cpuid->feat.msr_imm)
 #define vcpu_has_avx_vnni_int8() (ctxt->cpuid->feat.avx_vnni_int8)
 #define vcpu_has_avx_ne_convert() (ctxt->cpuid->feat.avx_ne_convert)
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -6336,6 +6336,16 @@ x86_emulate(
         fault_suppression = false;
         goto avx512f_no_sae;
 
+#endif /* !X86EMUL_NO_SIMD */
+
+    case X86EMUL_OPC(0x0f38, 0x8a)
+     ... X86EMUL_OPC(0x0f38, 0x8b): /* movrs */
+        vcpu_must_have(movrs);
+        dst.val = src.val;
+        break;
+
+#ifndef X86EMUL_NO_SIMD
+
     case X86EMUL_OPC_VEX_66(0x0f38, 0x8c): /* vpmaskmov{d,q} mem,{x,y}mm,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x8e): /* vpmaskmov{d,q} {x,y}mm,{x,y}mm,mem */
         generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -314,6 +314,7 @@ XEN_CPUFEATURE(NMI_SRC,      10*32+20) /
 XEN_CPUFEATURE(AMX_FP16,     10*32+21) /*   AMX FP16 instruction */
 XEN_CPUFEATURE(AVX_IFMA,     10*32+23) /*A  AVX-IFMA Instructions */
 XEN_CPUFEATURE(MSRLIST,      10*32+27) /*s  MSR list instructions */
+XEN_CPUFEATURE(MOVRS,        10*32+31) /*a  MOV-read-shared instructions */
 
 /* AMD-defined CPU features, CPUID level 0x80000021.eax, word 11 */
 XEN_CPUFEATURE(NO_NEST_BP,         11*32+ 0) /*A  No Nested Data Breakpoints */
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -275,7 +275,7 @@ def crunch_numbers(state):
         # NO_LMSL indicates the absense of Long Mode Segment Limits, which
         # have been dropped in hardware.
         LM: [CX16, PCID, LAHF_LM, PAGE1GB, PKU, NO_LMSL, AMX_TILE, CMPCCXADD,
-             LKGS, MSRLIST, USER_MSR, MSR_IMM],
+             LKGS, MSRLIST, USER_MSR, MSR_IMM, MOVRS],
 
         # AMD K6-2+ and K6-III processors shipped with 3DNow+, beyond the
         # standard 3DNow in the earlier K6 processors.


