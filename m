Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A946D66B0A4
	for <lists+xen-devel@lfdr.de>; Sun, 15 Jan 2023 12:31:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477866.740848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pH1EY-0007Ej-FT; Sun, 15 Jan 2023 11:31:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477866.740848; Sun, 15 Jan 2023 11:31:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pH1EY-0007Ap-8V; Sun, 15 Jan 2023 11:31:30 +0000
Received: by outflank-mailman (input) for mailman id 477866;
 Sun, 15 Jan 2023 11:31:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ytYW=5M=gmail.com=dmitry.semenets@srs-se1.protection.inumbo.net>)
 id 1pH1EV-0004ci-3Q
 for xen-devel@lists.xenproject.org; Sun, 15 Jan 2023 11:31:27 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 257c687c-94c8-11ed-91b6-6bf2151ebd3b;
 Sun, 15 Jan 2023 12:31:26 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id bk15so4531706ejb.9
 for <xen-devel@lists.xenproject.org>; Sun, 15 Jan 2023 03:31:26 -0800 (PST)
Received: from dsemenets-HP-EliteBook-850-G8-Notebook-PC.. ([91.219.254.73])
 by smtp.gmail.com with ESMTPSA id
 uj42-20020a170907c9aa00b0084d4e612a22sm7459961ejc.67.2023.01.15.03.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 03:31:25 -0800 (PST)
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
X-Inumbo-ID: 257c687c-94c8-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Di8T7RFkSXJWtJ7IeU06hxU0Lz5Aq6jlmAWzDwNGXI=;
        b=iweg5CpL5M1YkOuzr2tqeKOpn4QsKSQbE4lPh15fHRb/E+IKHE0gont35IDfqMQ3Xm
         XEEi5YbTezWUNspnrfixupk/0YXZKwk9Zs6Lu4EAi8fDm0Ui3K710o2P29IO8tQLzSIt
         h/TtF4V7sgs+s3t4m8vi66Kl9mJIALrEE24zQ3jXym+rnvc6oXEdBJ4Wl0xBPQwfbGV6
         0c27JUPC4gw94jUI3c+FZMe6UBL3ydJPwARhFwLZ8yWYs+VGTWAYpSiqWN7ObU7hPqYn
         8lYZdkteljcxSLGijGGgaI5xVAFudZ5o6viwYgOZQWeLoNZ5vwR6WZkasgFR/IpPGnXM
         /qXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Di8T7RFkSXJWtJ7IeU06hxU0Lz5Aq6jlmAWzDwNGXI=;
        b=sRryGQ0ivXOL70uigOJjg/3B0/pHgMfiB12CXKqGpj5cUHhinL4I1O/yKzmHVYmRB0
         kmAhEXTiOm76Vxqwzsk+m94M9eetaeDgNSWuM5ifBcgTLIt6HZagSw2Js/sQSuSbynZY
         SPS+OlklwV4dwVY+TJG9AUSHcDcFVI4KPIzdXfoRAqAm3ZCQ3f6P4zTlbpkbd0ROpt55
         Ku6WcewNTqsbdIjiafw/4EmTK4iNJUKNCTq/vKk0gl3Z2aEyiiPWEzRo1cCqOd+tC8N9
         THJgt7MeKT7V2EQxu5GyMXqQJlaflEmffXDXcQcR5VvlwJxbbIFLrO62pmKs6hghuyxC
         s1Eg==
X-Gm-Message-State: AFqh2kqWl2q3UT1VsfP+qZJ5YJFGtYYpRKkz31K5zjJYksvv1dGcRmvt
	g/nsMpOP0MN9D7X181cJ6Sz7xvPwqaLnZG9G
X-Google-Smtp-Source: AMrXdXvLAVwK3qonUGLjg/wBl1L74Jpy3sI9dIZFYwDnDYGuPwbOjHUZ+FDmnz+U9lCjjOwhNEgR3A==
X-Received: by 2002:a17:907:4d6:b0:7c0:d6ba:c934 with SMTP id vz22-20020a17090704d600b007c0d6bac934mr8040416ejb.13.1673782285537;
        Sun, 15 Jan 2023 03:31:25 -0800 (PST)
From: Dmytro Semenets <dmitry.semenets@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Dmytro Semenets <dmytro_semenets@epam.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [RFC PATCH v3 10/10] tools/libs/light: pcid: implement write_bdf command
Date: Sun, 15 Jan 2023 13:31:11 +0200
Message-Id: <20230115113111.1207605-11-dmitry.semenets@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230115113111.1207605-1-dmitry.semenets@gmail.com>
References: <20230115113111.1207605-1-dmitry.semenets@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmytro Semenets <dmytro_semenets@epam.com>

Signed-off-by: Dmytro Semenets <dmytro_semenets@epam.com>
---
 tools/include/pcid.h          | 17 +++++++++
 tools/libs/light/libxl_pci.c  | 67 ++++++++++++++++++-----------------
 tools/libs/light/libxl_pcid.c | 38 ++++++++++++++++++++
 3 files changed, 90 insertions(+), 32 deletions(-)

diff --git a/tools/include/pcid.h b/tools/include/pcid.h
index 833b6c7f3e..2c1bd0727e 100644
--- a/tools/include/pcid.h
+++ b/tools/include/pcid.h
@@ -181,6 +181,23 @@
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
index 2e7bd2eae5..a9a641829a 100644
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
index d968071224..66b433d2bf 100644
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


