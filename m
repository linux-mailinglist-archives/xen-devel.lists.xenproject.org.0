Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D619894C96
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 09:24:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700000.1092490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrYVM-0004LL-Pi; Tue, 02 Apr 2024 07:24:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700000.1092490; Tue, 02 Apr 2024 07:24:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrYVM-0004DM-KR; Tue, 02 Apr 2024 07:24:24 +0000
Received: by outflank-mailman (input) for mailman id 700000;
 Tue, 02 Apr 2024 07:24:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tdu6=LH=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rrYVL-0003jQ-Ge
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 07:24:23 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 068280dd-f0c2-11ee-a1ef-f123f15fe8a2;
 Tue, 02 Apr 2024 09:24:22 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-82-59-164-46.retail.telecomitalia.it [82.59.164.46])
 by support.bugseng.com (Postfix) with ESMTPSA id 77F4D4EE0743;
 Tue,  2 Apr 2024 09:24:21 +0200 (CEST)
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
X-Inumbo-ID: 068280dd-f0c2-11ee-a1ef-f123f15fe8a2
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>
Subject: [XEN PATCH 5/7] xen/sched: address a violation of MISRA C:2012 Rule 16.3
Date: Tue,  2 Apr 2024 09:22:08 +0200
Message-Id: <dcb134b4094104632b05270f01accebcf7c04c4e.1712042178.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712042178.git.federico.serafini@bugseng.com>
References: <cover.1712042178.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add break statement to address a violation of MISRA C:2012 Rule 16.3
("An unconditional `break' statement shall terminate every
switch-clause ").

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/common/sched/core.c | 1 +
 1 file changed, 1 insertion(+)

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
-- 
2.34.1


