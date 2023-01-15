Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EFE66B0A8
	for <lists+xen-devel@lfdr.de>; Sun, 15 Jan 2023 12:31:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477864.740827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pH1EV-0006Wy-Ee; Sun, 15 Jan 2023 11:31:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477864.740827; Sun, 15 Jan 2023 11:31:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pH1EV-0006SY-6b; Sun, 15 Jan 2023 11:31:27 +0000
Received: by outflank-mailman (input) for mailman id 477864;
 Sun, 15 Jan 2023 11:31:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ytYW=5M=gmail.com=dmitry.semenets@srs-se1.protection.inumbo.net>)
 id 1pH1ET-0004co-DB
 for xen-devel@lists.xenproject.org; Sun, 15 Jan 2023 11:31:25 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 230e1483-94c8-11ed-b8d0-410ff93cb8f0;
 Sun, 15 Jan 2023 12:31:22 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id mp20so15434679ejc.7
 for <xen-devel@lists.xenproject.org>; Sun, 15 Jan 2023 03:31:22 -0800 (PST)
Received: from dsemenets-HP-EliteBook-850-G8-Notebook-PC.. ([91.219.254.73])
 by smtp.gmail.com with ESMTPSA id
 uj42-20020a170907c9aa00b0084d4e612a22sm7459961ejc.67.2023.01.15.03.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 03:31:20 -0800 (PST)
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
X-Inumbo-ID: 230e1483-94c8-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQf6nMYZTsKyVSis1dtkaKRd/WNynJi6oS+H2pCRPK4=;
        b=b1fWQURdMrLlTHhc7988e863g0gmdekRAYutqRUOdN7cPy7Sfb4P1c2FmKM5UqsfbS
         g0E1qVTXCwtotjcXHLtDOwcl8leftSP7cd8N5AUjN+opJPHyytKGsgd93TGhQzRXEOdJ
         oHc8YhzncL8xzpPNL+C1+sMxrmNoynlScFryOp2odfrc4cJaqQmOORSFLj5eiDeC64Dw
         clRgm1ZHjjUrM1YIqC2pwY+lGuKoHbQrDLHt5seQ1hl8GLHn+W56auWL1Wv3emVDtSad
         O8sF80wekUj08Onzt3XfJ+4wFUuH+guOY+PqFW00AQNn1K3jtniK+DPekeuXt47DIUIq
         kr2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qQf6nMYZTsKyVSis1dtkaKRd/WNynJi6oS+H2pCRPK4=;
        b=6Gq6iIggLxRuuR3/fC5E7IVUQCmbYcvyjw4jaag0VaMFK0VjuneA26u8tuYFKHoAzQ
         Xq4LqerL33hcLiMfXo85hRbmJt9OW4HgfzGYmbthXQTYUlrDo+uhNRMMGAMl0DdWVEpc
         8Fnq+blmDLtQy/GVn4ChOK9Ovcoo4u6aa1fq/mTGfVS4+EyZTIEWOnyn/N6i4zc+v5nk
         Q76XYP4lOHWYspXorf+n3zPkrI7fDiDgo7iaRBaAxRbPsRMBFlmxS34ITwvVybIgRwZ4
         MNig4HOI3G10Bj9MUqza4rzQcFSsQd3ZmSZm1IRG1UTUJxR1Oalblo67ynSNBFkUSDI0
         58wA==
X-Gm-Message-State: AFqh2kqOP2DCZRrTtZAKx22TRmcwYQ/1FYMkA0woX0GeFBUO04HaXv9v
	bdnMfOffb77thEUepsLFxfho6TWNl57H5m0v
X-Google-Smtp-Source: AMrXdXvys0v7on+HORafcG2tSLqa7aLVQ7y7zFyuXcAIURFw/5cESvXLmPgsZxWNaTgSkvni09S3Og==
X-Received: by 2002:a17:906:4f02:b0:86e:4067:b699 with SMTP id t2-20020a1709064f0200b0086e4067b699mr3656816eju.4.1673782281236;
        Sun, 15 Jan 2023 03:31:21 -0800 (PST)
From: Dmytro Semenets <dmitry.semenets@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [RFC PATCH v3 06/10] tools/light: pci: move assign/revert logic to pcid
Date: Sun, 15 Jan 2023 13:31:07 +0200
Message-Id: <20230115113111.1207605-7-dmitry.semenets@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230115113111.1207605-1-dmitry.semenets@gmail.com>
References: <20230115113111.1207605-1-dmitry.semenets@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

