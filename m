Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35856418F94
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 08:58:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196352.349155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUkaq-0001EG-Ee; Mon, 27 Sep 2021 06:58:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196352.349155; Mon, 27 Sep 2021 06:58:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUkaq-0001Bt-BY; Mon, 27 Sep 2021 06:58:28 +0000
Received: by outflank-mailman (input) for mailman id 196352;
 Mon, 27 Sep 2021 06:58:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pKXO=OR=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mUkao-0001Bm-TG
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 06:58:27 +0000
Received: from mail-lf1-x131.google.com (unknown [2a00:1450:4864:20::131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2aee7c6c-f13a-4068-9c2a-1443bd178401;
 Mon, 27 Sep 2021 06:58:25 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id i4so72878857lfv.4
 for <xen-devel@lists.xenproject.org>; Sun, 26 Sep 2021 23:58:25 -0700 (PDT)
Received: from a2klaptop.epam.com (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id t18sm1498351lfl.219.2021.09.26.23.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 23:58:23 -0700 (PDT)
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
X-Inumbo-ID: 2aee7c6c-f13a-4068-9c2a-1443bd178401
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=azoyT34yzw5FEZAw867wEMI2AGPZuHjULBEBEWOLTig=;
        b=Q4Nopw1q1uNPcyDa3BAy7fLMHBF/YqU9c/CWrCSShVgJJmqcNupvFahPWZAm7FNT4A
         ew0twYnzreXfX/7BvL/XDYu698vIb7W0h/hxgTLoTnXPvjrEpsAD+d8XDMCyL7L6qG1L
         1l0LwSoY1Bqt8VCWl1/pIpKLnwQf2+Hq9qX6ECydH8GGSPnvb1WwH8EKEQActWYHZ4Aj
         3yE/kPFBIaotCno/wt0bLQxzYS5i0tB2/oL/cRH7jX6OZ1MurO0WtrmUAjBHxusOpqhc
         Eoaub1gti6qpgA9qDMYiksLpBNjvHQSjmQqJe4EK+eH0KRfaYRmNcFUndwm0kt+GnlVS
         j5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=azoyT34yzw5FEZAw867wEMI2AGPZuHjULBEBEWOLTig=;
        b=3ntwNEKe3GqYBj6gDBsVvi9NSdrxUj8HqnhyyXck1y/g6x0AckEBGKEKQbdMMrHT2L
         SssxSCipotFTeGsGs03YxqvHJTP0WY7cV+bCMCMQVcEOtwJROopq2lMEHITbj9/qViXy
         kVuRX1PFqufKgCtPvHAeDXtMusXhcaa/oZ/MNgWk45XwasqfZGAMftolkX21A5ie7pdm
         6BMthLA99d9m9c9MR+Pc3k+PTOVj+tlAweWnNtwHbHA/HDgsVfItTAt4zxDm3BRao35L
         OM0qbxOHbFqEMaIbjXIFQCR2kfJf46aBih6ff+7O8xuFdAdOYDk0Ry1k6G3av0Rs8Fc9
         NcMQ==
X-Gm-Message-State: AOAM530Wax/EEGF0Hl2mz2hr7lozcJthtUmB1hMDSO4NIL/tX3bqF3D5
	okAHM1r8QTsEfDCbss2RyO5FpJIkjo5udQ==
X-Google-Smtp-Source: ABdhPJzWIN17tXgM6N/bt7MC6BQy3APMvXCiMcbgPs6xmHXFHnpkJI+ja20n13wTWFKVT3rW0DqbyA==
X-Received: by 2002:ac2:5d23:: with SMTP id i3mr17295747lfb.477.1632725904487;
        Sun, 26 Sep 2021 23:58:24 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: boris.ostrovsky@oracle.com,
	jgross@suse.com,
	julien@xen.org,
	sstabellini@kernel.org,
	jbeulich@suse.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v4 1/2] xen-pciback: prepare for the split for stub and PV
Date: Mon, 27 Sep 2021 09:58:21 +0300
Message-Id: <20210927065822.350973-1-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Currently PCI backend implements multiple functionalities at a time.
To name a few:
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
model for PCI device passthrough. For such use-cases make the very
first step in splitting the xen-pciback driver into two parts: Xen
PCI stub and PCI PV backend drivers.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

---
Changes since v3:
- Move CONFIG_XEN_PCIDEV_STUB to the second patch
Changes since v2:
 - swap the patch order
New in v2
---
 drivers/xen/Kconfig               | 4 ++++
 drivers/xen/Makefile              | 2 +-
 drivers/xen/xen-pciback/Makefile  | 1 +
 drivers/xen/xen-pciback/pciback.h | 5 +++++
 drivers/xen/xen-pciback/xenbus.c  | 6 +++++-
 5 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
index 22f5aff0c136..4efc95ddda41 100644
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -181,10 +181,14 @@ config SWIOTLB_XEN
 	select DMA_OPS
 	select SWIOTLB
 
+config XEN_PCI_STUB
+	bool
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
index c09c7ebd6968..f8ba2903a3ff 100644
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


