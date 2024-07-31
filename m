Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 545D89431EE
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 16:22:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768850.1179735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZADN-00042O-IQ; Wed, 31 Jul 2024 14:22:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768850.1179735; Wed, 31 Jul 2024 14:22:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZADN-00040E-Fl; Wed, 31 Jul 2024 14:22:05 +0000
Received: by outflank-mailman (input) for mailman id 768850;
 Wed, 31 Jul 2024 14:22:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q60C=O7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sZADL-000408-BW
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 14:22:03 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40c91def-4f48-11ef-bc01-fd08da9f4363;
 Wed, 31 Jul 2024 16:22:01 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A65E121A76;
 Wed, 31 Jul 2024 14:22:00 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2D11113297;
 Wed, 31 Jul 2024 14:22:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id IMCIBohIqmYUcgAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 31 Jul 2024 14:22:00 +0000
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
X-Inumbo-ID: 40c91def-4f48-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1722435720; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7mEV6FBKDKSqt9G6779eXwv4cL6V1HZ0tJ+9CBxn9dI=;
	b=IjsCMi24La/xL2+ceJ7UkiXOBzTOXmiWACUeDV+DTKQhAoE089aFAqxalZ7R5HfBZuHDGz
	v3njT4eb0tjfkDYwi12niYSWl5UfNoZbioluOpx64yVmjUj+5O30YrWbZjPUgfy/SZxzG9
	dEuupQQqo0OE/YownjBXEatcy2RkYHM=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=IjsCMi24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1722435720; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7mEV6FBKDKSqt9G6779eXwv4cL6V1HZ0tJ+9CBxn9dI=;
	b=IjsCMi24La/xL2+ceJ7UkiXOBzTOXmiWACUeDV+DTKQhAoE089aFAqxalZ7R5HfBZuHDGz
	v3njT4eb0tjfkDYwi12niYSWl5UfNoZbioluOpx64yVmjUj+5O30YrWbZjPUgfy/SZxzG9
	dEuupQQqo0OE/YownjBXEatcy2RkYHM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH] tools/xenstored: switch stubdom live update to use file for state
Date: Wed, 31 Jul 2024 16:21:56 +0200
Message-ID: <20240731142156.10723-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [0.19 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim]
X-Spamd-Bar: /
X-Rspamd-Queue-Id: A65E121A76
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: 0.19

With the introduction of 9pfs for Xenstore-stubdom it is now possible
to use a file for saving the state when doing live update.

This allows to move some environment specific actions back to the
common source file lu.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstored/lu.c        | 75 ++++++++++++++++++++++++++++++++++++-
 tools/xenstored/lu.h        | 19 +---------
 tools/xenstored/lu_daemon.c | 72 -----------------------------------
 tools/xenstored/lu_minios.c | 49 ------------------------
 4 files changed, 75 insertions(+), 140 deletions(-)

diff --git a/tools/xenstored/lu.c b/tools/xenstored/lu.c
index 2f41d10c95..bec2a84e10 100644
--- a/tools/xenstored/lu.c
+++ b/tools/xenstored/lu.c
@@ -11,6 +11,8 @@
 #include <stdlib.h>
 #include <syslog.h>
 #include <time.h>
+#include <sys/mman.h>
+#include <sys/stat.h>
 
 #include "talloc.h"
 #include "core.h"
@@ -19,11 +21,18 @@
 #include "watch.h"
 
 #ifndef NO_LIVE_UPDATE
+
+struct lu_dump_state {
+	void *buf;
+	unsigned int size;
+	int fd;
+	char *filename;
+};
+
 struct live_update *lu_status;
 
 static int lu_destroy(void *data)
 {
-	lu_destroy_arch(data);
 	lu_status = NULL;
 
 	return 0;
@@ -70,6 +79,48 @@ bool lu_is_pending(void)
 	return lu_status != NULL;
 }
 
