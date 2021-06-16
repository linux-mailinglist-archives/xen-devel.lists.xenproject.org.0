Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B133A9DF6
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 16:43:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143282.264149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltWlT-0005rn-1C; Wed, 16 Jun 2021 14:43:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143282.264149; Wed, 16 Jun 2021 14:43:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltWlS-0005nt-TV; Wed, 16 Jun 2021 14:43:34 +0000
Received: by outflank-mailman (input) for mailman id 143282;
 Wed, 16 Jun 2021 14:43:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ltWlR-0005fp-7T
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 14:43:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ltWlQ-0004DK-36; Wed, 16 Jun 2021 14:43:32 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ltWlP-0007D0-QY; Wed, 16 Jun 2021 14:43:32 +0000
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
	 bh=P1+HaOfv4X7DVCks8z7Jhaa8GAvQxlzVkg9j3S037W8=; b=quBzH1JZOnInax6kNzeH3FNAI
	zbQZXo1G76WpD5d+HcsDZ6AHyMZ6J/2PCCik/5r6a0V2YUPwXGe2Em4vBSutgGFNH8nwsN3SdfjNM
	7dWkknRc/yifzOYru3RRYEpUxPII6ICpxUPwHd6kYQZwMTHXkuhCBuz0b3D690WnDTrng=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk,
	doebel@amazon.de,
	Julien Grall <jgrall@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH 03/10] tools/xenstore: Don't assume conn->in points to the LU request
Date: Wed, 16 Jun 2021 15:43:17 +0100
Message-Id: <20210616144324.31652-4-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210616144324.31652-1-julien@xen.org>
References: <20210616144324.31652-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

call_delayed() is currently assuming that conn->in is NULL when
handling delayed request. However, the connection is not paused.
Therefore new request can be processed and conn->in may be non-NULL
if we have only received a partial request.

Furthermore, as we overwrite conn->in, the current partial request
will not be transferred. This will result to corrupt the connection.

Rather than updating conn->in, stash the LU request in lu_status and
let each callback for delayed request to update conn->in when
necessary.

To keep a sane interface, the code to write the "OK" response the
LU request is moved in xenstored_core.c.

Fixes: c5ca1404b4 ("tools/xenstore: add support for delaying execution of a xenstore request")
Fixes: ed6eebf17d ("tools/xenstore: dump the xenstore state for live update")
Signed-off-by: Julien Grall <jgrall@amazon.com>

----

This is fixing bugs from two separate commits. I couldn't figure out
how to split in two patches without breaking bisection.
---
 tools/xenstore/xenstored_control.c | 41 ++++++++++++++++++++++++++++--
 tools/xenstore/xenstored_control.h |  3 +++
 tools/xenstore/xenstored_core.c    | 17 +++----------
 3 files changed, 46 insertions(+), 15 deletions(-)

diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index d08a2b961432..7acc2d134f9f 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -50,6 +50,9 @@ struct live_update {
 	/* For verification the correct connection is acting. */
 	struct connection *conn;
 
+	/* Pointer to the command used to request LU */
+	struct buffered_data *in;
+
 #ifdef __MINIOS__
 	void *kernel;
 	unsigned int kernel_size;
@@ -100,6 +103,7 @@ static const char *lu_begin(struct connection *conn)
 	if (!lu_status)
 		return "Allocation failure.";
 	lu_status->conn = conn;
+	lu_status->in = conn->in;
 	talloc_set_destructor(lu_status, lu_destroy);
 
 	return NULL;
@@ -110,11 +114,34 @@ struct connection *lu_get_connection(void)
 	return lu_status ? lu_status->conn : NULL;
 }
 
+unsigned int lu_write_response(FILE *fp)
+{
+	struct xsd_sockmsg msg;
+
+	assert(lu_status);
+
+	msg = lu_status->in->hdr.msg;
+
+	msg.len = sizeof("OK");
+	if (fp && fwrite(&msg, sizeof(msg), 1, fp) != 1)
+		return 0;
+	if (fp && fwrite("OK", msg.len, 1, fp) != 1)
+		return 0;
+
+	return sizeof(msg) + msg.len;
+}
+
 #else
 struct connection *lu_get_connection(void)
 {
 	return NULL;
 }
