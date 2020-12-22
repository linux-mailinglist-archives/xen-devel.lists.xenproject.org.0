Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A977E2DB193
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 17:36:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54562.95008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDJg-0007GU-Fq; Tue, 15 Dec 2020 16:36:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54562.95008; Tue, 15 Dec 2020 16:36:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDJg-0007E7-7N; Tue, 15 Dec 2020 16:36:48 +0000
Received: by outflank-mailman (input) for mailman id 54562;
 Tue, 15 Dec 2020 16:36:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2CwE=FT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kpDJe-00066M-Hz
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 16:36:46 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 98f00c5d-0b3c-4ea8-a28f-445388c7de8c;
 Tue, 15 Dec 2020 16:36:12 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 315FBB271;
 Tue, 15 Dec 2020 16:36:10 +0000 (UTC)
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
X-Inumbo-ID: 98f00c5d-0b3c-4ea8-a28f-445388c7de8c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608050170; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3OGXhmDpavRgcLL+iSFnJ3xYl7jjDOEuqGoMRL/Y0AQ=;
	b=gFVrZOXtO3pkUFa6HLadEJ50eh//1ChSYICzygJvi8f2Sw4H5IAMxKGZXR9Tv4oRCsaxLl
	Y6RuHXQOcRob14xQBSWUzgBD3Ur9qvr+57mV19fUEhP4ey1flqIGrHwpvF4WLJVxTIHEt4
	zX/HYtNgraWlUi0roWnKFvcm1uSFdcw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v10 12/25] tools/xenstore: allow live update only with no transaction active
Date: Tue, 15 Dec 2020 17:35:50 +0100
Message-Id: <20201215163603.21700-13-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201215163603.21700-1-jgross@suse.com>
References: <20201215163603.21700-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to simplify live update state dumping only allow live update
to happen when no transaction is active.

A timeout is used to detect guests which have a transaction active for
longer periods of time. In case such a guest is detected when trying
to do a live update it will be reported and the update will fail.

The admin can then either use a longer timeout, or use the force flag
to just ignore the transactions of such a guest, or kill the guest
before retrying.

Transactions that have been active for a shorter time than the timeout
will end in the live update starting to respond "BUSY" without
aborting the complete live update process. The xenstore-control
program will then just repeat the live update starting until a
different result is returned.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Paul Durrant <paul@xen.org>
Acked-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstore/xenstored_control.c     | 20 +++++++++++++++++++-
 tools/xenstore/xenstored_core.h        |  1 +
 tools/xenstore/xenstored_transaction.c |  5 +++++
 3 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index 940b717741..af64a9a2d4 100644
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
@@ -307,7 +308,24 @@ static const char *lu_arch(const void *ctx, struct connection *conn,
 static const char *lu_check_lu_allowed(const void *ctx, bool force,
 				       unsigned int to)
 {
-	return NULL;
+	char *ret = NULL;
+	struct connection *conn;
+	time_t now = time(NULL);
+	bool busy = false;
+
+	list_for_each_entry(conn, &connections, list) {
+		if (conn->ta_start_time - now >= to && !force) {
+			ret = talloc_asprintf(ctx, "%s\nDomain %u: %ld s",
+					      ret ? : "Domains with long running transactions:",
+					      conn->id,
+					      conn->ta_start_time - now);
+			if (!ret)
+				busy = true;
+		} else if (conn->ta_start_time)
+			busy = true;
+	}
+
+	return ret ? (const char *)ret : (busy ? "BUSY" : NULL);
 }
 
 static const char *lu_dump_state(const void *ctx, struct connection *conn)
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index 27826c125c..a009b182fd 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -93,6 +93,7 @@ struct connection
 	struct list_head transaction_list;
 	uint32_t next_transaction_id;
 	unsigned int transaction_started;
+	time_t ta_start_time;
 
 	/* The domain I'm associated with, if any. */
 	struct domain *domain;
diff --git a/tools/xenstore/xenstored_transaction.c b/tools/xenstore/xenstored_transaction.c
index 52355f4ed8..cd07fb0f21 100644
--- a/tools/xenstore/xenstored_transaction.c
+++ b/tools/xenstore/xenstored_transaction.c
@@ -473,6 +473,8 @@ int do_transaction_start(struct connection *conn, struct buffered_data *in)
 	list_add_tail(&trans->list, &conn->transaction_list);
 	talloc_steal(conn, trans);
 	talloc_set_destructor(trans, destroy_transaction);
+	if (!conn->transaction_started)
+		conn->ta_start_time = time(NULL);
 	conn->transaction_started++;
 	wrl_ntransactions++;
 
@@ -511,6 +513,8 @@ int do_transaction_end(struct connection *conn, struct buffered_data *in)
 	conn->transaction = NULL;
 	list_del(&trans->list);
 	conn->transaction_started--;
+	if (!conn->transaction_started)
+		conn->ta_start_time = 0;
 
 	/* Attach transaction to in for auto-cleanup */
 	talloc_steal(in, trans);
@@ -589,6 +593,7 @@ void conn_delete_all_transactions(struct connection *conn)
 	assert(conn->transaction == NULL);
 
 	conn->transaction_started = 0;
+	conn->ta_start_time = 0;
 }
 
 int check_transactions(struct hashtable *hash)
-- 
2.26.2


