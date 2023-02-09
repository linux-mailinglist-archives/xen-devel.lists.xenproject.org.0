Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFC8690DB5
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 16:56:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492679.762405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ9Hs-0000RS-Bm; Thu, 09 Feb 2023 15:56:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492679.762405; Thu, 09 Feb 2023 15:56:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ9Hr-0000Io-Sq; Thu, 09 Feb 2023 15:56:39 +0000
Received: by outflank-mailman (input) for mailman id 492679;
 Thu, 09 Feb 2023 15:56:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vyas=6F=gmail.com=dmitry.semenets@srs-se1.protection.inumbo.net>)
 id 1pQ9Ho-0007Ak-Pn
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 15:56:37 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 549b6a4a-a892-11ed-933c-83870f6b2ba8;
 Thu, 09 Feb 2023 16:56:35 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id sa10so7667153ejc.9
 for <xen-devel@lists.xenproject.org>; Thu, 09 Feb 2023 07:56:35 -0800 (PST)
Received: from dsemenets-HP-EliteBook-850-G8-Notebook-PC.. ([91.219.254.72])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a170906b00100b0087862f45a29sm1027594ejy.174.2023.02.09.07.56.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 07:56:34 -0800 (PST)
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
X-Inumbo-ID: 549b6a4a-a892-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dce94Jrl1fONboV6egU+yvi+P6trFx/LtuUcWDWz0QA=;
        b=IhnidZZp4ea6CBm47aSbqq7R1WCTIMgi4psDVc0OE6qhmbLyVc1pyEFY6HNMW1FQ4K
         /sQtr+cVkFwXmiVCnpkYpJakN+5GALP2GKhH4Gf4Jbhf8Mj3W0QZz8WJ8bu8if3rId1o
         noExBk+hMw4q/J0cmRwflAEMSYGufg9qIdlSribwOM7WAbgKKlJFBNNRrQiOb+1yJJva
         rqgPrhJrvN8oxVEWgGqrF5woObUbgypZS7HZqqydgmh5zAC0Th+sbgZ3JZ5MNoRGNsca
         UqKnIwIkFlyZ1sKzBnxBsdBUDlZ7re6bNoXO+Qavf351nZqmBIDh4SWMfNJ+ixtON9KA
         6luA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dce94Jrl1fONboV6egU+yvi+P6trFx/LtuUcWDWz0QA=;
        b=KsCKsphsg/UYSIsQbQdzbqlo6ZiX1QWov7XALflJDaM1ySNwE8UD1gi1IZEN0bOGoR
         S7XhKCZd3Fi3AOwx0PN2AnLRkqJvM/W7DCR/MSwLTCz7RDR4pdnP+qp965orGbqq00aI
         Jy3RdeXyV9fmV5p11hsep7TBWebSQXLXSNJJK9XplWCY7hI6PoldkgOPqjpLZalF8ENj
         IsZNjNc4z/gZaPkGmDqETZ367v7y/2S98gouS5yQych7hnC5KPeiQh0VVZmx5uKqL4Zi
         xgqbJBzh6RQGPfDUT1W7ycB4ukFD289ZVui/NzpXnb1C4qeCT3+GyQJOVurADSsk713d
         dcAg==
X-Gm-Message-State: AO0yUKUsR672psjKYYV9sjJ5FE6N37ihgGbvbAk1jBPx+ZmSwXBLvVZb
	1cb+/rvEwjjJVe6ygUwF/TrlihM/DFYtNg==
X-Google-Smtp-Source: AK7set8pRZCT1H9vWbqv9sxCrORaJZd+fnWVtZoHfl2TftEMSIR+RGUkeXqiN7vejRoVCOr4Fbjgdw==
X-Received: by 2002:a17:906:2085:b0:8aa:a9df:b7f0 with SMTP id 5-20020a170906208500b008aaa9dfb7f0mr11655733ejq.7.1675958195071;
        Thu, 09 Feb 2023 07:56:35 -0800 (PST)
