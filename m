Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C1948DC00
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 17:39:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257287.442094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n837m-0001mw-6s; Thu, 13 Jan 2022 16:38:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257287.442094; Thu, 13 Jan 2022 16:38:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n837l-0001l9-Vk; Thu, 13 Jan 2022 16:38:53 +0000
Received: by outflank-mailman (input) for mailman id 257287;
 Thu, 13 Jan 2022 16:38:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4514=R5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1n837j-0001RD-J3
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 16:38:51 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48073cfb-748f-11ec-a563-1748fde96b53;
 Thu, 13 Jan 2022 17:38:49 +0100 (CET)
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
X-Inumbo-ID: 48073cfb-748f-11ec-a563-1748fde96b53
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642091929;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FMDy/dj6l/QX6LBOg2g+h5IZtV9TVhX1B7/xS1PYv88=;
  b=FWJbYrnOFLsbS94i5uLb/+4BFzhHDEesiuJ54Wb+MuwBM1+7FwscX4PP
   bOntdQ0oF9NxoABKSRKlQueJVJxHQ1+6MthymYOzQQMxSrMGqEjBXCNXv
   BEQa0mT4x7PmIcnL0h0XvZCHAnhn/acNjXQYLYPRyStyNzNj7EFwtJK+R
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Vg2mI7n7gsW1hGZlLwBaPDwvmJQyj7FgkISdkgNQ2nrbsDolVKIH+vz63o8aesc10rSqUlrlEL
 Yb6M+OICoZ8FegDsC2tsHbkPPTHiybpSLjnUmoQHI5RR/4lZZqUOXa2jxebptfCjcAAjQ9pgfw
 9tq2Ksf27+n5bTtBCJXbAkpi0R+S4eVkOvChc5flgVHHG4ieEKfieek2akaxPnpUCj8NikdGXm
 0aN8LmQAvWHk6Q1dRdBYtUtDd34eOJnDVG9mT5rItuScSR34eyjJXm5MnXJttpUWWZ8hjdonom
 GKxyzBD4TrrS7YXwbztqf+Xs
X-SBRS: 5.2
X-MesageID: 61416780
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:h3HADqj7+jeAGK1oyTVTRbAEX161mhcKZh0ujC45NGQN5FlHY01je
 htvC2uAbq2Ja2HxctknaIvj/B4Bu8SDzoIyTgNuqi43Fyob9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rj2tcx2oDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1Aj4epSF8TApbXu/8fCglUMB5XJvFJreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHCOo8Ft24m5jbeFfs8GrjIQrnQ5M8e1zA17ixLNaiHO
 5NHNmo3BPjGSzhzGk8lI84Up/6t31vEc2QH+Vi8/JNitgA/yyQuieOwYbI5YOeiR9hT2ECRp
 WvE/mHwKhAcKNGbjzGC9xqEheLRnCW9RIMbEpW58OJnhBuYwWl7IAISfUu2p7++kEHWc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUSyiuA167V6AaxHXUfQ3hKb9lOiSMtbWV0j
 BnTxYqvXGEx9u3OIZ6AyluKhT6IIjEUdVU+XjQnVglc89XAn6go0h2aG76PD5WJptHyHDjxx
 RWDoy4/m6gfgKY36kmrwbzUq2ny/8aUF2bZ8i2SBzv4tV0hOOZJcqT1sQCz0BpWEGqOorBtV
 lAgktPW0u0BBIrleMelELRUR+HBCxpo3VThbb9T83sJq2XFF52LJ9k4DNRCyKFBaJZsldjBO
 h67hO+pzMUPVEZGlIcuC25LN+wkzLL7CfPuXe3OY9xFb/BZLVHbpnk3PhbOgzC2yiDAdJ3T3
 7/BIa5A6l5AWMxaIMeeHb9BgdfHOAhjrY8seXwL50v+iufPDJJkYbwELEGPfogEAFCs+23oH
 yJkH5LSkX13CbSmCgGOqNJ7BQ1UcRATWM6nw+QKJr/rClc3QwkJVq6OqY7NjqQ4xcy5YM+So
 CHkMqKZoXKi7UD6xfKiMSE8OOixDMcm/RrW/0UEZD6V5pTqWq73hI93Snf9VeJPGDVLwaEmQ
 v8bVd+HB/gTGD3L9y5ENcv2rZB4dQTtjgWLZnL3bD86dp9mZgrI5t67IVe/qHhQVnK65Zkkv
 rmt9gLHWp5fFQ5sO9nbNaC0xFSrsHlDxO8rBxnUIsNecVnH+ZRxL3Cjlec+JswBcE2RxjaT2
 wuMLw0foO3B/908/NXT3PjWpIa1CepuWEFdGjCDv7qxMCDb+EulwJNBD7nULWyMCjus9fz7N
 +tPzvz6PPkWp3pwstJxQ+Rx0KYzx9rzvLsGnA5qK2rGMgawAbR6L3jYgcQW7v9RxqVUsBedU
 16U/oUIIq2APc7oHQJDJAchaejfh/gYliOLsKYwKUT+oiR24KCGQQNZOBzV0H5RK758MYUEx
 +Y9uZFJt1zj20RyatvW3DpJ82msL2AbV/R1v54XN4bnlw43xwwQepfbECL3vMmCZtgk3pPG+
 dNIaH4uX4hh+3c=
