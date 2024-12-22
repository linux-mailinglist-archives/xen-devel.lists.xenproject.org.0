Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9769FA5F4
	for <lists+xen-devel@lfdr.de>; Sun, 22 Dec 2024 15:05:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.862699.1274276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tPMZC-00022q-5v; Sun, 22 Dec 2024 14:04:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 862699.1274276; Sun, 22 Dec 2024 14:04:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tPMZC-00020b-2b; Sun, 22 Dec 2024 14:04:22 +0000
Received: by outflank-mailman (input) for mailman id 862699;
 Sun, 22 Dec 2024 14:04:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Yu5=TP=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1tPMZA-00020V-IC
 for xen-devel@lists.xenproject.org; Sun, 22 Dec 2024 14:04:21 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a140be90-c06d-11ef-99a3-01e77a169b0f;
 Sun, 22 Dec 2024 15:04:16 +0100 (CET)
Received: from nico.bugseng.com (unknown [46.228.253.214])
 by support.bugseng.com (Postfix) with ESMTPSA id 9C8B74EE076E;
 Sun, 22 Dec 2024 15:04:13 +0100 (CET)
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
X-Inumbo-ID: a140be90-c06d-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1734876255; bh=eLfaVFeKpO33z15ACjtU4Vwf67q5saCpKCMCAwI9ctU=;
	h=From:To:Cc:Subject:Date:From;
	b=Tp4LvMtvDtqjyFzKHdphVWu2xE+xThCiZWkZ8mZFPXBR6vs8rJumzOzi0KMS94V/D
	 cMQYFlqCRJoyIqNXXS5OD90g9qWKnSu+PJ8FG4GkWxwYIflSGzIJUU/sG+glpTUm6z
	 GnewCtrpALDPR7v/k0JZ+yvzaKy8mlBubD1FxJX/FaZ0Mm/UD4OS/cWhhcUj6AuPvR
	 eTm1ei5L6befvfm7cJEbzNnJUM9X7HBvTur5SdlM+4q/9fgYrBD6F4jyXrTaDCRmiW
	 Kl+fNeYaq5JN+RUQYmfdm/gQoFUc9qTpE2i/+J1W4De1qN1Gny4afzIGBQ2elVsoCX
	 ICzJps441xi4g==
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Andrew Cooper3 <andrew.cooper3@citrix.com>
Subject: [XEN PATCH v2] eclair-analysis: tidy toolchain.ecl configuration and mark Rule 1.1 clean
Date: Sun, 22 Dec 2024 15:04:08 +0100
Message-ID: <01be894f3c24aa1d7aba528bd5d6f0a1d5a97504.1734876081.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reformat the list of GNU extensions and non-standard tokens used by Xen
in the ECLAIR configuration to make it easier to review any changes to it.

The extension "ext_missing_varargs_arg", which captures the GNU extension that
allows variadic functions and macros not to require at least one named parameter
before C23 has been renamed to "ext_c_missing_varargs_arg" in the current version
of ECLAIR used in CI, therefore this resolves regressions on MISRA C Rule 1.1:

"The program shall contain no violations of the standard C syntax and constraints,
and shall not exceed the implementation's translation limits."

As a result, Rule 1.1 now has no violations and is tagged as such.

Remove two unused configurations, that were already commented out.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Fixes: 631f535a3d4f ("xen: update ECLAIR service identifiers from MC3R1 to MC3A2.")
---
The __inline token is added to the list of accepted non-standard keywords
on arm64 to reduce verbosity (in this way, a single macher can be defined since
the sets of non-standard tokens were identical except for this one).

This change is a candidate for backporting into the 4.18 and 4.19 trees.

Changes in v2:
- drop the old name for the extension
- format the list of extensions and non-standard tokens to be on multiple
  lines, and sort the list
- remove unused, commmented-out, configurations
- tag R1.1 clean
---
 automation/eclair_analysis/ECLAIR/tagging.ecl |  1 +
 .../eclair_analysis/ECLAIR/toolchain.ecl      | 93 +++++++++++++++----
 2 files changed, 74 insertions(+), 20 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
index 982f506cc7b6..4a1d3b3a9898 100644
--- a/automation/eclair_analysis/ECLAIR/tagging.ecl
+++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
@@ -25,6 +25,7 @@ MC3A2.D2.1||
 MC3A2.D4.1||
 MC3A2.D4.11||
 MC3A2.D4.14||
+MC3A2.R1.1||
 MC3A2.R1.3||
 MC3A2.R1.4||
 MC3A2.R2.6||
diff --git a/automation/eclair_analysis/ECLAIR/toolchain.ecl b/automation/eclair_analysis/ECLAIR/toolchain.ecl
index 86e9a79b5231..8ebf9f132cf2 100644
--- a/automation/eclair_analysis/ECLAIR/toolchain.ecl
+++ b/automation/eclair_analysis/ECLAIR/toolchain.ecl
@@ -12,25 +12,47 @@
 -setq=C99_STD,"ISO/IEC 9899:1999"
 
 -doc_begin="
