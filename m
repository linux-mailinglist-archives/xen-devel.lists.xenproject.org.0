Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8383F5C1B
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 12:28:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170858.311859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mITfQ-0004Nm-Go; Tue, 24 Aug 2021 10:28:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170858.311859; Tue, 24 Aug 2021 10:28:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mITfQ-0004Ku-Bn; Tue, 24 Aug 2021 10:28:28 +0000
Received: by outflank-mailman (input) for mailman id 170858;
 Tue, 24 Aug 2021 10:28:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3Uw6=NP=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mITfO-00031l-3n
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:28:26 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 84f74615-da8a-4f51-8b77-82161ad5c47f;
 Tue, 24 Aug 2021 10:28:15 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4AF9E20050;
 Tue, 24 Aug 2021 10:28:14 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 048EE136DD;
 Tue, 24 Aug 2021 10:28:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id aKYuO73JJGG8DwAAGKfGzw
 (envelope-from <jgross@suse.com>); Tue, 24 Aug 2021 10:28:13 +0000
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
X-Inumbo-ID: 84f74615-da8a-4f51-8b77-82161ad5c47f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1629800894; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dRfHDlbGvJX0Rh3aH0nd0i0HxQzYtne2EnV2YC+Etxk=;
	b=WA3W65tQDCGvZ6HWHIGUJZAQZYk/ziLqp7BG4E0U2Kn9UPepZzumKpmbZ0uW+XGqsGRDGm
	hc3woFMVOqUqQY8GKTWR9k337NFfSSOWEWki45zkGpCXg4Tdq40AaS6+pew3yTMN51P8xQ
	BAUavhaDsivS2qpG2Z9jGgMWI7k70rk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH v2 3/4] xen/netfront: disentangle tx_skb_freelist
Date: Tue, 24 Aug 2021 12:28:08 +0200
Message-Id: <20210824102809.26370-4-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210824102809.26370-1-jgross@suse.com>
References: <20210824102809.26370-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tx_skb_freelist elements are in a single linked list with the
request id used as link reference. The per element link field is in a
union with the skb pointer of an in use request.

Move the link reference out of the union in order to enable a later
reuse of it for requests which need a populated skb pointer.

Rename add_id_to_freelist() and get_id_from_freelist() to
add_id_to_list() and get_id_from_list() in order to prepare using
those for other lists as well. Define ~0 as value to indicate the end
of a list and place that value into the link for a request not being
on the list.

When freeing a skb zero the skb pointer in the request. Use a NULL
value of the skb pointer instead of skb_entry_is_link() for deciding
whether a request has a skb linked to it.

Remove skb_entry_set_link() and open code it instead as it is really
trivial now.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 drivers/net/xen-netfront.c | 61 ++++++++++++++++----------------------
 1 file changed, 25 insertions(+), 36 deletions(-)

diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c
index 714fe9d2c534..956e1266bd1a 100644
--- a/drivers/net/xen-netfront.c
+++ b/drivers/net/xen-netfront.c
@@ -126,17 +126,11 @@ struct netfront_queue {
 
 	/*
 	 * {tx,rx}_skbs store outstanding skbuffs. Free tx_skb entries
-	 * are linked from tx_skb_freelist through skb_entry.link.
-	 *
-	 *  NB. Freelist index entries are always going to be less than
-	 *  PAGE_OFFSET, whereas pointers to skbs will always be equal or
-	 *  greater than PAGE_OFFSET: we use this property to distinguish
-	 *  them.
+	 * are linked from tx_skb_freelist through tx_link.
 	 */
-	union skb_entry {
-		struct sk_buff *skb;
-		unsigned long link;
-	} tx_skbs[NET_TX_RING_SIZE];
+	struct sk_buff *tx_skbs[NET_TX_RING_SIZE];
+	unsigned short tx_link[NET_TX_RING_SIZE];
+#define TX_LINK_NONE 0xffff
 	grant_ref_t gref_tx_head;
 	grant_ref_t grant_tx_ref[NET_TX_RING_SIZE];
 	struct page *grant_tx_page[NET_TX_RING_SIZE];
@@ -181,33 +175,25 @@ struct netfront_rx_info {
 	struct xen_netif_extra_info extras[XEN_NETIF_EXTRA_TYPE_MAX - 1];
 };
 
-static void skb_entry_set_link(union skb_entry *list, unsigned short id)
-{
-	list->link = id;
-}
-
-static int skb_entry_is_link(const union skb_entry *list)
-{
-	BUILD_BUG_ON(sizeof(list->skb) != sizeof(list->link));
-	return (unsigned long)list->skb < PAGE_OFFSET;
-}
-
 /*
  * Access macros for acquiring freeing slots in tx_skbs[].
  */
 
-static void add_id_to_freelist(unsigned *head, union skb_entry *list,
-			       unsigned short id)
+static void add_id_to_list(unsigned *head, unsigned short *list,
+			   unsigned short id)
 {
-	skb_entry_set_link(&list[id], *head);
+	list[id] = *head;
 	*head = id;
 }
 
-static unsigned short get_id_from_freelist(unsigned *head,
-					   union skb_entry *list)
+static unsigned short get_id_from_list(unsigned *head, unsigned short *list)
 {
 	unsigned int id = *head;
-	*head = list[id].link;
+
+	if (id != TX_LINK_NONE) {
+		*head = list[id];
+		list[id] = TX_LINK_NONE;
+	}
 	return id;
 }
 
@@ -406,7 +392,8 @@ static void xennet_tx_buf_gc(struct netfront_queue *queue)
 				continue;
 
 			id  = txrsp.id;
-			skb = queue->tx_skbs[id].skb;
+			skb = queue->tx_skbs[id];
+			queue->tx_skbs[id] = NULL;
 			if (unlikely(gnttab_query_foreign_access(
 				queue->grant_tx_ref[id]) != 0)) {
 				pr_alert("%s: warning -- grant still in use by backend domain\n",
@@ -419,7 +406,7 @@ static void xennet_tx_buf_gc(struct netfront_queue *queue)
 				&queue->gref_tx_head, queue->grant_tx_ref[id]);
 			queue->grant_tx_ref[id] = GRANT_INVALID_REF;
 			queue->grant_tx_page[id] = NULL;
-			add_id_to_freelist(&queue->tx_skb_freelist, queue->tx_skbs, id);
+			add_id_to_list(&queue->tx_skb_freelist, queue->tx_link, id);
 			dev_kfree_skb_irq(skb);
 		}
 
@@ -452,7 +439,7 @@ static void xennet_tx_setup_grant(unsigned long gfn, unsigned int offset,
 	struct netfront_queue *queue = info->queue;
 	struct sk_buff *skb = info->skb;
 
-	id = get_id_from_freelist(&queue->tx_skb_freelist, queue->tx_skbs);
+	id = get_id_from_list(&queue->tx_skb_freelist, queue->tx_link);
 	tx = RING_GET_REQUEST(&queue->tx, queue->tx.req_prod_pvt++);
 	ref = gnttab_claim_grant_reference(&queue->gref_tx_head);
 	WARN_ON_ONCE(IS_ERR_VALUE((unsigned long)(int)ref));
@@ -460,7 +447,7 @@ static void xennet_tx_setup_grant(unsigned long gfn, unsigned int offset,
 	gnttab_grant_foreign_access_ref(ref, queue->info->xbdev->otherend_id,
 					gfn, GNTMAP_readonly);
 
-	queue->tx_skbs[id].skb = skb;
+	queue->tx_skbs[id] = skb;
 	queue->grant_tx_page[id] = page;
 	queue->grant_tx_ref[id] = ref;
 
@@ -1284,17 +1271,18 @@ static void xennet_release_tx_bufs(struct netfront_queue *queue)
 
 	for (i = 0; i < NET_TX_RING_SIZE; i++) {
 		/* Skip over entries which are actually freelist references */
-		if (skb_entry_is_link(&queue->tx_skbs[i]))
+		if (!queue->tx_skbs[i])
 			continue;
 
-		skb = queue->tx_skbs[i].skb;
+		skb = queue->tx_skbs[i];
+		queue->tx_skbs[i] = NULL;
 		get_page(queue->grant_tx_page[i]);
 		gnttab_end_foreign_access(queue->grant_tx_ref[i],
 					  GNTMAP_readonly,
 					  (unsigned long)page_address(queue->grant_tx_page[i]));
 		queue->grant_tx_page[i] = NULL;
 		queue->grant_tx_ref[i] = GRANT_INVALID_REF;
-		add_id_to_freelist(&queue->tx_skb_freelist, queue->tx_skbs, i);
+		add_id_to_list(&queue->tx_skb_freelist, queue->tx_link, i);
 		dev_kfree_skb_irq(skb);
 	}
 }
@@ -1851,13 +1839,14 @@ static int xennet_init_queue(struct netfront_queue *queue)
 	snprintf(queue->name, sizeof(queue->name), "vif%s-q%u",
 		 devid, queue->id);
 
-	/* Initialise tx_skbs as a free chain containing every entry. */
+	/* Initialise tx_skb_freelist as a free chain containing every entry. */
 	queue->tx_skb_freelist = 0;
 	for (i = 0; i < NET_TX_RING_SIZE; i++) {
-		skb_entry_set_link(&queue->tx_skbs[i], i+1);
+		queue->tx_link[i] = i + 1;
 		queue->grant_tx_ref[i] = GRANT_INVALID_REF;
 		queue->grant_tx_page[i] = NULL;
 	}
+	queue->tx_link[NET_TX_RING_SIZE - 1] = TX_LINK_NONE;
 
 	/* Clear out rx_skbs */
 	for (i = 0; i < NET_RX_RING_SIZE; i++) {
-- 
2.26.2


