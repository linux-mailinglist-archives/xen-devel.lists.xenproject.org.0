Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA5E891585
	for <lists+xen-devel@lfdr.de>; Fri, 29 Mar 2024 10:12:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699283.1092032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rq8H6-00020q-JZ; Fri, 29 Mar 2024 09:11:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699283.1092032; Fri, 29 Mar 2024 09:11:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rq8H6-0001so-D1; Fri, 29 Mar 2024 09:11:48 +0000
Received: by outflank-mailman (input) for mailman id 699283;
 Fri, 29 Mar 2024 09:11:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LGMC=LD=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rq8H5-0000ww-5Q
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2024 09:11:47 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d5014f1-edac-11ee-a1ef-f123f15fe8a2;
 Fri, 29 Mar 2024 10:11:45 +0100 (CET)
Received: from nico.bugseng.com (unknown [176.206.12.122])
 by support.bugseng.com (Postfix) with ESMTPSA id 80D7F4EE0742;
 Fri, 29 Mar 2024 10:11:44 +0100 (CET)
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
X-Inumbo-ID: 5d5014f1-edac-11ee-a1ef-f123f15fe8a2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [XEN PATCH v3 5/7] automation/eclair: add deviations for Rule 20.7
Date: Fri, 29 Mar 2024 10:11:33 +0100
Message-Id: <f20c06179dcdaff7c4e1246ed49a685d4d25497b.1711700095.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1711700095.git.nicola.vetrini@bugseng.com>
References: <cover.1711700095.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These deviations deal with the following cases:
- macro arguments used directly as initializer list arguments;
- uses of the __config_enabled macro, that can't be brought
  into compliance without breaking its functionality;
- exclude files that are out of scope (efi headers and cpu_idle);
- uses of alternative_{call,vcall}[0-9] macros.

The existing configuration for R20.7 is reordered so that it matches the
cases listed in its documentation comment.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 .../eclair_analysis/ECLAIR/deviations.ecl     | 25 +++++++++++++++++--
 docs/misra/deviations.rst                     | 14 ++++++++++-
 docs/misra/rules.rst                          |  2 +-
 3 files changed, 37 insertions(+), 4 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index de9ba723fbc7..70756503f594 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -401,12 +401,33 @@ unexpected result when the structure is given as argument to a sizeof() operator
 
 -doc_begin="Code violating Rule 20.7 is safe when macro parameters are used: (1)
 as function arguments; (2) as macro arguments; (3) as array indices; (4) as lhs
-in assignments."
+in assignments; (5) as initializers, possibly designated, in initalizer lists."
 -config=MC3R1.R20.7,expansion_context=
 {safe, "context(__call_expr_arg_contexts)"},
+{safe, "left_right(^[(,\\[]$,^[),\\]]$)"},
 {safe, "context(skip_to(__expr_non_syntactic_contexts, stmt_child(node(array_subscript_expr), subscript)))"},
 {safe, "context(skip_to(__expr_non_syntactic_contexts, stmt_child(operator(assign), lhs)))"},
-{safe, "left_right(^[(,\\[]$,^[),\\]]$)"}
+{safe, "context(skip_to(__expr_non_syntactic_contexts, stmt_child(node(init_list_expr||designated_init_expr), init)))"}
+-doc_end
+
+-doc_begin="Violations involving the __config_enabled macros cannot be fixed without
+breaking the macro's logic; futhermore, the macro is only ever used in the context
+of the IS_ENABLED or STATIC_IF/STATIC_IF_NOT macros, so it always receives a literal
+0 or 1 as input, posing no risk to safety."
+-config=MC3R1.R20.7,reports+={safe, "any_area(any_loc(any_exp(macro(^___config_enabled$))))"}
+-doc_end
+
+-doc_begin="Violations due to the use of macros defined in files that are
+not in scope for compliance are allowed, as that is imported code."
+-file_tag+={gnu_efi_include, "^xen/include/efi/.*$"}
+-file_tag+={acpi_cpu_idle, "^xen/arch/x86/acpi/cpu_idle\\.c$"}
+-config=MC3R1.R20.7,reports+={safe, "any_area(any_loc(file(gnu_efi_include)))"}
+-config=MC3R1.R20.7,reports+={safe, "any_area(any_loc(file(acpi_cpu_idle)))"}
+-doc_end
+
+-doc_begin="To avoid compromising readability, the macros alternative_(v)?call[0-9] are allowed
+not to parenthesize their arguments."
+-config=MC3R1.R20.7,reports+={safe, "any_area(any_loc(any_exp(macro(^alternative_(v)?call[0-9]$))))"}
 -doc_end
 
 -doc_begin="Uses of variadic macros that have one of their arguments defined as
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index eb5ef2bd9dd6..5fdacfd420a1 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -345,7 +345,19 @@ Deviations related to MISRA C:2012 Rules:
        (1) as function arguments;
        (2) as macro arguments;
        (3) as array indices;
-       (4) as lhs in assignments.
+       (4) as lhs in assignments;
+       (5) as initializers, possibly designated, in initalizer lists.
+     - Tagged as `safe` for ECLAIR.
+
+   * - R20.7
+     - Violations due to the use of macros defined in files that are not
+       in scope for compliance are allowed, as that is imported code.
+     - Tagged as `safe` for ECLAIR.
+
+   * - R20.7
+     - To avoid compromising readability, the macros `alternative_(v)?call[0-9]`
+       are allowed not to parenthesize their arguments, as there are already
+       sanity checks in place.
      - Tagged as `safe` for ECLAIR.
 
    * - R20.12
diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 1e134ccebc48..3914af08495b 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -560,7 +560,7 @@ maintainers if you want to suggest a change.
        shall be enclosed in parentheses
      - Extra parentheses are not required when macro parameters are used
        as function arguments, as macro arguments, array indices, lhs in
-       assignments
+       assignments or as initializers in initalizer lists.
 
    * - `Rule 20.9 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_20_09.c>`_
      - Required
-- 
2.34.1


