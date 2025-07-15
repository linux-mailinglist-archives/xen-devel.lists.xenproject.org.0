Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0308B04E98
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 05:18:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043329.1413450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubWAM-0001sH-5o; Tue, 15 Jul 2025 03:17:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043329.1413450; Tue, 15 Jul 2025 03:17:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubWAM-0001qq-35; Tue, 15 Jul 2025 03:17:14 +0000
Received: by outflank-mailman (input) for mailman id 1043329;
 Tue, 15 Jul 2025 03:17:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Fzp=Z4=boeing.com=anderson.choi@srs-se1.protection.inumbo.net>)
 id 1ubWAK-0001qk-Q0
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 03:17:12 +0000
Received: from ewa-mbsout-02.mbs.boeing.net (ewa-mbsout-02.mbs.boeing.net
 [130.76.20.195]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2df25187-612a-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 05:17:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by ewa-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id
 56F3H1SP046669; Mon, 14 Jul 2025 20:17:01 -0700
Received: from phx-av-01.mbs.boeing.net (phx-av-01.mbs.boeing.net
 [137.136.102.153])
 by ewa-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with
 ESMTPS id 56F3Gote046621
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Jul 2025 20:16:51 -0700
Received: from localhost (localhost [127.0.0.1])
 by phx-av-01.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_RELAY) with SMTP id
 56F3GnjZ037633; Mon, 14 Jul 2025 20:16:49 -0700
Received: from A6509144.boeing.com ([144.112.84.15])
 by phx-av-01.mbs.boeing.net (8.15.2/8.15.2/UPSTREAM_RELAY) with ESMTP id
 56F3Ge82037165; Mon, 14 Jul 2025 20:16:41 -0700
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
X-Inumbo-ID: 2df25187-612a-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1752549422;
	bh=EhlZL5UlKrzAVQK6QAoPGjZSmmgUghjXHqKNFw8hJZs=;
	h=From:To:Cc:Subject:Date:From;
	b=Ga11ReIU45daJCyH56jNZ+wTyDDKKkwmCbkkahe7RLDRTODgPCufhLA8hEEjHjwio
	 OQJSUTkAw4VjpNCUHep30bUuGXpv99vIy/4oocihYQHSa5HmKApihHRjG25RCU+7wd
	 baQgTt3fCq0uK7kakbYoufWFZzzdvlx6F4IEescCUPzaTODe4d9hH9q8fy2DElfe8e
	 RiRN+nsJOGE2nZ4lVLXl2efVTS7Qfq0UFFj4PwUV5Oek3HR+K71mwWYLj1Jw8XbUwa
	 cQSBtcxgRpbgOe64vWBt1KuXiWwAgAI+t5QmF4B7x//g235ILHl29RjkMRk/BjrMkj
	 qOzB8n7K5wUfA==
From: Anderson Choi <anderson.choi@boeing.com>
To: xen-devel@lists.xenproject.org
Cc: matthew.l.weber3@boeing.com, joshua.c.whitehead@boeing.com,
        Anderson Choi <anderson.choi@boeing.com>,
        Nathan Studer <nathan.studer@dornerworks.com>,
        Stewart Hildebrand <stewart@stew.dk>,
        Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
        George Dunlap <gwd@xenproject.org>, xen-devel@dornerworks.com
Subject: [XEN PATCH v2] xen/arinc653: fix delay in the start of major frame
Date: Tue, 15 Jul 2025 12:16:38 +0900
Message-ID: <c3234cf8d5fb5da84e10ebdb95250c594f644198.1752197811.git.anderson.choi@boeing.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00

ARINC653 specificaion requires partition scheduling to be deterministic
and periodic over time.

However, the use of current timestamp (now) as the baseline to calculate
next_major_frame and next_switch_time introduces a delay in the start of
major frame at every period, which breaks determinism and periodicity in
partition scheduling.

For example, we observe 3.5 msec of accumulated delay at the 21st major
frame with the following configuration.

