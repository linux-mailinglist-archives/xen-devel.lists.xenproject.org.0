Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BED67559E07
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 18:05:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355604.583357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lnZ-0005Kv-EX; Fri, 24 Jun 2022 16:04:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355604.583357; Fri, 24 Jun 2022 16:04:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lnZ-0005G9-8u; Fri, 24 Jun 2022 16:04:45 +0000
Received: by outflank-mailman (input) for mailman id 355604;
 Fri, 24 Jun 2022 16:04:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7mLY=W7=citrix.com=prvs=16756bcf7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1o4lnX-0004qb-4T
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 16:04:43 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b111485-f3d7-11ec-bd2d-47488cf2e6aa;
 Fri, 24 Jun 2022 18:04:41 +0200 (CEST)
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
X-Inumbo-ID: 5b111485-f3d7-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656086681;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=X2aENXxRDTAvXRj798ueb4NLH5aVs5M0JBRhVknZte8=;
  b=ClH0kvo4KWT9e2A7r9j16XV0jbMcL3LF/JMm5WwQvBma3xrDRMGVnMIB
   McTVEtvGsIi/A34gmkNST27LPlkbFX8jq+c2QOV7Q9FsK4IjB139Ikr4M
   vf2/8cxq0pXuak6cpX5vWuz97UdnfvsUVbcvzouNPAKCxXsYLcENqxRM3
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 73701974
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:qskwaqq/lrIITC6px2G7gZflUrpeBmIaZRIvgKrLsJaIsI4StFCzt
 garIBnTb6yLYGL3KY9xPo7goEMHv5bQn9UyHgU6ry09EipB8JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrRRbrJA24DjWVvT4
 4+q+aUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBN4T0l9s2YQVjEgZVA/BtoJnGIELhvpnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVIxDfFDfEgUNbbTr/D/9Nw1zYsnMFeW/3ZY
 qL1bBIwN0uYOkwQZj/7DroYh9W22WKidgZbrV3MlfMU5nDV9ANIhe2F3N39JYXRGJQ9clyjj
 nnd423zDxUeNdqe4TmI6HShgqnIhyyTcJ0WPK218LhtmlL77m4ODBwbU3OrrP//jVSxM/pPJ
 kpR9icwoKwa8E2wUsK7TxC+uGSDvBMXR5xXCeJSwAOHx7fQ4g2ZLnMZVTMHY9sj3PLaXhRzi
 AXPxYmwQ2Uy7vvFEhpx64t4sxu7EBAaEkQweRQFaiA7vvK7hoAytEzAG4ML/LGOsjHlJd3h6
 2nU8XZm3OhL0p5jO7aTpg6e3W/1znTdZktsv1iMADr4hu9sTNT9D7FE/2Q3+hqpwGyxalCa9
 EYJlMGFhAzlJcHczXfdKAnh8VzA2hpkDNE/qQQ2d3XZ327xk0NPhKgJiN2EGG9nM9wfZRjia
 1LJtAVa6fd7ZSX3M/cvMtvuV5xyksAM8OgJsNiONrKihbAhHDJrAQk0PRLAt4wTuBJEfV4D1
 WezLp/3UCdy5VVPxzuqXeYNuYIWKtQF7TqLH/jTlk3/uZLHPSL9YepVYTOmM7FihIvZ8Vq9z
 jqqH5bTo/mpeLalOXe/HE96BQ1iEEXX8ris+pIOKLLcc1E4cIzjYteIqY4cl0Vet/w9vo/1E
 ruVAye0FHKXaaX7FDi3
IronPort-HdrOrdr: A9a23:ZnLoSq9EDDm87aa0KI1uk+DeI+orL9Y04lQ7vn2YSXRuHfBw8P
 re+8jztCWE8Qr5N0tApTntAsS9qDbnhPxICOoqTNOftWvd2FdARbsKheCJ/9SjIVyaygc079
 YHT0EUMrPN5DZB4foSmDPIcOod/A==
X-IronPort-AV: E=Sophos;i="5.92,218,1650945600"; 
   d="scan'208";a="73701974"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v3 01/25] tools/console: have one Makefile per program/directory
Date: Fri, 24 Jun 2022 17:03:58 +0100
Message-ID: <20220624160422.53457-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624160422.53457-1-anthony.perard@citrix.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Sources of both xenconsoled and xenconsole are already separated into
different directory and don't share anything in common. Having two
different Makefile means it's easier to deal with *FLAGS.

Some common changes:
Rename $(BIN) to $(TARGETS), this will be useful later.
Stop removing *.so *.rpm *.a as they aren't created here.
Use $(OBJS-y) to list objects.
Update $(CFLAGS) for the directory rather than a single object.