+
+unsigned int lu_write_response(FILE *fp)
+{
+	/* Unsupported */
+	return 0;
+}
 #endif
 
 struct cmd_s {
@@ -658,6 +685,8 @@ static bool do_lu_start(struct delayed_request *req)
 {
 	time_t now = time(NULL);
 	const char *ret;
+	struct buffered_data *saved_in;
+	struct connection *conn = lu_status->conn;
 
 	if (!lu_check_lu_allowed()) {
 		if (now < lu_status->started_at + lu_status->timeout)
@@ -668,8 +697,9 @@ static bool do_lu_start(struct delayed_request *req)
 		}
 	}
 
+	assert(req->in == lu_status->in);
 	/* Dump out internal state, including "OK" for live update. */
-	ret = lu_dump_state(req->in, lu_status->conn);
+	ret = lu_dump_state(req->in, conn);
 	if (!ret) {
 		/* Perform the activation of new binary. */
 		ret = lu_activate_binary(req->in);
@@ -677,7 +707,14 @@ static bool do_lu_start(struct delayed_request *req)
 
 	/* We will reach this point only in case of failure. */
  out:
-	send_reply(lu_status->conn, XS_CONTROL, ret, strlen(ret) + 1);
+	/*
+	 * send_reply() will send the response for conn->in. Save the current
+	 * conn->in and restore it afterwards.
+	 */
+	saved_in = conn->in;
+	conn->in = req->in;
+	send_reply(conn, XS_CONTROL, ret, strlen(ret) + 1);
+	conn->in = saved_in;
 	talloc_free(lu_status);
 
 	return true;
diff --git a/tools/xenstore/xenstored_control.h b/tools/xenstore/xenstored_control.h
index 6842b8d88760..27d7f19e4b7f 100644
--- a/tools/xenstore/xenstored_control.h
+++ b/tools/xenstore/xenstored_control.h
@@ -20,3 +20,6 @@ int do_control(struct connection *conn, struct buffered_data *in);
 void lu_read_state(void);
 
 struct connection *lu_get_connection(void);
+
+/* Write the "OK" response for the live-update command */
+unsigned int lu_write_response(FILE *fp);
diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 607187361d84..41b26d7094c8 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -272,15 +272,10 @@ static int undelay_request(void *_req)
 
 static void call_delayed(struct connection *conn, struct delayed_request *req)
 {
-	assert(conn->in == NULL);
-	conn->in = req->in;
-
 	if (req->func(req)) {
 		undelay_request(req);
 		talloc_set_destructor(req, NULL);
 	}
-
-	conn->in = NULL;
 }
 
 int delay_request(struct connection *conn, struct buffered_data *in,
@@ -2375,7 +2370,7 @@ const char *dump_state_buffered_data(FILE *fp, const struct connection *c,
 	struct buffered_data *out, *in = c->in;
 	bool partial = true;
 
-	if (in && c != lu_get_connection()) {
+	if (in) {
 		len = in->inhdr ? in->used : sizeof(in->hdr);
 		if (fp && fwrite(&in->hdr, len, 1, fp) != 1)
 			return "Dump read data error";
@@ -2416,16 +2411,12 @@ const char *dump_state_buffered_data(FILE *fp, const struct connection *c,
 
 	/* Add "OK" for live-update command. */
 	if (c == lu_get_connection()) {
-		struct xsd_sockmsg msg = c->in->hdr.msg;
+		unsigned int rc = lu_write_response(fp);
 
-		msg.len = sizeof("OK");
-		if (fp && fwrite(&msg, sizeof(msg), 1, fp) != 1)
+		if (!rc)
 			return "Dump buffered data error";
-		len += sizeof(msg);
-		if (fp && fwrite("OK", msg.len, 1, fp) != 1)
 
-			return "Dump buffered data error";
-		len += msg.len;
+		len += rc;
 	}
 
 	if (sc)
-- 
2.17.1


