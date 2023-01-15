Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E3C66B0A0
	for <lists+xen-devel@lfdr.de>; Sun, 15 Jan 2023 12:31:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477861.740789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pH1ES-0005XS-8r; Sun, 15 Jan 2023 11:31:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477861.740789; Sun, 15 Jan 2023 11:31:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pH1ER-0005U4-Sc; Sun, 15 Jan 2023 11:31:23 +0000
Received: by outflank-mailman (input) for mailman id 477861;
 Sun, 15 Jan 2023 11:31:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ytYW=5M=gmail.com=dmitry.semenets@srs-se1.protection.inumbo.net>)
 id 1pH1EP-0004co-R9
 for xen-devel@lists.xenproject.org; Sun, 15 Jan 2023 11:31:21 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2199714c-94c8-11ed-b8d0-410ff93cb8f0;
 Sun, 15 Jan 2023 12:31:19 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id ud5so62065038ejc.4
 for <xen-devel@lists.xenproject.org>; Sun, 15 Jan 2023 03:31:19 -0800 (PST)
Received: from dsemenets-HP-EliteBook-850-G8-Notebook-PC.. ([91.219.254.73])
 by smtp.gmail.com with ESMTPSA id
 uj42-20020a170907c9aa00b0084d4e612a22sm7459961ejc.67.2023.01.15.03.31.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 03:31:18 -0800 (PST)
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
X-Inumbo-ID: 2199714c-94c8-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ylOSlAAsRMSF13m/WxnF31oV8wjlQEFnbS1C2vMhAmQ=;
        b=lNcXXQ3WpawuLh/3f81jyVto3aISNpKmjWDl2wwuXCSiF50o2NMnWn7KtAjgsQrvtn
         eUxjNtPh3n3a5xm9Ye+1RcPav1lc0xnmNfBlcMaJ1wep8J/4+qWp4g2FJSRLzfo8NIEI
         LmEDxgjlSF5fv9yuEL8zh52CeWoi94A83N8F690NQpkLQBSxvipQDDShNi1CQSV2GGmK
         1V+WNt8En85YvYRFqDA9tdMX5oCHvUt+s7xrrjVlcqZ5iz5+D4YSnKlxO/W2EIZF/+YQ
         M6D0ma60Oc37VMjd0bPATOlvCHiLUI+Htq79FS0jt0Ad84IJYRb+urcLGMxaIaxN4M0v
         rR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ylOSlAAsRMSF13m/WxnF31oV8wjlQEFnbS1C2vMhAmQ=;
        b=wELnWtLn5uInqtjvBe7r0kyB1h89C8DvWO3DAbrk/F/aeWgkNXKDPmexfoIOjfxJa3
         E90KuVGyifwdZNrvzk6OZcJ4Ac4+nX7rPAaoV7fIM8uVLf3Ki3ovyNF9gM6akpqwZuha
         z+J6L1AZKAhOgvu1ofc+fx9uNu/YgUYwm1lJOVScprWAE/JuTjMDIt6tc2OyR3E6ciTf
         zS4Rya5GiTea6wyhQMrVXZ5RcoZtGeg+szCVSvcgmlofZAoRm9snc+58BUdOg34OqrIr
         m4uidKloeLYbKyBvmTP2yiZSFYltTEZa3wgfTBHt6nZxs2SKz7wkf6ljTKvGHt3gyfpx
         Va8A==
X-Gm-Message-State: AFqh2kpg/SSTChQVR+da/R/adXB7IIySBdR3e6VTI9GzYnwTgqrGf2wz
	4ahdHYkG5So/vTyZGGSELzJ5VZBTvbNtu3Ud
X-Google-Smtp-Source: AMrXdXt1PVXJzXqXXv1CjLnjGLuod88mQki1Do5dmGNVJqTG1BuQUjE+az8UvXD8viFox25uMpExyQ==
X-Received: by 2002:a17:907:7657:b0:7ff:727f:65cb with SMTP id kj23-20020a170907765700b007ff727f65cbmr9474933ejc.19.1673782279053;
        Sun, 15 Jan 2023 03:31:19 -0800 (PST)
From: Dmytro Semenets <dmitry.semenets@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [RFC PATCH v3 04/10] tools/libs/light: pcid: implement list_assignable command
Date: Sun, 15 Jan 2023 13:31:05 +0200
Message-Id: <20230115113111.1207605-5-dmitry.semenets@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230115113111.1207605-1-dmitry.semenets@gmail.com>
References: <20230115113111.1207605-1-dmitry.semenets@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 tools/include/pcid.h          | 19 ++++++++++++
 tools/libs/light/libxl_pci.c  | 54 ++++++++++++++++++++++-----------
 tools/libs/light/libxl_pcid.c | 56 ++++++++++++++++++++++++++++++-----
 3 files changed, 103 insertions(+), 26 deletions(-)

diff --git a/tools/include/pcid.h b/tools/include/pcid.h
index 6506b18d25..452bdc11cf 100644
--- a/tools/include/pcid.h
+++ b/tools/include/pcid.h
@@ -79,6 +79,25 @@
 
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
 
 #endif /* PCID_H */
diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index b0c6de88ba..321543f5bf 100644
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
index 958fe387f9..bab08b72cf 100644
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


