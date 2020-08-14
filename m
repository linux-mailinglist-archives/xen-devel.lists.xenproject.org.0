Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE16E244D94
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:26:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dTP-00044V-Gp; Fri, 14 Aug 2020 17:26:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dRq-00024H-49
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:24:58 +0000
X-Inumbo-ID: d5ab76a6-94e0-4c6a-93b5-237daa29d762
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d5ab76a6-94e0-4c6a-93b5-237daa29d762;
 Fri, 14 Aug 2020 17:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425759;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=EbbvYXVycJDJO2skBAFjJlWzRMxKmAJD904vZ3lFpjI=;
 b=dYnmCBfC/jKMOz7TBA+ONSrddnvNfk5xnb9SLiPUWztJRth4tvVooqfd
 OJuHtcHSCZgHVWJKve4NMCCdkMuh20YZ3Z2o0PMBRyrXVSodL4EBFTBne
 SxgRZavWuiSJF6h9fQfkjGdbYyVyRSFV5ANovv+YvjIIA1LA5P3z+57A0 0=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Ttne0r5bkUnbUn8tKVnj2W5yAnkY9A665WG9yujMtyhHyu49ixe82UGhah0IkSfUYWyNivVWPR
 5H1DVurFh7Y0Tbpy5My9AZ4N3gnRcuaRpqMeCdnHnWpxMAPhW2EsZUP2Gulv+QoH9k6qEecZR0
 OmiKb6fAKuX9f+LVlvQc1ItcYMT8EScEmAwasSbC6ehupnFvNehm9p3+965bfIcYZmYNBXK4YO
 T6p00m/1MCrAGa77M9Zg8yFww0kUTy2lzE78MOAIthLe3zx5PWyNIv/53IgFNb0J8E930QrEeX
 J74=
X-SBRS: 2.7
X-MesageID: 24576928
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24576928"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 58/60] sg-report-host-history: Cache report_run_getinfo
Date: Fri, 14 Aug 2020 18:22:03 +0100
Message-ID: <20200814172205.9624-59-ian.jackson@eu.citrix.com>
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

No logical change.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-host-history | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sg-report-host-history b/sg-report-host-history
index efe652bb..a814ef37 100755
--- a/sg-report-host-history
+++ b/sg-report-host-history
@@ -266,7 +266,9 @@ END
 
 	print H "<td><a href=\"$url\">$jr->{job}</td>\n";
 
-	my $ri = report_run_getinfo({ %$jr, %$ir });
+	my $ri = cacheable_fn($jr, 'rri', sub {
+            report_run_getinfo({ %$jr, %$ir })
+	});
 	print H "<td $ri->{ColourAttr}>$ri->{Content}</td>\n";
 
 	my $powers = cacheable_fn($jr, 'b', sub {
-- 
2.11.0


