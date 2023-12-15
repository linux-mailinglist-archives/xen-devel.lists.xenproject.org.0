Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCA9814467
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 10:27:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654976.1022573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE4T6-0005KD-MC; Fri, 15 Dec 2023 09:26:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654976.1022573; Fri, 15 Dec 2023 09:26:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE4T6-0005HT-JJ; Fri, 15 Dec 2023 09:26:52 +0000
Received: by outflank-mailman (input) for mailman id 654976;
 Fri, 15 Dec 2023 09:26:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cTjp=H2=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rE4T5-0005HN-At
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 09:26:51 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 135426b2-9b2c-11ee-98ea-6d05b1d4d9a1;
 Fri, 15 Dec 2023 10:26:50 +0100 (CET)
Received: from Dell.bugseng.com (unknown [37.160.44.52])
 by support.bugseng.com (Postfix) with ESMTPSA id 9BF6E4EE073C;
 Fri, 15 Dec 2023 10:26:48 +0100 (CET)
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
X-Inumbo-ID: 135426b2-9b2c-11ee-98ea-6d05b1d4d9a1
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
Date: Fri, 15 Dec 2023 10:26:28 +0100
Message-Id: <7b07ed4a2a87c2774b469eb0fa280c19f945b3a4.1702631924.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C:2012 Rule 16.3 states that an unconditional break statement
shall terminate every switch-clause.

Update ECLAIR configuration to take into account:
  - continue, goto, return statements;
  - functions that do not give the control back;
  - fallthrough pseudo-keyword;
  - macro BUG();
  - comments.

Update docs/misra/deviations.rst accordingly.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 .../eclair_analysis/ECLAIR/deviations.ecl     | 28 +++++++++++++++++++
 docs/misra/deviations.rst                     | 28 +++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 683f2bbfe8..e27d840fe4 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -327,6 +327,34 @@ therefore have the same behavior of a boolean"
 -config=MC3R1.R14.4,etypes+={deliberate, "stmt(child(cond,child(expr,ref(^<?domain>?::is_dying$))))","src_type(enum)"}
 -doc_end
 
+#
+# Series 16.
+#
+
+-doc_begin="Switch clauses ending with continue, goto, return statements are
+safe."
+-config=MC3R1.R16.3,terminals+={safe, "node(continue_stmt||goto_stmt||return_stmt)"}
+-doc_end
+
+-doc_begin="Switch clauses ending with a call to a function that does not give
+the control back are safe."
+-config=MC3R1.R16.3,terminals+={safe, "call(property(noreturn))"}
+-doc_end
+
+-doc_begin="Switch clauses ending with pseudo-keyword \"fallthrough\" are
+safe."
+-config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(/fallthrough;/))))"}
+-doc_end
+
+-doc_begin="Switch clauses ending with failure method \"BUG()\" are safe."
+-config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(/BUG\\(\\);/))))"}
+-doc_end
+
+-doc_begin="Switch clauses not ending with the break statement are safe if an
+explicit comment indicating the fallthrough intention is present."
+-config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(^(?s).*/\\* [fF]all ?through.? \\*/.*$,0..1))))"}
+-doc_end
+
 #
 # Series 20.
 #
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index eda3c8100c..d593be81b9 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -276,6 +276,34 @@ Deviations related to MISRA C:2012 Rules:
        therefore have the same behavior of a boolean.
      - Project-wide deviation; tagged as `deliberate` for ECLAIR.
 
+   * - R16.3
+     - Switch clauses ending with continue, goto, return statements are safe.
+     - Tagged as `safe` for ECLAIR.
+
+   * - R16.3
+     - Switch clauses ending with a call to a function that does not give
+       the control back are safe.
+     - Tagged as `safe` for ECLAIR.
+
+   * - R16.3
+     - Switch clauses ending with failure method \"BUG()\" are safe.
+     - Tagged as `safe` for ECLAIR.
+
+   * - R16.3
+     - Existing switch clauses not ending with the break statement are safe if
+       an explicit comment indicating the fallthrough intention is present.
+       However, the use of such comments in new code is deprecated:
+       pseudo-keyword "fallthrough" shall be used.
+     - Tagged as `safe` for ECLAIR. The accepted comments are:
+         - /\* fall through \*/
+         - /\* fall through. \*/
+         - /\* fallthrough \*/
+         - /\* fallthrough. \*/
+         - /\* Fall through \*/
+         - /\* Fall through. \*/
+         - /\* Fallthrough \*/
+         - /\* Fallthrough. \*/
+
    * - R20.7
      - Code violating Rule 20.7 is safe when macro parameters are used:
        (1) as function arguments;
-- 
2.34.1


