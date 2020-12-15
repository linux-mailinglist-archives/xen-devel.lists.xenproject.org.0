Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E07D2DB18B
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 17:36:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54543.94923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDJQ-0006ge-NZ; Tue, 15 Dec 2020 16:36:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54543.94923; Tue, 15 Dec 2020 16:36:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDJQ-0006ff-H6; Tue, 15 Dec 2020 16:36:32 +0000
Received: by outflank-mailman (input) for mailman id 54543;
 Tue, 15 Dec 2020 16:36:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2CwE=FT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kpDJO-000667-Go
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 16:36:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ad375b72-b3e0-4ac5-a755-001c076d9bc0;
 Tue, 15 Dec 2020 16:36:12 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EFEEEB267;
 Tue, 15 Dec 2020 16:36:09 +0000 (UTC)
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
X-Inumbo-ID: ad375b72-b3e0-4ac5-a755-001c076d9bc0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608050170; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nPZAkpB2QjQ2BH5uTUJNNCYD4hmthye6v2/HhM/4weY=;
	b=n29LNHon97XlJ3SwFAAL9se/VmJcMCOGjszGdVU/BSKULo+CzD9a4hn456b/ZUNFzgmUns
	TpqqvWBYiD5pdGC2/DNpZ6lrTF4BgRRk3s3b9KRcLfglCFOK7CiId3/cAjFDKgnJU0jrn+
	sOLUqhl9Oo4SzA8d59W7SO7tYMoLhrI=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Julien Grall <jgrall@amazon.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v10 11/25] tools/xenstore: add the basic framework for doing the live update
Date: Tue, 15 Dec 2020 17:35:49 +0100
Message-Id: <20201215163603.21700-12-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201215163603.21700-1-jgross@suse.com>
References: <20201215163603.21700-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the main framework for executing the live update. This for now
only defines the basic execution steps with empty dummy functions.
This final step returning means failure, as in case of success the
new executable will have taken over.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Paul Durrant <paul@xen.org>
---
V4:
- const (Julien Grall)
---
 tools/xenstore/xenstored_control.c | 39 ++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index 2e0827b9ef..940b717741 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -304,9 +304,27 @@ static const char *lu_arch(const void *ctx, struct connection *conn,
 }
 #endif
 
+static const char *lu_check_lu_allowed(const void *ctx, bool force,
+				       unsigned int to)
+{
+	return NULL;
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
 static const char *lu_start(const void *ctx, struct connection *conn,
 			    bool force, unsigned int to)
 {
+	const char *ret;
+
 	syslog(LOG_INFO, "live-update: start, force=%d, to=%u\n", force, to);
 
 	if (!lu_status || lu_status->conn != conn)
@@ -317,10 +335,27 @@ static const char *lu_start(const void *ctx, struct connection *conn,
 		return "Kernel not complete.";
 #endif
 
-	/* Will be replaced by real live-update later. */
+	/* Check for state to allow live update. */
+	ret = lu_check_lu_allowed(ctx, force, to);
+	if (ret) {
+		if (!strcmp(ret, "BUSY"))
+			return ret;
+		goto out;
+	}
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
 
-	return NULL;
+	return ret;
 }
 
 static int do_control_lu(void *ctx, struct connection *conn,
-- 
2.26.2


