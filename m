Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BD273FBFB
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 14:28:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556121.868400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE7np-0001Y9-Kl; Tue, 27 Jun 2023 12:28:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556121.868400; Tue, 27 Jun 2023 12:28:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE7np-0001VS-HV; Tue, 27 Jun 2023 12:28:13 +0000
Received: by outflank-mailman (input) for mailman id 556121;
 Tue, 27 Jun 2023 12:28:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EZfr=CP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qE7nn-0000fg-F7
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 12:28:11 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13cd77f5-14e6-11ee-b237-6b7b168915f2;
 Tue, 27 Jun 2023 14:28:10 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 239A71F898;
 Tue, 27 Jun 2023 12:28:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E5DE813462;
 Tue, 27 Jun 2023 12:28:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NNmaNtnVmmRUSAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 27 Jun 2023 12:28:09 +0000
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
X-Inumbo-ID: 13cd77f5-14e6-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1687868890; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0lmDSOzNGqLK8c7swzzgALv2u+YxRV1MuLwjYxjFGHE=;
	b=bF1QIufFwxbQP98F0CexJQ2K4a47Nln9sij4V+maV48RhSR4AV8uHGJG5qFBB7N1ZrSU43
	g4ovhg/wud13xYCEilBrkXQ/eO5tkRY1eQY6tafulmz+A9Ygm1oFpz2xFl9s5P5CQcm3XP
	bKTmWWXQEk9pbxmp2GyR1j+7J5zmBA8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 3/5] tools/xenstore: split out environment specific live update code
Date: Tue, 27 Jun 2023 14:27:48 +0200
Message-Id: <20230627122750.2007-4-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230627122750.2007-1-jgross@suse.com>
References: <20230627122750.2007-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of using #ifdef in xenstored_control.c split out the code of
environment specific functions (daemon or Mini-OS) to dedicated source
files.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V4:
- split lu_destroy() in common and specific parts (Julien Grall)
---
 tools/xenstore/Makefile.common       |   8 +-
 tools/xenstore/xenstored_control.c   | 247 +--------------------------
 tools/xenstore/xenstored_lu.h        |  56 ++++++
 tools/xenstore/xenstored_lu_daemon.c | 130 ++++++++++++++
 tools/xenstore/xenstored_lu_minios.c | 118 +++++++++++++
 5 files changed, 312 insertions(+), 247 deletions(-)
 create mode 100644 tools/xenstore/xenstored_lu.h
 create mode 100644 tools/xenstore/xenstored_lu_daemon.c
 create mode 100644 tools/xenstore/xenstored_lu_minios.c

diff --git a/tools/xenstore/Makefile.common b/tools/xenstore/Makefile.common
index f71c9bfd55..c42796fe34 100644
--- a/tools/xenstore/Makefile.common
+++ b/tools/xenstore/Makefile.common
@@ -4,10 +4,10 @@ XENSTORED_OBJS-y := xenstored_core.o xenstored_watch.o xenstored_domain.o
 XENSTORED_OBJS-y += xenstored_transaction.o xenstored_control.o
 XENSTORED_OBJS-y += talloc.o utils.o tdb.o hashtable.o
 
-XENSTORED_OBJS-$(CONFIG_Linux) += xenstored_posix.o
-XENSTORED_OBJS-$(CONFIG_NetBSD) += xenstored_posix.o
-XENSTORED_OBJS-$(CONFIG_FreeBSD) += xenstored_posix.o
-XENSTORED_OBJS-$(CONFIG_MiniOS) += xenstored_minios.o
+XENSTORED_OBJS-$(CONFIG_Linux) += xenstored_posix.o xenstored_lu_daemon.o
+XENSTORED_OBJS-$(CONFIG_NetBSD) += xenstored_posix.o xenstored_lu_daemon.o
+XENSTORED_OBJS-$(CONFIG_FreeBSD) += xenstored_posix.o xenstored_lu_daemon.o
+XENSTORED_OBJS-$(CONFIG_MiniOS) += xenstored_minios.o xenstored_lu_minios.o
 
 # Include configure output (config.h)
 CFLAGS += -include $(XEN_ROOT)/tools/config.h
diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index 0d131e2ebc..8f1f31fd6a 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -38,63 +38,21 @@
 #include "xenstored_core.h"
 #include "xenstored_control.h"
 #include "xenstored_domain.h"
