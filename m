Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FFE4FF80D
	for <lists+xen-devel@lfdr.de>; Wed, 13 Apr 2022 15:43:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304143.518708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nedHE-0006us-DU; Wed, 13 Apr 2022 13:43:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304143.518708; Wed, 13 Apr 2022 13:43:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nedHE-0006sm-AJ; Wed, 13 Apr 2022 13:43:20 +0000
Received: by outflank-mailman (input) for mailman id 304143;
 Wed, 13 Apr 2022 13:43:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4VvB=UX=intel.com=tamas.lengyel@srs-se1.protection.inumbo.net>)
 id 1nedHB-0006cb-N9
 for xen-devel@lists.xenproject.org; Wed, 13 Apr 2022 13:43:17 +0000
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa34d9a4-bb2f-11ec-8fbd-03012f2f19d4;
 Wed, 13 Apr 2022 15:43:15 +0200 (CEST)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 06:43:13 -0700
Received: from samarths-mobl.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.209.182.24])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 06:43:11 -0700
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
X-Inumbo-ID: aa34d9a4-bb2f-11ec-8fbd-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649857395; x=1681393395;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PLdEcqDhyOxXQ/AEnQEPq0e1K208cDWXzs3wCvIHm+s=;
  b=eUs56WROeSSY8pNR/EDvv2/BCquPVnN2nWkfrMv+f0YjpN/w8zT/NB2x
   gN902hzJBbLh6VXhBBxC+TqgG/vM1RBDQeU5lsQzZBjRUfr/af630Hxqu
   uAZtjhjekoVUfR/O/X95J/tJtep7XNdV8aN4UU9U0TONncd3hKD5cqrO0
   1oTAfi8GNGimJBwpFnNLYgmGLm71GjNxgFwLTz3qh742s4fbZdzkcOSWI
   BH80MYpUaAeFToCUugpUA9QcSisFuYBVEZPhyhZNkgO/ollrVAhGhpJq4
   bDux+eoI7g6QrXiNvy71guluKFm/AqNXDcFuEQ86s3msSGG7MMiLozxsa
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="287691116"
X-IronPort-AV: E=Sophos;i="5.90,257,1643702400"; 
   d="scan'208";a="287691116"
X-IronPort-AV: E=Sophos;i="5.90,257,1643702400"; 
   d="scan'208";a="623686077"
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v4 2/2] x86/monitor: Add new monitor event to catch all vmexits
Date: Wed, 13 Apr 2022 09:41:52 -0400
Message-Id: <4b456c15829c11914b698654937c28e313d2d522.1649857162.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <bc13e07cdb651afc2c8a97dde1be9c2158160307.1649857162.git.tamas.lengyel@intel.com>
References: <bc13e07cdb651afc2c8a97dde1be9c2158160307.1649857162.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add monitor event that hooks the vmexit handler allowing for both sync and
async monitoring of events. With async monitoring an event is placed on the
monitor ring for each exit and the rest of the vmexit handler resumes normally.
If there are additional monitor events configured those will also place their
respective events on the monitor ring.

With the sync version an event is placed on the monitor ring but the handler
does not get resumed, thus the sync version is only useful when the VM is not
expected to resume normally after the vmexit. Our use-case is primarily with
the sync version with VM forks where the fork gets reset after sync vmexit
event, thus the rest of the vmexit handler can be safely skipped. This is
very useful when we want to avoid Xen crashing the VM under any circumstance,
for example during fuzzing. Collecting all vmexit information regardless of
the root cause makes it easier to reason about the state of the VM on the
monitor side, hence we opt to receive all events, even for external interrupt
and NMI exits and let the monitor agent decide how to proceed.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
v4: Minor tweaks and more verbose patch description.

