Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDD7AF0DC9
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 10:21:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030582.1404353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWsix-00064d-1z; Wed, 02 Jul 2025 08:21:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030582.1404353; Wed, 02 Jul 2025 08:21:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWsiw-00062J-Ru; Wed, 02 Jul 2025 08:21:46 +0000
Received: by outflank-mailman (input) for mailman id 1030582;
 Wed, 02 Jul 2025 08:21:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFiP=ZP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uWsbX-00082X-O3
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 08:14:07 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85a0e0f8-571c-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 10:14:06 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A68C321175;
 Wed,  2 Jul 2025 08:14:03 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7E1C713A24;
 Wed,  2 Jul 2025 08:14:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 0XJLHUvqZGhfSQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 02 Jul 2025 08:14:03 +0000
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
X-Inumbo-ID: 85a0e0f8-571c-11f0-b894-0df219b8e170
Authentication-Results: smtp-out1.suse.de;
	none
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 9/9] tools/xenstored: make stubdom_init() live update aware
Date: Wed,  2 Jul 2025 10:13:05 +0200
Message-ID: <20250702081305.14440-10-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702081305.14440-1-jgross@suse.com>
References: <20250702081305.14440-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: A68C321175
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -4.00

Pass the live_update bool to stubdom_init() in order to be able to
handle it properly under Mini-OS.

As stubdom_init() will (re-)create the 9pfs device needed for
reading the saved state, call stubdom_init() before lu_read_state().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstored/core.c   |  4 ++--
 tools/xenstored/core.h   |  2 +-
 tools/xenstored/domain.c | 15 +++++++++------
 tools/xenstored/domain.h |  2 +-
 tools/xenstored/minios.c | 12 +++++++++---
 5 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index 09c838d6e8..18c5643029 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -2770,14 +2770,14 @@ int main(int argc, char *argv[])
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
index ca0744d6bb..877a14e858 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -1267,7 +1267,7 @@ void dom0_init(void)
 	xenevtchn_notify(xce_handle, dom0->port);
 }
 
-void stubdom_init(void)
+void stubdom_init(bool live_update)
 {
 #ifdef __MINIOS__
 	struct domain *stubdom;
@@ -1275,13 +1275,16 @@ void stubdom_init(void)
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
index 844ac11510..02b261ad47 100644
--- a/tools/xenstored/domain.h
+++ b/tools/xenstored/domain.h
@@ -85,7 +85,7 @@ int do_reset_watches(const void *ctx, struct connection *conn,
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


