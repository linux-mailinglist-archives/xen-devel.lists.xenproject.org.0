Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1EF2866E5
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:27:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3678.10715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQE9M-00010x-Ox; Wed, 07 Oct 2020 18:26:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3678.10715; Wed, 07 Oct 2020 18:26:52 +0000
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
	id 1kQE9M-0000zu-GW; Wed, 07 Oct 2020 18:26:52 +0000
Received: by outflank-mailman (input) for mailman id 3678;
 Wed, 07 Oct 2020 18:26:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE4c-00072Q-Lr
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:21:58 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2537cdee-d122-4b24-b466-4f1c53d8830e;
 Wed, 07 Oct 2020 18:20:24 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDk6-0007CF-IF; Wed, 07 Oct 2020 19:00:46 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE4c-00072Q-Lr
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:21:58 +0000
X-Inumbo-ID: 2537cdee-d122-4b24-b466-4f1c53d8830e
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 2537cdee-d122-4b24-b466-4f1c53d8830e;
	Wed, 07 Oct 2020 18:20:24 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDk6-0007CF-IF; Wed, 07 Oct 2020 19:00:46 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
	Ian Jackson <Ian.Jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 53/82] host reuse: Jiggle the infra-priority a bit, within a flight
Date: Wed,  7 Oct 2020 18:59:55 +0100
Message-Id: <20201007180024.7932-54-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

Signed-off-by: Ian Jackson <Ian.Jackson@eu.citrix.com>
---
 ts-hosts-allocate-Executive | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/ts-hosts-allocate-Executive b/ts-hosts-allocate-Executive
index a50f8bf3..c1002fc9 100755
--- a/ts-hosts-allocate-Executive
+++ b/ts-hosts-allocate-Executive
@@ -733,8 +733,13 @@ sub alloc_hosts () {
         ? -10000
         : -10 * @hids;
 
-    my $infrapriority =
-	($r{hosts_infraprioritygroup} // '') =~ m/^(\d+):/ ? $1 : undef;
+    my $infrapriority;
+    if (($r{hosts_infraprioritygroup} // '') =~ m/^(\d+):/) {
+	$infrapriority = ($1 * 100) + ($$ % 100);
+	# $$ provides a pseudorandom element, which arranges that jobs
+	# in a group roughly take turns to take the scheduling lead,
+	# which will hopefully help them converge.
+    }
 
     my $ok = alloc_resources(WaitStart =>
                     ($ENV{OSSTEST_RESOURCE_WAITSTART} || $fi->{started}),
-- 
2.20.1


