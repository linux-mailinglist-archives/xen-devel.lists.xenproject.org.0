Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A629A364B94
	for <lists+xen-devel@lfdr.de>; Mon, 19 Apr 2021 22:46:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113187.215694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYamT-0002oh-Cr; Mon, 19 Apr 2021 20:46:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113187.215694; Mon, 19 Apr 2021 20:46:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYamT-0002o5-6S; Mon, 19 Apr 2021 20:46:05 +0000
Received: by outflank-mailman (input) for mailman id 113187;
 Mon, 19 Apr 2021 20:46:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rQOg=JQ=kernel.org=sashal@srs-us1.protection.inumbo.net>)
 id 1lYamR-0002nc-8H
 for xen-devel@lists.xenproject.org; Mon, 19 Apr 2021 20:46:03 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 19ef78b4-582f-4b26-92b6-cdb25fe2a616;
 Mon, 19 Apr 2021 20:46:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D70AC613BC;
 Mon, 19 Apr 2021 20:46:00 +0000 (UTC)
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
X-Inumbo-ID: 19ef78b4-582f-4b26-92b6-cdb25fe2a616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1618865161;
	bh=84fEXRoir9ZD96qpuD0HzoQzv/MQfRsgEFL6wgpLaVs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bovD9TbPz4fToghmomQ8kN8P2iR20mw7lUdwxCWVz3uMRga7LcjffHIVDy1+kWfH6
	 mTXuUOa8c/PJ2NfddB2moA1i1I/o9KC1ynwohPsM1z50EulRuU+QTPzUzF/8aMaYsj
	 NFf4XI550QfRmnlgVVFz33ICh04xuXCoxzfB9SOcpsq43U37ogbRiqHYeOjmqQGK/u
	 Jso9SgebJfKW6QnrzT8mu89ju0mYtPxRN7eoF2OuORy+AtcywXGsGc0AZszM2AQaKa
	 xhPW7CS2Vggab9ln7S4GdHyFdpzV7GpF/iZSxZwdVO3dNkNbwYzldyFIUcGxRW6is5
	 BWYEm/sRZlgtA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Michael Brown <mbrown@fensystems.co.uk>,
	Paul Durrant <paul@xen.org>,
	"David S . Miller" <davem@davemloft.net>,
	Sasha Levin <sashal@kernel.org>,
	xen-devel@lists.xenproject.org,
	netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 4/8] xen-netback: Check for hotplug-status existence before watching
Date: Mon, 19 Apr 2021 16:45:50 -0400
Message-Id: <20210419204554.7071-4-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210419204554.7071-1-sashal@kernel.org>
References: <20210419204554.7071-1-sashal@kernel.org>
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
index 78788402edd8..e6646c8a7bdb 100644
--- a/drivers/net/xen-netback/xenbus.c
+++ b/drivers/net/xen-netback/xenbus.c
@@ -1040,11 +1040,15 @@ static void connect(struct backend_info *be)
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


