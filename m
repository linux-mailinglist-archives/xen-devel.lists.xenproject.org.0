Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE272866ED
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:27:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3686.10804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQE9Z-0001ZI-GH; Wed, 07 Oct 2020 18:27:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3686.10804; Wed, 07 Oct 2020 18:27:05 +0000
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
	id 1kQE9Y-0001Uf-B0; Wed, 07 Oct 2020 18:27:04 +0000
Received: by outflank-mailman (input) for mailman id 3686;
 Wed, 07 Oct 2020 18:27:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE2R-00072Q-HW
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:19:43 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 55d1223a-6df9-4919-9b32-964afaeeb692;
 Wed, 07 Oct 2020 18:19:18 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDk0-0007CF-Tp; Wed, 07 Oct 2020 19:00:41 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE2R-00072Q-HW
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:19:43 +0000
X-Inumbo-ID: 55d1223a-6df9-4919-9b32-964afaeeb692
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 55d1223a-6df9-4919-9b32-964afaeeb692;
	Wed, 07 Oct 2020 18:19:18 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDk0-0007CF-Tp; Wed, 07 Oct 2020 19:00:41 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
	Ian Jackson <Ian.Jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 30/82] plan_search: Break out $share_compat_ok
Date: Wed,  7 Oct 2020 18:59:32 +0100
Message-Id: <20201007180024.7932-31-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

No functional change.

Signed-off-by: Ian Jackson <Ian.Jackson@eu.citrix.com>
---
 Osstest/Executive.pm | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/Osstest/Executive.pm b/Osstest/Executive.pm
index 4cd4aa50..e4bb0868 100644
--- a/Osstest/Executive.pm
+++ b/Osstest/Executive.pm
@@ -700,6 +700,20 @@ sub plan_search ($$$$) {
             # this period is entirely after the proposed slot;
             # so no need to check this or any later periods
 
+	    my $share_compat_ok = sub {
+		my ($eshare) = @_;
+		return 0 unless defined $req->{Shared};
+		return 0 unless $req->{Shared} eq $eshare->{Type};
+		if (defined $share_wear) {
+		    $share_wear++ if $startevt->{Type} eq 'Start';
+		} else {
+		    $share_wear= $eshare->{Wear}+1;
+		}
+		return 0 if $share_wear > $req->{SharedMaxWear};
+		return 0 if $eshare->{Shares} != $req->{SharedMaxTasks};
+		return 1;
+	    };
+
 	    next PERIOD if $endevt->{Time} <= $try_time;
             # this period is entirely before the proposed slot;
             # it doesn't overlap, but must check subsequent periods
@@ -711,15 +725,7 @@ sub plan_search ($$$$) {
 		my $eshare= $startevt->{Share};
 		if ($eshare) {
 		    $dbgprint->("PLAN LOOP   OVERLAP ESHARE");
-		    last CHECK unless defined $req->{Shared};
-		    last CHECK unless $req->{Shared} eq $eshare->{Type};
-		    if (defined $share_wear) {
-			$share_wear++ if $startevt->{Type} eq 'Start';
-		    } else {
-			$share_wear= $eshare->{Wear}+1;
-		    }
-		    last CHECK if $share_wear > $req->{SharedMaxWear};
-		    last CHECK if $eshare->{Shares} != $req->{SharedMaxTasks};
+		    last CHECK unless $share_compat_ok->($eshare);
 		}
 		# We have suitable availability for this period
 		$dbgprint->("PLAN LOOP   OVERLAP AVAIL OK");
-- 
2.20.1


