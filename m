Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C56C189F116
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 13:44:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703049.1098868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruWMl-0003u1-V5; Wed, 10 Apr 2024 11:43:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703049.1098868; Wed, 10 Apr 2024 11:43:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruWMl-0003nf-QQ; Wed, 10 Apr 2024 11:43:47 +0000
Received: by outflank-mailman (input) for mailman id 703049;
 Wed, 10 Apr 2024 11:43:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rpn4=LP=linaro.org=manos.pitsidianakis@srs-se1.protection.inumbo.net>)
 id 1ruWMk-0003V1-GP
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 11:43:46 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96a5ca92-f72f-11ee-b907-491648fe20b8;
 Wed, 10 Apr 2024 13:43:45 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-516d0162fa1so7927262e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Apr 2024 04:43:45 -0700 (PDT)
Received: from localhost.localdomain (adsl-125.109.242.226.tellas.gr.
 [109.242.226.125]) by smtp.gmail.com with ESMTPSA id
 a20-20020a05600c349400b00416a7313deasm1622874wmq.4.2024.04.10.04.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 04:43:45 -0700 (PDT)
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
X-Inumbo-ID: 96a5ca92-f72f-11ee-b907-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712749425; x=1713354225; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SdOOUOZq9LZ5gV0smnTOUe9GEEiQVAIyweoYczkDsxA=;
        b=LNqVY7BaXxURz6Y8EGrnq8lHjUnD2QUoeY/f/2PYLczzo9VvJ76Nsq8jQyc50lSy/P
         iNB8ZtRVJENOYVsWolPOpbQM1uvhZdW+UQW8N3Ns4W0qhCPaj+P4gFzM312eb/qJxkXt
         A7TzmwaFgFnoW/c/MbjqE8Pjol8x2tSgwpESRiMciWFZf2P3lJGTGg8aeepwRfrPmOn6
         aRYXXEEa0rm3sswchDvz+xKa6BsamIL8XA672RRKSVesJHYnOt7kB0OfsA6rtvXswkK8
         1LADQ2ab+uYb7gPnzRiN5s1dQsme+J5fRQXHGP1yvOhno8qDFx+ic/ca5tHb53RAgu2V
         4KZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712749425; x=1713354225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SdOOUOZq9LZ5gV0smnTOUe9GEEiQVAIyweoYczkDsxA=;
        b=tONUfPY8+apuFHcXB4dOgs2kniuVcFuIWJ4itFqRNkxqIKeGPj8HZM2LJe8owk2S0z
         XddFodtio0al69iYqt3OANdAXxip4xT+QCgy4Fx7ccdiYjNk1UQIzP/31mgq35Xy2+Wa
         0H5Q7YPW/+XUPbOpdd4DAqGWdWH7TfaWfH9DCJFKOlVOp+2lLZHc9MPCT/hPkPqIhgod
         0aGsBYLhm0RGpoCzXatW+isO5Z/p3JLnAQhQYdQt8Jvj63QRYtYaQ2JXJ3b91uWkTjCU
         Vjv27aOrftNwdYuNv398mjDzQIjpR9unbgT5FhFyxDqrpa6gcj35ZvUWhuPUVOGiQmtO
         Nncg==
X-Gm-Message-State: AOJu0Yy7BH7JutFkUPvzS28hzKsXCS1RGMt0wVQQHIQlwOXDIobkglhb
	+xcAVBergJHm1ydQMP5aN6mb8v2VRZqC5SPi/XiXijA8T59l24xM4uy6OS7KpiDTA60ssAP+rNz
	3
X-Google-Smtp-Source: AGHT+IG/X340dtXOKOxCwIIO2gXgjMZdoqDI+lvwqfcPHVfGIpVcBcM+MFm8ik3Qw/FpZiEPSA1fPw==
X-Received: by 2002:a2e:9911:0:b0:2d8:e159:23b6 with SMTP id v17-20020a2e9911000000b002d8e15923b6mr431080lji.16.1712749425283;
        Wed, 10 Apr 2024 04:43:45 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC PATCH v1 2/2] libs/light: expand device model start timeout use
