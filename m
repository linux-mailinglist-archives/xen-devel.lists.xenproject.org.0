Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC70689B40C
	for <lists+xen-devel@lfdr.de>; Sun,  7 Apr 2024 22:59:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701695.1096047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtZbo-0008Lb-AO; Sun, 07 Apr 2024 20:59:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701695.1096047; Sun, 07 Apr 2024 20:59:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtZbo-0008Ib-6e; Sun, 07 Apr 2024 20:59:24 +0000
Received: by outflank-mailman (input) for mailman id 701695;
 Sun, 07 Apr 2024 20:59:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CRZ/=LM=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rtZbn-0008IV-Gh
 for xen-devel@lists.xenproject.org; Sun, 07 Apr 2024 20:59:23 +0000
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [2607:f8b0:4864:20::b31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b54ad52c-f521-11ee-afe6-a90da7624cb6;
 Sun, 07 Apr 2024 22:59:22 +0200 (CEST)
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-dc236729a2bso3651358276.0
 for <xen-devel@lists.xenproject.org>; Sun, 07 Apr 2024 13:59:22 -0700 (PDT)
Received: from shine.lan
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 s12-20020ad44b2c000000b00696b152514dsm2506997qvw.12.2024.04.07.13.59.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 13:59:19 -0700 (PDT)
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
X-Inumbo-ID: b54ad52c-f521-11ee-afe6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712523560; x=1713128360; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+OC3YGS4/Iar3z4n2ZpdMSQ+zYL8lV8fsg+McAQ6FMI=;
        b=m/rC7Zm6hltAaSCrSHKetoPbCmylnXQZ/67U05m/5uqd7QS+EOaMaBZhsnDRJrOvjB
         V4zPjPVWexvmSwiVKnfjvPTJaDvynQ/p9UHWlzq8QY3Vq1Hj7EpRQPaz0dT1bgi4jmR8
         AA71Yx1d1dZ2UDzlpRxf8zaL4pI+YUASAFub0jf/iedX7aqrlqDTL+O4RpmD9ucgn/bV
         gAhl+VWAGm+mfIpE/kzwtCWgw9a/b0uaDTxsiGvEoDinnHgiL8Az3w+DUMIQdmpWf9J/
         rEReo4bxjtUKq9jQ+cCenH8hWySlTxQEOJXWIRVJB7q1UpoAOvRf1ZNWTdr9dambGZmz
         TFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712523560; x=1713128360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+OC3YGS4/Iar3z4n2ZpdMSQ+zYL8lV8fsg+McAQ6FMI=;
        b=BAJkZCxPrGbnB63sCVnBEheAg2Ruj/xErw72YrLitEmWpui0bdwRwnNYxf9d9UDANP
         qWdsKGXT/4AXs6+9YzqAQaYyJSlp9T8g/8bOEoStsjWw41Q3A0LhqijQmMK/zRXejazj
         2zNyzV+CxxHfeUaSqz+9fcO3J2XoepohziTNNPmQY2IqauQUHi/o0RwOBrxcDdRcxRa/
         aklsFND3t4qYRMxJSybOxQsAK/qFF3V8Uvu3xMxjKvBESJPYS/nln1vUZ7KsmzSzxACE
         PvaiW10y45SX6NIcs2r9hpaWyyQQdJtuDXxcR0mB8olSCR/hogQPUdO9F++LfIonQrlQ
         ol5w==
X-Gm-Message-State: AOJu0Yw+OcU+jOdGyEvgWhvk/S7jHGSPott/BJOB2HrWNuEkD5kge7DP
	g47wBO3ntYAwFqrt5kU5R8hsBXheVK/50EalbA/q4jc5FQmqdp2CHvY1G1KA
X-Google-Smtp-Source: AGHT+IHEq4iSGbmx0vp5KdaKzevLGMXDY4iGqYJPvgkHGjXqpdOgLAfMAfss5TkdCRsrnI6wfAPI1A==
X-Received: by 2002:a81:4f83:0:b0:615:175f:ae2b with SMTP id d125-20020a814f83000000b00615175fae2bmr6595791ywb.2.1712523560379;
        Sun, 07 Apr 2024 13:59:20 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v2] libxl: devd: Spawn QEMU for 9pfs
Date: Sun,  7 Apr 2024 16:58:09 -0400
Message-Id: <20240407205809.60871-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for xl devd to support 9pfs in a domU.  devd need to spawn a
pvqemu for the domain to service 9pfs as well as qdisk backends.  Rename
num_qdisks to pvqemu_refcnt to be more generic.

Keep the qdisk-backend-pid xenstore key as well as the disk-%u log file.
They are externally visible, so the might be used by other tooling.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v2:
Retain xenstore qdisk-backend-pid and qdisk-%u logfile
---
 tools/libs/light/libxl_device.c   | 22 ++++++++++++----------
 tools/libs/light/libxl_dm.c       |  5 +++--
 tools/libs/light/libxl_internal.h |  4 ++--
 3 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/tools/libs/light/libxl_device.c b/tools/libs/light/libxl_device.c
