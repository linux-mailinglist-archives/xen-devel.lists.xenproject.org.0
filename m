Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 766D5CBE237
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 14:51:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187026.1508447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV8zC-0007rX-U0; Mon, 15 Dec 2025 13:51:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187026.1508447; Mon, 15 Dec 2025 13:51:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV8zC-0007q6-RA; Mon, 15 Dec 2025 13:51:38 +0000
Received: by outflank-mailman (input) for mailman id 1187026;
 Mon, 15 Dec 2025 13:51:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1vV8zB-0007q0-Rw
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 13:51:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vV8zB-00B7yS-1F;
 Mon, 15 Dec 2025 13:51:37 +0000
Received: from [2a01:cb15:80df:da00:8c91:1441:8140:73df] (helo=l14.home)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vV8zB-007Yk3-0i;
 Mon, 15 Dec 2025 13:51:37 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From;
	bh=e12dchVFz9MNJ7K2j8AuX0whONk3kd5v2l187O07Ymg=; b=c3mHbiXM1S6J9p+h/+eVwzSav8
	xiWIzqVeDe2w6/T+FzErCbgJSAalzwHo4V9wZnxJYvzIDdtASfhP598LMIXSpIgle7ka3XYwUpWoD
	Bk+WgZCwOInMgy4zjkIdu+OKTZL2MnCZRu3bdQ3tCjg2PcmwLS97Ehg0HG+sjUK/8avU=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH] libxl: Fix device_add QMP calls with QEMU 9.2 and newer
Date: Mon, 15 Dec 2025 14:51:24 +0100
Message-ID: <20251215135124.11410-1-anthony@xenproject.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

QEMU used to ignore JSON types and do conversion string <-> integer
automatically for the command "device_add", but that was removed in
QEMU 9.2 (428d1789df91 ("docs/about: Belatedly document tightening of
QMP device_add checking")).

Fixes: 9718ab394d5d ("libxl_usb: Make libxl__device_usbctrl_add uses ev_qmp")
Fixes: 40c7eca10a82 ("libxl_usb: Make libxl__device_usbdev_add uses ev_qmp")
Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---

Notes:
    I've check other `device_add` call site which are for PCI devices and
    CPUs, and they both are already correct.

 tools/libs/light/libxl_usb.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tools/libs/light/libxl_usb.c b/tools/libs/light/libxl_usb.c
index c5ae59681c..4e7c409fe6 100644
--- a/tools/libs/light/libxl_usb.c
+++ b/tools/libs/light/libxl_usb.c
@@ -367,10 +367,10 @@ static int libxl__device_usbctrl_add_hvm(libxl__egc *egc, libxl__ev_qmp *qmp,
     case 3:
         libxl__qmp_param_add_string(gc, &qmp_args,
                                     "driver", "nec-usb-xhci");
-        libxl__qmp_param_add_string(gc, &qmp_args, "p2",
-                                    GCSPRINTF("%d", usbctrl->ports));
-        libxl__qmp_param_add_string(gc, &qmp_args, "p3",
-                                    GCSPRINTF("%d", usbctrl->ports));
+        libxl__qmp_param_add_integer(gc, &qmp_args, "p2",
+                                     usbctrl->ports);
+        libxl__qmp_param_add_integer(gc, &qmp_args, "p3",
+                                     usbctrl->ports);
         break;
     default:
         abort(); /* Should not be possible. */
@@ -411,10 +411,10 @@ static int libxl__device_usbdev_add_hvm(libxl__egc *egc, libxl__ev_qmp *qmp,
         GCSPRINTF("xenusb-%d.0", usbdev->ctrl));
     libxl__qmp_param_add_string(gc, &qmp_args, "port",
         GCSPRINTF("%d", usbdev->port));
-    libxl__qmp_param_add_string(gc, &qmp_args, "hostbus",
-        GCSPRINTF("%d", usbdev->u.hostdev.hostbus));
-    libxl__qmp_param_add_string(gc, &qmp_args, "hostaddr",
-        GCSPRINTF("%d", usbdev->u.hostdev.hostaddr));
+    libxl__qmp_param_add_integer(gc, &qmp_args, "hostbus",
+                                 usbdev->u.hostdev.hostbus);
+    libxl__qmp_param_add_integer(gc, &qmp_args, "hostaddr",
+                                 usbdev->u.hostdev.hostaddr);
 
     return libxl__ev_qmp_send(egc, qmp, "device_add", qmp_args);
 }
-- 
Anthony PERARD


