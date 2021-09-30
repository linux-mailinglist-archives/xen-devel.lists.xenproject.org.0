Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C628041D43C
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 09:13:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199395.353440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqGD-0004rg-4q; Thu, 30 Sep 2021 07:13:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199395.353440; Thu, 30 Sep 2021 07:13:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqGD-0004p9-1b; Thu, 30 Sep 2021 07:13:41 +0000
Received: by outflank-mailman (input) for mailman id 199395;
 Thu, 30 Sep 2021 07:13:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OAwA=OU=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mVqGC-0004B3-9X
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 07:13:40 +0000
Received: from mail-lf1-x12e.google.com (unknown [2a00:1450:4864:20::12e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 345376d7-90bf-4731-be1f-4e150d108e43;
 Thu, 30 Sep 2021 07:13:31 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id b15so21120329lfe.7
 for <xen-devel@lists.xenproject.org>; Thu, 30 Sep 2021 00:13:30 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id y3sm267835lfh.132.2021.09.30.00.13.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 00:13:29 -0700 (PDT)
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
X-Inumbo-ID: 345376d7-90bf-4731-be1f-4e150d108e43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IQOqq0vw5ObAcax4b2zzMkwlZl3+eElA9Can/zWllgQ=;
        b=brzQZIxPuUAGA3eUAp2p9S981LqvoqpmB6dwDkdSo9Kf3r52uaiKUKcScK3jLExAy8
         xndRqxG+TGKHKvETguZ94WipFL+oPPSt6C2e7P0IaL/+/l4GUSRPt+wL7KnAYm9vhPxm
         aG4/3SkDXTINYSHVBLyPRqzBSnxaay4EEvfO/JlFttZlrB5g4H5I6Aa7c8tEPajhVdFD
         cTppFYUIGzf5uEjXhSlfRP3y71vRKIXyZO+KqjU0SeLdBhHguE5HPsjMdqkvzuUNj5Va
         lztysJxyr4t5Yb+UBMmlUDJbO/fY2EtKIo8aug7l8baAIPLnRfOfFkVHOTYckBIJZGyv
         KHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IQOqq0vw5ObAcax4b2zzMkwlZl3+eElA9Can/zWllgQ=;
        b=LArj/pXZv7Crm6lUmXPmSWJ+JurAQqkh/zVy4EZY0KoWgwKad8fkZ3V317obfDRi5q
         KRxT1VFyupGZtZFoA6T28PseDe93C322NgVAha7Mc6NGcubSk+4M+v+jNTKgwMCDFVpp
         /GWEATKOWJg8w3mnjkaZ80sn1W+ajtem43y/+DoZHZke87XbVJKyd7DPAKBgrVlL5/Za
         GbXKeYirTzpf1vHB4OWNVoXy+iTEyFgh77wFJ9gV+QHwFfGRjVYSndtkmSghftE8PtSu
         CYrCmpky5vRPvYB7uNDINc2k+PjdGi1iabD9iLRMHJcs4aMv37PxlWvcgkikIhu+3sKo
         IADg==
X-Gm-Message-State: AOAM532DXHY16qfx9rtBPYD4rpuaBdaec3Aadswe0MG3v4vupnAHS7xF
	ewfgW/F02aeNp62sYxr9+zw2WYb1KBc=
X-Google-Smtp-Source: ABdhPJzyPgBi1m/E6vkHHJqtg/a9OyNjPIlynE53PEkapio7Yjdxyz7UXZ78Qo64Pb94Pvl771CKrw==
X-Received: by 2002:a2e:5709:: with SMTP id l9mr4101790ljb.315.1632986009754;
        Thu, 30 Sep 2021 00:13:29 -0700 (PDT)
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
Subject: [PATCH v3 02/11] xen/arm: Add new device type for PCI
Date: Thu, 30 Sep 2021 10:13:17 +0300
Message-Id: <20210930071326.857390-3-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210930071326.857390-1-andr2000@gmail.com>
References: <20210930071326.857390-1-andr2000@gmail.com>
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
done with an inline.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
Since v2:
 - !! dropped Stefano's r-b because of the changes
 - simplified dev_to_pci to use a single
   container_of(dev, struct pci_dev, arch.dev) (Jan)
Since v1:
 - Folded new device type (DEV_PCI) into this patch.
---
 xen/arch/arm/pci/pci.c       | 7 +++++++
 xen/include/asm-arm/device.h | 4 ++--
 xen/include/asm-arm/pci.h    | 7 +++++++
 3 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
index 84d8f0d63430..9fc522e566a9 100644
--- a/xen/arch/arm/pci/pci.c
+++ b/xen/arch/arm/pci/pci.c
@@ -27,6 +27,13 @@ int arch_pci_clean_pirqs(struct domain *d)
     return 0;
 }
 
+struct pci_dev *dev_to_pci(struct device *dev)
+{
+    ASSERT(dev->type == DEV_PCI);
+
+    return container_of(dev, struct pci_dev, arch.dev);
+}
+
 static int __init dt_pci_init(void)
 {
     struct dt_device_node *np;
diff --git a/xen/include/asm-arm/device.h b/xen/include/asm-arm/device.h
index ebe84ea853cd..7bf040560363 100644
--- a/xen/include/asm-arm/device.h
+++ b/xen/include/asm-arm/device.h
@@ -4,6 +4,7 @@
 enum device_type
 {
     DEV_DT,
+    DEV_PCI,
 };
 
 struct dev_archdata {
@@ -25,8 +26,7 @@ typedef struct device device_t;
 
 #include <xen/device_tree.h>
 
-/* TODO: Correctly implement dev_is_pci when PCI is supported on ARM */
-#define dev_is_pci(dev) ((void)(dev), 0)
+#define dev_is_pci(dev) ((dev)->type == DEV_PCI)
 #define dev_is_dt(dev)  ((dev)->type == DEV_DT)
 
 enum device_class
diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
index 7cb2e2f1edaf..603a1fc072d1 100644
--- a/xen/include/asm-arm/pci.h
+++ b/xen/include/asm-arm/pci.h
@@ -26,6 +26,13 @@ struct arch_pci_dev {
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