daemon:
    Remove the need for $(LDLIBS_xenconsoled), use $(LDLIBS) instead.
    Remove the need for $(CONSOLE_CFLAGS-y) and use $(CFLAGS-y)
	instead.

client:
    Remove the unused $(LDLIBS_xenconsole)

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v2:
    - create per-directory .gitignore

 tools/console/Makefile          | 49 ++------------------------------
 tools/console/client/Makefile   | 39 +++++++++++++++++++++++++
 tools/console/daemon/Makefile   | 50 +++++++++++++++++++++++++++++++++
 .gitignore                      |  2 --
 tools/console/client/.gitignore |  1 +
 tools/console/daemon/.gitignore |  1 +
 6 files changed, 94 insertions(+), 48 deletions(-)
 create mode 100644 tools/console/client/Makefile
 create mode 100644 tools/console/daemon/Makefile
 create mode 100644 tools/console/client/.gitignore
 create mode 100644 tools/console/daemon/.gitignore

diff --git a/tools/console/Makefile b/tools/console/Makefile
index 207c04c9cd..63bd2ac302 100644
--- a/tools/console/Makefile
+++ b/tools/console/Makefile
@@ -1,50 +1,7 @@
 XEN_ROOT=$(CURDIR)/../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-CFLAGS  += -Werror
+SUBDIRS-y := daemon client
 
