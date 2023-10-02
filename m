Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 828B27B4CD0
	for <lists+xen-devel@lfdr.de>; Mon,  2 Oct 2023 09:50:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611145.950597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnDgu-0007LH-CH; Mon, 02 Oct 2023 07:50:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611145.950597; Mon, 02 Oct 2023 07:50:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnDgu-0007JX-7D; Mon, 02 Oct 2023 07:50:08 +0000
Received: by outflank-mailman (input) for mailman id 611145;
 Mon, 02 Oct 2023 07:50:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uL8T=FQ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qnDgs-0006dn-0d
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 07:50:06 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4bcd8670-60f8-11ee-9b0d-b553b5be7939;
 Mon, 02 Oct 2023 09:50:03 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 741074EE0C87;
 Mon,  2 Oct 2023 09:50:03 +0200 (CEST)
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
X-Inumbo-ID: 4bcd8670-60f8-11ee-9b0d-b553b5be7939
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
	Henry.Wang@arm.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 3/7] x86: add deviation comments for  asm-only functions
Date: Mon,  2 Oct 2023 09:49:46 +0200
Message-Id: <cf9012d5e4fbe514e9cce3f0074b1a87df505bc0.1696232393.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696232393.git.nicola.vetrini@bugseng.com>
References: <cover.1696232393.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As stated in rules.rst, functions used only in asm code
are allowed to have no prior declaration visible when being
defined, hence these functions are deviated.
This also fixes violations of MISRA C:2012 Rule 8.4.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/hvm/svm/intr.c      | 1 +
 xen/arch/x86/hvm/svm/nestedsvm.c | 1 +
 xen/arch/x86/hvm/svm/svm.c       | 2 ++
 xen/arch/x86/traps.c             | 1 +
 xen/arch/x86/x86_64/traps.c      | 1 +
 5 files changed, 6 insertions(+)

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
index beb076ea8d62..b9fabd45a119 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1044,6 +1044,7 @@ static void noreturn cf_check svm_do_resume(void)
     reset_stack_and_jump(svm_asm_do_resume);
 }
 
+/* SAF-1-safe */
 void svm_vmenter_helper(void)
 {
     const struct cpu_user_regs *regs = guest_cpu_user_regs();
@@ -2574,6 +2575,7 @@ const struct hvm_function_table * __init start_svm(void)
     return &svm_function_table;
 }
 
+/* SAF-1-safe */
 void svm_vmexit_handler(void)
 {
     struct cpu_user_regs *regs = guest_cpu_user_regs();
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 0a005f088bca..f27ddb728b2c 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -2260,6 +2260,7 @@ void asm_domain_crash_synchronous(unsigned long addr)
 }
 
 #ifdef CONFIG_DEBUG
+/* SAF-1-safe */
 void check_ist_exit(const struct cpu_user_regs *regs, bool ist_exit)
 {
     const unsigned int ist_mask =
diff --git a/xen/arch/x86/x86_64/traps.c b/xen/arch/x86/x86_64/traps.c
index f4d17b483032..bcb7559b21c3 100644
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


