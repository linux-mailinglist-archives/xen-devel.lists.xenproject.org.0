Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EFF29EF07
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 16:01:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14257.35362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kY9QG-0005SZ-1q; Thu, 29 Oct 2020 15:01:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14257.35362; Thu, 29 Oct 2020 15:01:04 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kY9QF-0005SA-UZ; Thu, 29 Oct 2020 15:01:03 +0000
Received: by outflank-mailman (input) for mailman id 14257;
 Thu, 29 Oct 2020 15:01:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o7xP=EE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kY9QE-0005S5-Fd
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 15:01:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ceffbaf-7701-4ff5-83d0-f44b26206e05;
 Thu, 29 Oct 2020 15:01:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 89EA1AC1F;
 Thu, 29 Oct 2020 15:01:00 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=o7xP=EE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kY9QE-0005S5-Fd
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 15:01:02 +0000
X-Inumbo-ID: 8ceffbaf-7701-4ff5-83d0-f44b26206e05
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8ceffbaf-7701-4ff5-83d0-f44b26206e05;
	Thu, 29 Oct 2020 15:01:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603983660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/9tOE9r1xCAU2Id5vfHT7XxFcVG5d5GbizM7ksXMvXY=;
	b=obHuQUNPLF3dJ29k2UzRStvrA4m6LqRlzDqo55taWgeLdR9gShvvx1ozC0wnijxR/pZdzh
	hp907bNEfdzvfED7AuUr3o/JA1L5IPZ+5oreRimQlsVUC5njTyBS0ecjzoqrwgyAjG7IqG
	WJe+ZaJ0LLuegvjng1AjHMMYtFWRlNU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 89EA1AC1F;
	Thu, 29 Oct 2020 15:01:00 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: support AVX-VNNI
Message-ID: <bead640a-e75e-8352-cd3d-5986386cab3a@suse.com>
Date: Thu, 29 Oct 2020 16:01:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

These are VEX-encoded equivalents of the EVEX-encoded AVX512-VNNI ISA
extension.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
SDE: -spr

