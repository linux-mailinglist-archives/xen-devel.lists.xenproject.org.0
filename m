Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 501C54E322E
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 22:13:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293218.498047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWPKJ-00017t-09; Mon, 21 Mar 2022 21:12:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293218.498047; Mon, 21 Mar 2022 21:12:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWPKI-00015H-TS; Mon, 21 Mar 2022 21:12:30 +0000
Received: by outflank-mailman (input) for mailman id 293218;
 Mon, 21 Mar 2022 21:12:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hXdE=UA=intel.com=tamas.lengyel@srs-se1.protection.inumbo.net>)
 id 1nWPKH-00015B-9Y
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 21:12:29 +0000
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99c9d7aa-a95b-11ec-a405-831a346695d4;
 Mon, 21 Mar 2022 22:12:25 +0100 (CET)
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 14:12:22 -0700
Received: from swong4-mobl.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.212.31.247])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 14:12:20 -0700
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
X-Inumbo-ID: 99c9d7aa-a95b-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647897145; x=1679433145;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aNy1XCLJr0pY6mxolVFEQFVc9a0ydfMB+W6/TQxXfV0=;
  b=Zg+VpM1NegOTrpNmxzE2ZjNAsH0q1d/pmcekY47jnYj6MShHxLlrec3A
   dl7od7wLYFATkYS/cpDBe8fkkxncGpq4q/VMeohRhc+RyC8J3gTSzBTpr
   J8haGNBlrYqxTexCzPuDv/TBLicTu9VejCylNrUlqsYKFPeEw8Rr4GNPV
   Ycm9HUXXmSN3tlP8lGKLYSjJE++rYE8UPKfSd/GGrGIMfntpQpp29uYZD
   ZZFbk14EWAqLEga+EIy93/En21Aa3KoZhjhijB4NGSyVmI1DuZEBEvKbn
   rNmV6kYBZSACMHilpGiyIUZXkhGox133qSGPe7fsNK3cXwRWJi6sNXsbx
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="257368950"
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; 
   d="scan'208";a="257368950"
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; 
   d="scan'208";a="543386288"
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v4] x86/vmx: save guest non-register state in hvm_hw_cpu
Date: Mon, 21 Mar 2022 17:12:09 -0400
Message-Id: <a8828d68c308fa7ecbfe4387ca753ee0f80a2a7d.1647897016.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During VM forking and resetting a failed vmentry has been observed due
to the guest non-register state going out-of-sync with the guest register
state. For example, a VM fork reset right after a STI instruction can trigger
the failed entry. This is due to the guest non-register state not being saved
from the parent VM, thus the reset operation only copies the register state.

Fix this by including the guest non-register state in hvm_hw_cpu so that when
its copied from the parent VM the vCPU state remains in sync.

SVM is not currently wired-in as VM forking is VMX only and saving non-register
state during normal save/restore/migration operation hasn't been needed. If
deemed necessary in the future it can be wired in by adding a svm-substructure
to hvm_hw_cpu.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v4: Correct setting and checking new flag value in hvm.c
v3: Add XEN_X86_VMX flag and vmx-substructure in hvm_hw_cpu
v2: Include all CPU non-register state and fold the ops into vmx_vmcs_save &
    vmx_vmcs_restore.
Note: no sanity checking is performed on the fields to reduce the cycles during
      fuzzing.
---
 xen/arch/x86/hvm/hvm.c                 |  4 ++--
 xen/arch/x86/hvm/vmx/vmx.c             | 17 ++++++++++++++++-
 xen/include/public/arch-x86/hvm/save.h | 13 +++++++++++++
 3 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 709a4191ef..c502d0851e 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -894,7 +894,7 @@ static int cf_check hvm_save_cpu_ctxt(struct vcpu *v, hvm_domain_context_t *h)
     if ( v->fpu_initialised )
     {
         memcpy(ctxt.fpu_regs, v->arch.fpu_ctxt, sizeof(ctxt.fpu_regs));
-        ctxt.flags = XEN_X86_FPU_INITIALISED;
+        ctxt.flags |= XEN_X86_FPU_INITIALISED;
     }
 
     return hvm_save_entry(CPU, v->vcpu_id, h, &ctxt);
@@ -1025,7 +1025,7 @@ static int cf_check hvm_load_cpu_ctxt(struct domain *d, hvm_domain_context_t *h)
         return -EINVAL;
     }
 
