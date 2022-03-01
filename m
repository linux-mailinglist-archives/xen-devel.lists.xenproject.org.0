Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A058E4C96D9
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 21:26:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281811.480313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP94Y-0006eT-RX; Tue, 01 Mar 2022 20:26:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281811.480313; Tue, 01 Mar 2022 20:26:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP94Y-0006bb-NY; Tue, 01 Mar 2022 20:26:14 +0000
Received: by outflank-mailman (input) for mailman id 281811;
 Tue, 01 Mar 2022 20:26:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5KN6=TM=kernel.org=sashal@srs-se1.protection.inumbo.net>)
 id 1nP8zi-0002IQ-6K
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 20:21:14 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 234fcbdb-999d-11ec-8539-5f4723681683;
 Tue, 01 Mar 2022 21:21:13 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EC85260C1B;
 Tue,  1 Mar 2022 20:21:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C7C9C340F1;
 Tue,  1 Mar 2022 20:21:08 +0000 (UTC)
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
X-Inumbo-ID: 234fcbdb-999d-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646166071;
	bh=RvXug01H9kluAEqabwUZGjwgNYTE/wBoZUtVrQZmwb0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pd2p17hyUgQUU8QgN9hPriWSLOlFECl0x2q1QPw6jCtHIl6QkOS93cUHecaz9knO1
	 Z4sVFWwam78nkZAtUOx8LMY7RYKs3yqO4hS8Ue6pzZnrjZEwfuvDkLO92eCAm32bzM
	 k+mNS5ehK8gvKeh5kj+SkZFDS/OfXKU6376Uqmcteo4+4yDkacFv5IV7Xu+sOuU6KJ
	 K7qkomWjjXA9nDVn1pY4DwWCjyOuZt/qPpd5rapMMsyHIT9BALyeODRW+sBN4rK57/
	 n2onTDHJFuFvAmYG5H0ItQZ8U0ixVAx4LyiJpk3lv/n4eLoKhmPp4GAqAQxGmcNwYy
	 AliO66PVrC0qQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Paul Durrant <paul@xen.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	wei.liu@kernel.org,
	davem@davemloft.net,
	xen-devel@lists.xenproject.org,
	netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 4/7] Revert "xen-netback: remove 'hotplug-status' once it has served its purpose"
Date: Tue,  1 Mar 2022 15:20:42 -0500
Message-Id: <20220301202046.19220-4-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220301202046.19220-1-sashal@kernel.org>
References: <20220301202046.19220-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

[ Upstream commit 0f4558ae91870692ce7f509c31c9d6ee721d8cdc ]

This reverts commit 1f2565780e9b7218cf92c7630130e82dcc0fe9c2.

The 'hotplug-status' node should not be removed as long as the vif
device remains configured. Otherwise the xen-netback would wait for
re-running the network script even if it was already called (in case of
the frontent re-connecting). But also, it _should_ be removed when the
vif device is destroyed (for example when unbinding the driver) -
otherwise hotplug script would not configure the device whenever it
re-appear.

Moving removal of the 'hotplug-status' node was a workaround for nothing
calling network script after xen-netback module is reloaded. But when
vif interface is re-created (on xen-netback unbind/bind for example),
the script should be called, regardless of who does that - currently
this case is not handled by the toolstack, and requires manual
script call. Keeping hotplug-status=connected to skip the call is wrong
and leads to not configured interface.

More discussion at
https://lore.kernel.org/xen-devel/afedd7cb-a291-e773-8b0d-4db9b291fa98@ipxe.org/T/#u

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reviewed-by: Paul Durrant <paul@xen.org>
Link: https://lore.kernel.org/r/20220222001817.2264967-1-marmarek@invisiblethingslab.com
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/xen-netback/xenbus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/xen-netback/xenbus.c b/drivers/net/xen-netback/xenbus.c
index 78c56149559ce..6b678ab0a31f7 100644
--- a/drivers/net/xen-netback/xenbus.c
+++ b/drivers/net/xen-netback/xenbus.c
@@ -499,6 +499,7 @@ static void backend_disconnect(struct backend_info *be)
 		unsigned int queue_index;
 
 		xen_unregister_watchers(vif);
+		xenbus_rm(XBT_NIL, be->dev->nodename, "hotplug-status");
 #ifdef CONFIG_DEBUG_FS
 		xenvif_debugfs_delif(vif);
 #endif /* CONFIG_DEBUG_FS */
-- 
2.34.1


