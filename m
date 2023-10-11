Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C2D7C5448
	for <lists+xen-devel@lfdr.de>; Wed, 11 Oct 2023 14:47:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615479.956731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqYc5-00067A-Ug; Wed, 11 Oct 2023 12:46:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615479.956731; Wed, 11 Oct 2023 12:46:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqYc5-00064b-Qw; Wed, 11 Oct 2023 12:46:57 +0000
Received: by outflank-mailman (input) for mailman id 615479;
 Wed, 11 Oct 2023 12:46:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uJaT=FZ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qqYc3-0005p0-JH
 for xen-devel@lists.xenproject.org; Wed, 11 Oct 2023 12:46:55 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41602134-6834-11ee-9b0d-b553b5be7939;
 Wed, 11 Oct 2023 14:46:54 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id DCCF84EE0748;
 Wed, 11 Oct 2023 14:46:51 +0200 (CEST)
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
X-Inumbo-ID: 41602134-6834-11ee-9b0d-b553b5be7939
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
Subject: [XEN PATCH][for-4.19 v2 1/1] xen: introduce a deviation for Rule 11.9
Date: Wed, 11 Oct 2023 14:46:46 +0200
Message-Id: <c684c36402e6740472fa91d73436ca5790e5e109.1696948320.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696948320.git.nicola.vetrini@bugseng.com>
References: <cover.1696948320.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The constant 0 is used instead of NULL in '__ACCESS_ONCE' as a
compile-time check to detect non-scalar types; its usage for this
purpose is deviated.

Furthermore, the 'access_field' and 'typeof_field' macros are
introduced as a general way to deal with accesses to structs
without declaring a struct variable.

No functional change intended.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v2:
- added entry in deviations.rst
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 9 +++++++++
 docs/misra/deviations.rst                        | 5 +++++
 xen/include/xen/compiler.h                       | 5 ++++-
 xen/include/xen/kernel.h                         | 2 +-
 4 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index fa56e5c00a27..28d9c37bedb2 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -246,6 +246,15 @@ constant expressions are required.\""
   "any()"}
 -doc_end
 
+#
+# Series 11
+#
+
+-doc_begin="This construct is used to check if the type is scalar, and for this purpose the use of 0 as a null pointer constant is deliberate."
+-config=MC3R1.R11.9,reports+={deliberate, "any_area(any_loc(any_exp(macro(^__ACCESS_ONCE$))))"
+}
+-doc_end
+
 #
 # Series 13
 #
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index ee7aed0609d2..1b00e4e3e9b7 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -199,6 +199,11 @@ Deviations related to MISRA C:2012 Rules:
        See automation/eclair_analysis/deviations.ecl for the full explanation.
      - Tagged as `safe` for ECLAIR.
 
+   * - R11.9
+     - __ACCESS_ONCE uses a 0 as a null pointer constant to check if a type is
+       scalar, therefore its usage for this purpose is allowed.
+     - Tagged as `deliberate` for ECLAIR.
+
    * - R13.5
      - All developers and reviewers can be safely assumed to be well aware of
        the short-circuit evaluation strategy for logical operators.
diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
index dd99e573083f..15be9a750b23 100644
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -109,13 +109,16 @@
 
 #define offsetof(a,b) __builtin_offsetof(a,b)
 
+/* Access the field of structure type, without defining a local variable */
+#define access_field(type, member) (((type *)NULL)->member)
+#define typeof_field(type, member) typeof(access_field(type, member))
 /**
  * sizeof_field(TYPE, MEMBER)
  *
  * @TYPE: The structure containing the field of interest
  * @MEMBER: The field to return the size of
  */
-#define sizeof_field(TYPE, MEMBER) sizeof((((TYPE *)0)->MEMBER))
+#define sizeof_field(TYPE, MEMBER) sizeof(access_field(TYPE, MEMBER))
 
 #if !defined(__STDC_VERSION__) || __STDC_VERSION__ < 201112L
 #define alignof __alignof__
diff --git a/xen/include/xen/kernel.h b/xen/include/xen/kernel.h
index 46b3c9c02625..2c5ed7736c99 100644
--- a/xen/include/xen/kernel.h
+++ b/xen/include/xen/kernel.h
@@ -51,7 +51,7 @@
  *
  */
 #define container_of(ptr, type, member) ({                      \
-        typeof( ((type *)0)->member ) *__mptr = (ptr);          \
+        typeof_field(type, member) *__mptr = (ptr);             \
         (type *)( (char *)__mptr - offsetof(type,member) );})
 
 /*
-- 
2.34.1


