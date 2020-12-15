Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 111C22DB189
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 17:36:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54536.94905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDJM-0006XZ-HC; Tue, 15 Dec 2020 16:36:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54536.94905; Tue, 15 Dec 2020 16:36:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDJM-0006Vp-2a; Tue, 15 Dec 2020 16:36:28 +0000
Received: by outflank-mailman (input) for mailman id 54536;
 Tue, 15 Dec 2020 16:36:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2CwE=FT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kpDJK-00066M-Hc
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 16:36:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2dfe56c1-dc56-4768-a56d-03b25f5899e1;
 Tue, 15 Dec 2020 16:36:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3D0F7ADA2;
 Tue, 15 Dec 2020 16:36:08 +0000 (UTC)
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
X-Inumbo-ID: 2dfe56c1-dc56-4768-a56d-03b25f5899e1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608050168; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fvbcf3En7lYu//cGgGBUZK52QcUFkax9zugp5BLC0iQ=;
	b=lD+KAQ4aqGuvG9gAovIJkzk0naw5LkJX24Ju800aPr2HPBSwYrcWlZH3GFCGvQB4RCc+pu
	rYbgGp8SfkUyvIi6eyuVNWKGeXvplGhfPw1vojDRFw4wForo7DaJM2QUy0/+uOgdgPRdlS
	tz0Se5v7kqwJjPTpIVqZQS9m0p7gJgM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v10 03/25] tools/xenstore: remove unused cruft from xenstored_domain.c
Date: Tue, 15 Dec 2020 17:35:41 +0100
Message-Id: <20201215163603.21700-4-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201215163603.21700-1-jgross@suse.com>
References: <20201215163603.21700-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

domain->remote_port and restore_existing_connections() are useless and
can be removed.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
V7:
- new patch
---
 tools/xenstore/xenstored_core.c   |  3 ---
 tools/xenstore/xenstored_domain.c | 11 -----------
 tools/xenstore/xenstored_domain.h |  3 ---
 3 files changed, 17 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index ab1c7835b8..50986f8b29 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -2087,9 +2087,6 @@ int main(int argc, char *argv[])
 	if (!no_domain_init)
 		domain_init();
 
-	/* Restore existing connections. */
-	restore_existing_connections();
-
 	if (outputpid) {
 		printf("%ld\n", (long)getpid());
 		fflush(stdout);
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 7d348d57f3..ed8e83b06b 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -54,10 +54,6 @@ struct domain
 	/* Event channel port */
 	evtchn_port_t port;
 
-	/* The remote end of the event channel, used only to validate
-	   repeated domain introductions. */
-	evtchn_port_t remote_port;
-
 	/* Domain path in store. */
 	char *path;
 
@@ -382,7 +378,6 @@ static int new_domain(struct domain *domain, int port)
 	domain->conn->domain = domain;
 	domain->conn->id = domain->domid;
 
-	domain->remote_port = port;
 	domain->nbentry = 0;
 	domain->nbwatch = 0;
 
@@ -470,7 +465,6 @@ int do_introduce(struct connection *conn, struct buffered_data *in)
 			xenevtchn_unbind(xce_handle, domain->port);
 		rc = xenevtchn_bind_interdomain(xce_handle, domid, port);
 		domain->port = (rc == -1) ? 0 : rc;
-		domain->remote_port = port;
 	}
 
 	domain_conn_reset(domain);
@@ -636,11 +630,6 @@ const char *get_implicit_path(const struct connection *conn)
 	return conn->domain->path;
 }
 
-/* Restore existing connections. */
-void restore_existing_connections(void)
-{
-}
-
 static int set_dom_perms_default(struct node_perms *perms)
 {
 	perms->num = 1;
diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored_domain.h
index 5e00087206..66e0a12654 100644
--- a/tools/xenstore/xenstored_domain.h
+++ b/tools/xenstore/xenstored_domain.h
@@ -47,9 +47,6 @@ void domain_init(void);
 /* Returns the implicit path of a connection (only domains have this) */
 const char *get_implicit_path(const struct connection *conn);
 
-/* Read existing connection information from store. */
-void restore_existing_connections(void);
-
 /* Can connection attached to domain read/write. */
 bool domain_can_read(struct connection *conn);
 bool domain_can_write(struct connection *conn);
-- 
2.26.2


