Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E36BF46A23C
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:07:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239442.415086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHS3-0004d1-4I; Mon, 06 Dec 2021 17:06:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239442.415086; Mon, 06 Dec 2021 17:06:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHS3-0004aP-0h; Mon, 06 Dec 2021 17:06:55 +0000
Received: by outflank-mailman (input) for mailman id 239442;
 Mon, 06 Dec 2021 17:06:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHOx-0005ta-MS
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:03:43 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 756262cf-56b6-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 18:03:41 +0100 (CET)
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
X-Inumbo-ID: 756262cf-56b6-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810221;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u/6PZxBQJwWZ+PXJwgzjsbEo629MujlLZMLcLeCujlQ=;
  b=f9RFxzrPYYVtwxxYoVKLRk80zEB2lGWGAMAlbp4Sghbtw7UjqlsD8DAr
   6jeBsH74tMt7mFB9sJWCq/+yOJwcm42p6dlE4vnLOQt+6EkvFXblX2C6N
   9irAP6aopRBufxpnhMWVpi5sRsREw9mGcz7na5cOYSexeh5m6cDHj5cYm
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: DCiuWfY2Y08sKGXPVqAJ6Ok9zf23qVIeQuhnPe0J7NtVc91nyTuJd5YHr4KcFzF5xHa+AhrV90
 xZJVv7Q7ks3qK0NJ9tYEpF9CgUvaS6sJMeoykj1yn46NZ/P21U7dQY8UWFenKYe7XdaZQIxCbU
 EazkXoyPCGPn9d2eKlnHtMjUVFBeR13aO8XePePHADnBIrqdjdIjcY4mHRAyre+zDjva0EhTgf
 goJmQlNC0ShSaCI12gicMoJgJeWQBpAbjqOpnANGrijUa9lJ6nb/8oSy2uYW1kOwcLh2XLEED4
 o4P9nGX9FuqDgbE3qlkDC046
X-SBRS: 5.1
X-MesageID: 59766443
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:3t1H3KAYHyA7+BVW/7Lkw5YqxClBgxIJ4kV8jS/XYbTApGx20jJUx
 2UXX2/UO/+CNzehKY93YNvl9RxVuZbdnYc1QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX570Uw7wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/kQuXxsJy6
 dZ25YGobykQOIj1iKMnTEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTQ+9whsMlPY/zMZkWoH1IxjDFF/c2B5vERs0m4PcFjWhu2JwSRp4yY
 eIVNTlmdCrySiQUAX4mAcIQ28KCglzgJmgwRFW9+vNsvjm7IBZK+LrwNNvYfPSaSMMTmVyXz
 krd5HjwCBweMN2ZyBKG/2iqi+uJmjn0MKoNEJWo+/gsh0ecrkQRAhALUVqwodGil1WzHdlYL
 iQ86ico6KQ/6kGvZt38RAGj5m6JuAYGXNhdGPF87xuCooLd5RqZAW4VCCZMctU8uOc5QDUr0
 hmCmNaBLT1wspWFRHSF7LCWoDiufy8PIgc/iTQsFFVfpYO5+cdq00yJHo0L/LOJYsPdAw/um
 iKJjSsF16gLq+Ay0YCC7Rf9nGf5znTWdTId6gLSV2Ojywp2Yo+5eoClgWTmAeZ8wJWxFQfY4
 iVd8ySKxKVXVMzWynTRKAkYNOjxv67tDdHKvbJ483DNHRyJ8mXrQ41f6SoWyKxBYpddIm+Bj
 KM+VGpsCH5v0JmCMPYfj2GZUZ1CIU3c+TLNDKq8gj1mOMcZSeN/1HsyDXN8Jki0+KTWrYkxO
 I2AbeGnBmsABKJswVKeHrlGgeBxl31knz2MFfgXKihLN5LEPhZ5rp9fbzOzgh0RtvvY8G05D
 f4BXyd19/mveLKnOXSGmWLiBVsLMWI6FfjLRz9/LYa+zv5dMDh5UZf5mOp5E6Q8xvg9vrqYr
 xmVBx4DoHKi1CKvFOl/Qi06AF8Zdc0k9ixT0O1FFQvA5kXPlq7ztvpCLMVuIuF8nAGhpNYtJ
 8Q4lwy7KqwnYlz6F/41MfERdaRuK0amgxygJS2gbGRtdpJsXVWRqNTlYhHu5G8FCS/u7Zkyp
 Lip1wX6R5sfRls9UJaKOaz3l17h72IAnO9SXlfTJoUBckvb74U3eTf6ieU6Ip9QJEyblCeaz
 QufHTwRufLJ/90u6NDMiK3d99WpHuJyE1B0BW7e6brqZyDW8nD6md1LUfqSfCCbX2Txof3wa
 eJQxvD6EfsGgFcV7NYsT+c1lfozvoK9qaVbwwJoGGTwQ26qUr4wcGOb2cRvt7FWwuMLswWBR
 U/SqMJRPq+EOZ25HQdJdhYldOmKydodhiLWsaYuOEz/6SJ6oOiHXEFVM0XegSBRNuIoYoYsw
 ONns88K8Q2vzBEtN4/e3CxT8m2NKF0GUrkm6c5GUNO61FJzxwEQe4HYBw/3/IqLOodFPUQdK
 zOJgLbP2uZHzU3YfntvTXXA0IKxX3jVVMymGLPaG2m0pw==
IronPort-HdrOrdr: A9a23:ewE0EqOXModhVMBcTsejsMiBIKoaSvp037Eqv3ofdfUzSL3+qy
 nOpoVj6faaslcssR0b9OxofZPwI080lqQFhbX5X43DYOCOggLBR+tfBMnZsljd8kXFh4hgPM
 xbHZSWZuedMbEDt7eY3DWF
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="59766443"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH 22/57] tools/console: have one Makefile per program/directory
Date: Mon, 6 Dec 2021 17:02:05 +0000
Message-ID: <20211206170241.13165-23-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
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
 .gitignore                    |  4 +--
 tools/console/Makefile        | 49 +++-------------------------------
 tools/console/client/Makefile | 39 +++++++++++++++++++++++++++
 tools/console/daemon/Makefile | 50 +++++++++++++++++++++++++++++++++++
 4 files changed, 94 insertions(+), 48 deletions(-)
 create mode 100644 tools/console/client/Makefile
 create mode 100644 tools/console/daemon/Makefile

diff --git a/.gitignore b/.gitignore
index b39b996718..c31fa9b841 100644
--- a/.gitignore
+++ b/.gitignore
@@ -159,8 +159,8 @@ tools/libs/util/libxenutil.map
 tools/libs/vchan/headers.chk
 tools/libs/vchan/libxenvchan.map
 tools/libs/vchan/xenvchan.pc
-tools/console/xenconsole
-tools/console/xenconsoled
+tools/console/client/xenconsole
+tools/console/daemon/xenconsoled
 tools/debugger/gdb/gdb-6.2.1-linux-i386-xen/*
 tools/debugger/gdb/gdb-6.2.1/*
 tools/debugger/gdb/gdb-6.2.1.tar.bz2
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
-- 
Anthony PERARD


