Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3DB898271
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 09:50:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700704.1094244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsHqu-00047w-F0; Thu, 04 Apr 2024 07:49:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700704.1094244; Thu, 04 Apr 2024 07:49:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsHqu-000455-C3; Thu, 04 Apr 2024 07:49:40 +0000
Received: by outflank-mailman (input) for mailman id 700704;
 Thu, 04 Apr 2024 07:49:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WQJu=LJ=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rsHqt-00044q-DZ
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 07:49:39 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2e9403e-f257-11ee-afe5-a90da7624cb6;
 Thu, 04 Apr 2024 09:49:38 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-82-59-164-46.retail.telecomitalia.it [82.59.164.46])
 by support.bugseng.com (Postfix) with ESMTPSA id B76EB4EE0742;
 Thu,  4 Apr 2024 09:49:37 +0200 (CEST)
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
X-Inumbo-ID: e2e9403e-f257-11ee-afe5-a90da7624cb6
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>
Subject: [XEN PATCH v2 1/2] xen/sched: address violations of MISRA C:2012 Rule 16.3
Date: Thu,  4 Apr 2024 09:49:28 +0200
Message-Id: <08c449728221c9c2b9e87f22eb9d0cffbf7ecf68.1712215939.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712215939.git.federico.serafini@bugseng.com>
References: <cover.1712215939.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add break statement to address a violation of MISRA C:2012 Rule 16.3
("An unconditional `break' statement shall terminate every
switch-clause").
Replace deprecated comment /* FALLTHRU */ with pseudo-keyword
fallthrough to meet the requirements to deviate the rule.

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
Changes in v2:
- this patch is the result of merging together two different patches with the
  same title;
- commit message has been improved to make clear that the comment is
  deprecated.
---
 xen/common/sched/core.c    | 1 +
 xen/common/sched/credit2.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 3e48da1cdd..0cb33831d2 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -2007,6 +2007,7 @@ ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 
     default:
         ret = -ENOSYS;
+        break;
     }
 
     return ret;
diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index c76330d79d..0962b52415 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -3152,8 +3152,8 @@ static int cf_check csched2_sys_cntl(
             printk(XENLOG_INFO "Disabling context switch rate limiting\n");
         prv->ratelimit_us = params->ratelimit_us;
         write_unlock_irqrestore(&prv->lock, flags);
+        fallthrough;
 
-    /* FALLTHRU */
     case XEN_SYSCTL_SCHEDOP_getinfo:
         params->ratelimit_us = prv->ratelimit_us;
         break;
-- 
2.34.1