+#include "xenstored_lu.h"
 #include "xenstored_watch.h"
 
-/* Mini-OS only knows about MAP_ANON. */
-#ifndef MAP_ANONYMOUS
-#define MAP_ANONYMOUS MAP_ANON
-#endif
-
 #ifndef NO_LIVE_UPDATE
-struct live_update {
-	/* For verification the correct connection is acting. */
-	struct connection *conn;
-
-	/* Pointer to the command used to request LU */
-	struct buffered_data *in;
-
-#ifdef __MINIOS__
-	void *kernel;
-	unsigned int kernel_size;
-	unsigned int kernel_off;
-
-	void *dump_state;
-	unsigned long dump_size;
-#else
-	char *filename;
-#endif
-
-	char *cmdline;
-
-	/* Start parameters. */
-	bool force;
-	unsigned int timeout;
-	time_t started_at;
-};
-
-static struct live_update *lu_status;
-
-struct lu_dump_state {
-	void *buf;
-	unsigned int size;
-#ifndef __MINIOS__
-	int fd;
-	char *filename;
-#endif
-};
+struct live_update *lu_status;
 
 static int lu_destroy(void *data)
 {
-#ifdef __MINIOS__
-	if (lu_status->dump_state)
-		munmap(lu_status->dump_state, lu_status->dump_size);
-#endif
+	lu_destroy_arch(data);
 	lu_status = NULL;
 
 	return 0;
 }
 
