Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A50BE2344A0
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 13:38:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1TMz-0005mh-9A; Fri, 31 Jul 2020 11:38:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nr0X=BK=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1k1TMy-0005kZ-0D
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 11:38:36 +0000
X-Inumbo-ID: 59a52144-d322-11ea-8e26-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 59a52144-d322-11ea-8e26-bc764e2007e4;
 Fri, 31 Jul 2020 11:38:27 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1k1TMp-0001W4-15; Fri, 31 Jul 2020 12:38:27 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH v2 02/41] SQL: Use "LIKE" rather than "like", etc.
Date: Fri, 31 Jul 2020 12:37:41 +0100
Message-Id: <20200731113820.5765-3-ian.jackson@eu.citrix.com>
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

This is more like the rest of the style.  It will also make it easier
to find instances of the mistaken LIKE syntax.

I found these with "git grep" and manually edited them.  I have
checked the before-and-after result of
   find * -type f | xargs perl -i~ -pe 's/\bLIKE\b/like/g'
and it has only the few expected changes to ANDs and ORs.

No functional change.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
New in v2.
---
 cr-ensure-disk-space         |  4 ++--
 cs-adjust-flight             |  2 +-
 mg-force-push                |  2 +-
 mg-report-host-usage-collect | 10 +++++-----
 ms-planner                   |  2 +-
 sg-report-flight             |  2 +-
 sg-report-host-history       |  4 ++--
 7 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/cr-ensure-disk-space b/cr-ensure-disk-space
index 3e0288f9..11d801b0 100755
--- a/cr-ensure-disk-space
+++ b/cr-ensure-disk-space
@@ -99,8 +99,8 @@ my $chkq= db_prepare("SELECT * FROM flights WHERE flight=?");
 my $refq= db_prepare(<<END);
     SELECT flight, val
       FROM runvars
-     WHERE name like '%job'
-       AND val like '%.%'
+     WHERE name LIKE '%job'
+       AND val LIKE '%.%'
        AND flight >= ?
 END
 
diff --git a/cs-adjust-flight b/cs-adjust-flight
index 98d40891..d04a2fd7 100755
--- a/cs-adjust-flight
+++ b/cs-adjust-flight
@@ -526,7 +526,7 @@ sub change__repro_buildjobs {
 	}
     }
     my $testq = db_prepare(<<END);
-SELECT name, val FROM runvars WHERE flight=? AND job=? AND name like '%job';
+SELECT name, val FROM runvars WHERE flight=? AND job=? AND name LIKE '%job';
 END
     my $buildq_txt = <<END;
 SELECT name FROM runvars WHERE flight=? AND job=? AND ('f'
diff --git a/mg-force-push b/mg-force-push
index 1066a300..001e0c47 100755
--- a/mg-force-push
+++ b/mg-force-push
@@ -54,7 +54,7 @@ END
         FROM rv url
         JOIN rv built
              ON url.job    = built.job
-            AND url.name   like 'tree_%'
+            AND url.name   LIKE 'tree_%'
             AND built.name = 'built_revision_' || substring(url.name, 6)
        WHERE url.val = ?
 END
diff --git a/mg-report-host-usage-collect b/mg-report-host-usage-collect
index 160d295f..3fab490a 100755
--- a/mg-report-host-usage-collect
+++ b/mg-report-host-usage-collect
@@ -154,10 +154,10 @@ END
         SELECT finished    prep_finished,
                status      prep_status
           FROM steps prep
-         WHERE flight=? and job=?
+         WHERE flight=? AND job=?
            AND prep.finished IS NOT NULL
            AND (prep.step='ts-host-build-prep'
-            OR  prep.step like 'ts-host-install%')
+            OR  prep.step LIKE 'ts-host-install%')
       ORDER BY stepno DESC
          LIMIT 1
 END
@@ -165,14 +165,14 @@ END
     my $hostsq = db_prepare(<<END);
         SELECT val, synth
           FROM runvars
-         WHERE flight=? and job=?
-           AND (name like '%_host' or name='host')
+         WHERE flight=? AND job=?
+           AND (name LIKE '%_host' OR name='host')
 END
 
     my $finishq = db_prepare(<<END);
         SELECT max(finished) AS finished
           FROM steps
-         WHERE flight=? and job=?
+         WHERE flight=? AND job=?
 END
 
     progress1 "minflight $minflight executing...";
diff --git a/ms-planner b/ms-planner
index c70b46b0..11423404 100755
--- a/ms-planner
+++ b/ms-planner
@@ -72,7 +72,7 @@ sub allocations ($$) {
                        ON owntaskid = taskid
 		    WHERE NOT (tasks.type='magic' AND
                                tasks.refkey='allocatable')
-                      AND NOT (resources.restype like 'share-%'
+                      AND NOT (resources.restype LIKE 'share-%'
                            AND NOT EXISTS (
  SELECT 1 FROM resource_sharing sh
          WHERE sh.restype = substring(resources.restype from 7)
diff --git a/sg-report-flight b/sg-report-flight
index 6c481f6f..0edb6e1a 100755
--- a/sg-report-flight
+++ b/sg-report-flight
@@ -513,7 +513,7 @@ END
         my $revh= db_prepare(<<END);
             SELECT * FROM runvars
                 WHERE flight=$flight AND job='$j->{job}'
-                  AND name like 'built_revision_%'
+                  AND name LIKE 'built_revision_%'
                 ORDER BY name
 END
         # We report in jobtext revisions in non-main-revision jobs, too.
diff --git a/sg-report-host-history b/sg-report-host-history
index 54738e68..c22a1704 100755
--- a/sg-report-host-history
+++ b/sg-report-host-history
@@ -37,7 +37,7 @@ our @blessings;
 
 open DEBUG, ">/dev/null";
 
-my $namecond= "(name = 'host' or name like '%_host')";
+my $namecond= "(name = 'host' OR name LIKE '%_host')";
 csreadconfig();
 
 while (@ARGV && $ARGV[0] =~ m/^-/) {
@@ -456,7 +456,7 @@ foreach my $host (@ARGV) {
 	        SELECT DISTINCT val
 		  FROM runvars
 		 WHERE flight=?
-		   AND (name = 'host' or name like '%_host')
+		   AND (name = 'host' OR name LIKE '%_host')
 END
             $hostsinflightq->execute($flight);
 	    while (my $row = $hostsinflightq->fetchrow_hashref()) {
-- 
2.20.1


