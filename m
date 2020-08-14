Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D39244D96
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:26:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dTJ-0003xY-T1; Fri, 14 Aug 2020 17:26:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dR3-00024Q-I8
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:24:09 +0000
X-Inumbo-ID: 33120668-a05a-4e35-95d1-b92d3baf3302
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 33120668-a05a-4e35-95d1-b92d3baf3302;
 Fri, 14 Aug 2020 17:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425756;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=X6/feefs+EBmTwV9A8+QWNObBLw3cmrBQxuV3E+6g3c=;
 b=hKZIPPKqx3MovPReQ7KyXonMxOopr+CtQkOduARttGbEPNS2BTVZWMrX
 c+uhPqexWlwIsvEdyaI80+GscyQs73VHCDO1VmliGtF7OML1wMWMljMU2
 XoIdCiqjqNutHOAWn9lWGE5J/zKz4g/b5Z34EZxWQwi87kol71+ZwkTjB M=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: HM1x3iOPWrYXuGhFyidvWlgA3coSfl/c0Ncma2X8a35RmMbAO+wu9fnfzZw7dSnWhmIiacXrNB
 gWYoLo7OaK1NiOpWRZMprn/iznQXYjamKW9sW+5kqgKcz+JpXObUPFEGjy6lgqKjODOM7jUNjd
 Hs8s4KwerOGgNLdQrcTYuumVn9jhzQswHuN71q/XerLD4MeOnWXVg20TCQ0PhKBc6oHUNXiiGY
 rXe6us5Ud2dNrzIJxu+ysDBABxK98kFri41ssHiJu2pzHaJYGdebAPRNldSwUoF57NF9mHvYWO
 d+8=
X-SBRS: 2.7
X-MesageID: 24576909
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24576909"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 03/60] history reporting: Delete two debug prints
Date: Fri, 14 Aug 2020 18:21:08 +0100
Message-ID: <20200814172205.9624-4-ian.jackson@eu.citrix.com>
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

These are going to become invalid and I don't think it's important to
save them.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-host-history | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sg-report-host-history b/sg-report-host-history
index 50cc5b58..4c0022e8 100755
--- a/sg-report-host-history
+++ b/sg-report-host-history
@@ -102,9 +102,7 @@ sub read_existing_logs ($) {
 	    my $k = $1;
 	    s{\%([0-9a-f]{2})}{ chr hex $1 }ge;
 	    $ch->{$k} = $_;
-#	    print DEBUG "GOTCACHE $hostname $k\n";
 	}
-#	print DEBUG "GOTCACHE $hostname \@ $jr->{flight} $jr->{job} $jr->{status},$jr->{name}\n";
 	$cache{$jr->{flight},$jr->{job},$jr->{status},$jr->{name}} = $jr;
     }
     close H;
-- 
2.11.0


