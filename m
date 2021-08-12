Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 639983EA67A
	for <lists+xen-devel@lfdr.de>; Thu, 12 Aug 2021 16:23:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166459.303824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEBbg-0003Rj-QE; Thu, 12 Aug 2021 14:22:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166459.303824; Thu, 12 Aug 2021 14:22:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEBbg-0003PK-M4; Thu, 12 Aug 2021 14:22:52 +0000
Received: by outflank-mailman (input) for mailman id 166459;
 Thu, 12 Aug 2021 14:22:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tERp=ND=gmail.com=vicooodin@srs-us1.protection.inumbo.net>)
 id 1mEBbe-0002Q2-V5
 for xen-devel@lists.xenproject.org; Thu, 12 Aug 2021 14:22:50 +0000
Received: from mail-lj1-x231.google.com (unknown [2a00:1450:4864:20::231])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5bfdb2b2-699a-4f18-8ccb-a597d9fd501f;
 Thu, 12 Aug 2021 14:22:38 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id m17so7048914ljp.7
 for <xen-devel@lists.xenproject.org>; Thu, 12 Aug 2021 07:22:38 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-213-80.b024.la.net.ua.
 [176.36.213.80])
 by smtp.gmail.com with ESMTPSA id s16sm329678ljj.48.2021.08.12.07.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 07:22:36 -0700 (PDT)
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
X-Inumbo-ID: 5bfdb2b2-699a-4f18-8ccb-a597d9fd501f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ffOhNeCRLI4R9q5Bex6AKuS0TCu8t1Ca81Imzl0FQU4=;
        b=Gidp/hw+hCR9SMN+KU8OZJAxlHMv/Gq6dX5jJOR3MhqwwLUNH/pwgHAyAiE+JrROpH
         7HgWPDPoB7dPv1R+HLSnuZIlowvJBOjHq7ki/+dQ6XLxWyGsJH+PhXyOEVryp88Pd+TU
         FJo/T1kZVT88jFeQbsHLHoGMSvIlUp+FslrM9eWFExYhUmD4SI4i1GV/ioU4HYpzC4kk
         oXRGdDtXvkPliFKHdfp97W+m3kaCaFqjX5mOapXce37aVOh4PaqtyRlnLD7uEquFOpc+
         Z9H/PTVIsC2xDUfhOjuxv3l8t7XWsKOcvuOi869gEQXr7gqDLhUW2fpq7ifcdQe+ui4x
         hOMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ffOhNeCRLI4R9q5Bex6AKuS0TCu8t1Ca81Imzl0FQU4=;
        b=MqX8W8YMCsZnve+SmqJ053IrQhFd0IkfYpxm7SVLXMjPAUyAm6vjBOrhsYlRbq7XwA
         PJosD0XRRI1m90lYb2hkSVnWtFYUcgA8zzkJ92AGQ0fK0/XD3W0W8ZzjYduOKMw8PH2t
         G0ss0AX+d0ihVNIvjEYtug0M3V+nweyiiz4Ms3jmAZgOHU2W5m0emhDwMV8wSHP54x4+
         T+9c0JCHT3PxeS/4YZDZIPkgulXt5f4ksRoGvqtzAFSjoB3naR1rMQUEj8OlOFKmmbVc
         fD+3kCNr0fsP6HQbG4gfhKvDLS8wMNM2X466AXZlmsz1b7lv8ctjHp0d0R4wJWDhKVAI
         7fQw==
X-Gm-Message-State: AOAM530me4baAt5kEpRoixtSe/G0A2McxRHq/jPo2jXu+vV4QdptHNzS
	30QT9/asSfoEtHUQu0oPCc3eMQZy+poE3Q==
