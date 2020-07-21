Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 126AA227CD6
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 12:23:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxpQX-0003xN-14; Tue, 21 Jul 2020 10:23:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CrlD=BA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jxpQV-0003xG-Kw
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 10:23:11 +0000
X-Inumbo-ID: 2d1208ce-cb3c-11ea-a09d-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2d1208ce-cb3c-11ea-a09d-12813bfff9fa;
 Tue, 21 Jul 2020 10:23:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A7BB9AC12;
 Tue, 21 Jul 2020 10:23:16 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: support AVX512_VP2INTERSECT insns
Message-ID: <08083899-7348-63d2-1f28-0932e2295d64@suse.com>
Date: Tue, 21 Jul 2020 12:23:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The standard memory access pattern once again should allow us to go
without a test harness addition beyond the EVEX Disp8-scaling one.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
(SDE: -tgl)

--- a/tools/libxl/libxl_cpuid.c
+++ b/tools/libxl/libxl_cpuid.c
@@ -214,6 +214,7 @@ int libxl_cpuid_parse_config(libxl_cpuid
 
         {"avx512-4vnniw",0x00000007,  0, CPUID_REG_EDX,  2,  1},
         {"avx512-4fmaps",0x00000007,  0, CPUID_REG_EDX,  3,  1},
+        {"avx512-vp2intersect",0x00000007,0,CPUID_REG_EDX,8, 1},
         {"srbds-ctrl",   0x00000007,  0, CPUID_REG_EDX,  9,  1},
         {"md-clear",     0x00000007,  0, CPUID_REG_EDX, 10,  1},
         {"serialize",    0x00000007,  0, CPUID_REG_EDX, 14,  1},
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -160,7 +160,7 @@ static const char *const str_7d0[32] =
     [ 2] = "avx512_4vnniw", [ 3] = "avx512_4fmaps",
     [ 4] = "fsrm",
 
-    /*  8 */                [ 9] = "srbds-ctrl",
+    [ 8] = "avx512_vp2intersect", [ 9] = "srbds-ctrl",
     [10] = "md-clear",
     /* 12 */                [13] = "tsx-force-abort",
     [14] = "serialize",
--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -593,6 +593,10 @@ static const struct test avx512_vnni_all
     INSN(pdpwssds, 66, 0f38, 53, vl, d, vl),
 };
 
+static const struct test avx512_vp2intersect_all[] = {
+    INSN(p2intersect, f2, 0f38, 68, vl, dq, vl)
+};
+
 static const struct test avx512_vpopcntdq_all[] = {
     INSN(popcnt, 66, 0f38, 55, vl, dq, vl)
 };
