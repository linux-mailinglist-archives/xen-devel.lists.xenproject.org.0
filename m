Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF4B80C69A
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 11:31:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651601.1017386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCdYi-0006yK-5u; Mon, 11 Dec 2023 10:30:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651601.1017386; Mon, 11 Dec 2023 10:30:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCdYh-0006pj-UT; Mon, 11 Dec 2023 10:30:43 +0000
Received: by outflank-mailman (input) for mailman id 651601;
 Mon, 11 Dec 2023 10:30:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BtsV=HW=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rCdYf-0005Em-TF
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 10:30:41 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53a27fd5-9810-11ee-9b0f-b553b5be7939;
 Mon, 11 Dec 2023 11:30:38 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id CF4CE4EE0744;
 Mon, 11 Dec 2023 11:30:37 +0100 (CET)
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
X-Inumbo-ID: 53a27fd5-9810-11ee-9b0f-b553b5be7939
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 7/7] x86/xstate: move BUILD_BUG_ON to address MISRA C:2012 Rule 2.1
Date: Mon, 11 Dec 2023 11:30:28 +0100
Message-Id: <a969550faea681c69730c0968264781f7739670d.1702283415.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702283415.git.nicola.vetrini@bugseng.com>
References: <cover.1702283415.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The string literal inside the expansion of BUILD_BUG_ON is considered
unreachable code; however, such statement can be moved earlier
with no functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
The motivation for this code movement is that keeping it inside the switch
statement matches MISRA's definition of unreachable code, but does not fall into
the category of declarations without initialization, which is already a deviated
aspect. An alternative approach would be to deviate BUILD_BUG_ON as well.
---
 xen/arch/x86/xstate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index cf94761d0542..99f0526c8988 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -396,9 +396,10 @@ void xrstor(struct vcpu *v, uint64_t mask)
      */
     for ( prev_faults = faults = 0; ; prev_faults = faults )
     {
+        BUILD_BUG_ON(sizeof(faults) != 4); /* Clang doesn't support %z in asm. */
+
         switch ( __builtin_expect(ptr->fpu_sse.x[FPU_WORD_SIZE_OFFSET], 8) )
         {
-            BUILD_BUG_ON(sizeof(faults) != 4); /* Clang doesn't support %z in asm. */
 #define _xrstor(insn) \
         asm volatile ( "1: .byte " insn "\n" \
                        "3:\n" \
-- 
2.34.1

