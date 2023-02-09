Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32417690DB4
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 16:56:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492680.762409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ9Hs-0000YM-N5; Thu, 09 Feb 2023 15:56:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492680.762409; Thu, 09 Feb 2023 15:56:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ9Hs-0000R2-FE; Thu, 09 Feb 2023 15:56:40 +0000
Received: by outflank-mailman (input) for mailman id 492680;
 Thu, 09 Feb 2023 15:56:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vyas=6F=gmail.com=dmitry.semenets@srs-se1.protection.inumbo.net>)
 id 1pQ9Hq-0006cl-Gy
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 15:56:38 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 553d0ea0-a892-11ed-93b5-47a8fe42b414;
 Thu, 09 Feb 2023 16:56:36 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id gr7so7725460ejb.5
 for <xen-devel@lists.xenproject.org>; Thu, 09 Feb 2023 07:56:36 -0800 (PST)
Received: from dsemenets-HP-EliteBook-850-G8-Notebook-PC.. ([91.219.254.72])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a170906b00100b0087862f45a29sm1027594ejy.174.2023.02.09.07.56.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 07:56:35 -0800 (PST)
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
X-Inumbo-ID: 553d0ea0-a892-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HDRmSfELdHFsxew+hy0RMD843CMREA2B14by0pRDE0=;
        b=eYe8PdysANwGLi6ir/z7GNejeEdFb/yKqwstsPaWymqLfX8vtQr7IqGQgI+gOfY3LH
         VFCyJ076kspR56gqmhLKKIexWkAtpnhoAsFtVTMLLaSjNDSMMmlbVpFOoZEqPP7dDTwn
         n0hq+80Ud/gDYmdBAbtJmjl9OMJoMOGuX5z8l5UQcn1cZ7QmuJQt1wTY+MkEn5Zmfce7
         ScyGnS4TCH8ZBXIC/R/AUI3WBf5Kd4k8dZfpPHMQg77sf84sHq7tsYReNfVibj+oWI2r
         4mgN8ftv+I0Fq7kJvv+oWrDTOxiWRKDgAvUVS9/SXzN7fz56PHvagVejcYsWTzpjuNpj
         ig2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HDRmSfELdHFsxew+hy0RMD843CMREA2B14by0pRDE0=;
        b=ngxWWP4/ok8nVlqCjcUPrlwN7/Ncnc2BTxCi8hnT0/QaonyDToM41XWe1D8sPEeYG4
         6OhT+QlAptCSS6RW7OQYuvafdIuVc3nqOr/MbCvPdLy/GdcDP5TknxGfHID8gwg3/ZnF
         uQmvfgPvx3qkg2XUcM3Y1j465mj/YOq0bw6a71tFB8yYP0uhDqYANPUsoGvpITEFVaNG
         cMZTXQvSO5knLI7VBtcTkNNINLLmJRzDFZf9TY2vTQ861b1R8WHs6yab8N1RHLFFyTpt
         kwS+FQgYwIMpBE/Do/gS3mrWc2160rYQmJQMYBei2MhYsfY8xEedX9yPXS71L/+qCFpU
         T7QA==
X-Gm-Message-State: AO0yUKWU6z9yQnGVe5Ae6fhxFj/ZN8ahHMP917dzP8uphL0frQJVbGVN
	roW+zNgv83X6g8EiljTa7og6n6Z02KwpTQ==
X-Google-Smtp-Source: AK7set8PttQf/A23scnNgYDmyUMC5SpM1LhW3fDa0espq2v56go0uO1k4JI44QLi/+dq2VClCOZYPA==
X-Received: by 2002:a17:906:74ca:b0:8a9:e5c2:e3b8 with SMTP id z10-20020a17090674ca00b008a9e5c2e3b8mr10166753ejl.2.1675958196068;
        Thu, 09 Feb 2023 07:56:36 -0800 (PST)
From: dmitry.semenets@gmail.com
To: xen-devel@lists.xenproject.org
Cc: Dmytro Semenets <dmytro_semenets@epam.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [RFC PATCH v4 9/9] tools/libs/light: pcid: implement write_bdf command
Date: Thu,  9 Feb 2023 17:56:03 +0200
Message-Id: <20230209155604.2753219-10-dmitry.semenets@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230209155604.2753219-1-dmitry.semenets@gmail.com>
References: <20230209155604.2753219-1-dmitry.semenets@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmytro Semenets <dmytro_semenets@epam.com>

