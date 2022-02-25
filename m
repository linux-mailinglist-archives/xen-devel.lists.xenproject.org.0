Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 260684C4873
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 16:14:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279181.476802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcI1-0007qe-De; Fri, 25 Feb 2022 15:13:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279181.476802; Fri, 25 Feb 2022 15:13:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcI1-0007oF-91; Fri, 25 Feb 2022 15:13:49 +0000
Received: by outflank-mailman (input) for mailman id 279181;
 Fri, 25 Feb 2022 15:13:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E0Ll=TI=citrix.com=prvs=04808661d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nNcHz-0007Bf-CN
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 15:13:47 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86cdaa5e-964d-11ec-8eb9-a37418f5ba1a;
 Fri, 25 Feb 2022 16:13:46 +0100 (CET)
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
X-Inumbo-ID: 86cdaa5e-964d-11ec-8eb9-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645802026;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=g6V0HqnXbYzHAD7EivABin1e8USUEILeVoIQJoAVubg=;
  b=LUl/asu+6prFABHSOjfKWNgbVczUtxNV+ru3MR5lhiXdlowdiD03zc9o
   iBdP1xCDhavmCJ83oYo64bDb2+A8R4txVQ7wwsFz/d0jAA9sA/gjMlbST
   dmaJDtfCZkeNgJS4qlx0B9nRvW3AY9YQgf1UcenIH7bDWWOL0QEuT8pbf
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 64998371
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:kE1Yyqyps4r+weUlnRl6t+dcxirEfRIJ4+MujC+fZmUNrF6WrkUHn
 TYdWmjVPq7YMzHxf4h/a9vj/EhSvcKEzN9qTQE4qCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NYy24XhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplr4Xudz9qB6r2gb4EUkNDLQEnD4tH5+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DNYUDunZm3HfBAOwvW5zrSKTW/95Imjw3g6iiGN6AO
 5tIOWEwNXwsZTVsGGsTBZEYvdyUg2jlUhlAlRGfnKs4tj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKgEXMpmTxCSI9lqoh/TThmXrVYQKDrq6+/V2xlqJyQQu5AY+DAXh56Pj0wjnBowZe
 xd8FjcSQbYa7lX1cOG+ZhqCuSSdv0QHZfoJIcs791TYokbL2DqxCm8BRz9HTdUpss4qWDAnv
 mO0c8PV6S9H6+PMFy/EnluAhXbrYHVOczdeDcMRZVZdu7HeTJcPYgUjpzqJOIq8lZXLFD752
 FhmRwBu1uxI3abnO0hWlG0rYg5ARLCVH2bZBS2NBwpJCz+Vgqb/NuREDnCBsJ59wH6xFAXpg
 ZT9s5H2ABoyJZ+MjjeRZ+4GAauk4f2IWBWF3wIyQMV4q2n1oyb7FWy13N2YDB04WirjUWW0C
 HI/RCsLvMMDVJdURfUfj32N5zQCkvG7SIWNugH8ZdtSeJlhHDJrDwk1DXN8K1vFyRB2+YlmY
 M/zWZ/1UR4yVPQ2pBLrFrx1+eJ6mUgDKZb7GMmTI+KPiuHFOhZ4iN4tbTOzUwzOxPjc8VWNr
 o0GbJPiJtc2eLSWXxQ7OLU7dTgiRUXXz7ivwyCLXoZv+jZbJVw=
IronPort-HdrOrdr: A9a23:azSQoKAQDg4IrJPlHemm55DYdb4zR+YMi2TC1yhKJiC9Ffbo8v
 xG/c5rsiMc5wxxZJhNo7290cq7MBHhHPxOgbX5VI3KNGKNhILBFvAH0WKI+VPd8kPFmtK1rZ
 0QEJRDNA==
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="64998371"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 07/29] tools/helper: Cleanup Makefile
Date: Fri, 25 Feb 2022 15:12:59 +0000
Message-ID: <20220225151321.44126-8-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225151321.44126-1-anthony.perard@citrix.com>
References: <20220225151321.44126-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Use $(TARGETS) to collect targets.
Collect library to link against in $(LDLIBS).
Remove extra "-f" flags that is already part of $(RM).

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/helpers/Makefile | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/tools/helpers/Makefile b/tools/helpers/Makefile
index 7f6c422440..2fe3be2f89 100644
--- a/tools/helpers/Makefile
+++ b/tools/helpers/Makefile
@@ -5,10 +5,10 @@
 XEN_ROOT = $(CURDIR)/../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-PROGS += xen-init-dom0
