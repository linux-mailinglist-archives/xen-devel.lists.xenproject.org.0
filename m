Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AACCB48DBFE
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 17:39:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257288.442101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n837m-0001vy-KN; Thu, 13 Jan 2022 16:38:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257288.442101; Thu, 13 Jan 2022 16:38:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n837m-0001mp-C5; Thu, 13 Jan 2022 16:38:54 +0000
Received: by outflank-mailman (input) for mailman id 257288;
 Thu, 13 Jan 2022 16:38:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4514=R5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1n837k-0001gG-Gi
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 16:38:52 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4883d5b0-748f-11ec-bcf3-e9554a921baa;
 Thu, 13 Jan 2022 17:38:50 +0100 (CET)
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
X-Inumbo-ID: 4883d5b0-748f-11ec-bcf3-e9554a921baa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642091930;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sxj8Ni05lVGFYuLB7GuSzaAjISrCd3y2GU6H36Yb4z4=;
  b=QES6lAfQV0foPPUPFsOfHAVFkCfC3tR+ZOo8KH4nwnyFhhf74XLVMgET
   6yc8nR2pBEqCLaVKyQPLB0V52EJHfXWhrw6PxHu0a2NLYz5CCN93U0i/7
   J2baAx4Ahi0EI/pgoC8N9d0qM8QCAL2gM52G0DY9PXVRjDVDp+Q653dGW
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: mpWKD6XAyW/dzNRWG4EIp2Bhp6P2gCPuy+yOy1khUf49HY5RqavOU8Esw5McwD1dSF8zOAg/aF
 EU+iv83gegNPl7GuesOKlqqNH2pOoxZvyXcO6hExHvDx78iDUHOWZqad886CDJJ4aQMphd2zul
 7BodWjqHNo3pYCg4Zp/dHryyowO1TtSShPYiu81abL5fbPCGtLjHAcVCLr8lIMd++kS+DQzxKs
 Qk4LNkdT5KlXMpodJVUeTRRYYP+UmjJqJptQ2pciaZS8LxVWLVpecdVZzymHEFJntNqpmLo32M
 wEZkq4M23/ZHi+jxhJVG5auV
X-SBRS: 5.2
X-MesageID: 62341821
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:RNm+3a7eqdtIP00KwcYx+QxRtOzAchMFZxGqfqrLsTDasY5as4F+v
 mNLUD/TP/iIamH2LdFzbIu2/RlU6seBm9VnSVFlpSAyHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZg29Uw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zy
 uVzuZ2vEl8QM5L93+8vURJGKQJaMvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gQR62CP
 ppDMFKDajzrPzxJamYUNakUs9+jiSbRQwR3+G+a8P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u10bTDwweNdef4SGY6X/qjejK9QvrVYRXGLCm+/pChFyI2ndVGBAQTUG8o/Sylgi5Qd03F
 qAP0nNw9+5orhXtF4SjGU3jyJKZgvICc9hgLeE791rV86fr0kGSNGoPUARiTNNz4afaWgcW/
 lOOmtroAxlmv7uUVW+R+9+okN+iBcQGBTRcPHFZFGPp9/Gm+dhu1UyXEr6PBYbo1oWdJN3m/
 9ydQMHSbZ03hNVD6ai09Euvb9mE9smQFV5dCuk6swuYAuJFiGyNO93ABbvzt68owGOlor+p5
 ihsdy+2trFmMH11vHbRKNjh5Znwjxp/DBXSgER0A74q/Cm39niocOh4uW8ifh8waZ5aJW+yO
 ic/XD+9ArcJbBNGioctMuqM5zkCl/C8RbwJqNiJBjaxXnSBXFDep3w/DaJh92vsjFItgckC1
 WSzKq6R4YIhIf0/llKeHr5FuZdyn3xW7T6NGfjTkkr2uZLDNC/9YepUazOmM7FmhJ5oVS2Iq
 b6zwePQlUUGOAA/CwGKmbMuwacidilkVcuo+p0OJoZu4GNOQQkcNhMY+pt5E6QNokifvr2gE
 qiVVhAKxVzhq2fALAnWOHlvZKm2BcR0rG4hPDxqNlGtgiBxbYGq5aYZVp02Ybh4q7Azka8qF
 6EIK5eaH/BCajXb4DBBP5Pzm5NvKUawjgWUMiv7PDVmJ8x8RxbE88PPdxf08HVcFTK+sMYz+
 uXy1g7STZcZaR5lCcLaNKCmw1+r5CBPk+NuRUrYZNJUfRy0ooRtLiXwiN4xIt0NdkqflmfLi
 V7ODE5B9+fXooIz/N3Yvoy+rt+kQ7lkA05XP2jH9rLqZyPUyXWunN1bW+GScDGDCG6toPe+Z
 f9Yxu3XOeEcmAoYqJJ1FrtmwP5s59broLMGnA1oEG+SMgauA7JkZHKHwdNOputGwboA4Vm6X
 UeG+997P7SVOZy6TA5NdVR9NunTh+sJnjTy7OguJBSo7SB6y7OLTEFOMkTekydaNrZ0bNsoz
 OpJVBT6MOBjZs7G6uq7sx0=
