Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A66E85483E
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 12:27:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680591.1058585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raDPt-0007oO-Vb; Wed, 14 Feb 2024 11:27:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680591.1058585; Wed, 14 Feb 2024 11:27:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raDPt-0007mh-Sz; Wed, 14 Feb 2024 11:27:05 +0000
Received: by outflank-mailman (input) for mailman id 680591;
 Wed, 14 Feb 2024 11:27:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=83ZH=JX=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1raDPs-0007mb-Ur
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 11:27:04 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f95bdfbd-cb2b-11ee-98f5-efadbce2ee36;
 Wed, 14 Feb 2024 12:27:02 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id DE65B4EE0738;
 Wed, 14 Feb 2024 12:26:59 +0100 (CET)
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
X-Inumbo-ID: f95bdfbd-cb2b-11ee-98f5-efadbce2ee36
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
Subject: [XEN PATCH] automation/eclair_analysis: deviate certain macros for Rule 20.12
Date: Wed, 14 Feb 2024 12:26:55 +0100
Message-Id: <892be5c403ca7a20b35fb9facacb6a38bc7f6bfe.1707900742.git.nicola.vetrini@bugseng.com>
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
This patch is intended as a follow-up to the patch accepting this Rule for Xen
---
 .../eclair_analysis/ECLAIR/deviations.ecl      | 10 ++++++++++
 docs/misra/deviations.rst                      | 18 ++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index fd32ff8a9cae..98e5ad146b8d 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -387,6 +387,16 @@ in assignments."
 {safe, "left_right(^[(,\\[]$,^[),\\]]$)"}
 -doc_end
 
+-doc_begin="The token pasting in variadic macros cannot be replaced."
+-config=MC3R1.R20.12,macros+={deliberate, "variadic()"}
+-doc_end
+
+-doc_begin="Uses of # and ## operators within the following macros are
+deliberate."
+-config=MC3R1.R20.12,macros+={deliberate, "name(ASSERT||BUILD_BUG_ON||BUILD_BUG_ON_ZERO||GENERATE_CASE)"}
+-doc_end
+
+
 #
 # General
 #
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 123c78e20a01..855c1c5579bb 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -330,6 +330,24 @@ Deviations related to MISRA C:2012 Rules:
        (4) as lhs in assignments.
      - Tagged as `safe` for ECLAIR.
 
+   * - R20.12
+     - Variadic macros that use token pasting often employ the gcc extension
+       `ext_paste_comma`, as detailed in `C-language-toolchain.rst`, which is
+       not easily replaceable.
+     - Tagged as `deliberate` for ECLAIR.
+
+   * - R20.12
+     - Macros that are used for runtime or build-time assertions contain
+       deliberate uses of an argument as both a regular argument and a
+       stringification token, to provide useful diagnostic messages.
+     - Tagged as `deliberate` for ECLAIR.
+
+   * - R20.12
+     - GENERATE_CASE is a special-purpose macro that allows some selected switch
+       statements to be more compact and readable. As such, the risk of
+       developer confusion in using such macro is deemed negligible.
+     - Tagged as `deliberate` for ECLAIR.
+
 Other deviations:
 -----------------
 
-- 
2.34.1

