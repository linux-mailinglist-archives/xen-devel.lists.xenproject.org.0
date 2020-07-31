Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 679FF234583
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 14:13:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1TuJ-0004EJ-C7; Fri, 31 Jul 2020 12:13:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nr0X=BK=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1k1TuH-0004Ac-V0
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 12:13:01 +0000
X-Inumbo-ID: 2c6d87ca-d327-11ea-8e2c-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c6d87ca-d327-11ea-8e2c-bc764e2007e4;
 Fri, 31 Jul 2020 12:12:59 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1k1TN0-0001W4-HO; Fri, 31 Jul 2020 12:38:38 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH v2 28/41] sg-report-host-history: Rerganisation:
 Change loops
Date: Fri, 31 Jul 2020 12:38:07 +0100
Message-Id: <20200731113820.5765-29-ian.jackson@eu.citrix.com>
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

Move the per-host code all into the same per-host loop.  One effect is
to transpose the db_retry and host loops for mainquery.

No functional change.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-host-history | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/sg-report-host-history b/sg-report-host-history
index 3f4670e5..2ca0e235 100755
--- a/sg-report-host-history
+++ b/sg-report-host-history
@@ -470,18 +470,10 @@ db_retry($dbh_tests, [], sub {
     computeflightsrange();
 });
 
-foreach (keys %hosts) {
-    read_existing_logs($_);
-}
-
-db_retry($dbh_tests, [], sub {
-    foreach my $host (sort keys %hosts) {
-	mainquery($host);
-    }
-});
-
 foreach my $host (sort keys %hosts) {
+    read_existing_logs($host);
     db_retry($dbh_tests, [], sub {
+        mainquery($host);
 	reporthost $host;
     });
 }
-- 
2.20.1


