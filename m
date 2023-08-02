Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C570876D03E
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 16:38:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574980.900706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRCzv-0000Eu-Oq; Wed, 02 Aug 2023 14:38:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574980.900706; Wed, 02 Aug 2023 14:38:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRCzv-00007s-DW; Wed, 02 Aug 2023 14:38:47 +0000
Received: by outflank-mailman (input) for mailman id 574980;
 Wed, 02 Aug 2023 14:38:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YIS5=DT=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qRCzt-0006bO-Hd
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 14:38:45 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4884aa7a-3142-11ee-b260-6b7b168915f2;
 Wed, 02 Aug 2023 16:38:45 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 519DB4EE0746;
 Wed,  2 Aug 2023 16:38:44 +0200 (CEST)
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
X-Inumbo-ID: 4884aa7a-3142-11ee-b260-6b7b168915f2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>
Subject: [XEN PATCH 10/11] xen/sched: add ASSERT_UNREACHABLE() to address MISRA C:2012 Rule 2.1
Date: Wed,  2 Aug 2023 16:38:16 +0200
Message-Id: <3f1385f2ddb151a53ca092ea1caeac5d12fd80f5.1690985045.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690985045.git.nicola.vetrini@bugseng.com>
References: <cover.1690985045.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The break statement after the return statement is definitely unreachable.
As such, an call to the ASSERT_UNREACHABLE() macro is added to signal
the intentionality of such construct.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
The break in the clause is mandated by Required Rule 16.3, which is
not yet an accepted rule for Xen, but may be in the future.
---
 xen/common/sched/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 022f548652..fcee902b4e 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -2233,6 +2233,7 @@ static bool sched_tasklet_check_cpu(unsigned int cpu)
         /* fallthrough */
     case TASKLET_enqueued|TASKLET_scheduled:
         return true;
+        ASSERT_UNREACHABLE();
         break;
     case TASKLET_scheduled:
         clear_bit(_TASKLET_scheduled, tasklet_work);
-- 
2.34.1


