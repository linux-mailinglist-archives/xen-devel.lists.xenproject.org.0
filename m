Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7346B649BBC
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 11:10:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459356.717096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fky-0003Tn-7g; Mon, 12 Dec 2022 10:09:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459356.717096; Mon, 12 Dec 2022 10:09:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fky-0003QS-3T; Mon, 12 Dec 2022 10:09:56 +0000
Received: by outflank-mailman (input) for mailman id 459356;
 Mon, 12 Dec 2022 10:09:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Osd=4K=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1p4fkv-0002rI-Tk
 for xen-devel@lists.xen.org; Mon, 12 Dec 2022 10:09:54 +0000
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [2607:f8b0:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e5413e3-7a05-11ed-91b6-6bf2151ebd3b;
 Mon, 12 Dec 2022 11:09:53 +0100 (CET)
Received: by mail-pf1-x42e.google.com with SMTP id 130so8179889pfu.8
 for <xen-devel@lists.xen.org>; Mon, 12 Dec 2022 02:09:52 -0800 (PST)
Received: from localhost ([122.172.87.149]) by smtp.gmail.com with ESMTPSA id
 v66-20020a622f45000000b005754106e364sm5383662pfv.199.2022.12.12.02.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 02:09:50 -0800 (PST)
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
X-Inumbo-ID: 1e5413e3-7a05-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wZw/jcd26ULBLrGrTF2EhfE2I7WbIMOHWDnSInCc7qI=;
        b=oHOAIhgOWckbpTOOFOTGFxfhCmuxLPKjneh9C7pQVvRrmZO1ppf9S06XQsgLxsVaqb
         xC5D+57ryh9y+zMF4UebqSM3Fr9DXfypZkCjRpeWoI7LR0WxzMCgp3Q7MatLHEuNnQ4R
         Y5aa35vayUjojH5M1EuompOXcNRvYi8DtGFSmO0PSoMWqj2zOoxlT+F9xpqiZ0Y5FOyU
         qSrposgXOjBKcUCM6jfPMZ4Tk9a6+NzSsCzfw5kAbJ8MBxPRYr4Q43EYPSkdwcDT+w+z
         1IZgc353CcF35mE8BkUueDx8nZHXw9JyGu9Br1C/knEUEvFXhekXtV99gB4bpn8QcsEC
         anSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wZw/jcd26ULBLrGrTF2EhfE2I7WbIMOHWDnSInCc7qI=;
        b=Zclk1OsxeTeId4yNbEFf2GMHwqbdhCzZ3GV5FSfNrC16Xt4DSLgDGBrKqUfb0xpVy7
         /Ucakwl1mktItlbLh0FJWCXMTl4XbRXwHZ1231bncmLctL//ZO8MKt7KltBOlsAA3dh+
         OPgpXysk93FKi+PFZhtQS4DujsE5UkfX7nd/f1wrK/gDalzxGTCfUtw1sG9fwSef6U3y
         fdgON3qenDU5MZv+cByC6zfLc7dGFK9Nry6GfkBImhb+QNqsYRtecqRhGmcmY7NnqJsA
         qibMlpUsSqNzsuQdISmLf11yAwgBfo6mRvyeNaBj7raXDsc7Sku8C0cMSbOULUnl7yHR
         vqfg==
X-Gm-Message-State: ANoB5pk1LcObNF4od6LbIGY42cgdCSi6Wr3DcsYweA6hgWNiZizutR4k
	EPX4r+uxhfsS5014lXx7XYeS3xXRnhICx3uk
X-Google-Smtp-Source: AA0mqf4BnBFdxcZVU4c7nJvppc+tpje5u8YtLk9lhwpkHMRCEpn232Ip/mP+/tVqnsPM/rcQIEQrxw==
X-Received: by 2002:a62:87cc:0:b0:576:dc40:6db9 with SMTP id i195-20020a6287cc000000b00576dc406db9mr15885822pfe.13.1670839791435;
        Mon, 12 Dec 2022 02:09:51 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: xen-devel@lists.xen.org,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH V8 2/3] xl: Add support to parse generic virtio device
Date: Mon, 12 Dec 2022 15:35:54 +0530
Message-Id: <feed7e77fb1e986c3f4ab3cf4fef09a21537b0c6.1670839220.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1670839220.git.viresh.kumar@linaro.org>
References: <cover.1670839220.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds basic support for parsing generic Virtio backend.

An example of domain configuration for mmio based Virtio I2C device is:
virtio = ["type=virtio,device22,transport=mmio"]

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 tools/ocaml/libs/xl/genwrap.py |  1 +
 tools/xl/xl_parse.c            | 81 ++++++++++++++++++++++++++++++++++
 2 files changed, 82 insertions(+)

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
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 644ab8f8fd36..853e9f357a1a 100644
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
@@ -2753,6 +2830,10 @@ void parse_config_data(const char *config_source,
 
     parse_vkb_list(config, d_config);
 
+    d_config->virtios = NULL;
+    d_config->num_virtios = 0;
+    parse_virtio_list(config, d_config);
+
     xlu_cfg_get_defbool(config, "xend_suspend_evtchn_compat",
                         &c_info->xend_suspend_evtchn_compat, 0);
 
-- 
2.31.1.272.g89b43f80a514


