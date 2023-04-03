Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1376D4090
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 11:27:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517351.802556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjGT8-00022h-FJ; Mon, 03 Apr 2023 09:27:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517351.802556; Mon, 03 Apr 2023 09:27:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjGT8-00020z-CS; Mon, 03 Apr 2023 09:27:18 +0000
Received: by outflank-mailman (input) for mailman id 517351;
 Mon, 03 Apr 2023 09:27:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L93W=72=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pjGT6-00020t-Fx
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 09:27:16 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b82df015-d201-11ed-85db-49a42c6b2330;
 Mon, 03 Apr 2023 11:27:15 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1EAD21F8B8;
 Mon,  3 Apr 2023 09:27:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E1C8513416;
 Mon,  3 Apr 2023 09:27:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 95KzNfGbKmT0YQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 03 Apr 2023 09:27:13 +0000
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
X-Inumbo-ID: b82df015-d201-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1680514034; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fPwYyujXO4mPZ107oiABO3rd/KXZ8IqVN1G60GG3sas=;
	b=iI0+eaaRv6fdlTpnFRhsapTgfyCXMoahX7PzJ0gySxojgtteAmnpXUZBnB49ZGzqLBPSKf
	Ditz6CbiSLcL5+eYo82Skh5xXV2wuNmqe5W88s8G8G6LNxQhgXvHIXRGMQi1SeSP7xOlGI
	Ic6Jq9TW/PcdIhLhAfFfFoHKlp5Bgls=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH v2] xen/pvcalls: don't call bind_evtchn_to_irqhandler() under lock
Date: Mon,  3 Apr 2023 11:27:11 +0200
Message-Id: <20230403092711.15285-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bind_evtchn_to_irqhandler() shouldn't be called under spinlock, as it
can sleep.

This requires to move the calls of create_active() out of the locked
regions. This is no problem, as the worst which could happen would be
a spurious call of the interrupt handler, causing a spurious wake_up().

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://lore.kernel.org/lkml/Y+JUIl64UDmdkboh@kadam/
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- remove stale spin_unlock() (Oleksandr Tyshchenko)
---
 drivers/xen/pvcalls-front.c | 46 +++++++++++++++++++++----------------
 1 file changed, 26 insertions(+), 20 deletions(-)

diff --git a/drivers/xen/pvcalls-front.c b/drivers/xen/pvcalls-front.c
index d5d589bda243..b72ee9379d77 100644
--- a/drivers/xen/pvcalls-front.c
+++ b/drivers/xen/pvcalls-front.c
@@ -227,22 +227,30 @@ static irqreturn_t pvcalls_front_event_handler(int irq, void *dev_id)
 
 static void free_active_ring(struct sock_mapping *map);
 
-static void pvcalls_front_free_map(struct pvcalls_bedata *bedata,
-				   struct sock_mapping *map)
+static void pvcalls_front_destroy_active(struct pvcalls_bedata *bedata,
+					 struct sock_mapping *map)
 {
 	int i;
 
 	unbind_from_irqhandler(map->active.irq, map);
 
-	spin_lock(&bedata->socket_lock);
-	if (!list_empty(&map->list))
-		list_del_init(&map->list);
-	spin_unlock(&bedata->socket_lock);
+	if (bedata) {
+		spin_lock(&bedata->socket_lock);
+		if (!list_empty(&map->list))
+			list_del_init(&map->list);
+		spin_unlock(&bedata->socket_lock);
+	}
 
 	for (i = 0; i < (1 << PVCALLS_RING_ORDER); i++)
 		gnttab_end_foreign_access(map->active.ring->ref[i], NULL);
 	gnttab_end_foreign_access(map->active.ref, NULL);
 	free_active_ring(map);
+}
+
+static void pvcalls_front_free_map(struct pvcalls_bedata *bedata,
+				   struct sock_mapping *map)
+{
+	pvcalls_front_destroy_active(bedata, map);
 
 	kfree(map);
 }
@@ -433,19 +441,18 @@ int pvcalls_front_connect(struct socket *sock, struct sockaddr *addr,
 		pvcalls_exit_sock(sock);
 		return ret;
 	}
-
-	spin_lock(&bedata->socket_lock);
-	ret = get_request(bedata, &req_id);
+	ret = create_active(map, &evtchn);
 	if (ret < 0) {
-		spin_unlock(&bedata->socket_lock);
 		free_active_ring(map);
 		pvcalls_exit_sock(sock);
 		return ret;
 	}
-	ret = create_active(map, &evtchn);
+
+	spin_lock(&bedata->socket_lock);
+	ret = get_request(bedata, &req_id);
 	if (ret < 0) {
 		spin_unlock(&bedata->socket_lock);
-		free_active_ring(map);
+		pvcalls_front_destroy_active(NULL, map);
 		pvcalls_exit_sock(sock);
 		return ret;
 	}
@@ -821,28 +828,27 @@ int pvcalls_front_accept(struct socket *sock, struct socket *newsock, int flags)
 		pvcalls_exit_sock(sock);
 		return ret;
 	}
-	spin_lock(&bedata->socket_lock);
-	ret = get_request(bedata, &req_id);
+	ret = create_active(map2, &evtchn);
 	if (ret < 0) {
-		clear_bit(PVCALLS_FLAG_ACCEPT_INFLIGHT,
-			  (void *)&map->passive.flags);
-		spin_unlock(&bedata->socket_lock);
 		free_active_ring(map2);
 		kfree(map2);
+		clear_bit(PVCALLS_FLAG_ACCEPT_INFLIGHT,
+			  (void *)&map->passive.flags);
 		pvcalls_exit_sock(sock);
 		return ret;
 	}
 
-	ret = create_active(map2, &evtchn);
+	spin_lock(&bedata->socket_lock);
+	ret = get_request(bedata, &req_id);
 	if (ret < 0) {
-		free_active_ring(map2);
-		kfree(map2);
 		clear_bit(PVCALLS_FLAG_ACCEPT_INFLIGHT,
 			  (void *)&map->passive.flags);
 		spin_unlock(&bedata->socket_lock);
+		pvcalls_front_free_map(bedata, map2);
 		pvcalls_exit_sock(sock);
 		return ret;
 	}
+
 	list_add_tail(&map2->list, &bedata->socket_mappings);
 
 	req = RING_GET_REQUEST(&bedata->ring, req_id);
-- 
2.35.3


