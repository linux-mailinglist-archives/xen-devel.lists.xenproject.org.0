Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5964B90408E
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 17:54:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738560.1145399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH3oh-00064o-My; Tue, 11 Jun 2024 15:53:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738560.1145399; Tue, 11 Jun 2024 15:53:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH3oh-0005vr-BO; Tue, 11 Jun 2024 15:53:47 +0000
Received: by outflank-mailman (input) for mailman id 738560;
 Tue, 11 Jun 2024 15:53:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sLxx=NN=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sH3of-0004vT-O1
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 15:53:45 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7aba4e1-280a-11ef-b4bb-af5377834399;
 Tue, 11 Jun 2024 17:53:43 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 1BA284EE0755;
 Tue, 11 Jun 2024 17:53:43 +0200 (CEST)
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
X-Inumbo-ID: c7aba4e1-280a-11ef-b4bb-af5377834399
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH 4/6] x86emul: address violations of MISRA C Rule 20.7
Date: Tue, 11 Jun 2024 17:53:34 +0200
Message-Id: <0a502d2a9c5ce13be13281d9de49d263313b7852.1718117557.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718117557.git.nicola.vetrini@bugseng.com>
References: <cover.1718117557.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C Rule 20.7 states: "Expressions resulting from the expansion
of macro parameters shall be enclosed in parentheses". Therefore, some
macro definitions should gain additional parentheses to ensure that all
current and future users will be safe with respect to expansions that
can possibly alter the semantics of the passed-in macro parameter.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
These local helpers could in principle be deviated, but the readability
and functionality are essentially unchanged by complying with the rule,
so I decided to modify the macro definition as the preferred option.
---
 xen/arch/x86/x86_emulate/x86_emulate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index 2d5c1de8ecc2..9352d341346a 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -2255,7 +2255,7 @@ x86_emulate(
         switch ( modrm_reg & 7 )
         {
 #define GRP2(name, ext) \
-        case ext: \
+        case (ext): \
             if ( ops->rmw && dst.type == OP_MEM ) \
                 state->rmw = rmw_##name; \
             else \
@@ -8611,7 +8611,7 @@ int x86_emul_rmw(
             unsigned long dummy;
 
 #define XADD(sz, cst, mod) \
-        case sz: \
+        case (sz): \
             asm ( "" \
                   COND_LOCK(xadd) " %"#mod"[reg], %[mem]; " \
                   _POST_EFLAGS("[efl]", "[msk]", "[tmp]") \
-- 
2.34.1


