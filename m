Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D58823E64
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 10:13:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661298.1031084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLJmW-0006js-PP; Thu, 04 Jan 2024 09:12:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661298.1031084; Thu, 04 Jan 2024 09:12:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLJmW-0006h6-Li; Thu, 04 Jan 2024 09:12:52 +0000
Received: by outflank-mailman (input) for mailman id 661298;
 Thu, 04 Jan 2024 09:12:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4u2H=IO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rLJdz-00085z-24
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 09:04:03 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 346225e0-aae0-11ee-98ef-6d05b1d4d9a1;
 Thu, 04 Jan 2024 10:04:02 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3ACDA1F7F8;
 Thu,  4 Jan 2024 09:04:02 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 00BCE13722;
 Thu,  4 Jan 2024 09:04:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id cmd+OoF0lmV/WQAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 04 Jan 2024 09:04:01 +0000
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
X-Inumbo-ID: 346225e0-aae0-11ee-98ef-6d05b1d4d9a1
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH v3 33/33] tools/xenstored: have a single do_control_memreport()
Date: Thu,  4 Jan 2024 10:00:55 +0100
Message-Id: <20240104090055.27323-34-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240104090055.27323-1-jgross@suse.com>
References: <20240104090055.27323-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	none
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 3ACDA1F7F8
X-Spam-Flag: NO

With 9pfs now available in Xenstore-stubdom, there is no reason to
have distinct do_control_memreport() variants for the daemon and the
stubdom implementations.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/xenstored/control.c | 27 +++++++--------------------
 1 file changed, 7 insertions(+), 20 deletions(-)

diff --git a/tools/xenstored/control.c b/tools/xenstored/control.c
index dae23a5ac0..9561289179 100644
--- a/tools/xenstored/control.c
+++ b/tools/xenstored/control.c
@@ -216,23 +216,11 @@ static int do_control_logfile(const void *ctx, struct connection *conn,
 	return 0;
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
 static int do_control_memreport(const void *ctx, struct connection *conn,
 				const char **vec, int num)
 {
 	FILE *fp;
+	const char *filename;
 	int fd;
 
 	if (num > 1)
@@ -255,8 +243,12 @@ static int do_control_memreport(const void *ctx, struct connection *conn,
 			if (!fp)
 				close(fd);
 		}
-	} else
-		fp = fopen(vec[0], "a");
+	} else {
+		filename = absolute_filename(ctx, vec[0]);
+		if (!filename)
+			return ENOMEM;
+		fp = fopen(filename, "a");
+	}
 
 	if (!fp)
 		return EBADF;
@@ -267,7 +259,6 @@ static int do_control_memreport(const void *ctx, struct connection *conn,
 	send_ack(conn, XS_CONTROL);
 	return 0;
 }
-#endif
 
 static int do_control_print(const void *ctx, struct connection *conn,
 			    const char **vec, int num)
@@ -310,11 +301,7 @@ static struct cmd_s cmds[] = {
 		"    Default timeout is 60 seconds.", 5 },
 #endif
 	{ "logfile", do_control_logfile, "<file>" },
-#ifdef __MINIOS__
-	{ "memreport", do_control_memreport, "" },
-#else
 	{ "memreport", do_control_memreport, "[<file>]" },
-#endif
 	{ "print", do_control_print, "<string>" },
 	{ "quota", do_control_quota,
 		"[set <name> <val>|<domid>|max [-r]]" },
-- 
2.35.3


