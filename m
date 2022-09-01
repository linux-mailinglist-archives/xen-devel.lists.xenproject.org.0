Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB585A961A
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 13:56:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396537.636707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTinr-0006Uu-Py; Thu, 01 Sep 2022 11:56:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396537.636707; Thu, 01 Sep 2022 11:56:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTinr-0006SN-Mt; Thu, 01 Sep 2022 11:56:11 +0000
Received: by outflank-mailman (input) for mailman id 396537;
 Thu, 01 Sep 2022 11:56:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <pdurrant@amazon.com>) id 1oTinq-0006SH-7Y
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 11:56:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <pdurrant@amazon.com>)
 id 1oTinp-0002b8-IH; Thu, 01 Sep 2022 11:56:09 +0000
Received: from [54.239.6.185] (helo=debian.cbg12.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <pdurrant@amazon.com>)
 id 1oTinp-000695-79; Thu, 01 Sep 2022 11:56:09 +0000
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
From: Paul Durrant <pdurrant@amazon.com>
To: netdev@vger.kernel.org,
	xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Wei Liu <wei.liu@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH net] xen-netback: only remove 'hotplug-status' when the vif is actually destroyed
Date: Thu,  1 Sep 2022 12:55:54 +0100
Message-Id: <20220901115554.16996-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Removing 'hotplug-status' in backend_disconnected() means that it will be
removed even in the case that the frontend unilaterally disconnects (which
it is free to do at any time). The consequence of this is that, when the
frontend attempts to re-connect, the backend gets stuck in 'InitWait'
rather than moving straight to 'Connected' (which it can do because the
hotplug script has already run).
Instead, the 'hotplug-status' mode should be removed in netback_remove()
i.e. when the vif really is going away.

Fixes: 0f4558ae9187 ("Revert "xen-netback: remove 'hotplug-status' once it has served its purpose"")
Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Wei Liu <wei.liu@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: "Marek Marczykowski-Górecki" <marmarek@invisiblethingslab.com>
---
 drivers/net/xen-netback/xenbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/xen-netback/xenbus.c b/drivers/net/xen-netback/xenbus.c
index 990360d75cb6..e85b3c5d4acc 100644
--- a/drivers/net/xen-netback/xenbus.c
+++ b/drivers/net/xen-netback/xenbus.c
@@ -256,7 +256,6 @@ static void backend_disconnect(struct backend_info *be)
 		unsigned int queue_index;
 
 		xen_unregister_watchers(vif);
-		xenbus_rm(XBT_NIL, be->dev->nodename, "hotplug-status");
 #ifdef CONFIG_DEBUG_FS
 		xenvif_debugfs_delif(vif);
 #endif /* CONFIG_DEBUG_FS */
@@ -984,6 +983,7 @@ static int netback_remove(struct xenbus_device *dev)
 	struct backend_info *be = dev_get_drvdata(&dev->dev);
 
 	unregister_hotplug_status_watch(be);
+	xenbus_rm(XBT_NIL, dev->nodename, "hotplug-status");
 	if (be->vif) {
 		kobject_uevent(&dev->dev.kobj, KOBJ_OFFLINE);
 		backend_disconnect(be);
-- 
2.20.1


