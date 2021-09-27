Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B10F3418F95
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 08:58:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196353.349167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUkav-0001Y8-Nd; Mon, 27 Sep 2021 06:58:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196353.349167; Mon, 27 Sep 2021 06:58:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUkav-0001V0-JV; Mon, 27 Sep 2021 06:58:33 +0000
Received: by outflank-mailman (input) for mailman id 196353;
 Mon, 27 Sep 2021 06:58:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pKXO=OR=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mUkat-0001Bm-Ri
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 06:58:31 +0000
Received: from mail-lf1-x130.google.com (unknown [2a00:1450:4864:20::130])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 590cdffa-81e9-412d-b0ea-6ced6ad18a84;
 Mon, 27 Sep 2021 06:58:26 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id u18so71440400lfd.12
 for <xen-devel@lists.xenproject.org>; Sun, 26 Sep 2021 23:58:26 -0700 (PDT)
Received: from a2klaptop.epam.com (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id t18sm1498351lfl.219.2021.09.26.23.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 23:58:25 -0700 (PDT)
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
X-Inumbo-ID: 590cdffa-81e9-412d-b0ea-6ced6ad18a84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w4/DyioZ/3SsuR8yEN6bZ8EtrReqU8tTeSBuDAdb3VQ=;
        b=qgj5GJKpWfoP9ym013F4TV5ZqlbqGRkpbbOTMSa/RzePc5Cl0WuBwhXH576wBYsX7p
         WOLlznN6Kr77bgZZekIgSLpm6VvnaNmKfz9aqqdsi3JomAkBfozM6MRI69BomD4KuTSS
         B8sxRrTft5JxxGNwIGZQClT2t9NnFNHBESWr3Zh3VzXmfS5izueYMFBz3wlipBjSvAR7
         zDMz6sTg4hdftLJ1VWiMkthhUbL4/KrC1UIl8u33ksgActLJOx2hECcGib87HzFV+x8z
         30FQZKGSIC3T7lvv/OdspYzrGaiFv2+jxOVYibxospTYD9TPTDxkeeSex7yu6Kdppk3r
         4aGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w4/DyioZ/3SsuR8yEN6bZ8EtrReqU8tTeSBuDAdb3VQ=;
        b=4wirqbOaoE/hdzOJCfeNoJyIamJ2j4uNXPbs6HnZxA51ESMTNioIb9ShKliu7njWCv
         OYQbS3ZyntB+f3yjRrVrD1f7OhpdVHadDxaUSL9aWFEfWD9Ntq4mKcObmZBrw1wX9eSA
         7ma8BGHURYbnHrV2Wc4fx5efrmw6OCQx716KBoOHYJrLf5suDoS2kiO+wQfswlXVbJB3
         wez7jRMFDrQ3+Pg7h/wSyr1qrmd8HWYtEdCHG7Vknta85bcgc7Bd0eol682fvuOIyKXb
         oGN9AQgjPIT1cuya8CNSUO6ewA8wIIx1S6ddlygwtY5rnsT0/XU5dgvmZ4rXCPhVyDNO
         dJfg==
X-Gm-Message-State: AOAM5336cDswAuoT2+cXurYnBuKFRB5uSU6iTBNN82w8xUjTG7S8klZb
	7KAalwEP9YUTLqJmZghvFjmgg5GdueOW5Q==
X-Google-Smtp-Source: ABdhPJxibM+BSNB4l/nZ5IbtJMeL7ldlPn+n0Q/3bzv1XqLCi8tXpVNxScA7/exJ1Svv6KIpcb+xUQ==
X-Received: by 2002:a2e:97ce:: with SMTP id m14mr27362812ljj.73.1632725905476;
        Sun, 26 Sep 2021 23:58:25 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: boris.ostrovsky@oracle.com,
	jgross@suse.com,
	julien@xen.org,
	sstabellini@kernel.org,
	jbeulich@suse.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>
Subject: [PATCH v4 2/2] xen-pciback: allow compiling on other archs than x86
Date: Mon, 27 Sep 2021 09:58:22 +0300
Message-Id: <20210927065822.350973-2-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210927065822.350973-1-andr2000@gmail.com>
References: <20210927065822.350973-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Xen-pciback driver was designed to be built for x86 only. But it
can also be used by other architectures, e.g. Arm.
Re-structure the driver in a way that it can be built for other
platforms as well.

Add new configuration option CONFIG_XEN_PCIDEV_STUB, so the driver
can be limited in its functionality, e.g. no support for
para-virtualised scenario when it acts as PCI backend.
x86 platform will continue using CONFIG_XEN_PCIDEV_BACKEND
for the fully featured backend driver.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>

---
Since v3:
 - Fix >>32 shift for 32-bit architectures
 - Move CONFIG_XEN_PCIDEV_STUB into this patch
Since v2:
 - swap the patch order
Since v1:
 - Do not move pci_xen_initial_domain as it is x86 specific
---
 arch/x86/include/asm/xen/pci.h              | 16 -----
 arch/x86/pci/xen.c                          | 74 +-------------------
 drivers/xen/Kconfig                         | 20 ++++++
 drivers/xen/pci.c                           | 75 +++++++++++++++++++++
 drivers/xen/xen-pciback/conf_space_header.c |  8 ++-
 drivers/xen/xen-pciback/pci_stub.c          |  3 +-
 drivers/xen/xen-pciback/xenbus.c            |  2 +-
 include/xen/pci.h                           | 28 ++++++++
 8 files changed, 133 insertions(+), 93 deletions(-)
 create mode 100644 include/xen/pci.h

diff --git a/arch/x86/include/asm/xen/pci.h b/arch/x86/include/asm/xen/pci.h
index 3506d8c598c1..4b08c2b809ea 100644
--- a/arch/x86/include/asm/xen/pci.h
+++ b/arch/x86/include/asm/xen/pci.h
@@ -16,27 +16,11 @@ static inline int pci_xen_hvm_init(void)
 #endif
 #if defined(CONFIG_XEN_DOM0)
 int __init pci_xen_initial_domain(void);
-int xen_find_device_domain_owner(struct pci_dev *dev);
-int xen_register_device_domain_owner(struct pci_dev *dev, uint16_t domain);
-int xen_unregister_device_domain_owner(struct pci_dev *dev);
 #else
 static inline int __init pci_xen_initial_domain(void)
 {
 	return -1;
 }
-static inline int xen_find_device_domain_owner(struct pci_dev *dev)
-{
-	return -1;
-}
-static inline int xen_register_device_domain_owner(struct pci_dev *dev,
-						   uint16_t domain)
-{
-	return -1;
-}
-static inline int xen_unregister_device_domain_owner(struct pci_dev *dev)
-{
-	return -1;
-}
 #endif
 
 #if defined(CONFIG_PCI_MSI)
diff --git a/arch/x86/pci/xen.c b/arch/x86/pci/xen.c
index 3d41a09c2c14..4a45b0bf9ae4 100644
--- a/arch/x86/pci/xen.c
+++ b/arch/x86/pci/xen.c
@@ -23,6 +23,7 @@
 
 #include <xen/features.h>
 #include <xen/events.h>
+#include <xen/pci.h>
 #include <asm/xen/pci.h>
 #include <asm/xen/cpuid.h>
 #include <asm/apic.h>
@@ -583,77 +584,4 @@ int __init pci_xen_initial_domain(void)
 	}
 	return 0;
 }
