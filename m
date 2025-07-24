Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5ABB11411
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 00:35:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056631.1424668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf4W9-0003Rf-N1; Thu, 24 Jul 2025 22:34:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056631.1424668; Thu, 24 Jul 2025 22:34:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf4W9-0003P9-JT; Thu, 24 Jul 2025 22:34:25 +0000
Received: by outflank-mailman (input) for mailman id 1056631;
 Thu, 24 Jul 2025 22:34:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LNxF=2F=boeing.com=anderson.choi@srs-se1.protection.inumbo.net>)
 id 1uf4W8-0003Lx-6t
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 22:34:24 +0000
Received: from phx-mbsout-02.mbs.boeing.net (phx-mbsout-02.mbs.boeing.net
 [130.76.184.179]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53daffb9-68de-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 00:34:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by phx-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id
 56OMYChI037459; Thu, 24 Jul 2025 15:34:13 -0700
Received: from ewa-av-01.mbs.boeing.net (ewa-av-01.mbs.boeing.net
 [137.137.51.75])
 by phx-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with
 ESMTPS id 56OMY1KE037385
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Jul 2025 15:34:01 -0700
Received: from localhost (localhost [127.0.0.1])
 by ewa-av-01.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_RELAY) with SMTP id
 56OMY0Qn002796; Thu, 24 Jul 2025 15:34:00 -0700
Received: from A6509144.boeing.com ([144.112.80.69])
 by ewa-av-01.mbs.boeing.net (8.15.2/8.15.2/UPSTREAM_RELAY) with ESMTP id
 56OMXoiw002139; Thu, 24 Jul 2025 15:33:51 -0700
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
X-Inumbo-ID: 53daffb9-68de-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1753396453;
	bh=4ono+TZbbiRgZzSH3HVlMLVet638ewulZz+LBPc1bog=;
	h=From:To:Cc:Subject:Date:From;
	b=bCEJd87VUMY0LVIS3jw6LJ17t+GoQRIfQyIVP6oR1b41oTcfyw/zWfEp+JybcoriX
	 rAotcyXFL5gPYP2mbzn+wgEkIVL6b7UzTMz4DNDqIs4pyCfRdk4xu898W0tHP5ORHE
	 /JpWmZ5x8pnDmn/1wQXDT5wBwaiA3sMURCifh9+O86yPTUtPU+/2O+rYwPY2F8gR0W
	 iEiBBjD7hc4AR9qlB7fBudA5D36Wd84d0dF8GVmgoZEEfYg01g7qAY7Vlg7RKZFlXF
	 fME6EWYQWK/+3p6Ygw4F45hnLqZK6IYWlb4fsEKMyMeHXRYTlm9jB7qe5ZLNNjsZym
	 4GZEO8AAF3Ysw==
From: Anderson Choi <anderson.choi@boeing.com>
To: xen-devel@lists.xenproject.org
Cc: matthew.l.weber3@boeing.com, joshua.c.whitehead@boeing.com,
        Anderson Choi <anderson.choi@boeing.com>,
        Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Nathan Studer <nathan.studer@dornerworks.com>,
        Stewart Hildebrand <stewart@stew.dk>,
        Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
        George Dunlap <gwd@xenproject.org>, xen-devel@dornerworks.com
Subject: [XEN PATCH v4] xen/arinc653: fix delay in the start of major frame
Date: Fri, 25 Jul 2025 07:33:48 +0900
Message-ID: <88a17c994f85270982e03912c9c9db916ca69d4e.1753395268.git.anderson.choi@boeing.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00

ARINC653 specification requires partition scheduling to be deterministic
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
frame can be also missed. In that scenario, iterate through the schedule
after resyncing the expected next major frame.

Per suggestion from Stewart Hildebrand, use a modulo operation to
calculate the start of next major frame.

Fixes: 22787f2e107c ("ARINC 653 scheduler")
Suggested-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Suggested-by: Nathan Studer <nathan.studer@dornerworks.com>
Signed-off-by: Anderson Choi <anderson.choi@boeing.com>

---
Changes in v4:
- Check if sched_priv->major_frame is non-zero before calculating the
  start of next major frame
- Update commit message to be consistent with the code change
- Update multi-line comments to comply with CODING_STYLE
- Fix typos

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
 xen/common/sched/arinc653.c | 40 +++++++++++++++++++++----------------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c
index 930361fa5c..246ca9b742 100644
--- a/xen/common/sched/arinc653.c
+++ b/xen/common/sched/arinc653.c
@@ -361,6 +361,8 @@ a653sched_init(struct scheduler *ops)
     ops->sched_data = prv;
 
     prv->next_major_frame = 0;
+    prv->major_frame = DEFAULT_TIMESLICE;
+    prv->schedule[0].runtime = DEFAULT_TIMESLICE;
     spin_lock_init(&prv->lock);
     INIT_LIST_HEAD(&prv->unit_list);
 
@@ -526,27 +528,31 @@ a653sched_do_schedule(
 
     spin_lock_irqsave(&sched_priv->lock, flags);
 
-    if ( sched_priv->num_schedule_entries < 1 )
-        sched_priv->next_major_frame = now + DEFAULT_TIMESLICE;
-    else if ( now >= sched_priv->next_major_frame )
+    ASSERT(sched_priv->major_frame > 0);
+
+    /* Switch to next major frame using a modulo operation */
+    if ( now >= sched_priv->next_major_frame )
     {
-        /* time to enter a new major frame
-         * the first time this function is called, this will be true */
-        /* start with the first domain in the schedule */
+        s_time_t major_frame = sched_priv->major_frame;
+        s_time_t remainder = (now - sched_priv->next_major_frame) % major_frame;
+
+        /*
+         * major_frame and schedule[0].runtime contain DEFAULT_TIMESLICE
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
 
     /*
-- 
2.43.0


