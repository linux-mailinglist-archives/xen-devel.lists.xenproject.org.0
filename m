Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C492D7BB50C
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 12:24:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613500.954051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qohzp-0003GK-DL; Fri, 06 Oct 2023 10:23:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613500.954051; Fri, 06 Oct 2023 10:23:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qohzp-0003Db-An; Fri, 06 Oct 2023 10:23:49 +0000
Received: by outflank-mailman (input) for mailman id 613500;
 Fri, 06 Oct 2023 10:23:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kONH=FU=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qohzn-0003DT-Jt
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 10:23:47 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6dd97fee-6432-11ee-9b0d-b553b5be7939;
 Fri, 06 Oct 2023 12:23:45 +0200 (CEST)
Received: from beta.station (net-188-218-250-245.cust.vodafonedsl.it
 [188.218.250.245])
 by support.bugseng.com (Postfix) with ESMTPSA id 89D304EE0738;
 Fri,  6 Oct 2023 12:23:44 +0200 (CEST)
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
X-Inumbo-ID: 6dd97fee-6432-11ee-9b0d-b553b5be7939
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH] automation/eclair: update deviations and accepted guidelines
Date: Fri,  6 Oct 2023 12:23:16 +0200
Message-Id: <f7fb64aa1b78dfa57a2bf781f5a3cec6219c2de5.1696587777.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove deviations for ERROR_EXIT, ERROR_EXIT_DOM and PIN_FAIL:
the aforementioned macros have been removed.
Add deviation for Rule 2.1 for pure declarations.
Remove legacy text-based deviations: these are now implemented
with SAF comments.
Add deviations for Dir 4.3 and Rules 8.4, 10.1, 13.5, 14.2, 14.3.
Remove deviations for guidelines not yet accepted or rejected.

Add MC3R1.R11.7, MC3R1.R11.8, MC3R1.R11.9, MC3R1.R15.3 and MC3R1.R14.2
to the accepted guidelines selector.

Update clean guidelines selector.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 .../eclair_analysis/ECLAIR/deviations.ecl     | 138 +++++++++---------
 automation/eclair_analysis/ECLAIR/tagging.ecl |   4 +-
 2 files changed, 69 insertions(+), 73 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index d8170106b4..c00b9d5f38 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -15,14 +15,19 @@ Constant expressions and unreachable branches of if and switch statements are ex
 -doc_end
 
 -doc_begin="Unreachability caused by calls to the following functions or macros is deliberate and there is no risk of code being unexpectedly left out."
--config=MC3R1.R2.1,statements+={deliberate,"macro(name(BUG||assert_failed||ERROR_EXIT||ERROR_EXIT_DOM||PIN_FAIL))"}
+-config=MC3R1.R2.1,statements+={deliberate,"macro(name(BUG||assert_failed))"}
 -config=MC3R1.R2.1,statements+={deliberate, "call(decl(name(__builtin_unreachable||panic||do_unexpected_trap||machine_halt||machine_restart||maybe_reboot)))"}
 -doc_end
 
--doc_begin="Unreachability of an ASSERT_UNREACHABLE() and analogous macro calls is deliberate and safe."
+-doc_begin="Unreachability inside an ASSERT_UNREACHABLE() and analogous macro calls is deliberate and safe."
 -config=MC3R1.R2.1,reports+={deliberate, "any_area(any_loc(any_exp(macro(name(ASSERT_UNREACHABLE||PARSE_ERR_RET||PARSE_ERR||FAIL_MSR||FAIL_CPUID)))))"}
 -doc_end
 
+-doc_begin="Pure declarations (i.e., declarations without initialization) are
+not executable, and therefore it is safe for them to be unreachable."
+-config=MC3R1.R2.1,ignored_stmts+={"any()", "pure_decl()"}
+-doc_end
+
 -doc_begin="Proving compliance with respect to Rule 2.2 is generally impossible:
 see https://arxiv.org/abs/2212.13933 for details. Moreover, peer review gives us
 confidence that no evidence of errors in the program's logic has been missed due
