Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B74E7EED88
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 09:29:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634872.990426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3uDf-0001Tk-3B; Fri, 17 Nov 2023 08:28:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634872.990426; Fri, 17 Nov 2023 08:28:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3uDe-0001S5-VG; Fri, 17 Nov 2023 08:28:54 +0000
Received: by outflank-mailman (input) for mailman id 634872;
 Fri, 17 Nov 2023 08:28:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Lb0=G6=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1r3uDd-0001Rz-5V
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 08:28:53 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 555ee0bc-8523-11ee-9b0e-b553b5be7939;
 Fri, 17 Nov 2023 09:28:50 +0100 (CET)
Received: from Dell.bugseng.com (unknown [37.163.77.7])
 by support.bugseng.com (Postfix) with ESMTPSA id D519A4EE0744;
 Fri, 17 Nov 2023 09:28:47 +0100 (CET)
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
X-Inumbo-ID: 555ee0bc-8523-11ee-9b0e-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v3] xen: introduce function type bug_fn_t.
Date: Fri, 17 Nov 2023 09:28:26 +0100
Message-Id: <3942021ff51b117ab2b50aecd6e75353cd73ab20.1700158707.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce function type bug_fn_t. This improves readability and helps
to validate that the function passed to run_in_exception_handle() has
the expected prototype.

Use the newly-intoduced type to address a violation of MISRA
C:2012 Rule 8.2.

Suggested-by: Julien Grall <julien@xen.org>
Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/arm/traps.c  | 2 +-
 xen/include/xen/bug.h | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index ce89f16404..8492e2b7bb 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -1236,7 +1236,7 @@ int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc)
 
     if ( id == BUGFRAME_run_fn )
     {
-        void (*fn)(const struct cpu_user_regs *) = (void *)regs->BUG_FN_REG;
+        bug_fn_t *fn = (void *)regs->BUG_FN_REG;
 
         fn(regs);
         return 0;
diff --git a/xen/include/xen/bug.h b/xen/include/xen/bug.h
index e8a4eea71a..cb5138410e 100644
--- a/xen/include/xen/bug.h
+++ b/xen/include/xen/bug.h
@@ -99,6 +99,9 @@ struct bug_frame {
 
 #endif
 
+struct cpu_user_regs;
+typedef void bug_fn_t(const struct cpu_user_regs *regs);
+
 #ifndef run_in_exception_handler
 
 /*
@@ -132,8 +135,6 @@ struct bug_frame {
 
 #ifdef CONFIG_GENERIC_BUG_FRAME
 
-struct cpu_user_regs;
-
 /*
  * Returns a negative value in case of an error otherwise
  * BUGFRAME_{run_fn, warn, bug, assert}
-- 
2.34.1


