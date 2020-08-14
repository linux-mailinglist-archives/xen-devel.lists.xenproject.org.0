Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6270E244DAE
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:27:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dU6-0005av-LI; Fri, 14 Aug 2020 17:27:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dS5-00024H-4Z
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:25:13 +0000
X-Inumbo-ID: 6de50cb7-ecf3-48f5-a5c0-fa71292e5f28
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6de50cb7-ecf3-48f5-a5c0-fa71292e5f28;
 Fri, 14 Aug 2020 17:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425760;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=7jO5oa9Cvf0sgduE8CWd2v2zY8hx6IqAdysPRIm7Ppc=;
 b=UdLS7LvuwsPPEoo7qra2GtUEy4x4i/ab91JPmEo91GRA7+w9BDyHlcbP
 MlbVE+pJ/ED65AJUOxSkX51TodPajmfFQxiYc3h3dS3xsPrRmBs19Aj5G
 S1TKN+BCQGfSBoYFkeV3uvWKwKt/vGsIreKuYKFXbmYxpPjqkiPaKleIi M=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ph4SRXbhe4sIQGmZIvgHxjmu9GFETUGky+FvNjxdOr6XZ2LPKMtcZLT93sSQz0cvokwQ8bZHRf
 njt+SaBnlIADqXi8Lc3wtOhOAvsb2Wo8Qkgf6likKSwlPSXopO8aTPGKX+mBGtszU5YkwQwLX1
 kS7Sta9WODbOwSK44PStqtwq0+9WSbHGXTRKCJP6y/VFaNcGKvJPP8ukZoZzLVY6OruwA+jCjj
 EgG+wWP5d7AS060Nx5ouybvJS2cVRqA3/MEZcvfYoB8TIGISEiCIF2xp0ZBlM5zyMJZ4IbZljN
 dko=
X-SBRS: 2.7
X-MesageID: 24576919
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24576919"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 26/60] history reporting: Improve an error message
 slightly
Date: Fri, 14 Aug 2020 18:21:31 +0100
Message-ID: <20200814172205.9624-27-ian.jackson@eu.citrix.com>
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

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/HistoryReport.pm | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Osstest/HistoryReport.pm b/Osstest/HistoryReport.pm
index b593f207..6a23cfba 100644
--- a/Osstest/HistoryReport.pm
+++ b/Osstest/HistoryReport.pm
@@ -128,6 +128,7 @@ sub cache_read_previous ($) {
     for (;;) {
         $_ = <H> // last;
         next unless m{^\<\!-- osstest-report-reuseable (.*)--\>$};
+	my $orig = $_;
 	my $jr = {};
 	my $ch = $jr;
 	foreach (split / /, $1) {
@@ -136,7 +137,7 @@ sub cache_read_previous ($) {
 		$jr->{'%'.$&} = $ch;
 		next;
 	    }
-	    s{^(\w+)=}{} or die;
+	    s{^(\w+)=}{} or die "$orig -- $_ ";
 	    my $k = $1;
 	    s{\%([0-9a-f]{2})}{ chr hex $1 }ge;
 	    $ch->{$k} = $_;
-- 
2.11.0


