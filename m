Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 232B9190DD1
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 13:39:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGiob-0007H7-DB; Tue, 24 Mar 2020 12:37:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Lmgi=5J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jGioZ-0007Gq-TB
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 12:37:51 +0000
X-Inumbo-ID: 45411445-6dcc-11ea-83e0-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 45411445-6dcc-11ea-83e0-12813bfff9fa;
 Tue, 24 Mar 2020 12:37:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5D160ACED;
 Tue, 24 Mar 2020 12:37:50 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6fa81b4d-528d-5c33-50c5-a18396b4383a@suse.com>
Message-ID: <e41a2f72-ede5-adec-dc82-65b76368b7f7@suse.com>
Date: Tue, 24 Mar 2020 13:37:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <6fa81b4d-528d-5c33-50c5-a18396b4383a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: [Xen-devel] [PATCH v5 10/10] x86emul: support MCOMMIT
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

The dependency on a new EFER bit implies that we need to set that bit
ourselves in order to be able to successfully invoke the insn.

Also once again introduce the SVM related constants at this occasion.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: The exact meaning of the PM stating "any errors encountered by
     those stores have been signaled to associated error logging
     resources" is unclear. Depending on what this entails, blindly
     enabling EFER.MCOMMIT may not be a good idea. Hence the RFC.
---
v5: Re-base.
v4: New.