-    _Static_assert: see Section \"2.1 C Language\" of "GCC_MANUAL".
-    asm, __asm__: see Sections \"6.48 Alternate Keywords\" and \"6.47 How to Use Inline Assembly Language in C Code\" of "GCC_MANUAL".
-    __volatile__: see Sections \"6.48 Alternate Keywords\" and \"6.47.2.1 Volatile\" of "GCC_MANUAL".
-    __const__ : see Section \"6.48 Alternate Keywords\" of "GCC_MANUAL".
-    typeof, __typeof__: see Section \"6.7 Referring to a Type with typeof\" of "GCC_MANUAL".
     __alignof__, __alignof: see Sections \"6.48 Alternate Keywords\" and \"6.44 Determining the Alignment of Functions, Types or Variables\" of "GCC_MANUAL".
+    asm, __asm__: see Sections \"6.48 Alternate Keywords\" and \"6.47 How to Use Inline Assembly Language in C Code\" of "GCC_MANUAL".
     __attribute__: see Section \"6.39 Attribute Syntax\" of "GCC_MANUAL".
+    __builtin_offsetof: see Section \"6.53 Support for offsetof\" of "GCC_MANUAL".
     __builtin_types_compatible_p: see Section \"6.59 Other Built-in Functions Provided by GCC\" of "GCC_MANUAL".
     __builtin_va_arg: non-documented GCC extension.
-    __builtin_offsetof: see Section \"6.53 Support for offsetof\" of "GCC_MANUAL".
+    __const__, __inline__, __inline: see Section \"6.48 Alternate Keywords\" of "GCC_MANUAL".
+    _Static_assert: see Section \"2.1 C Language\" of "GCC_MANUAL".
+    typeof, __typeof__: see Section \"6.7 Referring to a Type with typeof\" of "GCC_MANUAL".
+    __volatile__: see Sections \"6.48 Alternate Keywords\" and \"6.47.2.1 Volatile\" of "GCC_MANUAL".
 "
--config=STD.tokenext,behavior+={c99, GCC_ARM64, "^(_Static_assert|asm|__asm__|__volatile__|__const__|typeof|__typeof__|__alignof__|__attribute__|__builtin_types_compatible_p|__builtin_va_arg|__builtin_offsetof)$"}
--config=STD.tokenext,behavior+={c99, GCC_X86_64, "^(_Static_assert|asm|__asm__|__volatile__|__const__|typeof|__typeof__|__alignof__|__alignof|__attribute__|__builtin_types_compatible_p|__builtin_va_arg|__builtin_offsetof)$"}
+-name_selector+={alignof, "^(__alignof__|__alignof)$"}
+-name_selector+={asm, "^(__asm__|asm)$"}
+-name_selector+={attribute, "^__attribute__$"}
+-name_selector+={builtin_offsetof, "^__builtin_offsetof$"}
+-name_selector+={builtin_types_p, "^__builtin_types_compatible_p$"}
+-name_selector+={builtin_va_arg, "^__builtin_va_arg$"}
+-name_selector+={const, "^__const__$"}
+-name_selector+={inline, "^(__inline__|__inline)$"}
+-name_selector+={static_assert, "^_Static_assert$"}
+-name_selector+={typeof, "^(__typeof__|typeof)$"}
+-name_selector+={volatile, "^__volatile__$"}
+
+-config=STD.tokenext,behavior+={c99, GCC_ARM64||GCC_X86_64,
+"alignof||
+asm||
+attribute||
+builtin_offsetof||
+builtin_types_p||
+builtin_va_arg||
+const||
+inline||
+static_assert||
+typeof||
+volatile"
+}
 -doc_end
 
 -doc_begin="Non-documented GCC extension."
 -config=STD.emptinit,behavior+={c99,GCC_ARM64,specified}
 -config=STD.emptinit,behavior+={c99,GCC_X86_64,specified}
-#-config=STD.emptinit,behavior+={c18,GCC_X86_64,specified}
 -doc_end
 
 -doc_begin="See Section \"6.24 Arithmetic on void- and Function-Pointers\" of "GCC_MANUAL"."
@@ -80,7 +102,6 @@
 -doc_begin="Non-documented GCC extension."
 -config=STD.pteincmp,behavior+={c99,GCC_ARM64,specified}
 -config=STD.pteincmp,behavior+={c99,GCC_X86_64,specified}
-#-config=STD.pteincmp,behavior+={c18,GCC_X86_64,specified}
 -doc_end
 
 -doc_begin="Non-documented GCC extension."
@@ -88,20 +109,52 @@
 -doc_end
 
 -doc_begin="