IronPort-HdrOrdr: A9a23:Lb/SNq+QyjLE/Fy1ZCBuk+DgI+orL9Y04lQ7vn2YSXRuHPBw8P
 re5cjztCWE7gr5N0tBpTntAsW9qDbnhPtICOoqTNCftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAtBD4bbLbGSS4/yU3ODBKadD/OW6
X-IronPort-AV: E=Sophos;i="5.88,286,1635220800"; 
   d="scan'208";a="61416780"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH 3/3] x86/spec-ctrl: Fix NMI race condition with VT-x MSR_SPEC_CTRL handling
Date: Thu, 13 Jan 2022 16:38:33 +0000
Message-ID: <20220113163833.3831-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220113163833.3831-1-andrew.cooper3@citrix.com>
References: <20220113163833.3831-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The logic was based on a mistaken understanding of how NMI blocking on vmexit
works.  NMIs are only blocked for EXIT_REASON_NMI, and not for general exits.
Therefore, an NMI can in general hit early in the vmx_asm_vmexit_handler path,
and the guest's value will be clobbered before it is saved.

Switch to using MSR load/save lists.  This causes the guest value to be saved
atomically with respect to NMIs/MCEs/etc.

First, update vmx_cpuid_policy_changed() to configure the load/save lists at
the same time as configuring the intercepts.  This function is always used in
remote context, so extend the vmx_vmcs_{enter,exit}() block to cover the whole
function, rather than having multiple remote acquisitions of the same VMCS.

vmx_add_guest_msr() can fail, but only in ways which are entirely fatal to the
guest, so handle failures using domain_crash().  vmx_del_msr() can fail with
-ESRCH but we don't matter, and this path will be taken during domain create
on a system lacking IBRSB.

Second, update vmx_msr_{read,write}_intercept() to use the load/save lists
rather than vcpu_msrs, and update the comment to describe the new state
location.

Finally, adjust the entry/exit asm.  Drop DO_SPEC_CTRL_ENTRY_FROM_HVM
entirely, and use a shorter code sequence to simply reload Xen's setting from
the top-of-stack block.

Because the guest values are loaded/saved atomically, we do not need to use
the shadowing logic to cope with late NMIs/etc, so we can omit
DO_SPEC_CTRL_EXIT_TO_GUEST entirely and VMRESUME/VMLAUNCH with Xen's value in
context.  Furthermore, we can drop the SPEC_CTRL_ENTRY_FROM_PV too, as there's
no need to switch back to Xen's context on an early failure.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jun Nakajima <jun.nakajima@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>

Needs backporting as far as people can tolerate.

If the entry/exit logic were in C, I'd ASSERT() that shadow tracking is off,
but this is awkard to arrange in asm.
---
 xen/arch/x86/hvm/vmx/entry.S             | 19 ++++++++++-------
 xen/arch/x86/hvm/vmx/vmx.c               | 36 +++++++++++++++++++++++++++-----
 xen/arch/x86/include/asm/msr.h           | 10 ++++++++-
 xen/arch/x86/include/asm/spec_ctrl_asm.h | 32 ++++------------------------
 4 files changed, 56 insertions(+), 41 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/entry.S b/xen/arch/x86/hvm/vmx/entry.S
index 30139ae58e9d..297ed8685126 100644
--- a/xen/arch/x86/hvm/vmx/entry.S
+++ b/xen/arch/x86/hvm/vmx/entry.S
@@ -35,7 +35,14 @@ ENTRY(vmx_asm_vmexit_handler)
 
         /* SPEC_CTRL_ENTRY_FROM_VMX    Req: b=curr %rsp=regs/cpuinfo, Clob: acd */
         ALTERNATIVE "", DO_OVERWRITE_RSB, X86_FEATURE_SC_RSB_HVM
