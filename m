Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21148244D8E
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:26:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dTI-0003we-An; Fri, 14 Aug 2020 17:26:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dRD-00024Q-If
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:24:19 +0000
X-Inumbo-ID: f4f114e6-1d08-43f4-b415-2d9859f6ebdf
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f4f114e6-1d08-43f4-b415-2d9859f6ebdf;
 Fri, 14 Aug 2020 17:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=61fqw6PWoI8qd0n3NohAsqlw4/F+FMTnN5CsL+5lnzE=;
 b=UMVWrE6WP9gORRpA3oKGYAznPfC20E5VXlXRX+BhdTA0CfbfPF2VQ0Fl
 okEaQCTjVla+IHNBmp+qKHmvSsDVVw31uemTaS8aWmDkVUEviaTvbSOOS
 toN5Z1eo642wOytij1V3wxzfhgbD4h3IodKFR4yqNE5X8A9iiWg9s93XR U=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: +rFNKiVJx0Vt65WitQUTUDeTRO/vq1k9/eu2nbxSeSjfE44/mzExFUmXeZ4AECk6N4rQkySLaC
 HsO3etkG5Lw9jnoQ+EtGutB6OB2/ZDOAdVVGFmhOGXooGMuWy1MNyTdKNxqv2wkcY4NNwsa/xF
 Xv3RKkUEKYj+6uC3Cpk3jOqHpxF1FlU/NH04pirUliFFXn9Hpkrk6L85LoR/Rfg17tDXiUwVKY
 OcG+vTBPCd36NhUsV/vzMvrujBP4Fx3mmK0q7wf6UXSxNjLwRdOd/Rm4e7i6V8fd27Mw9hS8Az
 6ZE=
X-SBRS: 2.7
X-MesageID: 24576911
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24576911"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 10/60] history reporting (nfc): Bind by name in
 cacheable_query
Date: Fri, 14 Aug 2020 18:21:15 +0100
Message-ID: <20200814172205.9624-11-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200814172205.9624-1-ian.jackson@eu.citrix.com>
References: <20200814172205.9624-1-ian.jackson@eu.citrix.com>
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

cacheable_query used to simply pass $jr->{flight} and ->{job}.  But we
want this to be reuseable for other kinds of query, with different
cache keys.

So bind by name: we expect the caller to use :name placeholders in the
query.  We can then look through the prepared query parameters, and
fish the corresponding values out of $jr.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-host-history | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/sg-report-host-history b/sg-report-host-history
index 90369ce4..8c5cd105 100755
--- a/sg-report-host-history
+++ b/sg-report-host-history
@@ -197,7 +197,11 @@ sub cacheable_fn ($$$) {
 sub cacheable_query ($$$) {
     my ($q, $jr, $cachekey) = @_;
     cacheable_fn($jr, $cachekey, sub {
-	$q->execute($jr->{flight}, $jr->{job});
+	foreach my $k (keys %{ $q->{ParamTypes} }) {
+	    $k =~ m/^:/ or die "$k ?";
+	    $q->bind_param($k, $jr->{$'} // die "$k ?");
+	}
+	$q->execute();
 	return $q->fetchrow_hashref();
     });
 }
@@ -259,7 +263,7 @@ sub reporthost ($) {
     our $endedq //= db_prepare(<<END);
 	SELECT finished, testid, status AS laststepstatus
 	  FROM steps
-	 WHERE flight=? AND job=? AND finished IS NOT NULL
+	 WHERE flight=:flight AND job=:job AND finished IS NOT NULL
 	 ORDER BY finished DESC
 	 LIMIT 1
 END
@@ -267,13 +271,13 @@ END
     our $infoq //= db_prepare(<<END);
 	SELECT blessing, branch, intended
 	  FROM flights
-	 WHERE flight=? AND ?!='X'
+	 WHERE flight=:flight AND :job != 'X'
 END
 
     our $allocdq //= db_prepare(<<END);
 	SELECT testid, finished, status
 	  FROM steps
-	 WHERE flight=? AND job=?
+	 WHERE flight=:flight AND job=:job
 	   AND (testid='hosts-allocate' OR step='ts-hosts-allocate')
 	 ORDER BY finished ASC
 	 LIMIT 1
-- 
2.11.0


