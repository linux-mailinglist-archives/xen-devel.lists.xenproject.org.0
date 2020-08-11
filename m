Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1342417D4
	for <lists+xen-devel@lfdr.de>; Tue, 11 Aug 2020 10:02:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5PEm-0003z2-5H; Tue, 11 Aug 2020 08:02:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L6lB=BV=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1k5PEk-0003tU-GV
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2020 08:02:22 +0000
X-Inumbo-ID: 7bbe9025-e812-45b0-b51a-67c5798dabd1
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7bbe9025-e812-45b0-b51a-67c5798dabd1;
 Tue, 11 Aug 2020 08:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eU2vamnIGUwArjo4gv27KRnIl7mjwar3lCX+4HlpkTs=; b=IHHTk0PSAlI3aK6j7O/v1M0f7T
 Qrd8nAFXETWG5HZmCtUN9iHr1iZM4lF/1rHhcxdLcl47BKekJzk2PuqfBEVDrDVhnTsKrj63QfQec
 Oqu3ZcrRVXjDHZl3Jd6UXxq9ySUtQOf0gwRis6Q3onGZKr+T5lmlj/f1Ys45ZwN2w0fI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k5PEa-0003vY-0Z; Tue, 11 Aug 2020 08:02:12 +0000
Received: from host86-143-223-30.range86-143.btcentralplus.com
 ([86.143.223.30] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k5PEZ-0000k5-OL; Tue, 11 Aug 2020 08:02:11 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v3 6/8] tools/hotplug/Linux: modify set_mtu() to optionally
 use a configured value...
Date: Tue, 11 Aug 2020 09:02:00 +0100
Message-Id: <20200811080202.31163-7-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200811080202.31163-1-paul@xen.org>
References: <20200811080202.31163-1-paul@xen.org>
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

...and also inform the frontend.

The set_mtu() function in xen-network-common.sh currently sets the backend
vif MTU to match that of the bridge.

A prior patch added code into libxl such that a tools-configured 'mtu' value
may be present in the xenstore backend area. If the node is present in
xenstore then it should be authoritative. Hence set_mtu() is modified to only
read the MTU of the bridge if it is not present.

The function is also modified to write whatever value it applies to the
backend vif into the xenstore frontend area where is may then be used to
configure the frontend network stack.

NOTE: There is also a small modification replacing '$mtu' with '${mtu}'
      for style consistency.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Wei Liu <wl@xen.org>

v3:
 - Re-factored from "tools/hotplug: modify set_mtu() to inform the frontend
   via xenstore" in v2
---
 tools/hotplug/Linux/vif-bridge            |  2 +-
 tools/hotplug/Linux/xen-network-common.sh | 28 +++++++++++++++++++++--
 2 files changed, 27 insertions(+), 3 deletions(-)

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
index 6a0904361f..82ee70aab4 100644
--- a/tools/hotplug/Linux/xen-network-common.sh
+++ b/tools/hotplug/Linux/xen-network-common.sh
@@ -164,9 +164,33 @@ remove_from_bridge () {
 set_mtu () {
     local bridge=$1
     local dev=$2
-    mtu="`ip link show dev ${bridge}| awk '/mtu/ { print $5 }'`"
+    local type_if=$3
+
+    XENBUS_PATH="${XENBUS_PATH:?}"
+
+    local mtu=$(xenstore_read_default "$XENBUS_PATH/mtu" "")
+    if [ -z "$mtu" ]
+    then
+        mtu="`ip link show dev ${bridge}| awk '/mtu/ { print $5 }'`"
+        if [ -n "$mtu" ]
+        then
+            log debug "$bridge MTU is $mtu"
+        fi
+    fi
     if [ -n "$mtu" ] && [ "$mtu" -gt 0 ]
     then
-            ip link set dev ${dev} mtu $mtu || :
+        log debug "setting $dev MTU to $mtu"
+        ip link set dev ${dev} mtu ${mtu} || :
+
+        if [ ${type_if} = vif ]
+        then
+            local dev_=${dev#vif}
+            local domid=${dev_%.*}
+            local devid=${dev_#*.}
+
+            local FRONTEND_PATH="/local/domain/$domid/device/vif/$devid"
+
+            xenstore_write "$FRONTEND_PATH/mtu" ${mtu}
+        fi
     fi
 }
-- 
2.20.1


