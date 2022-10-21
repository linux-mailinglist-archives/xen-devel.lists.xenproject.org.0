Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6845660751F
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 12:40:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427570.676771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olpRO-00072U-3A; Fri, 21 Oct 2022 10:39:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427570.676771; Fri, 21 Oct 2022 10:39:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olpRO-0006zV-07; Fri, 21 Oct 2022 10:39:50 +0000
Received: by outflank-mailman (input) for mailman id 427570;
 Fri, 21 Oct 2022 10:39:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MvAv=2W=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1olpRM-0006zN-H5
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 10:39:48 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aefc994f-512c-11ed-91b5-6bf2151ebd3b;
 Fri, 21 Oct 2022 12:39:47 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3D00F222E0;
 Fri, 21 Oct 2022 10:39:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 02E2B1331A;
 Fri, 21 Oct 2022 10:39:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IEXQOfJ2UmOQIgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 21 Oct 2022 10:39:46 +0000
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
X-Inumbo-ID: aefc994f-512c-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1666348787; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=SxgbxSMyb0IFJGx0g8YtqshvcZalAQw+dJK/WArNEog=;
	b=txepUFtSN5gyKNLYR8SWIaXWBdY49vmiII+MfWBoopNd8Y2zNTTyFUfW2GHxYIJq3csZx6
	WzW4YPCVzZbOS73PXpu0P0oLBDSmi95iaLP0UDCOG8I3VUVO1a9RMepIgAPeLkBkymXRty
	FUOnlsXDfjFMF+oCpDAhVjlrzTHNmwM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Meng Xu <mengxu@cis.upenn.edu>,
	George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH] xen/sched: try harder to find a runnable unit in rt_schedule()
Date: Fri, 21 Oct 2022 12:39:45 +0200
Message-Id: <20221021103945.4416-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of directly falling back to the idle unit in case the top
unit from the run queue happened to be not runnable, consult the run
queue again.

Suggested-by: Dario Faggioli <dfaggioli@suse.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/sched/rt.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
index 960a8033e2..1f8d074884 100644
--- a/xen/common/sched/rt.c
+++ b/xen/common/sched/rt.c
@@ -1080,15 +1080,20 @@ rt_schedule(const struct scheduler *ops, struct sched_unit *currunit,
     }
     else
     {
-        snext = runq_pick(ops, cpumask_of(sched_cpu), cur_cpu);
-
-        if ( snext == NULL )
-            snext = rt_unit(sched_idle_unit(sched_cpu));
-        else if ( !unit_runnable_state(snext->unit) )
+        while ( true )
         {
+            snext = runq_pick(ops, cpumask_of(sched_cpu), cur_cpu);
+
+            if ( snext == NULL )
+            {
+                snext = rt_unit(sched_idle_unit(sched_cpu));
+                break;
+            }
+            if ( unit_runnable_state(snext->unit) )
+                break;
+
             q_remove(snext);
             replq_remove(ops, snext);
-            snext = rt_unit(sched_idle_unit(sched_cpu));
         }
 
         /* if scurr has higher priority and budget, still pick scurr */
-- 
2.35.3


