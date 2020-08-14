Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7207244DB4
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:27:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dUB-0005qZ-QN; Fri, 14 Aug 2020 17:27:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dQK-00024Q-Gg
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:23:24 +0000
X-Inumbo-ID: dbd1591f-7a00-40b0-a763-8771cac475ea
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dbd1591f-7a00-40b0-a763-8771cac475ea;
 Fri, 14 Aug 2020 17:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425741;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=mO+R3Wi2onO1YjU9v4vCILxbaexYwro9M3qETJvjXTI=;
 b=ZLNkcwUji82rzZS1vLKsNzPoQVPFmrJoNmhW/WSpOohTC0SPK+r3mIPW
 u+ahElsvLV3zGeO4FZTdbE2Ea//gw9cIhzk3Hmx+4lprQ4R/l1hY90LtX
 yZzgSIJkYtKYN3AP/dMdeWoQsy/NC26BgV/Z9Sh56JJlCdaSCrkIpilcB 4=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: CZn+kKqSsQyEdTyVBEs3tVph5l12B1LN6jB3G80PxBt8N3bnVtvqWSvbDQol7OEFVL4j55WbaX
 ayn1TYKpmouIWRoNY4992zWPPc5hBrjgIJl8xDswnDS+qpFxNZwr440YJDZouh4w2mXfDeeFlo
 4EVhgq4GnmZDwIfHBUzOqq3QCrkZ/ukXtKdqXex/Ehg3gtFzE05qhtxl4e+BN3ofCjJE3neYup
 KorGP3npk7s701bFqTwx80cBCrO32A9KztZlRHE1epJAYYWk8VJU3IbIEWTQ39RmcaITZxBALA
 QhI=
X-SBRS: 2.7
X-MesageID: 24879745
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24879745"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 44/60] sg-report-job-history (nfc): Drop $hostsq query
Date: Fri, 14 Aug 2020 18:21:49 +0100
Message-ID: <20200814172205.9624-45-ian.jackson@eu.citrix.com>
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

We have eliminated all the users of @hostvarcols before @hostvarcols2
is calculated from the row data.

The query which produces this is very slow and can't be cached.  We
can abolish it now and just use the @hostvarcols2 calculation.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-job-history | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/sg-report-job-history b/sg-report-job-history
index 5d913b96..5684ac02 100755
--- a/sg-report-job-history
+++ b/sg-report-job-history
@@ -147,25 +147,6 @@ END
 END
     $flightsq->execute(@params);
 
-    my $hostsq= db_prepare(<<END);
-        SELECT DISTINCT name
-	 FROM runvars
-	 JOIN flights USING (flight)
-	WHERE ($cond)
-	  AND flight >= COALESCE(
-             (
-	      SELECT flight $fromstuff
-	      LIMIT 1 OFFSET $offset
-	     ), 0)
-     ORDER BY name;
-END
-    $hostsq->execute(@params, @params); # sql text contains $cond twice
-    my @hostvarcols;
-    while (my ($hostvar) = $hostsq->fetchrow_array()) {
-	next unless $hostvar =~ m/(^|_)host$/;
-	push @hostvarcols, $hostvar;
-    }
-
     my $hostq= db_prepare(<<END);
         SELECT name, val
           FROM runvars
@@ -213,8 +194,7 @@ END
     foreach my $ri (@test_rows) {
 	$hostvarnames{$_}=1 foreach keys %{ $ri->{Hosts} }
     }
-    my @hostvarcols2 = sort keys %hostvarnames;
-    die unless "@hostvarcols" eq "@hostvarcols2";
+    my @hostvarcols = sort keys %hostvarnames;
 
     my $osstestverq= db_prepare(<<END);
         SELECT DISTINCT harness
-- 
2.11.0


