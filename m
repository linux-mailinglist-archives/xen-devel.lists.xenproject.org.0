Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B453EA67F
	for <lists+xen-devel@lfdr.de>; Thu, 12 Aug 2021 16:23:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166463.303847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEBbq-0004Uw-H3; Thu, 12 Aug 2021 14:23:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166463.303847; Thu, 12 Aug 2021 14:23:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEBbq-0004Ru-Ae; Thu, 12 Aug 2021 14:23:02 +0000
Received: by outflank-mailman (input) for mailman id 166463;
 Thu, 12 Aug 2021 14:23:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tERp=ND=gmail.com=vicooodin@srs-us1.protection.inumbo.net>)
 id 1mEBbo-0002Q2-VG
 for xen-devel@lists.xenproject.org; Thu, 12 Aug 2021 14:23:00 +0000
Received: from mail-lj1-x232.google.com (unknown [2a00:1450:4864:20::232])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f146ec4-2442-4c88-866a-7dd44b380abc;
 Thu, 12 Aug 2021 14:22:39 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id n6so10773714ljp.9
 for <xen-devel@lists.xenproject.org>; Thu, 12 Aug 2021 07:22:39 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-213-80.b024.la.net.ua.
 [176.36.213.80])
 by smtp.gmail.com with ESMTPSA id s16sm329678ljj.48.2021.08.12.07.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 07:22:37 -0700 (PDT)
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
X-Inumbo-ID: 8f146ec4-2442-4c88-866a-7dd44b380abc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=lsigEyEQd5J6XuvBHqhWnDNkEtofXcrhnILksWH00iM=;
        b=XyW1gb9bH2YdxMPJ5EwY0SDVcFa6MyntkX+DUja59K3IcDwcEmCfkdsV32BYA+RPv4
         bDDabzVqHhitdbLHZ0MR/dvQ4e9fwOO5xAyij8dPQRy8x/jV+W+ENMMwOxIzRkk5GPJM
         yGkphC405Ein9DH5GvASUlaXeqZOubYkohAdBVPXko53WimlfEVU9DNgB7z5lJOvdnsV
         UCELcjqjCpqIl1ueiPoUOT7fNQVJy5JMYZkkmUGC4SnYCxNJnmNTgrV8f1vSxeNSH1SO
         x0IWtSS4UytuDrA9t2U8vVkSKOMomFZg9D6uBh07IqhUu5M7ExpEhAdwInOu0NEbHCDz
         2F3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=lsigEyEQd5J6XuvBHqhWnDNkEtofXcrhnILksWH00iM=;
        b=t1QGYLoLi3NONAZkESyqG9ZbYx1+sqWQwsXBzuYoJBhkwvjNznY/i/V7f4zULee0km
         k5KcYXgXiNaGhmBsFxMThpLEOhQlSFbBjHoQgJML27hkXh39NNHTA4tl0fmB79VDoWwq
         /i1BU1v5AIk+wtZgvU/S2jIpUhRYXvcy8CYQZEo2NddRdVlyVYi5QA56Iv+CwAidYaDN
         EWRchnTVz2Eqqi6JRnGPTxr2uGhraLjf6p74ywcnVgPwAzhcRh78njY7l0xX61WXAOJZ
         N3R7f5NksN6mmrGoaNenBzkEjpAXabPdQyalij8LvZ23bCRVBkpw27M+XSNzkoe7mWWn
         XmRw==
X-Gm-Message-State: AOAM533vrZcMTNedPLaAjRX763ihZRg8pSd+ROr3uR6VOvKXbkb982XU
	Q8zDKE7QG1AI22HzNDzsmcqEnkTOvjY2dw==
