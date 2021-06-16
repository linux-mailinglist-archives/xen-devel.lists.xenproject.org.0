Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9463A9DEC
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 16:43:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143287.264199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltWlZ-0007DW-Lk; Wed, 16 Jun 2021 14:43:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143287.264199; Wed, 16 Jun 2021 14:43:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltWlZ-00077z-AK; Wed, 16 Jun 2021 14:43:41 +0000
Received: by outflank-mailman (input) for mailman id 143287;
 Wed, 16 Jun 2021 14:43:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ltWlX-0006uw-Mo
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 14:43:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ltWlW-0004El-UA; Wed, 16 Jun 2021 14:43:38 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ltWlW-0007D0-LZ; Wed, 16 Jun 2021 14:43:38 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=Jt8gi0XN2RUq5+ySNQqwwiEayVXWhG3OzYqjKkFvJ1s=; b=RooQrwIt8jwfxA3Q7p226Z7KI
	sS65LowA7JvCVwNRGe5ajhcxHT3ymqNn9jwJGdC2Ir/o2DDWcz/i25+JbG1GldtTzVyh7MbrXa3Q9
	VuUWvfJdZz2rKoG0kis30MSplQuzUPrrkZkviOqTfqGT0w0EVWD1SIijLdVkDcx2rTSBQ=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk,
	doebel@amazon.de,
	Julien Grall <jgrall@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH 08/10] tools/xenstored: Extend restore code to handle multiple input buffer
Date: Wed, 16 Jun 2021 15:43:22 +0100
Message-Id: <20210616144324.31652-9-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210616144324.31652-1-julien@xen.org>
References: <20210616144324.31652-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

Currently, the restore code is considering the stream will contain at
most one in-flight request per connection. In a follow-up changes, we
will want to transfer multiple in-flight requests.

The function read_state_buffered() is now extended to restore multiple
in-flight request. Complete requests will be queued as delayed
requests, if there a partial request (only the last one can) then it
will used as the current in-flight request.

Note that we want to bypass the quota check for delayed requests as
the new Xenstore may have a lower limit.

Lastly, there is no need to change the specification as there was
no restriction on the number of in-flight requests preserved.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstore/xenstored_core.c | 56 ++++++++++++++++++++++++++++-----
 1 file changed, 48 insertions(+), 8 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index a5084a5b173d..5b7ab7f74013 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -1486,6 +1486,10 @@ static void process_message(struct connection *conn, struct buffered_data *in)
 	enum xsd_sockmsg_type type = in->hdr.msg.type;
 	int ret;
 
+	/* At least send_error() and send_reply() expects conn->in == in */
+	assert(conn->in == in);
+	trace_io(conn, in, 0);
+
 	if ((unsigned int)type >= XS_TYPE_COUNT || !wire_funcs[type].func) {
 		eprintf("Client unknown operation %i", type);
 		send_error(conn, ENOSYS);
@@ -1515,6 +1519,23 @@ static void process_message(struct connection *conn, struct buffered_data *in)
 	conn->transaction = NULL;
 }
 
+static bool process_delayed_message(struct delayed_request *req)
+{
+	struct connection *conn = req->data;
+	struct buffered_data *saved_in = conn->in;
+
+	/*
+	 * Part of process_message() expects conn->in to contains the
+	 * processed response. So save the current conn->in and restore it
+	 * afterwards.
+	 */
+	conn->in = req->in;
+	process_message(req->data, req->in);
+	conn->in = saved_in;
+
+	return true;
+}
+
 static void consider_message(struct connection *conn)
 {
 	if (verbose)
@@ -1582,7 +1603,6 @@ static void handle_input(struct connection *conn)
 	if (in->used != in->hdr.msg.len)
 		return;
 
-	trace_io(conn, in, 0);
 	consider_message(conn);
 	return;
 
@@ -2611,14 +2631,20 @@ void read_state_buffered_data(const void *ctx, struct connection *conn,
 	unsigned int len;
 	bool partial = sc->data_resp_len;
 
-	if (sc->data_in_len) {
+	for (data = sc->data; data < sc->data + sc->data_in_len; data += len) {
 		bdata = new_buffer(conn);
 		if (!bdata)
 			barf("error restoring read data");
-		if (sc->data_in_len < sizeof(bdata->hdr)) {
+
+		/*
+		 * We don't know yet if there is more than one message
+		 * to process. So the len is the size of the leftover data.
+		 */
+		len = sc->data_in_len - (data - sc->data);
+		if (len < sizeof(bdata->hdr)) {
 			bdata->inhdr = true;
-			memcpy(&bdata->hdr, sc->data, sc->data_in_len);
-			bdata->used = sc->data_in_len;
+			memcpy(&bdata->hdr, sc->data, len);
+			bdata->used = len;
 		} else {
 			bdata->inhdr = false;
 			memcpy(&bdata->hdr, sc->data, sizeof(bdata->hdr));
@@ -2629,12 +2655,26 @@ void read_state_buffered_data(const void *ctx, struct connection *conn,
 							bdata->hdr.msg.len);
 			if (!bdata->buffer)
 				barf("Error allocating in buffer");
-			bdata->used = sc->data_in_len - sizeof(bdata->hdr);
-			memcpy(bdata->buffer, sc->data + sizeof(bdata->hdr),
+			bdata->used = min_t(unsigned int,
+					    len - sizeof(bdata->hdr),
+					    bdata->hdr.msg.len);
+			memcpy(bdata->buffer, data + sizeof(bdata->hdr),
 			       bdata->used);
+			/* Update len to match the size of the message. */
+			len = bdata->used + sizeof(bdata->hdr);
 		}
 
-		conn->in = bdata;
+		/*
+		 * If the message is not complete, then it means this was
+		 * the current processed message. All the other messages
+		 * will be queued to be handled after restoring.
+		 */
+		if (bdata->inhdr || bdata->used != bdata->hdr.msg.len) {
+			assert(conn->in == NULL);
+			conn->in = bdata;
+		} else if (delay_request(conn, bdata, process_delayed_message,
+					 conn, true))
+			barf("Unable to delay the request");
 	}
 
 	for (data = sc->data + sc->data_in_len;
-- 
2.17.1


