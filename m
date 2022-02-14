Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA85B4B5105
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:05:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271641.466173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb26-0008Kt-LS; Mon, 14 Feb 2022 13:04:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271641.466173; Mon, 14 Feb 2022 13:04:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb26-0008IN-Hv; Mon, 14 Feb 2022 13:04:46 +0000
Received: by outflank-mailman (input) for mailman id 271641;
 Mon, 14 Feb 2022 13:04:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb25-0008IH-3o
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:04:45 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab3fc353-8d96-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:04:41 +0100 (CET)
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
X-Inumbo-ID: ab3fc353-8d96-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843881;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=9SBKCVUVoHZcNlwGQnO2XD67JHVChjedlbYxSb50LOk=;
  b=eBPHaNCZ6xkpzoqdSSp9ZWbW/RYWnI2qk3xncD9FmzoYsU8Xq2SyiO11
   QMfC6EQVum9eiK3uHEUXsYFHB3fq52/S+hD9MJAQKp24/SHGhSszzWhtX
   S4kv5/edDPmIuM6yFGp46QS3znWMR6AZMQl1nivEYfmjWUGY1orSIpo42
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: AgAiKrOfsWqmF2MNEfQDzVivIVdmtYdBCm7OfPoGIiWZxQaBsmyXuX8alQ+NOI5jMf6y9mJ9e8
 hj4BbNKMC7YR1fKmr4PuyvKmsJZ0AYtayqdDawFugkoMJDoJjB8Gjbo8zvji+iAL04OaZwmMWn
 b2BuuAJ4MZOL391mKq8zYZFi1Ja7B9f3/00AVsJOvVD7MuLvZzJb+3/0faVX/I99bjVSL36HoR
 C8eAlx+5hRGAdux6FBfxdsbF4ZUfm7wqTKJBEb3A1/8u8Asarxr8pE/h7vqWi6P6QX3XVRKGuc
 VJ6QKOpijtShA65p5e5a77Wk
X-SBRS: 5.1
X-MesageID: 64050477
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:80eQFqsR2Hxyzl3t7rds+EZjAefnVEhZMUV32f8akzHdYApBsoF/q
 tZmKWqHOPqPMWGkfY9zb9m+9koBsJLUzII2Ggpu/CFhES8W+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYy2IThWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplk7++TQwXF/z2gqcNQxN0OSQ9BYgX0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6AO
 5JEMWYwM3wsZTVTAVolOqhkm9yvnyL1cWN+mFzIqvQotj27IAtZj+G2bYu9lsaxbdVYmAOUq
 3zL+0z9AwoGL5qPxDyd6HWui+TT2yThV+ov+KaQr6AwxgfJnypKVUNQBQDTTeSFZlCWffFRL
 0cq03sUt+si5EaHZNy+ZzjpiSvR1vIDYOZ4H+o/4QCL76Pb5QeFG2QJJgJ8hMwaWNweHmJzi
 ALQ9z/9LXk26eDOFyrBnluBhW7qYUAowXk+iTjopOfvy/3qu8kNgx3GVb6P+4bl34SuSVkcL
 91nxRXSZon/b+ZWjc1XHnid2lpAQ6QlqSZvuG3qspqNtF8RWWJcT9XABaLnxfhBNp2FaVKKo
 WIJncOThMhXU83Ry3zdHbhVRerzjxpgDNE7qQQxd6TNChz3oyLzFWyuyG0WyLhV3jYsJmayP
 R67VfJ5755PJnq6BZKbkKrqY/nGOZPITIy/PtiNN4ImSsEoKGevoXE/DWbNjjuFuBV9zskC1
 WKzLJ/E4YAyUv88klJbho41jNcW+8zJ7T2PFM6rl0z9idJzphe9EN84DbdHVchhhIvsnekf2
 4032xKix0oNXevgTDPQ9IJPf1kGIWJiXcL9qtBNd/7FKQ1jQTlzB/jUyLInWopkg6UKybuYo
 iDjAhdVmAjlmHnKCQSWcXQ/Ornhaoly8CAgNis2MFf2h3V6OdSz7L0SfoccdKU88LAx1uZ9S
 vQIIp3SAvlGRjnd1S4aaJ3x8N5reBix3FrcNCu5ejkvOZVnQlWRqNPjewLu8ggIDza26pRi8
 +HxiFuDTMNaFQp4DcvQZPa+9H+LvCAQyLBoQk/FAthPY0GwooJkHDP8060sKMYWJBSdmjbDj
 1SKAQ0VrPXmqpMu9IWbnriNqoqkHrcsHkdeGGWHv7+6OTODozimyI5EFu2JYSrcRCX//6D7P
 bdZyPT1MfsmmldWstUjT+Y3nPxmv9a/9aVHyglEHWnQawX5A7xtFXCKwM1Tu/Af3bReowa3B
 hqC99Qy1W9l4y85/Ir9/DYYU9k=
IronPort-HdrOrdr: A9a23:crUzMKxrAi9bksQpKGTXKrPwLr1zdoMgy1knxilNoRw8SKKlfq
 GV7Y0mPHDP6Ar5NEtNpTnEAtjkfZq+z+8S3WByB8bAYOCOggLBR+sO0WKh+UyFJ8SXzJ876U
 4KSclD4bPLYmSS9fyKgjWFLw==
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64050477"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 32/70] x86/hvm: CFI hardening for hvm_funcs
Date: Mon, 14 Feb 2022 12:50:49 +0000
Message-ID: <20220214125127.17985-33-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Control Flow Integrity schemes use toolchain and optionally hardware support
to help protect against call/jump/return oriented programming attacks.

Use cf_check to annotate function pointer targets for the toolchain.

In svm.c, make a few rearrangements.  svm_update_guest_cr() has no external
callers so can become static, but needs moving along with svm_fpu_enter() to
avoid a forward declaration.  Move svm_fpu_leave() too, to match.  Also move
svm_update_guest_efer() to drop its forward declaration.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v2:
 * Move svm_fpu_leave() too.
---
 xen/arch/x86/hvm/svm/nestedsvm.c             |  22 +-
 xen/arch/x86/hvm/svm/svm.c                   | 390 ++++++++++++++-------------
 xen/arch/x86/hvm/vmx/intr.c                  |   2 +-
 xen/arch/x86/hvm/vmx/vmcs.c                  |   8 +-
 xen/arch/x86/hvm/vmx/vmx.c                   | 143 +++++-----
 xen/arch/x86/hvm/vmx/vvmx.c                  |  16 +-
 xen/arch/x86/include/asm/hvm/svm/nestedsvm.h |  18 +-
 xen/arch/x86/include/asm/hvm/svm/svm.h       |   1 -
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h      |   8 +-
 xen/arch/x86/include/asm/hvm/vmx/vmx.h       |   2 +-
 xen/arch/x86/include/asm/hvm/vmx/vvmx.h      |  18 +-
 11 files changed, 320 insertions(+), 308 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index abc178d8d482..9f5f35f16aff 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -80,7 +80,7 @@ int nestedsvm_vmcb_map(struct vcpu *v, uint64_t vmcbaddr)
 }
 
 /* Interface methods */
-int nsvm_vcpu_initialise(struct vcpu *v)
+int cf_check nsvm_vcpu_initialise(struct vcpu *v)
 {
     void *msrpm;
     struct nestedvcpu *nv = &vcpu_nestedhvm(v);
@@ -110,7 +110,7 @@ int nsvm_vcpu_initialise(struct vcpu *v)
     return -ENOMEM;
 }
 
-void nsvm_vcpu_destroy(struct vcpu *v)
+void cf_check nsvm_vcpu_destroy(struct vcpu *v)
 {
     struct nestedvcpu *nv = &vcpu_nestedhvm(v);
     struct nestedsvm *svm = &vcpu_nestedsvm(v);
@@ -150,7 +150,7 @@ void nsvm_vcpu_destroy(struct vcpu *v)
     svm->ns_iomap = NULL;
 }
 
