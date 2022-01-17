Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EE34910A3
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 20:26:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258237.444517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Xdf-0003lp-Ui; Mon, 17 Jan 2022 19:25:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258237.444517; Mon, 17 Jan 2022 19:25:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Xdf-0003je-Rb; Mon, 17 Jan 2022 19:25:59 +0000
Received: by outflank-mailman (input) for mailman id 258237;
 Mon, 17 Jan 2022 19:25:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PnDA=SB=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1n9Xdd-0003jY-Pz
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 19:25:57 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49494667-77cb-11ec-9bbc-9dff3e4ee8c5;
 Mon, 17 Jan 2022 20:25:55 +0100 (CET)
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
X-Inumbo-ID: 49494667-77cb-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642447555;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TBxUQEv/8KGeyofIzKhKk3pEAr7Tyk9mYlDRniD8VBQ=;
  b=XFD0vVojkSWTAZmYBFQ9lNgYNsBasfmfKLoMaNkta7d+J1GNnPNbJdjD
   8nkOqaYSQaZkFBm1NqcPRQgj1mELRJC5e1YXtGHjsnu5u1lScrZayUd4T
   LcWrCCeVofwQ5/po7VYLxRr2dN7i6UuySwIB2MNlSvc/3tOAG6xzN0mla
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: GjkUb/gmnaynm5e6p1c5O6X5SKz2XnJO/6zR3OuZj7jQsV+RaSYnjwKIjfglPcGdRM+TalHtUv
 J8BOk7D20tu33NX4SkPoM3FdQNbxY3QiuKtnh7S3vxwFxzw4NRG/qZEVGpDO9r/eJ30qI+n6BT
 68y0Smlby+pIo0S4jPtEnuAjxzKJ52GTTpCmlhXvqE8Pqs8bgnOGU1T76bafZ9RIeAICJa5bHy
 U0VACzxTp+KPQe/9O5fgDPCP2BbF838m4PeaABtuAGnvC/nHUlQrvEZws459pvXyqa8cpIGrxl
 eku8WzC6PjzV4KOEqqT7wJzA
X-SBRS: 5.2
X-MesageID: 62164950
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:glJ0LqPqB3rgiPTvrR0gkMFynXyQoLVcMsEvi/4bfWQNrUom1WZSn
 zAfCzuBa/uMYjSnfI8iO9my/UxSvceGmoUySgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En150Es8w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoznTmNFt2
 vFgjLK1dQAvJq+Pw+EeejANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YsBqit4uM4/AO4QHt2s75TrYEewnUdbIRKCiCdpwgm1p2JwfQK62i
 8wxexs+Lw7veBd0MwkHN8scncm51lfzWmgNwL6SjfVuuDWCpOBr65DvLdyTfNWJTMdUm0+wp
 2Ta8mC/CRYfXPScxCSE9DSwh+bJtSL9RI8WUra/85ZCn1m71mEVThoMWjOTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jY+cddNF+wx6CmW17HZpQ2eAwA5oiVpMYJ88pVsHHpzi
 wHPz4iB6SFTXKO9RSia96uGiR6LFy0pKmkaZ2xfSAgsyoy2yG0stS7nQtFmGa+zq9T6HzDs3
 jyHxBQDa6UvYd0jjPviow2e6964jt2QF1NuuF2LNo6wxlohPNbNWmC+1bTMAR+sxq69R0LJg
 nULktP2AAsmXcDUz3zlrAng8diUCxe53N/03AQH83oJrW3FF5ufkWZ4umsWyKBBaJdsRNMRS
 BWP0T69HbcKVJdQUYd5YpiqF+MhxrX6GNLuW5j8N4QSOMMsJFTXoH0wNSZ8OlwBdmB2zMnT3
 r/BIK6R4YsyU/w7nFJauc9AuVPU+szO7TyKHs2qp/hW+bGfeGSUWd843KimNYgEAFe/iFyNq
 b53bpLSoz0GCbGWSnSJreY7cA5bRVBmVcGeg5EGLYarf1s5cFzN/teMm9vNjaQ/wfQM/goJl
 1ngMnJlJK3X3iyYeV7UOyE6ONsCn/9X9BoGAMDlBn7ws1BLXGplxP53m0IfceZ1+ep94+RzS
 vVZKcyMDu4WEmbM+igHbIm7p4tnLUz5iQWLNiujQT4+Y58/GFCZpo66JlPipHsUEy66lcoiu
 Ln8hAnVdoUOGlZ5B8HMZfPxk17o5SoBmPh/VlfjK8VIfBm+65BjLiH816dlI8wFJRjZ6CGd0
 gKaXUURqeXX+tdn+9jVn6GU6YyuFrImTEZdGmDa65ewNDXboTX/kdMRDr7QcGmEBm3u+aika
 eFE9N3GMaUKzARQro5xM7d31qZitdHhkKBXk1Z/F3LRYlX1Vr45eiua3dNCv7Fmz6NCvVfkQ
 VqG/9RXNOnbOM7hF1JNdgMpYv7aiKMRkzjWq/80PF/79Gl8+7/eCRdeOByFiSp8KrppMdx6n
 bd96ZBOswHv2AA3NtumjzxP8zXeJ3MNZKwrq5UGDdK5kQEs0FxDPcTRByKeDEtjsDmQ3p3G+
 gOpuZc=