--- a/tools/libxl/libxl_cpuid.c
+++ b/tools/libxl/libxl_cpuid.c
@@ -261,6 +261,7 @@ int libxl_cpuid_parse_config(libxl_cpuid
         {"clzero",       0x80000008, NA, CPUID_REG_EBX,  0,  1},
         {"rstr-fp-err-ptrs", 0x80000008, NA, CPUID_REG_EBX, 2, 1},
         {"rdpru",        0x80000008, NA, CPUID_REG_EBX,  4,  1},
+        {"mcommit",      0x80000008, NA, CPUID_REG_EBX,  8,  1},
         {"wbnoinvd",     0x80000008, NA, CPUID_REG_EBX,  9,  1},
         {"ibpb",         0x80000008, NA, CPUID_REG_EBX, 12,  1},
         {"ppin",         0x80000008, NA, CPUID_REG_EBX, 23,  1},
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -149,7 +149,7 @@ static const char *const str_e8b[32] =
 
     [ 4] = "rdpru",
 
-    /* [ 8] */            [ 9] = "wbnoinvd",
+    [ 8] = "mcommit",          [ 9] = "wbnoinvd",
 
     [12] = "ibpb",
 
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -798,6 +798,9 @@ static void init_amd(struct cpuinfo_x86
 		wrmsr(MSR_K7_HWCR, l, h);
 	}
 
+	if (cpu_has(c, X86_FEATURE_MCOMMIT))
+		write_efer(read_efer() | EFER_MCOMMIT);
+
 	/* Prevent TSC drift in non single-processor, single-core platforms. */
 	if ((smp_processor_id() == 1) && !cpu_has(c, X86_FEATURE_ITSC))
 		disable_c1_ramping();
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -1877,6 +1877,7 @@ in_protmode(
 #define vcpu_has_fma4()        (ctxt->cpuid->extd.fma4)
 #define vcpu_has_tbm()         (ctxt->cpuid->extd.tbm)
 #define vcpu_has_clzero()      (ctxt->cpuid->extd.clzero)
+#define vcpu_has_mcommit()     (ctxt->cpuid->extd.mcommit)
 #define vcpu_has_rdpru()       (ctxt->cpuid->extd.rdpru)
 #define vcpu_has_wbnoinvd()    (ctxt->cpuid->extd.wbnoinvd)
 
@@ -5676,6 +5677,28 @@ x86_emulate(
             _regs.r(cx) = (uint32_t)msr_val;
             goto rdtsc;
 
+        case 0xfa: /* monitorx / mcommit */
+            if ( vex.pfx == vex_f3 )
+            {
+                bool cf;
+
+                host_and_vcpu_must_have(mcommit);
+                if ( !ops->read_msr ||
+                     ops->read_msr(MSR_EFER, &msr_val, ctxt) != X86EMUL_OKAY )
+                    msr_val = 0;
+                generate_exception_if(!(msr_val & EFER_MCOMMIT), EXC_UD);
+                memcpy(get_stub(stub),
+                       ((uint8_t[]){ 0xf3, 0x0f, 0x01, 0xfa, 0xc3 }), 5);
+                _regs.eflags &= ~EFLAGS_MASK;
+                invoke_stub("", ASM_FLAG_OUT(, "setc %[cf]"),
+                            [cf] ASM_FLAG_OUT("=@ccc", "=qm") (cf) : "i" (0));
+                if ( cf )
+                    _regs.eflags |= X86_EFLAGS_CF;
+                put_stub(stub);
+                goto done;
+            }
+            goto unrecognized_insn;
+
         case 0xfc: /* clzero */
         {
             unsigned long zero = 0;
--- a/xen/include/asm-x86/cpufeature.h
+++ b/xen/include/asm-x86/cpufeature.h
@@ -131,6 +131,9 @@
 #define cpu_has_avx512_4fmaps   boot_cpu_has(X86_FEATURE_AVX512_4FMAPS)
 #define cpu_has_tsx_force_abort boot_cpu_has(X86_FEATURE_TSX_FORCE_ABORT)
 
+/* CPUID level 0x80000008.ebx */
+#define cpu_has_mcommit         boot_cpu_has(X86_FEATURE_MCOMMIT)
+
 /* CPUID level 0x00000007:1.eax */
 #define cpu_has_avx512_bf16     boot_cpu_has(X86_FEATURE_AVX512_BF16)
 
--- a/xen/include/asm-x86/hvm/svm/vmcb.h
+++ b/xen/include/asm-x86/hvm/svm/vmcb.h
@@ -78,6 +78,11 @@ enum GenericIntercept2bits
     GENERAL2_INTERCEPT_RDPRU   = 1 << 14,
 };
 
+/* general 3 intercepts */
+enum GenericIntercept3bits
+{
+    GENERAL3_INTERCEPT_MCOMMIT = 1 << 3,
+};
 
 /* control register intercepts */
 enum CRInterceptBits
@@ -300,6 +305,7 @@ enum VMEXIT_EXITCODE
     VMEXIT_MWAIT_CONDITIONAL= 140, /* 0x8c */
     VMEXIT_XSETBV           = 141, /* 0x8d */
     VMEXIT_RDPRU            = 142, /* 0x8e */
+    VMEXIT_MCOMMIT          = 163, /* 0xa3 */
     VMEXIT_NPF              = 1024, /* 0x400, nested paging fault */
     VMEXIT_INVALID          =  -1
 };
@@ -406,7 +412,8 @@ struct vmcb_struct {
     u32 _exception_intercepts;  /* offset 0x08 - cleanbit 0 */
     u32 _general1_intercepts;   /* offset 0x0C - cleanbit 0 */
     u32 _general2_intercepts;   /* offset 0x10 - cleanbit 0 */
-    u32 res01[10];
+    u32 _general3_intercepts;   /* offset 0x14 - cleanbit 0 */
+    u32 res01[9];
     u16 _pause_filter_thresh;   /* offset 0x3C - cleanbit 0 */
     u16 _pause_filter_count;    /* offset 0x3E - cleanbit 0 */
     u64 _iopm_base_pa;          /* offset 0x40 - cleanbit 1 */
@@ -590,6 +597,7 @@ VMCB_ACCESSORS(dr_intercepts, intercepts
 VMCB_ACCESSORS(exception_intercepts, intercepts)
 VMCB_ACCESSORS(general1_intercepts, intercepts)
 VMCB_ACCESSORS(general2_intercepts, intercepts)
+VMCB_ACCESSORS(general3_intercepts, intercepts)
 VMCB_ACCESSORS(pause_filter_count, intercepts)
 VMCB_ACCESSORS(pause_filter_thresh, intercepts)
 VMCB_ACCESSORS(tsc_offset, intercepts)
--- a/xen/include/asm-x86/msr-index.h
+++ b/xen/include/asm-x86/msr-index.h
@@ -88,6 +88,7 @@
 #define _EFER_NX		11 /* No execute enable */
 #define _EFER_SVME		12 /* AMD: SVM enable */
 #define _EFER_FFXSE		14 /* AMD: Fast FXSAVE/FXRSTOR enable */
+#define _EFER_MCOMMIT		17 /* AMD: MCOMMIT insn enable */
 
 #define EFER_SCE		(1<<_EFER_SCE)
 #define EFER_LME		(1<<_EFER_LME)
@@ -95,9 +96,10 @@
 #define EFER_NX			(1<<_EFER_NX)
 #define EFER_SVME		(1<<_EFER_SVME)
 #define EFER_FFXSE		(1<<_EFER_FFXSE)
+#define EFER_MCOMMIT		(1<<_EFER_MCOMMIT)
 
 #define EFER_KNOWN_MASK		(EFER_SCE | EFER_LME | EFER_LMA | EFER_NX | \
-				 EFER_SVME | EFER_FFXSE)
+				 EFER_SVME | EFER_FFXSE | EFER_MCOMMIT)
 
 /* Intel MSRs. Some also available on other CPUs */
 #define MSR_IA32_PERFCTR0		0x000000c1
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -249,6 +249,7 @@ XEN_CPUFEATURE(EFRO,          7*32+10) /
 XEN_CPUFEATURE(CLZERO,        8*32+ 0) /*A  CLZERO instruction */
 XEN_CPUFEATURE(RSTR_FP_ERR_PTRS, 8*32+ 2) /*A  (F)X{SAVE,RSTOR} always saves/restores FPU Error pointers */
 XEN_CPUFEATURE(RDPRU,         8*32+ 4) /*A  RDPRU instruction */
+XEN_CPUFEATURE(MCOMMIT,       8*32+ 8) /*A  MCOMMIT instruction */
 XEN_CPUFEATURE(WBNOINVD,      8*32+ 9) /*   WBNOINVD instruction */
 XEN_CPUFEATURE(IBPB,          8*32+12) /*A  IBPB support only (no IBRS, used by AMD) */
 XEN_CPUFEATURE(AMD_PPIN,      8*32+23) /*   Protected Processor Inventory Number */


