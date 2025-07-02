Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F6FAF0DC7
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 10:21:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030569.1404336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWsim-0004fc-OM; Wed, 02 Jul 2025 08:21:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030569.1404336; Wed, 02 Jul 2025 08:21:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWsim-0004XH-HT; Wed, 02 Jul 2025 08:21:36 +0000
Received: by outflank-mailman (input) for mailman id 1030569;
 Wed, 02 Jul 2025 08:21:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFiP=ZP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uWsbT-00082Y-87
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 08:14:03 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83898f99-571c-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 10:14:02 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 227C321196;
 Wed,  2 Jul 2025 08:13:58 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EE15813A24;
 Wed,  2 Jul 2025 08:13:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id jjiuOEXqZGhZSQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 02 Jul 2025 08:13:57 +0000
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
X-Inumbo-ID: 83898f99-571c-11f0-a313-13f23c93f187
Authentication-Results: smtp-out1.suse.de;
	none
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 8/9] xenstored: rebind event channels after live update in stubdom
Date: Wed,  2 Jul 2025 10:13:04 +0200
Message-ID: <20250702081305.14440-9-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702081305.14440-1-jgross@suse.com>
References: <20250702081305.14440-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 227C321196
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Score: -4.00

After performing a live update in stubdom environment some information
about inter-domain event channels is lost. In order to set this
information again, call xenevtchn_bind() from new_domain() in the
restore case.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstored/core.c   | 1 -
 tools/xenstored/core.h   | 3 +++
 tools/xenstored/domain.c | 8 ++++++--
 tools/xenstored/minios.c | 5 +++++
 tools/xenstored/posix.c  | 5 +++++
 5 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index 37e4dd5a5b..09c838d6e8 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -49,7 +49,6 @@
 #include "control.h"
 #include "lu.h"
 
-extern xenevtchn_handle *xce_handle; /* in domain.c */
 static int xce_pollfd_idx = -1;
 struct pollfd *poll_fds;
 static unsigned int current_array_size;
diff --git a/tools/xenstored/core.h b/tools/xenstored/core.h
index bef24a688c..3f7426fbe3 100644
--- a/tools/xenstored/core.h
+++ b/tools/xenstored/core.h
@@ -394,6 +394,8 @@ static inline bool domain_is_unprivileged(const struct connection *conn)
 	return conn && domid_is_unprivileged(conn->id);
 }
 
+extern xenevtchn_handle *xce_handle; /* in domain.c */
+
 /* Return the event channel used by xenbus. */
 evtchn_port_t get_xenbus_evtchn(void);
 void early_init(bool live_update, bool dofork, const char *pidfile);
@@ -407,6 +409,7 @@ int get_socket_fd(void);
 void set_socket_fd(int fd);
 
 xenevtchn_handle *evtchn_fdopen(int fd);
+int evtchn_rebind(int port);
 
 #ifdef __MINIOS__
 void mount_9pfs(void);
diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index e0c2342edb..ca0744d6bb 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -855,9 +855,13 @@ static int new_domain(struct domain *domain, int port, bool restore)
 
 	wrl_domain_new(domain);
 
-	if (restore)
+	if (restore) {
+		if (evtchn_rebind(port)) {
+			errno = ENOMEM;
+			return errno;
+		}
 		domain->port = port;
-	else {
+	} else {
 		/* Tell kernel we're interested in this event. */
 		rc = xenevtchn_bind_interdomain(xce_handle, domain->domid,
 						port);
diff --git a/tools/xenstored/minios.c b/tools/xenstored/minios.c
index aa1f03fd6b..ec5faebaf3 100644
--- a/tools/xenstored/minios.c
+++ b/tools/xenstored/minios.c
@@ -90,6 +90,11 @@ xenevtchn_handle *evtchn_fdopen(int fd)
 	return xenevtchn_open(NULL, XENEVTCHN_NO_CLOEXEC);
 }
 
+int evtchn_rebind(int port)
+{
+	return xenevtchn_bind(xce_handle, port);
+}
+
 static void mount_thread(void *p)
 {
 	xenbus_event_queue events = NULL;
diff --git a/tools/xenstored/posix.c b/tools/xenstored/posix.c
index ebdec82215..97561701ae 100644
--- a/tools/xenstored/posix.c
+++ b/tools/xenstored/posix.c
@@ -413,6 +413,11 @@ xenevtchn_handle *evtchn_fdopen(int fd)
 	return xenevtchn_fdopen(NULL, fd, 0);
 }
 
+int evtchn_rebind(int port)
+{
+	return 0;
+}
+
 const char *xenstore_rundir(void)
 {
 	return xenstore_daemon_rundir();
-- 
2.43.0


