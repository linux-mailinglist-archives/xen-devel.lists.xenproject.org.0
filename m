Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 126B31BD73C
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 10:25:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTi2H-0002UH-GP; Wed, 29 Apr 2020 08:25:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fvgr=6N=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jTi2F-0002UB-RJ
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 08:25:39 +0000
X-Inumbo-ID: 01264b7e-89f3-11ea-9887-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 01264b7e-89f3-11ea-9887-bc764e2007e4;
 Wed, 29 Apr 2020 08:25:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8CF7CAB3D;
 Wed, 29 Apr 2020 08:25:36 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2] tools/xenstore: don't store domU's mfn of ring page in
 xenstored
Date: Wed, 29 Apr 2020 10:25:34 +0200
Message-Id: <20200429082534.4143-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The XS_INTRODUCE command has two parameters: the mfn (or better: gfn)
of the domain's xenstore ring page and the event channel of the
domain for communicating with Xenstore.

The gfn is not really needed. It is stored in the per-domain struct
in xenstored and in case of another XS_INTRODUCE for the domain it
is tested to match the original value. If it doesn't match the
command is aborted via EINVAL.

Today there aren't multiple XS_INTRODUCE requests for the same domain
issued, so the mfn/gfn can just be ignored and multiple XS_INTRODUCE
commands can be rejected without testing the mfn/gfn.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
V2:
- remove mfn from struct domain (Julien Grall)
- replace mfn by gfn in comments (Julien Grall)
---
 tools/xenstore/xenstored_domain.c | 53 +++++++++++++++------------------------
 1 file changed, 20 insertions(+), 33 deletions(-)

diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 5858185211..1ca11e5e9e 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -55,10 +55,6 @@ struct domain
 	   repeated domain introductions. */
 	evtchn_port_t remote_port;
 
-	/* The mfn associated with the event channel, used only to validate
-	   repeated domain introductions. */
-	unsigned long mfn;
-
 	/* Domain path in store. */
 	char *path;
 
@@ -363,13 +359,12 @@ static void domain_conn_reset(struct domain *domain)
 	domain->interface->rsp_cons = domain->interface->rsp_prod = 0;
 }
 
-/* domid, mfn, evtchn, path */
+/* domid, gfn, evtchn, path */
 int do_introduce(struct connection *conn, struct buffered_data *in)
 {
 	struct domain *domain;
 	char *vec[3];
 	unsigned int domid;
-	unsigned long mfn;
 	evtchn_port_t port;
 	int rc;
 	struct xenstore_domain_interface *interface;
@@ -381,7 +376,7 @@ int do_introduce(struct connection *conn, struct buffered_data *in)
 		return EACCES;
 
 	domid = atoi(vec[0]);
-	mfn = atol(vec[1]);
+	/* Ignore the gfn, we don't need it. */
 	port = atoi(vec[2]);
 
 	/* Sanity check args. */
@@ -390,34 +385,26 @@ int do_introduce(struct connection *conn, struct buffered_data *in)
 
 	domain = find_domain_by_domid(domid);
 
-	if (domain == NULL) {
-		interface = map_interface(domid);
-		if (!interface)
-			return errno;
-		/* Hang domain off "in" until we're finished. */
-		domain = new_domain(in, domid, port);
-		if (!domain) {
-			rc = errno;
-			unmap_interface(interface);
-			return rc;
-		}
-		domain->interface = interface;
-		domain->mfn = mfn;
-
-		/* Now domain belongs to its connection. */
-		talloc_steal(domain->conn, domain);
-
-		fire_watches(NULL, in, "@introduceDomain", false);
-	} else if ((domain->mfn == mfn) && (domain->conn != conn)) {
-		/* Use XS_INTRODUCE for recreating the xenbus event-channel. */
-		if (domain->port)
-			xenevtchn_unbind(xce_handle, domain->port);
-		rc = xenevtchn_bind_interdomain(xce_handle, domid, port);
-		domain->port = (rc == -1) ? 0 : rc;
-		domain->remote_port = port;
-	} else
+	if (domain)
 		return EINVAL;
 
+	interface = map_interface(domid);
+	if (!interface)
+		return errno;
+	/* Hang domain off "in" until we're finished. */
+	domain = new_domain(in, domid, port);
+	if (!domain) {
+		rc = errno;
+		unmap_interface(interface);
+		return rc;
+	}
+	domain->interface = interface;
+
+	/* Now domain belongs to its connection. */
+	talloc_steal(domain->conn, domain);
+
+	fire_watches(NULL, in, "@introduceDomain", false);
+
 	domain_conn_reset(domain);
 
 	send_ack(conn, XS_INTRODUCE);
-- 
2.16.4


