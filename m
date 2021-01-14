Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 032C52F64D3
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 16:38:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67217.119856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04hy-0003Qi-94; Thu, 14 Jan 2021 15:38:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67217.119856; Thu, 14 Jan 2021 15:38:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04hy-0003Pm-38; Thu, 14 Jan 2021 15:38:46 +0000
Received: by outflank-mailman (input) for mailman id 67217;
 Thu, 14 Jan 2021 15:38:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P5GR=GR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l04hv-0002SV-NG
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 15:38:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 947487b8-c55a-4ed2-9448-3b49d6122461;
 Thu, 14 Jan 2021 15:38:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9D113AF27;
 Thu, 14 Jan 2021 15:38:10 +0000 (UTC)
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
X-Inumbo-ID: 947487b8-c55a-4ed2-9448-3b49d6122461
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610638690; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/rmGIUwb7rQQbsNmDH/AGkcUN8zjvijT5247nfpjU8Q=;
	b=H0QbV+fnQtY1tXh/tkxp0IaW3qf8SawL0/CYd7YwKAqJs2kWny9/osXFHsS9T8Gwj6d5Mt
	kf+09JaqUm255xcE6/qx+qxf5x2DV1F0SUWyyqUfHVpidZR+f17GdQsmbvIhKH5QGgblkO
	gnRTNS49OZnJveaYHYULzJSjgezuhRI=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v11 19/27] tools/xenstore: split off domain introduction from do_introduce()
Date: Thu, 14 Jan 2021 16:37:55 +0100
Message-Id: <20210114153803.2591-20-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114153803.2591-1-jgross@suse.com>
References: <20210114153803.2591-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For live update the functionality to introduce a new domain similar to
the XS_INTRODUCE command is needed, so split that functionality off
into a dedicated function introduce_domain().

Switch initial dom0 initialization to use this function, too.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
V8:
- new patch
---
 tools/xenstore/xenstored_domain.c | 95 ++++++++++++++++++-------------
 1 file changed, 55 insertions(+), 40 deletions(-)

diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 38d250fbed..71b078caf3 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -326,7 +326,7 @@ static struct domain *find_domain_struct(unsigned int domid)
 	return NULL;
 }
 
-static struct domain *alloc_domain(void *context, unsigned int domid)
+static struct domain *alloc_domain(const void *context, unsigned int domid)
 {
 	struct domain *domain;
 
@@ -347,6 +347,14 @@ static struct domain *alloc_domain(void *context, unsigned int domid)
 	return domain;
 }
 
+static struct domain *find_or_alloc_domain(const void *ctx, unsigned int domid)
+{
+	struct domain *domain;
+
+	domain = find_domain_struct(domid);
+	return domain ? : alloc_domain(ctx, domid);
+}
+
 static int new_domain(struct domain *domain, int port)
 {
 	int rc;
@@ -413,52 +421,41 @@ static void domain_conn_reset(struct domain *domain)
 	domain->interface->rsp_cons = domain->interface->rsp_prod = 0;
 }
 
-/* domid, gfn, evtchn, path */
-int do_introduce(struct connection *conn, struct buffered_data *in)
+static struct domain *introduce_domain(const void *ctx,
+				       unsigned int domid,
+				       evtchn_port_t port)
 {
 	struct domain *domain;
-	char *vec[3];
-	unsigned int domid;
-	evtchn_port_t port;
 	int rc;
 	struct xenstore_domain_interface *interface;
+	bool is_master_domain = (domid == xenbus_master_domid());
 
-	if (get_strings(in, vec, ARRAY_SIZE(vec)) < ARRAY_SIZE(vec))
-		return EINVAL;
-
-	domid = atoi(vec[0]);
-	/* Ignore the gfn, we don't need it. */
-	port = atoi(vec[2]);
-
-	/* Sanity check args. */
-	if (port <= 0)
-		return EINVAL;
-
-	domain = find_domain_struct(domid);
-
-	if (domain == NULL) {
-		/* Hang domain off "in" until we're finished. */
-		domain = alloc_domain(in, domid);
-		if (domain == NULL)
-			return ENOMEM;
-	}
+	domain = find_or_alloc_domain(ctx, domid);
+	if (!domain)
+		return NULL;
 
 	if (!domain->introduced) {
-		interface = map_interface(domid);
+		interface = is_master_domain ? xenbus_map()
+					     : map_interface(domid);
 		if (!interface)
-			return errno;
-		/* Hang domain off "in" until we're finished. */
+			return NULL;
 		if (new_domain(domain, port)) {
 			rc = errno;
-			unmap_interface(interface);
-			return rc;
+			if (is_master_domain)
+				unmap_xenbus(interface);
+			else
+				unmap_interface(interface);
+			errno = rc;
+			return NULL;
 		}
 		domain->interface = interface;
 
 		/* Now domain belongs to its connection. */
 		talloc_steal(domain->conn, domain);
 
-		fire_watches(NULL, in, "@introduceDomain", NULL, false, NULL);
+		if (!is_master_domain)
+			fire_watches(NULL, ctx, "@introduceDomain", NULL,
+				     false, NULL);
 	} else {
 		/* Use XS_INTRODUCE for recreating the xenbus event-channel. */
 		if (domain->port)
@@ -467,6 +464,32 @@ int do_introduce(struct connection *conn, struct buffered_data *in)
 		domain->port = (rc == -1) ? 0 : rc;
 	}
 
+	return domain;
+}
+
+/* domid, gfn, evtchn, path */
+int do_introduce(struct connection *conn, struct buffered_data *in)
+{
+	struct domain *domain;
+	char *vec[3];
+	unsigned int domid;
+	evtchn_port_t port;
+
+	if (get_strings(in, vec, ARRAY_SIZE(vec)) < ARRAY_SIZE(vec))
+		return EINVAL;
+
+	domid = atoi(vec[0]);
+	/* Ignore the gfn, we don't need it. */
+	port = atoi(vec[2]);
+
+	/* Sanity check args. */
+	if (port <= 0)
+		return EINVAL;
+
+	domain = introduce_domain(in, domid, port);
+	if (!domain)
+		return errno;
+
 	domain_conn_reset(domain);
 
 	send_ack(conn, XS_INTRODUCE);
@@ -692,17 +715,9 @@ static int dom0_init(void)
 	if (port == -1)
 		return -1;
 
-	dom0 = alloc_domain(NULL, xenbus_master_domid());
+	dom0 = introduce_domain(NULL, xenbus_master_domid(), port);
 	if (!dom0)
 		return -1;
-	if (new_domain(dom0, port))
-		return -1;
-
-	dom0->interface = xenbus_map();
-	if (dom0->interface == NULL)
-		return -1;
-
-	talloc_steal(dom0->conn, dom0); 
 
 	xenevtchn_notify(xce_handle, dom0->port);
 
-- 
2.26.2


