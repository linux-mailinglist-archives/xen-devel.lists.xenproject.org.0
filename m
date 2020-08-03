Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7269923A69E
	for <lists+xen-devel@lfdr.de>; Mon,  3 Aug 2020 14:49:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2ZuQ-0001oi-9B; Mon, 03 Aug 2020 12:49:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rQjY=BN=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1k2ZuO-0001oY-Mk
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 12:49:40 +0000
X-Inumbo-ID: cb1d6432-d587-11ea-af2b-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cb1d6432-d587-11ea-af2b-12813bfff9fa;
 Mon, 03 Aug 2020 12:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TpRalkvkG38JtEdNhqPS3RNesiK5+8RoUBFVAeIBPhI=; b=HcGqnvkm6tlHw+zgLd1/kNuEYB
 SI5YhlrENiOZLAl0wm0EdzhX20S1VZ6gneUaKlARLRWqKGPwR+O1EyytYJsk7B4B/k72q6HWW4Kwl
 p4ziJymIfIxP8eBjRnxqLZgmRsjlPmUeAIgof9xUH1woX0+s4wTwoGCsa+8ouZR9STsQ=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k2ZuN-0000xA-0f; Mon, 03 Aug 2020 12:49:39 +0000
Received: from host86-143-223-30.range86-143.btcentralplus.com
 ([86.143.223.30] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k2ZuM-0002Mv-PT; Mon, 03 Aug 2020 12:49:38 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 4/4] tools/hotplug: modify set_mtu() to inform the frontend
 via xenstore
Date: Mon,  3 Aug 2020 13:49:31 +0100
Message-Id: <20200803124931.2678-5-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200803124931.2678-1-paul@xen.org>
References: <20200803124931.2678-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Paul Durrant <pdurrant@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

set_mtu() currently sets the backend vif MTU but does not inform the frontend
what it is. This patch adds code to write the MTU into a xenstore node. See
netif.h for a specification of the node.

NOTE: There is also a small modification replacing '$mtu' with '${mtu}'
      for style consistency.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Wei Liu <wl@xen.org>
---
 tools/hotplug/Linux/vif-bridge            |  2 +-
 tools/hotplug/Linux/xen-network-common.sh | 14 +++++++++++++-
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/tools/hotplug/Linux/vif-bridge b/tools/hotplug/Linux/vif-bridge
index e1d7c49788..b99cc82a21 100644
--- a/tools/hotplug/Linux/vif-bridge
+++ b/tools/hotplug/Linux/vif-bridge
@@ -81,7 +81,7 @@ case "$command" in
         ;&
     online)
         setup_virtual_bridge_port "$dev"
-        set_mtu "$bridge" "$dev"
+        set_mtu "$bridge" "$dev" "$type_if"
         add_to_bridge "$bridge" "$dev"
         ;;
     remove)
diff --git a/tools/hotplug/Linux/xen-network-common.sh b/tools/hotplug/Linux/xen-network-common.sh
index 37e71cfa9c..24fc42d9cf 100644
--- a/tools/hotplug/Linux/xen-network-common.sh
+++ b/tools/hotplug/Linux/xen-network-common.sh
@@ -164,9 +164,21 @@ remove_from_bridge () {
 set_mtu () {
     local bridge=$1
     local dev=$2
+    local type_if=$3
+
     mtu="`ip link show dev ${bridge}| awk '/mtu/ { print $5 }'`"
     if [ -n "$mtu" ] && [ "$mtu" -gt 0 ]
     then
-            ip link set dev ${dev} mtu $mtu || :
+            ip link set dev ${dev} mtu ${mtu} || :
+    fi
+
+    if [ ${type_if} = vif ]
+    then
+       dev_=${dev#vif}
+       domid=${dev_%.*}
+       devid=${dev_#*.}
+
+       XENBUS_PATH="/local/domain/$domid/device/vif/$devid"
+       xenstore_write "$XENBUS_PATH/mtu" ${mtu}
     fi
 }
-- 
2.20.1


