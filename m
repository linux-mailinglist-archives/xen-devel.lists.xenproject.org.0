Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A89CC690DB1
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 16:56:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492673.762358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ9Hn-0007d6-Rp; Thu, 09 Feb 2023 15:56:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492673.762358; Thu, 09 Feb 2023 15:56:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ9Hn-0007Zd-K5; Thu, 09 Feb 2023 15:56:35 +0000
Received: by outflank-mailman (input) for mailman id 492673;
 Thu, 09 Feb 2023 15:56:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vyas=6F=gmail.com=dmitry.semenets@srs-se1.protection.inumbo.net>)
 id 1pQ9Hl-0006cl-6Z
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 15:56:33 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 520f343b-a892-11ed-93b5-47a8fe42b414;
 Thu, 09 Feb 2023 16:56:31 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id p26so7634464ejx.13
 for <xen-devel@lists.xenproject.org>; Thu, 09 Feb 2023 07:56:31 -0800 (PST)
Received: from dsemenets-HP-EliteBook-850-G8-Notebook-PC.. ([91.219.254.72])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a170906b00100b0087862f45a29sm1027594ejy.174.2023.02.09.07.56.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 07:56:30 -0800 (PST)
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
X-Inumbo-ID: 520f343b-a892-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bmsCcMttxSYbw0pYCwcBt+l3AXaiynpdRsxaUXNJnFU=;
        b=XlEv70xEZXanGY83K7ttIqvpYBScKUNktKlPY0TNVpppood+1d70q32NBmaUYCy6xQ
         IJZJDYIGMDxk3Sz3N0xiPTxYAvvvPlpcE+sbvFM20PoyVmGKjD3uIteiWuP185Ik2zfz
         4Gh/UxZIUiYLPx0kdolsndd04+fF6D1pf6pVlz3tK2TtVHteHdiktzYGbZu9m56augmo
         JKc3fEsqOzbnnbmXS2i33e8W+vSigVQlkGM3KANhXkeYST6ucrbNjfS3oo8Nd36NqM9m
         mlQqVuWBScq3/QbX7W08CGCMqRG8WYCmQNrJI38yI+2LIL9NSRW0i39EyAFFsJlsE/pC
         PTWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bmsCcMttxSYbw0pYCwcBt+l3AXaiynpdRsxaUXNJnFU=;
        b=szxVtd4RypTbUejWpQEBk+3DALJfn/xz/ILY6Q7Y3fzEgiaazQiDJzxW3Ekj0woPFX
         pHjnhxOdc/ceBDcAGgymjKhashFkB5lUiAeGqT/LoIfKDNnQVJ4/BlVoDszvmKhoXAWL
         y2ofoRIlXhllCv0WLmb6zQlGJdJM3CJQooEH7REkAeKz7kfe30cCINQcRrM6xKCgOSzX
         ac+ObPtchRg8QI4qS+NkXAEc8xhRtC4nKWs9JW9RmAhqspbCi2y8HI6xb6QAIOTWgsbd
         G5D8fwAbls/23WIHWMVID4WYgNGwnwsnFsowuEcD6TVD8YWEvmTdz9Y8UItxs2UA4n58
         lHoQ==
X-Gm-Message-State: AO0yUKU+lyfDBSmoDgYSw3APkRmSep9ewYQs4ZVbq//2QKYSF733JT1X
	GV2hqKsXEQ6f0KLcYsbASLodubuegtQntA==
X-Google-Smtp-Source: AK7set9WOPbNmChLMlaNwilvjNpmtQqdh0PqIIhGzFj9tr3YfvIYFxIiBolR11n0JK/CIL1A6ly3XA==
X-Received: by 2002:a17:906:5185:b0:8ae:ea08:3842 with SMTP id y5-20020a170906518500b008aeea083842mr5504778ejk.7.1675958190806;
        Thu, 09 Feb 2023 07:56:30 -0800 (PST)
