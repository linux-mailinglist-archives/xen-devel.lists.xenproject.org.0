Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B954F7DDE69
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 10:31:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626198.976227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7Yp-0000j9-Cx; Wed, 01 Nov 2023 09:30:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626198.976227; Wed, 01 Nov 2023 09:30:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7Yp-0000db-9K; Wed, 01 Nov 2023 09:30:51 +0000
Received: by outflank-mailman (input) for mailman id 626198;
 Wed, 01 Nov 2023 09:30:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QJn5=GO=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qy7Yn-0000L5-LG
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 09:30:49 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5778b6a4-7899-11ee-98d6-6d05b1d4d9a1;
 Wed, 01 Nov 2023 10:30:49 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 370E34EE074E;
 Wed,  1 Nov 2023 10:30:47 +0100 (CET)
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
X-Inumbo-ID: 5778b6a4-7899-11ee-98d6-6d05b1d4d9a1
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
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [XEN PATCH][for-4.19 v6 2/8] x86: add deviation for asm-only functions
Date: Wed,  1 Nov 2023 10:30:31 +0100
Message-Id: <a1b5c3b273145c35535fed3647bf850d9ae5db7f.1698829473.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698829473.git.nicola.vetrini@bugseng.com>
References: <cover.1698829473.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As stated in rules.rst, functions used only in asm modules
are allowed to have no prior declaration visible when being
defined, hence these functions are marked with an
'asmlinkage' macro, which is then deviated for MISRA C:2012
Rule 8.4.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v3:
- added SAF deviations for vmx counterparts to svm functions.
Changes in v5:
- drop SAF deviations in favour of the pseudo-attribute asmlinkage
Changes in v6:
- conditioned asmlinkage definition to make it overridable;
- move the pseudo-attribute after the return type
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 9 +++++++++
 docs/misra/deviations.rst                        | 6 ++++++
 xen/arch/x86/hvm/svm/intr.c                      | 2 +-
 xen/arch/x86/hvm/svm/nestedsvm.c                 | 2 +-
 xen/arch/x86/hvm/svm/svm.c                       | 4 ++--
 xen/arch/x86/hvm/vmx/intr.c                      | 2 +-
 xen/arch/x86/hvm/vmx/vmx.c                       | 4 ++--
 xen/arch/x86/hvm/vmx/vvmx.c                      | 2 +-
 xen/arch/x86/traps.c                             | 2 +-
 xen/arch/x86/x86_64/traps.c                      | 2 +-
 xen/include/xen/compiler.h                       | 5 +++++
 11 files changed, 30 insertions(+), 10 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index fa56e5c00a27..06619ecf7e8d 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -163,6 +163,15 @@ Therefore the absence of prior declarations is safe."
 -config=MC3R1.R8.4,reports+={safe, "first_area(any_loc(file(gcov)))"}
 -doc_end
 
+-doc_begin="Recognize the occurrence of current_stack_pointer as a declaration."
+-file_tag+={asm_defns, "^xen/arch/x86/include/asm/asm_defns\\.h$"}
+-config=MC3R1.R8.4,declarations+={safe, "loc(file(asm_defns))&&^current_stack_pointer$"}
+-doc_end
+
+-doc_begin="asmlinkage is a marker to indicate that the function is only used to interface with asm modules."
+-config=MC3R1.R8.4,declarations+={safe,"loc(text(^(?s).*asmlinkage.*$, -1..0))"}
+-doc_end
+
 -doc_begin="The following variables are compiled in multiple translation units
 belonging to different executables and therefore are safe."
 -config=MC3R1.R8.6,declarations+={safe, "name(current_stack_pointer||bsearch||sort)"}
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 8511a189253b..d468da2f5ce9 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -133,6 +133,12 @@ Deviations related to MISRA C:2012 Rules:
        configuration. Therefore, the absence of prior declarations is safe.
      - Tagged as `safe` for ECLAIR.
 
+   * - R8.4
+     - Functions and variables used only by asm modules are either marked with
+       the `asmlinkage` macro or with a SAF-1-safe textual deviation
+       (see safe.json).
+     - Tagged as `safe` for ECLAIR.
+
    * - R8.6
      - The following variables are compiled in multiple translation units
        belonging to different executables and therefore are safe.
diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
index 192e17ebbfbb..4805c5567213 100644
--- a/xen/arch/x86/hvm/svm/intr.c
+++ b/xen/arch/x86/hvm/svm/intr.c
@@ -123,7 +123,7 @@ static void svm_enable_intr_window(struct vcpu *v, struct hvm_intack intack)
         vmcb, general1_intercepts | GENERAL1_INTERCEPT_VINTR);
 }
 
