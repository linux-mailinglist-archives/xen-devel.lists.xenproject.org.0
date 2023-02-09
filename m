Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D31690DB3
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 16:56:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492677.762370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ9Hp-0007ya-0x; Thu, 09 Feb 2023 15:56:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492677.762370; Thu, 09 Feb 2023 15:56:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ9Ho-0007nh-Qa; Thu, 09 Feb 2023 15:56:36 +0000
Received: by outflank-mailman (input) for mailman id 492677;
 Thu, 09 Feb 2023 15:56:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vyas=6F=gmail.com=dmitry.semenets@srs-se1.protection.inumbo.net>)
 id 1pQ9Hn-0007Ak-Cl
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 15:56:35 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53ffdf13-a892-11ed-933c-83870f6b2ba8;
 Thu, 09 Feb 2023 16:56:34 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id lu11so7732123ejb.3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Feb 2023 07:56:34 -0800 (PST)
Received: from dsemenets-HP-EliteBook-850-G8-Notebook-PC.. ([91.219.254.72])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a170906b00100b0087862f45a29sm1027594ejy.174.2023.02.09.07.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 07:56:33 -0800 (PST)
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
X-Inumbo-ID: 53ffdf13-a892-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hqOdci0RnBqfM9zuF9NcrL5pTTcWWQ4ya+aJqtMi5ro=;
        b=KQTeOkBryB2Q8oZq5V1y4TlLeWD66B8FECePbXBBby9JLo4VuAk856HunjSpdJaKMU
         lZsB1d0mk7aghoHYPjZ4vDJ3hfInS2J5/I2e7NYut68prIHrSAsAOvGrwnP6PDJWGKTD
         dWfH5j03UBrsFxbP8xguXINWV05au4EpUFCMY7HuQ5yLOVhdNiEU6cQdeLmmC/SypO7D
         iPXF01qMycAZgo/4qgLjIYy6gRcfC86ekJulvV7UpJCi1z8VW2djKpoXL/5Ya7UEy4Ge
         TPgNYatHxQp9mUuZtiA5qDW4cjVzHmy+QOSPTXJ+j6xzscLt3J0ygTsvD/EnFFj24afN
         YkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hqOdci0RnBqfM9zuF9NcrL5pTTcWWQ4ya+aJqtMi5ro=;
        b=NoWbTutExY9HiBS6LWNaQf8iW/06QCmB+TUdfiQ4fbOGSRaU9Qbq6zmisGUzcU4Fie
         XywC4tvyk8e2u94MjfcYRlrFIHz82q/mxyYXEqg2FegLK2/w2mbQ5qTtq16v3rd2hcgB
         gQVsS4aiKBIjonk9G+SFxzDoBpBY5kWDkrV2rAq5RztwcOU2ilj+nmR8TuSjGZMy0W7E
         6IXLeSCwoZwJoIJ5UIBaidiyThHCi6/e1DGER+dsL7GnPsOGIkjv9a7KSIKE5w2IzqVX
         xlpBDzXcbps1sZu30Maf6dCI3EiFsSkl83lUi5+duUmWGa1+9moYsC/2dZyYEkAaAiEj
         jngA==
X-Gm-Message-State: AO0yUKWZPVnht7F9wonUYI8eC5ePmTKVAiDJrMFQlGOHwrCdFiaC2KQD
	w2fjtJCMSygy3ilLYReMJdAuCCBvORGnbg==
X-Google-Smtp-Source: AK7set8b/9mmAz5+IWSOO/j4AOTz5RYR51wseZ5L3zVSGxCuVqTqhs2WxC4zTSOAJxwdKL4In7fRcg==
X-Received: by 2002:a17:906:1011:b0:8af:11b5:fabd with SMTP id 17-20020a170906101100b008af11b5fabdmr5210562ejm.5.1675958194017;
        Thu, 09 Feb 2023 07:56:34 -0800 (PST)
From: dmitry.semenets@gmail.com
To: xen-devel@lists.xenproject.org
Cc: Dmytro Semenets <dmytro_semenets@epam.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [RFC PATCH v4 7/9] tools/libs/light: pcid: implement reset_device command
Date: Thu,  9 Feb 2023 17:56:01 +0200
Message-Id: <20230209155604.2753219-8-dmitry.semenets@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230209155604.2753219-1-dmitry.semenets@gmail.com>
References: <20230209155604.2753219-1-dmitry.semenets@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmytro Semenets <dmytro_semenets@epam.com>

Signed-off-by: Dmytro Semenets <dmytro_semenets@epam.com>
---
 tools/include/xen-pcid.h      | 15 ++++++++
 tools/libs/light/libxl_pci.c  | 52 +++++++++++----------------
 tools/libs/light/libxl_pcid.c | 66 +++++++++++++++++++++++++++++++++++
 3 files changed, 102 insertions(+), 31 deletions(-)

diff --git a/tools/include/xen-pcid.h b/tools/include/xen-pcid.h
index 843066a54c..65be441250 100644
--- a/tools/include/xen-pcid.h
+++ b/tools/include/xen-pcid.h
@@ -156,6 +156,21 @@
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
 
 #endif /* XEN_PCID_H */
diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 841b97172d..e920a1fa4b 100644
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
index 7b6c7fe6a6..05c0b69324 100644
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


