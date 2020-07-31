Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF8B234515
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 14:02:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1Tjv-00029K-GN; Fri, 31 Jul 2020 12:02:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nr0X=BK=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1k1Tju-00026u-4q
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 12:02:18 +0000
X-Inumbo-ID: ad15deb1-d325-11ea-8e2b-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ad15deb1-d325-11ea-8e2b-bc764e2007e4;
 Fri, 31 Jul 2020 12:02:16 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1k1TMz-0001W4-QA; Fri, 31 Jul 2020 12:38:37 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH v2 26/41] sg-report-host-history: Rerganisation: Make
 mainquery per-host
Date: Fri, 31 Jul 2020 12:38:05 +0100
Message-Id: <20200731113820.5765-27-ian.jackson@eu.citrix.com>
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

This moves the loop over hosts into the main program.  We are working
our way to a new code structure.

No functional change.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-host-history | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/sg-report-host-history b/sg-report-host-history
index 15866ab6..34216aa2 100755
--- a/sg-report-host-history
+++ b/sg-report-host-history
@@ -164,7 +164,9 @@ sub jobquery ($$$) {
 
 our %hosts;
 
-sub mainquery () {
+sub mainquery ($) {
+    my ($host) = @_;
+
     our $runvarq //= db_prepare(<<END);
 	SELECT flight, job, name, status
 	  FROM runvars
@@ -177,13 +179,12 @@ sub mainquery () {
 	 ORDER BY flight DESC
          LIMIT $limit * 2
 END
-    foreach my $host (sort keys %hosts) {
-	print DEBUG "MAINQUERY $host...\n";
-	$runvarq->execute($host, $minflight);
 
-	$hosts{$host} = $runvarq->fetchall_arrayref({});
-	print DEBUG "MAINQUERY $host got ".(scalar @{ $hosts{$host} })."\n";
-    }
+    print DEBUG "MAINQUERY $host...\n";
+    $runvarq->execute($host, $minflight);
+
+    $hosts{$host} = $runvarq->fetchall_arrayref({});
+    print DEBUG "MAINQUERY $host got ".(scalar @{ $hosts{$host} })."\n";
 }
 
 sub reporthost ($) {
@@ -474,7 +475,9 @@ db_retry($dbh_tests, [], sub {
 });
 
 db_retry($dbh_tests, [], sub {
-    mainquery();
+    foreach my $host (sort keys %hosts) {
+	mainquery($host);
+    }
 });
 
 foreach my $host (sort keys %hosts) {
-- 
2.20.1


