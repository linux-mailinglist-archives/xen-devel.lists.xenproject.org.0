Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E7F244D70
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:22:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dPY-0002Ev-9u; Fri, 14 Aug 2020 17:22:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dPW-00024Q-FH
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:22:34 +0000
X-Inumbo-ID: 612ec8ec-6fbc-49ed-9c60-9cca7b539642
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 612ec8ec-6fbc-49ed-9c60-9cca7b539642;
 Fri, 14 Aug 2020 17:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425735;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=nYDls4pSAxC6Us+znyNlTaQYDrDAw64aEjMsGqXSd1A=;
 b=TK2CRvTV5PUax2W9gJmLviMY34hwX17ahwhC1SWoyp94cj4T6WwUgREg
 sbpIFYTlCV+azlXlHpZM+9FEBLOg2x5OcoOxX1YnP3Jfib5JOjq0m7WRp
 xnfE1/8BwFGdNCJX6VZXMJi9yikREsiAtapiv99NsPOjdNzbL8jW2APSS I=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: emOl40wtKzR+YEaTIaVVp0vVYkyYGC6MTh755ARD8q+YYCtoqukf7tCT321KCe5aIX2L6/wgxn
 bxyRWqAOYra8sAGIo4R6lEXdvuhTWj0DhBXlcQscDQclgBoFRCPytz9PzjJU7Z6xkW3/CczWhc
 mAUZiqfJHcW3/3alnt7gfMqirZgjdV/JliXMjDpLM4saNTFIQaiPRLQDPga6WRShmWay0KbPDs
 av3gHgp/euKlVRR4LjOgdim9bFWVLtP+gX4FEWbvApeFnYji42DRo7hwVb27wtIc+NnfDlGZZo
 pXA=
X-SBRS: 2.7
X-MesageID: 24900367
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24900367"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 12/60] history reporting (nfc): Record query-specific
 stats
Date: Fri, 14 Aug 2020 18:21:17 +0100
Message-ID: <20200814172205.9624-13-ian.jackson@eu.citrix.com>
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

Prep work.  Nothing uses these yet.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-host-history | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sg-report-host-history b/sg-report-host-history
index 705367cf..32414322 100755
--- a/sg-report-host-history
+++ b/sg-report-host-history
@@ -77,6 +77,10 @@ our $flightcond;
 our $minflight;
 
 our %cache;
+
+our %q_count;
+our %q_misses;
+
 our @cache_row_key_cols = qw(flight job status name);
 
 sub cache_row_key ($) {
@@ -186,8 +190,10 @@ sub cacheable_fn ($$$) {
     $jqtotal++;
     $cachekey = '%'.$cachekey;
     my $cached = $jr->{$cachekey};
+    $q_count{$cachekey}++;
     if (!$cached) {
 	$jqcachemisses++;
+	$q_misses{$cachekey}++;
 	$cached = $fn->();
 	$jr->{$cachekey} = $cached;
     }
-- 
2.11.0


