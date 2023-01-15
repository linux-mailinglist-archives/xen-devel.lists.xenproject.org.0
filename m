Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA9566B0A1
	for <lists+xen-devel@lfdr.de>; Sun, 15 Jan 2023 12:31:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477863.740811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pH1EU-000693-2I; Sun, 15 Jan 2023 11:31:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477863.740811; Sun, 15 Jan 2023 11:31:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pH1ET-000630-RS; Sun, 15 Jan 2023 11:31:25 +0000
Received: by outflank-mailman (input) for mailman id 477863;
 Sun, 15 Jan 2023 11:31:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ytYW=5M=gmail.com=dmitry.semenets@srs-se1.protection.inumbo.net>)
 id 1pH1ER-0004ci-SL
 for xen-devel@lists.xenproject.org; Sun, 15 Jan 2023 11:31:23 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 239eae73-94c8-11ed-91b6-6bf2151ebd3b;
 Sun, 15 Jan 2023 12:31:23 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id bk15so4531517ejb.9
 for <xen-devel@lists.xenproject.org>; Sun, 15 Jan 2023 03:31:23 -0800 (PST)
Received: from dsemenets-HP-EliteBook-850-G8-Notebook-PC.. ([91.219.254.73])
 by smtp.gmail.com with ESMTPSA id
 uj42-20020a170907c9aa00b0084d4e612a22sm7459961ejc.67.2023.01.15.03.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 03:31:21 -0800 (PST)
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
X-Inumbo-ID: 239eae73-94c8-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X6pojTqohgbfc6HlNckJ9zlssPABsEQZhoi9N0xRTxw=;
        b=BcMKaFa411QobFIhInxDjJUI8JkLC8GEhG0hTQH8KxYKVDH0SstOxoy9CFMAMbBH/R
         Xo48qU5Bf7Zghmb3isT6DkmMkSG2CYv5dZSGKJU5lg6jLESu8I5fQmWH/krF/D8s2VOB
         UszVy4v09Xpc2AfGnx1SF7OnjTRuUWZwPehpGBWnVk+cB1iGEIhmMTJkE5rb/O545w3a
         lr9w/hgGCMXc73EADqXkudFaP9L557UesX7qiuUv3iohljLoFDByox/qI8Ccvv6vQVPw
         g3R7fotNvFWJX4GUqLkBeO1+dfBOk64iXr48pDknJX1PKSqjXXDclGVTpF8S0Qs5qDVt
         Z3dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X6pojTqohgbfc6HlNckJ9zlssPABsEQZhoi9N0xRTxw=;
        b=WzpTkqOl2dG8XmOoZGvTtGe5NI+4lRTCxaMQAYNIXLYa769kpFN9QrnR9CcLJvJaz3
         7YF5sQHPQ5Khsylq3+SkI/afoGwTdATpNTn1rrXG6cA+3KpvvdepdB/2f0Py66W/Hc5p
         OAyIgp4utvPW4CAOCf5FXbifTzn9iYWUH83H9iwqqlX4byWJcDaubTfXL7/gCepnJOx0
         Zo2n2+bjxWFctHJJLrJRVRmOeOFkyxRCmzrfVvLdwm9yeECX/0TYIZ+lU9WPW351/BA6
         Uy8tiVI0ubkhxcQiFfdMsu3Wo8TZ6katNsWRWscQYQpsHO4HK5ZQ0z49ep/9QK+Zozlc
         1JvA==
X-Gm-Message-State: AFqh2krgs44zzqBuy1nUiRuUEFwiuB2+tfdW4Jp9kVAQV2/UnLPnWw8t
	0aq6CVRXytqeRp8Vo9Jd7iB655QhNVkvKFq6
X-Google-Smtp-Source: AMrXdXvOSIf8FV/MCs4zS31QZqNbKyoeuGhPIH8lGD3/tJRCRp+7UYM91FAowYKZ1MYzHrDOMgLtiw==
X-Received: by 2002:a17:906:b053:b0:7ad:ca80:5669 with SMTP id bj19-20020a170906b05300b007adca805669mr89988229ejb.64.1673782282413;
        Sun, 15 Jan 2023 03:31:22 -0800 (PST)
From: Dmytro Semenets <dmitry.semenets@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Dmytro Semenets <dmytro_semenets@epam.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [RFC PATCH v3 07/10] tools/libs/light: pcid: implement is_device_assigned command
Date: Sun, 15 Jan 2023 13:31:08 +0200
Message-Id: <20230115113111.1207605-8-dmitry.semenets@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230115113111.1207605-1-dmitry.semenets@gmail.com>
References: <20230115113111.1207605-1-dmitry.semenets@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmytro Semenets <dmytro_semenets@epam.com>

Signed-off-by: Dmytro Semenets <dmytro_semenets@epam.com>
---
 tools/include/pcid.h          | 19 ++++++++++++++++
 tools/libs/light/libxl_pci.c  | 43 +++++++++++++++++++----------------
 tools/libs/light/libxl_pcid.c | 34 ++++++++++++++++++++++++++-
 3 files changed, 75 insertions(+), 21 deletions(-)

diff --git a/tools/include/pcid.h b/tools/include/pcid.h
index 118f8105cf..983e067dfc 100644
--- a/tools/include/pcid.h
+++ b/tools/include/pcid.h
@@ -135,6 +135,25 @@
  */
 #define PCID_CMD_REVERT_ASSIGNABLE      "revert_assignable"
 