From: dmitry.semenets@gmail.com
To: xen-devel@lists.xenproject.org
Cc: Dmytro Semenets <dmytro_semenets@epam.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [RFC PATCH v4 8/9] tools/libs/light: pcid: implement resource_list command
Date: Thu,  9 Feb 2023 17:56:02 +0200
Message-Id: <20230209155604.2753219-9-dmitry.semenets@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230209155604.2753219-1-dmitry.semenets@gmail.com>
References: <20230209155604.2753219-1-dmitry.semenets@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmytro Semenets <dmytro_semenets@epam.com>

Signed-off-by: Dmytro Semenets <dmytro_semenets@epam.com>
---
 tools/include/xen-pcid.h       |  26 ++++++++
 tools/libs/light/libxl_pci.c   |  63 ++++++++++---------
 tools/libs/light/libxl_pcid.c  | 110 +++++++++++++++++++++++++++++++++
 tools/libs/light/libxl_vchan.c |   8 +++
 tools/libs/light/libxl_vchan.h |   4 +-
 5 files changed, 180 insertions(+), 31 deletions(-)

diff --git a/tools/include/xen-pcid.h b/tools/include/xen-pcid.h
index 65be441250..ad2dec80df 100644
--- a/tools/include/xen-pcid.h
+++ b/tools/include/xen-pcid.h
@@ -156,6 +156,32 @@
 #define PCID_CMD_IS_ASSIGNED            "is_device_assigned"
 #define PCID_MSG_FIELD_RESULT           "result"
 
+/*
+ *******************************************************************************
+ * Get device resources
+ *
+ * This command returns resource list of device
+ *
+ * Request (see other mandatory fields above):
+ *  - "cmd" field of the request must be set to "resource_list".
+ *  - "sbdf" SBDF of the device in format defined by PCID_SBDF_FMT.
+ *
+ * Response (see other mandatory fields above):
+ *  - "resp" field of the response must be set to "resource_list".
+ * Command specific response data:
+ * +-------------+--------------+----------------------------------------------+
+ * | resources   | map          | key 'iomem' - list of memory regions         |
+ * |             |              | key 'irqs' - list of irqs                    |
+ * +-------------+--------------+----------------------------------------------+
+ */
+#define PCID_CMD_RESOURCE_LIST          "resource_list"
+/* Arguments */
+#define PCID_MSG_FIELD_DOMID            "domid"
+/* Result */
+#define PCID_MSG_FIELD_RESOURCES        "resources"
+#define PCID_RESULT_KEY_IOMEM           "iomem"
+#define PCID_RESULT_KEY_IRQS            "irqs"
+
 /*
  *******************************************************************************
  * Reset PCI device
diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index e920a1fa4b..955635125f 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -81,16 +81,19 @@ static int pci_handle_response(libxl__gc *gc,
     LOG(DEBUG, "command: %s", command_name);
 
     if (strcmp(command_name, PCID_CMD_LIST_ASSIGNABLE) == 0)
-       ret = process_list_assignable(gc, response, result);
+        ret = process_list_assignable(gc, response, result);
     else if (strcmp(command_name, PCID_CMD_MAKE_ASSIGNABLE) == 0)
         *result = libxl__json_object_alloc(gc, JSON_NULL);
     else if (strcmp(command_name, PCID_CMD_REVERT_ASSIGNABLE) == 0)
         *result = libxl__json_object_alloc(gc, JSON_NULL);
     else if (strcmp(command_name, PCID_CMD_IS_ASSIGNED) == 0)
         *result = (libxl__json_object *)libxl__json_map_get(PCID_MSG_FIELD_RESULT,
-                                                          response, JSON_BOOL);
+                response, JSON_BOOL);
     else if (strcmp(command_name, PCID_CMD_RESET_DEVICE) == 0)
         *result = libxl__json_object_alloc(gc, JSON_NULL);
+    else if (strcmp(command_name, PCID_CMD_RESOURCE_LIST) == 0)
+        *result = (libxl__json_object *)libxl__json_map_get(PCID_MSG_FIELD_RESOURCES,
+                response, JSON_MAP);
     return ret;
 }
 
@@ -1388,14 +1391,21 @@ static void pci_add_dm_done(libxl__egc *egc,
     STATE_AO_GC(pas->aodev->ao);
     libxl_ctx *ctx = libxl__gc_owner(gc);
     libxl_domid domid = pas->pci_domid;
-    char *sysfs_path;
-    FILE *f;
     unsigned long long start, end, flags, size;
     int irq, i;
     int r;
     uint32_t flag = XEN_DOMCTL_DEV_RDM_RELAXED;
     uint32_t domainid = domid;
     bool isstubdom = libxl_is_stubdom(ctx, domid, &domainid);
+    struct vchan_info *vchan;
+    libxl__json_object *result;
+    libxl__json_object *args;
+    const libxl__json_object *value;
+    libxl__json_object *res_obj;
+
+    vchan = pci_vchan_get_client(gc);
+    if (!vchan)
+        goto out;
 
     /* Convenience aliases */
     bool starting = pas->starting;
