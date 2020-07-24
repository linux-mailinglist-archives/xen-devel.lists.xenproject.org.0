Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0E722CBFF
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 19:22:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jz1PJ-0005q3-Cn; Fri, 24 Jul 2020 17:22:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ulAu=BD=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jz1PI-0005eH-15
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 17:22:52 +0000
X-Inumbo-ID: 3b8d8496-cdd2-11ea-8862-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b8d8496-cdd2-11ea-8862-bc764e2007e4;
 Fri, 24 Jul 2020 17:22:22 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jz1On-00021j-Ot; Fri, 24 Jul 2020 18:22:21 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 06/11] sg-report-host-history: Do the main query per
 host
Date: Fri, 24 Jul 2020 18:22:11 +0100
Message-Id: <20200724172216.28204-7-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200724172216.28204-1-ian.jackson@eu.citrix.com>
References: <20200724172216.28204-1-ian.jackson@eu.citrix.com>
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

In f6001d628c3b3fd42b10cd15351981a04bc02572 we combined these
queries into one:
  sg-report-host-history: Aggregate runvars query for all hosts

Now that we have an index, there is a faster way for the db to do this
query: via that index.  But it doesn't like to do that if be aggregate
the queries.  Experimentally, doing this query separately once per
host is significantly faster.

Also, later, it will allow us to parallelise this work.

So, we undo that.  (Not by reverting, though.)

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 schema/runvars-host-index.sql |  2 +-
 sg-report-host-history        | 27 +++++++++------------------
 2 files changed, 10 insertions(+), 19 deletions(-)

diff --git a/schema/runvars-host-index.sql b/schema/runvars-host-index.sql
index fec0b960..cd6a1f9e 100644
--- a/schema/runvars-host-index.sql
+++ b/schema/runvars-host-index.sql
@@ -1,4 +1,4 @@
--- ##OSSTEST## 009 Preparatory
+-- ##OSSTEST## 009 Needed
 --
 -- This index helps sg-report-host-history find relevant flights.
 
diff --git a/sg-report-host-history b/sg-report-host-history
index 25a0c847..ab88828e 100755
--- a/sg-report-host-history
+++ b/sg-report-host-history
@@ -165,34 +165,25 @@ sub jobquery ($$$) {
 our %hosts;
 
 sub mainquery () {
-    our $valcond = join " OR ", map { "val = ?" } keys %hosts;
-    our @params = keys %hosts;
-
     our $runvarq //= db_prepare(<<END);
-	SELECT flight, job, name, val, status
+	SELECT flight, job, name, status
 	  FROM runvars
           JOIN jobs USING (flight, job)
-	 WHERE $namecond
-	   AND ($valcond)
+	 WHERE (name = 'host' OR name LIKE '%_host')
+	   AND val = ?
 	   AND $flightcond
            AND $restrictflight_cond
            AND flight > ?
 	 ORDER BY flight DESC
-	 LIMIT ($limit * 3 + 100) * ?
+         LIMIT $limit * 2
 END
+    foreach my $host (sort keys %hosts) {
+	print DEBUG "MAINQUERY $host...\n";
+	$runvarq->execute($host, $minflight);
 
-    push @params, $minflight;
-    push @params, scalar keys %hosts;
-
-    print DEBUG "MAINQUERY...\n";
-    $runvarq->execute(@params);
-
-    print DEBUG "FIRST PASS\n";
-    while (my $jr= $runvarq->fetchrow_hashref()) {
-	print DEBUG " $jr->{flight}.$jr->{job} ";
-	push @{ $hosts{$jr->{val}} }, $jr;
+	$hosts{$host} = $runvarq->fetchall_arrayref({});
+	print DEBUG "MAINQUERY $host got ".(scalar @{ $hosts{$host} })."\n";
     }
-    print DEBUG "\n";
 }
 
 sub reporthost ($) {
-- 
2.20.1


