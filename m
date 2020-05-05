Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D801C52FE
	for <lists+xen-devel@lfdr.de>; Tue,  5 May 2020 12:20:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVufa-0006ni-EN; Tue, 05 May 2020 10:19:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ph1I=6T=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1jVufZ-0006nd-Ag
 for xen-devel@lists.xenproject.org; Tue, 05 May 2020 10:19:21 +0000
X-Inumbo-ID: e179ae27-8eb9-11ea-9da1-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id e179ae27-8eb9-11ea-9da1-12813bfff9fa;
 Tue, 05 May 2020 10:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588673959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1P/5QYytElvztL4q85MDX6gLDmepTUOXbdNhCTBxhz4=;
 b=GR15LwTL3fnshm0QX/LZNScTDuQjZ4cBRQR6TS9LmWbGPXHWy4Z99bfh3ZLv34MDK+jpNV
 1QliD0BfZTFNVCsMI0/iu7Lc2zGTPv39F6OpmL7jG3xNhrgDX5a3ttq5jGiLd9UZvWIJNR
 QH1f818apt5zk8bZ/oRaVhqDAt8qNz0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-2AN3aTbAPjeur6A4AMgvKQ-1; Tue, 05 May 2020 06:19:14 -0400
X-MC-Unique: 2AN3aTbAPjeur6A4AMgvKQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5FA98107ACCD;
 Tue,  5 May 2020 10:19:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 48EAE627D9;
 Tue,  5 May 2020 10:19:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C9E3D11358BE; Tue,  5 May 2020 12:19:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/10] xen: Fix and improve handling of device_add usb-host
 errors
Date: Tue,  5 May 2020 12:19:00 +0200
Message-Id: <20200505101908.6207-3-armbru@redhat.com>
In-Reply-To: <20200505101908.6207-1-armbru@redhat.com>
References: <20200505101908.6207-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
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
=20
@@ -755,13 +756,16 @@ static void usbback_portid_add(struct usbback_info *u=
sbif, unsigned port,
     qdict_put_int(qdict, "port", port);
     qdict_put_int(qdict, "hostbus", atoi(busid));
     qdict_put_str(qdict, "hostport", portname);
-    opts =3D qemu_opts_from_qdict(qemu_find_opts("device"), qdict, &local_=
err);
-    if (local_err) {
-        goto err;
-    }
+    opts =3D qemu_opts_from_qdict(qemu_find_opts("device"), qdict,
+                                &error_abort);
     usbif->ports[port - 1].dev =3D USB_DEVICE(qdev_device_add(opts, &local=
_err));
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
     speed =3D usbif->ports[port - 1].dev->speed;
@@ -793,11 +797,6 @@ static void usbback_portid_add(struct usbback_info *us=
bif, unsigned port,
     usbback_hotplug_enq(usbif, port);
=20
     TR_BUS(&usbif->xendev, "port %d attached\n", port);
-    return;
-
-err:
-    qobject_unref(qdict);
-    xen_pv_printf(&usbif->xendev, 0, "device %s could not be opened\n", bu=
sid);
 }
=20
 static void usbback_process_port(struct usbback_info *usbif, unsigned port=
)
--=20
2.21.1


