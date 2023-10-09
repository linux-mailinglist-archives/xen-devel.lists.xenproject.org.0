Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 922CD7BD3E3
	for <lists+xen-devel@lfdr.de>; Mon,  9 Oct 2023 08:55:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614146.955094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpkAU-0005z0-RH; Mon, 09 Oct 2023 06:55:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614146.955094; Mon, 09 Oct 2023 06:55:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpkAU-0005rg-M3; Mon, 09 Oct 2023 06:55:06 +0000
Received: by outflank-mailman (input) for mailman id 614146;
 Mon, 09 Oct 2023 06:55:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o9Np=FX=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qpkAS-0005gg-Rx
 for xen-devel@lists.xenproject.org; Mon, 09 Oct 2023 06:55:04 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c42bf46e-6670-11ee-9b0d-b553b5be7939;
 Mon, 09 Oct 2023 08:55:01 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 70A6D4EE0744;
 Mon,  9 Oct 2023 08:54:59 +0200 (CEST)
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
X-Inumbo-ID: c42bf46e-6670-11ee-9b0d-b553b5be7939
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
Subject: [XEN PATCH v2 2/7] x86: add deviations for variables only used in asm code
Date: Mon,  9 Oct 2023 08:54:47 +0200
Message-Id: <5131b75996d0b91d4a98466f11dd927be910d7e5.1696833629.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696833629.git.nicola.vetrini@bugseng.com>
References: <cover.1696833629.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These variables are only used by asm code, and therefore
the lack of a declaration is justified by the corresponding
deviation comment.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/arch/x86/include/asm/asm_defns.h | 1 +
 xen/arch/x86/setup.c                 | 1 +
 2 files changed, 2 insertions(+)

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
index 08ba1f95d635..7e2979f419af 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -153,6 +153,7 @@ char __section(".init.bss.stack_aligned") __aligned(STACK_SIZE)
 void *stack_start = cpu0_stack + STACK_SIZE - sizeof(struct cpu_info);

 /* Used by the boot asm to stash the relocated multiboot info pointer. */
+/* SAF-1-safe */
 unsigned int __initdata multiboot_ptr;

 struct cpuinfo_x86 __read_mostly boot_cpu_data = { 0, 0, 0, 0, -1 };
--
2.34.1

