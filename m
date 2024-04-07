Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6D589B27A
	for <lists+xen-devel@lfdr.de>; Sun,  7 Apr 2024 16:33:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701648.1095967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtTZa-0001gR-H9; Sun, 07 Apr 2024 14:32:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701648.1095967; Sun, 07 Apr 2024 14:32:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtTZa-0001dd-ET; Sun, 07 Apr 2024 14:32:42 +0000
Received: by outflank-mailman (input) for mailman id 701648;
 Sun, 07 Apr 2024 14:32:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CRZ/=LM=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rtTZY-0001dW-TO
 for xen-devel@lists.xenproject.org; Sun, 07 Apr 2024 14:32:40 +0000
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [2607:f8b0:4864:20::b35])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af1ccb69-f4eb-11ee-afe6-a90da7624cb6;
 Sun, 07 Apr 2024 16:32:39 +0200 (CEST)
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-dcbc6a6808fso3474794276.2
 for <xen-devel@lists.xenproject.org>; Sun, 07 Apr 2024 07:32:39 -0700 (PDT)
Received: from shine.lan
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 y18-20020ad457d2000000b0069903c37a36sm2249754qvx.100.2024.04.07.07.32.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 07:32:36 -0700 (PDT)
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
X-Inumbo-ID: af1ccb69-f4eb-11ee-afe6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712500357; x=1713105157; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SzbwS9YIj1SxB0umSrB5+KMCusS58DvhZAfVLsqnYAc=;
        b=kfzb5pg9ecjgFou48sTlJTYUFKINsyC0TIMrhATzQLg+OaB5fJKGkCrGmA1wYgKmMd
         XCSBnyPrln9q6JbJx8egzdWN7wX2bKIwdswKGGBZDrz4elQIL+9VSmpT3iIe34fy1ggr
         Zi0whcPclWZvRq8Hko5AVGOXJe6KTn7hAookQi8M7czOH2Gge+YR1kwnHxfK+bHaRXqn
         6R8K/NEfHZlF93qg7CZ6N/4GKh5AnRA+lsy9IaV2NiGoT3dff6soJVDbonzQ998QyR55
         /XYA/ZzqIcWpIWOcBLm2pWL+yy+0nSNpvMC2uc5C8YbxnFT/1NtCcmBVIo3HUtFKUVHG
         Ur+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712500357; x=1713105157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SzbwS9YIj1SxB0umSrB5+KMCusS58DvhZAfVLsqnYAc=;
        b=ryfL05LepNF1uui3lUYwtLmx7ZbaC4O9RGkmcz0Wk6W+CUK9mHOVpizPuy5bdffZfU
         aKjQyBjYZX9LqelAOl1qX2dWGtNtAS7LzITzu1Ffhpml/0Oo9oFh/fA5YfpR/NWLEF2k
         C1dpoCaf/tbjmwPpZoxocFLRoRFdV8guZognak4M0ZcPRGz+AatIg2SiH3G6w8zeiK18
         bOTrv8deS3qmYu9bxlIL+OycvB2AhY868fz42NOVV4VOqPisfimoiZB5bQMkvLKwu2hk
         8X3YAqJDjHzUgd1EZh1K0j2sOd/mPY9g/DEBE8Y1LmBM38klMD53y+vBu7ghC7kqkFHx
         T5ow==
X-Gm-Message-State: AOJu0YyEyEa/SwliOxI5gj95RdjXZzfCAMLKofAzUfSnI7NWVmmNpnWB
	8fneEEv5sLpbQVSGsydZoAf2qF3spOdDIKGFTGid2tRwtT7quCa+1y4hi+KG
X-Google-Smtp-Source: AGHT+IF3DjPZOcMZU3cXaZZJXnIUWGTeyrJT4b7n1jbqN1uz6/M/HLbbFae3P88yQeabwPpBIjfkqA==
X-Received: by 2002:a5b:a8b:0:b0:dcf:fc74:358a with SMTP id h11-20020a5b0a8b000000b00dcffc74358amr4961310ybq.10.1712500357199;
        Sun, 07 Apr 2024 07:32:37 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v2] libxl: Use vkb=[] for HVMs
Date: Sun,  7 Apr 2024 10:32:08 -0400
Message-Id: <20240407143208.23992-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xl/libxl only applies vkb=[] to PV & PVH guests.  HVM gets only a single
vkb by default, but that can be disabled by the vkb_device boolean.
Notably the HVM vkb cannot be configured, so feature-abs-pointer or the
backend-type cannot be specified.

