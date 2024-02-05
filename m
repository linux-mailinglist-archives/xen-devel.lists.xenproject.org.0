Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F406C849841
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 11:59:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675893.1051576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwgt-0002MM-Hg; Mon, 05 Feb 2024 10:59:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675893.1051576; Mon, 05 Feb 2024 10:59:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwgt-0002Jl-DZ; Mon, 05 Feb 2024 10:59:07 +0000
Received: by outflank-mailman (input) for mailman id 675893;
 Mon, 05 Feb 2024 10:59:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b4fC=JO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rWwar-0002wU-Sm
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 10:52:53 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6364be0-c414-11ee-8a45-1f161083a0e0;
 Mon, 05 Feb 2024 11:52:53 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0023422100;
 Mon,  5 Feb 2024 10:52:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B63F1132DD;
 Mon,  5 Feb 2024 10:52:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 9ar+KgS+wGUGNwAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 05 Feb 2024 10:52:52 +0000
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
X-Inumbo-ID: b6364be0-c414-11ee-8a45-1f161083a0e0
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v4 30/32] tools/xenstored: add helpers for filename handling
Date: Mon,  5 Feb 2024 11:49:59 +0100
Message-Id: <20240205105001.24171-31-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240205105001.24171-1-jgross@suse.com>
References: <20240205105001.24171-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	none
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 0023422100
X-Spam-Flag: NO

Add some helpers for handling filenames which might need different
implementations between stubdom and daemon environments:

- expansion of relative filenames (those are not really defined today,
  just expand them to be relative to /var/lib/xen/xenstore)
- expansion of xenstore_daemon_rundir() (used e.g. for saving the state
  file in case of live update - needs to be unchanged in the daemon
  case, but should result in /var/lib/xen/xenstore for stubdom)

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
V3:
- make absolute_filename() return a pointer to const (Julien Grall)
---
 tools/xenstored/core.c      | 15 +++++++++++++--
 tools/xenstored/core.h      |  5 ++++-
 tools/xenstored/lu_daemon.c |  4 ++--
 tools/xenstored/minios.c    |  5 +++++
 tools/xenstored/posix.c     |  8 +++++++-
 5 files changed, 31 insertions(+), 6 deletions(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index 48fc787ac1..bada1ad9a2 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -63,7 +63,7 @@ char **orig_argv;
 LIST_HEAD(connections);
 int tracefd = -1;
 bool keep_orphans = false;
-char *tracefile = NULL;
+const char *tracefile = NULL;
 static struct hashtable *nodes;
 unsigned int trace_flags = TRACE_OBJ | TRACE_IO;
 
@@ -137,6 +137,17 @@ void trace_destroy(const void *data, const char *type)
 		trace("obj: DESTROY %s %p\n", type, data);
 }
 
+/*
+ * Return an absolute filename.
+ * In case of a relative filename given as input, prepend XENSTORE_LIB_DIR.
+ */
+const char *absolute_filename(const void *ctx, const char *filename)
+{
+	if (filename[0] != '/')
+		return talloc_asprintf(ctx, XENSTORE_LIB_DIR "/%s", filename);
+	return talloc_strdup(ctx, filename);
+}
+
 void close_log(void)
 {
 	if (tracefd >= 0)
@@ -2759,7 +2770,7 @@ int main(int argc, char *argv[])
 #endif
 
 	if (tracefile)
-		tracefile = talloc_strdup(NULL, tracefile);
+		tracefile = absolute_filename(NULL, tracefile);
 
 #ifndef NO_LIVE_UPDATE
 	/* Read state in case of live update. */
diff --git a/tools/xenstored/core.h b/tools/xenstored/core.h
index fe0ee90581..e58779e88c 100644
--- a/tools/xenstored/core.h
+++ b/tools/xenstored/core.h
@@ -341,7 +341,7 @@ void close_log(void);
 extern int orig_argc;
 extern char **orig_argv;
 
-extern char *tracefile;
+extern const char *tracefile;
 extern int tracefd;
 
 /* Trace flag values must be kept in sync with trace_switches[] contents. */
@@ -405,6 +405,9 @@ void set_socket_fd(int fd);
 void mount_9pfs(void);
 #endif
 
+const char *xenstore_rundir(void);
+const char *absolute_filename(const void *ctx, const char *filename);
+
 /* Close stdin/stdout/stderr to complete daemonize */
 void finish_daemonize(void);
 
diff --git a/tools/xenstored/lu_daemon.c b/tools/xenstored/lu_daemon.c
index 71bcabadd3..6351111ab0 100644
--- a/tools/xenstored/lu_daemon.c
+++ b/tools/xenstored/lu_daemon.c
@@ -24,7 +24,7 @@ void lu_get_dump_state(struct lu_dump_state *state)
 	state->size = 0;
 
 	state->filename = talloc_asprintf(NULL, "%s/state_dump",
-					  xenstore_daemon_rundir());
+					  xenstore_rundir());
 	if (!state->filename)
 		barf("Allocation failure");
 
@@ -65,7 +65,7 @@ FILE *lu_dump_open(const void *ctx)
 	int fd;
 
 	filename = talloc_asprintf(ctx, "%s/state_dump",
-				   xenstore_daemon_rundir());
+				   xenstore_rundir());
 	if (!filename)
 		return NULL;
 
diff --git a/tools/xenstored/minios.c b/tools/xenstored/minios.c
index 562a9b4972..e70386f8c7 100644
--- a/tools/xenstored/minios.c
+++ b/tools/xenstored/minios.c
@@ -128,3 +128,8 @@ void mount_9pfs(void)
 {
 	create_thread("mount-9pfs", mount_thread, NULL);
 }
+
+const char *xenstore_rundir(void)
+{
+	return XENSTORE_LIB_DIR;
+}
diff --git a/tools/xenstored/posix.c b/tools/xenstored/posix.c
index 496329dfd1..d88c82d972 100644
--- a/tools/xenstored/posix.c
+++ b/tools/xenstored/posix.c
@@ -326,9 +326,10 @@ void early_init(bool live_update, bool dofork, const char *pidfile)
 {
 	reopen_log();
 
-	/* Make sure xenstored directory exists. */
+	/* Make sure xenstored directories exist. */
 	/* Errors ignored here, will be reported when we open files */
 	mkdir(xenstore_daemon_rundir(), 0755);
+	mkdir(XENSTORE_LIB_DIR, 0755);
 
 	if (dofork) {
 		openlog("xenstored", 0, LOG_DAEMON);
@@ -406,3 +407,8 @@ void set_socket_fd(int fd)
 {
 	sock = fd;
 }
+
+const char *xenstore_rundir(void)
+{
+	return xenstore_daemon_rundir();
+}
-- 
2.35.3