From: dmitry.semenets@gmail.com
To: xen-devel@lists.xenproject.org
Cc: Dmytro Semenets <dmytro_semenets@epam.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [RFC PATCH v4 4/9] tools/libs/light: pcid: implement list_assignable command
Date: Thu,  9 Feb 2023 17:55:58 +0200
Message-Id: <20230209155604.2753219-5-dmitry.semenets@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230209155604.2753219-1-dmitry.semenets@gmail.com>
References: <20230209155604.2753219-1-dmitry.semenets@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmytro Semenets <dmytro_semenets@epam.com>

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Dmytro Semenets <dmytro_semenets@epam.com>
---
 tools/include/xen-pcid.h      | 19 ++++++++++++
 tools/libs/light/libxl_pci.c  | 54 ++++++++++++++++++++++-----------
 tools/libs/light/libxl_pcid.c | 56 ++++++++++++++++++++++++++++++-----
 3 files changed, 103 insertions(+), 26 deletions(-)

diff --git a/tools/include/xen-pcid.h b/tools/include/xen-pcid.h
index 098118a0c3..6a5724363d 100644
--- a/tools/include/xen-pcid.h
+++ b/tools/include/xen-pcid.h
@@ -80,6 +80,25 @@
 
 #define PCID_SBDF_FMT           "%04x:%02x:%02x.%01x"
 
+/*
+ *******************************************************************************
+ * List assignable devices
+ *
+ * This command lists PCI devices that can be passed through to a guest domain.
+ *
+ * Request (see other mandatory fields above):
+ *  - "cmd" field of the request must be set to "list_assignable".
+ *
+ * Response (see other mandatory fields above):
+ *  - "resp" field of the response must be set to "list_assignable".
+ * Command specific response data:
+ * +-------------+--------------+----------------------------------------------+
+ * | devices     | list         | List of of pci_device objects                |
+ * +-------------+--------------+----------------------------------------------+
+ */
+#define PCID_CMD_LIST_ASSIGNABLE        "list_assignable"
+#define PCID_MSG_FIELD_DEVICES          "devices"
+
 int libxl_pcid_process(libxl_ctx *ctx);
 
 #endif /* XEN_PCID_H */
diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 3d9ed0d50c..c4b04ccb92 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -29,6 +29,18 @@
 #define PCI_BDF_XSPATH         "%04x-%02x-%02x-%01x"
 #define PCI_PT_QDEV_ID         "pci-pt-%02x_%02x.%01x"
 
+static int process_list_assignable(libxl__gc *gc,
+                                   const libxl__json_object *response,
+                                   libxl__json_object **result)
+{
+    *result = (libxl__json_object *)libxl__json_map_get(PCID_MSG_FIELD_DEVICES,
+                                                        response, JSON_ARRAY);
+    if (!*result)
+        return ERROR_INVAL;
+
+    return 0;
+}
+
 static int pci_handle_response(libxl__gc *gc,
                                const libxl__json_object *response,
                                libxl__json_object **result)
@@ -68,6 +80,9 @@ static int pci_handle_response(libxl__gc *gc,
     command_name = command_obj->u.string;
     LOG(DEBUG, "command: %s", command_name);
 
+    if (strcmp(command_name, PCID_CMD_LIST_ASSIGNABLE) == 0)
+       ret = process_list_assignable(gc, response, result);
+
     return ret;
 }
 
@@ -124,8 +139,7 @@ static char *pci_prepare_request(libxl__gc *gc, yajl_gen gen, char *cmd,
     return request;
 }
 
-struct vchan_info *pci_vchan_get_client(libxl__gc *gc);
-struct vchan_info *pci_vchan_get_client(libxl__gc *gc)
+static struct vchan_info *pci_vchan_get_client(libxl__gc *gc)
 {
     struct vchan_info *vchan;
 
@@ -147,8 +161,7 @@ out:
     return vchan;
 }
 
-void pci_vchan_free(libxl__gc *gc, struct vchan_info *vchan);
-void pci_vchan_free(libxl__gc *gc, struct vchan_info *vchan)
+static void pci_vchan_free(libxl__gc *gc, struct vchan_info *vchan)
 {
     vchan_fini_one(gc, vchan->state);
 }
