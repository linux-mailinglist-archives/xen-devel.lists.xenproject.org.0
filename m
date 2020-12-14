Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 524782D9F2F
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 19:36:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52419.91803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koshm-0003IF-TQ; Mon, 14 Dec 2020 18:36:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52419.91803; Mon, 14 Dec 2020 18:36:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koshl-0003Di-AV; Mon, 14 Dec 2020 18:36:17 +0000
Received: by outflank-mailman (input) for mailman id 52419;
 Mon, 14 Dec 2020 16:39:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nuho=FS=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1koqqt-0006vN-JV
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 16:37:35 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 43a2499d-851f-42d2-b0b1-c68e681c84f0;
 Mon, 14 Dec 2020 16:36:34 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0BEGaXng010884;
 Mon, 14 Dec 2020 17:36:33 +0100 (CET)
Received: from borneo.soc.lip6.fr (borneo [132.227.103.47])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 0BEGaXBX017131;
 Mon, 14 Dec 2020 17:36:33 +0100 (MET)
Received: by borneo.soc.lip6.fr (Postfix, from userid 373)
 id 1CC31AAC68; Mon, 14 Dec 2020 17:36:33 +0100 (MET)
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
X-Inumbo-ID: 43a2499d-851f-42d2-b0b1-c68e681c84f0
From: Manuel Bouyer <bouyer@netbsd.org>
To: xen-devel@lists.xenproject.org
Cc: Manuel Bouyer <bouyer@netbsd.org>
Subject: [PATCH 06/24] Handle the case where vifname is not present in xenstore.
Date: Mon, 14 Dec 2020 17:36:05 +0100
Message-Id: <20201214163623.2127-7-bouyer@netbsd.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201214163623.2127-1-bouyer@netbsd.org>
References: <20201214163623.2127-1-bouyer@netbsd.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 14 Dec 2020 17:36:33 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

---
 tools/hotplug/NetBSD/vif-bridge | 5 ++++-
 tools/hotplug/NetBSD/vif-ip     | 4 ++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/tools/hotplug/NetBSD/vif-bridge b/tools/hotplug/NetBSD/vif-bridge
index b58e922601..cd428b5936 100644
--- a/tools/hotplug/NetBSD/vif-bridge
+++ b/tools/hotplug/NetBSD/vif-bridge
@@ -23,7 +23,10 @@ case $xstatus in
 	xbridge=$(xenstore-read "$xpath/bridge")
 	xfid=$(xenstore-read "$xpath/frontend-id")
 	xhandle=$(xenstore-read "$xpath/handle")
-	iface=$(xenstore-read "$xpath/vifname")
+	iface=$(xenstore-read "$xpath/vifname") || true
+	if [ x${iface} = "x" ] ; then
+		iface=xvif$xfid.$xhandle
+	fi
 	ifconfig $iface up
 	brconfig $xbridge add $iface
 	xenstore-write $xpath/hotplug-status connected
diff --git a/tools/hotplug/NetBSD/vif-ip b/tools/hotplug/NetBSD/vif-ip
index 83cbfe20e2..944f50f881 100644
--- a/tools/hotplug/NetBSD/vif-ip
+++ b/tools/hotplug/NetBSD/vif-ip
@@ -24,6 +24,10 @@ case $xstatus in
 	xfid=$(xenstore-read "$xpath/frontend-id")
 	xhandle=$(xenstore-read "$xpath/handle")
 	iface=$(xenstore-read "$xpath/vifname")
+	iface=$(xenstore-read "$xpath/vifname") || true
+	if [ x${iface} = "x" ] ; then
+		iface=xvif$xfid.$xhandle
+	fi
 	ifconfig $iface $xip up
 	xenstore-write $xpath/hotplug-status connected
 	exit 0
-- 
2.28.0


