Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBFF3EA681
	for <lists+xen-devel@lfdr.de>; Thu, 12 Aug 2021 16:23:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166471.303868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEBc1-0005fw-Bx; Thu, 12 Aug 2021 14:23:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166471.303868; Thu, 12 Aug 2021 14:23:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEBc1-0005cY-7X; Thu, 12 Aug 2021 14:23:13 +0000
Received: by outflank-mailman (input) for mailman id 166471;
 Thu, 12 Aug 2021 14:23:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tERp=ND=gmail.com=vicooodin@srs-us1.protection.inumbo.net>)
 id 1mEBby-0002Q2-VW
 for xen-devel@lists.xenproject.org; Thu, 12 Aug 2021 14:23:11 +0000
Received: from mail-lj1-x235.google.com (unknown [2a00:1450:4864:20::235])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31167468-c47a-46b5-96f1-b5e6333f52bd;
 Thu, 12 Aug 2021 14:22:42 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id h11so10767961ljo.12
 for <xen-devel@lists.xenproject.org>; Thu, 12 Aug 2021 07:22:42 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-213-80.b024.la.net.ua.
 [176.36.213.80])
 by smtp.gmail.com with ESMTPSA id s16sm329678ljj.48.2021.08.12.07.22.40
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
X-Inumbo-ID: 31167468-c47a-46b5-96f1-b5e6333f52bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=k2neQYpzxMDHJ24D/F3vy55NfEdiyR+99TzkM/Q5nvs=;
        b=YjO7J84WGgQnejYXEteDMmXUZ1mtrw3o2iQ86nTaqnlb5BKnXNta8AsjUCrp/Q3Qwk
         m9nFOKN0DslGnwUphW0JynglEdFbJq1UZ53QKnUvWhaUNSxXL8RpFInJmN4+8dd57hxl
         EG4j9HUiGs25BGAAW5O8UAGBB76D86QC3U0ZWJAqHUqceFKtpNmphEy6vDymaflHND+U
         C+B1CXmhjDFxC6Z+v9WomoXXf5iDkM2ildaXHUCj2j0pnc9glOMftnuM7V3YcdEpHH9E
         U22TpL9nCMLrBBuBRhm5BXIPRY54etcH2oq0k5F56JZ4nVLOczJDVTQFLNNx3P7ZtySv
         KOVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=k2neQYpzxMDHJ24D/F3vy55NfEdiyR+99TzkM/Q5nvs=;
        b=eFhGTCjmGlzwFrueXFCw35Pjr+AB3Sgcx8mc7X/kO2TsyugEmEkMxjEWPwe2bqmVU9
         BQeJ174RiiE0pl1x3QfvQE6MYpOI/7iSnY4k7tbJ5lGiFxpOyIk7dRviSEtwKrFOQWBn
         UIfGGsqxGN2pYIkGh1YI0TObqsHB0CwuUthfJ+me0xSbkjzX7z+y9d+xY+AeYd7P+ttz
         lohktB1qIMeZhnMX/ZCxSHU7g9QbXJ7m/7NGOgiBHDSs7MKzV88JWnk4++5HwTMD9D0n
         NpWrtgDxd3qjTp+bSppUruD+9dWGSYgxXn0KwuG6DYRQFFRpfrv666BhWEUwcs7xjoCz
         RN+w==
X-Gm-Message-State: AOAM532uA3Kpow/9ctS7IznpOKqWpSFhVdf3pn2gMFxTUQ93YojIlxyT
	5i1apGYbWJTWnZ/OfEm3NXCu0LDV/xntVA==
X-Google-Smtp-Source: ABdhPJz5IVi2+4nToSisUryNM41G0uPelSFULQEuB4cFeY3QvOLyCJIxc+cJSaoWywqkceI3PMVlCQ==
X-Received: by 2002:a2e:9ec8:: with SMTP id h8mr3111661ljk.454.1628778161267;
        Thu, 12 Aug 2021 07:22:41 -0700 (PDT)
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
Subject: [PATCH 8/9] tools/libs/light: Add "unbind" and "read resources" commands to libxl PCI and xl pcid
Date: Thu, 12 Aug 2021 17:22:29 +0300
Message-Id: <20210812142230.19353-9-vicooodin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210812142230.19353-1-vicooodin@gmail.com>
References: <20210812142230.19353-1-vicooodin@gmail.com>

From: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>

Send requests to xl pcid from libxl PCI to prevent the libxl PCI from
reading / writing from / to the local sysfs directly.

"Unbind" command returns driver's path or "nolstat" result in success and
NULL if writing to PCI path failed.

"Read resources" command returns an array of PCI resources - start, end and
flags in success, NULL if getting resources from PCI path failed.

