Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5629C590544
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 18:59:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384879.620407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBWu-0004Gk-0F; Thu, 11 Aug 2022 16:59:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384879.620407; Thu, 11 Aug 2022 16:59:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBWt-0004CM-RR; Thu, 11 Aug 2022 16:59:31 +0000
Received: by outflank-mailman (input) for mailman id 384879;
 Thu, 11 Aug 2022 16:59:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jhQd=YP=citrix.com=prvs=21531f474=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oMBNT-0003s9-KL
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 16:49:47 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b1c3dc9-1995-11ed-924f-1f966e50362f;
 Thu, 11 Aug 2022 18:49:46 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 9b1c3dc9-1995-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660236586;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6Ciqslkc0BK3uoE16/zRFo3axUefMUHAjqrqHVfnJXw=;
  b=HZE0GY9IgBY0obIiMrzoRTY4IW1bsobJp1Vh8/9/Re7OYm3mosghL/tP
   xawcKH+ro7owbsEMlEgFhuZ0EV8Mu6d6anbuoivO7krQoUv4pl76pewov
   ehAA/+W3CM/OxqEDNYnn9zFjx+Nxkr/nt2jRMcz1QfLRRGqrLLkJVFJEF
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77893971
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:OP2KqaL5HoA/ObokFE+RjJUlxSXFcZb7ZxGr2PjKsXjdYENSgzUGy
 mAXWm3Ua6rfMWHzfot+OYuw8EkH6J+Gm4c3QQdlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vraP65xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOd8iYNz6TSDK1rlV
 eja/ouOYzdJ5xYuajhOs/La8Us11BjPkGhwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 44vG5ngows1Vz90Yj+Uuu6Tnn8iG9Y+DiDX4pZiYICwgwAqm8AH+v1T2Mzwy6tgo27hc9hZk
 L2hvHErIOsjFvWkdO81C3G0H8ziVEHvFXCuzXWX6KSuI0P6n3TE2tcwUW47H7Yh0NlMJ2hJ/
 vUCJRs1V0XW7w626OrTpuhEg80iKI/gPZ8Fu2EmxjbcZRokacmdGeOQv4YehWpuwJAVdRrdT
 5NxhT5HZRLcYxpJKxEPBYg3huuAjXjjaTxI7lmSoMLb5kCMk1wgi+myabI5fPTNRN5RoHbB+
 lif+nnrHR0qFvfO2TmspyfEaujnwnqgBdN6+KeD3uFuqE2ewCoUEhJ+fUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxa5UgU0AoQKVbdgsUfUl/SSs13x6nU4oiBpcf546eA7ZwcT/
 GCyudruDjV1vZatcCfInluLlg9eKRT5PEdbO3FcFVpauoC9yG0gpkmRF4g+ScZZmvWwQGitm
 G7S8UDSkp1J1aY2O7OHEUcrat5GjrzAVUYL6wreRQpJBSspNdf+N+REBbU2hMuszbp1rXHb5
 RDoY+DEsIgz4WilzURhutklErCz/OqiOzbBm1NpFJRJ323zpSb7ItgJsWEjfh0B3iM4ldjBP
 ifuVf55vscPbBNGk4cuC25ONyja5fe5Tom0PhwlRtFPfoJwZGe6wc2aXmbJhjiFuBV9zskC1
 WKzK5nE4YAyVfs6l1Jbho41jdcW+8zJ7T+KGcynkk/3jeP2ibz8Ye5tDWZip9sRtMusyDg5O
 f4FXydW432ziNHDXxQ=
IronPort-HdrOrdr: A9a23:N/0UKaA1SchAA2HlHemU55DYdb4zR+YMi2TC1yhKJyC9Ffbo8f
 xG/c5rrSMc5wxwZJhNo7y90ey7MBbhHP1OkO4s1NWZLWrbUQKTRekIh+bfKn/baknDH4ZmpN
 5dmsNFaeEYY2IUsS+D2njbL+od
X-IronPort-AV: E=Sophos;i="5.93,230,1654574400"; 
   d="scan'208";a="77893971"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v4 27/32] tools/include: Rework Makefile
Date: Thu, 11 Aug 2022 17:48:40 +0100
Message-ID: <20220811164845.38083-28-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220811164845.38083-1-anthony.perard@citrix.com>
References: <20220811164845.38083-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Rework "xen-xsm" rules to not have to change directory to run
mkflask.sh, and store mkflask.sh path in a var, and use a full path
for FLASK_H_DEPEND, and output directory is made relative.

Rename "all-y" target to a more descriptive "xen/lib/x86/all".

Removed the "dist" target which was the only one existing in tools/.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v4:
    - new patch

 tools/include/Makefile | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/tools/include/Makefile b/tools/include/Makefile
index b488f7ca9f..81c3d09039 100644
--- a/tools/include/Makefile
+++ b/tools/include/Makefile
@@ -7,17 +7,20 @@ include $(XEN_ROOT)/tools/Rules.mk
 # taken into account, i.e. there should be no rules added here for generating
 # any tools/include/*.h files.
 
-# Relative to $(XEN_ROOT)/xen/xsm/flask
-FLASK_H_DEPEND := policy/initial_sids
+.PHONY: all
+all: xen-foreign xen-dir xen-xsm/.dir
+ifeq ($(CONFIG_X86),y)
+all: xen/lib/x86/all
+endif
 
-.PHONY: all all-y build xen-dir
-all build: all-y xen-foreign xen-dir xen-xsm/.dir
-all-y:
+.PHONY: build
+build: all
 
 .PHONY: xen-foreign
 xen-foreign:
 	$(MAKE) -C xen-foreign
 
+.PHONY: xen-dir
 xen-dir:
 	mkdir -p xen/libelf acpi
 	find xen/ acpi/ -type l -exec rm '{}' +
@@ -36,16 +39,18 @@ ifeq ($(CONFIG_X86),y)
 	ln -s $(XEN_ROOT)/xen/include/xen/lib/x86/Makefile xen/lib/x86/
 endif
 
-all-$(CONFIG_X86): xen-dir
+.PHONY: xen/lib/x86/all
+xen/lib/x86/all: xen-dir
 	$(MAKE) -C xen/lib/x86 all XEN_ROOT=$(XEN_ROOT) PYTHON=$(PYTHON)
 
+MKFLASK := $(XEN_ROOT)/xen/xsm/flask/policy/mkflask.sh
+FLASK_H_DEPEND := $(XEN_ROOT)/xen/xsm/flask/policy/initial_sids
+
 # Not xen/xsm as that clashes with link to
 # $(XEN_ROOT)/xen/include/public/xsm above.
-xen-xsm/.dir: $(XEN_ROOT)/xen/xsm/flask/policy/mkflask.sh \
-	      $(patsubst %,$(XEN_ROOT)/xen/xsm/flask/%,$(FLASK_H_DEPEND))
+xen-xsm/.dir: $(MKFLASK) $(FLASK_H_DEPEND)
 	mkdir -p xen-xsm/flask
-	cd $(XEN_ROOT)/xen/xsm/flask/ && \
-		$(SHELL) policy/mkflask.sh $(AWK) $(CURDIR)/xen-xsm/flask $(FLASK_H_DEPEND)
+	$(SHELL) $(MKFLASK) $(AWK) xen-xsm/flask $(FLASK_H_DEPEND)
 	touch $@
 
 .PHONY: install
@@ -84,8 +89,5 @@ clean:
 	$(MAKE) -C xen-foreign clean
 	rm -f _*.h
 
-.PHONY: dist
-dist: install
-
 .PHONY: distclean
 distclean: clean
-- 
Anthony PERARD


