Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3C07CFB58
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 15:40:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619343.964274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtTG6-0000Jr-Oj; Thu, 19 Oct 2023 13:40:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619343.964274; Thu, 19 Oct 2023 13:40:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtTG6-0000E1-JR; Thu, 19 Oct 2023 13:40:18 +0000
Received: by outflank-mailman (input) for mailman id 619343;
 Thu, 19 Oct 2023 13:40:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cQIi=GB=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qtTG5-0008Uq-3n
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 13:40:17 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08cbf97f-6e85-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 15:40:15 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 85C4A4EE0744;
 Thu, 19 Oct 2023 15:40:14 +0200 (CEST)
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
X-Inumbo-ID: 08cbf97f-6e85-11ee-9b0e-b553b5be7939
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [XEN PATCH][for-4.19 v3 3/8] x86: add deviation comments for  asm-only functions
Date: Thu, 19 Oct 2023 15:40:01 +0200
Message-Id: <2e7d4a55c3b6c317fd00e8ce32f992af423193f1.1697722648.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697722648.git.nicola.vetrini@bugseng.com>
References: <cover.1697722648.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As stated in rules.rst, functions used only in asm code
are allowed to have no prior declaration visible when being
defined, hence these functions are deviated.
This also fixes violations of MISRA C:2012 Rule 8.4.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v3:
- added SAF deviations for vmx counterparts to svm functions.
---
 xen/arch/x86/hvm/svm/intr.c      | 1 +
 xen/arch/x86/hvm/svm/nestedsvm.c | 1 +
 xen/arch/x86/hvm/svm/svm.c       | 2 ++
 xen/arch/x86/hvm/vmx/intr.c      | 1 +
 xen/arch/x86/hvm/vmx/vmx.c       | 2 ++
 xen/arch/x86/hvm/vmx/vvmx.c      | 1 +
 xen/arch/x86/traps.c             | 1 +
 xen/arch/x86/x86_64/traps.c      | 1 +
 8 files changed, 10 insertions(+)

diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
index 192e17ebbfbb..bd9dc560bbc6 100644
--- a/xen/arch/x86/hvm/svm/intr.c
+++ b/xen/arch/x86/hvm/svm/intr.c
@@ -123,6 +123,7 @@ static void svm_enable_intr_window(struct vcpu *v, struct hvm_intack intack)
         vmcb, general1_intercepts | GENERAL1_INTERCEPT_VINTR);
 }
 
+/* SAF-1-safe */
 void svm_intr_assist(void)
 {
     struct vcpu *v = current;
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index a09b6abaaeaf..c80d59e0728e 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -1441,6 +1441,7 @@ nestedsvm_vcpu_vmexit(struct vcpu *v, struct cpu_user_regs *regs,
 }
 
 /* VCPU switch */
+/* SAF-1-safe */
 void nsvm_vcpu_switch(void)
 {
     struct cpu_user_regs *regs = guest_cpu_user_regs();
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 24c417ca7199..40ba69bcdfa1 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1056,6 +1056,7 @@ static void noreturn cf_check svm_do_resume(void)
     reset_stack_and_jump(svm_asm_do_resume);
 }
 
+/* SAF-1-safe */
 void svm_vmenter_helper(void)
 {
     const struct cpu_user_regs *regs = guest_cpu_user_regs();
@@ -2586,6 +2587,7 @@ const struct hvm_function_table * __init start_svm(void)
     return &svm_function_table;
 }
 
+/* SAF-1-safe */
 void svm_vmexit_handler(void)
 {
     struct cpu_user_regs *regs = guest_cpu_user_regs();
diff --git a/xen/arch/x86/hvm/vmx/intr.c b/xen/arch/x86/hvm/vmx/intr.c
index fd719c4c01d2..1805aafb086d 100644
--- a/xen/arch/x86/hvm/vmx/intr.c
+++ b/xen/arch/x86/hvm/vmx/intr.c
@@ -224,6 +224,7 @@ void vmx_sync_exit_bitmap(struct vcpu *v)
     }
 }
 
+/* SAF-1-safe */
 void vmx_intr_assist(void)
 {
     struct hvm_intack intack;
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 1edc7f1e919f..0936a263154e 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4035,6 +4035,7 @@ static void undo_nmis_unblocked_by_iret(void)
               guest_info | VMX_INTR_SHADOW_NMI);
 }
 
+/* SAF-1-safe */
 void vmx_vmexit_handler(struct cpu_user_regs *regs)
 {
     unsigned long exit_qualification, exit_reason, idtv_info, intr_info = 0;
@@ -4787,6 +4788,7 @@ static void lbr_fixup(void)
 }
 
 /* Returns false if the vmentry has to be restarted */
+/* SAF-1-safe */
 bool vmx_vmenter_helper(const struct cpu_user_regs *regs)
 {
     struct vcpu *curr = current;
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index 16b0ef82b6c8..99d93b869307 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -1490,6 +1490,7 @@ static void nvmx_eptp_update(void)
     __vmwrite(EPT_POINTER, get_shadow_eptp(curr));
 }
 
+/* SAF-1-safe */
 void nvmx_switch_guest(void)
 {
     struct vcpu *v = current;
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index e1356f696aba..6af35a468199 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -2265,6 +2265,7 @@ void asm_domain_crash_synchronous(unsigned long addr)
 }
 
 #ifdef CONFIG_DEBUG
+/* SAF-1-safe */
 void check_ist_exit(const struct cpu_user_regs *regs, bool ist_exit)
 {
     const unsigned int ist_mask =
diff --git a/xen/arch/x86/x86_64/traps.c b/xen/arch/x86/x86_64/traps.c
index e03e80813e36..5963d26d7848 100644
--- a/xen/arch/x86/x86_64/traps.c
+++ b/xen/arch/x86/x86_64/traps.c
@@ -266,6 +266,7 @@ void show_page_walk(unsigned long addr)
            l1_table_offset(addr), l1e_get_intpte(l1e), pfn);
 }
 
+/* SAF-1-safe */
 void do_double_fault(struct cpu_user_regs *regs)
 {
     unsigned int cpu;
-- 
2.34.1


