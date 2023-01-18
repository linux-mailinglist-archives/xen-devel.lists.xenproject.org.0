Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF85671846
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 10:55:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480358.744743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI5A3-0006PE-Dc; Wed, 18 Jan 2023 09:55:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480358.744743; Wed, 18 Jan 2023 09:55:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI5A3-0006Iv-3u; Wed, 18 Jan 2023 09:55:15 +0000
Received: by outflank-mailman (input) for mailman id 480358;
 Wed, 18 Jan 2023 09:55:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ov7m=5P=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pI56E-0001BV-8S
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 09:51:18 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71b3e24a-9715-11ed-b8d1-410ff93cb8f0;
 Wed, 18 Jan 2023 10:49:47 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 726DE20D6A;
 Wed, 18 Jan 2023 09:51:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4413B139D2;
 Wed, 18 Jan 2023 09:51:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ol1MDxPBx2O9QwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 18 Jan 2023 09:51:15 +0000
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
X-Inumbo-ID: 71b3e24a-9715-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1674035475; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2l4RL275hmrR3HRBC+1HNH4pI7STyKqFIjdegf4upCU=;
	b=C9tiOcR4l7QScl6Zgbbm6K9Qn84mvRidpF+HZt7+UhiQg61ccnkmL0XY5gLSuCbsUo34sy
	dgn5oGqBVaMgaODtHF41uMmxiYHtA0zG+0cAJjfIV73uUvf5Z+Y5+gRP3E+Cj8j1ua6Der
	0HykYByn0V50ZjromoUS09vK8g7H7+s=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v4 10/17] tools/xenstore: make domain_is_unprivileged() an inline function
Date: Wed, 18 Jan 2023 10:50:09 +0100
Message-Id: <20230118095016.13091-11-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230118095016.13091-1-jgross@suse.com>
References: <20230118095016.13091-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

clang 14 is complaining about a NULL dereference for constructs like:

  domain_is_unprivileged(conn) ? conn->in : NULL

as it can't know that domain_is_unprivileged(conn) will return false
if conn is NULL.

Fix that by making domain_is_unprivileged() an inline function (and
related to that domid_is_unprivileged(), too).

In order not having to make struct domain public, use conn->id instead
of conn->domain->domid for the test.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstore/xenstored_core.h   | 10 ++++++++++
 tools/xenstore/xenstored_domain.c | 11 -----------
 tools/xenstore/xenstored_domain.h |  2 --
 3 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index 62d8ee96bd..6548200d8e 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -318,6 +318,16 @@ void unmap_xenbus(void *interface);
 
 static inline int xenbus_master_domid(void) { return dom0_domid; }
 
+static inline bool domid_is_unprivileged(unsigned int domid)
+{
+	return domid != dom0_domid && domid != priv_domid;
+}
+
+static inline bool domain_is_unprivileged(const struct connection *conn)
+{
+	return conn && domid_is_unprivileged(conn->id);
+}
+
 /* Return the event channel used by xenbus. */
 evtchn_port_t xenbus_evtchn(void);
 
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index a703c0ef47..10880a32d9 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -408,17 +408,6 @@ void handle_event(void)
 		barf_perror("Failed to write to event fd");
 }
 
-static bool domid_is_unprivileged(unsigned int domid)
-{
-	return domid != dom0_domid && domid != priv_domid;
-}
-
-bool domain_is_unprivileged(struct connection *conn)
-{
-	return conn && conn->domain &&
-	       domid_is_unprivileged(conn->domain->domid);
-}
-
 static char *talloc_domain_path(const void *context, unsigned int domid)
 {
 	return talloc_asprintf(context, "/local/domain/%u", domid);
diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored_domain.h
index 1e402f2609..22996e2576 100644
--- a/tools/xenstore/xenstored_domain.h
+++ b/tools/xenstore/xenstored_domain.h
@@ -59,8 +59,6 @@ void ignore_connection(struct connection *conn, unsigned int err);
 /* Returns the implicit path of a connection (only domains have this) */
 const char *get_implicit_path(const struct connection *conn);
 
-bool domain_is_unprivileged(struct connection *conn);
-
 /* Remove node permissions for no longer existing domains. */
 int domain_adjust_node_perms(struct node *node);
 int domain_alloc_permrefs(struct node_perms *perms);
-- 
2.35.3


