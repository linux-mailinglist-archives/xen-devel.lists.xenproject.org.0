Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3D0849842
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 11:59:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675900.1051586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwhO-0003NN-U8; Mon, 05 Feb 2024 10:59:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675900.1051586; Mon, 05 Feb 2024 10:59:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwhO-0003Jo-R7; Mon, 05 Feb 2024 10:59:38 +0000
Received: by outflank-mailman (input) for mailman id 675900;
 Mon, 05 Feb 2024 10:59:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b4fC=JO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rWwa8-0002wU-PT
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 10:52:08 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b5b870e-c414-11ee-8a45-1f161083a0e0;
 Mon, 05 Feb 2024 11:52:08 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CFAA222100;
 Mon,  5 Feb 2024 10:52:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 92C56132DD;
 Mon,  5 Feb 2024 10:52:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 3wJdIte9wGXHNgAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 05 Feb 2024 10:52:07 +0000
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
X-Inumbo-ID: 9b5b870e-c414-11ee-8a45-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707130327; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zf1h+BIq0Z8Nwwp8lu1GEpj5zMTW9hh2PPOlxbQgdSw=;
	b=OF/utg6Saod0ZXXQVz6YP8a8kQYLJUaOHsJvdE98qsRyg1rJK7pZsSihiaAanOsrHPkhXQ
	bAOhTj/u4IjiplMJze44HbhqLo/70CHki0K8JQyCGG6lKYHZL8KPi/7lraL2RGGm7YpA1V
	gP5kqTV+ARpE8qHQAPd0MJNPT6FUbao=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707130327; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zf1h+BIq0Z8Nwwp8lu1GEpj5zMTW9hh2PPOlxbQgdSw=;
	b=OF/utg6Saod0ZXXQVz6YP8a8kQYLJUaOHsJvdE98qsRyg1rJK7pZsSihiaAanOsrHPkhXQ
	bAOhTj/u4IjiplMJze44HbhqLo/70CHki0K8JQyCGG6lKYHZL8KPi/7lraL2RGGm7YpA1V
	gP5kqTV+ARpE8qHQAPd0MJNPT6FUbao=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v4 22/32] tools/xenstored: move systemd handling to posix.c
Date: Mon,  5 Feb 2024 11:49:51 +0100
Message-Id: <20240205105001.24171-23-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240205105001.24171-1-jgross@suse.com>
References: <20240205105001.24171-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 REPLY(-4.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[suse.com,xen.org,citrix.com,gmail.com,amazon.com];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO

Move systemd handling to a new late_init() function in posix.c.

This prepares a future removal of the NO_SOCKETS macro.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
V3:
- new patch
---
 tools/xenstored/core.c   | 17 +----------------
 tools/xenstored/core.h   |  1 +
 tools/xenstored/minios.c |  4 ++++
 tools/xenstored/posix.c  | 13 +++++++++++++
 4 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index eba7744fde..7b5e1d0c0f 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -54,16 +54,6 @@
 #include "control.h"
 #include "lu.h"
 
-#ifndef NO_SOCKETS
-#if defined(HAVE_SYSTEMD)
-#define XEN_SYSTEMD_ENABLED 1
-#endif
-#endif
-
-#if defined(XEN_SYSTEMD_ENABLED)
-#include <systemd/sd-daemon.h>
-#endif
-
 extern xenevtchn_handle *xce_handle; /* in domain.c */
 static int xce_pollfd_idx = -1;
 static struct pollfd *fds;
@@ -2938,12 +2928,7 @@ int main(int argc, char *argv[])
 	/* Get ready to listen to the tools. */
 	initialize_fds(&sock_pollfd_idx, &timeout);
 
-#if defined(XEN_SYSTEMD_ENABLED)
-	if (!live_update) {
-		sd_notify(1, "READY=1");
-		fprintf(stderr, SD_NOTICE "xenstored is ready\n");
-	}
-#endif
+	late_init(live_update);
 
 	/* Main loop. */
 	for (;;) {
diff --git a/tools/xenstored/core.h b/tools/xenstored/core.h
index 72173f1684..0de2d8a26e 100644
--- a/tools/xenstored/core.h
+++ b/tools/xenstored/core.h
@@ -385,6 +385,7 @@ static inline bool domain_is_unprivileged(const struct connection *conn)
 /* Return the event channel used by xenbus. */
 evtchn_port_t get_xenbus_evtchn(void);
 void early_init(bool live_update, bool dofork, const char *pidfile);
+void late_init(bool live_update);
 
 void init_sockets(void);
 extern int reopen_log_pipe[2];
diff --git a/tools/xenstored/minios.c b/tools/xenstored/minios.c
index 4f48f63083..45bb0440be 100644
--- a/tools/xenstored/minios.c
+++ b/tools/xenstored/minios.c
@@ -49,3 +49,7 @@ void unmap_xenbus(void *interface)
 void early_init(bool live_update, bool dofork, const char *pidfile)
 {
 }
+
+void late_init(bool live_update)
+{
+}
diff --git a/tools/xenstored/posix.c b/tools/xenstored/posix.c
index 9463ef5c8d..97c8dcaba3 100644
--- a/tools/xenstored/posix.c
+++ b/tools/xenstored/posix.c
@@ -24,6 +24,9 @@
 #include <stdlib.h>
 #include <syslog.h>
 #include <sys/mman.h>
+#if defined(HAVE_SYSTEMD)
+#include <systemd/sd-daemon.h>
+#endif
 #include <xen-tools/xenstore-common.h>
 
 #include "utils.h"
@@ -184,3 +187,13 @@ void early_init(bool live_update, bool dofork, const char *pidfile)
 	if (!live_update)
 		init_sockets();
 }
+
+void late_init(bool live_update)
+{
+#if defined(HAVE_SYSTEMD)
+	if (!live_update) {
+		sd_notify(1, "READY=1");
+		fprintf(stderr, SD_NOTICE "xenstored is ready\n");
+	}
+#endif
+}
-- 
2.35.3


