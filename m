Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 100A324A3B0
	for <lists+xen-devel@lfdr.de>; Wed, 19 Aug 2020 18:02:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8QXF-0006yQ-MI; Wed, 19 Aug 2020 16:01:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N7ZT=B5=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k8QXE-0006xV-5Y
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2020 16:01:56 +0000
X-Inumbo-ID: 7fab628c-1110-4506-83fa-2deeb3b05a26
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7fab628c-1110-4506-83fa-2deeb3b05a26;
 Wed, 19 Aug 2020 16:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597852911;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=BShF8h9p1rtWxGyCfOusoDWxVy7RyhYqWSNJAm1smZ0=;
 b=PwdbUM05edbP/8ei5dk58IzwE1DYjYD3GNQKA0MToYjwnfT82jVJkf2k
 ZGD7v/RaLftOhAfOxxU2KT3sXnYqI2ui43s7eJEGR+91CHK5Hu4e58xSO
 CyqAMufY6zanHnXsXuff7MU132pt45MTVvAVn0IaqzjJRy8SZIiEdR6k/ s=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: kR4+DsxdUAKyV3QuyttODNk15P5BJICEd4LYVvUg52Lf2JKP2ShdZp7LhGB62+EhZ0YRZS+Zn8
 ZpcfYWEOzzDlJ3P28zHBElIK/GTYXAvhP11zLHsRmf8jmbQ7i2O8p9eUTCXFVtyQweGbSLR0Vw
 xZfW6BThqDAGNY6qCTokdW1qhqY9uZAqtxcHlDyjFFpA19cUzQHanFUfpoCTUGyfFgJjI3y/g0
 Phes50Iht7uWLi7Zh1D1C1TKLgnS+AOzn6sqK+ebjJ7DpgBrKLpZL73rLdsuF2qIpyLi5uk1Mh
 pzk=
X-SBRS: 2.7
X-MesageID: 25801621
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,331,1592884800"; d="scan'208";a="25801621"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 4/7] duration estimates: Memoise results
Date: Wed, 19 Aug 2020 17:01:40 +0100
Message-ID: <20200819160143.11178-5-ian.jackson@eu.citrix.com>
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

The caller may provide a memoisation hash.  If they don't we embed
one in the estimator.

The estimator contains a db statement handle so shouldn't be so
long-lived that this gives significantly wrong answers.

I am aiming this work at ts-hosts-allocate-Executive, but it is
possible that this might speed up sg-report-flight.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/Executive.pm | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/Osstest/Executive.pm b/Osstest/Executive.pm
index d6b2736b..50c84cc3 100644
--- a/Osstest/Executive.pm
+++ b/Osstest/Executive.pm
@@ -1164,8 +1164,8 @@ sub hostalloc_starvation_calculate_X ($$$) {
 
 #---------- duration estimator ----------
 
-sub duration_estimator ($$;$$) {
-    my ($branch, $blessing, $debug, $will_uptoincl_testid) = @_;
+sub duration_estimator ($$;$$$) {
+    my ($branch, $blessing, $debug, $will_uptoincl_testid, $our_memo) = @_;
     # returns a function which you call like this
     #    $durest->($job, $hostidname, $onhost [, $uptoincl_testid])
     # and returns one of
@@ -1269,9 +1269,15 @@ END
     my $recentflights_q= $prepare_combi->($recentflights_qtxt);
     my $duration_anyref_q= $prepare_combi->($duration_anyref_qtxt);
 
+    $our_memo //= { };
+
     return sub {
         my ($job, $hostidname, $onhost, $uptoincl_testid) = @_;
 
+	my $memokey = "$job $hostidname $onhost $uptoincl_testid";
+	my $memo = $our_memo->{$memokey};
+	return @$memo if $memo;
+
 	my @x_params;
 	push @x_params, $uptoincl_testid if $will_uptoincl_testid;
 
@@ -1319,7 +1325,9 @@ END
             }
         }
 
-        return ($duration_max, $refs->[0]{started}, $refs->[0]{status});
+	$memo = [$duration_max, $refs->[0]{started}, $refs->[0]{status}];
+	$our_memo->{$memokey} = $memo;
+        return @$memo;
     };
 }
 
-- 
2.11.0


