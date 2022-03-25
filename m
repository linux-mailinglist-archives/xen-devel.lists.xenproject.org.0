Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2904E7449
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 14:34:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294705.501229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXk55-0005OU-Ax; Fri, 25 Mar 2022 13:34:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294705.501229; Fri, 25 Mar 2022 13:34:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXk55-0005M8-7u; Fri, 25 Mar 2022 13:34:19 +0000
Received: by outflank-mailman (input) for mailman id 294705;
 Fri, 25 Mar 2022 13:34:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2vYu=UE=intel.com=tamas.lengyel@srs-se1.protection.inumbo.net>)
 id 1nXk52-0005Lx-MI
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 13:34:17 +0000
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 418004d6-ac40-11ec-8fbc-03012f2f19d4;
 Fri, 25 Mar 2022 14:34:13 +0100 (CET)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 06:34:11 -0700
Received: from saahmed-mobl1.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.212.57.117])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 06:34:09 -0700
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
X-Inumbo-ID: 418004d6-ac40-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648215253; x=1679751253;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SlGmLx8kEbZCEVrCZS3m5mfSoFIkNVnUeEg/NHCUhrE=;
  b=m2sSF4Blrm4F5xtRTexjJaA8wPJg+ihQSxKfRG+EBlUWN9KkovDVQAy9
   JAocYEjUDPEUdM1u6a5z6oEOSU6RVSVROToGgrT7qEVEriA3F0I1LFtcA
   XWSTCnu5KyRl2y2irpbeYpeNDmGxVGie7VgZVwLi6LSqzG16QqvJdpqMZ
   rZvPH03JE7BDsXkrEZ7KisLRq9T/wrgL970cKvfA3jEUd2IL0vyrE/rAJ
   S0SQXqFkwZ5Wr8+aGZ0ZcRwJaRMNxRHMyfmfaBYXdw3CYVU4yb4N2BvR9
   /W2PNEHxmpv/Bz3QBCWDDWZwPAlv2/H2scb978tmQBTHw7vXKo4VELBZZ
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10296"; a="257462267"
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; 
   d="scan'208";a="257462267"
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; 
   d="scan'208";a="584463415"
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH v5] x86/vmx: add hvm functions to get/set non-register state
Date: Fri, 25 Mar 2022 09:33:23 -0400
Message-Id: <e57797cbc2c0706c03363cc7fa1b3e234921fee5.1648214955.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During VM forking and resetting a failed vmentry has been observed due
to the guest non-register state going out-of-sync with the guest register
state. For example, a VM fork reset right after a STI instruction can trigger
the failed entry. This is due to the guest non-register state not being saved
from the parent VM, thus the reset operation only copies the register state.

Fix this by adding a new pair of hvm functions to get/set the guest
non-register state so that the overall vCPU state remains in sync.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
v5: Switch to internal-only hvm funcs instead of adding to hvm_hw_cpu
---
 xen/arch/x86/hvm/vmx/vmx.c         | 32 ++++++++++++++++++++++++
 xen/arch/x86/include/asm/hvm/hvm.h | 40 ++++++++++++++++++++++++++++++
 xen/arch/x86/mm/mem_sharing.c      | 11 +++++++-
 3 files changed, 82 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index c075370f64..2685da16c8 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1334,6 +1334,36 @@ static void cf_check vmx_set_interrupt_shadow(
     __vmwrite(GUEST_INTERRUPTIBILITY_INFO, intr_shadow);
 }
 
