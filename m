Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC5B24A3B6
	for <lists+xen-devel@lfdr.de>; Wed, 19 Aug 2020 18:02:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8QXU-000748-2S; Wed, 19 Aug 2020 16:02:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N7ZT=B5=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k8QXT-0006xV-63
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2020 16:02:11 +0000
X-Inumbo-ID: cfd62f0e-1fcb-4bee-8444-59e20b3db30d
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cfd62f0e-1fcb-4bee-8444-59e20b3db30d;
 Wed, 19 Aug 2020 16:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597852922;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=zWpQNW1nSTO5KEdMe+zYQIylPdBgmXTMUmQ9itT0K6Y=;
 b=XbpfatPYZmMYFF48252bcoWxqfkVQd80eaDtF2KIryUNk4gS027IePG7
 NTrchS5vu4wtxWUsbxIFVjyiM64ZTmTiu/b9sEUMqvrtKy2hUc3WUp6L+
 PRFqUv9gXtiauThE/KB1qZ2rsdZlw7QPWdQjKP2rkh0vyKt0pLiWLZFew Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: rmn/7TNe+olCT57QrSkYrJDRdN0+Xdjx2LYCuafupsdii/K/jzGgc7RsLE6o7d/THhkllbPDFt
 r2tpV7nJHufPRWufvOS8TtWgmgqxF7WFmPmUpZSQg1oKunF0Juwe+6maFU3eqAUC+hV0FM94P+
 tv5bFHx4mJr8C1vsp3u6dY1Fhg7IFlooz0FMjLACOi5DRxgd0FhLBRpzxKQ71iREt3KH4JN8ur
 wfgxPp4R5/wrxI9KmcCjDa0Nmk6quZMql7W2+1xmMmC9WDeqeO7kGcAOtEF1o5biHJncD/EpRx
 Lq4=
X-SBRS: 2.7
X-MesageID: 24885410
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,331,1592884800"; d="scan'208";a="24885410"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 1/7] ts-hosts-allocate-Executive: Fix broken call to
 $duration_estimator
Date: Wed, 19 Aug 2020 17:01:37 +0100
Message-ID: <20200819160143.11178-2-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200819160143.11178-1-ian.jackson@eu.citrix.com>
References: <20200819160143.11178-1-ian.jackson@eu.citrix.com>
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

The debug subref is passed to the constructor (and indeed we do that).
The final argument to the actual estimator is $uptoincl_testid (but we
didn't say $will_uptoincl_testid, so it is ignored).

The code was wrong, but with no effect.  So no functional change.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 ts-hosts-allocate-Executive | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/ts-hosts-allocate-Executive b/ts-hosts-allocate-Executive
index 3bc38102..e5a6fbfe 100755
--- a/ts-hosts-allocate-Executive
+++ b/ts-hosts-allocate-Executive
@@ -516,10 +516,7 @@ sub find_recent_duration ($$) {
     ($candrow->{Duration},
      $candrow->{MostRecentStarted},
      $candrow->{MostRecentStatus}) =
-        $duration_estimator->($job, $hid->{Ident}, $candrow->{resname},
-                              sub {
-#                                  print DEBUG "$dbg DUR-EST @_\n";
-                              });
+        $duration_estimator->($job, $hid->{Ident}, $candrow->{resname});
 }
 
 
-- 
2.11.0


