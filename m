Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CD76AF062
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 19:30:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507812.781969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZc3w-00050v-59; Tue, 07 Mar 2023 18:29:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507812.781969; Tue, 07 Mar 2023 18:29:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZc3v-0004vO-Tn; Tue, 07 Mar 2023 18:29:23 +0000
Received: by outflank-mailman (input) for mailman id 507812;
 Tue, 07 Mar 2023 18:29:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yYpO=67=casper.srs.infradead.org=BATV+9298a7250c90fe94fbb7+7135+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1pZc28-0002MP-7H
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 18:27:32 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b46438e6-bd15-11ed-a550-8520e6686977;
 Tue, 07 Mar 2023 19:27:24 +0100 (CET)
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pZc1n-006deL-RB; Tue, 07 Mar 2023 18:27:12 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pZc1n-009e9O-2k; Tue, 07 Mar 2023 18:27:11 +0000
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
X-Inumbo-ID: b46438e6-bd15-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=BHJMHnydR0+hWti+8rkf/Wiysg+WP6PP8ZazFEExUkk=; b=rGlulPhwYvfhsLYJh9LE73gxrv
	2YUvpMtkeZMQD0qwB3P6jQgn6V0s8GOHDNjGB0OfCgYDtUVtIe5Caq5MaYlhgU+SGXVd2eXnQkFNZ
	gT2ZRRPtZ5yogbuywXmEUmwzpE1BGukGQb9j5rjSUP5PFWa33z3T/Re0yxXMSXdJ0MsESRBciNRVz
	dlvkUzyd9zCJI2RS6JPhhZkjH5pc6nd8entkm1hoSix64VFBDii1Rqk9uY2bnAAD3n5DqpcrZAEcn
	5h3AHoSTAtGQ3E+MaYH8VRpI7wvy3SPss4xWkoacxGfu5CtkzFOPD0hoAtrNwDah3eSNgzOhhr9/Y
	hjtkrW1Q==;
From: David Woodhouse <dwmw2@infradead.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Joao Martins <joao.m.martins@oracle.com>,
	Ankur Arora <ankur.a.arora@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	vikram.garhwal@amd.com,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org,
	Juan Quintela <quintela@redhat.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PULL 18/27] hw/xen: Avoid crash when backend watch fires too early
Date: Tue,  7 Mar 2023 18:26:58 +0000
Message-Id: <20230307182707.2298618-19-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230307182707.2298618-1-dwmw2@infradead.org>
References: <20230307182707.2298618-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: Paul Durrant <pdurrant@amazon.com>

The xen-block code ends up calling aio_poll() through blkconf_geometry(),
which means we see watch events during the indirect call to
xendev_class->realize() in xen_device_realize(). Unfortunately this call
is made before populating the initial frontend and backend device nodes
in xenstore and hence xen_block_frontend_changed() (which is called from
a watch event) fails to read the frontend's 'state' node, and hence
believes the device is being torn down. This in-turn sets the backend
state to XenbusStateClosed and causes the device to be deleted before it
is fully set up, leading to the crash.
By simply moving the call to xendev_class->realize() after the initial
xenstore nodes are populated, this sorry state of affairs is avoided.

Reported-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/xen/xen-bus.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index 9fe54967d4..c59850b1de 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -1034,13 +1034,6 @@ static void xen_device_realize(DeviceState *dev, Error **errp)
         goto unrealize;
     }
 
-    if (xendev_class->realize) {
-        xendev_class->realize(xendev, errp);
-        if (*errp) {
-            goto unrealize;
-        }
-    }
-
     xen_device_backend_printf(xendev, "frontend", "%s",
                               xendev->frontend_path);
     xen_device_backend_printf(xendev, "frontend-id", "%u",
@@ -1059,6 +1052,13 @@ static void xen_device_realize(DeviceState *dev, Error **errp)
         xen_device_frontend_set_state(xendev, XenbusStateInitialising, true);
     }
 
+    if (xendev_class->realize) {
+        xendev_class->realize(xendev, errp);
+        if (*errp) {
+            goto unrealize;
+        }
+    }
+
     xendev->exit.notify = xen_device_exit;
     qemu_add_exit_notifier(&xendev->exit);
     return;
-- 
2.39.0