-        ALTERNATIVE "", DO_SPEC_CTRL_ENTRY_FROM_HVM, X86_FEATURE_SC_MSR_HVM
+
+        .macro restore_spec_ctrl
+            mov    $MSR_SPEC_CTRL, %ecx
+            movzbl CPUINFO_xen_spec_ctrl(%rsp), %eax
+            xor    %edx, %edx
+            wrmsr
+        .endm
+        ALTERNATIVE "", restore_spec_ctrl, X86_FEATURE_SC_MSR_HVM
         /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
 
         /* Hardware clears MSR_DEBUGCTL on VMExit.  Reinstate it if debugging Xen. */
@@ -83,7 +90,6 @@ UNLIKELY_END(realmode)
 
         /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
         /* SPEC_CTRL_EXIT_TO_VMX   Req: a=spec_ctrl %rsp=regs/cpuinfo, Clob: cd */
-        ALTERNATIVE "", DO_SPEC_CTRL_EXIT_TO_GUEST, X86_FEATURE_SC_MSR_HVM
         ALTERNATIVE "", __stringify(verw CPUINFO_verw_sel(%rsp)), X86_FEATURE_SC_VERW_HVM
 
         mov  VCPU_hvm_guest_cr2(%rbx),%rax
@@ -119,12 +125,11 @@ UNLIKELY_END(realmode)
         SAVE_ALL
 
         /*
-         * PV variant needed here as no guest code has executed (so
-         * MSR_SPEC_CTRL can't have changed value), and NMIs/MCEs are liable
-         * to hit (in which case the HVM variant might corrupt things).
+         * SPEC_CTRL_ENTRY notes
+         *
+         * If we end up here, no guest code has executed.  We still have Xen's
+         * choice of MSR_SPEC_CTRL in context, and the RSB is safe.
          */
-        SPEC_CTRL_ENTRY_FROM_PV /* Req: %rsp=regs/cpuinfo Clob: acd */
-        /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
 
         call vmx_vmentry_failure
         jmp  .Lvmx_process_softirqs
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 28ee6393f11e..d7feb5f9c455 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -592,6 +592,7 @@ void vmx_update_exception_bitmap(struct vcpu *v)
 static void vmx_cpuid_policy_changed(struct vcpu *v)
 {
     const struct cpuid_policy *cp = v->domain->arch.cpuid;
+    int rc = 0;
 
     if ( opt_hvm_fep ||
          (v->domain->arch.cpuid->x86_vendor != boot_cpu_data.x86_vendor) )
@@ -601,17 +602,27 @@ static void vmx_cpuid_policy_changed(struct vcpu *v)
 
     vmx_vmcs_enter(v);
     vmx_update_exception_bitmap(v);
-    vmx_vmcs_exit(v);
 
     /*
      * We can safely pass MSR_SPEC_CTRL through to the guest, even if STIBP
      * isn't enumerated in hardware, as SPEC_CTRL_STIBP is ignored.
      */
     if ( cp->feat.ibrsb )
+    {
         vmx_clear_msr_intercept(v, MSR_SPEC_CTRL, VMX_MSR_RW);
+
+        rc = vmx_add_guest_msr(v, MSR_SPEC_CTRL, 0);
+        if ( rc )
+            goto err;
+    }
     else
+    {
         vmx_set_msr_intercept(v, MSR_SPEC_CTRL, VMX_MSR_RW);
 
+        /* Can only fail with -ESRCH, and we don't care. */
+        vmx_del_msr(v, MSR_SPEC_CTRL, VMX_MSR_GUEST);
+    }
+
     /* MSR_PRED_CMD is safe to pass through if the guest knows about it. */
     if ( cp->feat.ibrsb || cp->extd.ibpb )
         vmx_clear_msr_intercept(v, MSR_PRED_CMD,  VMX_MSR_RW);
@@ -623,6 +634,15 @@ static void vmx_cpuid_policy_changed(struct vcpu *v)
         vmx_clear_msr_intercept(v, MSR_FLUSH_CMD, VMX_MSR_RW);
     else
         vmx_set_msr_intercept(v, MSR_FLUSH_CMD, VMX_MSR_RW);
+
+ err:
+    vmx_vmcs_exit(v);
+
+    if ( rc )
+    {
+        printk(XENLOG_G_ERR "MSR load/save list error: %d", rc);
+        domain_crash(v->domain);
+    }
 }
 
 int vmx_guest_x86_mode(struct vcpu *v)
