Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0CA244DA8
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:27:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dTu-00055q-KZ; Fri, 14 Aug 2020 17:27:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dRv-00024H-4A
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:25:03 +0000
X-Inumbo-ID: fec89442-f640-4447-b2f8-be604317b767
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fec89442-f640-4447-b2f8-be604317b767;
 Fri, 14 Aug 2020 17:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425760;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=xNFNARb2DH3nytu+LwtUfgJ/aOgJiJDqOJzo2YjtfkA=;
 b=VMhQYvIAtWlrYNIOM6K4u4aIU0TkIb93fsERkY2hfUCARoHBPW37R7MJ
 yKHbCfohHZcQpiCRpCh0X5vyrNtHgRzcB5NaE2j76QKoI7O2GKHW84YeZ
 bMOmiIynXF+/MeqTlK+qmDMfNyW8IoBaGIcr3jmQyJxHSDd5tK/J21Bo7 E=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: wuducQNRVAq8B5xzQ7UBCn0VqtsE5FEzld/9mfYnWqs9kS+ZM3RiooT5SVwl4qR/LReD/d/IVD
 mZ+f/3qkdGLpngT10HDEzjOq0KsovPBBG7FsR05OLOVPIJSaVGmKjqGQKSlacEYNvL/EyVDOTa
 YKRXO2FI4JP7Sc/fRoWp2HyUcafxY10wm5MlpwD5gHsZ+cA3UXo0HeNuE2Gr/sXBjqNCNs3oIh
 SP087T4ZFTpA672YoeLpUzoMSW32+S8RP9IUuEARqIFWqkE9i2+ioXjW+RValGwfsgfrmUTkxr
 lzA=
X-SBRS: 2.7
X-MesageID: 24576920
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24576920"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 48/60] history reporting (nfc): Break out url_unquote
Date: Fri, 14 Aug 2020 18:21:53 +0100
Message-ID: <20200814172205.9624-49-ian.jackson@eu.citrix.com>
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
index f30ded5b..f8a49955 100644
--- a/Osstest/HistoryReport.pm
+++ b/Osstest/HistoryReport.pm
@@ -147,8 +147,7 @@ sub cache_read_previous ($) {
 	    }
 	    s{^(\w+)=}{} or die "$orig -- $_ ";
 	    my $k = $1;
-	    s{\%([0-9a-f]{2})}{ chr hex $1 }ge;
-	    $ch->{$k} = $_;
+	    $ch->{$k} = url_unquote($_);
 	}
 	push @previous, $jr;
 	$cache{key($jr)} = $jr;
@@ -156,6 +155,12 @@ sub cache_read_previous ($) {
     close H;
 }
 
+sub url_unquote ($) {
+    local ($_) = "$_[0]";
+    s{\%([0-9a-f]{2})}{ chr hex $1 }ge;
+    $_;
+}
+
 sub url_quote ($) {
     local ($_) = "$_[0]";
     s{[^-+=/~:;_.,\w]}{ sprintf "%%%02x", ord $& }ge;
-- 
2.11.0


