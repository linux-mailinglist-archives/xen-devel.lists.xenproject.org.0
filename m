Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F3C26883C
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 11:25:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHkjH-0006za-FV; Mon, 14 Sep 2020 09:24:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qknR=CX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kHkjG-0006zG-FF
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 09:24:54 +0000
X-Inumbo-ID: 22664564-07aa-45e6-bf13-546f610c7823
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 22664564-07aa-45e6-bf13-546f610c7823;
 Mon, 14 Sep 2020 09:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600075479;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=xvFoKyqtIsUHfw6wHWA+qUio8zOrim09FJUlarkXOrU=;
 b=X9iwPYjfXc9g7QhDJbd2kVNFyX8cDUg5RWyNVD7eybyT5BkN/R6SAo+K
 +bGxNnJYL0P0YtXAQC270RpLUTzeL3GSri0lXeP8+APAdanlqSmO/msJV
 Qw4+4LKU792WwYluexJYtwyfpxhLNSb0nwp+Qv7+gO9OK91Mn2lb4quBh A=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: vE1XTDUAdG6L9Q7iPLjGqI9XrlGFypNbakarcgwR4J64q2OKygrXOak7GmOCzIGKvOESIaHrba
 Dg1oJN77jK6X4TQQG6J2pySYHDiWggogFmPe3TKY4WZzrsdA1qDGs4HiXMECuBPTmXCxZL13zY
 2Jo+uLgcrZejMHxSgwyaQKh3ND7bssTnm2c33Lyk+ZOWwKSrJ3Sfkwun0ofvhnaBKEsvcunF3P
 MTeZru0kEmzRYXIko2SPEqMZAQipIiRetHbFoW8YqyJGlWEQUDyNVVO3UUwm5kjH1yEfO9pe1f
 hsE=
X-SBRS: 2.7
X-MesageID: 26592536
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,425,1592884800"; d="scan'208";a="26592536"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross
 <jgross@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/2] tools/Makefile: Drop the use of $(file ...)
Date: Mon, 14 Sep 2020 10:24:20 +0100
Message-ID: <20200914092420.20900-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200914092420.20900-1-andrew.cooper3@citrix.com>
References: <20200914092420.20900-1-andrew.cooper3@citrix.com>
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

It is only available in make 4.0 and later, and not for example in CentOS 7.

Rewrite the logic to use echo and shell redirection, using a single capture
group to avoid having 12 different processes in quick succession each
appending one line to the file.

Fixes: 52dbd6f07cea7a ("tools: generate pkg-config files from make variables")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Juergen Gross <jgross@suse.com>
CC: Ian Jackson <Ian.Jackson@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 tools/Rules.mk | 52 ++++++++++++++++++++++++++++------------------------
 1 file changed, 28 insertions(+), 24 deletions(-)

diff --git a/tools/Rules.mk b/tools/Rules.mk
index 4fd91fa444..a71abb2e4f 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -186,29 +186,33 @@ $(PKG_CONFIG_DIR):
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
+	{ \
+	echo "prefix=$(PKG_CONFIG_PREFIX)"; \
+	echo "includedir=$(PKG_CONFIG_INCDIR)"; \
+	echo "libdir=$(PKG_CONFIG_LIBDIR)"; \
+	$(foreach var,$(PKG_CONFIG_VARS),echo $(var);) \
+	echo ""; \
+	echo "Name: $(PKG_CONFIG_NAME)"; \
+	echo "Description: $(PKG_CONFIG_DESC)"; \
+	echo "Version: $(PKG_CONFIG_VERSION)"; \
+	echo "Cflags: -I\$${includedir} $(CFLAGS_xeninclude)"; \
+	echo "Libs: -L\$${libdir} $(PKG_CONFIG_USELIBS) -l$(PKG_CONFIG_LIB)"; \
+	echo "Libs.private: $(PKG_CONFIG_LIBSPRIV)"; \
+	echo "Requires.private: $(PKG_CONFIG_REQPRIV)"; \
+	} > $@
 
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
+	{ \
+	echo "prefix=$(PKG_CONFIG_PREFIX)"; \
+	echo "includedir=$(PKG_CONFIG_INCDIR)"; \
+	echo "libdir=$(PKG_CONFIG_LIBDIR)"; \
+	$(foreach var,$(PKG_CONFIG_VARS),echo $(var);) \
+	echo ""; \
+	echo "Name: $(PKG_CONFIG_NAME)"; \
+	echo "Description: $(PKG_CONFIG_DESC)"; \
+	echo "Version: $(PKG_CONFIG_VERSION)"; \
+	echo "Cflags: -I\$${includedir}"; \
+	echo "Libs: -L\$${libdir} -l$(PKG_CONFIG_LIB)"; \
+	echo "Libs.private: $(PKG_CONFIG_LIBSPRIV)"; \
+	echo "Requires.private: $(PKG_CONFIG_REQPRIV)"; \
+	} > $@
-- 
2.11.0


