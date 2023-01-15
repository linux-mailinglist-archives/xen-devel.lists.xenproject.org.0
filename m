Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AE466B0A5
	for <lists+xen-devel@lfdr.de>; Sun, 15 Jan 2023 12:31:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477865.740831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pH1EV-0006eM-VW; Sun, 15 Jan 2023 11:31:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477865.740831; Sun, 15 Jan 2023 11:31:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pH1EV-0006Wr-Jr; Sun, 15 Jan 2023 11:31:27 +0000
Received: by outflank-mailman (input) for mailman id 477865;
 Sun, 15 Jan 2023 11:31:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ytYW=5M=gmail.com=dmitry.semenets@srs-se1.protection.inumbo.net>)
 id 1pH1EU-0004co-DE
 for xen-devel@lists.xenproject.org; Sun, 15 Jan 2023 11:31:26 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 243543c7-94c8-11ed-b8d0-410ff93cb8f0;
 Sun, 15 Jan 2023 12:31:24 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id vm8so62019600ejc.2
 for <xen-devel@lists.xenproject.org>; Sun, 15 Jan 2023 03:31:24 -0800 (PST)
Received: from dsemenets-HP-EliteBook-850-G8-Notebook-PC.. ([91.219.254.73])
 by smtp.gmail.com with ESMTPSA id
 uj42-20020a170907c9aa00b0084d4e612a22sm7459961ejc.67.2023.01.15.03.31.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 03:31:23 -0800 (PST)
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
X-Inumbo-ID: 243543c7-94c8-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xrk/C/YZL5jbZac94OfOErvgSHJBWQ1xYVIaSMYUI8w=;
        b=VtNcbBNxJQHL8qNJ13hjEKUccbTHIhsH+7PdDIVkx03I0dj93avNdZj2yMqZtplsxn
         5Ka51TPEkoQFzU5mq9MAARaZxKlKsvrUE1ZB3bkacojsBZGVG7Oo0iMtSWBwWpSs7e5r
         gqtMo488X0izuIxDjKsaaBIFEXoT1ILUR92JfET09m2H2iofTap+Nq0rpHnxVZ6bUOSi
         URlvSfs4juLQJ6bd5PX0MbLCceDqEtCn/6hEF1wtcp3s+8k7Wc60BrsIYIQdt0DsurVL
         rXrPZvVNmDMF6fWbSsi03JUkHmo6N6NoX0pketo2xDhxsrjshJZ0OfRgIHMazYPS9TPO
         X05g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xrk/C/YZL5jbZac94OfOErvgSHJBWQ1xYVIaSMYUI8w=;
        b=eaXn9WFkBNnIQU1pciyS8dmoG9KxWw0vCTeyMgJRgug6x0/Z6RtQodkMFhi4tuQqcq
         br4whrCyYUgYlHO6pdUqKGmSbu5A6lP48arSGNY2/ZIqroDrDCNAQU0enqzh9nLW3ApJ
         C7gPbCucKQBpJsln0GjVHd/gm97Hf+jrr16PkE1vdMiU4tyiQ0EdTgPNITloLsBu4psO
         a1CQbYswJmn59NoL8rAIb3lVvMfEXBa7ySrO/S91ie1THd6oks0+r6E5TRHqbjZTyDCU
         63AuaKkVz3PZCX5FCbKghfP0fAh5qVew1Panp851Lu1NoypKMWCgxHxAiaQ/Vc5M0dDL
         hDEQ==
X-Gm-Message-State: AFqh2koq+d0YPR2m74Hu4R2TdJ/1/JuuNcK9wHis/8LSTHMA1/vBAUbI
	NptuDgRFPp5ZouO4orFumCxf5Ovk6OiomjwP
