Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0406E4C4870
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 16:14:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279190.476875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcIC-0001mW-3B; Fri, 25 Feb 2022 15:14:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279190.476875; Fri, 25 Feb 2022 15:14:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcIB-0001bi-Rw; Fri, 25 Feb 2022 15:13:59 +0000
Received: by outflank-mailman (input) for mailman id 279190;
 Fri, 25 Feb 2022 15:13:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E0Ll=TI=citrix.com=prvs=04808661d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nNcI8-0007Bf-Si
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 15:13:56 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b94b611-964d-11ec-8eb9-a37418f5ba1a;
 Fri, 25 Feb 2022 16:13:55 +0100 (CET)
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
X-Inumbo-ID: 8b94b611-964d-11ec-8eb9-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645802035;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=06doEHilS6AKmsVA0dHPUnjlMaGNmuuqrJF1JZCOe3k=;
  b=Ssfq5I8RyMaki5CLdenUAzYmHgnkW5QMIuMss+cZexCDkhLM9oaw4rRE
   U4Xf9m7231yK2CTlZd7X3Wbz+dR89K4HaIqDz+h/0IuIix02vEEuvLPOX
   nHYtnlEwRmWPZTMeRtd6TUz21HxifgFCX96hA/an9pf0z7um9KDNF9Iop
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 64890254
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:EPQnR6gvCnA1+n0BGDUxZttuX161CxAKZh0ujC45NGQN5FlHY01je
 htvCD/TM67ZZDH2f9tzat/g80sA6pSEmIAwSgFrqSAyQiIb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhWVnQ4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YVd3MpXTivssahJRHAI9Aal58uf9LVHq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bknhm0THeC+dgWZ3ZSr/GzdRZwC0xloZFGvO2i
 88xN2Y/PUyaPkEn1lE/MtEBmLqWgUvFWgJogxGeg4ce/mH65VkkuFTqGIWMIYHbLSlPpW6Ho
 krW8mK/BQsVXPSPxDzA/n+yi+vnmSLgRJlUBLC+7uRtglCY2ioUEhJ+aLegiaDn0AjkAYsZc
 hFKvHp1xUQvyKC1ZomjUyWnsmG1hxUVVPkTL+kF4lm3xoOBtm51GVM4ZjJGbdUnsuo/Sjory
 kKFkrvVONB/jFGGYSnDr+nJ9FteLQBQdDZfPnFcEWPp9vG++Nlbs/7Zcjp0/EdZZPXRECq4/
 T2FpTNWa1473Z9SjPXTEbwqbluRSnn1ouwdulS/soGNtFoRiGuZi2qAswmzARFodtvxc7V5l
 CJY8/VyFchXZX13qASDQf8WAJai7OufPTvXjDZHRsd9qmvxoiL+JdgIuFmSwXuF1O5eKFcFh
 2eJ5GtsCGJ7ZiP2PcebnarrYyjV8UQQPYu8Da2FBja/SpNwaBWG7ElTib24hAjQfLwXufhnY
 /+zKJ/0ZV5DUPgP5GfmFo81jO5wrghjlDy7eHwO50n+uVZoTCXOEult3ZrnRr1R0Z5oVy2Oq
 4cPb5bRkk4HOAA8CwGOmbMuwZkxBSBTLfjLRwZ/LIZv/iIO9LkdNsLs
IronPort-HdrOrdr: A9a23:M4+jDK1C+nj0VAtkpVbo/QqjBIokLtp133Aq2lEZdPRUGvb3qy
 nIpoV86faUskdoZJhOo7C90cW7LU80sKQFhLX5Xo3SOzUO2lHYT72KhLGKq1aLdhEWtNQtsZ
 uIG5IOceEYZmIasS+V2maF+q4bsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="64890254"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 12/29] tools/xentop: rework makefile
Date: Fri, 25 Feb 2022 15:13:04 +0000
Message-ID: <20220225151321.44126-13-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225151321.44126-1-anthony.perard@citrix.com>
References: <20220225151321.44126-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add "xentop" to "TARGETS" because this variable will be useful later.

Always define all the targets, even when configured with
--disable-monitor, instead don't visit the subdirectory.
This mean xentop/ isn't visited anymore during "make clean" that's how
most other subdirs in the tools/ works.

Also add missing "xentop" rules. It only works without it because we
still have make's built-ins rules and variables, but fix this to not
have to rely on them.

Use $(TARGETS) with $(INSTALL_PROG), and thus install into the
directory rather than spelling the program name.

In the "clean" rule, use $(RM) and remove all "*.o" instead of just
one object.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v2:
    - use $(RM) in clean.
    - remove all *.o instead of just one object in "clean" rule.
    - in "install" rule, make use of $(TARGETS). install into a dir rather
      than to a specific path, in case there's more targets.

 tools/Makefile        |  2 +-
 tools/xentop/Makefile | 21 +++++++++------------
 2 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/tools/Makefile b/tools/Makefile
index 79b4c7e3de..0c1d8b64a4 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -17,7 +17,7 @@ SUBDIRS-$(CONFIG_XCUTILS) += xcutils
 SUBDIRS-$(CONFIG_X86) += firmware
 SUBDIRS-y += console
 SUBDIRS-y += xenmon
-SUBDIRS-y += xentop
+SUBDIRS-$(XENSTAT_XENTOP) += xentop
 SUBDIRS-y += libfsimage
 SUBDIRS-$(CONFIG_Linux) += vchan
 
diff --git a/tools/xentop/Makefile b/tools/xentop/Makefile
index 0034114684..7bd96f34d5 100644
--- a/tools/xentop/Makefile
+++ b/tools/xentop/Makefile
@@ -13,36 +13,33 @@
 XEN_ROOT=$(CURDIR)/../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-ifneq ($(XENSTAT_XENTOP),y)
-.PHONY: all install xentop uninstall
-all install xentop uninstall:
-else
-
 CFLAGS += -DGCC_PRINTF -Werror $(CFLAGS_libxenstat)
 LDLIBS += $(LDLIBS_libxenstat) $(CURSES_LIBS) $(TINFO_LIBS) $(SOCKET_LIBS) -lm
 CFLAGS += -DHOST_$(XEN_OS)
 
 # Include configure output (config.h)
 CFLAGS += -include $(XEN_ROOT)/tools/config.h
-LDFLAGS += $(APPEND_LDFLAGS)
+
+TARGETS := xentop
 
 .PHONY: all
-all: xentop
+all: $(TARGETS)
+
+xentop: xentop.o
+	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS) $(APPEND_LDFLAGS)
 
 .PHONY: install
-install: xentop
+install: all
 	$(INSTALL_DIR) $(DESTDIR)$(sbindir)
-	$(INSTALL_PROG) xentop $(DESTDIR)$(sbindir)/xentop
+	$(INSTALL_PROG) $(TARGETS) $(DESTDIR)$(sbindir)
 
 .PHONY: uninstall
 uninstall:
 	rm -f $(DESTDIR)$(sbindir)/xentop
 
-endif
-
 .PHONY: clean
 clean:
-	rm -f xentop xentop.o $(DEPS_RM)
+	$(RM) *.o $(TARGETS) $(DEPS_RM)
 
 .PHONY: distclean
 distclean: clean
-- 
Anthony PERARD