X-Google-Smtp-Source: ABdhPJxpz+xwdDf79Qy6LV8TTfBxB1VIPh8lU4qbF2yk0zFZkGDacHUowCUjhRFubiTJor/5+QTm4w==
X-Received: by 2002:a2e:9a50:: with SMTP id k16mr3146463ljj.308.1628778158297;
        Thu, 12 Aug 2021 07:22:38 -0700 (PDT)
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
Subject: [PATCH 5/9] tools/libs/light: Add "write" command to xl pcid and libxl PCI
Date: Thu, 12 Aug 2021 17:22:26 +0300
Message-Id: <20210812142230.19353-6-vicooodin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210812142230.19353-1-vicooodin@gmail.com>
References: <20210812142230.19353-1-vicooodin@gmail.com>

From: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>

Add functions for handling "write" command on xl pcid side. Libxl PCI side
receives reply:
1. success - string in "return" message
2. fail - error type of reply message

Signed-off-by: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>
---
 tools/include/pcid.h          |  7 ++++
 tools/libs/light/libxl_pci.c  | 69 +++++++++++++++++++----------------
 tools/libs/light/libxl_pcid.c | 69 +++++++++++++++++++++++++++++++++++
 3 files changed, 113 insertions(+), 32 deletions(-)

diff --git a/tools/include/pcid.h b/tools/include/pcid.h
index e9c3c497c6..935d99b186 100644
--- a/tools/include/pcid.h
+++ b/tools/include/pcid.h
@@ -31,7 +31,14 @@
 #define PCID_CMD_LIST            "ls"
 #define PCID_CMD_DIR_ID          "dir_id"
 
+#define PCID_CMD_WRITE           "write"
+#define PCID_CMD_PCI_PATH        "pci_path"
+#define PCID_CMD_PCI_INFO        "pci_info"
+
 #define PCID_PCIBACK_DRIVER      "pciback_driver"
+#define PCID_PCI_DEV             "pci_dev"
+
+#define SYSFS_DRIVER_PATH        "driver_path"
 
 #if defined(__linux__)
 #define SYSFS_PCIBACK_DRIVER   "/sys/bus/pci/drivers/pciback"
diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 6534b70777..03ce42dec3 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -455,28 +455,34 @@ static bool is_pci_in_array(libxl_device_pci *pcis, int num,
 }
 
 /* Write the standard BDF into the sysfs path given by sysfs_path. */
