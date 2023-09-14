Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CE37A081A
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 16:57:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602358.938928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnmO-00045H-Bh; Thu, 14 Sep 2023 14:57:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602358.938928; Thu, 14 Sep 2023 14:57:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnmO-0003xy-1q; Thu, 14 Sep 2023 14:57:16 +0000
Received: by outflank-mailman (input) for mailman id 602358;
 Thu, 14 Sep 2023 14:57:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9rCx=E6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qgnmL-0002WX-5M
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 14:57:13 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fbdc96cb-530e-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 16:57:11 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2bfb0a2682fso17380141fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 07:57:11 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a14-20020a2e860e000000b002b6ffa50896sm309828lji.128.2023.09.14.07.57.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 07:57:10 -0700 (PDT)
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
X-Inumbo-ID: fbdc96cb-530e-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694703431; x=1695308231; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u1QnQP4FV4x1+MRf6vUoDUIxoKiv+APN/HEwJJ83S9A=;
        b=mzEpfgKMFcLz3DaJgPL0AIS3/hc29fhOhnKbgkjtTALtvUXtg6SajwUdtGPyc3VwoS
         aTfppKwcmg9JAzUZ7CzZzvqk5KIOAc3GVMY0CWzKxPsr/ISpctatzIckofMgQz9axrEC
         QrL2pEGkS4DeyAun1mKmZ6j6NPJvIgBOsWfeJHo4ZUeyihG2LNR7tRwWntLRG7SXs2Zs
         Mh15AKVgua/CQ67oIRLlR7F9YDignZQF6WVvARXJB34Hl5RSm6EjvDcpgXH+chlm8l40
         iD2ByFlWdwZ7f2NaYdbpS9Qumyoc0F9tJvmqp3C/2TNf4oxo2xSMAy4crDaemPVUFnk4
         zsDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694703431; x=1695308231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u1QnQP4FV4x1+MRf6vUoDUIxoKiv+APN/HEwJJ83S9A=;
        b=q48bxWiieFDfqpDbNQDNijwmX54eG9bKiwsoI6I/gkGoi5NXNztX/xYM4gLGb0HGwi
         MgsU16UbYsSzmIQl4dQ9gQGNAtc0EiClWvvTqn69U7Ppl7E9AjvQ/aAuN6GbnN0DU6la
         UWj8KG8C4rvyNQl7OYj+KXGqt3IzDamXhDRv01nEP0gkDRFMt3ecNXOicQVXBZK4Bdls
         DvhR6i6c0YXq8pHG8vkRg5GggySoj98okmWvBJUZBWpa7XNOYwDkRLRvYd1jafNeT4qA
         SvHsZVRPT1tpRTRPxOovmsOaLOfCIBPFUNKKBUnkH0r4QGn8mssVOSKcfCLmzE8UoXdb
         46IA==
X-Gm-Message-State: AOJu0YwOIjOYF4fbwceBzA8y8XrQZuQRcMC7+Br/2s8adX5PEZIKyJuK
	yqPoS9JS2v9cke3davkMWpbNndfannc=
X-Google-Smtp-Source: AGHT+IGxMUoYxVZ41O0EyhntREPIb/EUffUQofUYjhCKQGYsZNVLPhQjb5tDZEoCLWYNHChqXu/jCw==
X-Received: by 2002:a2e:b00e:0:b0:2bd:bc9:30aa with SMTP id y14-20020a2eb00e000000b002bd0bc930aamr5392840ljk.23.1694703430551;
        Thu, 14 Sep 2023 07:57:10 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1 04/29] xen/asm-generic: introduce stub header device.h
Date: Thu, 14 Sep 2023 17:56:25 +0300
Message-ID: <3cc9ecc3abcd21c5ed7276b01bf5963e6a5fd5e0.1694702259.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694702259.git.oleksii.kurochko@gmail.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces stub header needed for full Xen build.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/include/asm-generic/device.h | 65 ++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 xen/include/asm-generic/device.h

diff --git a/xen/include/asm-generic/device.h b/xen/include/asm-generic/device.h
new file mode 100644
index 0000000000..66e69ecd78
--- /dev/null
+++ b/xen/include/asm-generic/device.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_DEVICE_H__
+#define __ASM_GENERIC_DEVICE_H__
+
+struct dt_device_node;
+
+enum device_type
+{
+    DEV_DT,
+    DEV_PCI,
+};
+
+struct device {
+    enum device_type type;
+#ifdef CONFIG_HAS_DEVICE_TREE
+    struct dt_device_node *of_node; /* Used by drivers imported from Linux */
+#endif
+};
+
+enum device_class
+{
+    DEVICE_SERIAL,
+    DEVICE_IOMMU,
+    DEVICE_GIC,
+    DEVICE_PCI_HOSTBRIDGE,
+    /* Use for error */
+    DEVICE_UNKNOWN,
+};
+
+struct device_desc {
+    /* Device name */
+    const char *name;
+    /* Device class */
+    enum device_class class;
+    /* List of devices supported by this driver */
+    const struct dt_device_match *dt_match;
+    /*
+     * Device initialization.
+     *
+     * -EAGAIN is used to indicate that device probing is deferred.
+     */
+    int (*init)(struct dt_device_node *dev, const void *data);
+};
+
+typedef struct device device_t;
+
+#define DT_DEVICE_START(_name, _namestr, _class)                    \
+static const struct device_desc __dev_desc_##_name __used           \
+__section(".dev.info") = {                                          \
+    .name = _namestr,                                               \
+    .class = _class,                                                \
+
+#define DT_DEVICE_END                                               \
+};
+
+#endif /* __ASM_GENERIC_DEVICE_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.41.0


