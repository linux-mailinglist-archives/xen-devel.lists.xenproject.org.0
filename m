Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7044B4C486C
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 16:14:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279178.476770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcHt-0006xz-AF; Fri, 25 Feb 2022 15:13:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279178.476770; Fri, 25 Feb 2022 15:13:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcHt-0006vd-6e; Fri, 25 Feb 2022 15:13:41 +0000
Received: by outflank-mailman (input) for mailman id 279178;
 Fri, 25 Feb 2022 15:13:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E0Ll=TI=citrix.com=prvs=04808661d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nNcHr-0006fy-1B
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 15:13:39 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81401bbd-964d-11ec-8539-5f4723681683;
 Fri, 25 Feb 2022 16:13:38 +0100 (CET)
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
X-Inumbo-ID: 81401bbd-964d-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645802017;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e4dSMew7ThkfUT4VBhxHq8D2hkxwuVvIslum+Yj9ZTA=;
  b=ZFdXX2wSzk61xpbrtkxhazU3pLODbgJyrkpmt0aORNUirUMtjbJ93W0X
   RAJDtAF1W7n3UMETtbCwA6eGSGZH5sb6vjisIQgL++kYSO0zvmN4f1JAW
   /SFfrqjxfX4/96Os9zGKRTweuWSwmQhhdPORnvTGWym7fEZ00dgMJsM8B
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 64890228
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:+mI2eKNid+sPdhzvrR3Ol8FynXyQoLVcMsEvi/4bfWQNrUoi0TEPz
 jZKWjjUOPmCY2HyLo11aI7k9EkFvZ/XydUwTQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZj2NMw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z5
 8lIiZi8WBcQYY7hmcEQAl5JFjtvBPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gQQaaPP
 5BDOVKDajz+Yz9pKE8mVal9t/mNuUfSIhBRgnG88P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u13T0BFQWOcKSzRKB82mwnanfkCXjQoUQGbaksPlwjzWuKnc7UUNMEwHh+L/g1xD4C4k3x
 1EoFjQGgrQ3yEinX8nEAD6VoVuJ71kNXsBBKrhvgO2S8Zb87wGcD2kCazdObt06qcM7LQAXO
 k+1c8DBXmI27uDMIZ6J3vLN9G7pZ3BJRYMXTXJcFWM4D8/fTJbfZ/4lZvJqC+aLg9L8AlkcK
 Bja/XFl193/YSPmvphXHGwrYRrw9/AlrSZvv207u15JCCsjNeZJgKTytDDmAQ5odtrxc7V4l
 CFsdzKixO4PF4qRsyeGXf8AGrqkj97cbmGB3gI2Q8R5r2z1k5JGQWy2yGsvTKuOGpxZEQIFn
 WeJ4V8BjHOtFCHCgVBLj3KZVJ1xkPmI+SXNXfHIdNteCqWdhyfclByCkXW4hji3+GB1yPlXE
 c7CLa6EUCZLYYw6nWHeb7pMjtcWKtUWmDq7qWbTlE/8j9JzpRe9FN84Dbd5RrthvfPc/V6Mq
 I432gnj40w3bdASqxL/qeY7RW3m51BgbXwqg6S7rtK+Hzc=
IronPort-HdrOrdr: A9a23:otMmpqBLcDW9H/DlHemq55DYdb4zR+YMi2TC1yhKJiC9Ffbo8P
 xG/c5rrCMc5wxxZJhNo7290ey7MBHhHP1OkO0s1NWZPDUO0VHAROoJ0WKh+UyEJ8SXzJ866U
 4KScZD4bPLYWSS9fyKgzWFLw==
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="64890228"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 03/29] tools/examples: cleanup Makefile
Date: Fri, 25 Feb 2022 15:12:55 +0000
Message-ID: <20220225151321.44126-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225151321.44126-1-anthony.perard@citrix.com>
References: <20220225151321.44126-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Don't check if a target exist before installing it. For directory,
install doesn't complain, and for file it would prevent from updating
them. Also remove the existing loop and instead install all files with
a single call to $(INSTALL_DATA).

Remove XEN_CONFIGS-y which isn't used.

Remove "build" target.

Add an empty line after the first comment. The comment isn't about
$(XEN_READMES), it is about the makefile as a whole.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v2:
    - remove existing loops in install targets and use a single call to
      $(INSTALL_DATA) to install multiple files.

 tools/examples/Makefile | 25 ++++++-------------------
 1 file changed, 6 insertions(+), 19 deletions(-)

diff --git a/tools/examples/Makefile b/tools/examples/Makefile
index 14e24f4cb3..c839bf5603 100644
--- a/tools/examples/Makefile
+++ b/tools/examples/Makefile
@@ -2,6 +2,7 @@ XEN_ROOT = $(CURDIR)/../..
 include $(XEN_ROOT)/tools/Rules.mk
 
 # Xen configuration dir and configs to go there.
+
 XEN_READMES = README
 
 XEN_CONFIGS += xlexample.hvm
@@ -10,14 +11,9 @@ XEN_CONFIGS += xlexample.pvhlinux
 XEN_CONFIGS += xl.conf
 XEN_CONFIGS += cpupool
 
-XEN_CONFIGS += $(XEN_CONFIGS-y)
-
 .PHONY: all
 all:
 
-.PHONY: build
-build:
-
 .PHONY: install
 install: all install-readmes install-configs
 
@@ -26,12 +22,8 @@ uninstall: uninstall-readmes uninstall-configs
 
 .PHONY: install-readmes
 install-readmes:
-	[ -d $(DESTDIR)$(XEN_CONFIG_DIR) ] || \
-		$(INSTALL_DIR) $(DESTDIR)$(XEN_CONFIG_DIR)
-	set -e; for i in $(XEN_READMES); \
-	    do [ -e $(DESTDIR)$(XEN_CONFIG_DIR)/$$i ] || \
-	    $(INSTALL_DATA) $$i $(DESTDIR)$(XEN_CONFIG_DIR); \
-	done
+	$(INSTALL_DIR) $(DESTDIR)$(XEN_CONFIG_DIR)
+	$(INSTALL_DATA) $(XEN_READMES) $(DESTDIR)$(XEN_CONFIG_DIR)
 
 .PHONY: uninstall-readmes
 uninstall-readmes:
@@ -39,14 +31,9 @@ uninstall-readmes:
 
 .PHONY: install-configs
 install-configs: $(XEN_CONFIGS)
-	[ -d $(DESTDIR)$(XEN_CONFIG_DIR) ] || \
-		$(INSTALL_DIR) $(DESTDIR)$(XEN_CONFIG_DIR)
-	[ -d $(DESTDIR)$(XEN_CONFIG_DIR)/auto ] || \
-		$(INSTALL_DIR) $(DESTDIR)$(XEN_CONFIG_DIR)/auto
-	set -e; for i in $(XEN_CONFIGS); \
-	    do [ -e $(DESTDIR)$(XEN_CONFIG_DIR)/$$i ] || \
-	    $(INSTALL_DATA) $$i $(DESTDIR)$(XEN_CONFIG_DIR); \
-	done
+	$(INSTALL_DIR) $(DESTDIR)$(XEN_CONFIG_DIR)
+	$(INSTALL_DIR) $(DESTDIR)$(XEN_CONFIG_DIR)/auto
+	$(INSTALL_DATA) $(XEN_CONFIGS) $(DESTDIR)$(XEN_CONFIG_DIR)
 
 .PHONY: uninstall-configs
 uninstall-configs:
-- 
Anthony PERARD


