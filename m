Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C792CD904
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 15:25:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43537.78282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkpYI-0000gf-8r; Thu, 03 Dec 2020 14:25:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43537.78282; Thu, 03 Dec 2020 14:25:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkpYH-0000ee-W9; Thu, 03 Dec 2020 14:25:45 +0000
Received: by outflank-mailman (input) for mailman id 43537;
 Thu, 03 Dec 2020 14:25:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kkpYF-0000bI-Tz
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 14:25:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kkpYF-0006ME-8g; Thu, 03 Dec 2020 14:25:43 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com
 ([86.183.162.145] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kkpYF-00015c-1F; Thu, 03 Dec 2020 14:25:43 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=BK8cHNgffedaGJNTcMum0Oa1ccaOx/vujwPmOihUqQ8=; b=BlVacWFPVaJDKWySjfgvowc4Uq
	lhjT3wslNYyeYeXuK5Nx+wVS1p3A6iqEKh3+NiM9GI84Ad7lxuMEhgcGJbm8tPxWSuhKX+QeV5XEi
	pXtDeVTo5ISi8UJ+LBKpxm3ucFK1IFNFHoOuEQxftAUS4jQwwxmV9kXEoXue0iNH9ZNA=;
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 07/23] libxl: stop using aodev->device_config in libxl__device_pci_add()...
Date: Thu,  3 Dec 2020 14:25:18 +0000
Message-Id: <20201203142534.4017-8-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201203142534.4017-1-paul@xen.org>
References: <20201203142534.4017-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

... to hold a pointer to the device.

There is already a 'pci' field in 'pci_add_state' so simply use that from
the start. This also allows the 'pci' (#3) argument to be dropped from
do_pci_add().

NOTE: This patch also changes the type of the 'pci_domid' field in
      'pci_add_state' from 'int' to 'libxl_domid' which is more appropriate
      given what the field is used for.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
---
 tools/libs/light/libxl_pci.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 23f3f78992fd..31eaa95923c4 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1074,7 +1074,7 @@ typedef struct pci_add_state {
     libxl__ev_qmp qmp;
     libxl__ev_time timeout;
     libxl_device_pci *pci;
-    int pci_domid;
+    libxl_domid pci_domid;
 } pci_add_state;
 
 static void pci_add_qemu_trad_watch_state_cb(libxl__egc *egc,
@@ -1091,7 +1091,6 @@ static void pci_add_dm_done(libxl__egc *,
 
 static void do_pci_add(libxl__egc *egc,
                        libxl_domid domid,
-                       libxl_device_pci *pci,
                        pci_add_state *pas)
 {
     STATE_AO_GC(pas->aodev->ao);
@@ -1101,7 +1100,6 @@ static void do_pci_add(libxl__egc *egc,
     /* init pci_add_state */
     libxl__xswait_init(&pas->xswait);
     libxl__ev_qmp_init(&pas->qmp);
-    pas->pci = pci;
     pas->pci_domid = domid;
     libxl__ev_time_init(&pas->timeout);
 
@@ -1564,13 +1562,10 @@ void libxl__device_pci_add(libxl__egc *egc, uint32_t domid,
     int stubdomid = 0;
     pci_add_state *pas;
 
-    /* Store *pci to be used by callbacks */
-    aodev->device_config = pci;
-    aodev->device_type = &libxl__pci_devtype;
-
     GCNEW(pas);
     pas->aodev = aodev;
     pas->domid = domid;
+    pas->pci = pci;
     pas->starting = starting;
     pas->callback = device_pci_add_stubdom_done;
 
@@ -1624,9 +1619,10 @@ void libxl__device_pci_add(libxl__egc *egc, uint32_t domid,
         GCNEW(pci_s);
         libxl_device_pci_init(pci_s);
         libxl_device_pci_copy(CTX, pci_s, pci);
+        pas->pci = pci_s;
         pas->callback = device_pci_add_stubdom_wait;
 
-        do_pci_add(egc, stubdomid, pci_s, pas); /* must be last */
+        do_pci_add(egc, stubdomid, pas); /* must be last */
         return;
     }
 
@@ -1681,9 +1677,8 @@ static void device_pci_add_stubdom_done(libxl__egc *egc,
     int i;
 
     /* Convenience aliases */
-    libxl__ao_device *aodev = pas->aodev;
     libxl_domid domid = pas->domid;
-    libxl_device_pci *pci = aodev->device_config;
+    libxl_device_pci *pci = pas->pci;
 
     if (rc) goto out;
 
@@ -1718,7 +1713,7 @@ static void device_pci_add_stubdom_done(libxl__egc *egc,
                 pci->vdevfn = orig_vdev;
             }
             pas->callback = device_pci_add_done;
-            do_pci_add(egc, domid, pci, pas); /* must be last */
+            do_pci_add(egc, domid, pas); /* must be last */
             return;
         }
     }
@@ -1734,7 +1729,7 @@ static void device_pci_add_done(libxl__egc *egc,
     EGC_GC;
     libxl__ao_device *aodev = pas->aodev;
     libxl_domid domid = pas->domid;
-    libxl_device_pci *pci = aodev->device_config;
+    libxl_device_pci *pci = pas->pci;
 
     if (rc) {
         LOGD(ERROR, domid,
-- 
2.20.1