-static const char *lu_begin(struct connection *conn)
+const char *lu_begin(struct connection *conn)
 {
 	if (lu_status)
 		return "live-update session already active.";
@@ -431,203 +389,6 @@ static const char *lu_cmdline(const void *ctx, struct connection *conn,
 	return NULL;
 }
 
-#ifdef __MINIOS__
-static const char *lu_binary_alloc(const void *ctx, struct connection *conn,
-				   unsigned long size)
-{
-	const char *ret;
-
-	syslog(LOG_INFO, "live-update: binary size %lu\n", size);
-
-	ret = lu_begin(conn);
-	if (ret)
-		return ret;
-
-	lu_status->kernel = talloc_size(lu_status, size);
-	if (!lu_status->kernel)
-		return "Allocation failure.";
-
-	lu_status->kernel_size = size;
-	lu_status->kernel_off = 0;
-
-	errno = 0;
-	return NULL;
-}
-
-static const char *lu_binary_save(const void *ctx, struct connection *conn,
-				  unsigned int size, const char *data)
-{
-	if (!lu_status || lu_status->conn != conn)
-		return "Not in live-update session.";
-
-	if (lu_status->kernel_off + size > lu_status->kernel_size)
-		return "Too much kernel data.";
-
-	memcpy(lu_status->kernel + lu_status->kernel_off, data, size);
-	lu_status->kernel_off += size;
-
-	errno = 0;
-	return NULL;
-}
-
-static const char *lu_arch(const void *ctx, struct connection *conn,
-			   char **vec, int num)
-{
-	if (num == 2 && !strcmp(vec[0], "-b"))
-		return lu_binary_alloc(ctx, conn, atol(vec[1]));
-	if (num > 2 && !strcmp(vec[0], "-d"))
-		return lu_binary_save(ctx, conn, atoi(vec[1]), vec[2]);
-
-	errno = EINVAL;
-	return NULL;
-}
-
-static FILE *lu_dump_open(const void *ctx)
-{
-	lu_status->dump_size = ROUNDUP(talloc_total_size(NULL) * 2,
-				       XC_PAGE_SHIFT);
-	lu_status->dump_state = mmap(NULL, lu_status->dump_size,
-				     PROT_READ | PROT_WRITE,
-				     MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
-	if (lu_status->dump_state == MAP_FAILED)
-		return NULL;
-
-	return fmemopen(lu_status->dump_state, lu_status->dump_size, "w");
-}
-
-static void lu_dump_close(FILE *fp)
-{
-	size_t size;
-
-	size = ftell(fp);
-	size = ROUNDUP(size, XC_PAGE_SHIFT);
-	munmap(lu_status->dump_state + size, lu_status->dump_size - size);
-	lu_status->dump_size = size;
-
-	fclose(fp);
-}
-
-static void lu_get_dump_state(struct lu_dump_state *state)
-{
-}
-
-static void lu_close_dump_state(struct lu_dump_state *state)
-{
-}
-
-static char *lu_exec(const void *ctx, int argc, char **argv)
-{
-	return "NYI";
-}
-#else
-static const char *lu_binary(const void *ctx, struct connection *conn,
-			     const char *filename)
-{
-	const char *ret;
-	struct stat statbuf;
-
-	syslog(LOG_INFO, "live-update: binary %s\n", filename);
-
-	if (stat(filename, &statbuf))
-		return "File not accessible.";
-	if (!(statbuf.st_mode & (S_IXOTH | S_IXGRP | S_IXUSR)))
-		return "File not executable.";
-
-	ret = lu_begin(conn);
-	if (ret)
-		return ret;
-
-	lu_status->filename = talloc_strdup(lu_status, filename);
-	if (!lu_status->filename)
-		return "Allocation failure.";
-
-	errno = 0;
-	return NULL;
-}
-
-static const char *lu_arch(const void *ctx, struct connection *conn,
-			   char **vec, int num)
-{
-	if (num == 2 && !strcmp(vec[0], "-f"))
-		return lu_binary(ctx, conn, vec[1]);
-
-	errno = EINVAL;
-	return NULL;
-}
-
-static FILE *lu_dump_open(const void *ctx)
-{
-	char *filename;
-	int fd;
-
-	filename = talloc_asprintf(ctx, "%s/state_dump",
-				   xenstore_daemon_rundir());
-	if (!filename)
-		return NULL;
-
-	fd = open(filename, O_WRONLY | O_CREAT | O_TRUNC, S_IRUSR | S_IWUSR);
-	if (fd < 0)
-		return NULL;
-
-	return fdopen(fd, "w");
-}
-
-static void lu_dump_close(FILE *fp)
-{
-	fclose(fp);
-}
-
-static void lu_get_dump_state(struct lu_dump_state *state)
-{
-	struct stat statbuf;
-
-	state->size = 0;
-
-	state->filename = talloc_asprintf(NULL, "%s/state_dump",
-					  xenstore_daemon_rundir());
-	if (!state->filename)
-		barf("Allocation failure");
-
-	state->fd = open(state->filename, O_RDONLY);
-	if (state->fd < 0)
-		return;
-	if (fstat(state->fd, &statbuf) != 0)
-		goto out_close;
-	state->size = statbuf.st_size;
-
-	state->buf = mmap(NULL, state->size, PROT_READ, MAP_PRIVATE,
-			  state->fd, 0);
-	if (state->buf == MAP_FAILED) {
-		state->size = 0;
-		goto out_close;
-	}
-
-	return;
-
- out_close:
-	close(state->fd);
-}
-
-static void lu_close_dump_state(struct lu_dump_state *state)
-{
-	assert(state->filename != NULL);
-
-	munmap(state->buf, state->size);
-	close(state->fd);
-
-	unlink(state->filename);
-	talloc_free(state->filename);
-}
-
-static char *lu_exec(const void *ctx, int argc, char **argv)
-{
-	argv[0] = lu_status->filename;
-	execvp(argv[0], argv);
-
-	return "Error activating new binary.";
-}
-#endif
-
 static bool lu_check_lu_allowed(void)
 {
 	struct connection *conn;
diff --git a/tools/xenstore/xenstored_lu.h b/tools/xenstore/xenstored_lu.h
new file mode 100644
index 0000000000..1c09b9b639
--- /dev/null
+++ b/tools/xenstore/xenstored_lu.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: MIT */
+
+/*
+ * Live Update interfaces for Xen Store Daemon.
+ * Copyright (C) 2022 Juergen Gross, SUSE LLC
+ */
+
+#ifndef NO_LIVE_UPDATE
+struct live_update {
+	/* For verification the correct connection is acting. */
+	struct connection *conn;
+
+	/* Pointer to the command used to request LU */
+	struct buffered_data *in;
+
+#ifdef __MINIOS__
+	void *kernel;
+	unsigned int kernel_size;
+	unsigned int kernel_off;
+
+	void *dump_state;
+	unsigned long dump_size;
+#else
+	char *filename;
+#endif
+
+	char *cmdline;
+
+	/* Start parameters. */
+	bool force;
+	unsigned int timeout;
+	time_t started_at;
+};
+
+struct lu_dump_state {
+	void *buf;
+	unsigned int size;
+#ifndef __MINIOS__
+	int fd;
+	char *filename;
+#endif
+};
+
+extern struct live_update *lu_status;
+
+/* Live update private interfaces. */
+void lu_get_dump_state(struct lu_dump_state *state);
+void lu_close_dump_state(struct lu_dump_state *state);
+FILE *lu_dump_open(const void *ctx);
+void lu_dump_close(FILE *fp);
+char *lu_exec(const void *ctx, int argc, char **argv);
+const char *lu_arch(const void *ctx, struct connection *conn, char **vec,
+		    int num);
+const char *lu_begin(struct connection *conn);
+void lu_destroy_arch(void *data);
+#endif
diff --git a/tools/xenstore/xenstored_lu_daemon.c b/tools/xenstore/xenstored_lu_daemon.c
new file mode 100644
index 0000000000..310fb8c2e6
--- /dev/null
+++ b/tools/xenstore/xenstored_lu_daemon.c
@@ -0,0 +1,130 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+/*
+ * Live Update for Xen Store Daemon.
+ * Copyright (C) 2022 Juergen Gross, SUSE LLC
+ */
+
+#include <assert.h>
+#include <stdio.h>
+#include <syslog.h>
+#include <sys/stat.h>
+#include <sys/mman.h>
+#include <xen-tools/xenstore-common.h>
+
+#include "talloc.h"
+#include "xenstored_core.h"
+#include "xenstored_lu.h"
+
+#ifndef NO_LIVE_UPDATE
+void lu_get_dump_state(struct lu_dump_state *state)
+{
+	struct stat statbuf;
+
+	state->size = 0;
+
+	state->filename = talloc_asprintf(NULL, "%s/state_dump",
+					  xenstore_daemon_rundir());
+	if (!state->filename)
+		barf("Allocation failure");
+
+	state->fd = open(state->filename, O_RDONLY);
+	if (state->fd < 0)
+		return;
+	if (fstat(state->fd, &statbuf) != 0)
+		goto out_close;
+	state->size = statbuf.st_size;
+
+	state->buf = mmap(NULL, state->size, PROT_READ, MAP_PRIVATE,
+			  state->fd, 0);
+	if (state->buf == MAP_FAILED) {
+		state->size = 0;
+		goto out_close;
+	}
+
+	return;
+
+ out_close:
+	close(state->fd);
+}
+
+void lu_close_dump_state(struct lu_dump_state *state)
+{
+	assert(state->filename != NULL);
+
+	munmap(state->buf, state->size);
+	close(state->fd);
+
+	unlink(state->filename);
+	talloc_free(state->filename);
+}
+
+FILE *lu_dump_open(const void *ctx)
+{
+	char *filename;
+	int fd;
+
+	filename = talloc_asprintf(ctx, "%s/state_dump",
+				   xenstore_daemon_rundir());
+	if (!filename)
+		return NULL;
+
+	fd = open(filename, O_WRONLY | O_CREAT | O_TRUNC, S_IRUSR | S_IWUSR);
+	if (fd < 0)
+		return NULL;
+
+	return fdopen(fd, "w");
+}
+
+void lu_dump_close(FILE *fp)
+{
+	fclose(fp);
+}
+
+char *lu_exec(const void *ctx, int argc, char **argv)
+{
+	argv[0] = lu_status->filename;
+	execvp(argv[0], argv);
+
+	return "Error activating new binary.";
+}
+
+void lu_destroy_arch(void *data)
+{
+}
+
+static const char *lu_binary(const void *ctx, struct connection *conn,
+			     const char *filename)
+{
+	const char *ret;
+	struct stat statbuf;
+
+	syslog(LOG_INFO, "live-update: binary %s\n", filename);
+
+	if (stat(filename, &statbuf))
+		return "File not accessible.";
+	if (!(statbuf.st_mode & (S_IXOTH | S_IXGRP | S_IXUSR)))
+		return "File not executable.";
+
+	ret = lu_begin(conn);
+	if (ret)
+		return ret;
+
+	lu_status->filename = talloc_strdup(lu_status, filename);
+	if (!lu_status->filename)
+		return "Allocation failure.";
+
+	errno = 0;
+	return NULL;
+}
+
+const char *lu_arch(const void *ctx, struct connection *conn, char **vec,
+		    int num)
+{
+	if (num == 2 && !strcmp(vec[0], "-f"))
+		return lu_binary(ctx, conn, vec[1]);
+
+	errno = EINVAL;
+	return NULL;
+}
+#endif
diff --git a/tools/xenstore/xenstored_lu_minios.c b/tools/xenstore/xenstored_lu_minios.c
new file mode 100644
index 0000000000..88fb9e0f38
--- /dev/null
+++ b/tools/xenstore/xenstored_lu_minios.c
@@ -0,0 +1,118 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+/*
+ * Live Update for Xen Store Daemon.
+ * Copyright (C) 2022 Juergen Gross, SUSE LLC
+ */
+
+#include <stdbool.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <syslog.h>
+#include <sys/mman.h>
+#include <xenctrl.h>
+#include <xen-tools/common-macros.h>
+
+#include "talloc.h"
+#include "xenstored_lu.h"
+
+/* Mini-OS only knows about MAP_ANON. */
+#ifndef MAP_ANONYMOUS
+#define MAP_ANONYMOUS MAP_ANON
+#endif
+
+#ifndef NO_LIVE_UPDATE
+void lu_get_dump_state(struct lu_dump_state *state)
+{
+}
+
+void lu_close_dump_state(struct lu_dump_state *state)
+{
+}
+
+FILE *lu_dump_open(const void *ctx)
+{
+	lu_status->dump_size = ROUNDUP(talloc_total_size(NULL) * 2,
+				       XC_PAGE_SHIFT);
+	lu_status->dump_state = mmap(NULL, lu_status->dump_size,
+				     PROT_READ | PROT_WRITE,
+				     MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	if (lu_status->dump_state == MAP_FAILED)
+		return NULL;
+
+	return fmemopen(lu_status->dump_state, lu_status->dump_size, "w");
+}
+
+void lu_dump_close(FILE *fp)
+{
+	size_t size;
+
+	size = ftell(fp);
+	size = ROUNDUP(size, XC_PAGE_SHIFT);
+	munmap(lu_status->dump_state + size, lu_status->dump_size - size);
+	lu_status->dump_size = size;
+
+	fclose(fp);
+}
+
+char *lu_exec(const void *ctx, int argc, char **argv)
+{
+	return "NYI";
+}
+
+void lu_destroy_arch(void *data)
+{
+	if (lu_status->dump_state)
+		munmap(lu_status->dump_state, lu_status->dump_size);
+}
+
+static const char *lu_binary_alloc(const void *ctx, struct connection *conn,
+				   unsigned long size)
+{
+	const char *ret;
+
+	syslog(LOG_INFO, "live-update: binary size %lu\n", size);
+
+	ret = lu_begin(conn);
+	if (ret)
+		return ret;
+
+	lu_status->kernel = talloc_size(lu_status, size);
+	if (!lu_status->kernel)
+		return "Allocation failure.";
+
+	lu_status->kernel_size = size;
+	lu_status->kernel_off = 0;
+
+	errno = 0;
+	return NULL;
+}
+
+static const char *lu_binary_save(const void *ctx, struct connection *conn,
+				  unsigned int size, const char *data)
+{
+	if (!lu_status || lu_status->conn != conn)
+		return "Not in live-update session.";
+
+	if (lu_status->kernel_off + size > lu_status->kernel_size)
+		return "Too much kernel data.";
+
+	memcpy(lu_status->kernel + lu_status->kernel_off, data, size);
+	lu_status->kernel_off += size;
+
+	errno = 0;
+	return NULL;
+}
+
+const char *lu_arch(const void *ctx, struct connection *conn, char **vec,
+		    int num)
+{
+	if (num == 2 && !strcmp(vec[0], "-b"))
+		return lu_binary_alloc(ctx, conn, atol(vec[1]));
+	if (num > 2 && !strcmp(vec[0], "-d"))
+		return lu_binary_save(ctx, conn, atoi(vec[1]), vec[2]);
+
+	errno = EINVAL;
+	return NULL;
+}
+#endif
-- 
2.35.3


