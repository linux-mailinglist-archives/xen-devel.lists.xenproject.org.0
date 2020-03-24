Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A14190B50
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 11:42:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGgxo-0003KY-VW; Tue, 24 Mar 2020 10:39:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Uq2/=5J=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1jGgxn-0003KO-Ca
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 10:39:15 +0000
X-Inumbo-ID: b2339f24-6dbb-11ea-83be-12813bfff9fa
Received: from spam1.hygon.cn (unknown [110.188.70.11])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b2339f24-6dbb-11ea-83be-12813bfff9fa;
 Tue, 24 Mar 2020 10:39:12 +0000 (UTC)
Received: from MK-DB.hygon.cn ([172.23.18.60])
 by spam1.hygon.cn with ESMTP id 02OAcPqe007139;
 Tue, 24 Mar 2020 18:38:25 +0800 (GMT-8)
 (envelope-from puwen@hygon.cn)
Received: from cncheex01.Hygon.cn ([172.23.18.10])
 by MK-DB.hygon.cn with ESMTP id 02OAcIIJ083274;
 Tue, 24 Mar 2020 18:38:19 +0800 (GMT-8)
 (envelope-from puwen@hygon.cn)
Received: from ubuntu1604-2.higon.com (172.23.18.44) by cncheex01.Hygon.cn
 (172.23.18.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3; Tue, 24 Mar
 2020 18:38:00 +0800
From: Pu Wen <puwen@hygon.cn>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 24 Mar 2020 18:37:26 +0800
Message-ID: <20200324103726.3406-1-puwen@hygon.cn>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.23.18.44]
X-ClientProxiedBy: cncheex02.Hygon.cn (172.23.18.12) To cncheex01.Hygon.cn
 (172.23.18.10)
X-MAIL: spam1.hygon.cn 02OAcPqe007139
X-DNSRBL: 
Subject: [Xen-devel] [PATCH v2] SVM: Add union intstat_t for offset 68h in
 vmcb struct
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
Cc: Pu Wen <puwen@hygon.cn>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

According to chapter "Appendix B Layout of VMCB" in the new version
(v3.32) AMD64 APM[1], bit 1 of the VMCB offset 68h is defined as
GUEST_INTERRUPT_MASK.

In current xen codes, it use whole u64 interrupt_shadow to setup
interrupt shadow, which will misuse other bit in VMCB offset 68h
as part of interrupt_shadow.

Add union intstat_t for VMCB offset 68h and fix codes to only use
bit 0 as intr_shadow according to the new APM description.

Reference:
[1] https://www.amd.com/system/files/TechDocs/24593.pdf

Signed-off-by: Pu Wen <puwen@hygon.cn>
---
v1->v2:
  - Copy the whole int_stat in nsvm_vmcb_prepare4vmrun() and
    nsvm_vmcb_prepare4vmexit().
  - Dump all 64 bits of int_stat in svm_vmcb_dump().

 xen/arch/x86/hvm/svm/nestedsvm.c   |  8 ++++----
 xen/arch/x86/hvm/svm/svm.c         |  8 ++++----
 xen/arch/x86/hvm/svm/svmdebug.c    |  4 ++--
 xen/include/asm-x86/hvm/svm/vmcb.h | 13 ++++++++++++-
 4 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 3bd2a119d3..bbd06e342e 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -507,8 +507,8 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
         n2vmcb->_vintr.fields.intr_masking = 1;
     }
 
-    /* Shadow Mode */
-    n2vmcb->interrupt_shadow = ns_vmcb->interrupt_shadow;
+    /* Interrupt state */
+    n2vmcb->int_stat = ns_vmcb->int_stat;
 
     /* Exit codes */
     n2vmcb->exitcode = ns_vmcb->exitcode;
@@ -1057,8 +1057,8 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
     if (!(svm->ns_hostflags.fields.vintrmask))
         ns_vmcb->_vintr.fields.intr_masking = 0;
 
-    /* Shadow mode */
-    ns_vmcb->interrupt_shadow = n2vmcb->interrupt_shadow;
+    /* Interrupt state */
+    ns_vmcb->int_stat = n2vmcb->int_stat;
 
     /* Exit codes */
     ns_vmcb->exitcode = n2vmcb->exitcode;
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 32d8d847f2..888f504a94 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -116,7 +116,7 @@ void __update_guest_eip(struct cpu_user_regs *regs, unsigned int inst_len)
     regs->rip += inst_len;
     regs->eflags &= ~X86_EFLAGS_RF;
 
