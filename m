Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FD9286706
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:28:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3709.11074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQEAP-00041l-EV; Wed, 07 Oct 2020 18:27:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3709.11074; Wed, 07 Oct 2020 18:27:57 +0000
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
	id 1kQEAO-0003zT-Jv; Wed, 07 Oct 2020 18:27:56 +0000
Received: by outflank-mailman (input) for mailman id 3709;
 Wed, 07 Oct 2020 18:27:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE4S-00072Q-Lc
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:21:48 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ddcc62eb-6ded-4054-be0f-ede0730b6969;
 Wed, 07 Oct 2020 18:20:19 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDk2-0007CF-1d; Wed, 07 Oct 2020 19:00:42 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE4S-00072Q-Lc
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:21:48 +0000
X-Inumbo-ID: ddcc62eb-6ded-4054-be0f-ede0730b6969
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ddcc62eb-6ded-4054-be0f-ede0730b6969;
	Wed, 07 Oct 2020 18:20:19 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDk2-0007CF-1d; Wed, 07 Oct 2020 19:00:42 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
	Ian Jackson <Ian.Jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 34/82] plan_search: Track last sharing state to determine $share_reuse
Date: Wed,  7 Oct 2020 18:59:36 +0100
Message-Id: <20201007180024.7932-35-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

What matters for the purpose of $share_reuse is not whether the host
is actually being _shared_ (ie, there are other concurrent allocations
and therefore a concurrent Event with Share information).  What we
really want to know is whether the *last* use of this host was a
suitable sharing setup - because we actually want to know if we will
be able to skip our setup.

So track that explicitly.  (The slightly odd structure, where there
are two loops in one, means that we reset $last_eshare when we go onto
the next $req ie the next host to check.)

Signed-off-by: Ian Jackson <Ian.Jackson@eu.citrix.com>
---
 Osstest/Executive.pm | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Osstest/Executive.pm b/Osstest/Executive.pm
index 4083ae6b..5f59c44e 100644
--- a/Osstest/Executive.pm
+++ b/Osstest/Executive.pm
@@ -676,6 +676,7 @@ sub plan_search ($$$$) {
     my $try_time= 0;
     my $confirmedok= 0;
     my $share_reuse= 0;
+    my $last_eshare;
 
     for (;;) {
 	my $req= $requestlist->[$reqix];
@@ -715,6 +716,10 @@ sub plan_search ($$$$) {
             # this period is entirely after the proposed slot;
             # so no need to check this or any later periods
 
+	    $last_eshare = $startevt->{
+                $startevt->{Type} eq 'Unshare' ? 'PreviousShare' : 'Share'
+				      };
+
 	    next PERIOD if $endevt->{Time} <= $try_time;
             # this period is entirely before the proposed slot;
             # it doesn't overlap, but must check subsequent periods
@@ -743,9 +748,10 @@ sub plan_search ($$$$) {
 	    " try=$try_time confirmed=$confirmedok reuse=$share_reuse");
 
 	$confirmedok++;
-	$share_reuse++ if defined $share_wear;
+	$share_reuse++ if $last_eshare and $share_compat_ok->($last_eshare);
 	$reqix++;
 	$reqix %= @$requestlist;
+	undef $last_eshare;
 	last if $confirmedok==@$requestlist;
     }
 
-- 
2.20.1


