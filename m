Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 614F57E7DB0
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 17:17:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630546.983493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UC8-0001SZ-Sc; Fri, 10 Nov 2023 16:17:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630546.983493; Fri, 10 Nov 2023 16:17:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UC8-0001Pz-Pc; Fri, 10 Nov 2023 16:17:20 +0000
Received: by outflank-mailman (input) for mailman id 630546;
 Fri, 10 Nov 2023 16:17:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ap16=GX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r1U5a-0004cS-2b
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 16:10:34 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac846114-7fe3-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 17:10:32 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 49A921F8BD;
 Fri, 10 Nov 2023 16:10:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 18D7613398;
 Fri, 10 Nov 2023 16:10:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ubq6BPhVTmWSCQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 10 Nov 2023 16:10:32 +0000
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
X-Inumbo-ID: ac846114-7fe3-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699632632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vjpc0T/4VDXSdpS0hg0yt0ghHsFzK4h1yp4x3xySp2A=;
	b=UWQ1RfvWe7PzM+1PAIbvRRjdmVKfRv8umPLDKPIbGnGzLw0XROY+nREvsGOO9HtMH27Efd
	4o0zmdHM6ehW3nrFSeDrFTjSAfEFlKjxD2+DlMfqm+qLw0cKntpft2llj2mBZYj3VuVDTJ
	9HOmUIo5r9ewC648rFQTe1ycIjia7aU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH v2 26/29] tools/xenstored: mount 9pfs device in stubdom
Date: Fri, 10 Nov 2023 17:08:01 +0100
Message-Id: <20231110160804.29021-27-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231110160804.29021-1-jgross@suse.com>
References: <20231110160804.29021-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mount the 9pfs device in stubdom enabling it to use files.

This has to happen in a worker thread in order to allow the main thread
handling the required Xenstore accesses in parallel.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/xenstored/core.h   |  4 ++++
 tools/xenstored/domain.c |  2 ++
 tools/xenstored/minios.c | 36 ++++++++++++++++++++++++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/tools/xenstored/core.h b/tools/xenstored/core.h
index 3c28007d11..a0d3592961 100644
--- a/tools/xenstored/core.h
+++ b/tools/xenstored/core.h
@@ -389,6 +389,10 @@ static inline bool domain_is_unprivileged(const struct connection *conn)
 evtchn_port_t get_xenbus_evtchn(void);
 void early_init(void);
 
+#ifdef __MINIOS__
+void mount_9pfs(void);
+#endif
+
 /* Write out the pidfile */
 void write_pidfile(const char *pidfile);
 
diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index 162b87b460..4263c1360f 100644
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
index 202d70387a..fddbede869 100644
--- a/tools/xenstored/minios.c
+++ b/tools/xenstored/minios.c
@@ -19,8 +19,16 @@
 #include <sys/mman.h>
 #include "core.h"
 #include <xen/grant_table.h>
+#include <mini-os/9pfront.h>
 #include <mini-os/events.h>
 #include <mini-os/gnttab.h>
+#include <mini-os/sched.h>
+#include <mini-os/xenbus.h>
+#include <mini-os/xmalloc.h>
+
+#define P9_STATE_PATH	"device/9pfs/0/state"
+
+static void *p9_device;
 
 void write_pidfile(const char *pidfile)
 {
@@ -62,3 +70,31 @@ void early_init(void)
 	if (stub_domid == DOMID_INVALID)
 		barf("could not get own domid");
 }
+
+static void mount_thread(void *p)
+{
+	xenbus_event_queue events = NULL;
+	char *err;
+	char *dummy;
+
+	free(xenbus_watch_path_token(XBT_NIL, P9_STATE_PATH, "9pfs", &events));
+
+	for (;;) {
+		xenbus_wait_for_watch(&events);
+		err = xenbus_read(XBT_NIL, P9_STATE_PATH, &dummy);
+		if (!err)
+			break;
+		free(err);
+	}
+
+	free(dummy);
+
+	free(xenbus_unwatch_path_token(XBT_NIL, P9_STATE_PATH, "9pfs"));
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


