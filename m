Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 293FF7754CE
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 10:09:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580761.909181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTeFv-0003oJ-2N; Wed, 09 Aug 2023 08:09:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580761.909181; Wed, 09 Aug 2023 08:09:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTeFu-0003m1-Ut; Wed, 09 Aug 2023 08:09:22 +0000
Received: by outflank-mailman (input) for mailman id 580761;
 Wed, 09 Aug 2023 08:09:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ohew=D2=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qTeFt-0003RD-GB
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 08:09:21 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b469882-368c-11ee-b280-6b7b168915f2;
 Wed, 09 Aug 2023 10:09:20 +0200 (CEST)
Received: from beta.station (net-188-218-251-179.cust.vodafonedsl.it
 [188.218.251.179])
 by support.bugseng.com (Postfix) with ESMTPSA id 5E77B4EE073F;
 Wed,  9 Aug 2023 10:09:20 +0200 (CEST)
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
X-Inumbo-ID: 0b469882-368c-11ee-b280-6b7b168915f2
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 2/3] automation/eclair: add ECL deviations
Date: Wed,  9 Aug 2023 10:08:00 +0200
Message-Id: <b2979e8cfa01369aa663434144d96bfd3f395ded.1691568344.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691568344.git.simone.ballarin@bugseng.com>
References: <cover.1691568344.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds some deviations for the following guidelines:
Rule 2.1, Rule 5.3 and Rule 8.2.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 .../eclair_analysis/ECLAIR/deviations.ecl     | 34 ++++++++-----------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index e1a06daf2f..696618b59e 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -14,8 +14,13 @@ Constant expressions and unreachable branches of if and switch statements are ex
 -config=MC3R1.R2.1,+reports={deliberate,"first_area(^.*is never referenced$)"}
 -doc_end
 
--doc_begin="Unreachability in the following macros are expected and safe."
--config=MC3R1.R2.1,statements+={safe,"macro(name(BUG||assert_failed||ERROR_EXIT||ERROR_EXIT_DOM||PIN_FAIL))"}
+-doc_begin="Unreachability caused by calls to the following functions or macros is deliberate and there is no risk of code being unexpectedly left out."
+-config=MC3R1.R2.1,statements+={deliberate,"macro(name(BUG||assert_failed||ERROR_EXIT||ERROR_EXIT_DOM||PIN_FAIL))"}
+-config=MC3R1.R2.1,statements+={deliberate, "call(decl(name(__builtin_unreachable||panic||do_unexpected_trap||machine_halt||machine_restart||maybe_reboot)))"}
+-doc_end
+
+-doc_begin="Unreachability of an ASSERT_UNREACHABLE() and analogous macro calls is deliberate and safe."
+-config=MC3R1.R2.1,reports+={deliberate, "any_area(any_loc(any_exp(macro(name(ASSERT_UNREACHABLE||PARSE_ERR_RET||PARSE_ERR||FAIL_MSR||FAIL_CPUID)))))"}
 -doc_end
 
 -doc_begin="Proving compliance with respect to Rule 2.2 is generally impossible:
@@ -93,25 +98,11 @@ conform to the directive."
 -doc_begin="The project adopted the rule with an exception listed in
 'docs/misra/rules.rst'"
 -config=MC3R1.R5.3,reports+={safe, "any_area(any_loc(any_exp(macro(^READ_SYSREG$))&&any_exp(macro(^WRITE_SYSREG$))))"}
--config=MC3R1.R5.3,reports+={safe, "any_area(any_loc(any_exp(macro(^max_t$))&&any_exp(macro(^min_t$))))"}
+-config=MC3R1.R5.3,reports+={safe, "any_area(any_loc(any_exp(macro(^max(_t)?$))&&any_exp(macro(^min(_t)?$))))"}
 -config=MC3R1.R5.3,reports+={safe, "any_area(any_loc(any_exp(macro(^read[bwlq]$))&&any_exp(macro(^read[bwlq]_relaxed$))))"}
 -config=MC3R1.R5.3,reports+={safe, "any_area(any_loc(any_exp(macro(^per_cpu$))&&any_exp(macro(^this_cpu$))))"}
--doc_end
-
--doc_begin="The identifier 'fdt' is a widely-used name, for which no suitable
-substitute can be found. It is understood in 'xen/arch/arm/efi-boot.h' that the
-static variable 'fdt' cannot be confused with parameter names of the function
-declarations that are present in the file."
--file_tag+={efi_boot_h, "^xen/arch/arm/efi/efi-boot\\.h$"}
--config=MC3R1.R5.3,reports+={deliberate, "any_area(decl(kind(var)&&static_storage()&&^fdt$)&&any_loc(file(efi_boot_h)))"}
--doc_end
-
--doc_begin="The identifier 'start' is a widely-used name, for which no suitable
-substitute can be found. It is understood in 'xen/include/xen/kernel.h' that the
-extern variable 'start' cannot be confused with omonymous parameter names of the
-function declarations where that variable is visible."
--file_tag+={kernel_h, "^xen/include/xen/kernel\\.h$"}
--config=MC3R1.R5.3,reports+={deliberate, "any_area(decl(kind(var)&&linkage(external)&&^start$)&&any_loc(file(kernel_h)))"}
+-config=MC3R1.R5.3,reports+={safe, "any_area(any_loc(any_exp(macro(^__emulate_2op$))&&any_exp(macro(^__emulate_2op_nobyte$))))"}
+-config=MC3R1.R5.3,reports+={safe, "any_area(any_loc(any_exp(macro(^read_debugreg$))&&any_exp(macro(^write_debugreg$))))"}
 -doc_end
 
 -doc_begin="Function-like macros cannot be confused with identifiers that are
@@ -179,6 +170,11 @@ const-qualified."
 # Series 8.
 #
 
+-doc_begin="The following file is imported from Linux: ignore for now."
+-file_tag+={adopted_r8_2,"^xen/common/inflate\\.c$"}
+-config=MC3R1.R8.2,reports+={deliberate,"any_area(any_loc(file(adopted_r8_2)))"}
+-doc_end
+
 -doc_begin="The following variables are compiled in multiple translation units
 belonging to different executables and therefore are safe."
 -config=MC3R1.R8.6,declarations+={safe, "name(current_stack_pointer||bsearch||sort)"}
-- 
2.34.1


