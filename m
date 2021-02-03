Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 412E030E027
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 17:55:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80969.148652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7LQS-0003EM-FY; Wed, 03 Feb 2021 16:54:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80969.148652; Wed, 03 Feb 2021 16:54:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7LQS-0003Dx-CS; Wed, 03 Feb 2021 16:54:44 +0000
Received: by outflank-mailman (input) for mailman id 80969;
 Wed, 03 Feb 2021 16:54:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+rCV=HF=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1l7LQQ-0003Do-Uf
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 16:54:42 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 120a9d99-9055-46bf-a931-b92ee53d9f10;
 Wed, 03 Feb 2021 16:54:41 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 113GsdWI021863;
 Wed, 3 Feb 2021 17:54:39 +0100 (CET)
Received: from borneo.soc.lip6.fr (borneo [132.227.103.47])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 113GscNw003580;
 Wed, 3 Feb 2021 17:54:39 +0100 (MET)
Received: by borneo.soc.lip6.fr (Postfix, from userid 373)
 id 73EFAAA8BB; Wed,  3 Feb 2021 17:54:38 +0100 (MET)
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
X-Inumbo-ID: 120a9d99-9055-46bf-a931-b92ee53d9f10
From: Manuel Bouyer <bouyer@netbsd.org>
To: xen-devel@lists.xenproject.org
Cc: Manuel Bouyer <bouyer@netbsd.org>, Ian Jackson <iwj@xenproject.org>,
        Wei Liu <wl@xen.org>
Subject: [PATCH] add a qemu-ifup script on NetBSD
Date: Wed,  3 Feb 2021 17:54:18 +0100
Message-Id: <20210203165421.1550-1-bouyer@netbsd.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 03 Feb 2021 17:54:39 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

On NetBSD, qemu-xen will use a qemu-ifup script to setup the tap interfaces
(as qemu-xen-traditional used to). Copy the script from qemu-xen-traditional,
and install it on NetBSD. While there document parameters and environnement
variables.

Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
---
 tools/hotplug/NetBSD/Makefile  | 1 +
 tools/hotplug/NetBSD/qemu-ifup | 9 +++++++++
 2 files changed, 10 insertions(+)
 create mode 100644 tools/hotplug/NetBSD/qemu-ifup

diff --git a/tools/hotplug/NetBSD/Makefile b/tools/hotplug/NetBSD/Makefile
index 114b223207..f909ffa367 100644
--- a/tools/hotplug/NetBSD/Makefile
+++ b/tools/hotplug/NetBSD/Makefile
@@ -7,6 +7,7 @@ XEN_SCRIPTS += locking.sh
 XEN_SCRIPTS += block
 XEN_SCRIPTS += vif-bridge
 XEN_SCRIPTS += vif-ip
+XEN_SCRIPTS += qemu-ifup
 
 XEN_SCRIPT_DATA =
 XEN_RCD_PROG = rc.d/xencommons rc.d/xendomains rc.d/xen-watchdog rc.d/xendriverdomain
diff --git a/tools/hotplug/NetBSD/qemu-ifup b/tools/hotplug/NetBSD/qemu-ifup
new file mode 100644
index 0000000000..4305419f44
--- /dev/null
+++ b/tools/hotplug/NetBSD/qemu-ifup
@@ -0,0 +1,9 @@
+#!/bin/sh
+
+#called by qemu when a HVM domU is started.
+# first parameter is tap interface, second is the bridge name
+# environement variable $XEN_DOMAIN_ID contains the domU's ID,
+# which can be used to retrieve extra parameters from the xenstore.
+
+ifconfig $1 up
+exec /sbin/brconfig $2 add $1
-- 
2.29.2