Implement commands MAKE_ASSIGNABLE and REVERT_ASSIGNABLE in pcid in
the same way as they were implemented in libxl_pci.c

Replace original logic in libxl_pci.c by calling appropriate functions
from pcid.

This is quite huge patch, as lots of code were moved from lixbl_pci.c
to libxl_pcid.c.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 tools/libs/light/libxl_pci.c  | 292 +++++--------------------
 tools/libs/light/libxl_pcid.c | 396 ++++++++++++++++++++++++++++++++++
 2 files changed, 454 insertions(+), 234 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 321543f5bf..0351a0d3df 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -82,6 +82,10 @@ static int pci_handle_response(libxl__gc *gc,
 
     if (strcmp(command_name, PCID_CMD_LIST_ASSIGNABLE) == 0)
        ret = process_list_assignable(gc, response, result);
+    else if (strcmp(command_name, PCID_CMD_MAKE_ASSIGNABLE) == 0)
+        *result = libxl__json_object_alloc(gc, JSON_NULL);
+    else if (strcmp(command_name, PCID_CMD_REVERT_ASSIGNABLE) == 0)
+        *result = libxl__json_object_alloc(gc, JSON_NULL);
 
     return ret;
 }
@@ -636,44 +640,6 @@ void libxl_device_pci_assignable_list_free(libxl_device_pci *list, int num)
     free(list);
 }
 
