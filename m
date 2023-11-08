Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 219747E5A4B
	for <lists+xen-devel@lfdr.de>; Wed,  8 Nov 2023 16:43:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629337.981482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0khc-0007DY-4c; Wed, 08 Nov 2023 15:42:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629337.981482; Wed, 08 Nov 2023 15:42:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0khc-0007AK-1w; Wed, 08 Nov 2023 15:42:48 +0000
Received: by outflank-mailman (input) for mailman id 629337;
 Wed, 08 Nov 2023 15:42:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L/Mx=GV=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1r0kha-0007A8-BG
 for xen-devel@lists.xenproject.org; Wed, 08 Nov 2023 15:42:46 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7573c329-7e4d-11ee-98da-6d05b1d4d9a1;
 Wed, 08 Nov 2023 16:42:44 +0100 (CET)
Received: from Dell.bugseng.com (unknown [37.161.125.27])
 by support.bugseng.com (Postfix) with ESMTPSA id 211C04EE0737;
 Wed,  8 Nov 2023 16:42:42 +0100 (CET)
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
X-Inumbo-ID: 7573c329-7e4d-11ee-98da-6d05b1d4d9a1
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH v2] xen/arm: traps: address a violation of MISRA C:2012 Rule 8.2
Date: Wed,  8 Nov 2023 16:42:35 +0100
Message-Id: <24c2e8b7a7becc6b16d0b37f2c642a9b9e976269.1699457659.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter name "regs" and introduce function type
bug_fn_t: this improves readability and helps to validate that the
function passed to run_in_exception_handle() has the expected
prototype.
No functional change.

Suggested-by: Julien Grall <julien@xen.org>
Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
Changes in v2:
  - adjusted tag;
  - avoided exceeding the 80-character limit.
---
 xen/arch/arm/traps.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index ce89f16404..1264eab087 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -1236,7 +1236,8 @@ int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc)
 
     if ( id == BUGFRAME_run_fn )
     {
-        void (*fn)(const struct cpu_user_regs *) = (void *)regs->BUG_FN_REG;
+        typedef void (*bug_fn_t)(const struct cpu_user_regs *regs);
+        bug_fn_t fn = (void *)regs->BUG_FN_REG;
 
         fn(regs);
         return 0;
-- 
2.34.1