Signed-off-by: Dmytro Semenets <dmytro_semenets@epam.com>
---
 tools/include/xen-pcid.h      | 17 +++++++++
 tools/libs/light/libxl_pci.c  | 67 ++++++++++++++++++-----------------
 tools/libs/light/libxl_pcid.c | 38 ++++++++++++++++++++
 3 files changed, 90 insertions(+), 32 deletions(-)

diff --git a/tools/include/xen-pcid.h b/tools/include/xen-pcid.h
index ad2dec80df..e731340653 100644
--- a/tools/include/xen-pcid.h
+++ b/tools/include/xen-pcid.h
@@ -182,6 +182,23 @@
 #define PCID_RESULT_KEY_IOMEM           "iomem"
 #define PCID_RESULT_KEY_IRQS            "irqs"
 
+/*
+ *******************************************************************************
+ * Write BDF values to the pciback sysfs path
+ *
+ * This command resets PCI device
+ *
+ * Request (see other mandatory fields above):
+ *  - "cmd" field of the request must be set to "write_bdf".
+ *  - "sbdf" SBDF of the device in format defined by PCID_SBDF_FMT.
+ *  - "name" name of sysfs file of pciback driver
+ *
+ * Response (see other mandatory fields above):
+ *  - "resp" field of the response must be set to "write_bdf".
+ */
+#define PCID_CMD_WRITE_BDF               "write_bdf"
+#define PCID_MSG_FIELD_NAME              "name"
+
 /*
  *******************************************************************************
  * Reset PCI device
diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 955635125f..d771f587c5 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -94,6 +94,8 @@ static int pci_handle_response(libxl__gc *gc,
     else if (strcmp(command_name, PCID_CMD_RESOURCE_LIST) == 0)
         *result = (libxl__json_object *)libxl__json_map_get(PCID_MSG_FIELD_RESOURCES,
                 response, JSON_MAP);
+    else if (strcmp(command_name, PCID_CMD_WRITE_BDF) == 0)
+        *result = libxl__json_object_alloc(gc, JSON_NULL);
     return ret;
 }
 
@@ -511,33 +513,6 @@ static bool is_pci_in_array(libxl_device_pci *pcis, int num,
     return i < num;
 }
 
-/* Write the standard BDF into the sysfs path given by sysfs_path. */
-static int sysfs_write_bdf(libxl__gc *gc, const char * sysfs_path,
-                           libxl_device_pci *pci)
-{
-    int rc, fd;
-    char *buf;
-
-    fd = open(sysfs_path, O_WRONLY);
-    if (fd < 0) {
-        LOGE(ERROR, "Couldn't open %s", sysfs_path);
-        return ERROR_FAIL;
-    }
-
-    buf = GCSPRINTF(PCI_BDF, pci->domain, pci->bus,
-                    pci->dev, pci->func);
-    rc = write(fd, buf, strlen(buf));
-    /* Annoying to have two if's, but we need the errno */
-    if (rc < 0)
-        LOGE(ERROR, "write to %s returned %d", sysfs_path, rc);
-    close(fd);
-
-    if (rc < 0)
-        return ERROR_FAIL;
-
-    return 0;
-}
-
 #define PCI_INFO_PATH "/libxl/pci"
 
 static char *pci_info_xs_path(libxl__gc *gc, libxl_device_pci *pci,
@@ -1384,6 +1359,36 @@ static bool pci_supp_legacy_irq(void)
 #endif
 }
 
+static int pciback_write_bdf(libxl__gc *gc, char *name, libxl_device_pci *pci)
+{
+    struct vchan_info *vchan;
+    int rc;
+    libxl__json_object *args, *result;
+
+    vchan = pci_vchan_get_client(gc);
+    if (!vchan) {
+        rc = ERROR_NOT_READY;
+        goto out;
+    }
+
+    args = libxl__vchan_start_args(gc);
+
+    libxl__vchan_arg_add_string(gc, args, PCID_MSG_FIELD_SBDF,
+            GCSPRINTF(PCID_SBDF_FMT, pci->domain,
+                pci->bus, pci->dev, pci->func));
+    libxl__vchan_arg_add_string(gc, args, PCID_MSG_FIELD_NAME, name);
+
+    result = vchan_send_command(gc, vchan, PCID_CMD_WRITE_BDF, args);
+    if (!result) {
+        rc = ERROR_FAIL;
+        goto vchan_free;
+    }
+vchan_free:
+    pci_vchan_free(gc, vchan);
+out:
+    return rc;
+}
+
 static void pci_add_dm_done(libxl__egc *egc,
                             pci_add_state *pas,
                             int rc)
