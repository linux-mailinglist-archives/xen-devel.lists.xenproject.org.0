Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB287DDEBC
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 10:52:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626324.976511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7tP-0004ph-MZ; Wed, 01 Nov 2023 09:52:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626324.976511; Wed, 01 Nov 2023 09:52:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7tP-0004nb-JT; Wed, 01 Nov 2023 09:52:07 +0000
Received: by outflank-mailman (input) for mailman id 626324;
 Wed, 01 Nov 2023 09:52:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFMy=GO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qy7dN-0005sN-4j
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 09:35:33 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fff1a2fc-7899-11ee-9b0e-b553b5be7939;
 Wed, 01 Nov 2023 10:35:31 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5C6871F74A;
 Wed,  1 Nov 2023 09:35:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2E60313460;
 Wed,  1 Nov 2023 09:35:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id u+HeCeMbQmWACQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 01 Nov 2023 09:35:31 +0000
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
X-Inumbo-ID: fff1a2fc-7899-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698831331; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7ZIjSKw8myBsIFjSSoI4w5XeJBIQplDz3TdYVJIan38=;
	b=odwvP5Nmf8Gbt17WQoUgIELGUWVXw5tQu0g3JtB/nfDR7oN+SDGeRVyUzzx73iGnNKA1sJ
	yqhWvUCMVaHvDeyzpVHI0TXsAMhrCNkanQnsKU/Da4CFgbfLpxqUZ6q1UQ+gAhb2LISiId
	J1UMjBJ2Vhjwc4dV6Y3PJE9uEVgVF4M=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 22/29] tools/xenstored:
Date: Wed,  1 Nov 2023 10:33:18 +0100
Message-Id: <20231101093325.30302-23-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231101093325.30302-1-jgross@suse.com>
References: <20231101093325.30302-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When [un]mapping the ring page of a Xenstore client, different actions
are required for "normal" guests and dom0. Today this distinction is
made at call site.

Move this distinction into [un]map_interface() instead, avoiding code
duplication and preparing special handling for [un]mapping the stub
domain's ring page.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstored/domain.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index 6ef136e01f..58b0942043 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -497,14 +497,20 @@ static const struct interface_funcs domain_funcs = {
 
 static void *map_interface(domid_t domid)
 {
+	if (domid == xenbus_master_domid())
+		return xenbus_map();
+
 	return xengnttab_map_grant_ref(*xgt_handle, domid,
 				       GNTTAB_RESERVED_XENSTORE,
 				       PROT_READ|PROT_WRITE);
 }
 
-static void unmap_interface(void *interface)
+static void unmap_interface(domid_t domid, void *interface)
 {
-	xengnttab_unmap(*xgt_handle, interface, 1);
+	if (domid == xenbus_master_domid())
+		unmap_xenbus(interface);
+	else
+		xengnttab_unmap(*xgt_handle, interface, 1);
 }
 
 static int domain_tree_remove_sub(const void *ctx, struct connection *conn,
@@ -594,14 +600,8 @@ static int destroy_domain(void *_domain)
 			eprintf("> Unbinding port %i failed!\n", domain->port);
 	}
 
-	if (domain->interface) {
-		/* Domain 0 was mapped by dom0_init, so it must be unmapped
-		   using munmap() and not the grant unmap call. */
-		if (domain->domid == dom0_domid)
-			unmap_xenbus(domain->interface);
-		else
-			unmap_interface(domain->interface);
-	}
+	if (domain->interface)
+		unmap_interface(domain->domid, domain->interface);
 
 	fire_special_watches("@releaseDomain");
 
@@ -966,18 +966,13 @@ static struct domain *introduce_domain(const void *ctx,
 		return NULL;
 
 	if (!domain->introduced) {
-		interface = is_master_domain ? xenbus_map()
-					     : map_interface(domid);
+		interface = map_interface(domid);
 		if (!interface && !restore)
 			return NULL;
 		if (new_domain(domain, port, restore)) {
 			rc = errno;
-			if (interface) {
-				if (is_master_domain)
-					unmap_xenbus(interface);
-				else
-					unmap_interface(interface);
-			}
+			if (interface)
+				unmap_interface(domid, interface);
 			errno = rc;
 			return NULL;
 		}
-- 
2.35.3


