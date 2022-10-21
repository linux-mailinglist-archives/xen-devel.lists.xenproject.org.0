Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C26F606FDA
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 08:11:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427317.676248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ollF4-0000NA-NP; Fri, 21 Oct 2022 06:10:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427317.676248; Fri, 21 Oct 2022 06:10:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ollF4-0000Jw-KH; Fri, 21 Oct 2022 06:10:50 +0000
Received: by outflank-mailman (input) for mailman id 427317;
 Fri, 21 Oct 2022 06:10:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MvAv=2W=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ollF2-0000Jq-IL
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 06:10:48 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19ffb296-5107-11ed-8fd0-01056ac49cbb;
 Fri, 21 Oct 2022 08:10:46 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 97A9B22C54;
 Fri, 21 Oct 2022 06:10:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 639DF1331A;
 Fri, 21 Oct 2022 06:10:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id vebXFuY3UmPVCgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 21 Oct 2022 06:10:46 +0000
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
X-Inumbo-ID: 19ffb296-5107-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1666332646; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=bqLHr7xdf2s6MPXaZzVuVmeRug0iVbBjWqS+JN8wLsY=;
	b=qdbyNn41WzhxHZkEOemYZwVqnx1+UsCP1rGvHjTw2/DM0dzbU71AlbWVfTlzFbaNWDhEzS
	4G4E8NZYu4I1JQF+9iY1QFYibNacXn9Iz7rhHSsUKtS8GlSXZcFZI1Oz7N0To/wGwevBj+
	3zUPS4Jv8GmZ0roJbcxsaDh/4LViHW8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Meng Xu <mengxu@cis.upenn.edu>,
	George Dunlap <george.dunlap@citrix.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH-for-4.17] xen/sched: fix race in RTDS scheduler
Date: Fri, 21 Oct 2022 08:10:42 +0200
Message-Id: <20221021061042.12083-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a domain gets paused the unit runnable state can change to "not
runnable" without the scheduling lock being involved. This means that
a specific scheduler isn't involved in this change of runnable state.

In the RTDS scheduler this can result in an inconsistency in case a
unit is losing its "runnable" capability while the RTDS scheduler's
scheduling function is active. RTDS will remove the unit from the run
queue, but doesn't do so for the replenish queue, leading to hitting
an ASSERT() in replq_insert() later when the domain is unpaused again.

Fix that by removing the unit from the replenish queue as well in this
case.

Fixes: 7c7b407e7772 ("xen/sched: introduce unit_runnable_state()")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/sched/rt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
index d6de25531b..960a8033e2 100644
--- a/xen/common/sched/rt.c
+++ b/xen/common/sched/rt.c
@@ -1087,6 +1087,7 @@ rt_schedule(const struct scheduler *ops, struct sched_unit *currunit,
         else if ( !unit_runnable_state(snext->unit) )
         {
             q_remove(snext);
+            replq_remove(ops, snext);
             snext = rt_unit(sched_idle_unit(sched_cpu));
         }
 
-- 
2.35.3


