Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC48228871
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 20:42:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxxDz-00026f-Dn; Tue, 21 Jul 2020 18:42:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8efX=BA=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jxxDy-0001xV-N5
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 18:42:46 +0000
X-Inumbo-ID: e926bf38-cb81-11ea-85a2-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e926bf38-cb81-11ea-85a2-bc764e2007e4;
 Tue, 21 Jul 2020 18:42:21 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jxxDY-0001u7-Nz; Tue, 21 Jul 2020 19:42:20 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 06/14] sg-report-flight: Use WITH clause to use index
 for $anypassq
Date: Tue, 21 Jul 2020 19:41:57 +0100
Message-Id: <20200721184205.15232-7-ian.jackson@eu.citrix.com>
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

Perf: runtime of my test case now ~11s

Example query before (from the Perl DBI trace):

        SELECT * FROM flights JOIN steps USING (flight)
            WHERE (branch='xen-unstable')
              AND job=? and testid=? and status='pass'
              AND ( (TRUE AND flight <= 151903) AND (blessing='real') )
            LIMIT 1

After:

        WITH s AS
        (
        SELECT * FROM steps
         WHERE job=? and testid=? and status='pass'
        )
        SELECT * FROM flights JOIN s USING (flight)
            WHERE (branch='xen-unstable')
              AND ( (TRUE AND flight <= 151903) AND (blessing='real') )
            LIMIT 1

In both cases with bind vars:

   "test-amd64-i386-xl-pvshim"
   "guest-start"

Diff to the query:

-        SELECT * FROM flights JOIN steps USING (flight)
+        WITH s AS
+        (
+        SELECT * FROM steps
+         WHERE job=? and testid=? and status='pass'
+        )
+        SELECT * FROM flights JOIN s USING (flight)
             WHERE (branch='xen-unstable')
-              AND job=? and testid=? and status='pass'
               AND ( (TRUE AND flight <= 151903) AND (blessing='real') )
             LIMIT 1

CC: George Dunlap <George.Dunlap@citrix.com>
Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 schema/steps-job-index.sql |  2 +-
 sg-report-flight           | 14 ++++++++++++--
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/schema/steps-job-index.sql b/schema/steps-job-index.sql
index 07dc5a30..2c33af72 100644
--- a/schema/steps-job-index.sql
+++ b/schema/steps-job-index.sql
@@ -1,4 +1,4 @@
--- ##OSSTEST## 006 Preparatory
+-- ##OSSTEST## 006 Needed
 --
 -- This index helps sg-report-flight find if a test ever passed.
 
diff --git a/sg-report-flight b/sg-report-flight
index b5398573..b8d948da 100755
--- a/sg-report-flight
+++ b/sg-report-flight
@@ -849,10 +849,20 @@ sub justifyfailures ($;$) {
 
     my @failures= values %{ $fi->{Failures} };
 
+    # In psql 9.6 this WITH clause makes postgresql do the steps query
+    # first.  This is good because if this test never passed we can
+    # determine that really quickly using the new index, without
+    # having to scan the flights table.  (If the test passed we will
+    # probably not have to look at many flights to find one, so in
+    # that case this is not much worse.)
     my $anypassq= <<END;
-        SELECT * FROM flights JOIN steps USING (flight)
+        WITH s AS
+        (
+        SELECT * FROM steps
+         WHERE job=? and testid=? and status='pass'
+        )
+        SELECT * FROM flights JOIN s USING (flight)
             WHERE $branches_cond_q
-              AND job=? and testid=? and status='pass'
               AND $blessingscond
             LIMIT 1
 END
-- 
2.20.1


