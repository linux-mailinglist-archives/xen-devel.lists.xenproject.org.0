Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD16823E6B
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 10:14:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661336.1031134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLJnX-0001u7-D2; Thu, 04 Jan 2024 09:13:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661336.1031134; Thu, 04 Jan 2024 09:13:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLJnX-0001qm-9J; Thu, 04 Jan 2024 09:13:55 +0000
Received: by outflank-mailman (input) for mailman id 661336;
 Thu, 04 Jan 2024 09:13:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4u2H=IO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rLJdR-00085z-NY
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 09:03:29 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2081e669-aae0-11ee-98ef-6d05b1d4d9a1;
 Thu, 04 Jan 2024 10:03:29 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DA59A21EE1;
 Thu,  4 Jan 2024 09:03:28 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A1BA913722;
 Thu,  4 Jan 2024 09:03:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wAo8JmB0lmVSWQAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 04 Jan 2024 09:03:28 +0000
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
X-Inumbo-ID: 2081e669-aae0-11ee-98ef-6d05b1d4d9a1
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v3 27/33] tools/xenstored: rework ring page (un)map functions
Date: Thu,  4 Jan 2024 10:00:49 +0100
Message-Id: <20240104090055.27323-28-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240104090055.27323-1-jgross@suse.com>
References: <20240104090055.27323-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: DA59A21EE1

When [un]mapping the ring page of a Xenstore client, different actions
are required for "normal" guests and dom0. Today this distinction is
made at call site.

Move this distinction into [un]map_interface() instead, avoiding code
duplication and preparing special handling for [un]mapping the stub
domain's ring page.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstored/domain.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index 040df98b8c..af80a8221d 100644
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


