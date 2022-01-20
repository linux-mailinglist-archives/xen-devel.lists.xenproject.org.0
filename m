Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 627484947A6
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jan 2022 08:01:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258977.446562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nARQG-0004km-Ny; Thu, 20 Jan 2022 06:59:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258977.446562; Thu, 20 Jan 2022 06:59:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nARQG-0004iu-L2; Thu, 20 Jan 2022 06:59:52 +0000
Received: by outflank-mailman (input) for mailman id 258977;
 Thu, 20 Jan 2022 06:59:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fK7G=SE=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nARQF-0004io-RV
 for xen-devel@lists.xenproject.org; Thu, 20 Jan 2022 06:59:51 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f7d965c-79be-11ec-8fa7-f31e035a9116;
 Thu, 20 Jan 2022 07:59:50 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A82321F391;
 Thu, 20 Jan 2022 06:59:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7323913CFB;
 Thu, 20 Jan 2022 06:59:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oaxVGmUI6WG0eQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 20 Jan 2022 06:59:49 +0000
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
X-Inumbo-ID: 8f7d965c-79be-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1642661989; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2KZJ7dpOrpoQgnfImzy80Zel1Z7WNKKERfI5Sl9gGsg=;
	b=mlicGFTyn5+v/dVBkz9rp/r3LFNJGxAISEEb5sytWveoC05SqABTlHfrOHosFx+s2MQa9B
	+PSCvPZ/4jxN3aZnPACxx6PGnhj0H/ADfCDOEs4bDxSlD3QhWNsGox8/ZqLwXWk2F2P2oo
	yBkbzzwt4q4e2penQwALQCGufrkB8zA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] tools/xenstore: use talloc_asprintf_append() in do_control_help()
Date: Thu, 20 Jan 2022 07:59:47 +0100
Message-Id: <20220120065947.31587-1-jgross@suse.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of calculating the length of all help output and then
allocating the space for it, just use talloc_asprintf_append() to
expand the text as needed.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_control.c | 27 +++++++--------------------
 1 file changed, 7 insertions(+), 20 deletions(-)

diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index adb8d51b04..61bcbc069d 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -853,36 +853,23 @@ static struct cmd_s cmds[] = {
 static int do_control_help(void *ctx, struct connection *conn,
 			   char **vec, int num)
 {
-	int cmd, len = 0;
+	int cmd;
 	char *resp;
 
 	if (num)
 		return EINVAL;
 
-	for (cmd = 0; cmd < ARRAY_SIZE(cmds); cmd++) {
-		len += strlen(cmds[cmd].cmd) + 1;
-		len += strlen(cmds[cmd].pars) + 1;
-	}
-	len++;
-
-	resp = talloc_array(ctx, char, len);
+	resp = talloc_asprintf(ctx, "%s", "");
 	if (!resp)
 		return ENOMEM;
-
-	len = 0;
 	for (cmd = 0; cmd < ARRAY_SIZE(cmds); cmd++) {
-		strcpy(resp + len, cmds[cmd].cmd);
-		len += strlen(cmds[cmd].cmd);
-		resp[len] = '\t';
-		len++;
-		strcpy(resp + len, cmds[cmd].pars);
-		len += strlen(cmds[cmd].pars);
-		resp[len] = '\n';
-		len++;
+		resp = talloc_asprintf_append(resp, "%s\t%s\n",
+					      cmds[cmd].cmd, cmds[cmd].pars);
+		if (!resp)
+			return ENOMEM;
 	}
-	resp[len] = 0;
 
-	send_reply(conn, XS_CONTROL, resp, len);
+	send_reply(conn, XS_CONTROL, resp, strlen(resp) + 1);
 	return 0;
 }
 
-- 
2.31.1


