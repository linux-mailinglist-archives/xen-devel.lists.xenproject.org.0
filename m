Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A76EF2F7479
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 09:40:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67813.121255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0KeS-0003Q4-Ky; Fri, 15 Jan 2021 08:40:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67813.121255; Fri, 15 Jan 2021 08:40:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0KeS-0003PU-HO; Fri, 15 Jan 2021 08:40:12 +0000
Received: by outflank-mailman (input) for mailman id 67813;
 Fri, 15 Jan 2021 08:40:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v6X5=GS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l0KVo-0008HA-Op
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 08:31:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a413e613-d01e-4c1d-ac5b-0033c2abfbf7;
 Fri, 15 Jan 2021 08:30:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5C5FCB95B;
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
X-Inumbo-ID: a413e613-d01e-4c1d-ac5b-0033c2abfbf7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610699408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/rmGIUwb7rQQbsNmDH/AGkcUN8zjvijT5247nfpjU8Q=;
	b=sDZnKsN+Oo+HwEcF4lXkmwKBoVYX7m6vN167hC11zp7vh6kT8mNLfztmbuhkyVbj5hjKIw
	NidBM/F8vRZfMNiiU+8eTqfAcCFxkDzyOc34PIaD7uTKcRc9dD+Ss6cus2RRWo+yJXjxqZ
	C6N3a3FAJE8vuqoC6V5aKAz7nFrQYH0=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v12 19/27] tools/xenstore: split off domain introduction from do_introduce()
Date: Fri, 15 Jan 2021 09:29:52 +0100
Message-Id: <20210115083000.14186-20-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210115083000.14186-1-jgross@suse.com>
References: <20210115083000.14186-1-jgross@suse.com>
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


