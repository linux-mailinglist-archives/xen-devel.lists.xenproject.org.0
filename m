Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C0050B983
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 16:08:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310956.527928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhtwN-0000tw-9k; Fri, 22 Apr 2022 14:07:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310956.527928; Fri, 22 Apr 2022 14:07:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhtwN-0000rk-6V; Fri, 22 Apr 2022 14:07:19 +0000
Received: by outflank-mailman (input) for mailman id 310956;
 Fri, 22 Apr 2022 14:07:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=utlT=VA=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1nhtwM-0000re-DL
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 14:07:18 +0000
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [2607:f8b0:4864:20::72c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83553c6b-c245-11ec-a405-831a346695d4;
 Fri, 22 Apr 2022 16:07:16 +0200 (CEST)
Received: by mail-qk1-x72c.google.com with SMTP id d19so5860620qko.3
 for <xen-devel@lists.xenproject.org>; Fri, 22 Apr 2022 07:07:16 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:db3c:923d:3601:7358])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a05622a038c00b002f340aeffb3sm1293345qtx.85.2022.04.22.07.07.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 07:07:13 -0700 (PDT)
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
X-Inumbo-ID: 83553c6b-c245-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7ukyyy4K3zXbgBey+POVSCJzrrGx3irsNB33+kkDTdA=;
        b=D/dYZOEBKA8stz7w5ooNER6KE8Uy3BDwU7ov81twcLiHdmQAuzPnEJubwKDaeUcoOD
         wxhS23UefG/7cq81ZH2BP/aDvGq8dNH7QyOsIq2XCEyCm8ntKpwlJkKIZKq23RQ1Muop
         W5uXT5yVXVbfm1/n+eN+BGCiaNvHlrxN3xXmHDuPAJEyLuFzH1c973eP/uMfTSF5x23x
         jRetuaN5MEf4AYSGM6NmNu1geoFUmPVM0SkaACwJiQ1sln1l/JeqQkVNW2Dlu+SWCo+f
         sXKlgqEhkHhTHtn99U+My3JS3Ta7Fv/pNz0hQ9oIWwt5AXDnrGlxlRU1CpnHfPkwNlOf
         vRhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7ukyyy4K3zXbgBey+POVSCJzrrGx3irsNB33+kkDTdA=;
        b=G+ittizks+PJ4eoqPB92Ypbp+oDBMfeTDz0J4j6GTz7H6cooN5AYQNwgcPjmG/ogBe
         i0k+DjZnVQQI4iyYQ5lk141YtEmbV23RICULlQSLNh2k8tmAhbAcdpT6kma47X26QHIX
         DeY0GyBfU7LMrHDAjPrggvw40Mzp8zT7yyS6UHX/BydRFAnVUfz+T7rPEdLzZi5/1MS2
         xAjFQpmuqKgYsCXwG5kj1hEjoyDpI0dCx7S3fDq/wyBkm9ag4zDmNfrUMP1QVcuThzox
         1oY19aaGKpiTI69Yz9n+o6WObxtIBXX8zxQp+zG3UDR/mz4GI2VC/hgs9Zw96AzBPVB2
         PHLQ==
X-Gm-Message-State: AOAM531d0JkRW7IuTYA5H0SgcgR9N4YgK9C+k+Ax2tUtGt8tgY3qVVMP
	t/3fQ8QzPIFPeM/bLNE9mcjc8L26xBY=
X-Google-Smtp-Source: ABdhPJyAYGJEW3WRcKwO0aiCwfg7lr3Gej4S/+o6tOvzGIZNdYMwFXOAgLCIJZs7mvwLaXVJY3eB7w==
X-Received: by 2002:a05:620a:4486:b0:69f:1e21:5393 with SMTP id x6-20020a05620a448600b0069f1e215393mr1232835qkp.504.1650636434090;
        Fri, 22 Apr 2022 07:07:14 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2] libxl: Retry QMP PCI device_add
Date: Fri, 22 Apr 2022 10:07:03 -0400
Message-Id: <20220422140703.13614-1-jandryuk@gmail.com>
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
delay between.  That roughly matches the overall hotplug timeout for
pci_add_timeout.  pci_add_timeout's initialization is moved to
do_pci_add since retries call into pci_add_qmp_device_add again.

The qmp_ev_parse_error_messages error is still printed since it happens
at a lower level than the pci code controlling the retries.  With that,
the "Retrying PCI add %d" message is also printed at ERROR level to
clarify what is happening.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
v2:
Only retry when a stubdom is present.
Move pci_add_timeout initialization.
Use pas->aodev->ao directly.
---
 tools/libs/light/libxl_pci.c | 44 +++++++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 6 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 4bbbfe9f16..96f88795b6 100644
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
@@ -1157,6 +1163,11 @@ static void do_pci_add(libxl__egc *egc,
                 if (rc) goto out;
                 return;
             case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN:
+                rc = libxl__ev_time_register_rel(ao, &pas->timeout,
+                                                 pci_add_timeout,
+                                                 LIBXL_QMP_CMD_TIMEOUT * 1000);
+                if (rc) goto out;
+
                 pci_add_qmp_device_add(egc, pas); /* must be last */
                 return;
             default:
@@ -1205,11 +1216,6 @@ static void pci_add_qmp_device_add(libxl__egc *egc, pci_add_state *pas)
     libxl_device_pci *pci = &pas->pci;
     libxl__ev_qmp *const qmp = &pas->qmp;
 
-    rc = libxl__ev_time_register_rel(ao, &pas->timeout,
-                                     pci_add_timeout,
-                                     LIBXL_QMP_CMD_TIMEOUT * 1000);
-    if (rc) goto out;
-
     libxl__qmp_param_add_string(gc, &args, "driver",
                                 "xen-pci-passthrough");
     QMP_PARAMETERS_SPRINTF(&args, "id", PCI_PT_QDEV_ID,
@@ -1255,7 +1261,23 @@ static void pci_add_qmp_device_add_cb(libxl__egc *egc,
     EGC_GC;
     pci_add_state *pas = CONTAINER_OF(qmp, *pas, qmp);
 
-    if (rc) goto out;
+    if (rc) {
+        /* Retry only applicable for HVM with stubdom. */
+        if (libxl_get_stubdom_id(CTX, qmp->domid) == 0)
+            goto out;
+
+        if (pas->retries++ < 10) {
+            LOGD(ERROR, qmp->domid, "Retrying PCI add %d", pas->retries);
+            rc = libxl__ev_time_register_rel(pas->aodev->ao,
+                                             &pas->timeout_retries,
+                                             pci_add_qmp_device_add_retry,
+                                             1000);
+            if (rc) goto out;
+            return; /* Wait for the timeout to then retry. */
+        } else {
+            goto out;
+        }
+    }
 
     qmp->callback = pci_add_qmp_query_pci_cb;
     rc = libxl__ev_qmp_send(egc, qmp, "query-pci", NULL);
@@ -1266,6 +1288,15 @@ out:
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
@@ -1507,6 +1538,7 @@ out_no_irq:
         rc = 0;
 out:
     libxl__ev_time_deregister(gc, &pas->timeout);
+    libxl__ev_time_deregister(gc, &pas->timeout_retries);
     pas->callback(egc, pas, rc);
 }
 
-- 
2.35.1