-
-struct xen_device_domain_owner {
-	domid_t domain;
-	struct pci_dev *dev;
-	struct list_head list;
-};
-
-static DEFINE_SPINLOCK(dev_domain_list_spinlock);
-static struct list_head dev_domain_list = LIST_HEAD_INIT(dev_domain_list);
-
-static struct xen_device_domain_owner *find_device(struct pci_dev *dev)
-{
-	struct xen_device_domain_owner *owner;
-
-	list_for_each_entry(owner, &dev_domain_list, list) {
-		if (owner->dev == dev)
-			return owner;
-	}
-	return NULL;
-}
-
-int xen_find_device_domain_owner(struct pci_dev *dev)
-{
-	struct xen_device_domain_owner *owner;
-	int domain = -ENODEV;
-
-	spin_lock(&dev_domain_list_spinlock);
-	owner = find_device(dev);
-	if (owner)
-		domain = owner->domain;
-	spin_unlock(&dev_domain_list_spinlock);
-	return domain;
-}
-EXPORT_SYMBOL_GPL(xen_find_device_domain_owner);
-
-int xen_register_device_domain_owner(struct pci_dev *dev, uint16_t domain)
-{
-	struct xen_device_domain_owner *owner;
-
-	owner = kzalloc(sizeof(struct xen_device_domain_owner), GFP_KERNEL);
-	if (!owner)
-		return -ENODEV;
-
-	spin_lock(&dev_domain_list_spinlock);
-	if (find_device(dev)) {
-		spin_unlock(&dev_domain_list_spinlock);
-		kfree(owner);
-		return -EEXIST;
-	}
-	owner->domain = domain;
-	owner->dev = dev;
-	list_add_tail(&owner->list, &dev_domain_list);
-	spin_unlock(&dev_domain_list_spinlock);
-	return 0;
-}
-EXPORT_SYMBOL_GPL(xen_register_device_domain_owner);
-
-int xen_unregister_device_domain_owner(struct pci_dev *dev)
-{
-	struct xen_device_domain_owner *owner;
-
-	spin_lock(&dev_domain_list_spinlock);
-	owner = find_device(dev);
-	if (!owner) {
-		spin_unlock(&dev_domain_list_spinlock);
-		return -ENODEV;
-	}
-	list_del(&owner->list);
-	spin_unlock(&dev_domain_list_spinlock);
-	kfree(owner);
-	return 0;
-}
-EXPORT_SYMBOL_GPL(xen_unregister_device_domain_owner);
 #endif
diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
index 4efc95ddda41..75b9330dc6fd 100644
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -184,6 +184,26 @@ config SWIOTLB_XEN
 config XEN_PCI_STUB
 	bool
 
+config XEN_PCIDEV_STUB
+	tristate "Xen PCI-device stub driver"
+	depends on PCI && !X86 && XEN
+	depends on XEN_BACKEND
+	select XEN_PCI_STUB
+	default m
+	help
+	  The PCI device stub driver provides limited version of the PCI
+	  device backend driver without para-virtualized support for guests.
+	  If you select this to be a module, you will need to make sure no
+	  other driver has bound to the device(s) you want to make visible to
+	  other guests.
+
+	  The "hide" parameter (only applicable if backend driver is compiled
+	  into the kernel) allows you to bind the PCI devices to this module
+	  from the default device drivers. The argument is the list of PCI BDFs:
+	  xen-pciback.hide=(03:00.0)(04:00.0)
+
+	  If in doubt, say m.
+
 config XEN_PCIDEV_BACKEND
 	tristate "Xen PCI-device backend driver"
 	depends on PCI && X86 && XEN
diff --git a/drivers/xen/pci.c b/drivers/xen/pci.c
index 224df03ce42e..fc8c1249d49f 100644
--- a/drivers/xen/pci.c
+++ b/drivers/xen/pci.c
@@ -254,3 +254,78 @@ static int xen_mcfg_late(void)
 	return 0;
 }
 #endif
