Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E563176BE6E
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 22:21:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574506.899868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQvs8-0002JF-6m; Tue, 01 Aug 2023 20:21:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574506.899868; Tue, 01 Aug 2023 20:21:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQvs8-0002HO-3K; Tue, 01 Aug 2023 20:21:36 +0000
Received: by outflank-mailman (input) for mailman id 574506;
 Tue, 01 Aug 2023 20:21:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B3Rc=DS=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qQvs6-0000Vh-NB
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 20:21:34 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 015545d7-30a9-11ee-b25c-6b7b168915f2;
 Tue, 01 Aug 2023 22:21:33 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 169092122567987.94507889080217;
 Tue, 1 Aug 2023 13:20:25 -0700 (PDT)
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
X-Inumbo-ID: 015545d7-30a9-11ee-b25c-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1690921227; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eG/Jtj2jjhormLMJ8XaVecZkgDIqh8gVxgA4QY1AJ284PvyjA8JAMQ69PlgD5dj/o9HsZPzDydB1/djt8Thmj1SFXlXELhLph/E0r+BOpyOpze+/57pFXGJiTTCuJiSMro+AHiwzn8HiqoGm0mej89q49uEMansFfQ9fQbqinp8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1690921227; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=svZfhnzIdfl7IZVzuYzxJG9861EfU+6CgnykhTEOAGo=; 
	b=gcq3ynDrvoMA+5ma7mE1tahSxRik03zdp5XIFeYhwZzhONbzcKcZrrHpTDpDTLdQUTLhEWHWSQNSyuIT6hBV8NSIr6hjnnfKnc1VLTpsYm9n7dop2JP9rxGvnT0MkXYHP+pFQrciwPLrXKsc2tsEM1ozQnTMqZvklB+yGqUtZxg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1690921227;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=svZfhnzIdfl7IZVzuYzxJG9861EfU+6CgnykhTEOAGo=;
	b=mSptNUuNqsChDAreussuY050V7fWTUHVOlYiNTMjMZt9oOuskamL7WrMR6aEMIG+
	PLxoMKPl1sBCkvGqp4KDDSrCfqo39vlF7GSYF8CO+SuFfjIe+yVW3iTXp4vRApmrDve
	ZVg5vjrZFJ6bog455l770X5d1NuIuTfiohv1dQBg=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [RFC 6/6] capabilities: convert attach debugger into a capability