-int nsvm_vcpu_reset(struct vcpu *v)
+int cf_check nsvm_vcpu_reset(struct vcpu *v)
 {
     struct nestedsvm *svm = &vcpu_nestedsvm(v);
 
@@ -855,8 +855,8 @@ nsvm_vcpu_vmexit_inject(struct vcpu *v, struct cpu_user_regs *regs,
     return 0;
 }
 
-int
-nsvm_vcpu_vmexit_event(struct vcpu *v, const struct x86_event *trap)
+int cf_check nsvm_vcpu_vmexit_event(
+    struct vcpu *v, const struct x86_event *trap)
 {
     ASSERT(vcpu_nestedhvm(v).nv_vvmcx != NULL);
 
@@ -865,7 +865,7 @@ nsvm_vcpu_vmexit_event(struct vcpu *v, const struct x86_event *trap)
     return NESTEDHVM_VMEXIT_DONE;
 }
 
-uint64_t nsvm_vcpu_hostcr3(struct vcpu *v)
+uint64_t cf_check nsvm_vcpu_hostcr3(struct vcpu *v)
 {
     return vcpu_nestedsvm(v).ns_vmcb_hostcr3;
 }
@@ -1030,8 +1030,7 @@ nsvm_vmcb_guest_intercepts_exitcode(struct vcpu *v,
     return 1;
 }
 
-bool_t
-nsvm_vmcb_guest_intercepts_event(
+bool cf_check nsvm_vmcb_guest_intercepts_event(
     struct vcpu *v, unsigned int vector, int errcode)
 {
     return nsvm_vmcb_guest_intercepts_exitcode(v,
@@ -1206,8 +1205,7 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
     return 0;
 }
 
-bool_t
-nsvm_vmcb_hap_enabled(struct vcpu *v)
+bool cf_check nsvm_vmcb_hap_enabled(struct vcpu *v)
 {
     return vcpu_nestedsvm(v).ns_hap_enabled;
 }
@@ -1216,7 +1214,7 @@ nsvm_vmcb_hap_enabled(struct vcpu *v)
  * walk is successful, the translated value is returned in
  * L1_gpa. The result value tells what to do next.
  */
-int nsvm_hap_walk_L1_p2m(
+int cf_check nsvm_hap_walk_L1_p2m(
     struct vcpu *v, paddr_t L2_gpa, paddr_t *L1_gpa, unsigned int *page_order,
     uint8_t *p2m_acc, struct npfec npfec)
 {
@@ -1241,7 +1239,7 @@ int nsvm_hap_walk_L1_p2m(
     return NESTEDHVM_PAGEFAULT_DONE;
 }
 
-enum hvm_intblk nsvm_intr_blocked(struct vcpu *v)
+enum hvm_intblk cf_check nsvm_intr_blocked(struct vcpu *v)
 {
     struct nestedsvm *svm = &vcpu_nestedsvm(v);
     struct nestedvcpu *nv = &vcpu_nestedhvm(v);
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index c4ce3f75ab74..de6166241bf1 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -67,8 +67,6 @@ void noreturn svm_asm_do_resume(void);
 
 u32 svm_feature_flags;
 
-static void svm_update_guest_efer(struct vcpu *);
-
 static struct hvm_function_table svm_function_table;
 
 /*
@@ -122,11 +120,166 @@ void __update_guest_eip(struct cpu_user_regs *regs, unsigned int inst_len)
         hvm_inject_hw_exception(TRAP_debug, X86_EVENT_NO_EC);
 }
 
-static void svm_cpu_down(void)
+static void cf_check svm_cpu_down(void)
 {
     write_efer(read_efer() & ~EFER_SVME);
 }
 
+static void svm_fpu_enter(struct vcpu *v)
+{
+    struct vmcb_struct *n1vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
+
+    vcpu_restore_fpu_lazy(v);
+    vmcb_set_exception_intercepts(
+        n1vmcb,
+        vmcb_get_exception_intercepts(n1vmcb) & ~(1U << TRAP_no_device));
+}
+
+static void cf_check svm_fpu_leave(struct vcpu *v)
+{
+    struct vmcb_struct *n1vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
+
+    ASSERT(!v->fpu_dirtied);
+    ASSERT(read_cr0() & X86_CR0_TS);
+
+    /*
+     * If the guest does not have TS enabled then we must cause and handle an
+     * exception on first use of the FPU. If the guest *does* have TS enabled
+     * then this is not necessary: no FPU activity can occur until the guest
+     * clears CR0.TS, and we will initialise the FPU when that happens.
+     */
+    if ( !(v->arch.hvm.guest_cr[0] & X86_CR0_TS) )
+    {
+        vmcb_set_exception_intercepts(
+            n1vmcb,
+            vmcb_get_exception_intercepts(n1vmcb) | (1U << TRAP_no_device));
+        vmcb_set_cr0(n1vmcb, vmcb_get_cr0(n1vmcb) | X86_CR0_TS);
+    }
+}
+
+static void cf_check svm_update_guest_cr(
+    struct vcpu *v, unsigned int cr, unsigned int flags)
+{
+    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    uint64_t value;
+
+    switch ( cr )
+    {
+    case 0:
+    {
+        unsigned long hw_cr0_mask = 0;
+
+        if ( !(v->arch.hvm.guest_cr[0] & X86_CR0_TS) )
+        {
+            if ( v != current )
+            {
+                if ( !v->arch.fully_eager_fpu )
+                    hw_cr0_mask |= X86_CR0_TS;
+            }
+            else if ( vmcb_get_cr0(vmcb) & X86_CR0_TS )
+                svm_fpu_enter(v);
+        }
+
+        if ( paging_mode_hap(v->domain) )
+        {
+            uint32_t intercepts = vmcb_get_cr_intercepts(vmcb);
+
+            /* Trap CR3 updates if CR3 memory events are enabled. */
+            if ( v->domain->arch.monitor.write_ctrlreg_enabled &
+                 monitor_ctrlreg_bitmask(VM_EVENT_X86_CR3) )
+               vmcb_set_cr_intercepts(vmcb, intercepts | CR_INTERCEPT_CR3_WRITE);
+        }
+
+        value = v->arch.hvm.guest_cr[0] | hw_cr0_mask;
+        if ( !paging_mode_hap(v->domain) )
+            value |= X86_CR0_PG | X86_CR0_WP;
+        vmcb_set_cr0(vmcb, value);
+        break;
+    }
+    case 2:
+        vmcb_set_cr2(vmcb, v->arch.hvm.guest_cr[2]);
+        break;
+    case 3:
+        vmcb_set_cr3(vmcb, v->arch.hvm.hw_cr[3]);
+        if ( !nestedhvm_enabled(v->domain) )
+        {
+            if ( !(flags & HVM_UPDATE_GUEST_CR3_NOFLUSH) )
+                hvm_asid_flush_vcpu(v);
+        }
+        else if ( nestedhvm_vmswitch_in_progress(v) )
+            ; /* CR3 switches during VMRUN/VMEXIT do not flush the TLB. */
+        else if ( !(flags & HVM_UPDATE_GUEST_CR3_NOFLUSH) )
+            hvm_asid_flush_vcpu_asid(
+                nestedhvm_vcpu_in_guestmode(v)
+                ? &vcpu_nestedhvm(v).nv_n2asid : &v->arch.hvm.n1asid);
+        break;
+    case 4:
+        value = HVM_CR4_HOST_MASK;
+        if ( paging_mode_hap(v->domain) )
+            value &= ~X86_CR4_PAE;
+        value |= v->arch.hvm.guest_cr[4];
+
+        if ( !hvm_paging_enabled(v) )
+        {
+            /*
+             * When the guest thinks paging is disabled, Xen may need to hide
+             * the effects of shadow paging, as hardware runs with the host
+             * paging settings, rather than the guests settings.
+             *
+             * Without CR0.PG, all memory accesses are user mode, so
+             * _PAGE_USER must be set in the shadow pagetables for guest
+             * userspace to function.  This in turn trips up guest supervisor
+             * mode if SMEP/SMAP are left active in context.  They wouldn't
+             * have any effect if paging was actually disabled, so hide them
+             * behind the back of the guest.
+             */
+            value &= ~(X86_CR4_SMEP | X86_CR4_SMAP);
+        }
+
+        vmcb_set_cr4(vmcb, value);
+        break;
+    default:
+        BUG();
+    }
+}
+
+static void cf_check svm_update_guest_efer(struct vcpu *v)
+{
+    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    unsigned long guest_efer = v->arch.hvm.guest_efer,
+        xen_efer = read_efer();
+
+    if ( paging_mode_shadow(v->domain) )
+    {
+        /* EFER.NX is a Xen-owned bit and is not under guest control. */
+        guest_efer &= ~EFER_NXE;
+        guest_efer |= xen_efer & EFER_NXE;
+
+        /*
+         * CR0.PG is a Xen-owned bit, and remains set even when the guest has
+         * logically disabled paging.
+         *
+         * LMA was calculated using the guest CR0.PG setting, but LME needs
+         * clearing to avoid interacting with Xen's CR0.PG setting.  As writes
+         * to CR0 are intercepted, it is safe to leave LME clear at this
+         * point, and fix up both LME and LMA when CR0.PG is set.
+         */
+        if ( !(guest_efer & EFER_LMA) )
+            guest_efer &= ~EFER_LME;
+    }
+
+    /* SVME must remain set in non-root mode. */
+    guest_efer |= EFER_SVME;
+
+    vmcb_set_efer(vmcb, guest_efer);
+
+    ASSERT(nestedhvm_enabled(v->domain) ||
+           !(v->arch.hvm.guest_efer & EFER_SVME));
+
+    if ( nestedhvm_enabled(v->domain) )
+        svm_nested_features_on_efer_update(v);
+}
+
 unsigned long *
 svm_msrbit(unsigned long *msr_bitmap, uint32_t msr)
 {
@@ -165,7 +318,7 @@ void svm_intercept_msr(struct vcpu *v, uint32_t msr, int flags)
         __clear_bit(msr * 2 + 1, msr_bit);
 }
 
-static void svm_enable_msr_interception(struct domain *d, uint32_t msr)
+static void cf_check svm_enable_msr_interception(struct domain *d, uint32_t msr)
 {
     struct vcpu *v;
 
@@ -377,13 +530,13 @@ static void svm_load_cpu_state(struct vcpu *v, struct hvm_hw_cpu *data)
     svm_update_guest_efer(v);
 }
 
-static void svm_save_vmcb_ctxt(struct vcpu *v, struct hvm_hw_cpu *ctxt)
+static void cf_check svm_save_vmcb_ctxt(struct vcpu *v, struct hvm_hw_cpu *ctxt)
 {
     svm_save_cpu_state(v, ctxt);
     svm_vmcb_save(v, ctxt);
 }
 
-static int svm_load_vmcb_ctxt(struct vcpu *v, struct hvm_hw_cpu *ctxt)
+static int cf_check svm_load_vmcb_ctxt(struct vcpu *v, struct hvm_hw_cpu *ctxt)
 {
     svm_load_cpu_state(v, ctxt);
     if ( svm_vmcb_restore(v, ctxt) )
@@ -396,39 +549,7 @@ static int svm_load_vmcb_ctxt(struct vcpu *v, struct hvm_hw_cpu *ctxt)
     return 0;
 }
 
-static void svm_fpu_enter(struct vcpu *v)
-{
-    struct vmcb_struct *n1vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
-
-    vcpu_restore_fpu_lazy(v);
-    vmcb_set_exception_intercepts(
-        n1vmcb,
-        vmcb_get_exception_intercepts(n1vmcb) & ~(1U << TRAP_no_device));
-}
-
-static void svm_fpu_leave(struct vcpu *v)
-{
-    struct vmcb_struct *n1vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
-
-    ASSERT(!v->fpu_dirtied);
-    ASSERT(read_cr0() & X86_CR0_TS);
-
-    /*
-     * If the guest does not have TS enabled then we must cause and handle an
-     * exception on first use of the FPU. If the guest *does* have TS enabled
-     * then this is not necessary: no FPU activity can occur until the guest
-     * clears CR0.TS, and we will initialise the FPU when that happens.
-     */
-    if ( !(v->arch.hvm.guest_cr[0] & X86_CR0_TS) )
-    {
-        vmcb_set_exception_intercepts(
-            n1vmcb,
-            vmcb_get_exception_intercepts(n1vmcb) | (1U << TRAP_no_device));
-        vmcb_set_cr0(n1vmcb, vmcb_get_cr0(n1vmcb) | X86_CR0_TS);
-    }
-}
-
-static unsigned int svm_get_interrupt_shadow(struct vcpu *v)
+static unsigned cf_check int svm_get_interrupt_shadow(struct vcpu *v)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
     unsigned int intr_shadow = 0;
@@ -442,7 +563,8 @@ static unsigned int svm_get_interrupt_shadow(struct vcpu *v)
     return intr_shadow;
 }
 
-static void svm_set_interrupt_shadow(struct vcpu *v, unsigned int intr_shadow)
+static void cf_check svm_set_interrupt_shadow(
+    struct vcpu *v, unsigned int intr_shadow)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
     u32 general1_intercepts = vmcb_get_general1_intercepts(vmcb);
@@ -456,7 +578,7 @@ static void svm_set_interrupt_shadow(struct vcpu *v, unsigned int intr_shadow)
     vmcb_set_general1_intercepts(vmcb, general1_intercepts);
 }
 
-static int svm_guest_x86_mode(struct vcpu *v)
+static int cf_check svm_guest_x86_mode(struct vcpu *v)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
 
@@ -469,129 +591,7 @@ static int svm_guest_x86_mode(struct vcpu *v)
     return likely(vmcb->cs.db) ? 4 : 2;
 }
 
-void svm_update_guest_cr(struct vcpu *v, unsigned int cr, unsigned int flags)
-{
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
-    uint64_t value;
-
-    switch ( cr )
-    {
-    case 0:
-    {
-        unsigned long hw_cr0_mask = 0;
-
-        if ( !(v->arch.hvm.guest_cr[0] & X86_CR0_TS) )
-        {
-            if ( v != current )
-            {
-                if ( !v->arch.fully_eager_fpu )
-                    hw_cr0_mask |= X86_CR0_TS;
-            }
-            else if ( vmcb_get_cr0(vmcb) & X86_CR0_TS )
-                svm_fpu_enter(v);
-        }
-
-        if ( paging_mode_hap(v->domain) )
-        {
-            uint32_t intercepts = vmcb_get_cr_intercepts(vmcb);
-
-            /* Trap CR3 updates if CR3 memory events are enabled. */
-            if ( v->domain->arch.monitor.write_ctrlreg_enabled &
-                 monitor_ctrlreg_bitmask(VM_EVENT_X86_CR3) )
-               vmcb_set_cr_intercepts(vmcb, intercepts | CR_INTERCEPT_CR3_WRITE);
-        }
-
-        value = v->arch.hvm.guest_cr[0] | hw_cr0_mask;
-        if ( !paging_mode_hap(v->domain) )
-            value |= X86_CR0_PG | X86_CR0_WP;
-        vmcb_set_cr0(vmcb, value);
-        break;
-    }
-    case 2:
-        vmcb_set_cr2(vmcb, v->arch.hvm.guest_cr[2]);
-        break;
-    case 3:
-        vmcb_set_cr3(vmcb, v->arch.hvm.hw_cr[3]);
-        if ( !nestedhvm_enabled(v->domain) )
-        {
-            if ( !(flags & HVM_UPDATE_GUEST_CR3_NOFLUSH) )
-                hvm_asid_flush_vcpu(v);
-        }
-        else if ( nestedhvm_vmswitch_in_progress(v) )
-            ; /* CR3 switches during VMRUN/VMEXIT do not flush the TLB. */
-        else if ( !(flags & HVM_UPDATE_GUEST_CR3_NOFLUSH) )
-            hvm_asid_flush_vcpu_asid(
-                nestedhvm_vcpu_in_guestmode(v)
-                ? &vcpu_nestedhvm(v).nv_n2asid : &v->arch.hvm.n1asid);
-        break;
-    case 4:
-        value = HVM_CR4_HOST_MASK;
-        if ( paging_mode_hap(v->domain) )
-            value &= ~X86_CR4_PAE;
-        value |= v->arch.hvm.guest_cr[4];
-
-        if ( !hvm_paging_enabled(v) )
-        {
-            /*
-             * When the guest thinks paging is disabled, Xen may need to hide
-             * the effects of shadow paging, as hardware runs with the host
-             * paging settings, rather than the guests settings.
-             *
-             * Without CR0.PG, all memory accesses are user mode, so
-             * _PAGE_USER must be set in the shadow pagetables for guest
-             * userspace to function.  This in turn trips up guest supervisor
-             * mode if SMEP/SMAP are left active in context.  They wouldn't
-             * have any effect if paging was actually disabled, so hide them
-             * behind the back of the guest.
-             */
-            value &= ~(X86_CR4_SMEP | X86_CR4_SMAP);
-        }
-
-        vmcb_set_cr4(vmcb, value);
-        break;
-    default:
-        BUG();
-    }
-}
-
-static void svm_update_guest_efer(struct vcpu *v)
-{
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
-    unsigned long guest_efer = v->arch.hvm.guest_efer,
-        xen_efer = read_efer();
-
-    if ( paging_mode_shadow(v->domain) )
-    {
-        /* EFER.NX is a Xen-owned bit and is not under guest control. */
-        guest_efer &= ~EFER_NXE;
-        guest_efer |= xen_efer & EFER_NXE;
-
-        /*
-         * CR0.PG is a Xen-owned bit, and remains set even when the guest has
-         * logically disabled paging.
-         *
-         * LMA was calculated using the guest CR0.PG setting, but LME needs
-         * clearing to avoid interacting with Xen's CR0.PG setting.  As writes
-         * to CR0 are intercepted, it is safe to leave LME clear at this
-         * point, and fix up both LME and LMA when CR0.PG is set.
-         */
-        if ( !(guest_efer & EFER_LMA) )
-            guest_efer &= ~EFER_LME;
-    }
-
-    /* SVME must remain set in non-root mode. */
-    guest_efer |= EFER_SVME;
-
-    vmcb_set_efer(vmcb, guest_efer);
-
-    ASSERT(nestedhvm_enabled(v->domain) ||
-           !(v->arch.hvm.guest_efer & EFER_SVME));
-
-    if ( nestedhvm_enabled(v->domain) )
-        svm_nested_features_on_efer_update(v);
-}
-
-static void svm_cpuid_policy_changed(struct vcpu *v)
+static void cf_check svm_cpuid_policy_changed(struct vcpu *v)
 {
     struct svm_vcpu *svm = &v->arch.hvm.svm;
     struct vmcb_struct *vmcb = svm->vmcb;
@@ -636,13 +636,13 @@ void svm_sync_vmcb(struct vcpu *v, enum vmcb_sync_state new_state)
     }
 }
 
-static unsigned int svm_get_cpl(struct vcpu *v)
+static unsigned int cf_check svm_get_cpl(struct vcpu *v)
 {
     return vmcb_get_cpl(v->arch.hvm.svm.vmcb);
 }
 
-static void svm_get_segment_register(struct vcpu *v, enum x86_segment seg,
-                                     struct segment_register *reg)
+static void cf_check svm_get_segment_register(
+    struct vcpu *v, enum x86_segment seg, struct segment_register *reg)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
 
@@ -686,8 +686,8 @@ static void svm_get_segment_register(struct vcpu *v, enum x86_segment seg,
     }
 }
 