+/*
+ *******************************************************************************
+ * Check is device assigned
+ *
+ * This command checks device is assigned
+ *
+ * Request (see other mandatory fields above):
+ *  - "cmd" field of the request must be set to "is_device_assigned".
+ *  - "sbdf" SBDF of the device in format defined by PCID_SBDF_FMT.
+ *
+ * Response (see other mandatory fields above):
+ *  - "resp" field of the response must be set to "is_device_assigned".
+ * Command specific response data:
+ * +-------------+--------------+----------------------------------------------+
+ * | result      | bool         | true if device assigned                      |
+ * +-------------+--------------+----------------------------------------------+
+ */
+#define PCID_CMD_IS_ASSIGNED            "is_device_assigned"
+#define PCID_MSG_FIELD_RESULT           "result"
 
 int libxl_pcid_process(libxl_ctx *ctx);
 
diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 0351a0d3df..d68cb1986f 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -86,7 +86,9 @@ static int pci_handle_response(libxl__gc *gc,
         *result = libxl__json_object_alloc(gc, JSON_NULL);
     else if (strcmp(command_name, PCID_CMD_REVERT_ASSIGNABLE) == 0)
         *result = libxl__json_object_alloc(gc, JSON_NULL);
-
+    else if (strcmp(command_name, PCID_CMD_IS_ASSIGNED) == 0)
+        *result = (libxl__json_object *)libxl__json_map_get(PCID_MSG_FIELD_RESULT,
+                                                          response, JSON_BOOL);
     return ret;
 }
 
@@ -753,30 +755,31 @@ bool libxl__is_igd_vga_passthru(libxl__gc *gc,
 
 static int pciback_dev_is_assigned(libxl__gc *gc, libxl_device_pci *pci)
 {
-    char * spath;
+    struct vchan_info *vchan;
     int rc;
-    struct stat st;
+    libxl__json_object *args, *result;
 
-    if ( access(SYSFS_PCIBACK_DRIVER, F_OK) < 0 ) {
-        if ( errno == ENOENT ) {
-            LOG(ERROR, "Looks like pciback driver is not loaded");
-        } else {
-            LOGE(ERROR, "Can't access "SYSFS_PCIBACK_DRIVER);
-        }
-        return -1;
+    vchan = pci_vchan_get_client(gc);
+    if (!vchan) {
+        rc = ERROR_NOT_READY;
+        goto out;
     }
 
-    spath = GCSPRINTF(SYSFS_PCIBACK_DRIVER"/"PCI_BDF,
-                      pci->domain, pci->bus,
-                      pci->dev, pci->func);
-    rc = lstat(spath, &st);
+    args = libxl__vchan_start_args(gc);
 
-    if( rc == 0 )
-        return 1;
-    if ( rc < 0 && errno == ENOENT )
-        return 0;
-    LOGE(ERROR, "Accessing %s", spath);
-    return -1;
+    libxl__vchan_arg_add_string(gc, args, PCID_MSG_FIELD_SBDF,
+                                GCSPRINTF(PCID_SBDF_FMT, pci->domain,
+                                          pci->bus, pci->dev, pci->func));
+
+    result = vchan_send_command(gc, vchan, PCID_CMD_IS_ASSIGNED, args);
+    if (!result) {
+        rc = ERROR_FAIL;
+    }
+    rc = result->u.b;
+    pci_vchan_free(gc, vchan);
+
+out:
+    return rc;
 }
 
 static int libxl__device_pci_assignable_add(libxl__gc *gc,
diff --git a/tools/libs/light/libxl_pcid.c b/tools/libs/light/libxl_pcid.c
index d8245195ee..d72beed405 100644
--- a/tools/libs/light/libxl_pcid.c
+++ b/tools/libs/light/libxl_pcid.c
@@ -147,7 +147,7 @@ static int pciback_dev_is_assigned(libxl__gc *gc, unsigned int domain,
     if (rc < 0 && errno == ENOENT)
         return 0;
     LOGE(ERROR, "Accessing %s", spath);
-    return -1;
+    return 0;
 }
 
 #define PCID_INFO_PATH		"pcid"
@@ -335,6 +335,35 @@ static int pciback_dev_assign(libxl__gc *gc, unsigned int domain,
     return 0;
 }
 
+static int process_pciback_dev_is_assigned(libxl__gc *gc, yajl_gen gen,
+                                   char *command_name,
+                                   const struct libxl__json_object *request,
+                                   struct libxl__json_object **response)
+{
+    const struct libxl__json_object *json_o;
+    unsigned int dom, bus, dev, func;
+    int rc;
+
+    libxl__yajl_gen_asciiz(gen, PCID_MSG_FIELD_RESULT);
+    *response = libxl__json_object_alloc(gc, JSON_BOOL);
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
+    rc = pciback_dev_is_assigned(gc, dom, bus, dev, func);
+    if (rc < 0)
+        return ERROR_FAIL;
+    (*response)->u.b = rc;
+    return 0;
+}
+
 static int process_make_assignable(libxl__gc *gc, yajl_gen gen,
                                    char *command_name,
                                    const struct libxl__json_object *request,
@@ -538,6 +567,9 @@ static int pcid_handle_request(libxl__gc *gc, yajl_gen gen,
     else if (strcmp(command_name, PCID_CMD_REVERT_ASSIGNABLE) == 0)
        ret = process_revert_assignable(gc, gen, command_name,
                                      request, &command_response);
+    else if (strcmp(command_name, PCID_CMD_IS_ASSIGNED) == 0)
+       ret = process_pciback_dev_is_assigned(gc, gen, command_name,
+                                     request, &command_response);
     else {
         /*
          * This is an unsupported command: make a reply and proceed over
-- 
2.34.1