Date: Tue,  1 Aug 2023 16:20:06 -0400
Message-Id: <20230801202006.20322-7-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230801202006.20322-1-dpsmith@apertussolutions.com>
References: <20230801202006.20322-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Expresses the ability to attach a debugger as a capability that a domain can be
provisioned.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/hvm/svm/svm.c      |  8 ++++----
 xen/arch/x86/hvm/vmx/realmode.c |  2 +-
 xen/arch/x86/hvm/vmx/vmcs.c     |  2 +-
 xen/arch/x86/hvm/vmx/vmx.c      | 10 +++++-----
 xen/arch/x86/traps.c            |  6 ++++--
 xen/common/domctl.c             |  6 ++++--
 xen/include/xen/sched.h         |  9 ++++++---
 7 files changed, 25 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 27170213ae..9872804d39 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -999,7 +999,7 @@ static void noreturn cf_check svm_do_resume(void)
 {
     struct vcpu *v = current;
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
-    bool debug_state = (v->domain->debugger_attached ||
+    bool debug_state = (domain_has_cap(v->domain, CAP_DEBUGGER_ATTACH) ||
                         v->domain->arch.monitor.software_breakpoint_enabled ||
                         v->domain->arch.monitor.debug_exception_enabled);
     bool_t vcpu_guestmode = 0;
@@ -1335,7 +1335,7 @@ static void cf_check svm_inject_event(const struct x86_event *event)
         }
         /* fall through */
     case X86_EXC_BP:
-        if ( curr->domain->debugger_attached )
+        if ( domain_has_cap(curr->domain, CAP_DEBUGGER_ATTACH) )
         {
             /* Debug/Int3: Trap to debugger. */
             domain_pause_for_debugger();
@@ -2732,7 +2732,7 @@ void svm_vmexit_handler(void)
 
     case VMEXIT_ICEBP:
     case VMEXIT_EXCEPTION_DB:
-        if ( !v->domain->debugger_attached )
+        if ( !domain_has_cap(v->domain, CAP_DEBUGGER_ATTACH) )
         {
             unsigned int trap_type;
 
@@ -2769,7 +2769,7 @@ void svm_vmexit_handler(void)
         if ( insn_len == 0 )
              break;
 
-        if ( v->domain->debugger_attached )
+        if ( domain_has_cap(v->domain, CAP_DEBUGGER_ATTACH) )
         {
             /* AMD Vol2, 15.11: INT3, INTO, BOUND intercepts do not update RIP. */
             __update_guest_eip(regs, insn_len);
diff --git a/xen/arch/x86/hvm/vmx/realmode.c b/xen/arch/x86/hvm/vmx/realmode.c
index ff44ddcfa6..f761026a9d 100644
--- a/xen/arch/x86/hvm/vmx/realmode.c
+++ b/xen/arch/x86/hvm/vmx/realmode.c
@@ -121,7 +121,7 @@ void vmx_realmode_emulate_one(struct hvm_emulate_ctxt *hvmemul_ctxt)
 
     if ( rc == X86EMUL_EXCEPTION )
     {
-        if ( unlikely(curr->domain->debugger_attached) &&
+        if ( unlikely(domain_has_cap(curr->domain, CAP_DEBUGGER_ATTACH)) &&
              ((hvmemul_ctxt->ctxt.event.vector == X86_EXC_DB) ||
               (hvmemul_ctxt->ctxt.event.vector == X86_EXC_BP)) )
         {
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 13719cc923..9474869018 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -1912,7 +1912,7 @@ void cf_check vmx_do_resume(void)
         hvm_asid_flush_vcpu(v);
     }
 
-    debug_state = v->domain->debugger_attached
+    debug_state = domain_has_cap(v->domain, CAP_DEBUGGER_ATTACH)
                   || v->domain->arch.monitor.software_breakpoint_enabled
                   || v->domain->arch.monitor.singlestep_enabled;
 
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 7ec44018d4..5069e3cbf3 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2041,7 +2041,7 @@ static void cf_check vmx_inject_event(const struct x86_event *event)
             break;
         /* fall through */
     case X86_EXC_BP:
-        if ( curr->domain->debugger_attached )
+        if ( domain_has_cap(curr->domain, CAP_DEBUGGER_ATTACH) )
         {
             /* Debug/Int3: Trap to debugger. */
             domain_pause_for_debugger();
@@ -2121,7 +2121,7 @@ static void cf_check vmx_set_info_guest(struct vcpu *v)
      * immediately vmexit and hence make no progress.
      */
     __vmread(GUEST_INTERRUPTIBILITY_INFO, &intr_shadow);
-    if ( v->domain->debugger_attached &&
+    if ( domain_has_cap(v->domain, CAP_DEBUGGER_ATTACH) &&
          (v->arch.user_regs.eflags & X86_EFLAGS_TF) &&
          (intr_shadow & VMX_INTR_SHADOW_STI) )
     {
@@ -4283,7 +4283,7 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
                 }
             }
 
-            if ( !v->domain->debugger_attached )
+            if ( !domain_has_cap(v->domain, CAP_DEBUGGER_ATTACH) )
             {
                 unsigned long insn_len = 0;
                 int rc;
@@ -4307,7 +4307,7 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
             break;
         case X86_EXC_BP:
             HVMTRACE_1D(TRAP, vector);
-            if ( !v->domain->debugger_attached )
+            if ( !domain_has_cap(v->domain, CAP_DEBUGGER_ATTACH) )
             {
                 unsigned long insn_len;
                 int rc;
@@ -4647,7 +4647,7 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
                               HVM_MONITOR_SINGLESTEP_BREAKPOINT,
                               0, 0, 0);
 
-            if ( v->domain->debugger_attached )
+            if ( domain_has_cap(v->domain, CAP_DEBUGGER_ATTACH) )
                 domain_pause_for_debugger();
         }
 
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 4229bda159..041ced35ea 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1214,7 +1214,8 @@ void do_int3(struct cpu_user_regs *regs)
         return;
     }
 
-    if ( guest_kernel_mode(curr, regs) && curr->domain->debugger_attached )
+    if ( guest_kernel_mode(curr, regs) &&
+         domain_has_cap(curr->domain, CAP_DEBUGGER_ATTACH) )
     {
         curr->arch.gdbsx_vcpu_event = X86_EXC_BP;
         domain_pause_for_debugger();
@@ -1995,7 +1996,8 @@ void do_debug(struct cpu_user_regs *regs)
     v->arch.dr6 |= (dr6 & ~X86_DR6_DEFAULT);
     v->arch.dr6 &= (dr6 | ~X86_DR6_DEFAULT);
 
-    if ( guest_kernel_mode(v, regs) && v->domain->debugger_attached )
+    if ( guest_kernel_mode(v, regs) &&
+         domain_has_cap(v->domain, CAP_DEBUGGER_ATTACH) )
     {
         domain_pause_for_debugger();
         return;
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 505e29c0dc..895ddf0600 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -99,7 +99,8 @@ void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info)
         ((d->is_dying == DOMDYING_dead) ? XEN_DOMINF_dying     : 0) |
         (d->is_shut_down                ? XEN_DOMINF_shutdown  : 0) |
         (d->controller_pause_count > 0  ? XEN_DOMINF_paused    : 0) |
-        (d->debugger_attached           ? XEN_DOMINF_debugged  : 0) |
+        (domain_has_cap(d, CAP_DEBUGGER_ATTACH) ?
+                                          XEN_DOMINF_debugged  : 0) |
         (is_xenstore_domain(d)          ? XEN_DOMINF_xs_domain : 0) |
         (is_hvm_domain(d)               ? XEN_DOMINF_hvm_guest : 0) |
         d->shutdown_code << XEN_DOMINF_shutdownshift;
@@ -643,7 +644,8 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         else
         {
             domain_pause(d);
-            d->debugger_attached = !!op->u.setdebugging.enable;
+            if ( !!op->u.setdebugging.enable )
+                domain_set_cap(d, CAP_DEBUGGER_ATTACH);
             domain_unpause(d); /* causes guest to latch new status */
         }
         break;
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index ebfe65cd73..47eadb5008 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -474,9 +474,8 @@ struct domain
     uint8_t          role;
 #define CAP_CONSOLE_IO         (1U<<0)
 #define CAP_DISABLE_CPU_FAULT  (1U<<1)
-    uint8_t          capabilities;
-    /* Is this guest being debugged by dom0? */
-    bool             debugger_attached;
+#define CAP_DEBUGGER_ATTACH    (1U<<2)
+    uint16_t         capabilities;
     /*
      * Set to true at the very end of domain creation, when the domain is
      * unpaused for the first time by the systemcontroller.
@@ -1166,6 +1165,10 @@ static always_inline bool domain_set_cap(
         if ( is_pv_domain(d) && is_control_domain(d) )
             d->capabilities |= cap;
         break;
+    case CAP_DEBUGGER_ATTACH:
+        if ( !is_control_domain(d) )
+            d->capabilities |= cap;
+        break;
     default:
         return false;
     }
-- 
2.20.1