-static void svm_set_segment_register(struct vcpu *v, enum x86_segment seg,
-                                     struct segment_register *reg)
+static void cf_check svm_set_segment_register(
+    struct vcpu *v, enum x86_segment seg, struct segment_register *reg)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
 
@@ -756,12 +756,12 @@ static void svm_set_segment_register(struct vcpu *v, enum x86_segment seg,
     }
 }
 
-static unsigned long svm_get_shadow_gs_base(struct vcpu *v)
+static unsigned long cf_check svm_get_shadow_gs_base(struct vcpu *v)
 {
     return v->arch.hvm.svm.vmcb->kerngsbase;
 }
 
-static int svm_set_guest_pat(struct vcpu *v, u64 gpat)
+static int cf_check svm_set_guest_pat(struct vcpu *v, u64 gpat)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
 
@@ -772,7 +772,7 @@ static int svm_set_guest_pat(struct vcpu *v, u64 gpat)
     return 1;
 }
 
-static int svm_get_guest_pat(struct vcpu *v, u64 *gpat)
+static int cf_check svm_get_guest_pat(struct vcpu *v, u64 *gpat)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
 
@@ -820,7 +820,7 @@ static uint64_t svm_get_tsc_offset(uint64_t host_tsc, uint64_t guest_tsc,
     return guest_tsc - scale_tsc(host_tsc, ratio);
 }
 
