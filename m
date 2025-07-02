Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A61AF0DC1
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 10:21:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030534.1404265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWsiY-0002Mp-NB; Wed, 02 Jul 2025 08:21:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030534.1404265; Wed, 02 Jul 2025 08:21:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWsiY-0002KJ-JD; Wed, 02 Jul 2025 08:21:22 +0000
Received: by outflank-mailman (input) for mailman id 1030534;
 Wed, 02 Jul 2025 08:21:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFiP=ZP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uWsb9-00082X-81
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 08:13:43 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7706b6b8-571c-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 10:13:41 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 73B531F452;
 Wed,  2 Jul 2025 08:13:41 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 49AC213A24;
 Wed,  2 Jul 2025 08:13:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id l8M6EDXqZGg+SQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 02 Jul 2025 08:13:41 +0000
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
X-Inumbo-ID: 7706b6b8-571c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1751444021; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n3xdHTHhnqc+GZbIRwTftFXYxJ+xtVKpvXphY7KAzMI=;
	b=a4vz/B8wffipetAwuW46AvoaCLwJGo5KRt+wIm8THWF+WdzdYq3cQmubanWFNX/KUlK3Ou
	n5HTRmezd0pmVb+0N8vD52XCLiLRnjgbdGBBNdwePdIzTffJKRx/mmKtxcoNGZQrXtppA2
	a6SsRtNPN5YJ0Hi2zTTSAw2Yp5A8Wm8=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1751444021; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n3xdHTHhnqc+GZbIRwTftFXYxJ+xtVKpvXphY7KAzMI=;
	b=a4vz/B8wffipetAwuW46AvoaCLwJGo5KRt+wIm8THWF+WdzdYq3cQmubanWFNX/KUlK3Ou
	n5HTRmezd0pmVb+0N8vD52XCLiLRnjgbdGBBNdwePdIzTffJKRx/mmKtxcoNGZQrXtppA2
	a6SsRtNPN5YJ0Hi2zTTSAw2Yp5A8Wm8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 5/9] xenstored: use fread() instead of mmap() for reading live update state
Date: Wed,  2 Jul 2025 10:13:01 +0200
Message-ID: <20250702081305.14440-6-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702081305.14440-1-jgross@suse.com>
References: <20250702081305.14440-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -6.80

Mini-OS doesn't support using mmap() for accessing a file. In order
to support reading the live update state from a 9pfs based file, use
fread() instead of mmap().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstored/lu.c | 93 +++++++++++++++++++++++++++-----------------
 1 file changed, 58 insertions(+), 35 deletions(-)

diff --git a/tools/xenstored/lu.c b/tools/xenstored/lu.c
index 4fccbbc195..029c4fab72 100644
--- a/tools/xenstored/lu.c
+++ b/tools/xenstored/lu.c
@@ -25,9 +25,11 @@
 
 struct lu_dump_state {
 	void *buf;
+	unsigned int buf_size;
 	unsigned int size;
-	int fd;
+	unsigned int offset;
 	char *filename;
+	FILE *fp;
 };
 
 struct live_update *lu_status;
@@ -80,9 +82,10 @@ bool lu_is_pending(void)
 	return lu_status != NULL;
 }
 
-static void lu_get_dump_state(struct lu_dump_state *state)
+static void lu_get_dump_state(void *ctx, struct lu_dump_state *state)
 {
 	struct stat statbuf;
+	int fd;
 
 	state->size = 0;
 
@@ -91,77 +94,102 @@ static void lu_get_dump_state(struct lu_dump_state *state)
 	if (!state->filename)
 		barf("Allocation failure");
 
-	state->fd = open(state->filename, O_RDONLY);
-	if (state->fd < 0)
-		return;
-	if (fstat(state->fd, &statbuf) != 0)
-		goto out_close;
+	fd = open(state->filename, O_RDONLY);
+	if (fd < 0)
+		barf("No state file found");
+	if (fstat(fd, &statbuf) != 0)
+		barf("Could not fstat state file");
 	state->size = statbuf.st_size;
 
-	state->buf = mmap(NULL, state->size, PROT_READ, MAP_PRIVATE,
-			  state->fd, 0);
-	if (state->buf == MAP_FAILED) {
-		state->size = 0;
-		goto out_close;
-	}
+	/* Start with a 4k buffer. If needed we'll reallocate a larger one. */
+	state->buf_size = 4096;
+	state->buf = talloc_size(ctx, state->buf_size);
+	if (!state->buf)
+		barf("Allocation failure");
 
-	return;
+	state->fp = fdopen(fd, "r");
+}
 
