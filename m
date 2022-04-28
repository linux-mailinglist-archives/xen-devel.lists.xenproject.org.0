Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8089512E5B
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 10:28:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316179.535050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njzVJ-0007zr-Vz; Thu, 28 Apr 2022 08:28:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316179.535050; Thu, 28 Apr 2022 08:28:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njzVI-0007qQ-Tu; Thu, 28 Apr 2022 08:28:00 +0000
Received: by outflank-mailman (input) for mailman id 316179;
 Thu, 28 Apr 2022 08:27:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KUQd=VG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1njzVC-0005SL-Aj
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 08:27:54 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17541ed6-c6cd-11ec-a405-831a346695d4;
 Thu, 28 Apr 2022 10:27:50 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 464531F8AC;
 Thu, 28 Apr 2022 08:27:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 038BE13491;
 Thu, 28 Apr 2022 08:27:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kIMQOwVQamIBLgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 28 Apr 2022 08:27:49 +0000
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
X-Inumbo-ID: 17541ed6-c6cd-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1651134470; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8veqePX7rdlWDFOqgS78jUbLrgjtOmHQWA4ds9ys4IE=;
	b=rlIU5c4XpDDC7FrePn4vUJzKDyXHqwBA/KrdUbuegUL/GMk4CbeRxuLFKYzRcV4h6uEH0R
	L0jIaXxjVS2Dr3TW9oriwnhhCWoUjTrAD4Ua6LmdjKnMAEecMlj3qMU8neAALFcwsCaTww
	qTn2D9U/CoxHhFQs9ltdPwvn5qwcNqw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v2 09/19] xen: update ring.h
Date: Thu, 28 Apr 2022 10:27:33 +0200
Message-Id: <20220428082743.16593-10-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220428082743.16593-1-jgross@suse.com>
References: <20220428082743.16593-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update include/xen/interface/io/ring.h to its newest version.

Switch the two improper use cases of RING_HAS_UNCONSUMED_RESPONSES() to
XEN_RING_NR_UNCONSUMED_RESPONSES() in order to avoid the nasty
XEN_RING_HAS_UNCONSUMED_IS_BOOL #define.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 drivers/net/xen-netfront.c      |  4 ++--
 include/xen/interface/io/ring.h | 19 ++++++++++++++-----
 2 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c
index af3d3de7d9fa..966bee2a6902 100644
--- a/drivers/net/xen-netfront.c
+++ b/drivers/net/xen-netfront.c
@@ -866,7 +866,7 @@ static void xennet_set_rx_rsp_cons(struct netfront_queue *queue, RING_IDX val)
 
 	spin_lock_irqsave(&queue->rx_cons_lock, flags);
 	queue->rx.rsp_cons = val;
-	queue->rx_rsp_unconsumed = RING_HAS_UNCONSUMED_RESPONSES(&queue->rx);
+	queue->rx_rsp_unconsumed = XEN_RING_NR_UNCONSUMED_RESPONSES(&queue->rx);
 	spin_unlock_irqrestore(&queue->rx_cons_lock, flags);
 }
 
@@ -1498,7 +1498,7 @@ static bool xennet_handle_rx(struct netfront_queue *queue, unsigned int *eoi)
 		return false;
 
 	spin_lock_irqsave(&queue->rx_cons_lock, flags);
-	work_queued = RING_HAS_UNCONSUMED_RESPONSES(&queue->rx);
+	work_queued = XEN_RING_NR_UNCONSUMED_RESPONSES(&queue->rx);
 	if (work_queued > queue->rx_rsp_unconsumed) {
 		queue->rx_rsp_unconsumed = work_queued;
 		*eoi = 0;
diff --git a/include/xen/interface/io/ring.h b/include/xen/interface/io/ring.h
index 2470ec45ebb2..ba4c4274b714 100644
--- a/include/xen/interface/io/ring.h
+++ b/include/xen/interface/io/ring.h
@@ -72,9 +72,8 @@ typedef unsigned int RING_IDX;
  * of the shared memory area (PAGE_SIZE, for instance). To initialise
  * the front half:
  *
- *     mytag_front_ring_t front_ring;
- *     SHARED_RING_INIT((mytag_sring_t *)shared_page);
- *     FRONT_RING_INIT(&front_ring, (mytag_sring_t *)shared_page, PAGE_SIZE);
+ *     mytag_front_ring_t ring;
+ *     XEN_FRONT_RING_INIT(&ring, (mytag_sring_t *)shared_page, PAGE_SIZE);
  *
  * Initializing the back follows similarly (note that only the front
  * initializes the shared ring):
@@ -146,6 +145,11 @@ struct __name##_back_ring {                                             \
 
 #define FRONT_RING_INIT(_r, _s, __size) FRONT_RING_ATTACH(_r, _s, 0, __size)
 
+#define XEN_FRONT_RING_INIT(r, s, size) do {                            \
+    SHARED_RING_INIT(s);                                                \
+    FRONT_RING_INIT(r, s, size);                                        \
+} while (0)
+
 #define BACK_RING_ATTACH(_r, _s, _i, __size) do {                       \
     (_r)->rsp_prod_pvt = (_i);                                          \
     (_r)->req_cons = (_i);                                              \
@@ -170,16 +174,21 @@ struct __name##_back_ring {                                             \
     (RING_FREE_REQUESTS(_r) == 0)
 
 /* Test if there are outstanding messages to be processed on a ring. */
-#define RING_HAS_UNCONSUMED_RESPONSES(_r)                               \
+#define XEN_RING_NR_UNCONSUMED_RESPONSES(_r)                            \
     ((_r)->sring->rsp_prod - (_r)->rsp_cons)
 
-#define RING_HAS_UNCONSUMED_REQUESTS(_r) ({                             \
+#define XEN_RING_NR_UNCONSUMED_REQUESTS(_r) ({                          \
     unsigned int req = (_r)->sring->req_prod - (_r)->req_cons;          \
     unsigned int rsp = RING_SIZE(_r) -                                  \
         ((_r)->req_cons - (_r)->rsp_prod_pvt);                          \
     req < rsp ? req : rsp;                                              \
 })
 
+#define RING_HAS_UNCONSUMED_RESPONSES(_r) \
+    (!!XEN_RING_NR_UNCONSUMED_RESPONSES(_r))
+#define RING_HAS_UNCONSUMED_REQUESTS(_r)  \
+    (!!XEN_RING_NR_UNCONSUMED_REQUESTS(_r))
+
 /* Direct access to individual ring elements, by index. */
 #define RING_GET_REQUEST(_r, _idx)                                      \
     (&((_r)->sring->ring[((_idx) & (RING_SIZE(_r) - 1))].req))
-- 
2.34.1


