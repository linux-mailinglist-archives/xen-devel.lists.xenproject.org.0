Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0D61C5EED
	for <lists+xen-devel@lfdr.de>; Tue,  5 May 2020 19:33:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jW1Rb-0004iz-Ty; Tue, 05 May 2020 17:33:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u3eM=6T=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jW1Ra-0004iu-VC
 for xen-devel@lists.xenproject.org; Tue, 05 May 2020 17:33:23 +0000
X-Inumbo-ID: 8414a992-8ef6-11ea-9ddd-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8414a992-8ef6-11ea-9ddd-12813bfff9fa;
 Tue, 05 May 2020 17:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588700002;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LuqC5+kPUQnfZRlEPz2H/N4Ap20VVvbFi1E/NmLAuSI=;
 b=XoEJ0gdjxlfCP75Nb6rm7re213FXsbrl04eySZ8/GJbFxiofofVbhoUb
 sGhePbGpUlXQbc+sgZSFBJ4m3P4WewBeO9TSmviEgWiBQwOxxGvl7azp4
 z1SPg9FwZjvBgZ1HQcvW3ecddzLpFoyUP1KoKEIuVhD9oag1yfcuEbgz9 8=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: j1NnrzWPlsyEvBcjuEECcy4HD08SlgiEiRgCgF470WATJhLzgTus2tta+lDMJgaDCrn1ladMn+
 Zsgaf0iHBWvYJM2dzwex1o1kYAu8qNsY+Re9UUBokKy0/eQGRLKPqRtI0OY0sFabHYduQL2S36
 84CuJNSK5l0Si4XX/G0nyU1LNf7ywFZ9O44T5NHvvGsJgPOSLg7Zu7wzginPoi/RUa4jJQhCcE
 3HQ/hcaoevbW649JdRCfIS6YuQmr0F0w+1VrRE0KFMNBdWd+tydQcEncmIRRatmgIgoFS9ZBoN
 9aE=
X-SBRS: 2.7
X-MesageID: 17494119
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,356,1583211600"; d="scan'208";a="17494119"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/svm: Clean up vmcbcleanbits_t handling
Date: Tue, 5 May 2020 18:32:50 +0100
Message-ID: <20200505173250.5916-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Rework the vmcbcleanbits_t definitons to use bool, drop 'fields' from the
namespace, position the comments in an unambiguous position, and include the
bit position.

In svm_vmexit_handler(), don't bother conditionally writing ~0 or 0 based on
hardware support.  The field was entirely unused and ignored on older
hardware (and we're already setting reserved cleanbits anyway).

In nsvm_vmcb_prepare4vmrun(), simplify the logic massivly by dropping the
vcleanbit_set() macro using a vmcbcleanbits_t local variable which only gets
filled in the case that clean bits were valid previously.  Fix up the style on
impacted lines.

No practical change in behaviour.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/svm/nestedsvm.c   | 45 +++++++++++++++++++-------------------
 xen/arch/x86/hvm/svm/svm.c         | 10 ++++-----
 xen/arch/x86/hvm/svm/svmdebug.c    |  2 +-
 xen/include/asm-x86/hvm/svm/vmcb.h | 45 ++++++++++++++------------------------
 4 files changed, 44 insertions(+), 58 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index bbd06e342e..998790af1b 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -343,7 +343,7 @@ static int nsvm_vcpu_hostrestore(struct vcpu *v, struct cpu_user_regs *regs)
     n1vmcb->exit_int_info.raw = 0;
 
     /* Cleanbits */
-    n1vmcb->cleanbits.bytes = 0;
+    n1vmcb->cleanbits.raw = 0;
 
     return 0;
 }
@@ -423,7 +423,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     struct nestedvcpu *nv = &vcpu_nestedhvm(v);
     struct nestedsvm *svm = &vcpu_nestedsvm(v);
     struct vmcb_struct *ns_vmcb, *n1vmcb, *n2vmcb;
-    bool_t vcleanbits_valid;
+    vmcbcleanbits_t clean = {};
     int rc;
     uint64_t cr0;
 
@@ -435,17 +435,13 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     ASSERT(n2vmcb != NULL);
 
     /* Check if virtual VMCB cleanbits are valid */
-    vcleanbits_valid = 1;
-    if ( svm->ns_ovvmcb_pa == INVALID_PADDR )
-        vcleanbits_valid = 0;
-    if (svm->ns_ovvmcb_pa != nv->nv_vvmcxaddr)
-        vcleanbits_valid = 0;
-
-#define vcleanbit_set(_name)	\
-    (vcleanbits_valid && ns_vmcb->cleanbits.fields._name)
+    if ( svm->ns_ovvmcb_pa != INVALID_PADDR &&
+         svm->ns_ovvmcb_pa != nv->nv_vvmcxaddr )
+        clean = ns_vmcb->cleanbits;
 
     /* Enable l2 guest intercepts */
