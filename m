Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B70B22F3806
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 19:13:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65831.116682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzOAp-0003v5-4Q; Tue, 12 Jan 2021 18:13:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65831.116682; Tue, 12 Jan 2021 18:13:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzOAo-0003uG-UN; Tue, 12 Jan 2021 18:13:42 +0000
Received: by outflank-mailman (input) for mailman id 65831;
 Tue, 12 Jan 2021 18:13:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gu5a=GP=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1kzOAm-0003Yo-TH
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 18:13:40 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e29916b0-c115-4713-bbcb-0375668e652b;
 Tue, 12 Jan 2021 18:13:17 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 10CIDGkB003862;
 Tue, 12 Jan 2021 19:13:16 +0100 (CET)
Received: from armandeche.soc.lip6.fr (armandeche [132.227.63.133])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 10CIDEdp018852;
 Tue, 12 Jan 2021 19:13:14 +0100 (MET)
Received: by armandeche.soc.lip6.fr (Postfix, from userid 20331)
 id D80E47218; Tue, 12 Jan 2021 19:13:14 +0100 (MET)
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
X-Inumbo-ID: e29916b0-c115-4713-bbcb-0375668e652b
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: xen-devel@lists.xenproject.org
Cc: Manuel Bouyer <bouyer@netbsd.org>, Ian Jackson <iwj@xenproject.org>,
        Wei Liu <wl@xen.org>
Subject: [PATCH] NetBSD: remove xenbackendd
Date: Tue, 12 Jan 2021 19:12:26 +0100
Message-Id: <20210112181242.1570-6-bouyer@antioche.eu.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210112181242.1570-1-bouyer@antioche.eu.org>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 12 Jan 2021 19:13:16 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

From: Manuel Bouyer <bouyer@netbsd.org>

NetBSD doens't need xenbackendd with xl toolstack so don't build it.
Remove now unused xenbackendd directory/files.

Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
---
 tools/Makefile                  |   1 -
 tools/xenbackendd/Makefile      |  45 -----
 tools/xenbackendd/xenbackendd.c | 326 --------------------------------
 3 files changed, 372 deletions(-)
 delete mode 100644 tools/xenbackendd/Makefile
 delete mode 100644 tools/xenbackendd/xenbackendd.c

diff --git a/tools/Makefile b/tools/Makefile
index ed71474421..757a560be0 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -18,7 +18,6 @@ SUBDIRS-$(CONFIG_X86) += firmware
 SUBDIRS-y += console
 SUBDIRS-y += xenmon
 SUBDIRS-y += xentop
-SUBDIRS-$(CONFIG_NetBSD) += xenbackendd
 SUBDIRS-y += libfsimage
 SUBDIRS-$(CONFIG_Linux) += vchan
 
