Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0C24C486E
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 16:14:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279185.476842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcI6-0000WG-OM; Fri, 25 Feb 2022 15:13:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279185.476842; Fri, 25 Feb 2022 15:13:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcI6-0000PF-D5; Fri, 25 Feb 2022 15:13:54 +0000
Received: by outflank-mailman (input) for mailman id 279185;
 Fri, 25 Feb 2022 15:13:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E0Ll=TI=citrix.com=prvs=04808661d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nNcI4-0007Bf-2j
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 15:13:52 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8968535d-964d-11ec-8eb9-a37418f5ba1a;
 Fri, 25 Feb 2022 16:13:50 +0100 (CET)
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
X-Inumbo-ID: 8968535d-964d-11ec-8eb9-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645802030;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zZhTh/NI1Yuo6FeFerl0nTlpsDly6vffYs1vsJ0qtn8=;
  b=aNwn2hPOOo8rCn+DADJTplPCfoLaC2fVIxWXI8Oz+F4HfWcNSXaY/3mJ
   B9aPzqou5Qserh+H7d+g5xfm9ed7IZZ0VUa2Dm9DYUgb6QNyPofBn6vfo
   bzn9pVT8pzLVQb5MriMB8/njmQKh+di5wpvri8sE6fkysNoka2puEmI/K
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 65407506
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:tVQdDamiqXC3S5Q7x/B7+vDo5gyuJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOUGvXM/qLZDGnft8ga43n9k8Bu8XXyd5hTQs4rCw8QyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DjWV7V4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYVQhwLIPmo9skFABcDHtXOrFF17bgGC3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3s3d8zTbfHLA+TIrKWani7t5ExjYgwMtJGJ4yY
 uJHNGY3M0mYPXWjPH80J6w3n/6on0DeYmECkn+2ubEe/WfcmVkZPL/Fb4OOJ43iqd9utl2Du
 mvM8mD9AxcbHN+S0zyI9jSrnOCntTz/cJIfEvu/7PECqF+Owm0eDjUGWF39puO24mauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O+8w5RyJy6HUyx2EHWVCRTlEAOHKr+dvG2Zsj
 AXQ2Yq0W3o/69V5VE5x6J+IomqgFwIuElZFfCsbFyIC/9rMqaYK20enoslYLIa5idj8GDfVy
 j+MrTQji7h7sfPnx5lX7nic3Wvy+8Ghohodo1yOAzn7tl8RiJuNOtTwgWU3+8qsO2pworOpm
 HEf0/aT4+kVZX1mvHzcGb5ddF1FChvsDdE9vbKNN8Vwn9hO0yT6FWy13N2YDB04WirjUWW0C
 HI/QSsLuPdu0IKCNMebmb6ZBcUw1rTHHt/4TP3SZdcmSsEvKFLYoHgyOBbIhziFfK0QfUcXY
 8bznSGEVytyNEia5GDuG7d1PUEDnEjSOl8/tbiklk/6gNJylVaeSKsfMUvmUwzKxPjsnekhy
 P4Gb5Hi40wGCIXWO3CLmaZOfQFiBSVqXvje9p0IHtNv1yI7QQnN/deKmuh/E2Gk9owI/tr1E
 oaVARcJmAKi3iSccW1nqBlLMdvSYHq2llpjVQREALpi8yN7CWpzxM/zr6cKQIQ=
IronPort-HdrOrdr: A9a23:DyULwKsQkEoUWCayie0TaNFu7skDcNV00zEX/kB9WHVpmszxra
 +TdZMgpHjJYVcqKQgdcL+7WZVoLUmwyXcx2/hyAV7AZniDhILLFuFfBOLZqlWKcREWtNQtsJ
 uIG5IObuEYZmIVsS+V2mWF+q4bsbq6zJw=
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="65407506"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 01/29] tools/console: have one Makefile per program/directory
Date: Fri, 25 Feb 2022 15:12:53 +0000
Message-ID: <20220225151321.44126-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225151321.44126-1-anthony.perard@citrix.com>
References: <20220225151321.44126-1-anthony.perard@citrix.com>
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
index d425be4bd9..4e2a850f94 100644
--- a/.gitignore
+++ b/.gitignore
@@ -159,8 +159,6 @@ tools/libs/util/libxenutil.map
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


