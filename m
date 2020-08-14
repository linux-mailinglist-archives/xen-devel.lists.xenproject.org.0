Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0FD244DA1
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:26:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dTh-0004bo-Up; Fri, 14 Aug 2020 17:26:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dQJ-00024H-0D
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:23:23 +0000
X-Inumbo-ID: 759d6e29-9345-4902-94c8-f563ba73d13a
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 759d6e29-9345-4902-94c8-f563ba73d13a;
 Fri, 14 Aug 2020 17:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425738;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=13kzgnNv/DMd96ulOM4YWyYW/kogwexoOjaZdcpN4WA=;
 b=dKt2aQ8iRZCfWknWLCzg5UHEVwnqiJ4qM7w6Sp8pAawJYdGpQrICPZFo
 TRYkNN547Pmnl936WUvGqzY1bJ9m2+U7ob0Yf4WDovmUoHHKqc4XeWJWp
 XD7cm9E1JROBWIU5AIhO57ppwQOSdmn/5n5gycCZv6yZPocQ+4GsUsCu3 w=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: H79NiA21cInK6e0sIQdd3fn5GZjwVzTGAcsKvJYwZIBjmmzdHsCd//5N88AGM2KIvI1jJq3R3Y
 NCZRWfyzXAg5TTzinxlVcOByTQJJoPbxKesN6t1UegR1C2pm2SMXDkBhPSDRsRQyrc79U06Uu+
 MLNoJmPTyY+26W5ImrojK2gR6xl5RFmQW/gXdFlULgf/bptrn7qrBeIqkosmc6nqyER0j1MUHi
 Fukm/T82xwL4Iqai6OzYih9SmFPEEHK/oShfXP2OsF/Z36rmY8L+0kNaAnmlwzZb9lHewVc9if
 HpM=
X-SBRS: 2.7
X-MesageID: 25487822
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="25487822"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 28/60] parallel by fork: Break out into HistoryReport
Date: Fri, 14 Aug 2020 18:21:33 +0100
Message-ID: <20200814172205.9624-29-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200814172205.9624-1-ian.jackson@eu.citrix.com>
References: <20200814172205.9624-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Move this code from sg-report-host-history to HistoryReport, so that
it can be reused.

No significant functional change.  Some changes to debug messages.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/HistoryReport.pm | 51 ++++++++++++++++++++++++++++++++++++++++++++++++
 sg-report-host-history   | 49 +++++++++-------------------------------------
 2 files changed, 60 insertions(+), 40 deletions(-)

diff --git a/Osstest/HistoryReport.pm b/Osstest/HistoryReport.pm
index 6a23cfba..0b206de4 100644
--- a/Osstest/HistoryReport.pm
+++ b/Osstest/HistoryReport.pm
@@ -19,6 +19,9 @@ package Osstest::HistoryReport;
 use strict;
 use warnings;
 
+use Osstest;
+use Osstest::Executive;
+
 BEGIN {
     use Exporter ();
     our ($VERSION, @ISA, @EXPORT, @EXPORT_OK, %EXPORT_TAGS);
@@ -32,6 +35,7 @@ BEGIN {
 			 cacheable_fn
 			 cache_write_entry
 			 cache_finish
+			 parallel_by_fork
 		    );
     %EXPORT_TAGS = ();
 
@@ -213,4 +217,51 @@ sub cache_finish ($$) {
     print ::DEBUG " extra=$rows_extra\n";
 }
 
+our %children;
+our $worst = 0;
+our $whoami;
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
+	    print STDERR $whoami."[$$]: [$got] failed for $host: $?\n";
+	} else {
+	    print ::DEBUG "REAPED [$got] $host\n";
+	}
+    }
+}
+
+sub parallel_by_fork ($$$$) {
+    my ($set_whoami, $maxjobs, $tasks, $fn) = @_;
+    # does   $fn->($_) foreach @$tasks
+    # but in parallal and then exits.
+    # entries in @$taskarray should be suitable for print in messages.
+    # db is reopened in each child.
+
+    $whoami = $set_whoami;
+    undef $dbh_tests;
+
+    foreach my $task (@$tasks) {
+	wait_for_max_children($maxjobs);
+
+	my $pid = fork // die $!;
+	if (!$pid) {
+	    opendb_tests();
+	    $fn->($task);
+	    exit 0;
+	}
+	print ::DEBUG "SPAWNED [$pid] $task\n";
+	$children{$pid} = $task;
+    }
+
+    wait_for_max_children(0);
+    exit $worst;
+}
+
 1;
diff --git a/sg-report-host-history b/sg-report-host-history
index 6bf14aa2..0a2e9904 100755
--- a/sg-report-host-history
+++ b/sg-report-host-history
@@ -377,43 +377,12 @@ db_retry($dbh_tests, [], sub {
     computeflightsrange();
 });
 
-undef $dbh_tests;
-
-our %children;
-our $worst = 0;
-
-sub wait_for_max_children ($) {
-    my ($lim) = @_;
-    while (keys(%children) > $lim) {
-	$!=0; $?=0; my $got = wait;
-	die "$! $got $?" unless exists $children{$got};
-	my $host = $children{$got};
-	delete $children{$got};
-	$worst = $? if $? > $worst;
-	if ($?) {
-	    print STDERR "sg-report-flight[: [$got] failed for $host: $?\n";
-	} else {
-	    print DEBUG "REAPED [$got] $host\n";
-	}
-    }
-}
-
-foreach my $host (sort keys %hosts) {
-    wait_for_max_children($maxjobs);
-
-    my $pid = fork // die $!;
-    if (!$pid) {
-	opendb_tests();
-	cache_read_previous("$htmlout/$host.html") if $read_previous;
-	db_retry($dbh_tests, [], sub {
-            mainquery($host);
-	    reporthost $host;
-	});
-	exit(0);
-    }
-    print DEBUG "SPAWNED [$pid] $host\n";
-    $children{$pid} = $host;
-}
-
-wait_for_max_children(0);
-exit $worst;
+parallel_by_fork('sg-report-flight', $maxjobs, [ sort keys %hosts ], sub {
+    my ($host) = @_;
+    cache_read_previous("$htmlout/$host.html") if $read_previous;
+    db_retry($dbh_tests, [], sub {
+        mainquery($host);
+	reporthost $host;
+    });
+    exit(0);
+});
-- 
2.11.0


