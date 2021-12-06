Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F6D46A271
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:09:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239533.415504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHU2-0008D6-Ey; Mon, 06 Dec 2021 17:08:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239533.415504; Mon, 06 Dec 2021 17:08:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHU1-0007vE-KS; Mon, 06 Dec 2021 17:08:57 +0000
Received: by outflank-mailman (input) for mailman id 239533;
 Mon, 06 Dec 2021 17:08:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHP0-0005ti-J6
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:03:46 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76fafa5b-56b6-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 18:03:44 +0100 (CET)
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
X-Inumbo-ID: 76fafa5b-56b6-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810224;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ix7uXYCPxugAAtLthbMjrkXsWY6ZoE/GgEwLTETP25c=;
  b=HkuGhOiQBrLNYJa4UIkLEKTPPtJUsvjCuMKRN80MengjAkbJQP3vt0j0
   6Bhd6+WI0qBTim5Z2LISx6bNS/9fYMLqQUAF9EeZM1Otxt0P8YJiqifFF
   wk7Bz8qLhTcNebpBRasxGqBs3DMMh2PtTSPXr8E4qEuY+Hnv/FolyhSdO
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: W+6FDTCdqCvWJA91+Gi73joeTWqDf7MYYkzAqMOaROaKbqtY4oGOrlJaoLwkdkhkjx9LCLRdY6
 /yhNcqoBH5dyxVqiUkM8e/6ilOJv11Zk7h/U8Rj5S0gB6S5ogZuiert7E486DpnXZF0wG0Ep2g
 DIsjyLrXsjdd8ai2RPdYwnJ7bW5F25bnp6CoxhO1wAnz8PplF21Tl8aKPBWLQfXYwXzivpIzzf
 8+8Nglt8SK8xnTXr8yVGKPh1jcAcw8OlzcFEJTGyXQipi/FWRo9hHgi3ABt9ht3RJOy+IbSrYe
 VG1CGlsFL9cOnNQcQFsTL/w6
X-SBRS: 5.1
X-MesageID: 59370634
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:sdDexa7J3WzLRb1HIZpuEQxRtN7AchMFZxGqfqrLsTDasY5as4F+v
 mROWm+CM/eDM2emc9l1PNzlpksH7JfUndNlGQA5qC5nHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVAMpBsJ00o5wrdj2tAw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zy
 cgWk6bzcCwVLvPIvedMSiYIHhFFBPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gTTK2BP
 5RCNVKDajzwIEEeGlIHJK4Mjby6tlvkWRRSqlK88P9fD2/7k1UqjemF3MDuUt2VR+1Fk0CAv
 GXE8m/lRBYAO7S31j6t4n+qwOjVkkvTSI8UUbG16PNuqFmS3XAITg0bU0Ohpvu0gVL4XMhQQ
 2Qd/DYuqq4jslSmVNDnUzW3pXeFulgXXN84LgEhwFjTkOyOuV/fXzVaCG4aADA7iCMobT03j
 Xmz3OrCOSwxtJiWGGuiprqklgrnbED5MlQ+TSMDSAIE5fzqr4cykg/DQ75fLUKlsjHmMWqum
 m7X9UDSk51W1JdWjPvjoTgrlhr1/sCRJjPZ8Dk7SY5MAulRQIe+L7Kl5lHAhRqrBNbIFwLR1
 JTodiX30QzvMX1vvHHUKAnuNOvwjxpgDNE6qQQ1d3XG327yk0NPhagKvFlDyL5Ba67ogwPBb
 k7Joh9275ROJnasZqIfS9vvUJR1l/m9T467CaC8gj9yjn5ZLlXvEMZGPxH44owQuBJ0zfFX1
 WmzL65A8kr2+Yw4lWHrFo/xIJcgxzwkxHO7eHwI50/P7FZqX1bMEe1tGALXNogRtfrYyC2Io
 4c3H5bbkH13DbyhChQ7BKZOdDjm21BgXsuowyGWH8beSjdb9JYJV6WMnOh/ItM9xMy4VI7gp
 xmAZ6OR83Kn7VWvFOlAQikLhGrHUcktoHQlEzYrOFr0iXEvbZz2tPUUdoctfKlh/+tmlKYmQ
 /4AcsSGI/JOVjWYpGhNMcij9NRvJEaxmAaDHyu5ezxjLZRucBPEp43/dQz1+ShQUifu7Zkio
 6et3x/wSIYYQ1gwF97fbf+ilgvjvXUUlO9ocVHPJ91fJBfl/IRwcnSjhf4rOcAcbx7Ew2LCh
 QqRBB4Zo8jLopM0r4aV1fzV8d/xHrInTERAHmTd4bKnDgXg/zKukd1aTeKFXTHBT2eoqq+sU
 vpYkqPnO/odkVcU74clS+R3zbgz7sfErqNBylg2B23CalmmB+8yInSC2sUT5KRByqUA5FmzU
 0OLvNJbJa+IKIXuF1tIfFgpaeGK1Pc1nDjO7KtqfBWmtXEvpLfXA19POxSsiTBGKOonOYwo9
 u4tpcoK5lHtkREtKNuH0nhZ+mnkwqbsiEn7WkX22LPWtzc=
