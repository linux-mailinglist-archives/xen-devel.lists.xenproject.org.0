Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A23E62344DE
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 13:56:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1Tdn-0008RS-7U; Fri, 31 Jul 2020 11:55:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nr0X=BK=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1k1Tdl-0008RD-O1
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 11:55:57 +0000
X-Inumbo-ID: caff2b44-d324-11ea-8e29-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id caff2b44-d324-11ea-8e29-bc764e2007e4;
 Fri, 31 Jul 2020 11:55:57 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1k1TN1-0001W4-JE; Fri, 31 Jul 2020 12:38:39 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH v2 30/41] sg-report-host-history: Fork
Date: Fri, 31 Jul 2020 12:38:09 +0100
Message-Id: <20200731113820.5765-31-ian.jackson@eu.citrix.com>
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

Run each host's report in a separate child.  This is considerably
faster.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-host-history | 47 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 40 insertions(+), 7 deletions(-)

diff --git a/sg-report-host-history b/sg-report-host-history
index f4352fc3..dc694ebe 100755
--- a/sg-report-host-history
+++ b/sg-report-host-history
@@ -34,6 +34,7 @@ our $flightlimit;
 our $htmlout = ".";
 our $read_existing=1;
 our $doinstall=1;
+our $maxjobs=10;
 our @blessings;
 
 open DEBUG, ">/dev/null";
@@ -44,7 +45,7 @@ csreadconfig();
 while (@ARGV && $ARGV[0] =~ m/^-/) {
     $_= shift @ARGV;
     last if m/^--?$/;
-    if (m/^--(limit)\=([1-9]\d*)$/) {
+    if (m/^--(limit|maxjobs)\=([1-9]\d*)$/) {
         $$1= $2;
     } elsif (m/^--time-limit\=([1-9]\d*)$/) {
         $timelimit= $1;
@@ -469,12 +470,44 @@ db_retry($dbh_tests, [], sub {
     computeflightsrange();
 });
 
+undef $dbh_tests;
+
+our %children;
+our $worst = 0;
+
+sub wait_for_max_children ($) {
+    my ($lim) = @_;
+    while (keys(%children) > $lim) {
+	$!=0; $?=0; my $got = wait;
+	die "$! $got $?" unless exists $children{$got};
+	my $host = $children{$got};
+	delete $children{$got};
+	$worst = $? if $? > $worst;
+	if ($?) {
+	    print STDERR "sg-report-flight[: [$got] failed for $host: $?\n";
+	} else {
+	    print DEBUG "REAPED [$got] $host\n";
+	}
+    }
+}
+
 foreach my $host (sort keys %hosts) {
-    read_existing_logs($host);
-    db_retry($dbh_tests, [], sub {
-        mainquery($host);
-	reporthost $host;
-    });
+    wait_for_max_children($maxjobs);
+
+    my $pid = fork // die $!;
+    if (!$pid) {
+	opendb_tests();
+	read_existing_logs($host);
+	db_retry($dbh_tests, [], sub {
+            mainquery($host);
+	    reporthost $host;
+	});
+	print DEBUG "JQ CACHE ".($jqtotal-$jqcachemisses)." / $jqtotal\n";
+	exit(0);
+    }
+    print DEBUG "SPAWNED [$pid] $host\n";
+    $children{$pid} = $host;
 }
 
-print DEBUG "JQ CACHE ".($jqtotal-$jqcachemisses)." / $jqtotal\n";
+wait_for_max_children(0);
+exit $worst;
-- 
2.20.1


