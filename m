Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4F3228876
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 20:43:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxxEA-0002Dp-5E; Tue, 21 Jul 2020 18:42:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8efX=BA=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jxxE8-0001xV-NN
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 18:42:56 +0000
X-Inumbo-ID: e8d9001a-cb81-11ea-85a2-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e8d9001a-cb81-11ea-85a2-bc764e2007e4;
 Tue, 21 Jul 2020 18:42:22 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jxxDZ-0001u7-A6; Tue, 21 Jul 2020 19:42:21 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 08/14] Executive: Use index for report__find_test
Date: Tue, 21 Jul 2020 19:41:59 +0100
Message-Id: <20200721184205.15232-9-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200721184205.15232-1-ian.jackson@eu.citrix.com>
References: <20200721184205.15232-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

After we refactor this query then we can enable the index use.
(Both of these things together in this commit because I haven't perf
tested the version with just the refactoring.)

(We have provided an index that can answer this question really
quickly if a version is specified.  But the query planner couldn't see
that because it works without seeing the bind variables, so doesn't
know that the value of name is going to be suitable for this index.)

* Convert the two EXISTS subqueries into JOIN/AND with a DISTINCT
  clause naming the fields on flights, so as to replicate the previous
  result rows.  Then do $selection field last.  The subquery is a
  convenient way to let this do the previous thing for all the values
  of $selection (including, notably, *).

* Add the additional AND clause for r.name, which has no logical
  effect given the actual values of name, enabling the query planner
  to use this index.

Perf: In my test case the sg-report-flight runtime is now ~8s.  I am
reasonably confident that this will not make other use cases of this
code worse.

Perf: runtime of my test case now ~11s

Example query before (from the Perl DBI trace):

        SELECT *
         FROM flights f
        WHERE
                EXISTS (
                   SELECT 1
                    FROM runvars r
                   WHERE name=?
                     AND val=?
                     AND r.flight=f.flight
                     AND (      (CASE
       WHEN (r.job) LIKE 'build-%-prev' THEN 'xprev'
       WHEN ((r.job) LIKE 'build-%-freebsd'
             AND 'x' = 'freebsdbuildjob') THEN 'DISCARD'
       ELSE                                      ''
       END)
 = '')
                 )
          AND ( (TRUE AND flight <= 151903) AND (blessing='real') )
          AND (branch=?)
        ORDER BY flight DESC
        LIMIT 1

After:

        SELECT *
          FROM ( SELECT DISTINCT
                      flight, started, blessing, branch, intended
                 FROM flights f
                    JOIN runvars r USING (flight)
                   WHERE name=?
                     AND name LIKE 'revision_%'
                     AND val=?
                     AND r.flight=f.flight
                     AND (      (CASE
       WHEN (r.job) LIKE 'build-%-prev' THEN 'xprev'
       WHEN ((r.job) LIKE 'build-%-freebsd'
             AND 'x' = 'freebsdbuildjob') THEN 'DISCARD'
       ELSE                                      ''
       END)
 = '')
          AND ( (TRUE AND flight <= 151903) AND (blessing='real') )
          AND (branch=?)
) AS sub WHERE TRUE
        ORDER BY flight DESC
        LIMIT 1

In both cases with bind vars:

   'revision_xen'
   '165f3afbfc3db70fcfdccad07085cde0a03c858b'
   "xen-unstable"

Diff to the example query:

@@ -1,10 +1,10 @@
         SELECT *
+          FROM ( SELECT DISTINCT
+                      flight, started, blessing, branch, intended
          FROM flights f
-        WHERE
-                EXISTS (
-                   SELECT 1
-                    FROM runvars r
+                    JOIN runvars r USING (flight)
                    WHERE name=?
+                     AND name LIKE 'revision_%'
                      AND val=?
                      AND r.flight=f.flight
                      AND (      (CASE
@@ -14,8 +14,8 @@
        ELSE                                      ''
        END)
  = '')
-                 )
           AND ( (TRUE AND flight <= 151903) AND (blessing='real') )
           AND (branch=?)
+) AS sub WHERE TRUE
         ORDER BY flight DESC
         LIMIT 1

CC: George Dunlap <George.Dunlap@citrix.com>
Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/Executive.pm              | 20 ++++++++------------
 schema/runvars-revision-index.sql |  2 +-
 2 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/Osstest/Executive.pm b/Osstest/Executive.pm
index c3dc1261..c272e9f2 100644
--- a/Osstest/Executive.pm
+++ b/Osstest/Executive.pm
@@ -415,37 +415,32 @@ sub report__find_test ($$$$$$$) {
 
     my $querytext = <<END;
         SELECT $selection
-	 FROM flights f
-	WHERE
+          FROM ( SELECT DISTINCT
+                      flight, started, blessing, branch, intended
+   	         FROM flights f
 END
 
     if (defined $revision) {
 	if ($tree eq 'osstest') {
 	    $querytext .= <<END;
-		EXISTS (
-		   SELECT 1
-		    FROM flights_harness_touched t
+		    JOIN flights_harness_touched t USING (flight)
 		   WHERE t.harness=?
-		     AND t.flight=f.flight
-		 )
 END
             push @params, $revision;
 	} else {
 	    $querytext .= <<END;
-		EXISTS (
-		   SELECT 1
-		    FROM runvars r
+		    JOIN runvars r USING (flight)
 		   WHERE name=?
+                     AND name LIKE 'revision_%'
 		     AND val=?
 		     AND r.flight=f.flight
                      AND ${\ main_revision_job_cond('r.job') }
-		 )
 END
             push @params, "revision_$tree", $revision;
         }
     } else {
 	$querytext .= <<END;
-	    TRUE
+	    WHERE TRUE
 END
     }
 
@@ -460,6 +455,7 @@ END
 END
     push @params, @$branches;
 
+    $querytext .= ") AS sub WHERE TRUE\n";
     $querytext .= $extracond;
     $querytext .= $sortlimit;
 
diff --git a/schema/runvars-revision-index.sql b/schema/runvars-revision-index.sql
index a2e3be13..4c1aea66 100644
--- a/schema/runvars-revision-index.sql
+++ b/schema/runvars-revision-index.sql
@@ -1,4 +1,4 @@
--- ##OSSTEST## 008 Preparatory
+-- ##OSSTEST## 008 Needed
 --
 -- This index helps Executive::report__find_test find relevant flights.
 
-- 
2.20.1