diff --git a/tools/xenbackendd/Makefile b/tools/xenbackendd/Makefile
deleted file mode 100644
index ba53bbf7e6..0000000000
--- a/tools/xenbackendd/Makefile
+++ /dev/null
@@ -1,45 +0,0 @@
-# Copyright (c) 2009 Advanced Micro Devices, Inc.
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License as published by
-# the Free Software Foundation; under version 2 of the License.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-
-XEN_ROOT=$(CURDIR)/../..
-include $(XEN_ROOT)/tools/Rules.mk
-
-CFLAGS  += -Werror
-CFLAGS  += $(CFLAGS_libxenstore)
-CPPFLAGS += -DXEN_SCRIPT_DIR="\"$(XEN_SCRIPT_DIR)\""
-LDLIBS  += $(LDLIBS_libxenstore)
-
-.PHONY: all
-all: build
-
-.PHONY: build
-build: xenbackendd
-
-.PHONY: install
-install: build
-	$(INSTALL_DIR) $(DESTDIR)$(sbindir)
-	$(INSTALL_PROG) xenbackendd $(DESTDIR)$(sbindir)
-
-.PHONY: clean
-clean:
-	$(RM) *.a *.so *.o $(DEPS_RM) xenbackendd _paths.h
-
-.PHONY: distclean
-distclean: clean
-
-xenbackendd.o: _paths.h
-xenbackendd: xenbackendd.o
-	$(CC) $(LDFLAGS) $< -o $@ $(LDLIBS) $(APPEND_LDFLAGS)
-
-genpath-target = $(call buildmakevars2header,_paths.h)
-$(eval $(genpath-target))
-
--include $(DEPS_INCLUDE)
diff --git a/tools/xenbackendd/xenbackendd.c b/tools/xenbackendd/xenbackendd.c
deleted file mode 100644
index 21884af772..0000000000
--- a/tools/xenbackendd/xenbackendd.c
+++ /dev/null
@@ -1,326 +0,0 @@
-/* $NetBSD: xenbackendd.c,v 1.1.1.1 2008/08/07 20:26:57 cegger Exp $ */
-/*
- * Copyright (C) 2006 Manuel Bouyer <bouyer@netbsd.org>
- * Copyright (C) 2009 Christoph Egger <Christoph.Egger@amd.com>
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; under version 2 of the License.
- * 
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- * 
- *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
- */
-
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <sys/wait.h>
-#include <unistd.h>
-#include <fcntl.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <stdarg.h>
-#include <string.h>
-#include <syslog.h>
-
-#include <xenstore.h>
-
-#include "_paths.h"
-
-#define DEVTYPE_UNKNOWN 0
-#define DEVTYPE_VIF 1
-#define DEVTYPE_VBD 2
-#define DISABLE_EXEC "libxl/disable_udev"
-
-#define DOMAIN_PATH "/local/domain/0"
-
-#ifndef XEN_SCRIPT_DIR
-#error XEN_SCRIPT_DIR not defined
-#endif
-
-#ifndef VBD_SCRIPT
-#define VBD_SCRIPT XEN_SCRIPT_DIR"/block"
-#endif
-#ifndef LOG_FILE
-#define LOG_FILE XEN_LOG_DIR "xenbackendd.log"
-#endif
-#ifndef PID_FILE
-#define PID_FILE XEN_RUN_DIR "xenbackendd.pid"
-#endif
-
-
-struct xs_handle *xs;
-
-int fflag = 0;
-int dflag = 0;
-
-const char *vbd_script = NULL;
-const char *log_file = NULL;
-const char *pidfile = NULL;
-
-static void
-dolog(int pri, const char *fmt, ...)
-{
-	va_list ap;
-	va_start(ap, fmt);
-	vfprintf(stderr, fmt, ap);
-	va_end(ap);
-	fprintf(stderr, "\n");
-	fflush(stderr);
-	va_start(ap, fmt);
-	vsyslog(pri, fmt, ap);
-	va_end(ap);
-}
-
-static void
-dodebug(const char *fmt, ...)
-{
-	va_list ap;
-
-	if (dflag == 0)
-		return;
-	va_start(ap, fmt);
-	vfprintf(stdout, fmt, ap);
-	va_end(ap);
-	printf("\n");
-	fflush(stdout);
-}
-
-static void
-doexec(const char *cmd, const char *arg1, const char *arg2)
-{
-	dodebug("exec %s %s %s", cmd, arg1, arg2);
-	switch(vfork()) {
-	case -1:
-		dolog(LOG_ERR, "can't vfork: %s", strerror(errno));
-		break;
-	case 0:
-		execl(cmd, cmd, arg1, arg2, NULL);
-		dolog(LOG_ERR, "can't exec %s: %s", cmd, strerror(errno));
-		exit(EXIT_FAILURE);
-		/* NOTREACHED */
-		break;
-	default:
-		wait(NULL);
-		break;
-	}
-}
-
-static void
-usage(void)
-{
-	fprintf(stderr,
-	    "usage: %s [-d] [-f] [-l log_file] [-p pif_file] [-s vbd_script]\n",
-	    getprogname());
-	exit(EXIT_FAILURE);
-}
-
-static int
-xen_setup(void)
-{
-	xs = xs_open(0);
-	if (xs == NULL) {
-		dolog(LOG_ERR,
-		    "Failed to contact xenstore (%s).  Is it running?",
-		    strerror(errno));
-		goto out;
-	}
-
-	if (!xs_watch(xs, DOMAIN_PATH, "backend")) {
-		dolog(LOG_ERR, "xenstore watch on backend fails.");
-		goto out;
-	}
-	return 0;
-
- out:
-	if (xs) {
-		xs_close(xs);
-		xs = NULL;
-	}
-	return -1;
-}
-
-int
-main(int argc, char * const argv[])
-{
-	char **vec;
-	unsigned int num;
-	char *s;
-	int state;
-	char *sstate, *sdisable;
-	char *p;
-	char buf[80];
-	int type;
-	int ch;
-	int debug_fd;
-	FILE *pidfile_f;
-
-	while ((ch = getopt(argc, argv, "dfl:p:s:")) != -1) {
-		switch (ch) {
-		case 'd':
-			dflag = 1;
-			break;
-		case 'f':
-			fflag = 1;
-			break;
-		case 'l':
-			log_file = optarg;
-			break;
-		case 'p':
-			pidfile = optarg;
-		case 's':
-			vbd_script = optarg;
-			break;
-		default:
-			usage();
-		}
-	}
-
-	if (vbd_script == NULL)
-		vbd_script = VBD_SCRIPT;
-	if (pidfile == NULL)
-		pidfile = PID_FILE;
-	if (log_file == NULL)
-		log_file = LOG_FILE;
-
-	openlog("xenbackendd", LOG_PID | LOG_NDELAY, LOG_DAEMON);
-
-	if (fflag == 0) {
-		/* open log file */
-		debug_fd = open(log_file, O_RDWR | O_CREAT | O_TRUNC, 0644);
-		if (debug_fd == -1) {
-			dolog(LOG_ERR, "can't open %s: %s",
-			    log_file, strerror(errno));
-			exit(EXIT_FAILURE);
-		}
-	}
-
-	if (fflag == 0) {
-		/* daemonize */
-		pidfile_f = fopen(pidfile, "w");
-		if (pidfile_f == NULL) {
-			dolog(LOG_ERR, "can't open %s: %s",
-			    pidfile, strerror(errno));
-			exit(EXIT_FAILURE);
-		}
-		if (daemon(0, 0) < 0) {
-			dolog(LOG_ERR, "can't daemonize: %s",
-			    strerror(errno));
-			exit(EXIT_FAILURE);
-		}
-		fprintf(pidfile_f, "%d\n", (int)getpid());
-		fclose(pidfile_f);
-
-		/* redirect stderr to log file */
-		if (dup2(debug_fd, STDERR_FILENO) < 0) {
-			dolog(LOG_ERR, "can't redirect stderr to %s: %s\n",
-			    log_file, strerror(errno));
-			exit(EXIT_FAILURE);
-		}
-
-		/* also redirect stdout if we're in debug mode */
-		if (dflag) {
-			if (dup2(debug_fd, STDOUT_FILENO) < 0) {
-				dolog(LOG_ERR,
-				    "can't redirect stdout to %s: %s\n",
-				    log_file, strerror(errno));
-				exit(EXIT_FAILURE);
-			}
-		}
-
-		close(debug_fd);
-		debug_fd = -1;
-	}
-
-	if (xen_setup() < 0)
-		exit(EXIT_FAILURE);
-
-	for (;;) {
-		vec = xs_read_watch(xs, &num);
-		dodebug("read from xen watch: %s", *vec);
-		if (!vec) {
-			dolog(LOG_ERR, "xs_read_watch: NULL\n");
-			continue;
-		}
-
-		sdisable = xs_read(xs, XBT_NULL, DISABLE_EXEC, 0);
-		if (sdisable)
-			goto next1;
-
-		if (strlen(vec[XS_WATCH_PATH]) < sizeof("state"))
-			goto next1;
-
-		/* find last component of path, check if it's "state" */
-		p = &vec[XS_WATCH_PATH][
-		    strlen(vec[XS_WATCH_PATH]) - sizeof("state")];
-		if (p[0] != '/')
-			goto next1;
-		p[0] = '\0';
-		p++;
-		if (strcmp(p, "state") != 0)
-			goto next1;
-
-		snprintf(buf, sizeof(buf), "%s/state", vec[XS_WATCH_PATH]);
-		sstate = xs_read(xs, XBT_NULL, buf, 0);
-		if (sstate == NULL) {
-			dolog(LOG_ERR,
-			    "Failed to read %s (%s)", buf, strerror(errno));
-			goto next1;
-		}
-
-		state = atoi(sstate);
-		snprintf(buf, sizeof(buf), "%s/hotplug-status",
-		    vec[XS_WATCH_PATH]);
-		s = xs_read(xs, XBT_NULL, buf, 0);
-		if (s != NULL && state != 6 /* XenbusStateClosed */)
-			goto next2;
-
-		type = DEVTYPE_UNKNOWN;
-		if (strncmp(vec[XS_WATCH_PATH],
-		    DOMAIN_PATH "/backend/vif",
-		    strlen(DOMAIN_PATH "/backend/vif")) == 0)
-			type = DEVTYPE_VIF;
-
-		if (strncmp(vec[XS_WATCH_PATH],
-		    DOMAIN_PATH "/backend/vbd",
-		    strlen(DOMAIN_PATH "/backend/vbd")) == 0)
-			type = DEVTYPE_VBD;
-
-		switch(type) {
-		case DEVTYPE_VIF:
-			free(s);
-			snprintf(buf, sizeof(buf), "%s/script",
-			    vec[XS_WATCH_PATH]);
-			s = xs_read(xs, XBT_NULL, buf, 0);
-			if (s == NULL) {
-				dolog(LOG_ERR,
-				    "Failed to read %s (%s)", buf,
-				    strerror(errno));
-				goto next2;
-			}
-			doexec(s, vec[XS_WATCH_PATH], sstate);
-			break;
-
-		case DEVTYPE_VBD:
-			doexec(vbd_script, vec[XS_WATCH_PATH], sstate);
-			break;
-
-		default:
-			break;
-		}
-
-next2:
-		free(s);
-		free(sstate);
-
-next1:
-		free(sdisable);
-		free(vec);
-	}
-
-	return 0;
-}
-- 
2.29.2