-static void svm_set_tsc_offset(struct vcpu *v, u64 offset, u64 at_tsc)
+static void cf_check svm_set_tsc_offset(struct vcpu *v, u64 offset, u64 at_tsc)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
     struct vmcb_struct *n1vmcb, *n2vmcb;
@@ -856,7 +856,7 @@ static void svm_set_tsc_offset(struct vcpu *v, u64 offset, u64 at_tsc)
     vmcb_set_tsc_offset(vmcb, offset + n2_tsc_offset);
 }
 
-static void svm_set_rdtsc_exiting(struct vcpu *v, bool_t enable)
+static void cf_check svm_set_rdtsc_exiting(struct vcpu *v, bool enable)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
     u32 general1_intercepts = vmcb_get_general1_intercepts(vmcb);
@@ -875,7 +875,8 @@ static void svm_set_rdtsc_exiting(struct vcpu *v, bool_t enable)
     vmcb_set_general2_intercepts(vmcb, general2_intercepts);
 }
 
-static void svm_set_descriptor_access_exiting(struct vcpu *v, bool enable)
+static void cf_check svm_set_descriptor_access_exiting(
+    struct vcpu *v, bool enable)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
     u32 general1_intercepts = vmcb_get_general1_intercepts(vmcb);
@@ -892,7 +893,7 @@ static void svm_set_descriptor_access_exiting(struct vcpu *v, bool enable)
     vmcb_set_general1_intercepts(vmcb, general1_intercepts);
 }
 
-static unsigned int svm_get_insn_bytes(struct vcpu *v, uint8_t *buf)
+static unsigned int cf_check svm_get_insn_bytes(struct vcpu *v, uint8_t *buf)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
     unsigned int len = v->arch.hvm.svm.cached_insn_len;
@@ -907,7 +908,7 @@ static unsigned int svm_get_insn_bytes(struct vcpu *v, uint8_t *buf)
     return len;
 }
 
