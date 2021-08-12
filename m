Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B3F3EA683
	for <lists+xen-devel@lfdr.de>; Thu, 12 Aug 2021 16:23:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166483.303891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEBcB-0006u6-6Z; Thu, 12 Aug 2021 14:23:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166483.303891; Thu, 12 Aug 2021 14:23:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEBcB-0006qF-2H; Thu, 12 Aug 2021 14:23:23 +0000
Received: by outflank-mailman (input) for mailman id 166483;
 Thu, 12 Aug 2021 14:23:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tERp=ND=gmail.com=vicooodin@srs-us1.protection.inumbo.net>)
 id 1mEBc8-0002Q2-Vs
 for xen-devel@lists.xenproject.org; Thu, 12 Aug 2021 14:23:21 +0000
Received: from mail-lf1-x136.google.com (unknown [2a00:1450:4864:20::136])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id db15243a-4c8e-4db6-8c86-b145e29ded7f;
 Thu, 12 Aug 2021 14:22:43 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id z20so13830951lfd.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Aug 2021 07:22:43 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-213-80.b024.la.net.ua.
 [176.36.213.80])
 by smtp.gmail.com with ESMTPSA id s16sm329678ljj.48.2021.08.12.07.22.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 07:22:41 -0700 (PDT)
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
X-Inumbo-ID: db15243a-4c8e-4db6-8c86-b145e29ded7f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=fF0wInCslqTLQh+Fbjb4/Af105vv4ysHAegwrEvgNV8=;
        b=Ve7AJGKRku9ZVNMC2JNKBULinWP6TztmfyDhHotFGk8aNVwpO/+p1cMs8cnJ4hSlNk
         3EaUfi7v8yBA/Gc7Emcp7oV7MC6HDE/QnMYwkfMZClIqEOxUPuxPvsJtZzc/jcYbEV3n
         a/ISC8EIQBVKHk1YZlUil0Xl+wcZ/MdqwcbVQfEfjlLSjKAQWXU+l/hKFLQ297HhdSu3
         nAlpSwzNwMDZ5Ri8uOjByEMV8K4lVZplrKC0DI9BN/iuuj0ullGaMgQfgyEJevzz+9rT
         rDCVCPVvaL6Iv0TTC8jqDbKOHshkaO8DmxY6CHLK/baX79YOBClGJvvrqqsTGyp7uewC
         R45w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=fF0wInCslqTLQh+Fbjb4/Af105vv4ysHAegwrEvgNV8=;
        b=DpbLHqg3MyaYvTaNProZ4hlamKWurjtKpU5kqB4ssC5BuSPsjD6ojdlw0VRq23v+wv
         eeAelN/d5VUlqQxu9qRgwT8F9095vH4JYb7MdOBdHnjyH9T6vedpDBUIK6Fnuy36R9GC
         kNTAyk3zSjA0Pov6B0D44OwkT97bljy5d2M4b9cNzfQ0WdtTm4wK0q2nYtQaICcQJWJn
         BYF1zSGl7ILuX9zoxHrAMcDwU00RUwHGFzgi8zNIqS11nX7pppNHKR7HNSLzW3qCnO67
         j/S2XqCgUDMKu55bBQwM6as+uLXh0ZUxiG3QaY+gRx6Jwvcyr/5TaVeBQ1WAbJhei+/i
         dWnA==
X-Gm-Message-State: AOAM532stQiKF9T7wqNXvQkdl73l+dE33JTf2gc/Fpx9cCELwZqhsfUv
	/48oYgsI2JiN5O8AfbGvTdB0HGSSCgHgOg==
X-Google-Smtp-Source: ABdhPJwrGBoi301pR4qIn8rI0NK6QKJqJOB5rjIuuUqbLBpA6iIl2wUOg6077nFXDEMgesdUwig7pA==
X-Received: by 2002:a05:6512:118a:: with SMTP id g10mr2708865lfr.491.1628778162524;
        Thu, 12 Aug 2021 07:22:42 -0700 (PDT)
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
Subject: [PATCH 9/9] tools/libs/light: Add "reset" and "remove" PCI dev commands to xl pcid daemon and libxl PCI
Date: Thu, 12 Aug 2021 17:22:30 +0300
Message-Id: <20210812142230.19353-10-vicooodin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210812142230.19353-1-vicooodin@gmail.com>
References: <20210812142230.19353-1-vicooodin@gmail.com>

From: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>

Add "reset" command processing to xl pcid daemon.
Make possible sending "reset"/"remove" PCI device requests from libxl PCI
to xl pcid daemon instead of using sysfs on libxl side.

Signed-off-by: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>
---
 tools/include/pcid.h          |  1 +
 tools/libs/light/libxl_pci.c  | 94 +++++++++++++++++++----------------
 tools/libs/light/libxl_pcid.c | 63 +++++++++++++++++++++++
 3 files changed, 115 insertions(+), 43 deletions(-)

