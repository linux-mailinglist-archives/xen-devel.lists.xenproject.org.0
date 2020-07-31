Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90776234581
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 14:13:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1Ttz-00047x-8D; Fri, 31 Jul 2020 12:12:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nr0X=BK=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1k1Tty-00047s-0v
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 12:12:42 +0000
X-Inumbo-ID: 2140508a-d327-11ea-8e2c-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2140508a-d327-11ea-8e2c-bc764e2007e4;
 Fri, 31 Jul 2020 12:12:40 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1k1TMv-0001W4-2L; Fri, 31 Jul 2020 12:38:33 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH v2 18/41] duration_estimator: Move duration query loop
 into database
Date: Fri, 31 Jul 2020 12:37:57 +0100
Message-Id: <20200731113820.5765-19-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200731113820.5765-1-ian.jackson@eu.citrix.com>
References: <20200731113820.5765-1-ian.jackson@eu.citrix.com>
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

Stuff the two queries together: we use the firsty query as a WITH
clause.  This is significantly faster, perhaps because the query
optimiser does a better job but probably just because it saves on
round trips.

No functional change.

Perf: subjectively this seemed to help when the cache was cold.  Now I
have a warm cache and it doesn't seem to make much difference.

Perf: runtime of my test case now ~5-7s.

Example queries before (from the debugging output):

 Query A part I:

            SELECT f.flight AS flight,
                   j.job AS job,
                   f.started AS started,
                   j.status AS status
                     FROM flights f
                     JOIN jobs j USING (flight)
                     JOIN runvars r
                             ON  f.flight=r.flight
                            AND  r.name=?
                    WHERE  j.job=r.job
                      AND  f.blessing=?
                      AND  f.branch=?
                      AND  j.job=?
                      AND  r.val=?
                      AND  (j.status='pass' OR j.status='fail'
                           OR j.status='truncated'!)
                      AND  f.started IS NOT NULL
                      AND  f.started >= ?
                 ORDER BY f.started DESC

 With bind variables:
     "test-amd64-i386-xl-pvshim"
     "guest-start"

 Query B part I:

            SELECT f.flight AS flight,
                   s.job AS job,
                   NULL as started,
                   NULL as status,
                   max(s.finished) AS max_finished
                      FROM steps s JOIN flights f
                        ON s.flight=f.flight
                     WHERE s.job=? AND f.blessing=? AND f.branch=?
                       AND s.finished IS NOT NULL
                       AND f.started IS NOT NULL
                       AND f.started >= ?
                     GROUP BY f.flight, s.job
                     ORDER BY max_finished DESC

 With bind variables:
    "test-armhf-armhf-libvirt"
    'real'
    "xen-unstable"
    1594144469

 Query common part II:

        WITH tsteps AS
        (
            SELECT *
              FROM steps
             WHERE flight=? AND job=?
        )
        , tsteps2 AS
        (
            SELECT *
              FROM tsteps
             WHERE finished <=
                     (SELECT finished
                        FROM tsteps
                       WHERE tsteps.testid = ?)
        )
        SELECT (
            SELECT max(finished)-min(started)
              FROM tsteps2
          ) - (
            SELECT sum(finished-started)
              FROM tsteps2
             WHERE step = 'ts-hosts-allocate'
          )
                AS duration

 With bind variables from previous query, eg:
     152045
     "test-armhf-armhf-libvirt"
     "guest-start.2"

After:

 Query A (combined):

            WITH f AS (
            SELECT f.flight AS flight,
                   j.job AS job,
                   f.started AS started,
                   j.status AS status
                     FROM flights f
                     JOIN jobs j USING (flight)
                     JOIN runvars r
                             ON  f.flight=r.flight
                            AND  r.name=?
                    WHERE  j.job=r.job
                      AND  f.blessing=?
                      AND  f.branch=?
                      AND  j.job=?
                      AND  r.val=?
                      AND  (j.status='pass' OR j.status='fail'
                           OR j.status='truncated'!)
                      AND  f.started IS NOT NULL
                      AND  f.started >= ?
                 ORDER BY f.started DESC

            )
            SELECT flight, max_finished, job, started, status,
            (
        WITH tsteps AS
        (
            SELECT *
              FROM steps
             WHERE flight=f.flight AND job=f.job
        )
        , tsteps2 AS
        (
            SELECT *
              FROM tsteps
             WHERE finished <=
                     (SELECT finished
                        FROM tsteps
                       WHERE tsteps.testid = ?)
        )
        SELECT (
            SELECT max(finished)-min(started)
              FROM tsteps2
          ) - (
            SELECT sum(finished-started)
              FROM tsteps2
             WHERE step = 'ts-hosts-allocate'
          )
                AS duration

            ) FROM f

 Query B (combined):

            WITH f AS (
            SELECT f.flight AS flight,
                   s.job AS job,
                   NULL as started,
                   NULL as status,
                   max(s.finished) AS max_finished
                      FROM steps s JOIN flights f
                        ON s.flight=f.flight
                     WHERE s.job=? AND f.blessing=? AND f.branch=?
                       AND s.finished IS NOT NULL
                       AND f.started IS NOT NULL
                       AND f.started >= ?
                     GROUP BY f.flight, s.job
                     ORDER BY max_finished DESC

            )
            SELECT flight, max_finished, job, started, status,
            (
        WITH tsteps AS
        (
            SELECT *
              FROM steps
             WHERE flight=f.flight AND job=f.job
        )
        , tsteps2 AS
        (
            SELECT *
              FROM tsteps
             WHERE finished <=
                     (SELECT finished
                        FROM tsteps
                       WHERE tsteps.testid = ?)
        )
        SELECT (
            SELECT max(finished)-min(started)
              FROM tsteps2
          ) - (
            SELECT sum(finished-started)
              FROM tsteps2
             WHERE step = 'ts-hosts-allocate'
          )
                AS duration

            ) FROM f

