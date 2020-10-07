Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A2B2866FD
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:27:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3700.10974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQEA4-000308-Ix; Wed, 07 Oct 2020 18:27:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3700.10974; Wed, 07 Oct 2020 18:27:36 +0000
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
	id 1kQEA3-0002t9-C9; Wed, 07 Oct 2020 18:27:35 +0000
Received: by outflank-mailman (input) for mailman id 3700;
 Wed, 07 Oct 2020 18:27:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE3o-00072Q-Jr
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:21:08 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 32357582-01ed-4322-ad57-48dd5f33319b;
 Wed, 07 Oct 2020 18:19:57 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDjz-0007CF-9Z; Wed, 07 Oct 2020 19:00:39 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE3o-00072Q-Jr
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:21:08 +0000
X-Inumbo-ID: 32357582-01ed-4322-ad57-48dd5f33319b
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 32357582-01ed-4322-ad57-48dd5f33319b;
	Wed, 07 Oct 2020 18:19:57 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDjz-0007CF-9Z; Wed, 07 Oct 2020 19:00:39 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
	Ian Jackson <Ian.Jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 24/82] host allocation: *_shared_mark_ready: Allow other states
Date: Wed,  7 Oct 2020 18:59:26 +0100
Message-Id: <20201007180024.7932-25-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

Generalise these functions so they can set the state to something
other than `ready', and so that they can expect a state other than
`prep'.

No functional change with existing callers.

Signed-off-by: Ian Jackson <Ian.Jackson@eu.citrix.com>
---
 Osstest/Executive.pm       | 19 +++++++++++--------
 Osstest/JobDB/Executive.pm |  5 +++--
 Osstest/TestSupport.pm     |  6 +++---
 3 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/Osstest/Executive.pm b/Osstest/Executive.pm
index 703f3d85..f0038f6b 100644
--- a/Osstest/Executive.pm
+++ b/Osstest/Executive.pm
@@ -1050,11 +1050,14 @@ END
     return $shared;
 }
 
-sub executive_resource_shared_mark_ready ($$$) {
-    my ($restype, $resname, $sharetype) = @_;
+sub executive_resource_shared_mark_ready ($$$;$$) {
+    my ($restype, $resname, $sharetype, $oldstate, $newstate) = @_;
     # must run outside transaction
 
     my $oldshr;
+    $oldstate //= 'prep';
+    $newstate //= 'ready';
+
     my $what= "resource $restype $resname";
     $sharetype .= ' '.get_harness_rev();
 
@@ -1063,11 +1066,11 @@ sub executive_resource_shared_mark_ready ($$$) {
         if (defined $oldshr) {
             die "$what shared $oldshr->{Type} not $sharetype"
                 unless $oldshr->{Type} eq $sharetype;
-            die "$what shared state $oldshr->{State} not prep"
-                unless $oldshr->{State} eq 'prep';
-            my $nrows= $dbh_tests->do(<<END,{}, $restype,$resname,$sharetype);
+            die "$what shared state $oldshr->{State} not $oldstate"
+                unless $oldshr->{State} eq $oldstate;
+            my $nrows= $dbh_tests->do(<<END,{}, $newstate, $restype,$resname,$sharetype);
                 UPDATE resource_sharing
-                   SET state='ready'
+                   SET state=?
                  WHERE restype=? AND resname=? AND sharetype=?
 END
             die "unexpected not updated state $what $sharetype $nrows"
@@ -1092,9 +1095,9 @@ END
        logm("post-mark-ready queue daemon prod failed: $@");
     }
     if ($oldshr) {
-	logm("$restype $resname shared $sharetype marked ready");
+	logm("$restype $resname shared $sharetype marked $newstate");
     } else {
-	logm("$restype $resname (not shared, $sharetype) is ready");
+	logm("$restype $resname (not shared, $sharetype) is $newstate");
     }
 }
 
diff --git a/Osstest/JobDB/Executive.pm b/Osstest/JobDB/Executive.pm
index 39deb8a2..30629572 100644
--- a/Osstest/JobDB/Executive.pm
+++ b/Osstest/JobDB/Executive.pm
@@ -352,8 +352,9 @@ sub gen_ether_offset ($$) { #method
 }
 
 sub jobdb_resource_shared_mark_ready { #method
-    my ($mo, $restype, $resname, $sharetype) = @_;
-    executive_resource_shared_mark_ready($restype, $resname, $sharetype);
+    my ($mo, $restype, $resname, $sharetype, $oldstate, $newstate) = @_;
+    executive_resource_shared_mark_ready
+	($restype, $resname, $sharetype, $oldstate,$newstate);
 }
 
 sub jobdb_check_other_job { #method
diff --git a/Osstest/TestSupport.pm b/Osstest/TestSupport.pm
index 99c7654d..7292a329 100644
--- a/Osstest/TestSupport.pm
+++ b/Osstest/TestSupport.pm
@@ -3106,11 +3106,11 @@ sub sha256file ($;$) {
     return $truncate ? substr($digest, 0, $truncate) : $digest;
 }
 
-sub host_shared_mark_ready($$) {
-    my ($ho,$sharetype) = @_;
+sub host_shared_mark_ready($$;$$) {
+    my ($ho,$sharetype, $oldstate, $newstate) = @_;
 
     $mjobdb->jobdb_resource_shared_mark_ready('host', $ho->{Name},
-                                              $sharetype);
+        $sharetype, $oldstate, $newstate);
 }
 
 sub gitcache_setup ($) {
-- 
2.20.1


