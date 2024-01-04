Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAED823E65
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 10:13:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661297.1031070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLJmV-0006Ha-6z; Thu, 04 Jan 2024 09:12:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661297.1031070; Thu, 04 Jan 2024 09:12:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLJmV-0006CW-2V; Thu, 04 Jan 2024 09:12:51 +0000
Received: by outflank-mailman (input) for mailman id 661297;
 Thu, 04 Jan 2024 09:12:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4u2H=IO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rLJd5-00085z-Jz
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 09:03:07 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1352774b-aae0-11ee-98ef-6d05b1d4d9a1;
 Thu, 04 Jan 2024 10:03:07 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AA03D1F7F8;
 Thu,  4 Jan 2024 09:03:06 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8011813722;
 Thu,  4 Jan 2024 09:03:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +FH+HUp0lmU0WQAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 04 Jan 2024 09:03:06 +0000
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
X-Inumbo-ID: 1352774b-aae0-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1704358986; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ssx28FcEWEf2WDI9VVHEBGrcITBSOtj2P4cTrF0KhcY=;
	b=mg93sztlJ1BGH9KTiHaoUtYeL3OkskcbD0YDM0CwRBw0bFUNtu0hN/Ze9elQfPDslAEZmJ
	TD98sq+9mo1YwK9My4O1xmS0E9t5r1aPbIvwatkaJMGD1zY/ScYrRLGbZnxDGV3wQDVSus
	QkzoOGkonSXVYL+eJxKm8Bil5zOofGk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1704358986; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ssx28FcEWEf2WDI9VVHEBGrcITBSOtj2P4cTrF0KhcY=;
	b=mg93sztlJ1BGH9KTiHaoUtYeL3OkskcbD0YDM0CwRBw0bFUNtu0hN/Ze9elQfPDslAEZmJ
	TD98sq+9mo1YwK9My4O1xmS0E9t5r1aPbIvwatkaJMGD1zY/ScYrRLGbZnxDGV3wQDVSus
	QkzoOGkonSXVYL+eJxKm8Bil5zOofGk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 23/33] tools/xenstored: move systemd handling to posix.c
Date: Thu,  4 Jan 2024 10:00:45 +0100
Message-Id: <20240104090055.27323-24-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240104090055.27323-1-jgross@suse.com>
References: <20240104090055.27323-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Level: 
X-Spamd-Result: default: False [0.90 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 REPLY(-4.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[]
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Score: 0.90
X-Spam-Flag: NO

Move systemd handling to a new late_init() function in posix.c.

This prepares a future removal of the NO_SOCKETS macro.

Signed-off-by: Juergen Gross <jgross@suse.com>
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


