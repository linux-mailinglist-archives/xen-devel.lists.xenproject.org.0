Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E40818C6222
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 09:52:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721983.1125759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s79Qk-0003WB-UQ; Wed, 15 May 2024 07:52:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721983.1125759; Wed, 15 May 2024 07:52:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s79Qk-0003UW-Rm; Wed, 15 May 2024 07:52:06 +0000
Received: by outflank-mailman (input) for mailman id 721983;
 Wed, 15 May 2024 07:52:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=opSn=MS=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1s79Qj-0003UQ-5G
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 07:52:05 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0473f657-1290-11ef-b4bb-af5377834399;
 Wed, 15 May 2024 09:52:03 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.202])
 by support.bugseng.com (Postfix) with ESMTPSA id DC49F4EE0738;
 Wed, 15 May 2024 09:52:01 +0200 (CEST)
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
X-Inumbo-ID: 0473f657-1290-11ef-b4bb-af5377834399
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org,
	nicola.vetrini@bugseng.com
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [XEN PATCH] automation/eclair_analysis: fully deviate MISRA C Rules 21.9 and 21.10
Date: Wed, 15 May 2024 09:51:59 +0200
Message-Id: <6990027e12e108a2eaee7300931b1dd01c30795d.1715758910.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These rules are concerned with the use of facilities provided by the
C Standard Library (qsort, bsearch for rule 21.9, and those provided
by <time.h> for rule 21.10).

Xen provides in its source code its own implementation of some of these
functions and macros, therefore a justification is provided for allowing
uses of these functions in the project.

The rules are also marked as clean as a consequence.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 .../eclair_analysis/ECLAIR/deviations.ecl      | 14 ++++++++++++++
 .../eclair_analysis/ECLAIR/monitored.ecl       |  2 ++
 automation/eclair_analysis/ECLAIR/tagging.ecl  |  2 +-
 docs/misra/deviations.rst                      | 18 ++++++++++++++++++
 4 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 5eb7368a7322..1478c64a5af1 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -477,6 +477,20 @@ leads to a violation of the Rule are deviated."
 -config=MC3R1.R20.12,macros+={deliberate, "name(GENERATE_CASE)&&loc(file(deliberate_generate_case))"}
 -doc_end
 
+#
+# Series 21.
+#
+
+-doc_begin="Xen does not use the functions provided by the Standard Library, but
+implements a set of functions that share the same names as their Standard Library equivalent.
+The implementation of these functions is available in source form, so the undefined, unspecified
+or implementation-defined behaviors contemplated by the C Standard do not apply.
+If some undefined or unspecified behavior does arise in the implementation, it
+falls under the jurisdiction of other MISRA rules."
+-config=MC3R1.R21.9,reports+={deliberate, "any()"}
+-config=MC3R1.R21.10,reports+={deliberate, "any()"}
+-doc_end
+
 #
 # General
 #
diff --git a/automation/eclair_analysis/ECLAIR/monitored.ecl b/automation/eclair_analysis/ECLAIR/monitored.ecl
index 69308ea51c01..9da709dc889c 100644
--- a/automation/eclair_analysis/ECLAIR/monitored.ecl
+++ b/automation/eclair_analysis/ECLAIR/monitored.ecl
@@ -36,12 +36,14 @@
 -enable=MC3R1.R20.4
 -enable=MC3R1.R20.9
 -enable=MC3R1.R2.1
+-enable=MC3R1.R21.10
 -enable=MC3R1.R21.13
 -enable=MC3R1.R21.17
 -enable=MC3R1.R21.18
 -enable=MC3R1.R21.19
 -enable=MC3R1.R21.20
 -enable=MC3R1.R21.21
+-enable=MC3R1.R21.9
 -enable=MC3R1.R2.2
 -enable=MC3R1.R22.2
 -enable=MC3R1.R22.4
diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
index a14bda5033df..acea15f486a1 100644
--- a/automation/eclair_analysis/ECLAIR/tagging.ecl
+++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
@@ -19,7 +19,7 @@
 
 -doc_begin="Clean guidelines: new violations for these guidelines are not accepted."
 