-void svm_intr_assist(void)
+void asmlinkage svm_intr_assist(void)
 {
     struct vcpu *v = current;
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index a09b6abaaeaf..fc7658d67d4e 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -1441,7 +1441,7 @@ nestedsvm_vcpu_vmexit(struct vcpu *v, struct cpu_user_regs *regs,
 }
 
 /* VCPU switch */
-void nsvm_vcpu_switch(void)
+void asmlinkage nsvm_vcpu_switch(void)
 {
     struct cpu_user_regs *regs = guest_cpu_user_regs();
     struct vcpu *v = current;
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 24c417ca7199..cb8abe7a0066 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1056,7 +1056,7 @@ static void noreturn cf_check svm_do_resume(void)
     reset_stack_and_jump(svm_asm_do_resume);
 }
 
-void svm_vmenter_helper(void)
+void asmlinkage svm_vmenter_helper(void)
 {
     const struct cpu_user_regs *regs = guest_cpu_user_regs();
     struct vcpu *curr = current;
@@ -2586,7 +2586,7 @@ const struct hvm_function_table * __init start_svm(void)
     return &svm_function_table;
 }
 
-void svm_vmexit_handler(void)
+void asmlinkage svm_vmexit_handler(void)
 {
     struct cpu_user_regs *regs = guest_cpu_user_regs();
     uint64_t exit_reason;
diff --git a/xen/arch/x86/hvm/vmx/intr.c b/xen/arch/x86/hvm/vmx/intr.c
index fd719c4c01d2..8beeaab1517b 100644
--- a/xen/arch/x86/hvm/vmx/intr.c
+++ b/xen/arch/x86/hvm/vmx/intr.c
@@ -224,7 +224,7 @@ void vmx_sync_exit_bitmap(struct vcpu *v)
     }
 }
 
-void vmx_intr_assist(void)
+void asmlinkage vmx_intr_assist(void)
 {
     struct hvm_intack intack;
     struct vcpu *v = current;
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 1edc7f1e919f..f5739b3aa5a1 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4035,7 +4035,7 @@ static void undo_nmis_unblocked_by_iret(void)
               guest_info | VMX_INTR_SHADOW_NMI);
 }
 
-void vmx_vmexit_handler(struct cpu_user_regs *regs)
+void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
 {
     unsigned long exit_qualification, exit_reason, idtv_info, intr_info = 0;
     unsigned int vector = 0;
@@ -4787,7 +4787,7 @@ static void lbr_fixup(void)
 }
 
 /* Returns false if the vmentry has to be restarted */
-bool vmx_vmenter_helper(const struct cpu_user_regs *regs)
+bool asmlinkage vmx_vmenter_helper(const struct cpu_user_regs *regs)
 {
     struct vcpu *curr = current;
     struct domain *currd = curr->domain;
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index 16b0ef82b6c8..a28803987af6 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -1490,7 +1490,7 @@ static void nvmx_eptp_update(void)
     __vmwrite(EPT_POINTER, get_shadow_eptp(curr));
 }
 
-void nvmx_switch_guest(void)
+void asmlinkage nvmx_switch_guest(void)
 {
     struct vcpu *v = current;
     struct nestedvcpu *nvcpu = &vcpu_nestedhvm(v);
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index e1356f696aba..6393467b06fd 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -2265,7 +2265,7 @@ void asm_domain_crash_synchronous(unsigned long addr)
 }
 
 #ifdef CONFIG_DEBUG
-void check_ist_exit(const struct cpu_user_regs *regs, bool ist_exit)
+void asmlinkage check_ist_exit(const struct cpu_user_regs *regs, bool ist_exit)
 {
     const unsigned int ist_mask =
         (1U << X86_EXC_NMI) | (1U << X86_EXC_DB) |
diff --git a/xen/arch/x86/x86_64/traps.c b/xen/arch/x86/x86_64/traps.c
index e03e80813e36..668605e5bc67 100644
--- a/xen/arch/x86/x86_64/traps.c
+++ b/xen/arch/x86/x86_64/traps.c
@@ -266,7 +266,7 @@ void show_page_walk(unsigned long addr)
            l1_table_offset(addr), l1e_get_intpte(l1e), pfn);
 }
 
-void do_double_fault(struct cpu_user_regs *regs)
+void asmlinkage do_double_fault(struct cpu_user_regs *regs)
 {
     unsigned int cpu;
     unsigned long crs[8];
diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
index dd99e573083f..94e2d6080d93 100644
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -159,6 +159,11 @@
 # define ASM_FLAG_OUT(yes, no) no
 #endif
 
+/* Mark a function or variable as being used only to interface with asm */
+#ifndef asmlinkage
+#define asmlinkage
+#endif
+
 /*
  * NB: we need to disable the gcc-compat warnings for clang in some places or
  * else it will complain with: "'break' is bound to loop, GCC binds it to
-- 
2.34.1