+TARGETS += xen-init-dom0
 ifeq ($(CONFIG_Linux),y)
 ifeq ($(CONFIG_X86),y)
-PROGS += init-xenstore-domain
+TARGETS += init-xenstore-domain
 endif
 endif
 
@@ -17,6 +17,10 @@ $(XEN_INIT_DOM0_OBJS): CFLAGS += $(CFLAGS_libxentoollog)
 $(XEN_INIT_DOM0_OBJS): CFLAGS += $(CFLAGS_libxenstore)
 $(XEN_INIT_DOM0_OBJS): CFLAGS += $(CFLAGS_libxenlight)
 $(XEN_INIT_DOM0_OBJS): CFLAGS += $(CFLAGS_libxenctrl)
+xen-init-dom0: LDLIBS += $(LDLIBS_libxenctrl)
+xen-init-dom0: LDLIBS += $(LDLIBS_libxentoollog)
+xen-init-dom0: LDLIBS += $(LDLIBS_libxenstore)
+xen-init-dom0: LDLIBS += $(LDLIBS_libxenlight)
 
 INIT_XENSTORE_DOMAIN_OBJS = init-xenstore-domain.o init-dom-json.o
 $(INIT_XENSTORE_DOMAIN_OBJS): CFLAGS += $(CFLAGS_libxentoollog)
@@ -25,27 +29,32 @@ $(INIT_XENSTORE_DOMAIN_OBJS): CFLAGS += $(CFLAGS_libxenctrl)
 $(INIT_XENSTORE_DOMAIN_OBJS): CFLAGS += $(CFLAGS_libxenstore)
 $(INIT_XENSTORE_DOMAIN_OBJS): CFLAGS += $(CFLAGS_libxenlight)
 $(INIT_XENSTORE_DOMAIN_OBJS): CFLAGS += -include $(XEN_ROOT)/tools/config.h
+init-xenstore-domain: LDLIBS += $(LDLIBS_libxentoollog)
+init-xenstore-domain: LDLIBS += $(LDLIBS_libxenstore)
+init-xenstore-domain: LDLIBS += $(LDLIBS_libxenctrl)
+init-xenstore-domain: LDLIBS += $(LDLIBS_libxenguest)
+init-xenstore-domain: LDLIBS += $(LDLIBS_libxenlight)
 
 .PHONY: all
-all: $(PROGS)
+all: $(TARGETS)
 
 xen-init-dom0: $(XEN_INIT_DOM0_OBJS)
-	$(CC) $(LDFLAGS) -o $@ $(XEN_INIT_DOM0_OBJS) $(LDLIBS_libxenctrl) $(LDLIBS_libxentoollog) $(LDLIBS_libxenstore) $(LDLIBS_libxenlight) $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) -o $@ $(XEN_INIT_DOM0_OBJS) $(LDLIBS) $(APPEND_LDFLAGS)
 
 init-xenstore-domain: $(INIT_XENSTORE_DOMAIN_OBJS)
-	$(CC) $(LDFLAGS) -o $@ $(INIT_XENSTORE_DOMAIN_OBJS) $(LDLIBS_libxentoollog) $(LDLIBS_libxenstore) $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(LDLIBS_libxenlight) $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) -o $@ $(INIT_XENSTORE_DOMAIN_OBJS) $(LDLIBS) $(APPEND_LDFLAGS)
 
 .PHONY: install
 install: all
 	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
-	for i in $(PROGS); do $(INSTALL_PROG) $$i $(DESTDIR)$(LIBEXEC_BIN); done
+	for i in $(TARGETS); do $(INSTALL_PROG) $$i $(DESTDIR)$(LIBEXEC_BIN); done
 
 .PHONY: uninstall
 uninstall:
-	for i in $(PROGS); do rm -f $(DESTDIR)$(LIBEXEC_BIN)/$$i; done
+	for i in $(TARGETS); do rm -f $(DESTDIR)$(LIBEXEC_BIN)/$$i; done
 
 .PHONY: clean
 clean:
-	$(RM) -f *.o $(PROGS) $(DEPS_RM)
+	$(RM) *.o $(TARGETS) $(DEPS_RM)
 
 distclean: clean
-- 
Anthony PERARD


