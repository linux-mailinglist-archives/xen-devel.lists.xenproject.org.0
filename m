Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 881198D175E
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2024 11:39:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731058.1136387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBtIa-0000oD-RY; Tue, 28 May 2024 09:39:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731058.1136387; Tue, 28 May 2024 09:39:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBtIa-0000lL-Of; Tue, 28 May 2024 09:39:16 +0000
Received: by outflank-mailman (input) for mailman id 731058;
 Tue, 28 May 2024 09:39:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FWDT=M7=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sBtIZ-0000X2-AL
 for xen-devel@lists.xenproject.org; Tue, 28 May 2024 09:39:15 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24f36bf4-1cd6-11ef-90a1-e314d9c70b13;
 Tue, 28 May 2024 11:39:14 +0200 (CEST)
Received: from truciolo.bugseng.com (unknown [78.210.197.134])
 by support.bugseng.com (Postfix) with ESMTPSA id 53D754EE073F;
 Tue, 28 May 2024 11:39:11 +0200 (CEST)
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
X-Inumbo-ID: 24f36bf4-1cd6-11ef-90a1-e314d9c70b13
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
	Julien Grall <julien@xen.org>
Subject: [XEN PATCH] automation/eclair: extend and modifiy existing deviations of MISRA C:2012 Rule 16.3
Date: Tue, 28 May 2024 11:39:03 +0200
Message-Id: <f65f0e884038773952d50e35552bb97c6ae8ea19.1716888049.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update ECLAIR configuration to deviate more cases where an
unintentional fallthrough cannot happen.

Add Rule 16.3 to the monitored set and tag as clean for arm.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
In previous discussions about Rule 16.3, the preference expressed was to deviate
cases where a fallthrough cannot occur (rather that refactoring the code).
---
 .../eclair_analysis/ECLAIR/deviations.ecl     | 30 ++++++++++++++-----
 .../eclair_analysis/ECLAIR/monitored.ecl      |  1 +
 automation/eclair_analysis/ECLAIR/tagging.ecl |  2 +-
 docs/misra/deviations.rst                     | 28 +++++++++++++++--
 4 files changed, 49 insertions(+), 12 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index cf62a874d9..95f07718ba 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -364,14 +364,29 @@ therefore it is deemed better to leave such files as is."
 -config=MC3R1.R16.2,reports+={deliberate, "any_area(any_loc(file(x86_emulate||x86_svm_emulate)))"}
 -doc_end
 
--doc_begin="Switch clauses ending with continue, goto, return statements are
-safe."
--config=MC3R1.R16.3,terminals+={safe, "node(continue_stmt||goto_stmt||return_stmt)"}
+-doc_begin="Statements that change the control flow (i.e., break, continue, goto, return) and calls to functions that does not return the control back are \"allowed terminal statements\"."
+-stmt_selector+={r16_3_allowed_terminal, "node(break_stmt||continue_stmt||goto_stmt||return_stmt)||call(property(noreturn))"}
+-config=MC3R1.R16.3,terminals+={safe, "r16_3_allowed_terminal"}
+-doc_end
+
+-doc_begin="An if-else statement having both branches ending with an allowed terminal statement is itself an allowed terminal statement."
+-stmt_selector+={r16_3_if, "node(if_stmt)&&(child(then,r16_3_allowed_terminal)||child(then,any_stmt(stmt,-1,r16_3_allowed_terminal)))"}
+-stmt_selector+={r16_3_else, "node(if_stmt)&&(child(else,r16_3_allowed_terminal)||child(else,any_stmt(stmt,-1,r16_3_allowed_terminal)))"}
+-stmt_selector+={r16_3_if_else, "r16_3_if&&r16_3_else"}
+-config=MC3R1.R16.3,terminals+={safe, "r16_3_if_else"}
+-doc_end
+
+-doc_begin="An if-else statement having an always true condition and the true branch ending with an allowed terminal statement is itself an allowed terminal statement."
+-stmt_selector+={r16_3_if_true, "r16_3_if&&child(cond,definitely_in(1..))"}
+-config=MC3R1.R16.3,terminals+={safe, "r16_3_if_true"}
+-doc_end
+
+-doc_begin="Switch clauses ending with a statement expression which, in turn, ends with an allowed terminal statement are safe."
+-config=MC3R1.R16.3,terminals+={safe, "node(stmt_expr)&&child(stmt,node(compound_stmt)&&any_stmt(stmt,-1,r16_3_allowed_terminal||r16_3_if_else||r16_3_if_true))"}
 -doc_end
 
