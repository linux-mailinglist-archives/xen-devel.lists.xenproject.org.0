Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A693D90A8D8
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 10:57:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.741921.1148630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ8BA-00064i-6p; Mon, 17 Jun 2024 08:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 741921.1148630; Mon, 17 Jun 2024 08:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ8B9-0005tw-VM; Mon, 17 Jun 2024 08:57:31 +0000
Received: by outflank-mailman (input) for mailman id 741921;
 Mon, 17 Jun 2024 08:57:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UpZp=NT=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sJ8B8-0005Fp-5w
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 08:57:30 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f1aff13-2c87-11ef-90a3-e314d9c70b13;
 Mon, 17 Jun 2024 10:57:27 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id B22044EE0759;
 Mon, 17 Jun 2024 10:57:26 +0200 (CEST)
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
X-Inumbo-ID: 9f1aff13-2c87-11ef-90a3-e314d9c70b13
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
Subject: [XEN PATCH v2 4/6][RESEND] automation/eclair_analysis: address violations of MISRA C Rule 20.7
Date: Mon, 17 Jun 2024 10:57:16 +0200
Message-Id: <dfebde9cc657f2669df60b08ca34352288e082ab.1718378539.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718378539.git.nicola.vetrini@bugseng.com>
References: <cover.1718378539.git.nicola.vetrini@bugseng.com>
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
---
Changes in v2:
- Introduce a deviation instead of adding parentheses
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 6 ++++--
 docs/misra/deviations.rst                        | 3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index c2698e7074aa..fc248641dc78 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -428,13 +428,15 @@ unexpected result when the structure is given as argument to a sizeof() operator
 
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
index 36959aa44ac9..be2cc6bf03eb 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -376,7 +376,8 @@ Deviations related to MISRA C:2012 Rules:
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

