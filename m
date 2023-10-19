Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FED7CF1C8
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 09:55:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618958.963341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtNsR-0002Bw-70; Thu, 19 Oct 2023 07:55:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618958.963341; Thu, 19 Oct 2023 07:55:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtNsR-00028f-40; Thu, 19 Oct 2023 07:55:31 +0000
Received: by outflank-mailman (input) for mailman id 618958;
 Thu, 19 Oct 2023 07:55:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cQIi=GB=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qtNsP-00028Z-CD
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 07:55:29 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ddf43a1a-6e54-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 09:55:27 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 5740E4EE0739;
 Thu, 19 Oct 2023 09:55:25 +0200 (CEST)
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
X-Inumbo-ID: ddf43a1a-6e54-11ee-98d5-6d05b1d4d9a1
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
Subject: [XEN PATCH][for-4.19 v4] xen: address violations of Rule 11.9
Date: Thu, 19 Oct 2023 09:55:22 +0200
Message-Id: <b8a82daf5862287bda9545d7e672ce98e49004a2.1697701358.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The constant 0 is used instead of NULL in '__ACCESS_ONCE' as a
compile-time check to detect non-scalar types; its usage for this
purpose is deviated.

Furthermore, the 'typeof_field' macro is introduced as a general way
to access the type of a struct member without declaring a variable
of struct type. Both this macro and 'sizeof_field' are moved to
'xen/macros.h'.

No functional change intended.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v2:
- added entry in deviations.rst
Changes in v3:
- dropped access_field
- moved macro to macros.h
---
Changes in v4:
- Amend deviation record.
---
 automation/eclair_analysis/ECLAIR/deviations.ecl |  9 +++++++++
 docs/misra/deviations.rst                        |  6 ++++++
 xen/include/xen/compiler.h                       |  8 --------
 xen/include/xen/kernel.h                         |  2 +-
 xen/include/xen/macros.h                         | 16 ++++++++++++++++
 5 files changed, 32 insertions(+), 9 deletions(-)

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
index ee7aed0609d2..81a924612ddf 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -199,6 +199,12 @@ Deviations related to MISRA C:2012 Rules:
        See automation/eclair_analysis/deviations.ecl for the full explanation.
      - Tagged as `safe` for ECLAIR.

+   * - R11.9
+     - __ACCESS_ONCE uses an integer, which happens to be zero, as a
+       compile time check. The typecheck uses a cast. The usage of zero or other
+       integers for this purpose is allowed.
+     - Tagged as `deliberate` for ECLAIR.
+
    * - R13.5
      - All developers and reviewers can be safely assumed to be well aware of
        the short-circuit evaluation strategy for logical operators.
diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
index dd99e573083f..a8be1f19cfc2 100644
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -109,14 +109,6 @@

 #define offsetof(a,b) __builtin_offsetof(a,b)

-/**
- * sizeof_field(TYPE, MEMBER)
- *
- * @TYPE: The structure containing the field of interest
- * @MEMBER: The field to return the size of
- */
-#define sizeof_field(TYPE, MEMBER) sizeof((((TYPE *)0)->MEMBER))
-
 #if !defined(__STDC_VERSION__) || __STDC_VERSION__ < 201112L
 #define alignof __alignof__
 #endif
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
diff --git a/xen/include/xen/macros.h b/xen/include/xen/macros.h
index d0caae7db298..457c84b9d1a0 100644
--- a/xen/include/xen/macros.h
+++ b/xen/include/xen/macros.h
@@ -54,6 +54,22 @@

 #define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]) + __must_be_array(x))

+/**
+ * typeof_field(type, member)
+ *
+ * @type: The structure containing the field of interest
+ * @member: The field whose type is returned
+ */
+#define typeof_field(type, member) typeof(((type *)NULL)->member)
+
+/**
+ * sizeof_field(type, member)
+ *
+ * @type: The structure containing the field of interest
+ * @member: The field to return the size of
+ */
+#define sizeof_field(type, member) sizeof(((type *)NULL)->member)
+
 #endif /* __ASSEMBLY__ */

 #endif /* __MACROS_H__ */
--
2.34.1

