Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA87DB16043
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 14:23:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063900.1429664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh5qY-0007HD-VK; Wed, 30 Jul 2025 12:23:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063900.1429664; Wed, 30 Jul 2025 12:23:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh5qY-0007Eo-Qz; Wed, 30 Jul 2025 12:23:50 +0000
Received: by outflank-mailman (input) for mailman id 1063900;
 Wed, 30 Jul 2025 12:23:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=txka=2L=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uh5qX-0004Wg-NH
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 12:23:49 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ad215d8-6d40-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 14:23:47 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5555C21AB3;
 Wed, 30 Jul 2025 12:23:47 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 223DC1388B;
 Wed, 30 Jul 2025 12:23:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id iIn0BtMOimjMJAAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 30 Jul 2025 12:23:47 +0000
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
X-Inumbo-ID: 0ad215d8-6d40-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753878227; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EEBwah7qk2nax0TCJi1E0NRt+EjeWrtG5skr59O3zrk=;
	b=QMWUHD7/BeWXk9NigmovZa2+P5cGFcp7h2xN2vQocuPPEzLwEBrPZqp5hYIMUq4qdH7OGM
	vVy+o3y5dO/5wr3zd5h8WjNU53vMdiL5QqjObAaqXmKUpO0iGpzTP56QCtlwJp0G2SSdYA
	e+LhNpS+VdVlHT0JnUYKn0zZj/4QYXI=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b="QMWUHD7/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753878227; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EEBwah7qk2nax0TCJi1E0NRt+EjeWrtG5skr59O3zrk=;
	b=QMWUHD7/BeWXk9NigmovZa2+P5cGFcp7h2xN2vQocuPPEzLwEBrPZqp5hYIMUq4qdH7OGM
	vVy+o3y5dO/5wr3zd5h8WjNU53vMdiL5QqjObAaqXmKUpO0iGpzTP56QCtlwJp0G2SSdYA
	e+LhNpS+VdVlHT0JnUYKn0zZj/4QYXI=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v3 7/9] tools/xenstored: make stubdom_init() live update aware
Date: Wed, 30 Jul 2025 14:23:03 +0200
Message-ID: <20250730122305.4050-8-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730122305.4050-1-jgross@suse.com>
References: <20250730122305.4050-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 5555C21AB3
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:dkim,suse.com:mid,suse.com:email]
X-Spam-Score: -3.01

Pass the live_update bool to stubdom_init() in order to be able to
handle it properly under Mini-OS.

As stubdom_init() will (re-)create the 9pfs device needed for
reading the saved state, call stubdom_init() before lu_read_state().

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
 tools/xenstored/core.c   |  4 ++--
 tools/xenstored/core.h   |  2 +-
 tools/xenstored/domain.c | 15 +++++++++------
 tools/xenstored/domain.h |  2 +-
 tools/xenstored/minios.c | 12 +++++++++---
 5 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index e3e8607592..5377d72f54 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -2774,14 +2774,14 @@ int main(int argc, char *argv[])
 	if (tracefile)
 		tracefile = absolute_filename(NULL, tracefile);
 
+	stubdom_init(live_update);
+
 #ifndef NO_LIVE_UPDATE
 	/* Read state in case of live update. */
 	if (live_update)
 		lu_read_state();
 #endif
 
-	stubdom_init();
-
 	check_store();
 
 	/* Get ready to listen to the tools. */
diff --git a/tools/xenstored/core.h b/tools/xenstored/core.h
index 3f7426fbe3..5071f1dedd 100644
--- a/tools/xenstored/core.h
+++ b/tools/xenstored/core.h
@@ -412,7 +412,7 @@ xenevtchn_handle *evtchn_fdopen(int fd);
 int evtchn_rebind(int port);
 
 #ifdef __MINIOS__
-void mount_9pfs(void);
+void mount_9pfs(bool live_update);
 #endif
 
 const char *xenstore_rundir(void);
diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index 7a6ce5b91b..57ca98ee5b 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -1337,7 +1337,7 @@ void dom0_init(void)
 	xenevtchn_notify(xce_handle, dom0->port);
 }
 
-void stubdom_init(void)
+void stubdom_init(bool live_update)
 {
 #ifdef __MINIOS__
 	struct domain *stubdom;
@@ -1345,13 +1345,16 @@ void stubdom_init(void)
 	if (stub_domid < 0)
 		return;
 
-	stubdom = introduce_domain(NULL, stub_domid, xenbus_evtchn, false);
-	if (!stubdom)
-		barf_perror("Failed to initialize stubdom");
+	if (!live_update) {
+		stubdom = introduce_domain(NULL, stub_domid, xenbus_evtchn,
+					   false);
+		if (!stubdom)
+			barf_perror("Failed to initialize stubdom");
 
-	xenevtchn_notify(xce_handle, stubdom->port);
+		xenevtchn_notify(xce_handle, stubdom->port);
+	}
 
-	mount_9pfs();
+	mount_9pfs(live_update);
 #endif
 }
 
diff --git a/tools/xenstored/domain.h b/tools/xenstored/domain.h
index 94481fdcc0..3ca702f56d 100644
--- a/tools/xenstored/domain.h
+++ b/tools/xenstored/domain.h
@@ -93,7 +93,7 @@ int do_set_feature(const void *ctx, struct connection *conn,
 void domain_early_init(void);
 void domain_init(int evtfd);
 void dom0_init(void);
-void stubdom_init(void);
+void stubdom_init(bool live_update);
 void domain_deinit(void);
 void ignore_connection(struct connection *conn, unsigned int err);
 
diff --git a/tools/xenstored/minios.c b/tools/xenstored/minios.c
index ec5faebaf3..f04423fe09 100644
--- a/tools/xenstored/minios.c
+++ b/tools/xenstored/minios.c
@@ -131,15 +131,21 @@ static void mount_thread(void *p)
 		free(err);
 	}
 
-	p9_device = init_9pfront(0, XENSTORE_LIB_DIR);
+	p9_device = init_9pfront2(0, XENSTORE_LIB_DIR, INIT9P_FLAG_KEXEC);
 
 	/* Start logging if selected. */
 	reopen_log();
 }
 
-void mount_9pfs(void)
+void mount_9pfs(bool live_update)
 {
-	create_thread("mount-9pfs", mount_thread, NULL);
+	if (!live_update)
+		create_thread("mount-9pfs", mount_thread, NULL);
+	else {
+		p9_device = init_9pfront2(0, XENSTORE_LIB_DIR,
+					  INIT9P_FLAG_REINIT);
+		reopen_log();
+	}
 }
 
 const char *xenstore_rundir(void)
-- 
2.43.0


