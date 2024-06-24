Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEAB91460F
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 11:19:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746430.1153473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLfqV-00049W-54; Mon, 24 Jun 2024 09:18:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746430.1153473; Mon, 24 Jun 2024 09:18:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLfqV-00046y-2N; Mon, 24 Jun 2024 09:18:43 +0000
Received: by outflank-mailman (input) for mailman id 746430;
 Mon, 24 Jun 2024 09:18:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H9EP=N2=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sLfqT-00046s-Fl
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 09:18:41 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id beb8b0eb-320a-11ef-90a3-e314d9c70b13;
 Mon, 24 Jun 2024 11:18:40 +0200 (CEST)
Received: from truciolo.bugseng.com (unknown [37.160.55.204])
 by support.bugseng.com (Postfix) with ESMTPSA id 0E0404EE0738;
 Mon, 24 Jun 2024 11:18:38 +0200 (CEST)
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
X-Inumbo-ID: beb8b0eb-320a-11ef-90a3-e314d9c70b13
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
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [XEN PATCH v2] automation/eclair: configure Rule 13.6 and custom service B.UNEVALEFF
Date: Mon, 24 Jun 2024 11:18:32 +0200
Message-Id: <5c60e98d70ae94c155fd56ec13b764b7a8f6161c.1719219962.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rule 13.6 states that "The operand of the `sizeof' operator shall not
contain any expression which has potential side effects".

Define service B.UNEVALEFF as an extension of Rule 13.6 to
check for unevalued side effects also for typeof and alignof operators.

Update ECLAIR configuration to deviate uses of BUILD_BUG_ON and
alternative_v?call[0-9] for both Rule 13.6 and B.UNEVALEFF.

Add service B.UNEVALEFF to the accepted.ecl guidelines to check
"violations" in the weekly analysis.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v2:
- typo fixed;
- restricted deviation to alternative.h;
- generalized deviation to the arguments of BUILD_BUG_ON.
---
 automation/eclair_analysis/ECLAIR/B.UNEVALEFF.ecl      | 10 ++++++++++
 .../eclair_analysis/ECLAIR/accepted_guidelines.sh      |  2 ++
 automation/eclair_analysis/ECLAIR/analysis.ecl         |  1 +
 automation/eclair_analysis/ECLAIR/deviations.ecl       | 10 ++++++++++
 docs/misra/deviations.rst                              | 10 ++++++++++
 5 files changed, 33 insertions(+)
 create mode 100644 automation/eclair_analysis/ECLAIR/B.UNEVALEFF.ecl

diff --git a/automation/eclair_analysis/ECLAIR/B.UNEVALEFF.ecl b/automation/eclair_analysis/ECLAIR/B.UNEVALEFF.ecl
new file mode 100644
index 0000000000..92d8db8986
--- /dev/null
+++ b/automation/eclair_analysis/ECLAIR/B.UNEVALEFF.ecl
@@ -0,0 +1,10 @@
+-clone_service=MC3R1.R13.6,B.UNEVALEFF
+
+-config=B.UNEVALEFF,summary="The operand of the `alignof' and `typeof'  operators shall not contain any expression which has potential side effects"
+-config=B.UNEVALEFF,stmt_child_matcher=
+{"stmt(node(utrait_expr)&&operator(alignof))", expr, 0, "stmt(any())", {}},
+{"stmt(node(utrait_type)&&operator(alignof))", type, 0, "stmt(any())", {}},
+{"stmt(node(utrait_expr)&&operator(preferred_alignof))", expr, 0, "stmt(any())", {}},
+{"stmt(node(utrait_type)&&operator(preferred_alignof))", type, 0, "stmt(any())", {}},
+{"type(node(typeof_expr))", expr, 0, "stmt(any())", {}},
+{"type(node(typeof_type))", type, 0, "stmt(any())", {}}
diff --git a/automation/eclair_analysis/ECLAIR/accepted_guidelines.sh b/automation/eclair_analysis/ECLAIR/accepted_guidelines.sh
index b308bd4cda..368135122c 100755
--- a/automation/eclair_analysis/ECLAIR/accepted_guidelines.sh
+++ b/automation/eclair_analysis/ECLAIR/accepted_guidelines.sh
@@ -11,3 +11,5 @@ accepted_rst=$1
 
 grep -Eo "\`(Dir|Rule) [0-9]+\.[0-9]+" ${accepted_rst} \
      | sed -e 's/`Rule /MC3R1.R/' -e  's/`Dir /MC3R1.D/' -e 's/.*/-enable=&/' > ${script_dir}/accepted.ecl
+
+echo "-enable=B.UNEVALEFF" >> ${script_dir}/accepted.ecl
diff --git a/automation/eclair_analysis/ECLAIR/analysis.ecl b/automation/eclair_analysis/ECLAIR/analysis.ecl
index 9134e59617..df0b551812 100644
--- a/automation/eclair_analysis/ECLAIR/analysis.ecl
+++ b/automation/eclair_analysis/ECLAIR/analysis.ecl
@@ -52,6 +52,7 @@ their Standard Library equivalents."
 -eval_file=adopted.ecl
 -eval_file=out_of_scope.ecl
 
+-eval_file=B.UNEVALEFF.ecl
 -eval_file=deviations.ecl
 -eval_file=call_properties.ecl
 -eval_file=tagging.ecl
diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index e2653f77eb..580d9edb8d 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -328,6 +328,16 @@ of the short-circuit evaluation strategy of such logical operators."
 -config=MC3R1.R13.5,reports+={disapplied,"any()"}
 -doc_end
 
+-doc_begin="Macros alternative_v?call[0-9] use sizeof and typeof to check that the argument types match the corresponding parameter ones."
+-config=MC3R1.R13.6,reports+={deliberate,"any_area(any_loc(any_exp(macro(^alternative_vcall[0-9]$))&&file(^xen/arch/x86/include/asm/alternative\\.h*$)))"}
+-config=B.UNEVALEFF,reports+={deliberate,"any_area(any_loc(any_exp(macro(^alternative_v?call[0-9]$))&&file(^xen/arch/x86/include/asm/alterantive\\.h*$)))"}
+-doc_end
+
+-doc_begin="Anything, no matter how complicated, inside the BUILD_BUG_ON macro is subject to a compile-time evaluation without relevant side effects."
+-config=MC3R1.R13.6,reports+={safe,"any_area(any_loc(any_exp(macro(name(BUILD_BUG_ON)))))"}
+-config=B.UNEVALEFF,reports+={safe,"any_area(any_loc(any_exp(macro(name(BUILD_BUG_ON)))))"}
+-doc_end
+
 #
 # Series 14
 #
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 36959aa44a..65dce6267f 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -279,6 +279,16 @@ Deviations related to MISRA C:2012 Rules:
        the short-circuit evaluation strategy for logical operators.
      - Project-wide deviation; tagged as `disapplied` for ECLAIR.
 
+   * - R13.6
+     - On x86, macros alternative_v?call[0-9] use sizeof and typeof to check
+       that the argument types match the corresponding parameter ones.
+     - Tagged as `deliberate` for ECLAIR.
+
+   * - R13.6
+     - Anything, no matter how complicated, inside the BUILD_BUG_ON macro is
+       subject to a compile-time evaluation without relevant side effects."
+     - Tagged as `safe` for ECLAIR.
+
    * - R14.2
      - The severe restrictions imposed by this rule on the use of 'for'
        statements are not counterbalanced by the presumed facilitation of the
-- 
2.34.1


