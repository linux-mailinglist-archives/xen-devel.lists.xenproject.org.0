Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB33614E51
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 16:29:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.434849.687543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optCo-0002NZ-M6; Tue, 01 Nov 2022 15:29:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 434849.687543; Tue, 01 Nov 2022 15:29:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optCo-0002JW-I5; Tue, 01 Nov 2022 15:29:34 +0000
Received: by outflank-mailman (input) for mailman id 434849;
 Tue, 01 Nov 2022 15:29:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PfM8=3B=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1optCn-0007Bd-BZ
 for xen-devel@lists.xenproject.org; Tue, 01 Nov 2022 15:29:33 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fae2c300-59f9-11ed-8fd0-01056ac49cbb;
 Tue, 01 Nov 2022 16:29:31 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D4FF8336C7;
 Tue,  1 Nov 2022 15:29:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AD8681346F;
 Tue,  1 Nov 2022 15:29:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id nbMkKVo7YWPbYAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 01 Nov 2022 15:29:30 +0000
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
X-Inumbo-ID: fae2c300-59f9-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667316570; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=anDpkDCTkclPSUMBJP+Mdb2oOV35Mkg0KiisY71X+Fk=;
	b=MFWcpC6+nbBGxiQJabTdKQpyqv5tBenYSnNEdeSD2WFCL4wO3ERGddNQ7FSV6FA+HxACkq
	YPzH+jn7bvlLLTm7LPlFjJ2Is6WlMjh3TKFH4kE71KCXFW2kZlIlgaBhz2CQe6LLw/lU5o
	YFtHuf4AdYzy7I/+T9xSq45ZLZixcvw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 08/20] tools/xenstore: add hashlist for finding struct domain by domid
Date: Tue,  1 Nov 2022 16:28:30 +0100
Message-Id: <20221101152842.4257-9-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221101152842.4257-1-jgross@suse.com>
References: <20221101152842.4257-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today finding a struct domain by its domain id requires to scan the
list of domains until finding the correct domid.

Add a hashlist for being able to speed this up. This allows to remove
the linking of struct domain in a list. Note that the list of changed
domains per transaction is kept as a list, as there are no known use
cases with more than 4 domains being touched in a single transaction
(this would be a device handled by a driver domain and being assigned
to a HVM domain with device model in a stubdom, plus the control
domain).

Some simple performance tests comparing the scanning and hashlist have
shown that the hashlist will win as soon as more than 6 entries need
to be scanned.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_domain.c | 112 +++++++++++++++++-------------
 1 file changed, 65 insertions(+), 47 deletions(-)

diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 1516df71d8..f6797e53c5 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -48,8 +48,6 @@ static struct node_perms dom_introduce_perms;
 
 struct domain
 {
-	struct list_head list;
-
 	/* The id of this domain */
 	unsigned int domid;
 
@@ -96,7 +94,7 @@ struct domain
 	bool wrl_delay_logged;
 };
 
-static LIST_HEAD(domains);
+static struct hashtable *domhash;
 
 static bool check_indexes(XENSTORE_RING_IDX cons, XENSTORE_RING_IDX prod)
 {
@@ -309,7 +307,7 @@ static int destroy_domain(void *_domain)
 
 	domain_tree_remove(domain);
 
-	list_del(&domain->list);
+	hashtable_remove(domhash, &domain->domid);
 
 	if (!domain->introduced)
 		return 0;
@@ -341,49 +339,56 @@ static bool get_domain_info(unsigned int domid, xc_dominfo_t *dominfo)
 	       dominfo->domid == domid;
 }
 
