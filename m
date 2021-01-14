Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 032E52F64CB
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 16:38:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67204.119772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04hZ-0002iY-Il; Thu, 14 Jan 2021 15:38:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67204.119772; Thu, 14 Jan 2021 15:38:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04hZ-0002ht-DQ; Thu, 14 Jan 2021 15:38:21 +0000
Received: by outflank-mailman (input) for mailman id 67204;
 Thu, 14 Jan 2021 15:38:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P5GR=GR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l04hX-0002Sh-Ig
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 15:38:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf33bcdb-d215-4a55-8dbb-7e723d14823d;
 Thu, 14 Jan 2021 15:38:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E6C48AEC1;
 Thu, 14 Jan 2021 15:38:07 +0000 (UTC)
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
X-Inumbo-ID: bf33bcdb-d215-4a55-8dbb-7e723d14823d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610638688; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O/DEREX1kMq5zoH/CbxrwUSJ5+uKCnvjpzSN2JoigQo=;
	b=r9aEWitIQFLB4AHXsOZ9QGnbeDs4eNsCcjSg7Y3BK+BeOc1D6AM/bo7L68kjeSAkgObFrc
	uIFw7nAyGPuHuCxlAtoodO3E8VkROc3d3ikZ2/0NXZNF2TInwBHYRUQy+v3+1cQyiEaaCq
	0gNIrBJsViXuBj1JG32ELf8buEhsh7g=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Julien Grall <jgrall@amazon.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v11 06/27] tools/xenstore: refactor XS_CONTROL handling
Date: Thu, 14 Jan 2021 16:37:42 +0100
Message-Id: <20210114153803.2591-7-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114153803.2591-1-jgross@suse.com>
References: <20210114153803.2591-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to allow control commands with binary data refactor handling
of XS_CONTROL:

- get primary command first
- add maximum number of additional parameters to pass to command
  handler

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Paul Durrant <paul@xen.org>
---
V2:
- add comment regarding max_pars (Pawel Wieczorkiewicz)

V3:
- addressed Paul's comments
---
 tools/xenstore/xenstored_control.c | 34 ++++++++++++++++++++----------
 tools/xenstore/xenstored_core.c    |  3 +--
 tools/xenstore/xenstored_core.h    |  1 +
 3 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index 8d48ab4820..8d29db8270 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -30,6 +30,14 @@ struct cmd_s {
 	char *cmd;
 	int (*func)(void *, struct connection *, char **, int);
 	char *pars;
+	/*
+	 * max_pars can be used to limit the size of the parameter vector,
+	 * e.g. in case of large binary parts in the parameters.
+	 * The command is included in the count, so 1 means just the command
+	 * without any parameter.
+	 * 0 == no limit (the default)
+	 */
+	unsigned int max_pars;
 };
 
 static int do_control_check(void *ctx, struct connection *conn,
@@ -194,25 +202,29 @@ static int do_control_help(void *ctx, struct connection *conn,
 
 int do_control(struct connection *conn, struct buffered_data *in)
 {
-	int num;
-	int cmd;
-	char **vec;
+	unsigned int cmd, num, off;
+	char **vec = NULL;
 
 	if (conn->id != 0)
 		return EACCES;
 
-	num = xs_count_strings(in->buffer, in->used);
-	if (num < 1)
+	off = get_string(in, 0);
+	if (!off)
+		return EINVAL;
+	for (cmd = 0; cmd < ARRAY_SIZE(cmds); cmd++)
+		if (streq(in->buffer, cmds[cmd].cmd))
+			break;
+	if (cmd == ARRAY_SIZE(cmds))
 		return EINVAL;
+
+	num = xs_count_strings(in->buffer, in->used);
+	if (cmds[cmd].max_pars)
+		num = min(num, cmds[cmd].max_pars);
 	vec = talloc_array(in, char *, num);
 	if (!vec)
 		return ENOMEM;
-	if (get_strings(in, vec, num) != num)
+	if (get_strings(in, vec, num) < num)
 		return EIO;
 
-	for (cmd = 0; cmd < ARRAY_SIZE(cmds); cmd++)
-		if (streq(vec[0], cmds[cmd].cmd))
-			return cmds[cmd].func(in, conn, vec + 1, num - 1);
-
-	return EINVAL;
+	return cmds[cmd].func(in, conn, vec + 1, num - 1);
 }
diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 50986f8b29..e1b92c3dc8 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -620,8 +620,7 @@ static struct buffered_data *new_buffer(void *ctx)
 /* Return length of string (including nul) at this offset.
  * If there is no nul, returns 0 for failure.
  */
-static unsigned int get_string(const struct buffered_data *data,
-			       unsigned int offset)
+unsigned int get_string(const struct buffered_data *data, unsigned int offset)
 {
 	const char *nul;
 
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index fb59d862a2..27826c125c 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -142,6 +142,7 @@ const char *onearg(struct buffered_data *in);
 /* Break input into vectors, return the number, fill in up to num of them. */
 unsigned int get_strings(struct buffered_data *data,
 			 char *vec[], unsigned int num);
+unsigned int get_string(const struct buffered_data *data, unsigned int offset);
 
 void send_reply(struct connection *conn, enum xsd_sockmsg_type type,
 		const void *data, unsigned int len);
-- 
2.26.2


