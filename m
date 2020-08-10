Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4DA240530
	for <lists+xen-devel@lfdr.de>; Mon, 10 Aug 2020 13:21:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k55rb-0008H3-6X; Mon, 10 Aug 2020 11:21:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W5wo=BU=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1k55rZ-0008Fj-Ux
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2020 11:21:09 +0000
X-Inumbo-ID: 5e45584a-3d19-4d05-a336-5bdc192aae41
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5e45584a-3d19-4d05-a336-5bdc192aae41;
 Mon, 10 Aug 2020 11:20:54 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1k55rJ-0003aJ-QP; Mon, 10 Aug 2020 12:20:53 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 4/6] timing traces: sg-check-tested: Add prints of
 (show_abs_time time)
Date: Mon, 10 Aug 2020 12:20:45 +0100
Message-Id: <20200810112047.30285-4-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200810112047.30285-1-ian.jackson@eu.citrix.com>
References: <20200810112047.30285-1-ian.jackson@eu.citrix.com>
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

More tools to see where it is faffing too much.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-check-tested | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sg-check-tested b/sg-check-tested
index 7946e4b5..39c0d0c2 100755
--- a/sg-check-tested
+++ b/sg-check-tested
@@ -148,7 +148,7 @@ sub prepare_execute ($@) {
     my ($qtxt, @vars) = @_;
     print DEBUG "\n==========\n", $qtxt,
                 "\n----------\n", (join ' | ', @vars),
-                "\n==========\n";
+                "\n========== ".(show_abs_time time)."\n";
     my $q= $dbh_tests->prepare($qtxt);
     $q->execute(@vars);
     return $q;
@@ -169,7 +169,7 @@ sub search () {
     while (my $row= $q->fetchrow_hashref()) {
 	my $flight= $row->{flight};
 	if (!defined $prrev) {
-	    print DEBUG "==========YES\n";
+	    print DEBUG "========== ".(show_abs_time time)." YES\n";
 	    output $flight,"\n";
 	    return;
 	} else {
@@ -195,7 +195,7 @@ END
 	    my $row1= $valsq->fetchrow_hashref();
 	    next unless defined $row1->{val} && length $row1->{val};
 	    my $val1 = massage($row1->{val});
-	    print DEBUG "got $val1\n";
+	    print DEBUG (show_abs_time time)." got $val1\n";
 	    while (my $row2 = $valsq->fetchrow_hashref()) {
 		my $val2 = massage($row2->{val});
 		next if $val2 eq $val1;
@@ -212,7 +212,7 @@ END
 	    return;
 	}
     }
-    print DEBUG "==========NO\n";
+    print DEBUG "========== ".(show_abs_time time)." NO\n";
 }
 
 db_retry($dbh_tests, [], sub {
-- 
2.20.1