-CFLAGS  += $(CFLAGS_libxenctrl)
-CFLAGS  += $(CFLAGS_libxenstore)
-LDLIBS += $(LDLIBS_libxenctrl)
-LDLIBS += $(LDLIBS_libxenstore)
-LDLIBS += $(SOCKET_LIBS)
-
-LDLIBS_xenconsoled += $(UTIL_LIBS)
-LDLIBS_xenconsoled += -lrt
-CONSOLE_CFLAGS-$(CONFIG_ARM) = -DCONFIG_ARM
-
-BIN      = xenconsoled xenconsole
-
-.PHONY: all
-all: $(BIN)
-
-.PHONY: clean
-clean:
-	$(RM) *.a *.so *.o *.rpm $(BIN) $(DEPS_RM)
-	$(RM) client/*.o daemon/*.o
-
-.PHONY: distclean
-distclean: clean
-
-daemon/main.o: CFLAGS += -include $(XEN_ROOT)/tools/config.h
-daemon/io.o: CFLAGS += $(CFLAGS_libxenevtchn) $(CFLAGS_libxengnttab) $(CFLAGS_libxenforeignmemory) $(CONSOLE_CFLAGS-y)
-xenconsoled: $(patsubst %.c,%.o,$(wildcard daemon/*.c))
-	$(CC) $(LDFLAGS) $^ -o $@ $(LDLIBS) $(LDLIBS_libxenevtchn) $(LDLIBS_libxengnttab) $(LDLIBS_libxenforeignmemory) $(LDLIBS_xenconsoled) $(APPEND_LDFLAGS)
-
-client/main.o: CFLAGS += -include $(XEN_ROOT)/tools/config.h
-xenconsole: $(patsubst %.c,%.o,$(wildcard client/*.c))
-	$(CC) $(LDFLAGS) $^ -o $@ $(LDLIBS) $(LDLIBS_xenconsole) $(APPEND_LDFLAGS)
-
-.PHONY: install
-install: $(BIN)
-	$(INSTALL_DIR) $(DESTDIR)/$(sbindir)
-	$(INSTALL_PROG) xenconsoled $(DESTDIR)/$(sbindir)
-	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
-	$(INSTALL_PROG) xenconsole $(DESTDIR)$(LIBEXEC_BIN)
-
-.PHONY: uninstall
-uninstall:
-	rm -f $(DESTDIR)$(LIBEXEC_BIN)/xenconsole
-	rm -f $(DESTDIR)$(sbindir)/xenconsoled
-
--include $(DEPS_INCLUDE)
+.PHONY: all clean install distclean uninstall
+all clean install distclean uninstall: %: subdirs-%
diff --git a/tools/console/client/Makefile b/tools/console/client/Makefile
new file mode 100644
index 0000000000..44176c6d93
--- /dev/null
+++ b/tools/console/client/Makefile
@@ -0,0 +1,39 @@
+XEN_ROOT=$(CURDIR)/../../..
+include $(XEN_ROOT)/tools/Rules.mk
+
+CFLAGS += -Werror
+CFLAGS += $(CFLAGS_libxenctrl)
+CFLAGS += $(CFLAGS_libxenstore)
+CFLAGS += -include $(XEN_ROOT)/tools/config.h
+
+LDLIBS += $(LDLIBS_libxenctrl)
+LDLIBS += $(LDLIBS_libxenstore)
+LDLIBS += $(SOCKET_LIBS)
+
+OBJS-y := main.o
+
+TARGETS := xenconsole
+
+.PHONY: all
+all: $(TARGETS)
+
+xenconsole: $(OBJS-y)
+	$(CC) $(LDFLAGS) $^ -o $@ $(LDLIBS) $(APPEND_LDFLAGS)
+
+.PHONY: install
+install: all
+	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
+	$(INSTALL_PROG) xenconsole $(DESTDIR)$(LIBEXEC_BIN)
+
+.PHONY: uninstall
+uninstall:
+	rm -f $(DESTDIR)$(LIBEXEC_BIN)/xenconsole
+
+.PHONY: clean
+clean:
+	$(RM) *.o $(TARGETS) $(DEPS_RM)
+
+.PHONY: distclean
+distclean: clean
+
+-include $(DEPS_INCLUDE)
diff --git a/tools/console/daemon/Makefile b/tools/console/daemon/Makefile
new file mode 100644
index 0000000000..0f004f0b14
--- /dev/null
+++ b/tools/console/daemon/Makefile
@@ -0,0 +1,50 @@
+XEN_ROOT=$(CURDIR)/../../..
+include $(XEN_ROOT)/tools/Rules.mk
+
+CFLAGS += -Werror
+CFLAGS += $(CFLAGS_libxenctrl)
+CFLAGS += $(CFLAGS_libxenstore)
+CFLAGS += $(CFLAGS_libxenevtchn)
+CFLAGS += $(CFLAGS_libxengnttab)
+CFLAGS += $(CFLAGS_libxenforeignmemory)
+CFLAGS-$(CONFIG_ARM) += -DCONFIG_ARM
+CFLAGS += -include $(XEN_ROOT)/tools/config.h
+
+LDLIBS += $(LDLIBS_libxenctrl)
+LDLIBS += $(LDLIBS_libxenstore)
+LDLIBS += $(LDLIBS_libxenevtchn)
+LDLIBS += $(LDLIBS_libxengnttab)
+LDLIBS += $(LDLIBS_libxenforeignmemory)
+LDLIBS += $(SOCKET_LIBS)
+LDLIBS += $(UTIL_LIBS)
+LDLIBS += -lrt
+
+OBJS-y := main.o
+OBJS-y += io.o
+OBJS-y += utils.o
+
+TARGETS := xenconsoled
+
+.PHONY: all
+all: $(TARGETS)
+
+xenconsoled: $(OBJS-y)
+	$(CC) $(LDFLAGS) $^ -o $@ $(LDLIBS) $(APPEND_LDFLAGS)
+
+.PHONY: install
+install: all
+	$(INSTALL_DIR) $(DESTDIR)/$(sbindir)
+	$(INSTALL_PROG) xenconsoled $(DESTDIR)/$(sbindir)
+
+.PHONY: uninstall
+uninstall:
+	rm -f $(DESTDIR)$(sbindir)/xenconsoled
+
+.PHONY: clean
+clean:
+	$(RM) *.o $(TARGETS) $(DEPS_RM)
+
+.PHONY: distclean
+distclean: clean
+
+-include $(DEPS_INCLUDE)
diff --git a/.gitignore b/.gitignore
index 18ef56a780..7cf26051db 100644
--- a/.gitignore
+++ b/.gitignore
@@ -160,8 +160,6 @@ tools/libs/util/libxenutil.map
 tools/libs/vchan/headers.chk
 tools/libs/vchan/libxenvchan.map
 tools/libs/vchan/xenvchan.pc
-tools/console/xenconsole
-tools/console/xenconsoled
 tools/debugger/gdb/gdb-6.2.1-linux-i386-xen/*
 tools/debugger/gdb/gdb-6.2.1/*
 tools/debugger/gdb/gdb-6.2.1.tar.bz2
diff --git a/tools/console/client/.gitignore b/tools/console/client/.gitignore
new file mode 100644
index 0000000000..b096a1d841
--- /dev/null
+++ b/tools/console/client/.gitignore
@@ -0,0 +1 @@
+/xenconsole
diff --git a/tools/console/daemon/.gitignore b/tools/console/daemon/.gitignore
new file mode 100644
index 0000000000..55c8f84664
--- /dev/null
+++ b/tools/console/daemon/.gitignore
@@ -0,0 +1 @@
+/xenconsoled
-- 
Anthony PERARD


