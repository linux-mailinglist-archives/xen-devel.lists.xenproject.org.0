Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51151491057
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 19:35:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258223.444469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9WqA-0004ow-1R; Mon, 17 Jan 2022 18:34:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258223.444469; Mon, 17 Jan 2022 18:34:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Wq9-0004je-Se; Mon, 17 Jan 2022 18:34:49 +0000
Received: by outflank-mailman (input) for mailman id 258223;
 Mon, 17 Jan 2022 18:34:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PnDA=SB=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1n9Wq7-0004g9-DQ
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 18:34:47 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22f05d8a-77c4-11ec-9bbc-9dff3e4ee8c5;
 Mon, 17 Jan 2022 19:34:44 +0100 (CET)
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
X-Inumbo-ID: 22f05d8a-77c4-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642444484;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+dPlpy4gktrXn5Bej6AptKI40l2T8GyYSNyUi8f2DKA=;
  b=PyeZrXawAaDOvPAvGWMCToHsYUpT519merFvnAgQDpCkdVzjx3qUEfau
   XtzErn4WfM74PSuwGqNdJUj4QuJbuxehBTgWzxMw1sHNmOhRKzPn90jul
   Z37g91O+x1Wb6prOWleZyDjEcd4zD7yJDhlsV9hibCmD7QzAFzDDyPI66
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: AcXdK4ySMDBBBQppmzuVuxVIEQ+DUHufiBHmQjiHxVkeC0ol0GSSGNr3Z2QMFn6DeiifmpNEFI
 +9kLsbTj7hAIEREZbYjXDxUFIhM3xzeRHH6D3uD4gqQwFO+Cc6ovL5lVrijOZSVt501LRgPimj
 bPsyjTZvRr7pl2t8FvSFlf3m+bilR8o+lEUNZhdK6rIloUkz1wAOgXDbn3nmhtFbfjfOiKgt5I
 8LZT9Y/dpNu6a/2tE9MB8rFMSroawfw7FryETUgQXbj5xppJE1jCJKkxEBz5m1Du3A7MPI0jZ7
 qOKKVMSTBLcdv9mp8q1HwUm8
X-SBRS: 5.2
X-MesageID: 62573947
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:7Byrcay4FV2vShLBXSt6t+eywSrEfRIJ4+MujC+fZmUNrF6WrkUCy
 WtLD2iDM/2CNGukKY8jPoS28BhS7ZTXn4NrTVZq+SAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wrdm2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt4BQ7
 /N/7cyyckBzG43lo94MbB1JTD4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVoru0lINPmI8U0vXZ4wCuCJf0nXYrCU+PB4towMDIY2JoTQq2PO
 5VxhTxHUx3qQyMQJAssWKk6gM6z2EP/KQR4gQfAzUYwyzeKl1EguFT3C/LXZ9rMQ8xWl0SZo
 2vu/mLlDxVcP9uaoRKG/2ytgKnTnCr9cIMUCLC8sPVthTW72Wg7GBAQE1yhrpGRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JyOeAn7ACGyoLP/h2UQGMDS1Z8hMcO7ZFsA2Zwj
 xnQwo2vVWcHXKCppWy1ppaziwHqaSouajUnRQY/dxo658i8v9Rm5v7QdepLHKmwh9zzPDj/x
 TGWsSQz74kuYd43O7aTpg6e3W/1znTdZktsv1iMADr5hu9sTNf9P9TA1LTN0RpXwG91pHGlt
 WNMpcWR5ftm4XqlxH3UG7Vl8F1ECp+43NzgbbxHQsNJG9eFoSfLkWVsDNdWfh0B3iEsI26BX
 aMrkVkNjKK/xVPzBUONX6q/Ct4x0Y/rHsn/W/bfY7JmO8YtLlTarHo+ORLOjwgBdXTAd4llZ
 P93lu72XB4n5VlPlmLqF4/xL5d2rszB+Y8jbc+ilEn2uVZvTHWUVa0EIDOzghMRt8u5TPHu2
 48HbaOikkwHOMWnO3W/2dNNcTgicCZqbbir+50/XrPSeWJORTB+Y8I9NJt8IeSJaYwPyLeRl
 px8M2cFoGfCaYrvclTVOis9OeK2Df6SbxsTZEQRALph4FB7Ca7H0UvVX8JfkWAP+LMxwPhqY
 eMCfsncUP1DRi6eo2YWbIXnrZwkfxOu3FrcMy2gaTk5XphhWw2WpYO0IlqxrHEDXnitqM8zg
 7y8zQeHE5ANcBtvUZTNY/W1wlLv4XVEwLBuX1HFK8V4cVn39NQ4MDT4i/I6epleKRjKyjaA+
 RyRBBMU+bvEr4MvqYGbjqGYtYa5VeB5GxMCTWXc6L+3Mwjc/3aintAcALrZI2iFWTqtqqu4Z
 OhTw/XtC9E9nQ5H49hmDrJm7aMi/N+z9bVU+RtpQSfQZFOxB7I+fnTfhZtTtrdAz6NysBetX
 h7d4cFTPLiENZ+3EFMVIwZ5PO2P2etNx2vX5PUxZk77+DV27PyMVkALZ0uAjylULb1UNoI5w
 Lh+5J5KulLn0hd6YMybii109niXKi1SWqoqgZgWHYv3h1d50VpFe5HdVnf77Zznhw+g6aX2z
 ut4XJb/uok=
