Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C470C32B9BB
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 19:09:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92931.175311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHVQp-0008QP-At; Wed, 03 Mar 2021 17:37:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92931.175311; Wed, 03 Mar 2021 17:37:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHVQp-0008Pn-7H; Wed, 03 Mar 2021 17:37:07 +0000
Received: by outflank-mailman (input) for mailman id 92931;
 Wed, 03 Mar 2021 17:37:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Voz6=IB=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1lHVQn-0008CL-SR
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 17:37:05 +0000
Received: from mail-wr1-x42b.google.com (unknown [2a00:1450:4864:20::42b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 32c99325-d7fc-43db-9d09-2b7195803c1d;
 Wed, 03 Mar 2021 17:36:50 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id h98so24580675wrh.11
 for <xen-devel@lists.xenproject.org>; Wed, 03 Mar 2021 09:36:50 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y9sm30040997wrm.88.2021.03.03.09.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 09:36:47 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 94A5E1FF8F;
 Wed,  3 Mar 2021 17:36:42 +0000 (GMT)
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
X-Inumbo-ID: 32c99325-d7fc-43db-9d09-2b7195803c1d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JnSGMCd2oTmwo2vSuC8sn+Sw5LdMPM7rvDdngVJ3Vpc=;
        b=l7YLMSTXH1L2EhLS/wpOol4cxnwNY+b6qg4d1oL0nwUoHJF4/9gIKUziXUJbxPF8Er
         y2A/FQlt0bP6rYhQ9hYqXOVLbq2VOsaPLCxYD+t9xtBDIPxl9KRMvlIo7vPbfc6FZmqe
         7ANjZ077NrONFmzK8E9YnvzcJyDzYkKL6sa/N1DFqPbAasoHTv2yRF99bW2lpZO4ZxZH
         UAI5w5VCswgqU0ErH6m1CShRyqniM+UpyQoqXZa0jZgNrfNbaUgefKEJjSJc6wOmcyUi
         mSbAdYO8Eqi6hW/XvUfSBiIh43fDyKUn82DmdZLv5SBRwiyXsRTkNiUh5y6IRNXKUS4q
         wGAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JnSGMCd2oTmwo2vSuC8sn+Sw5LdMPM7rvDdngVJ3Vpc=;
        b=toFa1IDtdOgD3PMFce08LaAZ3aGa5wRH9cxtIP6G9XlNbi6qZsrYRXoFXxNAFKRmw8
         sszEG17pbcashTS1d7aTO9Njg48vcmdYrDYotqqKXwi5vdLENEZm/ewK+GHZVerRnj2i
         DF0gWfxAmPuJzeipIRY3mG2OEJhYYoLPnzKghxmeY0L2wRen3IwcPZ35BNYiNnmKp7oi
         trv+gOLFyLjVTsi0DyqoFTrAzjSMz8WNBx0WBhO6bLFDqtnag3Qqp4lOzGcSZTUiwBGA
         3qvp16zQDzFq+SjcPhslC824LUvY+/gMtVSsKtY4jqe8FkJdzRGK5Hw0piCPF2WSePAE
         qebg==
X-Gm-Message-State: AOAM5315ENbeY4QFJu49O0L+zyzYO7L8LBfMfu/zFGjxwTL8jK62+CZA
	fwzr76GR82kSEzFHXy1ciltDAw==
X-Google-Smtp-Source: ABdhPJzjfn8ZGclDW0qOWpMkkVTkGxv3y4tdAyXeYN21guSZuG9roaTtcaNBrL1aLUfecjPPxGX9uw==
X-Received: by 2002:adf:e5c8:: with SMTP id a8mr28825898wrn.352.1614793010061;
        Wed, 03 Mar 2021 09:36:50 -0800 (PST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: julien@xen.org,
	stefano.stabellini@linaro.org,
	stefano.stabellini@xilinx.com,
	andre.przywara@arm.com,
	stratos-dev@op-lists.linaro.org,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH  v3 3/7] device_tree: add qemu_fdt_setprop_string_array helper
Date: Wed,  3 Mar 2021 17:36:38 +0000
Message-Id: <20210303173642.3805-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210303173642.3805-1-alex.bennee@linaro.org>
References: <20210303173642.3805-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A string array in device tree is simply a series of \0 terminated
strings next to each other. As libfdt doesn't support that directly
we need to build it ourselves.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20201105175153.30489-4-alex.bennee@linaro.org>
Message-Id: <20210211171945.18313-4-alex.bennee@linaro.org>
---
 include/sysemu/device_tree.h | 17 +++++++++++++++++
 softmmu/device_tree.c        | 26 ++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
index 982c89345f..8a2fe55622 100644
--- a/include/sysemu/device_tree.h
+++ b/include/sysemu/device_tree.h
@@ -70,6 +70,23 @@ int qemu_fdt_setprop_u64(void *fdt, const char *node_path,
                          const char *property, uint64_t val);
 int qemu_fdt_setprop_string(void *fdt, const char *node_path,
                             const char *property, const char *string);
+
+/**
+ * qemu_fdt_setprop_string_array: set a string array property
+ *
+ * @fdt: pointer to the dt blob
+ * @name: node name
+ * @prop: property array
+ * @array: pointer to an array of string pointers
+ * @len: length of array
+ *
+ * assigns a string array to a property. This function converts and
+ * array of strings to a sequential string with \0 separators before
+ * setting the property.
+ */
+int qemu_fdt_setprop_string_array(void *fdt, const char *node_path,
+                                  const char *prop, char **array, int len);
+
 int qemu_fdt_setprop_phandle(void *fdt, const char *node_path,
                              const char *property,
                              const char *target_node_path);
diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
index b9a3ddc518..2691c58cf6 100644
--- a/softmmu/device_tree.c
+++ b/softmmu/device_tree.c
@@ -21,6 +21,7 @@
 #include "qemu/error-report.h"
 #include "qemu/option.h"
 #include "qemu/bswap.h"
+#include "qemu/cutils.h"
 #include "sysemu/device_tree.h"
 #include "sysemu/sysemu.h"
 #include "hw/loader.h"
@@ -397,6 +398,31 @@ int qemu_fdt_setprop_string(void *fdt, const char *node_path,
     return r;
 }
 
+/*
+ * libfdt doesn't allow us to add string arrays directly but they are
+ * test a series of null terminated strings with a length. We build
+ * the string up here so we can calculate the final length.
+ */
+int qemu_fdt_setprop_string_array(void *fdt, const char *node_path,
+                                  const char *prop, char **array, int len)
+{
+    int ret, i, total_len = 0;
+    char *str, *p;
+    for (i = 0; i < len; i++) {
+        total_len += strlen(array[i]) + 1;
+    }
+    p = str = g_malloc0(total_len);
+    for (i = 0; i < len; i++) {
+        int len = strlen(array[i]) + 1;
+        pstrcpy(p, len, array[i]);
+        p += len;
+    }
+
+    ret = qemu_fdt_setprop(fdt, node_path, prop, str, total_len);
+    g_free(str);
+    return ret;
+}
+
 const void *qemu_fdt_getprop(void *fdt, const char *node_path,
                              const char *property, int *lenp, Error **errp)
 {
-- 
2.20.1