@@ -1404,25 +1414,27 @@ static void pci_add_dm_done(libxl__egc *egc,
 
     libxl__ev_qmp_dispose(gc, &pas->qmp);
 
-    if (rc) goto out;
+    args = libxl__vchan_start_args(gc);
+    libxl__vchan_arg_add_string(gc, args, PCID_MSG_FIELD_SBDF,
+                                GCSPRINTF(PCID_SBDF_FMT, pci->domain,
+                                          pci->bus, pci->dev, pci->func));
+    libxl__vchan_arg_add_integer(gc, args, PCID_MSG_FIELD_DOMID, domid);
+
+    result = vchan_send_command(gc, vchan, PCID_CMD_RESOURCE_LIST, args);
+    if (!result)
+        goto vchan_free;
+    value = libxl__json_map_get(PCID_RESULT_KEY_IOMEM, result, JSON_ARRAY);
 
     /* stubdomain is always running by now, even at create time */
     if (isstubdom)
         starting = false;
-
-    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/resource", pci->domain,
-                           pci->bus, pci->dev, pci->func);
-    f = fopen(sysfs_path, "r");
     start = end = flags = size = 0;
     irq = 0;
-
-    if (f == NULL) {
-        LOGED(ERROR, domainid, "Couldn't open %s", sysfs_path);
-        rc = ERROR_FAIL;
-        goto out;
-    }
     for (i = 0; i < PROC_PCI_NUM_RESOURCES; i++) {
-        if (fscanf(f, "0x%llx 0x%llx 0x%llx\n", &start, &end, &flags) != 3)
+        if ((res_obj = libxl__json_array_get(value, i)) == NULL)
+            continue;
+        const char *iomem_str = libxl__json_object_get_string(res_obj);
+        if (sscanf(iomem_str, "0x%llx 0x%llx 0x%llx\n", &start, &end, &flags) != 3)
             continue;
         size = end - start + 1;
         if (start) {
@@ -1432,7 +1444,6 @@ static void pci_add_dm_done(libxl__egc *egc,
                     LOGED(ERROR, domainid,
                           "xc_domain_ioport_permission 0x%llx/0x%llx (error %d)",
                           start, size, r);
-                    fclose(f);
                     rc = ERROR_FAIL;
                     goto out;
                 }
@@ -1443,29 +1454,21 @@ static void pci_add_dm_done(libxl__egc *egc,
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
     if (!pci_supp_legacy_irq())
         goto out_no_irq;
-    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
-                                pci->bus, pci->dev, pci->func);
-    f = fopen(sysfs_path, "r");
-    if (f == NULL) {
-        LOGED(ERROR, domainid, "Couldn't open %s", sysfs_path);
-        goto out_no_irq;
-    }
-    if ((fscanf(f, "%u", &irq) == 1) && irq) {
+    value = libxl__json_map_get(PCID_RESULT_KEY_IRQS, result, JSON_ARRAY);
+    if ((res_obj = libxl__json_array_get(value, i)) &&
+            (irq = libxl__json_object_get_integer(res_obj))) {
         r = xc_physdev_map_pirq(ctx->xch, domid, irq, &irq);
         if (r < 0) {
             LOGED(ERROR, domainid, "xc_physdev_map_pirq irq=%d (error=%d)",
                   irq, r);
-            fclose(f);
             rc = ERROR_FAIL;
             goto out;
         }
@@ -1473,12 +1476,10 @@ static void pci_add_dm_done(libxl__egc *egc,
         if (r < 0) {
             LOGED(ERROR, domainid,
                   "xc_domain_irq_permission irq=%d (error=%d)", irq, r);
-            fclose(f);
             rc = ERROR_FAIL;
             goto out;
         }
     }
-    fclose(f);
 
     /* Don't restrict writes to the PCI config space from this VM */
     if (pci->permissive) {
@@ -1511,6 +1512,8 @@ out_no_irq:
         rc = libxl__device_pci_add_xenstore(gc, domid, pci, starting);
     else
         rc = 0;
+vchan_free:
+    pci_vchan_free(gc, vchan);
 out:
     libxl__ev_time_deregister(gc, &pas->timeout);
     libxl__ev_time_deregister(gc, &pas->timeout_retries);
diff --git a/tools/libs/light/libxl_pcid.c b/tools/libs/light/libxl_pcid.c
index 05c0b69324..0befb1999d 100644
--- a/tools/libs/light/libxl_pcid.c
+++ b/tools/libs/light/libxl_pcid.c
@@ -40,6 +40,10 @@
 
 #define PCI_BDF                "%04x:%02x:%02x.%01x"
 
+static int sysfs_write_bdf(libxl__gc *gc, const char * sysfs_path,
+        unsigned int domain, unsigned int bus,
+        unsigned int dev, unsigned int func);
+
 struct vchan_client {
     XEN_LIST_ENTRY(struct vchan_client) list;
 
@@ -121,6 +125,109 @@ static int process_list_assignable(libxl__gc *gc, yajl_gen gen,
     return 0;
 }
 
+static bool pci_supp_legacy_irq(void)
+{
+#ifdef CONFIG_PCI_SUPP_LEGACY_IRQ
+    return true;
+#else
+    return false;
+#endif
+}
+
+static int process_list_resources(libxl__gc *gc, yajl_gen gen,
+                                   char *command_name,
+                                   const struct libxl__json_object *request,
+                                   struct libxl__json_object **response)
+{
+    struct libxl__json_object *iomem =
+                 libxl__json_object_alloc(gc, JSON_ARRAY);
+    struct libxl__json_object *irqs =
+                 libxl__json_object_alloc(gc, JSON_ARRAY);
+    const struct libxl__json_object *json_sdbf;
+    const struct libxl__json_object *json_domid;
+    unsigned int dom, bus, dev, func;
+    libxl_domid domainid;
+    char *sysfs_path;
+    FILE *f;
+    unsigned long long start, end, flags;
+    int irq, i;
+    int rc = 0;
+    libxl__json_map_node *map_node = NULL;
+
+    json_sdbf = libxl__json_map_get(PCID_MSG_FIELD_SBDF, request, JSON_STRING);
+    if (!json_sdbf) {
+        make_error_reply(gc, gen, "No mandatory parameter 'sbdf'", command_name);
+        return ERROR_FAIL;
+    }
+    if (sscanf(libxl__json_object_get_string(json_sdbf), PCID_SBDF_FMT,
+               &dom, &bus, &dev, &func) != 4) {
+        make_error_reply(gc, gen, "Can't parse SBDF", command_name);
+        return ERROR_FAIL;
+    }
+
+    json_domid = libxl__json_map_get(PCID_MSG_FIELD_DOMID, request, JSON_INTEGER);
+    if (!json_domid) {
+        make_error_reply(gc, gen, "No mandatory parameter 'domid'", command_name);
+        return ERROR_FAIL;
+    }
+    domainid = libxl__json_object_get_integer(json_domid);
+
+    libxl__yajl_gen_asciiz(gen, PCID_MSG_FIELD_RESOURCES);
+    *response = libxl__json_object_alloc(gc, JSON_MAP);
+
+    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/resource", dom, bus, dev, func);
+    f = fopen(sysfs_path, "r");
+    start = 0;
+    irq = 0;
+
+    if (f == NULL) {
+        LOGED(ERROR, domainid, "Couldn't open %s", sysfs_path);
+        rc = ERROR_FAIL;
+        goto out;
+    }
+    for (i = 0; i < PROC_PCI_NUM_RESOURCES; i++) {
+        if (fscanf(f, "0x%llx 0x%llx 0x%llx\n", &start, &end, &flags) != 3)
+            continue;
+        if (start) {
+            struct libxl__json_object *node =
+                libxl__json_object_alloc(gc, JSON_STRING);
+
+            node->u.string = GCSPRINTF("0x%llx 0x%llx 0x%llx", start, end, flags);
+            flexarray_append(iomem->u.array, node);
+        }
+    }
+    fclose(f);
+    if (!pci_supp_legacy_irq())
+        goto out_no_irq;
+    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", dom, bus, dev, func);
+    f = fopen(sysfs_path, "r");
+    if (f == NULL) {
+        LOGED(ERROR, domainid, "Couldn't open %s", sysfs_path);
+        goto out_no_irq;
+    }
+    if ((fscanf(f, "%u", &irq) == 1) && irq) {
+            struct libxl__json_object *node =
+                libxl__json_object_alloc(gc, JSON_INTEGER);
+
+            node->u.i = irq;
+            flexarray_append(irqs->u.array, node);
+    }
+    fclose(f);
+
+    GCNEW(map_node);
+    map_node->map_key = libxl__strdup(gc, PCID_RESULT_KEY_IRQS);
+    map_node->obj = irqs;
+    flexarray_append((*response)->u.map, map_node);
+out_no_irq:
+    GCNEW(map_node);
+    map_node->map_key = libxl__strdup(gc, PCID_RESULT_KEY_IOMEM);
+    map_node->obj = iomem;
+    flexarray_append((*response)->u.map, map_node);
+    rc = 0;
+out:
+    return rc;
+}
+
 static int pciback_dev_is_assigned(libxl__gc *gc, unsigned int domain,
 				   unsigned int bus, unsigned int dev,
 				   unsigned int func)
@@ -636,6 +743,9 @@ static int pcid_handle_request(libxl__gc *gc, yajl_gen gen,
     else if (strcmp(command_name, PCID_CMD_RESET_DEVICE) == 0)
        ret = process_device_pci_reset(gc, gen, command_name,
                                      request, &command_response);
+    else if (strcmp(command_name, PCID_CMD_RESOURCE_LIST) == 0)
+       ret = process_list_resources(gc, gen, command_name,
+                                     request, &command_response);
     else {
         /*
          * This is an unsupported command: make a reply and proceed over
diff --git a/tools/libs/light/libxl_vchan.c b/tools/libs/light/libxl_vchan.c
index 7611816f52..a1beda9e1b 100644
--- a/tools/libs/light/libxl_vchan.c
+++ b/tools/libs/light/libxl_vchan.c
@@ -99,6 +99,14 @@ void libxl__vchan_arg_add_bool(libxl__gc *gc, libxl__json_object *args,
     obj->u.b = val;
 }
 
+void libxl__vchan_arg_add_integer(libxl__gc *gc, libxl__json_object *args,
+                                 char *key,  int val)
+{
+    libxl__json_object *obj = libxl__vchan_arg_new(gc, JSON_INTEGER, args, key);
+
+    obj->u.i = val;
+}
+
 static void reset_yajl_generator(struct vchan_state *state)
 {
     yajl_gen_clear(state->gen);
diff --git a/tools/libs/light/libxl_vchan.h b/tools/libs/light/libxl_vchan.h
index 0968875298..07f0db4e93 100644
--- a/tools/libs/light/libxl_vchan.h
+++ b/tools/libs/light/libxl_vchan.h
@@ -58,7 +58,9 @@ static inline libxl__json_object *libxl__vchan_start_args(libxl__gc *gc)
 void libxl__vchan_arg_add_string(libxl__gc *gc, libxl__json_object *args,
                                  char *key, char *val);
 void libxl__vchan_arg_add_bool(libxl__gc *gc, libxl__json_object *args,
-                               char *key, bool val);
+                                 char *key, bool val);
+void libxl__vchan_arg_add_integer(libxl__gc *gc, libxl__json_object *args,
+                                 char *key,  int val);
 
 libxl__json_object *vchan_send_command(libxl__gc *gc, struct vchan_info *vchan,
                                        char *cmd, libxl__json_object *args);
-- 
2.34.1


