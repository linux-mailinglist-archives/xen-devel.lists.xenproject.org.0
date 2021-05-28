Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEB23944E0
	for <lists+xen-devel@lfdr.de>; Fri, 28 May 2021 17:13:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133993.249534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmeAP-0000v8-8a; Fri, 28 May 2021 15:12:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133993.249534; Fri, 28 May 2021 15:12:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmeAP-0000sv-5T; Fri, 28 May 2021 15:12:53 +0000
Received: by outflank-mailman (input) for mailman id 133993;
 Fri, 28 May 2021 15:12:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W+lD=KX=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1lmeAN-0000sp-UO
 for xen-devel@lists.xenproject.org; Fri, 28 May 2021 15:12:51 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 61c4e699-1336-41c1-9105-de823348d1f9;
 Fri, 28 May 2021 15:12:51 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F03601FD2F;
 Fri, 28 May 2021 15:12:49 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 1D59411906;
 Fri, 28 May 2021 15:12:49 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id uUSnBHEIsWB6CQAALh3uQQ
 (envelope-from <dfaggioli@suse.com>); Fri, 28 May 2021 15:12:49 +0000
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
X-Inumbo-ID: 61c4e699-1336-41c1-9105-de823348d1f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622214769; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EnDoJ8l4mQ5d/oocwttKAMYLIuqh+t7dfloUxS95UlA=;
	b=XuRHGe1F9Xacu6JYqT0BZL4nXcd9HIGD2lpZh3DCv6dcnJw9RPLwdr9Ni9NIWKPj7JB8su
	AZnUtC87mcs3vyCndWofRuJ9shdZnraDsxOECO9LiJdKQbHitgJ5zoQUOk4idqVGrRpVI/
	VAj5oWDHHgVifKfzPHAXl9mubMSYt58=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622214769; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EnDoJ8l4mQ5d/oocwttKAMYLIuqh+t7dfloUxS95UlA=;
	b=XuRHGe1F9Xacu6JYqT0BZL4nXcd9HIGD2lpZh3DCv6dcnJw9RPLwdr9Ni9NIWKPj7JB8su
	AZnUtC87mcs3vyCndWofRuJ9shdZnraDsxOECO9LiJdKQbHitgJ5zoQUOk4idqVGrRpVI/
	VAj5oWDHHgVifKfzPHAXl9mubMSYt58=
Subject: [PATCH] credit2: make sure we pick a runnable unit from the runq if
 there is one
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Cc: =?utf-8?q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
 Dion Kant <g.w.kant@hunenet.nl>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?utf-8?q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
 Dion Kant <g.w.kant@hunenet.nl>
Date: Fri, 28 May 2021 17:12:48 +0200
Message-ID: <162221476843.1378.16573083798333423966.stgit@Wayrath>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Authentication-Results: imap.suse.de;
	none
X-Spam-Level: **
X-Spam-Score: 2.00
X-Spamd-Result: default: False [2.00 / 100.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 RCVD_NO_TLS_LAST(0.10)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 MID_RHS_NOT_FQDN(0.50)[];
	 RCVD_COUNT_TWO(0.00)[2];
	 SUSPICIOUS_RECIPS(1.50)[]
X-Spam-Flag: NO

A !runnable unit (temporarily) present in the runq may cause us to
stop scanning the runq itself too early. Of course, we don't run any
non-runnable vCPUs, but we end the scan and we fallback to picking
the idle unit. In other word, this prevent us to find there and pick
the actual unit that we're meant to start running (which might be
further ahead in the runq).

Depending on the vCPU pinning configuration, this may lead to such
unit to be stuck in the runq for long time, causing malfunctioning
inside the guest.

Fix this by checking runnable/non-runnable status up-front, in the runq
scanning function.

Reported-by: Michał Leszczyński <michal.leszczynski@cert.pl>
Reported-by: Dion Kant <g.w.kant@hunenet.nl>
Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
---
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Michał Leszczyński <michal.leszczynski@cert.pl>
Cc: Dion Kant <g.w.kant@hunenet.nl>
---
This is a bugfix and it solves the following problems, reported in
various ways:
* https://lists.xen.org/archives/html/xen-devel/2020-05/msg01985.html
* https://lists.xenproject.org/archives/html/xen-devel/2020-10/msg01561.html
* https://bugzilla.opensuse.org/show_bug.cgi?id=1179246

Hence, it should be backported, I'd say as far as possible... At least
to all the releases that have Credit2 as the default scheduler.

I will look further into this, and I think I can provide the backports
myself.

I'd like to send a *huge* thank you to Dion Kant who arranged for me to
be able to use a box where it was particularly easy to reproduce the
bug, and that was for all the time that it took me to finally be able to
work on this properly and nail it! :-)
---
 xen/common/sched/credit2.c |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index eb5e5a78c5..f5c1e5b944 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -3463,6 +3463,10 @@ runq_candidate(struct csched2_runqueue_data *rqd,
                         (unsigned char *)&d);
         }
 
+        /* Skip non runnable units that we (temporarily) have in the runq */
+        if ( unlikely(!unit_runnable_state(svc->unit)) )
+            continue;
+
         /* Only consider vcpus that are allowed to run on this processor. */
         if ( !cpumask_test_cpu(cpu, svc->unit->cpu_hard_affinity) )
             continue;
@@ -3496,8 +3500,7 @@ runq_candidate(struct csched2_runqueue_data *rqd,
          * some budget, then choose it.
          */
         if ( (yield || svc->credit > snext->credit) &&
-             (!has_cap(svc) || unit_grab_budget(svc)) &&
-             unit_runnable_state(svc->unit) )
+             (!has_cap(svc) || unit_grab_budget(svc)) )
             snext = svc;
 
         /* In any case, if we got this far, break. */



