Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB9D2B993C
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 18:25:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31249.61604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfnfs-00024I-EF; Thu, 19 Nov 2020 17:24:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31249.61604; Thu, 19 Nov 2020 17:24:48 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfnfs-00023V-8q; Thu, 19 Nov 2020 17:24:48 +0000
Received: by outflank-mailman (input) for mailman id 31249;
 Thu, 19 Nov 2020 17:24:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kfnfq-00022u-Id
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 17:24:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kfnfq-0001GV-Hn
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 17:24:46 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kfnfq-0001hW-FT
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 17:24:46 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kfnfm-0001j9-Eg; Thu, 19 Nov 2020 17:24:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kfnfq-00022u-Id
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 17:24:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=cziSSO/qxv0dihhTZt+q8r4bupo8zCTakTFjg8vAnkk=; b=p8CHirmc3FjRi9eFop2d0cKwyI
	kVbsG6ydDJ6lTUMDEWQOLRjJhialdceTwFC9eQT3KbpIB4vGr4W0wWL2Eycw4QuhUEmL6NFPf9Sil
	5xN5sMolrg4Bw8m1srSkZPst2brOvUmbAq4EXiK8Q630mmsig7b61ikmGuDisg7B4VsU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kfnfq-0001GV-Hn
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 17:24:46 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kfnfq-0001hW-FT
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 17:24:46 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kfnfm-0001j9-Eg; Thu, 19 Nov 2020 17:24:42 +0000
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 3/3] sg-report-flight: Actually look at retest flights (part 2)
Date: Thu, 19 Nov 2020 17:24:32 +0000
Message-Id: <20201119172432.15682-3-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201119172432.15682-1-iwj@xenproject.org>
References: <20201119172432.15682-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To avoid going down ratholes (especially for jobs which reuse outputs
from their previous selves), the primary flight/job finder in
sg-report-flight does not recurse indefinitely through build jobs.
Instead, it restricts the build jobs investigated to those within the
same flight as the job which might be of interest.

As a result, retest jobs are, unfortunately, discarded at this stage
because we insist that the build jobs we find did use the tree
revision we are investigating.

Fix this by recursing into the corresponding primary flight too.
In the $flightsq->fetchrow loop that's $xflight.

For the primary flight, ie the first half of the UNION, that's just
the fligth itself.  So there this has no change.

For the retest flights, it is the flight that all the build jobs refer
to.  Despite the CROSS JOIN, this will be unique for any particular
"retest flight", because the query on the runvars insists that all of
the (at least some) buildjob runvars for f1 point to f0.  Ie, f1 has
no build jobs and refers to f0 for build jobs; so it can't refer to
any other f0' in the cross join.

With this change, a -retest flight can now actually be used to justify
a push.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 sg-report-flight | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/sg-report-flight b/sg-report-flight
index 70cad230..7f0543ff 100755
--- a/sg-report-flight
+++ b/sg-report-flight
@@ -334,9 +334,12 @@ $runvars_conds
             LIMIT 1000
       ),
       retest_flights AS (
-        SELECT DISTINCT f1.flight flight, f1.blessing blessing
+        SELECT DISTINCT 
+                  f1.flight flight,
+                  f0.flight xflight,
+                  f1.blessing blessing
              FROM flights f1
-             JOIN jobs j USING (flight) 
+             JOIN jobs j USING (flight)
        CROSS JOIN relevant_flights f0
             WHERE ($cmdline_flight_cond)
               AND (
@@ -348,10 +351,10 @@ $runvars_conds
                   AND r.name LIKE '%buildjob'
                   )
       )
-      SELECT flight, jobs.status
+      SELECT flight, xflight, jobs.status
         FROM (
-           SELECT * FROM relevant_flights
-     UNION SELECT * FROM retest_flights
+ SELECT        flight, flight xflight, blessing FROM relevant_flights
+ UNION SELECT  flight,        xflight, blessing FROM retest_flights
              ) all_relevant_flights
 $flightsq_jobs_join
        WHERE (1=1)
@@ -392,7 +395,7 @@ END
                 WHERE flight=?
 END
 
-    while (my ($tflight, $tjstatus) = $flightsq->fetchrow_array) {
+    while (my ($tflight, $xflight, $tjstatus) = $flightsq->fetchrow_array) {
 	# Recurse from the starting flight looking for relevant build
 	# jobs.  We start with all jobs in $tflight, and for each job
 	# we also process any other jobs it refers to in *buildjob runvars.
@@ -408,6 +411,11 @@ END
 	# actually interested in (ii) the kind of continuous update
 	# thing seen with freebsdbuildjob.
 	#
+	# However, when we are looking at a retest flight (offered to
+	# us with --refer-to-flights, or found because it was
+	# specified on the command line) we look at its build flight;
+	# that's what $xflight is;
+	#
 	# (This is rather different to cs-bisection-step, which is
 	# less focused on changes in a particular set of trees.)
 	#
@@ -435,7 +443,7 @@ END
 	while (@binfos_todo) {
 	    my ($why,$bflight,$bjob) = @{ shift @binfos_todo };
 	    next if $binfos{$bflight}{$bjob};
-            next unless $bflight == $tflight;
+            next unless $bflight == $tflight || $bflight == $xflight;
 	    $binfos{$bflight}{$bjob} = $why;
 	    $buildjobsq->execute($bflight,$bjob);
 	    $binfos_queue->($bflight,$buildjobsq,$why);
-- 
2.20.1


