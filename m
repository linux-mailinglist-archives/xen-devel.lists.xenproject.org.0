Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CAF2F7455
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 09:30:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67720.121074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0KV4-0000H2-VM; Fri, 15 Jan 2021 08:30:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67720.121074; Fri, 15 Jan 2021 08:30:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0KV4-0000Fg-ON; Fri, 15 Jan 2021 08:30:30 +0000
Received: by outflank-mailman (input) for mailman id 67720;
 Fri, 15 Jan 2021 08:30:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v6X5=GS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l0KV3-0008Gh-FP
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 08:30:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 376dc9d4-0c26-4f59-9a6f-0a1f6df6d6ad;
 Fri, 15 Jan 2021 08:30:14 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 68486B95F;
 Fri, 15 Jan 2021 08:30:07 +0000 (UTC)
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
X-Inumbo-ID: 376dc9d4-0c26-4f59-9a6f-0a1f6df6d6ad
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610699408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dqtva9i5hOWwd+C/RFxrhHjBGyOaW9BmEt02J1LO82U=;
	b=nvyVrZGTnTv22kXzkMtZ4QopXiLwHKPd9l83UQBx0kogCA6BZ5PjVlGz/ZV2nOLUFZRZKv
	bX4IIGQSCnnc2R5qIyn5vZ9/JcZZQ8yitODd42QeLYajsLzprSfEzHl6qZlMLR8yv9ceTD
	xbjQcwwAEYstGN5cmZYWTg7gd02pthk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v12 21/27] tools/xenstore: read internal state when doing live upgrade
Date: Fri, 15 Jan 2021 09:29:54 +0100
Message-Id: <20210115083000.14186-22-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210115083000.14186-1-jgross@suse.com>
References: <20210115083000.14186-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When started due to a live upgrade read the internal state and apply
it to the data base and internal structures.

Add the main control functions for that.

For now only handle the daemon case.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Paul Durrant <paul@xen.org>
Acked-by: Julien Grall <jgrall@amazon.com>
---
V4:
- directly mmap dump state file (Julien Grall)
- use syslog() instead of xprintf() (Julien Grall)

V8:
- remove state file after reading it (Julien Grall)
---
 tools/xenstore/xenstored_control.c | 102 ++++++++++++++++++++++++++++-
 1 file changed, 101 insertions(+), 1 deletion(-)

diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index 5151c1448e..3bced9e39e 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -67,6 +67,14 @@ struct live_update {
 
 static struct live_update *lu_status;
 
+struct lu_dump_state {
+	void *buf;
+	unsigned int size;
+#ifndef __MINIOS__
+	int fd;
+#endif
+};
+
 static int lu_destroy(void *data)
 {
 #ifdef __MINIOS__
@@ -318,6 +326,14 @@ static void lu_dump_close(FILE *fp)
 
 	fclose(fp);
 }
+
+static void lu_get_dump_state(struct lu_dump_state *state)
+{
+}
+
+static void lu_close_dump_state(struct lu_dump_state *state)
+{
+}
 #else
 static const char *lu_binary(const void *ctx, struct connection *conn,
 			     const char *filename)
@@ -373,6 +389,50 @@ static void lu_dump_close(FILE *fp)
 {
 	fclose(fp);
 }
+
+static void lu_get_dump_state(struct lu_dump_state *state)
+{
+	char *filename;
+	struct stat statbuf;
+
+	state->size = 0;
+
+	filename = talloc_asprintf(NULL, "%s/state_dump", xs_daemon_rootdir());
+	if (!filename)
+		barf("Allocation failure");
+
+	state->fd = open(filename, O_RDONLY);
+	talloc_free(filename);
+	if (state->fd < 0)
+		return;
+	if (fstat(state->fd, &statbuf) != 0)
+		goto out_close;
+	state->size = statbuf.st_size;
+
+	state->buf = mmap(NULL, state->size, PROT_READ, MAP_PRIVATE,
+			  state->fd, 0);
+	if (state->buf == MAP_FAILED) {
+		state->size = 0;
+		goto out_close;
+	}
+
+	return;
+
+ out_close:
+	close(state->fd);
+}
+
+static void lu_close_dump_state(struct lu_dump_state *state)
+{
+	char *filename;
+
+	munmap(state->buf, state->size);
+	close(state->fd);
+
+	filename = talloc_asprintf(NULL, "%s/state_dump", xs_daemon_rootdir());
+	unlink(filename);
+	talloc_free(filename);
+}
 #endif
 
 static bool lu_check_lu_allowed(void)
@@ -455,7 +515,47 @@ static const char *lu_dump_state(const void *ctx, struct connection *conn)
 
 void lu_read_state(void)
 {
-	xprintf("live-update: read state\n");
+	struct lu_dump_state state;
+	struct xs_state_record_header *head;
+	void *ctx = talloc_new(NULL); /* Work context for subfunctions. */
+	struct xs_state_preamble *pre;
+
+	syslog(LOG_INFO, "live-update: read state\n");
+	lu_get_dump_state(&state);
+	if (state.size == 0)
+		barf_perror("No state found after live-update");
+
+	pre = state.buf;
+	if (memcmp(pre->ident, XS_STATE_IDENT, sizeof(pre->ident)) ||
+	    pre->version != htobe32(XS_STATE_VERSION) ||
+	    pre->flags != XS_STATE_FLAGS)
+		barf("Unknown record identifier");
+	for (head = state.buf + sizeof(*pre);
+	     head->type != XS_STATE_TYPE_END &&
+		(void *)head - state.buf < state.size;
+	     head = (void *)head + sizeof(*head) + head->length) {
+		switch (head->type) {
+		case XS_STATE_TYPE_GLOBAL:
+			break;
+		case XS_STATE_TYPE_CONN:
+			break;
+		case XS_STATE_TYPE_WATCH:
+			break;
+		case XS_STATE_TYPE_TA:
+			xprintf("live-update: ignore transaction record\n");
+			break;
+		case XS_STATE_TYPE_NODE:
+			break;
+		default:
+			xprintf("live-update: unknown state record %08x\n",
+				head->type);
+			break;
+		}
+	}
+
+	lu_close_dump_state(&state);
+
+	talloc_free(ctx);
 }
 
 static const char *lu_activate_binary(const void *ctx)
-- 
2.26.2


