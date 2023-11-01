Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 948307DDEAC
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 10:47:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626293.976441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7oM-0007XR-Gw; Wed, 01 Nov 2023 09:46:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626293.976441; Wed, 01 Nov 2023 09:46:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7oM-0007Vn-ED; Wed, 01 Nov 2023 09:46:54 +0000
Received: by outflank-mailman (input) for mailman id 626293;
 Wed, 01 Nov 2023 09:46:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFMy=GO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qy7du-0005sN-Nv
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 09:36:06 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13eeaff0-789a-11ee-9b0e-b553b5be7939;
 Wed, 01 Nov 2023 10:36:05 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DEB551F74D;
 Wed,  1 Nov 2023 09:36:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B20BD13460;
 Wed,  1 Nov 2023 09:36:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id xYQ6KgQcQmW7CQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 01 Nov 2023 09:36:04 +0000
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
X-Inumbo-ID: 13eeaff0-789a-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698831364; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lu0WplxXTKB8e/O4GGP2IWT4s4QFFiu0mF15YaAuCzw=;
	b=O3+NbfMDna+vFQ2XWJgN1rmM5srwOzFktfaQ9c/LnBFT5XqW8wIR4hYNbSu7wD2DPsh6gA
	poG07fVQ88QpLNk/yROr7B/p7514019YgbwCryCXpvnmChgI/qXCGhjPFD3SEePnqSrXfe
	MqOEr8yb2xRCjvMkJFPwqkIu4TQbn9k=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH 28/29] tools/xenstored: support complete log capabilities in stubdom
Date: Wed,  1 Nov 2023 10:33:24 +0100
Message-Id: <20231101093325.30302-29-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231101093325.30302-1-jgross@suse.com>
References: <20231101093325.30302-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With 9pfs being fully available in Xenstore-stubdom now, there is no
reason to not fully support all logging capabilities in stubdom.

Open the logfile on stubdom only after the 9pfs file system has been
mounted.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/hotplug/Linux/launch-xenstore.in |  1 +
 tools/xenstored/control.c              | 30 +++++++++++++-------------
 tools/xenstored/minios.c               |  3 +++
 3 files changed, 19 insertions(+), 15 deletions(-)

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
index cd6e288f2a..c02a263d9d 100644
--- a/tools/xenstored/minios.c
+++ b/tools/xenstored/minios.c
@@ -87,6 +87,9 @@ static void mount_thread(void *p)
 	free(xenbus_unwatch_path_token(XBT_NIL, P9_STATE_PATH, "9pfs"));
 
 	p9_device = init_9pfront(0, XENSTORE_LIB_DIR);
+
+	/* Start logging if selected. */
+	reopen_log();
 }
 
 void mount_9pfs(void)
-- 
2.35.3


