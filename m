Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4586423394B
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 21:49:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1EYD-0003t9-T9; Thu, 30 Jul 2020 19:49:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B5Vg=BJ=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1k1EYC-0003p9-39
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 19:49:12 +0000
X-Inumbo-ID: b84e38bf-d29d-11ea-8dc5-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b84e38bf-d29d-11ea-8dc5-bc764e2007e4;
 Thu, 30 Jul 2020 19:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TpRalkvkG38JtEdNhqPS3RNesiK5+8RoUBFVAeIBPhI=; b=WxT0hE7RoSokynNV8k06V/6cIF
 S9AOZWhblGoHd0merPmft9QPFy+61K5AEobk0g62atYnIFOBmhuWDaKghbpAWAsDxsmfUkCvLBhVw
 yI/yopP+8i7mzveNfASh1hdVRPFI9Wk76GZspJrgeCe74/W/u9Z07YMDel06MBn3onCA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k1EY4-0001L6-2O; Thu, 30 Jul 2020 19:49:04 +0000
Received: from host86-143-223-30.range86-143.btcentralplus.com
 ([86.143.223.30] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k1EY3-0004CS-Qi; Thu, 30 Jul 2020 19:49:04 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 4/4] tools/hotplug: modify set_mtu() to inform the frontend
 via xenstore
Date: Thu, 30 Jul 2020 20:48:58 +0100
Message-Id: <20200730194858.28523-5-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200730194858.28523-1-paul@xen.org>
References: <20200730194858.28523-1-paul@xen.org>
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


