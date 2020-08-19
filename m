Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A12D24A3B4
	for <lists+xen-devel@lfdr.de>; Wed, 19 Aug 2020 18:02:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8QXC-0006xl-9g; Wed, 19 Aug 2020 16:01:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N7ZT=B5=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k8QXA-0006xa-Iy
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2020 16:01:52 +0000
X-Inumbo-ID: bd897be7-b67c-49ad-9c2e-445e2509e80f
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bd897be7-b67c-49ad-9c2e-445e2509e80f;
 Wed, 19 Aug 2020 16:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597852911;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=yp2aFFOJUnSEDY2GZVR4R5A/kjt4Cn3oeWksIf2jOmc=;
 b=B3Wgn9rVaymYFIwwa5o3Ckbw6e3ifmx7UVdtzf/7YeY1c8uABNwF4ajH
 ogX4rMQNP2xLxoywb46C0lSawm35wDb2O3ANHUpVY3wYlkYrDIeH5GBVq
 ngSwRSGnhfhwSH1hnGZQXvxztu/GoLX7+bkpNK5WiiHDDHGvsqA4vngRp A=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: KCXr+Q+fHp8u1JDcNlXp7WyrcfoYrQp6twSLPRGRXZbUC9I/8pQfNcjFO2LNpfY69QZQCk4uD8
 iM34qNNEXVtiIqwX1ZX2FzC4hJviphnEkoJRps+S5b55BCOaYZup68ZyoEzpIi99pMGBBQvQJ2
 lhgdZmkWpYnBV05m7zNbAyewOMO9hyvvsaVmqEUX+h4nhzvRt8tCOjprylplKwQ4/Q+MnM6FSp
 s01neUlnJvVjlKiYmr8cmQJiF9KkwQjX1qMAAMgcen1X+L0hVBI9nuqCct7YrwFE5JTN/ywkOf
 R/4=
X-SBRS: 2.7
X-MesageID: 25801622
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,331,1592884800"; d="scan'208";a="25801622"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 6/7] host allocation: Memoise $equivstatus query
 results
Date: Wed, 19 Aug 2020 17:01:42 +0100
Message-ID: <20200819160143.11178-7-ian.jackson@eu.citrix.com>
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

This provides a very significant speedup.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 ts-hosts-allocate-Executive | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/ts-hosts-allocate-Executive b/ts-hosts-allocate-Executive
index 39c66346..a47bc499 100755
--- a/ts-hosts-allocate-Executive
+++ b/ts-hosts-allocate-Executive
@@ -467,9 +467,13 @@ END
         find_recent_duration($dbg,$hid,$candrow);
 
 	if ($candrow->{restype} eq 'host') {
-	    $equivstatusq->execute($job,$blessing,$fi->{branch},
-				   $hid->{Ident},$candrow->{resname});
-	    my $esrow = $equivstatusq->fetchrow_hashref();
+	    our %equivstatus_memo;
+	    my @params = ($job,$blessing,$fi->{branch},
+			  $hid->{Ident},$candrow->{resname});
+	    my $esrow = $equivstatus_memo{"@params"} //= do {
+		$equivstatusq->execute(@params);
+		$equivstatusq->fetchrow_hashref() // { };
+	    };
 	    $candrow->{EquivMostRecentStatus} = $esrow->{status};
 	    print DEBUG "$dbg EQUIV-MOST-RECENT ";
 	    print DEBUG ("$esrow->{flight}.$esrow->{job}".
-- 
2.11.0


