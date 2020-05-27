Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1531E38B6
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 08:01:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdp6e-0006WZ-AI; Wed, 27 May 2020 06:00:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KwrG=7J=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1jdp6c-0006WU-OQ
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 05:59:59 +0000
X-Inumbo-ID: 4959291e-9fdf-11ea-9947-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 4959291e-9fdf-11ea-9947-bc764e2007e4;
 Wed, 27 May 2020 05:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590559194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j6YgtXDpCWCf9KnSRhU+LICwWG5pFJTKsR57WPE8YO4=;
 b=BNJC+gRWTNmjWtGnU6/e04Eqznkr18U6q9vpb14NE3Omf+Fyr1qGwGik0VMgJdOwEezLaw
 ln86CzZjjd2KZ0ktGDtDlIhpzxJgrlKUeFl4Pab/NVDDbX3eZ8Q7gujQBAUDsJs3+jgvKe
 IZmlRakMv/skATULzEpDsOkVzeh8AG8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-eEH0X-D4OE60pRaysMOMXQ-1; Wed, 27 May 2020 01:59:51 -0400
X-MC-Unique: eEH0X-D4OE60pRaysMOMXQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 710038014D4;
 Wed, 27 May 2020 05:59:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C56279C5C;
 Wed, 27 May 2020 05:59:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E4B9E11386A3; Wed, 27 May 2020 07:59:45 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/10] xen: Fix and improve handling of device_add usb-host
 errors
Date: Wed, 27 May 2020 07:59:37 +0200
Message-Id: <20200527055945.6774-3-armbru@redhat.com>
In-Reply-To: <20200527055945.6774-1-armbru@redhat.com>
References: <20200527055945.6774-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

usbback_portid_add() leaks the error when qdev_device_add() fails.
Fix that.  While there, use the error to improve the error message.

The qemu_opts_from_qdict() similarly leaks on failure.  But any
failure there is a programming error.  Pass &error_abort.

Fixes: 816ac92ef769f9ffc534e49a1bb6177bddce7aa2
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony Perard <anthony.perard@citrix.com>
Cc: Paul Durrant <paul@xen.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: xen-devel@lists.xenproject.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20200505101908.6207-3-armbru@redhat.com>
Acked-by: Paul Durrant <paul@xen.org>
---
 hw/usb/xen-usb.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/hw/usb/xen-usb.c b/hw/usb/xen-usb.c
index 961190d0f7..4d266d7bb4 100644
--- a/hw/usb/xen-usb.c
+++ b/hw/usb/xen-usb.c
@@ -30,6 +30,7 @@
 #include "hw/usb.h"
 #include "hw/xen/xen-legacy-backend.h"
 #include "monitor/qdev.h"
+#include "qapi/error.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qstring.h"
 
@@ -755,13 +756,16 @@ static void usbback_portid_add(struct usbback_info *usbif, unsigned port,
     qdict_put_int(qdict, "port", port);
     qdict_put_int(qdict, "hostbus", atoi(busid));
     qdict_put_str(qdict, "hostport", portname);
-    opts = qemu_opts_from_qdict(qemu_find_opts("device"), qdict, &local_err);
-    if (local_err) {
-        goto err;
-    }
+    opts = qemu_opts_from_qdict(qemu_find_opts("device"), qdict,
+                                &error_abort);
     usbif->ports[port - 1].dev = USB_DEVICE(qdev_device_add(opts, &local_err));
     if (!usbif->ports[port - 1].dev) {
-        goto err;
+        qobject_unref(qdict);
+        xen_pv_printf(&usbif->xendev, 0,
+                      "device %s could not be opened: %s\n",
+                      busid, error_get_pretty(local_err));
+        error_free(local_err);
+        return;
     }
     qobject_unref(qdict);
     speed = usbif->ports[port - 1].dev->speed;
@@ -793,11 +797,6 @@ static void usbback_portid_add(struct usbback_info *usbif, unsigned port,
     usbback_hotplug_enq(usbif, port);
 
     TR_BUS(&usbif->xendev, "port %d attached\n", port);
-    return;
-
-err:
-    qobject_unref(qdict);
-    xen_pv_printf(&usbif->xendev, 0, "device %s could not be opened\n", busid);
 }
 
 static void usbback_process_port(struct usbback_info *usbif, unsigned port)
-- 
2.21.3