Diff for query A:

@@ -1,3 +1,4 @@
+            WITH f AS (
             SELECT f.flight AS flight,
                    j.job AS job,
                    f.started AS started,
@@ -18,11 +19,14 @@
                       AND  f.started >= ?
                  ORDER BY f.started DESC

+            )
+            SELECT flight, max_finished, job, started, status,
+            (
        WITH tsteps AS
         (
             SELECT *
               FROM steps
-             WHERE flight=? AND job=?
+             WHERE flight=f.flight AND job=f.job
         )
         , tsteps2 AS
         (
@@ -42,3 +46,5 @@
              WHERE step = 'ts-hosts-allocate'
           )
                 AS duration
+
+            ) FROM f

Diff for query B:

@@ -1,3 +1,4 @@
+            WITH f AS (
             SELECT f.flight AS flight,
                    s.job AS job,
                    NULL as started,
@@ -12,11 +13,14 @@
                      GROUP BY f.flight, s.job
                      ORDER BY max_finished DESC

+            )
+            SELECT flight, max_finished, job, started, status,
+            (
         WITH tsteps AS
         (
             SELECT *
               FROM steps
-             WHERE flight=? AND job=?
+             WHERE flight=f.flight AND job=f.job
         )
         , tsteps2 AS
         (
@@ -36,3 +40,5 @@
              WHERE step = 'ts-hosts-allocate'
           )
                 AS duration
+
+            ) FROM f

Reviewed-by: George Dunlap <George.Dunlap@citrix.com>
Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/Executive.pm | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/Osstest/Executive.pm b/Osstest/Executive.pm
index fb975dac..684cafc3 100644
--- a/Osstest/Executive.pm
+++ b/Osstest/Executive.pm
@@ -1192,7 +1192,7 @@ END
         (
             SELECT *
               FROM steps
-             WHERE flight=? AND job=?
+             WHERE flight=f.flight AND job=f.job
         )
 END_ALWAYS
         , tsteps2 AS
@@ -1216,9 +1216,20 @@ END_UPTOINCL
                 AS duration
 END_ALWAYS
 	
-    my $recentflights_q= $dbh_tests->prepare($recentflights_qtxt);
-    my $duration_anyref_q= $dbh_tests->prepare($duration_anyref_qtxt);
-    my $duration_duration_q = $dbh_tests->prepare($duration_duration_qtxt);
+    my $prepare_combi = sub {
+	db_prepare(<<END);
+            WITH f AS (
+$_[0]
+            )
+            SELECT flight, max_finished, job, started, status,
+            (
+$duration_duration_qtxt
+            ) FROM f
+END
+    };
+
+    my $recentflights_q= $prepare_combi->($recentflights_qtxt);
+    my $duration_anyref_q= $prepare_combi->($duration_anyref_qtxt);
 
     return sub {
         my ($job, $hostidname, $onhost, $uptoincl_testid) = @_;
@@ -1239,14 +1250,16 @@ END_ALWAYS
                                       $branch,
                                       $job,
                                       $onhost,
-                                      $limit);
+                                      $limit,
+				      @x_params);
             $refs= $recentflights_q->fetchall_arrayref({});
             $recentflights_q->finish();
             $dbg->("SAME-HOST GOT ".scalar(@$refs));
         }
 
         if (!@$refs) {
-            $duration_anyref_q->execute($job, $blessing, $branch, $limit);
+            $duration_anyref_q->execute($job, $blessing, $branch, $limit,
+					@x_params);
             $refs= $duration_anyref_q->fetchall_arrayref({});
             $duration_anyref_q->finish();
             $dbg->("ANY-HOST GOT ".scalar(@$refs));
@@ -1259,11 +1272,7 @@ END_ALWAYS
 
         my $duration_max= 0;
         foreach my $ref (@$refs) {
-	    my @d_d_args = ($ref->{flight}, $job);
-	    push @d_d_args, @x_params;
-            $duration_duration_q->execute(@d_d_args);
-            my ($duration) = $duration_duration_q->fetchrow_array();
-            $duration_duration_q->finish();
+            my ($duration) = $ref->{duration};
             if ($duration) {
                 $dbg->("REF $ref->{flight} DURATION $duration ".
 		       ($ref->{status} // ''));
-- 
2.20.1


