Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC41523394A
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 21:49:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1EYB-0003rq-K5; Thu, 30 Jul 2020 19:49:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B5Vg=BJ=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1k1EY9-0003pM-PR
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 19:49:09 +0000
X-Inumbo-ID: b7d6e534-d29d-11ea-ab18-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b7d6e534-d29d-11ea-ab18-12813bfff9fa;
 Thu, 30 Jul 2020 19:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fEecjANlWh3hBTz/ieGtixPqvrZoBJyua6jWfk3Vf10=; b=G5Qsw7KVQaPGTbUXp7+U+YIsx1
 icyS+WhS4A2kpWgA4LgOE29z4wLfrYOYNjehteBqZridgptx9qrXC5I2caHh7i88uZRfiAUdH7iJm
 bwY7HtldogY8HtDfNy8jLXwkVOcwvSwxR0ee6PiLh4UBr8RdPRNcR9Wtii8NPZMgZ/co=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k1EY1-0001Kr-Vg; Thu, 30 Jul 2020 19:49:01 +0000
Received: from host86-143-223-30.range86-143.btcentralplus.com
 ([86.143.223.30] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k1EY1-0004CS-Mi; Thu, 30 Jul 2020 19:49:01 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 1/4] tools/hotplug: add remove_from_bridge() and improve debug
 output
Date: Thu, 30 Jul 2020 20:48:55 +0100
Message-Id: <20200730194858.28523-2-paul@xen.org>
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

This patch adds a remove_from_bridge() function into xen-network-common.sh
to partner with the existing add_to_bridge() function. The code in
add_to_bridge() is also slightly re-arranged to avoid duplication calls of
'ip link'.

Both add_to_bridge() and remove_from_bridge() will check if their bridge
manipulation operations are necessary and emit a log message if they are not.

NOTE: A call to remove_from_bridge() will be added by a subsequent patch.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Wei Liu <wl@xen.org>
---
 tools/hotplug/Linux/xen-network-common.sh | 37 ++++++++++++++++++-----
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/tools/hotplug/Linux/xen-network-common.sh b/tools/hotplug/Linux/xen-network-common.sh
index 8dd3a62068..37e71cfa9c 100644
--- a/tools/hotplug/Linux/xen-network-common.sh
+++ b/tools/hotplug/Linux/xen-network-common.sh
@@ -126,19 +126,40 @@ add_to_bridge () {
     local bridge=$1
     local dev=$2
 
-    # Don't add $dev to $bridge if it's already on a bridge.
-    if [ -e "/sys/class/net/${bridge}/brif/${dev}" ]; then
-	ip link set dev ${dev} up || true
-	return
-    fi
-    if which brctl >&/dev/null; then
-        brctl addif ${bridge} ${dev}
+    # Don't add $dev to $bridge if it's already on the bridge.
+    if [ ! -e "/sys/class/net/${bridge}/brif/${dev}" ]; then
+	log debug "adding $dev to bridge $bridge"
+	if which brctl >&/dev/null; then
+            brctl addif ${bridge} ${dev}
+	else
+            ip link set ${dev} master ${bridge}
+	fi
     else
-        ip link set ${dev} master ${bridge}
+	log debug "$dev already on bridge $bridge"
     fi
+
     ip link set dev ${dev} up
 }
 
+remove_from_bridge () {
+    local bridge=$1
+    local dev=$2
+
+    ip link set dev ${dev} down || :
+
+    # Don't remove $dev from $bridge if it's not on the bridge.
+    if [ -e "/sys/class/net/${bridge}/brif/${dev}" ]; then
+	log debug "removing $dev from bridge $bridge"
+	if which brctl >&/dev/null; then
+            brctl delif ${bridge} ${dev}
+	else
+            ip link set ${dev} nomaster
+	fi
+    else
+	log debug "$dev not on bridge $bridge"
+    fi
+}
+
 # Usage: set_mtu bridge dev
 set_mtu () {
     local bridge=$1
-- 
2.20.1


