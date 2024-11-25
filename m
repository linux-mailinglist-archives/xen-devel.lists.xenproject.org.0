Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 433B29D88BE
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 16:06:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842710.1258386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFaf9-0003fb-51; Mon, 25 Nov 2024 15:06:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842710.1258386; Mon, 25 Nov 2024 15:06:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFaf9-0003d2-1g; Mon, 25 Nov 2024 15:06:07 +0000
Received: by outflank-mailman (input) for mailman id 842710;
 Mon, 25 Nov 2024 15:06:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mqqh=SU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tFaf8-0003aM-9p
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 15:06:06 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9bede5e-ab3e-11ef-a0cd-8be0dac302b0;
 Mon, 25 Nov 2024 16:06:03 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-aa545dc7105so243793566b.3
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2024 07:06:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa50b2f045asm469719466b.53.2024.11.25.07.06.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 07:06:02 -0800 (PST)
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
X-Inumbo-ID: c9bede5e-ab3e-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzEiLCJoZWxvIjoibWFpbC1lajEteDYzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImM5YmVkZTVlLWFiM2UtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNTQ3MTYzLjQ1MDU5Niwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732547163; x=1733151963; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yqkCIJ2tVmJv728wU5gdz5zznvh4/8W2wXL6EHceXqU=;
        b=GDftf+MmeG/dgWfHmzhxgJ7COpD8oMSh+RvPDhLNSOmVjEA9zZdh/2qVweV7Uo4vyE
         YeWfN/u4PYux299bMv5asrFJG7fkomWZFRYw4m9yko4OX6tu4Kmfo14MHNsoTKGzgUmw
         sXF4L5Ze8bkmtxA+ibphuR/V71UCcuo75Mhp/3SQihkBWdP2Yi7t9yGxU/cPojTI06WS
         R+32HFgYKAnQuovGkfGgS0wvoaxKV6QNAx2A1M5csO3xq7MMHOHsBXaKL49ND+IJ4nnQ
         7NVCesradE9gxfl5A2IE3qe2DU838S6OsTS9y+7cj17SYC5bvavVZK+46fBgXhJk6eAL
         7mYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732547163; x=1733151963;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yqkCIJ2tVmJv728wU5gdz5zznvh4/8W2wXL6EHceXqU=;
        b=R4/cWR7VNhAq/Qd9uA/HFG9UTpLIWmd+n8xUDZ/K/biOQCEEks/ZRFjR25GNbLIX1o
         yf5/deNhYvTSQOkP68pz7uB0mFPlJNSMEIL7c7TXXF/agg+M3dWO73+nIVqUd1Jh2GOL
         mf6W+8oRBNgxW93phEvq0wqIz93q3xPN6H180lBE0yWA2ZTiEOeccf03d6sgId8lly5Q
         geMmGeQ30kdDuPUcvJprRDfNx4Gs6eupjxeB5lC6rASBMUZrts2B1VbjrKHtK9C2kaLV
         qi3pl/5GeGzUKYqN0fhPCi/RGOM+gkpn9jG+Iq5g+lS8h8zQUb5UcXs1XuwORZaz7Wvq
         IS/A==
X-Gm-Message-State: AOJu0YzuUdNyV3dJ3NRgjIa20iKDmqX8vaY6b+cnO+n8GQIRmSJ3NWKn
	UuQTIwoW3OTPv06LTPfAvrNG7sMxwSmC37Z+RE+7qRgTbJ1CDhVPkrSrQ0jQ2p1SXjjj44fhW60
	=
X-Gm-Gg: ASbGncvo7g0ewGh2cftMKeKktzEyQL8iVCUBzsAiBlktoWcawdRvymxj9myaEqLYXxf
	J60pOe09KUOtouUSboh051KYHTFCc8wo/4yy8XOceTdTOlDa/5YTFpvjD4G4G2UUETOt6EvcPWg
	0Wjo/sVVQ3VzcorY1TMAveCdDVF5WT0Is/OoicQzLbab5TZluF9i+K8YkBe+e5W8qPLRTD9s3qX
	qiuLE3QAQfbEk/tD+TGL4z0hD3BT3vxVp4ZZGXujzp3Ek+ajTzHwFuEpaN4Zt8X5GE5qIaQ754l
	nzwDdhFuVoJdKCouPVdJJGaG+wHBXh/NkNs=
