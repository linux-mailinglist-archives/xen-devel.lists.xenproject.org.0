Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E6037A3A7
	for <lists+xen-devel@lfdr.de>; Tue, 11 May 2021 11:29:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125680.236597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgOhE-0007US-HW; Tue, 11 May 2021 09:28:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125680.236597; Tue, 11 May 2021 09:28:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgOhE-0007Qv-CF; Tue, 11 May 2021 09:28:56 +0000
Received: by outflank-mailman (input) for mailman id 125680;
 Tue, 11 May 2021 09:28:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tiF3=KG=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lgOhD-00064e-KL
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 09:28:55 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5f774ed2-8a08-4d8d-b5c1-4a94b2073dcf;
 Tue, 11 May 2021 09:28:45 +0000 (UTC)
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
X-Inumbo-ID: 5f774ed2-8a08-4d8d-b5c1-4a94b2073dcf
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620725325;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K74/i7Z8FufP+fc6tmHyA0vTMqCvL54/sWOINqL7csI=;
  b=KIufayX2it1DXubWr4oODHqXSInoQiKk8toRbdum7g/waO8K8UhBCdF1
   9n6pEdi1AXeFTaHb4Ir1gPXuJ422DS/Gvzazla2WWgR91/T0jqTvcHWj3
   NsuJYXlRxKfnvCk2ZOYJCRVnHRh1ORmdTxCtkFWaMU72Xz34Emsm4A2IU
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: C2udhTb7XNw4I3BAQVNa47ZlG+25lLUTOmOlJtmRb+k/aGKnfDYl1dsCxbPQ9fg2O20EWNSfcw
 CBJGYl8HjuUvglOzjMqPANovYMmgt4KgqMHyCJh3McnPZGOtDfDQCYDzrUYqiisQL88FDELnYS
 l5yrQ9gXDJ0ED4VcGYwmtx9hmNGBJQgln0yL/reo/8fbEYn9xbnuzL0+284S5AABTv8K9qJ6Mc
 3w1c64oe2EaRW7mA8SwZVkqQnAYRYcpbx5dbtjJ3FlrA6PIRXH1mNVOoMLGhtBG+7rDGdoK4ht
 ex0=
X-SBRS: 5.1
X-MesageID: 43528826
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:XbYuM6+tY2xxHSW8z+tuk+DeI+orL9Y04lQ7vn2YSXRuHfBw8P
 re+8jztCWE8Qr5N0tApTntAsS9qDbnhPxICOoqTNOftWvd2FdARbsKheCJ/9SjIVyaygc079
 YHT0EUMrPN5DZB4foSmDPIcOod/A==
X-IronPort-AV: E=Sophos;i="5.82,290,1613451600"; 
   d="scan'208";a="43528826"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jason Andryuk
	<jandryuk@gmail.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 7/8] libxl: Use `id` with the "eject" QMP command
Date: Tue, 11 May 2021 10:28:09 +0100
Message-ID: <20210511092810.13759-8-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511092810.13759-1-anthony.perard@citrix.com>
References: <20210511092810.13759-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

`device` parameter is deprecated since QEMU 2.8.

This requires changes to the command line introduced by:
    "libxl: Use -device for cd-rom drives"

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/libs/light/libxl_disk.c | 43 +++++++++++++++++++++++++++++------
 1 file changed, 36 insertions(+), 7 deletions(-)

diff --git a/tools/libs/light/libxl_disk.c b/tools/libs/light/libxl_disk.c
index 411ffeaca6ce..faabdea7a4c3 100644
--- a/tools/libs/light/libxl_disk.c
+++ b/tools/libs/light/libxl_disk.c
@@ -656,6 +656,8 @@ typedef struct {
 
 static void cdrom_insert_lock_acquired(libxl__egc *, libxl__ev_slowlock *,
                                        int rc);
+static void cdrom_insert_qmp_connected(libxl__egc *, libxl__ev_qmp *,
+                                       const libxl__json_object *, int rc);
 static void cdrom_insert_ejected(libxl__egc *egc, libxl__ev_qmp *,
                                  const libxl__json_object *, int rc);
 static void cdrom_insert_addfd_cb(libxl__egc *egc, libxl__ev_qmp *,
@@ -770,13 +772,12 @@ static void cdrom_insert_lock_acquired(libxl__egc *egc,
      */
 
     if (cis->dm_ver == LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN) {
-        libxl__json_object *args = NULL;
-        int devid = libxl__device_disk_dev_number(cis->disk->vdev,
-                                                  NULL, NULL);
-
-        QMP_PARAMETERS_SPRINTF(&args, "device", "ide-%i", devid);
-        cis->qmp.callback = cdrom_insert_ejected;
-        rc = libxl__ev_qmp_send(egc, &cis->qmp, "eject", args);
+        /* Before running the "eject" command, we need to know QEMU's
+         * version to find out which command to issue.
+         * cis->qmp isn't in Connected state yet, so run a dummy command
+         * to have QEMU's version available. */
+        cis->qmp.callback = cdrom_insert_qmp_connected;
+        rc = libxl__ev_qmp_send(egc, &cis->qmp, "query-version", NULL);
         if (rc) goto out;
     } else {
         cdrom_insert_ejected(egc, &cis->qmp, NULL, 0); /* must be last */
@@ -787,6 +788,34 @@ static void cdrom_insert_lock_acquired(libxl__egc *egc,
     cdrom_insert_done(egc, cis, rc); /* must be last */
 }
 
+static void cdrom_insert_qmp_connected(libxl__egc *egc, libxl__ev_qmp *qmp,
+                                       const libxl__json_object *response,
+                                       int rc)
+{
+    libxl__cdrom_insert_state *cis = CONTAINER_OF(qmp, *cis, qmp);
+    STATE_AO_GC(cis->ao);
+    libxl__json_object *args = NULL;
+    int devid = libxl__device_disk_dev_number(cis->disk->vdev,
+                                              NULL, NULL);
+
+    if (rc) goto out;
+
+    /* Using `device` parameter is deprecated since QEMU 2.8, we should
+     * use `id` now. They both have different meaning but we set the
+     * same `id` on -drive and -device on the command line.
+     */
+    if (libxl__qmp_ev_qemu_compare_version(qmp, 2, 8, 0) >= 0)
+        QMP_PARAMETERS_SPRINTF(&args, "id", "ide-%i", devid);
+    else
+        QMP_PARAMETERS_SPRINTF(&args, "device", "ide-%i", devid);
+    qmp->callback = cdrom_insert_ejected;
+    rc = libxl__ev_qmp_send(egc, qmp, "eject", args);
+    if (rc) goto out;
+    return;
+out:
+    cdrom_insert_done(egc, cis, rc); /* must be last */
+}
+
 static void cdrom_insert_ejected(libxl__egc *egc,
                                  libxl__ev_qmp *qmp,
                                  const libxl__json_object *response,
-- 
Anthony PERARD