Signed-off-by: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>
---
 tools/include/pcid.h          |   7 +++
 tools/libs/light/libxl_pci.c  |  99 ++++++++++++++++++--------------
 tools/libs/light/libxl_pcid.c | 105 ++++++++++++++++++++++++++++++++++
 3 files changed, 169 insertions(+), 42 deletions(-)

diff --git a/tools/include/pcid.h b/tools/include/pcid.h
index 5c8efbb435..3153bafb19 100644
--- a/tools/include/pcid.h
+++ b/tools/include/pcid.h
@@ -29,11 +29,13 @@
 #define PCID_MSG_FIELD_ARGS      "arguments"
 
 #define PCID_CMD_LIST            "ls"
+#define PCID_CMD_UNBIND          "unbind"
 #define PCID_CMD_DIR_ID          "dir_id"
 
 #define PCID_CMD_WRITE           "write"
 #define PCID_CMD_READ_HEX        "read_hex"
 #define PCID_CMD_EXISTS          "exists"
+#define PCID_CMD_READ_RESOURCES  "read_resources"
 #define PCID_CMD_PCI_PATH        "pci_path"
 #define PCID_CMD_PCI_INFO        "pci_info"
 
@@ -44,12 +46,17 @@
 
 #if defined(__linux__)
 #define SYSFS_PCIBACK_DRIVER   "/sys/bus/pci/drivers/pciback"
+#define SYSFS_PCI_DEV          "/sys/bus/pci/devices"
 #endif
 
 #define PCI_INFO_PATH "/libxl/pci"
 #define PCI_BDF_XSPATH         "%04x-%02x-%02x-%01x"
 #define PCI_BDF                "%04x:%02x:%02x.%01x"
 
+#define RESOURCE_START "start"
+#define RESOURCE_END   "end"
+#define RESOURCE_FLAGS "flags"
+
 int libxl_pcid_process(libxl_ctx *ctx);
 
 #endif /* PCID_H */
diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index ab6709890e..3d9bf4830b 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -599,34 +599,32 @@ void libxl_device_pci_assignable_list_free(libxl_device_pci *list, int num)
 static int sysfs_dev_unbind(libxl__gc *gc, libxl_device_pci *pci,
                             char **driver_path)
 {
-    char *spath, *pci_path, *dp = NULL;
-    struct stat st;
+    char *pci_path, *dp = NULL;
 
     pci_path = GCSPRINTF("/"PCI_BDF"/driver", pci->domain, pci->bus,
                          pci->dev, pci->func);
+    char *pci_info;
+    struct vchan_info *vchan;
+    libxl__json_object *args = NULL, *result = NULL;
 
-    spath = GCSPRINTF(SYSFS_PCI_DEV"%s", pci_path);
-    if ( !lstat(spath, &st) ) {
-        /* Find the canonical path to the driver. */
-        dp = libxl__zalloc(gc, PATH_MAX);
-        dp = realpath(spath, dp);
-        if ( !dp ) {
-            LOGE(ERROR, "realpath() failed");
-            return -1;
-        }
-
-        LOG(DEBUG, "Driver re-plug path: %s", dp);
+    vchan = pci_prepare_vchan(gc);
+    if (!vchan)
+        return ERROR_FAIL;
 
-        /* Unbind from the old driver */
-        spath = GCSPRINTF("%s/unbind", dp);
-        if (sysfs_write_bdf(gc, SYSFS_PCI_DEV, pci_path, pci) < 0) {
-            LOGE(ERROR, "Couldn't unbind device");
-            return -1;
-        }
+    pci_info = GCSPRINTF(PCI_BDF, pci->domain, pci->bus, pci->dev, pci->func);
+    libxl__vchan_param_add_string(gc, &args, PCID_CMD_PCI_PATH, pci_path);
+    libxl__vchan_param_add_string(gc, &args, PCID_CMD_PCI_INFO, pci_info);
+    result = vchan_send_command(gc, vchan, PCID_CMD_UNBIND, args);
+    if (!result) {
+        LOGE(WARN, "Write to %s%s failed\n", SYSFS_PCI_DEV, pci_path);
+        return -1;
     }
 
-    if ( driver_path )
+    if (driver_path) {
+        if (strcmp(result->u.string, "nolstat") != 0)
+            dp = (char *)libxl__json_object_get_string(result);
         *driver_path = dp;
+    }
 
     return 0;
 }
@@ -1488,8 +1486,6 @@ static void pci_add_dm_done(libxl__egc *egc,
     STATE_AO_GC(pas->aodev->ao);
     libxl_ctx *ctx = libxl__gc_owner(gc);
     libxl_domid domid = pas->pci_domid;
-    char *sysfs_path;
-    FILE *f;
     unsigned long long start, end, flags, size;
     int irq, i;
     int r;
@@ -1510,20 +1506,38 @@ static void pci_add_dm_done(libxl__egc *egc,
     if (isstubdom)
         starting = false;
 
-    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/resource", pci->domain,
-                           pci->bus, pci->dev, pci->func);
-    f = fopen(sysfs_path, "r");
-    start = end = flags = size = 0;
-    irq = 0;
+    struct vchan_info *vchan;
+    libxl__json_object *result = NULL, *args = NULL;
+    const libxl__json_object *addr, *node;
+    char *resource_path, *irq_path;
 
-    if (f == NULL) {
-        LOGED(ERROR, domainid, "Couldn't open %s", sysfs_path);
+    vchan = pci_prepare_vchan(gc);
+    if (!vchan)
+        goto out;
+
+    resource_path = GCSPRINTF("/"PCI_BDF"/resource", pci->domain,
+                              pci->bus, pci->dev, pci->func);
+    libxl__vchan_param_add_string(gc, &args, PCID_CMD_PCI_INFO, resource_path);
+    result = vchan_send_command(gc, vchan, PCID_CMD_READ_RESOURCES, args);
+    if (!result) {
+        LOGED(ERROR, domainid, "Couldn't get resources from %s", resource_path);
         rc = ERROR_FAIL;
         goto out;
     }
+
+    start = end = flags = size = 0;
+    irq = 0;
+
     for (i = 0; i < PROC_PCI_NUM_RESOURCES; i++) {
-        if (fscanf(f, "0x%llx 0x%llx 0x%llx\n", &start, &end, &flags) != 3)
-            continue;
+        node = libxl__json_array_get(result, i);
+
+        addr = libxl__json_map_get(RESOURCE_START, node, JSON_INTEGER);
+        start = libxl__json_object_get_integer(addr);
+        addr = libxl__json_map_get(RESOURCE_END, node, JSON_INTEGER);
+        end = libxl__json_object_get_integer(addr);
+        addr = libxl__json_map_get(RESOURCE_FLAGS, node, JSON_INTEGER);
+        flags = libxl__json_object_get_integer(addr);
+
         size = end - start + 1;
         if (start) {
             if (flags & PCI_BAR_IO) {
@@ -1532,7 +1546,6 @@ static void pci_add_dm_done(libxl__egc *egc,
                     LOGED(ERROR, domainid,
                           "xc_domain_ioport_permission 0x%llx/0x%llx (error %d)",
                           start, size, r);
-                    fclose(f);
                     rc = ERROR_FAIL;
                     goto out;
                 }
@@ -1543,27 +1556,30 @@ static void pci_add_dm_done(libxl__egc *egc,
                     LOGED(ERROR, domainid,
                           "xc_domain_iomem_permission 0x%llx/0x%llx (error %d)",
                           start, size, r);
-                    fclose(f);
                     rc = ERROR_FAIL;
                     goto out;
                 }
             }
         }
     }
-    fclose(f);
-    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
-                                pci->bus, pci->dev, pci->func);
-    f = fopen(sysfs_path, "r");
-    if (f == NULL) {
-        LOGED(ERROR, domainid, "Couldn't open %s", sysfs_path);
+
+    irq_path = GCSPRINTF("/"PCI_BDF"/irq", pci->domain,
+                         pci->bus, pci->dev, pci->func);
+    libxl__vchan_param_add_string(gc, &args, PCID_CMD_PCI_INFO, irq_path);
+    libxl__vchan_param_add_string(gc, &args, PCID_CMD_DIR_ID, PCID_PCI_DEV);
+    result = vchan_send_command(gc, vchan, PCID_CMD_READ_HEX, args);
+    if (!result) {
+        LOGED(ERROR, domainid, "Couldn't get irq from %s", irq_path);
+        rc = ERROR_FAIL;
         goto out_no_irq;
     }
-    if ((fscanf(f, "%u", &irq) == 1) && irq) {
+
+    irq = libxl__json_object_get_integer(result);
+    if (irq) {
         r = xc_physdev_map_pirq(ctx->xch, domid, irq, &irq);
         if (r < 0) {
             LOGED(ERROR, domainid, "xc_physdev_map_pirq irq=%d (error=%d)",
                   irq, r);
-            fclose(f);
             rc = ERROR_FAIL;
             goto out;
         }
@@ -1578,7 +1594,6 @@ static void pci_add_dm_done(libxl__egc *egc,
         }
 #endif
     }
-    fclose(f);
 
     /* Don't restrict writes to the PCI config space from this VM */
     if (pci->permissive) {
diff --git a/tools/libs/light/libxl_pcid.c b/tools/libs/light/libxl_pcid.c
index 28d773f48d..7dd8f53f78 100644
--- a/tools/libs/light/libxl_pcid.c
+++ b/tools/libs/light/libxl_pcid.c
@@ -247,6 +247,107 @@ out:
     return result;
 }
 
+static libxl__json_object *process_read_rsc_cmd(libxl__gc *gc,
+                                                const struct libxl__json_object *resp)
+{
+    libxl__json_object *result = NULL;
+    const libxl__json_object *args, *pci_info;
+    libxl__json_object *node;
+    unsigned long long start, end, flags;
+    int i;
+    char *sysfs_path;
+    FILE *f;
+
+    args = libxl__json_map_get(PCID_MSG_FIELD_ARGS, resp, JSON_MAP);
+    if (!args)
+        goto out;
+    pci_info = libxl__json_map_get(PCID_CMD_PCI_INFO, args, JSON_ANY);
+    if (!pci_info)
+        goto out;
+
+    sysfs_path = libxl__sprintf(gc, SYSFS_PCI_DEV"%s", pci_info->u.string);
+    f = fopen(sysfs_path, "r");
+    if (!f) {
+        LOGE(ERROR, "Failed to open %s\n", sysfs_path);
+        goto out;
+    }
+
+    result = libxl__json_object_alloc(gc, JSON_ARRAY);
+    if (!result) {
+        LOGE(ERROR, "Memory allocation failed\n");
+        goto fail_mem_alloc;
+    }
+
+    for (i = 0; i < PROC_PCI_NUM_RESOURCES; i++) {
+        if (fscanf(f, "0x%llx 0x%llx 0x%llx\n", &start, &end, &flags) != 3)
+            continue;
+
+        node = libxl__json_object_alloc(gc, JSON_MAP);
+        if (!node) {
+            LOGE(ERROR, "Memory allocation failed\n");
+            goto fail_mem_alloc;
+        }
+        libxl__vchan_param_add_integer(gc, &node, RESOURCE_START, start);
+        libxl__vchan_param_add_integer(gc, &node, RESOURCE_END, end);
+        libxl__vchan_param_add_integer(gc, &node, RESOURCE_FLAGS, flags);
+        flexarray_append(result->u.array, node);
+    }
+
+fail_mem_alloc:
+    fclose(f);
+out:
+    return result;
+}
+
+static libxl__json_object *process_unbind_cmd(libxl__gc *gc,
+                                              const struct libxl__json_object *resp)
+{
+    libxl__json_object *result = NULL;
+    const struct libxl__json_object *args, *pci_path, *pci_info;
+    char *msg, *spath, *new_path, *dp = NULL;
+    struct stat st;
+
+    args = libxl__json_map_get(PCID_MSG_FIELD_ARGS, resp, JSON_MAP);
+    if (!args)
+        goto out;
+    pci_info = libxl__json_map_get(PCID_CMD_PCI_INFO, args, JSON_ANY);
+    if (!pci_info)
+        goto out;
+    pci_path = libxl__json_map_get(PCID_CMD_PCI_PATH, args, JSON_ANY);
+    if (!pci_path)
+        goto out;
+
+    spath = libxl__sprintf(gc, SYSFS_PCI_DEV"%s", pci_path->u.string);
+
+    if (!lstat(spath, &st)) {
+        /* Find the canonical path to the driver. */
+        dp = libxl__zalloc(gc, PATH_MAX);
+        if (!(realpath(spath, dp))) {
+            LOGE(ERROR, "realpath() failed\n");
+            goto out;
+        }
+        msg = dp;
+        /* Unbind from the old driver */
+        new_path = libxl__sprintf(gc, "%s/unbind", dp);
+
+        if (handle_write_cmd(gc, new_path, pci_info->u.string) != 0) {
+            LOGE(ERROR, "Couldn't unbind device\n");
+            goto out;
+        }
+    } else {
+        msg = libxl__sprintf(gc, "nolstat");
+    }
+    result = libxl__json_object_alloc(gc, JSON_STRING);
+    if (!result) {
+        LOGE(ERROR, "Memory allocation failed\n");
+        goto out;
+    }
+    result->u.string = msg;
+
+out:
+    return result;
+}
+
 static int pcid_handle_message(libxl__gc *gc, const libxl__json_object *request,
                                libxl__json_object **result)
 {
@@ -268,6 +369,10 @@ static int pcid_handle_message(libxl__gc *gc, const libxl__json_object *request,
         *result = process_read_hex_cmd(gc, request);
     else if (strcmp(command_name, PCID_CMD_EXISTS) == 0)
         *result = process_exists_cmd(gc, request);
+    else if (strcmp(command_name, PCID_CMD_READ_RESOURCES) == 0)
+        *result = process_read_rsc_cmd(gc, request);
+    else if (strcmp(command_name, PCID_CMD_UNBIND) == 0)
+        *result = process_unbind_cmd(gc, request);
     else
         return ERROR_NOTFOUND;
 
-- 
2.17.1


