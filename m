Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DFA495E5B
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jan 2022 12:23:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259322.447507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAs0Y-0006dN-6B; Fri, 21 Jan 2022 11:23:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259322.447507; Fri, 21 Jan 2022 11:23:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAs0Y-0006a9-2R; Fri, 21 Jan 2022 11:23:06 +0000
Received: by outflank-mailman (input) for mailman id 259322;
 Fri, 21 Jan 2022 11:23:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s92u=SF=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nAs0X-0006a2-AH
 for xen-devel@lists.xenproject.org; Fri, 21 Jan 2022 11:23:05 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ebae240-7aac-11ec-bc18-3156f6d857e4;
 Fri, 21 Jan 2022 12:23:03 +0100 (CET)
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
X-Inumbo-ID: 7ebae240-7aac-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642764183;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eoFpNsK2jeHDEvBaOEJZ2DCi/ods/cD04P7K88sC1vI=;
  b=B1+V82mBxcUzZapHK0TC7QCuiiPg2p2ZHiCDhZpuS/HViKzAt372RzTK
   Ykvl/EkA0P84SWTKCMw3X4rjiUbmuQHH5qX57q0ljFxILaM5UjxMrDbyJ
   xXxpYAVV+zrmXOYIioSt4ftz/Pf7DLnQOfq59nspMBACRNfVKB2fj77rV
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: NRqAygDh0yJJV4h7PasClmkU6c+fnvzXj5idtrxfCfIuoRZEfIhKN2XenzGkSSIVTgra16HIvj
 QroB2ONeJ//dkTtzZg+YRWBTwXW9aFowSoOGlWLDcghdD12pVP1Vgbq2TQ2oBq/C9pkNuBXarH
 88NFvAuKJYZ24pUBp3YkBLfgXfbOhx/XJG5XlGvuuKSCQyxI3zzFB8XJXccbW1EoiBn/3N0Sjt
 WZtOsqPS15q6Wj24QgbBNo5Bk/QEGdi/fp6mKFCDPz/O7AvRZfZaVBhS6FwQn8OuiyFJaHtpoo
 bSK+eOHinfjVmBEusLCJFtB3
X-SBRS: 5.2
X-MesageID: 64636955
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:K3JfiKn6q78l16swVWDFkq3o5gwEIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJMDTuPPKmOZ2vyKYogOdi/oU8G6pKBx9M3GgU6/is1FyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh29Qx2YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 O4X7I6dUxoMBaDvpdU7TFpqSw8nIqITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQ6qAP
 JRINGcHgBLoRThmOFxUCJYEzNj1qkXjaxNyuF2qqv9ii4TU5FMoi+W8WDbPQfSIWMMTmE+br
 2DH+m3RAxcGOdjZwj2Amlqvi/HOm2XnWYsUPLy+6vNuxlaUwwQ7Fxk+RVa95/6jhSaWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8UYwgyQzqvf4y6CG3MJCDVGbbQbWNQeHGJwk
 AXTxpWwWGIp4Ob9pW+hGqm8lmnrKwUPMEo5aAw5fC0aoOu7jtgsgUeaJjp8K5KdgtrwEDD25
 jmFqikimrke5fI2O7WHEUPv2Gz1+MWQJuIhzkCOBz/+sFslDGKwT9XwsQCz0BpWEGqOorBtV
 lAgktPW0u0BBIrleMelELRUR+HBCxpo3VThbb9T83sJqmzFF52LJ9k4DNRCyKFBaJdsldjBO
 h67hO+pzMUPVEZGlIcuC25LN+wkzLL7CfPuXe3OY9xFb/BZLVHbpn42Ph/BhjyzyCDAdJ3T3
 7/AKa5A6l5BUcxaIMeeHb9BgdfHOAhjrY8seXwL50v+iufPDJJkYbwELEGPfogEAFCs+23oH
 yJkH5LSkX13CbSmCgGOqNJ7BQ1UcRATWM6nw+QKJr/rClc3QwkJVq6OqY7NjqQ4xcy5YM+So
 CHkMqKZoXKi7UD6xfKiMyA6N+i3DM8h9BrW/0UEZD6V5pTqWq73hI93Snf9VeBPGDVLwaEmQ
 v8bVd+HB/gTGD3L9y5ENcv2rZB4dQTtjgWLZnL3bD86dp9mZgrI5t67IVe/qHhQVnK65Zkkv
 rmt9gLHWp5fFQ5sO9nbNaC0xFSrsHlDxO8rBxnUIsNecVnH+ZRxL3Cjlec+JswBcE2RxjaT2
 wuMLw0foO3B/908/NXT3PjWpIa1CepuWEFdGjCDv7qxMCDb+EulwJNBD7nULWyMCjus9fz7N
 +tPzvz6PPkWp3pwstJxQ+Rx0KYzx9rzvLsGnA5qK2rGMgawAbR6L3jYgcQW7v9RxqVUsBedU
 16U/oUIIq2APc7oHQJDJAchaejfh/gYliOLsKYwKUT+oiR24KCGQQNZOBzV0H5RK758MYUEx
 +Y9uZFJt1zj20RyatvW3DpJ82msL2AbV/R1v54XN4bnlw43xwwQepfbECL3vMmCZtgk3pPG+
 dNIaH4uX4hh+3c=