Note: making the sync version resume-friendly is specifically out-of-scope as
it would require significant rearrangement of the vmexit handler. As this
feature is not required for our use-case we opt for the version that minimizes
impact on the existing code.
---
 tools/include/xenctrl.h                |  2 ++
 tools/libs/ctrl/xc_monitor.c           | 15 +++++++++++++++
 xen/arch/x86/hvm/monitor.c             | 18 ++++++++++++++++++
 xen/arch/x86/hvm/vmx/vmx.c             | 12 ++++++++++++
 xen/arch/x86/include/asm/domain.h      |  2 ++
 xen/arch/x86/include/asm/hvm/monitor.h |  2 ++
 xen/arch/x86/include/asm/monitor.h     |  3 ++-
 xen/arch/x86/monitor.c                 | 14 ++++++++++++++
 xen/include/public/domctl.h            |  6 ++++++
 xen/include/public/vm_event.h          |  8 ++++++++
 10 files changed, 81 insertions(+), 1 deletion(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 1b089a2c02..159eaac050 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2096,6 +2096,8 @@ int xc_monitor_privileged_call(xc_interface *xch, uint32_t domain_id,
                                bool enable);
 int xc_monitor_emul_unimplemented(xc_interface *xch, uint32_t domain_id,
                                   bool enable);
+int xc_monitor_vmexit(xc_interface *xch, uint32_t domain_id, bool enable,
+                      bool sync);
 /**
  * This function enables / disables emulation for each REP for a
  * REP-compatible instruction.
diff --git a/tools/libs/ctrl/xc_monitor.c b/tools/libs/ctrl/xc_monitor.c
index 4ac823e775..c5fa62ff30 100644
--- a/tools/libs/ctrl/xc_monitor.c
+++ b/tools/libs/ctrl/xc_monitor.c
@@ -246,6 +246,21 @@ int xc_monitor_emul_unimplemented(xc_interface *xch, uint32_t domain_id,
     return do_domctl(xch, &domctl);
 }
 
+int xc_monitor_vmexit(xc_interface *xch, uint32_t domain_id, bool enable,
+                      bool sync)
+{
+    DECLARE_DOMCTL;
+
+    domctl.cmd = XEN_DOMCTL_monitor_op;
+    domctl.domain = domain_id;
+    domctl.u.monitor_op.op = enable ? XEN_DOMCTL_MONITOR_OP_ENABLE
+                                    : XEN_DOMCTL_MONITOR_OP_DISABLE;
+    domctl.u.monitor_op.event = XEN_DOMCTL_MONITOR_EVENT_VMEXIT;
+    domctl.u.monitor_op.u.vmexit.sync = sync;
+
+    return do_domctl(xch, &domctl);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/hvm/monitor.c b/xen/arch/x86/hvm/monitor.c
index b44a1e1dfe..64a38e8fa7 100644
--- a/xen/arch/x86/hvm/monitor.c
+++ b/xen/arch/x86/hvm/monitor.c
@@ -328,6 +328,24 @@ bool hvm_monitor_check_p2m(unsigned long gla, gfn_t gfn, uint32_t pfec,
     return monitor_traps(curr, true, &req) >= 0;
 }
 
+int hvm_monitor_vmexit(unsigned long exit_reason,
+                       unsigned long exit_qualification)
+{
+    struct vcpu *curr = current;
+    struct arch_domain *ad = &curr->domain->arch;
+    vm_event_request_t req = {};
+
+    ASSERT(ad->monitor.vmexit_enabled);
+
+    req.reason = VM_EVENT_REASON_VMEXIT;
+    req.u.vmexit.reason = exit_reason;
+    req.u.vmexit.qualification = exit_qualification;
+
+    set_npt_base(curr, &req);
+
+    return monitor_traps(curr, ad->monitor.vmexit_sync, &req);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index c075370f64..2794db46f9 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4008,6 +4008,18 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
         }
     }
 
+    if ( unlikely(currd->arch.monitor.vmexit_enabled) )
+    {
+        int rc;
+
+        __vmread(EXIT_QUALIFICATION, &exit_qualification);
+        rc = hvm_monitor_vmexit(exit_reason, exit_qualification);
+        if ( rc < 0 )
+            goto exit_and_crash;
+        if ( rc )
+            return;
+    }
+
     /* XXX: This looks ugly, but we need a mechanism to ensure
      * any pending vmresume has really happened
      */
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index e62e109598..855db352c0 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -430,6 +430,8 @@ struct arch_domain
          */
         unsigned int inguest_pagefault_disabled                            : 1;
         unsigned int control_register_values                               : 1;
+        unsigned int vmexit_enabled                                        : 1;
+        unsigned int vmexit_sync                                           : 1;
         struct monitor_msr_bitmap *msr_bitmap;
         uint64_t write_ctrlreg_mask[4];
     } monitor;
diff --git a/xen/arch/x86/include/asm/hvm/monitor.h b/xen/arch/x86/include/asm/hvm/monitor.h
index a75cd8545c..639f6dfa37 100644
--- a/xen/arch/x86/include/asm/hvm/monitor.h
+++ b/xen/arch/x86/include/asm/hvm/monitor.h
@@ -51,6 +51,8 @@ bool hvm_monitor_emul_unimplemented(void);
 
 bool hvm_monitor_check_p2m(unsigned long gla, gfn_t gfn, uint32_t pfec,
                            uint16_t kind);
+int hvm_monitor_vmexit(unsigned long exit_reason,
+                       unsigned long exit_qualification);
 
 #endif /* __ASM_X86_HVM_MONITOR_H__ */
 
