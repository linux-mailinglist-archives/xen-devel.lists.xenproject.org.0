Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B64E47B9BE8
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 10:46:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612886.953047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoJzV-0002Jc-9g; Thu, 05 Oct 2023 08:45:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612886.953047; Thu, 05 Oct 2023 08:45:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoJzV-0002H6-6H; Thu, 05 Oct 2023 08:45:53 +0000
Received: by outflank-mailman (input) for mailman id 612886;
 Thu, 05 Oct 2023 08:45:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XA9v=FT=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qoJzT-0001nb-QK
 for xen-devel@lists.xenproject.org; Thu, 05 Oct 2023 08:45:51 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94e4706f-635b-11ee-9b0d-b553b5be7939;
 Thu, 05 Oct 2023 10:45:48 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id C03B54EE0739;
 Thu,  5 Oct 2023 10:45:47 +0200 (CEST)
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
X-Inumbo-ID: 94e4706f-635b-11ee-9b0d-b553b5be7939
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
Subject: [XEN PATCH][for-4.19 1/2] xen: introduce a deviation for Rule 11.9
Date: Thu,  5 Oct 2023 10:45:19 +0200
Message-Id: <98bc1d90b93856ed7516a19114facf6528120248.1696494834.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696494834.git.nicola.vetrini@bugseng.com>
References: <cover.1696494834.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The constant 0 is used instead of NULL in '__ACCESS_ONCE' as a
compile-time check to detect non-scalar types; its usage for this
purpose is documented in rules.rst as an exception.

Furthermore, the 'access_field' and 'typeof_field' macros are
introduced as a general way to deal with accesses to structs
without declaring a struct variable.

Cleanup of spurious MISRA deviations.

No functional change intended.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
If NULL is not suitable for usage inside access_field, then 0 could
be put there and the macro deviated.
---
 .../eclair_analysis/ECLAIR/deviations.ecl     | 23 +++++++------------
 docs/misra/rules.rst                          |  3 ++-
 xen/include/xen/compiler.h                    |  5 +++-
 xen/include/xen/kernel.h                      |  2 +-
 4 files changed, 15 insertions(+), 18 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index d8170106b449..acd42386e0a9 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -110,10 +110,6 @@ neither functions nor pointers to functions."
 -config=MC3R1.R5.5,reports={safe,"all_area(decl(node(enum_decl||record_decl||field_decl||param_decl||var_decl)&&!type(canonical(address((node(function||function_no_proto))))))||macro(function_like()))"}
 -doc_end

--doc_begin="The use of these identifiers for both macro names and other entities
-is deliberate and does not generate developer confusion."
--config=MC3R1.R5.5,reports+={safe, "any_area(text(^\\s*/\\*\\s+SAF-[0-9]+-safe\\s+MC3R1\\.R5\\.5.*$, begin-1))"}
--doc_end

 -doc_begin="The definition of macros and functions ending in '_bit' that use the
 same identifier in 'bitops.h' is deliberate and safe."
@@ -156,11 +152,6 @@ particular use of it done in xen_mk_ulong."
 -config=MC3R1.R7.2,reports+={deliberate,"any_area(any_loc(macro(name(BUILD_BUG_ON))))"}
 -doc_end

--doc_begin="The following string literals are assigned to pointers to non
-const-qualified char."
--config=MC3R1.R7.4,reports+={safe, "any_area(text(^\\s*/\\*\\s+SAF-[0-9]+-safe\\s+MC3R1\\.R7\\.4.*$, begin-1))"}
--doc_end
-
 -doc_begin="Allow pointers of non-character type as long as the pointee is
 const-qualified."
 -config=MC3R1.R7.4,same_pointee=false
@@ -222,12 +213,6 @@ definition is compiled-out or optimized-out by the compiler)"
 # Series 9.
 #

--doc_begin="The following variables are written before being set, therefore no
-access to uninitialized memory locations happens, as explained in the deviation
-comment."
--config=MC3R1.R9.1,reports+={safe, "any_area(text(^\\s*/\\*\\s+SAF-[0-9]+-safe\\s+MC3R1\\.R9\\.1.*$, begin-1))"}
--doc_end
-
 -doc_begin="Violations in files that maintainers have asked to not modify in the
 context of R9.1."
 -file_tag+={adopted_r9_1,"^xen/arch/arm/arm64/lib/find_next_bit\\.c$"}
@@ -274,6 +259,14 @@ still non-negative."
 -config=MC3R1.R10.1,etypes+={safe, "stmt(operator(logical)||node(conditional_operator||binary_conditional_operator))", "dst_type(ebool||boolean)"}
 -doc_end

+#
+# Series 11
+#
+
+-doc_begin="This macro is used to check if the type is scalar, and for this purpose the use of 0 as a null pointer constant is deliberate."
+-config=MC3R1.R11.9,reports+={deliberate, "any_area(any_loc(any_exp(macro(^__ACCESS_ONCE$))))"}
+-doc_end
+
 ### Set 3 ###

 #
diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 3139ca7ae6dd..d5569696b3a8 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -393,7 +393,8 @@ maintainers if you want to suggest a change.
    * - `Rule 11.9 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_11_09.c>`_
      - Required
      - The macro NULL shall be the only permitted form of null pointer constant
-     -
+     - Using 0 as a null pointer constant to check if a type is scalar is
+       allowed and always happens through the macro __ACCESS_ONCE.

    * - `Rule 12.5 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_12_05.c>`_
      - Mandatory
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

