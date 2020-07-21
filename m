Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 263E422886F
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 20:42:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxxDp-00022F-M8; Tue, 21 Jul 2020 18:42:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8efX=BA=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jxxDo-0001xV-MZ
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 18:42:36 +0000
X-Inumbo-ID: e8d90018-cb81-11ea-85a2-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e8d90018-cb81-11ea-85a2-bc764e2007e4;
 Tue, 21 Jul 2020 18:42:21 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jxxDY-0001u7-6O; Tue, 21 Jul 2020 19:42:20 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 04/14] sg-report-flight: Ask the db for flights of
 interest
Date: Tue, 21 Jul 2020 19:41:55 +0100
Message-Id: <20200721184205.15232-5-ian.jackson@eu.citrix.com>
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

Specifically, we narrow the initial query to flights which have at
least some job with the built_revision_foo we are looking for.

This condition is strictly broader than that implemented inside the
flight search loop, so there is no functional change.

Perf: runtime of my test case now ~300s-500s.

Example query before (from the Perl DBI trace):

      SELECT * FROM (
        SELECT flight, blessing FROM flights
            WHERE (branch='xen-unstable')
              AND                   EXISTS (SELECT 1
                            FROM jobs
                           WHERE jobs.flight = flights.flight
                             AND jobs.job = ?)

              AND ( (TRUE AND flight <= 151903) AND (blessing='real') )
            ORDER BY flight DESC
            LIMIT 1000
      ) AS sub
      ORDER BY blessing ASC, flight DESC

With these bind variables:

    "test-armhf-armhf-libvirt"

After:

      SELECT * FROM (
        SELECT DISTINCT flight, blessing
             FROM flights
             JOIN runvars r1 USING (flight)

            WHERE (branch='xen-unstable')
              AND ( (TRUE AND flight <= 151903) AND (blessing='real') )
                  AND EXISTS (SELECT 1
                            FROM jobs
                           WHERE jobs.flight = flights.flight
                             AND jobs.job = ?)

              AND r1.name LIKE 'built_revision_%'
              AND r1.name = ?
              AND r1.val= ?

            ORDER BY flight DESC
            LIMIT 1000
      ) AS sub
      ORDER BY blessing ASC, flight DESC

With these bind variables:

      "test-armhf-armhf-libvirt"
      'built_revision_xen'
      '165f3afbfc3db70fcfdccad07085cde0a03c858b'

Diff to the query:

      SELECT * FROM (
-        SELECT flight, blessing FROM flights
+        SELECT DISTINCT flight, blessing
+             FROM flights
+             JOIN runvars r1 USING (flight)
+
             WHERE (branch='xen-unstable')
+              AND ( (TRUE AND flight <= 151903) AND (blessing='real') )
               AND                   EXISTS (SELECT 1
                             FROM jobs
                            WHERE jobs.flight = flights.flight
                              AND jobs.job = ?)

-              AND ( (TRUE AND flight <= 151903) AND (blessing='real') )
+              AND r1.name LIKE 'built_revision_%'
+              AND r1.name = ?
+              AND r1.val= ?
+
             ORDER BY flight DESC
             LIMIT 1000
       ) AS sub

CC: George Dunlap <George.Dunlap@citrix.com>
Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 schema/runvars-built-index.sql |  2 +-
 sg-report-flight               | 64 ++++++++++++++++++++++++++++++++--
 2 files changed, 62 insertions(+), 4 deletions(-)

diff --git a/schema/runvars-built-index.sql b/schema/runvars-built-index.sql
index 94f85ed8..8582227e 100644
--- a/schema/runvars-built-index.sql
+++ b/schema/runvars-built-index.sql
@@ -1,4 +1,4 @@
--- ##OSSTEST## 007 Preparatory
+-- ##OSSTEST## 007 Needed
 --
 -- This index helps sg-report-flight find relevant flights.
 
diff --git a/sg-report-flight b/sg-report-flight
index 70def778..61aec7a8 100755
--- a/sg-report-flight
+++ b/sg-report-flight
@@ -185,19 +185,77 @@ END
     if (defined $job) {
 	push @flightsq_params, $job;
 	$flightsq_jobcond = <<END;
-                  EXISTS (SELECT 1
+                  AND EXISTS (SELECT 1
 			    FROM jobs
 			   WHERE jobs.flight = flights.flight
 			     AND jobs.job = ?)
 END
     }
 
+    # We build a slightly complicated query to find possibly-relevant
+    # flights.  A "possibly-relevant" flight is one which the main
+    # flight categorisation algorithm below (the loop over $tflight)
+    # *might* decide is of interest.
+    #
+    # That algorithm produces a table of which revision(s) of what
+    # %specver trees the build jobs for the relevant test job used.
+    # And then it insists (amongst other things) that for each such
+    # tree the revision in question appears.
+    #
+    # It only looks at build jobs within the flight.  So any flight
+    # that the main algorithm finds interesting will have *some* job
+    # (in the same flight) mentioning that revision in a built
+    # revision runvar.  So we can search the runvars table by its
+    # index on the revision.
+    #
+    # So we look for flights that have an appropriate entry in runvars
+    # for each %specver tree.  We can do this by joining the runvar
+    # table once for each tree.
+    #
+    # The "osstest" tree is handled specially. as ever.  (We use
+    # "r$ri" there too for orthogonality of the code, not because
+    # there could be multiple specifiations for the osstest revision.)
+    #
+    # This complex query is an optimisation: for correctness, we must
+    # still execute the full job-specific recursive examination, for
+    # each possibly-relevant flight - that's the $tflight loop body.
+
+    my $runvars_joins = '';
+    my $runvars_conds = '';
+    my $ri=0;
+    foreach my $tree (sort keys %{ $specver{$thisthat} }) {
+      $ri++;
+      if ($tree ne 'osstest') {
+	  $runvars_joins .= <<END;
+             JOIN runvars r$ri USING (flight)
+END
+	  $runvars_conds .= <<END;
+              AND r$ri.name LIKE 'built_revision_%' 
+              AND r$ri.name = ?
+              AND r$ri.val= ?
+END
+	  push @flightsq_params, "built_revision_$tree",
+	                     $specver{$thisthat}{$tree};
+      } else {
+	  $runvars_joins .= <<END;
+             JOIN flights_harness_touched r$ri USING (flight)
+END
+	  $runvars_conds .= <<END;
+              AND r$ri.harness= ?
+END
+	  push @flightsq_params, $specver{$thisthat}{$tree};
+      }
+    }
+
     my $flightsq= <<END;
       SELECT * FROM (
-        SELECT flight, blessing FROM flights
+        SELECT DISTINCT flight, blessing
+             FROM flights
+$runvars_joins
             WHERE $branches_cond_q
-              AND $flightsq_jobcond
               AND $blessingscond
+$flightsq_jobcond
+$runvars_conds
             ORDER BY flight DESC
             LIMIT 1000
       ) AS sub
-- 
2.20.1