X-Google-Smtp-Source: AGHT+IHeQXIDvY2DZDnTK8x+no1UFPpn2IpLx4376TCdBzhJCJZ15QjPuhcRxIvZruQ+mOzCvwpAGA==
X-Received: by 2002:a17:906:4c2:b0:aa5:da4:3c0a with SMTP id a640c23a62f3a-aa50da43c96mr857035166b.59.1732547162453;
        Mon, 25 Nov 2024 07:06:02 -0800 (PST)
Message-ID: <ba406332-b9d8-4ee3-8d07-4777d62f199f@suse.com>
Date: Mon, 25 Nov 2024 16:06:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v7 1/7] x86emul: support LKGS
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

Provide support for this insn, which is a prereq to FRED. CPUID-wise
introduce both its, FRED's, and the NMI_SRC bit at this occasion, thus
allowing to also express the dependency right away.

While adding a testcase, also add a SWAPGS one. In order to not affect
the behavior of pre-existing tests, install write_{segment,msr} hooks
only transiently.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Instead of ->read_segment() we could of course also use ->read_msr() to
fetch the original GS base. I don't think I can see a clear advantage of
either approach; the way it's done it matches how we handle SWAPGS.

For PV save_segments() would need adjustment, but the insn being
restricted to ring 0 means PV guests can't use it anyway (unless we
wanted to emulate it as another privileged insn).
---
v6: Use MSR constants in test harness. S->s in cpufeatureset.h. Add
    NMI_SRC feature bits. Re-base.
v5: Re-base.
v3: Add dependency on LM. Re-base.
v2: Use X86_EXC_*. Add comments.

