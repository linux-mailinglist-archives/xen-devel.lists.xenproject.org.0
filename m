Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6FA415334
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 00:11:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193129.344001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTASs-0006JL-0q; Wed, 22 Sep 2021 22:11:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193129.344001; Wed, 22 Sep 2021 22:11:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTASr-0006Bg-SY; Wed, 22 Sep 2021 22:11:41 +0000
Received: by outflank-mailman (input) for mailman id 193129;
 Wed, 22 Sep 2021 22:11:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D6HN=OM=greensocs.com=damien.hedde@srs-us1.protection.inumbo.net>)
 id 1mTASq-00069l-0E
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 22:11:40 +0000
Received: from beetle.greensocs.com (unknown [5.135.226.135])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1f3df2a5-6f41-4bbd-9754-11cdc41aeea1;
 Wed, 22 Sep 2021 22:11:38 +0000 (UTC)
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 73F7B21EC7;
 Wed, 22 Sep 2021 16:15:53 +0000 (UTC)
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
X-Inumbo-ID: 1f3df2a5-6f41-4bbd-9754-11cdc41aeea1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1632327354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PKL+1gA6erzUqEOhaWDpJ5h6F3B//VEnmj0ACbfqSX0=;
	b=GLtOAaaPxTWsl4cHZ/jIm6GfdPz+u/QkndP3ql38H10VNAIkQ1EwIQigKoDRTjU3Cd27wF
	Z6jKSrHDiHVqytohW3K+04Wi7HCpPSBqociS+H/TTxSa5+XQbb0tINq8trisTlGjDgV8bz
	b/1Ub1hjekRXgH5VyDRqY1f0lN6lPzM=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Cc: Damien Hedde <damien.hedde@greensocs.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Ani Sinha <ani@anisinha.ca>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Eric Auger <eric.auger@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	qemu-riscv@nongnu.org,
	xen-devel@lists.xenproject.org,
	mark.burton@greensocs.com,
	mirela.grujic@greensocs.com,
	edgari@xilinx.com,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC PATCH v2 08/16] qdev-monitor: Check sysbus device type before creating it
Date: Wed, 22 Sep 2021 18:13:57 +0200
Message-Id: <20210922161405.140018-9-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922161405.140018-1-damien.hedde@greensocs.com>
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes

Add an early check to test if the requested sysbus device type
is allowed by the current machine before creating the device. This
impacts both -device cli option and device_add qmp command.

Before this patch, the check was done well after the device has
been created (in a machine init done notifier). We can now report
the error right away.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 softmmu/qdev-monitor.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 47ccd90be8..f1c9242855 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -40,6 +40,7 @@
 #include "qemu/cutils.h"
 #include "hw/qdev-properties.h"
 #include "hw/clock.h"
+#include "hw/boards.h"
 
 /*
  * Aliases were a bad idea from the start.  Let's keep them
@@ -268,6 +269,16 @@ static DeviceClass *qdev_get_device_class(const char **driver, Error **errp)
         return NULL;
     }
 
+    if (object_class_dynamic_cast(oc, TYPE_SYS_BUS_DEVICE)) {
+        /* sysbus devices need to be allowed by the machine */
+        MachineClass *mc = MACHINE_CLASS(object_get_class(qdev_get_machine()));
+        if (!machine_class_is_dynamic_sysbus_dev_allowed(mc, *driver)) {
+            error_setg(errp, "'%s' is not an allowed pluggable sysbus device "
+                             " type for the machine", *driver);
+            return NULL;
+        }
+    }
+
     return dc;
 }
 
-- 
2.33.0


