Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7FA1D8D63
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 03:56:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jarUu-0000cP-Sa; Tue, 19 May 2020 01:56:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Ytr=7B=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jarUt-0000bb-Ma
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 01:56:47 +0000
X-Inumbo-ID: ead05370-9973-11ea-b07b-bc764e2007e4
Received: from mail-qv1-xf31.google.com (unknown [2607:f8b0:4864:20::f31])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ead05370-9973-11ea-b07b-bc764e2007e4;
 Tue, 19 May 2020 01:56:12 +0000 (UTC)
Received: by mail-qv1-xf31.google.com with SMTP id z5so5774793qvw.4
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2020 18:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kEXkWybJoTWgEbRxoPRBV+0UyHS+McZIDFYoiINJxvs=;
 b=qcVzo3a+KB3ETvgsQidsSXACydEgJBtJ4WRf01+VVSjp9T9U5ONXTcDLnH7KNYaw3U
 u/d2DHNW5pths5bKQKRRcJDRAtDQR9fbm3y7ZJRScmJmZ6erZZonn8VVpQbpkTaF0PeX
 bIw8Z9Nk5GjqR9TfA7M2074DUcH5UaMbJp1/1qYpnpVf0BfOmhoOS0/A+7tmQKYC1vjN
 SvlXClEzwm2NSOqXkKVtde4GfacnkI3i5hD8B/pLb7M9NXOxtu/Q6vogspPNfEEg9kHB
 lx57+Zoih+Zro+0UqpJu9xZT99FnQSrx+dvfZsf96q9IBoPqMLYYrtZxgJtTFZkaK+3f
 SDag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kEXkWybJoTWgEbRxoPRBV+0UyHS+McZIDFYoiINJxvs=;
 b=YQ5Rrf+3HSYiaWG6FsYZUyQlaGBnX/AlD8DGiFVrYNTQm13gVJzSKJae2nvdLF+RBq
 Xy1VuLrQvg32TIV5rZgDTYy5NBZA0rOC/InK9ih/7WgGGgAA/NowqSeNNcYytQWbepra
 nPPdIbkAghiyMFu0UVhzbBnNtUzQrBWzNvvUeCpwFVlTGKyQJeoy4dBmFIvGw1xEACoW
 ITKTOKHsXl0j95BBrD5mIPGrd0Pu51/9Vketon7fPcVfWIoSk4yxojJ9JzuvxECIROR9
 BhJurQ3K0tKObOFp4yLOUv9tSmzRRlMcdwa9AHpUiIjhgg6I6CHZH+rW+jhtSezlpuhO
 2yTQ==
X-Gm-Message-State: AOAM532nYYZ9CKZMlSeVrgAueYXtNjbsQzhwnq4VHjLwFGlfDEW/k31X
 Xd08mbF/fjqPnsShaNNipbZV1VqU
X-Google-Smtp-Source: ABdhPJxRpf7O/7FOq43998l0WVEB5d3uHUdleuhp18e5E/w4QE1ZImpyheDSJV4p1ZZX9OpP3LMWhw==
X-Received: by 2002:a0c:ee64:: with SMTP id n4mr18445066qvs.246.1589853371812; 
 Mon, 18 May 2020 18:56:11 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:e463:db9c:c6eb:4544])
 by smtp.gmail.com with ESMTPSA id q2sm9731898qkn.116.2020.05.18.18.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 18:56:11 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v7 12/19] tools: add simple vchan-socket-proxy
Date: Mon, 18 May 2020 21:54:56 -0400
Message-Id: <20200519015503.115236-13-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200519015503.115236-1-jandryuk@gmail.com>
References: <20200519015503.115236-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <ian.jackson@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Add a simple proxy for tunneling socket connection over vchan. This is
based on existing vchan-node* applications, but extended with socket
support. vchan-socket-proxy serves both as a client and as a server,
depending on parameters. It can be used to transparently communicate
with an application in another domian that normally expose UNIX socket
interface. Specifically, it's written to communicate with qemu running
within stubdom.

Server mode listens for vchan connections and when one is opened,
connects to a pointed UNIX socket.  Client mode listens on UNIX
socket and when someone connects, opens a vchan connection.  Only
a single connection at a time is supported.