X-Google-Smtp-Source: ABdhPJw+s2eXh1HJSYkLLdDN0DRHU9Z9wDzvN5DARCbRXs6Jpf6MaUB0Rkse7zLIw2qsL99LEbUU3w==
X-Received: by 2002:a05:651c:20f:: with SMTP id y15mr3054743ljn.137.1628778156977;
        Thu, 12 Aug 2021 07:22:36 -0700 (PDT)
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
Subject: [PATCH 4/9] tools/libs/light: Add "ls" command processing to xl pcid daemon and libxl PCI
Date: Thu, 12 Aug 2021 17:22:25 +0300
Message-Id: <20210812142230.19353-5-vicooodin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210812142230.19353-1-vicooodin@gmail.com>
References: <20210812142230.19353-1-vicooodin@gmail.com>

From: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>

Messaging format is based on json style. Xl pcid receives "ls" command from
client and sends a reply:
1. success case - array of directory's names
2. error case - message with "error" in return

Xl pcid server transmits information about devices assigned to the PCI
driver by sending reply with directory's names. Libxl PCI processes reply
message instead of opening directory in libxl side.

Signed-off-by: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>
---
 tools/include/pcid.h          |   7 ++
 tools/libs/light/libxl_pci.c  | 136 +++++++++++++++++++++++++++++-----
 tools/libs/light/libxl_pcid.c |  59 +++++++++++++++
 3 files changed, 184 insertions(+), 18 deletions(-)

diff --git a/tools/include/pcid.h b/tools/include/pcid.h
index 59a7aad64a..e9c3c497c6 100644
--- a/tools/include/pcid.h
+++ b/tools/include/pcid.h
@@ -28,12 +28,19 @@
 #define PCID_MSG_FIELD_ID        "id"
 #define PCID_MSG_FIELD_ARGS      "arguments"
 
+#define PCID_CMD_LIST            "ls"
+#define PCID_CMD_DIR_ID          "dir_id"
+
 #define PCID_PCIBACK_DRIVER      "pciback_driver"
 
 #if defined(__linux__)
 #define SYSFS_PCIBACK_DRIVER   "/sys/bus/pci/drivers/pciback"
 #endif
 
+#define PCI_INFO_PATH "/libxl/pci"
+#define PCI_BDF_XSPATH         "%04x-%02x-%02x-%01x"
+#define PCI_BDF                "%04x:%02x:%02x.%01x"
+
 int libxl_pcid_process(libxl_ctx *ctx);
 
 #endif /* PCID_H */
diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 30e203c264..6534b70777 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -17,6 +17,9 @@
 #include "libxl_osdeps.h" /* must come before any other headers */
 
 #include "libxl_internal.h"
+#include "libxl_vchan.h"
+
+#include <pcid.h>
 
 #define PCI_BDF                "%04x:%02x:%02x.%01x"
 #define PCI_BDF_SHORT          "%02x:%02x.%01x"
@@ -47,6 +50,100 @@ static void pci_struct_fill(libxl_device_pci *pci, unsigned int domain,
     pci->func = func;
 }
 
