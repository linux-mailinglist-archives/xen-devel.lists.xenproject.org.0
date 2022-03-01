Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1C24C9647
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 21:20:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281775.480269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP8z1-0003gq-HA; Tue, 01 Mar 2022 20:20:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281775.480269; Tue, 01 Mar 2022 20:20:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP8z1-0003dr-D0; Tue, 01 Mar 2022 20:20:31 +0000
Received: by outflank-mailman (input) for mailman id 281775;
 Tue, 01 Mar 2022 20:20:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5KN6=TM=kernel.org=sashal@srs-se1.protection.inumbo.net>)
 id 1nP8yz-0002Zx-RX
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 20:20:29 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08ead2f9-999d-11ec-8eba-a37418f5ba1a;
 Tue, 01 Mar 2022 21:20:28 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AA9FA608C3;
 Tue,  1 Mar 2022 20:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31139C340EE;
 Tue,  1 Mar 2022 20:20:22 +0000 (UTC)
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
X-Inumbo-ID: 08ead2f9-999d-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646166027;
	bh=MqtP/Imy0BEHmQw5F9Yule8qbJc9LXHaH82WdVKlA3U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AV42EJSjOhTmeVKKhVLjdOnh8Slcmij3nIWpwPZ2NsS3J0XcTCBGZS0LP8+ifjUWg
	 nKWqoooqIK1UkYbLPqMfI8gv1hxqHvDmL34dHrv/m8Jenq7F74euyCI/qtHva5/T80
	 1qZgg4pOxhDilR2NtOifq4VhRRKws+b9pLznnkGjz627dCaT7QK2bMZy6crrexPI7L
	 0o3+OZccQ0+taKe38SItG6sE7qsCUcXnbwE0AwNr0hUOk7OAAyUMDBWf40X6t9wQT3
	 mm6EqIuL/1sg3JXsUdAcc1rLzG0JZPmKVuA3zf+qyG/ubqJgkLA6EAN9kCZ6FSuvM6
	 x4j/QFagaSsZA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Paul Durrant <paul@xen.org>,
	Michael Brown <mbrown@fensystems.co.uk>,
	Jakub Kicinski <kuba@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	wei.liu@kernel.org,
	davem@davemloft.net,
	xen-devel@lists.xenproject.org,
	netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 07/11] Revert "xen-netback: Check for hotplug-status existence before watching"
Date: Tue,  1 Mar 2022 15:19:40 -0500
Message-Id: <20220301201951.19066-7-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220301201951.19066-1-sashal@kernel.org>
References: <20220301201951.19066-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

[ Upstream commit e8240addd0a3919e0fd7436416afe9aa6429c484 ]

This reverts commit 2afeec08ab5c86ae21952151f726bfe184f6b23d.

The reasoning in the commit was wrong - the code expected to setup the
watch even if 'hotplug-status' didn't exist. In fact, it relied on the
watch being fired the first time - to check if maybe 'hotplug-status' is
already set to 'connected'. Not registering a watch for non-existing
path (which is the case if hotplug script hasn't been executed yet),
made the backend not waiting for the hotplug script to execute. This in
turns, made the netfront think the interface is fully operational, while
in fact it was not (the vif interface on xen-netback side might not be
configured yet).

This was a workaround for 'hotplug-status' erroneously being removed.
But since that is reverted now, the workaround is not necessary either.

More discussion at
https://lore.kernel.org/xen-devel/afedd7cb-a291-e773-8b0d-4db9b291fa98@ipxe.org/T/#u

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reviewed-by: Paul Durrant <paul@xen.org>
Reviewed-by: Michael Brown <mbrown@fensystems.co.uk>
Link: https://lore.kernel.org/r/20220222001817.2264967-2-marmarek@invisiblethingslab.com
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/xen-netback/xenbus.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/net/xen-netback/xenbus.c b/drivers/net/xen-netback/xenbus.c
index 0fe0fbd83ce4a..44e353dd2ba19 100644
--- a/drivers/net/xen-netback/xenbus.c
+++ b/drivers/net/xen-netback/xenbus.c
@@ -980,15 +980,11 @@ static void connect(struct backend_info *be)
 	xenvif_carrier_on(be->vif);
 
 	unregister_hotplug_status_watch(be);
-	if (xenbus_exists(XBT_NIL, dev->nodename, "hotplug-status")) {
-		err = xenbus_watch_pathfmt(dev, &be->hotplug_status_watch,
-					   NULL, hotplug_status_changed,
-					   "%s/%s", dev->nodename,
-					   "hotplug-status");
-		if (err)
-			goto err;
+	err = xenbus_watch_pathfmt(dev, &be->hotplug_status_watch, NULL,
+				   hotplug_status_changed,
+				   "%s/%s", dev->nodename, "hotplug-status");
+	if (!err)
 		be->have_hotplug_status_watch = 1;
-	}
 
 	netif_tx_wake_all_queues(be->vif->dev);
 
-- 
2.34.1


