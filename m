Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC572B993A
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 18:25:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31248.61596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfnfs-00023X-2t; Thu, 19 Nov 2020 17:24:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31248.61596; Thu, 19 Nov 2020 17:24:48 +0000
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
	id 1kfnfr-000231-RR; Thu, 19 Nov 2020 17:24:47 +0000
Received: by outflank-mailman (input) for mailman id 31248;
 Thu, 19 Nov 2020 17:24:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kfnfq-00022p-A7
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 17:24:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kfnfq-0001GS-8o
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 17:24:46 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kfnfq-0001hR-76
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 17:24:46 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kfnfl-0001j9-TC; Thu, 19 Nov 2020 17:24:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kfnfq-00022p-A7
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 17:24:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=GMr6/pQELAa5eEG/rFq2xz09Dbsq1stesTPHMh4kRUk=; b=upHGya/3cUqnUS5qeXHRPtlMTA
	jLgtgxVCAvQ+QFpR8lgt2fDx/ueoKerk4Hymb/r9ba+3hPm9n30SljRYpTU43NIlM5ITj4Fcjt/s7
	mqIRefTKOnHdE/zhfwrQ+RVRD9PN3MfHDdTD/drvzaHi4Mus9foQWD5WoyCYejUAKa30=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kfnfq-0001GS-8o
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 17:24:46 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kfnfq-0001hR-76
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 17:24:46 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kfnfl-0001j9-TC; Thu, 19 Nov 2020 17:24:42 +0000
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 2/3] sg-report-flight: Actually look at retest flights (part 1)
Date: Thu, 19 Nov 2020 17:24:31 +0000
Message-Id: <20201119172432.15682-2-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201119172432.15682-1-iwj@xenproject.org>
References: <20201119172432.15682-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing approach does not find retest flights.  This is because
it starts by looking for flights whose runvars say they built the
version in question, and then looks to see if they contain the
relevant job.

Retest flights don't contain build jobs; they reuse the builds from
the primary flight.

Rather than making a fully general recursion scheme (which would
involve adding another index so we could quickly find all flights
which refer to this one), we add a one-level recursion.

This recursion is restricted to the flights named on the command line.
This means it takes nearly no time (as opposed to searching the whole
db for things that might be relevant - see above re need for an
index).

We filter the command line flights, looking ones which refer to the
only the primarily found flights as build jobs.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 sg-report-flight | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/sg-report-flight b/sg-report-flight
index 40a3cc92..70cad230 100755
--- a/sg-report-flight
+++ b/sg-report-flight
@@ -315,6 +315,11 @@ END
     # Sadly this trick is not formally documented but it is our
     # best option.
 
+    my $cmdline_flight_cond =
+      join ' OR ',
+      (defined $specflight ? "f1.flight=$specflight" : "FALSE"),
+      map { "f1.flight=$_->{Flight}" } @refer_to_flights;
+
     my $flightsq= <<END;
       WITH
       relevant_flights AS (
@@ -327,9 +332,27 @@ $runvars_conds
             ORDER BY flight DESC
             OFFSET 0
             LIMIT 1000
+      ),
+      retest_flights AS (
+        SELECT DISTINCT f1.flight flight, f1.blessing blessing
+             FROM flights f1
+             JOIN jobs j USING (flight) 
+       CROSS JOIN relevant_flights f0
+            WHERE ($cmdline_flight_cond)
+              AND (
+                SELECT bool_and( val LIKE f0.flight || '.%' )
+                       IS TRUE
+                 FROM runvars r
+                WHERE r.flight=j.flight
+                  AND r.job=j.job 
+                  AND r.name LIKE '%buildjob'
+                  )
       )
       SELECT flight, jobs.status
-        FROM relevant_flights
+        FROM (
+           SELECT * FROM relevant_flights
+     UNION SELECT * FROM retest_flights
+             ) all_relevant_flights
 $flightsq_jobs_join
        WHERE (1=1)
 $flightsq_jobcond
-- 
2.20.1