@@ -996,6 +1000,7 @@ void evex_disp8_test(void *instr, struct
     RUN(avx512_vbmi, all);
     RUN(avx512_vbmi2, all);
     RUN(avx512_vnni, all);
+    RUN(avx512_vp2intersect, all);
     RUN(avx512_vpopcntdq, all);
 
     if ( cpu_has_avx512f )
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -168,6 +168,7 @@ static inline bool xcr0_mask(uint64_t ma
 #define cpu_has_movdir64b  cp.feat.movdir64b
 #define cpu_has_avx512_4vnniw (cp.feat.avx512_4vnniw && xcr0_mask(0xe6))
 #define cpu_has_avx512_4fmaps (cp.feat.avx512_4fmaps && xcr0_mask(0xe6))
+#define cpu_has_avx512_vp2intersect (cp.feat.avx512_vp2intersect && xcr0_mask(0xe6))
 #define cpu_has_serialize  cp.feat.serialize
 #define cpu_has_avx512_bf16 (cp.feat.avx512_bf16 && xcr0_mask(0xe6))
 
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -488,6 +488,7 @@ static const struct ext0f38_table {
     [0x62] = { .simd_size = simd_packed_int, .two_op = 1, .d8s = d8s_bw },
     [0x63] = { .simd_size = simd_packed_int, .to_mem = 1, .two_op = 1, .d8s = d8s_bw },
     [0x64 ... 0x66] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0x68] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
     [0x70 ... 0x73] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
     [0x75 ... 0x76] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
     [0x77] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
@@ -2005,6 +2006,7 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_enqcmd()      (ctxt->cpuid->feat.enqcmd)
 #define vcpu_has_avx512_4vnniw() (ctxt->cpuid->feat.avx512_4vnniw)
 #define vcpu_has_avx512_4fmaps() (ctxt->cpuid->feat.avx512_4fmaps)
+#define vcpu_has_avx512_vp2intersect() (ctxt->cpuid->feat.avx512_vp2intersect)
 #define vcpu_has_serialize()   (ctxt->cpuid->feat.serialize)
 #define vcpu_has_avx512_bf16() (ctxt->cpuid->feat.avx512_bf16)
 
@@ -9545,6 +9547,12 @@ x86_emulate(
         }
         goto simd_zmm;
 
+    case X86EMUL_OPC_EVEX_F2(0x0f38, 0x68): /* vp2intersect{d,q} [xyz]mm/mem,[xyz]mm,k+1 */
+        host_and_vcpu_must_have(avx512_vp2intersect);
+        generate_exception_if(evex.opmsk || !evex.r || !evex.R, EXC_UD);
+        op_bytes = 16 << evex.lr;
+        goto avx512f_no_sae;
+
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x70): /* vpshldvw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x72): /* vpshrdvw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         generate_exception_if(!evex.w, EXC_UD);
--- a/xen/include/asm-x86/cpufeature.h
+++ b/xen/include/asm-x86/cpufeature.h
@@ -128,6 +128,7 @@
 /* CPUID level 0x00000007:0.edx */
 #define cpu_has_avx512_4vnniw   boot_cpu_has(X86_FEATURE_AVX512_4VNNIW)
 #define cpu_has_avx512_4fmaps   boot_cpu_has(X86_FEATURE_AVX512_4FMAPS)
+#define cpu_has_avx512_vp2intersect boot_cpu_has(X86_FEATURE_AVX512_VP2INTERSECT)
 #define cpu_has_tsx_force_abort boot_cpu_has(X86_FEATURE_TSX_FORCE_ABORT)
 #define cpu_has_serialize       boot_cpu_has(X86_FEATURE_SERIALIZE)
 
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -259,6 +259,7 @@ XEN_CPUFEATURE(SSB_NO,        8*32+26) /
 /* Intel-defined CPU features, CPUID level 0x00000007:0.edx, word 9 */
 XEN_CPUFEATURE(AVX512_4VNNIW, 9*32+ 2) /*A  AVX512 Neural Network Instructions */
 XEN_CPUFEATURE(AVX512_4FMAPS, 9*32+ 3) /*A  AVX512 Multiply Accumulation Single Precision */
+XEN_CPUFEATURE(AVX512_VP2INTERSECT, 9*32+8) /*a  VP2INTERSECT{D,Q} insns */
 XEN_CPUFEATURE(SRBDS_CTRL,    9*32+ 9) /*   MSR_MCU_OPT_CTRL and RNGDS_MITG_DIS. */
 XEN_CPUFEATURE(MD_CLEAR,      9*32+10) /*A  VERW clears microarchitectural buffers */
 XEN_CPUFEATURE(TSX_FORCE_ABORT, 9*32+13) /* MSR_TSX_FORCE_ABORT.RTM_ABORT */
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -260,7 +260,7 @@ def crunch_numbers(state):
         # AVX512 features are built on top of AVX512F
         AVX512F: [AVX512DQ, AVX512_IFMA, AVX512PF, AVX512ER, AVX512CD,
                   AVX512BW, AVX512VL, AVX512_4VNNIW, AVX512_4FMAPS,
-                  AVX512_VNNI, AVX512_VPOPCNTDQ],
+                  AVX512_VNNI, AVX512_VPOPCNTDQ, AVX512_VP2INTERSECT],
 
         # AVX512 extensions acting on vectors of bytes/words are made
         # dependents of AVX512BW (as to requiring wider than 16-bit mask