@@ -49,33 +54,12 @@ they are not instances of commented-out code."
 -config=MC3R1.D4.3,reports+={disapplied,"!(any_area(any_loc(file(^xen/arch/arm/arm64/.*$))))"}
 -doc_end
 
--doc_begin="Depending on the compiler, rewriting the following function-like
-macros as inline functions is not guaranteed to have the same effect."
--config=MC3R1.D4.9,macros+={deliberate,"name(likely)"}
--config=MC3R1.D4.9,macros+={deliberate,"name(unlikely)"}
--config=MC3R1.D4.9,macros+={deliberate,"name(unreachable)"}
--doc_end
-
--doc_begin="These macros can be used on both pointers and unsigned long type values."
--config=MC3R1.D4.9,macros+={safe,"name(virt_to_maddr)"}
--config=MC3R1.D4.9,macros+={safe,"name(virt_to_mfn)"}
--doc_end
-
--doc_begin="Rewriting variadic macros as variadic functions might have a negative impact on safety."
--config=MC3R1.D4.9,macros+={deliberate,"variadic()"}
--doc_end
-
--doc_begin="Rewriting macros with arguments that are, in turn, arguments of
-__builtin_constant_p() can change the behavior depending on the optimization
-level."
--config=MC3R1.D4.9,macro_argument_context+="skip_to(class(type||expr||decl,any),
-                                            call(name(__builtin_constant_p)))"
--doc_end
-
--doc_begin="Function-like macros defined in public headers are meant to be
-usable in C89 mode without any extensions. Hence they cannot be replaced by
-inline functions."
--config=MC3R1.D4.9,macros+={deliberate, "loc(file(api:public))"}
+-doc_begin="The inline asm in 'arm64/lib/bitops.c' is tightly coupled with the
+surronding C code that acts as a wrapper, so it has been decided not to add an
+additional encapsulation layer."
+-file_tag+={arm64_bitops, "^xen/arch/arm/arm64/lib/bitops\\.c$"}
+-config=MC3R1.D4.3,reports+={deliberate, "all_area(any_loc(file(arm64_bitops)&&any_exp(macro(^(bit|test)op$))))"}
+-config=MC3R1.D4.3,reports+={deliberate, "any_area(any_loc(file(arm64_bitops))&&context(name(int_clear_mask16)))"}
 -doc_end
 
 -doc_begin="This header file is autogenerated or empty, therefore it poses no
@@ -105,29 +89,6 @@ conform to the directive."
 -config=MC3R1.R5.3,reports+={safe, "any_area(any_loc(any_exp(macro(^read_debugreg$))&&any_exp(macro(^write_debugreg$))))"}
 -doc_end
 
--doc_begin="Function-like macros cannot be confused with identifiers that are
-neither functions nor pointers to functions."
--config=MC3R1.R5.5,reports={safe,"all_area(decl(node(enum_decl||record_decl||field_decl||param_decl||var_decl)&&!type(canonical(address((node(function||function_no_proto))))))||macro(function_like()))"}
--doc_end
-
--doc_begin="The use of these identifiers for both macro names and other entities
-is deliberate and does not generate developer confusion."
--config=MC3R1.R5.5,reports+={safe, "any_area(text(^\\s*/\\*\\s+SAF-[0-9]+-safe\\s+MC3R1\\.R5\\.5.*$, begin-1))"}
--doc_end
-
--doc_begin="The definition of macros and functions ending in '_bit' that use the
-same identifier in 'bitops.h' is deliberate and safe."
--file_tag+={bitops_h, "^xen/arch/x86/include/asm/bitops\\.h$"}
--config=MC3R1.R5.5,reports+={safe, "all_area((decl(^.*_bit\\(.*$)||macro(^.*_bit$))&&all_loc(file(bitops_h)))"}
--doc_end
-
--doc_begin="The definition of macros and functions beginning in 'str' or 'mem'
-that use the same identifier in 'xen/include/xen/string.h' is deliberate and
-safe."
--file_tag+={string_h, "^xen/include/xen/string\\.h$"}
--config=MC3R1.R5.5,reports+={safe, "any_area((decl(^(mem|str).*$)||macro(^(mem|str).*$))&&all_loc(file(string_h)))"}
--doc_end
-
 #
 # Series 7.
 #
