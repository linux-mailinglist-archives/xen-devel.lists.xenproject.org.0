Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 950D9C8136D
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 16:01:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171313.1496359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNY44-0001Lr-4S; Mon, 24 Nov 2025 15:01:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171313.1496359; Mon, 24 Nov 2025 15:01:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNY44-0001KA-13; Mon, 24 Nov 2025 15:01:16 +0000
Received: by outflank-mailman (input) for mailman id 1171313;
 Mon, 24 Nov 2025 15:01:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNY42-0001E9-7z
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 15:01:14 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b07625b-c946-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 16:01:13 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-42b3ac40ae4so2454692f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 07:01:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7ec454csm27770395f8f.0.2025.11.24.07.01.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 07:01:11 -0800 (PST)
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
X-Inumbo-ID: 6b07625b-c946-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763996472; x=1764601272; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IFq0fOa0AliJrjdv6KE61u8m34ir06BtyRkuyvlXQzo=;
        b=cW4rPjmMGcxNZDHVQ+Ctl7iJQeJbU2RuVqqfrXyK4cj3JbA0eG9I0bj9dOIEqHWEux
         iDPXqu6clwkMAqRSV2G83leHZPIUJEwkmRoeGCYW6VbhS8DUg2IX757efUqZO9h3tcC/
         xcQi5RIZ9hrPH/biv0Oxwc+Y/lR4dal4MJBxitL1FwRLa7zXOEAT/80WFAzg8Fk04DXf
         9jg2xiFEIer7RzAAuMuC16PYXTH1RcvCBRUXuziAp/OT/8bJwO+ILBEilQ1lAAFXDxcG
         FuXv1MB1fiSg0HGnkSc8yXGMXE0UzUiMiH6qkEg8ttOdrE1/pJlH71ClKjLN/bYFRaRt
         r+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763996472; x=1764601272;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IFq0fOa0AliJrjdv6KE61u8m34ir06BtyRkuyvlXQzo=;
        b=mrM8dp06Nqwpn3T1+rkzpGtRPLDUM1T2BCd8xRpapIVPPLVy5h9DmxYjVEN5l2ltFL
         +OSJZlKtND/PUk/hdLQgQXbVg1ZQDcP/ZsCGfdzsM6O4WCgBLquWKl5t81FEwai/ePj2
         gG4VHhW2dNdF5X7F0MEtY+LmsQ9cqWfhadBHqSJYm9dD8WP24oJaIKHh9ajT2Naod/di
         U5LxeyneD8bDEXfXMpbIFzC0+8GRvv/aDEFAmV1tCufkkM7fwLlph4+Refd7jr5wd5DB
         XZ0+v75zLED1scnJnjOOCHYfPI3dakfge/QGs274uAc+KyKyJd8JKceMmUdZb86gKZkm
         geBw==
X-Gm-Message-State: AOJu0Yz31fYVTG36Z6rFln3bPl4WfbC0iyutQf2n5yS4BCotHHKh01Cj
	Ms8zngP083KsV/iO7BQwfoouhbeM0aZ+zy8z7s44LZ7Z7LZA7/SmRl//OZbMVlPjDRmQ13eNHiZ
	HZNo=
X-Gm-Gg: ASbGncuOsruVGseV1dgGf6zHUmX2XfZBp4jSmWcv0wJ0nYowexmpLkQMZOZeFTlIP0W
	vVXP6J+XClix/4764DPcg3ecrbqbPDSbYMtuDXV0VR4xLWLSo3rtGBjDI8GjuIAezDa8QGCu/Wo
	Y3q1+biNEdsd/I6iviclqrFcvVjddEbPgCs2w3qZh4zJnWiuU4KUg+WiLwup0gNp7XTGk8Muocy
	ZLf5gLHOd2tDFAk7ZtWf1UTKfr3uzzkY3jsoyY7L2W4xAdjgbSwQKr2fcEwUH6rABO2JNfqZE2y
	yJPvA8qqBIROQeVE8YW/xag+u5aHL14QQM89YiR+WlpWwCJChsa40hWRJcIS1kyNk6QVy9UaVlh
	YsmR/fVr3KhGbpd7ZbfUxS4KkyALdobUGxQGQF1/cX7xafCq5Xndfd2WUcQ6DReOUp6cWEqxvsn
	otyr+ryaadG6X1GKmSaXU0tmDCH1qpAPeT15nweaCCnyuMnzUxDgVDYmFcSazxydVnBYS9NySKd
	aE=
X-Google-Smtp-Source: AGHT+IFF4Llsf0YoGZs9VvaqHhCWVliIFzTIwSSjY68NMj7KGCXioqOlbLOr5TCgcfCwUyuvlaSuIQ==
X-Received: by 2002:a05:6000:1787:b0:42b:3e60:18c7 with SMTP id ffacd0b85a97d-42cc1cf45f5mr13049568f8f.36.1763996472103;
        Mon, 24 Nov 2025 07:01:12 -0800 (PST)
Message-ID: <9fdf318d-b838-40bb-8778-86f791902a4a@suse.com>
Date: Mon, 24 Nov 2025 16:01:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v9 08/10] x86emul: support non-SIMD MOVRS
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

As we ignore cachability aspects of insns, they're treated like simple
MOVs.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
SDE: -dmr
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
@@ -1869,6 +1869,29 @@ int main(int argc, char **argv)
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
+             (regs.rip != (unsigned long)&instr[6]) ||
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
@@ -614,6 +614,7 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_wrmsrns()     (ctxt->cpuid->feat.wrmsrns)
 #define vcpu_has_avx_ifma()    (ctxt->cpuid->feat.avx_ifma)
 #define vcpu_has_msrlist()     (ctxt->cpuid->feat.msrlist)
+#define vcpu_has_movrs()       (ctxt->cpuid->feat.movrs)
 #define vcpu_has_msr_imm()     (ctxt->cpuid->feat.msr_imm)
 #define vcpu_has_avx_vnni_int8() (ctxt->cpuid->feat.avx_vnni_int8)
 #define vcpu_has_avx_ne_convert() (ctxt->cpuid->feat.avx_ne_convert)
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -6323,6 +6323,16 @@ x86_emulate(
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
@@ -319,6 +319,7 @@ XEN_CPUFEATURE(AVX_IFMA,     10*32+23) /
 XEN_CPUFEATURE(LAM,          10*32+26) /*   Linear Address Masking */
 XEN_CPUFEATURE(MSRLIST,      10*32+27) /*   {RD,WR}MSRLIST instructions */
 XEN_CPUFEATURE(NO_INVD,      10*32+30) /*   INVD instruction unusable */
+XEN_CPUFEATURE(MOVRS,        10*32+31) /*a  MOV-read-shared instructions */
 
 /* AMD-defined CPU features, CPUID level 0x80000021.eax, word 11 */
 XEN_CPUFEATURE(NO_NEST_BP,         11*32+ 0) /*A  No Nested Data Breakpoints */
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -283,7 +283,7 @@ def crunch_numbers(state):
         # NO_LMSL indicates the absense of Long Mode Segment Limits, which
         # have been dropped in hardware.
         LM: [CX16, PCID, LAHF_LM, PAGE1GB, PKU, NO_LMSL, AMX_TILE, CMPCCXADD,
-             LKGS, MSRLIST, USER_MSR, MSR_IMM],
+             LKGS, MSRLIST, USER_MSR, MSR_IMM, MOVRS],
 
         # AMD K6-2+ and K6-III processors shipped with 3DNow+, beyond the
         # standard 3DNow in the earlier K6 processors.


