Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 767F980C693
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 11:31:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651596.1017334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCdYc-0005gf-OO; Mon, 11 Dec 2023 10:30:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651596.1017334; Mon, 11 Dec 2023 10:30:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCdYc-0005ej-LG; Mon, 11 Dec 2023 10:30:38 +0000
Received: by outflank-mailman (input) for mailman id 651596;
 Mon, 11 Dec 2023 10:30:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BtsV=HW=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rCdYb-00059V-5z
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 10:30:37 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52789d88-9810-11ee-98e8-6d05b1d4d9a1;
 Mon, 11 Dec 2023 11:30:36 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 216EA4EE0744;
 Mon, 11 Dec 2023 11:30:36 +0100 (CET)
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
X-Inumbo-ID: 52789d88-9810-11ee-98e8-6d05b1d4d9a1
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>
Subject: [XEN PATCH 4/7] xen/sched: address MISRA C:2012 Rule 2.1
Date: Mon, 11 Dec 2023 11:30:25 +0100
Message-Id: <4006f1eb1977a89a57c5c02f003a2fefc06dfc42.1702283415.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702283415.git.nicola.vetrini@bugseng.com>
References: <cover.1702283415.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The break statement after the return statement is definitely unreachable
and can be removed with no functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/common/sched/core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index f6ac1e5af8bd..d177c675c81b 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -2239,7 +2239,6 @@ static bool sched_tasklet_check_cpu(unsigned int cpu)
         /* fallthrough */
     case TASKLET_enqueued|TASKLET_scheduled:
         return true;
-        break;
     case TASKLET_scheduled:
         clear_bit(_TASKLET_scheduled, tasklet_work);
         /* fallthrough */
-- 
2.34.1