X-Google-Smtp-Source: AMrXdXsZ1NOKoKhI67d7/ClWLpVJASzmYxGSrjUO1bFyEb+E0FluHbskFeoq51YxQuaL0nxzmDBKVw==
X-Received: by 2002:a17:906:eb09:b0:84d:34fa:f1a4 with SMTP id mb9-20020a170906eb0900b0084d34faf1a4mr25284731ejb.60.1673782283481;
        Sun, 15 Jan 2023 03:31:23 -0800 (PST)
From: Dmytro Semenets <dmitry.semenets@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Dmytro Semenets <dmytro_semenets@epam.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [RFC PATCH v3 08/10] tools/libs/light: pcid: implement reset_device command
Date: Sun, 15 Jan 2023 13:31:09 +0200
Message-Id: <20230115113111.1207605-9-dmitry.semenets@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230115113111.1207605-1-dmitry.semenets@gmail.com>
References: <20230115113111.1207605-1-dmitry.semenets@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmytro Semenets <dmytro_semenets@epam.com>

Signed-off-by: Dmytro Semenets <dmytro_semenets@epam.com>
---
 tools/include/pcid.h          | 15 ++++++++
 tools/libs/light/libxl_pci.c  | 52 +++++++++++----------------
 tools/libs/light/libxl_pcid.c | 66 +++++++++++++++++++++++++++++++++++
 3 files changed, 102 insertions(+), 31 deletions(-)

diff --git a/tools/include/pcid.h b/tools/include/pcid.h
index 983e067dfc..63ac0bcac9 100644
--- a/tools/include/pcid.h
+++ b/tools/include/pcid.h
@@ -155,6 +155,21 @@
 #define PCID_CMD_IS_ASSIGNED            "is_device_assigned"
 #define PCID_MSG_FIELD_RESULT           "result"
 
+/*
+ *******************************************************************************
+ * Reset PCI device
+ *
+ * This command resets PCI device
+ *
+ * Request (see other mandatory fields above):
+ *  - "cmd" field of the request must be set to "reset_device".
+ *  - "sbdf" SBDF of the device in format defined by PCID_SBDF_FMT.
+ *
+ * Response (see other mandatory fields above):
+ *  - "resp" field of the response must be set to "reset_device".
+ */
+#define PCID_CMD_RESET_DEVICE            "reset_device"
+
 int libxl_pcid_process(libxl_ctx *ctx);
 
 #endif /* PCID_H */
diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index d68cb1986f..e9f0bad442 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -89,6 +89,8 @@ static int pci_handle_response(libxl__gc *gc,
     else if (strcmp(command_name, PCID_CMD_IS_ASSIGNED) == 0)
         *result = (libxl__json_object *)libxl__json_map_get(PCID_MSG_FIELD_RESULT,
                                                           response, JSON_BOOL);
+    else if (strcmp(command_name, PCID_CMD_RESET_DEVICE) == 0)
+        *result = libxl__json_object_alloc(gc, JSON_NULL);
     return ret;
 }
 