diff --git a/xen/arch/x86/include/asm/monitor.h b/xen/arch/x86/include/asm/monitor.h
index 01c6d63bb9..d8d54c5f23 100644
--- a/xen/arch/x86/include/asm/monitor.h
+++ b/xen/arch/x86/include/asm/monitor.h
@@ -89,7 +89,8 @@ static inline uint32_t arch_monitor_get_capabilities(struct domain *d)
                     (1U << XEN_DOMCTL_MONITOR_EVENT_DEBUG_EXCEPTION) |
                     (1U << XEN_DOMCTL_MONITOR_EVENT_WRITE_CTRLREG) |
                     (1U << XEN_DOMCTL_MONITOR_EVENT_EMUL_UNIMPLEMENTED) |
-                    (1U << XEN_DOMCTL_MONITOR_EVENT_INGUEST_PAGEFAULT));
+                    (1U << XEN_DOMCTL_MONITOR_EVENT_INGUEST_PAGEFAULT) |
+                    (1U << XEN_DOMCTL_MONITOR_EVENT_VMEXIT));
 
     if ( hvm_is_singlestep_supported() )
         capabilities |= (1U << XEN_DOMCTL_MONITOR_EVENT_SINGLESTEP);
diff --git a/xen/arch/x86/monitor.c b/xen/arch/x86/monitor.c
index 3079726a8b..30ca71432c 100644
--- a/xen/arch/x86/monitor.c
+++ b/xen/arch/x86/monitor.c
@@ -332,6 +332,20 @@ int arch_monitor_domctl_event(struct domain *d,
         break;
     }
 
+    case XEN_DOMCTL_MONITOR_EVENT_VMEXIT:
+    {
+        bool old_status = ad->monitor.vmexit_enabled;
+
+        if ( unlikely(old_status == requested_status) )
+            return -EEXIST;
+
+        domain_pause(d);
+        ad->monitor.vmexit_enabled = requested_status;
+        ad->monitor.vmexit_sync = mop->u.vmexit.sync;
+        domain_unpause(d);
+        break;
+    }
+
     default:
         /*
          * Should not be reached unless arch_monitor_get_capabilities() is
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index b85e6170b0..4803ed7afc 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -1057,6 +1057,7 @@ struct xen_domctl_psr_cmt_op {
 #define XEN_DOMCTL_MONITOR_EVENT_EMUL_UNIMPLEMENTED    10
 /* Enabled by default */
 #define XEN_DOMCTL_MONITOR_EVENT_INGUEST_PAGEFAULT     11
+#define XEN_DOMCTL_MONITOR_EVENT_VMEXIT                12
 
 struct xen_domctl_monitor_op {
     uint32_t op; /* XEN_DOMCTL_MONITOR_OP_* */
@@ -1107,6 +1108,11 @@ struct xen_domctl_monitor_op {
             /* Pause vCPU until response */
             uint8_t sync;
         } debug_exception;
+
+        struct {
+            /* Send event and don't process vmexit */
+            uint8_t sync;
+        } vmexit;
     } u;
 };
 
diff --git a/xen/include/public/vm_event.h b/xen/include/public/vm_event.h
index 81c2ee28cc..07f106f811 100644
--- a/xen/include/public/vm_event.h
+++ b/xen/include/public/vm_event.h
@@ -175,6 +175,8 @@
 #define VM_EVENT_REASON_DESCRIPTOR_ACCESS       13
 /* Current instruction is not implemented by the emulator */
 #define VM_EVENT_REASON_EMUL_UNIMPLEMENTED      14
+/* VMEXIT */
+#define VM_EVENT_REASON_VMEXIT                  15
 
 /* Supported values for the vm_event_write_ctrlreg index. */
 #define VM_EVENT_X86_CR0    0
@@ -394,6 +396,11 @@ struct vm_event_emul_insn_data {
     uint8_t data[16]; /* Has to be completely filled */
 };
 
+struct vm_event_vmexit {
+    uint64_t reason;
+    uint64_t qualification;
+};
+
 typedef struct vm_event_st {
     uint32_t version;   /* VM_EVENT_INTERFACE_VERSION */
     uint32_t flags;     /* VM_EVENT_FLAG_* */
@@ -414,6 +421,7 @@ typedef struct vm_event_st {
         struct vm_event_debug                 software_breakpoint;
         struct vm_event_debug                 debug_exception;
         struct vm_event_cpuid                 cpuid;
+        struct vm_event_vmexit                vmexit;
         union {
             struct vm_event_interrupt_x86     x86;
         } interrupt;
-- 
2.25.1