Re-arrange the logic so that vkb=[] is handled regardless of domain
type.  If vkb is empty or unspecified, follow the vkb_device boolean for
HVMs.  Nothing changes for PVH & PV.  HVMs can now get a configured vkb
instead of just the default one.

The chance for regression is an HVM config with
vkb=["$something"]
vkb_device=false

Which would now get a vkb.

This is useful for vGlass which provides a VKB to HVMs.  vGlass wants to
specify feature-abs-pointer, but that is racily written by vGlass
instead of coming through the xl.cfg.  Unhelpfully, Linux xen-kbdfront
reads the backend nodes without checking that the backend is in
InitWait.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
---
v2:
Check libxl__device_add() failure
Add Anthony R-b
Add CHANGELOG
Add man xl.cfg
---
 CHANGELOG.md                    |  1 +
 docs/man/xl.cfg.5.pod.in        |  2 ++
 tools/libs/light/libxl_create.c | 27 +++++++++++++++------------
 3 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 93fda73c00..8041cfb7d2 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -13,6 +13,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - On x86:
    - HVM PIRQs are disabled by default.
    - Reduce IOMMU setup time for hardware domain.
+ - xl/libxl configures vkb=[] for HVM domains with priority over vkb_device.
 
 ### Added
  - On x86:
diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 039e057318..8f2b375ce9 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2710,6 +2710,8 @@ device.
 
 Specifies that the HVM guest gets a vkdb. The default is true (1).
 
+This option is only used when B<vkb=[]> is unset.
+
 =item B<usb=BOOLEAN>
 
 Enables or disables an emulated USB bus in the guest.
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 5546335973..41252ec553 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -1769,24 +1769,32 @@ static void domcreate_launch_dm(libxl__egc *egc, libxl__multidev *multidev,
         libxl__device_add(gc, domid, &libxl__virtio_devtype,
                           &d_config->virtios[i]);
 
+    if (d_config->num_vkbs) {
+        for (i = 0; i < d_config->num_vkbs; i++) {
+            ret = libxl__device_add(gc, domid, &libxl__vkb_devtype,
+                                    &d_config->vkbs[i]);
+            if (ret) goto error_out;
+        }
+    } else if (d_config->c_info.type == LIBXL_DOMAIN_TYPE_HVM &&
+               libxl_defbool_val(d_config->b_info.u.hvm.vkb_device)) {
+        libxl_device_vkb vkb;
+
+        libxl_device_vkb_init(&vkb);
+        libxl__device_add(gc, domid, &libxl__vkb_devtype, &vkb);
+        libxl_device_vkb_dispose(&vkb);
+    }
+
     switch (d_config->c_info.type) {
     case LIBXL_DOMAIN_TYPE_HVM:
     {
         libxl__device_console console;
         libxl__device device;
-        libxl_device_vkb vkb;
 
         init_console_info(gc, &console, 0);
         console.backend_domid = state->console_domid;
         libxl__device_console_add(gc, domid, &console, state, &device);
         libxl__device_console_dispose(&console);
 
-        if (libxl_defbool_val(d_config->b_info.u.hvm.vkb_device)) {
-            libxl_device_vkb_init(&vkb);
-            libxl__device_add(gc, domid, &libxl__vkb_devtype, &vkb);
-            libxl_device_vkb_dispose(&vkb);
-        }
-
         dcs->sdss.dm.guest_domid = domid;
         if (libxl_defbool_val(d_config->b_info.device_model_stubdomain))
             libxl__spawn_stub_dm(egc, &dcs->sdss);
@@ -1814,11 +1822,6 @@ static void domcreate_launch_dm(libxl__egc *egc, libxl__multidev *multidev,
                               &d_config->vfbs[i]);
         }
 
-        for (i = 0; i < d_config->num_vkbs; i++) {
-            libxl__device_add(gc, domid, &libxl__vkb_devtype,
-                              &d_config->vkbs[i]);
-        }
-
         if (d_config->b_info.arch_arm.vuart == LIBXL_VUART_TYPE_SBSA_UART) {
             init_console_info(gc, &vuart, 0);
             vuart.backend_domid = state->console_domid;
-- 
2.39.2


