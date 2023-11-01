Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE5B7DDEB4
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 10:50:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626315.976481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7ry-0002vl-PL; Wed, 01 Nov 2023 09:50:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626315.976481; Wed, 01 Nov 2023 09:50:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7ry-0002ti-Mi; Wed, 01 Nov 2023 09:50:38 +0000
Received: by outflank-mailman (input) for mailman id 626315;
 Wed, 01 Nov 2023 09:50:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFMy=GO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qy7di-0005E0-KQ
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 09:35:54 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d53b678-789a-11ee-98d6-6d05b1d4d9a1;
 Wed, 01 Nov 2023 10:35:54 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B5C2A1F74A;
 Wed,  1 Nov 2023 09:35:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8814D13460;
 Wed,  1 Nov 2023 09:35:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WHvNH/kbQmWoCQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 01 Nov 2023 09:35:53 +0000
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
X-Inumbo-ID: 0d53b678-789a-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698831353; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O8ibJTSvpdBw5QYEwaYDmGyzTvOSMmm8TeHf7YRE1kM=;
	b=NYPZa+Qtfa6ex1QlDJbLznL9uTxygKINAzDvHcaSd7HR9tN2w136SHDzRvvt+HJhXXOJR4
	4Y22JZdLc4JC+hqPZnA3p5Bzw8sI29uD3iV338qi9Zmy6jam6KZUq/7IUSU+powDzybeX4
	OaCxlTf9M6X+uOyoowsh2PVDYZpwlHQ=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 26/29] tools/xenstored: add helpers for filename handling
Date: Wed,  1 Nov 2023 10:33:22 +0100
Message-Id: <20231101093325.30302-27-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231101093325.30302-1-jgross@suse.com>
References: <20231101093325.30302-1-jgross@suse.com>
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
---
 tools/xenstored/core.c      | 9 ++++++++-
 tools/xenstored/core.h      | 3 +++
 tools/xenstored/lu_daemon.c | 4 ++--
 tools/xenstored/minios.c    | 5 +++++
 tools/xenstored/posix.c     | 6 ++++++
 5 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index 1764b1af4e..9f48d91027 100644
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
@@ -2995,7 +3002,7 @@ int main(int argc, char *argv[])
 
 	signal(SIGHUP, trigger_reopen_log);
 	if (tracefile)
-		tracefile = talloc_strdup(NULL, tracefile);
+		tracefile = absolute_filename(NULL, tracefile);
 
 #ifndef NO_LIVE_UPDATE
 	/* Read state in case of live update. */
diff --git a/tools/xenstored/core.h b/tools/xenstored/core.h
index 48ff659ec5..d3cd4a4c8a 100644
--- a/tools/xenstored/core.h
+++ b/tools/xenstored/core.h
@@ -391,6 +391,9 @@ evtchn_port_t get_xenbus_evtchn(void);
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
index e5a3684df6..104f37587b 100644
--- a/tools/xenstored/minios.c
+++ b/tools/xenstored/minios.c
@@ -89,3 +89,8 @@ void mount_9pfs(void)
 {
 	create_thread("mount-9pfs", mount_thread, NULL);
 }
+
+const char *xenstore_rundir(void)
+{
+	return XENSTORE_LIB_DIR;
+}
diff --git a/tools/xenstored/posix.c b/tools/xenstored/posix.c
index 7e03dd982d..d02d0e446f 100644
--- a/tools/xenstored/posix.c
+++ b/tools/xenstored/posix.c
@@ -22,6 +22,7 @@
 #include <fcntl.h>
 #include <stdlib.h>
 #include <sys/mman.h>
+#include <xen-tools/xenstore-common.h>
 
 #include "utils.h"
 #include "core.h"
@@ -157,3 +158,8 @@ void *xenbus_map(void)
 
 	return addr;
 }
+
+const char *xenstore_rundir(void)
+{
+	return xenstore_daemon_rundir();
+}
-- 
2.35.3


