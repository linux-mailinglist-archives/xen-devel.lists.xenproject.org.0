Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E48202678F9
	for <lists+xen-devel@lfdr.de>; Sat, 12 Sep 2020 10:50:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kH1Dv-0001RO-O6; Sat, 12 Sep 2020 08:49:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ukTE=CV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kH1Du-0001RJ-Ql
 for xen-devel@lists.xenproject.org; Sat, 12 Sep 2020 08:49:30 +0000
X-Inumbo-ID: 0143afed-ded0-4899-b556-db9000d3a358
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0143afed-ded0-4899-b556-db9000d3a358;
 Sat, 12 Sep 2020 08:49:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 064B4B02C;
 Sat, 12 Sep 2020 08:49:45 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
Subject: [PATCH] tools/build: avoid $(file ...) directive in Makefile
Date: Sat, 12 Sep 2020 10:49:13 +0200
Message-Id: <20200912084913.5318-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Using $(file ...) breaks the build with make older than version 4.0.
Replace it with echo.

Fixes: 52dbd6f07cea7a ("tools: generate pkg-config files from make variables")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/Rules.mk | 48 ++++++++++++++++++++++++------------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/tools/Rules.mk b/tools/Rules.mk
index ccb197596e..8ba8230270 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -175,29 +175,29 @@ $(PKG_CONFIG_DIR):
 	mkdir -p $(PKG_CONFIG_DIR)
 
 $(PKG_CONFIG_DIR)/%.pc: Makefile $(XEN_ROOT)/tools/Rules.mk $(PKG_CONFIG_DIR)
-	$(file >$@,prefix=$(PKG_CONFIG_PREFIX))
-	$(file >>$@,includedir=$(PKG_CONFIG_INCDIR))
-	$(file >>$@,libdir=$(PKG_CONFIG_LIBDIR))
-	$(foreach var,$(PKG_CONFIG_VARS),$(file >>$@,$(var)))
-	$(file >>$@,)
-	$(file >>$@,Name: $(PKG_CONFIG_NAME))
-	$(file >>$@,Description: $(PKG_CONFIG_DESC))
-	$(file >>$@,Version: $(PKG_CONFIG_VERSION))
-	$(file >>$@,Cflags: -I$${includedir} $(CFLAGS_xeninclude))
-	$(file >>$@,Libs: -L$${libdir} $(PKG_CONFIG_USELIBS) -l$(PKG_CONFIG_LIB))
-	$(file >>$@,Libs.private: $(PKG_CONFIG_LIBSPRIV))
-	$(file >>$@,Requires.private: $(PKG_CONFIG_REQPRIV))
+	@echo "prefix=$(PKG_CONFIG_PREFIX)" >$@
+	@echo "includedir=$(PKG_CONFIG_INCDIR)" >>$@
+	@echo "libdir=$(PKG_CONFIG_LIBDIR)" >>$@
+	@for v in $(PKG_CONFIG_VARS); do echo "$$v" >>$@; done
+	@echo "" >>$@
+	@echo "Name: $(PKG_CONFIG_NAME)" >>$@
+	@echo "Description: $(PKG_CONFIG_DESC)" >>$@
+	@echo "Version: $(PKG_CONFIG_VERSION)" >>$@
+	@echo "Cflags: -I\$${includedir} $(CFLAGS_xeninclude)" >>$@
+	@echo "Libs: -L\$${libdir} $(PKG_CONFIG_USELIBS) -l$(PKG_CONFIG_LIB)" >>$@
+	@echo "Libs.private: $(PKG_CONFIG_LIBSPRIV)" >>$@
+	@echo "Requires.private: $(PKG_CONFIG_REQPRIV)" >>$@
 
 %.pc: Makefile $(XEN_ROOT)/tools/Rules.mk
-	$(file >$@,prefix=$(PKG_CONFIG_PREFIX))
-	$(file >>$@,includedir=$(PKG_CONFIG_INCDIR))
-	$(file >>$@,libdir=$(PKG_CONFIG_LIBDIR))
-	$(foreach var,$(PKG_CONFIG_VARS),$(file >>$@,$(var)))
-	$(file >>$@,)
-	$(file >>$@,Name: $(PKG_CONFIG_NAME))
-	$(file >>$@,Description: $(PKG_CONFIG_DESC))
-	$(file >>$@,Version: $(PKG_CONFIG_VERSION))
-	$(file >>$@,Cflags: -I$${includedir})
-	$(file >>$@,Libs: -L$${libdir} -l$(PKG_CONFIG_LIB))
-	$(file >>$@,Libs.private: $(PKG_CONFIG_LIBSPRIV))
-	$(file >>$@,Requires.private: $(PKG_CONFIG_REQPRIV))
+	@echo "prefix=$(PKG_CONFIG_PREFIX)" >$@
+	@echo "includedir=$(PKG_CONFIG_INCDIR)" >>$@
+	@echo "libdir=$(PKG_CONFIG_LIBDIR)" >>$@
+	@for v in $(PKG_CONFIG_VARS); do echo "$$v" >>$@; done
+	@echo "" >>$@
+	@echo "Name: $(PKG_CONFIG_NAME)" >>$@
+	@echo "Description: $(PKG_CONFIG_DESC)" >>$@
+	@echo "Version: $(PKG_CONFIG_VERSION)" >>$@
+	@echo "Cflags: -I\$${includedir}" >>$@
+	@echo "Libs: -L\$${libdir} -l$(PKG_CONFIG_LIB)" >>$@
+	@echo "Libs.private: $(PKG_CONFIG_LIBSPRIV)" >>$@
+	@echo "Requires.private: $(PKG_CONFIG_REQPRIV)" >>$@
-- 
2.26.2


