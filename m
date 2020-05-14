Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E11941D2AF7
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 11:09:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZ9rj-0001Mx-Ex; Thu, 14 May 2020 09:09:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ezST=64=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jZ9rh-0001Ma-BX
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 09:09:17 +0000
X-Inumbo-ID: 96095896-95c2-11ea-b07b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 96095896-95c2-11ea-b07b-bc764e2007e4;
 Thu, 14 May 2020 09:09:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 736FEAF4D;
 Thu, 14 May 2020 09:09:18 +0000 (UTC)
Subject: [PATCH v9 5/9] x86emul: support SERIALIZE
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e2c2bb6c-b089-de09-6388-50ec837310d7@suse.com>
Message-ID: <20f4c371-b60a-b86c-b0c0-b1ab64ca4349@suse.com>
Date: Thu, 14 May 2020 11:09:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <e2c2bb6c-b089-de09-6388-50ec837310d7@suse.com>
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
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
v9: A -> a in public header.
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
@@ -161,6 +161,7 @@ static inline bool xcr0_mask(uint64_t ma
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
@@ -260,6 +260,7 @@ XEN_CPUFEATURE(AVX512_4VNNIW, 9*32+ 2) /
 XEN_CPUFEATURE(AVX512_4FMAPS, 9*32+ 3) /*A  AVX512 Multiply Accumulation Single Precision */
 XEN_CPUFEATURE(MD_CLEAR,      9*32+10) /*A  VERW clears microarchitectural buffers */
 XEN_CPUFEATURE(TSX_FORCE_ABORT, 9*32+13) /* MSR_TSX_FORCE_ABORT.RTM_ABORT */
+XEN_CPUFEATURE(SERIALIZE,     9*32+14) /*a  SERIALIZE insn */
 XEN_CPUFEATURE(CET_IBT,       9*32+20) /*   CET - Indirect Branch Tracking */
 XEN_CPUFEATURE(IBRSB,         9*32+26) /*A  IBRS and IBPB support (used by Intel) */
 XEN_CPUFEATURE(STIBP,         9*32+27) /*A  STIBP */


