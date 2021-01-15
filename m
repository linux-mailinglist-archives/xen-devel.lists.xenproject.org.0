Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BD92F7457
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 09:30:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67718.121051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0KV0-00006g-1U; Fri, 15 Jan 2021 08:30:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67718.121051; Fri, 15 Jan 2021 08:30:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0KUz-00005U-SK; Fri, 15 Jan 2021 08:30:25 +0000
Received: by outflank-mailman (input) for mailman id 67718;
 Fri, 15 Jan 2021 08:30:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v6X5=GS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l0KUy-0008Gh-FD
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 08:30:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6d7d75af-e952-4608-b1ca-9ceed8959f2f;
 Fri, 15 Jan 2021 08:30:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0A20AB957;
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
X-Inumbo-ID: 6d7d75af-e952-4608-b1ca-9ceed8959f2f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610699407; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nVUYv9vvkBAlWYhUlIHvlIvMtiQIrIzQ7in9vX0egqc=;
	b=V0YleC+KGw2uoheouJeItfkvOavv22BajDA0QlTYrGh2C9vMTOPerDZYlK/+C2jPajgkUi
	/Kl96/h3w6wux+1RmiP+5OVipaDjXbRHWedkt1+nge3cA3QrDFzUCTBOdNXe4yRvABXjKP
	waX0rl/Ra57pHZTpuYDIuxV063MJ728=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v12 12/27] tools/xenstore: add support for delaying execution of a xenstore request
Date: Fri, 15 Jan 2021 09:29:45 +0100
Message-Id: <20210115083000.14186-13-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210115083000.14186-1-jgross@suse.com>
References: <20210115083000.14186-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today a Xenstore request is processed as soon as it is seen by
xenstored. Add the framework for being able to delay processing of a
request if the right conditions aren't met.

Any delayed requests are executed at the end of the main processing
loop in xenstored. They can either delay themselves again or just do
their job. In order to enable the possibility of a timeout, the main
loop will be paused for max one second if any requests are delayed.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V11:
- new patch

V12:
- fix mangled patch
---
 tools/xenstore/xenstored_core.c | 62 ++++++++++++++++++++++++++++++++-
 tools/xenstore/xenstored_core.h | 21 +++++++++++
 2 files changed, 82 insertions(+), 1 deletion(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 0dddf24327..6f556d49ef 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -69,6 +69,7 @@ static int xce_pollfd_idx = -1;
 static struct pollfd *fds;
 static unsigned int current_array_size;
 static unsigned int nr_fds;
+static unsigned int delayed_requests;
 
 static int sock = -1;
 
@@ -255,6 +256,53 @@ static bool write_messages(struct connection *conn)
 	return true;
 }
 
+static int undelay_request(void *_req)
+{
+	struct delayed_request *req = _req;
+
+	list_del(&req->list);
+	delayed_requests--;
+
+	return 0;
+}
+
+static void call_delayed(struct connection *conn, struct delayed_request *req)
+{
+	assert(conn->in == NULL);
+	conn->in = req->in;
+
+	if (req->func(req)) {
+		undelay_request(req);
+		talloc_set_destructor(req, NULL);
+	}
+
+	conn->in = NULL;
+}
+
+int delay_request(struct connection *conn, struct buffered_data *in,
+		  bool (*func)(struct delayed_request *), void *data)
+{
+	struct delayed_request *req;
+
+	req = talloc(in, struct delayed_request);
+	if (!req)
+		return ENOMEM;
+
+	/* For the case of connection being closed. */
+	talloc_set_destructor(req, undelay_request);
+
+	req->in = in;
+	req->func = func;
+	req->data = data;
+
+	delayed_requests++;
+	list_add(&req->list, &conn->delayed);
+
+	conn->in = NULL;
+
+	return 0;
+}
+
 static int destroy_conn(void *_conn)
 {
 	struct connection *conn = _conn;
@@ -321,7 +369,8 @@ static void initialize_fds(int *p_sock_pollfd_idx, int *ptimeout)
 		memset(fds, 0, sizeof(struct pollfd) * current_array_size);
 	nr_fds = 0;
 
-	*ptimeout = -1;
+	/* In case of delayed requests pause for max 1 second. */
+	*ptimeout = delayed_requests ? 1000 : -1;
 
 	if (sock != -1)
 		*p_sock_pollfd_idx = set_fd(sock, POLLIN|POLLPRI);
@@ -1524,6 +1573,7 @@ struct connection *new_connection(connwritefn_t *write, connreadfn_t *read)
 	INIT_LIST_HEAD(&new->out_list);
 	INIT_LIST_HEAD(&new->watches);
 	INIT_LIST_HEAD(&new->transaction_list);
+	INIT_LIST_HEAD(&new->delayed);
 
 	list_add_tail(&new->list, &connections);
 	talloc_set_destructor(new, destroy_conn);
@@ -2215,6 +2265,16 @@ int main(int argc, char *argv[])
 			}
 		}
 
+		if (delayed_requests) {
+			list_for_each_entry(conn, &connections, list) {
+				struct delayed_request *req, *tmp;
+
+				list_for_each_entry_safe(req, tmp,
+							 &conn->delayed, list)
+					call_delayed(conn, req);
+			}
+		}
+
 		initialize_fds(&sock_pollfd_idx, &timeout);
 	}
 }
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index 27826c125c..d5cdf17160 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -61,6 +61,20 @@ struct buffered_data
 	char default_buffer[DEFAULT_BUFFER_SIZE];
 };
 
+struct delayed_request {
+	/* Next delayed request. */
+	struct list_head list;
+
+	/* The delayed request. */
+	struct buffered_data *in;
+
+	/* Function to call. */
+	bool (*func)(struct delayed_request *req);
+
+	/* Further data. */
+	void *data;
+};
+
 struct connection;
 typedef int connwritefn_t(struct connection *, const void *, unsigned int);
 typedef int connreadfn_t(struct connection *, void *, unsigned int);
@@ -94,6 +108,9 @@ struct connection
 	uint32_t next_transaction_id;
 	unsigned int transaction_started;
 
+	/* List of delayed requests. */
+	struct list_head delayed;
+
 	/* The domain I'm associated with, if any. */
 	struct domain *domain;
 
@@ -177,6 +194,10 @@ bool is_valid_nodename(const char *node);
 /* Get name of parent node. */
 char *get_parent(const void *ctx, const char *node);
 
+/* Delay a request. */
+int delay_request(struct connection *conn, struct buffered_data *in,
+		  bool (*func)(struct delayed_request *), void *data);
+
 /* Tracing infrastructure. */
 void trace_create(const void *data, const char *type);
 void trace_destroy(const void *data, const char *type);
-- 
2.26.2


