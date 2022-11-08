Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7063620EF2
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 12:24:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439976.694032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osMiS-000786-Vo; Tue, 08 Nov 2022 11:24:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439976.694032; Tue, 08 Nov 2022 11:24:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osMiS-00073j-Qf; Tue, 08 Nov 2022 11:24:28 +0000
Received: by outflank-mailman (input) for mailman id 439976;
 Tue, 08 Nov 2022 11:24:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jDgD=3I=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1osMiR-0006S1-Cr
 for xen-devel@lists.xen.org; Tue, 08 Nov 2022 11:24:27 +0000
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [2607:f8b0:4864:20::1034])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6a6b81e-5f57-11ed-8fd1-01056ac49cbb;
 Tue, 08 Nov 2022 12:24:26 +0100 (CET)
Received: by mail-pj1-x1034.google.com with SMTP id
 m14-20020a17090a3f8e00b00212dab39bcdso17645849pjc.0
 for <xen-devel@lists.xen.org>; Tue, 08 Nov 2022 03:24:26 -0800 (PST)
Received: from localhost ([122.172.84.80]) by smtp.gmail.com with ESMTPSA id
 u9-20020a17090a3fc900b00200461cfa99sm7754719pjm.11.2022.11.08.03.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 03:24:20 -0800 (PST)
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
X-Inumbo-ID: e6a6b81e-5f57-11ed-8fd1-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=obQ8DZ5BACOYz3wKPJhR8jMno97FAVM9CyAho1QNHtU=;
        b=nVYHAI3sksJD2yknMbxKHfKQFu00MZDzVrbCEykWA85twFbEAZ1toG3GjsTJvXPA3d
         VjNpakqVoseWB1FrzcB5Pxza5WQ7w0HRey9z0+jxDJi3Zuu6TCbcnLVl3aWLuwX185nt
         aNHHIy7eG155pbz1NmU1d8nL2uG8CzsfM3DJ160XMjLY+ugegeEooIYWFcepc2la5rL+
         wDGqbouymHRZfMj8Ynb6FtfVUJYl2I2tmUdH1wc+k6xh44BpLxUBP/TSsJrikaLsYlOq
         rh0+oC4H0iby0Av23Jks+J0Rug2muhVWDhq4uqu6PMubjfriqU0ew94LRrWmwaL+xQZn
         tIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=obQ8DZ5BACOYz3wKPJhR8jMno97FAVM9CyAho1QNHtU=;
        b=GP+dcs9wi/vQLJcSYMix8HZ3BfbNBoywxPx8BIaPdy4DPYHBzVagGtRgE1e7+gLZeT
         gfzAYhl0kon2IngLKWqSgr4rwZPVrQmOy5PH2FHFJU1+KQu0dHRMemaU++2+UYkuYebf
         P17X7BKmLZeAL2RJTESMWOYqKC9G1YFZPm5ncqWjano6/p5I5lrq5fNxhHDaEKU4Wk8e
         ct5l7YqrpOQq5eM64eRgYnYRP1dpdUfJWYQp0zrf9uE+eeLdibzMKnETKbI7e3b8M4lX
         eSr3GsyMapW5dmTi5UIWLGv6EXsnRuDZVqpWitJgDR4Ni1Oe8dsg4I5VES59DYbHr9In
         44RA==
X-Gm-Message-State: ACrzQf30wW4VlPeF3BC2NzaZPUQY7DzKO1GxKqmxgpoDs5WNvqlfuYLE
	7YFhD3gnoVvoH7O7nwlm3X5k2DmHC9Ccwg==
X-Google-Smtp-Source: AMsMyM5S+xvSbtuyQCGITbssl4YxD30xFW0fcg8YeyElkvcQSPzwLPQRwxIPekz5tbxFH9eT2duHBw==
X-Received: by 2002:a17:902:e8cd:b0:186:9efc:6790 with SMTP id v13-20020a170902e8cd00b001869efc6790mr55901025plg.91.1667906664869;
        Tue, 08 Nov 2022 03:24:24 -0800 (PST)
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
Subject: [PATCH V6 2/3] xl: Add support to parse generic virtio device
Date: Tue,  8 Nov 2022 16:53:59 +0530
Message-Id: <73663851c5223b99ed0f23a163a0d44cba0ebe29.1667906228.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1667906228.git.viresh.kumar@linaro.org>
References: <cover.1667906228.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds basic support for parsing generic Virtio backend.

An example of domain configuration for mmio based Virtio I2C device is:
virtio = ["type=virtio,device22,transport=mmio"]

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 tools/ocaml/libs/xl/genwrap.py       |  1 +
 tools/ocaml/libs/xl/xenlight_stubs.c |  1 +
 tools/xl/xl_parse.c                  | 84 ++++++++++++++++++++++++++++
 3 files changed, 86 insertions(+)

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
index 1b5381cef033..c6f35c069d2a 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1208,6 +1208,87 @@ static void parse_vkb_list(const XLU_Config *config,
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
+    } else if (MATCH_OPTION("irq", token, oparg)) {
+        virtio->irq = strtoul(oparg, NULL, 0);
+    } else if (MATCH_OPTION("base", token, oparg)) {
+        virtio->base = strtoul(oparg, NULL, 0);
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
@@ -2309,8 +2390,10 @@ void parse_config_data(const char *config_source,
 
     d_config->num_vfbs = 0;
     d_config->num_vkbs = 0;
+    d_config->num_virtios = 0;
     d_config->vfbs = NULL;
     d_config->vkbs = NULL;
+    d_config->virtios = NULL;
 
     if (!xlu_cfg_get_list (config, "vfb", &cvfbs, 0, 0)) {
         while ((buf = xlu_cfg_get_listitem (cvfbs, d_config->num_vfbs)) != NULL) {
@@ -2752,6 +2835,7 @@ void parse_config_data(const char *config_source,
     }
 
     parse_vkb_list(config, d_config);
+    parse_virtio_list(config, d_config);
 
     xlu_cfg_get_defbool(config, "xend_suspend_evtchn_compat",
                         &c_info->xend_suspend_evtchn_compat, 0);
-- 
2.31.1.272.g89b43f80a514


