Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD9A7E37B1
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 10:22:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628639.980375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0II3-0004mX-I2; Tue, 07 Nov 2023 09:22:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628639.980375; Tue, 07 Nov 2023 09:22:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0II3-0004hq-4M; Tue, 07 Nov 2023 09:22:31 +0000
Received: by outflank-mailman (input) for mailman id 628639;
 Tue, 07 Nov 2023 09:22:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nBTJ=GU=desiato.srs.infradead.org=BATV+c94b4d3bb33faa26daf4+7380+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1r0II1-0001o6-Em
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 09:22:29 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29d72479-7d4f-11ee-9b0e-b553b5be7939;
 Tue, 07 Nov 2023 10:22:25 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1r0IHP-00BtG1-0d; Tue, 07 Nov 2023 09:21:55 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1r0IHN-001hKI-2u; Tue, 07 Nov 2023 09:21:49 +0000
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
X-Inumbo-ID: 29d72479-7d4f-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description;
	bh=8NC7zpHNUo9fTggjfL7ZxSV8IkLkmeuOC0riizcU694=; b=aV84bzG7ukFmJTaTuA0mtfKe0U
	+Ajm3miAr4CJKjCvycFlH65hRrcWMVTEtDB6vE8ggMdhPtHYWGnrVE3nZ8HX9zT3gR9MDlttFZCDa
	qfq4FXPaWILOFgdHLMr68c01echV8zlcMU7mpjnyNluBIW3HrnFT2CP+WVFX6z1POLZ3pzkXFkp87
	wZ+hbaIGdPrsK39ki+HNpF6PEgk7lbTExcDAhhaJ/u2HXP70FjDcdHJruS5CCUSSrrlP6I6G/+7cL
	ZVpIk+g5iLiVrs97EEAvKpdJR1nEkcXu6Srn4Br9OYPXe4e9tg/CIu/ayYaFroJw4Y3SR3wSzIaMQ
	TuWynf4w==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>
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
	Jason Wang <jasowang@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	qemu-block@nongnu.org,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org
Subject: [PULL 07/15] hw/xen: add get_frontend_path() method to XenDeviceClass
Date: Tue,  7 Nov 2023 09:21:39 +0000
Message-ID: <20231107092149.404842-8-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231107092149.404842-1-dwmw2@infradead.org>
References: <20231107092149.404842-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

The primary Xen console is special. The guest's side is set up for it by
the toolstack automatically and not by the standard PV init sequence.

Accordingly, its *frontend* doesn't appear in …/device/console/0 either;
instead it appears under …/console in the guest's XenStore node.

To allow the Xen console driver to override the frontend path for the
primary console, add a method to the XenDeviceClass which can be used
instead of the standard xen_device_get_frontend_path()

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/xen/xen-bus.c         | 11 ++++++++++-
 include/hw/xen/xen-bus.h |  2 ++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index ece8ec40cd..12ff782005 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -711,8 +711,17 @@ static void xen_device_frontend_create(XenDevice *xendev, Error **errp)
 {
     ERRP_GUARD();
     XenBus *xenbus = XEN_BUS(qdev_get_parent_bus(DEVICE(xendev)));
+    XenDeviceClass *xendev_class = XEN_DEVICE_GET_CLASS(xendev);
 
-    xendev->frontend_path = xen_device_get_frontend_path(xendev);
+    if (xendev_class->get_frontend_path) {
+        xendev->frontend_path = xendev_class->get_frontend_path(xendev, errp);
+        if (!xendev->frontend_path) {
+            error_prepend(errp, "failed to create frontend: ");
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
2.41.0


