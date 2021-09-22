Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6FF4145F0
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 12:14:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192410.342838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSzGr-0003k7-R9; Wed, 22 Sep 2021 10:14:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192410.342838; Wed, 22 Sep 2021 10:14:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSzGr-0003hc-N0; Wed, 22 Sep 2021 10:14:33 +0000
Received: by outflank-mailman (input) for mailman id 192410;
 Wed, 22 Sep 2021 10:14:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X8t8=OM=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mSzGq-0003Qi-TU
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 10:14:32 +0000
Received: from mail-lf1-x131.google.com (unknown [2a00:1450:4864:20::131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2921a4ad-ee42-4ba1-9b79-4d81487bfd60;
 Wed, 22 Sep 2021 10:14:27 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id u18so9615082lfd.12
 for <xen-devel@lists.xenproject.org>; Wed, 22 Sep 2021 03:14:27 -0700 (PDT)
Received: from a2klaptop.epam.com (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id k22sm184211ljm.18.2021.09.22.03.14.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 03:14:25 -0700 (PDT)
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
X-Inumbo-ID: 2921a4ad-ee42-4ba1-9b79-4d81487bfd60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S7YpcnCy6xLh/G7NWgBXppr94/jTIZ707mYLR+adzZ8=;
        b=MDb9bj+gV09rJeEKWwfvQ8F7islMHLhb2Zr1D7kZc7sP8kkdgMOggtYc3qWGwo9Eh6
         qMZQLSayzx1bD+4+fPjFwbIF0VJXuP5XqdJ9AkKF8oBameS5fS60pO5B8UFBl/pVsXx+
         CQnuUtkzfFIKGIIBjJZ1MeJ4XZKb0EeKi7HB4KP4vne0AQT8UYaKAzLpDEji52Io5mEr
         64P++MrKK7N0AFqKV8Y7yLVE6UVOqovI+eB+uiwXQLCUaB+E6OMDwNAe8e4mUKHfc/xj
         VbiULS1FPqJN9NzPVdXvE9hwEw1aPWK0qQ8WXnJh+hlgGaXHy5xzf0b41YGWOnuYDMtZ
         N2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S7YpcnCy6xLh/G7NWgBXppr94/jTIZ707mYLR+adzZ8=;
        b=FBpZPRE8TyKhrfuWQjb/SX8fD3Prn1e9uAcHIWZhVLEJhyd+dNZsr11WHoYcQJ5o2i
         s5KlLzHbuwhIksJnlCyKrKYiIvkyKut2F4gc3EbxxfyRIeMY/uRmdUR55g7T7MdTQGMN
         HFwwHbVMVKGyEfaCqcyoPAABOjgogrmD7rNZYT+7v7bLLkDTW1BeowrgRnV3d5cykchx
         HwHsv29MjeWe/l4yAqrXCLi5ytsPS54z4NJSZERTY93MNnJrz8fWKUKNVpRsdMA3vXP4
         u4c4yD8TQk5kysQp15fY6N+7Q7KDBNjvEdmQ7xKUIBMS1Gj3q6Drh14y5whe2uinmgbc
         cg7A==
X-Gm-Message-State: AOAM532TO2WFGh5WLWNgJhXj48SF1Q5XPxgzTLzdT6a56YF2WSaE/m8p
	rIl9wzU3XBvnV6PDaJXuKSQjyshUVrPZQA==
X-Google-Smtp-Source: ABdhPJzKS19pslQy4wS9JYyX5fy6N2+1K+GIKEJvBUgsxXAmj5HYIIECMdVwL2DivXpc15UuvD9uAA==
X-Received: by 2002:a05:6512:3ee:: with SMTP id n14mr27553556lfq.589.1632305666273;
        Wed, 22 Sep 2021 03:14:26 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: boris.ostrovsky@oracle.com,
	jgross@suse.com,
	julien@xen.org,
	sstabellini@kernel.org,
	jbeulich@suse.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH 2/2] xen-pciback: prepare for the split for stub and PV
Date: Wed, 22 Sep 2021 13:14:22 +0300
Message-Id: <20210922101422.2319240-2-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210922101422.2319240-1-andr2000@gmail.com>
References: <20210922101422.2319240-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Currently PCI backend implements multiple functionalities at a time.
To name a few:
1. it is used as a database for assignable PCI devices, e.g. xl
   pci-assignable-{add|remove|list} manipulates that list. So, whenever
   the toolstack needs to know which PCI devices can be passed through
   it reads that from the relevant sysfs entries of the pciback.
2. it is used to hold the unbound PCI devices list, e.g. when passing
   through a PCI device it needs to be unbound from the relevant device
   driver and bound to pciback (strictly speaking it is not required
   that the device is bound to pciback, but pciback is again used as a
   database of the passed through PCI devices, so we can re-bind the
   devices back to their original drivers when guest domain shuts down)
3. device reset for the devices being passed through
4. para-virtualized use-cases support

The para-virtualized part of the driver is not always needed as some
architectures, e.g. Arm or x86 PVH Dom0, are not using backend-frontend
model for PCI device passthrough. For such use-cases make the very
first step in splitting the xen-pciback driver into two parts: extended
PCI stub and PCI PV backend drivers. At the moment x86 platform will
continue using CONFIG_XEN_PCIDEV_BACKEND for the fully featured backend
driver and new platforms may build a driver with limited functionality
(no PV) by enabling CONFIG_XEN_PCIDEV_STUB.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

---
New in v2
---
 drivers/xen/Kconfig               | 26 +++++++++++++++++++++++++-
 drivers/xen/Makefile              |  2 +-
 drivers/xen/xen-pciback/Makefile  |  1 +
 drivers/xen/xen-pciback/pciback.h |  5 +++++
 drivers/xen/xen-pciback/xenbus.c  |  6 +++++-
 5 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
index 057ddf61ef61..6e92c6be19f1 100644
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -180,10 +180,34 @@ config SWIOTLB_XEN
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
-	depends on PCI && XEN
+	depends on PCI && X86 && XEN
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
diff --git a/drivers/xen/xen-pciback/Makefile b/drivers/xen/xen-pciback/Makefile
index e8d981d43235..e2cb376444a6 100644
--- a/drivers/xen/xen-pciback/Makefile
+++ b/drivers/xen/xen-pciback/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_XEN_PCIDEV_BACKEND) += xen-pciback.o
+obj-$(CONFIG_XEN_PCIDEV_STUB) += xen-pciback.o
 
 xen-pciback-y := pci_stub.o pciback_ops.o xenbus.o
 xen-pciback-y += conf_space.o conf_space_header.o \
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
index da34ce85dc88..bde63ef677b8 100644
--- a/drivers/xen/xen-pciback/xenbus.c
+++ b/drivers/xen/xen-pciback/xenbus.c
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
-- 
2.25.1


