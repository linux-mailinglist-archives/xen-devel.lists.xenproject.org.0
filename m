Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 101674C9640
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 21:20:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281774.480257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP8yw-0003NS-6l; Tue, 01 Mar 2022 20:20:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281774.480257; Tue, 01 Mar 2022 20:20:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP8yw-0003Lc-3e; Tue, 01 Mar 2022 20:20:26 +0000
Received: by outflank-mailman (input) for mailman id 281774;
 Tue, 01 Mar 2022 20:20:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5KN6=TM=kernel.org=sashal@srs-se1.protection.inumbo.net>)
 id 1nP8yu-0002IQ-Jx
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 20:20:24 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0632fe39-999d-11ec-8539-5f4723681683;
 Tue, 01 Mar 2022 21:20:23 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 40D85B81D46;
 Tue,  1 Mar 2022 20:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A31AFC340F5;
 Tue,  1 Mar 2022 20:20:18 +0000 (UTC)
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
X-Inumbo-ID: 0632fe39-999d-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646166021;
	bh=Wi+OIq1ClSsfZD7h1ZbTDCrIa5Mqda+wcBv7b7g77bI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kgxYo73PO8Ze9qgfeSOCjUgy81g0+DVhIbxosiV5i5kwWwNkSyl+xEeSaSr6jiS4V
	 v06NWaW8H6llUU85wmjlmh0xQVFgabU2pnqJYZoZzvXDBZVnHq9lRVQaaA1TQ5Foxq
	 T2kLaxd0LPjDs71KDi/zOSr+gNYAuumLmmEZSic9TurSvcAgP5BrhaVSXgBGv0ZSBv
	 fAdcUsQncq9MzfCNTr6WpkFhfvfQ2PwQieQtH0g712j4PSKG4IYFFCuZ9dk3uWKzh0
	 8UvIZllb6jgv6RAiBYLNyU6T+fsuORs8WD1qkj6B+eWoICEEGyHQJQk1/x6i4aSJZ3
	 fhOLcaTsbvy/g==
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
Subject: [PATCH AUTOSEL 5.4 06/11] Revert "xen-netback: remove 'hotplug-status' once it has served its purpose"
Date: Tue,  1 Mar 2022 15:19:39 -0500
Message-Id: <20220301201951.19066-6-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220301201951.19066-1-sashal@kernel.org>
References: <20220301201951.19066-1-sashal@kernel.org>
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
index 416305e6d0932..0fe0fbd83ce4a 100644
--- a/drivers/net/xen-netback/xenbus.c
+++ b/drivers/net/xen-netback/xenbus.c
@@ -435,6 +435,7 @@ static void backend_disconnect(struct backend_info *be)
 		unsigned int queue_index;
 
 		xen_unregister_watchers(vif);
+		xenbus_rm(XBT_NIL, be->dev->nodename, "hotplug-status");
 #ifdef CONFIG_DEBUG_FS
 		xenvif_debugfs_delif(vif);
 #endif /* CONFIG_DEBUG_FS */
-- 
2.34.1


