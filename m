Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FC97E7DAE
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 17:16:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630538.983482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UB2-0000dF-IT; Fri, 10 Nov 2023 16:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630538.983482; Fri, 10 Nov 2023 16:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UB2-0000an-Fq; Fri, 10 Nov 2023 16:16:12 +0000
Received: by outflank-mailman (input) for mailman id 630538;
 Fri, 10 Nov 2023 16:16:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ap16=GX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r1U5J-0004cS-9Y
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 16:10:17 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2861be8-7fe3-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 17:10:15 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 812551F8BB;
 Fri, 10 Nov 2023 16:10:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5557C13398;
 Fri, 10 Nov 2023 16:10:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7heiE+dVTmVsCQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 10 Nov 2023 16:10:15 +0000
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
X-Inumbo-ID: a2861be8-7fe3-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699632615; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OyPsqGgDSHfZ39Pq/Ikf6PwNSKByuBj9AES+Iv7pAgI=;
	b=Asni5z0LeZJAE+mbtPoJnydmK4eCw6uieINjJDGR/LNQ5QrKT0S08AWEJpqOoSOJgmkJh8
	rD8tsV9BzhY+uxV+Fudc8dYyI8qvG3Bdqgu75ST5KEfS2X0s2N0EtRcY1rVRvJnNgV4FYZ
	G3Zrwwge18F/vvREzqnLZrHcc3PUnRI=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH v2 23/29] tools/xenstored: rework ring page (un)map functions
Date: Fri, 10 Nov 2023 17:07:58 +0100
Message-Id: <20231110160804.29021-24-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231110160804.29021-1-jgross@suse.com>
References: <20231110160804.29021-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When [un]mapping the ring page of a Xenstore client, different actions
are required for "normal" guests and dom0. Today this distinction is
made at call site.

Move this distinction into [un]map_interface() instead, avoiding code
duplication and preparing special handling for [un]mapping the stub
domain's ring page.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
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


