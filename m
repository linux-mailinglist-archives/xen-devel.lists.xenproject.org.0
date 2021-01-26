Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4504B304C96
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 23:49:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75616.136208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4X9B-00028b-Ae; Tue, 26 Jan 2021 22:49:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75616.136208; Tue, 26 Jan 2021 22:49:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4X9B-00027q-5b; Tue, 26 Jan 2021 22:49:17 +0000
Received: by outflank-mailman (input) for mailman id 75616;
 Tue, 26 Jan 2021 22:49:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3HxG=G5=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1l4X99-0001QY-OA
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 22:49:15 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b5c52ba7-bba4-40eb-9c72-6b6a0525097a;
 Tue, 26 Jan 2021 22:48:37 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 10QMmXpt028712;
 Tue, 26 Jan 2021 23:48:33 +0100 (CET)
Received: from borneo.soc.lip6.fr (borneo [132.227.103.47])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 10QMmWj3029452;
 Tue, 26 Jan 2021 23:48:32 +0100 (MET)
Received: by borneo.soc.lip6.fr (Postfix, from userid 373)
 id BD2FAAA8BC; Tue, 26 Jan 2021 23:48:32 +0100 (MET)
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
X-Inumbo-ID: b5c52ba7-bba4-40eb-9c72-6b6a0525097a
From: Manuel Bouyer <bouyer@netbsd.org>
To: xen-devel@lists.xenproject.org
Cc: Manuel Bouyer <bouyer@netbsd.org>,
        =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
        Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v2] NetBSD hotplug: fix block unconfigure on destroy
Date: Tue, 26 Jan 2021 23:47:49 +0100
Message-Id: <20210126224800.1246-3-bouyer@netbsd.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210126224800.1246-1-bouyer@netbsd.org>
References: <20210126224800.1246-1-bouyer@netbsd.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 26 Jan 2021 23:48:33 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

When a domain is destroyed, xparams may not be available any more when
the block script is called to unconfigure the vnd.
Check xparam only at configure time, and just unconfigure any vnd present
in the xenstore.

Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/hotplug/NetBSD/block | 37 ++++++++++++++-----------------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/tools/hotplug/NetBSD/block b/tools/hotplug/NetBSD/block
index 2a0516f436..c8b31a7b2b 100644
--- a/tools/hotplug/NetBSD/block
+++ b/tools/hotplug/NetBSD/block
@@ -20,37 +20,28 @@ error() {
 xpath=$1
 xstatus=$2
 xparams=$(xenstore-read "$xpath/params")
-if [ -b "$xparams" ]; then
-	xtype="phy"
-elif [ -f "$xparams" ]; then
-	xtype="file"
-elif [ -z "$xparams" ]; then
-	error "$xpath/params is empty, unable to attach block device."
-else
-	error "$xparams is not a valid file type to use as block device." \
-	      "Only block and regular image files accepted."
-fi
 
 case $xstatus in
 6)
 	# device removed
-	case $xtype in
-	file)
-		vnd=$(xenstore-read "$xpath/vnd" || echo none)
-		if [ $vnd != none ]; then
-			vnconfig -u $vnd
-		fi
-		;;
-	phy)
-		;;
-	*)
-		echo "unknown type $xtype" >&2
-		;;
-	esac
+	vnd=$(xenstore-read "$xpath/vnd" || echo none)
+	if [ $vnd != none ]; then
+		vnconfig -u $vnd
+	fi
 	xenstore-rm $xpath
 	exit 0
 	;;
 2)
+	if [ -b "$xparams" ]; then
+		xtype="phy"
+	elif [ -f "$xparams" ]; then
+		xtype="file"
+	elif [ -z "$xparams" ]; then
+		error "$xpath/params is empty, unable to attach block device."
+	else
+		error "$xparams is not a valid file type to use as block device." \
+		      "Only block and regular image files accepted."
+	fi
 	case $xtype in
 	file)
 		# Store the list of available vnd(4) devices in
-- 
2.29.2