+static void cf_check vmx_get_nonreg_state(struct vcpu *v,
+    struct hvm_vcpu_nonreg_state *nrs)
+{
+    vmx_vmcs_enter(v);
+
+    __vmread(GUEST_ACTIVITY_STATE, &nrs->vmx.activity_state);
+    __vmread(GUEST_INTERRUPTIBILITY_INFO, &nrs->vmx.interruptibility_info);
+    __vmread(GUEST_PENDING_DBG_EXCEPTIONS, &nrs->vmx.pending_dbg);
+
+    if ( cpu_has_vmx_virtual_intr_delivery )
+        __vmread(GUEST_INTR_STATUS, &nrs->vmx.interrupt_status);
+
+    vmx_vmcs_exit(v);
+}
+
+static void cf_check vmx_set_nonreg_state(struct vcpu *v,
+    struct hvm_vcpu_nonreg_state *nrs)
+{
+    vmx_vmcs_enter(v);
+
+    __vmwrite(GUEST_ACTIVITY_STATE, nrs->vmx.activity_state);
+    __vmwrite(GUEST_INTERRUPTIBILITY_INFO, nrs->vmx.interruptibility_info);
+    __vmwrite(GUEST_PENDING_DBG_EXCEPTIONS, nrs->vmx.pending_dbg);
+
+    if ( cpu_has_vmx_virtual_intr_delivery )
+        __vmwrite(GUEST_INTR_STATUS, nrs->vmx.interrupt_status);
+
+    vmx_vmcs_exit(v);
+}
+
 static void vmx_load_pdptrs(struct vcpu *v)
 {
     uint32_t cr3 = v->arch.hvm.guest_cr[3];
@@ -2487,6 +2517,8 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
     .load_cpu_ctxt        = vmx_load_vmcs_ctxt,
     .get_interrupt_shadow = vmx_get_interrupt_shadow,
     .set_interrupt_shadow = vmx_set_interrupt_shadow,
+    .get_nonreg_state     = vmx_get_nonreg_state,
+    .set_nonreg_state     = vmx_set_nonreg_state,
     .guest_x86_mode       = vmx_guest_x86_mode,
     .get_cpl              = _vmx_get_cpl,
     .get_segment_register = vmx_get_segment_register,
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 5b7ec0cf69..9dee0f87a3 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -84,6 +84,17 @@ enum hvm_intblk {
 /* update_guest_cr() flags. */
 #define HVM_UPDATE_GUEST_CR3_NOFLUSH 0x00000001
 
+struct hvm_vcpu_nonreg_state {
+    union {
+        struct {
+            uint64_t activity_state;
+            uint64_t interruptibility_info;
+            uint64_t pending_dbg;
+            uint64_t interrupt_status;
+        } vmx;
+    };
+};
+
 /*
  * The hardware virtual machine (HVM) interface abstracts away from the
  * x86/x86_64 CPU virtualization assist specifics. Currently this interface
@@ -122,6 +133,10 @@ struct hvm_function_table {
     /* Examine specifics of the guest state. */
     unsigned int (*get_interrupt_shadow)(struct vcpu *v);
     void (*set_interrupt_shadow)(struct vcpu *v, unsigned int intr_shadow);
+    void (*get_nonreg_state)(struct vcpu *v,
+                             struct hvm_vcpu_nonreg_state *nrs);
+    void (*set_nonreg_state)(struct vcpu *v,
+                             struct hvm_vcpu_nonreg_state *nrs);
     int (*guest_x86_mode)(struct vcpu *v);
     unsigned int (*get_cpl)(struct vcpu *v);
     void (*get_segment_register)(struct vcpu *v, enum x86_segment seg,
@@ -744,6 +759,20 @@ void hvm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val);
         d_->arch.hvm.pi_ops.vcpu_block(v_);                     \
 })
 
+static inline void hvm_get_nonreg_state(struct vcpu *v,
+                                        struct hvm_vcpu_nonreg_state *nrs)
+{
+    if ( hvm_funcs.get_nonreg_state )
+        alternative_vcall(hvm_funcs.get_nonreg_state, v, nrs);
+}
+
+static inline void hvm_set_nonreg_state(struct vcpu *v,
+                                        struct hvm_vcpu_nonreg_state *nrs)
+{
+    if ( hvm_funcs.set_nonreg_state )
+        alternative_vcall(hvm_funcs.set_nonreg_state, v, nrs);
+}
+
 #else  /* CONFIG_HVM */
 
 #define hvm_enabled false
@@ -863,6 +892,17 @@ static inline void hvm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
     ASSERT_UNREACHABLE();
 }
 
+static inline void hvm_get_nonreg_state(struct vcpu *v,
+                                        struct hvm_vcpu_nonreg_state *nrs)
+{
+    ASSERT_UNREACHABLE();
+}
+static inline void hvm_set_nonreg_state(struct vcpu *v,
+                                        struct hvm_vcpu_nonreg_state *nrs)
+{
+    ASSERT_UNREACHABLE();
+}
+
 #define is_viridian_domain(d) ((void)(d), false)
 #define is_viridian_vcpu(v) ((void)(v), false)
 #define has_viridian_time_ref_count(d) ((void)(d), false)
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 15e6a7ed81..857accee58 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1643,6 +1643,13 @@ static int bring_up_vcpus(struct domain *cd, struct domain *d)
     return 0;
 }
 
+static void copy_vcpu_nonreg_state(struct vcpu *d_vcpu, struct vcpu *cd_vcpu)
+{
+    struct hvm_vcpu_nonreg_state nrs = {};
+    hvm_get_nonreg_state(d_vcpu, &nrs);
+    hvm_set_nonreg_state(cd_vcpu, &nrs);
+}
+
 static int copy_vcpu_settings(struct domain *cd, const struct domain *d)
 {
     unsigned int i;
@@ -1651,7 +1658,7 @@ static int copy_vcpu_settings(struct domain *cd, const struct domain *d)
 
     for ( i = 0; i < cd->max_vcpus; i++ )
     {
-        const struct vcpu *d_vcpu = d->vcpu[i];
+        struct vcpu *d_vcpu = d->vcpu[i];
         struct vcpu *cd_vcpu = cd->vcpu[i];
         mfn_t vcpu_info_mfn;
 
@@ -1694,6 +1701,8 @@ static int copy_vcpu_settings(struct domain *cd, const struct domain *d)
 
         hvm_vmtrace_reset(cd_vcpu);
 
+        copy_vcpu_nonreg_state(d_vcpu, cd_vcpu);
+
         /*
          * TODO: to support VMs with PV interfaces copy additional
          * settings here, such as PV timers.
-- 
2.25.1


