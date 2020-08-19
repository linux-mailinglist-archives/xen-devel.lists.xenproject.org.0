Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E3524A3B1
	for <lists+xen-devel@lfdr.de>; Wed, 19 Aug 2020 18:02:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8QXQ-00072S-OW; Wed, 19 Aug 2020 16:02:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N7ZT=B5=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k8QXP-0006yd-Gs
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2020 16:02:07 +0000
X-Inumbo-ID: dc685f10-8370-42b2-8454-55ebff3203f5
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dc685f10-8370-42b2-8454-55ebff3203f5;
 Wed, 19 Aug 2020 16:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597852922;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=PTQfIV4yQE1BF9Rx3GBSziCx/l3gtDRWZCafZEHerYw=;
 b=TiXvFs1rOvrPW87eXOdy2IZ58p8e55O7PHOQ4liyFezY7PEu5P/4GyJL
 iu4mCcYh0cz4yxicUXOpzlIWOCNHq2bejqenPGf0kvqQnLirgzLyXh64I
 N+xgBm3spTSIVejvPDrWy9Dcd5G8eMTPSpg1DFi4RddkUjXhYVSVRIg7A E=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: TjgKA2w+4zWZHVB7/rNGYO/TzivonIAnv1AH57q/2LClQrAdc2pkpqxumKLkQNCb4swea5A+Ab
 jqoDR+eyXj2Lc9tq5knQpCLcFPgSg+owIDrUlqXCTH10aQcvM+eoVoL7iHxG1Mk6PQ0RHuFSs/
 syNgDq5OKuXr42LXXGrANQxeok91EShJeEckz/5AiIalx0lUHJ5Vq2lHh7OmfOtbyf61XvEqJk
 r+Hm3yD/3NAMy9NQPJjDFweT7qnwhkQ6MeOb/4zxj6c6md0deninG2mISZOzPnzMR/jixKeDYF
 dxU=
X-SBRS: 2.7
X-MesageID: 24885409
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,331,1592884800"; d="scan'208";a="24885409"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 5/7] host allocation: Memoise duration estimates
Date: Wed, 19 Aug 2020 17:01:41 +0100
Message-ID: <20200819160143.11178-6-ian.jackson@eu.citrix.com>
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

We look at our own branch to estimate durations.  If somehow we are
one of multiple concurrent flights on this branch with the appropriate
blessing, we don't mind not noticing the doing of our peer flights so
that if our estimates are a bit out of date.

So it is fine to use an estimate no older than our own runtime.

Right now we generate a new duration estimator during each queueing
round, because it contains a statement handle and we must disconnect
from the db while waiting.  So the internal memo table gets thrown
away each time and is useless.

To actually memoise, pass our own hash which lives as long as we do.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/Executive.pm        | 2 +-
 ts-hosts-allocate-Executive | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/Osstest/Executive.pm b/Osstest/Executive.pm
index 50c84cc3..61a99bc3 100644
--- a/Osstest/Executive.pm
+++ b/Osstest/Executive.pm
@@ -1274,7 +1274,7 @@ END
     return sub {
         my ($job, $hostidname, $onhost, $uptoincl_testid) = @_;
 
-	my $memokey = "$job $hostidname $onhost $uptoincl_testid";
+	my $memokey = "$job $hostidname $onhost ".($uptoincl_testid//"");
 	my $memo = $our_memo->{$memokey};
 	return @$memo if $memo;
 
diff --git a/ts-hosts-allocate-Executive b/ts-hosts-allocate-Executive
index 4140b65c..39c66346 100755
--- a/ts-hosts-allocate-Executive
+++ b/ts-hosts-allocate-Executive
@@ -145,8 +145,10 @@ END
 		      AND hostflag LIKE 'equiv-%'
 END
 
+    our %duration_memo;
     $duration_estimator= duration_estimator($fi->{branch}, $blessing,
-                                            sub { print DEBUG "@_\n"; });
+                                            sub { print DEBUG "@_\n"; },
+					    0, \%duration_memo);
 
     $resprop_q= $dbh_tests->prepare(<<END);
             SELECT * FROM resource_properties
-- 
2.11.0


