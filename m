Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BA28A149E
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 14:29:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703895.1099848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rutYF-0006kN-6y; Thu, 11 Apr 2024 12:29:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703895.1099848; Thu, 11 Apr 2024 12:29:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rutYF-0006ik-3g; Thu, 11 Apr 2024 12:29:11 +0000
Received: by outflank-mailman (input) for mailman id 703895;
 Thu, 11 Apr 2024 12:29:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RVMu=LQ=linaro.org=manos.pitsidianakis@srs-se1.protection.inumbo.net>)
 id 1rutYD-0006az-RB
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 12:29:09 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 182f1fb2-f7ff-11ee-b908-491648fe20b8;
 Thu, 11 Apr 2024 14:29:09 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2d8a2cbe1baso37472941fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Apr 2024 05:29:09 -0700 (PDT)
Received: from localhost.localdomain (adsl-245.37.6.163.tellas.gr.
 [37.6.163.245]) by smtp.gmail.com with ESMTPSA id
 k9-20020a05600c1c8900b00416c1e7c9e7sm2212992wms.2.2024.04.11.05.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Apr 2024 05:29:08 -0700 (PDT)
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
X-Inumbo-ID: 182f1fb2-f7ff-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712838548; x=1713443348; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y66oHHLKi7EjtJauIa8Cpfp2Sdjm/ajt/hGPJgUv3oY=;
        b=szEGFp8I1y6QSq+j/baTbLanIxo/Q0XB0pkm2W5eT0WNO9hP46h0PlkCEmL04zG7oT
         mP7i1XeMoYNB8YSQoOCsCWr5EQ2IDJDlF4OM+GATWQ2MwWNN4ki9bLsucycBv3+7Fn+5
         RvYwwMzDz2vLUom4nJOLcYVmCnw6hd64dzcx/tXmm8hkZcT1KROMvu/wiZHQuIHJA0v8
         xBp+aUmwPypKSCDv7Uj43NHMTn+yzWOQQ60lkxunn+seN/z4JQEIaBvvwpO4stUt86HD
         VQPQ6zqRUcSsDkoNmxR7F9Y4jdd37t6MDj+NkLsdl4oVqA+pdNvFwqddS71lsslh4kcS
         Y8cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712838548; x=1713443348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y66oHHLKi7EjtJauIa8Cpfp2Sdjm/ajt/hGPJgUv3oY=;
        b=wlq4fXACPIqjbfGUyME9oPPMcUIiWhnBMYhBYTKG6FKNM741TRFRXFp98SoyRwdckC
         xpMLXKvSK2rUngH+LalHtMPoqY+3P7Ublm79dYzctMxBBbtwCm+aluZz3HZXgvEaAP32
         Hi7YHflF+sUfpKlo6c1GtgmuRLg/fYu+NG49B+yRqPYPpn32kyYwCD8xlQMAO19ZJzEE
         zaSqHRPXMa261P675p43WBgEwQTY6W2qHtjMx7tD/X8r2DysT+w6FbX/M+LAIw//KCzm
         XsnsNijCdBJKRHMWw/297XxPOiPfeBnP4MHDcPS/vd6ofd1/jN2DgzHlgTDgHYJPRCYT
         UyFA==
X-Gm-Message-State: AOJu0YyDd1Q9YHuVrXHFnsqWcwGu9ck3TA0J3trRusllOhKuvU4679qZ
	n0EUP8AbJALg4TnNSEN/ZgvzaYKlU7loLnxfrBdkECmgx7AnaeL2uyA9uE+vQKiM3wsqoUVxx+L
	Z
X-Google-Smtp-Source: AGHT+IH8d7sSC8H7E64XNhqRD+MVD9GnhbZyha1M5GR2wx1IsiolkGcEiWAK0SnSprFMjbK1t7Ob0Q==
X-Received: by 2002:a2e:9a81:0:b0:2d7:1323:6792 with SMTP id p1-20020a2e9a81000000b002d713236792mr4107786lji.43.1712838548239;
        Thu, 11 Apr 2024 05:29:08 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [RFC PATCH v2 2/2] libs/light: expand device model start timeout use
Date: Thu, 11 Apr 2024 15:28:20 +0300
Message-ID: <125210f392aacaa5dd605ce7036c7c9b9e783a2a.1712837961.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1712837961.git.manos.pitsidianakis@linaro.org>
References: <cover.1712837961.git.manos.pitsidianakis@linaro.org>
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

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 4369fef161..9ffdd50c69 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
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
diff --git a/tools/libs/light/libxl_domain.c b/tools/libs/light/libxl_domain.c
index 6751fc785f..2fc3481f78 100644
--- a/tools/libs/light/libxl_domain.c
+++ b/tools/libs/light/libxl_domain.c
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
diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 7bdd9f6c3b..3120649a8e 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
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
diff --git a/tools/libs/light/libxl_usb.c b/tools/libs/light/libxl_usb.c
index c5ae59681c..59db8a6f64 100644
--- a/tools/libs/light/libxl_usb.c
+++ b/tools/libs/light/libxl_usb.c
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


