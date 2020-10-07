Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A460286704
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:27:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3706.11050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQEAJ-0003jE-Aj; Wed, 07 Oct 2020 18:27:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3706.11050; Wed, 07 Oct 2020 18:27:51 +0000
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
	id 1kQEAI-0003gt-Jk; Wed, 07 Oct 2020 18:27:50 +0000
Received: by outflank-mailman (input) for mailman id 3706;
 Wed, 07 Oct 2020 18:27:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE35-00072Q-Ii
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:20:23 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 754cadb0-7421-45fd-92c0-5f4f9ff11a16;
 Wed, 07 Oct 2020 18:19:39 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDjz-0007CF-Ty; Wed, 07 Oct 2020 19:00:40 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE35-00072Q-Ii
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:20:23 +0000
X-Inumbo-ID: 754cadb0-7421-45fd-92c0-5f4f9ff11a16
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 754cadb0-7421-45fd-92c0-5f4f9ff11a16;
	Wed, 07 Oct 2020 18:19:39 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDjz-0007CF-Ty; Wed, 07 Oct 2020 19:00:40 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
	Ian Jackson <Ian.Jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 27/82] host allocation: *_shared_mark_ready: allow alternative $oldtypes
Date: Wed,  7 Oct 2020 18:59:29 +0100
Message-Id: <20201007180024.7932-28-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

$oldtype may now be a hashref, where keys mapping to truthy values are
permitted for the sharetype precondition.

No functional change for existing callers.

Signed-off-by: Ian Jackson <Ian.Jackson@eu.citrix.com>
---
 Osstest/Executive.pm | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Osstest/Executive.pm b/Osstest/Executive.pm
index fd975590..f2d43464 100644
--- a/Osstest/Executive.pm
+++ b/Osstest/Executive.pm
@@ -1056,6 +1056,7 @@ sub executive_resource_shared_mark_ready ($$$;$$) {
 
     my $oldshr;
     $oldstate //= 'prep';
+    $oldstate = { $oldstate => 1 } unless ref $oldstate;
     $newstate //= 'ready';
 
     my $what= "resource $restype $resname";
@@ -1070,8 +1071,9 @@ sub executive_resource_shared_mark_ready ($$$;$$) {
         if (defined $oldshr) {
             die "$what shared $oldshr->{Type} not $sharetype"
                 unless !defined $sharetype or $oldshr->{Type} eq $sharetype;
-            die "$what shared state $oldshr->{State} not $oldstate"
-                unless $oldshr->{State} eq $oldstate;
+            die "$what shared state $oldshr->{State} not".
+		" one of ".(join ' ', sort keys %$oldstate)
+                unless $oldstate->{ $oldshr->{State} };
             my $nrows= $dbh_tests->do(<<END,{}, $newstate, $restype,$resname);
                 UPDATE resource_sharing
                    SET state=?
-- 
2.20.1


