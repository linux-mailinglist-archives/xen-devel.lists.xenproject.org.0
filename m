Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA74084E66C
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 18:13:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678427.1055742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY7xa-0003wg-GN; Thu, 08 Feb 2024 17:13:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678427.1055742; Thu, 08 Feb 2024 17:13:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY7xa-0003uA-Dh; Thu, 08 Feb 2024 17:13:14 +0000
Received: by outflank-mailman (input) for mailman id 678427;
 Thu, 08 Feb 2024 17:13:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m/2e=JR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rY7ij-0005bD-IJ
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 16:57:53 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32bbef2b-c6a3-11ee-8a4a-1f161083a0e0;
 Thu, 08 Feb 2024 17:57:53 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B606421F60;
 Thu,  8 Feb 2024 16:57:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7F6281326D;
 Thu,  8 Feb 2024 16:57:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id q7qoHRAIxWWjFAAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 08 Feb 2024 16:57:52 +0000
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
X-Inumbo-ID: 32bbef2b-c6a3-11ee-8a4a-1f161083a0e0
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH v5 22/22] tools/xenstored: have a single do_control_memreport()
Date: Thu,  8 Feb 2024 17:55:46 +0100
Message-Id: <20240208165546.5715-23-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240208165546.5715-1-jgross@suse.com>
References: <20240208165546.5715-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: B606421F60
X-Spam-Level: 
X-Spam-Score: -4.00
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


