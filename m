Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5C0894C95
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 09:24:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.699999.1092484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrYVM-0004ER-Gc; Tue, 02 Apr 2024 07:24:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699999.1092484; Tue, 02 Apr 2024 07:24:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrYVM-00044X-8F; Tue, 02 Apr 2024 07:24:24 +0000
Received: by outflank-mailman (input) for mailman id 699999;
 Tue, 02 Apr 2024 07:24:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tdu6=LH=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rrYVK-0003jD-Lj
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 07:24:22 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05dbd7cd-f0c2-11ee-afe5-a90da7624cb6;
 Tue, 02 Apr 2024 09:24:20 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-82-59-164-46.retail.telecomitalia.it [82.59.164.46])
 by support.bugseng.com (Postfix) with ESMTPSA id 8B4A04EE0743;
 Tue,  2 Apr 2024 09:24:20 +0200 (CEST)
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
X-Inumbo-ID: 05dbd7cd-f0c2-11ee-afe5-a90da7624cb6
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>
Subject: [XEN PATCH 3/7] xen/sched: address a violation of MISRA C:2012 Rule 16.3
Date: Tue,  2 Apr 2024 09:22:06 +0200
Message-Id: <8f91430e37594831dd8d92ab630477be88417b49.1712042178.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712042178.git.federico.serafini@bugseng.com>
References: <cover.1712042178.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use pseudo-keyword fallthrough to meet the requirements to deviate
MISRA C:2012 Rule 16.3 ("An unconditional `break' statement shall
terminate every switch-clause").

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/common/sched/credit2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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


