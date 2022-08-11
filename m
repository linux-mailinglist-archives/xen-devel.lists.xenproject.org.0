Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BD859050E
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 18:49:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384789.620304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBMr-0004mA-OG; Thu, 11 Aug 2022 16:49:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384789.620304; Thu, 11 Aug 2022 16:49:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBMr-0004e3-Il; Thu, 11 Aug 2022 16:49:09 +0000
Received: by outflank-mailman (input) for mailman id 384789;
 Thu, 11 Aug 2022 16:49:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jhQd=YP=citrix.com=prvs=21531f474=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oMBMp-0003s9-Oo
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 16:49:07 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83148bdf-1995-11ed-924f-1f966e50362f;
 Thu, 11 Aug 2022 18:49:06 +0200 (CEST)
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
X-Inumbo-ID: 83148bdf-1995-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660236545;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oiMxhY9aNAuabaL1poisWXh5+cq7pv8wOKvWKuB/m94=;
  b=R3jt1ro69G6fAqc79zHZ0N3saSgB98WWnMWfjoGdOkOgehzfzENO0Stv
   DYvFUB1O4toi9tH0LgGHciVM0tUzelnA5TS7GCZn5wprhYrVNZG5rpNiF
   060j4mSLhKyFz4jAdP0psrmq3rB/1BKDI9KqqYVZoTjiKkZPilWFyXZVk
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 78334323
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:YWYn3qjcjDODML9NnKEhr1iUX161ChAKZh0ujC45NGQN5FlHY01je
 htvW2+Ba6qPZWf0c9ElPYuzoB8AuZfTz95kHgo5qCszFysb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6j+fQLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglaQr414rZ8Ek15KSr4WtC1rADTasjUGH2xiF94K03fcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aua60Tqm0xK6aID76vR2nQQg075TCRYpQRw/ZwNlPTxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJQWXAP6I0DuKhPRL/tS4E4eM6IS0OlyX25yz
 OUyKTsBVE+Bqe2s3+fuIgVsrpxLwMjDOYoevjdrzC3DDOZgSpfGK0nIzYYGhnFq3JkIRKuAI
 ZpCAdZsRE2ojxlnM1ELCJU4jaGwi2P2aTFwo1OJv6snpWPUyWSd1ZCyYIGOJofQHq25mG6Al
 j7m8ifTPSsoMc2t5hy/7C+u19X2yHaTtIU6S+Tjq68CbEeo7nMXIA0bUx28u/bRokqjUNsZJ
 UUS8ScqqbUa/VauCNL6WnWQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3PLaXhRzi
 AXPxYmwQ2Uy7vvFEhpx64t4sxu8FiI/ImpcahM9VCEE6NXZ/4MdgQjQG4ML/LGOsjHlJd3h6
 2nU8nBm1upK1JBjO7aTpg6e3W/1znTdZktsv1iMADr4hu9sTNT9D7FE/2Q3+hqpwGyxalCa9
 EYJlMGFhAzlJcHczXfdKAnh8VzA2hpkDNE/qQQ2d3XZ327xk0NPhKgJiN2EGG9nM9wfZRjia
 1LJtAVa6fd7ZSX0NfcoO9vgW5lwl8AM8OgJsdiKBuein7ArLFPXlM2QTRf4M5/RfLgEzvhkZ
 MbznTeEBncGE6V3pAeLqxMm+eZynkgWmDKMLa0XOjz9jtJyklbJFupeWLZPB8hlhJ65TPL9r
 48Da5fXkEUDCYUToED/qOYuELzDFlBjbbieliCdXrXrztZOcI35N8Ls/A==
IronPort-HdrOrdr: A9a23:jtS076zDTBAGJb3Vc5voKrPwFL1zdoMgy1knxilNoRw8SKKlfq
 eV7ZImPH7P+U4ssR4b+exoVJPtfZqYz+8R3WBzB8bEYOCFghrKEGgK1+KLqFeMJ8S9zJ846U
 4JSdkGNDSaNzlHZKjBjzVQa+xQouW6zA==
X-IronPort-AV: E=Sophos;i="5.93,230,1654574400"; 
   d="scan'208";a="78334323"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Luca Fancellu
	<luca.fancellu@arm.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v4 07/32] tools/xentop: rework makefile
Date: Thu, 11 Aug 2022 17:48:20 +0100
Message-ID: <20220811164845.38083-8-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220811164845.38083-1-anthony.perard@citrix.com>
References: <20220811164845.38083-1-anthony.perard@citrix.com>
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
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
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


