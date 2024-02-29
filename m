Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE4686C97A
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 13:49:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687047.1069828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rffqR-000607-JL; Thu, 29 Feb 2024 12:49:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687047.1069828; Thu, 29 Feb 2024 12:49:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rffqR-0005ww-Fb; Thu, 29 Feb 2024 12:49:03 +0000
Received: by outflank-mailman (input) for mailman id 687047;
 Thu, 29 Feb 2024 12:49:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OAsO=KG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rffqQ-0003qK-0N
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 12:49:02 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9762d9a-d700-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 13:49:01 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D33A221CE4;
 Thu, 29 Feb 2024 12:49:00 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 944E21329E;
 Thu, 29 Feb 2024 12:49:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id 0f6/Ijx94GUfIgAAn2gu4w
 (envelope-from <jgross@suse.com>); Thu, 29 Feb 2024 12:49:00 +0000
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
X-Inumbo-ID: e9762d9a-d700-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709210941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uDTztpSOFaUYt0rzH/ToFpRY71aqRBUTIhIi8A11O7I=;
	b=pb5K+HL9dVuzE/s9oQuxXLiXfFwD849xJb4pBIUjMjq6K7mloQmnVlB53nbhgvNGaG1ISY
	4UtRTbEVhSgwHVag13ETb2DysPYsfTWhw5LTXcvqKpX7m+OT1Lke2+62DzBI8+YaT7ud42
	TlJ/P87S2fn5kibGtqSsICOMenbyAz0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709210940; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uDTztpSOFaUYt0rzH/ToFpRY71aqRBUTIhIi8A11O7I=;
	b=nv5NwGW3cC2LqIPemYRpUrqDjloMvH+MU5IYKLaQUmhudOJSqRXznYnQMd1IF8zbr9z2Cg
	i+WUVxlLBq4+DIEOZDQO5J0s6wYTtXg+4q2+6H2SV9GDGWRGtNd605oOgP4XYRpTmnGHOZ
	ZT9U+27dSv26K20zpVPG7qsEnitTVI4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <julien@xen.org>,
	Jason Andryuk <jandryuk@gmail.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v9 5/6] tools/xenstored: support complete log capabilities in stubdom
Date: Thu, 29 Feb 2024 13:48:29 +0100
Message-Id: <20240229124830.13680-6-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240229124830.13680-1-jgross@suse.com>
References: <20240229124830.13680-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=nv5NwGW3
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-1.51 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-3.00)[100.00%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 FROM_HAS_DN(0.00)[];
	 DWL_DNSWL_MED(-2.00)[suse.com:dkim];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FREEMAIL_CC(0.00)[suse.com,xen.org,citrix.com,gmail.com,amazon.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -1.51
X-Rspamd-Queue-Id: D33A221CE4
X-Spam-Flag: NO

With 9pfs being fully available in Xenstore-stubdom now, there is no
reason to not fully support all logging capabilities in stubdom.

Open the logfile on stubdom only after the 9pfs file system has been
mounted.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
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


