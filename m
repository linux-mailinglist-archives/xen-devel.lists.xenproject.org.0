Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B34083EA682
	for <lists+xen-devel@lfdr.de>; Thu, 12 Aug 2021 16:23:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166478.303879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEBc5-0006IT-L8; Thu, 12 Aug 2021 14:23:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166478.303879; Thu, 12 Aug 2021 14:23:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEBc5-0006EQ-HF; Thu, 12 Aug 2021 14:23:17 +0000
Received: by outflank-mailman (input) for mailman id 166478;
 Thu, 12 Aug 2021 14:23:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tERp=ND=gmail.com=vicooodin@srs-us1.protection.inumbo.net>)
 id 1mEBc3-0002Q2-Vu
 for xen-devel@lists.xenproject.org; Thu, 12 Aug 2021 14:23:16 +0000
Received: from mail-lf1-x135.google.com (unknown [2a00:1450:4864:20::135])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8c57d227-a9ca-4282-96d4-222312233d86;
 Thu, 12 Aug 2021 14:22:43 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id z20so13830899lfd.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Aug 2021 07:22:42 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-213-80.b024.la.net.ua.
 [176.36.213.80])
 by smtp.gmail.com with ESMTPSA id s16sm329678ljj.48.2021.08.12.07.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 07:22:40 -0700 (PDT)
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
X-Inumbo-ID: 8c57d227-a9ca-4282-96d4-222312233d86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=mRu1nhbLdCG3tjQcY0lNShHW8lgPAtPkcfN4T//o5X4=;
        b=TsmtWtJS9CZTcjwYV8nlT64CwRYGtU17kWngeHIA6EfJAvRvqjyWr2IVNiXsoAQ7+Y
         ucooQelHRR3+fkHW2uBzPe7yAVyJ7saiqYttALbKFdARwjs32v17kZ9iUycLN71+IPWf
         V2fzgKaQUUfL8fPAN4WihEUHFxZjXfyWX+2AJsrnANjC47vo8QUvnNESvCYxu+/IUtah
         JWCWlEHca2MsB3LayUHVY6rNHfi5kD9gvx3ehxrbP2gZksVruQEghkVPIzq3CALgT3Kl
         Tzq6UqiGCKkOvkDfh+1waTPQJnt9OjB4KOz32VxAQmcAfBNgTWdkrVDAOEmu7VEhxzvm
         u16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=mRu1nhbLdCG3tjQcY0lNShHW8lgPAtPkcfN4T//o5X4=;
        b=bott3QLs4vuI5EGwIvFcfIRruscfbKm62eL1qUK+W6t9yi3+XzGFsgTLFFQOSAsF7+
         9FPzTN56sqqfcIsFvBgoj8GSJg+lWIF+jQd5y33vO2VN0Irl6ie+ODHEW7+uMDPuq+zP
         QHBBwDasux2xJpUlIQfub7KbkzlsdTAjR1/ppFOZgcrVK3wMjg4naeQwlpw5hJJscsoa
         h6Zvie4r2Lb8LRRfZSB8ATIslMoTZr+A7o2vC8GMWDhnHVeK6n3hhOXyyTgaZ1z3LKsh
         kZfujjTygzgTpHLSQkQpnPFXJC/pDCXgQgbOy5UtS/y5XEb2UBkP3uL6CRLRvcvVfZId
         FZHg==
X-Gm-Message-State: AOAM532dB1Lm2fofi51sAqgQ5Mcjt5lsirWWK8+0/tZz5DkjyqMdcRk3
	G0PdMRomXCvPccfRY6UYo28PKWCjtvKm+w==
X-Google-Smtp-Source: ABdhPJyKYLsBa6gX9NJCphm/jfMzDBnLENzVcaDQ0n1Va8qU3IYb0qb5sxZmkrYIh+wdOfIwCJ1JuA==
X-Received: by 2002:a05:6512:3884:: with SMTP id n4mr2763937lft.313.1628778160317;
        Thu, 12 Aug 2021 07:22:40 -0700 (PDT)
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
Subject: [PATCH 7/9] tools/libs/light: Make Libxl PCI get values from xl pcid instead of libxl side
Date: Thu, 12 Aug 2021 17:22:28 +0300
Message-Id: <20210812142230.19353-8-vicooodin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210812142230.19353-1-vicooodin@gmail.com>
References: <20210812142230.19353-1-vicooodin@gmail.com>

From: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>

pci_multifunction_check needs to use "ls" and "lstat" commands to get
information from sysfs.
Add "is_exists" command processing to xl pcid daemon to make possible
pci_multifunction_check read directories and check lstat by using xl pcid.

Signed-off-by: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>
---
 tools/include/pcid.h          |  1 +
 tools/libs/light/libxl_pci.c  | 47 ++++++++++++++++++-----------------
 tools/libs/light/libxl_pcid.c | 47 +++++++++++++++++++++++++++++++++++
 3 files changed, 72 insertions(+), 23 deletions(-)

diff --git a/tools/include/pcid.h b/tools/include/pcid.h
index f39011ecb8..5c8efbb435 100644
--- a/tools/include/pcid.h
+++ b/tools/include/pcid.h
@@ -33,6 +33,7 @@
 
 #define PCID_CMD_WRITE           "write"
 #define PCID_CMD_READ_HEX        "read_hex"
+#define PCID_CMD_EXISTS          "exists"
 #define PCID_CMD_PCI_PATH        "pci_path"
 #define PCID_CMD_PCI_INFO        "pci_info"
 
diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index d5ddca4964..ab6709890e 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1091,45 +1091,46 @@ int libxl_device_pci_assignable_remove(libxl_ctx *ctx, libxl_device_pci *pci,
 */
 static int pci_multifunction_check(libxl__gc *gc, libxl_device_pci *pci, unsigned int *func_mask)
 {
-    struct dirent *de;
-    DIR *dir;
-
     *func_mask = 0;
+    struct vchan_info *vchan;
+    libxl__json_object *result = NULL, *args = NULL;
+    const libxl__json_object *lstat_obj, *dir;
+    const char *dir_name;
+    int i;
 
-    dir = opendir(SYSFS_PCI_DEV);
-    if ( NULL == dir ) {
-        LOGE(ERROR, "Couldn't open %s", SYSFS_PCI_DEV);
+    vchan = pci_prepare_vchan(gc);
+    if (!vchan)
         return -1;
-    }
 
-    while( (de = readdir(dir)) ) {
+    libxl__vchan_param_add_string(gc, &args, PCID_CMD_DIR_ID, PCID_PCI_DEV);
+    result = vchan_send_command(gc, vchan, PCID_CMD_LIST, args);
+    if (!result)
+        return -1;
+
+    for (i = 0; (dir = libxl__json_array_get(result, i)); i++) {
+        dir_name = libxl__json_object_get_string(dir);
         unsigned dom, bus, dev, func;
-        struct stat st;
         char *path;
 
-        if ( sscanf(de->d_name, PCI_BDF, &dom, &bus, &dev, &func) != 4 )
+        if (sscanf(dir_name, PCI_BDF, &dom, &bus, &dev, &func) != 4)
             continue;
-        if ( pci->domain != dom )
+        if (pci->domain != dom)
             continue;
-        if ( pci->bus != bus )
+        if (pci->bus != bus)
             continue;
-        if ( pci->dev != dev )
+        if (pci->dev != dev)
             continue;
 
-        path = GCSPRINTF("%s/" PCI_BDF, SYSFS_PCIBACK_DRIVER, dom, bus, dev, func);
-        if ( lstat(path, &st) ) {
-            if ( errno == ENOENT )
-                LOG(ERROR, PCI_BDF " is not assigned to pciback driver",
-                    dom, bus, dev, func);
-            else
-                LOGE(ERROR, "Couldn't lstat %s", path);
-            closedir(dir);
+        path = GCSPRINTF("/" PCI_BDF, dom, bus, dev, func);
+        libxl__vchan_param_add_string(gc, &args, PCID_CMD_DIR_ID, PCID_PCIBACK_DRIVER);
+        libxl__vchan_param_add_string(gc, &args, PCID_CMD_PCI_INFO, path);
+        lstat_obj = vchan_send_command(gc, vchan, PCID_CMD_EXISTS, args);
+        if (!lstat_obj)
             return -1;
-        }
+
         (*func_mask) |= (1 << func);
     }
 
-    closedir(dir);
     return 0;
 }
 
diff --git a/tools/libs/light/libxl_pcid.c b/tools/libs/light/libxl_pcid.c
index 0f736c68af..28d773f48d 100644
--- a/tools/libs/light/libxl_pcid.c
+++ b/tools/libs/light/libxl_pcid.c
@@ -34,6 +34,10 @@
 #include <libxl_json.h>
 #include <dirent.h>
 
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <unistd.h>
+
 #define DOM0_ID 0
 
 static struct libxl__json_object *process_ls_cmd(libxl__gc *gc,
@@ -202,6 +206,47 @@ out:
     return result;
 }
 
+static libxl__json_object *process_exists_cmd(libxl__gc *gc,
+                                              const struct libxl__json_object *resp)
+{
+    libxl__json_object *result = NULL;
+    const struct libxl__json_object *args, *pci_path, *pci_info;
+    char *full_path;
+    struct stat st;
+
+    args = libxl__json_map_get(PCID_MSG_FIELD_ARGS, resp, JSON_MAP);
+    if (!args)
+        goto out;
+    pci_path = libxl__json_map_get(PCID_CMD_DIR_ID, args, JSON_ANY);
+    if (!pci_path)
+        goto out;
+    pci_info = libxl__json_map_get(PCID_CMD_PCI_INFO, args, JSON_ANY);
+    if (!pci_info)
+        goto out;
+    if (strcmp(pci_path->u.string, PCID_PCIBACK_DRIVER) == 0)
+        full_path = libxl__sprintf(gc, SYSFS_PCIBACK_DRIVER"%s", pci_info->u.string);
+    else
+        full_path = pci_info->u.string;
+
+    if (lstat(full_path, &st)) {
+        if (errno == ENOENT)
+            LOGE(ERROR, "%s is not assigned to pciback driver", full_path);
+        else
+            LOGE(ERROR, "Couldn't lstat %s", full_path);
+        goto out;
+    }
+
+    result = libxl__json_object_alloc(gc, JSON_STRING);
+    if (!result) {
+        LOGE(ERROR, "Memory allocation failed\n");
+        goto out;
+    }
+    result->u.string = pci_path->u.string;
+
+out:
+    return result;
+}
+
 static int pcid_handle_message(libxl__gc *gc, const libxl__json_object *request,
                                libxl__json_object **result)
 {
@@ -221,6 +266,8 @@ static int pcid_handle_message(libxl__gc *gc, const libxl__json_object *request,
        *result = process_write_cmd(gc, request);
     else if (strcmp(command_name, PCID_CMD_READ_HEX) == 0)
         *result = process_read_hex_cmd(gc, request);
+    else if (strcmp(command_name, PCID_CMD_EXISTS) == 0)
+        *result = process_exists_cmd(gc, request);
     else
         return ERROR_NOTFOUND;
 
-- 
2.17.1


