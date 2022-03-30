Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D67BA4ECD82
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 21:48:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296524.504769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZeHb-0006xN-R0; Wed, 30 Mar 2022 19:47:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296524.504769; Wed, 30 Mar 2022 19:47:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZeHb-0006vI-No; Wed, 30 Mar 2022 19:47:07 +0000
Received: by outflank-mailman (input) for mailman id 296524;
 Wed, 30 Mar 2022 19:47:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wjcS=UJ=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1nZeHa-0006vC-Kz
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 19:47:06 +0000
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [2607:f8b0:4864:20::829])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c4fc833-b062-11ec-8fbc-03012f2f19d4;
 Wed, 30 Mar 2022 21:47:04 +0200 (CEST)
Received: by mail-qt1-x829.google.com with SMTP id s11so19113150qtc.3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Mar 2022 12:47:04 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
 by smtp.gmail.com with ESMTPSA id
 x4-20020a05620a258400b0067d47fb5aa4sm1895896qko.63.2022.03.30.12.47.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 12:47:02 -0700 (PDT)
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
X-Inumbo-ID: 2c4fc833-b062-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SyDB2WAHAhwiKBINMlehh9VGxcM27O5l3BvqNPNjvAo=;
        b=ewQRmR9r9FWsDoBzfGiucgKYiugn/l8Na2fK4+7Pwu56IpYC63c9463MqRrk2/DXfp
         8lHmRvhxHEZdVvejelEwXTlwxDITwcPKUg2d3S4z8YQBVkobE28uNOvGpgB4hHRSOrhf
         z270tjUU/2gvjPHJtQZKfCMddDYbzwgWG0iauRflqHeR0hNbWikYbH+ONkJDw6OK63ic
         3NVlyddoihGWyrSLqVpKsP59uYH1RfLVHroM9Ypgg4fjomnE9ex35bMF834+t7ycAgWd
         DjHLVQVzUd+oA0R00wrn/tXxBrTWayxAy/vxHRDXSNn/ibRD651orIZoh5sy+POTobqp
         sFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SyDB2WAHAhwiKBINMlehh9VGxcM27O5l3BvqNPNjvAo=;
        b=e6iuf7fzVAC3Q69FKi92v8EWFp0um8EmVu/7ElPBu0/x+6WgUFW4dcNTW2nuY0gvAh
         bBpd2jZOEuTCE6EVVXMsdTWpexECFTh84HNoN261QDCe812w8qggYsPHu3Zm/kxN7GYP
         MUlQLdZ/bRCOIL3jNmcPyVZUxgkNzTbo8v0rGe6GjURlNk87tIiG6oS95Ugmk0yLzA1Z
         S/LGkAL+q8Key39weUnCOy3MVBpsqatMojXDPU4sW9tLuxC6LWNNXk7oCOL2tM5273E6
         AeR6VAAy0d+oij7Vyg9Vc5GgMCbPyiQ+/Nq5Tk8i85I4jYvQRMDLSGrf9KPHsjgEVnvk
         ODxA==
X-Gm-Message-State: AOAM533oAS1apQkaR7bMS4/mdYNRjZnycharH35eA4gp//KQ59jMUXwC
	if/qKIS1CrCvXJCDpwvzAka3UtI/aRs=
X-Google-Smtp-Source: ABdhPJwxzfMZhl7myAdznnlaHwalOTY5yvtzsKCQATMNu0GEdJRII5z+N7WvmreWiqTh0NbgJa387g==
X-Received: by 2002:a05:622a:1801:b0:2e0:6909:6e0 with SMTP id t1-20020a05622a180100b002e0690906e0mr1186694qtc.148.1648669622856;
        Wed, 30 Mar 2022 12:47:02 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH] libxl: Retry QMP PCI device_add
Date: Wed, 30 Mar 2022 15:46:56 -0400
Message-Id: <20220330194656.39051-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PCI device assignment to an HVM with stubdom is potentially racy.  First
the PCI device is assigned to the stubdom via the PV PCI protocol.  Then
QEMU is sent a QMP command to attach the PCI device to QEMU running
within the stubdom.  However, the sysfs entries within the stubdom may
not have appeared by the time QEMU receives the device_add command
resulting in errors like:

