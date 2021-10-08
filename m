Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 218C7426457
	for <lists+xen-devel@lfdr.de>; Fri,  8 Oct 2021 07:56:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204329.359474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYirD-0007vD-HL; Fri, 08 Oct 2021 05:55:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204329.359474; Fri, 08 Oct 2021 05:55:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYirD-0007tQ-DO; Fri, 08 Oct 2021 05:55:47 +0000
Received: by outflank-mailman (input) for mailman id 204329;
 Fri, 08 Oct 2021 05:55:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ipo1=O4=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mYirB-0007cA-JT
 for xen-devel@lists.xenproject.org; Fri, 08 Oct 2021 05:55:45 +0000
Received: from mail-lf1-x12b.google.com (unknown [2a00:1450:4864:20::12b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9c5fd5ab-ae37-4376-a47b-316c2d53de2d;
 Fri, 08 Oct 2021 05:55:40 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id n8so32760045lfk.6
 for <xen-devel@lists.xenproject.org>; Thu, 07 Oct 2021 22:55:40 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id f8sm151147lfq.168.2021.10.07.22.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 22:55:38 -0700 (PDT)
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
X-Inumbo-ID: 9c5fd5ab-ae37-4376-a47b-316c2d53de2d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iLqP26L1DNQh23hvf3ZfjEuWpTgHuOxZ20uNYqB0XcE=;
        b=MpsgDz2EDklsRLAuSDOWbiLR2VcxNJfHrA1tPUE77ucY8NSWsdjwS232cIqwIv9ApH
         xByv1hatc1R5qgBJZl8k9Z7m4YO6/hx03bEQg5Mzyg2IWneJ7zKAKkaoPw0gk9EV4R+q
         /UKQPKvhR7JEbLk02CtVl4XfOET53qbP9M0y8btSG54wkOVeVNCb/4KRq4Ow5tQxzh9z
         qUbmPk1m1pURzrSiuqqv72QUl2bW8qtjFMOJ20wkGKiu2361pFFX8CG82Hw/MNjwEGjD
         +guf5faGJ7o0QuFI9xcKSGufriKNqDGGW7Xy4pGcIUEQZ9fBdJ6S5WB791/w8PoJYuC3
         EuyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iLqP26L1DNQh23hvf3ZfjEuWpTgHuOxZ20uNYqB0XcE=;
        b=Re0aZr4QJhRlEiOpkfRXpMHIDKOmsM7ykM80g/EpWS0XTlrgUVy/L/CVsSHuGgrCIO
         O+M1s77r5NuZwUkcorkepYYljm8iCjjmjwXJraCPB4ZSsVCKUvdit2IAYTbNq4vYnzfQ
         LKguPl87z2bXge0NPowLWeufDtaJQORriIdyC+8cmR4OFA5D4oT+fkCqQUelGGUsSVza
         4RtE7sA9omNVr97WEiwhC+xPumLlRck5ZHPYV6fxpwwb35aAL+5JqyxqBhEQ/rMwHnTW
         akvyAGrxBHWSoHpD5qs78VaplEU17IaR1NK6VY01h8QKmnjcM6vQQsiZW4uKS1Zo3zEc
         GuBA==
X-Gm-Message-State: AOAM533cfEGcuc1zd6QipzFiknZd4uigyvJKgQquq7zmJuFneLHDRbqm
	5O/+RHego0ubgDi9Lv1993l1pXgfGIU=
X-Google-Smtp-Source: ABdhPJwShR3k/lP8Rgo+01PGGhT/UN3c9l9R0/Ub8JvsYOoalRg2/nRh9l9MlQ/Q6g7h9FgEiPO9kA==
X-Received: by 2002:a05:6512:20b:: with SMTP id a11mr8675587lfo.179.1633672539392;
        Thu, 07 Oct 2021 22:55:39 -0700 (PDT)
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
Subject: [PATCH v5 01/10] xen/arm: Add new device type for PCI
Date: Fri,  8 Oct 2021 08:55:26 +0300
Message-Id: <20211008055535.337436-2-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211008055535.337436-1-andr2000@gmail.com>
References: <20211008055535.337436-1-andr2000@gmail.com>
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
Reviewed-by: Rahul Singh <rahul.singh@arm.com>
Tested-by: Rahul Singh <rahul.singh@arm.com>
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
index f99356af1eba..7a91ebbdaf0c 100644
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


