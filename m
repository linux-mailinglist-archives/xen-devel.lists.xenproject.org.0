Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D3D1A7A06
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 13:49:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOK3t-0005Xd-8D; Tue, 14 Apr 2020 11:49:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=t7Uy=56=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOK3r-0005XM-Qp
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 11:49:03 +0000
X-Inumbo-ID: efa80e4a-7e45-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id efa80e4a-7e45-11ea-b58d-bc764e2007e4;
 Tue, 14 Apr 2020 11:49:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 89B44ADFE;
 Tue, 14 Apr 2020 11:49:01 +0000 (UTC)
Subject: [PATCH v6 08/10] x86emul: support SERIALIZE
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d9a53b50-472d-477a-6275-ada0cb6e87e6@suse.com>
Message-ID: <02c670c9-48c4-fa70-47a6-1f8a7ed21fb6@suse.com>
Date: Tue, 14 Apr 2020 13:49:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <d9a53b50-472d-477a-6275-ada0cb6e87e6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

... enabling its use by all guest kinds at the same time.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v6: New.

--- a/tools/libxl/libxl_cpuid.c
+++ b/tools/libxl/libxl_cpuid.c
@@ -213,6 +213,7 @@ int libxl_cpuid_parse_config(libxl_cpuid
         {"avx512-4vnniw",0x00000007,  0, CPUID_REG_EDX,  2,  1},
         {"avx512-4fmaps",0x00000007,  0, CPUID_REG_EDX,  3,  1},
         {"md-clear",     0x00000007,  0, CPUID_REG_EDX, 10,  1},
+        {"serialize",    0x00000007,  0, CPUID_REG_EDX, 14,  1},
         {"ibrsb",        0x00000007,  0, CPUID_REG_EDX, 26,  1},
         {"stibp",        0x00000007,  0, CPUID_REG_EDX, 27,  1},
         {"l1d-flush",    0x00000007,  0, CPUID_REG_EDX, 28,  1},
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -163,6 +163,7 @@ static const char *const str_7d0[32] =
 
     [10] = "md-clear",
     /* 12 */                [13] = "tsx-force-abort",
+    [14] = "serialize",
 
     [18] = "pconfig",
 
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -158,6 +158,7 @@ static inline bool xcr0_mask(uint64_t ma
 #define cpu_has_movdir64b  cp.feat.movdir64b
 #define cpu_has_avx512_4vnniw (cp.feat.avx512_4vnniw && xcr0_mask(0xe6))
 #define cpu_has_avx512_4fmaps (cp.feat.avx512_4fmaps && xcr0_mask(0xe6))
+#define cpu_has_serialize  cp.feat.serialize
 #define cpu_has_avx512_bf16 (cp.feat.avx512_bf16 && xcr0_mask(0xe6))
 
 #define cpu_has_xgetbv1   (cpu_has_xsave && cp.xstate.xgetbv1)
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -1927,6 +1927,7 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_enqcmd()      (ctxt->cpuid->feat.enqcmd)
 #define vcpu_has_avx512_4vnniw() (ctxt->cpuid->feat.avx512_4vnniw)
 #define vcpu_has_avx512_4fmaps() (ctxt->cpuid->feat.avx512_4fmaps)
+#define vcpu_has_serialize()   (ctxt->cpuid->feat.serialize)
 #define vcpu_has_avx512_bf16() (ctxt->cpuid->feat.avx512_bf16)
 
 #define vcpu_must_have(feat) \
@@ -5660,6 +5661,18 @@ x86_emulate(
                 goto done;
             break;
 
+        case 0xe8:
+            switch ( vex.pfx )
+            {
+            case vex_none: /* serialize */
+                host_and_vcpu_must_have(serialize);
+                asm volatile ( ".byte 0x0f, 0x01, 0xe8" );
+                break;
+            default:
+                goto unimplemented_insn;
+            }
+            break;
+
         case 0xf8: /* swapgs */
             generate_exception_if(!mode_64bit(), EXC_UD);
             generate_exception_if(!mode_ring0(), EXC_GP, 0);
--- a/xen/include/asm-x86/cpufeature.h
+++ b/xen/include/asm-x86/cpufeature.h
@@ -131,6 +131,7 @@
 #define cpu_has_avx512_4vnniw   boot_cpu_has(X86_FEATURE_AVX512_4VNNIW)
 #define cpu_has_avx512_4fmaps   boot_cpu_has(X86_FEATURE_AVX512_4FMAPS)
 #define cpu_has_tsx_force_abort boot_cpu_has(X86_FEATURE_TSX_FORCE_ABORT)
+#define cpu_has_serialize       boot_cpu_has(X86_FEATURE_SERIALIZE)
 
 /* CPUID level 0x00000007:1.eax */
 #define cpu_has_avx512_bf16     boot_cpu_has(X86_FEATURE_AVX512_BF16)
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -258,6 +258,7 @@ XEN_CPUFEATURE(AVX512_4VNNIW, 9*32+ 2) /
 XEN_CPUFEATURE(AVX512_4FMAPS, 9*32+ 3) /*A  AVX512 Multiply Accumulation Single Precision */
 XEN_CPUFEATURE(MD_CLEAR,      9*32+10) /*A  VERW clears microarchitectural buffers */
 XEN_CPUFEATURE(TSX_FORCE_ABORT, 9*32+13) /* MSR_TSX_FORCE_ABORT.RTM_ABORT */
+XEN_CPUFEATURE(SERIALIZE,     9*32+14) /*A  SERIALIZE insn */
 XEN_CPUFEATURE(IBRSB,         9*32+26) /*A  IBRS and IBPB support (used by Intel) */
 XEN_CPUFEATURE(STIBP,         9*32+27) /*A  STIBP */
 XEN_CPUFEATURE(L1D_FLUSH,     9*32+28) /*S  MSR_FLUSH_CMD and L1D flush. */