+static void lu_get_dump_state(struct lu_dump_state *state)
+{
+	struct stat statbuf;
+
+	state->size = 0;
+
+	state->filename = talloc_asprintf(NULL, "%s/state_dump",
+					  xenstore_rundir());
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
+static void lu_close_dump_state(struct lu_dump_state *state)
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
 void lu_read_state(void)
 {
 	struct lu_dump_state state = {};
@@ -197,6 +248,28 @@ static const char *lu_reject_reason(const void *ctx)
 	return ret ? (const char *)ret : "Overlapping transactions";
 }
 
+static FILE *lu_dump_open(const void *ctx)
+{
+	char *filename;
+	int fd;
+
+	filename = talloc_asprintf(ctx, "%s/state_dump",
+				   xenstore_rundir());
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
+static void lu_dump_close(FILE *fp)
+{
+	fclose(fp);
+}
+
 static const char *lu_dump_state(const void *ctx, struct connection *conn)
 {
 	FILE *fp;
diff --git a/tools/xenstored/lu.h b/tools/xenstored/lu.h
index ac3c572ca8..dacc9b6e42 100644
--- a/tools/xenstored/lu.h
+++ b/tools/xenstored/lu.h
@@ -18,12 +18,9 @@ struct live_update {
 	unsigned int kernel_size;
 	unsigned int kernel_off;
 
-	void *dump_state;
-	unsigned long dump_size;
-#else
-	char *filename;
 #endif
 
+	char *filename;
 	char *cmdline;
 
 	/* Start parameters. */
@@ -32,15 +29,6 @@ struct live_update {
 	time_t started_at;
 };
 
-struct lu_dump_state {
-	void *buf;
-	unsigned int size;
-#ifndef __MINIOS__
-	int fd;
-	char *filename;
-#endif
-};
-
 extern struct live_update *lu_status;
 
 struct connection *lu_get_connection(void);
@@ -54,15 +42,10 @@ int do_control_lu(const void *ctx, struct connection *conn, const char **vec,
 		  int num);
 
 /* Live update private interfaces. */
-void lu_get_dump_state(struct lu_dump_state *state);
-void lu_close_dump_state(struct lu_dump_state *state);
-FILE *lu_dump_open(const void *ctx);
-void lu_dump_close(FILE *fp);
 char *lu_exec(const void *ctx, int argc, char **argv);
 const char *lu_arch(const void *ctx, struct connection *conn, const char **vec,
 		    int num);
 const char *lu_begin(struct connection *conn);
-void lu_destroy_arch(void *data);
 #else
 static inline struct connection *lu_get_connection(void)
 {
diff --git a/tools/xenstored/lu_daemon.c b/tools/xenstored/lu_daemon.c
index 6351111ab0..6df6c80a2a 100644
--- a/tools/xenstored/lu_daemon.c
+++ b/tools/xenstored/lu_daemon.c
@@ -5,82 +5,14 @@
  * Copyright (C) 2022 Juergen Gross, SUSE LLC
  */
 
-#include <assert.h>
-#include <stdio.h>
 #include <syslog.h>
 #include <sys/stat.h>
-#include <sys/mman.h>
-#include <xen-tools/xenstore-common.h>
 
 #include "talloc.h"
 #include "core.h"
 #include "lu.h"
 
 #ifndef NO_LIVE_UPDATE
-void lu_get_dump_state(struct lu_dump_state *state)
-{
-	struct stat statbuf;
-
-	state->size = 0;
-
-	state->filename = talloc_asprintf(NULL, "%s/state_dump",
-					  xenstore_rundir());
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
-void lu_close_dump_state(struct lu_dump_state *state)
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
-FILE *lu_dump_open(const void *ctx)
-{
-	char *filename;
-	int fd;
-
-	filename = talloc_asprintf(ctx, "%s/state_dump",
-				   xenstore_rundir());
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
-void lu_dump_close(FILE *fp)
-{
-	fclose(fp);
-}
-
 char *lu_exec(const void *ctx, int argc, char **argv)
 {
 	argv[0] = lu_status->filename;
@@ -89,10 +21,6 @@ char *lu_exec(const void *ctx, int argc, char **argv)
 	return "Error activating new binary.";
 }
 
-void lu_destroy_arch(void *data)
-{
-}
-
 static const char *lu_binary(const void *ctx, struct connection *conn,
 			     const char *filename)
 {
diff --git a/tools/xenstored/lu_minios.c b/tools/xenstored/lu_minios.c
index ede8b4dd47..b14a0b29d5 100644
--- a/tools/xenstored/lu_minios.c
+++ b/tools/xenstored/lu_minios.c
@@ -5,67 +5,18 @@
  * Copyright (C) 2022 Juergen Gross, SUSE LLC
  */
 
-#include <stdbool.h>
-#include <stdio.h>
 #include <stdlib.h>
 #include <syslog.h>
-#include <sys/mman.h>
-#include <xenctrl.h>
-#include <xen-tools/common-macros.h>
 
 #include "talloc.h"
 #include "lu.h"
 
-/* Mini-OS only knows about MAP_ANON. */
-#ifndef MAP_ANONYMOUS
-#define MAP_ANONYMOUS MAP_ANON
-#endif
-
 #ifndef NO_LIVE_UPDATE
-void lu_get_dump_state(struct lu_dump_state *state)
-{
-}
-
-void lu_close_dump_state(struct lu_dump_state *state)
-{
-}
-
-FILE *lu_dump_open(const void *ctx)
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
-void lu_dump_close(FILE *fp)
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
 char *lu_exec(const void *ctx, int argc, char **argv)
 {
 	return "NYI";
 }
 
-void lu_destroy_arch(void *data)
-{
-	if (lu_status->dump_state)
-		munmap(lu_status->dump_state, lu_status->dump_size);
-}
-
 static const char *lu_binary_alloc(const void *ctx, struct connection *conn,
 				   unsigned long size)
 {
-- 
2.43.0


