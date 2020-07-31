Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE842344A2
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 13:38:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1TN9-0005q6-Ri; Fri, 31 Jul 2020 11:38:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nr0X=BK=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1k1TN8-0005kZ-0K
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 11:38:46 +0000
X-Inumbo-ID: 5a418c50-d322-11ea-8e26-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a418c50-d322-11ea-8e26-bc764e2007e4;
 Fri, 31 Jul 2020 11:38:28 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1k1TMp-0001W4-T6; Fri, 31 Jul 2020 12:38:28 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH v2 04/41] SQL: Fix incorrect LIKE pattern syntax
 (program variables)
Date: Fri, 31 Jul 2020 12:37:43 +0100
Message-Id: <20200731113820.5765-5-ian.jackson@eu.citrix.com>
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

In two places the pattern for LIKE is constructed programmatically.
In this case, too, we need to escape % and _.

We pass the actual pattern (or pattern fragment) via ?, so we do not
need to worry about '.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
New in v2.
---
 Osstest.pm                 | 8 +++++++-
 Osstest/JobDB/Executive.pm | 2 +-
 sg-report-host-history     | 3 ++-
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/Osstest.pm b/Osstest.pm
index 63dddd95..b2b6b741 100644
--- a/Osstest.pm
+++ b/Osstest.pm
@@ -39,7 +39,7 @@ BEGIN {
                       main_revision_job_cond other_revision_job_suffix
                       $dbh_tests db_retry db_retry_retry db_retry_abort
 		      db_readonly_report
-                      db_begin_work db_prepare
+                      db_begin_work db_prepare db_quote_like_pattern
                       get_harness_rev blessing_must_not_modify_host
                       ensuredir get_filecontents_core_quiet system_checked
                       nonempty visible_undef show_abs_time
@@ -358,6 +358,12 @@ sub postfork () {
     $mjobdb->jobdb_postfork();
 }
 
+sub db_quote_like_pattern ($) {
+    local ($_) = @_;
+    s{[_%\\]}{\\$&}g;
+    $_;
+}
+
 #---------- script entrypoints ----------
 
 sub csreadconfig () {
diff --git a/Osstest/JobDB/Executive.pm b/Osstest/JobDB/Executive.pm
index be5588fc..39deb8a2 100644
--- a/Osstest/JobDB/Executive.pm
+++ b/Osstest/JobDB/Executive.pm
@@ -143,7 +143,7 @@ sub _check_testdbs ($) {
 	      AND live
 	      AND username LIKE (? || '@%')
 END
-    $sth->execute($c{Username});
+    $sth->execute(db_quote_like_pattern($c{Username}));
     my $allok = 1;
     while (my $row = $sth->fetchrow_hashref()) {
 	next if $row->{dbname} =~ m/^$re$/o;
diff --git a/sg-report-host-history b/sg-report-host-history
index 7505b18b..9730ae7a 100755
--- a/sg-report-host-history
+++ b/sg-report-host-history
@@ -380,7 +380,8 @@ END
 	    $runvarq_hits++;
 	} else {
 	    $runvarq_misses++;
-	    $jrunvarq->execute($jr->{flight}, $jr->{job}, $ident);
+	    $jrunvarq->execute($jr->{flight}, $jr->{job},
+			       db_quote_like_pattern($ident));
 	    my %runvars;
 	    while (my ($n, $v) = $jrunvarq->fetchrow_array()) {
 		$runvars{$n} = $v;
-- 
2.20.1


