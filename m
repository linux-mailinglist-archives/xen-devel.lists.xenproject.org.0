Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D009A2344A1
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 13:38:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1TN4-0005oL-JB; Fri, 31 Jul 2020 11:38:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nr0X=BK=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1k1TN3-0005kZ-0H
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 11:38:41 +0000
X-Inumbo-ID: 59d8fa33-d322-11ea-8e26-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 59d8fa33-d322-11ea-8e26-bc764e2007e4;
 Fri, 31 Jul 2020 11:38:28 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1k1TMp-0001W4-Cw; Fri, 31 Jul 2020 12:38:27 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH v2 03/41] SQL: Fix incorrect LIKE pattern syntax
 (literals)
Date: Fri, 31 Jul 2020 12:37:42 +0100
Message-Id: <20200731113820.5765-4-ian.jackson@eu.citrix.com>
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

LIKE takes a weird SQLish glob pattern, where % is like a glob *
and (relevantly, here) _ is like a glob ?.

Every _ in one of these LIKE patterns needs to be escaped with \.

Do that for all the literal LIKE patterns.

This fixes bugs.  Generally, bugs where the wrong rows might be
returned (except that the data probably doesn't have any such rows).

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
New in v2.
---
 mg-force-push                | 2 +-
 mg-report-host-usage-collect | 2 +-
 sg-report-flight             | 2 +-
 sg-report-host-history       | 6 +++---
 ts-logs-capture              | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/mg-force-push b/mg-force-push
index 001e0c47..3a701a11 100755
--- a/mg-force-push
+++ b/mg-force-push
@@ -54,7 +54,7 @@ END
         FROM rv url
         JOIN rv built
              ON url.job    = built.job
-            AND url.name   LIKE 'tree_%'
+            AND url.name   LIKE 'tree\_%'
             AND built.name = 'built_revision_' || substring(url.name, 6)
        WHERE url.val = ?
 END
diff --git a/mg-report-host-usage-collect b/mg-report-host-usage-collect
index 3fab490a..1944c8d7 100755
--- a/mg-report-host-usage-collect
+++ b/mg-report-host-usage-collect
@@ -166,7 +166,7 @@ END
         SELECT val, synth
           FROM runvars
          WHERE flight=? AND job=?
-           AND (name LIKE '%_host' OR name='host')
+           AND (name LIKE '%\_host' OR name='host')
 END
 
     my $finishq = db_prepare(<<END);
diff --git a/sg-report-flight b/sg-report-flight
index 0edb6e1a..831917a9 100755
--- a/sg-report-flight
+++ b/sg-report-flight
@@ -513,7 +513,7 @@ END
         my $revh= db_prepare(<<END);
             SELECT * FROM runvars
                 WHERE flight=$flight AND job='$j->{job}'
-                  AND name LIKE 'built_revision_%'
+                  AND name LIKE 'built\_revision\_%'
                 ORDER BY name
 END
         # We report in jobtext revisions in non-main-revision jobs, too.
diff --git a/sg-report-host-history b/sg-report-host-history
index c22a1704..7505b18b 100755
--- a/sg-report-host-history
+++ b/sg-report-host-history
@@ -37,7 +37,7 @@ our @blessings;
 
 open DEBUG, ">/dev/null";
 
-my $namecond= "(name = 'host' OR name LIKE '%_host')";
+my $namecond= "(name = 'host' OR name LIKE '%\_host')";
 csreadconfig();
 
 while (@ARGV && $ARGV[0] =~ m/^-/) {
@@ -256,7 +256,7 @@ END
 	  FROM runvars
 	 WHERE flight=? AND job=?
            AND (
-               name LIKE (? || '_power_%')
+               name LIKE (? || '\_power\_%')
            )
 END
 
@@ -456,7 +456,7 @@ foreach my $host (@ARGV) {
 	        SELECT DISTINCT val
 		  FROM runvars
 		 WHERE flight=?
-		   AND (name = 'host' OR name LIKE '%_host')
+		   AND (name = 'host' OR name LIKE '%\_host')
 END
             $hostsinflightq->execute($flight);
 	    while (my $row = $hostsinflightq->fetchrow_hashref()) {
diff --git a/ts-logs-capture b/ts-logs-capture
index d75a2fda..62c281b8 100755
--- a/ts-logs-capture
+++ b/ts-logs-capture
@@ -44,7 +44,7 @@ our (@allguests, @guests);
 sub find_guests () {
     my $sth= $dbh_tests->prepare(<<END);
         SELECT name FROM runvars WHERE flight=? AND job=?
-            AND name LIKE '%_domname'
+            AND name LIKE '%\_domname'
             ORDER BY name
 END
     $sth->execute($flight, $job);
-- 
2.20.1