-    ext_paste_comma: see Section \"6.21 Macros with a Variable Number of Arguments\" of "GCC_MANUAL".
-    ext_missing_varargs_arg: see Section \"6.21 Macros with a Variable Number of Arguments\" of "GCC_MANUAL".
+    ext_c_missing_varargs_arg: see Section \"6.21 Macros with a Variable Number of Arguments\" of "GCC_MANUAL".
+    ext_enum_value_not_int: non-documented GCC extension.
+    ext_flexible_array_in_array: see Section \"6.18 Arrays of Length Zero\" of "GCC_MANUAL".
+    ext_flexible_array_in_struct: see Section \"6.18 Arrays of Length Zero\" of "GCC_MANUAL".
+    ext_forward_ref_enum_def: see Section \"6.49 Incomplete enum Types\" of "GCC_MANUAL".
+    ext_gnu_array_range: see Section \"6.29 Designated Initializers\" of "GCC_MANUAL".
+    ext_gnu_statement_expr_macro: see Section \"6.1 Statements and Declarations in Expressions\" of "GCC_MANUAL".
     ext_named_variadic_macro: see Section \"6.21 Macros with a Variable Number of Arguments\" of "GCC_MANUAL".
+    ext_paste_comma: see Section \"6.21 Macros with a Variable Number of Arguments\" of "GCC_MANUAL".
     ext_return_has_void_expr: see the documentation for -Wreturn-type in Section \"3.8 Options to Request or Suppress Warnings\" of "GCC_MANUAL".
-    ext_gnu_statement_expr_macro: see Section \"6.1 Statements and Declarations in Expressions\" of "GCC_MANUAL".
     ext_sizeof_alignof_void_type: see Section \"6.24 Arithmetic on void- and Function-Pointers\" of "GCC_MANUAL".
-    ext_forward_ref_enum_def: see Section \"6.49 Incomplete enum Types\" of "GCC_MANUAL".
-    ext_flexible_array_in_struct: see Section \"6.18 Arrays of Length Zero\" of "GCC_MANUAL".
-    ext_flexible_array_in_array: see Section \"6.18 Arrays of Length Zero\" of "GCC_MANUAL".
-    ext_enum_value_not_int: non-documented GCC extension.
-    ext_gnu_array_range: see Section \"6.29 Designated Initializers\" of "GCC_MANUAL".
 "
--config=STD.diag,behavior+={c99,GCC_ARM64,"^(ext_paste_comma|ext_missing_varargs_arg|ext_named_variadic_macro|ext_return_has_void_expr|ext_gnu_statement_expr_macro|ext_sizeof_alignof_void_type|ext_forward_ref_enum_def|ext_gnu_array_range)$"}
--config=STD.diag,behavior+={c99,GCC_X86_64,"^(ext_paste_comma|ext_missing_varargs_arg|ext_named_variadic_macro|ext_return_has_void_expr|ext_gnu_statement_expr_macro|ext_sizeof_alignof_void_type|ext_flexible_array_in_struct|ext_flexible_array_in_array|ext_enum_value_not_int|ext_gnu_array_range)$"}
+-name_selector+={ext_c_missing_varargs_arg, "^ext_c_missing_varargs_arg$"}
+-name_selector+={ext_enum_value_not_int, "^ext_enum_value_not_int$"}
+-name_selector+={ext_flexible_array_in_array, "^ext_flexible_array_in_array$"}
+-name_selector+={ext_flexible_array_in_struct, "^ext_flexible_array_in_struct$"}
+-name_selector+={ext_forward_ref_enum_def, "^ext_forward_ref_enum_def$"}
+-name_selector+={ext_gnu_array_range, "^ext_gnu_array_range$"}
+-name_selector+={ext_gnu_statement_expr_macro, "^ext_gnu_statement_expr_macro$"}
+-name_selector+={ext_named_variadic_macro, "^ext_named_variadic_macro$"}
+-name_selector+={ext_paste_comma, "^ext_paste_comma$"}
+-name_selector+={ext_return_has_void_expr, "^ext_return_has_void_expr$"}
+-name_selector+={ext_sizeof_alignof_void_type, "^ext_sizeof_alignof_void_type$"}
+
+-config=STD.diag,behavior+={c99,GCC_ARM64,
+"ext_c_missing_varargs_arg||
+ext_forward_ref_enum_def||
+ext_gnu_array_range||
+ext_gnu_statement_expr_macro||
+ext_named_variadic_macro||
+ext_paste_comma||
+ext_return_has_void_expr||
+ext_sizeof_alignof_void_type"
+}
+-config=STD.diag,behavior+={c99,GCC_X86_64,
+"ext_c_missing_varargs_arg||
+ext_enum_value_not_int||
+ext_flexible_array_in_array||
+ext_flexible_array_in_struct||
+ext_gnu_array_range||
+ext_gnu_statement_expr_macro||
+ext_named_variadic_macro||
+ext_paste_comma||
+ext_return_has_void_expr||
+ext_sizeof_alignof_void_type"
+}
 -doc_end
 
 -doc_begin="The maximum size of an object is defined in the MAX_SIZE macro, and for a 32 bit architecture is 8MB.
-- 
2.43.0


