Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B196584981D
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 11:52:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675812.1051345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwaX-00067Q-Hd; Mon, 05 Feb 2024 10:52:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675812.1051345; Mon, 05 Feb 2024 10:52:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwaX-00064d-Eu; Mon, 05 Feb 2024 10:52:33 +0000
Received: by outflank-mailman (input) for mailman id 675812;
 Mon, 05 Feb 2024 10:52:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b4fC=JO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rWwaW-00064Q-Le
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 10:52:32 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8c4cb0b-c414-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 11:52:30 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5255922285;
 Mon,  5 Feb 2024 10:52:30 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 14A4A132DD;
 Mon,  5 Feb 2024 10:52:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id QOmNA+69wGXmNgAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 05 Feb 2024 10:52:30 +0000
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
X-Inumbo-ID: a8c4cb0b-c414-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707130350; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sBN45VY796bPT208E7z1cKUSQ/jSCHWuzgN6GPy8ckw=;
	b=XPLQmfsImAnW4qPMeUaZMNYUKSCWkTag5wGDPSYySdjzxWw0LTfK7czpaKIGUbR2VOgO/U
	w/sayaMlagAz0M9Fclx3CRPeO7wYiBdhqS4ushlEwZ2F8eoSOVBWGaxr7mgKgLiW+ZIqQ4
	BWDxSi9ki62/PDIMB4SWLuhbqmMLaTY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707130350; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sBN45VY796bPT208E7z1cKUSQ/jSCHWuzgN6GPy8ckw=;
	b=XPLQmfsImAnW4qPMeUaZMNYUKSCWkTag5wGDPSYySdjzxWw0LTfK7czpaKIGUbR2VOgO/U
	w/sayaMlagAz0M9Fclx3CRPeO7wYiBdhqS4ushlEwZ2F8eoSOVBWGaxr7mgKgLiW+ZIqQ4
	BWDxSi9ki62/PDIMB4SWLuhbqmMLaTY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v4 26/32] tools/xenstored: rework ring page (un)map functions
Date: Mon,  5 Feb 2024 11:49:55 +0100
Message-Id: <20240205105001.24171-27-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240205105001.24171-1-jgross@suse.com>
References: <20240205105001.24171-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [0.89 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 REPLY(-4.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[suse.com,xen.org,citrix.com,gmail.com,amazon.com];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.01)[50.16%]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: 0.89

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


