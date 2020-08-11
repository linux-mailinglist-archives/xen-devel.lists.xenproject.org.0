Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2CD2417D5
	for <lists+xen-devel@lfdr.de>; Tue, 11 Aug 2020 10:02:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5PEh-0003wN-HP; Tue, 11 Aug 2020 08:02:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L6lB=BV=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1k5PEf-0003tU-GT
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2020 08:02:17 +0000
X-Inumbo-ID: 6a799ae5-b692-48b2-8791-240e05f53c63
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6a799ae5-b692-48b2-8791-240e05f53c63;
 Tue, 11 Aug 2020 08:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aHjZE/ipDyZpIQn2BBAjOYE1vFoNpiNeV+OmHeWemBA=; b=gOto8wyhSFIt+KkuFzEr1CEguq
 hexDYyKMppmfnbBmJ6NEW007SqlYPp1CV5QQkqQ2FOdjCWToC8EH17EM7EO2D/fFDnAXgHUqydWBT
 yvpFwCA07dGpA7RwQY7mFWLvuScZAu4Pldj+Pt8dPOBTNNOUn021M8YqPEMveegpH974=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k5PEY-0003vL-2m; Tue, 11 Aug 2020 08:02:10 +0000
Received: from host86-143-223-30.range86-143.btcentralplus.com
 ([86.143.223.30] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k5PEX-0000k5-RY; Tue, 11 Aug 2020 08:02:10 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v3 4/8] tools/hotplug/Linux: remove code duplication in
 vif-bridge
Date: Tue, 11 Aug 2020 09:01:58 +0100
Message-Id: <20200811080202.31163-5-paul@xen.org>
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

The 'add' and 'online' cases do exactly the same thing so have 'add' simply
fall through to 'online'.

NOTE: This patch also adds in the missing 'remove' case, which falls though
      to 'offline'. (The former is passed for 'tap' devices, the latter for
      'vif' devices).

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Wei Liu <wl@xen.org>

v3:
 - Re-factored from "tools/hotplug: combine add/online and remove/offline
   in vif-bridge..." in v2
---
 tools/hotplug/Linux/vif-bridge | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/tools/hotplug/Linux/vif-bridge b/tools/hotplug/Linux/vif-bridge
index c3e409926d..e1d7c49788 100644
--- a/tools/hotplug/Linux/vif-bridge
+++ b/tools/hotplug/Linux/vif-bridge
@@ -77,21 +77,18 @@ then
 fi
 
 case "$command" in
+    add)
+        ;&
     online)
         setup_virtual_bridge_port "$dev"
         set_mtu "$bridge" "$dev"
         add_to_bridge "$bridge" "$dev"
         ;;
-
+    remove)
+        ;&
     offline)
         remove_from_bridge "$bridge" "$dev"
         ;;
-
-    add)
-        setup_virtual_bridge_port "$dev"
-        set_mtu "$bridge" "$dev"
-        add_to_bridge "$bridge" "$dev"
-        ;;
 esac
 
 handle_iptable
-- 
2.20.1


