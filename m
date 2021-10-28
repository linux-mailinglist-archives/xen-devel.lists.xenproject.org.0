Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FA143E3E5
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 16:36:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218121.378441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg6W9-0003xg-W5; Thu, 28 Oct 2021 14:36:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218121.378441; Thu, 28 Oct 2021 14:36:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg6W9-0003uv-Qv; Thu, 28 Oct 2021 14:36:33 +0000
Received: by outflank-mailman (input) for mailman id 218121;
 Thu, 28 Oct 2021 14:36:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sO6D=PQ=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mg6W8-0003up-P6
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 14:36:32 +0000
Received: from mail-wr1-x434.google.com (unknown [2a00:1450:4864:20::434])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3fc72607-c5c8-408d-b8e5-87ea81cef5ad;
 Thu, 28 Oct 2021 14:36:31 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id v17so10572567wrv.9
 for <xen-devel@lists.xenproject.org>; Thu, 28 Oct 2021 07:36:31 -0700 (PDT)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id u2sm3031883wrr.35.2021.10.28.07.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 07:36:25 -0700 (PDT)
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
X-Inumbo-ID: 3fc72607-c5c8-408d-b8e5-87ea81cef5ad
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NuKSKhq+LJNFGWFZ54Znk00tU2bQ3a59y26xZbZTkY0=;
        b=W2vlhm9tTlOftcdPxk+krlNZe5bJyaEc9INyl9aZOmX0JqlW0LB83IqsqkRAdLZpEt
         9qHoUCPaIvYTle2ZYNS9mImwSPWMdq6K0CrQnwzAuyXAByCIZHc1bZUhsyI6u9ncqv/S
         YUUz27FPxpnK715X/s53yStC1zZuyM0gIgIIkzqz61xc5FmGj+FdNi76AIfhlWFKi9Ab
         bxjRWFe/h2+XO7uKVFLAWmf2PO/eP9N1IXadKdFwWjPy9MneuTQAnWMw+7IRnK3g/RQ7
         kh/ed6q7qHu52er9YUezkfj9vgSqOlSzdSur4hZH+foK2esnFF5hZALIc4onrbEBKKqt
         HyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NuKSKhq+LJNFGWFZ54Znk00tU2bQ3a59y26xZbZTkY0=;
        b=7NHDC5idM8b3voFCUj00sedsL8rQhWPAfAq/cY+QXMrgFFL7WQxFlkIXRA8mKrW1bW
         pYfN9LNgdScxIFZ79e9tlnEiyXEpDGgTrsdi15zpmTCDhURySRBPM7HjYhF+00/sM/yA
         /muxfNAjCGNqqb7h8lMMki/jJCfL1YwufPFjRakBgNnPTRWxwyyIGIRCXXxbVPyhZUK2
         K5hRqRh/q/QNvt8cX7ZJ59N6HwRMavmaFvuGyTM8b+B7mYnFfGBYYKB2g/RYSIAXGa+D
         vmIcrFByMrPvPhh5vRrYY2Ht7jQh68L1PtJGzZYrPdpDRmTDk2Xs+wFfMBxkYwYyTAHm
         KXCQ==
X-Gm-Message-State: AOAM532s3qxlOwHWcPjlo1jUdwCk5Ql6IYBbPgAA29qPPwo3wnws32ar
	31nmgzG0X+9TteZiAk+lo5FqiTmtA2aw7g==
X-Google-Smtp-Source: ABdhPJzFJfOBFsIqpLg+wXJlDeWk4mdZzne8R5XqGAVKRMVYViBs3aYpt3BfeizpR7Kkv6BJLAoU3A==
X-Received: by 2002:a5d:4b8e:: with SMTP id b14mr6045996wrt.259.1635431789876;
        Thu, 28 Oct 2021 07:36:29 -0700 (PDT)
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
Subject: [RESEND PATCH v6] xen-pciback: allow compiling on other archs than x86
Date: Thu, 28 Oct 2021 17:36:20 +0300
Message-Id: <20211028143620.144936-1-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Xen-pciback driver was designed to be built for x86 only. But it
can also be used by other architectures, e.g. Arm.

Currently PCI backend implements multiple functionalities at a time,
such as:
1. It is used as a database for assignable PCI devices, e.g. xl
   pci-assignable-{add|remove|list} manipulates that list. So, whenever
   the toolstack needs to know which PCI devices can be passed through
   it reads that from the relevant sysfs entries of the pciback.
