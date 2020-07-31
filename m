Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4539B234514
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 14:02:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1Tjt-00027b-87; Fri, 31 Jul 2020 12:02:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nr0X=BK=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1k1Tjr-00026u-HR
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 12:02:15 +0000
X-Inumbo-ID: ac328bec-d325-11ea-8e2b-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ac328bec-d325-11ea-8e2b-bc764e2007e4;
 Fri, 31 Jul 2020 12:02:14 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1k1TN2-0001W4-LZ; Fri, 31 Jul 2020 12:38:40 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH v2 33/41] cs-bisection-step: Generalise
 qtxt_common_rev_ok
Date: Fri, 31 Jul 2020 12:38:12 +0100
Message-Id: <20200731113820.5765-34-ian.jackson@eu.citrix.com>
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

* Make it into a subref which takes a $table argument.
* Change the two references into function calls using the @{...} syntax
* Move the definition earlier in the file

No change to the generated query.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
v2: New patch.
---
 cs-bisection-step | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/cs-bisection-step b/cs-bisection-step
index 9a0fee39..5d4e179e 100755
--- a/cs-bisection-step
+++ b/cs-bisection-step
@@ -182,6 +182,14 @@ END
 sub flight_rmap ($$) {
     my ($flight, $need_urls) = @_;
 
+    my $qtxt_common_rev_ok = sub {
+	my ($table) = @_;
+	[<<END];
+                 ($table.name LIKE E'built\\_revision\\_%' OR
+                  $table.name LIKE E'revision\\_%')
+END
+    };
+
     $dbh_tests->do(<<END, {});
           CREATE TEMP TABLE tmp_build_info (
               use varchar NOT NULL,
@@ -236,10 +244,6 @@ END
     my $qtxt_common_tables = <<END;
 	    FROM tmp_build_info AS rev
 END
-    my $qtxt_common_rev_condition = <<END;
-                 (rev.name LIKE E'built\\_revision\\_%' OR
-                  rev.name LIKE E'revision\\_%')
-END
 
     my $sth= db_prepare(!$need_urls ? <<END_NOURLS : <<END_URLS);
         SELECT
@@ -249,7 +253,7 @@ $qtxt_common_results
 $qtxt_common_tables
 
            WHERE
-$qtxt_common_rev_condition
+@{ $qtxt_common_rev_ok->('rev') }
 
 	   ORDER by rev.name;
 
@@ -262,7 +266,7 @@ $qtxt_common_tables
       CROSS JOIN tmp_build_info AS url
 
            WHERE
-$qtxt_common_rev_condition
+@{ $qtxt_common_rev_ok->('rev') }
   	     AND  url.name LIKE E'tree\\_%'
 	     AND  url.use = rev.use
 	     AND  url.job = rev.job
-- 
2.20.1


