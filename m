Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 918563682D3
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 16:56:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115562.220531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZakZ-0006Jg-DY; Thu, 22 Apr 2021 14:56:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115562.220531; Thu, 22 Apr 2021 14:56:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZakZ-0006JF-9S; Thu, 22 Apr 2021 14:56:15 +0000
Received: by outflank-mailman (input) for mailman id 115562;
 Thu, 22 Apr 2021 14:56:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uib8=JT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZakX-0006J3-SL
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 14:56:13 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d8584a9d-4a1e-4881-916d-816828a3f1f5;
 Thu, 22 Apr 2021 14:56:12 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1EA42ABB1;
 Thu, 22 Apr 2021 14:56:12 +0000 (UTC)
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
X-Inumbo-ID: d8584a9d-4a1e-4881-916d-816828a3f1f5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619103372; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oPzs8oFNLCi5oM4f8KtDEq5j9aDmHv1L3If34/KJuW4=;
	b=Ea1YwjrfTjHdm6RC3GnBKBRVRAwBamaKIe8hjoe/AnGu1gzA/NUA36695NqufyYN2BQgMc
	7vxDQLLV9bZY0lSTOBEpCR1eE0zexrKK5RaWGTvXz3SpYooHDDDB7UwStDwzZ+bVrSR+QF
	VrVou5J4UaXTRqPKIRTfbIb9sRF/PEQ=
Subject: [PATCH v3 20/22] x86emul: support tile multiplication insns
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
Message-ID: <33ff565f-0e08-4dc6-c041-ad3422544d54@suse.com>
Date: Thu, 22 Apr 2021 16:56:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Since these don't allow for memory operands, the main thing to do here
is to check the large set of #UD conditions.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: New.