Date: Wed, 10 Apr 2024 14:43:15 +0300
Message-Id: <125210f392aacaa5dd605ce7036c7c9b9e783a2a.1712748711.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1712748711.git.manos.pitsidianakis@linaro.org>
References: <cover.1712748711.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit

Various timeout values that depend on the device model should also
respect the device model start timeout setting. This commit adds the
__libxl_device_model_start_timeout() value to those time outs without
changing their default values.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 tools/libs/light/libxl_dm.c     | 4 ++--
 tools/libs/light/libxl_domain.c | 5 +++--
 tools/libs/light/libxl_pci.c    | 4 ++--
 tools/libs/light/libxl_usb.c    | 8 ++++----
 4 files changed, 11 insertions(+), 10 deletions(-)

diff --git tools/libs/light/libxl_dm.c tools/libs/light/libxl_dm.c
index 4369fef161..9ffdd50c69 100644
--- tools/libs/light/libxl_dm.c
+++ tools/libs/light/libxl_dm.c
@@ -2807,7 +2807,7 @@ static void stubdom_pvqemu_unpaused(libxl__egc *egc,
                                   dm_domid, sdss->dm.guest_domid);
     sdss->xswait.path = DEVICE_MODEL_XS_PATH(gc, dm_domid, sdss->dm.guest_domid,
                                              "/state");
-    sdss->xswait.timeout_ms = LIBXL_STUBDOM_START_TIMEOUT * 1000;
+    sdss->xswait.timeout_ms = (__libxl_device_model_start_timeout() + LIBXL_STUBDOM_START_TIMEOUT) * 1000;
     sdss->xswait.callback = stubdom_xswait_cb;
     rc = libxl__xswait_start(gc, &sdss->xswait);
     if (rc) goto out;
@@ -3177,7 +3177,7 @@ static void device_model_spawn_outcome(libxl__egc *egc,
             == LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN) {
         rc = libxl__ev_time_register_rel(ao, &dmss->timeout,
                                          devise_model_postconfig_timeout,
-                                         LIBXL_QMP_CMD_TIMEOUT * 1000);
+                                         (__libxl_device_model_start_timeout() + LIBXL_QMP_CMD_TIMEOUT) * 1000);
         if (rc) goto out;
         dmss->qmp.ao = ao;
         dmss->qmp.domid = dmss->guest_domid;
diff --git tools/libs/light/libxl_domain.c tools/libs/light/libxl_domain.c
index 6751fc785f..2fc3481f78 100644
--- tools/libs/light/libxl_domain.c
+++ tools/libs/light/libxl_domain.c
@@ -1882,7 +1882,8 @@ int libxl_set_vcpuonline(libxl_ctx *ctx, uint32_t domid,
         case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN:
             rc = libxl__ev_time_register_rel(ao, &svos->timeout,
                                              set_vcpuonline_timeout,
-                                             LIBXL_QMP_CMD_TIMEOUT * 1000);
+                                             (__libxl_device_model_start_timeout()
+                                              + LIBXL_QMP_CMD_TIMEOUT) * 1000);
             if (rc) goto out;
             qmp->callback = set_vcpuonline_qmp_cpus_fast_queried;
             rc = libxl__ev_qmp_send(egc, qmp, "query-cpus-fast", NULL);
@@ -2353,7 +2354,7 @@ static void retrieve_domain_configuration_lock_acquired(
          */
         rc = libxl__ev_time_register_rel(ao, &rdcs->timeout,
             retrieve_domain_configuration_timeout,
-            LIBXL_QMP_CMD_TIMEOUT * 1000);
+            (__libxl_device_model_start_timeout() + LIBXL_QMP_CMD_TIMEOUT) * 1000);
         if (rc) goto out;
         libxl_bitmap_alloc(CTX, &rdcs->qemuu_cpus,
                            d_config->b_info.max_vcpus);
