Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A993696BB
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 18:16:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116494.222407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZyTm-00008p-MH; Fri, 23 Apr 2021 16:16:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116494.222407; Fri, 23 Apr 2021 16:16:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZyTm-000083-Hj; Fri, 23 Apr 2021 16:16:30 +0000
Received: by outflank-mailman (input) for mailman id 116494;
 Fri, 23 Apr 2021 16:16:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c6bT=JU=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lZyTk-00082q-HE
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 16:16:28 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a25425e1-f1d0-45cb-aff2-8f769b5f6828;
 Fri, 23 Apr 2021 16:16:08 +0000 (UTC)
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
X-Inumbo-ID: a25425e1-f1d0-45cb-aff2-8f769b5f6828
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619194568;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4+T21LhPNuthVDj7BNA6YAigMRwkRpvcvJyGv+dq/ps=;
  b=SOLC15s72rz/89vYDI4t7zA7nFfz86YT22nMl2iiGMJKE3OXVDE2wul2
   1PK6To0JUlUoxVWbxK3sNviS1hs0IxRUJxchU51PrlAa0d4GXe0Oq2Qzn
   xm1MHojRJKlmXHCZluofoLafgFwmz2346cmHJMrzkHv4AqWKfaICIHL2B
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: P6My/Z8aM1o8STHsTRAiZoDW9jzU+Y7vzkkAbzjreb7tqDurvzQrpBQfYXoPD+Gh6Ov53CxROm
 qpcDLGYXbAsii2i8px3vAMVjKYCexuq/y8/QJ5ZWASgCdjH/YYN3fdF6bR99NRUlp1CnjYAQzn
 1wot1YSmJ/UzzHUP1xeqDnbx1arvsgY+kV6EDgqBv+njpEQdr9e9s6jhkOMJeo77EcY0nr0Flu
 YvuD5PsJ/ZtaDdiDiYefUB0xXUhKucpqHNfR3XDtMsXkfawbm/EITjdChj5vWKj3YpDJARILQ7
 V4I=
X-SBRS: 5.1
X-MesageID: 42290111
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:F0PkEqC+CuPZZ67lHegltMeALOonbusQ8zAX/mhLY1h8btGYm8
 eynP4SyB/zj3IrVGs9nM2bUZPsfVr1zrQwxYUKJ7+tUE3duGWuJJx/9oeK+VfdMgXE3Kpm2a
 9kGpIUNPTZB1J3lNu/xQG+HcopztXvytHSuc715R5WPGJXQotn6Bp0DRveN0VwShVPC5ZRLu
 vn2uNsoT28dXMLKvmqH3VtZZmIm/TntrLDJSQHCRku9RWUgVqThILSPhCE0n4lIlRy6Jg492
 ytqW3Ez4Wl98q20xrNk1LUhq4m4OfJ7vtmKIiyhtMOKjPq4zzYKbhJf7GZpjg6rKWOxT8R4b
 /xiiwtNchy9H/dF1vdyXSC5yDa3Dkj8HPkw1OD6EGT2PDRfi4wCMZKmOtiA3nkwncgp9113e
 Zq2G+UpvNsfHf9tRn9/NTBWlVWkFO1qxMZ4IsupkFYOLF/VJZh6agkuG9FGpYJGyz3rKo9Fv
 N1Mc3a7PFKNXuHcnHwpABUsZORd0V2Oi3DblkJu8ST3TQTtmt+1VEkyMsWmWpF3I4hSqND+/
 /PPs1T5f9zZ/5TSZg4KPYKQMOxBGCIawnLKniuLVPuE7xCHH7RtZjt4vEQ6PuxcJIFiLs+8a
 6xEW9whCoXQQbDGMeO1JpE/lTmW2OmRwngzclY+tx3obv5SL33MTCSSVwnnse6ys9vQfHzar
 KWAtZ7EvXjJWzhFcJixAvlQaRfLnEYTYkUt78AKhCzi/OODrevmv3Qcf7VKraoOy0jQHnDDn
 wKWyW2IM1B60usS2LpmRS5YQKpRmXPubZLVITK9ekaz4YAcqdWtBIOtFi/7saXbTtYsqI3e0
 N6KKj9kryyoHS3+Wqg1RQoBjNtSmJupJnwWXJDogEHd2nud6wYhtmZcWdOmGecKgRnVMPQGg
 5Hr1Fx8aa6RqbggRwKOpaCCCa3nnETrHWFQ9MggaWF/97iYY59JI0hQrZNGQLCEAFVlQ5mpH
 xYUhINQlbSG1rV+OKYpa1RINuaVtFnxC+3PMZfqBvkxDihjPBqYkFeYhmDfoq8hx00Sz9dm1
 trmpVv/IaoqHKIMmswgOMxLVtWTn+YaYg2QDitbJlIm7ztZQF7RXqLgzvfkB0oZm/27Swp9x
 PcBDzRdvfRDlVHvHdElq7s7VNvb22YO1l9c3ZgrORGZCz7k2c21e+Afayo1WSNLlME3+EGKT
 nACAFiVD9G1pSy1BSPniyFGmhjzpIyPvbFBLBmd73IwHuiJMmJkq4BdsUktapNJZTrsuURV/
 iYdBLQJDTkC/kx0wjQv207IkBP2QwZuOKt3Aeg4Hmz3XY5D/aXKFN6R6sDK9XZ62T/Xf6H3J
 hwkNpdh5r6DkzhLtqdja3HZT9KLR3e5XS7SOwlsphYt6M/vrkbJeitbRLYkHVcmBkuJsb9k0
 0TBLlh6LfaI4l1YogcfTla8ldBrqX8EGI79gjtRukwclEmgyWFY5eH47/UpaEuBUPErg3qIl
 Wb+zBc+fCAXybr789rN4sgZWBNLE474zB++enHcYvaAgCjbftC81q3KWXVSs4odIGVXbEL6g
 9n6NSJlfKNfyX22ArMrSJ2S5g+glqPUIe3GkaQAuZG/NyxJESUjqar6MC1ii3rSTHTUTVqua
 RVMUoKbspCjTE+jIo4liiqI5aH3H4Yrw==
X-IronPort-AV: E=Sophos;i="5.82,246,1613451600"; 
   d="scan'208";a="42290111"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH 7/8] libxl: Use `id` with the "eject" QMP command
Date: Fri, 23 Apr 2021 17:15:57 +0100
Message-ID: <20210423161558.224367-8-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210423161558.224367-1-anthony.perard@citrix.com>
References: <20210423161558.224367-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

`device` parameter is deprecated since QEMU 2.8.

This requires changes to the command line introduced by:
    "libxl: Use -device for cd-rom drives"

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
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


