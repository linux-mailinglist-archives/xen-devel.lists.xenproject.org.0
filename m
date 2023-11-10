Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE197E7D9A
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 17:11:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630497.983413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1U5r-0003Gq-3v; Fri, 10 Nov 2023 16:10:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630497.983413; Fri, 10 Nov 2023 16:10:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1U5r-0003Ee-0d; Fri, 10 Nov 2023 16:10:51 +0000
Received: by outflank-mailman (input) for mailman id 630497;
 Fri, 10 Nov 2023 16:10:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ap16=GX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r1U5p-0002ug-Rp
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 16:10:49 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6873b0c-7fe3-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 17:10:49 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1ABCF1F8BB;
 Fri, 10 Nov 2023 16:10:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DC9B113398;
 Fri, 10 Nov 2023 16:10:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 10V8NAhWTmWwCQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 10 Nov 2023 16:10:48 +0000
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
X-Inumbo-ID: b6873b0c-7fe3-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699632649; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2stzGKgVm/SXqJipf+P7KPzRw/p+H9JtpMBW4gsBrV0=;
	b=P9MegLjse7d4oPkyrjeUoxIqukH5kaDe8okcyvleh8vWngucZYMpdNMzqQ2k+Dq361aOMo
	Uhxf9xEejcsGYXyo9bo3j4AOXcYmB/qgjZoKF36NerWjvNRA9Yf2aGpma3B5Yg6nml9evu
	9gVRyndUaOlHj7NByBdVVn8aqenIOXo=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH v2 29/29] tools/xenstored: have a single do_control_memreport()
Date: Fri, 10 Nov 2023 17:08:04 +0100
Message-Id: <20231110160804.29021-30-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231110160804.29021-1-jgross@suse.com>
References: <20231110160804.29021-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With 9pfs now available in Xenstore-stubdom, there is no reason to
have distinct do_control_memreport() variants for the daemon and the
stubdom implementations.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/xenstored/control.c | 27 +++++++--------------------
 1 file changed, 7 insertions(+), 20 deletions(-)

diff --git a/tools/xenstored/control.c b/tools/xenstored/control.c
index dae23a5ac0..7db2c4703b 100644
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
+	char *filename;
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


