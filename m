Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9E1217470
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 18:51:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsqo3-0000E3-OC; Tue, 07 Jul 2020 16:50:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gwtg=AS=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1jsqo2-0000Df-Vw
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2020 16:50:55 +0000
X-Inumbo-ID: 05212e3e-c072-11ea-8dc2-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 05212e3e-c072-11ea-8dc2-12813bfff9fa;
 Tue, 07 Jul 2020 16:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594140653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZwJYdyi9Qt1/sCxmydGDv1Kj4p25FpuhPaW1i/Z86t0=;
 b=DMXS20HIwIMuAu1PfTHuEIpjBPpxgnpsLqvc1fMB6kb3OQSowZl27A0LHhzi0SpCe5PJ+X
 PWHjo4h2GxaWC/QHwns4Fzvh/ixgr3muUf6QfbbDr61ePz47/Ewva0VPE+Kq33lFgxtGqK
 exbtSPiMI9f8GpZBdlDlO48ZFBrGCGw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-cFlUF-bKNRqFv4oHtYQYbA-1; Tue, 07 Jul 2020 12:50:51 -0400
X-MC-Unique: cFlUF-bKNRqFv4oHtYQYbA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A42E107ACF2;
 Tue,  7 Jul 2020 16:50:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C93719D61;
 Tue,  7 Jul 2020 16:50:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2960311326E4; Tue,  7 Jul 2020 18:50:37 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v12 4/8] pflash: Use ERRP_AUTO_PROPAGATE()
Date: Tue,  7 Jul 2020 18:50:33 +0200
Message-Id: <20200707165037.1026246-5-armbru@redhat.com>
In-Reply-To: <20200707165037.1026246-1-armbru@redhat.com>
References: <20200707165037.1026246-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

    sed -n '/^Parallel NOR Flash devices$/,/^$/{s/^F: //p}' \
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
 hw/block/pflash_cfi01.c | 7 +++----
 hw/block/pflash_cfi02.c | 7 +++----
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index cddc3a5a0c..859cfeae14 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -696,12 +696,12 @@ static const MemoryRegionOps pflash_cfi01_ops = {
 
 static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
 {
+    ERRP_AUTO_PROPAGATE();
     PFlashCFI01 *pfl = PFLASH_CFI01(dev);
     uint64_t total_len;
     int ret;
     uint64_t blocks_per_device, sector_len_per_device, device_len;
     int num_devices;
-    Error *local_err = NULL;
 
     if (pfl->sector_len == 0) {
         error_setg(errp, "attribute \"sector-length\" not specified or zero.");
@@ -735,9 +735,8 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
         &pfl->mem, OBJECT(dev),
         &pflash_cfi01_ops,
         pfl,
-        pfl->name, total_len, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+        pfl->name, total_len, errp);
+    if (*errp) {
         return;
     }
 
diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index b40ce2335a..15035ee5ef 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -724,9 +724,9 @@ static const MemoryRegionOps pflash_cfi02_ops = {
 
 static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
 {
+    ERRP_AUTO_PROPAGATE();
     PFlashCFI02 *pfl = PFLASH_CFI02(dev);
     int ret;
-    Error *local_err = NULL;
 
     if (pfl->uniform_sector_len == 0 && pfl->sector_len[0] == 0) {
         error_setg(errp, "attribute \"sector-length\" not specified or zero.");
@@ -792,9 +792,8 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
 
     memory_region_init_rom_device(&pfl->orig_mem, OBJECT(pfl),
                                   &pflash_cfi02_ops, pfl, pfl->name,
-                                  pfl->chip_len, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+                                  pfl->chip_len, errp);
+    if (*errp) {
         return;
     }
 
-- 
2.26.2