-void check_domains(void)
+static int check_domain(void *k, void *v, void *arg)
 {
 	xc_dominfo_t dominfo;
-	struct domain *domain;
 	struct connection *conn;
-	int notify = 0;
 	bool dom_valid;
+	struct domain *domain = v;
+	bool *notify = arg;
 
- again:
-	list_for_each_entry(domain, &domains, list) {
-		dom_valid = get_domain_info(domain->domid, &dominfo);
-		if (!domain->introduced) {
-			if (!dom_valid) {
-				talloc_free(domain);
-				goto again;
-			}
-			continue;
-		}
-		if (dom_valid) {
-			if ((dominfo.crashed || dominfo.shutdown)
-			    && !domain->shutdown) {
-				domain->shutdown = true;
-				notify = 1;
-				/*
-				 * Avoid triggering watch events when the
-				 * domain's nodes are being deleted.
-				 */
-				if (domain->conn)
-					conn_delete_all_watches(domain->conn);
-			}
-			if (!dominfo.dying)
-				continue;
+	dom_valid = get_domain_info(domain->domid, &dominfo);
+	if (!domain->introduced) {
+		if (!dom_valid) {
+			talloc_free(domain);
+			return 1;
 		}
-		if (domain->conn) {
-			/* domain is a talloc child of domain->conn. */
-			conn = domain->conn;
-			domain->conn = NULL;
-			talloc_unlink(talloc_autofree_context(), conn);
-			notify = 0; /* destroy_domain() fires the watch */
-			goto again;
+		return 0;
+	}
+	if (dom_valid) {
+		if ((dominfo.crashed || dominfo.shutdown)
+		    && !domain->shutdown) {
+			domain->shutdown = true;
+			*notify = true;
+			/*
+			 * Avoid triggering watch events when the domain's
+			 * nodes are being deleted.
+			 */
+			if (domain->conn)
+				conn_delete_all_watches(domain->conn);
 		}
+		if (!dominfo.dying)
+			return 0;
+	}
+	if (domain->conn) {
+		/* domain is a talloc child of domain->conn. */
+		conn = domain->conn;
+		domain->conn = NULL;
+		talloc_unlink(talloc_autofree_context(), conn);
+		*notify = false; /* destroy_domain() fires the watch */
+		return 1;
 	}
 
+	return 0;
+}
+
+void check_domains(void)
+{
+	bool notify = false;
+
+	while (hashtable_iterate(domhash, check_domain, &notify))
+		;
+
 	if (notify)
 		fire_watches(NULL, NULL, "@releaseDomain", NULL, true, NULL);
 }
@@ -421,13 +426,7 @@ static char *talloc_domain_path(const void *context, unsigned int domid)
 
 static struct domain *find_domain_struct(unsigned int domid)
 {
-	struct domain *i;
-
-	list_for_each_entry(i, &domains, list) {
-		if (i->domid == domid)
-			return i;
-	}
-	return NULL;
+	return hashtable_search(domhash, &domid);
 }
 
 int domain_get_quota(const void *ctx, struct connection *conn,
@@ -476,9 +475,13 @@ static struct domain *alloc_domain(const void *context, unsigned int domid)
 	domain->generation = generation;
 	domain->introduced = false;
 
-	talloc_set_destructor(domain, destroy_domain);
+	if (!hashtable_insert(domhash, &domain->domid, domain)) {
+		talloc_free(domain);
+		errno = ENOMEM;
+		return NULL;
+	}
 
-	list_add(&domain->list, &domains);
+	talloc_set_destructor(domain, destroy_domain);
 
 	return domain;
 }
@@ -909,10 +912,25 @@ void dom0_init(void)
 	xenevtchn_notify(xce_handle, dom0->port);
 }
 
+static unsigned int domhash_fn(void *k)
+{
+	return *(unsigned int *)k;
+}
+
+static int domeq_fn(void *key1, void *key2)
+{
+	return *(unsigned int *)key1 == *(unsigned int *)key2;
+}
+
 void domain_init(int evtfd)
 {
 	int rc;
 
+	/* Start with a random rather low domain count for the hashtable. */
+	domhash = create_hashtable(8, domhash_fn, domeq_fn, 0);
+	if (!domhash)
+		barf_perror("Failed to allocate domain hashtable");
+
 	xc_handle = talloc(talloc_autofree_context(), xc_interface*);
 	if (!xc_handle)
 		barf_perror("Failed to allocate domain handle");
-- 
2.35.3


