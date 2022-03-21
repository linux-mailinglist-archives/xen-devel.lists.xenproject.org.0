Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9724E2DDD
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 17:27:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293091.497831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWKrp-00050k-1l; Mon, 21 Mar 2022 16:26:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293091.497831; Mon, 21 Mar 2022 16:26:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWKro-0004yX-UH; Mon, 21 Mar 2022 16:26:48 +0000
Received: by outflank-mailman (input) for mailman id 293091;
 Mon, 21 Mar 2022 16:26:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hXdE=UA=intel.com=tamas.lengyel@srs-se1.protection.inumbo.net>)
 id 1nWKrn-0004yR-7I
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 16:26:47 +0000
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b172581c-a933-11ec-8fbc-03012f2f19d4;
 Mon, 21 Mar 2022 17:26:44 +0100 (CET)
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 09:26:41 -0700
Received: from gyin-mobl3.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.209.151.149])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 09:26:40 -0700
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
X-Inumbo-ID: b172581c-a933-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647880004; x=1679416004;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7iVL3k+HhOifsuFYCm7uluk2LbgfOS+rQVTGazYv1do=;
  b=aQtvT9+A0TmvHRu+YVkP/v/t6qk4BfK6yAT4WyqR5B0EUy3Zh7ciJaxc
   RFPaSAY+yr80AiZPA6elKiJnMYMknxVotwLAO8ycq8Jd0LZn5IW0W39iw
   qMqAC0ZQAi1et8Zy39G+7QcqU0TaWmy2SZWi5/qj9Cu5ENnFH0yFI6IQ9
   qdjGCCw83Sd8/8IdMsoX1CZ9obm+3tfIpq8PZFLldNrcYLbDxVCoqTsyE
   wk9Osf9OjRU40wZKplpxsNOJSfEDD4UTeHgQATA14LkD9+2evtih2vne+
   FxrtRtLO63lja0LJgTSo1v6i8Cq2Wjd6XN8HUAtJx+VF6iSIB652ew8X2
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="237534057"
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; 
   d="scan'208";a="237534057"
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; 
   d="scan'208";a="518497708"
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3] x86/vmx: save guest non-register state in hvm_hw_cpu
Date: Mon, 21 Mar 2022 12:26:17 -0400
Message-Id: <84f15b2e1bef6c901bbdf29a07c7904cb365c0b2.1647879687.git.tamas.lengyel@intel.com>
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
---
v3: Add XEN_X86_VMX flag and vmx-substructure in hvm_hw_cpu
v2: Include all CPU non-register state and fold the ops into vmx_vmcs_save &
    vmx_vmcs_restore.
Note: no sanity checking is performed on the fields to reduce the cycles during
      fuzzing.
---
 xen/arch/x86/hvm/vmx/vmx.c             | 17 ++++++++++++++++-
 xen/include/public/arch-x86/hvm/save.h | 13 +++++++++++++
 2 files changed, 29 insertions(+), 1 deletion(-)

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


