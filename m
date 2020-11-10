Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B3D2ADD71
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 18:52:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23576.50477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcXoT-0003O4-6Z; Tue, 10 Nov 2020 17:52:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23576.50477; Tue, 10 Nov 2020 17:52:13 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcXoS-0003NC-W6; Tue, 10 Nov 2020 17:52:13 +0000
Received: by outflank-mailman (input) for mailman id 23576;
 Tue, 10 Nov 2020 17:52:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l7/2=EQ=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kcXoS-0002tQ-2M
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 17:52:12 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 94410a4f-55d2-45bd-9fc6-ddca36a6213a;
 Tue, 10 Nov 2020 17:51:57 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kcXoC-0006Z8-15; Tue, 10 Nov 2020 17:51:56 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kcXoB-0007RC-Pq; Tue, 10 Nov 2020 17:51:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=l7/2=EQ=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kcXoS-0002tQ-2M
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 17:52:12 +0000
X-Inumbo-ID: 94410a4f-55d2-45bd-9fc6-ddca36a6213a
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 94410a4f-55d2-45bd-9fc6-ddca36a6213a;
	Tue, 10 Nov 2020 17:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=BsdChYzNHsC0mIvRqh9QjeS15LyK+GbGCkAXV4LjPl8=; b=DE66vFvuT2mUJCzcG8qF0a8R+K
	Ob6x7obXVMkfdd+PxX1Rt263uUsLuh3br1DQr/7tpFN5y11Cm3qyr4cqqbNKli8L7FOSpgMeNpGVP
	c3NTdQ4Q2wEq5EWEgNyxmNzL37+cBOavwkqkOLlvm5IoAORe93N6ADtPXP9Log9EHLGA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kcXoC-0006Z8-15; Tue, 10 Nov 2020 17:51:56 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kcXoB-0007RC-Pq; Tue, 10 Nov 2020 17:51:56 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 06/24] libxl: stop using aodev->device_config in libxl__device_pci_add()...
Date: Tue, 10 Nov 2020 17:51:29 +0000
Message-Id: <20201110175147.7067-7-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110175147.7067-1-paul@xen.org>
References: <20201110175147.7067-1-paul@xen.org>
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
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
---
 tools/libs/light/libxl_pci.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 0abc679c3958..c9f062fc2d8b 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1055,7 +1055,7 @@ typedef struct pci_add_state {
     libxl__ev_qmp qmp;
     libxl__ev_time timeout;
     libxl_device_pci *pci;
-    int pci_domid;
+    libxl_domid pci_domid;
 } pci_add_state;
 
 static void pci_add_qemu_trad_watch_state_cb(libxl__egc *egc,
@@ -1072,7 +1072,6 @@ static void pci_add_dm_done(libxl__egc *,
 
 static void do_pci_add(libxl__egc *egc,
                        libxl_domid domid,
-                       libxl_device_pci *pci,
                        pci_add_state *pas)
 {
     STATE_AO_GC(pas->aodev->ao);
@@ -1082,7 +1081,6 @@ static void do_pci_add(libxl__egc *egc,
     /* init pci_add_state */
     libxl__xswait_init(&pas->xswait);
     libxl__ev_qmp_init(&pas->qmp);
-    pas->pci = pci;
     pas->pci_domid = domid;
     libxl__ev_time_init(&pas->timeout);
 
@@ -1545,13 +1543,10 @@ void libxl__device_pci_add(libxl__egc *egc, uint32_t domid,
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
 
@@ -1605,9 +1600,10 @@ void libxl__device_pci_add(libxl__egc *egc, uint32_t domid,
         GCNEW(pci_s);
         libxl_device_pci_init(pci_s);
         libxl_device_pci_copy(CTX, pci_s, pci);
+        pas->pci = pci_s;
         pas->callback = device_pci_add_stubdom_wait;
 
-        do_pci_add(egc, stubdomid, pci_s, pas); /* must be last */
+        do_pci_add(egc, stubdomid, pas); /* must be last */
         return;
     }
 
@@ -1662,9 +1658,8 @@ static void device_pci_add_stubdom_done(libxl__egc *egc,
     int i;
 
     /* Convenience aliases */
-    libxl__ao_device *aodev = pas->aodev;
     libxl_domid domid = pas->domid;
-    libxl_device_pci *pci = aodev->device_config;
+    libxl_device_pci *pci = pas->pci;
 
     if (rc) goto out;
 
@@ -1699,7 +1694,7 @@ static void device_pci_add_stubdom_done(libxl__egc *egc,
                 pci->vdevfn = orig_vdev;
             }
             pas->callback = device_pci_add_done;
-            do_pci_add(egc, domid, pci, pas); /* must be last */
+            do_pci_add(egc, domid, pas); /* must be last */
             return;
         }
     }
@@ -1715,7 +1710,7 @@ static void device_pci_add_done(libxl__egc *egc,
     EGC_GC;
     libxl__ao_device *aodev = pas->aodev;
     libxl_domid domid = pas->domid;
-    libxl_device_pci *pci = aodev->device_config;
+    libxl_device_pci *pci = pas->pci;
 
     if (rc) {
         LOGD(ERROR, domid,
-- 
2.20.1