--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -226,6 +226,7 @@ int libxl_cpuid_parse_config(libxl_cpuid
         {"core-caps",    0x00000007,  0, CPUID_REG_EDX, 30,  1},
         {"ssbd",         0x00000007,  0, CPUID_REG_EDX, 31,  1},
 
+        {"avx-vnni",     0x00000007,  1, CPUID_REG_EAX,  4,  1},
         {"avx512-bf16",  0x00000007,  1, CPUID_REG_EAX,  5,  1},
 
         {"lahfsahf",     0x80000001, NA, CPUID_REG_ECX,  0,  1},
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -175,7 +175,7 @@ static const char *const str_7d0[32] =
 
 static const char *const str_7a1[32] =
 {
-    /* 4 */                 [ 5] = "avx512-bf16",
+    [ 4] = "avx-vnni",      [ 5] = "avx512-bf16",
 };
 
 static const struct {
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1335,6 +1335,10 @@ static const struct vex {
     { { 0x45 }, 2, T, R, pfx_66, Wn, Ln }, /* vpsrlv{d,q} */
     { { 0x46 }, 2, T, R, pfx_66, W0, Ln }, /* vpsravd */
     { { 0x47 }, 2, T, R, pfx_66, Wn, Ln }, /* vpsllv{d,q} */
+    { { 0x50 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpbusd */
+    { { 0x51 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpbusds */
+    { { 0x52 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpwssd */
+    { { 0x53 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpwssds */
     { { 0x58 }, 2, T, R, pfx_66, W0, Ln }, /* vpbroadcastd */
     { { 0x59 }, 2, T, R, pfx_66, W0, Ln }, /* vpbroadcastq */
     { { 0x5a }, 2, F, R, pfx_66, W0, L1 }, /* vbroadcasti128 */
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -5028,6 +5028,61 @@ int main(int argc, char **argv)
         printf("okay\n");
     }
 
+    printf("%-40s", "Testing vpdpwssd (%ecx),%{y,z}mmA,%{y,z}mmB...");
+    if ( stack_exec && cpu_has_avx512_vnni && cpu_has_avx_vnni )
+    {
+        /* Do the same operation two ways and compare the results. */
+        decl_insn(vpdpwssd_vex1);
+        decl_insn(vpdpwssd_vex2);
+        decl_insn(vpdpwssd_evex);
+
+        for ( i = 0; i < 24; ++i )
+            res[i] = i | (~i << 16);
+
+        asm volatile ( "vmovdqu32 32(%0), %%zmm1\n\t"
+                       "vextracti64x4 $1, %%zmm1, %%ymm2\n\t"
+                       "vpxor %%xmm0, %%xmm0, %%xmm3\n\t"
+                       "vpxor %%xmm0, %%xmm0, %%xmm4\n\t"
+                       "vpxor %%xmm0, %%xmm0, %%xmm5\n"
+                       put_insn(vpdpwssd_vex1,
+                                /* %{vex%} vpdpwssd (%1), %%ymm1, %%ymm3" */
+                                ".byte 0xc4, 0xe2, 0x75, 0x52, 0x19") "\n"
+                       put_insn(vpdpwssd_vex2,
+                                /* "%{vex%} vpdpwssd 32(%1), %%ymm2, %%ymm4" */
+                                ".byte 0xc4, 0xe2, 0x6d, 0x52, 0x61, 0x20") "\n"
+                       put_insn(vpdpwssd_evex,
+                                /* "vpdpwssd (%1), %%zmm1, %%zmm5" */
+                                ".byte 0x62, 0xf2, 0x75, 0x48, 0x52, 0x29")
+                       :: "r" (res), "c" (NULL) );
+
+        set_insn(vpdpwssd_vex1);
+        regs.ecx = (unsigned long)res;
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( rc != X86EMUL_OKAY || !check_eip(vpdpwssd_vex1) )
+            goto fail;
+
+        set_insn(vpdpwssd_vex2);
+        regs.ecx = (unsigned long)res;
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( rc != X86EMUL_OKAY || !check_eip(vpdpwssd_vex2) )
+            goto fail;
+
+        set_insn(vpdpwssd_evex);
+        regs.ecx = (unsigned long)res;
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( rc != X86EMUL_OKAY || !check_eip(vpdpwssd_evex) )
+            goto fail;
+
+        asm ( "vinserti64x4 $1, %%ymm4, %%zmm3, %%zmm0\n\t"
+              "vpcmpeqd %%zmm0, %%zmm5, %%k0\n\t"
+              "kmovw %%k0, %0" : "=g" (rc) );
+        if ( rc != 0xffff )
+            goto fail;
+        printf("okay\n");
+    }
+    else
+        printf("skipped\n");
+
     printf("%-40s", "Testing invpcid 16(%ecx),%%edx...");
     if ( stack_exec )
     {
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -170,6 +170,7 @@ static inline bool xcr0_mask(uint64_t ma
 #define cpu_has_avx512_4fmaps (cp.feat.avx512_4fmaps && xcr0_mask(0xe6))
 #define cpu_has_avx512_vp2intersect (cp.feat.avx512_vp2intersect && xcr0_mask(0xe6))
 #define cpu_has_serialize  cp.feat.serialize
+#define cpu_has_avx_vnni   (cp.feat.avx_vnni && xcr0_mask(6))
 #define cpu_has_avx512_bf16 (cp.feat.avx512_bf16 && xcr0_mask(0xe6))
 
 #define cpu_has_xgetbv1   (cpu_has_xsave && cp.xstate.xgetbv1)
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -2008,6 +2008,7 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_avx512_4fmaps() (ctxt->cpuid->feat.avx512_4fmaps)
 #define vcpu_has_avx512_vp2intersect() (ctxt->cpuid->feat.avx512_vp2intersect)
 #define vcpu_has_serialize()   (ctxt->cpuid->feat.serialize)
+#define vcpu_has_avx_vnni()    (ctxt->cpuid->feat.avx_vnni)
 #define vcpu_has_avx512_bf16() (ctxt->cpuid->feat.avx512_bf16)
 
 #define vcpu_must_have(feat) \
@@ -9453,6 +9454,14 @@ x86_emulate(
         generate_exception_if(vex.l, EXC_UD);
         goto simd_0f_avx;
 
+    case X86EMUL_OPC_VEX_66(0x0f38, 0x50): /* vpdpbusd [xy]mm/mem,[xy]mm,[xy]mm */
+    case X86EMUL_OPC_VEX_66(0x0f38, 0x51): /* vpdpbusds [xy]mm/mem,[xy]mm,[xy]mm */
+    case X86EMUL_OPC_VEX_66(0x0f38, 0x52): /* vpdpwssd [xy]mm/mem,[xy]mm,[xy]mm */
+    case X86EMUL_OPC_VEX_66(0x0f38, 0x53): /* vpdpwssds [xy]mm/mem,[xy]mm,[xy]mm */
+        host_and_vcpu_must_have(avx_vnni);
+        generate_exception_if(vex.w, EXC_UD);
+        goto simd_0f_avx;
+
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x50): /* vpdpbusd [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x51): /* vpdpbusds [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x52): /* vpdpwssd [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
--- a/xen/include/asm-x86/cpufeature.h
+++ b/xen/include/asm-x86/cpufeature.h
@@ -133,6 +133,7 @@
 #define cpu_has_serialize       boot_cpu_has(X86_FEATURE_SERIALIZE)
 
 /* CPUID level 0x00000007:1.eax */
+#define cpu_has_avx_vnni        boot_cpu_has(X86_FEATURE_AVX_VNNI)
 #define cpu_has_avx512_bf16     boot_cpu_has(X86_FEATURE_AVX512_BF16)
 
 /* Synthesized. */
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -273,6 +273,7 @@ XEN_CPUFEATURE(CORE_CAPS,     9*32+30) /
 XEN_CPUFEATURE(SSBD,          9*32+31) /*A  MSR_SPEC_CTRL.SSBD available */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:1.eax, word 10 */
+XEN_CPUFEATURE(AVX_VNNI,     10*32+ 4) /*A  AVX-VNNI Instructions */
 XEN_CPUFEATURE(AVX512_BF16,  10*32+ 5) /*A  AVX512 BFloat16 Instructions */
 
 #endif /* XEN_CPUFEATURE */
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -252,7 +252,7 @@ def crunch_numbers(state):
         # feature flags.  If want to use AVX512, AVX2 must be supported and
         # enabled.  Certain later extensions, acting on 256-bit vectors of
         # integers, better depend on AVX2 than AVX.
-        AVX2: [AVX512F, VAES, VPCLMULQDQ],
+        AVX2: [AVX512F, VAES, VPCLMULQDQ, AVX_VNNI],
 
         # AVX512F is taken to mean hardware support for 512bit registers
         # (which in practice depends on the EVEX prefix to encode) as well

