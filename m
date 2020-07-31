Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF91234508
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 14:01:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1Tix-0001Wj-Vz; Fri, 31 Jul 2020 12:01:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nr0X=BK=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1k1Tiw-0001R9-6M
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 12:01:18 +0000
X-Inumbo-ID: 8a0dea02-d325-11ea-8e2b-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8a0dea02-d325-11ea-8e2b-bc764e2007e4;
 Fri, 31 Jul 2020 12:01:17 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1k1TN4-0001W4-Jj; Fri, 31 Jul 2020 12:38:43 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH v2 38/41] SQL: Change LIKE E'...\\_...' to LIKE
 '...\_...'
Date: Fri, 31 Jul 2020 12:38:17 +0100
Message-Id: <20200731113820.5765-39-ian.jackson@eu.citrix.com>
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

E'...' means to interpret \-escapes.  But we don't want them: without
E, we can avoid some toothpick-doubling.

No functional change.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
v2: New patch.
---
 cs-bisection-step     | 8 ++++----
 sg-report-job-history | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/cs-bisection-step b/cs-bisection-step
index 718c87b0..a82cbfb8 100755
--- a/cs-bisection-step
+++ b/cs-bisection-step
@@ -185,15 +185,15 @@ sub flight_rmap ($$) {
     my $qtxt_common_rev_ok = sub {
 	my ($table) = @_;
 	[<<END];
-                 ($table.name LIKE E'built\\_revision\\_%' OR
-                  $table.name LIKE E'revision\\_%')
+                 ($table.name LIKE 'built\_revision\_%' OR
+                  $table.name LIKE 'revision\_%')
 END
     };
 
     my $qtxt_common_tree_ok = sub {
 	my ($table) = @_;
 	[<<END];
-  	      $table.name LIKE E'tree\\_%'
+  	      $table.name LIKE 'tree\_%'
 END
     };
 
@@ -1220,7 +1220,7 @@ sub preparejob ($$$$) {
             INTO TEMP  bisection_runvars
                  FROM  runvars
                 WHERE  flight=? AND job=? AND synth='f'
-                  AND  name NOT LIKE E'revision\\_%'
+                  AND  name NOT LIKE 'revision\_%'
                   AND  name NOT LIKE '%host'
 END
     my (@trevisions) = split / /, $choose->{Rtuple};
diff --git a/sg-report-job-history b/sg-report-job-history
index d5f91ff1..22a28627 100755
--- a/sg-report-job-history
+++ b/sg-report-job-history
@@ -92,7 +92,7 @@ if (defined($flight)) {
 our $revisionsq= db_prepare(<<END);
         SELECT * FROM runvars
          WHERE flight=? AND job=?
-           AND name LIKE E'built\\_revision\\_\%'
+           AND name LIKE 'built\_revision\_%'
 END
 # (We report on non-main-revision jobs just as for main-revision ones.)
 
@@ -109,7 +109,7 @@ sub add_revisions ($$$$) {
 our $buildsq= db_prepare(<<END);
         SELECT * FROM runvars
          WHERE flight=? AND job=?
-           AND name LIKE E'\%buildjob'
+           AND name LIKE '%buildjob'
 END
 
 sub processjobbranch ($$) {
-- 
2.20.1