IronPort-HdrOrdr: A9a23:gyIN6KDA4wJph53lHemq55DYdb4zR+YMi2TC1yhKJiC9Ffbo8P
 xG/c5rrCMc5wxxZJhNo7290ey7MBHhHP1OkO0s1NWZPDUO0VHAROoJ0WKh+UyEJ8SXzJ866U
 4KScZD4bPLYWSS9fyKgzWFLw==
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="59370634"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH 25/57] tools/examples: cleanup Makefile
Date: Mon, 6 Dec 2021 17:02:08 +0000
Message-ID: <20211206170241.13165-26-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Don't check if a target exist before installing it. For directory,
install doesn't complain, and for file it would prevent from updating
them.

Remove XEN_CONFIGS-y which isn't used.

Remove "build" target.

Add an empty line after the first comment. The comment isn't about
$(XEN_READMES), it is about the makefile as a whole.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/examples/Makefile | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/tools/examples/Makefile b/tools/examples/Makefile
index 14e24f4cb3..48b520e133 100644
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
 
@@ -26,10 +22,8 @@ uninstall: uninstall-readmes uninstall-configs
 
 .PHONY: install-readmes
 install-readmes:
-	[ -d $(DESTDIR)$(XEN_CONFIG_DIR) ] || \
-		$(INSTALL_DIR) $(DESTDIR)$(XEN_CONFIG_DIR)
-	set -e; for i in $(XEN_READMES); \
-	    do [ -e $(DESTDIR)$(XEN_CONFIG_DIR)/$$i ] || \
+	$(INSTALL_DIR) $(DESTDIR)$(XEN_CONFIG_DIR)
+	set -e; for i in $(XEN_READMES); do \
 	    $(INSTALL_DATA) $$i $(DESTDIR)$(XEN_CONFIG_DIR); \
 	done
 
@@ -39,12 +33,9 @@ uninstall-readmes:
 
 .PHONY: install-configs
 install-configs: $(XEN_CONFIGS)
-	[ -d $(DESTDIR)$(XEN_CONFIG_DIR) ] || \
-		$(INSTALL_DIR) $(DESTDIR)$(XEN_CONFIG_DIR)
-	[ -d $(DESTDIR)$(XEN_CONFIG_DIR)/auto ] || \
-		$(INSTALL_DIR) $(DESTDIR)$(XEN_CONFIG_DIR)/auto
-	set -e; for i in $(XEN_CONFIGS); \
-	    do [ -e $(DESTDIR)$(XEN_CONFIG_DIR)/$$i ] || \
+	$(INSTALL_DIR) $(DESTDIR)$(XEN_CONFIG_DIR)
+	$(INSTALL_DIR) $(DESTDIR)$(XEN_CONFIG_DIR)/auto
+	set -e; for i in $(XEN_CONFIGS); do \
 	    $(INSTALL_DATA) $$i $(DESTDIR)$(XEN_CONFIG_DIR); \
 	done
 
-- 
Anthony PERARD