-    if ( (ctxt.flags & ~XEN_X86_FPU_INITIALISED) != 0 )
+    if ( (ctxt.flags & ~(XEN_X86_FPU_INITIALISED | XEN_X86_VMX)) != 0 )
     {
         gprintk(XENLOG_ERR, "bad flags value in CPU context: %#x\n",
                 ctxt.flags);
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index c075370f64..6da3842d6e 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -713,7 +713,7 @@ static void vmx_restore_dr(struct vcpu *v)
 
 static void vmx_vmcs_save(struct vcpu *v, struct hvm_hw_cpu *c)
 {
-    unsigned long ev;
+    unsigned long ev, activity_state, intr_info;
 
     vmx_vmcs_enter(v);
 
@@ -721,6 +721,10 @@ static void vmx_vmcs_save(struct vcpu *v, struct hvm_hw_cpu *c)
     __vmread(GUEST_SYSENTER_ESP, &c->sysenter_esp);
     __vmread(GUEST_SYSENTER_EIP, &c->sysenter_eip);
 
+    __vmread(GUEST_ACTIVITY_STATE, &activity_state);
+    __vmread(GUEST_INTERRUPTIBILITY_INFO, &intr_info);
+    __vmread(GUEST_PENDING_DBG_EXCEPTIONS, &c->vmx.pending_dbg);
+
     __vmread(VM_ENTRY_INTR_INFO, &ev);
     if ( (ev & INTR_INFO_VALID_MASK) &&
          hvm_event_needs_reinjection(MASK_EXTR(ev, INTR_INFO_INTR_TYPE_MASK),
@@ -732,6 +736,10 @@ static void vmx_vmcs_save(struct vcpu *v, struct hvm_hw_cpu *c)
     }
 
     vmx_vmcs_exit(v);
+
+    c->vmx.activity_state = activity_state;
+    c->vmx.interruptibility_info = intr_info;
+    c->flags |= XEN_X86_VMX;
 }
 
 static int vmx_restore_cr0_cr3(
@@ -807,6 +815,13 @@ static int vmx_vmcs_restore(struct vcpu *v, struct hvm_hw_cpu *c)
 
     __vmwrite(GUEST_DR7, c->dr7);
 
+    if ( c->flags & XEN_X86_VMX )
+    {
+        __vmwrite(GUEST_ACTIVITY_STATE, c->vmx.activity_state);
+        __vmwrite(GUEST_INTERRUPTIBILITY_INFO, c->vmx.interruptibility_info);
+        __vmwrite(GUEST_PENDING_DBG_EXCEPTIONS, c->vmx.pending_dbg);
+    }
+
     if ( c->pending_valid &&
          hvm_event_needs_reinjection(c->pending_type, c->pending_vector) )
     {
diff --git a/xen/include/public/arch-x86/hvm/save.h b/xen/include/public/arch-x86/hvm/save.h
index 773a380bc2..0f728aa5d9 100644
--- a/xen/include/public/arch-x86/hvm/save.h
+++ b/xen/include/public/arch-x86/hvm/save.h
@@ -52,6 +52,7 @@ DECLARE_HVM_SAVE_TYPE(HEADER, 1, struct hvm_save_header);
  * Compat:
  *     - Pre-3.4 didn't have msr_tsc_aux
  *     - Pre-4.7 didn't have fpu_initialised
+ *     - Pre-4.17 didn't have non-register state
  */
 
 struct hvm_hw_cpu {
@@ -163,9 +164,21 @@ struct hvm_hw_cpu {
     uint32_t error_code;
 
 #define _XEN_X86_FPU_INITIALISED        0
+#define _XEN_X86_VMX                    1
 #define XEN_X86_FPU_INITIALISED         (1U<<_XEN_X86_FPU_INITIALISED)
+#define XEN_X86_VMX                     (1U<<_XEN_X86_VMX)
     uint32_t flags;
     uint32_t pad0;
+
+    /* non-register state */
+    union {
+        /* if flags & XEN_X86_VMX */
+        struct {
+            uint32_t activity_state;
+            uint32_t interruptibility_info;
+            uint64_t pending_dbg;
+        } vmx;
+    };
 };
 
 struct hvm_hw_cpu_compat {
-- 
2.25.1