--service_selector={clean_guidelines_common, "MC3R1.D1.1||MC3R1.D2.1||MC3R1.D4.1||MC3R1.D4.11||MC3R1.D4.14||MC3R1.R11.7||MC3R1.R11.9||MC3R1.R12.5||MC3R1.R1.1||MC3R1.R1.3||MC3R1.R1.4||MC3R1.R14.1||MC3R1.R16.7||MC3R1.R17.1||MC3R1.R17.3||MC3R1.R17.4||MC3R1.R17.5||MC3R1.R17.6||MC3R1.R20.13||MC3R1.R20.14||MC3R1.R20.4||MC3R1.R20.9||MC3R1.R21.13||MC3R1.R21.19||MC3R1.R21.21||MC3R1.R2.2||MC3R1.R22.2||MC3R1.R22.4||MC3R1.R22.5||MC3R1.R22.6||MC3R1.R2.6||MC3R1.R3.1||MC3R1.R3.2||MC3R1.R4.1||MC3R1.R4.2||MC3R1.R5.1||MC3R1.R5.2||MC3R1.R5.4||MC3R1.R5.6||MC3R1.R6.1||MC3R1.R6.2||MC3R1.R7.1||MC3R1.R7.2||MC3R1.R7.4||MC3R1.R8.1||MC3R1.R8.10||MC3R1.R8.12||MC3R1.R8.14||MC3R1.R8.2||MC3R1.R8.5||MC3R1.R8.6||MC3R1.R8.8||MC3R1.R9.2||MC3R1.R9.3||MC3R1.R9.4||MC3R1.R9.5"
+-service_selector={clean_guidelines_common, "MC3R1.D1.1||MC3R1.D2.1||MC3R1.D4.1||MC3R1.D4.11||MC3R1.D4.14||MC3R1.R11.7||MC3R1.R11.9||MC3R1.R12.5||MC3R1.R1.1||MC3R1.R1.3||MC3R1.R1.4||MC3R1.R14.1||MC3R1.R16.7||MC3R1.R17.1||MC3R1.R17.3||MC3R1.R17.4||MC3R1.R17.5||MC3R1.R17.6||MC3R1.R20.13||MC3R1.R20.14||MC3R1.R20.4||MC3R1.R20.9||MC3R1.R21.10||MC3R1.R21.13||MC3R1.R21.19||MC3R1.R21.21||MC3R1.R21.9||MC3R1.R2.2||MC3R1.R22.2||MC3R1.R22.4||MC3R1.R22.5||MC3R1.R22.6||MC3R1.R2.6||MC3R1.R3.1||MC3R1.R3.2||MC3R1.R4.1||MC3R1.R4.2||MC3R1.R5.1||MC3R1.R5.2||MC3R1.R5.4||MC3R1.R5.6||MC3R1.R6.1||MC3R1.R6.2||MC3R1.R7.1||MC3R1.R7.2||MC3R1.R7.4||MC3R1.R8.1||MC3R1.R8.10||MC3R1.R8.12||MC3R1.R8.14||MC3R1.R8.2||MC3R1.R8.5||MC3R1.R8.6||MC3R1.R8.8||MC3R1.R9.2||MC3R1.R9.3||MC3R1.R9.4||MC3R1.R9.5"
 }
 
 -setq=target,getenv("XEN_TARGET_ARCH")
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 161134771c77..b5450c38f66c 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -411,6 +411,24 @@ Deviations related to MISRA C:2012 Rules:
        construct is deviated only in Translation Units that present a violation
        of the Rule due to uses of this macro.
      - Tagged as `deliberate` for ECLAIR.
+     
+   * - R21.9
+     - Xen does not use the `bsearch` and `qsort` functions provided by the C
+       Standard Library, but provides in source form its own implementation,
+       therefore any unspecified or undefined behavior associated to the
+       functions provided by the Standard Library does not apply. Any such
+       behavior that may exist in such functions is therefore under the
+       jurisdiction of other MISRA C rules.
+     - Project-wide deviation, tagged as `deliberate` for ECLAIR.
+
+   * - R21.10
+     - Xen does not use the facilities provided by the `\<time.h\>` provided by the C
+       Standard Library, but provides in source form its own implementation,
+       therefore any unspecified, undefined or implementation-defined behavior
+       associated to the functions provided by the Standard Library does not
+       apply. Any such behavior that may exist in such functions is therefore
+       under the jurisdiction of other MISRA C rules.
+     - Project-wide deviation, tagged as `deliberate` for ECLAIR.
 
 Other deviations:
 -----------------
-- 
2.34.1


