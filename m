Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17445244DB2
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:27:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dU8-0005fj-Gb; Fri, 14 Aug 2020 17:27:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dQ3-00024H-W7
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:23:08 +0000
X-Inumbo-ID: 4e41a6e3-1b25-4c7c-ab00-9425091a89fd
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4e41a6e3-1b25-4c7c-ab00-9425091a89fd;
 Fri, 14 Aug 2020 17:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425737;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=S9DEJX33n9JpkU8F2QVc8lEzP59THoIVTpdCJcuRTKE=;
 b=bsajmu+8cVxc5dRPVXCyJma+PHs5r9TBlMs3tXo/z708f/WtGAGqXGNw
 G1u3eP0hoXMkJZ8+CxdQPitfTLRXvjooBsv1a3SA2LP/7onFOiE0aiUsO
 BNuw5M6odFt2xgYGhrGLCvP2dA0Oy0Y6f6PM8xN4VH6eHpx+NE2a9nTka Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: amjdhmGLgIRYhmIw7aMb9wUVgR5z/Odj1giNmh92Gvjm5PQ0Bs6KOG7PZNRhAW8wzu4Fvkk5zX
 p3/sVR9idCQf7MP24+zUen7ll+H0BHpMw+qwwK95luKBNOoxBbICXT+CCI0dST3u1C1D3ocfMy
 31wMM7Vkuhy2IaY+I7UEEG08J8gEj+Ps4Xh2Z54fdJ8jia30ofjOGL1lKtISBMBDUnAYvermSg
 SuRAU6OPYrWZ9vz2FMRi8fDs6xyKUaFz/TtZmE/9ITaUEdeJu8NwSH2+bUMqGwUmlh095frNbV
 LiQ=
X-SBRS: 2.7
X-MesageID: 24545455
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24545455"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 22/60] history reporting: Skip undefined keys
Date: Fri, 14 Aug 2020 18:21:27 +0100
Message-ID: <20200814172205.9624-23-ian.jackson@eu.citrix.com>
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

This makes it work if the caller's cached hash contains an key which
is bound to undef.

sg-report-host-history already does this, which currently causes:

 Use of uninitialized value $_ in substitution (s///) at Osstest/HistoryReport.pm line 134.
 Use of uninitialized value $_ in printf at Osstest/HistoryReport.pm line 135.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/HistoryReport.pm | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Osstest/HistoryReport.pm b/Osstest/HistoryReport.pm
index 61b1ee8f..cb8c6ca1 100644
--- a/Osstest/HistoryReport.pm
+++ b/Osstest/HistoryReport.pm
@@ -131,6 +131,7 @@ sub cache_write_entry ($$) {
 	foreach my $k (sort keys %$h) {
 	    next if $k =~ m/^\%/;
 	    $_ = $h->{$k};
+	    next unless defined;
 	    s{[^-+=/~:;_.,\w]}{ sprintf "%%%02x", ord $& }ge;
 	    printf $fh " %s=%s", $k, $_;
 	}
-- 
2.11.0