IronPort-HdrOrdr: A9a23:fZ7Swaz/+XpQr4G8C3D7KrPwIL1zdoMgy1knxilNoRw8SKKlfq
 eV7ZMmPH7P+VIssR4b+exoVJPtfZq+z+8R3WByB8bAYOCOggLBR+sO0WKL+UyHJ8SUzI9gPM
 lbHJSWcOeAb2RHsQ==
X-IronPort-AV: E=Sophos;i="5.88,304,1635220800"; 
   d="scan'208";a="64636955"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH] x86/hvm: Drop get_shadow_gs_base() hook and use hvm_get_reg()
Date: Fri, 21 Jan 2022 11:22:41 +0000
Message-ID: <20220121112241.19277-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This is a trivial accessor for an MSR, so use hvm_get_reg() rather than a
dedicated hook.  In arch_get_info_guest(), rework the logic to read GS_SHADOW
only once.

get_hvm_registers() is called on current, meaning that diagnostics print a
stale GS_SHADOW from the previous vcpu context switch.  Adjust both
implementations to obtain the correct value.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jun Nakajima <jun.nakajima@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>

If we care to backport the bugfix aspect, a far less invasive option would be
to read MSR_SHADOW_GS_BASE directly.

The only case where that goes wrong is when vmcb->kerngsbase has been modified
and is pending a VMLOAD.  I'm fairly sure this can only occur when we need
vcpu diagnostics, after an emulated write of MSR_SHADOW_GS_BASE.
---
 xen/arch/x86/domctl.c              |  8 ++++++--
 xen/arch/x86/hvm/svm/svm.c         | 12 ++++++------
 xen/arch/x86/hvm/vmx/vmx.c         | 16 ++++++++++------
 xen/arch/x86/include/asm/hvm/hvm.h |  7 -------
 xen/arch/x86/x86_64/traps.c        |  2 +-
 5 files changed, 23 insertions(+), 22 deletions(-)

diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 7d102e0647ec..e49f9e91b9fa 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -1447,6 +1447,7 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
     if ( is_hvm_domain(d) )
     {
         struct segment_register sreg;
+        unsigned long gs_shadow;
 
         c.nat->ctrlreg[0] = v->arch.hvm.guest_cr[0];
         c.nat->ctrlreg[2] = v->arch.hvm.guest_cr[2];
@@ -1465,15 +1466,18 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
         c.nat->fs_base = sreg.base;
         hvm_get_segment_register(v, x86_seg_gs, &sreg);
         c.nat->user_regs.gs = sreg.sel;
+
+        gs_shadow = hvm_get_reg(v, MSR_SHADOW_GS_BASE);
+
         if ( ring_0(&c.nat->user_regs) )
         {
             c.nat->gs_base_kernel = sreg.base;
-            c.nat->gs_base_user = hvm_get_shadow_gs_base(v);
+            c.nat->gs_base_user = gs_shadow;
         }
         else
         {
             c.nat->gs_base_user = sreg.base;
-            c.nat->gs_base_kernel = hvm_get_shadow_gs_base(v);
+            c.nat->gs_base_kernel = gs_shadow;
         }
     }
     else
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index bb6b8e560a9f..e3bc88e78058 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -752,11 +752,6 @@ static void svm_set_segment_register(struct vcpu *v, enum x86_segment seg,
     }
 }
 
-static unsigned long svm_get_shadow_gs_base(struct vcpu *v)
-{
-    return v->arch.hvm.svm.vmcb->kerngsbase;
-}
-
 static int svm_set_guest_pat(struct vcpu *v, u64 gpat)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
