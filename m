Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 063FF812FC2
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 13:09:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654525.1021530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDkWK-0002Bs-Jg; Thu, 14 Dec 2023 12:08:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654525.1021530; Thu, 14 Dec 2023 12:08:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDkWK-00020q-BR; Thu, 14 Dec 2023 12:08:52 +0000
Received: by outflank-mailman (input) for mailman id 654525;
 Thu, 14 Dec 2023 12:08:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vWU9=HZ=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rDkWI-0000tC-BU
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 12:08:50 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89c53d18-9a79-11ee-98e9-6d05b1d4d9a1;
 Thu, 14 Dec 2023 13:08:49 +0100 (CET)
Received: from beta.station (net-37-182-35-120.cust.vodafonedsl.it
 [37.182.35.120])
 by support.bugseng.com (Postfix) with ESMTPSA id 46A274EE0C81;
 Thu, 14 Dec 2023 13:08:48 +0100 (CET)
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
X-Inumbo-ID: 89c53d18-9a79-11ee-98e9-6d05b1d4d9a1
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
Subject: [PATCH 8/9] xen: add deviations for Rule 11.8
Date: Thu, 14 Dec 2023 13:07:50 +0100
Message-Id: <854747a97c4c7a70bfe1a30a038f2cc6aebfb566.1702555387.git.maria.celeste.cesario@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702555386.git.maria.celeste.cesario@bugseng.com>
References: <cover.1702555386.git.maria.celeste.cesario@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>

The xen sources contain violations of MISRA C:2012 Rule 11.8 whose
headline states:
"A conversion shall not remove any const, volatile or _Atomic qualification
from the type pointed to by a pointer".

Deviate use of macro container_of.
Deviate use of function ERR_CAST.

Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
---
container_of: Fixing this violation would require the declaration of a new
 macro taking advantage of the return value of the ternary operator ?: :
 its return value preserves qualifiers present on both expression, hence
 returning void* or qualified void* depending on pointer type, like in this macro:
 '#define same_constness_void_ptr(ptr) ((typeof((false ? (void*) 1 : (ptr)))) (ptr))'
 The result could then be used with a Generic to avoid the cast.
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 12 ++++++++++++
 docs/misra/deviations.rst                        | 13 +++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 683f2bbfe8..d3e32a6ac8 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -292,6 +292,18 @@ constant expressions are required.\""
 # Series 11
 #
 
+-doc_begin="Violations caused by container_of are due to pointer arithmetic operations
+with the provided offset. The resulting pointer is then immediately cast back to its
+original type, which preserves the qualifier. This use can be deemed as safe.
+Fixing this violation would require to increase code complexity and lower readability."
+-config=MC3R1.R11.8,reports+={safe,"any_area(any_loc(any_exp(macro(^container_of$))))"}
+-doc_end
+
+-doc_begin="This function is made to explicitly cast an error-valued pointer to a void
+pointer type to make it clear that's what's going on, so the violation is deliberate."
+-config=MC3R1.R11.8,reports+={deliberate,"all_area(context(^ERR_CAST\\(.*$))"}
+-doc_end
+
 -doc_begin="This construct is used to check if the type is scalar, and for this purpose the use of 0 as a null pointer constant is deliberate."
 -config=MC3R1.R11.9,reports+={deliberate, "any_area(any_loc(any_exp(macro(^__ACCESS_ONCE$))))"
 }
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index eda3c8100c..98733d636d 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -248,6 +248,19 @@ Deviations related to MISRA C:2012 Rules:
        If no bits are set, 0 is returned.
      - Tagged as `safe` for ECLAIR.
 
+   * - R11.8
+     - Violations caused by container_of are due to pointer arithmetic operations
+       with the provided offset. The resulting pointer is then immediately cast back to its
+       original type, which preserves the qualifier. This use can be deemed as safe.
+       Fixing this violation would require to increase code complexity and lower readability.
+     - Tagged as `safe` for ECLAIR.
+    
+   * - R11.8
+     - This function is made to explicitly cast an error-valued pointer to a
+       void pointer type to make it clear that's what's going on, so the
+       violation is deliberate.
+     - Tagged ad `deliberate` for ECLAIR.
+
    * - R11.9
      - __ACCESS_ONCE uses an integer, which happens to be zero, as a
        compile time check. The typecheck uses a cast. The usage of zero or other
-- 
2.40.0


