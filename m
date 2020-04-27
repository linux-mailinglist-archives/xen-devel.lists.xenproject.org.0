Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7CC1BA216
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 13:14:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jT1i8-0005st-Ud; Mon, 27 Apr 2020 11:14:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7OvG=6L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jT1i7-0005sg-EE
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 11:14:03 +0000
X-Inumbo-ID: 32edfb1b-8878-11ea-9761-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 32edfb1b-8878-11ea-9761-12813bfff9fa;
 Mon, 27 Apr 2020 11:14:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AB6BBAC69;
 Mon, 27 Apr 2020 11:14:00 +0000 (UTC)
Subject: [PATCH v7 04/11] x86emul: support SERIALIZE
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e28f9cdf-00bc-4a48-c5bf-96f5055c7291@suse.com>
Message-ID: <e1437bfa-1f02-87ad-e22c-9ca00e43610d@suse.com>
Date: Mon, 27 Apr 2020 13:13:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <e28f9cdf-00bc-4a48-c5bf-96f5055c7291@suse.com>
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
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

... enabling its use by all guest kinds at the same time.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v7: Re-base.
v6: New.

--- a/tools/libxl/libxl_cpuid.c
+++ b/tools/libxl/libxl_cpuid.c
@@ -214,6 +214,7 @@ int libxl_cpuid_parse_config(libxl_cpuid
         {"avx512-4vnniw",0x00000007,  0, CPUID_REG_EDX,  2,  1},
         {"avx512-4fmaps",0x00000007,  0, CPUID_REG_EDX,  3,  1},
         {"md-clear",     0x00000007,  0, CPUID_REG_EDX, 10,  1},
+        {"serialize",    0x00000007,  0, CPUID_REG_EDX, 14,  1},
         {"cet-ibt",      0x00000007,  0, CPUID_REG_EDX, 20,  1},
         {"ibrsb",        0x00000007,  0, CPUID_REG_EDX, 26,  1},
         {"stibp",        0x00000007,  0, CPUID_REG_EDX, 27,  1},
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -161,6 +161,7 @@ static const char *const str_7d0[32] =
 
     [10] = "md-clear",
     /* 12 */                [13] = "tsx-force-abort",
+    [14] = "serialize",
 
     [18] = "pconfig",
     [20] = "cet-ibt",
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
@@ -129,6 +129,7 @@
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
 XEN_CPUFEATURE(CET_IBT,       9*32+20) /*   CET - Indirect Branch Tracking */
 XEN_CPUFEATURE(IBRSB,         9*32+26) /*A  IBRS and IBPB support (used by Intel) */
 XEN_CPUFEATURE(STIBP,         9*32+27) /*A  STIBP */


