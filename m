Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D3E64B930
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 17:05:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460763.718776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p57mD-0005k1-Gv; Tue, 13 Dec 2022 16:05:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460763.718776; Tue, 13 Dec 2022 16:05:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p57mD-0005cr-0o; Tue, 13 Dec 2022 16:05:05 +0000
Received: by outflank-mailman (input) for mailman id 460763;
 Tue, 13 Dec 2022 16:05:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Djt=4L=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1p57jF-0001dt-I4
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 16:02:01 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a4a002e-7aff-11ed-91b6-6bf2151ebd3b;
 Tue, 13 Dec 2022 17:02:00 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 78BAD22A30;
 Tue, 13 Dec 2022 16:02:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4B466138EE;
 Tue, 13 Dec 2022 16:02:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SJ8yEfihmGMPKgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 13 Dec 2022 16:02:00 +0000
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
X-Inumbo-ID: 7a4a002e-7aff-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1670947320; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rd5kqjg8Itv+7WroyptP0xdbZofMNnnXVQRH2ymCEfM=;
	b=Jmj3sJeVLWVsnC89d6KmWFd/Vbx7iMv7tEjxtIjdVlQMPir7YAzzJQkVRGCdenNiVdxat7
	brDyHtW27NPJZyPB6btr5xu8ThyO5kTbvwNygKCMg749mkY6QlUZRN5Dtn9tbZqdaTFqKc
	JKNd3G1rODkLctwVBBA757OkO2RgBoo=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v2 13/19] tools/xenstore: make domain_is_unprivileged() an inline function
Date: Tue, 13 Dec 2022 17:00:39 +0100
Message-Id: <20221213160045.28170-14-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221213160045.28170-1-jgross@suse.com>
References: <20221213160045.28170-1-jgross@suse.com>
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
index 37006d508d..3c4e27d0dd 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -297,6 +297,16 @@ void unmap_xenbus(void *interface);
 
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
index 1e9d7545b7..a3ecdb382f 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -406,17 +406,6 @@ void handle_event(void)
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


