Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B2630B85C
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 08:10:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80368.146994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6pom-0008Ex-Ey; Tue, 02 Feb 2021 07:09:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80368.146994; Tue, 02 Feb 2021 07:09:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6pom-0008EY-BL; Tue, 02 Feb 2021 07:09:44 +0000
Received: by outflank-mailman (input) for mailman id 80368;
 Tue, 02 Feb 2021 07:09:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OBIp=HE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l6pok-0008EL-Ro
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 07:09:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4fcbd9d4-3e3a-4c79-9329-a3a3f6d62f12;
 Tue, 02 Feb 2021 07:09:42 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 46D2EACB7;
 Tue,  2 Feb 2021 07:09:41 +0000 (UTC)
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
X-Inumbo-ID: 4fcbd9d4-3e3a-4c79-9329-a3a3f6d62f12
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612249781; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=1tpaqvOitmoTdUOKCltTkXQMrQMduhfR/V/K0TJ91jk=;
	b=pbaIptIDBcZvfobat6HNoXje6mR3kf8+MuWpibPjXaHBmoQvt3LBZ1S4k+WfN+6v3yXqqG
	CnLh7G8uXWy5d/2yQhTslehE4QmbeheYR1UmRM7pfxMgd1ZiuvafUH6s9i4k7bnpbVZHHm
	wGiaWxu3itzFTHNe0z01xg0UqKte3eQ=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wei.liu@kernel.org>,
	Paul Durrant <paul@xen.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Igor Druzhinin <igor.druzhinin@citrix.com>,
	stable@vger.kernel.org
Subject: [PATCH] xen/netback: avoid race in xenvif_rx_ring_slots_available()
Date: Tue,  2 Feb 2021 08:09:38 +0100
Message-Id: <20210202070938.7863-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 23025393dbeb3b8b3 ("xen/netback: use lateeoi irq binding")
xenvif_rx_ring_slots_available() is no longer called only from the rx
queue kernel thread, so it needs to access the rx queue with the
associated queue held.

Reported-by: Igor Druzhinin <igor.druzhinin@citrix.com>
Fixes: 23025393dbeb3b8b3 ("xen/netback: use lateeoi irq binding")
Cc: stable@vger.kernel.org
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/net/xen-netback/rx.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/xen-netback/rx.c b/drivers/net/xen-netback/rx.c
index b8febe1d1bfd..accc991d153f 100644
--- a/drivers/net/xen-netback/rx.c
+++ b/drivers/net/xen-netback/rx.c
@@ -38,10 +38,15 @@ static bool xenvif_rx_ring_slots_available(struct xenvif_queue *queue)
 	RING_IDX prod, cons;
 	struct sk_buff *skb;
 	int needed;
+	unsigned long flags;
+
+	spin_lock_irqsave(&queue->rx_queue.lock, flags);
 
 	skb = skb_peek(&queue->rx_queue);
-	if (!skb)
+	if (!skb) {
+		spin_unlock_irqrestore(&queue->rx_queue.lock, flags);
 		return false;
+	}
 
 	needed = DIV_ROUND_UP(skb->len, XEN_PAGE_SIZE);
 	if (skb_is_gso(skb))
@@ -49,6 +54,8 @@ static bool xenvif_rx_ring_slots_available(struct xenvif_queue *queue)
 	if (skb->sw_hash)
 		needed++;
 
+	spin_unlock_irqrestore(&queue->rx_queue.lock, flags);
+
 	do {
 		prod = queue->rx.sring->req_prod;
 		cons = queue->rx.req_cons;
-- 
2.26.2


