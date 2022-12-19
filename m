Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D488E650EB8
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 16:37:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466224.725089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7ICj-0007k6-4r; Mon, 19 Dec 2022 15:37:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466224.725089; Mon, 19 Dec 2022 15:37:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7ICj-0007hW-29; Mon, 19 Dec 2022 15:37:25 +0000
Received: by outflank-mailman (input) for mailman id 466224;
 Mon, 19 Dec 2022 15:37:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnvL=4R=amazon.com=prvs=345b60ec5=ptyadav@srs-se1.protection.inumbo.net>)
 id 1p7ICh-0007hQ-B9
 for xen-devel@lists.xenproject.org; Mon, 19 Dec 2022 15:37:23 +0000
Received: from smtp-fw-6001.amazon.com (smtp-fw-6001.amazon.com [52.95.48.154])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06c38a81-7fb3-11ed-8fd4-01056ac49cbb;
 Mon, 19 Dec 2022 16:37:22 +0100 (CET)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2b-m6i4x-0ec33b60.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-6001.iad6.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2022 15:37:16 +0000
Received: from EX13D31EUA004.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-pdx-2b-m6i4x-0ec33b60.us-west-2.amazon.com (Postfix)
 with ESMTPS id 3DFD6A2BBC; Mon, 19 Dec 2022 15:37:15 +0000 (UTC)
Received: from EX19D008EUA004.ant.amazon.com (10.252.50.158) by
 EX13D31EUA004.ant.amazon.com (10.43.165.161) with Microsoft SMTP Server (TLS)
 id 15.0.1497.42; Mon, 19 Dec 2022 15:37:14 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX19D008EUA004.ant.amazon.com (10.252.50.158) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1118.20;
 Mon, 19 Dec 2022 15:37:13 +0000
Received: from dev-dsk-ptyadav-1c-37607b33.eu-west-1.amazon.com (10.15.11.255)
 by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1497.42 via Frontend Transport; Mon, 19 Dec 2022 15:37:12 +0000
Received: by dev-dsk-ptyadav-1c-37607b33.eu-west-1.amazon.com (Postfix,
 from userid 23027615)
 id A716920D70; Mon, 19 Dec 2022 16:37:11 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 06c38a81-7fb3-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1671464242; x=1703000242;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9p+mxbd5kh6SOfLyESUFNEms88GQjCAKJPms8yWVsvk=;
  b=M+kHiWP0gtF7w4GQfFUWZ8fcdje43sTRzeeIFWcMwscaKG9ZRLFv3Lcu
   RXy3aOfqCQl2Pr3SIwqZONBklRlsxgVwCPr2ByZPf7GROAfXJW/2LWnO2
   Wgr7IO0svXfvRu+f02JwM7ipOuOpQxY+Ih6J23m9nfgVblclozc08kHnt
   E=;
X-IronPort-AV: E=Sophos;i="5.96,255,1665446400"; 
   d="scan'208";a="280451857"
From: Pratyush Yadav <ptyadav@amazon.de>
To: <stable@vger.kernel.org>
CC: Pratyush Yadav <ptyadav@amazon.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Wei Liu <wei.liu@kernel.org>, Paul Durrant
	<paul@xen.org>, "David S. Miller" <davem@davemloft.net>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Jakub Kicinski <kuba@kernel.org>, "Sasha
 Levin" <sashal@kernel.org>, Puranjay Mohan <pjy@amazon.de>, Maximilian Heyne
	<mheyne@amazon.de>, Julien Grall <julien@xen.org>,
	<xen-devel@lists.xenproject.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 5.4] xen-netback: move removal of "hotplug-status" to the right place
Date: Mon, 19 Dec 2022 16:37:10 +0100
Message-ID: <20221219153710.23782-1-ptyadav@amazon.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: Bulk

The removal of "hotplug-status" has moved around a bit. First it was
moved from netback_remove() to hotplug_status_changed() in upstream
commit 1f2565780e9b ("xen-netback: remove 'hotplug-status' once it has
served its purpose"). Then the change was reverted in upstream commit
0f4558ae9187 ("Revert "xen-netback: remove 'hotplug-status' once it has
served its purpose""), but it moved the removal to backend_disconnect().
Then the upstream commit c55f34b6aec2 ("xen-netback: only remove
'hotplug-status' when the vif is actually destroyed") moved it finally
back to netback_remove(). The thing to note being it is removed
unconditionally this time around.

The story on v5.4.y adds to this confusion. Commit 60e4e3198ce8 ("Revert
"xen-netback: remove 'hotplug-status' once it has served its purpose"")
is backported to v5.4.y but the original commit that it tries to revert
was never present on 5.4. So the backport incorrectly ends up just
adding another xenbus_rm() of "hotplug-status" in backend_disconnect().

Now in v5.4.y it is removed in both backend_disconnect() and
netback_remove(). But it should only be removed in netback_remove(), as
the upstream version does.

Removing "hotplug-status" in backend_disconnect() causes problems when
the frontend unilaterally disconnects, as explained in
c55f34b6aec2 ("xen-netback: only remove 'hotplug-status' when the vif is
actually destroyed").

Remove "hotplug-status" in the same place as it is done on the upstream
version to ensure unilateral re-connection of frontend continues to
work.

Fixes: 60e4e3198ce8 ("Revert "xen-netback: remove 'hotplug-status' once it has served its purpose"")
Signed-off-by: Pratyush Yadav <ptyadav@amazon.de>
---
 drivers/net/xen-netback/xenbus.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/xen-netback/xenbus.c b/drivers/net/xen-netback/xenbus.c
index 44e353dd2ba1..43bd881ab3dd 100644
--- a/drivers/net/xen-netback/xenbus.c
+++ b/drivers/net/xen-netback/xenbus.c
@@ -202,10 +202,10 @@ static int netback_remove(struct xenbus_device *dev)
 	set_backend_state(be, XenbusStateClosed);

 	unregister_hotplug_status_watch(be);
+	xenbus_rm(XBT_NIL, dev->nodename, "hotplug-status");
 	if (be->vif) {
 		kobject_uevent(&dev->dev.kobj, KOBJ_OFFLINE);
 		xen_unregister_watchers(be->vif);
-		xenbus_rm(XBT_NIL, dev->nodename, "hotplug-status");
 		xenvif_free(be->vif);
 		be->vif = NULL;
 	}
@@ -435,7 +435,6 @@ static void backend_disconnect(struct backend_info *be)
 		unsigned int queue_index;

 		xen_unregister_watchers(vif);
-		xenbus_rm(XBT_NIL, be->dev->nodename, "hotplug-status");
 #ifdef CONFIG_DEBUG_FS
 		xenvif_debugfs_delif(vif);
 #endif /* CONFIG_DEBUG_FS */
--
2.38.1