IronPort-HdrOrdr: A9a23:vbGmha5VsjoDo7gKTQPXwPLXdLJyesId70hD6qhwISY1TiX+rb
 HXoB17726MtN9/YgBCpTntAsa9qDbnhPpICOoqTNGftWvdyQmVxehZhOOIqVCNJ8S9zJ876U
 4JSdkENDSaNzhHZKjBjjVQa+xQpeW6zA==
X-IronPort-AV: E=Sophos;i="5.88,286,1635220800"; 
   d="scan'208";a="62341821"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/3] x86/msr: Split MSR_SPEC_CTRL handling
Date: Thu, 13 Jan 2022 16:38:31 +0000
Message-ID: <20220113163833.3831-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220113163833.3831-1-andrew.cooper3@citrix.com>
References: <20220113163833.3831-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

In order to fix a VT-x bug, and support MSR_SPEC_CTRL on AMD, there will need
to be three different access methods for where the guest's value lives.
However, it would be better not to duplicate the #GP checking logic.

guest_{rd,wr}msr() are always called first in the PV and HVM MSR paths, so we
can repurpose X86EMUL_UNHANDLEABLE slightly for this.  This is going to be a
common pattern for other MSRs too in the future.

Duplicate the msrs->spec_ctrl.raw accesses in the PV and VT-x paths for now.
The SVM path is currently unreachable because of the CPUID policy.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/hvm/vmx/vmx.c     | 10 ++++++++++
 xen/arch/x86/include/asm/msr.h | 11 +++++++----
 xen/arch/x86/msr.c             |  6 ++----
 xen/arch/x86/pv/emul-priv-op.c | 10 ++++++++++
 4 files changed, 29 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index a7a0d662342a..28ee6393f11e 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3128,12 +3128,17 @@ static int is_last_branch_msr(u32 ecx)
 static int vmx_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
 {
     struct vcpu *curr = current;
+    const struct vcpu_msrs *msrs = curr->arch.msrs;
     uint64_t tmp;
 
     HVM_DBG_LOG(DBG_LEVEL_MSR, "ecx=%#x", msr);
 
     switch ( msr )
     {
+    case MSR_SPEC_CTRL: /* guest_rdmsr() has already performed #GP checks. */
+        *msr_content = msrs->spec_ctrl.raw;
+        break;
+
     case MSR_IA32_SYSENTER_CS:
         __vmread(GUEST_SYSENTER_CS, msr_content);
         break;
@@ -3331,6 +3336,7 @@ void vmx_vlapic_msr_changed(struct vcpu *v)
 static int vmx_msr_write_intercept(unsigned int msr, uint64_t msr_content)
 {
     struct vcpu *v = current;
+    struct vcpu_msrs *msrs = v->arch.msrs;
     const struct cpuid_policy *cp = v->domain->arch.cpuid;
 
     HVM_DBG_LOG(DBG_LEVEL_MSR, "ecx=%#x, msr_value=%#"PRIx64, msr, msr_content);
@@ -3339,6 +3345,10 @@ static int vmx_msr_write_intercept(unsigned int msr, uint64_t msr_content)
     {
         uint64_t rsvd, tmp;
 
+    case MSR_SPEC_CTRL: /* guest_wrmsr() has already performed #GP checks. */
+        msrs->spec_ctrl.raw = msr_content;
+        return X86EMUL_OKAY;
+
     case MSR_IA32_SYSENTER_CS:
         __vmwrite(GUEST_SYSENTER_CS, msr_content);
         break;
diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index 1d3eca9063a2..0b2176a9bc53 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -367,10 +367,13 @@ int init_domain_msr_policy(struct domain *d);
 int init_vcpu_msr_policy(struct vcpu *v);
 
 /*
- * Below functions can return X86EMUL_UNHANDLEABLE which means that MSR is
- * not (yet) handled by it and must be processed by legacy handlers. Such
- * behaviour is needed for transition period until all rd/wrmsr are handled
- * by the new MSR infrastructure.
+ * The below functions return X86EMUL_*.  Callers are responsible for
+ * converting X86EMUL_EXCEPTION into #GP[0].
+ *
+ * X86EMUL_UNHANDLEABLE means "not everything complete".  It could be that:
+ *   1) Common #GP checks have been done, but val access needs delegating to the
+ *      per-VM-type handlers.
+ *   2) The MSR is not handled at all by common logic.
  *
  * These functions are also used by the migration logic, so need to cope with
  * being used outside of v's context.
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index b834456c7b02..3549630d6699 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -265,8 +265,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
     case MSR_SPEC_CTRL:
         if ( !cp->feat.ibrsb )
             goto gp_fault;
-        *val = msrs->spec_ctrl.raw;
-        break;
+        return X86EMUL_UNHANDLEABLE; /* Delegate value to per-VM-type logic. */
 
     case MSR_INTEL_PLATFORM_INFO:
         *val = mp->platform_info.raw;
@@ -514,8 +513,7 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
         if ( val & rsvd )
             goto gp_fault; /* Rsvd bit set? */
 
-        msrs->spec_ctrl.raw = val;
-        break;
+        return X86EMUL_UNHANDLEABLE; /* Delegate value to per-VM-type logic. */
 
     case MSR_PRED_CMD:
         if ( !cp->feat.ibrsb && !cp->extd.ibpb )
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index c78be6d92b21..6644e739209c 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -875,6 +875,7 @@ static int read_msr(unsigned int reg, uint64_t *val,
                     struct x86_emulate_ctxt *ctxt)
 {
     struct vcpu *curr = current;
+    const struct vcpu_msrs *msrs = curr->arch.msrs;
     const struct domain *currd = curr->domain;
     const struct cpuid_policy *cp = currd->arch.cpuid;
     bool vpmu_msr = false, warn = false;
@@ -898,6 +899,10 @@ static int read_msr(unsigned int reg, uint64_t *val,
             *val |= APIC_BASE_BSP;
         return X86EMUL_OKAY;
 
+    case MSR_SPEC_CTRL: /* guest_rdmsr() has already performed #GP checks. */
+        *val = msrs->spec_ctrl.raw;
+        return X86EMUL_OKAY;
+
     case MSR_FS_BASE:
         if ( !cp->extd.lm )
             break;
@@ -1024,6 +1029,7 @@ static int write_msr(unsigned int reg, uint64_t val,
                      struct x86_emulate_ctxt *ctxt)
 {
     struct vcpu *curr = current;
+    struct vcpu_msrs *msrs = curr->arch.msrs;
     const struct domain *currd = curr->domain;
     const struct cpuid_policy *cp = currd->arch.cpuid;
     bool vpmu_msr = false;
@@ -1041,6 +1047,10 @@ static int write_msr(unsigned int reg, uint64_t val,
     {
         uint64_t temp;
 
+    case MSR_SPEC_CTRL: /* guest_wrmsr() has already performed #GP checks. */
+        msrs->spec_ctrl.raw = val;
+        return X86EMUL_OKAY;
+
     case MSR_FS_BASE:
     case MSR_GS_BASE:
     case MSR_SHADOW_GS_BASE:
-- 
2.11.0


