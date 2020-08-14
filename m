Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB8D244D95
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:26:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dTN-00040C-H9; Fri, 14 Aug 2020 17:26:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dQi-00024H-0y
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:23:48 +0000
X-Inumbo-ID: e8fe2ef3-73ed-437b-9f28-16e53105f8cb
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e8fe2ef3-73ed-437b-9f28-16e53105f8cb;
 Fri, 14 Aug 2020 17:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425739;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=TQcIqqhFJdYsJk5BMaUT3ykNr/SrI/Z/YpnxsNoFOD0=;
 b=S5h7qEMS3QNYtw2m1bVexcC1+gi5OVUziYT27jMXipVgVOUnO4d2wsSx
 fhbMzrTegSizWhGefOi5F7/QY70FVpJyxmdNR978KksIJRSaKo1WUfZnc
 KNw14moBN0yQTy79WeXy6EHKwYtGdOsagUIuWqavtP4NdQDiiCQp2iqm0 E=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 13x5v+jN+N7cZeeL23w1/uVLruEaZDX2PvS1Bv/h4AYAyeBpFf/B+gq+xqzeB+qDtYrCXfVFnu
 gZfj7GBZIxapXcfPpRr0ZGlc/ceqdBEpRfm7+IocuNWp2+oKr8vQBhjqlTzTEA9+yR7YxyQBQb
 hFXTy4rrQ9503CK45bPzBhXP6Wka4F5ACTVtX9AD908rcXyd76lo6yGLC2oseULiDew0OAqZiK
 PO/QFex9tA7sQ9yc0CSD69keBbH+ZVMJQO6AgNrq3bvIcOZw+EIEpHEjcoWLo043AN2AHTc5yy
 3j0=
X-SBRS: 2.7
X-MesageID: 24725187
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24725187"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 35/60] sg-report-job-history (nfc): Have main program
 decide HTML filename
Date: Fri, 14 Aug 2020 18:21:40 +0100
Message-ID: <20200814172205.9624-36-ian.jackson@eu.citrix.com>
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

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-job-history | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sg-report-job-history b/sg-report-job-history
index 3307b281..3f10a74c 100755
--- a/sg-report-job-history
+++ b/sg-report-job-history
@@ -109,8 +109,8 @@ END
     }
 }
 
-sub processjobbranch ($$) {
-    my ($j,$bra) = @_;
+sub processjobbranch ($$$) {
+    my ($j,$bra,$html_file) = @_;
 
     my $buildsq= db_prepare(<<END);
         SELECT * FROM runvars
@@ -210,15 +210,13 @@ END
 END
 
     if (defined $htmlout) {
-        my ($title,$html_file,$url);
+        my ($title,$url);
 	ensuredir "$htmlout/history";
 	ensuredir "$htmlout/history/$j";
         if (defined $bra) {
             $title= "$j (branch $bra)";
-            $html_file= "history/$j/$bra.html";
         } else {
             $title= "$j (all branches)";
-            $html_file= "history/$j/ALL.html";
         }
         $html_file= "$htmlout/$html_file";
         open H, "> $html_file.new" or die "$html_file $!";
@@ -305,7 +303,8 @@ foreach my $j (@jobs) {
 parallel_by_fork('sg-report-job-history', $maxjobs, \@tasks, sub {
     my ($task) = @_;
     my ($job, $branch) = split / /, $task; # $branch might be undef
+    my $html_file = sprintf "history/%s/%s.html", $job, ($branch // 'ALL');
     db_retry($dbh_tests, [], sub {
-        processjobbranch($job, $branch);
+        processjobbranch($job, $branch, $html_file);
     });
 });
-- 
2.11.0