@@ -1421,8 +1426,9 @@ static void pci_add_dm_done(libxl__egc *egc,
     libxl__vchan_arg_add_integer(gc, args, PCID_MSG_FIELD_DOMID, domid);
 
     result = vchan_send_command(gc, vchan, PCID_CMD_RESOURCE_LIST, args);
+    pci_vchan_free(gc, vchan);
     if (!result)
-        goto vchan_free;
+        goto out;
     value = libxl__json_map_get(PCID_RESULT_KEY_IOMEM, result, JSON_ARRAY);
 
     /* stubdomain is always running by now, even at create time */
@@ -1483,8 +1489,7 @@ static void pci_add_dm_done(libxl__egc *egc,
 
     /* Don't restrict writes to the PCI config space from this VM */
     if (pci->permissive) {
-        if ( sysfs_write_bdf(gc, SYSFS_PCIBACK_DRIVER"/permissive",
-                             pci) < 0 ) {
+        if (pciback_write_bdf(gc, "permissive", pci)) {
             LOGD(ERROR, domainid, "Setting permissive for device");
             rc = ERROR_FAIL;
             goto out;
@@ -1512,8 +1517,6 @@ out_no_irq:
         rc = libxl__device_pci_add_xenstore(gc, domid, pci, starting);
     else
         rc = 0;
-vchan_free:
-    pci_vchan_free(gc, vchan);
 out:
     libxl__ev_time_deregister(gc, &pas->timeout);
     libxl__ev_time_deregister(gc, &pas->timeout_retries);
diff --git a/tools/libs/light/libxl_pcid.c b/tools/libs/light/libxl_pcid.c
index 0befb1999d..9368ba6c73 100644
--- a/tools/libs/light/libxl_pcid.c
+++ b/tools/libs/light/libxl_pcid.c
@@ -257,6 +257,41 @@ static int pciback_dev_is_assigned(libxl__gc *gc, unsigned int domain,
     return 0;
 }
 
+static int process_pciback_write_bdf(libxl__gc *gc, yajl_gen gen,
+                                   char *command_name,
+                                   const struct libxl__json_object *request,
+                                   struct libxl__json_object **response)
+{
+    const struct libxl__json_object *json_o;
+    unsigned int dom, bus, dev, func;
+    int rc = 0;
+    const char *name;
+    char *spath;
+
+    json_o = libxl__json_map_get(PCID_MSG_FIELD_SBDF, request, JSON_STRING);
+    if (!json_o) {
+        make_error_reply(gc, gen, "No mandatory parameter 'sbdf'", command_name);
+        return ERROR_FAIL;
+    }
+
+    if (sscanf(libxl__json_object_get_string(json_o), PCID_SBDF_FMT,
+           &dom, &bus, &dev, &func) != 4) {
+        make_error_reply(gc, gen, "Can't parse SBDF", command_name);
+        return ERROR_FAIL;
+    }
+
+    json_o = libxl__json_map_get(PCID_MSG_FIELD_NAME, request, JSON_STRING);
+    if (!json_o) {
+        make_error_reply(gc, gen, "No mandatory parameter 'rebind'", command_name);
+        return ERROR_FAIL;
+    }
+
+    name = libxl__json_object_get_string(json_o);
+    spath = GCSPRINTF("%s/%s", SYSFS_PCIBACK_DRIVER, name);
+    LOG(WARN, "sysf_write_bdf(%s, %d, %d, %d, %d)", spath, dom, bus, dev,func);
+    return rc;
+}
+
 #define PCID_INFO_PATH		"pcid"
 #define PCID_BDF_XSPATH         "%04x-%02x-%02x-%01x"
 
@@ -746,6 +781,9 @@ static int pcid_handle_request(libxl__gc *gc, yajl_gen gen,
     else if (strcmp(command_name, PCID_CMD_RESOURCE_LIST) == 0)
        ret = process_list_resources(gc, gen, command_name,
                                      request, &command_response);
+    else if (strcmp(command_name, PCID_CMD_WRITE_BDF) == 0)
+       ret = process_pciback_write_bdf(gc, gen, command_name,
+                                     request, &command_response);
     else {
         /*
          * This is an unsupported command: make a reply and proceed over
-- 
2.34.1