2. It is used to hold the unbound PCI devices list, e.g. when passing
   through a PCI device it needs to be unbound from the relevant device
   driver and bound to pciback (strictly speaking it is not required
   that the device is bound to pciback, but pciback is again used as a
   database of the passed through PCI devices, so we can re-bind the
   devices back to their original drivers when guest domain shuts down)
3. Device reset for the devices being passed through
4. Para-virtualised use-cases support

The para-virtualised part of the driver is not always needed as some
architectures, e.g. Arm or x86 PVH Dom0, are not using backend-frontend
model for PCI device passthrough.

For such use-cases make the very first step in splitting the
xen-pciback driver into two parts: Xen PCI stub and PCI PV backend
drivers.

For that add new configuration options CONFIG_XEN_PCI_STUB and
CONFIG_XEN_PCIDEV_STUB, so the driver can be limited in its
functionality, e.g. no support for para-virtualised scenario.
x86 platform will continue using CONFIG_XEN_PCIDEV_BACKEND for the
fully featured backend driver.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
Changes since v5:
- rebased
- fixed a warning found by:
  Reported-by: kernel test robot <lkp@intel.com>
  All warnings (new ones prefixed by >>):
  >> drivers/xen/pci.c:279:5: warning: no previous prototype for 'xen_find_device_domain_owner' [-Wmissing-prototypes]
Changes since v4:
- squashed two patches
- simplified Makefile
Changes since v3:
 - Fix >>32 shift for 32-bit architectures
Changes since v2:
 - swap the patch order
Since v1:
 - Do not move pci_xen_initial_domain as it is x86 specific
---
 arch/x86/include/asm/xen/pci.h              | 19 ------
 arch/x86/pci/xen.c                          | 76 +--------------------
 drivers/xen/Kconfig                         | 24 +++++++
 drivers/xen/Makefile                        |  2 +-
 drivers/xen/pci.c                           | 76 +++++++++++++++++++++
 drivers/xen/xen-pciback/Makefile            |  7 ++
 drivers/xen/xen-pciback/conf_space_header.c |  8 ++-
 drivers/xen/xen-pciback/pci_stub.c          |  3 +-
 drivers/xen/xen-pciback/pciback.h           |  5 ++
 drivers/xen/xen-pciback/xenbus.c            |  8 ++-
 include/xen/pci.h                           | 28 ++++++++
 11 files changed, 156 insertions(+), 100 deletions(-)
 create mode 100644 include/xen/pci.h

diff --git a/arch/x86/include/asm/xen/pci.h b/arch/x86/include/asm/xen/pci.h
index 4557f7cb0fa6..9015b888edd6 100644
--- a/arch/x86/include/asm/xen/pci.h
+++ b/arch/x86/include/asm/xen/pci.h
@@ -22,25 +22,6 @@ static inline int __init pci_xen_initial_domain(void)
 	return -1;
 }
 #endif
-#ifdef CONFIG_XEN_DOM0
-int xen_find_device_domain_owner(struct pci_dev *dev);
-int xen_register_device_domain_owner(struct pci_dev *dev, uint16_t domain);
-int xen_unregister_device_domain_owner(struct pci_dev *dev);
-#else
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
-#endif
 
 #if defined(CONFIG_PCI_MSI)
 #if defined(CONFIG_PCI_XEN)
diff --git a/arch/x86/pci/xen.c b/arch/x86/pci/xen.c
index 5debe4ac6f81..12da00558631 100644
--- a/arch/x86/pci/xen.c
+++ b/arch/x86/pci/xen.c
@@ -23,6 +23,7 @@
 
 #include <xen/features.h>
 #include <xen/events.h>
+#include <xen/pci.h>
 #include <asm/xen/pci.h>
 #include <asm/xen/cpuid.h>
 #include <asm/apic.h>
@@ -585,78 +586,3 @@ int __init pci_xen_initial_domain(void)
 }
 #endif
 
-#ifdef CONFIG_XEN_DOM0
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
-#endif /* CONFIG_XEN_DOM0 */
diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
index 1b2c3aca6887..a1b11c62da9e 100644
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -181,10 +181,34 @@ config SWIOTLB_XEN
 	select DMA_OPS
 	select SWIOTLB
 
+config XEN_PCI_STUB
+	bool
+
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
 	depends on XEN_BACKEND
+	select XEN_PCI_STUB
 	default m
 	help
 	  The PCI device backend driver allows the kernel to export arbitrary
