Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C403818605
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 12:06:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656667.1025020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFXvP-0003o4-Mo; Tue, 19 Dec 2023 11:06:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656667.1025020; Tue, 19 Dec 2023 11:06:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFXvP-0003hs-HW; Tue, 19 Dec 2023 11:06:11 +0000
Received: by outflank-mailman (input) for mailman id 656667;
 Tue, 19 Dec 2023 11:06:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Div9=H6=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rFXvO-0003cc-CD
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 11:06:10 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c46a156-9e5e-11ee-9b0f-b553b5be7939;
 Tue, 19 Dec 2023 12:06:08 +0100 (CET)
Received: from beta.station (net-37-182-35-120.cust.vodafonedsl.it
 [37.182.35.120])
 by support.bugseng.com (Postfix) with ESMTPSA id 806C34EE0C98;
 Tue, 19 Dec 2023 12:06:07 +0100 (CET)
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
X-Inumbo-ID: 9c46a156-9e5e-11ee-9b0f-b553b5be7939
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 3/6] xen: add deviations for Rule 11.8
Date: Tue, 19 Dec 2023 12:05:11 +0100
Message-Id: <04cdbf21db915634acd49108edab7d6331df35eb.1702982442.git.maria.celeste.cesario@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702982442.git.maria.celeste.cesario@bugseng.com>
References: <cover.1702982442.git.maria.celeste.cesario@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>

The xen sources contain violations of MISRA C:2012 Rule 11.8 whose
headline states:
"A conversion shall not remove any const, volatile or _Atomic qualification
from the type pointed to by a pointer".

The macro 'container_of' violates the Rule because it casts away any
qualifier to do pointer arithmetic, but making the macro definition compliant
would add additional complexity, therefore a deviation is introduced.

Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
---
Changes in v2:
- remove deviation for function ERR_CAST;

container_of: Fixing this violation would require the declaration of a new
 macro taking advantage of the return value of the ternary operator ?: :
 its return value preserves qualifiers present on both expression, hence
 returning void* or qualified void* depending on pointer type, like in this macro:
 '#define same_constness_void_ptr(ptr) ((typeof((false ? (void*) 1 : (ptr)))) (ptr))'
 The result could then be used with a Generic to avoid the cast.
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 7 +++++++
 docs/misra/deviations.rst                        | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 683f2bbfe8..1515378ff1 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -292,6 +292,13 @@ constant expressions are required.\""
 # Series 11
 #
 
+-doc_begin="Violations caused by container_of are due to pointer arithmetic operations
+with the provided offset. The resulting pointer is then immediately cast back to its
+original type, which preserves the qualifier. This use is deemed safe.
+Fixing this violation would require to increase code complexity and lower readability."
+-config=MC3R1.R11.8,reports+={safe,"any_area(any_loc(any_exp(macro(^container_of$))))"}
+-doc_end
+
 -doc_begin="This construct is used to check if the type is scalar, and for this purpose the use of 0 as a null pointer constant is deliberate."
 -config=MC3R1.R11.9,reports+={deliberate, "any_area(any_loc(any_exp(macro(^__ACCESS_ONCE$))))"
 }
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index eda3c8100c..ccf6e90e87 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -248,6 +248,13 @@ Deviations related to MISRA C:2012 Rules:
        If no bits are set, 0 is returned.
      - Tagged as `safe` for ECLAIR.
 
+   * - R11.8
+     - Violations caused by container_of are due to pointer arithmetic operations
+       with the provided offset. The resulting pointer is then immediately cast back to its
+       original type, which preserves the qualifier. This use is deemed safe.
+       Fixing this violation would require to increase code complexity and lower readability.
+     - Tagged as `safe` for ECLAIR.
+    
    * - R11.9
      - __ACCESS_ONCE uses an integer, which happens to be zero, as a
        compile time check. The typecheck uses a cast. The usage of zero or other
-- 
2.40.0


