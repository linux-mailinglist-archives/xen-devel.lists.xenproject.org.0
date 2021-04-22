Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2C53682C2
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 16:52:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115522.220431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZagi-0005Kt-Ti; Thu, 22 Apr 2021 14:52:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115522.220431; Thu, 22 Apr 2021 14:52:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZagi-0005KW-QW; Thu, 22 Apr 2021 14:52:16 +0000
Received: by outflank-mailman (input) for mailman id 115522;
 Thu, 22 Apr 2021 14:52:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uib8=JT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZagg-0005KK-JQ
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 14:52:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f9b9b0f7-f713-4dc8-ad6e-36acc6dbc3ca;
 Thu, 22 Apr 2021 14:52:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 09220ABB1;
 Thu, 22 Apr 2021 14:52:13 +0000 (UTC)
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
X-Inumbo-ID: f9b9b0f7-f713-4dc8-ad6e-36acc6dbc3ca
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619103133; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2hIV80jisyRvLb5ihKMWW9bM/ay0CiKgh0ql2H5RsPM=;
	b=tm24H5NP5jna4E6UlW1SBaKovSvPN3k+uf5i/MctxiWNKJim911uRL2h7cp337Ze6RhuKc
	ciJkhYkM7biBUY0fiQaI8qNXHQ+6bTgUTnUM0y/AZP5bGZkskfa4X0W/PXBDlw9N1+vAqS
	pgwwY1I5lvgXfsTbF/9LyezIqbm1qIk=
Subject: [PATCH v3 13/22] x86: XFD enabling
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Anthony Perard <anthony.perard@citrix.com>
References: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
Message-ID: <6f09bf89-6272-c9c0-1391-2620d6851b67@suse.com>
Date: Thu, 22 Apr 2021 16:52:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Just like for XCR0 we generally want to run with the guest settings of
the involved MSRs while in Xen. Hence saving/restoring of guest values
needs to only happen during context switch.

While adding the feature to libxl's table I've noticed the other XSAVE
sub-features all don't have entries there. These get added at the same
time.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: New.
---
I wasn't sure whether we want to have AMX depend on XFD. Purely from a
spec pov the two are independent features (without XFD one simply
wouldn't have a way to disable it for the purpose of lazy allocation of
state saving space).

