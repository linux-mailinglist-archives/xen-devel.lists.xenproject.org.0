Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6203A3190D7
	for <lists+xen-devel@lfdr.de>; Thu, 11 Feb 2021 18:20:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84031.157458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAFdT-0004kO-Dq; Thu, 11 Feb 2021 17:20:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84031.157458; Thu, 11 Feb 2021 17:20:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAFdT-0004jd-9q; Thu, 11 Feb 2021 17:20:11 +0000
Received: by outflank-mailman (input) for mailman id 84031;
 Thu, 11 Feb 2021 17:20:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kYUG=HN=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1lAFdR-0003q3-Tg
 for xen-devel@lists.xenproject.org; Thu, 11 Feb 2021 17:20:09 +0000
Received: from mail-wr1-x42a.google.com (unknown [2a00:1450:4864:20::42a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea3f0262-83ee-4a72-a225-ede5284102e1;
 Thu, 11 Feb 2021 17:19:55 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id v1so1347128wrd.6
 for <xen-devel@lists.xenproject.org>; Thu, 11 Feb 2021 09:19:55 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y15sm5930649wrm.93.2021.02.11.09.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 09:19:50 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F1B7C1FF8F;
 Thu, 11 Feb 2021 17:19:46 +0000 (GMT)
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
X-Inumbo-ID: ea3f0262-83ee-4a72-a225-ede5284102e1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R65y4SBWGHf83/lkymoxqOczXrRrz5R3bZoR1vTdS4s=;
        b=OWTGajGfVbw4fCsYO3v4vddVcuO7px3NM68LIa9yRkSVmsHeVY4bkrU9/2QcbjxzJr
         VcK8a+LqFCjujYpwgMBmZYx1nr0R3zWlAsyxk05immU69nf3odOcHC3zXl3UdT3W+pP+
         UvQiV3poOL7pKqxPyPZyCxm8U4tk8Shx8YSzr9ucxH1Il4gUjM4wNoFRh+uhcRttyUrH
         KYkAno7BPJq8sJkeI9axdoZma5w//RmTNNJlT9hfV+mSo31QZ+S0HPcOcMR/yF778Z0n
         3MGGS0jVgAu8xrE8GDiW64N2zhNUG+m8K6Tq2X8kzTCQ7/sPfvWnPSTLauQy3nrs5Mnu
         eJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R65y4SBWGHf83/lkymoxqOczXrRrz5R3bZoR1vTdS4s=;
        b=fMGUpe7ge1jeCRWAgrlKUiG7HDKLUD/y+2vY2sEE8mQMIJcwMUcVIJHSl+rrMKddvF
         wBS2DS9F6W6b4ZLvuzp5p/njUxaQvbJtPn3Baa6y5stfhlLQaRmy4xJeYibrR5L7MHi5
         6h4K7VrzGqaEA8rtARou+ryNGKG6g1ybML9IiLgG6klLoZVTElfN36w+bJbsQcUk4VFq
         JbWt6WfaV8rruDF/GMWPLD+huGtgqJFbD+LkyiIGNcZ8ebBYnnn2uVcF0QuHYx9YpSe8
         Do3AP/aEaLd9UrAOHS+JSlzCcLJ7V2kOlpxT55TKelO1RlpdHkya/d15rKi6bTTi7uKV
         t4dw==
X-Gm-Message-State: AOAM532BTMP23qQ0JpZGG+MPEVVlaoxKzYhdzYGBiRjzxr048Q193yo/
	Tb65CRjekVDwjRKg29Gfmndv2Q==
X-Google-Smtp-Source: ABdhPJywKrSlQGvz6xL9wq/N3CEq2PsAYq2P+QL9BXzIbFPCJoxtsMQMD8v6tA1/gOUYVLDiz937UA==
X-Received: by 2002:a5d:428a:: with SMTP id k10mr629694wrq.4.1613063994310;
        Thu, 11 Feb 2021 09:19:54 -0800 (PST)
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
Subject: [PATCH  v2 3/7] device_tree: add qemu_fdt_setprop_string_array helper
Date: Thu, 11 Feb 2021 17:19:41 +0000
Message-Id: <20210211171945.18313-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211171945.18313-1-alex.bennee@linaro.org>
References: <20210211171945.18313-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A string array in device tree is simply a series of \0 terminated
strings next to each other. As libfdt doesn't support that directly
we need to build it ourselves.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20201105175153.30489-4-alex.bennee@linaro.org>

---
v2
  - checkpatch long line fix
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


