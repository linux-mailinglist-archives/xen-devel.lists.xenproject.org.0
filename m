Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D5E3EA680
	for <lists+xen-devel@lfdr.de>; Thu, 12 Aug 2021 16:23:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166469.303858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEBbw-000554-0M; Thu, 12 Aug 2021 14:23:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166469.303858; Thu, 12 Aug 2021 14:23:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEBbv-00051D-Ro; Thu, 12 Aug 2021 14:23:07 +0000
Received: by outflank-mailman (input) for mailman id 166469;
 Thu, 12 Aug 2021 14:23:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tERp=ND=gmail.com=vicooodin@srs-us1.protection.inumbo.net>)
 id 1mEBbt-0002Q2-VL
 for xen-devel@lists.xenproject.org; Thu, 12 Aug 2021 14:23:05 +0000
Received: from mail-lj1-x22c.google.com (unknown [2a00:1450:4864:20::22c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc5747a4-339f-47a8-9a74-7e8db8049f43;
 Thu, 12 Aug 2021 14:22:40 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id n7so10906079ljq.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Aug 2021 07:22:40 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-213-80.b024.la.net.ua.
 [176.36.213.80])
 by smtp.gmail.com with ESMTPSA id s16sm329678ljj.48.2021.08.12.07.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 07:22:39 -0700 (PDT)
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
X-Inumbo-ID: cc5747a4-339f-47a8-9a74-7e8db8049f43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=inCVhx2xTjXRTUWKhimZDtGVbzmLyu/AE4x7F5P7a2A=;
        b=BKNQKgQfIFzmnp49yQKqVc+Wv10iSeHUsbMgMt+mD6Wu3tsk/Lm4F/t4nTzrnt7EEk
         J7VKbpCbwnPg+4Ai593QxG8urtUKJP8jyI5BcXXtH5vtmZro3JSwuWxieqQPHDenqwO5
         i0YZlVICZE5C0zzRH2SDHqPbQGF/vDiZ1nR8/rdyTxHBRAmYf19r1yW0y+WqHk9vA+ci
         I+8VTApj1PGd4Hx1YuZmOWHtMN1xlse0LfZNGXRKbrjZ3y3o2S7tAgQxgOURM5dFEp58
         +yNnjFkjQU21d73zNPWqI8gX9otcPRYXUNsxK3sBhhV4/Jyw6rUzI+EVK0Mgi82/aR8d
         Xd4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=inCVhx2xTjXRTUWKhimZDtGVbzmLyu/AE4x7F5P7a2A=;
        b=TPY6geC/dBkIfaa77bLplyftA+c9LfixGMauoU9nxQ6T7n3EU4PdRwrPs4b+HYxZuD
         lz/YrVjRxwCFAkbzd+nlOggFImVWbyJy4OHuoxLlAuyYZCQCDeHNjWpSIrlea+8qFHcs
         vh66tl3lQj27nDO2mhl8gxtOCd97nffOIxxRNUHC9VbsDb7uZFtWIAaczvI2dDmoK6eH
         3+9Q1dWuj6aLd/NS9b711S3dHxrikuKDmJU4TIVJBRd2O/9JlBEtjv1yS3Tf5/DTT6Y2
         twX3lqWiiBZD3RJfKPl4/ipJ3dHTFtyxzDlior/g7f9gh9L50ZRUYizAJf1oVKjjVLRd
         ys5g==
X-Gm-Message-State: AOAM530+7BkI31P5yFsF/niZJDxOJyCw3AA4ZyHtrQhEjUwMUzn8tdj6
	xYaDo3bswJwFs3dg4LQlBSxTy32k7xUOAQ==
X-Google-Smtp-Source: ABdhPJxwm3kLJPptggDG2RO5Tjk5OHMSKE1fExFYfWB0/fupslRtVvVWhlmtzLwgbvYJAdn2Gdrz9Q==
X-Received: by 2002:a05:651c:554:: with SMTP id q20mr3224240ljp.390.1628778159379;
        Thu, 12 Aug 2021 07:22:39 -0700 (PDT)
From: Anastasiia Lukianenko <vicooodin@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: oleksandr_tyshchenko@epam.com,
	artem_mygaiev@epam.com,
	rahul.singh@arm.com,
	bertrand.marquis@arm.com,
	oleksandr_andrushchenko@epam.com,
	roger.pau@citrix.com,
	julien@xen.org,
	sstabellini@kernel.org,
	andr2000@gmail.com,
	vicooodin@gmail.com,
	Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>
Subject: [PATCH 6/9] tools/libs/light: Add "read" command to xl pcid and libxl PCI
Date: Thu, 12 Aug 2021 17:22:27 +0300
Message-Id: <20210812142230.19353-7-vicooodin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210812142230.19353-1-vicooodin@gmail.com>
References: <20210812142230.19353-1-vicooodin@gmail.com>

From: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>

Libxl PCI can use xl pcid server to read integer value from the given path.

Signed-off-by: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>
---
 tools/include/pcid.h          |   1 +
 tools/libs/light/libxl_pci.c  | 125 ++++++++++++++++++----------------
 tools/libs/light/libxl_pcid.c |  50 ++++++++++++++
 3 files changed, 119 insertions(+), 57 deletions(-)

diff --git a/tools/include/pcid.h b/tools/include/pcid.h
index 935d99b186..f39011ecb8 100644
--- a/tools/include/pcid.h
+++ b/tools/include/pcid.h
@@ -32,6 +32,7 @@
 #define PCID_CMD_DIR_ID          "dir_id"
 
 #define PCID_CMD_WRITE           "write"
+#define PCID_CMD_READ_HEX        "read_hex"
 #define PCID_CMD_PCI_PATH        "pci_path"
 #define PCID_CMD_PCI_INFO        "pci_info"
 
diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 03ce42dec3..d5ddca4964 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -634,83 +634,94 @@ static int sysfs_dev_unbind(libxl__gc *gc, libxl_device_pci *pci,
 static uint16_t sysfs_dev_get_vendor(libxl__gc *gc, libxl_device_pci *pci)
 {
     char *pci_device_vendor_path =
-            GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/vendor",
-                      pci->domain, pci->bus, pci->dev, pci->func);
-    uint16_t read_items;
+            GCSPRINTF("/"PCI_BDF"/vendor", pci->domain, pci->bus,
+                      pci->dev, pci->func);
     uint16_t pci_device_vendor;
+    struct vchan_info *vchan;
+    libxl__json_object *args = NULL, *result = NULL;
 
-    FILE *f = fopen(pci_device_vendor_path, "r");
-    if (!f) {
-        LOGE(ERROR,
-             "pci device "PCI_BDF" does not have vendor attribute",
-             pci->domain, pci->bus, pci->dev, pci->func);
-        return 0xffff;
-    }
-    read_items = fscanf(f, "0x%hx\n", &pci_device_vendor);
-    fclose(f);
-    if (read_items != 1) {
-        LOGE(ERROR,
-             "cannot read vendor of pci device "PCI_BDF,
-             pci->domain, pci->bus, pci->dev, pci->func);
-        return 0xffff;
-    }
+    vchan = pci_prepare_vchan(gc);
+    if (!vchan)
+        goto fail;
+    libxl__vchan_param_add_string(gc, &args, PCID_CMD_PCI_INFO,
+                                  pci_device_vendor_path);
+    libxl__vchan_param_add_string(gc, &args, PCID_CMD_DIR_ID,
+                                  PCID_PCI_DEV);
+    result = vchan_send_command(gc, vchan, PCID_CMD_READ_HEX, args);
+    if (!result)
+        goto fail;
+
+    pci_device_vendor = libxl__json_object_get_integer(result);
 
     return pci_device_vendor;
+
+fail:
+    LOGE(ERROR,
+         "cannot read vendor of pci device "PCI_BDF,
+         pci->domain, pci->bus, pci->dev, pci->func);
+    return 0xffff;
 }
 
 static uint16_t sysfs_dev_get_device(libxl__gc *gc, libxl_device_pci *pci)
 {
     char *pci_device_device_path =
-            GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/device",
-                      pci->domain, pci->bus, pci->dev, pci->func);
-    uint16_t read_items;
+            GCSPRINTF("/"PCI_BDF"/device", pci->domain, pci->bus,
+                      pci->dev, pci->func);
     uint16_t pci_device_device;
+    struct vchan_info *vchan;
+    libxl__json_object *args = NULL, *result = NULL;
 
-    FILE *f = fopen(pci_device_device_path, "r");
-    if (!f) {
-        LOGE(ERROR,
-             "pci device "PCI_BDF" does not have device attribute",
-             pci->domain, pci->bus, pci->dev, pci->func);
-        return 0xffff;
-    }
-    read_items = fscanf(f, "0x%hx\n", &pci_device_device);
-    fclose(f);
-    if (read_items != 1) {
-        LOGE(ERROR,
-             "cannot read device of pci device "PCI_BDF,
-             pci->domain, pci->bus, pci->dev, pci->func);
-        return 0xffff;
-    }
+    vchan = pci_prepare_vchan(gc);
+    if (!vchan)
+        goto fail;
+    libxl__vchan_param_add_string(gc, &args, PCID_CMD_PCI_INFO,
+                                  pci_device_device_path);
+    libxl__vchan_param_add_string(gc, &args, PCID_CMD_DIR_ID,
+                                  PCID_PCI_DEV);
+    result = vchan_send_command(gc, vchan, PCID_CMD_READ_HEX, args);
+    if (!result)
+        goto fail;
+
+    pci_device_device = libxl__json_object_get_integer(result);
 
     return pci_device_device;
+
+fail:
+    LOGE(ERROR,
+         "cannot read device of pci device "PCI_BDF,
+         pci->domain, pci->bus, pci->dev, pci->func);
+    return 0xffff;
 }
 
 static int sysfs_dev_get_class(libxl__gc *gc, libxl_device_pci *pci,
                                unsigned long *class)
 {
-    char *pci_device_class_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/class",
-                     pci->domain, pci->bus, pci->dev, pci->func);
-    int read_items, ret = 0;
+    char *pci_device_class_path = GCSPRINTF("/"PCI_BDF"/class",
+                                            pci->domain, pci->bus,
+                                            pci->dev, pci->func);
+    struct vchan_info *vchan;
+    libxl__json_object *args = NULL, *result = NULL;
 
