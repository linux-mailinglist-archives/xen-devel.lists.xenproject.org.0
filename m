Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AC3645481
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 08:22:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455949.713615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2ok9-0000sZ-34; Wed, 07 Dec 2022 07:21:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455949.713615; Wed, 07 Dec 2022 07:21:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2ok8-0000q4-VX; Wed, 07 Dec 2022 07:21:24 +0000
Received: by outflank-mailman (input) for mailman id 455949;
 Wed, 07 Dec 2022 07:21:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QqWv=4F=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1p2ok7-0000L8-M9
 for xen-devel@lists.xen.org; Wed, 07 Dec 2022 07:21:23 +0000
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c00ca0cc-75ff-11ed-8fd2-01056ac49cbb;
 Wed, 07 Dec 2022 08:21:22 +0100 (CET)
Received: by mail-pl1-x629.google.com with SMTP id g10so16224352plo.11
 for <xen-devel@lists.xen.org>; Tue, 06 Dec 2022 23:21:22 -0800 (PST)
Received: from localhost ([122.172.87.149]) by smtp.gmail.com with ESMTPSA id
 188-20020a6218c5000000b00574c54423d3sm13213557pfy.145.2022.12.06.23.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 23:21:20 -0800 (PST)
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
X-Inumbo-ID: c00ca0cc-75ff-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ND3qwRTlESbG0h9MPuamFiuGez3I98pIZuewodood4A=;
        b=Ti4GTg3WG8pmiCrO/UQb9tywbSmb/ICkWJHfFjC8d84M2Kl/8zHK6bWOYR7pxiMhIv
         sb8F9fdDFJOCrzv8+Sz1Zdkm3c5KDKANE0/I7SgTg30ZjnvNTgEMX29TXhOL428qm3yr
         6w3IAsjQYK2XoIYalBGM1/bK8YmJhUF7ULPNlUlLMZxEUYc57ZH52NkuBtt2CB4auCds
         xmNlvSXBmkPO183CWuMVI6GlVDIJ0GaVe5pLxsVgYyJzLQi2LPzDUbc5tK65Ct7ccqIH
         fu5fFRkKm9J/xQdxjPnsQb1JdsU/vrZuIZOcW3gpFDTHldEWgRRp7EHOog+oGG52PhRZ
         aJuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ND3qwRTlESbG0h9MPuamFiuGez3I98pIZuewodood4A=;
        b=yQPe7z0hV5VmRpMalksFv8066grU7tduqWjA34oOJPZuOt1ZhjSPQEBURp7jUbh7T8
         pofR2hpOxjVI4DBfc+PW1snhZkz2Gr3ady7geGg129/wMyVQMC3pX/C0hod+nHWQMbi6
         lwK//2NXAFli+OyJ1jwoLzBx1tx9GExphr9z+tGBF0NCGBn1zViXf67/U+a/J81RgACR
         D8XaJiUymuUGNQz0wjOGKrQsv3R6rblSBm/Mk8cUjLXft1VIPi1zTofrEecAzyL9yZ/g
         /ne9fp2TGHJ1SQU4Ys/9YcoZ/TUvl9N6svrwbj6ZPDOzOCN+yeTl7DDr6+hSyeET5C43
         Fagw==
X-Gm-Message-State: ANoB5pmAdG4S8rCg4/3Gryecqm6tfi4pOX70crkUSQO2J6fLMEWXQXEH
	VXsYxM7RtPwQeqG1jiQsFLDIn8VQkZ2THmYp
X-Google-Smtp-Source: AA0mqf4LAtr/czGQrzym2Ydo4x8uogfFoiS9LOslEJiClo3+DH+s4ACEEsrwgbhppaDO52ZBd2341w==
X-Received: by 2002:a17:90a:b38e:b0:218:79d8:1a2d with SMTP id e14-20020a17090ab38e00b0021879d81a2dmr94083488pjr.229.1670397681188;
        Tue, 06 Dec 2022 23:21:21 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: xen-devel@lists.xen.org,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Mike Holmes <mike.holmes@linaro.org>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH V7 2/3] xl: Add support to parse generic virtio device
Date: Wed,  7 Dec 2022 12:50:43 +0530
Message-Id: <cdb5048066fedf71fb81dd54728326d8046ff3c6.1670396758.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1670396758.git.viresh.kumar@linaro.org>
References: <cover.1670396758.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds basic support for parsing generic Virtio backend.

An example of domain configuration for mmio based Virtio I2C device is:
virtio = ["type=virtio,device22,transport=mmio"]

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 tools/ocaml/libs/xl/genwrap.py       |  1 +
 tools/ocaml/libs/xl/xenlight_stubs.c |  1 +
 tools/xl/xl_parse.c                  | 80 ++++++++++++++++++++++++++++
 3 files changed, 82 insertions(+)

