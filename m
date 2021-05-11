Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4527D37A3A6
	for <lists+xen-devel@lfdr.de>; Tue, 11 May 2021 11:28:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125669.236585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgOh2-0006Pg-45; Tue, 11 May 2021 09:28:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125669.236585; Tue, 11 May 2021 09:28:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgOh1-0006Kn-TK; Tue, 11 May 2021 09:28:43 +0000
Received: by outflank-mailman (input) for mailman id 125669;
 Tue, 11 May 2021 09:28:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tiF3=KG=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lgOgz-0003CS-QV
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 09:28:41 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 46a06a73-9bbc-4a92-90a9-b86aac1d7837;
 Tue, 11 May 2021 09:28:24 +0000 (UTC)
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
X-Inumbo-ID: 46a06a73-9bbc-4a92-90a9-b86aac1d7837
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620725303;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oQ0ssEsENtdgMjUiXBgiKma4Z4zbQ49R9PO2WXFh8mc=;
  b=KvTd8sjoVescoSgfhEW4g93S/Y+zTUMyIS2LHb5dbElW8lCADJVwKlg2
   r8Ors8JO8CoMMjKp8kIcVrZzfcVVx7Ubokmrw9mpEZ86tO7i79wegJjXa
   IlDqWyLge5kzesOfRVARzRG1Yh05tHaFXApkdYMLjk/775E9DJJqq3BCF
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: s1FEg6hnKqsfVKtX/Nvna1UfJOpMpc3lWMl3vRtD4XDJlvvBV9glarTxH3Om61vRuEmMTjoiZf
 ilAawEAZOEwQWVgF0cABftxT1/8Z2ws7WylXVLiGV+gQMYoeBhdzOGSOAPN1FUPJ6vxUPmHfNY
 f4jsbjqG7O72uNdlxmjCJFkXT81CMuN0PzXFMDHfO3rwGKsVrctcnECu/Fby0r3SOV59zvpOAk
 +xJAX8VK1Go1YGHwKHYE2frTNnDi/8rVf1irNM2JahytSpmWEaZFl14IvBwgUNrmLgtYK9Jq+y
 rDk=
X-SBRS: 5.1
X-MesageID: 43624005
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:FNSAY64UP9lUT8BKLQPXwAzXdLJyesId70hD6qkQc3Fom62j5q
 WTdZEgvyMc5wx/ZJhNo7690cq7MBHhHPxOgbX5VI3KNGXbUQOTR72KhrGSoAEIdReeygZcv5
 0QCZSXCrfLfCVHZRCR2njFLz4iquP3j5xBnY3lvhNQpZkBUdAZ0+9+YDzrdXFedU19KrcSMo
 GT3cZDryrIQwVtUizqbkN1OdQqvrfw5evbXSI=
X-IronPort-AV: E=Sophos;i="5.82,290,1613451600"; 
   d="scan'208";a="43624005"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jason Andryuk
	<jandryuk@gmail.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 8/8] libxl: Replace QMP command "change" by "blockdev-change-media"
Date: Tue, 11 May 2021 10:28:10 +0100
Message-ID: <20210511092810.13759-9-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511092810.13759-1-anthony.perard@citrix.com>
References: <20210511092810.13759-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

"change" command as been removed in QEMU 6.0. We can use
"blockdev-change-medium" instead.

Using `id` with "blockdev-change-medium" requires a change to the QEMU
command line, introduced by:
    "libxl: Use -device for cd-rom drives"

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/libs/light/libxl_disk.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/tools/libs/light/libxl_disk.c b/tools/libs/light/libxl_disk.c
index faabdea7a4c3..93936d0dd0f8 100644
--- a/tools/libs/light/libxl_disk.c
+++ b/tools/libs/light/libxl_disk.c
@@ -962,12 +962,26 @@ static void cdrom_insert_addfd_cb(libxl__egc *egc,
     fdset = libxl__json_object_get_integer(o);
 
     devid = libxl__device_disk_dev_number(disk->vdev, NULL, NULL);
-    QMP_PARAMETERS_SPRINTF(&args, "device", "ide-%i", devid);
-    QMP_PARAMETERS_SPRINTF(&args, "target", "/dev/fdset/%d", fdset);
-    libxl__qmp_param_add_string(gc, &args, "arg",
-        libxl__qemu_disk_format_string(disk->format));
     qmp->callback = cdrom_insert_inserted;
-    rc = libxl__ev_qmp_send(egc, qmp, "change", args);
+
+    /* "change" is deprecated since QEMU 2.5 and the `device` parameter for
+     * for "blockdev-change-medium" is deprecated in QEMU 2.8.
+     * But `id` is only available in 2.8 we'll start using the new command
+     * with `id` with QEMU 2.8.
+     */
+    if (libxl__qmp_ev_qemu_compare_version(qmp, 2, 8, 0) >= 0) {
+        QMP_PARAMETERS_SPRINTF(&args, "id", "ide-%i", devid);
+        QMP_PARAMETERS_SPRINTF(&args, "filename", "/dev/fdset/%d", fdset);
+        libxl__qmp_param_add_string(gc, &args, "format",
+            libxl__qemu_disk_format_string(disk->format));
+        rc = libxl__ev_qmp_send(egc, qmp, "blockdev-change-medium", args);
+    } else {
+        QMP_PARAMETERS_SPRINTF(&args, "device", "ide-%i", devid);
+        QMP_PARAMETERS_SPRINTF(&args, "target", "/dev/fdset/%d", fdset);
+        libxl__qmp_param_add_string(gc, &args, "arg",
+            libxl__qemu_disk_format_string(disk->format));
+        rc = libxl__ev_qmp_send(egc, qmp, "change", args);
+    }
 out:
     if (rc)
         cdrom_insert_done(egc, cis, rc); /* must be last */
-- 
Anthony PERARD