@@ -3128,7 +3148,6 @@ static int is_last_branch_msr(u32 ecx)
 static int vmx_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
 {
     struct vcpu *curr = current;
-    const struct vcpu_msrs *msrs = curr->arch.msrs;
     uint64_t tmp;
 
     HVM_DBG_LOG(DBG_LEVEL_MSR, "ecx=%#x", msr);
@@ -3136,7 +3155,11 @@ static int vmx_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
     switch ( msr )
     {
     case MSR_SPEC_CTRL: /* guest_rdmsr() has already performed #GP checks. */
-        *msr_content = msrs->spec_ctrl.raw;
+        if ( vmx_read_guest_msr(curr, msr, msr_content) )
+        {
+            ASSERT_UNREACHABLE();
+            goto gp_fault;
+        }
         break;
 
     case MSR_IA32_SYSENTER_CS:
@@ -3336,7 +3359,6 @@ void vmx_vlapic_msr_changed(struct vcpu *v)
 static int vmx_msr_write_intercept(unsigned int msr, uint64_t msr_content)
 {
     struct vcpu *v = current;
-    struct vcpu_msrs *msrs = v->arch.msrs;
     const struct cpuid_policy *cp = v->domain->arch.cpuid;
 
     HVM_DBG_LOG(DBG_LEVEL_MSR, "ecx=%#x, msr_value=%#"PRIx64, msr, msr_content);
@@ -3346,7 +3368,11 @@ static int vmx_msr_write_intercept(unsigned int msr, uint64_t msr_content)
         uint64_t rsvd, tmp;
 
     case MSR_SPEC_CTRL: /* guest_wrmsr() has already performed #GP checks. */
-        msrs->spec_ctrl.raw = msr_content;
+        if ( vmx_write_guest_msr(v, msr, msr_content) )
+        {
+            ASSERT_UNREACHABLE();
+            goto gp_fault;
+        }
         return X86EMUL_OKAY;
 
     case MSR_IA32_SYSENTER_CS:
diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index 0b2176a9bc53..5f851958992b 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -287,7 +287,15 @@ extern struct msr_policy     raw_msr_policy,
 /* Container object for per-vCPU MSRs */
 struct vcpu_msrs
 {
-    /* 0x00000048 - MSR_SPEC_CTRL */
+    /*
+     * 0x00000048 - MSR_SPEC_CTRL
+     *
+     * For PV guests, this holds the guest kernel value.  It is accessed on
+     * every entry/exit path.
+     *
+     * For VT-x guests, the guest value is held in the MSR guest load/save
+     * list.
+     */
     struct {
         uint32_t raw;
     } spec_ctrl;
diff --git a/xen/arch/x86/include/asm/spec_ctrl_asm.h b/xen/arch/x86/include/asm/spec_ctrl_asm.h
index 18ecfcd70375..ddce8b33fd17 100644
--- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
+++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
@@ -42,9 +42,10 @@
  *     path, or late in the exit path after restoring the guest value.  This
  *     will corrupt the guest value.
  *
- * Factor 1 is dealt with by relying on NMIs/MCEs being blocked immediately
- * after VMEXIT.  The VMEXIT-specific code reads MSR_SPEC_CTRL and updates
- * current before loading Xen's MSR_SPEC_CTRL setting.
+ * Factor 1 is dealt with:
+ *   - On VMX by using MSR load/save lists to have vmentry/exit atomically
+ *     load/save the guest value.  Xen's value is loaded in regular code, and
+ *     there is no need to use the shadow logic (below).
  *
  * Factor 2 is harder.  We maintain a shadow_spec_ctrl value, and a use_shadow
  * boolean in the per cpu spec_ctrl_flags.  The synchronous use is:
@@ -126,31 +127,6 @@
 #endif
 .endm
 
-.macro DO_SPEC_CTRL_ENTRY_FROM_HVM
-/*
- * Requires %rbx=current, %rsp=regs/cpuinfo
- * Clobbers %rax, %rcx, %rdx
- *
- * The common case is that a guest has direct access to MSR_SPEC_CTRL, at
- * which point we need to save the guest value before setting IBRS for Xen.
- * Unilaterally saving the guest value is shorter and faster than checking.
- */
-    mov $MSR_SPEC_CTRL, %ecx
-    rdmsr
-
-    /* Stash the value from hardware. */
-    mov VCPU_arch_msrs(%rbx), %rdx
-    mov %eax, VCPUMSR_spec_ctrl_raw(%rdx)
-    xor %edx, %edx
-
-    /* Clear SPEC_CTRL shadowing *before* loading Xen's value. */
-    andb $~SCF_use_shadow, CPUINFO_spec_ctrl_flags(%rsp)
-
-    /* Load Xen's intended value. */
-    movzbl CPUINFO_xen_spec_ctrl(%rsp), %eax
-    wrmsr
-.endm
-
 .macro DO_SPEC_CTRL_ENTRY maybexen:req
 /*
  * Requires %rsp=regs (also cpuinfo if !maybexen)
-- 
2.11.0