-static int sysfs_write_bdf(libxl__gc *gc, const char * sysfs_path,
+static int sysfs_write_bdf(libxl__gc *gc, const char *sysfs_path,
+                           const char *pci_path,
                            libxl_device_pci *pci)
 {
-    int rc, fd;
     char *buf;
 
-    fd = open(sysfs_path, O_WRONLY);
-    if (fd < 0) {
-        LOGE(ERROR, "Couldn't open %s", sysfs_path);
-        return ERROR_FAIL;
-    }
+    struct vchan_info *vchan;
+    libxl__json_object *args = NULL, *result = NULL;
 
-    buf = GCSPRINTF(PCI_BDF, pci->domain, pci->bus,
-                    pci->dev, pci->func);
-    rc = write(fd, buf, strlen(buf));
-    /* Annoying to have two if's, but we need the errno */
-    if (rc < 0)
-        LOGE(ERROR, "write to %s returned %d", sysfs_path, rc);
-    close(fd);
+    vchan = pci_prepare_vchan(gc);
+    if (!vchan)
+        return ERROR_FAIL;
 
-    if (rc < 0)
+    buf = GCSPRINTF(PCI_BDF, pci->domain, pci->bus, pci->dev, pci->func);
+    if (strcmp(SYSFS_PCI_DEV, sysfs_path) == 0)
+        libxl__vchan_param_add_string(gc, &args, PCID_CMD_DIR_ID, PCID_PCI_DEV);
+    else if (strcmp(SYSFS_PCIBACK_DRIVER, sysfs_path) == 0)
+        libxl__vchan_param_add_string(gc, &args, PCID_CMD_DIR_ID, PCID_PCIBACK_DRIVER);
+    else if (strcmp(SYSFS_DRIVER_PATH, sysfs_path) == 0)
+        libxl__vchan_param_add_string(gc, &args, PCID_CMD_DIR_ID, SYSFS_DRIVER_PATH);
+
+    libxl__vchan_param_add_string(gc, &args, PCID_CMD_PCI_PATH, pci_path);
+    libxl__vchan_param_add_string(gc, &args, PCID_CMD_PCI_INFO, buf);
+    result = vchan_send_command(gc, vchan, PCID_CMD_WRITE, args);
+    if (!result) {
+        LOGE(WARN, "Write %s to %s failed\n", buf, sysfs_path);
         return ERROR_FAIL;
+    }
 
     return 0;
 }
@@ -593,14 +599,13 @@ void libxl_device_pci_assignable_list_free(libxl_device_pci *list, int num)
 static int sysfs_dev_unbind(libxl__gc *gc, libxl_device_pci *pci,
                             char **driver_path)
 {
-    char * spath, *dp = NULL;
+    char *spath, *pci_path, *dp = NULL;
     struct stat st;
 
-    spath = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/driver",
-                           pci->domain,
-                           pci->bus,
-                           pci->dev,
-                           pci->func);
+    pci_path = GCSPRINTF("/"PCI_BDF"/driver", pci->domain, pci->bus,
+                         pci->dev, pci->func);
+
+    spath = GCSPRINTF(SYSFS_PCI_DEV"%s", pci_path);
     if ( !lstat(spath, &st) ) {
         /* Find the canonical path to the driver. */
         dp = libxl__zalloc(gc, PATH_MAX);
@@ -614,7 +619,7 @@ static int sysfs_dev_unbind(libxl__gc *gc, libxl_device_pci *pci,
 
         /* Unbind from the old driver */
         spath = GCSPRINTF("%s/unbind", dp);
-        if ( sysfs_write_bdf(gc, spath, pci) < 0 ) {
+        if (sysfs_write_bdf(gc, SYSFS_PCI_DEV, pci_path, pci) < 0) {
             LOGE(ERROR, "Couldn't unbind device");
             return -1;
         }
@@ -816,14 +821,14 @@ static int pciback_dev_assign(libxl__gc *gc, libxl_device_pci *pci)
         LOGE(ERROR, "Error checking for pciback slot");
         return ERROR_FAIL;
     } else if (rc == 0) {
-        if ( sysfs_write_bdf(gc, SYSFS_PCIBACK_DRIVER"/new_slot",
-                             pci) < 0 ) {
+        if (sysfs_write_bdf(gc, SYSFS_PCIBACK_DRIVER, "/new_slot",
+                            pci) < 0) {
             LOGE(ERROR, "Couldn't bind device to pciback!");
             return ERROR_FAIL;
         }
     }
 
-    if ( sysfs_write_bdf(gc, SYSFS_PCIBACK_DRIVER"/bind", pci) < 0 ) {
+    if (sysfs_write_bdf(gc, SYSFS_PCIBACK_DRIVER, "/bind", pci) < 0) {
         LOGE(ERROR, "Couldn't bind device to pciback!");
         return ERROR_FAIL;
     }
@@ -840,8 +845,8 @@ static int pciback_dev_unassign(libxl__gc *gc, libxl_device_pci *pci)
 
     /* Remove slot if necessary */
     if ( pciback_dev_has_slot(gc, pci) > 0 ) {
-        if ( sysfs_write_bdf(gc, SYSFS_PCIBACK_DRIVER"/remove_slot",
-                             pci) < 0 ) {
+        if (sysfs_write_bdf(gc, SYSFS_PCIBACK_DRIVER, "/remove_slot",
+                            pci) < 0) {
             LOGE(ERROR, "Couldn't remove pciback slot");
             return ERROR_FAIL;
         }
@@ -1022,9 +1027,9 @@ static int libxl__device_pci_assignable_remove(libxl__gc *gc,
         if ( rebind ) {
             LOG(INFO, "Rebinding to driver at %s", driver_path);
 
-            if ( sysfs_write_bdf(gc,
-                                 GCSPRINTF("%s/bind", driver_path),
-                                 pci) < 0 ) {
+            if (sysfs_write_bdf(gc, SYSFS_DRIVER_PATH,
+                                GCSPRINTF("%s/bind", driver_path),
+                                pci) < 0) {
                 LOGE(ERROR, "Couldn't bind device to %s", driver_path);
                 return -1;
             }
@@ -1565,8 +1570,8 @@ static void pci_add_dm_done(libxl__egc *egc,
 
     /* Don't restrict writes to the PCI config space from this VM */
     if (pci->permissive) {
-        if ( sysfs_write_bdf(gc, SYSFS_PCIBACK_DRIVER"/permissive",
-                             pci) < 0 ) {
+        if (sysfs_write_bdf(gc, SYSFS_PCIBACK_DRIVER, "/permissive",
+                            pci) < 0) {
             LOGD(ERROR, domainid, "Setting permissive for device");
             rc = ERROR_FAIL;
             goto out;
diff --git a/tools/libs/light/libxl_pcid.c b/tools/libs/light/libxl_pcid.c
index c897244e8a..ee4c832779 100644
--- a/tools/libs/light/libxl_pcid.c
+++ b/tools/libs/light/libxl_pcid.c
@@ -87,6 +87,73 @@ out:
     return result;
 }
 
+static int handle_write_cmd(libxl__gc *gc, char *sysfs_path, char *pci_info)
+{
+    int rc, fd;
+
+    fd = open(sysfs_path, O_WRONLY);
+    if (fd < 0) {
+        LOGE(ERROR, "Couldn't open %s\n", sysfs_path);
+        return ERROR_FAIL;
+    }
+
+    rc = write(fd, pci_info, strlen(pci_info));
+    close(fd);
+    if (rc < 0) {
+        LOGE(ERROR, "write to %s returned %d\n", sysfs_path, rc);
+        return ERROR_FAIL;
+    }
+
+    return 0;
+}
+
+static libxl__json_object *process_write_cmd(libxl__gc *gc,
+                                             const struct libxl__json_object *resp)
+{
+    libxl__json_object *result = NULL;
+    const struct libxl__json_object *args, *dir_id, *pci_path, *pci_info;
+    char *full_path;
+    int ret;
+
+    args = libxl__json_map_get(PCID_MSG_FIELD_ARGS, resp, JSON_MAP);
+    if (!args)
+        goto out;
+    dir_id = libxl__json_map_get(PCID_CMD_DIR_ID, args, JSON_ANY);
+    if (!dir_id)
+        goto out;
+    pci_path = libxl__json_map_get(PCID_CMD_PCI_PATH, args, JSON_ANY);
+    if (!pci_path)
+        goto out;
+    pci_info = libxl__json_map_get(PCID_CMD_PCI_INFO, args, JSON_ANY);
+    if (!pci_info)
+        goto out;
+
+    if (strcmp(dir_id->u.string, PCID_PCI_DEV) == 0)
+        full_path = libxl__sprintf(gc, SYSFS_PCI_DEV"%s", pci_path->u.string);
+    else if (strcmp(dir_id->u.string, PCID_PCIBACK_DRIVER) == 0)
+        full_path = libxl__sprintf(gc, SYSFS_PCIBACK_DRIVER"%s", pci_path->u.string);
+    else if (strcmp(dir_id->u.string, SYSFS_DRIVER_PATH) == 0)
+        full_path = pci_path->u.string;
+    else {
+        LOGE(ERROR, "Unknown write directory %s\n", dir_id->u.string);
+        goto out;
+    }
+
+    ret = handle_write_cmd(gc, full_path, pci_info->u.string);
+    if (ret != 0)
+        goto out;
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
@@ -102,6 +169,8 @@ static int pcid_handle_message(libxl__gc *gc, const libxl__json_object *request,
 
     if (strcmp(command_name, PCID_CMD_LIST) == 0)
        *result = process_ls_cmd(gc, request);
+    else if (strcmp(PCID_CMD_WRITE, command_name) == 0)
+       *result = process_write_cmd(gc, request);
     else
         return ERROR_NOTFOUND;
 
-- 
2.17.1