IronPort-HdrOrdr: A9a23:DCXioakX/Dwzo31t3dM4a0OkalHpDfIU3DAbv31ZSRFFG/Fxl6
 iV8sjzsiWE8Qr5OUtQ/+xoV5PhfZqxz/JICMwqTNKftWrdyQyVxeNZnOjfKlTbckWUnINgPO
 VbAsxD4bXLfCBHZK3BgTVQfexO/DD+ytHLudvj
X-IronPort-AV: E=Sophos;i="5.88,296,1635220800"; 
   d="scan'208";a="62164950"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v2 5/4] x86/hvm: Drop hvm_{get,set}_guest_bndcfgs() and use {get,set}_regs() instead
Date: Mon, 17 Jan 2022 19:25:33 +0000
Message-ID: <20220117192533.6048-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220117183415.11150-1-andrew.cooper3@citrix.com>
References: <20220117183415.11150-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

hvm_{get,set}_guest_bndcfgs() are thin wrappers around accessing MSR_BNDCFGS.

MPX was implemented on Skylake uarch CPUs and dropped in subsequent CPUs, and
is disabled by default in Xen VMs.

It would be nice to move all the logic into vmx_msr_{read,write}_intercept(),
but the common HVM migration code uses guest_{rd,wr}msr().  Therefore, use
{get,set}_regs() to reduce the quantity of "common" HVM code.

In lieu of having hvm_set_guest_bndcfgs() split out, use some #ifdef
CONFIG_HVM in guest_wrmsr().  In vmx_{get,set}_regs(), split the switch
statements into two depending on whether the require remote VMCS acquisition
or not.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jun Nakajima <jun.nakajima@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>

This counteracts the hvm_funcs size increase from {get,set}_regs(), and shows
how to use the new functionality to clean the HVM logic up.
---
 xen/arch/x86/hvm/hvm.c             | 37 --------------------------
 xen/arch/x86/hvm/vmx/vmx.c         | 54 ++++++++++++++++++--------------------
 xen/arch/x86/include/asm/hvm/hvm.h | 12 ---------
 xen/arch/x86/msr.c                 | 34 +++++++++++++++++++-----
 4 files changed, 53 insertions(+), 84 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index b530e986e86c..d7d3299b431e 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -324,43 +324,6 @@ int hvm_set_guest_pat(struct vcpu *v, uint64_t guest_pat)
     return 1;
 }
 
