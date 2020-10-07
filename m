Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 964B1286718
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:28:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3747.11262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQEB6-0005yk-As; Wed, 07 Oct 2020 18:28:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3747.11262; Wed, 07 Oct 2020 18:28:39 +0000
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
	id 1kQEB5-0005rq-43; Wed, 07 Oct 2020 18:28:39 +0000
Received: by outflank-mailman (input) for mailman id 3747;
 Wed, 07 Oct 2020 18:28:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE5G-00072Q-Nq
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:22:38 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fd487d61-c3bd-4c0c-9178-6cbdf434cb81;
 Wed, 07 Oct 2020 18:21:02 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDk1-0007CF-Er; Wed, 07 Oct 2020 19:00:41 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE5G-00072Q-Nq
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:22:38 +0000
X-Inumbo-ID: fd487d61-c3bd-4c0c-9178-6cbdf434cb81
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id fd487d61-c3bd-4c0c-9178-6cbdf434cb81;
	Wed, 07 Oct 2020 18:21:02 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDk1-0007CF-Er; Wed, 07 Oct 2020 19:00:41 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
	Ian Jackson <Ian.Jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 32/82] plan_search: Use plan's Wear information rather than tracking it ourselves
Date: Wed,  7 Oct 2020 18:59:34 +0100
Message-Id: <20201007180024.7932-33-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

There is no reason not to use this information from the plan.
Not computing it ourselves saves some confusing logic here.

Signed-off-by: Ian Jackson <Ian.Jackson@eu.citrix.com>
---
 Osstest/Executive.pm | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/Osstest/Executive.pm b/Osstest/Executive.pm
index dfa3710a..e17b6503 100644
--- a/Osstest/Executive.pm
+++ b/Osstest/Executive.pm
@@ -675,7 +675,6 @@ sub plan_search ($$$$) {
     my $reqix= 0;
     my $try_time= 0;
     my $confirmedok= 0;
-    my $share_wear;
     my $share_reuse= 0;
 
     for (;;) {
@@ -689,8 +688,7 @@ sub plan_search ($$$$) {
       PERIOD:
 	foreach (my $ix=0; $ix<@$events; $ix++) {
 	    $dbgprint->("PLAN LOOP reqs[$reqix]=$req->{Ident}".
-		" evtix=$ix try=$try_time confirmed=$confirmedok".
-		(defined($share_wear) ? " wear=$share_wear" : ""));
+		" evtix=$ix try=$try_time confirmed=$confirmedok");
 
 	    # check the period from $events[$ix] to next event
 	    my $startevt= $events->[$ix];
@@ -710,12 +708,8 @@ sub plan_search ($$$$) {
 			($req->{SharedMaxTasks}//'<undef>'));
 		return 0 unless defined $req->{Shared};
 		return 0 unless $req->{Shared} eq $eshare->{Type};
-		if (defined $share_wear) {
-		    $share_wear++ if $startevt->{Type} eq 'Start';
-		} else {
-		    $share_wear= $eshare->{Wear}+1;
-		}
-		return 0 if $share_wear > $req->{SharedMaxWear};
+		my $wear= $eshare->{Wear}+1;
+		return 0 if $wear > $req->{SharedMaxWear};
 		return 0 if $eshare->{Shares} != $req->{SharedMaxTasks};
 		$dbgprint->("PLAN LOOP   SHARE-COMPAT-OK Y");
 		return 1;
@@ -742,13 +736,11 @@ sub plan_search ($$$$) {
 	    # nope
 	    $try_time= $endevt->{Time};
 	    $confirmedok= 0;
-	    undef $share_wear;
 	    $share_reuse= 0;
 	    $dbgprint->("PLAN LOOP   OVERLAP BAD $try_time");
 	}
 	$dbgprint->("PLAN NEXT reqs[$reqix]=$req->{Ident}".
-	    " try=$try_time confirmed=$confirmedok reuse=$share_reuse".
-	    (defined($share_wear) ? " wear=$share_wear" : ""));
+	    " try=$try_time confirmed=$confirmedok reuse=$share_reuse");
 
 	$confirmedok++;
 	$share_reuse++ if defined $share_wear;
-- 
2.20.1