-    if (!vcleanbit_set(intercepts)) {
+    if ( !clean.intercepts )
+    {
         svm->ns_cr_intercepts = ns_vmcb->_cr_intercepts;
         svm->ns_dr_intercepts = ns_vmcb->_dr_intercepts;
         svm->ns_exception_intercepts = ns_vmcb->_exception_intercepts;
@@ -492,7 +488,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     n2vmcb->_tsc_offset = n1vmcb->_tsc_offset + ns_vmcb->_tsc_offset;
 
     /* Nested IO permission bitmaps */
-    rc = nsvm_vmrun_permissionmap(v, vcleanbit_set(iopm));
+    rc = nsvm_vmrun_permissionmap(v, clean.iopm);
     if (rc)
         return rc;
 
@@ -502,7 +498,8 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     n2vmcb->tlb_control = ns_vmcb->tlb_control;
 
     /* Virtual Interrupts */
-    if (!vcleanbit_set(tpr)) {
+    if ( !clean.tpr )
+    {
         n2vmcb->_vintr = ns_vmcb->_vintr;
         n2vmcb->_vintr.fields.intr_masking = 1;
     }
@@ -520,9 +517,9 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     n2vmcb->event_inj = ns_vmcb->event_inj;
 
     /* LBR and other virtualization */
-    if (!vcleanbit_set(lbr)) {
+    if ( !clean.lbr )
         svm->ns_virt_ext = ns_vmcb->virt_ext;
-    }
+
     n2vmcb->virt_ext.bytes =
         n1vmcb->virt_ext.bytes | ns_vmcb->virt_ext.bytes;
 
@@ -533,7 +530,8 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
      */
 
     /* Segments */
-    if (!vcleanbit_set(seg)) {
+    if ( !clean.seg )
+    {
         n2vmcb->es = ns_vmcb->es;
         n2vmcb->cs = ns_vmcb->cs;
         n2vmcb->ss = ns_vmcb->ss;
@@ -541,7 +539,8 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
         /* CPL */
         n2vmcb->_cpl = ns_vmcb->_cpl;
     }
-    if (!vcleanbit_set(dt)) {
+    if ( !clean.dt )
+    {
         n2vmcb->gdtr = ns_vmcb->gdtr;
         n2vmcb->idtr = ns_vmcb->idtr;
     }
@@ -614,7 +613,8 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     }
 
     /* DRn */
-    if (!vcleanbit_set(dr)) {
+    if ( !clean.dr )
+    {
         n2vmcb->_dr7 = ns_vmcb->_dr7;
         n2vmcb->_dr6 = ns_vmcb->_dr6;
     }
@@ -637,11 +637,11 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
      */
 
     /* PAT */
-    if (!vcleanbit_set(np)) {
+    if ( !clean.np )
         n2vmcb->_g_pat = ns_vmcb->_g_pat;
-    }
 
-    if (!vcleanbit_set(lbr)) {
+    if ( !clean.lbr )
+    {
         /* Debug Control MSR */
         n2vmcb->_debugctlmsr = ns_vmcb->_debugctlmsr;
 
@@ -653,7 +653,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     }
 
     /* Cleanbits */
-    n2vmcb->cleanbits.bytes = 0;
+    n2vmcb->cleanbits.raw = 0;
 
     rc = svm_vmcb_isvalid(__func__, ns_vmcb, v, true);
     if (rc) {
@@ -673,7 +673,6 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     regs->rsp = ns_vmcb->rsp;
     regs->rflags = ns_vmcb->rflags;
 
-#undef vcleanbit_set
     return 0;
 }
 
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 5950e4d52b..aeebeaf873 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -345,7 +345,7 @@ static int svm_vmcb_restore(struct vcpu *v, struct hvm_hw_cpu *c)
     else
         vmcb->event_inj.raw = 0;
 
-    vmcb->cleanbits.bytes = 0;
+    vmcb->cleanbits.raw = 0;
     paging_update_paging_modes(v);
 
     return 0;
@@ -693,12 +693,12 @@ static void svm_set_segment_register(struct vcpu *v, enum x86_segment seg,
     case x86_seg_ds:
     case x86_seg_es:
     case x86_seg_ss: /* cpl */
-        vmcb->cleanbits.fields.seg = 0;
+        vmcb->cleanbits.seg = 0;
         break;
 
     case x86_seg_gdtr:
     case x86_seg_idtr:
-        vmcb->cleanbits.fields.dt = 0;
+        vmcb->cleanbits.dt = 0;
         break;
 
     case x86_seg_fs:
@@ -980,7 +980,7 @@ static void svm_ctxt_switch_to(struct vcpu *v)
     svm_restore_dr(v);
 
     svm_vmsave_pa(per_cpu(host_vmcb, cpu));
-    vmcb->cleanbits.bytes = 0;
+    vmcb->cleanbits.raw = 0;
     svm_tsc_ratio_load(v);
 
     if ( cpu_has_msr_tsc_aux )
@@ -2594,7 +2594,7 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
 
     hvm_maybe_deassert_evtchn_irq();
 
-    vmcb->cleanbits.bytes = cpu_has_svm_cleanbits ? ~0u : 0u;
+    vmcb->cleanbits.raw = ~0u;
 
     /* Event delivery caused this intercept? Queue for redelivery. */
     if ( unlikely(vmcb->exit_int_info.v) &&
diff --git a/xen/arch/x86/hvm/svm/svmdebug.c b/xen/arch/x86/hvm/svm/svmdebug.c
index 91f5d9400c..ba26b6a80b 100644
--- a/xen/arch/x86/hvm/svm/svmdebug.c
+++ b/xen/arch/x86/hvm/svm/svmdebug.c
@@ -83,7 +83,7 @@ void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
     printk("KernGSBase = 0x%016"PRIx64" PAT = 0x%016"PRIx64"\n",
            vmcb->kerngsbase, vmcb_get_g_pat(vmcb));
     printk("H_CR3 = 0x%016"PRIx64" CleanBits = %#x\n",
-           vmcb_get_h_cr3(vmcb), vmcb->cleanbits.bytes);
+           vmcb_get_h_cr3(vmcb), vmcb->cleanbits.raw);
 
     /* print out all the selectors */
     printk("       sel attr  limit   base\n");
diff --git a/xen/include/asm-x86/hvm/svm/vmcb.h b/xen/include/asm-x86/hvm/svm/vmcb.h
index c2e1972feb..4ed69d535c 100644
--- a/xen/include/asm-x86/hvm/svm/vmcb.h
+++ b/xen/include/asm-x86/hvm/svm/vmcb.h
@@ -384,34 +384,21 @@ typedef union
 
 typedef union
 {
-    uint32_t bytes;
-    struct
-    {
-        /* cr_intercepts, dr_intercepts, exception_intercepts,
-         * general{1,2}_intercepts, pause_filter_count, tsc_offset */
-        uint32_t intercepts: 1;
-        /* iopm_base_pa, msrpm_base_pa */
-        uint32_t iopm: 1;
-        /* guest_asid */
-        uint32_t asid: 1;
-        /* vintr */
-        uint32_t tpr: 1;
-        /* np_enable, h_cr3, g_pat */
-        uint32_t np: 1;
-        /* cr0, cr3, cr4, efer */
-        uint32_t cr: 1;
-        /* dr6, dr7 */
-        uint32_t dr: 1;
-        /* gdtr, idtr */
-        uint32_t dt: 1;
-        /* cs, ds, es, ss, cpl */
-        uint32_t seg: 1;
-        /* cr2 */
-        uint32_t cr2: 1;
-        /* debugctlmsr, last{branch,int}{to,from}ip */
-        uint32_t lbr: 1;
-        uint32_t resv: 21;
-    } fields;
+    struct {
+        bool intercepts:1; /* 0:  cr/dr/exception/general1/2_intercepts,
+                            *     pause_filter_count, tsc_offset */
+        bool iopm:1;       /* 1:  iopm_base_pa, msrpm_base_pa */
+        bool asid:1;       /* 2:  guest_asid */
+        bool tpr:1;        /* 3:  vintr */
+        bool np:1;         /* 4:  np_enable, h_cr3, g_pat */
+        bool cr:1;         /* 5:  cr0, cr3, cr4, efer */
+        bool dr:1;         /* 6:  dr6, dr7 */
+        bool dt:1;         /* 7:  gdtr, idtr */
+        bool seg:1;        /* 8:  cs, ds, es, ss, cpl */
+        bool cr2:1;        /* 9:  cr2 */
+        bool lbr:1;        /* 10: debugctlmsr, last{branch,int}{to,from}ip */
+    };
+    uint32_t raw;
 } vmcbcleanbits_t;
 
 #define IOPM_SIZE   (12 * 1024)
@@ -604,7 +591,7 @@ vmcb_set_ ## name(struct vmcb_struct *vmcb,       \
                   type value)                     \
 {                                                 \
     vmcb->_ ## name = value;                      \
-    vmcb->cleanbits.fields.cleanbit = 0;          \
+    vmcb->cleanbits.cleanbit = false;             \
 }                                                 \
 static inline type                                \
 vmcb_get_ ## name(const struct vmcb_struct *vmcb) \
-- 
2.11.0


