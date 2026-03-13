Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GO84JFrBs2mEagAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 08:48:42 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A80527EF8D
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 08:48:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253379.1549679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0xG7-00069k-Iq; Fri, 13 Mar 2026 07:48:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253379.1549679; Fri, 13 Mar 2026 07:48:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0xG7-00066v-DP; Fri, 13 Mar 2026 07:48:35 +0000
Received: by outflank-mailman (input) for mailman id 1253379;
 Fri, 13 Mar 2026 07:48:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CqhT=BN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w0xG5-0003h2-Mc
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 07:48:33 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 081c0d37-1eb1-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 08:48:32 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C46755CF3A;
 Fri, 13 Mar 2026 07:48:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A3F84403F6;
 Fri, 13 Mar 2026 07:48:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id jozfJk/Bs2nxGAAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 13 Mar 2026 07:48:31 +0000
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
X-Inumbo-ID: 081c0d37-1eb1-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773388111; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wtc5vtg54h365QFdm8hm6MolP6XIgjTyDkWMll2qEbc=;
	b=IFXiqIDBBFWrVLnDa2TDp0llCHTngEsRKlAA6/8Goi95/zxhfJW0wSvjmYPXIp5XYeH4ya
	6IF+YyI2lywmpGm/crQt+24oJBhu4IaP6cNtClfIKibfr/XbV7ohmzD+BsywkdEGjPZWfL
	uCcRGjbycsgRz9o9i/CSmI+ae4yUhII=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773388111; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wtc5vtg54h365QFdm8hm6MolP6XIgjTyDkWMll2qEbc=;
	b=IFXiqIDBBFWrVLnDa2TDp0llCHTngEsRKlAA6/8Goi95/zxhfJW0wSvjmYPXIp5XYeH4ya
	6IF+YyI2lywmpGm/crQt+24oJBhu4IaP6cNtClfIKibfr/XbV7ohmzD+BsywkdEGjPZWfL
	uCcRGjbycsgRz9o9i/CSmI+ae4yUhII=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 7/8] tools/xenstored: expand special watch handling with depth feature
Date: Fri, 13 Mar 2026 08:47:50 +0100
Message-ID: <20260313074751.2904215-8-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313074751.2904215-1-jgross@suse.com>
References: <20260313074751.2904215-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:julien@xen.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 4A80527EF8D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

With XENSTORE_SERVER_FEATURE_WATCHDEPTH available, special watch
handling needs to be extended:

- when a special watch is set with depth = 1, the domid is added to
  the watch event

- it is possible to watch for @releaseDomain/<domid>

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstored/domain.c | 37 ++++++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index 866c0aa908..1fe8abbea9 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -613,7 +613,12 @@ static void domain_tree_remove(struct domain *domain)
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
@@ -623,9 +628,19 @@ static void fire_special_watches(const char *name)
 
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
@@ -650,7 +665,7 @@ static int destroy_domain(void *_domain)
 	if (domain->interface)
 		unmap_interface(domain->domid, domain->interface);
 
-	fire_special_watches("@releaseDomain");
+	fire_special_watches("@releaseDomain", domain->domid, WATCH_BOTH);
 
 	wrl_domain_destroy(domain);
 
@@ -678,10 +693,13 @@ static int do_check_domain(struct domain *domain, bool *notify,
 		if ((state & XENMANAGE_GETDOMSTATE_STATE_SHUTDOWN)
 		    && !domain->shutdown) {
 			domain->shutdown = true;
+			fire_special_watches("@releaseDomain", domain->domid,
+					     WATCH_DOM);
 			*notify = true;
 		}
-		if (!(state & XENMANAGE_GETDOMSTATE_STATE_DEAD))
+		if (!(state & XENMANAGE_GETDOMSTATE_STATE_DEAD)) {
 			return 0;
+		}
 	}
 	if (domain->conn) {
 		/* domain is a talloc child of domain->conn. */
@@ -720,7 +738,7 @@ void check_domains(void)
 		;
 
 	if (notify)
-		fire_special_watches("@releaseDomain");
+		fire_special_watches("@releaseDomain", 0, WATCH_NODOM);
 }
 
 static struct domain *find_domain_struct(unsigned int domid)
@@ -744,7 +762,7 @@ static void do_check_domains(void)
 	}
 
 	if (notify)
-		fire_special_watches("@releaseDomain");
+		fire_special_watches("@releaseDomain", 0, WATCH_NODOM);
 }
 
 /* We scan all domains rather than use the information given here. */
@@ -1097,7 +1115,8 @@ static struct domain *introduce_domain(const void *ctx,
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


