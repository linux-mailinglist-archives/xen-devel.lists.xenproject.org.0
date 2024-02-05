Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B638849826
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 11:53:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675819.1051385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwb1-0007sR-Gd; Mon, 05 Feb 2024 10:53:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675819.1051385; Mon, 05 Feb 2024 10:53:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwb1-0007qP-Dy; Mon, 05 Feb 2024 10:53:03 +0000
Received: by outflank-mailman (input) for mailman id 675819;
 Mon, 05 Feb 2024 10:53:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b4fC=JO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rWwaz-00064Q-63
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 10:53:01 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b997754a-c414-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 11:52:58 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9BEC022100;
 Mon,  5 Feb 2024 10:52:58 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5EEF9132DD;
 Mon,  5 Feb 2024 10:52:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id RM2vFQq+wGUQNwAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 05 Feb 2024 10:52:58 +0000
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
X-Inumbo-ID: b997754a-c414-11ee-98f5-efadbce2ee36
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <julien@xen.org>,
	Jason Andryuk <jandryuk@gmail.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v4 31/32] tools/xenstored: support complete log capabilities in stubdom
Date: Mon,  5 Feb 2024 11:50:00 +0100
Message-Id: <20240205105001.24171-32-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240205105001.24171-1-jgross@suse.com>
References: <20240205105001.24171-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 9BEC022100
X-Spam-Level: 
X-Spam-Score: -4.00
X-Spam-Flag: NO

With 9pfs being fully available in Xenstore-stubdom now, there is no
reason to not fully support all logging capabilities in stubdom.

Open the logfile on stubdom only after the 9pfs file system has been
mounted.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
V3:
- remove now stale comment in sysconfig.xencommons.in (Julien Grall)
---
 .../Linux/init.d/sysconfig.xencommons.in      |  1 -
 tools/hotplug/Linux/launch-xenstore.in        |  1 +
 tools/xenstored/control.c                     | 30 +++++++++----------
 tools/xenstored/minios.c                      |  3 ++
 4 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/tools/hotplug/Linux/init.d/sysconfig.xencommons.in b/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
index 433e4849af..1bdd830d8a 100644
--- a/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
+++ b/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
@@ -58,7 +58,6 @@ XENSTORED_ARGS=
 ## Default: Not defined, tracing off
 #
 # Log xenstored messages
-# Only evaluated if XENSTORETYPE is "daemon".
 #XENSTORED_TRACE=[yes|on|1]
 
 ## Type: integer
diff --git a/tools/hotplug/Linux/launch-xenstore.in b/tools/hotplug/Linux/launch-xenstore.in
index e854ca1eb8..da4eeca7c5 100644
--- a/tools/hotplug/Linux/launch-xenstore.in
+++ b/tools/hotplug/Linux/launch-xenstore.in
@@ -98,6 +98,7 @@ test -f @CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons && . @CONFIG_DIR@/@CONFIG_LEAF
 	[ -z "$XENSTORE_DOMAIN_SIZE" ] && XENSTORE_DOMAIN_SIZE=8
 	XENSTORE_DOMAIN_ARGS="$XENSTORE_DOMAIN_ARGS --memory $XENSTORE_DOMAIN_SIZE"
 	[ -z "$XENSTORE_MAX_DOMAIN_SIZE" ] || XENSTORE_DOMAIN_ARGS="$XENSTORE_DOMAIN_ARGS --maxmem $XENSTORE_MAX_DOMAIN_SIZE"
+	[ -z "$XENSTORED_TRACE" ] || XENSTORE_DOMAIN_ARGS="$XENSTORE_DOMAIN_ARGS -T xenstored-trace.log"
 
 	echo -n Starting $XENSTORE_DOMAIN_KERNEL...
 	${LIBEXEC_BIN}/init-xenstore-domain $XENSTORE_DOMAIN_ARGS || exit 1
diff --git a/tools/xenstored/control.c b/tools/xenstored/control.c
index b2f64d674f..dae23a5ac0 100644
--- a/tools/xenstored/control.c
+++ b/tools/xenstored/control.c
@@ -201,19 +201,6 @@ static int do_control_quota_s(const void *ctx, struct connection *conn,
 	return EINVAL;
 }
 
-#ifdef __MINIOS__
-static int do_control_memreport(const void *ctx, struct connection *conn,
-				const char **vec, int num)
-{
-	if (num)
-		return EINVAL;
-
-	talloc_report_full(NULL, stdout);
-
-	send_ack(conn, XS_CONTROL);
-	return 0;
-}
-#else
 static int do_control_logfile(const void *ctx, struct connection *conn,
 			      const char **vec, int num)
 {
@@ -222,13 +209,26 @@ static int do_control_logfile(const void *ctx, struct connection *conn,
 
 	close_log();
 	talloc_free(tracefile);
-	tracefile = talloc_strdup(NULL, vec[0]);
+	tracefile = absolute_filename(NULL, vec[0]);
 	reopen_log();
 
 	send_ack(conn, XS_CONTROL);
 	return 0;
 }
 
+#ifdef __MINIOS__
+static int do_control_memreport(const void *ctx, struct connection *conn,
+				const char **vec, int num)
+{
+	if (num)
+		return EINVAL;
+
+	talloc_report_full(NULL, stdout);
+
+	send_ack(conn, XS_CONTROL);
+	return 0;
+}
+#else
 static int do_control_memreport(const void *ctx, struct connection *conn,
 				const char **vec, int num)
 {
@@ -309,10 +309,10 @@ static struct cmd_s cmds[] = {
 		"[-c <cmdline>] [-F] [-t <timeout>] <file>\n"
 		"    Default timeout is 60 seconds.", 5 },
 #endif
+	{ "logfile", do_control_logfile, "<file>" },
 #ifdef __MINIOS__
 	{ "memreport", do_control_memreport, "" },
 #else
-	{ "logfile", do_control_logfile, "<file>" },
 	{ "memreport", do_control_memreport, "[<file>]" },
 #endif
 	{ "print", do_control_print, "<string>" },
diff --git a/tools/xenstored/minios.c b/tools/xenstored/minios.c
index e70386f8c7..a229954cf4 100644
--- a/tools/xenstored/minios.c
+++ b/tools/xenstored/minios.c
@@ -122,6 +122,9 @@ static void mount_thread(void *p)
 	}
 
 	p9_device = init_9pfront(0, XENSTORE_LIB_DIR);
+
+	/* Start logging if selected. */
+	reopen_log();
 }
 
 void mount_9pfs(void)
-- 
2.35.3


