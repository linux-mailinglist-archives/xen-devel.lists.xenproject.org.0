Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 325A384E663
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 18:12:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678422.1055732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY7wZ-0003Pe-7J; Thu, 08 Feb 2024 17:12:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678422.1055732; Thu, 08 Feb 2024 17:12:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY7wZ-0003N0-4V; Thu, 08 Feb 2024 17:12:11 +0000
Received: by outflank-mailman (input) for mailman id 678422;
 Thu, 08 Feb 2024 17:12:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m/2e=JR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rY7iT-0005q0-Rk
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 16:57:37 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28ab82da-c6a3-11ee-98f5-efadbce2ee36;
 Thu, 08 Feb 2024 17:57:36 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BF7C522137;
 Thu,  8 Feb 2024 16:57:35 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 803101326D;
 Thu,  8 Feb 2024 16:57:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UW7WHf8HxWV5FAAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 08 Feb 2024 16:57:35 +0000
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
X-Inumbo-ID: 28ab82da-c6a3-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707411455; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GuKS5JMiiFYV782dbcVdzQvPQKcEtbDic1ZOTvla/ok=;
	b=bh/zegVSwS4GGTjmidwlt9YlsWICUBp/6TeLoTe2keAR7KSbkeVfBUVxaZAgRsrqvOXc7a
	kBCPksWfA+MuZhZ7WaU2nn6nXaTTuSGABhZL+RrYyFkcrcvOJnUAPT25nsrRO8XGX9Ab4E
	KJcBuzkAE1vR04wyrTcrdjMhIhDR4GY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707411455; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GuKS5JMiiFYV782dbcVdzQvPQKcEtbDic1ZOTvla/ok=;
	b=bh/zegVSwS4GGTjmidwlt9YlsWICUBp/6TeLoTe2keAR7KSbkeVfBUVxaZAgRsrqvOXc7a
	kBCPksWfA+MuZhZ7WaU2nn6nXaTTuSGABhZL+RrYyFkcrcvOJnUAPT25nsrRO8XGX9Ab4E
	KJcBuzkAE1vR04wyrTcrdjMhIhDR4GY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v5 19/22] tools/xenstored: mount 9pfs device in stubdom
Date: Thu,  8 Feb 2024 17:55:43 +0100
Message-Id: <20240208165546.5715-20-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240208165546.5715-1-jgross@suse.com>
References: <20240208165546.5715-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-2.10 / 50.00];
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
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[suse.com,xen.org,citrix.com,gmail.com,amazon.com];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.10

Mount the 9pfs device in stubdom enabling it to use files.

This has to happen in a worker thread in order to allow the main thread
handling the required Xenstore accesses in parallel.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
V3:
- add logging in case of errors (Julien Grall)
---
 tools/xenstored/core.h   |  6 +++++
 tools/xenstored/domain.c |  2 ++
 tools/xenstored/minios.c | 54 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 62 insertions(+)

diff --git a/tools/xenstored/core.h b/tools/xenstored/core.h
index f6af086f01..fe0ee90581 100644
--- a/tools/xenstored/core.h
+++ b/tools/xenstored/core.h
@@ -36,6 +36,8 @@
 #include "list.h"
 #include "hashtable.h"
 
+#define XENSTORE_LIB_DIR	XEN_LIB_DIR "/xenstore"
+
 #ifndef O_CLOEXEC
 #define O_CLOEXEC 0
 /* O_CLOEXEC support is needed for Live Update in the daemon case. */
@@ -399,6 +401,10 @@ void handle_special_fds(void);
 int get_socket_fd(void);
 void set_socket_fd(int fd);
 
+#ifdef __MINIOS__
+void mount_9pfs(void);
+#endif
+
 /* Close stdin/stdout/stderr to complete daemonize */
 void finish_daemonize(void);
 
diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index 1a7d5e9756..64c8fd0cc3 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -1236,6 +1236,8 @@ void stubdom_init(void)
 		barf_perror("Failed to initialize stubdom");
 
 	xenevtchn_notify(xce_handle, stubdom->port);
+
+	mount_9pfs();
 #endif
 }
 
diff --git a/tools/xenstored/minios.c b/tools/xenstored/minios.c
index 22ac8defbd..562a9b4972 100644
--- a/tools/xenstored/minios.c
+++ b/tools/xenstored/minios.c
@@ -17,10 +17,20 @@
 */
 #include <sys/types.h>
 #include <sys/mman.h>
+#include <syslog.h>
+#include "talloc.h"
 #include "core.h"
 #include "utils.h"
 #include <xen/grant_table.h>
 #include <mini-os/lib.h>
+#include <mini-os/9pfront.h>
+#include <mini-os/sched.h>
+#include <mini-os/xenbus.h>
+#include <mini-os/xmalloc.h>
+
+#define P9_STATE_PATH	"device/9pfs/0/state"
+
+static void *p9_device;
 
 void finish_daemonize(void)
 {
@@ -74,3 +84,47 @@ int get_socket_fd(void)
 void set_socket_fd(int fd)
 {
 }
+
+static void mount_thread(void *p)
+{
+	xenbus_event_queue events = NULL;
+	char *err;
+	char *dummy;
+
+	err = xenbus_watch_path_token(XBT_NIL, P9_STATE_PATH, "9pfs", &events);
+	if (err) {
+		log("error \"%s\" when setting watch on \"%s\"\n", err,
+		    P9_STATE_PATH);
+		free(err);
+		return;
+	}
+
+	for (;;) {
+		xenbus_wait_for_watch(&events);
+
+		/*
+		 * We only care for existence of the state node.
+		 * State changes are handled in init_9pfront().
+		 */
+		err = xenbus_read(XBT_NIL, P9_STATE_PATH, &dummy);
+		if (!err)
+			break;
+		free(err);
+	}
+
+	free(dummy);
+
+	err = xenbus_unwatch_path_token(XBT_NIL, P9_STATE_PATH, "9pfs");
+	if (err) {
+		log("error \"%s\" when unwatching \"%s\", leaking watch\n",
+		    err, P9_STATE_PATH);
+		free(err);
+	}
+
+	p9_device = init_9pfront(0, XENSTORE_LIB_DIR);
+}
+
+void mount_9pfs(void)
+{
+	create_thread("mount-9pfs", mount_thread, NULL);
+}
-- 
2.35.3