diff --git tools/libs/light/libxl_pci.c tools/libs/light/libxl_pci.c
index 7bdd9f6c3b..3120649a8e 100644
--- tools/libs/light/libxl_pci.c
+++ tools/libs/light/libxl_pci.c
@@ -1165,7 +1165,7 @@ static void do_pci_add(libxl__egc *egc,
             case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN:
                 rc = libxl__ev_time_register_rel(ao, &pas->timeout,
                                                  pci_add_timeout,
-                                                 LIBXL_QMP_CMD_TIMEOUT * 1000);
+                                                 (__libxl_device_model_start_timeout() + LIBXL_QMP_CMD_TIMEOUT) * 1000);
                 if (rc) goto out;
 
                 pci_add_qmp_device_add(egc, pas); /* must be last */
@@ -2030,7 +2030,7 @@ static void pci_remove_qmp_device_del(libxl__egc *egc,
 
     rc = libxl__ev_time_register_rel(ao, &prs->timeout,
                                      pci_remove_timeout,
-                                     LIBXL_QMP_CMD_TIMEOUT * 1000);
+                                     (__libxl_device_model_start_timeout() + LIBXL_QMP_CMD_TIMEOUT) * 1000);
     if (rc) goto out;
 
     QMP_PARAMETERS_SPRINTF(&args, "id", PCI_PT_QDEV_ID,
diff --git tools/libs/light/libxl_usb.c tools/libs/light/libxl_usb.c
index c5ae59681c..59db8a6f64 100644
--- tools/libs/light/libxl_usb.c
+++ tools/libs/light/libxl_usb.c
@@ -487,7 +487,7 @@ static void libxl__device_usbctrl_add(libxl__egc *egc, uint32_t domid,
 
         rc = libxl__ev_time_register_rel(ao, &aodev->timeout,
                                          device_usbctrl_add_timeout,
-                                         LIBXL_QMP_CMD_TIMEOUT * 1000);
+                                         (__libxl_device_model_start_timeout() + LIBXL_QMP_CMD_TIMEOUT) * 1000);
         if (rc) goto outrm;
 
         qmp->ao = ao;
@@ -644,7 +644,7 @@ static void device_usbctrl_usbdevs_removed(libxl__egc *egc,
 
         rc = libxl__ev_time_register_rel(ao, &aodev->timeout,
                                          device_usbctrl_remove_timeout,
-                                         LIBXL_QMP_CMD_TIMEOUT * 1000);
+                                         (__libxl_device_model_start_timeout() + LIBXL_QMP_CMD_TIMEOUT) * 1000);
         if (rc) goto out;
 
         qmp->ao = ao;
@@ -1794,7 +1794,7 @@ static void libxl__device_usbdev_add(libxl__egc *egc, uint32_t domid,
 
         rc = libxl__ev_time_register_rel(ao, &aodev->timeout,
                                          device_usbdev_add_timeout,
-                                         LIBXL_QMP_CMD_TIMEOUT * 1000);
+                                         (__libxl_device_model_start_timeout() + LIBXL_QMP_CMD_TIMEOUT) * 1000);
         if (rc) goto out;
 
         aodev->qmp.ao = ao;
@@ -1976,7 +1976,7 @@ static void libxl__device_usbdev_remove(libxl__egc *egc, uint32_t domid,
 
         rc = libxl__ev_time_register_rel(ao, &aodev->timeout,
                                          device_usbdev_remove_timeout,
-                                         LIBXL_QMP_CMD_TIMEOUT * 1000);
+                                         (__libxl_device_model_start_timeout() + LIBXL_QMP_CMD_TIMEOUT) * 1000);
         if (rc) goto out;
 
         aodev->qmp.ao = ao;
-- 
γαῖα πυρί μιχθήτω


