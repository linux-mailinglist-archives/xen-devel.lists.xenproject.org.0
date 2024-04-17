Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BAE8A8C37
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 21:37:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707738.1105976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxB5z-00054v-Cc; Wed, 17 Apr 2024 19:37:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707738.1105976; Wed, 17 Apr 2024 19:37:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxB5z-000530-96; Wed, 17 Apr 2024 19:37:27 +0000
Received: by outflank-mailman (input) for mailman id 707738;
 Wed, 17 Apr 2024 19:37:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TCN8=LW=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rxB5y-00050p-Fa
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 19:37:26 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e930535f-fcf1-11ee-94a3-07e782e9044d;
 Wed, 17 Apr 2024 21:37:22 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.202])
 by support.bugseng.com (Postfix) with ESMTPSA id D31534EE074E;
 Wed, 17 Apr 2024 21:37:20 +0200 (CEST)
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
X-Inumbo-ID: e930535f-fcf1-11ee-94a3-07e782e9044d
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org,
	nicola.vetrini@bugseng.com
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
Subject: [XEN PATCH v3 2/2] eclair_analysis: deviate x86 emulator for Rule 16.2
Date: Wed, 17 Apr 2024 21:37:12 +0200
Message-Id: <4ab08d63b264da38d8d91b37ae18a5fb7999d47f.1713382466.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713382466.git.nicola.vetrini@bugseng.com>
References: <cover.1713382466.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C Rule 16.2 states:
"A switch label shall only be used when the most closely-enclosing
compound statement is the body of a switch statement".

Since complying with this rule of the x86 emulator would lead to
a lot of code duplication, it is deemed better to exempt those
files for this guideline.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 7 +++++++
 docs/misra/deviations.rst                        | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 0230b41c6d1c..190f6a2fd4e0 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -358,6 +358,13 @@ therefore have the same behavior of a boolean"
 # Series 16.
 #
 
+-doc_begin="Complying with the Rule would entail a lot of code duplication in the implementation of the x86 emulator,
+therefore it is deemed better to leave such files as is."
+-file_tag+={x86_emulate,"^xen/arch/x86/x86_emulate/.*$"}
+-file_tag+={x86_svm_emulate,"^xen/arch/x86/hvm/svm/emulate\\.c$"}
+-config=MC3R1.R16.2,reports+={deliberate, "any_area(any_loc(file(x86_emulate||x86_svm_emulate)))"}
+-doc_end
+
 -doc_begin="Switch clauses ending with continue, goto, return statements are
 safe."
 -config=MC3R1.R16.3,terminals+={safe, "node(continue_stmt||goto_stmt||return_stmt)"}
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 32b02905d19a..ed0c1e8ed0bf 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -296,6 +296,12 @@ Deviations related to MISRA C:2012 Rules:
        therefore have the same behavior of a boolean.
      - Project-wide deviation; tagged as `deliberate` for ECLAIR.
 
+   * - R16.2
+     - Complying with the Rule would entail a lot of code duplication in the
+       implementation of the x86 emulator, therefore it is deemed better to
+       leave such files as is.
+     - Tagged as `deliberate` for ECLAIR.
+
    * - R16.3
      - Switch clauses ending with continue, goto, return statements are safe.
      - Tagged as `safe` for ECLAIR.
-- 
2.34.1