Target : qemuarm64
xen version : 4.19 (43aeacff86, x86/IRQ: constrain creator-domain-ID assertion)
dom1 : 10 msec runtime
dom2 : 10 msec runtime

$ a653_sched -p Pool-arinc dom1:10 dom2:10

0.014553536 ---x d?v? runstate_change d1v0 runnable->running //1st major
frame
0.034629712 ---x d?v? runstate_change d1v0 runnable->running //2nd major
frame
<snip>
0.397747008 |||x d?v? runstate_change d1v0 runnable->running //20th
major frame
0.418066096 -||x d?v? runstate_change d1v0 runnable->running //21st
major frame

This is due to an inherent delta between the time value the scheduler timer
is programmed to be fired with and the time value the schedule function
is executed.

Another observation that breaks the deterministic behavior of partition
scheduling is a delayed execution of schedule(); It was called 14 msec
later than programmed.

1.530603952 ---x d?v? runstate_change d1v0 runnable->running
1.564956784 --|x d?v? runstate_change d1v0 runnable->running

Enforce the periodic behavior of partition scheduling by using the value
next_major_frame as the base to calculate the start of major frame and
the next domain switch time.

Per discussion with Nathan Studer, there are odd cases the first minor
frame can be also missed. In that sceanario, iterate through the schedule after resyncing
the expected next major frame.

Signed-off-by: Anderson Choi <anderson.choi@boeing.com>
Suggested-by: Nathan Studer <nathan.studer@dornerworks.com>

---
Changes in v2:
- Changed the logic to resync major frame and to find correct
  minor frame after a miss suggested by Nathan
---
 xen/common/sched/arinc653.c | 38 ++++++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c
index 930361fa5c..a7937ed2fd 100644
--- a/xen/common/sched/arinc653.c
+++ b/xen/common/sched/arinc653.c
@@ -526,27 +526,31 @@ a653sched_do_schedule(
 
     spin_lock_irqsave(&sched_priv->lock, flags);
 
-    if ( sched_priv->num_schedule_entries < 1 )
-        sched_priv->next_major_frame = now + DEFAULT_TIMESLICE;
-    else if ( now >= sched_priv->next_major_frame )
+    /* Switch to next major frame while handling potentially missed frames */
+    while ( now >= sched_priv->next_major_frame )
     {
-        /* time to enter a new major frame
-         * the first time this function is called, this will be true */
-        /* start with the first domain in the schedule */
         sched_priv->sched_index = 0;
-        sched_priv->next_major_frame = now + sched_priv->major_frame;
-        sched_priv->next_switch_time = now + sched_priv->schedule[0].runtime;
-    }
-    else
-    {
-        while ( (now >= sched_priv->next_switch_time) &&
-                (sched_priv->sched_index < sched_priv->num_schedule_entries) )
+
+        if ( sched_priv->num_schedule_entries < 1 )
         {
-            /* time to switch to the next domain in this major frame */
-            sched_priv->sched_index++;
-            sched_priv->next_switch_time +=
-                sched_priv->schedule[sched_priv->sched_index].runtime;
+            sched_priv->next_major_frame += DEFAULT_TIMESLICE;
+            sched_priv->next_switch_time = sched_priv->next_major_frame;
         }
+        else
+        {
+            sched_priv->next_switch_time = sched_priv->next_major_frame +
+                sched_priv->schedule[0].runtime;
+            sched_priv->next_major_frame += sched_priv->major_frame;
+        }
+    }
+ 
+    /* Switch minor frame or find correct minor frame after a miss */
+    while ( (now >= sched_priv->next_switch_time) &&
+        (sched_priv->sched_index < sched_priv->num_schedule_entries) )
+    {
+        sched_priv->sched_index++;
+        sched_priv->next_switch_time +=
+            sched_priv->schedule[sched_priv->sched_index].runtime;
     }
 
     /*
-- 
2.43.0


