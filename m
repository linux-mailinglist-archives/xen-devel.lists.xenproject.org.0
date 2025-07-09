Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C43D8AFDC0E
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 02:08:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037512.1410136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZIMV-0000hH-A0; Wed, 09 Jul 2025 00:08:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037512.1410136; Wed, 09 Jul 2025 00:08:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZIMV-0000f9-6h; Wed, 09 Jul 2025 00:08:35 +0000
Received: by outflank-mailman (input) for mailman id 1037512;
 Wed, 09 Jul 2025 00:08:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0OMD=ZW=boeing.com=anderson.choi@srs-se1.protection.inumbo.net>)
 id 1uZIMS-0000f3-VF
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 00:08:33 +0000
Received: from clt-mbsout-01.mbs.boeing.net (clt-mbsout-01.mbs.boeing.net
 [130.76.144.162]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d66d7776-5c58-11f0-a317-13f23c93f187;
 Wed, 09 Jul 2025 02:08:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by clt-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id
 56908N0U012417; Tue, 8 Jul 2025 20:08:25 -0400
Received: from phx-av-01.mbs.boeing.net (phx-av-01.mbs.boeing.net
 [137.136.102.153])
 by clt-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with
 ESMTPS id 56908FUW012354
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Jul 2025 20:08:16 -0400
Received: from localhost (localhost [127.0.0.1])
 by phx-av-01.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_RELAY) with SMTP id
 56908FZI006617; Tue, 8 Jul 2025 17:08:15 -0700
Received: from A6509144.boeing.com ([144.112.85.69])
 by phx-av-01.mbs.boeing.net (8.15.2/8.15.2/UPSTREAM_RELAY) with ESMTP id
 569085FY006443; Tue, 8 Jul 2025 17:08:06 -0700
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
X-Inumbo-ID: d66d7776-5c58-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1752019706;
	bh=iocC43PIZWz7aGXP2ff24ePgbXDXpeS9xE18B/eSTI0=;
	h=From:To:Cc:Subject:Date:From;
	b=mQscAX73zFJuoTA3R09QfuiPT8vEkydbDXHcQIQfJVIH+EDOrocDzc9MMs2fjGdBH
	 iBWTCQPp/82yiAQlron3x5aKAx06dxDt2PijgBx1e18TNpciNvCGhXhIoUfNS0asHT
	 I/EsWs3cUEA/a9DPdjn+pMPxhSG1rvlPCNGpnPfdS+24wAY0hT7800viAlXCajURX3
	 ojUhCiHYkcDyW1X4/XQY8XbHMa5AXszpNhZykKItsjaqvaSW6es7PUp26HAnRiH+Du
	 +zed6LN0KJyS6LrLk/Tjk5985HXgszqMuwxZ5wBICTUWspQH4WUi7mHbzgtPaUu+3J
	 Gac4GnywfLoaA==
From: Anderson Choi <anderson.choi@boeing.com>
To: xen-devel@lists.xenproject.org, xen-devel@dornerworks.com
Cc: matthew.l.weber3@boeing.com, joshua.c.whitehead@boeing.com,
        Anderson Choi <anderson.choi@boeing.com>,
        Nathan Studer <nathan.studer@dornerworks.com>,
        Stewart Hildebrand <stewart@stew.dk>,
        Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
        George Dunlap <gwd@xenproject.org>
Subject: [XEN PATCH] xen/arinc653: fix delay in the start of major frame
Date: Wed,  9 Jul 2025 09:08:04 +0900
Message-ID: <26f4fb409f03cb221a98692c4f291756d9cc26ae.1751948342.git.anderson.choi@boeing.com>
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
the next domain switch time. In addition, push next_switch_time until
it's behind the current time to ensure positive runtime for the newly
selected domain to run.

Signed-off-by: Anderson Choi <anderson.choi@boeing.com>
---
Cc: Nathan Studer <nathan.studer@dornerworks.com>
Cc: Stewart Hildebrand <stewart@stew.dk>
Cc: Dario Faggioli <dfaggioli@suse.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: George Dunlap <gwd@xenproject.org>

 xen/common/sched/arinc653.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c
index 930361fa5c..61e94dcc96 100644
--- a/xen/common/sched/arinc653.c
+++ b/xen/common/sched/arinc653.c
@@ -534,8 +534,12 @@ a653sched_do_schedule(
          * the first time this function is called, this will be true */
         /* start with the first domain in the schedule */
         sched_priv->sched_index = 0;
-        sched_priv->next_major_frame = now + sched_priv->major_frame;
-        sched_priv->next_switch_time = now + sched_priv->schedule[0].runtime;
+
+        /* Enforce periodic start of major frame and domain switches */
+        do {
+            sched_priv->next_switch_time = sched_priv->next_major_frame + sched_priv->schedule[0].runtime;
+            sched_priv->next_major_frame += sched_priv->major_frame;
+        } while (now >= sched_priv->next_switch_time);
     }
     else
     {
-- 
2.43.0


