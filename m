Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B32137CCA96
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 20:26:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618329.961845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsold-0005HU-2W; Tue, 17 Oct 2023 18:26:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618329.961845; Tue, 17 Oct 2023 18:26:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsolc-0005FY-V1; Tue, 17 Oct 2023 18:26:08 +0000
Received: by outflank-mailman (input) for mailman id 618329;
 Tue, 17 Oct 2023 18:26:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qm1H=F7=casper.srs.infradead.org=BATV+e442e50539a6073fd887+7359+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qsola-0005FN-T8
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 18:26:06 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a048d7a8-6d1a-11ee-98d4-6d05b1d4d9a1;
 Tue, 17 Oct 2023 20:26:02 +0200 (CEST)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1qsolL-00DrCq-Pk; Tue, 17 Oct 2023 18:25:51 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qsolI-000Par-2F; Tue, 17 Oct 2023 19:25:48 +0100
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
X-Inumbo-ID: a048d7a8-6d1a-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description;
	bh=mT1XScI7NSJ4weZ5c1NJoTEjfaqAFFggM/PoQY19qlQ=; b=u2pl0HXyBSCIO8jw1OQWFNhf2O
	Hj/MN1k4AK95NViqo7qIk/mSIRKYon9a3ezB59j4K+iKbmyMri//ejsICoyYSix0lyRkGFkcyL8Ou
	vMliReAQ0IrMARgiZES6WA1xMB9twTeVfZaMrm7HvisUfl1T8yHWWDxG1ReTokk08H8//LXKNOliM
	dUxj2P1UJ++Q69tUfpC1Q86upQsLUc8mxFbFAnIxev/h+kAeEKtWt0+X7iWYdUwPCLGF3kdmr5wMK
	7jQS8z9M1Mx5BxrobTWp3WEr1ZawgXQ8MGh4TnVlvCyk5ih0AL87cVI0NjBGyW7h/y/UBLoyHHEI6
	10GUyejw==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Jason Wang <jasowang@redhat.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 3/4] [WTF] avoid qemu_del_nic() in xen_netdev_unrealize() on shutdown
Date: Tue, 17 Oct 2023 19:25:44 +0100
Message-Id: <20231017182545.97973-4-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231017182545.97973-1-dwmw2@infradead.org>
References: <20231017182545.97973-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

When QEMU is exiting, qemu_cleanup() calls net_cleanup(), which deletes
the NIC from underneath the xen-net-device. When xen_netdev_unrealize()
is later called via the xenbus exit notifier, it crashes.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/net/xen_nic.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/net/xen_nic.c b/hw/net/xen_nic.c
index 84914c329c..8d25fb3101 100644
--- a/hw/net/xen_nic.c
+++ b/hw/net/xen_nic.c
@@ -25,6 +25,8 @@
 #include "qapi/qmp/qdict.h"
 #include "qapi/error.h"
 
+#include "sysemu/runstate.h"
+
 #include <sys/socket.h>
 #include <sys/ioctl.h>
 #include <sys/wait.h>
@@ -530,7 +532,11 @@ static void xen_netdev_unrealize(XenDevice *xendev)
     /* Disconnect from the frontend in case this has not already happened */
     xen_netdev_disconnect(xendev, NULL);
 
-    if (netdev->nic) {
+    /*
+     * WTF? In RUN_STATE_SHUTDOWN, qemu_cleanup()→net_cleanup() already deleted
+     * our NIC from underneath us!
+     */
+    if (netdev->nic && !runstate_check(RUN_STATE_SHUTDOWN)) {
         qemu_del_nic(netdev->nic);
     }
 }
-- 
2.40.1


