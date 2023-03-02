Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 283246A8539
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 16:35:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505048.777581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXkxK-0001RT-QV; Thu, 02 Mar 2023 15:34:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505048.777581; Thu, 02 Mar 2023 15:34:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXkxK-0001L1-Lw; Thu, 02 Mar 2023 15:34:54 +0000
Received: by outflank-mailman (input) for mailman id 505048;
 Thu, 02 Mar 2023 15:34:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZMsQ=62=desiato.srs.infradead.org=BATV+9a0490e5ac528e462c30+7130+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1pXkxJ-0001Jv-17
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 15:34:53 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c43a7735-b90f-11ed-96ad-2f268f93b82a;
 Thu, 02 Mar 2023 16:34:49 +0100 (CET)
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pXkx4-00FL3m-2e; Thu, 02 Mar 2023 15:34:40 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pXkx4-004uzR-2J; Thu, 02 Mar 2023 15:34:38 +0000
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
X-Inumbo-ID: c43a7735-b90f-11ed-96ad-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=FnClZ8IFan30fx5D6PHOfap2YeZdQXUEp+XrOHw7NWs=; b=VVkNvJQsV79cgt8bzx+l0ClT+G
	Wiyz5BhL24D12/QkaDakc0ALlSx1i2qok2apG76LwYNEM1pPgmDb1NfTSlVj7wZkqVtHQVBqpujPV
	K1mLrO+C4airr6O55gGcgarHdCX04k4Bsl7YQxlVfXtD4xKx+Jia60goBVqSVetR+CatCGqWNXsPc
	Hkh2FB4jcKSnEwt9c7+CYwLFfwoNISbAUmAKkfx1ZpxeJe/41myBDmH/5c+nMtk3LX5v20ijD+P3c
	fb+EEZ7t4gvEtKdroZBJtbhl42Mqx90Tx1WL+utNfz9glZ4m/cq0szzCSXECcHVSYePfkl7xeKlYy
	t8AX++Ww==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Joao Martins <joao.m.martins@oracle.com>,
	Ankur Arora <ankur.a.arora@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	vikram.garhwal@amd.com,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: [RFC PATCH v1 18/25] hw/xen: Avoid crash when backend watch fires too early
Date: Thu,  2 Mar 2023 15:34:28 +0000
Message-Id: <20230302153435.1170111-19-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230302153435.1170111-1-dwmw2@infradead.org>
References: <20230302153435.1170111-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

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


