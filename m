Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E90FA7F6B55
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 05:22:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640139.997996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6NhW-0005KN-C6; Fri, 24 Nov 2023 04:21:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640139.997996; Fri, 24 Nov 2023 04:21:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6NhW-0005I0-7y; Fri, 24 Nov 2023 04:21:58 +0000
Received: by outflank-mailman (input) for mailman id 640139;
 Fri, 24 Nov 2023 04:21:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dUjn=HF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r6NhU-00058O-I2
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 04:21:56 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ffaceaf6-8a80-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 05:21:54 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0A573219E7;
 Thu, 23 Nov 2023 16:08:38 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id D3BED13A82;
 Thu, 23 Nov 2023 16:08:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id l4txMgV5X2U3FgAAn2gu4w
 (envelope-from <jgross@suse.com>); Thu, 23 Nov 2023 16:08:37 +0000
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
X-Inumbo-ID: ffaceaf6-8a80-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1700755718; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=QHUW1pcodr2Ecs7+WSFnTxBagJ8d8TMSXSpTTvwKGZ0=;
	b=sJRBQu15/wd1NBWLZK+wPAElUy3ml3oGDcppZeuImv/RU3VqTSSGYyzqUPnJYRdoFX5qVU
	Al3NTwaPWppTXapLfhhbrld+j8m083sdo/GCUypARYbX+pJXdCHjJIQ49Yc1EQXzidKChl
	/yaIm0SRD1svRkCiCPQCNXFSm7YhLZY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] tools/xenstored: potentially split trace_io() out message
Date: Thu, 23 Nov 2023 17:08:34 +0100
Message-Id: <20231123160834.17674-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: *
X-Spam-Flag: NO
X-Spam-Score: 1.90
X-Spamd-Result: default: False [1.90 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]

Today write_messages() will call trace_io() after having written the
complete message to the ring buffer or socket.

In case the message can't be written in one go, split it by writing
one trace entry when starting the write and one when finishing it.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
This patch is meant to go on top of the patch "tools/xenstored: remove
\"-V\" command line option" in order to not lose any possible debug
information.
---
 tools/xenstored/core.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index 9046b200bc..a14b240ed9 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -121,7 +121,7 @@ void trace(const char *fmt, ...)
 
 static void trace_io(const struct connection *conn,
 		     const struct buffered_data *data,
-		     int out)
+		     const char *type)
 {
 	unsigned int i;
 	time_t now;
@@ -134,8 +134,7 @@ static void trace_io(const struct connection *conn,
 	tm = localtime(&now);
 
 	trace("io: %s %p (d%u) %04d%02d%02d %02d:%02d:%02d %s (",
-	      out ? "OUT" : "IN", conn, conn->id,
-	      tm->tm_year + 1900, tm->tm_mon + 1,
+	      type, conn, conn->id, tm->tm_year + 1900, tm->tm_mon + 1,
 	      tm->tm_mday, tm->tm_hour, tm->tm_min, tm->tm_sec,
 	      sockmsg_string(data->hdr.msg.type));
 	
@@ -321,43 +320,54 @@ static bool write_messages(struct connection *conn)
 {
 	int ret;
 	struct buffered_data *out;
+	bool started = false;
 
 	out = list_top(&conn->out_list, struct buffered_data, list);
 	if (out == NULL)
 		return true;
 
 	if (out->inhdr) {
+		started = !out->used;
 		ret = conn->funcs->write(conn, out->hdr.raw + out->used,
 					 sizeof(out->hdr) - out->used);
 		if (ret < 0)
-			return false;
+			goto err;
 
 		out->used += ret;
 		if (out->used < sizeof(out->hdr))
-			return true;
+			goto start;
 
 		out->inhdr = false;
 		out->used = 0;
 
 		/* Second write might block if non-zero. */
 		if (out->hdr.msg.len && !conn->domain)
-			return true;
+			goto start;
 	}
 
 	ret = conn->funcs->write(conn, out->buffer + out->used,
 				 out->hdr.msg.len - out->used);
 	if (ret < 0)
-		return false;
+		goto err;
 
 	out->used += ret;
 	if (out->used != out->hdr.msg.len)
-		return true;
+		goto start;
 
-	trace_io(conn, out, 1);
+	trace_io(conn, out, started ? "OUT" : "OUT(END)");
 
 	free_buffered_data(out, conn);
 
 	return true;
+
+ err:
+	trace_io(conn, out, "OUT(ERR)");
+	return false;
+
+ start:
+	if (started)
+		trace_io(conn, out, "OUT(START)");
+	return true;
 }
 
 static int undelay_request(void *_req)
@@ -2067,7 +2077,7 @@ static void process_message(struct connection *conn, struct buffered_data *in)
 
 	/* At least send_error() and send_reply() expects conn->in == in */
 	assert(conn->in == in);
-	trace_io(conn, in, 0);
+	trace_io(conn, in, "IN");
 
 	if ((unsigned int)type >= XS_TYPE_COUNT || !wire_funcs[type].func) {
 		eprintf("Client unknown operation %i", type);
-- 
2.35.3


