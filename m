Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 763137E39D8
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 11:34:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628729.980526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0JPB-0005aA-Iy; Tue, 07 Nov 2023 10:33:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628729.980526; Tue, 07 Nov 2023 10:33:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0JPB-0005VF-FO; Tue, 07 Nov 2023 10:33:57 +0000
Received: by outflank-mailman (input) for mailman id 628729;
 Tue, 07 Nov 2023 10:33:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=raD6=GU=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r0JP9-0004jI-OS
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 10:33:55 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 261a6309-7d59-11ee-9b0e-b553b5be7939;
 Tue, 07 Nov 2023 11:33:54 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 33A8F4EE0C8B;
 Tue,  7 Nov 2023 11:33:53 +0100 (CET)
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
X-Inumbo-ID: 261a6309-7d59-11ee-9b0e-b553b5be7939
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
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH 4/4] automation/eclair: add deviation for certain backwards goto
Date: Tue,  7 Nov 2023 11:33:45 +0100
Message-Id: <306ca49d5d63ea0614bbcef470efec9234d1a018.1699295113.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699295113.git.nicola.vetrini@bugseng.com>
References: <cover.1699295113.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As explained in the deviation record, code constructs such as
"goto retry" and "goto again" are sometimes the best balance between
code complexity and the understandability of the control flow
by developers; as such, these construct are allowed to deviate
from Rule 15.2.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 10 ++++++++++
 docs/misra/deviations.rst                        | 10 ++++++++++
 2 files changed, 20 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index fa56e5c00a27..8b1f622f8f82 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -270,6 +270,16 @@ statements are deliberate"
 -config=MC3R1.R14.3,statements={deliberate , "wrapped(any(),node(if_stmt))" }
 -doc_end
 
+#
+# Series 15
+#
+
+-doc_begin="The additional complexity introduced in the code by using control flow structures other than backwards goto-s
+were deemed not to justify the possible prevention of developer confusion, given the very torough review process estabilished
+in the community."
+-config=MC3R1.R15.2,reports+={deliberate, "any_area(any_loc(text(^.*goto (again|retry).*$)))"}
+-doc_end
+
 #
 # Series 20.
 #
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 8511a189253b..7d1e1f0d09b3 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -208,6 +208,16 @@ Deviations related to MISRA C:2012 Rules:
        statements are deliberate.
      - Project-wide deviation; tagged as `disapplied` for ECLAIR.
 
+   * - R15.2
+     - The possible prevention of developer confusion as a result of using
+       control flow structures other than backwards goto-s in some instances was
+       deemed not strong enough to justify the additional complexity introduced
+       in the code. Such instances are the uses of the following labels:
+       
+       - again
+       - retry
+     - Tagged as `deliberate` for ECLAIR.
+
    * - R20.7
      - Code violating Rule 20.7 is safe when macro parameters are used:
        (1) as function arguments;
-- 
2.34.1