-/* Unbind device from its current driver, if any.  If driver_path is non-NULL,
- * store the path to the original driver in it. */
-static int sysfs_dev_unbind(libxl__gc *gc, libxl_device_pci *pci,
-                            char **driver_path)
-{
-    char * spath, *dp = NULL;
-    struct stat st;
-
-    spath = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/driver",
-                           pci->domain,
-                           pci->bus,
-                           pci->dev,
-                           pci->func);
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
-
-        /* Unbind from the old driver */
-        spath = GCSPRINTF("%s/unbind", dp);
-        if ( sysfs_write_bdf(gc, spath, pci) < 0 ) {
-            LOGE(ERROR, "Couldn't unbind device");
-            return -1;
-        }
-    }
-
-    if ( driver_path )
-        *driver_path = dp;
-
-    return 0;
-}
-
 static uint16_t sysfs_dev_get_vendor(libxl__gc *gc, libxl_device_pci *pci)
 {
     char *pci_device_vendor_path =
@@ -785,49 +751,6 @@ bool libxl__is_igd_vga_passthru(libxl__gc *gc,
     return false;
 }
 
-/*
- * A brief comment about slots.  I don't know what slots are for; however,
- * I have by experimentation determined:
- * - Before a device can be bound to pciback, its BDF must first be listed
- *   in pciback/slots
- * - The way to get the BDF listed there is to write BDF to
- *   pciback/new_slot
- * - Writing the same BDF to pciback/new_slot is not idempotent; it results
- *   in two entries of the BDF in pciback/slots
- * It's not clear whether having two entries in pciback/slots is a problem
- * or not.  Just to be safe, this code does the conservative thing, and
- * first checks to see if there is a slot, adding one only if one does not
- * already exist.
- */
-
-/* Scan through /sys/.../pciback/slots looking for pci's BDF */
-static int pciback_dev_has_slot(libxl__gc *gc, libxl_device_pci *pci)
-{
-    FILE *f;
-    int rc = 0;
-    unsigned dom, bus, dev, func;
-
-    f = fopen(SYSFS_PCIBACK_DRIVER"/slots", "r");
-
-    if (f == NULL) {
-        LOGE(ERROR, "Couldn't open %s", SYSFS_PCIBACK_DRIVER"/slots");
-        return ERROR_FAIL;
-    }
-
-    while (fscanf(f, "%x:%x:%x.%d\n", &dom, &bus, &dev, &func) == 4) {
-        if (dom == pci->domain
-            && bus == pci->bus
-            && dev == pci->dev
-            && func == pci->func) {
-            rc = 1;
-            goto out;
-        }
-    }
-out:
-    fclose(f);
-    return rc;
-}
-
 static int pciback_dev_is_assigned(libxl__gc *gc, libxl_device_pci *pci)
 {
     char * spath;
@@ -856,133 +779,34 @@ static int pciback_dev_is_assigned(libxl__gc *gc, libxl_device_pci *pci)
     return -1;
 }
 
-static int pciback_dev_assign(libxl__gc *gc, libxl_device_pci *pci)
-{
-    int rc;
-
-    if ( (rc = pciback_dev_has_slot(gc, pci)) < 0 ) {
-        LOGE(ERROR, "Error checking for pciback slot");
-        return ERROR_FAIL;
-    } else if (rc == 0) {
-        if ( sysfs_write_bdf(gc, SYSFS_PCIBACK_DRIVER"/new_slot",
-                             pci) < 0 ) {
-            LOGE(ERROR, "Couldn't bind device to pciback!");
-            return ERROR_FAIL;
-        }
-    }
-
-    if ( sysfs_write_bdf(gc, SYSFS_PCIBACK_DRIVER"/bind", pci) < 0 ) {
-        LOGE(ERROR, "Couldn't bind device to pciback!");
-        return ERROR_FAIL;
-    }
-    return 0;
-}
-
-static int pciback_dev_unassign(libxl__gc *gc, libxl_device_pci *pci)
-{
-    /* Remove from pciback */
-    if ( sysfs_dev_unbind(gc, pci, NULL) < 0 ) {
-        LOG(ERROR, "Couldn't unbind device!");
-        return ERROR_FAIL;
-    }
-
-    /* Remove slot if necessary */
-    if ( pciback_dev_has_slot(gc, pci) > 0 ) {
-        if ( sysfs_write_bdf(gc, SYSFS_PCIBACK_DRIVER"/remove_slot",
-                             pci) < 0 ) {
-            LOGE(ERROR, "Couldn't remove pciback slot");
-            return ERROR_FAIL;
-        }
-    }
-    return 0;
-}
-
 static int libxl__device_pci_assignable_add(libxl__gc *gc,
                                             libxl_device_pci *pci,
                                             int rebind)
 {
     libxl_ctx *ctx = libxl__gc_owner(gc);
-    unsigned dom, bus, dev, func;
-    char *spath, *driver_path = NULL;
-    const char *name;
+    struct vchan_info *vchan;
     int rc;
-    struct stat st;
-
-    /* Local copy for convenience */
-    dom = pci->domain;
-    bus = pci->bus;
-    dev = pci->dev;
-    func = pci->func;
-    name = pci->name;
-
-    /* Sanitise any name that is set */
-    if (name) {
-        unsigned int i, n = strlen(name);
+    libxl__json_object *args, *result;
 
-        if (n > 64) { /* Reasonable upper bound on name length */
-            LOG(ERROR, "Name too long");
-            return ERROR_FAIL;
-        }
-
-        for (i = 0; i < n; i++) {
-            if (!isgraph(name[i])) {
-                LOG(ERROR, "Names may only include printable characters");
-                return ERROR_FAIL;
-            }
-        }
-    }
-
-    /* See if the device exists */
-    spath = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF, dom, bus, dev, func);
-    if ( lstat(spath, &st) ) {
-        LOGE(ERROR, "Couldn't lstat %s", spath);
-        return ERROR_FAIL;
-    }
-
-    /* Check to see if it's already assigned to pciback */
-    rc = pciback_dev_is_assigned(gc, pci);
-    if ( rc < 0 ) {
-        return ERROR_FAIL;
-    }
-    if ( rc ) {
-        LOG(WARN, PCI_BDF" already assigned to pciback", dom, bus, dev, func);
-        goto name;
+    vchan = pci_vchan_get_client(gc);
+    if (!vchan) {
+        rc = ERROR_NOT_READY;
+        goto out;
     }
 
-    /* Check to see if there's already a driver that we need to unbind from */
-    if ( sysfs_dev_unbind(gc, pci, &driver_path ) ) {
-        LOG(ERROR, "Couldn't unbind "PCI_BDF" from driver",
-            dom, bus, dev, func);
-        return ERROR_FAIL;
-    }
+    args = libxl__vchan_start_args(gc);
 
-    /* Store driver_path for rebinding to dom0 */
-    if ( rebind ) {
-        if ( driver_path ) {
-            pci_info_xs_write(gc, pci, "driver_path", driver_path);
-        } else if ( (driver_path =
-                     pci_info_xs_read(gc, pci, "driver_path")) != NULL ) {
-            LOG(INFO, PCI_BDF" not bound to a driver, will be rebound to %s",
-                dom, bus, dev, func, driver_path);
-        } else {
-            LOG(WARN, PCI_BDF" not bound to a driver, will not be rebound.",
-                dom, bus, dev, func);
-        }
-    } else {
-        pci_info_xs_remove(gc, pci, "driver_path");
-    }
+    libxl__vchan_arg_add_string(gc, args, PCID_MSG_FIELD_SBDF,
+                                GCSPRINTF(PCID_SBDF_FMT, pci->domain,
+                                          pci->bus, pci->dev, pci->func));
+    libxl__vchan_arg_add_bool(gc, args, PCID_MSG_FIELD_REBIND, rebind);
 
-    if ( pciback_dev_assign(gc, pci) ) {
-        LOG(ERROR, "Couldn't bind device to pciback!");
-        return ERROR_FAIL;
+    result = vchan_send_command(gc, vchan, PCID_CMD_MAKE_ASSIGNABLE, args);
+    if (!result) {
+        rc = ERROR_FAIL;
+        goto vchan_free;
     }
 
-name:
-    if (name)
-        pci_info_xs_write(gc, pci, "name", name);
-    else
-        pci_info_xs_remove(gc, pci, "name");
-
     /*
      * DOMID_IO is just a sentinel domain, without any actual mappings,
      * so always pass XEN_DOMCTL_DEV_RDM_RELAXED to avoid assignment being
@@ -990,12 +814,15 @@ name:
      */
     rc = xc_assign_device(ctx->xch, DOMID_IO, pci_encode_bdf(pci),
                           XEN_DOMCTL_DEV_RDM_RELAXED);
-    if ( rc < 0 ) {
-        LOG(ERROR, "failed to quarantine "PCI_BDF, dom, bus, dev, func);
-        return ERROR_FAIL;
-    }
+    if ( rc < 0 )
+        LOG(ERROR, "failed to quarantine "PCI_BDF, pci->domain, pci->bus,
+            pci->dev, pci->func);
 
-    return 0;
+vchan_free:
+    pci_vchan_free(gc, vchan);
+
+out:
+    return rc;
 }
 
 static int name2bdf(libxl__gc *gc, libxl_device_pci *pci)
@@ -1038,13 +865,8 @@ static int libxl__device_pci_assignable_remove(libxl__gc *gc,
 {
     libxl_ctx *ctx = libxl__gc_owner(gc);
     int rc;
-    char *driver_path;
-
-    /* If the device is named then we need to look up the BDF */
-    if (pci->name) {
-        rc = name2bdf(gc, pci);
-        if (rc) return rc;
-    }
+    struct vchan_info *vchan;
+    libxl__json_object *args, *temp_obj, *result;
 
     /* De-quarantine */
     rc = xc_deassign_device(ctx->xch, DOMID_IO, pci_encode_bdf(pci));
@@ -1054,41 +876,43 @@ static int libxl__device_pci_assignable_remove(libxl__gc *gc,
         return ERROR_FAIL;
     }
 
-    /* Unbind from pciback */
-    if ( (rc = pciback_dev_is_assigned(gc, pci)) < 0 ) {
-        return ERROR_FAIL;
-    } else if ( rc ) {
-        pciback_dev_unassign(gc, pci);
-    } else {
-        LOG(WARN, "Not bound to pciback");
+    vchan = pci_vchan_get_client(gc);
+    if (!vchan) {
+        rc = ERROR_NOT_READY;
+        goto out;
     }
 
-    /* Rebind if necessary */
-    driver_path = pci_info_xs_read(gc, pci, "driver_path");
+    args = libxl__json_object_alloc(gc, JSON_MAP);
+    temp_obj = libxl__json_object_alloc(gc, JSON_STRING);
+    if (!temp_obj) {
+        rc = ERROR_NOMEM;
+        goto vchan_free;
+    }
+    temp_obj->u.string = GCSPRINTF(PCID_SBDF_FMT, pci->domain, pci->bus,
+                                   pci->dev, pci->func);
+    flexarray_append_pair(args->u.map, PCID_MSG_FIELD_SBDF, temp_obj);
 
-    if ( driver_path ) {
-        if ( rebind ) {
-            LOG(INFO, "Rebinding to driver at %s", driver_path);
+    args = libxl__json_object_alloc(gc, JSON_MAP);
+    temp_obj = libxl__json_object_alloc(gc, JSON_BOOL);
+    if (!temp_obj) {
+        rc = ERROR_NOMEM;
+        goto vchan_free;
+    }
 
-            if ( sysfs_write_bdf(gc,
-                                 GCSPRINTF("%s/bind", driver_path),
-                                 pci) < 0 ) {
-                LOGE(ERROR, "Couldn't bind device to %s", driver_path);
-                return -1;
-            }
+    temp_obj->u.b = rebind;
+    flexarray_append_pair(args->u.map, PCID_MSG_FIELD_REBIND, temp_obj);
 
-            pci_info_xs_remove(gc, pci, "driver_path");
-        }
-    } else {
-        if ( rebind ) {
-            LOG(WARN,
-                "Couldn't find path for original driver; not rebinding");
-        }
+    result = vchan_send_command(gc, vchan, PCID_CMD_REVERT_ASSIGNABLE, args);
+    if (!result) {
+        rc = ERROR_FAIL;
+        goto vchan_free;
     }
 
-    pci_info_xs_remove(gc, pci, "name");
+vchan_free:
+    pci_vchan_free(gc, vchan);
 
-    return 0;
+out:
+    return rc;
 }
 
 int libxl_device_pci_assignable_add(libxl_ctx *ctx, libxl_device_pci *pci,
diff --git a/tools/libs/light/libxl_pcid.c b/tools/libs/light/libxl_pcid.c
index bab08b72cf..d8245195ee 100644
--- a/tools/libs/light/libxl_pcid.c
+++ b/tools/libs/light/libxl_pcid.c
@@ -38,6 +38,8 @@
 
 #define DOM0_ID 0
 
+#define PCI_BDF                "%04x:%02x:%02x.%01x"
+
 struct vchan_client {
     XEN_LIST_ENTRY(struct vchan_client) list;
 
@@ -119,6 +121,394 @@ static int process_list_assignable(libxl__gc *gc, yajl_gen gen,
     return 0;
 }
 
+static int pciback_dev_is_assigned(libxl__gc *gc, unsigned int domain,
+				   unsigned int bus, unsigned int dev,
+				   unsigned int func)
+{
+    char * spath;
+    int rc;
+    struct stat st;
+
+    if (access(SYSFS_PCIBACK_DRIVER, F_OK) < 0) {
+        if (errno == ENOENT) {
+            LOG(ERROR, "Looks like pciback driver is not loaded");
+        } else {
+            LOGE(ERROR, "Can't access "SYSFS_PCIBACK_DRIVER);
+        }
+        return -1;
+    }
+
+    spath = GCSPRINTF(SYSFS_PCIBACK_DRIVER"/"PCI_BDF,
+		      domain, bus, dev, func);
+    rc = lstat(spath, &st);
+
+    if (rc == 0)
+        return 1;
+    if (rc < 0 && errno == ENOENT)
+        return 0;
+    LOGE(ERROR, "Accessing %s", spath);
+    return -1;
+}
+
+#define PCID_INFO_PATH		"pcid"
+#define PCID_BDF_XSPATH         "%04x-%02x-%02x-%01x"
+
+static char *pcid_info_xs_path(libxl__gc *gc, unsigned int domain,
+			       unsigned int bus, unsigned int dev,
+			       unsigned int func, const char *node)
+{
+    return node ?
+        GCSPRINTF(PCID_INFO_PATH"/"PCID_BDF_XSPATH"/%s",
+                  domain, bus, dev, func, node) :
+        GCSPRINTF(PCID_INFO_PATH"/"PCID_BDF_XSPATH,
+                  domain, bus, dev, func);
+}
+
+
+static int pcid_info_xs_write(libxl__gc *gc, unsigned int domain,
+			       unsigned int bus, unsigned int dev,
+			       unsigned int func, const char *node,
+			      const char *val)
+{
+    char *path = pcid_info_xs_path(gc, domain, bus, dev, func, node);
+    int rc = libxl__xs_printf(gc, XBT_NULL, path, "%s", val);
+
+    if (rc) LOGE(WARN, "Write of %s to node %s failed.", val, path);
+
+    return rc;
+}
+
+static char *pcid_info_xs_read(libxl__gc *gc, unsigned int domain,
+			       unsigned int bus, unsigned int dev,
+			       unsigned int func, const char *node)
+{
+    char *path = pcid_info_xs_path(gc, domain, bus, dev, func, node);
+
+    return libxl__xs_read(gc, XBT_NULL, path);
+}
+
+static void pcid_info_xs_remove(libxl__gc *gc, unsigned int domain,
+			       unsigned int bus, unsigned int dev,
+			       unsigned int func, const char *node)
+{
+    char *path = pcid_info_xs_path(gc, domain, bus, dev, func, node);
+    libxl_ctx *ctx = libxl__gc_owner(gc);
+
+    /* Remove the xenstore entry */
+    xs_rm(ctx->xsh, XBT_NULL, path);
+}
+
+
+/* Write the standard BDF into the sysfs path given by sysfs_path. */
+static int sysfs_write_bdf(libxl__gc *gc, const char * sysfs_path,
+			   unsigned int domain, unsigned int bus,
+			   unsigned int dev, unsigned int func)
+{
+    int rc, fd;
+    char *buf;
+
+    fd = open(sysfs_path, O_WRONLY);
+    if (fd < 0) {
+        LOGE(ERROR, "Couldn't open %s", sysfs_path);
+        return ERROR_FAIL;
+    }
+
+    buf = GCSPRINTF(PCI_BDF, domain, bus, dev, func);
+    rc = write(fd, buf, strlen(buf));
+    /* Annoying to have two if's, but we need the errno */
+    if (rc < 0)
+        LOGE(ERROR, "write to %s returned %d", sysfs_path, rc);
+    close(fd);
+
+    if (rc < 0)
+        return ERROR_FAIL;
+
+    return 0;
+}
+
+
+/* Unbind device from its current driver, if any.  If driver_path is non-NULL,
+ * store the path to the original driver in it. */
+static int sysfs_dev_unbind(libxl__gc *gc, unsigned int domain,
+			    unsigned int bus, unsigned int dev,
+			    unsigned int func,
+                            char **driver_path)
+{
+    char * spath, *dp = NULL;
+    struct stat st;
+
+    spath = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/driver",
+                           domain, bus, dev, func);
+    if (!lstat(spath, &st)) {
+        /* Find the canonical path to the driver. */
+        dp = libxl__zalloc(gc, PATH_MAX);
+        dp = realpath(spath, dp);
+        if ( !dp ) {
+            LOGE(ERROR, "realpath() failed");
+            return -1;
+        }
+
+        LOG(DEBUG, "Driver re-plug path: %s", dp);
+
+        /* Unbind from the old driver */
+        spath = GCSPRINTF("%s/unbind", dp);
+        if (sysfs_write_bdf(gc, spath, domain, bus, dev, func) < 0) {
+            LOGE(ERROR, "Couldn't unbind device");
+            return -1;
+        }
+    }
+
+    if (driver_path)
+        *driver_path = dp;
+
+    return 0;
+}
+
+/*
+ * A brief comment about slots.  I don't know what slots are for; however,
+ * I have by experimentation determined:
+ * - Before a device can be bound to pciback, its BDF must first be listed
+ *   in pciback/slots
+ * - The way to get the BDF listed there is to write BDF to
+ *   pciback/new_slot
+ * - Writing the same BDF to pciback/new_slot is not idempotent; it results
+ *   in two entries of the BDF in pciback/slots
+ * It's not clear whether having two entries in pciback/slots is a problem
+ * or not.  Just to be safe, this code does the conservative thing, and
+ * first checks to see if there is a slot, adding one only if one does not
+ * already exist.
+ */
+
+/* Scan through /sys/.../pciback/slots looking for pci's BDF */
+static int pciback_dev_has_slot(libxl__gc *gc, unsigned int domain,
+			      unsigned int bus, unsigned int dev,
+			      unsigned int func)
+{
+    FILE *f;
+    int rc = 0;
+    unsigned s_domain, s_bus, s_dev, s_func;
+
+    f = fopen(SYSFS_PCIBACK_DRIVER"/slots", "r");
+
+    if (f == NULL) {
+        LOGE(ERROR, "Couldn't open %s", SYSFS_PCIBACK_DRIVER"/slots");
+        return ERROR_FAIL;
+    }
+
+    while (fscanf(f, "%x:%x:%x.%d\n",
+		  &s_domain, &s_bus, &s_dev, &s_func) == 4) {
+        if (s_domain == domain &&
+            s_bus == bus &&
+            s_dev == dev &&
+            s_func == func) {
+            rc = 1;
+            goto out;
+        }
+    }
+out:
+    fclose(f);
+    return rc;
+}
+
+static int pciback_dev_assign(libxl__gc *gc, unsigned int domain,
+			      unsigned int bus, unsigned int dev,
+			      unsigned int func)
+{
+    int rc;
+
+    if ( (rc = pciback_dev_has_slot(gc, domain, bus, dev, func)) < 0 ) {
+        LOGE(ERROR, "Error checking for pciback slot");
+        return ERROR_FAIL;
+    } else if (rc == 0) {
+        if ( sysfs_write_bdf(gc, SYSFS_PCIBACK_DRIVER"/new_slot",
+                             domain, bus, dev, func) < 0 ) {
+            LOGE(ERROR, "Couldn't bind device to pciback!");
+            return ERROR_FAIL;
+        }
+    }
+
+    if ( sysfs_write_bdf(gc, SYSFS_PCIBACK_DRIVER"/bind",
+			 domain, bus, dev, func) < 0 ) {
+        LOGE(ERROR, "Couldn't bind device to pciback!");
+        return ERROR_FAIL;
+    }
+    return 0;
+}
+
+static int process_make_assignable(libxl__gc *gc, yajl_gen gen,
+                                   char *command_name,
+                                   const struct libxl__json_object *request,
+                                   struct libxl__json_object **response)
+{
+    struct stat st;
+    const struct libxl__json_object *json_o;
+    unsigned int dom, bus, dev, func;
+    int rc;
+    bool rebind;
+    char *spath, *driver_path = NULL;
+
+    json_o = libxl__json_map_get(PCID_MSG_FIELD_SBDF, request, JSON_STRING);
+    if (!json_o) {
+        make_error_reply(gc, gen, "No mandatory parameter 'sbdf'", command_name);
+        return ERROR_FAIL;
+    }
+
+    if (sscanf(libxl__json_object_get_string(json_o), PCID_SBDF_FMT,
+	       &dom, &bus, &dev, &func) != 4) {
+        make_error_reply(gc, gen, "Can't parse SBDF", command_name);
+        return ERROR_FAIL;
+    }
+
+    json_o = libxl__json_map_get(PCID_MSG_FIELD_REBIND, request, JSON_BOOL);
+    if (!json_o) {
+        make_error_reply(gc, gen, "No mandatory parameter 'rebind'", command_name);
+        return ERROR_FAIL;
+    }
+
+    rebind = libxl__json_object_get_bool(json_o);
+
+    /* See if the device exists */
+    spath = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF, dom, bus, dev, func);
+    if ( lstat(spath, &st) ) {
+        make_error_reply(gc, gen, strerror(errno), command_name);
+        LOGE(ERROR, "Couldn't lstat %s", spath);
+        return ERROR_FAIL;
+    }
+
+    /* Check to see if it's already assigned to pciback */
+    rc = pciback_dev_is_assigned(gc, dom, bus, dev, func);
+    if (rc < 0) {
+        make_error_reply(gc, gen, "Can't check if device is assigned",
+			 command_name);
+        return ERROR_FAIL;
+    }
+    if (rc) {
+        LOG(WARN, PCI_BDF" already assigned to pciback", dom, bus, dev, func);
+        goto done;
+    }
+
+    /* Check to see if there's already a driver that we need to unbind from */
+    if (sysfs_dev_unbind(gc, dom, bus, dev, func, &driver_path)) {
+        LOG(ERROR, "Couldn't unbind "PCI_BDF" from driver",
+            dom, bus, dev, func);
+        return ERROR_FAIL;
+    }
+
+    /* Store driver_path for rebinding back */
+    if (rebind) {
+        if (driver_path) {
+            pcid_info_xs_write(gc, dom, bus, dev, func, "driver_path",
+			       driver_path);
+        } else if ( (driver_path =
+                     pcid_info_xs_read(gc, dom, bus, dev, func,
+				       "driver_path")) != NULL ) {
+            LOG(INFO, PCI_BDF" not bound to a driver, will be rebound to %s",
+                dom, bus, dev, func, driver_path);
+        } else {
+            LOG(WARN, PCI_BDF" not bound to a driver, will not be rebound.",
+                dom, bus, dev, func);
+        }
+    } else {
+        pcid_info_xs_remove(gc, dom, bus, dev, func, "driver_path");
+    }
+
+    if (pciback_dev_assign(gc, dom, bus, dev, func)) {
+        LOG(ERROR, "Couldn't bind device to pciback!");
+        return ERROR_FAIL;
+    }
+
+done:
+    return 0;
+}
+
+static int pciback_dev_unassign(libxl__gc *gc, unsigned int domain,
+			      unsigned int bus, unsigned int dev,
+			      unsigned int func)
+{
+    /* Remove from pciback */
+    if ( sysfs_dev_unbind(gc, domain, bus, dev, func, NULL) < 0 ) {
+        LOG(ERROR, "Couldn't unbind device!");
+        return ERROR_FAIL;
+    }
+
+    /* Remove slot if necessary */
+    if ( pciback_dev_has_slot(gc, domain, bus, dev, func) > 0 ) {
+        if ( sysfs_write_bdf(gc, SYSFS_PCIBACK_DRIVER"/remove_slot",
+                             domain, bus, dev, func) < 0 ) {
+            LOGE(ERROR, "Couldn't remove pciback slot");
+            return ERROR_FAIL;
+        }
+    }
+    return 0;
+}
+
+static int process_revert_assignable(libxl__gc *gc, yajl_gen gen,
+                                   char *command_name,
+                                   const struct libxl__json_object *request,
+                                   struct libxl__json_object **response)
+{
+    const struct libxl__json_object *json_o;
+    unsigned int dom, bus, dev, func;
+    int rc;
+    bool rebind;
+    char *driver_path = NULL;
+
+    json_o = libxl__json_map_get(PCID_MSG_FIELD_SBDF, request, JSON_STRING);
+    if (!json_o) {
+        make_error_reply(gc, gen, "No mandatory parameter 'sbdf'", command_name);
+        return ERROR_FAIL;
+    }
+
+    if (sscanf(libxl__json_object_get_string(json_o), PCID_SBDF_FMT,
+	       &dom, &bus, &dev, &func) != 4) {
+        make_error_reply(gc, gen, "Can't parse SBDF", command_name);
+        return ERROR_FAIL;
+    }
+
+    json_o = libxl__json_map_get(PCID_MSG_FIELD_REBIND, request, JSON_BOOL);
+    if (!json_o) {
+        make_error_reply(gc, gen, "No mandatory parameter 'rebind'", command_name);
+        return ERROR_FAIL;
+    }
+
+    rebind = libxl__json_object_get_bool(json_o);
+
+    /* Unbind from pciback */
+    if ( (rc = pciback_dev_is_assigned(gc, dom, bus, dev, func)) < 0 ) {
+        make_error_reply(gc, gen, "Can't unbind from pciback", command_name);
+        return ERROR_FAIL;
+    } else if ( rc ) {
+        pciback_dev_unassign(gc, dom, bus, dev, func);
+    } else {
+        LOG(WARN, "Not bound to pciback");
+    }
+
+    /* Rebind if necessary */
+    driver_path = pcid_info_xs_read(gc, dom, bus, dev, func, "driver_path");
+
+    if ( driver_path ) {
+        if ( rebind ) {
+            LOG(INFO, "Rebinding to driver at %s", driver_path);
+
+            if ( sysfs_write_bdf(gc,
+                                 GCSPRINTF("%s/bind", driver_path),
+                                 dom, bus, dev, func) < 0 ) {
+                LOGE(ERROR, "Couldn't bind device to %s", driver_path);
+                return -1;
+            }
+
+            pcid_info_xs_remove(gc, dom, bus, dev, func, "driver_path");
+        }
+    } else {
+        if ( rebind ) {
+            LOG(WARN,
+                "Couldn't find path for original driver; not rebinding");
+        }
+    }
+
+    return 0;
+}
+
 static int pcid_handle_request(libxl__gc *gc, yajl_gen gen,
                                const libxl__json_object *request)
 {
@@ -142,6 +532,12 @@ static int pcid_handle_request(libxl__gc *gc, yajl_gen gen,
     if (strcmp(command_name, PCID_CMD_LIST_ASSIGNABLE) == 0)
        ret = process_list_assignable(gc, gen, command_name,
                                      request, &command_response);
+    else if (strcmp(command_name, PCID_CMD_MAKE_ASSIGNABLE) == 0)
+       ret = process_make_assignable(gc, gen, command_name,
+                                     request, &command_response);
+    else if (strcmp(command_name, PCID_CMD_REVERT_ASSIGNABLE) == 0)
+       ret = process_revert_assignable(gc, gen, command_name,
+                                     request, &command_response);
     else {
         /*
          * This is an unsupported command: make a reply and proceed over
-- 
2.34.1