--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -237,6 +237,12 @@ int libxl_cpuid_parse_config(libxl_cpuid
         {"fsrs",         0x00000007,  1, CPUID_REG_EAX, 11,  1},
         {"fsrcs",        0x00000007,  1, CPUID_REG_EAX, 12,  1},
 
+        {"xsaveopt",     0x0000000d,  1, CPUID_REG_EAX,  0,  1},
+        {"xsavec",       0x0000000d,  1, CPUID_REG_EAX,  1,  1},
+        {"xgetbv1",      0x0000000d,  1, CPUID_REG_EAX,  2,  1},
+        {"xsaves",       0x0000000d,  1, CPUID_REG_EAX,  3,  1},
+        {"xfd",          0x0000000d,  1, CPUID_REG_EAX,  4,  1},
+
         {"lahfsahf",     0x80000001, NA, CPUID_REG_ECX,  0,  1},
         {"cmplegacy",    0x80000001, NA, CPUID_REG_ECX,  1,  1},
         {"svm",          0x80000001, NA, CPUID_REG_ECX,  2,  1},
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -116,6 +116,7 @@ static const char *const str_Da1[32] =
 {
     [ 0] = "xsaveopt", [ 1] = "xsavec",
     [ 2] = "xgetbv1",  [ 3] = "xsaves",
+    [ 4] = "xfd",
 };
 
 static const char *const str_7c0[32] =
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -230,6 +230,7 @@ static void recalculate_xstate(struct cp
         p->xstate.comp[i].offset = xstate_offset(i);
         p->xstate.comp[i].xss    = curr_xstate & XSTATE_XSAVES_ONLY;
         p->xstate.comp[i].align  = curr_xstate & xstate_align;
+        p->xstate.comp[i].xfd    = curr_xstate & xfd_mask;
     }
 }
 
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1837,6 +1837,12 @@ void paravirt_ctxt_switch_to(struct vcpu
 
     if ( cpu_has_msr_tsc_aux )
         wrmsr_tsc_aux(v->arch.msrs->tsc_aux);
+
+    if ( v->domain->arch.cpuid->xstate.xfd )
+    {
+        wrmsrl(MSR_XFD, v->arch.msrs->xfd);
+        wrmsrl(MSR_XFD_ERR, v->arch.msrs->xfd_err);
+    }
 }
 
 /* Update per-VCPU guest runstate shared memory area (if registered). */
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -1101,6 +1101,8 @@ long arch_do_domctl(
         static const uint32_t msrs_to_send[] = {
             MSR_SPEC_CTRL,
             MSR_INTEL_MISC_FEATURES_ENABLES,
+            MSR_XFD,
+            MSR_XFD_ERR,
             MSR_TSC_AUX,
             MSR_AMD64_DR0_ADDRESS_MASK,
             MSR_AMD64_DR1_ADDRESS_MASK,
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -1178,6 +1178,12 @@ static int construct_vmcs(struct vcpu *v
         if ( (vmexit_ctl & VM_EXIT_CLEAR_BNDCFGS) &&
              (vmentry_ctl & VM_ENTRY_LOAD_BNDCFGS) )
             vmx_clear_msr_intercept(v, MSR_IA32_BNDCFGS, VMX_MSR_RW);
+
+        if ( d->arch.cpuid->xstate.xfd )
+        {
+            vmx_clear_msr_intercept(v, MSR_XFD, VMX_MSR_RW);
+            vmx_clear_msr_intercept(v, MSR_XFD_ERR, VMX_MSR_RW);
+        }
     }
 
     /* I/O access bitmap. */
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -539,6 +539,12 @@ static void vmx_save_guest_msrs(struct v
      */
     v->arch.hvm.vmx.shadow_gs = read_gs_shadow();
 
+    if ( v->domain->arch.cpuid->xstate.xfd )
+    {
+        rdmsrl(MSR_XFD, msrs->xfd);
+        rdmsrl(MSR_XFD_ERR, msrs->xfd_err);
+    }
+
     if ( v->arch.hvm.vmx.ipt_active )
     {
         rdmsrl(MSR_RTIT_OUTPUT_MASK, msrs->rtit.output_mask);
@@ -558,6 +564,12 @@ static void vmx_restore_guest_msrs(struc
     if ( cpu_has_msr_tsc_aux )
         wrmsr_tsc_aux(msrs->tsc_aux);
 
+    if ( v->domain->arch.cpuid->xstate.xfd )
+    {
+        wrmsrl(MSR_XFD, msrs->xfd);
+        wrmsrl(MSR_XFD_ERR, msrs->xfd_err);
+    }
+
     if ( v->arch.hvm.vmx.ipt_active )
     {
         wrmsrl(MSR_RTIT_OUTPUT_BASE, page_to_maddr(v->vmtrace.pg));
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -29,6 +29,7 @@
 #include <asm/hvm/viridian.h>
 #include <asm/msr.h>
 #include <asm/setup.h>
+#include <asm/xstate.h>
 
 #include <public/hvm/params.h>
 
@@ -267,6 +268,18 @@ int guest_rdmsr(struct vcpu *v, uint32_t
         *val = msrs->misc_features_enables.raw;
         break;
 
+    case MSR_XFD:
+    case MSR_XFD_ERR:
+        if ( !cp->xstate.xfd )
+            goto gp_fault;
+        if ( v == curr && is_hvm_domain(d) )
+            rdmsrl(msr, *val);
+        else if ( msr == MSR_XFD )
+            *val = msrs->xfd;
+        else
+            *val = msrs->xfd_err;
+        break;
+
     case MSR_IA32_MCG_CAP     ... MSR_IA32_MCG_CTL:      /* 0x179 -> 0x17b */
     case MSR_IA32_MCx_CTL2(0) ... MSR_IA32_MCx_CTL2(31): /* 0x280 -> 0x29f */
     case MSR_IA32_MCx_CTL(0)  ... MSR_IA32_MCx_MISC(31): /* 0x400 -> 0x47f */
@@ -523,6 +536,19 @@ int guest_wrmsr(struct vcpu *v, uint32_t
         break;
     }
 
+    case MSR_XFD:
+    case MSR_XFD_ERR:
+        if ( !cp->xstate.xfd ||
+             (val & ~(cpuid_policy_xstates(cp) & xfd_mask)) )
+            goto gp_fault;
+        if ( v == curr )
+            wrmsrl(msr, val);
+        if ( msr == MSR_XFD )
+            msrs->xfd = val;
+        else
+            msrs->xfd_err = val;
+        break;
+
     case MSR_IA32_MCG_CAP     ... MSR_IA32_MCG_CTL:      /* 0x179 -> 0x17b */
     case MSR_IA32_MCx_CTL2(0) ... MSR_IA32_MCx_CTL2(31): /* 0x280 -> 0x29f */
     case MSR_IA32_MCx_CTL(0)  ... MSR_IA32_MCx_MISC(31): /* 0x400 -> 0x47f */
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -29,6 +29,10 @@
 u64 __read_mostly xfeature_mask;
 
 u64 __read_mostly xstate_align;
+
+/* Mask of XSAVE/XRSTOR features supporting XFD. */
+uint64_t __read_mostly xfd_mask;
+
 static unsigned int __read_mostly xstate_features;
 
 uint32_t __read_mostly mxcsr_mask = 0x0000ffbf;
@@ -106,6 +110,11 @@ static int setup_xstate_features(bool bs
             __set_bit(leaf, &xstate_align);
         else
             BUG_ON(!(ecx & XSTATE_ALIGN64) != !test_bit(leaf, &xstate_align));
+
+        if ( bsp && (ecx & XSTATE_XFD) )
+            __set_bit(leaf, &xfd_mask);
+        else
+            BUG_ON(!(ecx & XSTATE_XFD) != !test_bit(leaf, &xfd_mask));
     }
 
     return 0;
--- a/xen/include/asm-x86/msr-index.h
+++ b/xen/include/asm-x86/msr-index.h
@@ -69,6 +69,10 @@
 #define MSR_MCU_OPT_CTRL                    0x00000123
 #define  MCU_OPT_CTRL_RNGDS_MITG_DIS        (_AC(1, ULL) <<  0)
 
+/* Bits within these two MSRs share positions with XCR0. */
+#define MSR_XFD                             0x000001c4
+#define MSR_XFD_ERR                         0x000001c5
+
 #define MSR_RTIT_OUTPUT_BASE                0x00000560
 #define MSR_RTIT_OUTPUT_MASK                0x00000561
 #define MSR_RTIT_CTL                        0x00000570
--- a/xen/include/asm-x86/msr.h
+++ b/xen/include/asm-x86/msr.h
@@ -343,6 +343,12 @@ struct vcpu_msrs
         uint64_t raw;
     } xss;
 
+    /* 0x000001c4 - MSR_XFD */
+    uint64_t xfd;
+
+    /* 0x000001c5 - MSR_XFD_ERR */
+    uint64_t xfd_err;
+
     /*
      * 0xc0000103 - MSR_TSC_AUX
      *
--- a/xen/include/asm-x86/xstate.h
+++ b/xen/include/asm-x86/xstate.h
@@ -39,9 +39,11 @@ extern uint32_t mxcsr_mask;
 #define XSTATE_COMPACTION_ENABLED  (1ULL << 63)
 
 #define XSTATE_ALIGN64 (1U << 1)
+#define XSTATE_XFD     (1U << 2)
 
 extern u64 xfeature_mask;
 extern u64 xstate_align;
+extern uint64_t xfd_mask;
 
 #define xstate_offset(n) (raw_cpuid_policy.xstate.comp[n].offset)
 #define xstate_size(n)   (raw_cpuid_policy.xstate.comp[n].size)
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -191,6 +191,7 @@ XEN_CPUFEATURE(XSAVEOPT,      4*32+ 0) /
 XEN_CPUFEATURE(XSAVEC,        4*32+ 1) /*A  XSAVEC/XRSTORC instructions */
 XEN_CPUFEATURE(XGETBV1,       4*32+ 2) /*A  XGETBV with %ecx=1 */
 XEN_CPUFEATURE(XSAVES,        4*32+ 3) /*S  XSAVES/XRSTORS instructions */
+XEN_CPUFEATURE(XFD,           4*32+ 4) /*   XFD / XFD_ERR MSRs */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:0.ebx, word 5 */
 XEN_CPUFEATURE(FSGSBASE,      5*32+ 0) /*A  {RD,WR}{FS,GS}BASE instructions */
--- a/xen/include/xen/lib/x86/cpuid.h
+++ b/xen/include/xen/lib/x86/cpuid.h
@@ -222,7 +222,7 @@ struct cpuid_policy
         /* Per-component common state.  Valid for i >= 2. */
         struct {
             uint32_t size, offset;
-            bool xss:1, align:1;
+            bool xss:1, align:1, xfd:1;
             uint32_t _res_d;
         } comp[CPUID_GUEST_NR_XSTATE];
     } xstate;
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -221,7 +221,7 @@ def crunch_numbers(state):
         # are instructions built on top of base XSAVE, while others are new
         # instruction groups which are specified to require XSAVE for state
         # management.
-        XSAVE: [XSAVEOPT, XSAVEC, XGETBV1, XSAVES,
+        XSAVE: [XSAVEOPT, XSAVEC, XGETBV1, XSAVES, XFD,
                 AVX, MPX, PKU, AMX_TILE, LWP],
 
         # AVX is taken to mean hardware support for 256bit registers (which in


