Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 508101EA42B
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 14:45:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfjo1-0002dy-OI; Mon, 01 Jun 2020 12:44:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Um2E=7O=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jfjo1-0002dr-51
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 12:44:41 +0000
X-Inumbo-ID: a5ccaf0c-a405-11ea-9947-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a5ccaf0c-a405-11ea-9947-bc764e2007e4;
 Mon, 01 Jun 2020 12:44:35 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jfjnu-0006zf-Qv; Mon, 01 Jun 2020 13:44:34 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 2/4] cs-bisection-step: flight_rmap Disassemble the
 revisions query
Date: Mon,  1 Jun 2020 13:44:28 +0100
Message-Id: <20200601124430.29761-2-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200601124430.29761-1-ian.jackson@eu.citrix.com>
References: <20200601124430.29761-1-ian.jackson@eu.citrix.com>
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

Break out various pieces that we are going to need to reuse for the
other version of this query (which won't have the url join).

Also, rather than retrieving the `tree_<tree>' runvar and calculating
the tree name from that, use the `[built_]revision_<tree>' runvar from
rev.

No overall functional change.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 cs-bisection-step | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/cs-bisection-step b/cs-bisection-step
index f9ef1558..b36bac05 100755
--- a/cs-bisection-step
+++ b/cs-bisection-step
@@ -227,19 +227,30 @@ END
 	       AND flight = ?
 END
 
-    my $sth= db_prepare(<<END);
-
-        SELECT url.val AS uval,
+    my $qtxt_common_results = <<END;
+               rev.name AS revname,
 	       rev.val AS rval,
 	       rev.job AS job,
       ${\ other_revision_job_suffix('rev.job','rev.use',' ') } AS othrev,
-	       url.name AS longname
-
+END
+    my $qtxt_common_tables = <<END;
 	    FROM tmp_build_info AS rev
+END
+    my $qtxt_common_rev_condition = <<END;
+                 (rev.name LIKE E'built\\_revision\\_%' OR
+                  rev.name LIKE E'revision\\_%')
+END
+
+    my $sth= db_prepare(<<END);
+        SELECT
+$qtxt_common_results
+	       url.val AS uval
+
+$qtxt_common_tables
       CROSS JOIN tmp_build_info AS url
 
-           WHERE (rev.name LIKE E'built\\_revision\\_%' OR
-                  rev.name LIKE E'revision\\_%')
+           WHERE
+$qtxt_common_rev_condition
   	     AND  url.name LIKE E'tree\\_%'
 	     AND  url.use = rev.use
 	     AND  url.job = rev.job
@@ -247,7 +258,6 @@ END
                   rev.name = 'revision_'       || substr(url.name,6))
 
 	   ORDER by url.val;
-	  
 END
     $sth->execute();
     my $row;
@@ -255,7 +265,7 @@ END
     my (@ttreenames, @ttreeurls, @trevisions);
     while ($row= $sth->fetchrow_hashref()) {
         next if $row->{othrev} eq 'DISCARD';
-        $row->{longname} =~ m/^tree_/ or die "$row->{longname} ?";
+        $row->{revname} =~ m/^(?:built_)?revision_/ or die "$row->{revname} ?";
         my $name= $'; #'
         print DEBUG " $flight.$row->{job} uval=$row->{uval}".
             " rval=$row->{rval} name=$name othrev=\`$row->{othrev}'\n";
-- 
2.20.1


