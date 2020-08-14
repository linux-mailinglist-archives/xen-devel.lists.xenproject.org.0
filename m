Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 703BA244D7F
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:23:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dPv-0002hH-7c; Fri, 14 Aug 2020 17:22:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dPt-00024H-Vt
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:22:58 +0000
X-Inumbo-ID: d0438354-2241-4070-8117-2317f027fe47
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d0438354-2241-4070-8117-2317f027fe47;
 Fri, 14 Aug 2020 17:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425736;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=+4jPrjqYjTzITy9iRlTBDlMSXCVzvJckoAZyFOWRXhg=;
 b=AyIeVP8QwxNentNvKB7UO+8bwEdU7Y4Fo8JaMpdJalYVbP3va2Uj7eK9
 xKZrkvKbqCTyaZkiYRYnT81Wl0P+MeHJTj52MAJvXoPNSSnkgJh2Q66/2
 TB8sTe/qRUERJoXigej2c7HFexui+6dJM/QwA5aRv3XuM8L2jrPIJVCA5 Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: FsFWVrJiaHsiJH2DeW2YJWhoZEqur+TUK8B7JrNipjEFplXV+R638crGsqLuE9aNOUXNEAM4OY
 lCBLIKTgdhkeMogFA27uDOBlv4hL4PdJEUdTDhOYqtvgDHBfv9b4f13HfExo2AvoHbC2qpdHXD
 pyETK+bvhTwW1sOOlHHeJYzcOrthFic+Q0HlvTp65DugHfLkkjCytVPM5aETZQsplWkyoj2rbZ
 HvCOwjx2z4DTldswSYNlddugo2+0jq2PuBh5aY4h9jAi6nBB/kGw88DNV0weQLULO/tatq7p3W
 xXQ=
X-SBRS: 2.7
X-MesageID: 25487819
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="25487819"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 25/60] history reporting: Print debug for cache misses
Date: Fri, 14 Aug 2020 18:21:30 +0100
Message-ID: <20200814172205.9624-26-ian.jackson@eu.citrix.com>
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
 Osstest/HistoryReport.pm | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Osstest/HistoryReport.pm b/Osstest/HistoryReport.pm
index b576c02a..b593f207 100644
--- a/Osstest/HistoryReport.pm
+++ b/Osstest/HistoryReport.pm
@@ -155,6 +155,9 @@ sub cache_row_lookup_prep ($) {
     if ($cacherow) {
 	$$jrr = $cacherow;
 	$rows_hit++;
+    } else {
+	print ::DEBUG "CACHE MISS ",
+	    (join " ", map { $$jrr->{$_} } @key_cols), "\n";
     }
 }
 
-- 
2.11.0