IronPort-HdrOrdr: A9a23:X2q+xaEI5Zcu6F9tpLqE0MeALOsnbusQ8zAXP0AYc3Jom6uj5r
 mTdZUgpHnJYVkqOE3I9ertBEDEewK4yXcX2/h3AV7BZniEhILAFugLhuGO/9SjIVybygc079
 YZT0EUMrzN5DZB4voSmDPIceod/A==
X-IronPort-AV: E=Sophos;i="5.88,296,1635220800"; 
   d="scan'208";a="62573947"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v2 4/4] x86/spec-ctrl: Fix NMI race condition with VT-x MSR_SPEC_CTRL handling
Date: Mon, 17 Jan 2022 18:34:15 +0000
Message-ID: <20220117183415.11150-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220117183415.11150-1-andrew.cooper3@citrix.com>
References: <20220117183415.11150-1-andrew.cooper3@citrix.com>
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

Both of vmx_{add,del}_guest_msr() can fail.  The -ESRCH delete case is fine,
but all others are fatal to the running of the VM, so handle them using
domain_crash() - this path is only used during domain construction anyway.

Second, update vmx_{get,set}_reg() to use the MSR load/save lists rather than
vcpu_msrs, and update the vcpu_msrs comment to describe the new state
location.

Finally, adjust the entry/exit asm.

Because the guest value is saved and loaded atomically, we do not need to
manually load the guest value, nor do we need to enable SCF_use_shadow.  This
lets us remove the use of DO_SPEC_CTRL_EXIT_TO_GUEST.  Additionally,
SPEC_CTRL_ENTRY_FROM_PV gets removed too, because on an early entry failure,
we're no longer in the guest MSR_SPEC_CTRL context needing to switch back to
Xen's context.

The only action remaining is to load Xen's MSR_SPEC_CTRL value on vmexit.  We
could in principle use the host msr list, but is expected to complicated
future work.  Delete DO_SPEC_CTRL_ENTRY_FROM_HVM entirely, and use a shorter
code sequence to simply reload Xen's setting from the top-of-stack block.

Adjust the comment at the top of spec_ctrl_asm.h in light of this bugfix.

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

v2:
 * Rework on top of {get,set}_reg() infrastructure.
 * Future-proof against other vmx_del_guest_msr() failures.
 * Rewrite the commit message to explain things better.
---
 xen/arch/x86/hvm/vmx/entry.S             | 21 +++++++++------
 xen/arch/x86/hvm/vmx/vmx.c               | 44 +++++++++++++++++++++++++++++---
 xen/arch/x86/include/asm/msr.h           | 10 +++++++-
 xen/arch/x86/include/asm/spec_ctrl_asm.h | 32 +++--------------------
 4 files changed, 67 insertions(+), 40 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/entry.S b/xen/arch/x86/hvm/vmx/entry.S