diff --git a/tools/ocaml/libs/xl/genwrap.py b/tools/ocaml/libs/xl/genwrap.py
index 7bf26bdcd831..b188104299b1 100644
--- a/tools/ocaml/libs/xl/genwrap.py
+++ b/tools/ocaml/libs/xl/genwrap.py
@@ -36,6 +36,7 @@ DEVICE_LIST =      [ ("list",           ["ctx", "domid", "t list"]),
 functions = { # ( name , [type1,type2,....] )
     "device_vfb":     DEVICE_FUNCTIONS,
     "device_vkb":     DEVICE_FUNCTIONS,
+    "device_virtio":     DEVICE_FUNCTIONS,
     "device_disk":    DEVICE_FUNCTIONS + DEVICE_LIST +
                       [ ("insert",         ["ctx", "t", "domid", "?async:'a", "unit", "unit"]),
                         ("of_vdev",        ["ctx", "domid", "string", "t"]),
diff --git a/tools/ocaml/libs/xl/xenlight_stubs.c b/tools/ocaml/libs/xl/xenlight_stubs.c
index 45b8af61c74a..8e54f95da7c7 100644
--- a/tools/ocaml/libs/xl/xenlight_stubs.c
+++ b/tools/ocaml/libs/xl/xenlight_stubs.c
@@ -707,6 +707,7 @@ DEVICE_ADDREMOVE(disk)
 DEVICE_ADDREMOVE(nic)
 DEVICE_ADDREMOVE(vfb)
 DEVICE_ADDREMOVE(vkb)
+DEVICE_ADDREMOVE(virtio)
 DEVICE_ADDREMOVE(pci)
 _DEVICE_ADDREMOVE(disk, cdrom, insert)
 
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 644ab8f8fd36..a187cd26e595 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1208,6 +1208,83 @@ static void parse_vkb_list(const XLU_Config *config,
     if (rc) exit(EXIT_FAILURE);
 }
 
+static int parse_virtio_config(libxl_device_virtio *virtio, char *token)
+{
+    char *oparg;
+    int rc;
+
+    if (MATCH_OPTION("backend", token, oparg)) {
+        virtio->backend_domname = strdup(oparg);
+    } else if (MATCH_OPTION("type", token, oparg)) {
+        virtio->type = strdup(oparg);
+    } else if (MATCH_OPTION("transport", token, oparg)) {
+        rc = libxl_virtio_transport_from_string(oparg, &virtio->transport);
+        if (rc) return rc;
+    } else {
+        fprintf(stderr, "Unknown string \"%s\" in virtio spec\n", token);
+        return -1;
+    }
+
+    return 0;
+}
+
+static void parse_virtio_list(const XLU_Config *config,
+                              libxl_domain_config *d_config)
+{
+    XLU_ConfigList *virtios;
+    const char *item;
+    char *buf = NULL, *oparg, *str = NULL;
+    int rc;
+
+    if (!xlu_cfg_get_list (config, "virtio", &virtios, 0, 0)) {
+        int entry = 0;
+        while ((item = xlu_cfg_get_listitem(virtios, entry)) != NULL) {
+            libxl_device_virtio *virtio;
+            char *p;
+
+            virtio = ARRAY_EXTEND_INIT(d_config->virtios, d_config->num_virtios,
+                                       libxl_device_virtio_init);
+
+            buf = strdup(item);
+
+            p = strtok(buf, ",");
+            while (p != NULL)
+            {
+                while (*p == ' ') p++;
+
+                // Type may contain a comma, do special handling.
+                if (MATCH_OPTION("type", p, oparg)) {
+                    if (!strncmp(oparg, "virtio", strlen("virtio"))) {
+                        char *p2 = strtok(NULL, ",");
+                        str = malloc(strlen(p) + strlen(p2) + 2);
+
+                        strcpy(str, p);
+                        strcat(str, ",");
+                        strcat(str, p2);
+                        p = str;
+                    }
+                }
+
+                rc = parse_virtio_config(virtio, p);
+                if (rc) goto out;
+
+                free(str);
+                str = NULL;
+                p = strtok(NULL, ",");
+            }
+
+            entry++;
+            free(buf);
+        }
+    }
+
+    return;
+
+out:
+    free(buf);
+    if (rc) exit(EXIT_FAILURE);
+}
+
 void parse_config_data(const char *config_source,
                        const char *config_data,
                        int config_len,
@@ -2309,8 +2386,10 @@ void parse_config_data(const char *config_source,
 
     d_config->num_vfbs = 0;
     d_config->num_vkbs = 0;
+    d_config->num_virtios = 0;
     d_config->vfbs = NULL;
     d_config->vkbs = NULL;
+    d_config->virtios = NULL;
 
     if (!xlu_cfg_get_list (config, "vfb", &cvfbs, 0, 0)) {
         while ((buf = xlu_cfg_get_listitem (cvfbs, d_config->num_vfbs)) != NULL) {
@@ -2752,6 +2831,7 @@ void parse_config_data(const char *config_source,
     }
 
     parse_vkb_list(config, d_config);
+    parse_virtio_list(config, d_config);
 
     xlu_cfg_get_defbool(config, "xend_suspend_evtchn_compat",
                         &c_info->xend_suspend_evtchn_compat, 0);
-- 
2.31.1.272.g89b43f80a514


