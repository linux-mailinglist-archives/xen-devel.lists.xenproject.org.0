Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF0842111A
	for <lists+xen-devel@lfdr.de>; Mon,  4 Oct 2021 16:12:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201468.355984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXOhO-0000dp-AN; Mon, 04 Oct 2021 14:12:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201468.355984; Mon, 04 Oct 2021 14:12:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXOhO-0000aT-6n; Mon, 04 Oct 2021 14:12:10 +0000
Received: by outflank-mailman (input) for mailman id 201468;
 Mon, 04 Oct 2021 14:12:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U/Qt=OY=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mXOhM-0008QG-DX
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 14:12:08 +0000
Received: from mail-lf1-x136.google.com (unknown [2a00:1450:4864:20::136])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a84c4a3-d15a-4ce4-b8c6-68ed5b4f4ef1;
 Mon, 04 Oct 2021 14:11:59 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id x27so72243825lfu.5
 for <xen-devel@lists.xenproject.org>; Mon, 04 Oct 2021 07:11:59 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id n12sm1076809lfe.145.2021.10.04.07.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 07:11:56 -0700 (PDT)
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
X-Inumbo-ID: 2a84c4a3-d15a-4ce4-b8c6-68ed5b4f4ef1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mico79NSg1dTzXgY8IQRVxF4SlAfW6DJKkQE/et5l+E=;
        b=ICTepnxsockaYNS6J7TvmXTgJKo44BlX5+Dwx/rzhbLH9pAOqtVErpd8UCPGo6wHei
         vDMr2/dAU8tinEvhYOkGYarLsqxSUu9fSU6vVD6oZrIZFLcx0cL8AQXeLk0RU233XNFY
         buy5VZZ137b3oTlIiiwmd+6SO72Pfe/8FI6EgG+YXljtjB2J8el+FU2tLYNEaSKyt5i5
         6uwEzOunBNDhnCC3oDDg3cLkSRA5wxFTSTbLYZ/C9ybq607EV5l7tPzMKAi07PQEqrrV
         odMDsApervGjMsT8Dg93Nt4gbuXCMesvjhmBB5LH4vNceiuQjQ/H7wS88eqTJK5xme+s
         ExXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mico79NSg1dTzXgY8IQRVxF4SlAfW6DJKkQE/et5l+E=;
        b=2L0eAwl9kOv1i2W/X6CC3FV5p7mHIlopnO5157zxA1fm1ZrjQ9neAJieC4vlU85uG+
         6bVIiUFuDL0q87t4UP4JoYg1Po98ycq5RnNFaiEAgnOgCjk6G40GeX+bV12JiONQFg8k
         7VkliVHliZx7X2DIKquvkhOIw6LoZxZ9TvKFZKupnKLZhOOFv/LOlsBZC+NVbC5IYEMV
         evbTCDwJwUfNWzcFhqWQAl/2WEC1VM6jkhtwgSa2b5dQIrYjEK+07ZTqavoj6TSP6KrC
         3MkKhZv1kuSRvvAVL/EN6rwK8Pd/sXAHywroPyHgtkndnUeJJro9V9M0e5TO/6Y0QXdF
         9Auw==
X-Gm-Message-State: AOAM530tHiOedjao5shnxnDp+xM9yMZoerJoi7hpcuDOUkNBRxwBf7ak
	EzUoc0ZajR+jbJ2/1mbDavAoRPwepqA=
X-Google-Smtp-Source: ABdhPJx6BLkwzCWXnYzL8PCkpvh5BukwzmSkRNCjUNZQtrb5PtZlYg9g1G4HfyIGbc5giXQbXeZV3Q==
X-Received: by 2002:ac2:5e31:: with SMTP id o17mr15074866lfg.36.1633356716497;
        Mon, 04 Oct 2021 07:11:56 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	paul@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v4 02/11] xen/arm: Add new device type for PCI
Date: Mon,  4 Oct 2021 17:11:42 +0300
Message-Id: <20211004141151.132231-3-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211004141151.132231-1-andr2000@gmail.com>
References: <20211004141151.132231-1-andr2000@gmail.com>
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
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
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
index 73540045d187..138da19284ab 100644
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


