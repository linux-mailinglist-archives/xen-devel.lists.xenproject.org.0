Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC4F651C9F
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 09:51:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466600.725582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7YLN-0003wQ-PH; Tue, 20 Dec 2022 08:51:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466600.725582; Tue, 20 Dec 2022 08:51:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7YLN-0003s5-H5; Tue, 20 Dec 2022 08:51:25 +0000
Received: by outflank-mailman (input) for mailman id 466600;
 Tue, 20 Dec 2022 08:51:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TAHQ=4S=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1p7YLL-0001kP-MS
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 08:51:23 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 7aa15c4f-8043-11ed-8fd4-01056ac49cbb;
 Tue, 20 Dec 2022 09:51:22 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 242B8FEC;
 Tue, 20 Dec 2022 00:52:03 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1A7AA3F71A;
 Tue, 20 Dec 2022 00:51:20 -0800 (PST)
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
X-Inumbo-ID: 7aa15c4f-8043-11ed-8fd4-01056ac49cbb
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH 08/18] xen: cppcheck: misra rule 20.7 deviation on init.h
Date: Tue, 20 Dec 2022 08:50:50 +0000
Message-Id: <20221220085100.22848-9-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221220085100.22848-1-luca.fancellu@arm.com>
References: <20221220085100.22848-1-luca.fancellu@arm.com>

Cppcheck has found violations of rule 20.7 for the macros
__init_call, presmp_initcall, __initcall and __exitcall.
For the first one, the macro parameter is never used as an expression,
it is used for text substitution but cppcheck is not taking into
account the context of use of the argument, so we can suppress the
finding.
For the other findings, the argument is not used as an expression,
but adding parenthesis doesn't harm the code or the readability,
hence add parenthesis on the argument.

Eclair and coverity does not report these findings.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/include/xen/init.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/xen/include/xen/init.h b/xen/include/xen/init.h
index 0af0e234ec80..7c072b7c8cf8 100644
--- a/xen/include/xen/init.h
+++ b/xen/include/xen/init.h
@@ -15,6 +15,7 @@
 #define __initconstrel    __section(".init.rodata.rel")
 #define __exitdata        __used_section(".exit.data")
 #define __initsetup       __used_section(".init.setup")
+/* SAF-1-false-positive-cppcheck R20.7 argument as text substitution */
 #define __init_call(lvl)  __used_section(".initcall" lvl ".init")
 #define __exit_call       __used_section(".exitcall.exit")
 
@@ -65,11 +66,11 @@ typedef int (*initcall_t)(void);
 typedef void (*exitcall_t)(void);
 
 #define presmp_initcall(fn) \
-    const static initcall_t __initcall_##fn __init_call("presmp") = fn
+    const static initcall_t __initcall_##fn __init_call("presmp") = (fn)
 #define __initcall(fn) \
-    const static initcall_t __initcall_##fn __init_call("1") = fn
+    const static initcall_t __initcall_##fn __init_call("1") = (fn)
 #define __exitcall(fn) \
-    static exitcall_t __exitcall_##fn __exit_call = fn
+    static exitcall_t __exitcall_##fn __exit_call = (fn)
 
 void do_presmp_initcalls(void);
 void do_initcalls(void);
-- 
2.17.1