Additionally, socket can be provided as a number - in which case it's
interpreted as already open FD (in case of UNIX listening socket -
listen() needs to be already called). Or "-" meaning stdin/stdout - in
which case it is reduced to vchan-node2 functionality.

Example usage:

1. (in dom0) vchan-socket-proxy --mode=client <DOMID>
    /local/domain/<DOMID>/data/vchan/1234 /run/qemu.(DOMID)

2. (in DOMID) vchan-socket-proxy --mode=server 0
   /local/domain/<DOMID>/data/vchan/1234 /run/qemu.(DOMID)

This will listen on /run/qemu.(DOMID) in dom0 and whenever connection is
made, it will connect to DOMID, where server process will connect to
/run/qemu.(DOMID) there. When client disconnects, vchan connection is
terminated and server vchan-socket-proxy process also disconnects from
qemu.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

---
Changes on v5:
 - Ensure bindir directory is present
 - String and comment fixes
Changes in v6
 - Add Acked-by: Ian Jackson
---
 .gitignore                          |   1 +
 tools/libvchan/Makefile             |   8 +-
 tools/libvchan/vchan-socket-proxy.c | 478 ++++++++++++++++++++++++++++
 3 files changed, 486 insertions(+), 1 deletion(-)
 create mode 100644 tools/libvchan/vchan-socket-proxy.c

diff --git a/.gitignore b/.gitignore
index bfa53723b3..7418ce9829 100644
--- a/.gitignore
+++ b/.gitignore
@@ -369,6 +369,7 @@ tools/misc/xenwatchdogd
 tools/misc/xen-hvmcrash
 tools/misc/xen-lowmemd
 tools/libvchan/vchan-node[12]
