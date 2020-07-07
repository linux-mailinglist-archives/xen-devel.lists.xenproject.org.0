Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D9021746E
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 18:51:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsqo5-0000EH-1D; Tue, 07 Jul 2020 16:50:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gwtg=AS=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1jsqo3-0000Dr-5M
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2020 16:50:55 +0000
X-Inumbo-ID: 04f59fd8-c072-11ea-b7bb-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 04f59fd8-c072-11ea-b7bb-bc764e2007e4;
 Tue, 07 Jul 2020 16:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594140652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kTc4yRwO5a9XF+O06cElX+INNSFMrjGg1hnzHUx6ZOU=;
 b=aSBpSdGNECTHeybyoEgiQ9+/I91OHNtf7c59WTpSt6Bzl5c++iQf9oGyHQJPoWNEunc2vX
 qPSEqxOziyB8zC7Y/W4OPJsZ0QCbAnK52gqeug6MuEmSRy370spUUI20msi6EvDVBYcS2W
 d9dRNFzq5cNOhHON+TwAElysIA0XCNE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-8gbxd39nN9aA_Cw08BWDdA-1; Tue, 07 Jul 2020 12:50:50 -0400
X-MC-Unique: 8gbxd39nN9aA_Cw08BWDdA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B71BD1005510;
 Tue,  7 Jul 2020 16:50:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 98A2A5D9C9;
 Tue,  7 Jul 2020 16:50:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 25B3611328A3; Tue,  7 Jul 2020 18:50:37 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v12 3/8] sd: Use ERRP_AUTO_PROPAGATE()
Date: Tue,  7 Jul 2020 18:50:32 +0200
Message-Id: <20200707165037.1026246-4-armbru@redhat.com>
In-Reply-To: <20200707165037.1026246-1-armbru@redhat.com>
References: <20200707165037.1026246-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Laszlo Ersek <lersek@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, groug@kaod.org,
 Max Reitz <mreitz@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

If we want to add some info to errp (by error_prepend() or
error_append_hint()), we must use the ERRP_AUTO_PROPAGATE macro.
Otherwise, this info will not be added when errp == &error_fatal
(the program will exit prior to the error_append_hint() or
error_prepend() call).  Fix such cases.

If we want to check error after errp-function call, we need to
introduce local_err and then propagate it to errp. Instead, use
ERRP_AUTO_PROPAGATE macro, benefits are:
1. No need of explicit error_propagate call
2. No need of explicit local_err variable: use errp directly
3. ERRP_AUTO_PROPAGATE leaves errp as is if it's not NULL or
   &error_fatal, this means that we don't break error_abort
   (we'll abort on error_set, not on error_propagate)

This commit is generated by command

    sed -n '/^SD (Secure Card)$/,/^$/{s/^F: //p}' \
        MAINTAINERS | \
    xargs git ls-files | grep '\.[hc]$' | \
    xargs spatch \
        --sp-file scripts/coccinelle/auto-propagated-errp.cocci \
        --macro-file scripts/cocci-macro-file.h \
        --in-place --no-show-diff --max-width 80

Reported-by: Kevin Wolf <kwolf@redhat.com>
Reported-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
[Commit message tweaked]
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/sd/sdhci-pci.c |  7 +++----
 hw/sd/sdhci.c     | 21 +++++++++------------
 hw/sd/ssi-sd.c    | 10 +++++-----
 3 files changed, 17 insertions(+), 21 deletions(-)

diff --git a/hw/sd/sdhci-pci.c b/hw/sd/sdhci-pci.c
index 4f5977d487..38ec572fc6 100644
--- a/hw/sd/sdhci-pci.c
+++ b/hw/sd/sdhci-pci.c
@@ -29,13 +29,12 @@ static Property sdhci_pci_properties[] = {
 
 static void sdhci_pci_realize(PCIDevice *dev, Error **errp)
 {
+    ERRP_AUTO_PROPAGATE();
     SDHCIState *s = PCI_SDHCI(dev);
-    Error *local_err = NULL;
 
     sdhci_initfn(s);
-    sdhci_common_realize(s, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    sdhci_common_realize(s, errp);
+    if (*errp) {
         return;
     }
 
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index eb2be6529e..be1928784d 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1288,7 +1288,7 @@ static const MemoryRegionOps sdhci_mmio_ops = {
 
 static void sdhci_init_readonly_registers(SDHCIState *s, Error **errp)
 {
-    Error *local_err = NULL;
+    ERRP_AUTO_PROPAGATE();
 
     switch (s->sd_spec_version) {
     case 2 ... 3:
@@ -1299,9 +1299,8 @@ static void sdhci_init_readonly_registers(SDHCIState *s, Error **errp)
     }
     s->version = (SDHC_HCVER_VENDOR << 8) | (s->sd_spec_version - 1);
 
-    sdhci_check_capareg(s, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    sdhci_check_capareg(s, errp);
+    if (*errp) {
         return;
     }
 }
@@ -1332,11 +1331,10 @@ void sdhci_uninitfn(SDHCIState *s)
 
 void sdhci_common_realize(SDHCIState *s, Error **errp)
 {
-    Error *local_err = NULL;
+    ERRP_AUTO_PROPAGATE();
 
-    sdhci_init_readonly_registers(s, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    sdhci_init_readonly_registers(s, errp);
+    if (*errp) {
         return;
     }
     s->buf_maxsz = sdhci_get_fifolen(s);
@@ -1456,13 +1454,12 @@ static void sdhci_sysbus_finalize(Object *obj)
 
 static void sdhci_sysbus_realize(DeviceState *dev, Error **errp)
 {
+    ERRP_AUTO_PROPAGATE();
     SDHCIState *s = SYSBUS_SDHCI(dev);
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
-    Error *local_err = NULL;
 
-    sdhci_common_realize(s, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    sdhci_common_realize(s, errp);
+    if (*errp) {
         return;
     }
 
diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 3717b2e721..adb7fa9c24 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -241,10 +241,10 @@ static const VMStateDescription vmstate_ssi_sd = {
 
 static void ssi_sd_realize(SSISlave *d, Error **errp)
 {
+    ERRP_AUTO_PROPAGATE();
     ssi_sd_state *s = SSI_SD(d);
     DeviceState *carddev;
     DriveInfo *dinfo;
-    Error *err = NULL;
 
     qbus_create_inplace(&s->sdbus, sizeof(s->sdbus), TYPE_SD_BUS,
                         DEVICE(d), "sd-bus");
@@ -255,23 +255,23 @@ static void ssi_sd_realize(SSISlave *d, Error **errp)
     carddev = qdev_new(TYPE_SD_CARD);
     if (dinfo) {
         if (!qdev_prop_set_drive_err(carddev, "drive",
-                                     blk_by_legacy_dinfo(dinfo), &err)) {
+                                     blk_by_legacy_dinfo(dinfo), errp)) {
             goto fail;
         }
     }
 
-    if (!object_property_set_bool(OBJECT(carddev), "spi", true, &err)) {
+    if (!object_property_set_bool(OBJECT(carddev), "spi", true, errp)) {
         goto fail;
     }
 
-    if (!qdev_realize_and_unref(carddev, BUS(&s->sdbus), &err)) {
+    if (!qdev_realize_and_unref(carddev, BUS(&s->sdbus), errp)) {
         goto fail;
     }
 
     return;
 
 fail:
-    error_propagate_prepend(errp, err, "failed to init SD card: ");
+    error_prepend(errp, "failed to init SD card: ");
 }
 
 static void ssi_sd_reset(DeviceState *dev)
-- 
2.26.2


