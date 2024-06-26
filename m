Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA80918262
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 15:29:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748858.1156815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMShw-0003dw-8Z; Wed, 26 Jun 2024 13:29:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748858.1156815; Wed, 26 Jun 2024 13:29:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMShw-0003SD-2t; Wed, 26 Jun 2024 13:29:08 +0000
Received: by outflank-mailman (input) for mailman id 748858;
 Wed, 26 Jun 2024 13:29:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+tE4=N4=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sMShu-00030P-MV
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 13:29:06 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f04c367-33c0-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 15:29:05 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.214])
 by support.bugseng.com (Postfix) with ESMTPSA id 5E24C4EE0754;
 Wed, 26 Jun 2024 15:29:04 +0200 (CEST)
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
X-Inumbo-ID: 0f04c367-33c0-11ef-b4bb-af5377834399
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [XEN PATCH v2 for-4.20 4/7] automation/eclair_analysis: address violations of MISRA C Rule 20.7
Date: Wed, 26 Jun 2024 15:28:50 +0200
Message-Id: <f1876dd0e1c41139fb01443a223723a06af62ede.1719407840.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719407840.git.nicola.vetrini@bugseng.com>
References: <cover.1719407840.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C Rule 20.7 states: "Expressions resulting from the expansion
of macro parameters shall be enclosed in parentheses".

The local helpers GRP2 and XADD in the x86 emulator use their first
argument as the constant expression for a case label. This pattern
is deviated project-wide, because it is very unlikely to induce
developer confusion and result in the wrong control flow being
carried out.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v2:
- Introduce a deviation instead of adding parentheses
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 6 ++++--
 docs/misra/deviations.rst                        | 3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index dcff4f40136c..d12be858fe84 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -458,13 +458,15 @@ unexpected result when the structure is given as argument to a sizeof() operator
 
 -doc_begin="Code violating Rule 20.7 is safe when macro parameters are used: (1)
 as function arguments; (2) as macro arguments; (3) as array indices; (4) as lhs
-in assignments; (5) as initializers, possibly designated, in initalizer lists."
+in assignments; (5) as initializers, possibly designated, in initalizer lists;
+(6) as the constant expression in a switch clause label."
 -config=MC3R1.R20.7,expansion_context=
 {safe, "context(__call_expr_arg_contexts)"},
 {safe, "left_right(^[(,\\[]$,^[),\\]]$)"},
 {safe, "context(skip_to(__expr_non_syntactic_contexts, stmt_child(node(array_subscript_expr), subscript)))"},
 {safe, "context(skip_to(__expr_non_syntactic_contexts, stmt_child(operator(assign), lhs)))"},
-{safe, "context(skip_to(__expr_non_syntactic_contexts, stmt_child(node(init_list_expr||designated_init_expr), init)))"}
+{safe, "context(skip_to(__expr_non_syntactic_contexts, stmt_child(node(init_list_expr||designated_init_expr), init)))"},
+{safe, "context(skip_to(__expr_non_syntactic_contexts, stmt_child(node(case_stmt), lower||upper)))"}
 -doc_end
 
 -doc_begin="Violations involving the __config_enabled macros cannot be fixed without
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index c6a2affc6a0b..7be232212339 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -416,7 +416,8 @@ Deviations related to MISRA C:2012 Rules:
        (2) as macro arguments;
        (3) as array indices;
        (4) as lhs in assignments;
-       (5) as initializers, possibly designated, in initalizer lists.
+       (5) as initializers, possibly designated, in initalizer lists;
+       (6) as constant expressions of switch case labels.
      - Tagged as `safe` for ECLAIR.
 
    * - R20.7
-- 
2.34.1

