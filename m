Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F70A5EF99
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 10:32:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911702.1318101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsev5-0000kd-CY; Thu, 13 Mar 2025 09:32:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911702.1318101; Thu, 13 Mar 2025 09:32:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsev5-0000j1-9A; Thu, 13 Mar 2025 09:32:03 +0000
Received: by outflank-mailman (input) for mailman id 911702;
 Thu, 13 Mar 2025 09:32:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oZoU=WA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tsev4-0000iv-Bz
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 09:32:02 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04494e61-ffee-11ef-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 10:32:01 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B48CF21192;
 Thu, 13 Mar 2025 09:32:00 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 75CF1137BA;
 Thu, 13 Mar 2025 09:32:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id PFNbGxCm0md5OQAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 13 Mar 2025 09:32:00 +0000
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
X-Inumbo-ID: 04494e61-ffee-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1741858320; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=M+CCvI7ESFCVI0+iNCbHsd2z9jFiWpc1UaEfWkSbBnE=;
	b=OJ68MAX3iOYqx4QlMyCWZEDMBWA5bEwZnxfrntETclHIc82lQVwEzgrXJB9RqNLqtSg4O9
	MU4wbn3V9daXStUupkhvKl1gWq4SwOVedet1JWsKov5ghiqlv+e+WzluMrf4Rv++YVlpd6
	BEBju3FzvHZqOqG2sKj82pxvEdDP8Hc=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1741858320; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=M+CCvI7ESFCVI0+iNCbHsd2z9jFiWpc1UaEfWkSbBnE=;
	b=OJ68MAX3iOYqx4QlMyCWZEDMBWA5bEwZnxfrntETclHIc82lQVwEzgrXJB9RqNLqtSg4O9
	MU4wbn3V9daXStUupkhvKl1gWq4SwOVedet1JWsKov5ghiqlv+e+WzluMrf4Rv++YVlpd6
	BEBju3FzvHZqOqG2sKj82pxvEdDP8Hc=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	xen-devel@dornerworks.com
Cc: Juergen Gross <jgross@suse.com>,
	Nathan Studer <nathan.studer@dornerworks.com>,
	Stewart Hildebrand <stewart@stew.dk>,
	Dario Faggioli <dfaggioli@suse.com>,
	George Dunlap <gwd@xenproject.org>,
	Choi Anderson <Anderson.Choi@boeing.com>
Subject: [PATCH] xen/sched: fix arinc653 to not use variables across cpupools
Date: Thu, 13 Mar 2025 10:31:57 +0100
Message-ID: <20250313093157.30450-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

a653sched_do_schedule() is using two function local static variables,
which is resulting in bad behavior when using more than one cpupool
with the arinc653 scheduler.

Fix that by moving those variables to the scheduler private data.

Fixes: 22787f2e107c ("ARINC 653 scheduler")
Reported-by: Choi Anderson <Anderson.Choi@boeing.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/sched/arinc653.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c
index a82c0d7314..9ebae6d7ae 100644
--- a/xen/common/sched/arinc653.c
+++ b/xen/common/sched/arinc653.c
@@ -143,6 +143,12 @@ typedef struct a653sched_priv_s
      * pointers to all Xen UNIT structures for iterating through
      */
     struct list_head unit_list;
+
+    /**
+     * scheduling house keeping variables
+     */
+    unsigned int sched_index;
+    s_time_t next_switch_time;
 } a653sched_priv_t;
 
 /**************************************************************************
@@ -513,8 +519,6 @@ a653sched_do_schedule(
     bool tasklet_work_scheduled)
 {
     struct sched_unit *new_task = NULL;
-    static unsigned int sched_index = 0;
-    static s_time_t next_switch_time;
     a653sched_priv_t *sched_priv = SCHED_PRIV(ops);
     const unsigned int cpu = sched_get_resource_cpu(smp_processor_id());
     unsigned long flags;
@@ -528,18 +532,19 @@ a653sched_do_schedule(
         /* time to enter a new major frame
          * the first time this function is called, this will be true */
         /* start with the first domain in the schedule */
-        sched_index = 0;
+        sched_priv->sched_index = 0;
         sched_priv->next_major_frame = now + sched_priv->major_frame;
-        next_switch_time = now + sched_priv->schedule[0].runtime;
+        sched_priv->next_switch_time = now + sched_priv->schedule[0].runtime;
     }
     else
     {
-        while ( (now >= next_switch_time)
-                && (sched_index < sched_priv->num_schedule_entries) )
+        while ( (now >= sched_priv->next_switch_time) &&
+                (sched_priv->sched_index < sched_priv->num_schedule_entries) )
         {
             /* time to switch to the next domain in this major frame */
-            sched_index++;
-            next_switch_time += sched_priv->schedule[sched_index].runtime;
+            sched_priv->sched_index++;
+            sched_priv->next_switch_time +=
+                sched_priv->schedule[sched_priv->sched_index].runtime;
         }
     }
 
@@ -547,8 +552,8 @@ a653sched_do_schedule(
      * If we exhausted the domains in the schedule and still have time left
      * in the major frame then switch next at the next major frame.
      */
-    if ( sched_index >= sched_priv->num_schedule_entries )
-        next_switch_time = sched_priv->next_major_frame;
+    if ( sched_priv->sched_index >= sched_priv->num_schedule_entries )
+        sched_priv->next_switch_time = sched_priv->next_major_frame;
 
     /*
      * If there are more domains to run in the current major frame, set
@@ -556,8 +561,8 @@ a653sched_do_schedule(
      * Otherwise, set new_task equal to the address of the idle task's
      * sched_unit structure.
      */
-    new_task = (sched_index < sched_priv->num_schedule_entries)
-        ? sched_priv->schedule[sched_index].unit
+    new_task = (sched_priv->sched_index < sched_priv->num_schedule_entries)
+        ? sched_priv->schedule[sched_priv->sched_index].unit
         : IDLETASK(cpu);
 
     /* Check to see if the new task can be run (awake & runnable). */
@@ -589,7 +594,7 @@ a653sched_do_schedule(
      * Return the amount of time the next domain has to run and the address
      * of the selected task's UNIT structure.
      */
-    prev->next_time = next_switch_time - now;
+    prev->next_time = sched_priv->next_switch_time - now;
     prev->next_task = new_task;
     new_task->migrated = false;
 
-- 
2.43.0


