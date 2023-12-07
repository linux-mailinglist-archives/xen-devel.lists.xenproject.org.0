Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7028083F6
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 10:11:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649649.1014418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBAPm-0005w2-Ao; Thu, 07 Dec 2023 09:11:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649649.1014418; Thu, 07 Dec 2023 09:11:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBAPm-0005uK-7D; Thu, 07 Dec 2023 09:11:26 +0000
Received: by outflank-mailman (input) for mailman id 649649;
 Thu, 07 Dec 2023 09:11:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZB3o=HS=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rBAPk-0005uE-Q1
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 09:11:24 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 974d5f29-94e0-11ee-9b0f-b553b5be7939;
 Thu, 07 Dec 2023 10:11:22 +0100 (CET)
Received: from Dell.bugseng.com (unknown [78.210.131.21])
 by support.bugseng.com (Postfix) with ESMTPSA id C631F4EE073A;
 Thu,  7 Dec 2023 10:11:20 +0100 (CET)
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
X-Inumbo-ID: 974d5f29-94e0-11ee-9b0f-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH] automation/eclair: add deviations for MISRA C:2012 Rule 16.3
Date: Thu,  7 Dec 2023 10:08:46 +0100
Message-Id: <4fa08aaed77d2b68db39ce51beef29820f1ba9b0.1701940034.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C:2012 Rule 16.3 states that an unconditional break statement
shall terminate every switch-clause.

Update ECLAIR configuration to take into account:
- continue, goto, return statements;
- functions and macros that do not give the control back;
- fallthrough comments and pseudo-keywords.

Update docs/misra/deviations.rst accordingly.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 .../eclair_analysis/ECLAIR/deviations.ecl     | 18 ++++++++++++++
 docs/misra/deviations.rst                     | 24 +++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index b0c79741b5..df0b58a010 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -321,6 +321,24 @@ statements are deliberate"
 -config=MC3R1.R14.3,statements={deliberate , "wrapped(any(),node(if_stmt))" }
 -doc_end
 
+#
+# Series 16.
+#
+
+-doc_begin="Switch clauses ending with continue, goto, return statements are safe."
+-config=MC3R1.R16.3,terminals+={safe, "node(continue_stmt||goto_stmt||return_stmt)"}
+-doc_end
+
+-doc_begin="Switch clauses not ending with the break statement are safe if a function/macro that does not give the control back is present."
+-config=MC3R1.R16.3,terminals+={safe, "call(decl(name(__builtin_unreachable||do_unexpected_trap||fatal_trap||machine_halt||machine_restart||maybe_reboot||panic)))"}
+-config=MC3R1.R16.3,terminals+={safe,"macro(name(BUG||BUG_ON))"}
+-doc_end
+
+-doc_begin="Switch clauses not ending with the break statement are safe if an explicit comment or pseudo-keyword indicating the fallthrough intention is present."
+-config=MC3R1.R16.3,reports+={safe, "any_area(any_loc(any_exp(text(^(?s).*([fF]all[- ]?[tT]hrough|FALL[- ]?THROUGH).*$,0..1))))"}
+-config=MC3R1.R16.3,reports+={safe, "any_area(text(^(?s).*([fF]all[- ]?[tT]hrough|FALL[- ]?THROUGH).*$,0..1))"}
+-doc_end
+
 #
 # Series 20.
 #
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 6e7c4f25b8..fecd2bae8e 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -270,6 +270,30 @@ Deviations related to MISRA C:2012 Rules:
        statements are deliberate.
      - Project-wide deviation; tagged as `disapplied` for ECLAIR.
 
+   * - R16.3
+     - Switch clauses ending with continue, goto, return statements are safe.
+     - Tagged as `safe` for ECLAIR.
+
+   * - R16.3
+     - Switch clauses not ending with the break statement are safe if a
+       function/macro that does not give the control back is present.
+     - Tagged as `safe` for ECLAIR, such functions/macros are:
+        - __builtin_unreachable
+        - do_unexpected_trap
+        - fatal_trap
+        - machine_halt
+        - machine_restart
+        - maybe_reboot
+        - panic
+        - BUG
+        - BUG_ON
+
+   * - R16.3
+     - Switch clauses not ending with the break statement are safe if an
+       explicit comment or pseudo-keyword indicating the fallthrough intention
+       is present.
+     - Tagged as `safe` for ECLAIR.
+
    * - R20.7
      - Code violating Rule 20.7 is safe when macro parameters are used:
        (1) as function arguments;
-- 
2.34.1


