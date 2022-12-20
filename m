Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7974651C95
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 09:51:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466593.725506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7YLF-00022O-Ro; Tue, 20 Dec 2022 08:51:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466593.725506; Tue, 20 Dec 2022 08:51:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7YLF-0001zt-Op; Tue, 20 Dec 2022 08:51:17 +0000
Received: by outflank-mailman (input) for mailman id 466593;
 Tue, 20 Dec 2022 08:51:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TAHQ=4S=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1p7YLE-0001kV-6i
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 08:51:16 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 757efa25-8043-11ed-91b6-6bf2151ebd3b;
 Tue, 20 Dec 2022 09:51:14 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1496AD7;
 Tue, 20 Dec 2022 00:51:54 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B1EA23F71A;
 Tue, 20 Dec 2022 00:51:12 -0800 (PST)
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
X-Inumbo-ID: 757efa25-8043-11ed-91b6-6bf2151ebd3b
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 01/18] arm: cppcheck: misra rule 20.7 deviations for alternative.h
Date: Tue, 20 Dec 2022 08:50:43 +0000
Message-Id: <20221220085100.22848-2-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221220085100.22848-1-luca.fancellu@arm.com>
References: <20221220085100.22848-1-luca.fancellu@arm.com>

Cppcheck reports violations of rule 20.7 in two macros of
alternative.h.

The first one is in the __ALT_PTR macro where cppcheck wants to have
parentheses on the second operand of a member access operator, which
is not allowed from the c language syntax, furthermore, the macro
parameter is never used as an expression, hence we can suppress the
finding.

The second finding is in the __ALTERNATIVE_CFG macro, where cppcheck
wants to have parentheses on the macro arguments, but the macro
parameters are never used as expressions and are used only for text
substitution, so cppcheck is not taking into account the context of
use of the macro arguments and adding parenthesis would break the
code, so we can suppress the finding.

No error was shown by eclair and coverity for those lines.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 docs/misra/false-positive-cppcheck.json | 14 ++++++++++++++
 xen/arch/arm/include/asm/alternative.h  |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/docs/misra/false-positive-cppcheck.json b/docs/misra/false-positive-cppcheck.json
index 5d4da2ce6170..5e7d9377f60b 100644
--- a/docs/misra/false-positive-cppcheck.json
+++ b/docs/misra/false-positive-cppcheck.json
@@ -3,6 +3,20 @@
     "content": [
         {
             "id": "SAF-0-false-positive-cppcheck",
+            "violation-id": "misra-c2012-20.7",
+            "tool-version": "2.7",
+            "name": "R20.7 second operand of member-access operator",
+            "text": "The second operand of a member access operator shall be a name of a member of the type pointed to, so in this particular case it is wrong to use parentheses on the macro parameter."
+        },
+        {
+            "id": "SAF-1-false-positive-cppcheck",
+            "violation-id": "misra-c2012-20.7",
+            "tool-version": "2.7",
+            "name": "R20.7 C macro parameters used only for text substitution",
+            "text": "The macro parameters used in this case are not part of an expression, they are used for text substitution."
+        },
+        {
+            "id": "SAF-2-false-positive-cppcheck",
             "violation-id": "",
             "tool-version": "",
             "name": "Sentinel",
diff --git a/xen/arch/arm/include/asm/alternative.h b/xen/arch/arm/include/asm/alternative.h
index 1eb4b60fbb3e..9d4dc53bb0c6 100644
--- a/xen/arch/arm/include/asm/alternative.h
+++ b/xen/arch/arm/include/asm/alternative.h
@@ -20,6 +20,7 @@ struct alt_instr {
 };
 
 /* Xen: helpers used by common code. */
+/* SAF-0-false-positive-cppcheck R20.7 member-access operator */
 #define __ALT_PTR(a,f)		((void *)&(a)->f + (a)->f)
 #define ALT_ORIG_PTR(a)		__ALT_PTR(a, orig_offset)
 #define ALT_REPL_PTR(a)		__ALT_PTR(a, alt_offset)
@@ -58,6 +59,7 @@ int apply_alternatives(const struct alt_instr *start, const struct alt_instr *en
  *
  * Alternatives with callbacks do not generate replacement instructions.
  */
+/* SAF-1-false-positive-cppcheck R20.7 argument for text substitution */
 #define __ALTERNATIVE_CFG(oldinstr, newinstr, feature, cfg_enabled, cb)	\
 	".if "__stringify(cfg_enabled)" == 1\n"				\
 	"661:\n\t"							\
-- 
2.17.1


