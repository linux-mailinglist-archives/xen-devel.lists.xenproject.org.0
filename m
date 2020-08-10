Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A2D2408BB
	for <lists+xen-devel@lfdr.de>; Mon, 10 Aug 2020 17:24:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k59ev-00048j-Be; Mon, 10 Aug 2020 15:24:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W5wo=BU=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1k59eu-00048e-Jy
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2020 15:24:20 +0000
X-Inumbo-ID: 1d694ced-4a14-4482-95eb-827d14a2c1ad
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d694ced-4a14-4482-95eb-827d14a2c1ad;
 Mon, 10 Aug 2020 15:24:19 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1k59er-0007Qb-VJ; Mon, 10 Aug 2020 16:24:18 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH] SQL: Change "... LIKE '...\_...' ..." to "... LIKE
 '...\\_...' ..."
Date: Mon, 10 Aug 2020 16:24:04 +0100
Message-Id: <20200810152404.15325-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Perl's "" quotes, and corresponding <<END constructs, do
\-interpolation, so remove these \ which we carefully added in
   e7a408dd01184df0a57ae5d9072d15225c52a99f
   SQL: Change LIKE E'...\\_...' to LIKE '...\_...'

This is only not a performance problem due to query mismathes with the
available indices, because the test indices are still present in the
Massachusetts instance.

I have verified that this has the intended chanve everywhere by
 1. Double-checking that eacbh of these instances is within <<END
    or "" or equivalent.
 2. Running git-ls-files | xargs perl -i -pe 's/\\\\_/\\_/g'
    and manually examining the diff against this patch's parent.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/Executive.pm         | 2 +-
 cs-bisection-step            | 8 ++++----
 mg-force-push                | 2 +-
 mg-report-host-usage-collect | 2 +-
 sg-report-flight             | 4 ++--
 sg-report-host-history       | 8 ++++----
 sg-report-job-history        | 2 +-
 ts-logs-capture              | 2 +-
 8 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/Osstest/Executive.pm b/Osstest/Executive.pm
index 1e94b282..0808202b 100644
--- a/Osstest/Executive.pm
+++ b/Osstest/Executive.pm
@@ -444,7 +444,7 @@ END
 	    $querytext .= <<END;
 		    JOIN runvars r USING (flight)
 		   WHERE name=?
-                     AND name LIKE 'revision\_%'
+                     AND name LIKE 'revision\\_%'
 		     AND val=?
                      AND ${\ main_revision_job_cond('r.job') }
 END