+tools/libvchan/vchan-socket-proxy
 tools/ocaml/*/.ocamldep.make
 tools/ocaml/*/*.cm[ixao]
 tools/ocaml/*/*.cmxa
diff --git a/tools/libvchan/Makefile b/tools/libvchan/Makefile
index 7892750c3e..913bcc8884 100644
--- a/tools/libvchan/Makefile
+++ b/tools/libvchan/Makefile
@@ -13,6 +13,7 @@ LIBVCHAN_PIC_OBJS = $(patsubst %.o,%.opic,$(LIBVCHAN_OBJS))
 LIBVCHAN_LIBS = $(LDLIBS_libxenstore) $(LDLIBS_libxengnttab) $(LDLIBS_libxenevtchn)
 $(LIBVCHAN_OBJS) $(LIBVCHAN_PIC_OBJS): CFLAGS += $(CFLAGS_libxenstore) $(CFLAGS_libxengnttab) $(CFLAGS_libxenevtchn)
 $(NODE_OBJS) $(NODE2_OBJS): CFLAGS += $(CFLAGS_libxengnttab) $(CFLAGS_libxenevtchn)
+vchan-socket-proxy.o: CFLAGS += $(CFLAGS_libxenstore) $(CFLAGS_libxenctrl) $(CFLAGS_libxengnttab) $(CFLAGS_libxenevtchn)
 
 MAJOR = 4.14
 MINOR = 0
@@ -39,7 +40,7 @@ $(PKG_CONFIG_LOCAL): PKG_CONFIG_LIBDIR = $(CURDIR)
 $(PKG_CONFIG_LOCAL): PKG_CONFIG_CFLAGS_LOCAL = $(CFLAGS_xeninclude)
 
 .PHONY: all
-all: libxenvchan.so vchan-node1 vchan-node2 libxenvchan.a $(PKG_CONFIG_INST) $(PKG_CONFIG_LOCAL)
+all: libxenvchan.so vchan-node1 vchan-node2 vchan-socket-proxy libxenvchan.a $(PKG_CONFIG_INST) $(PKG_CONFIG_LOCAL)
 
 libxenvchan.so: libxenvchan.so.$(MAJOR)
 	ln -sf $< $@
@@ -59,13 +60,18 @@ vchan-node1: $(NODE_OBJS) libxenvchan.so
 vchan-node2: $(NODE2_OBJS) libxenvchan.so
 	$(CC) $(LDFLAGS) -o $@ $(NODE2_OBJS) $(LDLIBS_libxenvchan) $(APPEND_LDFLAGS)
 
+vchan-socket-proxy: vchan-socket-proxy.o libxenvchan.so
+	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenvchan) $(LDLIBS_libxenstore) $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
+
 .PHONY: install
 install: all
 	$(INSTALL_DIR) $(DESTDIR)$(libdir)
 	$(INSTALL_DIR) $(DESTDIR)$(includedir)
+	$(INSTALL_DIR) $(DESTDIR)$(bindir)
 	$(INSTALL_PROG) libxenvchan.so.$(MAJOR).$(MINOR) $(DESTDIR)$(libdir)
 	ln -sf libxenvchan.so.$(MAJOR).$(MINOR) $(DESTDIR)$(libdir)/libxenvchan.so.$(MAJOR)
 	ln -sf libxenvchan.so.$(MAJOR) $(DESTDIR)$(libdir)/libxenvchan.so
+	$(INSTALL_PROG) vchan-socket-proxy $(DESTDIR)$(bindir)
 	$(INSTALL_DATA) libxenvchan.h $(DESTDIR)$(includedir)
 	$(INSTALL_DATA) libxenvchan.a $(DESTDIR)$(libdir)
 	$(INSTALL_DATA) xenvchan.pc $(DESTDIR)$(PKG_INSTALLDIR)
diff --git a/tools/libvchan/vchan-socket-proxy.c b/tools/libvchan/vchan-socket-proxy.c
new file mode 100644
index 0000000000..13700c5d67
--- /dev/null
+++ b/tools/libvchan/vchan-socket-proxy.c
@@ -0,0 +1,478 @@
+/**
+ * @file
+ * @section AUTHORS
+ *
+ * Copyright (C) 2010  Rafal Wojtczuk  <rafal@invisiblethingslab.com>
+ *
+ *  Authors:
+ *       Rafal Wojtczuk  <rafal@invisiblethingslab.com>
+ *       Daniel De Graaf <dgdegra@tycho.nsa.gov>
+ *       Marek Marczykowski-Górecki  <marmarek@invisiblethingslab.com>
+ *
+ * @section LICENSE
+ *
+ *  This program is free software; you can redistribute it and/or
+ *  modify it under the terms of the GNU Lesser General Public
+ *  License as published by the Free Software Foundation; either
+ *  version 2.1 of the License, or (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ *  Lesser General Public License for more details.
+ *
+ *  You should have received a copy of the GNU Lesser General Public
+ *  License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *
+ * @section DESCRIPTION
+ *
+ * This is a vchan to unix socket proxy. Vchan server is set, and on client
+ * connection, local socket connection is established. Communication is bidirectional.
+ * One client is served at a time, clients needs to coordinate this themselves.
+ */
+
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
+#include <unistd.h>
+#include <fcntl.h>
+#include <errno.h>
+#include <sys/socket.h>
+#include <sys/un.h>
+#include <getopt.h>
+
+#include <xenstore.h>
+#include <xenctrl.h>
+#include <libxenvchan.h>
+
+static void usage(char** argv)
+{
+    fprintf(stderr, "usage:\n"
+        "\t%s [options] domainid nodepath [socket-path|file-no|-]\n"
+        "\n"
+        "options:\n"
+        "\t-m, --mode=client|server - vchan connection mode (client by default)\n"
+        "\t-s, --state-path=path - xenstore path where write \"running\" to \n"
+        "\t                        at startup\n"
+        "\t-v, --verbose - verbose logging\n"
+        "\n"
+        "client: client of a vchan connection, fourth parameter can be:\n"
+        "\tsocket-path: listen on a UNIX socket at this path and connect to vchan\n"
+        "\t             whenever new connection is accepted;\n"
+        "\t             handle multiple _subsequent_ connections, until terminated\n"
+        "\n"
+        "\tfile-no:     except open FD of a socket in listen mode;\n"
+        "\t             otherwise similar to socket-path\n"
+        "\n"
+        "\t-:           open vchan connection immediately and pass the data\n"
+        "\t             from stdin/stdout; terminate when vchan connection\n"
+        "\t             is closed\n"
+        "\n"
+        "server: server of a vchan connection, fourth parameter can be:\n"
+        "\tsocket-path: connect to this UNIX socket when new vchan connection\n"
+        "\t             is accepted;\n"
+        "\t             handle multiple _subsequent_ connections, until terminated\n"
+        "\n"
+        "\tfile-no:     pass data to/from this FD; terminate when vchan connection\n"
+        "\t             is closed\n"
+        "\n"
+        "\t-:           pass data to/from stdin/stdout; terminate when vchan\n"
+        "\t             connection is closed\n",
+        argv[0]);
+    exit(1);
+}
+
+#define BUFSIZE 8192
+char inbuf[BUFSIZE];
+char outbuf[BUFSIZE];
+int insiz = 0;
+int outsiz = 0;
+int verbose = 0;
+
+static void vchan_wr(struct libxenvchan *ctrl) {
+    int ret;
+
+    if (!insiz)
+        return;
+    ret = libxenvchan_write(ctrl, inbuf, insiz);
+    if (ret < 0) {
+        fprintf(stderr, "vchan write failed\n");
+        exit(1);
+    }
+    if (verbose)
+        fprintf(stderr, "wrote %d bytes to vchan\n", ret);
+    if (ret > 0) {
+        insiz -= ret;
+        memmove(inbuf, inbuf + ret, insiz);
+    }
+}
+
+static void socket_wr(int output_fd) {
+    int ret;
+
+    if (!outsiz)
+        return;
+    ret = write(output_fd, outbuf, outsiz);
+    if (ret < 0 && errno != EAGAIN)
+        exit(1);
+    if (ret > 0) {
+        outsiz -= ret;
+        memmove(outbuf, outbuf + ret, outsiz);
+    }
+}
+
+static int set_nonblocking(int fd, int nonblocking) {
+    int flags = fcntl(fd, F_GETFL);
+    if (flags == -1)
+        return -1;
+
+    if (nonblocking)
+        flags |= O_NONBLOCK;
+    else
+        flags &= ~O_NONBLOCK;
+
+    if (fcntl(fd, F_SETFL, flags) == -1)
+        return -1;
+
+    return 0;
+}
+
+static int connect_socket(const char *path_or_fd) {
+    int fd;
+    char *endptr;
+    struct sockaddr_un addr;
+
+    fd = strtoll(path_or_fd, &endptr, 0);
+    if (*endptr == '\0') {
+        set_nonblocking(fd, 1);
+        return fd;
+    }
+
+    fd = socket(AF_UNIX, SOCK_STREAM, 0);
+    if (fd == -1)
+        return -1;
+
+    addr.sun_family = AF_UNIX;
+    strncpy(addr.sun_path, path_or_fd, sizeof(addr.sun_path));
+    if (connect(fd, (const struct sockaddr *)&addr, sizeof(addr)) == -1) {
+        close(fd);
+        return -1;
+    }
+
+    set_nonblocking(fd, 1);
+
+    return fd;
+}
+
+static int listen_socket(const char *path_or_fd) {
+    int fd;
+    char *endptr;
+    struct sockaddr_un addr;
+
+    fd = strtoll(path_or_fd, &endptr, 0);
+    if (*endptr == '\0') {
+        return fd;
+    }
+
+    /* if not a number, assume a socket path */
+    fd = socket(AF_UNIX, SOCK_STREAM, 0);
+    if (fd == -1)
+        return -1;
+
+    addr.sun_family = AF_UNIX;
+    strncpy(addr.sun_path, path_or_fd, sizeof(addr.sun_path));
+    if (bind(fd, (const struct sockaddr *)&addr, sizeof(addr)) == -1) {
+        close(fd);
+        return -1;
+    }
+    if (listen(fd, 5) != 0) {
+        close(fd);
+        return -1;
+    }
+
+    return fd;
+}
+
+static struct libxenvchan *connect_vchan(int domid, const char *path) {
+    struct libxenvchan *ctrl = NULL;
+    struct xs_handle *xs = NULL;
+    xc_interface *xc = NULL;
+    xc_dominfo_t dominfo;
+    char **watch_ret;
+    unsigned int watch_num;
+    int ret;
+
+    xs = xs_open(XS_OPEN_READONLY);
+    if (!xs) {
+        perror("xs_open");
+        goto out;
+    }
+    xc = xc_interface_open(NULL, NULL, XC_OPENFLAG_NON_REENTRANT);
+    if (!xc) {
+        perror("xc_interface_open");
+        goto out;
+    }
+    /* wait for vchan server to create *path* */
+    xs_watch(xs, path, "path");
+    xs_watch(xs, "@releaseDomain", "release");
+    while ((watch_ret = xs_read_watch(xs, &watch_num))) {
+        /* don't care about exact which fired the watch */
+        free(watch_ret);
+        ctrl = libxenvchan_client_init(NULL, domid, path);
+        if (ctrl)
+            break;
+
+        ret = xc_domain_getinfo(xc, domid, 1, &dominfo);
+        /* break the loop if domain is definitely not there anymore, but
+         * continue if it is or the call failed (like EPERM) */
+        if (ret == -1 && errno == ESRCH)
+            break;
+        if (ret == 1 && (dominfo.domid != (uint32_t)domid || dominfo.dying))
+            break;
+    }
+
+out:
+    if (xc)
+        xc_interface_close(xc);
+    if (xs)
+        xs_close(xs);
+    return ctrl;
+}
+
+
+static void discard_buffers(struct libxenvchan *ctrl) {
+    /* discard local buffers */
+    insiz = 0;
+    outsiz = 0;
+
+    /* discard remaining incoming data */
+    while (libxenvchan_data_ready(ctrl)) {
+        if (libxenvchan_read(ctrl, inbuf, BUFSIZE) == -1) {
+            perror("vchan read");
+            exit(1);
+        }
+    }
+}
+
+int data_loop(struct libxenvchan *ctrl, int input_fd, int output_fd)
+{
+    int ret;
+    int libxenvchan_fd;
+    int max_fd;
+
+    libxenvchan_fd = libxenvchan_fd_for_select(ctrl);
+    for (;;) {
+        fd_set rfds;
+        fd_set wfds;
+        FD_ZERO(&rfds);
+        FD_ZERO(&wfds);
+
+        max_fd = -1;
+        if (input_fd != -1 && insiz != BUFSIZE) {
+            FD_SET(input_fd, &rfds);
+            if (input_fd > max_fd)
+                max_fd = input_fd;
+        }
+        if (output_fd != -1 && outsiz) {
+            FD_SET(output_fd, &wfds);
+            if (output_fd > max_fd)
+                max_fd = output_fd;
+        }
+        FD_SET(libxenvchan_fd, &rfds);
+        if (libxenvchan_fd > max_fd)
+            max_fd = libxenvchan_fd;
+        ret = select(max_fd + 1, &rfds, &wfds, NULL, NULL);
+        if (ret < 0) {
+            perror("select");
+            exit(1);
+        }
+        if (FD_ISSET(libxenvchan_fd, &rfds)) {
+            libxenvchan_wait(ctrl);
+            if (!libxenvchan_is_open(ctrl)) {
+                if (verbose)
+                    fprintf(stderr, "vchan client disconnected\n");
+                while (outsiz)
+                    socket_wr(output_fd);
+                close(output_fd);
+                close(input_fd);
+                discard_buffers(ctrl);
+                break;
+            }
+            vchan_wr(ctrl);
+        }
+
+        if (FD_ISSET(input_fd, &rfds)) {
+            ret = read(input_fd, inbuf + insiz, BUFSIZE - insiz);
+            if (ret < 0 && errno != EAGAIN)
+                exit(1);
+            if (verbose)
+                fprintf(stderr, "from-unix: %.*s\n", ret, inbuf + insiz);
+            if (ret == 0) {
+                /* EOF on socket, write everything in the buffer and close the
+                 * input_fd socket */
+                while (insiz) {
+                    vchan_wr(ctrl);
+                    libxenvchan_wait(ctrl);
+                }
+                close(input_fd);
+                input_fd = -1;
+                /* TODO: maybe signal the vchan client somehow? */
+                break;
+            }
+            if (ret)
+                insiz += ret;
+            vchan_wr(ctrl);
+        }
+        if (FD_ISSET(output_fd, &wfds))
+            socket_wr(output_fd);
+        while (libxenvchan_data_ready(ctrl) && outsiz < BUFSIZE) {
+            ret = libxenvchan_read(ctrl, outbuf + outsiz, BUFSIZE - outsiz);
+            if (ret < 0)
+                exit(1);
+            if (verbose)
+                fprintf(stderr, "from-vchan: %.*s\n", ret, outbuf + outsiz);
+            outsiz += ret;
+            socket_wr(output_fd);
+        }
+    }
+    return 0;
+}
+
+/**
+    Simple libxenvchan application, both client and server.
+    Both sides may write and read, both from the libxenvchan and from
+    stdin/stdout (just like netcat).
+*/
+
+static struct option options[] = {
+    { "mode",       required_argument, NULL, 'm' },
+    { "verbose",          no_argument, NULL, 'v' },
+    { "state-path", required_argument, NULL, 's' },
+    { }
+};
+
+int main(int argc, char **argv)
+{
+    int is_server = 0;
+    int socket_fd = -1;
+    int input_fd, output_fd;
+    struct libxenvchan *ctrl = NULL;
+    const char *socket_path;
+    int domid;
+    const char *vchan_path;
+    const char *state_path = NULL;
+    int opt;
+
+    while ((opt = getopt_long(argc, argv, "m:vs:", options, NULL)) != -1) {
+        switch (opt) {
+            case 'm':
+                if (strcmp(optarg, "server") == 0)
+                    is_server = 1;
+                else if (strcmp(optarg, "client") == 0)
+                    is_server = 0;
+                else {
+                    fprintf(stderr, "invalid argument for --mode: %s\n", optarg);
+                    usage(argv);
+                    return 1;
+                }
+                break;
+            case 'v':
+                verbose = 1;
+                break;
+            case 's':
+                state_path = optarg;
+                break;
+            case '?':
+                usage(argv);
+        }
+    }
+
+    if (argc-optind != 3)
+        usage(argv);
+
+    domid = atoi(argv[optind]);
+    vchan_path = argv[optind+1];
+    socket_path = argv[optind+2];
+
+    if (is_server) {
+        ctrl = libxenvchan_server_init(NULL, domid, vchan_path, 0, 0);
+        if (!ctrl) {
+            perror("libxenvchan_server_init");
+            exit(1);
+        }
+    } else {
+        if (strcmp(socket_path, "-") == 0) {
+            input_fd = 0;
+            output_fd = 1;
+        } else {
+            socket_fd = listen_socket(socket_path);
+            if (socket_fd == -1) {
+                perror("listen socket");
+                return 1;
+            }
+        }
+    }
+
+    if (state_path) {
+        struct xs_handle *xs;
+
+        xs = xs_open(0);
+        if (!xs) {
+            perror("xs_open");
+            return 1;
+        }
+        if (!xs_write(xs, XBT_NULL, state_path, "running", strlen("running"))) {
+            perror("xs_write");
+            return 1;
+        }
+        xs_close(xs);
+    }
+
+    for (;;) {
+        if (is_server) {
+            /* wait for vchan connection */
+            while (libxenvchan_is_open(ctrl) != 1)
+                libxenvchan_wait(ctrl);
+            /* vchan client connected, setup local FD if needed */
+            if (strcmp(socket_path, "-") == 0) {
+                input_fd = 0;
+                output_fd = 1;
+            } else {
+                input_fd = output_fd = connect_socket(socket_path);
+            }
+            if (input_fd == -1) {
+                perror("connect socket");
+                return 1;
+            }
+            if (data_loop(ctrl, input_fd, output_fd) != 0)
+                break;
+            /* keep it running only when get UNIX socket path */
+            if (socket_path[0] != '/')
+                break;
+        } else {
+            /* wait for local socket connection */
+            if (strcmp(socket_path, "-") != 0)
+                input_fd = output_fd = accept(socket_fd, NULL, NULL);
+            if (input_fd == -1) {
+                perror("accept");
+                return 1;
+            }
+            set_nonblocking(input_fd, 1);
+            set_nonblocking(output_fd, 1);
+            ctrl = connect_vchan(domid, vchan_path);
+            if (!ctrl) {
+                perror("vchan client init");
+                return 1;
+            }
+            if (data_loop(ctrl, input_fd, output_fd) != 0)
+                break;
+            /* don't reconnect if output was stdout */
+            if (strcmp(socket_path, "-") == 0)
+                break;
+
+            libxenvchan_close(ctrl);
+            ctrl = NULL;
+        }
+    }
+    return 0;
+}
-- 
2.25.1


