Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B7D1D3292
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 16:20:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZEiP-0007QT-Jh; Thu, 14 May 2020 14:20:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f2eD=64=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jZEiO-0007QM-Jy
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 14:20:00 +0000
X-Inumbo-ID: fbb2d6ce-95ed-11ea-9887-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::3])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fbb2d6ce-95ed-11ea-9887-bc764e2007e4;
 Thu, 14 May 2020 14:19:55 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jZEiI-0004pf-Ma; Thu, 14 May 2020 15:19:54 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 1/4] Executive: Do not print "shared ... marked ready"
 when not shared
Date: Thu, 14 May 2020 15:19:48 +0100
Message-Id: <20200514141951.29371-2-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200514141951.29371-1-ian.jackson@eu.citrix.com>
References: <20200514141951.29371-1-ian.jackson@eu.citrix.com>
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

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/Executive.pm | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Osstest/Executive.pm b/Osstest/Executive.pm
index e741f529..c3dc1261 100644
--- a/Osstest/Executive.pm
+++ b/Osstest/Executive.pm
@@ -1017,11 +1017,12 @@ sub executive_resource_shared_mark_ready ($$$) {
     my ($restype, $resname, $sharetype) = @_;
     # must run outside transaction
 
+    my $oldshr;
     my $what= "resource $restype $resname";
     $sharetype .= ' '.get_harness_rev();
 
     db_retry($dbh_tests, [qw(resources)], sub {
-        my $oldshr= resource_check_allocated_core($restype, $resname);
+        $oldshr= resource_check_allocated_core($restype, $resname);
         if (defined $oldshr) {
             die "$what shared $oldshr->{Type} not $sharetype"
                 unless $oldshr->{Type} eq $sharetype;
@@ -1053,7 +1054,11 @@ END
     }) {
        logm("post-mark-ready queue daemon prod failed: $@");
     }
-    logm("$restype $resname shared $sharetype marked ready");
+    if ($oldshr) {
+	logm("$restype $resname shared $sharetype marked ready");
+    } else {
+	logm("$restype $resname (not shared, $sharetype) is ready");
+    }
 }
 
 # hostalloc_maxwait_starvation
-- 
2.20.1


