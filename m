Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E9C559E0A
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 18:05:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355611.583442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lnh-0007dm-Qm; Fri, 24 Jun 2022 16:04:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355611.583442; Fri, 24 Jun 2022 16:04:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lnh-0007YT-JZ; Fri, 24 Jun 2022 16:04:53 +0000
Received: by outflank-mailman (input) for mailman id 355611;
 Fri, 24 Jun 2022 16:04:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7mLY=W7=citrix.com=prvs=16756bcf7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1o4lnf-0004qb-Bx
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 16:04:51 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f689afe-f3d7-11ec-bd2d-47488cf2e6aa;
 Fri, 24 Jun 2022 18:04:50 +0200 (CEST)
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
X-Inumbo-ID: 5f689afe-f3d7-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656086690;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=06doEHilS6AKmsVA0dHPUnjlMaGNmuuqrJF1JZCOe3k=;
  b=M392P2F8vHceH75PhI2aXuB9FTGIEnHWqlm6emfUcPvsJhII8Vy9WvHi
   8sWeEZJ6dVXB9mLG3DSPs6MP9Uh1UoT9nbsamKSH71epL5yB47l1j+scZ
   7kUW6YPk+gy+akZuAUJelKjb3uWM7tZCOgVW0fvz9/18/E4Rz/oPWW2dk
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 74384185
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:9k7tQqv6Z6iLx6UJV8NT3JcTVufnVB9eMUV32f8akzHdYApBsoF/q
 tZmKWGGOfeKY2KkfIp1bI208x9T7ZOHxtc1G1NopHg9RSxB+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQywYbVvqYy2YLjW13X5
 YuoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8oPbCRifgaWiMFHh9xfp1F5OPKIVWG5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvllpyy3ZCvA3B4jOWazQ6fdT3Ssqh9AIFvHbD
 yYcQWUzN0ScOk0SUrsRIJkhsPuFt2uuTwYbiVTWuKNt3zPOzRMkhdABN/KKI4fXFK25hH2wu
 Wbu72n/RBYAO7S32TeDt36hmOLLtSf6Q54JUq218OZwh1+ezXBVDwcZPWZXutHg1BT4AYgGb
 RVJpGx+9sDe6XBHUPH8XADlsWKDtyRBVuRfUN059F2AyofttlPx6nc/ctJRVDA3nJZoGGJyj
 QLRwIOB6S9H6+PMFy/EnluAhXbrYHVOczdfDcMRZVFdi+QPtr3fmf4mojxLNKeuxuP4Fjjrq
 9xhhHhv3u5D5SLnOkjSwLwmv95PjsKQJuLNzl+LNl9JFysgDGJfW6Sm6ELA8dFLJ5uDQ1+Ks
 RAswpbDsrhWXMjSyHTVH43h+Y1FAd7faFUwZnY/d6TNChz3oyLzFWyuyGsWyLhV3jYsJmayP
 R67VfJ5755PJnq6BZJKj3aKI51yl8DITI29PtiNN4YmSsUhJWevoXA1DWbNjj+FraTZufxmU
 XttWZ33Vihy5GUO5GfeetrxJpdxl35nmz+MFMulp/lluJLHDEOopX4+GAPmRogEAGms+m05L
 /432xO29ihi
IronPort-HdrOrdr: A9a23:3Z4m0atrXF3O64HgX2SeRV7I7skDcNV00zEX/kB9WHVpmszxra
 +TdZMgpHjJYVcqKQgdcL+7WZVoLUmwyXcx2/hyAV7AZniDhILLFuFfBOLZqlWKcREWtNQtsJ
 uIG5IObuEYZmIVsS+V2mWF+q4bsbq6zJw=
X-IronPort-AV: E=Sophos;i="5.92,218,1650945600"; 
   d="scan'208";a="74384185"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v3 10/25] tools/xentop: rework makefile
Date: Fri, 24 Jun 2022 17:04:07 +0100
Message-ID: <20220624160422.53457-11-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624160422.53457-1-anthony.perard@citrix.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
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


