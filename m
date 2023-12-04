Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9D08038B1
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 16:24:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647121.1009874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAAnO-0006SP-Rn; Mon, 04 Dec 2023 15:23:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647121.1009874; Mon, 04 Dec 2023 15:23:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAAnO-0006PR-NE; Mon, 04 Dec 2023 15:23:42 +0000
Received: by outflank-mailman (input) for mailman id 647121;
 Mon, 04 Dec 2023 15:23:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=THDE=HP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rAAnN-00064x-Dh
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 15:23:41 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a5f6f12-92b9-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 16:23:40 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3A968220DA;
 Mon,  4 Dec 2023 15:23:40 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 1635813588;
 Mon,  4 Dec 2023 15:23:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id bag1BPzubWVHJgAAn2gu4w
 (envelope-from <jgross@suse.com>); Mon, 04 Dec 2023 15:23:40 +0000
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
X-Inumbo-ID: 1a5f6f12-92b9-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1701703420; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t+n+ooepeFxvmrkgaRJSTpiRMUBlO5vWL9QgpNTdaX0=;
	b=EdapVsXnX0I0jlf0s0el02O39j1XMRgi8tlpeUmnQa0INrGteU0d7xBvXYd5oiNLaeS/qO
	R895BemGN/X09+u2lKfFjeecvA1HsFcJv3gEUAgbSXQRo23c/UzjiPhQ0+chMTJIp45dAq
	pDczQTDAqZ1TukZy3itSsYuDcGe1wLI=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>
Subject: [PATCH v2 3/3] xen/sched: do some minor cleanup of sched_move_domain()
Date: Mon,  4 Dec 2023 16:23:21 +0100
Message-Id: <20231204152321.16520-4-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231204152321.16520-1-jgross@suse.com>
References: <20231204152321.16520-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spamd-Result: default: False [-0.30 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 REPLY(-4.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 TO_DN_SOME(0.00)[];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -0.30

Do some minor cleanups:

- Move setting of old_domdata and old_units next to each other
- Drop incrementing unit_idx in the final loop of sched_move_domain()
  as it isn't used afterwards
- Rename new_p to new_cpu and unit_p to unit_cpu

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 xen/common/sched/core.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 901782bbb4..f6ac1e5af8 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -698,7 +698,7 @@ int sched_move_domain(struct domain *d, struct cpupool *c)
     struct sched_unit *unit, *old_unit;
     struct sched_unit *new_units = NULL, *old_units;
     struct sched_unit **unit_ptr = &new_units;
-    unsigned int new_p, unit_idx;
+    unsigned int new_cpu, unit_idx;
     void *domdata;
     struct scheduler *old_ops = dom_scheduler(d);
     void *old_domdata;
@@ -748,13 +748,14 @@ int sched_move_domain(struct domain *d, struct cpupool *c)
     domain_pause(d);
 
     old_domdata = d->sched_priv;
+    old_units = d->sched_unit_list;
 
     /*
      * Remove all units from the old scheduler, and temporarily move them to
      * the same processor to make locking easier when moving the new units to
      * new processors.
      */
-    new_p = cpumask_first(d->cpupool->cpu_valid);
+    new_cpu = cpumask_first(d->cpupool->cpu_valid);
     for_each_sched_unit ( d, unit )
     {
         spinlock_t *lock;
@@ -762,12 +763,10 @@ int sched_move_domain(struct domain *d, struct cpupool *c)
         sched_remove_unit(old_ops, unit);
 
         lock = unit_schedule_lock_irq(unit);
-        sched_set_res(unit, get_sched_res(new_p));
+        sched_set_res(unit, get_sched_res(new_cpu));
         spin_unlock_irq(lock);
     }
 
-    old_units = d->sched_unit_list;
-
     d->cpupool = c;
     d->sched_priv = domdata;
 
@@ -781,32 +780,32 @@ int sched_move_domain(struct domain *d, struct cpupool *c)
         unit->state_entry_time = old_unit->state_entry_time;
         unit->runstate_cnt[v->runstate.state]++;
         /* Temporarily use old resource assignment */
-        unit->res = get_sched_res(new_p);
+        unit->res = get_sched_res(new_cpu);
 
         v->sched_unit = unit;
     }
 
     d->sched_unit_list = new_units;
 
-    new_p = cpumask_first(c->cpu_valid);
+    new_cpu = cpumask_first(c->cpu_valid);
     for_each_sched_unit ( d, unit )
     {
         spinlock_t *lock;
-        unsigned int unit_p = new_p;
+        unsigned int unit_cpu = new_cpu;
 
         for_each_sched_unit_vcpu ( unit, v )
         {
-            migrate_timer(&v->periodic_timer, new_p);
-            migrate_timer(&v->singleshot_timer, new_p);
-            migrate_timer(&v->poll_timer, new_p);
-            new_p = cpumask_cycle(new_p, c->cpu_valid);
+            migrate_timer(&v->periodic_timer, new_cpu);
+            migrate_timer(&v->singleshot_timer, new_cpu);
+            migrate_timer(&v->poll_timer, new_cpu);
+            new_cpu = cpumask_cycle(new_cpu, c->cpu_valid);
         }
 
         lock = unit_schedule_lock_irq(unit);
 
         sched_set_affinity(unit, &cpumask_all, &cpumask_all);
 
-        sched_set_res(unit, get_sched_res(unit_p));
+        sched_set_res(unit, get_sched_res(unit_cpu));
         /*
          * With v->processor modified we must not
          * - make any further changes assuming we hold the scheduler lock,
@@ -818,8 +817,6 @@ int sched_move_domain(struct domain *d, struct cpupool *c)
             sched_move_irqs(unit);
 
         sched_insert_unit(c->sched, unit);
-
-        unit_idx++;
     }
 
     domain_update_node_affinity(d);
-- 
2.35.3