--doc_begin="Switch clauses ending with a call to a function that does not give
-the control back (i.e., a function with attribute noreturn) are safe."
--config=MC3R1.R16.3,terminals+={safe, "call(property(noreturn))"}
+-doc_begin="Switch clauses ending with a do-while-false which, in turn, ends with an allowed terminal statement are safe, except for debug macro ASSERT_UNREACHABLE()."
+-config=MC3R1.R16.3,terminals+={safe, "!macro(name(ASSERT_UNREACHABLE))&&node(do_stmt)&&child(cond,definitely_in(0))&&child(body,any_stmt(stmt,-1,r16_3_allowed_terminal||r16_3_if_else||r16_3_if_true))"}
 -doc_end
 
 -doc_begin="Switch clauses ending with pseudo-keyword \"fallthrough\" are
@@ -383,8 +398,7 @@ safe."
 -config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(/BUG\\(\\);/))))"}
 -doc_end
 
--doc_begin="Switch clauses not ending with the break statement are safe if an
-explicit comment indicating the fallthrough intention is present."
+-doc_begin="Switch clauses ending with an explicit comment indicating the fallthrough intention is present are safe."
 -config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(^(?s).*/\\* [fF]all ?through.? \\*/.*$,0..1))))"}
 -doc_end
 
diff --git a/automation/eclair_analysis/ECLAIR/monitored.ecl b/automation/eclair_analysis/ECLAIR/monitored.ecl
index 4daecb0c83..45a60074f9 100644
--- a/automation/eclair_analysis/ECLAIR/monitored.ecl
+++ b/automation/eclair_analysis/ECLAIR/monitored.ecl
@@ -22,6 +22,7 @@
 -enable=MC3R1.R14.1
 -enable=MC3R1.R14.4
 -enable=MC3R1.R16.2
+-enable=MC3R1.R16.3
 -enable=MC3R1.R16.6
 -enable=MC3R1.R16.7
 -enable=MC3R1.R17.1
diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
index a354ff322e..07de2e7b65 100644
--- a/automation/eclair_analysis/ECLAIR/tagging.ecl
+++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
@@ -105,7 +105,7 @@ if(string_equal(target,"x86_64"),
 )
 
 if(string_equal(target,"arm64"),
-    service_selector({"additional_clean_guidelines","MC3R1.R14.4||MC3R1.R16.6||MC3R1.R20.12||MC3R1.R2.1||MC3R1.R5.3||MC3R1.R7.2||MC3R1.R7.3||MC3R1.R8.6||MC3R1.R9.3"})
+    service_selector({"additional_clean_guidelines","MC3R1.R14.4||MC3R1.R16.3||MC3R1.R16.6||MC3R1.R20.12||MC3R1.R2.1||MC3R1.R5.3||MC3R1.R7.2||MC3R1.R7.3||MC3R1.R8.6||MC3R1.R9.3"})
 )
 
 -reports+={clean:added,"service(clean_guidelines_common||additional_clean_guidelines)"}
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 36959aa44a..88164fb0e1 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -309,12 +309,34 @@ Deviations related to MISRA C:2012 Rules:
      - Tagged as `deliberate` for ECLAIR.
 
    * - R16.3
-     - Switch clauses ending with continue, goto, return statements are safe.
+     - Statements that change the control flow (i.e., break, continue, goto,
+       return) and calls to functions that does not return the control back are
+       \"allowed terminal statements\".
      - Tagged as `safe` for ECLAIR.
 
    * - R16.3
-     - Switch clauses ending with a call to a function that does not give
-       the control back (i.e., a function with attribute noreturn) are safe.
+     - An if-else statement having both branches ending with one of the allowed
+       terminal statemets is itself an allowed terminal statements.
+     - Tagged as `safe` for ECLAIR.
+
+   * - R16.3
+     - An if-else statement having an always true condition and the true
+       branch ending with an allowed terminal statement is itself an allowed
+       terminal statement.
+     - Tagged as `safe` for ECLAIR.
+
+   * - R16.3
+     - Switch clauses ending with a statement expression which, in turn, ends
+       with an allowed terminal statement are safe (e.g., the expansion of
+       generate_exception()).
+     - Tagged as `safe` for ECLAIR.
+
+   * - R16.3
+     - Switch clauses ending with a do-while-false which, in turn, ends with an
+       allowed terminal statement are safe (e.g., PARSE_ERR_RET()).
+       Being ASSERT_UNREACHABLE() a construct that is effective in debug builds
+       only, it is not considered as an allowed terminal statement, despite its
+       definition.
      - Tagged as `safe` for ECLAIR.
 
    * - R16.3
-- 
2.34.1


