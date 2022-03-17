Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF8D4DCA97
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 16:58:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291658.495181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUsVe-0004kI-Mf; Thu, 17 Mar 2022 15:57:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291658.495181; Thu, 17 Mar 2022 15:57:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUsVe-0004hP-IL; Thu, 17 Mar 2022 15:57:54 +0000
Received: by outflank-mailman (input) for mailman id 291658;
 Thu, 17 Mar 2022 15:57:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nwNI=T4=intel.com=tamas.lengyel@srs-se1.protection.inumbo.net>)
 id 1nUsVc-0004hJ-9B
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 15:57:52 +0000
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fcc976ac-a60a-11ec-8eba-a37418f5ba1a;
 Thu, 17 Mar 2022 16:57:48 +0100 (CET)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 08:57:45 -0700
Received: from angulozx-mobl1.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.212.40.101])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 08:57:44 -0700
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
X-Inumbo-ID: fcc976ac-a60a-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647532669; x=1679068669;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OlRri1Jcoeqye6ORFNOitHAtNFXCyyPZ1eDAd21F+78=;
  b=OUeWtMcMHHnwrFrOZQjJ9oLqCRdqZj4MnrrGxw4eB1ESENE+gEMlOXDw
   B9yWG4gBhR37JKtCsBl59FCiZ7/m3iT+CvS1MjoiBtcVhbwnYDdeSESsr
   sQTQ7W/b4kveUIMxaS9+A+5Q4vhHjulqYSh9J64hFq0V8LPP3cPS824ti
   Sgcvkyx1WqnbJqOkB4zXJFZejjfC3ZDRsFuDUcbR6hj8RQ6KQAIx8pFsI
   qwR8jOvZPVgzJiidBYzMzgLfSA1WUIKx+b2EO9y0/anVTbFEkoJ9pksI4
   wQoAMoX8f6G7hJAA1WEmjFAUW4gpGt4xvqxX8LuP2D16XktZk/Wt0UxyQ
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="244353101"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; 
   d="scan'208";a="244353101"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; 
   d="scan'208";a="635406227"
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2] x86/vmx: save guest non-register state in hvm_hw_cpu
Date: Thu, 17 Mar 2022 11:57:35 -0400
Message-Id: <e79bd13acfd73c105ee1399295c99cec153258c2.1647532323.git.tamas.lengyel@intel.com>
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
state during normal save/restore/migration operation hasn't been needed.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
v2: Include all CPU non-register state and fold the ops into vmx_vmcs_save &
    vmx_vmcs_restore.
Note: no sanity checking is performed on the fields to reduce the cycles during
      fuzzing.
---
 xen/arch/x86/hvm/vmx/vmx.c             | 13 ++++++++++++-
 xen/include/public/arch-x86/hvm/save.h |  6 ++++++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index c075370f64..4d4dcc4b70 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -713,7 +713,7 @@ static void vmx_restore_dr(struct vcpu *v)
 
 static void vmx_vmcs_save(struct vcpu *v, struct hvm_hw_cpu *c)
 {
-    unsigned long ev;
+    unsigned long ev, activity_state, intr_state;
 
     vmx_vmcs_enter(v);
 
@@ -721,6 +721,10 @@ static void vmx_vmcs_save(struct vcpu *v, struct hvm_hw_cpu *c)
     __vmread(GUEST_SYSENTER_ESP, &c->sysenter_esp);
     __vmread(GUEST_SYSENTER_EIP, &c->sysenter_eip);
 
+    __vmread(GUEST_ACTIVITY_STATE, &activity_state);
+    __vmread(GUEST_INTERRUPTIBILITY_INFO, &intr_state);
+    __vmread(GUEST_PENDING_DBG_EXCEPTIONS, &c->pending_dbg);
+
     __vmread(VM_ENTRY_INTR_INFO, &ev);
     if ( (ev & INTR_INFO_VALID_MASK) &&
          hvm_event_needs_reinjection(MASK_EXTR(ev, INTR_INFO_INTR_TYPE_MASK),
@@ -732,6 +736,9 @@ static void vmx_vmcs_save(struct vcpu *v, struct hvm_hw_cpu *c)
     }
 
     vmx_vmcs_exit(v);
+
+    c->activity_state = activity_state;
+    c->interruptibility_state = intr_state;
 }
 
 static int vmx_restore_cr0_cr3(
@@ -807,6 +814,10 @@ static int vmx_vmcs_restore(struct vcpu *v, struct hvm_hw_cpu *c)
 
     __vmwrite(GUEST_DR7, c->dr7);
 
+    __vmwrite(GUEST_ACTIVITY_STATE, c->activity_state);
+    __vmwrite(GUEST_INTERRUPTIBILITY_INFO, c->interruptibility_state);
+    __vmwrite(GUEST_PENDING_DBG_EXCEPTIONS, c->pending_dbg);
+
     if ( c->pending_valid &&
          hvm_event_needs_reinjection(c->pending_type, c->pending_vector) )
     {
diff --git a/xen/include/public/arch-x86/hvm/save.h b/xen/include/public/arch-x86/hvm/save.h
index 773a380bc2..eb72e44968 100644
--- a/xen/include/public/arch-x86/hvm/save.h
+++ b/xen/include/public/arch-x86/hvm/save.h
@@ -52,6 +52,7 @@ DECLARE_HVM_SAVE_TYPE(HEADER, 1, struct hvm_save_header);
  * Compat:
  *     - Pre-3.4 didn't have msr_tsc_aux
  *     - Pre-4.7 didn't have fpu_initialised
+ *     - Pre-4.17 didn't have non-register state
  */
 
 struct hvm_hw_cpu {
@@ -166,6 +167,11 @@ struct hvm_hw_cpu {
 #define XEN_X86_FPU_INITIALISED         (1U<<_XEN_X86_FPU_INITIALISED)
     uint32_t flags;
     uint32_t pad0;
+
+    /* non-register state */
+    uint32_t activity_state;
+    uint32_t interruptibility_state;
+    uint64_t pending_dbg;
 };
 
 struct hvm_hw_cpu_compat {
-- 
2.25.1


