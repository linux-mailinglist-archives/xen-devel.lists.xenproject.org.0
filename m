Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 851EE2F3805
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 19:13:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65830.116669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzOAj-0003qF-Ms; Tue, 12 Jan 2021 18:13:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65830.116669; Tue, 12 Jan 2021 18:13:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzOAj-0003pX-J7; Tue, 12 Jan 2021 18:13:37 +0000
Received: by outflank-mailman (input) for mailman id 65830;
 Tue, 12 Jan 2021 18:13:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gu5a=GP=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1kzOAh-0003Yo-Sz
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 18:13:35 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3428765d-5843-47f9-8619-2da818d3f902;
 Tue, 12 Jan 2021 18:13:15 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 10CIDEIb012141;
 Tue, 12 Jan 2021 19:13:14 +0100 (CET)
Received: from armandeche.soc.lip6.fr (armandeche [132.227.63.133])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 10CIDDNP026926;
 Tue, 12 Jan 2021 19:13:13 +0100 (MET)
Received: by armandeche.soc.lip6.fr (Postfix, from userid 20331)
 id 29B667218; Tue, 12 Jan 2021 19:13:13 +0100 (MET)
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
X-Inumbo-ID: 3428765d-5843-47f9-8619-2da818d3f902
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: xen-devel@lists.xenproject.org
Cc: Manuel Bouyer <bouyer@netbsd.org>, Ian Jackson <iwj@xenproject.org>,
        Wei Liu <wl@xen.org>
Subject: [PATCH] NetBSD hotplug: handle case where vifname is not present
Date: Tue, 12 Jan 2021 19:12:25 +0100
Message-Id: <20210112181242.1570-5-bouyer@antioche.eu.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210112181242.1570-1-bouyer@antioche.eu.org>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 12 Jan 2021 19:13:14 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

From: Manuel Bouyer <bouyer@netbsd.org>

Some Xen version didn't set the vifname in xenstore; just build one if
not present.

Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
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
2.29.2