diff --git a/tools/include/pcid.h b/tools/include/pcid.h
index 3153bafb19..38ea06c602 100644
--- a/tools/include/pcid.h
+++ b/tools/include/pcid.h
@@ -30,6 +30,7 @@
 
 #define PCID_CMD_LIST            "ls"
 #define PCID_CMD_UNBIND          "unbind"
+#define PCID_CMD_RESET           "reset"
 #define PCID_CMD_DIR_ID          "dir_id"
 
 #define PCID_CMD_WRITE           "write"
diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 3d9bf4830b..0498baa47e 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1635,37 +1635,26 @@ static int libxl__device_pci_reset(libxl__gc *gc, unsigned int domain, unsigned
                                    unsigned int dev, unsigned int func)
 {
     char *reset;
-    int fd, rc;
-
-    reset = GCSPRINTF("%s/do_flr", SYSFS_PCIBACK_DRIVER);
-    fd = open(reset, O_WRONLY);
-    if (fd >= 0) {
-        char *buf = GCSPRINTF(PCI_BDF, domain, bus, dev, func);
-        rc = write(fd, buf, strlen(buf));
-        if (rc < 0)
-            LOGD(ERROR, domain, "write to %s returned %d", reset, rc);
-        close(fd);
-        return rc < 0 ? rc : 0;
-    }
-    if (errno != ENOENT)
-        LOGED(ERROR, domain, "Failed to access pciback path %s", reset);
-    reset = GCSPRINTF("%s/"PCI_BDF"/reset", SYSFS_PCI_DEV, domain, bus, dev, func);
-    fd = open(reset, O_WRONLY);
-    if (fd >= 0) {
-        rc = write(fd, "1", 1);
-        if (rc < 0)
-            LOGED(ERROR, domain, "write to %s returned %d", reset, rc);
-        close(fd);
-        return rc < 0 ? rc : 0;
-    }
-    if (errno == ENOENT) {
-        LOGD(ERROR, domain,
-             "The kernel doesn't support reset from sysfs for PCI device "PCI_BDF,
-             domain, bus, dev, func);
-    } else {
-        LOGED(ERROR, domain, "Failed to access reset path %s", reset);
+    char *buf;
+    struct vchan_info *vchan;
+    libxl__json_object *args = NULL, *result = NULL;
+
+    vchan = pci_prepare_vchan(gc);
+    if (!vchan)
+        return -1;
+
+    reset = GCSPRINTF("%s", "/do_flr");
+    buf = GCSPRINTF(PCI_BDF, domain, bus, dev, func);
+
+    libxl__vchan_param_add_string(gc, &args, PCID_CMD_PCI_PATH, reset);
+    libxl__vchan_param_add_string(gc, &args, PCID_CMD_PCI_INFO, buf);
+    result = vchan_send_command(gc, vchan, PCID_CMD_RESET, args);
+    if (!result) {
+        LOGD(ERROR, domain, "write to %s returned error", reset);
+        return -1;
     }
-    return -1;
+
+    return 0;
 }
 
 int libxl__device_pci_setdefault(libxl__gc *gc, uint32_t domid,
@@ -2085,20 +2074,35 @@ static void do_pci_remove(libxl__egc *egc, pci_remove_state *prs)
             goto out_fail;
         }
     } else {
-        char *sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/resource", pci->domain,
+        char *sysfs_path = GCSPRINTF("/"PCI_BDF"/resource", pci->domain,
                                      pci->bus, pci->dev, pci->func);
-        FILE *f = fopen(sysfs_path, "r");
         unsigned int start = 0, end = 0, flags = 0, size = 0;
         int irq = 0;
         int i;
+        struct vchan_info *vchan;
+        libxl__json_object *args = NULL, *result = NULL;
+        const libxl__json_object *addr;
+        int j = 0;
 
-        if (f == NULL) {
-            LOGED(ERROR, domainid, "Couldn't open %s", sysfs_path);
+        vchan = pci_prepare_vchan(gc);
+        if (!vchan)
+            goto out_fail;
+        libxl__vchan_param_add_string(gc, &args, PCID_CMD_PCI_INFO, sysfs_path);
+        result = vchan_send_command(gc, vchan, PCID_CMD_READ_RESOURCES, args);
+        if (!result) {
+            LOGED(ERROR, domainid, "Couldn't get resources from %s", sysfs_path);
+            rc = ERROR_FAIL;
             goto skip1;
         }
+
         for (i = 0; i < PROC_PCI_NUM_RESOURCES; i++) {
-            if (fscanf(f, "0x%x 0x%x 0x%x\n", &start, &end, &flags) != 3)
-                continue;
+            addr = libxl__json_array_get(result, j++);
+            start = libxl__json_object_get_integer(addr);
+            addr = libxl__json_array_get(result, j++);
+            end = libxl__json_object_get_integer(addr);
+            addr = libxl__json_array_get(result, j++);
+            flags = libxl__json_object_get_integer(addr);
+
             size = end - start + 1;
             if (start) {
                 if (flags & PCI_BAR_IO) {
@@ -2119,16 +2123,21 @@ static void do_pci_remove(libxl__egc *egc, pci_remove_state *prs)
                 }
             }
         }
-        fclose(f);
+
 skip1:
-        sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
+        sysfs_path = GCSPRINTF("/"PCI_BDF"/irq", pci->domain,
                                pci->bus, pci->dev, pci->func);
-        f = fopen(sysfs_path, "r");
-        if (f == NULL) {
-            LOGED(ERROR, domainid, "Couldn't open %s", sysfs_path);
+        libxl__vchan_param_add_string(gc, &args, PCID_CMD_PCI_INFO, sysfs_path);
+        libxl__vchan_param_add_string(gc, &args, PCID_CMD_DIR_ID, PCID_PCI_DEV);
+        result = vchan_send_command(gc, vchan, PCID_CMD_READ_HEX, args);
+        if (!result) {
+            LOGED(ERROR, domainid, "Couldn't get irq from %s", sysfs_path);
+            rc = ERROR_FAIL;
             goto skip_irq;
         }
-        if ((fscanf(f, "%u", &irq) == 1) && irq) {
+
+        irq = libxl__json_object_get_integer(result);
+        if (irq) {
             rc = xc_physdev_unmap_pirq(ctx->xch, domid, irq);
             if (rc < 0) {
                 LOGED(ERROR, domainid, "xc_physdev_unmap_pirq irq=%d", irq);
@@ -2138,7 +2147,6 @@ skip1:
                 LOGED(ERROR, domainid, "xc_domain_irq_permission irq=%d", irq);
             }
         }
-        fclose(f);
     }
 skip_irq:
     rc = 0;
diff --git a/tools/libs/light/libxl_pcid.c b/tools/libs/light/libxl_pcid.c
index 7dd8f53f78..a4669b9533 100644
--- a/tools/libs/light/libxl_pcid.c
+++ b/tools/libs/light/libxl_pcid.c
@@ -348,6 +348,67 @@ out:
     return result;
 }
 
+static libxl__json_object *process_reset_cmd(libxl__gc *gc,
+                                             const struct libxl__json_object *resp)
+{
+    libxl__json_object *result = NULL;
+    const libxl__json_object *args, *pci_path, *pci_info;
+    char *reset;
+    int rc, fd;
+
+    args = libxl__json_map_get(PCID_MSG_FIELD_ARGS, resp, JSON_MAP);
+    if (!args)
+        goto out;
+    pci_info = libxl__json_map_get(PCID_CMD_PCI_INFO, args, JSON_ANY);
+    if (!pci_info)
+        goto out;
+    pci_path = libxl__json_map_get(PCID_CMD_PCI_PATH, args, JSON_ANY);
+
+    reset = libxl__sprintf(gc, SYSFS_PCIBACK_DRIVER"%s", pci_path->u.string);
+    fd = open(reset, O_WRONLY);
+    if (fd >= 0) {
+        rc = write(fd, pci_info->u.string, strlen(pci_info->u.string));
+        if (rc < 0) {
+            LOGE(ERROR, "write to %s returned %d\n", reset, rc);
+            goto out;
+        }
+        close(fd);
+        goto success;
+    }
+    if (errno != ENOENT)
+        LOGE(ERROR, "Failed to access pciback path %s\n", reset);
+
+    reset = libxl__sprintf(gc, "%s/%s/reset", SYSFS_PCI_DEV, pci_info->u.string);
+    fd = open(reset, O_WRONLY);
+    if (fd >= 0) {
+        rc = write(fd, "1", 1);
+        if (rc < 0) {
+            LOGE(ERROR, "write to %s returned %d\n", reset, rc);
+            goto out;
+        }
+        close(fd);
+        goto success;
+    }
+    if (errno == ENOENT)
+        LOGE(ERROR,
+                "The kernel doesn't support reset from sysfs for PCI device %s\n",
+                pci_info->u.string);
+    else
+        LOGE(ERROR, "Failed to access reset path %s\n", reset);
+    goto out;
+
+success:
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
@@ -373,6 +434,8 @@ static int pcid_handle_message(libxl__gc *gc, const libxl__json_object *request,
         *result = process_read_rsc_cmd(gc, request);
     else if (strcmp(command_name, PCID_CMD_UNBIND) == 0)
         *result = process_unbind_cmd(gc, request);
+    else if (strcmp(command_name, PCID_CMD_RESET) == 0)
+        *result = process_reset_cmd(gc, request);
     else
         return ERROR_NOTFOUND;
 
-- 
2.17.1


