Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB56190D76
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 13:31:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGigD-0005WF-C8; Tue, 24 Mar 2020 12:29:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Lmgi=5J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jGigB-0005W2-K6
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 12:29:11 +0000
X-Inumbo-ID: 100a5ec6-6dcb-11ea-92cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 100a5ec6-6dcb-11ea-92cf-bc764e2007e4;
 Tue, 24 Mar 2020 12:29:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 10393AEA6;
 Tue, 24 Mar 2020 12:29:10 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6fa81b4d-528d-5c33-50c5-a18396b4383a@suse.com>
Message-ID: <9604579f-64a8-0dc9-8188-3797e2004d45@suse.com>
Date: Tue, 24 Mar 2020 13:29:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <6fa81b4d-528d-5c33-50c5-a18396b4383a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: [Xen-devel] [PATCH v5 02/10] x86emul: support AVX512_BF16 insns
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <Paul.Durrant@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v5: New.
---
(SDE: -cpx)

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -550,6 +550,12 @@ static const struct test avx512_4vnniw_5
     INSN(p4dpwssds, f2, 0f38, 53, el_4, d, vl),
 };
 
+static const struct test avx512_bf16_all[] = {
+    INSN(vcvtne2ps2bf16, f2, 0f38, 72, vl, d, vl),
+    INSN(vcvtneps2bf16,  f3, 0f38, 72, vl, d, vl),
+    INSN(vdpbf16ps,      f3, 0f38, 52, vl, d, vl),
+};
+
 static const struct test avx512_bitalg_all[] = {
     INSN(popcnt,      66, 0f38, 54, vl, bw, vl),
     INSN(pshufbitqmb, 66, 0f38, 8f, vl,  b, vl),
@@ -984,6 +990,7 @@ void evex_disp8_test(void *instr, struct
     RUN(avx512pf, 512);
     RUN(avx512_4fmaps, 512);
     RUN(avx512_4vnniw, 512);
+    RUN(avx512_bf16, all);
     RUN(avx512_bitalg, all);
     RUN(avx512_ifma, all);
     RUN(avx512_vbmi, all);
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -4516,6 +4516,80 @@ int main(int argc, char **argv)
     else
         printf("skipped\n");
 
+    if ( stack_exec && cpu_has_avx512_bf16 )
+    {
+        decl_insn(vcvtne2ps2bf16);
+        decl_insn(vcvtneps2bf16);
+        decl_insn(vdpbf16ps);
+        static const struct {
+            float f[16];
+        } in1 = {{
+            1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
+        }}, in2 = {{
+            1, -2, 3, -4, 5, -6, 7, -8, 9, -10, 11, -12, 13, -14, 15, -16
+        }}, out = {{
+            1 * 1 + 2 * 2, 3 * 3 + 4 * 4,
+            5 * 5 + 6 * 6, 7 * 7 + 8 * 8,
+            9 * 9 + 10 * 10, 11 * 11 + 12 * 12,
+            13 * 13 + 14 * 14, 15 * 15 + 16 * 16,
+            1 * 1 - 2 * 2, 3 * 3 - 4 * 4,
+            5 * 5 - 6 * 6, 7 * 7 - 8 * 8,
+            9 * 9 - 10 * 10, 11 * 11 - 12 * 12,
+            13 * 13 - 14 * 14, 15 * 15 - 16 * 16
+        }};
+
+        printf("%-40s", "Testing vcvtne2ps2bf16 64(%ecx),%zmm1,%zmm2...");
+        asm volatile ( "vmovups %1, %%zmm1\n"
+                       put_insn(vcvtne2ps2bf16,
+                                /* vcvtne2ps2bf16 64(%0), %%zmm1, %%zmm2 */
+                                ".byte 0x62, 0xf2, 0x77, 0x48, 0x72, 0x51, 0x01")
+                       :: "c" (NULL), "m" (in2) );
+        set_insn(vcvtne2ps2bf16);
+        regs.ecx = (unsigned long)&in1 - 64;
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( rc != X86EMUL_OKAY || !check_eip(vcvtne2ps2bf16) )
+            goto fail;
+        printf("pending\n");
+
+        printf("%-40s", "Testing vcvtneps2bf16 64(%ecx),%ymm3...");
+        asm volatile ( put_insn(vcvtneps2bf16,
+                                /* vcvtneps2bf16 64(%0), %%ymm3 */
+                                ".byte 0x62, 0xf2, 0x7e, 0x48, 0x72, 0x59, 0x01")
+                       :: "c" (NULL) );
+        set_insn(vcvtneps2bf16);
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( rc != X86EMUL_OKAY || !check_eip(vcvtneps2bf16) )
+            goto fail;
+        asm ( "vmovdqa %%ymm2, %%ymm5\n\t"
+              "vpcmpeqd %%zmm3, %%zmm5, %%k0\n\t"
+              "kmovw %%k0, %0"
+              : "=g" (rc) : "m" (out) );
+        if ( rc != 0xffff )
+            goto fail;
+        printf("pending\n");
+
+        printf("%-40s", "Testing vdpbf16ps 128(%ecx),%zmm2,%zmm4...");
+        asm volatile ( "vmovdqa %%ymm3, %0\n\t"
+                       "vmovdqa %%ymm3, %1\n"
+                       put_insn(vdpbf16ps,
+                                /* vdpbf16ps 128(%2), %%zmm2, %%zmm4 */
+                                ".byte 0x62, 0xf2, 0x6e, 0x48, 0x52, 0x61, 0x02")
+                       : "=&m" (res[0]), "=&m" (res[8])
+                       : "c" (NULL)
+                       : "memory" );
+        set_insn(vdpbf16ps);
+        regs.ecx = (unsigned long)res - 128;
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( rc != X86EMUL_OKAY || !check_eip(vdpbf16ps) )
+            goto fail;
+        asm ( "vcmpeqps %1, %%zmm4, %%k0\n\t"
+              "kmovw %%k0, %0"
+              : "=g" (rc) : "m" (out) );
+        if ( rc != 0xffff )
+            goto fail;
+        printf("okay\n");
+    }
+
     printf("%-40s", "Testing invpcid 16(%ecx),%%edx...");
     if ( stack_exec )
     {
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -156,6 +156,7 @@ static inline bool xcr0_mask(uint64_t ma
 #define cpu_has_avx512_vpopcntdq (cp.feat.avx512_vpopcntdq && xcr0_mask(0xe6))
 #define cpu_has_avx512_4vnniw (cp.feat.avx512_4vnniw && xcr0_mask(0xe6))
 #define cpu_has_avx512_4fmaps (cp.feat.avx512_4fmaps && xcr0_mask(0xe6))
+#define cpu_has_avx512_bf16 (cp.feat.avx512_bf16 && xcr0_mask(0xe6))
 
 #define cpu_has_xgetbv1   (cpu_has_xsave && cp.xstate.xgetbv1)
 
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -1904,6 +1904,7 @@ in_protmode(
 #define vcpu_has_rdpid()       (ctxt->cpuid->feat.rdpid)
 #define vcpu_has_avx512_4vnniw() (ctxt->cpuid->feat.avx512_4vnniw)
 #define vcpu_has_avx512_4fmaps() (ctxt->cpuid->feat.avx512_4fmaps)
+#define vcpu_has_avx512_bf16() (ctxt->cpuid->feat.avx512_bf16)
 
 #define vcpu_must_have(feat) \
     generate_exception_if(!vcpu_has_##feat(), EXC_UD)
@@ -9152,6 +9153,19 @@ x86_emulate(
         generate_exception_if(evex.w, EXC_UD);
         goto avx512f_no_sae;
 
+    case X86EMUL_OPC_EVEX_F2(0x0f38, 0x72): /* vcvtne2ps2bf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_F3(0x0f38, 0x72): /* vcvtneps2bf16 [xyz]mm/mem,{x,y}mm{k} */
+        if ( evex.pfx == vex_f2 )
+            fault_suppression = false;
+        else
+            d |= TwoOp;
+        /* fall through */
+    case X86EMUL_OPC_EVEX_F3(0x0f38, 0x52): /* vdpbf16ps [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+        host_and_vcpu_must_have(avx512_bf16);
+        generate_exception_if(evex.w, EXC_UD);
+        op_bytes = 16 << evex.lr;
+        goto avx512f_no_sae;
+
     case X86EMUL_OPC_VEX_66(0x0f38, 0x58): /* vpbroadcastd xmm/m32,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x59): /* vpbroadcastq xmm/m64,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x78): /* vpbroadcastb xmm/m8,{x,y}mm */
--- a/xen/include/asm-x86/cpufeature.h
+++ b/xen/include/asm-x86/cpufeature.h
@@ -129,6 +129,9 @@
 #define cpu_has_avx512_4fmaps   boot_cpu_has(X86_FEATURE_AVX512_4FMAPS)
 #define cpu_has_tsx_force_abort boot_cpu_has(X86_FEATURE_TSX_FORCE_ABORT)
 
+/* CPUID level 0x00000007:1.eax */
+#define cpu_has_avx512_bf16     boot_cpu_has(X86_FEATURE_AVX512_BF16)
+
 /* Synthesized. */
 #define cpu_has_arch_perfmon    boot_cpu_has(X86_FEATURE_ARCH_PERFMON)
 #define cpu_has_cpuid_faulting  boot_cpu_has(X86_FEATURE_CPUID_FAULTING)
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -262,7 +262,7 @@ XEN_CPUFEATURE(CORE_CAPS,     9*32+30) /
 XEN_CPUFEATURE(SSBD,          9*32+31) /*A  MSR_SPEC_CTRL.SSBD available */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:1.eax, word 10 */
-XEN_CPUFEATURE(AVX512_BF16,  10*32+ 5) /*   AVX512 BFloat16 Instructions */
+XEN_CPUFEATURE(AVX512_BF16,  10*32+ 5) /*A  AVX512 BFloat16 Instructions */
 
 #endif /* XEN_CPUFEATURE */
 


