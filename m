Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AE97E7DBD
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 17:22:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630575.983558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UHQ-0006e4-92; Fri, 10 Nov 2023 16:22:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630575.983558; Fri, 10 Nov 2023 16:22:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UHQ-0006bb-20; Fri, 10 Nov 2023 16:22:48 +0000
Received: by outflank-mailman (input) for mailman id 630575;
 Fri, 10 Nov 2023 16:22:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ap16=GX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r1U5f-0004cS-Og
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 16:10:39 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afde8a42-7fe3-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 17:10:38 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E007D1F8BD;
 Fri, 10 Nov 2023 16:10:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AF21513398;
 Fri, 10 Nov 2023 16:10:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id e4pqKf1VTmWeCQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 10 Nov 2023 16:10:37 +0000
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
X-Inumbo-ID: afde8a42-7fe3-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699632637; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EdPFyHzBpfLl8phFJP9JfSgms8FOuRsGhsZ9dt1Y3Sc=;
	b=m0XrOh53fEJ9STIBbKVJWxUtB8+DijG8ygb8l3kfLXPp1nI7/bIGjudfFj539KZHZylQ5S
	hLXY7mZIZ2HflDL+s7bVUCeqd396OPLRW0M0u4IlOVO1LOBT1GyyNf0zjSa2bK5SK4JHp7
	iTUthuAWy5/5jovqiK3qhEaE8AQx2fs=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH v2 27/29] tools/xenstored: add helpers for filename handling
Date: Fri, 10 Nov 2023 17:08:02 +0100
Message-Id: <20231110160804.29021-28-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231110160804.29021-1-jgross@suse.com>
References: <20231110160804.29021-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
 tools/xenstored/core.c      | 9 ++++++++-
 tools/xenstored/core.h      | 3 +++
 tools/xenstored/lu_daemon.c | 4 ++--
 tools/xenstored/minios.c    | 5 +++++
 tools/xenstored/posix.c     | 5 +++++
 5 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index 4a9d874f17..77befd24c9 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -158,6 +158,13 @@ void trace_destroy(const void *data, const char *type)
 		trace("obj: DESTROY %s %p\n", type, data);
 }
 
+char *absolute_filename(const void *ctx, const char *filename)
+{
+	if (filename[0] != '/')
+		return talloc_asprintf(ctx, XENSTORE_LIB_DIR "/%s", filename);
+	return talloc_strdup(ctx, filename);
+}
+
 /**
  * Signal handler for SIGHUP, which requests that the trace log is reopened
  * (in the main loop).  A single byte is written to reopen_log_pipe, to awaken
@@ -2983,7 +2990,7 @@ int main(int argc, char *argv[])
 
 	signal(SIGHUP, trigger_reopen_log);
 	if (tracefile)
-		tracefile = talloc_strdup(NULL, tracefile);
+		tracefile = absolute_filename(NULL, tracefile);
 
 #ifndef NO_LIVE_UPDATE
 	/* Read state in case of live update. */
diff --git a/tools/xenstored/core.h b/tools/xenstored/core.h
index a0d3592961..51e1dddb22 100644
--- a/tools/xenstored/core.h
+++ b/tools/xenstored/core.h
@@ -393,6 +393,9 @@ void early_init(void);
 void mount_9pfs(void);
 #endif
 
+const char *xenstore_rundir(void);
+char *absolute_filename(const void *ctx, const char *filename);
+
 /* Write out the pidfile */
 void write_pidfile(const char *pidfile);
 
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
index fddbede869..cfc2377857 100644
--- a/tools/xenstored/minios.c
+++ b/tools/xenstored/minios.c
@@ -98,3 +98,8 @@ void mount_9pfs(void)
 {
 	create_thread("mount-9pfs", mount_thread, NULL);
 }
+
+const char *xenstore_rundir(void)
+{
+	return XENSTORE_LIB_DIR;
+}
diff --git a/tools/xenstored/posix.c b/tools/xenstored/posix.c
index fcb7791bd7..76f5c9ab84 100644
--- a/tools/xenstored/posix.c
+++ b/tools/xenstored/posix.c
@@ -168,3 +168,8 @@ void early_init(void)
 	mkdir(xenstore_daemon_rundir(), 0755);
 	mkdir(XENSTORE_LIB_DIR, 0755);
 }
+
+const char *xenstore_rundir(void)
+{
+	return xenstore_daemon_rundir();
+}
-- 
2.35.3


