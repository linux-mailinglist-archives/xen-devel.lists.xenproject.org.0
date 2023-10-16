Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39ABE7CAD49
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 17:20:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617751.960706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsPNa-0002Ha-O4; Mon, 16 Oct 2023 15:19:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617751.960706; Mon, 16 Oct 2023 15:19:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsPNa-00028g-Gf; Mon, 16 Oct 2023 15:19:38 +0000
Received: by outflank-mailman (input) for mailman id 617751;
 Mon, 16 Oct 2023 15:19:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yi9k=F6=casper.srs.infradead.org=BATV+ffd15938eba190e275bf+7358+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qsPNY-0001wj-Fn
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 15:19:36 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 685c8466-6c37-11ee-9b0e-b553b5be7939;
 Mon, 16 Oct 2023 17:19:32 +0200 (CEST)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1qsPNC-006lqb-6o; Mon, 16 Oct 2023 15:19:14 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qsPNB-0005nS-2q; Mon, 16 Oct 2023 16:19:13 +0100
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
X-Inumbo-ID: 685c8466-6c37-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description;
	bh=j10esoq0FJNH76opTx2Ikt3KjCQW6JceQg/cwlpclKs=; b=ZduFMOvoJdtQDogmTwvZyLrQi7
	L5xONBMXumaxapRtcqiXoK0WZgkbhT065bsjcEyhBGwuMIgptpB+Id+ZQY8bIRlZe9ln/4+PdOeGo
	sRrlHgzM1xlelgVAmfltZTG1qwyquW2mixVDt8Q3NPEIRXTs5OScTehD4TDup9ceZaeNOVgVKaO/k
	xfvAmlGJ9gM3gJfpvmnFvi6WybtURPVTOKJDAxxygl85ZTIUgL96GiUP0wtXt84zGw/tALtO/CLco
	kb3nRQ4/tOtXtXPZJUqhKO2Di+M1vNQXeU8zftYCP05E4/AU8kkLeYHDAoGoofY0asYS/bSwngSOY
	0rPBEqUA==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	David Woodhouse <dwmw2@infradead.org>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	qemu-block@nongnu.org,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org
Subject: [PATCH 06/12] hw/xen: add get_frontend_path() method to XenDeviceClass
Date: Mon, 16 Oct 2023 16:19:03 +0100
Message-Id: <20231016151909.22133-7-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231016151909.22133-1-dwmw2@infradead.org>
References: <20231016151909.22133-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

The primary Xen console is special. The guest's side is set up for it by
the toolstack automatically and not by the standard PV init sequence.

Accordingly, its *frontend* doesn't appear in …/device/console/0 either;
instead it appears under …/console in the guest's XenStore node.

To allow the Xen console driver to override the frontend path for the
primary console, add a method to the XenDeviceClass which can be used
instead of the standard xen_device_get_frontend_path()

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/xen/xen-bus.c         | 10 +++++++++-
 include/hw/xen/xen-bus.h |  2 ++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index ece8ec40cd..cc524ed92c 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -711,8 +711,16 @@ static void xen_device_frontend_create(XenDevice *xendev, Error **errp)
 {
     ERRP_GUARD();
     XenBus *xenbus = XEN_BUS(qdev_get_parent_bus(DEVICE(xendev)));
+    XenDeviceClass *xendev_class = XEN_DEVICE_GET_CLASS(xendev);
 
-    xendev->frontend_path = xen_device_get_frontend_path(xendev);
+    if (xendev_class->get_frontend_path) {
+        xendev->frontend_path = xendev_class->get_frontend_path(xendev, errp);
+        if (!xendev->frontend_path) {
+            return;
+        }
+    } else {
+        xendev->frontend_path = xen_device_get_frontend_path(xendev);
+    }
 
     /*
      * The frontend area may have already been created by a legacy
diff --git a/include/hw/xen/xen-bus.h b/include/hw/xen/xen-bus.h
index f435898164..eb440880b5 100644
--- a/include/hw/xen/xen-bus.h
+++ b/include/hw/xen/xen-bus.h
@@ -33,6 +33,7 @@ struct XenDevice {
 };
 typedef struct XenDevice XenDevice;
 
+typedef char *(*XenDeviceGetFrontendPath)(XenDevice *xendev, Error **errp);
 typedef char *(*XenDeviceGetName)(XenDevice *xendev, Error **errp);
 typedef void (*XenDeviceRealize)(XenDevice *xendev, Error **errp);
 typedef void (*XenDeviceFrontendChanged)(XenDevice *xendev,
@@ -46,6 +47,7 @@ struct XenDeviceClass {
     /*< public >*/
     const char *backend;
     const char *device;
+    XenDeviceGetFrontendPath get_frontend_path;
     XenDeviceGetName get_name;
     XenDeviceRealize realize;
     XenDeviceFrontendChanged frontend_changed;
-- 
2.40.1