diff --git a/drivers/xen/Makefile b/drivers/xen/Makefile
index 3434593455b2..5aae66e638a7 100644
--- a/drivers/xen/Makefile
+++ b/drivers/xen/Makefile
@@ -24,7 +24,7 @@ obj-$(CONFIG_XEN_SYS_HYPERVISOR)	+= sys-hypervisor.o
 obj-$(CONFIG_XEN_PVHVM_GUEST)		+= platform-pci.o
 obj-$(CONFIG_SWIOTLB_XEN)		+= swiotlb-xen.o
 obj-$(CONFIG_XEN_MCE_LOG)		+= mcelog.o
-obj-$(CONFIG_XEN_PCIDEV_BACKEND)	+= xen-pciback/
+obj-$(CONFIG_XEN_PCI_STUB)	        += xen-pciback/
 obj-$(CONFIG_XEN_PRIVCMD)		+= xen-privcmd.o
 obj-$(CONFIG_XEN_ACPI_PROCESSOR)	+= xen-acpi-processor.o
 obj-$(CONFIG_XEN_EFI)			+= efi.o
diff --git a/drivers/xen/pci.c b/drivers/xen/pci.c
index 224df03ce42e..2c890f4f2cbc 100644
--- a/drivers/xen/pci.c
+++ b/drivers/xen/pci.c
@@ -8,6 +8,7 @@
 #include <linux/pci.h>
 #include <linux/acpi.h>
 #include <linux/pci-acpi.h>
+#include <xen/pci.h>
 #include <xen/xen.h>
 #include <xen/interface/physdev.h>
 #include <xen/interface/xen.h>
@@ -254,3 +255,78 @@ static int xen_mcfg_late(void)
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
diff --git a/drivers/xen/xen-pciback/Makefile b/drivers/xen/xen-pciback/Makefile
index e8d981d43235..d63df09de81c 100644
--- a/drivers/xen/xen-pciback/Makefile
+++ b/drivers/xen/xen-pciback/Makefile
@@ -1,5 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0
+
+# N.B. The below cannot be expressed with a single line using
+# CONFIG_XEN_PCI_STUB as it always remains in "y" state,
+# thus preventing the driver to be built as a module.
+# Please note, that CONFIG_XEN_PCIDEV_BACKEND and
+# CONFIG_XEN_PCIDEV_STUB are mutually exclusive.
 obj-$(CONFIG_XEN_PCIDEV_BACKEND) += xen-pciback.o
+obj-$(CONFIG_XEN_PCIDEV_STUB) += xen-pciback.o
 
 xen-pciback-y := pci_stub.o pciback_ops.o xenbus.o
 xen-pciback-y += conf_space.o conf_space_header.o \
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
diff --git a/drivers/xen/xen-pciback/pciback.h b/drivers/xen/xen-pciback/pciback.h
index 95e28ee48d52..9a64196e831d 100644
--- a/drivers/xen/xen-pciback/pciback.h
+++ b/drivers/xen/xen-pciback/pciback.h
@@ -71,6 +71,11 @@ struct pci_dev *pcistub_get_pci_dev(struct xen_pcibk_device *pdev,
 				    struct pci_dev *dev);
 void pcistub_put_pci_dev(struct pci_dev *dev);
 
+static inline bool xen_pcibk_pv_support(void)
+{
+	return IS_ENABLED(CONFIG_XEN_PCIDEV_BACKEND);
+}
+
 /* Ensure a device is turned off or reset */
 void xen_pcibk_reset_device(struct pci_dev *pdev);
 
diff --git a/drivers/xen/xen-pciback/xenbus.c b/drivers/xen/xen-pciback/xenbus.c
index c09c7ebd6968..bde63ef677b8 100644
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
@@ -743,6 +743,9 @@ const struct xen_pcibk_backend *__read_mostly xen_pcibk_backend;
 
 int __init xen_pcibk_xenbus_register(void)
 {
+	if (!xen_pcibk_pv_support())
+		return 0;
+
 	xen_pcibk_backend = &xen_pcibk_vpci_backend;
 	if (passthrough)
 		xen_pcibk_backend = &xen_pcibk_passthrough_backend;
@@ -752,5 +755,6 @@ int __init xen_pcibk_xenbus_register(void)
 
 void __exit xen_pcibk_xenbus_unregister(void)
 {
-	xenbus_unregister_driver(&xen_pcibk_driver);
+	if (xen_pcibk_pv_support())
+		xenbus_unregister_driver(&xen_pcibk_driver);
 }
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


