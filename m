Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC031823E6A
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 10:13:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661331.1031123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLJnJ-0001ID-4i; Thu, 04 Jan 2024 09:13:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661331.1031123; Thu, 04 Jan 2024 09:13:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLJnJ-0001Eg-1U; Thu, 04 Jan 2024 09:13:41 +0000
Received: by outflank-mailman (input) for mailman id 661331;
 Thu, 04 Jan 2024 09:13:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4u2H=IO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rLJdo-00085z-7J
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 09:03:52 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2dd082b5-aae0-11ee-98ef-6d05b1d4d9a1;
 Thu, 04 Jan 2024 10:03:51 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 20C2D1F7F9;
 Thu,  4 Jan 2024 09:03:51 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D959713722;
 Thu,  4 Jan 2024 09:03:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id EX3KM3Z0lmVxWQAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 04 Jan 2024 09:03:50 +0000
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
X-Inumbo-ID: 2dd082b5-aae0-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1704359031; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l9WYZ2iW1RdmjGibq9R7j87elTm1vcsn9R88rXyUUm0=;
	b=aEx8FKBo4+XJhZY/OUXfWBn34j3uoghPNj1AUc4RaBJJq6AbpPfOqaRiqumOBidao8jErn
	2KnWyxX2JAHC0xx3XVIWap3pz+61pi36rHE8wsRHw05+OZMExGSGf5StZ+XZ0Kq8oT5Ec/
	NuROYfKHD5UKTccpVFmutBGByXRkH0Q=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1704359031; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l9WYZ2iW1RdmjGibq9R7j87elTm1vcsn9R88rXyUUm0=;
	b=aEx8FKBo4+XJhZY/OUXfWBn34j3uoghPNj1AUc4RaBJJq6AbpPfOqaRiqumOBidao8jErn
	2KnWyxX2JAHC0xx3XVIWap3pz+61pi36rHE8wsRHw05+OZMExGSGf5StZ+XZ0Kq8oT5Ec/
	NuROYfKHD5UKTccpVFmutBGByXRkH0Q=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH v3 31/33] tools/xenstored: add helpers for filename handling
Date: Thu,  4 Jan 2024 10:00:53 +0100
Message-Id: <20240104090055.27323-32-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240104090055.27323-1-jgross@suse.com>
References: <20240104090055.27323-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: *
X-Spam-Score: 1.20
X-Spamd-Result: default: False [1.20 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 REPLY(-4.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[6];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 NEURAL_SPAM_LONG(3.50)[1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[suse.com,xen.org,citrix.com,gmail.com];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
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
index b648af16fa..711be878dc 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -65,7 +65,7 @@ char **orig_argv;
 LIST_HEAD(connections);
 int tracefd = -1;
 bool keep_orphans = false;
-char *tracefile = NULL;
+const char *tracefile = NULL;
 static struct hashtable *nodes;
 unsigned int trace_flags = TRACE_OBJ | TRACE_IO;
 
@@ -139,6 +139,17 @@ void trace_destroy(const void *data, const char *type)
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
@@ -2761,7 +2772,7 @@ int main(int argc, char *argv[])
 #endif
 
 	if (tracefile)
-		tracefile = talloc_strdup(NULL, tracefile);
+		tracefile = absolute_filename(NULL, tracefile);
 
 #ifndef NO_LIVE_UPDATE
 	/* Read state in case of live update. */
diff --git a/tools/xenstored/core.h b/tools/xenstored/core.h
index 0cb3a272b5..9a5615fcbe 100644
--- a/tools/xenstored/core.h
+++ b/tools/xenstored/core.h
@@ -343,7 +343,7 @@ extern int sock;
 extern int orig_argc;
 extern char **orig_argv;
 
-extern char *tracefile;
+extern const char *tracefile;
 extern int tracefd;
 
 /* Trace flag values must be kept in sync with trace_switches[] contents. */
@@ -404,6 +404,9 @@ void handle_special_fds(void);
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
index 10e1765f8d..24fc3150b7 100644
--- a/tools/xenstored/minios.c
+++ b/tools/xenstored/minios.c
@@ -119,3 +119,8 @@ void mount_9pfs(void)
 {
 	create_thread("mount-9pfs", mount_thread, NULL);
 }
+
+const char *xenstore_rundir(void)
+{
+	return XENSTORE_LIB_DIR;
+}
diff --git a/tools/xenstored/posix.c b/tools/xenstored/posix.c
index f72c8406d2..ad6e874c1e 100644
--- a/tools/xenstored/posix.c
+++ b/tools/xenstored/posix.c
@@ -325,9 +325,10 @@ void early_init(bool live_update, bool dofork, const char *pidfile)
 {
 	reopen_log();
 
-	/* Make sure xenstored directory exists. */
+	/* Make sure xenstored directories exist. */
 	/* Errors ignored here, will be reported when we open files */
 	mkdir(xenstore_daemon_rundir(), 0755);
+	mkdir(XENSTORE_LIB_DIR, 0755);
 
 	if (dofork) {
 		openlog("xenstored", 0, LOG_DAEMON);
@@ -394,3 +395,8 @@ void late_init(bool live_update)
 	}
 #endif
 }
+
+const char *xenstore_rundir(void)
+{
+	return xenstore_daemon_rundir();
+}
-- 
2.35.3


