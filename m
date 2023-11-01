Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF177DDEA4
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 10:43:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626281.976401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7lA-0004sx-Dt; Wed, 01 Nov 2023 09:43:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626281.976401; Wed, 01 Nov 2023 09:43:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7lA-0004rG-B6; Wed, 01 Nov 2023 09:43:36 +0000
Received: by outflank-mailman (input) for mailman id 626281;
 Wed, 01 Nov 2023 09:43:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFMy=GO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qy7dc-0005E0-SC
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 09:35:48 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09ffa01c-789a-11ee-98d6-6d05b1d4d9a1;
 Wed, 01 Nov 2023 10:35:48 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2A5291F74A;
 Wed,  1 Nov 2023 09:35:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F2EC813460;
 Wed,  1 Nov 2023 09:35:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Nw32OfMbQmWbCQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 01 Nov 2023 09:35:47 +0000
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
X-Inumbo-ID: 09ffa01c-789a-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698831348; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tql+TwCFijc3h7ziLqKYIH9oAU5Ll8hidyNHEMqapi8=;
	b=tf7oOnno8VcyQjNgDDdCvapvHU1C0OEkpFM44RMBVHYVi3DFKOdHulwj2aNhbBqjE7xo0c
	kscb0hjhSIhvKNK7RAvnL5424iCWY0XQMWLx5e2l9C3vzGs+QcSdArdpyPe5laET9Tbfan
	DFu5CcbwESWCvybaaspba7xiwzmO5+s=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 25/29] tools/xenstored: mount 9pfs device in stubdom
Date: Wed,  1 Nov 2023 10:33:21 +0100
Message-Id: <20231101093325.30302-26-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231101093325.30302-1-jgross@suse.com>
References: <20231101093325.30302-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mount the 9pfs device in stubdom enabling it to use files.

This has to happen in a worker thread in order to allow the main thread
handling the required Xenstore accesses in parallel.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstored/core.h   |  5 +++++
 tools/xenstored/domain.c |  2 ++
 tools/xenstored/minios.c | 35 +++++++++++++++++++++++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/tools/xenstored/core.h b/tools/xenstored/core.h
index f7a27a4131..48ff659ec5 100644
--- a/tools/xenstored/core.h
+++ b/tools/xenstored/core.h
@@ -35,6 +35,8 @@
 #include "list.h"
 #include "hashtable.h"
 
+#define XENSTORE_LIB_DIR	XEN_LIB_DIR "/xenstore"
+
 #ifndef O_CLOEXEC
 #define O_CLOEXEC 0
 /* O_CLOEXEC support is needed for Live Update in the daemon case. */
@@ -385,6 +387,9 @@ static inline bool domain_is_unprivileged(const struct connection *conn)
 
 /* Return the event channel used by xenbus. */
 evtchn_port_t get_xenbus_evtchn(void);
+#ifdef __MINIOS__
+void mount_9pfs(void);
+#endif
 
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
index 0779efbf91..e5a3684df6 100644
--- a/tools/xenstored/minios.c
+++ b/tools/xenstored/minios.c
@@ -19,6 +19,14 @@
 #include <sys/mman.h>
 #include "core.h"
 #include <xen/grant_table.h>
+#include <mini-os/9pfront.h>
+#include <mini-os/sched.h>
+#include <mini-os/xenbus.h>
+#include <mini-os/xmalloc.h>
+
+#define P9_STATE_PATH	"device/9pfs/0/state"
+
+static void *p9_device;
 
 void write_pidfile(const char *pidfile)
 {
@@ -54,3 +62,30 @@ void unmap_xenbus(void *interface)
 	xengnttab_unmap(*xgt_handle, interface, 1);
 }
 
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


