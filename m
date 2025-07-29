Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C5FB14CAA
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 13:02:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062455.1428168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugi6D-0004JF-IX; Tue, 29 Jul 2025 11:02:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062455.1428168; Tue, 29 Jul 2025 11:02:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugi6D-0004FY-Ea; Tue, 29 Jul 2025 11:02:25 +0000
Received: by outflank-mailman (input) for mailman id 1062455;
 Tue, 29 Jul 2025 11:02:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TZvG=2K=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ugi6C-0001sN-2H
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 11:02:24 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81309434-6c6b-11f0-a31e-13f23c93f187;
 Tue, 29 Jul 2025 13:02:23 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1ABB51F750;
 Tue, 29 Jul 2025 11:02:23 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DFAF513876;
 Tue, 29 Jul 2025 11:02:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id aE4QNT6qiGjhbQAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 29 Jul 2025 11:02:22 +0000
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
X-Inumbo-ID: 81309434-6c6b-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753786943; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WIXBeSEHnTgln5V5JCLta83mIxR1YN9GFI9+BdUPQsk=;
	b=fzJnOIlcXMcTIbqkhkIjuAEosdlEHuxeXFNi3xiMSjHgGaA0Oci/OJ7dVxKXDBXd27PmFa
	GnMW8ZspY9NXZJ6KIvkxU4kV2UUibwR82beFxx0af3/PQwbMilnk7NMRaAUVh8uNVzHh1m
	mBgLYkgGmE3rdAQvs8B8LcjO9Qq2Xyo=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753786943; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WIXBeSEHnTgln5V5JCLta83mIxR1YN9GFI9+BdUPQsk=;
	b=fzJnOIlcXMcTIbqkhkIjuAEosdlEHuxeXFNi3xiMSjHgGaA0Oci/OJ7dVxKXDBXd27PmFa
	GnMW8ZspY9NXZJ6KIvkxU4kV2UUibwR82beFxx0af3/PQwbMilnk7NMRaAUVh8uNVzHh1m
	mBgLYkgGmE3rdAQvs8B8LcjO9Qq2Xyo=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v2 6/9] xenstored: rebind event channels after live update in stubdom
Date: Tue, 29 Jul 2025 13:01:42 +0200
Message-ID: <20250729110146.10580-7-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250729110146.10580-1-jgross@suse.com>
References: <20250729110146.10580-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:mid,suse.com:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

After performing a live update in stubdom environment some information
about inter-domain event channels is lost. In order to set this
information again, call xenevtchn_bind() from new_domain() in the
restore case.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
 tools/xenstored/core.c   | 1 -
 tools/xenstored/core.h   | 3 +++
 tools/xenstored/domain.c | 8 ++++++--
 tools/xenstored/minios.c | 5 +++++
 tools/xenstored/posix.c  | 5 +++++
 5 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index 3022efdce1..e3e8607592 100644
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
index 6767d29a19..7a6ce5b91b 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -862,9 +862,13 @@ static int new_domain(struct domain *domain, int port, bool restore)
 
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


