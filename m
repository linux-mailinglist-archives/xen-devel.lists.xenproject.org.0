Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D296E7C8890
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 17:25:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616668.958894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrK2D-0004ms-3I; Fri, 13 Oct 2023 15:25:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616668.958894; Fri, 13 Oct 2023 15:25:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrK2C-0004jA-Vi; Fri, 13 Oct 2023 15:25:04 +0000
Received: by outflank-mailman (input) for mailman id 616668;
 Fri, 13 Oct 2023 15:25:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1cw9=F3=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qrK2A-0002kz-SM
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 15:25:02 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad7bdd30-69dc-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 17:25:02 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.161.222.93])
 by support.bugseng.com (Postfix) with ESMTPSA id 7F18C4EE0744;
 Fri, 13 Oct 2023 17:25:00 +0200 (CEST)
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
X-Inumbo-ID: ad7bdd30-69dc-11ee-98d4-6d05b1d4d9a1
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Henry Wang <henry.wang@arm.com>
Subject: [XEN PATCH 07/10] arm/traps: address a violation of MISRA C:2012 Rule 8.2
Date: Fri, 13 Oct 2023 17:24:37 +0200
Message-Id: <dbc0e965cd9f93848d27e7ebf0ffcfca05499d58.1697207038.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697207038.git.federico.serafini@bugseng.com>
References: <cover.1697207038.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter name, no functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/arm/traps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index ce89f16404..5aa14d4707 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -1236,7 +1236,7 @@ int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc)
 
     if ( id == BUGFRAME_run_fn )
     {
-        void (*fn)(const struct cpu_user_regs *) = (void *)regs->BUG_FN_REG;
+        void (*fn)(const struct cpu_user_regs *regs) = (void *)regs->BUG_FN_REG;
 
         fn(regs);
         return 0;
-- 
2.34.1


