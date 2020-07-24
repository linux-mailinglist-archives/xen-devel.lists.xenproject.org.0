Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A821522CC08
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 19:23:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jz1PO-0005sY-M0; Fri, 24 Jul 2020 17:22:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ulAu=BD=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jz1PN-0005eH-12
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 17:22:57 +0000
X-Inumbo-ID: 3c428380-cdd2-11ea-8862-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c428380-cdd2-11ea-8862-bc764e2007e4;
 Fri, 24 Jul 2020 17:22:23 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jz1Oo-00021j-1H; Fri, 24 Jul 2020 18:22:22 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 07/11] sg-report-host-history: Rerganisation: Make
 mainquery per-host
Date: Fri, 24 Jul 2020 18:22:12 +0100
Message-Id: <20200724172216.28204-8-ian.jackson@eu.citrix.com>
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

This moves the loop over hosts into the main program.  We are working
our way to a new code structure.

No functional change.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-host-history | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/sg-report-host-history b/sg-report-host-history
index ab88828e..509d053d 100755
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
@@ -473,7 +474,9 @@ db_retry($dbh_tests, [], sub {
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