-    FILE *f = fopen(pci_device_class_path, "r");
-    if (!f) {
-        LOGE(ERROR,
-             "pci device "PCI_BDF" does not have class attribute",
-             pci->domain, pci->bus, pci->dev, pci->func);
-        ret = ERROR_FAIL;
-        goto out;
-    }
-    read_items = fscanf(f, "0x%lx\n", class);
-    fclose(f);
-    if (read_items != 1) {
-        LOGE(ERROR,
-             "cannot read class of pci device "PCI_BDF,
-             pci->domain, pci->bus, pci->dev, pci->func);
-        ret = ERROR_FAIL;
-    }
+    vchan = pci_prepare_vchan(gc);
+    if (!vchan)
+        goto fail;
+    libxl__vchan_param_add_string(gc, &args, PCID_CMD_PCI_INFO,
+                                  pci_device_class_path);
+    libxl__vchan_param_add_string(gc, &args, PCID_CMD_DIR_ID,
+                                  PCID_PCI_DEV);
+    result = vchan_send_command(gc, vchan, PCID_CMD_READ_HEX, args);
+    if (!result)
+        goto fail;
 
-out:
-    return ret;
+    *class = libxl__json_object_get_integer(result);
+
+    return 0;
+
+fail:
+    LOGE(ERROR,
+         "cannot read class of pci device "PCI_BDF,
+         pci->domain, pci->bus, pci->dev, pci->func);
+    return ERROR_FAIL;
 }
 
 /*
diff --git a/tools/libs/light/libxl_pcid.c b/tools/libs/light/libxl_pcid.c
index ee4c832779..0f736c68af 100644
--- a/tools/libs/light/libxl_pcid.c
+++ b/tools/libs/light/libxl_pcid.c
@@ -154,6 +154,54 @@ out:
     return result;
 }
 
+static libxl__json_object *process_read_hex_cmd(libxl__gc *gc,
+                                                const struct libxl__json_object *resp)
+{
+    libxl__json_object *result = NULL;
+    const struct libxl__json_object *args, *dir_id, *pci_info;
+    char *full_path;
+    uint16_t read_items;
+    long long read_number;
+
+    args = libxl__json_map_get(PCID_MSG_FIELD_ARGS, resp, JSON_MAP);
+    if (!args)
+        goto out;
+    dir_id = libxl__json_map_get(PCID_CMD_DIR_ID, args, JSON_ANY);
+    if (!dir_id)
+        goto out;
+    pci_info = libxl__json_map_get(PCID_CMD_PCI_INFO, args, JSON_ANY);
+    if (!pci_info)
+        goto out;
+
+    if (strcmp(PCID_PCI_DEV, dir_id->u.string) == 0)
+        full_path = libxl__sprintf(gc, SYSFS_PCI_DEV"%s", pci_info->u.string);
+    else
+        full_path = pci_info->u.string;
+
+    FILE *f = fopen(full_path, "r");
+    if (!f) {
+        LOGE(ERROR, "PCI device %s does not have needed attribute\n",
+                full_path);
+        goto out;
+    }
+    read_items = fscanf(f, "0x%llx\n", &read_number);
+    fclose(f);
+    if (read_items != 1) {
+        LOGE(ERROR, "Cannot read attribute of pci device %s\n", full_path);
+        goto out;
+    }
+
+    result = libxl__json_object_alloc(gc, JSON_INTEGER);
+    if (!result) {
+        LOGE(ERROR, "Memory allocation failed\n");
+        goto out;
+    }
+    result->u.i = read_number;
+
+out:
+    return result;
+}
+
 static int pcid_handle_message(libxl__gc *gc, const libxl__json_object *request,
                                libxl__json_object **result)
 {
@@ -171,6 +219,8 @@ static int pcid_handle_message(libxl__gc *gc, const libxl__json_object *request,
        *result = process_ls_cmd(gc, request);
     else if (strcmp(PCID_CMD_WRITE, command_name) == 0)
        *result = process_write_cmd(gc, request);
+    else if (strcmp(command_name, PCID_CMD_READ_HEX) == 0)
+        *result = process_read_hex_cmd(gc, request);
     else
         return ERROR_NOTFOUND;
 
-- 
2.17.1


