Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6684776519C
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 12:48:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571010.893831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOyXv-00086k-RO; Thu, 27 Jul 2023 10:48:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571010.893831; Thu, 27 Jul 2023 10:48:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOyXv-00082V-O2; Thu, 27 Jul 2023 10:48:39 +0000
Received: by outflank-mailman (input) for mailman id 571010;
 Thu, 27 Jul 2023 10:48:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mGGP=DN=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qOyXu-00072A-EH
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 10:48:38 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 244a3d2d-2c6b-11ee-b247-6b7b168915f2;
 Thu, 27 Jul 2023 12:48:37 +0200 (CEST)
Received: from nico.bugseng.com (unknown [37.161.207.213])
 by support.bugseng.com (Postfix) with ESMTPSA id B13644EE0744;
 Thu, 27 Jul 2023 12:48:36 +0200 (CEST)
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
X-Inumbo-ID: 244a3d2d-2c6b-11ee-b247-6b7b168915f2
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
Subject: [XEN PATCH 4/4] x86: avoid shadowing to address MISRA C:2012 Rule 5.3
Date: Thu, 27 Jul 2023 12:48:02 +0200
Message-Id: <10606d7429239b5a2b7dffcb22eeb1ce5e73e991.1690449587.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690449587.git.nicola.vetrini@bugseng.com>
References: <cover.1690449587.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rule 5.3 has the following headline:
"An identifier declared in an inner scope shall not hide an
identifier declared in an outer scope"

The declaration of local variable 'cpuid_leaf' causes
shadowing with the homonymous function to happen, therefore
the variable is renamed to avoid this.

Local variable 'cr4' that shadows a previous declaration is
removed, as it is unnecessary and doing so does not alter the
semantics.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/x86_emulate/x86_emulate.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index 2de1be7996..9403beb20f 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -1483,7 +1483,7 @@ x86_emulate(
     {
         enum x86_segment seg;
         struct segment_register cs, sreg;
-        struct cpuid_leaf cpuid_leaf;
+        struct cpuid_leaf res;
         uint64_t msr_val;
         unsigned int i, n;
         unsigned long dummy;
@@ -5024,13 +5024,13 @@ x86_emulate(
         generate_exception_if((msr_val & MSR_MISC_FEATURES_CPUID_FAULTING),
                               X86_EXC_GP, 0); /* Faulting active? (Inc. CPL test) */
 
-        rc = ops->cpuid(_regs.eax, _regs.ecx, &cpuid_leaf, ctxt);
+        rc = ops->cpuid(_regs.eax, _regs.ecx, &res, ctxt);
         if ( rc != X86EMUL_OKAY )
             goto done;
-        _regs.r(ax) = cpuid_leaf.a;
-        _regs.r(bx) = cpuid_leaf.b;
-        _regs.r(cx) = cpuid_leaf.c;
-        _regs.r(dx) = cpuid_leaf.d;
+        _regs.r(ax) = res.a;
+        _regs.r(bx) = res.b;
+        _regs.r(cx) = res.c;
+        _regs.r(dx) = res.d;
         break;
 
     case X86EMUL_OPC(0x0f, 0xa3): bt: /* bt */
@@ -8408,8 +8408,6 @@ x86_emulate(
         generate_exception(X86_EXC_MF);
     if ( stub_exn.info.fields.trapnr == X86_EXC_XM )
     {
-        unsigned long cr4;
-
         if ( !ops->read_cr || ops->read_cr(4, &cr4, ctxt) != X86EMUL_OKAY )
             cr4 = X86_CR4_OSXMMEXCPT;
         generate_exception(cr4 & X86_CR4_OSXMMEXCPT ? X86_EXC_XM : X86_EXC_UD);
-- 
2.34.1