--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1349,6 +1349,11 @@ static const struct vex {
     { { 0x58 }, 2, T, R, pfx_66, W0, Ln }, /* vpbroadcastd */
     { { 0x59 }, 2, T, R, pfx_66, W0, Ln }, /* vpbroadcastq */
     { { 0x5a }, 2, F, R, pfx_66, W0, L1 }, /* vbroadcasti128 */
+    { { 0x5c, 0xc0 }, 2, F, N, pfx_f3, W0, L0 }, /* tdpbf16ps */
+    { { 0x5e, 0xc0 }, 2, F, N, pfx_no, W0, L0 }, /* tdpbuud */
+    { { 0x5e, 0xc0 }, 2, F, N, pfx_66, W0, L0 }, /* tdpbusd */
+    { { 0x5e, 0xc0 }, 2, F, N, pfx_f3, W0, L0 }, /* tdpbsud */
+    { { 0x5e, 0xc0 }, 2, F, N, pfx_f2, W0, L0 }, /* tdpbssd */
     { { 0x78 }, 2, T, R, pfx_66, W0, Ln }, /* vpbroadcastb */
     { { 0x79 }, 2, T, R, pfx_66, W0, Ln }, /* vpbroadcastw */
     { { 0x8c }, 2, F, R, pfx_66, Wn, Ln }, /* vpmaskmov{d,q} */
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -487,6 +487,8 @@ static const struct ext0f38_table {
     [0x59] = { .simd_size = simd_other, .two_op = 1, .d8s = 3 },
     [0x5a] = { .simd_size = simd_128, .two_op = 1, .d8s = 4 },
     [0x5b] = { .simd_size = simd_256, .two_op = 1, .d8s = d8s_vl_by_2 },
+    [0x5c] = { .simd_size = simd_other },
+    [0x5e] = { .simd_size = simd_other },
     [0x62] = { .simd_size = simd_packed_int, .two_op = 1, .d8s = d8s_bw },
     [0x63] = { .simd_size = simd_packed_int, .to_mem = 1, .two_op = 1, .d8s = d8s_bw },
     [0x64 ... 0x66] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
@@ -2049,7 +2051,9 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_avx512_4fmaps() (ctxt->cpuid->feat.avx512_4fmaps)
 #define vcpu_has_avx512_vp2intersect() (ctxt->cpuid->feat.avx512_vp2intersect)
 #define vcpu_has_serialize()   (ctxt->cpuid->feat.serialize)
+#define vcpu_has_amx_bf16()    (ctxt->cpuid->feat.amx_bf16)
 #define vcpu_has_amx_tile()    (ctxt->cpuid->feat.amx_tile)
+#define vcpu_has_amx_int8()    (ctxt->cpuid->feat.amx_int8)
 #define vcpu_has_avx_vnni()    (ctxt->cpuid->feat.avx_vnni)
 #define vcpu_has_avx512_bf16() (ctxt->cpuid->feat.avx512_bf16)
 
@@ -9799,6 +9803,59 @@ x86_emulate(
         generate_exception_if(ea.type != OP_MEM || !vex.l || vex.w, EXC_UD);
         goto simd_0f_avx2;
 
+    case X86EMUL_OPC_VEX_F3(0x0f38, 0x5c): /* tdpbf16ps tmm,tmm,tmm */
+    case X86EMUL_OPC_VEX(0x0f38, 0x5e):    /* tdpbuud tmm,tmm,tmm */
+    case X86EMUL_OPC_VEX_66(0x0f38, 0x5e): /* tdpbusd tmm,tmm,tmm */
+    case X86EMUL_OPC_VEX_F3(0x0f38, 0x5e): /* tdpbsud tmm,tmm,tmm */
+    case X86EMUL_OPC_VEX_F2(0x0f38, 0x5e): /* tdpbssd tmm,tmm,tmm */
+    {
+        unsigned int vreg = vex.reg ^ 0xf;
+
+        if ( ea.type != OP_REG )
+            goto unimplemented_insn;
+        generate_exception_if(!mode_64bit() || vex.l || vex.w, EXC_UD);
+        if ( b == 0x5c )
+            host_and_vcpu_must_have(amx_bf16);
+        else
+            host_and_vcpu_must_have(amx_int8);
+        generate_exception_if(modrm_reg == modrm_rm, EXC_UD);
+        generate_exception_if(modrm_reg == vreg, EXC_UD);
+        generate_exception_if(modrm_rm == vreg, EXC_UD);
+
+        get_fpu(X86EMUL_FPU_tile);
+        sttilecfg(&mmvalp->tilecfg);
+        generate_exception_if(!tiles_configured(&mmvalp->tilecfg), EXC_UD);
+
+        /* accum: modrm_reg */
+        generate_exception_if(!tile_valid(modrm_reg, &mmvalp->tilecfg), EXC_UD);
+        /* src1: modrm_rm */
+        generate_exception_if(!tile_valid(modrm_rm, &mmvalp->tilecfg), EXC_UD);
+        /* src2: vreg */
+        generate_exception_if(!tile_valid(vreg, &mmvalp->tilecfg), EXC_UD);
+
+        generate_exception_if(mmvalp->tilecfg.colsb[modrm_reg] & 3, EXC_UD);
+        /*
+         * These are redundant with the check just below.
+        generate_exception_if(mmvalp->tilecfg.colsb[modrm_rm] & 3, EXC_UD);
+        generate_exception_if(mmvalp->tilecfg.colsb[vreg] & 3, EXC_UD);
+         */
+
+        generate_exception_if(mmvalp->tilecfg.rows[modrm_reg] !=
+                              mmvalp->tilecfg.rows[modrm_rm], EXC_UD);
+        generate_exception_if(mmvalp->tilecfg.colsb[modrm_reg] !=
+                              mmvalp->tilecfg.colsb[vreg], EXC_UD);
+        generate_exception_if(mmvalp->tilecfg.colsb[modrm_rm] !=
+                              mmvalp->tilecfg.rows[vreg] * 4, EXC_UD);
+
+        generate_exception_if(mmvalp->tilecfg.colsb[vreg] >
+                              ctxt->cpuid->tmul.maxn, EXC_UD);
+        generate_exception_if(mmvalp->tilecfg.rows[vreg] >
+                              ctxt->cpuid->tmul.maxk, EXC_UD);
+
+        op_bytes = 1; /* fake */
+        goto simd_0f_common;
+    }
+
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x62): /* vpexpand{b,w} [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x63): /* vpcompress{b,w} [xyz]mm,[xyz]mm/mem{k} */
         host_and_vcpu_must_have(avx512_vbmi2);
--- a/xen/include/asm-x86/cpufeature.h
+++ b/xen/include/asm-x86/cpufeature.h
@@ -133,7 +133,9 @@
 #define cpu_has_avx512_vp2intersect boot_cpu_has(X86_FEATURE_AVX512_VP2INTERSECT)
 #define cpu_has_tsx_force_abort boot_cpu_has(X86_FEATURE_TSX_FORCE_ABORT)
 #define cpu_has_serialize       boot_cpu_has(X86_FEATURE_SERIALIZE)
+#define cpu_has_amx_bf16        boot_cpu_has(X86_FEATURE_AMX_BF16)
 #define cpu_has_amx_tile        boot_cpu_has(X86_FEATURE_AMX_TILE)
+#define cpu_has_amx_int8        boot_cpu_has(X86_FEATURE_AMX_INT8)
 
 /* CPUID level 0x00000007:1.eax */
 #define cpu_has_avx_vnni        boot_cpu_has(X86_FEATURE_AVX_VNNI)