@@ -1518,38 +1520,26 @@ out:
 static int libxl__device_pci_reset(libxl__gc *gc, unsigned int domain, unsigned int bus,
                                    unsigned int dev, unsigned int func)
 {
-    char *reset;
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
+    struct vchan_info *vchan;
+    int rc = 0;
+    libxl__json_object *args, *result;
+
+    vchan = pci_vchan_get_client(gc);
+    if (!vchan) {
+        rc = ERROR_NOT_READY;
+        goto out;
     }
-    return -1;
+    args = libxl__vchan_start_args(gc);
+
+    libxl__vchan_arg_add_string(gc, args, PCID_MSG_FIELD_SBDF,
+            GCSPRINTF(PCID_SBDF_FMT, domain, bus, dev, func));
+    result = vchan_send_command(gc, vchan, PCID_CMD_RESET_DEVICE, args);
+    if (!result)
+        rc = ERROR_FAIL;
+    pci_vchan_free(gc, vchan);
+
+ out:
+    return rc;
 }
 
 int libxl__device_pci_setdefault(libxl__gc *gc, uint32_t domid,
diff --git a/tools/libs/light/libxl_pcid.c b/tools/libs/light/libxl_pcid.c
index d72beed405..80bcd3c63e 100644
--- a/tools/libs/light/libxl_pcid.c
+++ b/tools/libs/light/libxl_pcid.c
@@ -364,6 +364,69 @@ static int process_pciback_dev_is_assigned(libxl__gc *gc, yajl_gen gen,
     return 0;
 }
 
+static int device_pci_reset(libxl__gc *gc, unsigned int domain, unsigned int bus,
+                                   unsigned int dev, unsigned int func)
+{
+    char *reset;
+    int fd, rc;
+
+    reset = GCSPRINTF("%s/do_flr", SYSFS_PCIBACK_DRIVER);
+    fd = open(reset, O_WRONLY);
+    if (fd >= 0) {
+        char *buf = GCSPRINTF(PCI_BDF, domain, bus, dev, func);
+        rc = write(fd, buf, strlen(buf));
+        if (rc < 0)
+            LOGD(ERROR, domain, "write to %s returned %d", reset, rc);
+        close(fd);
+        return rc < 0 ? rc : 0;
+    }
+    if (errno != ENOENT)
+        LOGED(ERROR, domain, "Failed to access pciback path %s", reset);
+    reset = GCSPRINTF("%s/"PCI_BDF"/reset", SYSFS_PCI_DEV, domain, bus, dev, func);
+    fd = open(reset, O_WRONLY);
+    if (fd >= 0) {
+        rc = write(fd, "1", 1);
+        if (rc < 0)
+            LOGED(ERROR, domain, "write to %s returned %d", reset, rc);
+        close(fd);
+        return rc < 0 ? rc : 0;
+    }
+    if (errno == ENOENT) {
+        LOGD(ERROR, domain,
+             "The kernel doesn't support reset from sysfs for PCI device "PCI_BDF,
+             domain, bus, dev, func);
+    } else {
+        LOGED(ERROR, domain, "Failed to access reset path %s", reset);
+    }
+    return -1;
+}
+
+static int process_device_pci_reset(libxl__gc *gc, yajl_gen gen,
+                                   char *command_name,
+                                   const struct libxl__json_object *request,
+                                   struct libxl__json_object **response)
+{
+    const struct libxl__json_object *json_o;
+    unsigned int dom, bus, dev, func;
+    int rc;
+
+    json_o = libxl__json_map_get(PCID_MSG_FIELD_SBDF, request, JSON_STRING);
+    if (!json_o) {
+        make_error_reply(gc, gen, "No mandatory parameter 'sbdf'", command_name);
+        return ERROR_FAIL;
+    }
+
+    if (sscanf(libxl__json_object_get_string(json_o), PCID_SBDF_FMT,
+               &dom, &bus, &dev, &func) != 4) {
+        make_error_reply(gc, gen, "Can't parse SBDF", command_name);
+        return ERROR_FAIL;
+    }
+    rc = device_pci_reset(gc, dom, bus, dev, func);
+    if (rc < 0)
+        return ERROR_FAIL;
+    return rc;
+}
+
 static int process_make_assignable(libxl__gc *gc, yajl_gen gen,
                                    char *command_name,
                                    const struct libxl__json_object *request,
@@ -570,6 +633,9 @@ static int pcid_handle_request(libxl__gc *gc, yajl_gen gen,
     else if (strcmp(command_name, PCID_CMD_IS_ASSIGNED) == 0)
        ret = process_pciback_dev_is_assigned(gc, gen, command_name,
                                      request, &command_response);
+    else if (strcmp(command_name, PCID_CMD_RESET_DEVICE) == 0)
+       ret = process_device_pci_reset(gc, gen, command_name,
+                                     request, &command_response);
     else {
         /*
          * This is an unsupported command: make a reply and proceed over
-- 
2.34.1


