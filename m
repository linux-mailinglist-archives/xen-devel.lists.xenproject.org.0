Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7D22F6500
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 16:49:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67257.119929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04rq-0005WC-0t; Thu, 14 Jan 2021 15:48:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67257.119929; Thu, 14 Jan 2021 15:48:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04rp-0005Vn-Tx; Thu, 14 Jan 2021 15:48:57 +0000
Received: by outflank-mailman (input) for mailman id 67257;
 Thu, 14 Jan 2021 15:48:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P5GR=GR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l04iB-0002Sh-K6
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 15:38:59 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2a398fed-cfbb-4ab9-bf50-64dde4240f45;
 Thu, 14 Jan 2021 15:38:11 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5E7E8AF19;
 Thu, 14 Jan 2021 15:38:09 +0000 (UTC)
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
X-Inumbo-ID: 2a398fed-cfbb-4ab9-bf50-64dde4240f45
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610638689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iR6mpN6JQlOv+YSxhvafMHQDyRtw3t8nq8G7VprsFtI=;
	b=XbzDZFd0H/6I9sGxRBGak3DJTRXlnHIsiqgnEL7dD44/DaKF9ly8emgcyBkBU2Plnee68h
	y+bVXn3MsG3bUFlhiN+lDKLS8aVfi/39bNH65B2UED0PJVu61kYqtlXTxIo3r3dm6/DRve
	LznHt8AAfW5Ij2b3/0tfjYzuC9hXqiw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v11 13/27] tools/xenstore: add the basic framework for doing the live update
Date: Thu, 14 Jan 2021 16:37:49 +0100
Message-Id: <20210114153803.2591-14-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114153803.2591-1-jgross@suse.com>
References: <20210114153803.2591-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the main framework for executing the live update. This for now
only defines the basic execution steps with empty dummy functions.
This final step returning means failure, as in case of success the
new executable will have taken over.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V4:
- const (Julien Grall)

V11:
- split lu_check_lu_allowed()
- use delay_request() framework
---
 tools/xenstore/xenstored_control.c | 83 +++++++++++++++++++++++++++++-
 1 file changed, 82 insertions(+), 1 deletion(-)

diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index 2e0827b9ef..5193c55781 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -22,6 +22,7 @@ Interactive commands for Xen Store Daemon.
 #include <stdlib.h>
 #include <string.h>
 #include <syslog.h>
+#include <time.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <unistd.h>
@@ -44,6 +45,11 @@ struct live_update {
 #endif
 
 	char *cmdline;
+
+	/* Start parameters. */
+	bool force;
+	unsigned int timeout;
+	time_t started_at;
 };
 
 static struct live_update *lu_status;
@@ -304,9 +310,64 @@ static const char *lu_arch(const void *ctx, struct connection *conn,
 }
 #endif
 
+static bool lu_check_lu_allowed(void)
+{
+	return true;
+}
+
+static const char *lu_reject_reason(const void *ctx)
+{
+	return "BUSY";
+}
+
+static const char *lu_dump_state(const void *ctx, struct connection *conn)
+{
+	return NULL;
+}
+
+static const char *lu_activate_binary(const void *ctx)
+{
+	return "Not yet implemented.";
+}
+
+static bool do_lu_start(struct delayed_request *req)
+{
+	time_t now = time(NULL);
+	const char *ret;
+	char *resp;
+
+	if (!lu_check_lu_allowed()) {
+		if (now < lu_status->started_at + lu_status->timeout)
+			return false;
+		if (!lu_status->force) {
+			ret = lu_reject_reason(req);
+			goto out;
+		}
+	}
+
+	/* Dump out internal state, including "OK" for live update. */
+	ret = lu_dump_state(req->in, lu_status->conn);
+	if (!ret) {
+		/* Perform the activation of new binary. */
+		ret = lu_activate_binary(req->in);
+	}
+
+	/* We will reach this point only in case of failure. */
+ out:
+	talloc_free(lu_status);
+
+	resp = talloc_strdup(req->in, ret);
+	send_reply(lu_status->conn, XS_CONTROL, resp, strlen(resp) + 1);
+
+	return true;
+}
+
 static const char *lu_start(const void *ctx, struct connection *conn,
 			    bool force, unsigned int to)
 {
+	const char *ret;
+	int rc = 0;
+
 	syslog(LOG_INFO, "live-update: start, force=%d, to=%u\n", force, to);
 
 	if (!lu_status || lu_status->conn != conn)
@@ -317,8 +378,24 @@ static const char *lu_start(const void *ctx, struct connection *conn,
 		return "Kernel not complete.";
 #endif
 
-	/* Will be replaced by real live-update later. */
+	lu_status->force = force;
+	lu_status->timeout = to;
+	lu_status->started_at = time(NULL);
+
+	rc = delay_request(conn, conn->in, do_lu_start, NULL);
+
+	/* Dump out internal state, including "OK" for live update. */
+	ret = lu_dump_state(ctx, conn);
+	if (ret)
+		goto out;
+
+	/* Perform the activation of new binary. */
+	ret = lu_activate_binary(ctx);
+	/* We will reach this point only in case of failure. */
+
+ out:
 	talloc_free(lu_status);
+	errno = rc;
 
 	return NULL;
 }
@@ -356,6 +433,10 @@ static int do_control_lu(void *ctx, struct connection *conn,
 				return EINVAL;
 		}
 		ret = lu_start(ctx, conn, force, to);
+		if (errno)
+			return errno;
+		if (!ret)
+			return 0;
 	} else {
 		errno = 0;
 		ret = lu_arch(ctx, conn, vec, num);
-- 
2.26.2