@@ -2471,10 +2466,16 @@ static bool svm_get_pending_event(struct vcpu *v, struct x86_event *info)
 
 static uint64_t svm_get_reg(struct vcpu *v, unsigned int reg)
 {
+    struct vcpu *curr = current;
     struct domain *d = v->domain;
 
     switch ( reg )
     {
+    case MSR_SHADOW_GS_BASE:
+        if ( v == curr )
+            svm_sync_vmcb(v, vmcb_in_sync);
+        return v->arch.hvm.svm.vmcb->kerngsbase;
+
     default:
         printk(XENLOG_G_ERR "%s(%pv, 0x%08x) Bad register\n",
                __func__, v, reg);
@@ -2513,7 +2514,6 @@ static struct hvm_function_table __initdata svm_function_table = {
     .get_cpl              = svm_get_cpl,
     .get_segment_register = svm_get_segment_register,
     .set_segment_register = svm_set_segment_register,
-    .get_shadow_gs_base   = svm_get_shadow_gs_base,
     .update_guest_cr      = svm_update_guest_cr,
     .update_guest_efer    = svm_update_guest_efer,
     .cpuid_policy_changed = svm_cpuid_policy_changed,
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index c44cf8f5d425..27c36af6027d 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1183,11 +1183,6 @@ static void vmx_set_segment_register(struct vcpu *v, enum x86_segment seg,
     vmx_vmcs_exit(v);
 }
 
-static unsigned long vmx_get_shadow_gs_base(struct vcpu *v)
-{
-    return v->arch.hvm.vmx.shadow_gs;
-}
-
 static int vmx_set_guest_pat(struct vcpu *v, u64 gpat)
 {
     if ( !paging_mode_hap(v->domain) ||
@@ -2401,6 +2396,7 @@ static int vmtrace_reset(struct vcpu *v)
 
 static uint64_t vmx_get_reg(struct vcpu *v, unsigned int reg)
 {
+    struct vcpu *curr = current;
     struct domain *d = v->domain;
     uint64_t val = 0;
     int rc;
@@ -2417,6 +2413,15 @@ static uint64_t vmx_get_reg(struct vcpu *v, unsigned int reg)
             domain_crash(d);
         }
         return val;
+
+    case MSR_SHADOW_GS_BASE:
+        if ( v == curr )
+        {
+            rdmsrl(MSR_SHADOW_GS_BASE, val);
+            return val;
+        }
+        else
+            return v->arch.hvm.vmx.shadow_gs;
     }
 
     /* Logic which maybe requires remote VMCS acquisition. */
@@ -2489,7 +2494,6 @@ static struct hvm_function_table __initdata vmx_function_table = {
     .get_cpl              = _vmx_get_cpl,
     .get_segment_register = vmx_get_segment_register,
     .set_segment_register = vmx_set_segment_register,
-    .get_shadow_gs_base   = vmx_get_shadow_gs_base,
     .update_host_cr3      = vmx_update_host_cr3,
     .update_guest_cr      = vmx_update_guest_cr,
     .update_guest_efer    = vmx_update_guest_efer,
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 842f98763c4b..feb9d221a6a6 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -128,7 +128,6 @@ struct hvm_function_table {
                                  struct segment_register *reg);
     void (*set_segment_register)(struct vcpu *v, enum x86_segment seg,
                                  struct segment_register *reg);
-    unsigned long (*get_shadow_gs_base)(struct vcpu *v);
 
     /* 
      * Re-set the value of CR3 that Xen runs on when handling VM exits.
@@ -469,11 +468,6 @@ hvm_get_cpl(struct vcpu *v)
     return alternative_call(hvm_funcs.get_cpl, v);
 }
 
-static inline unsigned long hvm_get_shadow_gs_base(struct vcpu *v)
-{
-    return alternative_call(hvm_funcs.get_shadow_gs_base, v);
-}
-
 #define has_hvm_params(d) \
     ((d)->arch.hvm.params != NULL)
 
@@ -753,7 +747,6 @@ void hvm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val);
  * needed because DCE will kick in.
  */
 int hvm_guest_x86_mode(struct vcpu *v);
-unsigned long hvm_get_shadow_gs_base(struct vcpu *v);
 void hvm_cpuid_policy_changed(struct vcpu *v);
 void hvm_set_tsc_offset(struct vcpu *v, uint64_t offset, uint64_t at_tsc);
 
diff --git a/xen/arch/x86/x86_64/traps.c b/xen/arch/x86/x86_64/traps.c
index d661d7ffcaaf..d97bf07b22bc 100644
--- a/xen/arch/x86/x86_64/traps.c
+++ b/xen/arch/x86/x86_64/traps.c
@@ -79,7 +79,7 @@ static void get_hvm_registers(struct vcpu *v, struct cpu_user_regs *regs,
     hvm_get_segment_register(v, x86_seg_ss, &sreg);
     regs->ss = sreg.sel;
 
-    crs[7] = hvm_get_shadow_gs_base(v);
+    crs[7] = hvm_get_reg(v, MSR_SHADOW_GS_BASE);
 }
 
 static void _show_registers(
-- 
2.11.0


