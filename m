Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E90244D75
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:22:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dPV-0002DF-Vx; Fri, 14 Aug 2020 17:22:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dPU-00024H-Up
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:22:32 +0000
X-Inumbo-ID: bbb23550-a72b-4c89-89ff-240451d07c14
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bbb23550-a72b-4c89-89ff-240451d07c14;
 Fri, 14 Aug 2020 17:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425734;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=Cz4cBcsHyi+A9DH1w0U0E75BDnFx0uYZsqrpI0k8hFo=;
 b=A53ykD5Lh80fLfkXZLGye8ElXPZlvlvhbU6+o6k2O8FuTIG9z79EW99B
 k27MKpWxZ7u0ylv1EKoT3lrh/icmQYjnLWUNnYCFA9bUpeqUFxgu85Nkx
 uAK6xWaSLn4yiuclHR7fL8Zex3WRbe95LxdiG+4qUL24NN56n5Rwudfvo A=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 8iGfY8QFR2avWHYEtqT6dGVdVUz6q/afE0+qO2U3QHO8PKN2InrRhkXaKXDQ4kWgBKX1HvBttX
 x1qHx8+o859XfnFAf40MpNmG7NhFYUsv3l/PGF+iYeKTUTyQHM54E7bjmM/zF6fVOB4jy5bgBK
 e9vRn32A5Sw+y7IWB5hYw5fy5/hCPTRdxGMOyEki745V9fC8eTJKPA3eVs0d0erHwRdqO88O2d
 alFU+cO4LvH+bPKMk2TCy0AspzKl9sPyrlez5Y1qRVcF8DxyM/Q9wpCqlIsSmHrxOyMSB5oU2A
 45g=
X-SBRS: 2.7
X-MesageID: 24900363
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24900363"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 06/60] history reporting (nfc): Rename jobquery to
 cacheable_query
Date: Fri, 14 Aug 2020 18:21:11 +0100
Message-ID: <20200814172205.9624-7-ian.jackson@eu.citrix.com>
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

Prep work.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-host-history | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sg-report-host-history b/sg-report-host-history
index fe5b7cc2..a8dae159 100755
--- a/sg-report-host-history
+++ b/sg-report-host-history
@@ -171,7 +171,7 @@ END
 our $jqcachemisses = 0;
 our $jqtotal = 0;
 
-sub jobquery ($$$) {
+sub cacheable_query ($$$) {
     my ($q, $jr, $cachekey) = @_;
     $jqtotal++;
     $cachekey = '%'.$cachekey;
@@ -292,7 +292,7 @@ END
 	    $cachehits++;
 	}
 
-	my $endedrow = jobquery($endedq, $jr, 'e');
+	my $endedrow = cacheable_query($endedq, $jr, 'e');
 	if (!$endedrow) {
 	    #print DEBUG "no-finished\n";
 	    next;
@@ -322,8 +322,8 @@ END
 	}
 
         #print DEBUG "JR $jr->{flight}.$jr->{job}\n";
-	my $ir = jobquery($infoq, $jr, 'i');
-	my $ar = jobquery($allocdq, $jr, 'a');
+	my $ir = cacheable_query($infoq, $jr, 'i');
+	my $ar = cacheable_query($allocdq, $jr, 'a');
 	my $ident = $jr->{name};
 
 	my $altcolour = report_altcolour($alternate);
-- 
2.11.0


