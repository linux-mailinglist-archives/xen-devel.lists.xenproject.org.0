Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE052417D0
	for <lists+xen-devel@lfdr.de>; Tue, 11 Aug 2020 10:02:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5PEe-0003v7-5x; Tue, 11 Aug 2020 08:02:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L6lB=BV=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1k5PEc-0003tc-5m
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2020 08:02:14 +0000
X-Inumbo-ID: 53e06020-7d57-44ed-b070-05e1453e4c9f
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 53e06020-7d57-44ed-b070-05e1453e4c9f;
 Tue, 11 Aug 2020 08:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eSmprS1bsesB0cQvNRI38Z139gI/ZjEmaiUVzzjZXv4=; b=S5x8KVbrxbU9txM7PfsxBvEg8M
 DtAJMTFQUnLErPOfvE3R48IX7bhErJxl2xNZGUF1cHx86gsUajNc91q7eoxOkfKJxD4LvRXD0zK9W
 DCitwEVJzOreK/ov6feZIwaKrt6nbBH51/ag+nF66bJEEny1RUMCC596PW+GCRBi/Rts=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k5PEX-0003un-6K; Tue, 11 Aug 2020 08:02:09 +0000
Received: from host86-143-223-30.range86-143.btcentralplus.com
 ([86.143.223.30] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k5PEW-0000k5-Ul; Tue, 11 Aug 2020 08:02:09 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v3 3/8] tools/hotplug/Linux: add remove_from_bridge()
Date: Tue, 11 Aug 2020 09:01:57 +0100
Message-Id: <20200811080202.31163-4-paul@xen.org>
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

This patch adds a remove_from_bridge() function into xen-network-common.sh
to partner with the existing add_to_bridge() function. The vif-bridge
script is then modified to use it.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Wei Liu <wl@xen.org>

v3:
 - Re-factored from "tools/hotplug: add remove_from_bridge() and improve
   debug output" and "tools/hotplug: combine add/online and remove/offline
   in vif-bridge..." in v2
---
 tools/hotplug/Linux/vif-bridge            |  7 +------
 tools/hotplug/Linux/xen-network-common.sh | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/tools/hotplug/Linux/vif-bridge b/tools/hotplug/Linux/vif-bridge
index e722090ca8..c3e409926d 100644
--- a/tools/hotplug/Linux/vif-bridge
+++ b/tools/hotplug/Linux/vif-bridge
@@ -84,12 +84,7 @@ case "$command" in
         ;;
 
     offline)
-        if which brctl >&/dev/null; then
-            do_without_error brctl delif "$bridge" "$dev"
-        else
-            do_without_error ip link set "$dev" nomaster
-        fi
-        do_without_error ifconfig "$dev" down
+        remove_from_bridge "$bridge" "$dev"
         ;;
 
     add)
diff --git a/tools/hotplug/Linux/xen-network-common.sh b/tools/hotplug/Linux/xen-network-common.sh
index ec3bd4ec4a..6a0904361f 100644
--- a/tools/hotplug/Linux/xen-network-common.sh
+++ b/tools/hotplug/Linux/xen-network-common.sh
@@ -141,6 +141,25 @@ add_to_bridge () {
     ip link set dev ${dev} up
 }
 
+remove_from_bridge () {
+    local bridge=$1
+    local dev=$2
+
+    do_without_error ip link set dev ${dev} down
+
+    # Don't remove $dev from $bridge if it's not on the bridge.
+    if [ -e "/sys/class/net/${bridge}/brif/${dev}" ]; then
+        log debug "removing $dev from bridge $bridge"
+        if which brctl >&/dev/null; then
+            do_without_error brctl delif ${bridge} ${dev}
+        else
+            do_without_error ip link set ${dev} nomaster
+        fi
+    else
+        log debug "$dev not on bridge $bridge"
+    fi
+}
+
 # Usage: set_mtu bridge dev
 set_mtu () {
     local bridge=$1
-- 
2.20.1


