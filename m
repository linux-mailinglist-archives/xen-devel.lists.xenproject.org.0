Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AF32344E3
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 13:56:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1Tdz-00005B-27; Fri, 31 Jul 2020 11:56:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nr0X=BK=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1k1Tdx-0008RD-Td
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 11:56:09 +0000
X-Inumbo-ID: d21043bf-d324-11ea-8e29-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d21043bf-d324-11ea-8e29-bc764e2007e4;
 Fri, 31 Jul 2020 11:56:09 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1k1TMx-0001W4-0B; Fri, 31 Jul 2020 12:38:35 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH v2 21/41] sg-report-host-history: Find flight limit by
 flight start date
Date: Fri, 31 Jul 2020 12:38:00 +0100
Message-Id: <20200731113820.5765-22-ian.jackson@eu.citrix.com>
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

By default we look for anything in (roughly) the last year.

This query is in fact quite fast because the flights table is small.

There is still the per-host limit of $limit (2000) recent runs.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-host-history | 56 ++++++++++++++++++++----------------------
 1 file changed, 27 insertions(+), 29 deletions(-)

diff --git a/sg-report-host-history b/sg-report-host-history
index 9730ae7a..a159df3e 100755
--- a/sg-report-host-history
+++ b/sg-report-host-history
@@ -29,6 +29,7 @@ use POSIX;
 use Osstest::Executive qw(:DEFAULT :colours);
 
 our $limit= 2000;
+our $timelimit= 86400 * (366 + 14);
 our $flightlimit;
 our $htmlout = ".";
 our $read_existing=1;
@@ -45,6 +46,8 @@ while (@ARGV && $ARGV[0] =~ m/^-/) {
     last if m/^--?$/;
     if (m/^--(limit)\=([1-9]\d*)$/) {
         $$1= $2;
+    } elsif (m/^--time-limit\=([1-9]\d*)$/) {
+        $timelimit= $1;
     } elsif (m/^--flight-limit\=([1-9]\d*)$/) {
 	$flightlimit= $1;
     } elsif (restrictflight_arg($_)) {
@@ -108,38 +111,33 @@ sub read_existing_logs ($) {
 }
 
 sub computeflightsrange () {
-    if (!$flightlimit) {
-	my $flagscond =
-	    '('.join(' OR ', map { "f.hostflag = 'blessed-$_'" } @blessings).')';
-	my $nhostsq = db_prepare(<<END);
-	    SELECT count(*)
-	      FROM resources r
-	     WHERE restype='host'
-	       AND EXISTS (SELECT 1
-			     FROM hostflags f
-			    WHERE f.hostname=r.resname
-			      AND $flagscond)
+    if ($flightlimit) {
+	my $minflightsq = db_prepare(<<END);
+	    SELECT flight
+	      FROM (
+		SELECT flight
+		  FROM flights
+		 WHERE $restrictflight_cond
+		 ORDER BY flight DESC
+		 LIMIT $flightlimit
+	      ) f
+	      ORDER BY flight ASC
+	      LIMIT 1
 END
-        $nhostsq->execute();
-	my ($nhosts) = $nhostsq->fetchrow_array();
-	print DEBUG "COUNTED $nhosts hosts\n";
-	$flightlimit = $nhosts * $limit * 2;
-    }
-
-    my $minflightsq = db_prepare(<<END);
-	SELECT flight
-	  FROM (
+	$minflightsq->execute();
+	($minflight,) = $minflightsq->fetchrow_array();
+    } else {
+	my $minflightsq = db_prepare(<<END);
 	    SELECT flight
-	      FROM flights
-             WHERE $restrictflight_cond
-	     ORDER BY flight DESC
-	     LIMIT $flightlimit
-	  ) f
-	  ORDER BY flight ASC
-	  LIMIT 1
+              FROM flights
+             WHERE started >= ?
+          ORDER BY flight ASC
+             LIMIT 1
 END
-    $minflightsq->execute();
-    ($minflight,) = $minflightsq->fetchrow_array();
+	my $now = time // die $!;
+        $minflightsq->execute($now - $timelimit);
+	($minflight,) = $minflightsq->fetchrow_array();
+    }
     $minflight //= 0;
 
     $flightcond = "(flight > $minflight)";
-- 
2.20.1


