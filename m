Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0198B9B5E
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 15:11:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715815.1117733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2WDp-00032L-R6; Thu, 02 May 2024 13:11:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715815.1117733; Thu, 02 May 2024 13:11:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2WDp-0002zv-OU; Thu, 02 May 2024 13:11:37 +0000
Received: by outflank-mailman (input) for mailman id 715815;
 Thu, 02 May 2024 13:11:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QyT6=MF=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1s2WDo-0002zp-Hw
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 13:11:36 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7fbbcf6f-0885-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 15:11:34 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-79-36-52-167.retail.telecomitalia.it [79.36.52.167])
 by support.bugseng.com (Postfix) with ESMTPSA id 362954EE0738;
 Thu,  2 May 2024 15:11:24 +0200 (CEST)
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
X-Inumbo-ID: 7fbbcf6f-0885-11ef-b4bb-af5377834399
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
Subject: [XEN PATCH v2] automation/eclair: add deviation of MISRA C:2012 Rule 14.4
Date: Thu,  2 May 2024 15:11:15 +0200
Message-Id: <ce16233b539f4101d97b3e2962607c87b188c415.1714655082.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update ECLAIR configuration to take into account the deviations
agreed during MISRA meetings.

Amend an existing entry of Rule 14.4 in deviations-rst:
it is not a project-wide deviation.

Tag Rule 14.4 as clean for arm.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
Changes in v2:
- reordered deviations to have the more general one as first;
- tagged the rule as clean for arm.
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++++
 automation/eclair_analysis/ECLAIR/tagging.ecl    | 2 +-
 docs/misra/deviations.rst                        | 8 +++++++-
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index d21f112a9b..db1fae3aa2 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -343,6 +343,10 @@ statements are deliberate"
 -config=MC3R1.R14.3,statements={deliberate , "wrapped(any(),node(if_stmt))" }
 -doc_end
 
+-doc_begin="A controlling expression of 'if' and iteration statements having integer, character or pointer type has a semantics that is well-known to all Xen developers."
+-config=MC3R1.R14.4,etypes+={deliberate, "any()", "src_type(integer||character)||src_expr(type(desugar(pointer(any()))))"}
+-doc_end
+
 -doc_begin="The XEN team relies on the fact that the enum is_dying has the
 constant with assigned value 0 act as false and the other ones as true,
 therefore have the same behavior of a boolean"
diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
index bdf94ed996..f573b32da4 100644
--- a/automation/eclair_analysis/ECLAIR/tagging.ecl
+++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
@@ -29,7 +29,7 @@ if(string_equal(target,"x86_64"),
 )
 
 if(string_equal(target,"arm64"),
-    service_selector({"additional_clean_guidelines","MC3R1.R16.6||MC3R1.R20.12||MC3R1.R2.1||MC3R1.R5.3||MC3R1.R7.2||MC3R1.R7.3||MC3R1.R8.6||MC3R1.R9.3"})
+    service_selector({"additional_clean_guidelines","MC3R1.R14.4||MC3R1.R16.6||MC3R1.R20.12||MC3R1.R2.1||MC3R1.R5.3||MC3R1.R7.2||MC3R1.R7.3||MC3R1.R8.6||MC3R1.R9.3"})
 )
 
 -reports+={clean:added,"service(clean_guidelines_common||additional_clean_guidelines)"}
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index ed0c1e8ed0..c4e304fc44 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -290,11 +290,17 @@ Deviations related to MISRA C:2012 Rules:
        statements are deliberate.
      - Project-wide deviation; tagged as `disapplied` for ECLAIR.
 
+   * - R14.4
+     - A controlling expression of 'if' and iteration statements having
+       integer, character or pointer type has a semantics that is well-known to
+       all Xen developers.
+     - Tagged as `deliberate` for ECLAIR.
+
    * - R14.4
      - The XEN team relies on the fact that the enum is_dying has the
        constant with assigned value 0 act as false and the other ones as true,
        therefore have the same behavior of a boolean.
-     - Project-wide deviation; tagged as `deliberate` for ECLAIR.
+     - Tagged as `deliberate` for ECLAIR.
 
    * - R16.2
      - Complying with the Rule would entail a lot of code duplication in the
-- 
2.34.1


