Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 732141DECFC
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 18:13:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jcAIJ-00063q-Vf; Fri, 22 May 2020 16:13:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2cgu=7E=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jcAIH-00063Z-UH
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 16:13:09 +0000
X-Inumbo-ID: 1e073512-9c47-11ea-b9cf-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e073512-9c47-11ea-b9cf-bc764e2007e4;
 Fri, 22 May 2020 16:13:04 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: hM8AKnw8g800qnanAC29WuSXC2r7EZt/ZAlllla/TZS8Cgy1GhwEwsSWZ/4iQ4cSRBxyWy/6BS
 gRy3I3ErzCwV0xvhLktGPxm67r1ZvMmKMjNSMkjydZDTu9KeJ0NwpKqsqenIKZ3OlvzW0CPZF0
 DvRzR/gwTDTKwgocx/kQptGH8yerMHgsTg4EMhGYY8QYoWhrxuGoLDkeBsQvgOYCCCeiZlo2FH
 OXzfByK2XulSVVY1aOOzdVHH5T28UUBDIFh4P+Xh1z0SIfBQxDFQOjlqfyYoQifOSQ7l00EONl
 6WM=
X-SBRS: 2.7
X-MesageID: 18454769
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,422,1583211600"; d="scan'208";a="18454769"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH 4/5] golang/xenlight: Use XEN_PKG_DIR variable rather than
 open-coding
Date: Fri, 22 May 2020 17:12:39 +0100
Message-ID: <20200522161240.3748320-5-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200522161240.3748320-1-george.dunlap@citrix.com>
References: <20200522161240.3748320-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Ian Jackson <ian.jackson@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
CC: Ian Jackson <ian.jackson@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 tools/golang/xenlight/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/golang/xenlight/Makefile b/tools/golang/xenlight/Makefile
index 751f916276..6ab36c0aa9 100644
--- a/tools/golang/xenlight/Makefile
+++ b/tools/golang/xenlight/Makefile
@@ -19,7 +19,7 @@ package: $(XEN_GOPATH)$(GOXL_PKG_DIR)
 
 GOXL_GEN_FILES = types.gen.go helpers.gen.go
 
-$(XEN_GOPATH)/src/$(XEN_GOCODE_URL)/xenlight/: xenlight.go $(GOXL_GEN_FILES)
+$(XEN_GOPATH)$(GOXL_PKG_DIR): xenlight.go $(GOXL_GEN_FILES)
 	$(INSTALL_DIR) $(XEN_GOPATH)$(GOXL_PKG_DIR)
 	$(INSTALL_DATA) xenlight.go $(XEN_GOPATH)$(GOXL_PKG_DIR)
 	$(INSTALL_DATA) types.gen.go $(XEN_GOPATH)$(GOXL_PKG_DIR)
-- 
2.25.1