-bool hvm_set_guest_bndcfgs(struct vcpu *v, u64 val)
-{
-    if ( !hvm_funcs.set_guest_bndcfgs ||
-         !is_canonical_address(val) ||
-         (val & IA32_BNDCFGS_RESERVED) )
-        return false;
-
-    /*
-     * While MPX instructions are supposed to be gated on XCR0.BND*, let's
-     * nevertheless force the relevant XCR0 bits on when the feature is being
-     * enabled in BNDCFGS.
-     */
-    if ( (val & IA32_BNDCFGS_ENABLE) &&
-         !(v->arch.xcr0_accum & (X86_XCR0_BNDREGS | X86_XCR0_BNDCSR)) )
-    {
-        uint64_t xcr0 = get_xcr0();
-        int rc;
-
-        if ( v != current )
-            return false;
-
-        rc = handle_xsetbv(XCR_XFEATURE_ENABLED_MASK,
-                           xcr0 | X86_XCR0_BNDREGS | X86_XCR0_BNDCSR);
-
-        if ( rc )
-        {
-            HVM_DBG_LOG(DBG_LEVEL_1, "Failed to force XCR0.BND*: %d", rc);
-            return false;
-        }
-
-        if ( handle_xsetbv(XCR_XFEATURE_ENABLED_MASK, xcr0) )
-            /* nothing, best effort only */;
-    }
-
-    return alternative_call(hvm_funcs.set_guest_bndcfgs, v, val);
-}
-
 /*
  * Get the ratio to scale host TSC frequency to gtsc_khz. zero will be
  * returned if TSC scaling is unavailable or ratio cannot be handled
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 69e38d0fa8f9..8c55e56cbddb 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1212,28 +1212,6 @@ static int vmx_get_guest_pat(struct vcpu *v, u64 *gpat)
     return 1;
 }
 
-static bool vmx_set_guest_bndcfgs(struct vcpu *v, u64 val)
-{
-    ASSERT(cpu_has_mpx && cpu_has_vmx_mpx);
-
-    vmx_vmcs_enter(v);
-    __vmwrite(GUEST_BNDCFGS, val);
-    vmx_vmcs_exit(v);
-
-    return true;
-}
-
-static bool vmx_get_guest_bndcfgs(struct vcpu *v, u64 *val)
-{
-    ASSERT(cpu_has_mpx && cpu_has_vmx_mpx);
-
-    vmx_vmcs_enter(v);
-    __vmread(GUEST_BNDCFGS, val);
-    vmx_vmcs_exit(v);
-
-    return true;
-}
-
 static void vmx_handle_cd(struct vcpu *v, unsigned long value)
 {
     if ( !paging_mode_hap(v->domain) )
@@ -2432,6 +2410,7 @@ static uint64_t vmx_get_reg(struct vcpu *v, unsigned int reg)
     uint64_t val = 0;
     int rc;
 
+    /* Logic which doesn't require remote VMCS acquisition. */
     switch ( reg )
     {
     case MSR_SPEC_CTRL:
@@ -2443,13 +2422,25 @@ static uint64_t vmx_get_reg(struct vcpu *v, unsigned int reg)
             domain_crash(d);
         }
         return val;
+    }
+
+    /* Logic which maybe requires remote VMCS acquisition. */
+    vmx_vmcs_enter(v);
+    switch ( reg )
+    {
+    case MSR_IA32_BNDCFGS:
+        __vmread(GUEST_BNDCFGS, &val);
+        break;
 
     default:
         printk(XENLOG_G_ERR "%s(%pv, 0x%08x) Bad register\n",
                __func__, v, reg);
         domain_crash(d);
-        return 0;
+        break;
     }
+    vmx_vmcs_exit(v);
+
+    return val;
 }
 
 static void vmx_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
@@ -2457,6 +2448,7 @@ static void vmx_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
     struct domain *d = v->domain;
     int rc;
 
+    /* Logic which doesn't require remote VMCS acquisition. */
     switch ( reg )
     {
     case MSR_SPEC_CTRL:
@@ -2467,6 +2459,15 @@ static void vmx_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
                    __func__, v, reg, rc);
             domain_crash(d);
         }
+        return;
+    }
+
+    /* Logic which maybe requires remote VMCS acquisition. */
+    vmx_vmcs_enter(v);
+    switch ( reg )
+    {
+    case MSR_IA32_BNDCFGS:
+        __vmwrite(GUEST_BNDCFGS, val);
         break;
 
     default:
@@ -2474,6 +2475,7 @@ static void vmx_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
                __func__, v, reg, val);
         domain_crash(d);
     }
+    vmx_vmcs_exit(v);
 }
 
 static struct hvm_function_table __initdata vmx_function_table = {
@@ -2796,12 +2798,6 @@ const struct hvm_function_table * __init start_vmx(void)
         vmx_function_table.tsc_scaling.setup = vmx_setup_tsc_scaling;
     }
 