@@ -561,26 +574,29 @@ libxl_device_pci *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num)
 {
     GC_INIT(ctx);
     libxl_device_pci *pcis = NULL, *new;
-    struct dirent *de;
-    DIR *dir;
+    struct vchan_info *vchan;
+    libxl__json_object *result, *dev_obj;
+    int i;
 
     *num = 0;
 
-    dir = opendir(SYSFS_PCIBACK_DRIVER);
-    if (NULL == dir) {
-        if (errno == ENOENT) {
-            LOG(ERROR, "Looks like pciback driver not loaded");
-        } else {
-            LOGE(ERROR, "Couldn't open %s", SYSFS_PCIBACK_DRIVER);
-        }
+    vchan = pci_vchan_get_client(gc);
+    if (!vchan)
         goto out;
-    }
 
-    while((de = readdir(dir))) {
+    result = vchan_send_command(gc, vchan, PCID_CMD_LIST_ASSIGNABLE, NULL);
+    if (!result)
+        goto vchan_free;
+
+    for (i = 0; (dev_obj = libxl__json_array_get(result, i)); i++) {
+        const char *sbdf_str = libxl__json_object_get_string(dev_obj);
         unsigned int dom, bus, dev, func;
-        char *name;
+        const char *name;
+
+        if (!sbdf_str)
+            continue;
 
-        if (sscanf(de->d_name, PCI_BDF, &dom, &bus, &dev, &func) != 4)
+        if (sscanf(sbdf_str, PCID_SBDF_FMT, &dom, &bus, &dev, &func) != 4)
             continue;
 
         new = realloc(pcis, ((*num) + 1) * sizeof(*new));
@@ -602,7 +618,9 @@ libxl_device_pci *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num)
         (*num)++;
     }
 
-    closedir(dir);
+vchan_free:
+    pci_vchan_free(gc, vchan);
+
 out:
     GC_FREE;
     return pcis;
diff --git a/tools/libs/light/libxl_pcid.c b/tools/libs/light/libxl_pcid.c
index 2ce8f1504d..8dfccc439d 100644
--- a/tools/libs/light/libxl_pcid.c
+++ b/tools/libs/light/libxl_pcid.c
@@ -84,6 +84,41 @@ static int make_error_reply(libxl__gc *gc, yajl_gen gen, char *desc,
     return 0;
 }
 
+static int process_list_assignable(libxl__gc *gc, yajl_gen gen,
+                                   char *command_name,
+                                   const struct libxl__json_object *request,
+                                   struct libxl__json_object **response)
+{
+    struct dirent *de;
+    DIR *dir = NULL;
+
+    dir = opendir(SYSFS_PCI_DEV);
+    if (dir == NULL) {
+        make_error_reply(gc, gen, strerror(errno), command_name);
+        return ERROR_FAIL;
+    }
+
+    libxl__yajl_gen_asciiz(gen, PCID_MSG_FIELD_DEVICES);
+
+    *response = libxl__json_object_alloc(gc, JSON_ARRAY);
+
+    while ((de = readdir(dir))) {
+        unsigned int dom, bus, dev, func;
+
+        if (sscanf(de->d_name, PCID_SBDF_FMT, &dom, &bus, &dev, &func) != 4)
+            continue;
+
+        struct libxl__json_object *node =
+            libxl__json_object_alloc(gc, JSON_STRING);
+        node->u.string = de->d_name;
+        flexarray_append((*response)->u.array, node);
+    }
+
+    closedir(dir);
+
+    return 0;
+}
+
 static int pcid_handle_request(libxl__gc *gc, yajl_gen gen,
                                const libxl__json_object *request)
 {
@@ -104,14 +139,19 @@ static int pcid_handle_request(libxl__gc *gc, yajl_gen gen,
 
     command_name = command_obj->u.string;
 
-    /*
-     * This is an unsupported command: make a reply and proceed over
-     * the error path.
-     */
-    ret = make_error_reply(gc, gen, "Unsupported command",
-                           command_name);
-    if (!ret)
-        ret = ERROR_NOTFOUND;
+    if (strcmp(command_name, PCID_CMD_LIST_ASSIGNABLE) == 0)
+       ret = process_list_assignable(gc, gen, command_name,
+                                     request, &command_response);
+    else {
+        /*
+         * This is an unsupported command: make a reply and proceed over
+         * the error path.
+         */
+        ret = make_error_reply(gc, gen, "Unsupported command",
+                               command_name);
+        if (!ret)
+            ret = ERROR_NOTFOUND;
+    }
 
     if (ret) {
         /*
-- 
2.34.1


