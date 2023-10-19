Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D11FD7CF69F
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 13:23:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619222.963952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtR7a-0007TN-7T; Thu, 19 Oct 2023 11:23:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619222.963952; Thu, 19 Oct 2023 11:23:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtR7a-0007RU-4p; Thu, 19 Oct 2023 11:23:22 +0000
Received: by outflank-mailman (input) for mailman id 619222;
 Thu, 19 Oct 2023 11:23:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yz61=GB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qtR7Y-0007RO-MQ
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 11:23:20 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e72dbaa9-6e71-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 13:23:18 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 366521F38C;
 Thu, 19 Oct 2023 11:23:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 073D2139C2;
 Thu, 19 Oct 2023 11:23:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id r2xiAKURMWWMGQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 19 Oct 2023 11:23:17 +0000
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
X-Inumbo-ID: e72dbaa9-6e71-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1697714597; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=JkdZSn6b+HgIOqHEQHEvOTxmV6yWUbnbXpERNmhJ/Vg=;
	b=O2hiSODSa0+biWi1ys7+YX4oy7uTwOV8REFetsYVaWlNLOyAgUoGxQn+6KCD1oDPRXGHIv
	amHGn/42da3NuFF7PZjk4A/bezOa7fdX0EMT6ckyuBOE+Oxst3amc9xRsJZhkXm1Iy+KJN
	mcdj4tW/+xdmBM1VV0e1voFoqa6CmWQ=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH] xen/sched: fix sched_move_domain()
Date: Thu, 19 Oct 2023 13:23:14 +0200
Message-Id: <20231019112314.22665-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: 0.48
X-Spamd-Result: default: False [0.48 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.42)[78.22%]
X-Spam-Flag: NO

When moving a domain out of a cpupool running with the credit2
scheduler and having multiple run-queues, the following ASSERT() can
be observed:

(XEN) Xen call trace:
(XEN)    [<ffff82d04023a700>] R credit2.c#csched2_unit_remove+0xe3/0xe7
(XEN)    [<ffff82d040246adb>] S sched_move_domain+0x2f3/0x5b1
(XEN)    [<ffff82d040234cf7>] S cpupool.c#cpupool_move_domain_locked+0x1d/0x3b
(XEN)    [<ffff82d040236025>] S cpupool_move_domain+0x24/0x35
(XEN)    [<ffff82d040206513>] S domain_kill+0xa5/0x116
(XEN)    [<ffff82d040232b12>] S do_domctl+0xe5f/0x1951
(XEN)    [<ffff82d0402276ba>] S timer.c#timer_lock+0x69/0x143
(XEN)    [<ffff82d0402dc71b>] S pv_hypercall+0x44e/0x4a9
(XEN)    [<ffff82d0402012b7>] S lstar_enter+0x137/0x140
(XEN)
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 1:
(XEN) Assertion 'svc->rqd == c2rqd(sched_unit_master(unit))' failed at common/sched/credit2.c:1159
(XEN) ****************************************

This is happening as sched_move_domain() is setting a different cpu
for a scheduling unit without telling the scheduler. When this unit is
removed from the scheduler, the ASSERT() will trigger.

In non-debug builds the result is usually a clobbered pointer, leading
to another crash a short time later.

Fix that by swapping the two involved actions (setting another cpu and
removing the unit from the scheduler).

Cc: Henry Wang <Henry.Wang@arm.com>
Fixes: 70fadc41635b ("xen/cpupool: support moving domain between cpupools with different granularity")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
This fixes a regression introduced in Xen 4.15. The fix is very simple
and it will affect only configurations with multiple cpupools. I think
whether to include it in 4.18 should be decided by the release manager
based on the current state of the release (I think I wouldn't have
added it that late in the release while being the release manager).
---
 xen/common/sched/core.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 12deefa745..e9f7486197 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -738,12 +738,13 @@ int sched_move_domain(struct domain *d, struct cpupool *c)
     new_p = cpumask_first(d->cpupool->cpu_valid);
     for_each_sched_unit ( d, unit )
     {
-        spinlock_t *lock = unit_schedule_lock_irq(unit);
+        spinlock_t *lock;
+
+        sched_remove_unit(old_ops, unit);
 
+        lock = unit_schedule_lock_irq(unit);
         sched_set_res(unit, get_sched_res(new_p));
         spin_unlock_irq(lock);
-
-        sched_remove_unit(old_ops, unit);
     }
 
     old_units = d->sched_unit_list;
-- 
2.35.3


