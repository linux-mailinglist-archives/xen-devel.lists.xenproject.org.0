Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 882B5244DAB
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:27:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dU2-0005Qj-8q; Fri, 14 Aug 2020 17:27:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dQP-00024Q-Gh
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:23:29 +0000
X-Inumbo-ID: a375254f-663b-4e62-9d4e-3d9ccfa6426a
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a375254f-663b-4e62-9d4e-3d9ccfa6426a;
 Fri, 14 Aug 2020 17:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425742;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=CxW4jAZ/vIcg8LNWdKZ3/W4BiUjaoX6Yw8o5gSt9P7U=;
 b=FIze4JOfdeWO1QKm59nyYj9vlMnz/7KyV6qEF8ZlY6u5vtdgo5eBGtZf
 9B3R6zvDPDf8pJiXXGRwVu/tHZ9ZRi/uzr7GB9JpUi8LnIRE8NUr3acKW
 TBUVFxW1xuc8X+nZFkSmvOUQNsuJ8EnTw62tzxnW1+qdhIHoAdzo78JO5 U=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: W0PWBOGcTaOh5PxF3EZHPnw60gTjk5P744aQzgHSdUZ9MmyDCS2OFSUwCRJdLgyDSNRire5bPW
 SpBE8KyJ5swUsmKC5n5EA79AnNS7BWpodpwJZ+mvQo9WUL3zn5jyO0w7299UEZI8UBq/Be0RQf
 vc5UQf4qSkjf/s1UDEkpEi0eYJYFkITn55SYQ5e5txpYtPNKkux9/MxwqaNNzGSpCfhQSa3OOh
 odA77Gl3CuVaOtmq6rlk/R7HGmkG/x/eRwJBcVEvUsCE6rRDqym7sIM6QmzuWhxpe9iKbCB5xP
 LZM=
X-SBRS: 2.7
X-MesageID: 25487833
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="25487833"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 47/60] history reporting (nfc): Break out url_quote
Date: Fri, 14 Aug 2020 18:21:52 +0100
Message-ID: <20200814172205.9624-48-ian.jackson@eu.citrix.com>
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
 Osstest/HistoryReport.pm | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Osstest/HistoryReport.pm b/Osstest/HistoryReport.pm
index bfbee28c..f30ded5b 100644
--- a/Osstest/HistoryReport.pm
+++ b/Osstest/HistoryReport.pm
@@ -156,6 +156,12 @@ sub cache_read_previous ($) {
     close H;
 }
 
+sub url_quote ($) {
+    local ($_) = "$_[0]";
+    s{[^-+=/~:;_.,\w]}{ sprintf "%%%02x", ord $& }ge;
+    $_;
+}
+
 sub cache_row_lookup_prep ($) {
     my ($jrr) = @_;
 
@@ -179,8 +185,7 @@ sub cache_write_entry ($$) {
 	    next if $k =~ m/^\%/;
 	    $_ = $h->{$k};
 	    next unless defined;
-	    s{[^-+=/~:;_.,\w]}{ sprintf "%%%02x", ord $& }ge;
-	    printf $fh " %s=%s", $k, $_;
+	    printf $fh " %s=%s", $k, url_quote($_);
 	}
     };
     $whash->($jr);
-- 
2.11.0