diff --git a/cs-bisection-step b/cs-bisection-step
index 8544bac0..762966da 100755
--- a/cs-bisection-step
+++ b/cs-bisection-step
@@ -185,15 +185,15 @@ sub flight_rmap ($$) {
     my $qtxt_common_rev_ok = sub {
 	my ($table) = @_;
 	[<<END];
-                 ($table.name LIKE 'built\_revision\_%' OR
-                  $table.name LIKE 'revision\_%')
+                 ($table.name LIKE 'built\\_revision\\_%' OR
+                  $table.name LIKE 'revision\\_%')
 END
     };
 
     my $qtxt_common_tree_ok = sub {
 	my ($table) = @_;
 	[<<END];
-  	      $table.name LIKE 'tree\_%'
+  	      $table.name LIKE 'tree\\_%'
 END
     };
 
@@ -1226,7 +1226,7 @@ sub preparejob ($$$$) {
             INTO TEMP  bisection_runvars
                  FROM  runvars
                 WHERE  flight=? AND job=? AND synth='f'
-                  AND  name NOT LIKE 'revision\_%'
+                  AND  name NOT LIKE 'revision\\_%'
                   AND  name NOT LIKE '%host'
 END
     my (@trevisions) = split / /, $choose->{Rtuple};
diff --git a/mg-force-push b/mg-force-push
index 3a701a11..9c3cc786 100755
--- a/mg-force-push
+++ b/mg-force-push
@@ -54,7 +54,7 @@ END
         FROM rv url
         JOIN rv built
              ON url.job    = built.job
-            AND url.name   LIKE 'tree\_%'
+            AND url.name   LIKE 'tree\\_%'
             AND built.name = 'built_revision_' || substring(url.name, 6)
        WHERE url.val = ?
 END
diff --git a/mg-report-host-usage-collect b/mg-report-host-usage-collect
index 1944c8d7..34d24943 100755
--- a/mg-report-host-usage-collect
+++ b/mg-report-host-usage-collect
@@ -166,7 +166,7 @@ END
         SELECT val, synth
           FROM runvars
          WHERE flight=? AND job=?
-           AND (name LIKE '%\_host' OR name='host')
+           AND (name LIKE '%\\_host' OR name='host')
 END
 
     my $finishq = db_prepare(<<END);
diff --git a/sg-report-flight b/sg-report-flight
index 35ec11e7..3e0019b0 100755
--- a/sg-report-flight
+++ b/sg-report-flight
@@ -253,7 +253,7 @@ END
              JOIN runvars r$ri USING (flight)
 END
 	  $runvars_conds .= <<END;
-              AND r$ri.name LIKE 'built\_revision\_%' 
+              AND r$ri.name LIKE 'built\\_revision\\_%' 
               AND r$ri.name = ?
               AND r$ri.val= ?
 END
@@ -639,7 +639,7 @@ END
         my $revh= db_prepare(<<END);
             SELECT * FROM runvars
                 WHERE flight=$flight AND job='$j->{job}'
-                  AND name LIKE 'built\_revision\_%'
+                  AND name LIKE 'built\\_revision\\_%'
                 ORDER BY name
 END
         # We report in jobtext revisions in non-main-revision jobs, too.
diff --git a/sg-report-host-history b/sg-report-host-history
index dc694ebe..380f8fac 100755
--- a/sg-report-host-history
+++ b/sg-report-host-history
@@ -39,7 +39,7 @@ our @blessings;
 
 open DEBUG, ">/dev/null";
 
-my $namecond= "(name = 'host' OR name LIKE '%\_host')";
+my $namecond= "(name = 'host' OR name LIKE '%\\_host')";
 csreadconfig();
 
 while (@ARGV && $ARGV[0] =~ m/^-/) {
@@ -172,7 +172,7 @@ sub mainquery ($) {
 	SELECT flight, job, name, status
 	  FROM runvars
           JOIN jobs USING (flight, job)
-	 WHERE (name = 'host' OR name LIKE '%\_host')
+	 WHERE (name = 'host' OR name LIKE '%\\_host')
 	   AND val = ?
 	   AND $flightcond
            AND $restrictflight_cond
@@ -246,7 +246,7 @@ END
 	  FROM runvars
 	 WHERE flight=? AND job=?
            AND (
-               name LIKE (? || '\_power\_%')
+               name LIKE (? || '\\_power\\_%')
            )
 END
 
@@ -449,7 +449,7 @@ foreach my $host (@ARGV) {
 	        SELECT DISTINCT val
 		  FROM runvars
 		 WHERE flight=?
-		   AND (name = 'host' OR name LIKE '%\_host')
+		   AND (name = 'host' OR name LIKE '%\\_host')
 END
             $hostsinflightq->execute($flight);
 	    while (my $row = $hostsinflightq->fetchrow_hashref()) {
diff --git a/sg-report-job-history b/sg-report-job-history
index 22a28627..6008ca72 100755
--- a/sg-report-job-history
+++ b/sg-report-job-history
@@ -92,7 +92,7 @@ if (defined($flight)) {
 our $revisionsq= db_prepare(<<END);
         SELECT * FROM runvars
          WHERE flight=? AND job=?
-           AND name LIKE 'built\_revision\_%'
+           AND name LIKE 'built\\_revision\\_%'
 END
 # (We report on non-main-revision jobs just as for main-revision ones.)
 
diff --git a/ts-logs-capture b/ts-logs-capture
index 62c281b8..ec494fe1 100755
--- a/ts-logs-capture
+++ b/ts-logs-capture
@@ -44,7 +44,7 @@ our (@allguests, @guests);
 sub find_guests () {
     my $sth= $dbh_tests->prepare(<<END);
         SELECT name FROM runvars WHERE flight=? AND job=?
-            AND name LIKE '%\_domname'
+            AND name LIKE '%\\_domname'
             ORDER BY name
 END
     $sth->execute($flight, $job);
-- 
2.20.1


