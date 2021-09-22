Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7305B4145F1
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 12:14:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192409.342827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSzGn-0003T3-JA; Wed, 22 Sep 2021 10:14:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192409.342827; Wed, 22 Sep 2021 10:14:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSzGn-0003Qo-Ea; Wed, 22 Sep 2021 10:14:29 +0000
Received: by outflank-mailman (input) for mailman id 192409;
 Wed, 22 Sep 2021 10:14:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X8t8=OM=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mSzGl-0003Qi-VW
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 10:14:28 +0000
Received: from mail-lf1-x133.google.com (unknown [2a00:1450:4864:20::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 81ceafab-3834-45af-a5ff-6eee1c3e1f38;
 Wed, 22 Sep 2021 10:14:26 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id e15so9685285lfr.10
 for <xen-devel@lists.xenproject.org>; Wed, 22 Sep 2021 03:14:26 -0700 (PDT)
Received: from a2klaptop.epam.com (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id k22sm184211ljm.18.2021.09.22.03.14.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 03:14:24 -0700 (PDT)
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
X-Inumbo-ID: 81ceafab-3834-45af-a5ff-6eee1c3e1f38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SvLayk7gLTLICLvUIqlFHN+Qd7wHHCUL73ogGPkKfx8=;
        b=dkrfcJFRtgM58BtsNkps8s/wg+2uBksUXZT7yMoNtS2Z7ULeyfkZ4w5Z4DEGDS8CqM
         qZDNTlKTqTfMUi3sz+S35Y6/nsbXQpGVWPkaBrrRvQ0BfCo1P0Iuw2KMLyiFQ5W7UQxi
         GLVSWFruCbLxZAWoD8Wg5K+pRM77JlbiSUuTjDIHpfVMOF0wfuhB5eYj9Uux96e0rQPe
         HhDSHZWqS1zOkWvLhvCAohmYlNGNI3roGCzGQ2ly8v5M1gSGPCbqnVSipAc6DXx6UdzN
         CfVzmKn654p7y4ejqoY6hn45KENIFY2FEa9usJqX2CCk7BLryqJgzPj3x8u4mw0glxAp
         pXnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SvLayk7gLTLICLvUIqlFHN+Qd7wHHCUL73ogGPkKfx8=;
        b=PXsDlah+msW6MuDytbAGLrTBf4bedjMUaCy0XyywTmxyS5Dr2H0cGU6gOas8pj2kRe
         ZF3CDzC8I9LtzZQUnsn72hYnc3blon7plWnpJVTUAVOhVasGOwicJ+YKjgGwANuSoG4O
         ebAQ/xMaNzFhdtUMx5whPMNMcWVAAPdRZdtsfOpCZNNeAjr563DnGoB+U257fijA/xtl
         aB2VKUVk61UOEwVneDVFRQMgMB4pzzPeVIyztm7qwkmv0ymCWKrhNpv0gyVUgDPh5GoT
         AuxyF0Y2OyiTVRVdLPVLvXsbrHzslyCi5g+MSxfBuX3lmTO0wGqlMESE7Ijx9Ple6STn
         BzBQ==
X-Gm-Message-State: AOAM530LrHWN9OENu5n50JD60qrnJCFecvk40NSloN4pr+UKN52cyivx
	4Xr6ZoHK+iTCdAgUpKAYwUV6oxlj270nUw==
X-Google-Smtp-Source: ABdhPJzEPEcaoU33JxJRvmxxIKFMw67F936g3tk7uJedNHMtFok0NvPUOOD9BNrp97mm81Fd5UBtoQ==
X-Received: by 2002:a2e:545a:: with SMTP id y26mr28468856ljd.225.1632305665218;
        Wed, 22 Sep 2021 03:14:25 -0700 (PDT)
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
Subject: [PATCH 1/2] xen-pciback: allow compiling on other archs than x86
Date: Wed, 22 Sep 2021 13:14:21 +0300
Message-Id: <20210922101422.2319240-1-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Xen-pciback driver was designed to be built for x86 only. But it
can also be used by other architectures, e.g. Arm.
Re-structure the driver in a way that it can be built for other
platforms as well.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>

---
Since v1:
 - Do not move pci_xen_initial_domain as it is x86 specific
---
 arch/x86/include/asm/xen/pci.h     | 18 +------
 arch/x86/pci/xen.c                 | 74 +----------------------------
 drivers/xen/Kconfig                |  2 +-
 drivers/xen/pci.c                  | 75 ++++++++++++++++++++++++++++++
 drivers/xen/xen-pciback/pci_stub.c |  3 +-
 drivers/xen/xen-pciback/xenbus.c   |  2 +-
 include/xen/pci.h                  | 28 +++++++++++
 7 files changed, 109 insertions(+), 93 deletions(-)
 create mode 100644 include/xen/pci.h

diff --git a/arch/x86/include/asm/xen/pci.h b/arch/x86/include/asm/xen/pci.h
index 3506d8c598c1..2889f091f459 100644
--- a/arch/x86/include/asm/xen/pci.h
+++ b/arch/x86/include/asm/xen/pci.h
@@ -16,26 +16,10 @@ static inline int pci_xen_hvm_init(void)
 #endif
 #if defined(CONFIG_XEN_DOM0)
 int __init pci_xen_initial_domain(void);
-int xen_find_device_domain_owner(struct pci_dev *dev);
-int xen_register_device_domain_owner(struct pci_dev *dev, uint16_t domain);
-int xen_unregister_device_domain_owner(struct pci_dev *dev);
 #else
 static inline int __init pci_xen_initial_domain(void)
 {
-	return -1;
-}
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
+       return -1;
 }
 #endif
 
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
index a37eb52fb401..057ddf61ef61 100644
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -182,7 +182,7 @@ config SWIOTLB_XEN
 
 config XEN_PCIDEV_BACKEND
 	tristate "Xen PCI-device backend driver"
-	depends on PCI && X86 && XEN
+	depends on PCI && XEN
 	depends on XEN_BACKEND
 	default m
 	help
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
index c09c7ebd6968..da34ce85dc88 100644
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