- out_close:
-	close(state->fd);
+static void lu_dump_close(FILE *fp)
+{
+	fclose(fp);
 }
 
 static void lu_close_dump_state(struct lu_dump_state *state)
 {
 	assert(state->filename != NULL);
 
-	munmap(state->buf, state->size);
-	close(state->fd);
+	lu_dump_close(state->fp);
 
 	unlink(state->filename);
 	talloc_free(state->filename);
+	talloc_free(state->buf);
+}
+
+static void lu_read_data(void *ctx, struct lu_dump_state *state,
+			 unsigned int size)
+{
+	if (state->offset + size > state->size)
+		barf("Inconsistent state data");
+
+	if (size > state->buf_size) {
+		state->buf = talloc_realloc_size(ctx, state->buf, size);
+		if (!state->buf)
+			barf("Allocation failure");
+		state->buf_size = size;
+	}
+
+	if (fread(state->buf, size, 1, state->fp) != 1)
+		barf("State read error");
+
+	state->offset += size;
 }
 
 void lu_read_state(void)
 {
 	struct lu_dump_state state = {};
-	struct xs_state_record_header *head;
+	struct xs_state_record_header head;
 	void *ctx = talloc_new(NULL); /* Work context for subfunctions. */
 	struct xs_state_preamble *pre;
 
 	syslog(LOG_INFO, "live-update: read state\n");
-	lu_get_dump_state(&state);
+	lu_get_dump_state(ctx, &state);
 	if (state.size == 0)
 		barf_perror("No state found after live-update");
 
+	lu_read_data(ctx, &state, sizeof(*pre));
 	pre = state.buf;
 	if (memcmp(pre->ident, XS_STATE_IDENT, sizeof(pre->ident)) ||
 	    pre->version != htobe32(XS_STATE_VERSION) ||
 	    pre->flags != XS_STATE_FLAGS)
 		barf("Unknown record identifier");
-	for (head = state.buf + sizeof(*pre);
-	     head->type != XS_STATE_TYPE_END &&
-		(void *)head - state.buf < state.size;
-	     head = (void *)head + sizeof(*head) + head->length) {
-		switch (head->type) {
+
+	for (;;) {
+		lu_read_data(ctx, &state, sizeof(head));
+		head = *(struct xs_state_record_header *)(state.buf);
+		if (head.type == XS_STATE_TYPE_END)
+			break;
+		lu_read_data(ctx, &state, head.length);
+
+		switch (head.type) {
 		case XS_STATE_TYPE_GLOBAL:
-			read_state_global(ctx, head + 1);
+			read_state_global(ctx, state.buf);
 			break;
 		case XS_STATE_TYPE_CONN:
-			read_state_connection(ctx, head + 1);
+			read_state_connection(ctx, state.buf);
 			break;
 		case XS_STATE_TYPE_WATCH:
-			read_state_watch(ctx, head + 1);
+			read_state_watch(ctx, state.buf);
 			break;
 		case XS_STATE_TYPE_TA:
 			xprintf("live-update: ignore transaction record\n");
 			break;
 		case XS_STATE_TYPE_NODE:
-			read_state_node(ctx, head + 1);
+			read_state_node(ctx, state.buf);
 			break;
 		default:
 			xprintf("live-update: unknown state record %08x\n",
-				head->type);
+				head.type);
 			break;
 		}
 	}
@@ -266,11 +294,6 @@ static FILE *lu_dump_open(const void *ctx)
 	return fdopen(fd, "w");
 }
 
-static void lu_dump_close(FILE *fp)
-{
-	fclose(fp);
-}
-
 static const char *lu_dump_state(const void *ctx, struct connection *conn)
 {
 	FILE *fp;
-- 
2.43.0