-static void svm_init_hypercall_page(void *p)
+static void cf_check svm_init_hypercall_page(void *p)
 {
     unsigned int i;
 
@@ -1148,7 +1149,7 @@ static int acpi_c1e_quirk(int dir, unsigned int port, unsigned int bytes,
     return X86EMUL_OKAY;
 }
 
-static int svm_domain_initialise(struct domain *d)
+static int cf_check svm_domain_initialise(struct domain *d)
 {
     static const struct arch_csw csw = {
         .from = svm_ctxt_switch_from,
@@ -1166,7 +1167,7 @@ static int svm_domain_initialise(struct domain *d)
     return 0;
 }
 
-static int svm_vcpu_initialise(struct vcpu *v)
+static int cf_check svm_vcpu_initialise(struct vcpu *v)
 {
     int rc;
 
@@ -1183,7 +1184,7 @@ static int svm_vcpu_initialise(struct vcpu *v)
     return 0;
 }
 
-static void svm_vcpu_destroy(struct vcpu *v)
+static void cf_check svm_vcpu_destroy(struct vcpu *v)
 {
     svm_destroy_vmcb(v);
     passive_domain_destroy(v);
@@ -1304,7 +1305,7 @@ static void svm_emul_swint_injection(struct x86_event *event)
     event->error_code = ec;
 }
 
-static void svm_inject_event(const struct x86_event *event)
+static void cf_check svm_inject_event(const struct x86_event *event)
 {
     struct vcpu *curr = current;
     struct vmcb_struct *vmcb = curr->arch.hvm.svm.vmcb;
@@ -1434,12 +1435,12 @@ static void svm_inject_event(const struct x86_event *event)
         HVMTRACE_2D(INJ_EXC, _event.vector, _event.error_code);
 }
 
-static bool svm_event_pending(const struct vcpu *v)
+static bool cf_check svm_event_pending(const struct vcpu *v)
 {
     return v->arch.hvm.svm.vmcb->event_inj.v;
 }
 
-static void svm_cpu_dead(unsigned int cpu)
+static void cf_check svm_cpu_dead(unsigned int cpu)
 {
     paddr_t *this_hsa = &per_cpu(hsa, cpu);
     paddr_t *this_vmcb = &per_cpu(host_vmcb, cpu);
@@ -1465,7 +1466,7 @@ static void svm_cpu_dead(unsigned int cpu)
     }
 }
 
-static int svm_cpu_up_prepare(unsigned int cpu)
+static int cf_check svm_cpu_up_prepare(unsigned int cpu)
 {
     paddr_t *this_hsa = &per_cpu(hsa, cpu);
     paddr_t *this_vmcb = &per_cpu(host_vmcb, cpu);
@@ -1620,7 +1621,7 @@ static int _svm_cpu_up(bool bsp)
     return 0;
 }
 
-static int svm_cpu_up(void)
+static int cf_check svm_cpu_up(void)
 {
     return _svm_cpu_up(false);
 }
@@ -1749,7 +1750,7 @@ static void svm_do_nested_pgfault(struct vcpu *v,
     domain_crash(v->domain);
 }
 
-static void svm_fpu_dirty_intercept(void)
+static void cf_check svm_fpu_dirty_intercept(void)
 {
     struct vcpu *v = current;
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
@@ -1795,7 +1796,8 @@ static void svm_dr_access(struct vcpu *v, struct cpu_user_regs *regs)
     __restore_debug_registers(vmcb, v);
 }
 
-static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
+static int cf_check svm_msr_read_intercept(
+    unsigned int msr, uint64_t *msr_content)
 {
     struct vcpu *v = current;
     const struct domain *d = v->domain;
@@ -1990,7 +1992,8 @@ static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
     return X86EMUL_EXCEPTION;
 }
 
-static int svm_msr_write_intercept(unsigned int msr, uint64_t msr_content)
+static int cf_check svm_msr_write_intercept(
+    unsigned int msr, uint64_t msr_content)
 {
     struct vcpu *v = current;
     struct domain *d = v->domain;
@@ -2409,7 +2412,7 @@ static void svm_vmexit_mce_intercept(
     }
 }
 
-static void svm_wbinvd_intercept(void)
+static void cf_check svm_wbinvd_intercept(void)
 {
     if ( cache_flush_permitted(current->domain) )
         flush_all(FLUSH_CACHE);
@@ -2454,12 +2457,13 @@ static bool is_invlpg(const struct x86_emulate_state *state,
            (ext & 7) == 7;
 }
 
-static void svm_invlpg(struct vcpu *v, unsigned long linear)
+static void cf_check svm_invlpg(struct vcpu *v, unsigned long linear)
 {
     svm_asid_g_invlpg(v, linear);
 }
 
-static bool svm_get_pending_event(struct vcpu *v, struct x86_event *info)
+static bool cf_check svm_get_pending_event(
+    struct vcpu *v, struct x86_event *info)
 {
     const struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
 
@@ -2473,7 +2477,7 @@ static bool svm_get_pending_event(struct vcpu *v, struct x86_event *info)
     return true;
 }
 
-static uint64_t svm_get_reg(struct vcpu *v, unsigned int reg)
+static uint64_t cf_check svm_get_reg(struct vcpu *v, unsigned int reg)
 {
     const struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
     struct domain *d = v->domain;
@@ -2491,7 +2495,7 @@ static uint64_t svm_get_reg(struct vcpu *v, unsigned int reg)
     }
 }
 
-static void svm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
+static void cf_check svm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
     struct domain *d = v->domain;
diff --git a/xen/arch/x86/hvm/vmx/intr.c b/xen/arch/x86/hvm/vmx/intr.c
index 80bfbb478782..13bbe8430df5 100644
--- a/xen/arch/x86/hvm/vmx/intr.c
+++ b/xen/arch/x86/hvm/vmx/intr.c
@@ -147,7 +147,7 @@ static void vmx_enable_intr_window(struct vcpu *v, struct hvm_intack intack)
  *         used but may have negative impact on interrupt performance.
  */
 
-enum hvm_intblk nvmx_intr_blocked(struct vcpu *v)
+enum hvm_intblk cf_check nvmx_intr_blocked(struct vcpu *v)
 {
     int r = hvm_intblk_none;
     struct nestedvcpu *nvcpu = &vcpu_nestedhvm(v);
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index d2cafd8ca1c5..60b506ac3f40 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -655,7 +655,7 @@ void vmx_vmcs_reload(struct vcpu *v)
     vmx_load_vmcs(v);
 }
 
-int vmx_cpu_up_prepare(unsigned int cpu)
+int cf_check vmx_cpu_up_prepare(unsigned int cpu)
 {
     /*
      * If nvmx_cpu_up_prepare() failed, do not return failure and just fallback
@@ -676,7 +676,7 @@ int vmx_cpu_up_prepare(unsigned int cpu)
     return -ENOMEM;
 }
 
-void vmx_cpu_dead(unsigned int cpu)
+void cf_check vmx_cpu_dead(unsigned int cpu)
 {
     vmx_free_vmcs(per_cpu(vmxon_region, cpu));
     per_cpu(vmxon_region, cpu) = 0;
@@ -774,12 +774,12 @@ static int _vmx_cpu_up(bool bsp)
     return 0;
 }
 
-int vmx_cpu_up()
+int cf_check vmx_cpu_up()
 {
     return _vmx_cpu_up(false);
 }
 
-void vmx_cpu_down(void)
+void cf_check vmx_cpu_down(void)
 {
     struct list_head *active_vmcs_list = &this_cpu(active_vmcs_list);
     unsigned long flags;
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index dade08f60279..2c4804f9b884 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -68,14 +68,16 @@ static void vmx_ctxt_switch_to(struct vcpu *v);
 
 static int alloc_vlapic_mapping(void);
 static void vmx_install_vlapic_mapping(struct vcpu *v);
-static void vmx_update_guest_cr(struct vcpu *v, unsigned int cr,
-                                unsigned int flags);
-static void vmx_update_guest_efer(struct vcpu *v);
-static void vmx_wbinvd_intercept(void);
-static void vmx_fpu_dirty_intercept(void);
-static int vmx_msr_read_intercept(unsigned int msr, uint64_t *msr_content);
-static int vmx_msr_write_intercept(unsigned int msr, uint64_t msr_content);
-static void vmx_invlpg(struct vcpu *v, unsigned long linear);
+static void cf_check vmx_update_guest_cr(
+    struct vcpu *v, unsigned int cr, unsigned int flags);
+static void cf_check vmx_update_guest_efer(struct vcpu *v);
+static void cf_check vmx_wbinvd_intercept(void);
+static void cf_check vmx_fpu_dirty_intercept(void);
+static int cf_check vmx_msr_read_intercept(
+    unsigned int msr, uint64_t *msr_content);
+static int cf_check vmx_msr_write_intercept(
+    unsigned int msr, uint64_t msr_content);
+static void cf_check vmx_invlpg(struct vcpu *v, unsigned long linear);
 
 static mfn_t __read_mostly apic_access_mfn = INVALID_MFN_INITIALIZER;
 
@@ -103,7 +105,7 @@ void vmx_pi_per_cpu_init(unsigned int cpu)
     spin_lock_init(&per_cpu(vmx_pi_blocking, cpu).lock);
 }
 
-static void vmx_vcpu_block(struct vcpu *v)
+static void cf_check vmx_vcpu_block(struct vcpu *v)
 {
     unsigned long flags;
     unsigned int dest;
@@ -395,7 +397,7 @@ void vmx_pi_hooks_deassign(struct domain *d)
     domain_unpause(d);
 }
 
-static int vmx_domain_initialise(struct domain *d)
+static int cf_check vmx_domain_initialise(struct domain *d)
 {
     static const struct arch_csw csw = {
         .from = vmx_ctxt_switch_from,
@@ -414,7 +416,7 @@ static int vmx_domain_initialise(struct domain *d)
     return 0;
 }
 
-static void domain_creation_finished(struct domain *d)
+static void cf_check domain_creation_finished(struct domain *d)
 {
     gfn_t gfn = gaddr_to_gfn(APIC_DEFAULT_PHYS_BASE);
     bool ipat;
@@ -444,7 +446,7 @@ static void vmx_init_ipt(struct vcpu *v)
     v->arch.msrs->rtit.output_limit = size - 1;
 }
 
-static int vmx_vcpu_initialise(struct vcpu *v)
+static int cf_check vmx_vcpu_initialise(struct vcpu *v)
 {
     int rc;
 
@@ -491,7 +493,7 @@ static int vmx_vcpu_initialise(struct vcpu *v)
     return 0;
 }
 
-static void vmx_vcpu_destroy(struct vcpu *v)
+static void cf_check vmx_vcpu_destroy(struct vcpu *v)
 {
     /*
      * There are cases that domain still remains in log-dirty mode when it is
@@ -589,7 +591,7 @@ void vmx_update_exception_bitmap(struct vcpu *v)
         __vmwrite(EXCEPTION_BITMAP, bitmap);
 }
 
-static void vmx_cpuid_policy_changed(struct vcpu *v)
+static void cf_check vmx_cpuid_policy_changed(struct vcpu *v)
 {
     const struct cpuid_policy *cp = v->domain->arch.cpuid;
     int rc = 0;
@@ -647,7 +649,7 @@ static void vmx_cpuid_policy_changed(struct vcpu *v)
     }
 }
 
-int vmx_guest_x86_mode(struct vcpu *v)
+int cf_check vmx_guest_x86_mode(struct vcpu *v)
 {
     unsigned long cs_ar_bytes;
 
@@ -844,7 +846,7 @@ static void vmx_load_cpu_state(struct vcpu *v, struct hvm_hw_cpu *data)
 }
 
 
-static void vmx_save_vmcs_ctxt(struct vcpu *v, struct hvm_hw_cpu *ctxt)
+static void cf_check vmx_save_vmcs_ctxt(struct vcpu *v, struct hvm_hw_cpu *ctxt)
 {
     if ( v == current )
         vmx_save_guest_msrs(v);
@@ -853,7 +855,7 @@ static void vmx_save_vmcs_ctxt(struct vcpu *v, struct hvm_hw_cpu *ctxt)
     vmx_vmcs_save(v, ctxt);
 }
 
-static int vmx_load_vmcs_ctxt(struct vcpu *v, struct hvm_hw_cpu *ctxt)
+static int cf_check vmx_load_vmcs_ctxt(struct vcpu *v, struct hvm_hw_cpu *ctxt)
 {
     /* Not currently safe to use in current context. */
     ASSERT(v != current);
@@ -879,7 +881,7 @@ static void vmx_fpu_enter(struct vcpu *v)
     __vmwrite(HOST_CR0, v->arch.hvm.vmx.host_cr0);
 }
 
-static void vmx_fpu_leave(struct vcpu *v)
+static void cf_check vmx_fpu_leave(struct vcpu *v)
 {
     ASSERT(!v->fpu_dirtied);
     ASSERT(read_cr0() & X86_CR0_TS);
@@ -956,7 +958,7 @@ unsigned int vmx_get_cpl(void)
     return (attr >> 5) & 3;
 }
 
-static unsigned int _vmx_get_cpl(struct vcpu *v)
+static unsigned int cf_check _vmx_get_cpl(struct vcpu *v)
 {
     unsigned int cpl;
 
@@ -982,8 +984,8 @@ static unsigned int _vmx_get_cpl(struct vcpu *v)
 #define vm86_ds_attr 0xf3
 #define vm86_tr_attr 0x8b
 
-static void vmx_get_segment_register(struct vcpu *v, enum x86_segment seg,
-                                     struct segment_register *reg)
+static void cf_check vmx_get_segment_register(
+    struct vcpu *v, enum x86_segment seg, struct segment_register *reg)
 {
     unsigned long attr = 0, sel = 0, limit;
     unsigned int tmp_seg;
@@ -1084,8 +1086,8 @@ static void vmx_get_segment_register(struct vcpu *v, enum x86_segment seg,
     }
 }
 
-static void vmx_set_segment_register(struct vcpu *v, enum x86_segment seg,
-                                     struct segment_register *reg)
+static void cf_check vmx_set_segment_register(
+    struct vcpu *v, enum x86_segment seg, struct segment_register *reg)
 {
     uint32_t attr, sel, limit;
     uint64_t base;
@@ -1174,12 +1176,12 @@ static void vmx_set_segment_register(struct vcpu *v, enum x86_segment seg,
     vmx_vmcs_exit(v);
 }
 
-static unsigned long vmx_get_shadow_gs_base(struct vcpu *v)
+static unsigned long cf_check vmx_get_shadow_gs_base(struct vcpu *v)
 {
     return v->arch.hvm.vmx.shadow_gs;
 }
 
-static int vmx_set_guest_pat(struct vcpu *v, u64 gpat)
+static int cf_check vmx_set_guest_pat(struct vcpu *v, u64 gpat)
 {
     if ( !paging_mode_hap(v->domain) ||
          unlikely(v->arch.hvm.cache_mode == NO_FILL_CACHE_MODE) )
@@ -1191,7 +1193,7 @@ static int vmx_set_guest_pat(struct vcpu *v, u64 gpat)
     return 1;
 }
 
-static int vmx_get_guest_pat(struct vcpu *v, u64 *gpat)
+static int cf_check vmx_get_guest_pat(struct vcpu *v, u64 *gpat)
 {
     if ( !paging_mode_hap(v->domain) ||
          unlikely(v->arch.hvm.cache_mode == NO_FILL_CACHE_MODE) )
@@ -1203,7 +1205,7 @@ static int vmx_get_guest_pat(struct vcpu *v, u64 *gpat)
     return 1;
 }
 
-static void vmx_handle_cd(struct vcpu *v, unsigned long value)
+static void cf_check vmx_handle_cd(struct vcpu *v, unsigned long value)
 {
     if ( !paging_mode_hap(v->domain) )
     {
@@ -1253,7 +1255,7 @@ static void vmx_handle_cd(struct vcpu *v, unsigned long value)
     }
 }
 
-static void vmx_setup_tsc_scaling(struct vcpu *v)
+static void cf_check vmx_setup_tsc_scaling(struct vcpu *v)
 {
     if ( v->domain->arch.vtsc )
         return;
@@ -1263,7 +1265,7 @@ static void vmx_setup_tsc_scaling(struct vcpu *v)
     vmx_vmcs_exit(v);
 }
 
-static void vmx_set_tsc_offset(struct vcpu *v, u64 offset, u64 at_tsc)
+static void cf_check vmx_set_tsc_offset(struct vcpu *v, u64 offset, u64 at_tsc)
 {
     vmx_vmcs_enter(v);
 
@@ -1274,7 +1276,7 @@ static void vmx_set_tsc_offset(struct vcpu *v, u64 offset, u64 at_tsc)
     vmx_vmcs_exit(v);
 }
 
-static void vmx_set_rdtsc_exiting(struct vcpu *v, bool_t enable)
+static void cf_check vmx_set_rdtsc_exiting(struct vcpu *v, bool enable)
 {
     vmx_vmcs_enter(v);
     v->arch.hvm.vmx.exec_control &= ~CPU_BASED_RDTSC_EXITING;
@@ -1284,7 +1286,8 @@ static void vmx_set_rdtsc_exiting(struct vcpu *v, bool_t enable)
     vmx_vmcs_exit(v);
 }
 
-static void vmx_set_descriptor_access_exiting(struct vcpu *v, bool enable)
+static void cf_check vmx_set_descriptor_access_exiting(
+    struct vcpu *v, bool enable)
 {
     if ( enable )
         v->arch.hvm.vmx.secondary_exec_control |=
@@ -1298,7 +1301,7 @@ static void vmx_set_descriptor_access_exiting(struct vcpu *v, bool enable)
     vmx_vmcs_exit(v);
 }
 
-static void vmx_init_hypercall_page(void *p)
+static void cf_check vmx_init_hypercall_page(void *p)
 {
     unsigned int i;
 
@@ -1321,7 +1324,7 @@ static void vmx_init_hypercall_page(void *p)
     }
 }
 
-static unsigned int vmx_get_interrupt_shadow(struct vcpu *v)
+static unsigned int cf_check vmx_get_interrupt_shadow(struct vcpu *v)
 {
     unsigned long intr_shadow;
 
@@ -1330,7 +1333,8 @@ static unsigned int vmx_get_interrupt_shadow(struct vcpu *v)
     return intr_shadow;
 }
 
-static void vmx_set_interrupt_shadow(struct vcpu *v, unsigned int intr_shadow)
+static void cf_check vmx_set_interrupt_shadow(
+    struct vcpu *v, unsigned int intr_shadow)
 {
     __vmwrite(GUEST_INTERRUPTIBILITY_INFO, intr_shadow);
 }
@@ -1381,7 +1385,7 @@ static void vmx_load_pdptrs(struct vcpu *v)
     return;
 }
 
-static void vmx_update_host_cr3(struct vcpu *v)
+static void cf_check vmx_update_host_cr3(struct vcpu *v)
 {
     vmx_vmcs_enter(v);
     __vmwrite(HOST_CR3, v->arch.cr3);
@@ -1400,8 +1404,8 @@ void vmx_update_debug_state(struct vcpu *v)
     vmx_vmcs_exit(v);
 }
 
-static void vmx_update_guest_cr(struct vcpu *v, unsigned int cr,
-                                unsigned int flags)
+static void cf_check vmx_update_guest_cr(
+    struct vcpu *v, unsigned int cr, unsigned int flags)
 {
     vmx_vmcs_enter(v);
 
@@ -1603,7 +1607,7 @@ static void vmx_update_guest_cr(struct vcpu *v, unsigned int cr,
     vmx_vmcs_exit(v);
 }
 
-static void vmx_update_guest_efer(struct vcpu *v)
+static void cf_check vmx_update_guest_efer(struct vcpu *v)
 {
     unsigned long entry_ctls, guest_efer = v->arch.hvm.guest_efer,
         xen_efer = read_efer();
@@ -1705,7 +1709,8 @@ void nvmx_enqueue_n2_exceptions(struct vcpu *v,
                  nvmx->intr.intr_info, nvmx->intr.error_code);
 }
 
-static int nvmx_vmexit_event(struct vcpu *v, const struct x86_event *event)
+static int cf_check nvmx_vmexit_event(
+    struct vcpu *v, const struct x86_event *event)
 {
     nvmx_enqueue_n2_exceptions(v, event->vector, event->error_code,
                                hvm_intsrc_none);
@@ -1791,7 +1796,7 @@ void vmx_inject_nmi(void)
  *  - #DB is X86_EVENTTYPE_HW_EXCEPTION, except when generated by
  *    opcode 0xf1 (which is X86_EVENTTYPE_PRI_SW_EXCEPTION)
  */
-static void vmx_inject_event(const struct x86_event *event)
+static void cf_check vmx_inject_event(const struct x86_event *event)
 {
     unsigned long intr_info;
     struct vcpu *curr = current;
@@ -1872,7 +1877,7 @@ static void vmx_inject_event(const struct x86_event *event)
         HVMTRACE_2D(INJ_EXC, _event.vector, _event.error_code);
 }
 
-static bool vmx_event_pending(const struct vcpu *v)
+static bool cf_check vmx_event_pending(const struct vcpu *v)
 {
     unsigned long intr_info;
 
@@ -1882,7 +1887,7 @@ static bool vmx_event_pending(const struct vcpu *v)
     return intr_info & INTR_INFO_VALID_MASK;
 }
 
-static void vmx_set_info_guest(struct vcpu *v)
+static void cf_check vmx_set_info_guest(struct vcpu *v)
 {
     unsigned long intr_shadow;
 
@@ -1910,7 +1915,8 @@ static void vmx_set_info_guest(struct vcpu *v)
     vmx_vmcs_exit(v);
 }
 
-static void vmx_update_eoi_exit_bitmap(struct vcpu *v, uint8_t vector, bool set)
+static void cf_check vmx_update_eoi_exit_bitmap(
+    struct vcpu *v, uint8_t vector, bool set)
 {
     if ( set )
         vmx_set_eoi_exit_bitmap(v, vector);
@@ -1938,7 +1944,7 @@ static u8 set_svi(int isr)
     return old;
 }
 
-static void vmx_process_isr(int isr, struct vcpu *v)
+static void cf_check vmx_process_isr(int isr, struct vcpu *v)
 {
     unsigned int i;
     const struct vlapic *vlapic = vcpu_vlapic(v);
@@ -2026,7 +2032,7 @@ static void __vmx_deliver_posted_interrupt(struct vcpu *v)
     }
 }
 
-static void vmx_deliver_posted_intr(struct vcpu *v, u8 vector)
+static void cf_check vmx_deliver_posted_intr(struct vcpu *v, u8 vector)
 {
     struct pi_desc old, new, prev;
 
@@ -2073,7 +2079,7 @@ static void vmx_deliver_posted_intr(struct vcpu *v, u8 vector)
     __vmx_deliver_posted_interrupt(v);
 }
 
-static void vmx_sync_pir_to_irr(struct vcpu *v)
+static void cf_check vmx_sync_pir_to_irr(struct vcpu *v)
 {
     struct vlapic *vlapic = vcpu_vlapic(v);
     unsigned int group, i;
@@ -2089,12 +2095,12 @@ static void vmx_sync_pir_to_irr(struct vcpu *v)
         vlapic_set_vector(i, &vlapic->regs->data[APIC_IRR]);
 }
 
-static bool vmx_test_pir(const struct vcpu *v, uint8_t vec)
+static bool cf_check vmx_test_pir(const struct vcpu *v, uint8_t vec)
 {
     return pi_test_pir(vec, &v->arch.hvm.vmx.pi_desc);
 }
 
-static void vmx_handle_eoi(uint8_t vector, int isr)
+static void cf_check vmx_handle_eoi(uint8_t vector, int isr)
 {
     uint8_t old_svi = set_svi(isr);
     static bool warned;
@@ -2103,7 +2109,7 @@ static void vmx_handle_eoi(uint8_t vector, int isr)
         printk(XENLOG_WARNING "EOI for %02x but SVI=%02x\n", vector, old_svi);
 }
 
-static void vmx_enable_msr_interception(struct domain *d, uint32_t msr)
+static void cf_check vmx_enable_msr_interception(struct domain *d, uint32_t msr)
 {
     struct vcpu *v;
 
@@ -2111,7 +2117,7 @@ static void vmx_enable_msr_interception(struct domain *d, uint32_t msr)
         vmx_set_msr_intercept(v, msr, VMX_MSR_W);
 }
 
-static void vmx_vcpu_update_eptp(struct vcpu *v)
+static void cf_check vmx_vcpu_update_eptp(struct vcpu *v)
 {
     struct domain *d = v->domain;
     struct p2m_domain *p2m = NULL;
@@ -2136,7 +2142,7 @@ static void vmx_vcpu_update_eptp(struct vcpu *v)
     vmx_vmcs_exit(v);
 }
 
-static void vmx_vcpu_update_vmfunc_ve(struct vcpu *v)
+static void cf_check vmx_vcpu_update_vmfunc_ve(struct vcpu *v)
 {
     struct domain *d = v->domain;
     u32 mask = SECONDARY_EXEC_ENABLE_VM_FUNCTIONS;
@@ -2180,7 +2186,7 @@ static void vmx_vcpu_update_vmfunc_ve(struct vcpu *v)
     vmx_vmcs_exit(v);
 }
 
-static int vmx_vcpu_emulate_vmfunc(const struct cpu_user_regs *regs)
+static int cf_check vmx_vcpu_emulate_vmfunc(const struct cpu_user_regs *regs)
 {
     int rc = X86EMUL_EXCEPTION;
     struct vcpu *curr = current;
@@ -2193,7 +2199,7 @@ static int vmx_vcpu_emulate_vmfunc(const struct cpu_user_regs *regs)
     return rc;
 }
 
-static bool_t vmx_vcpu_emulate_ve(struct vcpu *v)
+static bool cf_check vmx_vcpu_emulate_ve(struct vcpu *v)
 {
     const struct page_info *pg = vcpu_altp2m(v).veinfo_pg;
     ve_info_t *veinfo;
@@ -2230,7 +2236,8 @@ static bool_t vmx_vcpu_emulate_ve(struct vcpu *v)
     return rc;
 }
 
-static bool vmx_get_pending_event(struct vcpu *v, struct x86_event *info)
+static bool cf_check vmx_get_pending_event(
+    struct vcpu *v, struct x86_event *info)
 {
     unsigned long intr_info, error_code;
 
@@ -2267,7 +2274,8 @@ static bool vmx_get_pending_event(struct vcpu *v, struct x86_event *info)
     (RTIT_STATUS_FILTER_EN | RTIT_STATUS_CONTEXT_EN | RTIT_STATUS_TRIGGER_EN | \
      RTIT_STATUS_ERROR | RTIT_STATUS_STOPPED)
 
-static int vmtrace_get_option(struct vcpu *v, uint64_t key, uint64_t *output)
+static int cf_check vmtrace_get_option(
+    struct vcpu *v, uint64_t key, uint64_t *output)
 {
     const struct vcpu_msrs *msrs = v->arch.msrs;
 
@@ -2288,7 +2296,8 @@ static int vmtrace_get_option(struct vcpu *v, uint64_t key, uint64_t *output)
     return 0;
 }
 
-static int vmtrace_set_option(struct vcpu *v, uint64_t key, uint64_t value)
+static int cf_check vmtrace_set_option(
+    struct vcpu *v, uint64_t key, uint64_t value)
 {
     struct vcpu_msrs *msrs = v->arch.msrs;
     bool new_en, old_en = msrs->rtit.ctl & RTIT_CTL_TRACE_EN;
@@ -2342,7 +2351,7 @@ static int vmtrace_set_option(struct vcpu *v, uint64_t key, uint64_t value)
     return 0;
 }
 
-static int vmtrace_control(struct vcpu *v, bool enable, bool reset)
+static int cf_check vmtrace_control(struct vcpu *v, bool enable, bool reset)
 {
     struct vcpu_msrs *msrs = v->arch.msrs;
     uint64_t new_ctl;
@@ -2374,13 +2383,13 @@ static int vmtrace_control(struct vcpu *v, bool enable, bool reset)
     return 0;
 }
 
-static int vmtrace_output_position(struct vcpu *v, uint64_t *pos)
+static int cf_check vmtrace_output_position(struct vcpu *v, uint64_t *pos)
 {
     *pos = v->arch.msrs->rtit.output_offset;
     return v->arch.hvm.vmx.ipt_active;
 }
 
-static int vmtrace_reset(struct vcpu *v)
+static int cf_check vmtrace_reset(struct vcpu *v)
 {
     if ( !v->arch.hvm.vmx.ipt_active )
         return -EINVAL;
@@ -2390,7 +2399,7 @@ static int vmtrace_reset(struct vcpu *v)
     return 0;
 }
 
-static uint64_t vmx_get_reg(struct vcpu *v, unsigned int reg)
+static uint64_t cf_check vmx_get_reg(struct vcpu *v, unsigned int reg)
 {
     struct domain *d = v->domain;
     uint64_t val = 0;
@@ -2429,7 +2438,7 @@ static uint64_t vmx_get_reg(struct vcpu *v, unsigned int reg)
     return val;
 }
 
-static void vmx_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
+static void cf_check vmx_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
 {
     struct domain *d = v->domain;
     int rc;
@@ -2823,7 +2832,7 @@ void update_guest_eip(void)
         hvm_inject_hw_exception(TRAP_debug, X86_EVENT_NO_EC);
 }
 
-static void vmx_fpu_dirty_intercept(void)
+static void cf_check vmx_fpu_dirty_intercept(void)
 {
     struct vcpu *curr = current;
 
@@ -2858,7 +2867,7 @@ static void vmx_invlpg_intercept(unsigned long linear)
     paging_invlpg(current, linear);
 }
 
-static void vmx_invlpg(struct vcpu *v, unsigned long linear)
+static void cf_check vmx_invlpg(struct vcpu *v, unsigned long linear)
 {
     if ( cpu_has_vmx_vpid )
         vpid_sync_vcpu_gva(v, linear);
@@ -3184,7 +3193,8 @@ static int is_last_branch_msr(u32 ecx)
     return 0;
 }
 
-static int vmx_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
+static int cf_check vmx_msr_read_intercept(
+    unsigned int msr, uint64_t *msr_content)
 {
     struct vcpu *curr = current;
     uint64_t tmp;
@@ -3387,7 +3397,8 @@ void vmx_vlapic_msr_changed(struct vcpu *v)
     vmx_vmcs_exit(v);
 }
 
-static int vmx_msr_write_intercept(unsigned int msr, uint64_t msr_content)
+static int cf_check vmx_msr_write_intercept(
+    unsigned int msr, uint64_t msr_content)
 {
     struct vcpu *v = current;
     const struct cpuid_policy *cp = v->domain->arch.cpuid;
@@ -3587,7 +3598,7 @@ static void vmx_do_extint(struct cpu_user_regs *regs)
     do_IRQ(regs);
 }
 
-static void vmx_wbinvd_intercept(void)
+static void cf_check vmx_wbinvd_intercept(void)
 {
     if ( !cache_flush_permitted(current->domain) || iommu_snoop )
         return;
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index 7419ee9dd0bc..5f5445147585 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -62,7 +62,7 @@ void nvmx_cpu_dead(unsigned int cpu)
     XFREE(per_cpu(vvmcs_buf, cpu));
 }
 
-int nvmx_vcpu_initialise(struct vcpu *v)
+int cf_check nvmx_vcpu_initialise(struct vcpu *v)
 {
     struct domain *d = v->domain;
     struct nestedvmx *nvmx = &vcpu_2_nvmx(v);
@@ -150,7 +150,7 @@ int nvmx_vcpu_initialise(struct vcpu *v)
     return 0;
 }
  
-void nvmx_vcpu_destroy(struct vcpu *v)
+void cf_check nvmx_vcpu_destroy(struct vcpu *v)
 {
     struct nestedvmx *nvmx = &vcpu_2_nvmx(v);
     struct nestedvcpu *nvcpu = &vcpu_nestedhvm(v);
@@ -199,7 +199,7 @@ static void vcpu_relinquish_resources(struct vcpu *v)
     FREE_XENHEAP_PAGE(nvmx->msr_merged);
 }
 
-void nvmx_domain_relinquish_resources(struct domain *d)
+void cf_check nvmx_domain_relinquish_resources(struct domain *d)
 {
     struct vcpu *v;
 
@@ -210,17 +210,17 @@ void nvmx_domain_relinquish_resources(struct domain *d)
     }
 }
 
-int nvmx_vcpu_reset(struct vcpu *v)
+int cf_check nvmx_vcpu_reset(struct vcpu *v)
 {
     return 0;
 }
 
-uint64_t nvmx_vcpu_eptp_base(struct vcpu *v)
+uint64_t cf_check nvmx_vcpu_eptp_base(struct vcpu *v)
 {
     return get_vvmcs(v, EPT_POINTER) & PAGE_MASK;
 }
 
-bool_t nvmx_ept_enabled(struct vcpu *v)
+bool cf_check nvmx_ept_enabled(struct vcpu *v)
 {
     struct nestedvmx *nvmx = &vcpu_2_nvmx(v);
 
@@ -514,7 +514,7 @@ static void vmfail(struct cpu_user_regs *regs, enum vmx_insn_errno errno)
         vmfail_invalid(regs);
 }
 
-bool_t nvmx_intercepts_exception(
+bool cf_check nvmx_intercepts_exception(
     struct vcpu *v, unsigned int vector, int error_code)
 {
     u32 exception_bitmap, pfec_match=0, pfec_mask=0;
@@ -2346,7 +2346,7 @@ int nvmx_msr_read_intercept(unsigned int msr, u64 *msr_content)
  * walk is successful, the translated value is returned in
  * L1_gpa. The result value tells what to do next.
  */
-int nvmx_hap_walk_L1_p2m(
+int cf_check nvmx_hap_walk_L1_p2m(
     struct vcpu *v, paddr_t L2_gpa, paddr_t *L1_gpa, unsigned int *page_order,
     uint8_t *p2m_acc, struct npfec npfec)
 {
diff --git a/xen/arch/x86/include/asm/hvm/svm/nestedsvm.h b/xen/arch/x86/include/asm/hvm/svm/nestedsvm.h
index c3ef2354140c..656d7d1a9a71 100644
--- a/xen/arch/x86/include/asm/hvm/svm/nestedsvm.h
+++ b/xen/arch/x86/include/asm/hvm/svm/nestedsvm.h
@@ -107,22 +107,22 @@ nestedsvm_check_intercepts(struct vcpu *v, struct cpu_user_regs *regs,
 void svm_nested_features_on_efer_update(struct vcpu *v);
 
 /* Interface methods */
-void nsvm_vcpu_destroy(struct vcpu *v);
-int nsvm_vcpu_initialise(struct vcpu *v);
-int nsvm_vcpu_reset(struct vcpu *v);
+void cf_check nsvm_vcpu_destroy(struct vcpu *v);
+int cf_check nsvm_vcpu_initialise(struct vcpu *v);
+int cf_check nsvm_vcpu_reset(struct vcpu *v);
 int nsvm_vcpu_vmrun(struct vcpu *v, struct cpu_user_regs *regs);
-int nsvm_vcpu_vmexit_event(struct vcpu *v, const struct x86_event *event);
-uint64_t nsvm_vcpu_hostcr3(struct vcpu *v);
-bool_t nsvm_vmcb_guest_intercepts_event(
+int cf_check nsvm_vcpu_vmexit_event(struct vcpu *v, const struct x86_event *event);
+uint64_t cf_check nsvm_vcpu_hostcr3(struct vcpu *v);
+bool cf_check nsvm_vmcb_guest_intercepts_event(
     struct vcpu *v, unsigned int vector, int errcode);
-bool_t nsvm_vmcb_hap_enabled(struct vcpu *v);
-enum hvm_intblk nsvm_intr_blocked(struct vcpu *v);
+bool cf_check nsvm_vmcb_hap_enabled(struct vcpu *v);
+enum hvm_intblk cf_check nsvm_intr_blocked(struct vcpu *v);
 
 /* Interrupts, vGIF */
 void svm_vmexit_do_clgi(struct cpu_user_regs *regs, struct vcpu *v);
 void svm_vmexit_do_stgi(struct cpu_user_regs *regs, struct vcpu *v);
 bool_t nestedsvm_gif_isset(struct vcpu *v);
-int nsvm_hap_walk_L1_p2m(
+int cf_check nsvm_hap_walk_L1_p2m(
     struct vcpu *v, paddr_t L2_gpa, paddr_t *L1_gpa, unsigned int *page_order,
     uint8_t *p2m_acc, struct npfec npfec);
 
diff --git a/xen/arch/x86/include/asm/hvm/svm/svm.h b/xen/arch/x86/include/asm/hvm/svm/svm.h
index 09c32044ec8a..65e35a4f59b7 100644
--- a/xen/arch/x86/include/asm/hvm/svm/svm.h
+++ b/xen/arch/x86/include/asm/hvm/svm/svm.h
@@ -50,7 +50,6 @@ struct vcpu;
 
 unsigned long *svm_msrbit(unsigned long *msr_bitmap, uint32_t msr);
 void __update_guest_eip(struct cpu_user_regs *regs, unsigned int inst_len);
-void svm_update_guest_cr(struct vcpu *, unsigned int cr, unsigned int flags);
 
 /*
  * PV context switch helpers.  Prefetching the VMCB area itself has been shown
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
index 03c9ccf627ab..9119aa8536df 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -22,10 +22,10 @@
 
 extern void vmcs_dump_vcpu(struct vcpu *v);
 extern int vmx_vmcs_init(void);
-extern int  vmx_cpu_up_prepare(unsigned int cpu);
-extern void vmx_cpu_dead(unsigned int cpu);
-extern int  vmx_cpu_up(void);
-extern void vmx_cpu_down(void);
+int cf_check vmx_cpu_up_prepare(unsigned int cpu);
+void cf_check vmx_cpu_dead(unsigned int cpu);
+int cf_check vmx_cpu_up(void);
+void cf_check vmx_cpu_down(void);
 
 struct vmcs_struct {
     u32 vmcs_revision_id;
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index 97e7652aa12c..5284fe931f62 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -588,7 +588,7 @@ static inline int __vmxon(u64 addr)
     return rc;
 }
 
-int vmx_guest_x86_mode(struct vcpu *v);
+int cf_check vmx_guest_x86_mode(struct vcpu *v);
 unsigned int vmx_get_cpl(void);
 
 void vmx_inject_extint(int trap, uint8_t source);
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vvmx.h b/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
index e4ca3bc6ee2b..2c3adb5dd6b3 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
@@ -84,23 +84,23 @@ union vmx_inst_info {
     u32 word;
 };
 
-int nvmx_vcpu_initialise(struct vcpu *v);
-void nvmx_vcpu_destroy(struct vcpu *v);
-int nvmx_vcpu_reset(struct vcpu *v);
-uint64_t nvmx_vcpu_eptp_base(struct vcpu *v);
-enum hvm_intblk nvmx_intr_blocked(struct vcpu *v);
-bool_t nvmx_intercepts_exception(
+int cf_check nvmx_vcpu_initialise(struct vcpu *v);
+void cf_check nvmx_vcpu_destroy(struct vcpu *v);
+int cf_check nvmx_vcpu_reset(struct vcpu *v);
+uint64_t cf_check nvmx_vcpu_eptp_base(struct vcpu *v);
+enum hvm_intblk cf_check nvmx_intr_blocked(struct vcpu *v);
+bool cf_check nvmx_intercepts_exception(
     struct vcpu *v, unsigned int vector, int error_code);
-void nvmx_domain_relinquish_resources(struct domain *d);
+void cf_check nvmx_domain_relinquish_resources(struct domain *d);
 
-bool_t nvmx_ept_enabled(struct vcpu *v);
+bool cf_check nvmx_ept_enabled(struct vcpu *v);
 
 #define EPT_TRANSLATE_SUCCEED       0
 #define EPT_TRANSLATE_VIOLATION     1
 #define EPT_TRANSLATE_MISCONFIG     2
 #define EPT_TRANSLATE_RETRY         3
 
-int nvmx_hap_walk_L1_p2m(
+int cf_check nvmx_hap_walk_L1_p2m(
     struct vcpu *v, paddr_t L2_gpa, paddr_t *L1_gpa, unsigned int *page_order,
     uint8_t *p2m_acc, struct npfec npfec);
 
-- 
2.11.0


