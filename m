Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DBE2F64D8
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 16:39:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67227.119916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04i9-0003pF-6m; Thu, 14 Jan 2021 15:38:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67227.119916; Thu, 14 Jan 2021 15:38:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04i8-0003ni-VX; Thu, 14 Jan 2021 15:38:56 +0000
Received: by outflank-mailman (input) for mailman id 67227;
 Thu, 14 Jan 2021 15:38:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P5GR=GR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l04i6-0002Sh-Jq
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 15:38:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3d40e398-4b17-420e-b93a-cea31e15e515;
 Thu, 14 Jan 2021 15:38:11 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 84ED7AF1A;
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
X-Inumbo-ID: 3d40e398-4b17-420e-b93a-cea31e15e515
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610638689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RJqjXKMVSVRRyIZf/Us/2MfnPhaP116dJaVYQa881i4=;
	b=VfQuPz2wUh86X9fnbi67nKy0VwJOO9nLIo2i2dBDfvHW+qadQCQHRnmvgErs8ktnhxD029
	wduGgnH9t48vumBOMTg31PItB7uspnjVvXCjUM6OaXf1NH/BEUuWHI/yDk4kAS8CTdFrzL
	iMtt8ORof9teWccxaPHS3Qo05lBLRM0=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v11 14/27] tools/xenstore: allow live update only with no transaction active
Date: Thu, 14 Jan 2021 16:37:50 +0100
Message-Id: <20210114153803.2591-15-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114153803.2591-1-jgross@suse.com>
References: <20210114153803.2591-1-jgross@suse.com>
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

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V11:
- reworked timeout logic to be handled in daemon (Edwin Torok)
---
 tools/xenstore/xenstored_control.c     | 29 ++++++++++++++++++++++++--
 tools/xenstore/xenstored_core.h        |  1 +
 tools/xenstore/xenstored_transaction.c |  5 +++++
 3 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index 5193c55781..0c3dc14fb7 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -312,12 +312,37 @@ static const char *lu_arch(const void *ctx, struct connection *conn,
 
 static bool lu_check_lu_allowed(void)
 {
-	return true;
+	struct connection *conn;
+	time_t now = time(NULL);
+	unsigned int ta_total = 0, ta_long = 0;
+
+	list_for_each_entry(conn, &connections, list) {
+		if (conn->ta_start_time) {
+			ta_total++;
+			if (conn->ta_start_time - now >= lu_status->timeout)
+				ta_long++;
+		}
+	}
+
+	return ta_total ? (lu_status->force && ta_long == ta_total) : true;
 }
 
 static const char *lu_reject_reason(const void *ctx)
 {
-	return "BUSY";
+	char *ret = NULL;
+	struct connection *conn;
+	time_t now = time(NULL);
+
+	list_for_each_entry(conn, &connections, list) {
+		if (conn->ta_start_time - now >= lu_status->timeout) {
+			ret = talloc_asprintf(ctx, "%s\nDomain %u: %ld s",
+					      ret ? : "Domains with long running transactions:",
+					      conn->id,
+					      conn->ta_start_time - now);
+		}
+	}
+
+	return ret ? (const char *)ret : "Overlapping transactions";
 }
 
 static const char *lu_dump_state(const void *ctx, struct connection *conn)
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index d5cdf17160..db70f61f0d 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -107,6 +107,7 @@ struct connection
 	struct list_head transaction_list;
 	uint32_t next_transaction_id;
 	unsigned int transaction_started;
+	time_t ta_start_time;
 
 	/* List of delayed requests. */
 	struct list_head delayed;
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