+
+#ifdef CONFIG_XEN_DOM0
+struct xen_device_domain_owner {
+	domid_t domain;
+	struct pci_dev *dev;
+	struct list_head list;
+};
+
+static DEFINE_SPINLOCK(dev_domain_list_spinlock);
+static struct list_head dev_domain_list = LIST_HEAD_INIT(dev_domain_list);
+
+static struct xen_device_domain_owner *find_device(struct pci_dev *dev)
+{
+	struct xen_device_domain_owner *owner;
+
+	list_for_each_entry(owner, &dev_domain_list, list) {
+		if (owner->dev == dev)
+			return owner;
+	}
+	return NULL;
+}
+
+int xen_find_device_domain_owner(struct pci_dev *dev)
+{
+	struct xen_device_domain_owner *owner;
+	int domain = -ENODEV;
+
+	spin_lock(&dev_domain_list_spinlock);
+	owner = find_device(dev);
+	if (owner)
+		domain = owner->domain;
+	spin_unlock(&dev_domain_list_spinlock);
+	return domain;
+}
+EXPORT_SYMBOL_GPL(xen_find_device_domain_owner);
+
+int xen_register_device_domain_owner(struct pci_dev *dev, uint16_t domain)
+{
+	struct xen_device_domain_owner *owner;
+
+	owner = kzalloc(sizeof(struct xen_device_domain_owner), GFP_KERNEL);
+	if (!owner)
+		return -ENODEV;
+
+	spin_lock(&dev_domain_list_spinlock);
+	if (find_device(dev)) {
+		spin_unlock(&dev_domain_list_spinlock);
+		kfree(owner);
+		return -EEXIST;
+	}
+	owner->domain = domain;
+	owner->dev = dev;
+	list_add_tail(&owner->list, &dev_domain_list);
+	spin_unlock(&dev_domain_list_spinlock);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(xen_register_device_domain_owner);
+
+int xen_unregister_device_domain_owner(struct pci_dev *dev)
+{
+	struct xen_device_domain_owner *owner;
+
+	spin_lock(&dev_domain_list_spinlock);
+	owner = find_device(dev);
+	if (!owner) {
+		spin_unlock(&dev_domain_list_spinlock);
+		return -ENODEV;
+	}
+	list_del(&owner->list);
+	spin_unlock(&dev_domain_list_spinlock);
+	kfree(owner);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(xen_unregister_device_domain_owner);
+#endif
diff --git a/drivers/xen/xen-pciback/conf_space_header.c b/drivers/xen/xen-pciback/conf_space_header.c
index ac45cdc38e85..981435103af1 100644
--- a/drivers/xen/xen-pciback/conf_space_header.c
+++ b/drivers/xen/xen-pciback/conf_space_header.c
@@ -236,8 +236,12 @@ static void *bar_init(struct pci_dev *dev, int offset)
 	else {
 		pos = (offset - PCI_BASE_ADDRESS_0) / 4;
 		if (pos && (res[pos - 1].flags & IORESOURCE_MEM_64)) {
-			bar->val = res[pos - 1].start >> 32;
-			bar->len_val = -resource_size(&res[pos - 1]) >> 32;
+			/*
+			 * Use ">> 16 >> 16" instead of direct ">> 32" shift
+			 * to avoid warnings on 32-bit architectures.
+			 */
+			bar->val = res[pos - 1].start >> 16 >> 16;
+			bar->len_val = -resource_size(&res[pos - 1]) >> 16 >> 16;
 			return bar;
 		}
 	}
diff --git a/drivers/xen/xen-pciback/pci_stub.c b/drivers/xen/xen-pciback/pci_stub.c
index f8e4faa96ad6..bba527620507 100644
--- a/drivers/xen/xen-pciback/pci_stub.c
+++ b/drivers/xen/xen-pciback/pci_stub.c
@@ -19,7 +19,8 @@
 #include <linux/sched.h>
 #include <linux/atomic.h>
 #include <xen/events.h>
-#include <asm/xen/pci.h>
+#include <xen/pci.h>
+#include <xen/xen.h>
 #include <asm/xen/hypervisor.h>
 #include <xen/interface/physdev.h>
 #include "pciback.h"
diff --git a/drivers/xen/xen-pciback/xenbus.c b/drivers/xen/xen-pciback/xenbus.c
index f8ba2903a3ff..bde63ef677b8 100644
--- a/drivers/xen/xen-pciback/xenbus.c
+++ b/drivers/xen/xen-pciback/xenbus.c
@@ -14,7 +14,7 @@
 #include <linux/workqueue.h>
 #include <xen/xenbus.h>
 #include <xen/events.h>
-#include <asm/xen/pci.h>
+#include <xen/pci.h>
 #include "pciback.h"
 
 #define INVALID_EVTCHN_IRQ  (-1)
diff --git a/include/xen/pci.h b/include/xen/pci.h
new file mode 100644
index 000000000000..b8337cf85fd1
--- /dev/null
+++ b/include/xen/pci.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __XEN_PCI_H__
+#define __XEN_PCI_H__
+
+#if defined(CONFIG_XEN_DOM0)
+int xen_find_device_domain_owner(struct pci_dev *dev);
+int xen_register_device_domain_owner(struct pci_dev *dev, uint16_t domain);
+int xen_unregister_device_domain_owner(struct pci_dev *dev);
+#else
+static inline int xen_find_device_domain_owner(struct pci_dev *dev)
+{
+	return -1;
+}
+
+static inline int xen_register_device_domain_owner(struct pci_dev *dev,
+						   uint16_t domain)
+{
+	return -1;
+}
+
+static inline int xen_unregister_device_domain_owner(struct pci_dev *dev)
+{
+	return -1;
+}
+#endif
+
+#endif
-- 
2.25.1


