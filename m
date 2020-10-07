Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D001D286707
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:28:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3710.11085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQEAR-00046h-8u; Wed, 07 Oct 2020 18:27:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3710.11085; Wed, 07 Oct 2020 18:27:59 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQEAQ-00041g-2E; Wed, 07 Oct 2020 18:27:58 +0000
Received: by outflank-mailman (input) for mailman id 3710;
 Wed, 07 Oct 2020 18:27:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE5f-00072Q-Ol
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:23:03 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2d13658e-fba9-4421-9b68-f8e723a3e629;
 Wed, 07 Oct 2020 18:21:16 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDjz-0007CF-GO; Wed, 07 Oct 2020 19:00:39 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE5f-00072Q-Ol
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:23:03 +0000
X-Inumbo-ID: 2d13658e-fba9-4421-9b68-f8e723a3e629
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 2d13658e-fba9-4421-9b68-f8e723a3e629;
	Wed, 07 Oct 2020 18:21:16 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDjz-0007CF-GO; Wed, 07 Oct 2020 19:00:39 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
	Ian Jackson <Ian.Jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 25/82] host allocation: *_shared_mark_ready: Make $sharetype check optional
Date: Wed,  7 Oct 2020 18:59:27 +0100
Message-Id: <20201007180024.7932-26-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

We are going to want to be able to set shares to other than ready,
without double-checking the sharetype.

The change to the UPDATE statement makes no difference because
resource_check_allocated_core has just got that sharetype out of the
db.  (This does remove one safety check against bugs, sadly.)

No functional change for existing callers.

Signed-off-by: Ian Jackson <Ian.Jackson@eu.citrix.com>
---
 Osstest/Executive.pm | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/Osstest/Executive.pm b/Osstest/Executive.pm
index f0038f6b..fd975590 100644
--- a/Osstest/Executive.pm
+++ b/Osstest/Executive.pm
@@ -1059,21 +1059,25 @@ sub executive_resource_shared_mark_ready ($$$;$$) {
     $newstate //= 'ready';
 
     my $what= "resource $restype $resname";
-    $sharetype .= ' '.get_harness_rev();
+    if (defined $sharetype) {
+	$sharetype .= ' '.get_harness_rev();
+    } else {
+	die if $newstate eq 'ready';
+    }
 
     db_retry($dbh_tests, [qw(resources)], sub {
         $oldshr= resource_check_allocated_core($restype, $resname);
         if (defined $oldshr) {
             die "$what shared $oldshr->{Type} not $sharetype"
-                unless $oldshr->{Type} eq $sharetype;
+                unless !defined $sharetype or $oldshr->{Type} eq $sharetype;
             die "$what shared state $oldshr->{State} not $oldstate"
                 unless $oldshr->{State} eq $oldstate;
-            my $nrows= $dbh_tests->do(<<END,{}, $newstate, $restype,$resname,$sharetype);
+            my $nrows= $dbh_tests->do(<<END,{}, $newstate, $restype,$resname);
                 UPDATE resource_sharing
                    SET state=?
-                 WHERE restype=? AND resname=? AND sharetype=?
+                 WHERE restype=? AND resname=?
 END
-            die "unexpected not updated state $what $sharetype $nrows"
+            die "unexpected not updated state $what $nrows"
                 unless $nrows==1;
 
             $dbh_tests->do(<<END,{}, $oldshr->{ResType}, $resname);
-- 
2.20.1


