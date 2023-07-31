Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6689E768EEA
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 09:34:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572770.896830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQNQH-0000UC-0t; Mon, 31 Jul 2023 07:34:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572770.896830; Mon, 31 Jul 2023 07:34:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQNQG-0000S6-R1; Mon, 31 Jul 2023 07:34:32 +0000
Received: by outflank-mailman (input) for mailman id 572770;
 Mon, 31 Jul 2023 07:34:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wefb=DR=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qQNQE-0008M2-SS
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 07:34:30 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aee74a22-2f74-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 09:34:29 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id C3C774EE0742;
 Mon, 31 Jul 2023 09:34:27 +0200 (CEST)
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
X-Inumbo-ID: aee74a22-2f74-11ee-8613-37d641c3527e
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 3/4] x86emul: avoid shadowing to address MISRA C:2012 Rule 5.3
Date: Mon, 31 Jul 2023 09:33:40 +0200
Message-Id: <951f634fe058ce56791f3e67f011a2218db6626d.1690788513.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690788513.git.nicola.vetrini@bugseng.com>
References: <cover.1690788513.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rule 5.3 has the following headline:
"An identifier declared in an inner scope shall not hide an
identifier declared in an outer scope"

The declaration of local variable 'cpuid_leaf' causes
shadowing with the homonymous function to happen, therefore
the variable is renamed to avoid this.

No functional changes.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v2:
- s/res/leaf/ to have a less generic name.
- Split the patch in half (see patch 4/4).
---
 xen/arch/x86/x86_emulate/x86_emulate.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index 2de1be7996..f811c1c76b 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -1483,7 +1483,7 @@ x86_emulate(
     {
         enum x86_segment seg;
         struct segment_register cs, sreg;
-        struct cpuid_leaf cpuid_leaf;
+        struct cpuid_leaf leaf;
         uint64_t msr_val;
         unsigned int i, n;
         unsigned long dummy;
@@ -5024,13 +5024,13 @@ x86_emulate(
         generate_exception_if((msr_val & MSR_MISC_FEATURES_CPUID_FAULTING),
                               X86_EXC_GP, 0); /* Faulting active? (Inc. CPL test) */

-        rc = ops->cpuid(_regs.eax, _regs.ecx, &cpuid_leaf, ctxt);
+        rc = ops->cpuid(_regs.eax, _regs.ecx, &leaf, ctxt);
         if ( rc != X86EMUL_OKAY )
             goto done;
-        _regs.r(ax) = cpuid_leaf.a;
-        _regs.r(bx) = cpuid_leaf.b;
-        _regs.r(cx) = cpuid_leaf.c;
-        _regs.r(dx) = cpuid_leaf.d;
+        _regs.r(ax) = leaf.a;
+        _regs.r(bx) = leaf.b;
+        _regs.r(cx) = leaf.c;
+        _regs.r(dx) = leaf.d;
         break;

     case X86EMUL_OPC(0x0f, 0xa3): bt: /* bt */
--
2.34.1

