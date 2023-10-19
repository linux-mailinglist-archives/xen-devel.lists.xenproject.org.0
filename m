Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6788D7CFB5A
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 15:40:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619341.964265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtTG6-00007i-50; Thu, 19 Oct 2023 13:40:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619341.964265; Thu, 19 Oct 2023 13:40:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtTG5-0008Vw-Tm; Thu, 19 Oct 2023 13:40:17 +0000
Received: by outflank-mailman (input) for mailman id 619341;
 Thu, 19 Oct 2023 13:40:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cQIi=GB=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qtTG4-0008Uq-EP
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 13:40:16 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08465909-6e85-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 15:40:14 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 4CE9E4EE0741;
 Thu, 19 Oct 2023 15:40:13 +0200 (CEST)
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
X-Inumbo-ID: 08465909-6e85-11ee-9b0e-b553b5be7939
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
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH][for-4.19 v3 2/8] x86: add deviations for variables only used in asm code
Date: Thu, 19 Oct 2023 15:40:00 +0200
Message-Id: <3d4c3f6a1a62acc6c625f32448862a8be47b05aa.1697722648.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697722648.git.nicola.vetrini@bugseng.com>
References: <cover.1697722648.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To avoid a violation of MISRA C:2012 Rule 8.4, as permitted
by docs/misra/rules.rst.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v3:
- Edited commit message
- Add two new variables
---
 xen/arch/x86/include/asm/asm_defns.h | 1 +
 xen/arch/x86/setup.c                 | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/asm_defns.h b/xen/arch/x86/include/asm/asm_defns.h
index baaaccb26e17..a2516de7749b 100644
--- a/xen/arch/x86/include/asm/asm_defns.h
+++ b/xen/arch/x86/include/asm/asm_defns.h
@@ -31,6 +31,7 @@ asm ( "\t.equ CONFIG_INDIRECT_THUNK, "
  * gets set up by the containing function.
  */
 #ifdef CONFIG_FRAME_POINTER
+/* SAF-1-safe */
 register unsigned long current_stack_pointer asm("rsp");
 # define ASM_CALL_CONSTRAINT , "+r" (current_stack_pointer)
 #else
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 08ba1f95d635..4480f08de718 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -75,6 +75,7 @@ static bool __initdata opt_invpcid = true;
 boolean_param("invpcid", opt_invpcid);
 bool __read_mostly use_invpcid;
 
+/* SAF-1-safe Only used in asm code and within this source file */
 unsigned long __read_mostly cr4_pv32_mask;
 
 /* **** Linux config option: propagated to domain0. */
@@ -147,12 +148,13 @@ cpumask_t __read_mostly cpu_present_map;
 unsigned long __read_mostly xen_phys_start;
 
 char __section(".init.bss.stack_aligned") __aligned(STACK_SIZE)
-    cpu0_stack[STACK_SIZE];
+    cpu0_stack[STACK_SIZE]; /* SAF-1-safe Only used in asm code and below */
 
 /* Used by the BSP/AP paths to find the higher half stack mapping to use. */
 void *stack_start = cpu0_stack + STACK_SIZE - sizeof(struct cpu_info);
 
 /* Used by the boot asm to stash the relocated multiboot info pointer. */
+/* SAF-1-safe */
 unsigned int __initdata multiboot_ptr;
 
 struct cpuinfo_x86 __read_mostly boot_cpu_data = { 0, 0, 0, 0, -1 };
-- 
2.34.1