index 30139ae58e9d..ce7b48558ee1 100644
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
@@ -82,8 +89,7 @@ UNLIKELY_END(realmode)
         mov VCPUMSR_spec_ctrl_raw(%rax), %eax
 
         /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
-        /* SPEC_CTRL_EXIT_TO_VMX   Req: a=spec_ctrl %rsp=regs/cpuinfo, Clob: cd */
-        ALTERNATIVE "", DO_SPEC_CTRL_EXIT_TO_GUEST, X86_FEATURE_SC_MSR_HVM
+        /* SPEC_CTRL_EXIT_TO_VMX   Req: %rsp=regs/cpuinfo              Clob:    */
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
index c32967f190ff..69e38d0fa8f9 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -592,6 +592,7 @@ void vmx_update_exception_bitmap(struct vcpu *v)
 static void vmx_cpuid_policy_changed(struct vcpu *v)
 {
     const struct cpuid_policy *cp = v->domain->arch.cpuid;
+    int rc = 0;
 
     if ( opt_hvm_fep ||
          (v->domain->arch.cpuid->x86_vendor != boot_cpu_data.x86_vendor) )
@@ -601,17 +602,29 @@ static void vmx_cpuid_policy_changed(struct vcpu *v)
 
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
+            goto out;
+    }
     else
+    {
         vmx_set_msr_intercept(v, MSR_SPEC_CTRL, VMX_MSR_RW);
 
+        rc = vmx_del_msr(v, MSR_SPEC_CTRL, VMX_MSR_GUEST);
+        if ( rc && rc != -ESRCH )
+            goto out;
+        rc = 0; /* Tolerate -ESRCH */
+    }
+
     /* MSR_PRED_CMD is safe to pass through if the guest knows about it. */
     if ( cp->feat.ibrsb || cp->extd.ibpb )
         vmx_clear_msr_intercept(v, MSR_PRED_CMD,  VMX_MSR_RW);
@@ -623,6 +636,15 @@ static void vmx_cpuid_policy_changed(struct vcpu *v)
         vmx_clear_msr_intercept(v, MSR_FLUSH_CMD, VMX_MSR_RW);
     else
         vmx_set_msr_intercept(v, MSR_FLUSH_CMD, VMX_MSR_RW);
+
+ out:
+    vmx_vmcs_exit(v);
+
+    if ( rc )
+    {
+        printk(XENLOG_G_ERR "%pv MSR list error: %d", v, rc);
+        domain_crash(v->domain);
+    }
 }
 
 int vmx_guest_x86_mode(struct vcpu *v)
@@ -2407,11 +2429,20 @@ static int vmtrace_reset(struct vcpu *v)
 static uint64_t vmx_get_reg(struct vcpu *v, unsigned int reg)
 {
     struct domain *d = v->domain;
+    uint64_t val = 0;
+    int rc;
 
     switch ( reg )
     {
     case MSR_SPEC_CTRL:
-        return v->arch.msrs->spec_ctrl.raw;
+        rc = vmx_read_guest_msr(v, reg, &val);
+        if ( rc )
+        {
+            printk(XENLOG_G_ERR "%s(%pv, 0x%08x) MSR list error: %d\n",
+                   __func__, v, reg, rc);
+            domain_crash(d);
+        }
+        return val;
 
     default:
         printk(XENLOG_G_ERR "%s(%pv, 0x%08x) Bad register\n",
@@ -2424,11 +2455,18 @@ static uint64_t vmx_get_reg(struct vcpu *v, unsigned int reg)
 static void vmx_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
 {
     struct domain *d = v->domain;
+    int rc;
 
     switch ( reg )
     {
     case MSR_SPEC_CTRL:
-        v->arch.msrs->spec_ctrl.raw = val;
+        rc = vmx_write_guest_msr(v, reg, val);
+        if ( rc )
+        {
+            printk(XENLOG_G_ERR "%s(%pv, 0x%08x) MSR list error: %d\n",
+                   __func__, v, reg, rc);
+            domain_crash(d);
+        }
         break;
 
     default:
diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index 1d3eca9063a2..10039c2d227b 100644
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
index 2b3f123cb501..bf82528a12ae 100644
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
@@ -128,31 +129,6 @@
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


