Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB0185640A
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 14:10:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681734.1060693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rabUy-0002dU-Am; Thu, 15 Feb 2024 13:09:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681734.1060693; Thu, 15 Feb 2024 13:09:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rabUy-0002Vm-1h; Thu, 15 Feb 2024 13:09:56 +0000
Received: by outflank-mailman (input) for mailman id 681734;
 Thu, 15 Feb 2024 13:09:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YE+Y=JY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rabRY-0002j3-58
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 13:06:24 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04105be3-cc03-11ee-98f5-efadbce2ee36;
 Thu, 15 Feb 2024 14:06:22 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id EA5CD4EE0737;
 Thu, 15 Feb 2024 14:06:19 +0100 (CET)
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
X-Inumbo-ID: 04105be3-cc03-11ee-98f5-efadbce2ee36
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2] automation/eclair_analysis: deviate certain macros for Rule 20.12
Date: Thu, 15 Feb 2024 14:06:17 +0100
Message-Id: <7bc72f6ccd858e0405d62d49c32449e3b5abd790.1707996317.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Certain macros are allowed to violate the Rule, since their meaning and
intended use is well-known to all Xen developers.

Variadic macros that rely on the GCC extension for removing a trailing
comma when token pasting the variable argument are similarly
well-understood and therefore allowed.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v2:
- Restrict deviation for GENERATE_CASE to vcpreg.c.
- Improve deviation justifications.
---
 .../eclair_analysis/ECLAIR/deviations.ecl     | 20 +++++++++++++++++
 docs/misra/deviations.rst                     | 22 +++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index fd32ff8a9cae..04cb41e16a50 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -387,6 +387,26 @@ in assignments."
 {safe, "left_right(^[(,\\[]$,^[),\\]]$)"}
 -doc_end
 
+-doc_begin="Uses of variadic macros that have one of their arguments defined as
+a macro and used within the body for both ordinary parameter expansion and as an
+operand to the # or ## operators have a behavior that is well-understood and
+deliberate."
+-config=MC3R1.R20.12,macros+={deliberate, "variadic()"}
+-doc_end
+
+-doc_begin="Uses of a macro parameter for ordinary expansion and as an operand
+to the # or ## operators within the following macros are deliberate, to provide
+useful diagnostic messages to the user."
+-config=MC3R1.R20.12,macros+={deliberate, "name(ASSERT||BUILD_BUG_ON||BUILD_BUG_ON_ZERO)"}
+-doc_end
+
+-doc_begin="The helper macro GENERATE_CASE may use a macro parameter for ordinary
+expansion and token pasting to improve readability. Only instances where this
+leads to a violation of the Rule are deviated."
+-file_tag+={deliberate_generate_case, "^xen/arch/arm/vcpreg\\.c$"}
+-config=MC3R1.R20.12,macros+={deliberate, "name(GENERATE_CASE)&&loc(file(deliberate_generate_case))"}
+-doc_end
+
 #
 # General
 #
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 123c78e20a01..84da637ef888 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -330,6 +330,28 @@ Deviations related to MISRA C:2012 Rules:
        (4) as lhs in assignments.
      - Tagged as `safe` for ECLAIR.
 
+   * - R20.12
+     - Variadic macros that use token pasting often employ the gcc extension
+       `ext_paste_comma`, as detailed in `C-language-toolchain.rst`, which is
+       not easily replaceable; macros that in addition perform regular argument
+       expansion on the same argument subject to the # or ## operators violate
+       the Rule if the argument is a macro. 
+     - Tagged as `deliberate` for ECLAIR.
+
+   * - R20.12
+     - Macros that are used for runtime or build-time assertions contain
+       deliberate uses of an argument as both a regular argument and a
+       stringification token, to provide useful diagnostic messages.
+     - Tagged as `deliberate` for ECLAIR.
+
+   * - R20.12
+     - GENERATE_CASE is a local helper macro that allows some selected switch
+       statements to be more compact and readable. As such, the risk of
+       developer confusion in using such macro is deemed negligible. This
+       construct is deviated only in Translation Units that present a violation
+       of the Rule due to uses of this macro.
+     - Tagged as `deliberate` for ECLAIR.
+
 Other deviations:
 -----------------
 
-- 
2.34.1


