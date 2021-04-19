Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCB3364B87
	for <lists+xen-devel@lfdr.de>; Mon, 19 Apr 2021 22:46:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113184.215681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYamH-0002kA-WC; Mon, 19 Apr 2021 20:45:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113184.215681; Mon, 19 Apr 2021 20:45:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYamH-0002jo-Sy; Mon, 19 Apr 2021 20:45:53 +0000
Received: by outflank-mailman (input) for mailman id 113184;
 Mon, 19 Apr 2021 20:45:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rQOg=JQ=kernel.org=sashal@srs-us1.protection.inumbo.net>)
 id 1lYamG-0002ix-9W
 for xen-devel@lists.xenproject.org; Mon, 19 Apr 2021 20:45:52 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 77a93e31-99ba-441c-a5cc-b12d0767a4e0;
 Mon, 19 Apr 2021 20:45:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BE3A1613E0;
 Mon, 19 Apr 2021 20:45:45 +0000 (UTC)
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
X-Inumbo-ID: 77a93e31-99ba-441c-a5cc-b12d0767a4e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1618865146;
	bh=g2eIx8Az/Bb0zYkng6cw8qgVnkYdIcpHR3F4HJvjseM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HVHoUgIOgeMzoFRTP7nT9R0wGfeCVoxdQeItsOJAtZNHYbIi7xlNA/FHrmNfRVWUi
	 HjLV4f6uvuMS+IklEY9DjbuaKyiLNiC3d9uDaJ3gHGGV6aeJIqN/mtDCviDYlyugKE
	 opcJiU75hDfOa6jS3lCXRD0/Qkw9uAWteFEA65Re1BYQdT7GbRfTtHK7unZ6gCeEj6
	 kkrDg9j9LIpbP9Gct3goLjAsWkrIm1kIyAkkxvV0D9usPJ6n8VwtRsu5HI6jbduWrI
	 Q7cb2ysVBSJrnU0N9HtBi65D6KscDDxu2Sb7GCX8LgInfIBYveehqUnv8bejxvMcnH
	 dwIjtz323nCCg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Michael Brown <mbrown@fensystems.co.uk>,
	Paul Durrant <paul@xen.org>,
	"David S . Miller" <davem@davemloft.net>,
	Sasha Levin <sashal@kernel.org>,
	xen-devel@lists.xenproject.org,
	netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 06/11] xen-netback: Check for hotplug-status existence before watching
Date: Mon, 19 Apr 2021 16:45:31 -0400
Message-Id: <20210419204536.6924-6-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210419204536.6924-1-sashal@kernel.org>
References: <20210419204536.6924-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Michael Brown <mbrown@fensystems.co.uk>

[ Upstream commit 2afeec08ab5c86ae21952151f726bfe184f6b23d ]

The logic in connect() is currently written with the assumption that
xenbus_watch_pathfmt() will return an error for a node that does not
exist.  This assumption is incorrect: xenstore does allow a watch to
be registered for a nonexistent node (and will send notifications
should the node be subsequently created).

As of commit 1f2565780 ("xen-netback: remove 'hotplug-status' once it
has served its purpose"), this leads to a failure when a domU
transitions into XenbusStateConnected more than once.  On the first
domU transition into Connected state, the "hotplug-status" node will
be deleted by the hotplug_status_changed() callback in dom0.  On the
second or subsequent domU transition into Connected state, the
hotplug_status_changed() callback will therefore never be invoked, and
so the backend will remain stuck in InitWait.

This failure prevents scenarios such as reloading the xen-netfront
module within a domU, or booting a domU via iPXE.  There is
unfortunately no way for the domU to work around this dom0 bug.

Fix by explicitly checking for existence of the "hotplug-status" node,
thereby creating the behaviour that was previously assumed to exist.

Signed-off-by: Michael Brown <mbrown@fensystems.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/xen-netback/xenbus.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/net/xen-netback/xenbus.c b/drivers/net/xen-netback/xenbus.c
index 910322b442bd..9092b55e087f 100644
--- a/drivers/net/xen-netback/xenbus.c
+++ b/drivers/net/xen-netback/xenbus.c
@@ -1043,11 +1043,15 @@ static void connect(struct backend_info *be)
 	xenvif_carrier_on(be->vif);
 
 	unregister_hotplug_status_watch(be);
-	err = xenbus_watch_pathfmt(dev, &be->hotplug_status_watch, NULL,
-				   hotplug_status_changed,
-				   "%s/%s", dev->nodename, "hotplug-status");
-	if (!err)
+	if (xenbus_exists(XBT_NIL, dev->nodename, "hotplug-status")) {
+		err = xenbus_watch_pathfmt(dev, &be->hotplug_status_watch,
+					   NULL, hotplug_status_changed,
+					   "%s/%s", dev->nodename,
+					   "hotplug-status");
+		if (err)
+			goto err;
 		be->have_hotplug_status_watch = 1;
+	}
 
 	netif_tx_wake_all_queues(be->vif->dev);
 
-- 
2.30.2


