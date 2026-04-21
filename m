Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPSAMowq52nv4wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 09:43:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 405E7437CAC
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 09:43:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288455.1568757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF5l1-0005Vc-An; Tue, 21 Apr 2026 07:42:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288455.1568757; Tue, 21 Apr 2026 07:42:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF5l1-0005Sy-6W; Tue, 21 Apr 2026 07:42:55 +0000
Received: by outflank-mailman (input) for mailman id 1288455;
 Tue, 21 Apr 2026 07:42:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wF5kz-0005Nr-OI
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 07:42:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF5kz-00G0my-4i
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 09:42:53 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69e72a79-bab6-0a2a0a5309dd-0a2a450a8036-26
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 09:42:53 +0200
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69e72a7c-56b3-0a2a450a0019-c387df839c2e-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 09:42:53 +0200
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id ADC425BCE1;
 Tue, 21 Apr 2026 07:42:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 892C0593AF;
 Tue, 21 Apr 2026 07:42:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id hTRXIHwq52kwNwAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 21 Apr 2026 07:42:52 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References"; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1776757372; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H4xDwurhkvE0j1k8kqAZ1un0445rmmWmoyaVKvtmHfs=;
	b=dKdo7mVNbb2833HOzBH8ax9gOs1Nfz18pBlDL0RE+ngF+aWCzA6q6+EgKEM+onCdc5Gh1u
	nD8I7lGjymPFmGZD6hFZCFYGBCQOwzgS79/CvfEJRTXCXwSIaE2MYgQItIAV0/cCwGgVeG
	aKubo8f7B28haR3P6H9biqznReHI/rA=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=dKdo7mVN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1776757372; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H4xDwurhkvE0j1k8kqAZ1un0445rmmWmoyaVKvtmHfs=;
	b=dKdo7mVNbb2833HOzBH8ax9gOs1Nfz18pBlDL0RE+ngF+aWCzA6q6+EgKEM+onCdc5Gh1u
	nD8I7lGjymPFmGZD6hFZCFYGBCQOwzgS79/CvfEJRTXCXwSIaE2MYgQItIAV0/cCwGgVeG
	aKubo8f7B28haR3P6H9biqznReHI/rA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v2 7/9] tools/xenstored: expand special watch handling with depth feature
Date: Tue, 21 Apr 2026 09:42:09 +0200
Message-ID: <20260421074211.308473-8-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260421074211.308473-1-jgross@suse.com>
References: <20260421074211.308473-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-purgate-ID: tlsNG-4011c0/1776757373-44B678B7-D19C34A6/0/0
X-purgate-type: clean
X-purgate-size: 3484
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:julien@xen.org,m:anthony.perard@vates.tech,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.991];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 405E7437CAC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

With XENSTORE_SERVER_FEATURE_WATCHDEPTH available, special watch
handling needs to be extended:

- when a special watch is set with depth = 1, the domid is added to
  the watch event

- it is possible to watch for @releaseDomain/<domid>

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
V2:
- remove stray {} addition (Jason Andryuk)
---
 tools/xenstored/domain.c | 34 ++++++++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index 7f2fa16cf2..a5258dae6d 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -616,7 +616,12 @@ static void domain_tree_remove(struct domain *domain)
 	walk_node_tree(domain, NULL, "@introduceDomain", &walkfuncs, domain);
 }
 
-static void fire_special_watches(const char *name)
+#define WATCH_NODOM	1	/* Fire watches without <domid> extension. */
+#define WATCH_DOM	2	/* Fire watches with <domid> extension. */
+#define WATCH_BOTH	(WATCH_NODOM | WATCH_DOM)
+
+static void fire_special_watches(const char *name, unsigned int domid,
+				 unsigned int watchdom_flag)
 {
 	void *ctx = talloc_new(NULL);
 	const struct node *node;
@@ -626,9 +631,19 @@ static void fire_special_watches(const char *name)
 
 	node = read_node_const(NULL, ctx, name);
 
-	if (node)
-		fire_watches(NULL, ctx, name, node, true, NULL);
-	else
+	if (node) {
+		if (watchdom_flag & WATCH_NODOM)
+			fire_watches(NULL, ctx, name, node, MATCH_NODEPTH,
+				     NULL);
+		if (watchdom_flag & WATCH_DOM) {
+			char name_dom[24]; /* max. "@introduceDomain/domid" */
+
+			snprintf(name_dom, sizeof(name_dom),
+				 "%s/%u", name, domid);
+			fire_watches(NULL, ctx, name_dom, node, MATCH_DEPTH,
+				     NULL);
+		}
+	} else
 		log("special node %s not found\n", name);
 
 	talloc_free(ctx);
@@ -653,7 +668,7 @@ static int destroy_domain(void *_domain)
 	if (domain->interface)
 		unmap_interface(domain->domid, domain->interface);
 
-	fire_special_watches("@releaseDomain");
+	fire_special_watches("@releaseDomain", domain->domid, WATCH_BOTH);
 
 	wrl_domain_destroy(domain);
 
@@ -681,6 +696,8 @@ static int do_check_domain(struct domain *domain, bool *notify,
 		if ((state & XENMANAGE_GETDOMSTATE_STATE_SHUTDOWN)
 		    && !domain->shutdown) {
 			domain->shutdown = true;
+			fire_special_watches("@releaseDomain", domain->domid,
+					     WATCH_DOM);
 			*notify = true;
 		}
 		if (!(state & XENMANAGE_GETDOMSTATE_STATE_DEAD))
@@ -723,7 +740,7 @@ void check_domains(void)
 		;
 
 	if (notify)
-		fire_special_watches("@releaseDomain");
+		fire_special_watches("@releaseDomain", 0, WATCH_NODOM);
 }
 
 static struct domain *find_domain_struct(unsigned int domid)
@@ -747,7 +764,7 @@ static void do_check_domains(void)
 	}
 
 	if (notify)
-		fire_special_watches("@releaseDomain");
+		fire_special_watches("@releaseDomain", 0, WATCH_NODOM);
 }
 
 /* We scan all domains rather than use the information given here. */
@@ -1112,7 +1129,8 @@ static struct domain *introduce_domain(const void *ctx,
 		talloc_steal(domain->conn, domain);
 
 		if (!is_priv_domain && !restore)
-			fire_special_watches("@introduceDomain");
+			fire_special_watches("@introduceDomain", domid,
+					     WATCH_BOTH);
 	} else {
 		/* Use XS_INTRODUCE for recreating the xenbus event-channel. */
 		if (domain->port)
-- 
2.53.0