@@ -156,11 +117,6 @@ particular use of it done in xen_mk_ulong."
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
@@ -204,6 +160,16 @@ const-qualified."
 -config=MC3R1.R8.3,reports+={deliberate,"any_area(any_loc(file(adopted_mpparse_r8_3)))&&any_area(any_loc(file(^xen/arch/x86/include/asm/mpspec\\.h$)))"}
 -doc_end
 
+-doc_begin="The definitions present in this file are meant to generate definitions for asm modules, and are not called by C code. Therefore the absence of prior declarations is safe."
+-config=MC3R1.R8.4,reports+={safe, "first_area(any_loc(file(asm_offsets)))"}
+-doc_end
+
+-doc_begin="The functions defined in this file are meant to be called from gcc-generated code in a non-release build configuration.
+Therefore the absence of prior declarations is safe."
+-file_tag+={gcov, "^xen/common/coverage/gcov_base\\.c$"}
+-config=MC3R1.R8.4,reports+={safe, "first_area(any_loc(file(gcov)))"}
+-doc_end
+
 -doc_begin="The following variables are compiled in multiple translation units
 belonging to different executables and therefore are safe."
 -config=MC3R1.R8.6,declarations+={safe, "name(current_stack_pointer||bsearch||sort)"}
@@ -222,12 +188,6 @@ definition is compiled-out or optimized-out by the compiler)"
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
@@ -274,22 +234,47 @@ still non-negative."
 -config=MC3R1.R10.1,etypes+={safe, "stmt(operator(logical)||node(conditional_operator||binary_conditional_operator))", "dst_type(ebool||boolean)"}
 -doc_end
 