index 6f0100d05e..a3d9f6f7df 100644
--- a/tools/libs/light/libxl_device.c
+++ b/tools/libs/light/libxl_device.c
@@ -1524,12 +1524,12 @@ static void device_complete(libxl__egc *egc, libxl__ao_device *aodev)
     libxl__nested_ao_free(aodev->ao);
 }
 
-static void qdisk_spawn_outcome(libxl__egc *egc, libxl__dm_spawn_state *dmss,
-                                int rc)
+static void qemu_xenpv_spawn_outcome(libxl__egc *egc,
+                                     libxl__dm_spawn_state *dmss, int rc)
 {
     STATE_AO_GC(dmss->spawn.ao);
 
-    LOGD(DEBUG, dmss->guest_domid, "qdisk backend spawn %s",
+    LOGD(DEBUG, dmss->guest_domid, "qemu xenpv backend spawn %s",
                 rc ? "failed" : "succeed");
 
     libxl__nested_ao_free(dmss->spawn.ao);
@@ -1552,7 +1552,7 @@ typedef struct libxl__ddomain_device {
  */
 typedef struct libxl__ddomain_guest {
     uint32_t domid;
-    int num_qdisks;
+    int pvqemu_refcnt;
     XEN_SLIST_HEAD(, struct libxl__ddomain_device) devices;
     XEN_SLIST_ENTRY(struct libxl__ddomain_guest) next;
 } libxl__ddomain_guest;
@@ -1646,15 +1646,16 @@ static int add_device(libxl__egc *egc, libxl__ao *ao,
 
     switch(dev->backend_kind) {
     case LIBXL__DEVICE_KIND_QDISK:
-        if (dguest->num_qdisks == 0) {
+    case LIBXL__DEVICE_KIND_9PFS:
+        if (dguest->pvqemu_refcnt == 0) {
             GCNEW(dmss);
             dmss->guest_domid = dev->domid;
             dmss->spawn.ao = ao;
-            dmss->callback = qdisk_spawn_outcome;
+            dmss->callback = qemu_xenpv_spawn_outcome;
 
-            libxl__spawn_qdisk_backend(egc, dmss);
+            libxl__spawn_qemu_xenpv_backend(egc, dmss);
         }
-        dguest->num_qdisks++;
+        dguest->pvqemu_refcnt++;
         break;
     default:
         GCNEW(aodev);
@@ -1685,8 +1686,9 @@ static int remove_device(libxl__egc *egc, libxl__ao *ao,
 
     switch(ddev->dev->backend_kind) {
     case LIBXL__DEVICE_KIND_QDISK:
-        if (--dguest->num_qdisks == 0) {
-            rc = libxl__destroy_qdisk_backend(gc, dev->domid);
+    case LIBXL__DEVICE_KIND_9PFS:
+        if (--dguest->pvqemu_refcnt == 0) {
+            rc = libxl__destroy_qemu_xenpv_backend(gc, dev->domid);
             if (rc)
                 goto out;
         }
diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 1a24e7961a..ff8ddeec9a 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -3380,7 +3380,8 @@ static void device_model_postconfig_done(libxl__egc *egc,
     dmss->callback(egc, dmss, rc);
 }
 
-void libxl__spawn_qdisk_backend(libxl__egc *egc, libxl__dm_spawn_state *dmss)
+void libxl__spawn_qemu_xenpv_backend(libxl__egc *egc,
+                                     libxl__dm_spawn_state *dmss)
 {
     STATE_AO_GC(dmss->spawn.ao);
     flexarray_t *dm_args, *dm_envs;
@@ -3470,7 +3471,7 @@ static int kill_device_model(libxl__gc *gc, const char *xs_path_pid)
 }
 
 /* Helper to destroy a Qdisk backend */
-int libxl__destroy_qdisk_backend(libxl__gc *gc, uint32_t domid)
+int libxl__destroy_qemu_xenpv_backend(libxl__gc *gc, uint32_t domid)
 {
     char *pid_path;
     int rc;
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index 094d0df9b1..dda3d15087 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -4196,9 +4196,9 @@ _hidden char *libxl__stub_dm_name(libxl__gc *gc, const char * guest_name);
 
 /* Qdisk backend launch helpers */
 
-_hidden void libxl__spawn_qdisk_backend(libxl__egc *egc,
+_hidden void libxl__spawn_qemu_xenpv_backend(libxl__egc *egc,
                                         libxl__dm_spawn_state *dmss);
-_hidden int libxl__destroy_qdisk_backend(libxl__gc *gc, uint32_t domid);
+_hidden int libxl__destroy_qemu_xenpv_backend(libxl__gc *gc, uint32_t domid);
 
 /*----- Domain creation -----*/
 
-- 
2.39.2


