Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0091D64C375
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 06:20:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461680.719831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5KBR-0002Py-CO; Wed, 14 Dec 2022 05:19:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461680.719831; Wed, 14 Dec 2022 05:19:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5KBR-0002No-7u; Wed, 14 Dec 2022 05:19:57 +0000
Received: by outflank-mailman (input) for mailman id 461680;
 Wed, 14 Dec 2022 05:19:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XtkE=4M=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1p5KBQ-0001q7-5v
 for xen-devel@lists.xen.org; Wed, 14 Dec 2022 05:19:56 +0000
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [2607:f8b0:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f16151e0-7b6e-11ed-8fd2-01056ac49cbb;
 Wed, 14 Dec 2022 06:19:55 +0100 (CET)
Received: by mail-pl1-x62a.google.com with SMTP id m4so2226845pls.4
 for <xen-devel@lists.xen.org>; Tue, 13 Dec 2022 21:19:55 -0800 (PST)
Received: from localhost ([122.172.87.149]) by smtp.gmail.com with ESMTPSA id
 z38-20020a634c26000000b00478162d9923sm7495563pga.13.2022.12.13.21.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 21:19:53 -0800 (PST)
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
X-Inumbo-ID: f16151e0-7b6e-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7i4PRyF/+8MS7bdaR8Oyx6LWpA2zFmwm7P/OIHxlUa4=;
        b=AeKaFazcTk8vJ7dAO85UgvzTe+n4a5R9wj1vOvI6m/CM94BybwvAnGxY0n+mU4PCFQ
         LX+EBLe7zhdKgAPPNDN1PS/JUP4rB0gHrr79wij7Mlvo3X5htwZhn5tlKJr9TD51pyCw
         /x9D8T3kBF4GZvKTX3U1OaHTkAPh7ImJUxAl6mmVAzRDi6/uLsAxonnUIIBHmSXhWJue
         rwMWAcnUQLNTSl/Go1arkRyrbGbibYKA9rq31RDBRBZ6gnMxIezGA0DvjfuMhrVUR71t
         g/VXFknz9zTvRPemFSqOpdrp1Oz6a9rGAawSpUKt21Ca9ZJZO86qrE/54JAKUhaPvnM6
         NaYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7i4PRyF/+8MS7bdaR8Oyx6LWpA2zFmwm7P/OIHxlUa4=;
        b=EyqD5UNLqUwI6j2LiaSK9T4bIedxNlvAiwDRuFT0A6kcCBfU5vZ0eixpPuqvGYvxPI
         soZQBzlLOgARZCB1g7C3omZhTw0ULBO4igIEBQlBqKWK04el32Km2AlSEuQp+kef8pZz
         Az8/5vLSzexjRPA127uib3iUJ/j0X33XC5+Q9cPiLs1IsLn5JVxpHBfr+Ndef+TrzmAI
         aHlJMrPPHAeY4CpqZs4d46VTUvjisjD8Z0KPU8+qzL2O+RKz5YWKcu03KpjViwhhK2t+
         EehcUuv+2BY4t0d6QVAz8SVhbBrX8+TcMkgEUcSKXF0GojJ+rAgcDtYUaF6eUlNUdlHp
         PKbg==
X-Gm-Message-State: ANoB5pmuQQcACYN6CNCGsuYx6lXqBc0ovOWtaTHelrMoBF1Hog9gy4lE
	1+PFQA9Pod2XVMN04YNsSfagSwxe4QXD4uPw
X-Google-Smtp-Source: AA0mqf6lnA/EDSbd1jUuEKEFwKIzfUD+7RGXMteaneoemorxF+0kK9a54NNT93u8kmKjZJgyJNxu9Q==
X-Received: by 2002:a05:6a20:6d8a:b0:ad:a0c2:53ee with SMTP id gl10-20020a056a206d8a00b000ada0c253eemr11577690pzb.12.1670995193943;
        Tue, 13 Dec 2022 21:19:53 -0800 (PST)
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
Subject: [PATCH V10 2/3] xl: Add support to parse generic virtio device
Date: Wed, 14 Dec 2022 10:49:41 +0530
Message-Id: <487d57d805774d3a348d009dc3582eaf29c19ca3.1670994930.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1670994930.git.viresh.kumar@linaro.org>
References: <cover.1670994930.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds basic support for parsing generic Virtio backend.

An example of domain configuration for mmio based Virtio I2C device is:
virtio = ["type=virtio,device22,transport=mmio"]

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
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


