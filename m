Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD90690DAF
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 16:56:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492676.762365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ9Ho-0007ny-Gf; Thu, 09 Feb 2023 15:56:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492676.762365; Thu, 09 Feb 2023 15:56:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ9Ho-0007eU-8S; Thu, 09 Feb 2023 15:56:36 +0000
Received: by outflank-mailman (input) for mailman id 492676;
 Thu, 09 Feb 2023 15:56:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vyas=6F=gmail.com=dmitry.semenets@srs-se1.protection.inumbo.net>)
 id 1pQ9Hm-0007Ak-AH
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 15:56:34 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53603fd5-a892-11ed-933c-83870f6b2ba8;
 Thu, 09 Feb 2023 16:56:33 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id l12so2559643edb.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Feb 2023 07:56:33 -0800 (PST)
Received: from dsemenets-HP-EliteBook-850-G8-Notebook-PC.. ([91.219.254.72])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a170906b00100b0087862f45a29sm1027594ejy.174.2023.02.09.07.56.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 07:56:32 -0800 (PST)
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
X-Inumbo-ID: 53603fd5-a892-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/WzhJP9vhJfuiyyeXqbJkYqC2dcjt2F4IfvVYqlat9I=;
        b=RbS+SRI0DAe2NW3ljtd+w56OHWnEQ0kuZADvIx4vdHTld72mZdDC3W5dzvB12y9iv9
         AHt/Ave5j/NWiQTXGZHMuuP2n+PlxxySMDWSI+DwUoPyi63O6nofra2XV2MqgveFRaR1
         +J84hurhWYxdgnlAfMBEAZ/KwZwVrqj/tpaXko2/oWpNtnQNd607WurF1qxoV3sZbAud
         WSBCKcpHCUY/gneQj9/z3c+JRxn7Ik8jK+c/iKOZ3fIq2nJCOnocz8YEUEoyElgHREyg
         HtFESFV952blNkHsUCqJZGs7w3N/mkT/rmw3J340qpam21S93yfHJzZJrmxZfS0jIX6N
         N/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/WzhJP9vhJfuiyyeXqbJkYqC2dcjt2F4IfvVYqlat9I=;
        b=SfxuPy10RjZs0F/N631heSOiuLIFFRpqNNeabiXyURa3QbeOxA3cSj/vRKiDYENOGh
         EuzGmYt1KAXrxKbQ1fotP06sLk1nXA2TtUB8gSCnUzHR1VmpTi4yiFzHnsfa2xFt0Z2P
         EnGzckJkHUmMlCLIOo/zpKAC9C8aWkUh0zY6Kdi0RaLfEXIUTkiQYvMY6p4agzf16l97
         4Skv8/tYS0xhwPXdPTIfLWAJE9aA6SwO9vlagTGoTjZWXKIB4coyuhQ8FmGTXL/y8KLl
         kdm7FxH2Ipp08nE3cKBStbXPbIxMylDLKrMgkm/qLOFRmc1mxGmRYYSxQ9fATco8yl2I
         1jIQ==
X-Gm-Message-State: AO0yUKW0xtcsRCnjvWGakKo2+0H5oViXGUNSyokF7pRxb+eJkrRAsP7k
	EQpFeLh5GFasqHdeQdjXe+M+1+nYWC15Vg==
X-Google-Smtp-Source: AK7set8X2pu/O+NwWpgWtYA7j/136tsDHLByBf2Zdygp1XeRwKhHiRrK2eba1uzSt8xRbY1PBn4POg==
X-Received: by 2002:a05:6402:268b:b0:4a2:2e9e:c2ec with SMTP id w11-20020a056402268b00b004a22e9ec2ecmr14461550edd.4.1675958192956;
        Thu, 09 Feb 2023 07:56:32 -0800 (PST)
From: dmitry.semenets@gmail.com
To: xen-devel@lists.xenproject.org
Cc: Dmytro Semenets <dmytro_semenets@epam.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [RFC PATCH v4 6/9] tools/libs/light: pcid: implement is_device_assigned command
Date: Thu,  9 Feb 2023 17:56:00 +0200
Message-Id: <20230209155604.2753219-7-dmitry.semenets@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230209155604.2753219-1-dmitry.semenets@gmail.com>
References: <20230209155604.2753219-1-dmitry.semenets@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmytro Semenets <dmytro_semenets@epam.com>

Signed-off-by: Dmytro Semenets <dmytro_semenets@epam.com>
---
 tools/include/xen-pcid.h      | 19 ++++++++++++++++
 tools/libs/light/libxl_pci.c  | 43 +++++++++++++++++++----------------
 tools/libs/light/libxl_pcid.c | 34 ++++++++++++++++++++++++++-
 3 files changed, 75 insertions(+), 21 deletions(-)

diff --git a/tools/include/xen-pcid.h b/tools/include/xen-pcid.h
index 5e96b8de6e..843066a54c 100644
--- a/tools/include/xen-pcid.h
+++ b/tools/include/xen-pcid.h
@@ -136,6 +136,25 @@
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
index b3dfd95fd3..841b97172d 100644
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
index 5e1e41feb5..7b6c7fe6a6 100644
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