-    curr->arch.hvm.svm.vmcb->interrupt_shadow = 0;
+    curr->arch.hvm.svm.vmcb->int_stat.intr_shadow = 0;
 
     if ( regs->eflags & X86_EFLAGS_TF )
         hvm_inject_hw_exception(TRAP_debug, X86_EVENT_NO_EC);
@@ -432,7 +432,7 @@ static unsigned int svm_get_interrupt_shadow(struct vcpu *v)
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
     unsigned int intr_shadow = 0;
 
-    if ( vmcb->interrupt_shadow )
+    if ( vmcb->int_stat.intr_shadow )
         intr_shadow |= HVM_INTR_SHADOW_MOV_SS | HVM_INTR_SHADOW_STI;
 
     if ( vmcb_get_general1_intercepts(vmcb) & GENERAL1_INTERCEPT_IRET )
@@ -446,7 +446,7 @@ static void svm_set_interrupt_shadow(struct vcpu *v, unsigned int intr_shadow)
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
     u32 general1_intercepts = vmcb_get_general1_intercepts(vmcb);
 
-    vmcb->interrupt_shadow =
+    vmcb->int_stat.intr_shadow =
         !!(intr_shadow & (HVM_INTR_SHADOW_MOV_SS|HVM_INTR_SHADOW_STI));
 
     general1_intercepts &= ~GENERAL1_INTERCEPT_IRET;
@@ -2945,7 +2945,7 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
          * retired.
          */
         general1_intercepts &= ~GENERAL1_INTERCEPT_IRET;
-        vmcb->interrupt_shadow = 1;
+        vmcb->int_stat.intr_shadow = 1;
 
         vmcb_set_general1_intercepts(vmcb, general1_intercepts);
         break;
diff --git a/xen/arch/x86/hvm/svm/svmdebug.c b/xen/arch/x86/hvm/svm/svmdebug.c
index 366a003f21..5aa9d410ba 100644
--- a/xen/arch/x86/hvm/svm/svmdebug.c
+++ b/xen/arch/x86/hvm/svm/svmdebug.c
@@ -51,9 +51,9 @@ void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
     printk("iopm_base_pa = %#"PRIx64" msrpm_base_pa = %#"PRIx64" tsc_offset = %#"PRIx64"\n",
            vmcb_get_iopm_base_pa(vmcb), vmcb_get_msrpm_base_pa(vmcb),
            vmcb_get_tsc_offset(vmcb));
-    printk("tlb_control = %#x vintr = %#"PRIx64" interrupt_shadow = %#"PRIx64"\n",
+    printk("tlb_control = %#x vintr = %#"PRIx64" int_stat = %#"PRIx64"\n",
            vmcb->tlb_control, vmcb_get_vintr(vmcb).bytes,
-           vmcb->interrupt_shadow);
+           vmcb->int_stat.raw);
     printk("event_inj %016"PRIx64", valid? %d, ec? %d, type %u, vector %#x\n",
            vmcb->event_inj.raw, vmcb->event_inj.v,
            vmcb->event_inj.ev, vmcb->event_inj.type,
diff --git a/xen/include/asm-x86/hvm/svm/vmcb.h b/xen/include/asm-x86/hvm/svm/vmcb.h
index b9e389d481..d8a3285752 100644
--- a/xen/include/asm-x86/hvm/svm/vmcb.h
+++ b/xen/include/asm-x86/hvm/svm/vmcb.h
@@ -316,6 +316,17 @@ typedef union
     uint64_t raw;
 } intinfo_t;
 
+typedef union
+{
+    struct
+    {
+        u64 intr_shadow:    1;
+        u64 guest_intr_mask:1;
+        u64 resvd:          62;
+    };
+    uint64_t raw;
+} intstat_t;
+
 typedef union
 {
     u64 bytes;
@@ -414,7 +425,7 @@ struct vmcb_struct {
     u8  tlb_control;            /* offset 0x5C */
     u8  res07[3];
     vintr_t _vintr;             /* offset 0x60 - cleanbit 3 */
-    u64 interrupt_shadow;       /* offset 0x68 */
+    intstat_t int_stat;         /* offset 0x68 */
     u64 exitcode;               /* offset 0x70 */
     union {
         struct {
-- 
2.23.0