-    if ( cpu_has_mpx && cpu_has_vmx_mpx )
-    {
-        vmx_function_table.set_guest_bndcfgs = vmx_set_guest_bndcfgs;
-        vmx_function_table.get_guest_bndcfgs = vmx_get_guest_bndcfgs;
-    }
-
     lbr_tsx_fixup_check();
     ler_to_fixup_check();
 
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index c8b62b514b42..7bb7d0b77d32 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -148,9 +148,6 @@ struct hvm_function_table {
     int  (*get_guest_pat)(struct vcpu *v, u64 *);
     int  (*set_guest_pat)(struct vcpu *v, u64);
 
-    bool (*get_guest_bndcfgs)(struct vcpu *v, u64 *);
-    bool (*set_guest_bndcfgs)(struct vcpu *v, u64);
-
     void (*set_tsc_offset)(struct vcpu *v, u64 offset, u64 at_tsc);
 
     void (*inject_event)(const struct x86_event *event);
@@ -291,8 +288,6 @@ void hvm_set_segment_register(struct vcpu *v, enum x86_segment seg,
 
 void hvm_set_info_guest(struct vcpu *v);
 
-bool hvm_set_guest_bndcfgs(struct vcpu *v, u64 val);
-
 int hvm_vmexit_cpuid(struct cpu_user_regs *regs, unsigned int inst_len);
 void hvm_migrate_timers(struct vcpu *v);
 void hvm_do_resume(struct vcpu *v);
@@ -479,12 +474,6 @@ static inline unsigned long hvm_get_shadow_gs_base(struct vcpu *v)
     return alternative_call(hvm_funcs.get_shadow_gs_base, v);
 }
 
-static inline bool hvm_get_guest_bndcfgs(struct vcpu *v, u64 *val)
-{
-    return hvm_funcs.get_guest_bndcfgs &&
-           alternative_call(hvm_funcs.get_guest_bndcfgs, v, val);
-}
-
 #define has_hvm_params(d) \
     ((d)->arch.hvm.params != NULL)
 
@@ -768,7 +757,6 @@ int hvm_guest_x86_mode(struct vcpu *v);
 unsigned long hvm_get_shadow_gs_base(struct vcpu *v);
 void hvm_cpuid_policy_changed(struct vcpu *v);
 void hvm_set_tsc_offset(struct vcpu *v, uint64_t offset, uint64_t at_tsc);
-bool hvm_get_guest_bndcfgs(struct vcpu *v, uint64_t *val);
 
 /* End of prototype list */
 
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index fd4012808472..9e22404eb24a 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -30,6 +30,7 @@
 #include <asm/msr.h>
 #include <asm/pv/domain.h>
 #include <asm/setup.h>
+#include <asm/xstate.h>
 
 #include <public/hvm/params.h>
 
@@ -323,10 +324,9 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
         break;
 
     case MSR_IA32_BNDCFGS:
-        if ( !cp->feat.mpx || !is_hvm_domain(d) ||
-             !hvm_get_guest_bndcfgs(v, val) )
+        if ( !cp->feat.mpx ) /* Implies Intel HVM only */
             goto gp_fault;
-        break;
+        goto get_reg;
 
     case MSR_IA32_XSS:
         if ( !cp->xstate.xsaves )
@@ -594,11 +594,33 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
         ret = guest_wrmsr_x2apic(v, msr, val);
         break;
 
+#ifdef CONFIG_HVM
     case MSR_IA32_BNDCFGS:
-        if ( !cp->feat.mpx || !is_hvm_domain(d) ||
-             !hvm_set_guest_bndcfgs(v, val) )
+        if ( !cp->feat.mpx || /* Implies Intel HVM only */
+             !is_canonical_address(val) || (val & IA32_BNDCFGS_RESERVED) )
             goto gp_fault;
-        break;
+
+        /*
+         * While MPX instructions are supposed to be gated on XCR0.BND*, let's
+         * nevertheless force the relevant XCR0 bits on when the feature is
+         * being enabled in BNDCFGS.
+         */
+        if ( (val & IA32_BNDCFGS_ENABLE) &&
+             !(v->arch.xcr0_accum & (X86_XCR0_BNDREGS | X86_XCR0_BNDCSR)) )
+        {
+            uint64_t xcr0 = get_xcr0();
+
+            if ( v != current ||
+                 handle_xsetbv(XCR_XFEATURE_ENABLED_MASK,
+                               xcr0 | X86_XCR0_BNDREGS | X86_XCR0_BNDCSR) )
+                goto gp_fault;
+
+            if ( handle_xsetbv(XCR_XFEATURE_ENABLED_MASK, xcr0) )
+                /* nothing, best effort only */;
+        }
+
+        goto set_reg;
+#endif /* CONFIG_HVM */
 
     case MSR_IA32_XSS:
         if ( !cp->xstate.xsaves )
-- 
2.11.0


