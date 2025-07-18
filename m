Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A604B09F00
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 11:17:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048246.1418477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uchDN-0005j1-7E; Fri, 18 Jul 2025 09:17:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048246.1418477; Fri, 18 Jul 2025 09:17:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uchDN-0005gy-3t; Fri, 18 Jul 2025 09:17:13 +0000
Received: by outflank-mailman (input) for mailman id 1048246;
 Fri, 18 Jul 2025 09:17:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VuZO=Z7=boeing.com=anderson.choi@srs-se1.protection.inumbo.net>)
 id 1uchDK-0005gn-OT
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 09:17:10 +0000
Received: from phx-mbsout-01.mbs.boeing.net (phx-mbsout-01.mbs.boeing.net
 [130.76.184.178]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9400a37-63b7-11f0-a319-13f23c93f187;
 Fri, 18 Jul 2025 11:17:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by phx-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id
 56I9H3RR051706; Fri, 18 Jul 2025 02:17:04 -0700
Received: from phx-av-01.mbs.boeing.net (phx-av-01.mbs.boeing.net
 [137.136.102.153])
 by phx-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with
 ESMTPS id 56I9H1Yp051682
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Jul 2025 02:17:01 -0700
Received: from localhost (localhost [127.0.0.1])
 by phx-av-01.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_RELAY) with SMTP id
 56I9H1uW055356; Fri, 18 Jul 2025 02:17:01 -0700
Received: from A6509144.boeing.com ([144.112.84.175])
 by phx-av-01.mbs.boeing.net (8.15.2/8.15.2/UPSTREAM_RELAY) with ESMTP id
 56I9GqvV055196; Fri, 18 Jul 2025 02:16:53 -0700
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
X-Inumbo-ID: f9400a37-63b7-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1752830224;
	bh=0XEaff+6dxo8CCs9TeuBHRuE9mbYxdiPW5mFwOU4sUg=;
	h=From:To:Cc:Subject:Date:From;
	b=lTUYJxzDjbCZTsM6m0bIEltUGs7lNtiexXixxHR27jkxEv1FyyMDOyD4kbDt9m5Ga
	 9aIWxqUI8fRtEF20GQpDT4RemGRwAxcb3GpBHoJt8M1XIg9u0oFVoL1u5eWEXlCNiq
	 rVthD8xACIF4aAWwXJyJoXNwu/vTcbAUtVwbnCBtZkZRFl3XPlMS/GueehAAy3RDbE
	 0A1sdrPnBEWO5FIamE6jBHXRZ+zF3LPEoDR5XqunUN6+cCwr6H+tuERWOMcmwB1FLf
	 1Q1H24gijZY/oO/FZw6UvXl69nc9u71vR/95nsD5fqS5L/eHuHbiYSP2QeMLzaA1gv
	 fjar0su4SLOyw==
From: Anderson Choi <anderson.choi@boeing.com>
To: xen-devel@lists.xenproject.org
Cc: matthew.l.weber3@boeing.com, joshua.c.whitehead@boeing.com,
        Anderson Choi <anderson.choi@boeing.com>,
        Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Nathan Studer <nathan.studer@dornerworks.com>,
        Stewart Hildebrand <stewart@stew.dk>,
        Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
        George Dunlap <gwd@xenproject.org>, xen-devel@dornerworks.com
Subject: [XEN PATCH v3] xen/arinc653: fix delay in the start of major frame
Date: Fri, 18 Jul 2025 18:16:49 +0900
Message-ID: <cb18dbefaf574eb4d3647097d06debcab378533a.1752815008.git.anderson.choi@boeing.com>
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

Per suggestion from Stewart Hildebrand, the while loop to calculate the
start of next major frame can be eliminated by using a modulo operation.

Fixes: 22787f2e107c ("ARINC 653 scheduler")

Suggested-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Suggested-by: Nathan Studer <nathan.studer@dornerworks.com>
Signed-off-by: Anderson Choi <anderson.choi@boeing.com>

---
Changes in v3:
- Replace the while loop with the modulo operation to calculate the
  start of next major frame.
- Initialize major_frame and runtime of zeroth schedule entry to
  DEFAULT_TIMESLICE not to use "if" branch in the calculation of next
major frame.

Changes in v2:
- Changed the logic to resync major frame and to find correct
  minor frame after a miss suggested by Nathan
---
---
 xen/common/sched/arinc653.c | 39 ++++++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 18 deletions(-)

diff --git a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c
index 930361fa5c..b7f3f41137 100644
--- a/xen/common/sched/arinc653.c
+++ b/xen/common/sched/arinc653.c
@@ -361,6 +361,8 @@ a653sched_init(struct scheduler *ops)
     ops->sched_data = prv;
 
     prv->next_major_frame = 0;
+    prv->major_frame = DEFAULT_TIMESLICE;
+    prv->schedule[0].runtime = DEFAULT_TIMESLICE;
     spin_lock_init(&prv->lock);
     INIT_LIST_HEAD(&prv->unit_list);
 
@@ -526,29 +528,30 @@ a653sched_do_schedule(
 
     spin_lock_irqsave(&sched_priv->lock, flags);
 
-    if ( sched_priv->num_schedule_entries < 1 )
-        sched_priv->next_major_frame = now + DEFAULT_TIMESLICE;
-    else if ( now >= sched_priv->next_major_frame )
+    /* Switch to next major frame directly eliminating the use of loop */
+    if ( now >= sched_priv->next_major_frame )
     {
-        /* time to enter a new major frame
-         * the first time this function is called, this will be true */
-        /* start with the first domain in the schedule */
+        s_time_t major_frame = sched_priv->major_frame;
+        s_time_t remainder = (now - sched_priv->next_major_frame) % major_frame;
+
+        /* major_frame and schedule[0].runtime contain DEFAULT_TIMESLICE
+         * if num_schedule_entries is zero.
+         */
         sched_priv->sched_index = 0;
-        sched_priv->next_major_frame = now + sched_priv->major_frame;
-        sched_priv->next_switch_time = now + sched_priv->schedule[0].runtime;
+        sched_priv->next_major_frame = now - remainder + major_frame;
+        sched_priv->next_switch_time = now - remainder +
+            sched_priv->schedule[0].runtime;
     }
-    else
+
+    /* Switch minor frame or find correct minor frame after a miss */
+    while ( (now >= sched_priv->next_switch_time) &&
+        (sched_priv->sched_index < sched_priv->num_schedule_entries) )
     {
-        while ( (now >= sched_priv->next_switch_time) &&
-                (sched_priv->sched_index < sched_priv->num_schedule_entries) )
-        {
-            /* time to switch to the next domain in this major frame */
-            sched_priv->sched_index++;
-            sched_priv->next_switch_time +=
-                sched_priv->schedule[sched_priv->sched_index].runtime;
-        }
+        sched_priv->sched_index++;
+        sched_priv->next_switch_time +=
+            sched_priv->schedule[sched_priv->sched_index].runtime;
     }
-
+    
     /*
      * If we exhausted the domains in the schedule and still have time left
      * in the major frame then switch next at the next major frame.
-- 
2.43.0


