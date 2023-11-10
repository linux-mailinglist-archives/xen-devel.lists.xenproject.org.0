Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0697E7D99
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 17:10:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630496.983403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1U5l-0002y9-Sz; Fri, 10 Nov 2023 16:10:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630496.983403; Fri, 10 Nov 2023 16:10:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1U5l-0002w9-Pb; Fri, 10 Nov 2023 16:10:45 +0000
Received: by outflank-mailman (input) for mailman id 630496;
 Fri, 10 Nov 2023 16:10:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ap16=GX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r1U5k-0002ug-M7
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 16:10:44 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b332abae-7fe3-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 17:10:43 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7FE1F2187C;
 Fri, 10 Nov 2023 16:10:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4D06913398;
 Fri, 10 Nov 2023 16:10:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id al5oEQNWTmWoCQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 10 Nov 2023 16:10:43 +0000
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
X-Inumbo-ID: b332abae-7fe3-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699632643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nTwqfROeJryVbG+zGDI1eHpfuMSuaLvCQQtzYJfCoiA=;
	b=RfWGZinRrRZXatry7aWM44E0EugGScZO8EY+COaF39FnMJ0L2nHzIdWHyYhe01fSp9Ggvx
	koEdsl8rqUB52mrn52sFcde5+r+1T4dlxVKk585dNo1PGHTc0CIya53xZ+j3Z6iNNyP47E
	YC84SwXTdFljWgQIhD0TroS+6PweTYM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <julien@xen.org>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH v2 28/29] tools/xenstored: support complete log capabilities in stubdom
Date: Fri, 10 Nov 2023 17:08:03 +0100
Message-Id: <20231110160804.29021-29-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231110160804.29021-1-jgross@suse.com>
References: <20231110160804.29021-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With 9pfs being fully available in Xenstore-stubdom now, there is no
reason to not fully support all logging capabilities in stubdom.

Open the logfile on stubdom only after the 9pfs file system has been
mounted.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
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
index cfc2377857..9e78b96d07 100644
--- a/tools/xenstored/minios.c
+++ b/tools/xenstored/minios.c
@@ -92,6 +92,9 @@ static void mount_thread(void *p)
 	free(xenbus_unwatch_path_token(XBT_NIL, P9_STATE_PATH, "9pfs"));
 
 	p9_device = init_9pfront(0, XENSTORE_LIB_DIR);
+
+	/* Start logging if selected. */
+	reopen_log();
 }
 
 void mount_9pfs(void)
-- 
2.35.3


