Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2692417D2
	for <lists+xen-devel@lfdr.de>; Tue, 11 Aug 2020 10:02:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5PEb-0003u7-RY; Tue, 11 Aug 2020 08:02:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L6lB=BV=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1k5PEa-0003tU-GL
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2020 08:02:12 +0000
X-Inumbo-ID: 6418cc07-9d07-4265-8172-d0cc86b34d7d
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6418cc07-9d07-4265-8172-d0cc86b34d7d;
 Tue, 11 Aug 2020 08:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dBwj4wik0LPt/hwNL21RAdLL6al/lz/Xx5lYUZ+jc9M=; b=SnQBnfDbIVzQJeMl9esibza4Tb
 2zXxpNeILmFRRXctbbGuVsUA1122jmLVnNpPhHI1wFHOH70yfLetzl9llb0QIeuzpnipXWosh5KB1
 lZBBydwF8s1uqxxXQ1QPVbyFZkztDSz+D/Y7A+Q5b44NyTIHhZrIRPa6iTfcSQh3F4dA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k5PEW-0003ud-9F; Tue, 11 Aug 2020 08:02:08 +0000
Received: from host86-143-223-30.range86-143.btcentralplus.com
 ([86.143.223.30] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k5PEW-0000k5-1k; Tue, 11 Aug 2020 08:02:08 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v3 2/8] tools/hotplug/Linux: re-factor add_to_bridge() in
 xen-network-common.sh
Date: Tue, 11 Aug 2020 09:01:56 +0100
Message-Id: <20200811080202.31163-3-paul@xen.org>
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

Remove duplication of 'ip link set dev'. It is perfectly fine to call it
even if the device has already been added to the bridge.

NOTE: This patch also adds code to write a debug log entry if the device
      was already on the bridge.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Wei Liu <wl@xen.org>

v3:
 - Re-factored from "tools/hotplug: add remove_from_bridge() and improve
   debug output" in v2
---
 tools/hotplug/Linux/xen-network-common.sh | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/tools/hotplug/Linux/xen-network-common.sh b/tools/hotplug/Linux/xen-network-common.sh
index 8dd3a62068..ec3bd4ec4a 100644
--- a/tools/hotplug/Linux/xen-network-common.sh
+++ b/tools/hotplug/Linux/xen-network-common.sh
@@ -126,16 +126,18 @@ add_to_bridge () {
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
+        log debug "adding $dev to bridge $bridge"
+        if which brctl >&/dev/null; then
+            brctl addif ${bridge} ${dev}
+        else
+            ip link set ${dev} master ${bridge}
+        fi
     else
-        ip link set ${dev} master ${bridge}
+        log debug "$dev already on bridge $bridge"
     fi
+
     ip link set dev ${dev} up
 }
 
-- 
2.20.1


