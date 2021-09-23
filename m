Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD12415EE8
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:55:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194101.345768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTOFa-0005Lc-FL; Thu, 23 Sep 2021 12:54:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194101.345768; Thu, 23 Sep 2021 12:54:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTOFa-0005J1-C1; Thu, 23 Sep 2021 12:54:54 +0000
Received: by outflank-mailman (input) for mailman id 194101;
 Thu, 23 Sep 2021 12:54:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JD/Q=ON=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mTOFZ-0004it-2h
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:54:53 +0000
Received: from mail-lf1-x12f.google.com (unknown [2a00:1450:4864:20::12f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id caa3d2c4-a236-4c27-969b-25387d5f3147;
 Thu, 23 Sep 2021 12:54:44 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id t10so26347744lfd.8
 for <xen-devel@lists.xenproject.org>; Thu, 23 Sep 2021 05:54:44 -0700 (PDT)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id l7sm453584lfk.52.2021.09.23.05.54.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 05:54:42 -0700 (PDT)
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
X-Inumbo-ID: caa3d2c4-a236-4c27-969b-25387d5f3147
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Prgw1n7wTygj7XLYMSUBEwYoQObrqUDu7O/88Jp1DaU=;
        b=Aqlsdw1eztQq5Zz4qHfp+blkZsvnn/gEtDwzUtWP1FukAN2DGdE27mQxmjBhuavCg+
         3aGpJbrnPFhN1cenUqre7enhWCUHO0sdi2MJIy2pcgVZO+J7nycstYvQV1kbciSL7mil
         GAsijE497cpUGPhtZEwxOa6B8Vou9qVf9acqq4LPdWZ4MCZZ/7ixvoGyMknf/w5H2fGe
         fYk3gHbReSutMmJvoiSSIc0Gc8oUS7rTUDs5dW2A0PyIUNS/nYyYBC4QT6yuZCOcXRSM
         5SAH+hYea6vI7ybXU8lcfJqJ9ZDdlLzQJMGrlEAbYhxdXa6/PUnQ+WL4eqsz4OedjP6F
         DZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Prgw1n7wTygj7XLYMSUBEwYoQObrqUDu7O/88Jp1DaU=;
        b=Gz0y1djPqXNKWlWUXyO3+zp52auMxMJnrwHQ5f6zXvxSUX48V2eR97o6f72SgcyngS
         83A3FPlTx4NRgpubIii6nTzUMLRuyY4QM+V7d5Zdha0m39gwM9KKSBgPkmGO372wQWVK
         l9d9ngj9DjXGFrEZ8PFBwuyX3gi1z8W0Pyp4hU6kt6GXGnf4pBVwGZay5h9atQhuRsL/
         FY5fW/oXtbF7Qql4WqsMkBhHNRclKj9iqKvYe6tgT9jluRVn/3fVryrQYALJsXgdkHKl
         BJBVCl8+WNVZH66xbfOD1P0475HTzHFoIXwqhVH8zcu9wMLYCp8gbaE9huPfYQN8drHu
         L+4Q==
X-Gm-Message-State: AOAM532nUpQdb4cf/npntbVLSEgXLwCLW9H0SgHz235leK0CkZWihTJx
	wavgTszQ30COc74dmWfdzKanmW2TFDKEuQ==
X-Google-Smtp-Source: ABdhPJx//uwDyEpU+2t+QokFKVXyOJTKl843DWiDZIVY1xjFqAPBVhS1g6OynE9Q3ko70Y1LD8aKUQ==
X-Received: by 2002:a05:6512:2308:: with SMTP id o8mr4026378lfu.13.1632401682978;
        Thu, 23 Sep 2021 05:54:42 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v2 02/11] xen/arm: Add new device type for PCI
Date: Thu, 23 Sep 2021 15:54:29 +0300
Message-Id: <20210923125438.234162-3-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923125438.234162-1-andr2000@gmail.com>
References: <20210923125438.234162-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Add new device type (DEV_PCI) to distinguish PCI devices from platform
DT devices, so some drivers, like IOMMU, can handle PCI devices
differently.

Also add a helper which is when given a struct device returns the
corresponding struct pci_dev which this device is a part of.

Because of the header cross-dependencies, e.g. we need both
struct pci_dev and struct arch_pci_dev at the same time, this cannot be
done with an inline. Macro can be implemented, but looks scary:

 #define dev_to_pci_dev(dev) container_of((container_of((dev), \
                        struct arch_pci_dev, dev), struct pci_dev, arch)

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

---
Since v1:
 - Folded new device type (DEV_PCI) into this patch.
---
 xen/arch/arm/pci/pci.c       | 10 ++++++++++
 xen/include/asm-arm/device.h |  4 ++--
 xen/include/asm-arm/pci.h    |  7 +++++++
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
index bb15edbccc90..e0420d0d86c1 100644
--- a/xen/arch/arm/pci/pci.c
+++ b/xen/arch/arm/pci/pci.c
@@ -27,6 +27,16 @@ int arch_pci_clean_pirqs(struct domain *d)
     return 0;
 }
 
+struct pci_dev *dev_to_pci(struct device *dev)
+{
+    struct arch_pci_dev *arch_dev;
+
+    ASSERT(dev->type == DEV_PCI);
+
+    arch_dev = container_of((dev), struct arch_pci_dev, dev);
+    return container_of(arch_dev, struct pci_dev, arch);
+}
+
 static int __init dt_pci_init(void)
 {
     struct dt_device_node *np;
diff --git a/xen/include/asm-arm/device.h b/xen/include/asm-arm/device.h
index 64aaa2641b7f..12de217b36b9 100644
--- a/xen/include/asm-arm/device.h
+++ b/xen/include/asm-arm/device.h
@@ -4,6 +4,7 @@
 enum device_type
 {
     DEV_DT,
+    DEV_PCI,
 };
 
 struct dev_archdata {
@@ -27,8 +28,7 @@ typedef struct device device_t;
 
 #include <xen/device_tree.h>
 
-/* TODO: Correctly implement dev_is_pci when PCI is supported on ARM */
-#define dev_is_pci(dev) ((void)(dev), 0)
+#define dev_is_pci(dev) ((dev)->type == DEV_PCI)
 #define dev_is_dt(dev)  ((dev)->type == DEV_DT)
 
 enum device_class
diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
index d2728a098a11..9e366ae67e83 100644
--- a/xen/include/asm-arm/pci.h
+++ b/xen/include/asm-arm/pci.h
@@ -27,6 +27,13 @@ struct arch_pci_dev {
     struct device dev;
 };
 
+/*
+ * Because of the header cross-dependencies, e.g. we need both
+ * struct pci_dev and struct arch_pci_dev at the same time, this cannot be
+ * done with an inline here. Macro can be implemented, but looks scary.
+ */
+struct pci_dev *dev_to_pci(struct device *dev);
+
 /* Arch-specific MSI data for vPCI. */
 struct vpci_arch_msi {
 };
-- 
2.25.1