libxl_qmp.c:1838:qmp_ev_parse_error_messages:Domain 10:Could not open '/sys/bus/pci/devices/0000:00:1f.3/config': No such file or directory

This patch retries the device assignment up to 10 times with a 1 second
delay between.  That roughly matches the overall hotplug timeout.

The qmp_ev_parse_error_messages error is still printed since it happens
at a lower level than the pci code controlling the retries.  With that,
the "Retrying PCI add %d" message is also printed at ERROR level to
clarify what is happening.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/libs/light/libxl_pci.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 4bbbfe9f16..8d6a0e65cc 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1109,8 +1109,10 @@ typedef struct pci_add_state {
     libxl__xswait_state xswait;
     libxl__ev_qmp qmp;
     libxl__ev_time timeout;
+    libxl__ev_time timeout_retries;
     libxl_device_pci pci;
     libxl_domid pci_domid;
+    int retries;
 } pci_add_state;
 
 static void pci_add_qemu_trad_watch_state_cb(libxl__egc *egc,
@@ -1118,6 +1120,8 @@ static void pci_add_qemu_trad_watch_state_cb(libxl__egc *egc,
 static void pci_add_qmp_device_add(libxl__egc *, pci_add_state *);
 static void pci_add_qmp_device_add_cb(libxl__egc *,
     libxl__ev_qmp *, const libxl__json_object *, int rc);
+static void pci_add_qmp_device_add_retry(libxl__egc *egc, libxl__ev_time *ev,
+    const struct timeval *requested_abs, int rc);
 static void pci_add_qmp_query_pci_cb(libxl__egc *,
     libxl__ev_qmp *, const libxl__json_object *, int rc);
 static void pci_add_timeout(libxl__egc *egc, libxl__ev_time *ev,
@@ -1137,7 +1141,9 @@ static void do_pci_add(libxl__egc *egc,
     libxl__xswait_init(&pas->xswait);
     libxl__ev_qmp_init(&pas->qmp);
     pas->pci_domid = domid;
+    pas->retries = 0;
     libxl__ev_time_init(&pas->timeout);
+    libxl__ev_time_init(&pas->timeout_retries);
 
     if (type == LIBXL_DOMAIN_TYPE_INVALID) {
         rc = ERROR_FAIL;
@@ -1252,10 +1258,22 @@ static void pci_add_qmp_device_add_cb(libxl__egc *egc,
                                       const libxl__json_object *response,
                                       int rc)
 {
-    EGC_GC;
     pci_add_state *pas = CONTAINER_OF(qmp, *pas, qmp);
+    STATE_AO_GC(pas->aodev->ao);
 
-    if (rc) goto out;
+    if (rc) {
+        if (pas->retries++ < 10) {
+            LOGD(ERROR, qmp->domid, "Retrying PCI add %d", pas->retries);
+            rc = libxl__ev_time_register_rel(ao, &pas->timeout_retries,
+                                             pci_add_qmp_device_add_retry,
+                                             1000);
+            if (rc) goto out;
+
+            return; /* wait for the timeout to then retry */
+        } else {
+            goto out;
+        }
+    }
 
     qmp->callback = pci_add_qmp_query_pci_cb;
     rc = libxl__ev_qmp_send(egc, qmp, "query-pci", NULL);
@@ -1266,6 +1284,15 @@ out:
     pci_add_dm_done(egc, pas, rc); /* must be last */
 }
 
+static void pci_add_qmp_device_add_retry(libxl__egc *egc, libxl__ev_time *ev,
+                                         const struct timeval *requested_abs,
+                                         int rc)
+{
+    pci_add_state *pas = CONTAINER_OF(ev, *pas, timeout_retries);
+
+    pci_add_qmp_device_add(egc, pas);
+}
+
 static void pci_add_qmp_query_pci_cb(libxl__egc *egc,
                                      libxl__ev_qmp *qmp,
                                      const libxl__json_object *response,
@@ -1507,6 +1534,7 @@ out_no_irq:
         rc = 0;
 out:
     libxl__ev_time_deregister(gc, &pas->timeout);
+    libxl__ev_time_deregister(gc, &pas->timeout_retries);
     pas->callback(egc, pas, rc);
 }
 
-- 
2.35.1


