Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A26C2417DC
	for <lists+xen-devel@lfdr.de>; Tue, 11 Aug 2020 10:02:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5PEw-000461-S1; Tue, 11 Aug 2020 08:02:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L6lB=BV=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1k5PEu-0003tU-Gh
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2020 08:02:32 +0000
X-Inumbo-ID: c1af89f7-e8a3-429a-a591-ac338f4a7ce8
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c1af89f7-e8a3-429a-a591-ac338f4a7ce8;
 Tue, 11 Aug 2020 08:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BAy5s3sGl5OVAE5aJjOW3bw89voRQ3oj9vAnoeEnJOg=; b=cEqhiIQv/oO3ddENp8zIMFXY7n
 OWp40jP2B6KMHRRHVa2+kDjj/nRdmdiW57U3VoULQuxz1yLYpD3nz6fZj4Z5dk8TY8OJZdRqtt6xs
 5MqM66WtX6+sy75GP83IQfUifPsGMMOD+Hhd0ctAjJCTCLASNSMqlmEv+XnY2X5oaPbk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k5PEb-0003vm-Sy; Tue, 11 Aug 2020 08:02:13 +0000
Received: from host86-143-223-30.range86-143.btcentralplus.com
 ([86.143.223.30] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k5PEb-0000k5-LJ; Tue, 11 Aug 2020 08:02:13 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v3 8/8] remove netchannel2 hotplug script... ancient history
Date: Tue, 11 Aug 2020 09:02:02 +0100
Message-Id: <20200811080202.31163-9-paul@xen.org>
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

configuration is not parsed by libxl so there is no reason for the hotplug
script to exist

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Wei Liu <wl@xen.org>

v3:
 - New in v3
---
 tools/hotplug/Linux/Makefile |  1 -
 tools/hotplug/Linux/vif2     | 54 ------------------------------------
 2 files changed, 55 deletions(-)
 delete mode 100644 tools/hotplug/Linux/vif2

diff --git a/tools/hotplug/Linux/Makefile b/tools/hotplug/Linux/Makefile
index 3a90990594..0b1d111d7e 100644
--- a/tools/hotplug/Linux/Makefile
+++ b/tools/hotplug/Linux/Makefile
@@ -6,7 +6,6 @@ XEN_SCRIPTS = vif-bridge
 XEN_SCRIPTS += vif-route
 XEN_SCRIPTS += vif-nat
 XEN_SCRIPTS += vif-openvswitch
-XEN_SCRIPTS += vif2
 XEN_SCRIPTS += vif-setup
 XEN_SCRIPTS-$(CONFIG_LIBNL) += remus-netbuf-setup
 XEN_SCRIPTS += block
diff --git a/tools/hotplug/Linux/vif2 b/tools/hotplug/Linux/vif2
deleted file mode 100644
index 5bd555c6f0..0000000000
--- a/tools/hotplug/Linux/vif2
+++ /dev/null
@@ -1,54 +0,0 @@
-#!/bin/bash
-
-dir=$(dirname "$0")
-. "$dir/xen-hotplug-common.sh"
-. "$dir/xen-network-common.sh"
-
-bridge=$(xenstore_read_default "$XENBUS_PATH/bridge" "$bridge")
-if [ -z "$bridge" ]
-    then
-    if which brctl >&/dev/null; then
-        nr_bridges=$(($(brctl show | cut -f 1 | grep -v "^$" | wc -l) - 1))
-    else
-        nr_bridges=$(bridge link | wc -l)
-    fi
-    if [ "$nr_bridges" != 1 ]
-	then
-	fatal "no bridge specified, and don't know which one to use ($nr_bridges found)"
-    fi
-    if which brctl >&/dev/null; then
-        bridge=$(brctl show | cut -d "
-" -f 2 | cut -f 1)
-    else
-        bridge=$(bridge link | cut -d" " -f6)
-    fi
-fi
-
-command="$1"
-shift
-
-case "$command" in
-    "online")
-	if [ "$bridge" != "-" ]
-	    then
-	    setup_virtual_bridge_port "$vif"
-	    add_to_bridge "$bridge" "$vif"
-	else
-	    # Just let the normal udev rules for interfaces handle it.
-	    true
-	fi
-	success
-	;;
-
-    "add")
-	success
-	;;
-
-    "remove")
-	;;
-
-    *)
-	echo "Unknown command: $command"
-	echo 'Valid commands are: add, remove, online'
-	exit 1
-esac
-- 
2.20.1


