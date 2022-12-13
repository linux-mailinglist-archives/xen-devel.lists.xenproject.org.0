Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E1C64B303
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 11:11:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460408.718320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p52Fk-0002SQ-Ch; Tue, 13 Dec 2022 10:11:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460408.718320; Tue, 13 Dec 2022 10:11:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p52Fk-0002PW-9e; Tue, 13 Dec 2022 10:11:12 +0000
Received: by outflank-mailman (input) for mailman id 460408;
 Tue, 13 Dec 2022 10:11:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TlCu=4L=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1p52Fi-0002PB-5S
 for xen-devel@lists.xen.org; Tue, 13 Dec 2022 10:11:10 +0000
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [2607:f8b0:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2940d26c-7ace-11ed-91b6-6bf2151ebd3b;
 Tue, 13 Dec 2022 11:10:41 +0100 (CET)
Received: by mail-pg1-x52f.google.com with SMTP id 62so10069553pgb.13
 for <xen-devel@lists.xen.org>; Tue, 13 Dec 2022 02:10:15 -0800 (PST)
Received: from localhost ([122.172.87.149]) by smtp.gmail.com with ESMTPSA id
 q18-20020aa79832000000b005745635c5b5sm7319649pfl.183.2022.12.13.02.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 02:08:58 -0800 (PST)
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
X-Inumbo-ID: 2940d26c-7ace-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vXqoRJdEJYKdn1X+SDtx30T59nlBol+wjpDAJ9IO1pU=;
        b=aE7AlhS8CgiEtCGbMGnU/ptP0rTc82SENRGLfLbOy4cE3BNmEMTvP3xN2bM1/+QBGF
         JTvhcik719IsAk1k7kAoWvQSlIpPeUWl//gy3+BB7G0LLYBi2pKjEA/BffcrGpwKDMGT
         5qdKhnSBTJVQAq1biGJjQ/Y8oG085gWBVVslABKQ36kR93ro3e39/RUExL/hqLnIx83K
         cfx3bXtW6vDrTF1lPulqjtBClPLmYiA2WpgEE5tDXBiOTIb9rZ9lO4mBt5W1R+xlvcDo
         3q0Kp/arsZB67mVU466ddIO0XoUIQuYM6ppJMNu5SidTfQUwaKiCXRa8lyax/dV5PO9s
         JfNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vXqoRJdEJYKdn1X+SDtx30T59nlBol+wjpDAJ9IO1pU=;
        b=RQRRP4KxI4rq/4D5fra+DZuI0kbiFKaxKUaxHI/DzdKGeDXCvXs+SdmQE/6EPpv752
         WI77hGV9+esp07jc0beIesSLKTq2WylzW+VvebiK/9a9FQm2vwQan15UC2vkU0yi8eJ9
         hLbJu2ycef4O+jPKH1Vjtu4QwNLJ+nJC4Y3BLYmBEiuYOtAc8Wce/xi2wLn5vS/KK5YS
         wOicU7RMC9GpLJcYrOLSQ8hhnb7m+EpOKX9mI+viwZ7R3hBtXijbzwU3pyVDJ8nshRzP
         o4GRfypELP8pD2cCe/8fnRMaau/+bfVoB1tTXlIYhMEzCoF4CoEAtisGkAX08tddG3t1
         vPOQ==
X-Gm-Message-State: ANoB5plUngysryhGJdl9EnET4jwPaiemOERjA2VCxKdGFs3Sa3zIwr6s
	fDOMprs0V9M5Vq8sgw9idII+a/lkt7ajNuUx
X-Google-Smtp-Source: AA0mqf7+39FAJZsI44hx/oCohVMvUC0nXhz3ahrFNjHR+3KrnEo/vp4OPA64ktQeWDAzTCHTsEqMmg==
X-Received: by 2002:a62:870d:0:b0:576:f02e:d0ef with SMTP id i13-20020a62870d000000b00576f02ed0efmr18610880pfe.4.1670926138720;
        Tue, 13 Dec 2022 02:08:58 -0800 (PST)
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
Subject: [PATCH V9 2/3] xl: Add support to parse generic virtio device
Date: Tue, 13 Dec 2022 15:38:47 +0530
Message-Id: <9822fd35c2b072da0fcdc37fc029c67d5543c716.1670925998.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1670925998.git.viresh.kumar@linaro.org>
References: <cover.1670925998.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds basic support for parsing generic Virtio backend.

An example of domain configuration for mmio based Virtio I2C device is:
virtio = ["type=virtio,device22,transport=mmio"]

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 tools/xl/xl_parse.c | 81 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

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