+static libxl__pcid_message_type pci_response_type(const libxl__json_object *o)
+{
+    libxl__pcid_message_type type;
+    libxl__json_map_node *node = NULL;
+    int i;
+
+    for (i = 0; (node = libxl__json_map_node_get(o, i)); i++) {
+        if (libxl__pcid_message_type_from_string(node->map_key, &type) == 0)
+            return type;
+    }
+    return LIBXL__PCID_MESSAGE_TYPE_INVALID;
+}
+
+static int pci_handle_msg(libxl__gc *gc, const libxl__json_object *request,
+                          libxl__json_object **result)
+{
+    libxl__pcid_message_type type = pci_response_type(request);
+
+    if (type == LIBXL__PCID_MESSAGE_TYPE_RETURN)
+        *result = (libxl__json_object *)libxl__json_map_get(VCHAN_MSG_RETURN,
+                                                            request, JSON_ANY);
+
+    return 0;
+}
+
+static char *pci_prepare_cmd(libxl__gc *gc, const char *cmd,
+                             libxl__json_object *args, int id)
+{
+    yajl_gen hand = NULL;
+    /* memory for 'buf' is owned by 'hand' */
+    const unsigned char *buf;
+    libxl_yajl_length len;
+    yajl_gen_status s;
+    char *ret = NULL;
+
+    hand = libxl_yajl_gen_alloc(NULL);
+
+    if (!hand)
+        return NULL;
+
+#if HAVE_YAJL_V2
+    /* Disable beautify for data */
+    yajl_gen_config(hand, yajl_gen_beautify, 0);
+#endif
+
+    yajl_gen_map_open(hand);
+    libxl__yajl_gen_asciiz(hand, VCHAN_MSG_EXECUTE);
+    libxl__yajl_gen_asciiz(hand, cmd);
+    libxl__yajl_gen_asciiz(hand, PCID_MSG_FIELD_ID);
+    yajl_gen_integer(hand, id);
+    if (args) {
+        libxl__yajl_gen_asciiz(hand, PCID_MSG_FIELD_ARGS);
+        libxl__json_object_to_yajl_gen(gc, hand, args);
+    }
+    yajl_gen_map_close(hand);
+
+    s = yajl_gen_get_buf(hand, &buf, &len);
+
+    if (s != yajl_gen_status_ok)
+        goto out;
+
+    ret = libxl__sprintf(gc, "%*.*s" END_OF_MESSAGE,
+                         (int)len, (int)len, buf);
+
+out:
+    yajl_gen_free(hand);
+    return ret;
+}
+
+static struct vchan_info *pci_prepare_vchan(libxl__gc *gc)
+{
+    struct vchan_info *vchan;
+    libxl_domid domid;
+    char *xs_path;
+
+    domid = vchan_find_server(gc, PCID_XS_DIR, PCID_XS_PATH);
+    if (domid == DOMID_INVALID) {
+        LOGE(ERROR, "Can't find vchan server");
+        return NULL;
+    }
+    vchan = libxl__zalloc(gc, sizeof(*vchan));
+    xs_path = GCSPRINTF(PCID_XS_DIR"%d"PCID_XS_PATH, domid);
+    vchan->state = vchan_get_instance(gc, domid, xs_path, VCHAN_CLIENT);
+    if (!(vchan->state))
+        return NULL;
+
+    vchan->handle_msg = pci_handle_msg;
+    vchan->prepare_cmd = pci_prepare_cmd;
+    vchan->receive_buf_size = PCI_RECEIVE_BUFFER_SIZE;
+    vchan->max_buf_size = PCI_MAX_SIZE_RX_BUF;
+
+    return vchan;
+}
+
 static void libxl_create_pci_backend_device(libxl__gc *gc,
                                             flexarray_t *back,
                                             int num,
@@ -429,33 +526,37 @@ static void pci_info_xs_remove(libxl__gc *gc, libxl_device_pci *pci,
 
 libxl_device_pci *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num)
 {
-    GC_INIT(ctx);
     libxl_device_pci *pcis = NULL, *new;
-    struct dirent *de;
-    DIR *dir;
 
+    GC_INIT(ctx);
     *num = 0;
+    struct vchan_info *vchan;
+    libxl__json_object *args = NULL, *result = NULL, *dir;
+    int i;
+    const char *dir_name;
 
-    dir = opendir(SYSFS_PCIBACK_DRIVER);
-    if (NULL == dir) {
-        if (errno == ENOENT) {
-            LOG(ERROR, "Looks like pciback driver not loaded");
-        } else {
-            LOGE(ERROR, "Couldn't open %s", SYSFS_PCIBACK_DRIVER);
-        }
+    vchan = pci_prepare_vchan(gc);
+    if (!vchan)
         goto out;
-    }
 
-    while((de = readdir(dir))) {
-        unsigned int dom, bus, dev, func;
-        char *name;
+    libxl__vchan_param_add_string(gc, &args, PCID_CMD_DIR_ID,
+                                  PCID_PCIBACK_DRIVER);
+    result = vchan_send_command(gc, vchan, PCID_CMD_LIST, args);
+    if (!result)
+        goto out;
 
-        if (sscanf(de->d_name, PCI_BDF, &dom, &bus, &dev, &func) != 4)
+    for (i = 0; (dir = libxl__json_array_get(result, i)); i++) {
+        dir_name = libxl__json_object_get_string(dir);
+        unsigned dom, bus, dev, func;
+        char *name;
+        if (sscanf(dir_name, PCI_BDF, &dom, &bus, &dev, &func) != 4)
             continue;
 
         new = realloc(pcis, ((*num) + 1) * sizeof(*new));
-        if (NULL == new)
-            continue;
+        if (new == NULL) {
+            LOGE(ERROR, "Couldn't realloc pcis struct for new entry");
+            break;
+        }
 
         pcis = new;
         new = pcis + *num;
@@ -472,7 +573,6 @@ libxl_device_pci *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num)
         (*num)++;
     }
 
-    closedir(dir);
 out:
     GC_FREE;
     return pcis;
diff --git a/tools/libs/light/libxl_pcid.c b/tools/libs/light/libxl_pcid.c
index 6317c77a3c..c897244e8a 100644
--- a/tools/libs/light/libxl_pcid.c
+++ b/tools/libs/light/libxl_pcid.c
@@ -36,6 +36,57 @@
 
 #define DOM0_ID 0
 
+static struct libxl__json_object *process_ls_cmd(libxl__gc *gc,
+                                                 const struct libxl__json_object *resp)
+{
+    libxl__json_object *result = NULL;
+    const libxl__json_object *args, *dir_id;
+    struct libxl__json_object *node;
+    char *dir_name;
+    struct dirent *de;
+    DIR *dir = NULL;
+
+    args = libxl__json_map_get(PCID_MSG_FIELD_ARGS, resp, JSON_MAP);
+    if (!args)
+        goto out;
+    dir_id = libxl__json_map_get(PCID_CMD_DIR_ID, args, JSON_ANY);
+    if (!dir_id)
+        goto out;
+
+    dir_name = dir_id->u.string;
+
+    if (strcmp(PCID_PCIBACK_DRIVER, dir_name) == 0)
+        dir = opendir(SYSFS_PCIBACK_DRIVER);
+    else {
+        LOGE(ERROR, "Unknown directory: %s\n", dir_name);
+        goto out;
+    }
+
+    if (dir == NULL) {
+        if (errno == ENOENT)
+            LOGE(ERROR, "Looks like pciback driver not loaded\n");
+        else
+            LOGE(ERROR, "Couldn't open %s\n", dir_name);
+        goto out;
+    }
+
+    result = libxl__json_object_alloc(gc, JSON_ARRAY);
+    if (!result) {
+        LOGE(ERROR, "Memory allocation failed\n");
+        goto out;
+    }
+    while ((de = readdir(dir))) {
+        node = libxl__json_object_alloc(gc, JSON_STRING);
+        node->u.string = de->d_name;
+        flexarray_append(result->u.array, node);
+    }
+
+    closedir(dir);
+
+out:
+    return result;
+}
+
 static int pcid_handle_message(libxl__gc *gc, const libxl__json_object *request,
                                libxl__json_object **result)
 {
@@ -49,6 +100,14 @@ static int pcid_handle_message(libxl__gc *gc, const libxl__json_object *request,
     }
     command_name = command_obj->u.string;
 
+    if (strcmp(command_name, PCID_CMD_LIST) == 0)
+       *result = process_ls_cmd(gc, request);
+    else
+        return ERROR_NOTFOUND;
+
+    if (!result)
+        return ERROR_FAIL;
+
     return 0;
 }
 
-- 
2.17.1