-### Set 3 ###
+-doc_begin="XEN only supports architectures where signed integers are
+representend using two's complement and all the XEN developers are aware of
+this."
+-config=MC3R1.R10.1,etypes+={safe,
+  "stmt(operator(and||or||xor||not||and_assign||or_assign||xor_assign))",
+  "any()"}
+-doc_end
+
+-doc_begin="See Section \"4.5 Integers\" of \"GCC_MANUAL\", where it says that
+\"Signed `>>' acts on negative numbers by sign extension. As an extension to the
+C language, GCC does not use the latitude given in C99 and C11 only to treat
+certain aspects of signed `<<' as undefined. However, -fsanitize=shift (and
+-fsanitize=undefined) will diagnose such cases. They are also diagnosed where
+constant expressions are required.\""
+-config=MC3R1.R10.1,etypes+={safe,
+  "stmt(operator(shl||shr||shl_assign||shr_assign))",
+  "any()"}
+-doc_end
 
 #
-# Series 18.
+# Series 13
 #
 
--doc_begin="FIXME: explain why pointer differences involving this macro are safe."
--config=MC3R1.R18.2,reports+={safe,"all_area(all_loc(any_exp(macro(^ACPI_PTR_DIFF$))))"}
+-doc_begin="All developers and reviewers can be safely assumed to be well aware
+of the short-circuit evaluation strategy of such logical operators."
+-config=MC3R1.R13.5,reports+={disapplied,"any()"}
 -doc_end
 
--doc_begin="FIXME: explain why pointer differences involving this macro are safe."
--config=MC3R1.R18.2,reports+={safe,"all_area(all_loc(any_exp(macro(^page_to_mfn$))))"}
+#
+# Series 14
+#
+
+-doc_begin="The severe restrictions imposed by this rule on the use of for
+statements are not balanced by the presumed facilitation of the peer review
+activity."
+-config=MC3R1.R14.2,reports+={disapplied,"any()"}
 -doc_end
 
--doc_begin="FIXME: explain why pointer differences involving this macro are safe."
--config=MC3R1.R18.2,reports+={safe,"all_area(all_loc(any_exp(macro(^page_to_pdx$))))"}
+-doc_begin="The XEN team relies on the fact that invariant conditions of 'if'
+statements are deliberate"
+-config=MC3R1.R14.3,statements={deliberate , "wrapped(any(),node(if_stmt))" }
 -doc_end
 
 #
@@ -306,6 +291,17 @@ in assignments."
 {safe, "left_right(^[(,\\[]$,^[),\\]]$)"}
 -doc_end
 
+#
+# General
+#
+
+-doc_begin="do-while-0 is a well recognized loop idiom by the xen community."
+-loop_idioms={do_stmt, "literal(0)"}
+-doc_end
+-doc_begin="while-[01] is a well recognized loop idiom by the xen community."
+-loop_idioms+={while_stmt, "literal(0)||literal(1)"}
+-doc_end
+
 #
 # Developer confusion
 #
diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
index 78a0bc948b..e82277fea3 100644
--- a/automation/eclair_analysis/ECLAIR/tagging.ecl
+++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
@@ -19,7 +19,7 @@
 
 -doc="Accepted guidelines as reported in XEN/docs/misra/rules.rst"
 -service_selector={accepted_guidelines,
-    "MC3R1.D1.1||MC3R1.D2.1||MC3R1.D4.1||MC3R1.D4.3||MC3R1.D4.7||MC3R1.D4.10||MC3R1.D4.11||MC3R1.D4.14||MC3R1.R1.1||MC3R1.R1.3||MC3R1.R1.4||MC3R1.R2.1||MC3R1.R2.2||MC3R1.R2.6||MC3R1.R2.2||MC3R1.R3.1||MC3R1.R3.2||MC3R1.R4.1||MC3R1.R4.2||MC3R1.R5.1||MC3R1.R5.2||MC3R1.R5.3||MC3R1.R5.4||MC3R1.R5.6||MC3R1.R6.1||MC3R1.R6.2||MC3R1.R7.1||MC3R1.R7.2||MC3R1.R7.3||MC3R1.R7.4||MC3R1.R8.1||MC3R1.R8.2||MC3R1.R8.3||MC3R1.R8.4||MC3R1.R8.5||MC3R1.R8.6||MC3R1.R8.8||MC3R1.R8.10||MC3R1.R8.12||MC3R1.R8.14||MC3R1.R9.1||MC3R1.R9.2||MC3R1.R9.3||MC3R1.R9.4||MC3R1.R9.5||MC3R1.R10.1||MC3R1.R10.2||MC3R1.R10.3||MC3R1.R10.4||MC3R1.R12.5||MC3R1.R13.6||MC3R1.R13.1||MC3R1.R14.1||MC3R1.R14.3||MC3R1.R16.7||MC3R1.R17.3||MC3R1.R17.4||MC3R1.R17.6||MC3R1.R18.3||MC3R1.R19.1||MC3R1.R20.7||MC3R1.R20.13||MC3R1.R20.14||MC3R1.R21.13||MC3R1.R21.17||MC3R1.R21.18||MC3R1.R21.19||MC3R1.R21.20||MC3R1.R21.21||MC3R1.R22.2||MC3R1.R22.4||MC3R1.R22.5||MC3R1.R22.6"
+    "MC3R1.D1.1||MC3R1.D2.1||MC3R1.D4.1||MC3R1.D4.3||MC3R1.D4.7||MC3R1.D4.10||MC3R1.D4.11||MC3R1.D4.14||MC3R1.R1.1||MC3R1.R1.3||MC3R1.R1.4||MC3R1.R2.1||MC3R1.R2.2||MC3R1.R2.6||MC3R1.R3.1||MC3R1.R3.2||MC3R1.R4.1||MC3R1.R4.2||MC3R1.R5.1||MC3R1.R5.2||MC3R1.R5.3||MC3R1.R5.4||MC3R1.R5.6||MC3R1.R6.1||MC3R1.R6.2||MC3R1.R7.1||MC3R1.R7.2||MC3R1.R7.3||MC3R1.R7.4||MC3R1.R8.1||MC3R1.R8.2||MC3R1.R8.3||MC3R1.R8.4||MC3R1.R8.5||MC3R1.R8.6||MC3R1.R8.8||MC3R1.R8.10||MC3R1.R8.12||MC3R1.R8.14||MC3R1.R9.1||MC3R1.R9.2||MC3R1.R9.3||MC3R1.R9.4||MC3R1.R9.5||MC3R1.R10.1||MC3R1.R10.2||MC3R1.R10.3||MC3R1.R10.4||MC3R1.R11.7||MC3R1.R11.8||MC3R1.R11.9||MC3R1.R12.5||MC3R1.R13.1||MC3R1.R13.5||MC3R1.R13.6||MC3R1.R14.1||MC3R1.R14.2||MC3R1.R14.3||MC3R1.R16.7||MC3R1.R17.3||MC3R1.R17.4||MC3R1.R17.6||MC3R1.R18.3||MC3R1.R19.1||MC3R1.R20.7||MC3R1.R20.13||MC3R1.R20.14||MC3R1.R21.13||MC3R1.R21.17||MC3R1.R21.18||MC3R1.R21.19||MC3R1.R21.20||MC3R1.R21.21||MC3R1.R22.2||MC3R1.R22.4||MC3R1.R22.5||MC3R1.R22.6"
 }
 -doc="All reports of accepted guidelines are tagged as accepted."
 -reports+={status:accepted,"service(accepted_guidelines)"}
@@ -30,7 +30,7 @@
 
 -doc_begin="Clean guidelines: new violations for these guidelines are not accepted."
 
--service_selector={clean_guidelines_common,"MC3R1.D1.1||MC3R1.D2.1||MC3R1.D4.11||MC3R1.D4.14||MC3R1.R1.1||MC3R1.R1.3||MC3R1.R1.4||MC3R1.R2.2||MC3R1.R3.1||MC3R1.R3.2||MC3R1.R4.1||MC3R1.R5.1||MC3R1.R5.2||MC3R1.R5.4||MC3R1.R6.1||MC3R1.R6.2||MC3R1.R7.1||MC3R1.R8.1||MC3R1.R8.5||MC3R1.R8.8||MC3R1.R8.10||MC3R1.R8.12||MC3R1.R8.14||MC3R1.R9.2||MC3R1.R9.4||MC3R1.R9.5||MC3R1.R12.5||MC3R1.R17.3||MC3R1.R17.4||MC3R1.R17.6||MC3R1.R21.13||MC3R1.R21.19||MC3R1.R21.21||MC3R1.R22.2||MC3R1.R22.4||MC3R1.R22.5||MC3R1.R22.6"
+-service_selector={clean_guidelines_common,"MC3R1.D1.1||MC3R1.D2.1||MC3R1.D4.11||MC3R1.D4.14||MC3R1.R1.1||MC3R1.R1.3||MC3R1.R1.4||MC3R1.R2.2||MC3R1.R3.1||MC3R1.R3.2||MC3R1.R4.1||MC3R1.R4.2||MC3R1.R5.1||MC3R1.R5.2||MC3R1.R5.4||MC3R1.R6.1||MC3R1.R6.2||MC3R1.R7.1||MC3R1.R8.1||MC3R1.R8.5||MC3R1.R8.8||MC3R1.R8.10||MC3R1.R8.12||MC3R1.R8.14||MC3R1.R9.2||MC3R1.R9.4||MC3R1.R9.5||MC3R1.R12.5||MC3R1.R17.3||MC3R1.R17.4||MC3R1.R17.6||MC3R1.R20.13||MC3R1.R20.14||MC3R1.R21.13||MC3R1.R21.19||MC3R1.R21.21||MC3R1.R22.2||MC3R1.R22.4||MC3R1.R22.5||MC3R1.R22.6"
 }
 
 -setq=target,getenv("XEN_TARGET_ARCH")
-- 
2.34.1