--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -326,6 +326,7 @@ static const struct {
     { { 0x00, 0x18 }, { 2, 2 }, T, R }, /* ltr */
     { { 0x00, 0x20 }, { 2, 2 }, T, R }, /* verr */
     { { 0x00, 0x28 }, { 2, 2 }, T, R }, /* verw */
+    { { 0x00, 0x30 }, { 0, 2 }, T, R, pfx_f2 }, /* lkgs */
     { { 0x01, 0x00 }, { 2, 2 }, F, W }, /* sgdt */
     { { 0x01, 0x08 }, { 2, 2 }, F, W }, /* sidt */
     { { 0x01, 0x10 }, { 2, 2 }, F, R }, /* lgdt */
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -672,6 +672,10 @@ static int blk(
     return x86_emul_blk((void *)offset, p_data, bytes, eflags, state, ctxt);
 }
 
+#ifdef __x86_64__
+static unsigned long gs_base, gs_base_shadow;
+#endif
+
 static int read_segment(
     enum x86_segment seg,
     struct segment_register *reg,
@@ -681,8 +685,30 @@ static int read_segment(
         return X86EMUL_UNHANDLEABLE;
     memset(reg, 0, sizeof(*reg));
     reg->p = 1;
+
+#ifdef __x86_64__
+    if ( seg == x86_seg_gs )
+        reg->base = gs_base;
+#endif
+
+    return X86EMUL_OKAY;
+}
+
+#ifdef __x86_64__
+static int write_segment(
+    enum x86_segment seg,
+    const struct segment_register *reg,
+    struct x86_emulate_ctxt *ctxt)
+{
+    if ( !is_x86_user_segment(seg) )
+        return X86EMUL_UNHANDLEABLE;
+
+    if ( seg == x86_seg_gs )
+        gs_base = reg->base;
+
     return X86EMUL_OKAY;
 }
+#endif
 
 static int read_msr(
     unsigned int reg,
@@ -695,6 +721,20 @@ static int read_msr(
         *val = ctxt->addr_size > 32 ? EFER_LME | EFER_LMA : 0;
         return X86EMUL_OKAY;
 
+#ifdef __x86_64__
+    case MSR_GS_BASE:
+        if ( ctxt->addr_size < 64 )
+            break;
+        *val = gs_base;
+        return X86EMUL_OKAY;
+
+    case MSR_SHADOW_GS_BASE:
+        if ( ctxt->addr_size < 64 )
+            break;
+        *val = gs_base_shadow;
+        return X86EMUL_OKAY;
+#endif
+
     case MSR_TSC_AUX:
 #define TSC_AUX_VALUE 0xCACACACA
         *val = TSC_AUX_VALUE;
@@ -704,6 +744,31 @@ static int read_msr(
     return X86EMUL_UNHANDLEABLE;
 }
 
+#ifdef __x86_64__
+static int write_msr(
+    unsigned int reg,
+    uint64_t val,
+    struct x86_emulate_ctxt *ctxt)
+{
+    switch ( reg )
+    {
+    case MSR_GS_BASE:
+        if ( ctxt->addr_size < 64 || !is_canonical_address(val) )
+            break;
+        gs_base = val;
+        return X86EMUL_OKAY;
+
+    case MSR_SHADOW_GS_BASE:
+        if ( ctxt->addr_size < 64 || !is_canonical_address(val) )
+            break;
+        gs_base_shadow = val;
+        return X86EMUL_OKAY;
+    }
+
+    return X86EMUL_UNHANDLEABLE;
+}
+#endif
+
 #define INVPCID_ADDR 0x12345678
 #define INVPCID_PCID 0x123
 
@@ -1338,6 +1403,41 @@ int main(int argc, char **argv)
         printf("%u bytes read - ", bytes_read);
         goto fail;
     }
+    printf("okay\n");
+
+    emulops.write_segment = write_segment;
+    emulops.write_msr     = write_msr;
+
+    printf("%-40s", "Testing swapgs...");
+    instr[0] = 0x0f; instr[1] = 0x01; instr[2] = 0xf8;
+    regs.eip = (unsigned long)&instr[0];
+    gs_base = 0xffffeeeecccc8888UL;
+    gs_base_shadow = 0x0000111122224444UL;
+    rc = x86_emulate(&ctxt, &emulops);
+    if ( (rc != X86EMUL_OKAY) ||
+         (regs.eip != (unsigned long)&instr[3]) ||
+         (gs_base != 0x0000111122224444UL) ||
+         (gs_base_shadow != 0xffffeeeecccc8888UL) )
+        goto fail;
+    printf("okay\n");
+
+    printf("%-40s", "Testing lkgs 2(%rdx)...");
+    instr[0] = 0xf2; instr[1] = 0x0f; instr[2] = 0x00; instr[3] = 0x72; instr[4] = 0x02;
+    regs.eip = (unsigned long)&instr[0];
+    regs.edx = (unsigned long)res;
+    res[0]   = 0x00004444;
+    res[1]   = 0x8888cccc;
+    i = cpu_policy.extd.nscb; cpu_policy.extd.nscb = true; /* for AMD */
+    rc = x86_emulate(&ctxt, &emulops);
+    if ( (rc != X86EMUL_OKAY) ||
+         (regs.eip != (unsigned long)&instr[5]) ||
+         (gs_base != 0x0000111122224444UL) ||
+         gs_base_shadow )
+        goto fail;
+
+    cpu_policy.extd.nscb = i;
+    emulops.write_segment = NULL;
+    emulops.write_msr     = NULL;
 #endif
     printf("okay\n");
 
--- a/tools/tests/x86_emulator/x86-emulate.c
+++ b/tools/tests/x86_emulator/x86-emulate.c
@@ -85,6 +85,7 @@ bool emul_test_init(void)
     cpu_policy.feat.invpcid = true;
     cpu_policy.feat.adx = true;
     cpu_policy.feat.rdpid = true;
+    cpu_policy.feat.lkgs = true;
     cpu_policy.feat.wrmsrns = true;
     cpu_policy.extd.clzero = true;
 
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -744,8 +744,12 @@ decode_twobyte(struct x86_emulate_state
         case 0:
             s->desc |= DstMem | SrcImplicit | Mov;
             break;
+        case 6:
+            if ( !(s->modrm_reg & 1) && mode_64bit() )
+            {
         case 2: case 4:
-            s->desc |= SrcMem16;
+                s->desc |= SrcMem16;
+            }
             break;
         }
         break;
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -594,6 +594,7 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_avx_vnni()    (ctxt->cpuid->feat.avx_vnni)
 #define vcpu_has_avx512_bf16() (ctxt->cpuid->feat.avx512_bf16)
 #define vcpu_has_cmpccxadd()   (ctxt->cpuid->feat.cmpccxadd)
+#define vcpu_has_lkgs()        (ctxt->cpuid->feat.lkgs)
 #define vcpu_has_wrmsrns()     (ctxt->cpuid->feat.wrmsrns)
 #define vcpu_has_avx_ifma()    (ctxt->cpuid->feat.avx_ifma)
 #define vcpu_has_avx_vnni_int8() (ctxt->cpuid->feat.avx_vnni_int8)
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -2873,8 +2873,35 @@ x86_emulate(
                 break;
             }
             break;
-        default:
-            generate_exception_if(true, X86_EXC_UD);
+        case 6: /* lkgs */
+            generate_exception_if((modrm_reg & 1) || vex.pfx != vex_f2,
+                                  X86_EXC_UD);
+            generate_exception_if(!mode_64bit() || !mode_ring0(), X86_EXC_UD);
+            vcpu_must_have(lkgs);
+            fail_if(!ops->read_segment || !ops->read_msr ||
+                    !ops->write_segment || !ops->write_msr);
+            if ( (rc = ops->read_msr(MSR_SHADOW_GS_BASE, &msr_val,
+                                     ctxt)) != X86EMUL_OKAY ||
+                 (rc = ops->read_segment(x86_seg_gs, &sreg,
+                                         ctxt)) != X86EMUL_OKAY )
+                goto done;
+            dst.orig_val = sreg.base; /* Preserve full GS Base. */
+            if ( (rc = protmode_load_seg(x86_seg_gs, src.val, false, &sreg,
+                                         ctxt, ops)) != X86EMUL_OKAY ||
+                 /* Write (32-bit) base into SHADOW_GS. */
+                 (rc = ops->write_msr(MSR_SHADOW_GS_BASE, sreg.base,
+                                      ctxt)) != X86EMUL_OKAY )
+                goto done;
+            sreg.base = dst.orig_val; /* Reinstate full GS Base. */
+            if ( (rc = ops->write_segment(x86_seg_gs, &sreg,
+                                          ctxt)) != X86EMUL_OKAY )
+            {
+                /* Best effort unwind (i.e. no real error checking). */
+                if ( ops->write_msr(MSR_SHADOW_GS_BASE, msr_val,
+                                    ctxt) == X86EMUL_EXCEPTION )
+                    x86_emul_reset_event(ctxt);
+                goto done;
+            }
             break;
         }
         break;
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -307,7 +307,10 @@ XEN_CPUFEATURE(CMPCCXADD,    10*32+ 7) /
 XEN_CPUFEATURE(FZRM,         10*32+10) /*A  Fast Zero-length REP MOVSB */
 XEN_CPUFEATURE(FSRS,         10*32+11) /*A  Fast Short REP STOSB */
 XEN_CPUFEATURE(FSRCS,        10*32+12) /*A  Fast Short REP CMPSB/SCASB */
+XEN_CPUFEATURE(FRED,         10*32+17) /*   Flexible Return and Event Delivery */
+XEN_CPUFEATURE(LKGS,         10*32+18) /*s  Load Kernel GS Base */
 XEN_CPUFEATURE(WRMSRNS,      10*32+19) /*S  WRMSR Non-Serialising */
+XEN_CPUFEATURE(NMI_SRC,      10*32+20) /*   NMI-source reporting */
 XEN_CPUFEATURE(AMX_FP16,     10*32+21) /*   AMX FP16 instruction */
 XEN_CPUFEATURE(AVX_IFMA,     10*32+23) /*A  AVX-IFMA Instructions */
 
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -274,7 +274,8 @@ def crunch_numbers(state):
         # superpages, PCID and PKU are only available in 4 level paging.
         # NO_LMSL indicates the absense of Long Mode Segment Limits, which
         # have been dropped in hardware.
-        LM: [CX16, PCID, LAHF_LM, PAGE1GB, PKU, NO_LMSL, AMX_TILE, CMPCCXADD],
+        LM: [CX16, PCID, LAHF_LM, PAGE1GB, PKU, NO_LMSL, AMX_TILE, CMPCCXADD,
+             LKGS],
 
         # AMD K6-2+ and K6-III processors shipped with 3DNow+, beyond the
         # standard 3DNow in the earlier K6 processors.
@@ -343,6 +344,9 @@ def crunch_numbers(state):
         # computational instructions.  All further AMX features are built on top
         # of AMX-TILE.
         AMX_TILE: [AMX_BF16, AMX_INT8, AMX_FP16, AMX_COMPLEX],
+
+        # FRED builds on the LKGS instruction.
+        LKGS: [FRED],
     }
 
     deep_features = tuple(sorted(deps.keys()))


