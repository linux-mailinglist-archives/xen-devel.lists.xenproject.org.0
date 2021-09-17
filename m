Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3209540F8A7
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 15:01:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189378.339047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRDUm-0008Kc-0D; Fri, 17 Sep 2021 13:01:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189378.339047; Fri, 17 Sep 2021 13:01:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRDUl-0008HP-TY; Fri, 17 Sep 2021 13:01:35 +0000
Received: by outflank-mailman (input) for mailman id 189378;
 Fri, 17 Sep 2021 13:01:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wkJT=OH=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mRDUk-0008HJ-LM
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 13:01:34 +0000
Received: from mail-lf1-x134.google.com (unknown [2a00:1450:4864:20::134])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b639384-70fb-4b3f-ba95-c3536fe5a9e2;
 Fri, 17 Sep 2021 13:01:33 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id b15so14135591lfe.7
 for <xen-devel@lists.xenproject.org>; Fri, 17 Sep 2021 06:01:33 -0700 (PDT)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id y14sm695484ljm.39.2021.09.17.06.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 06:01:25 -0700 (PDT)
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
X-Inumbo-ID: 1b639384-70fb-4b3f-ba95-c3536fe5a9e2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nOUOG75GOz571OX8ITuOEpvSRHg2zXkMyJh97BY3RUY=;
        b=DVleVrCvRAdqZp/yPatEk2JqDQdaCKPV9hMsJSSPCFvPJISePzzWa1fFVmSDK1kOSN
         HFnXNvK5yZkZKMBnLx7wvAnaenTIDGX+D5BBcT6f3Tkvt94WxReAAvpyt+33Xk1wbWcZ
         +9UMsH9pH9VW2JbRgJ0yOUq76NKVQbWOrDwizNp3L7vBUKg946XYIhg6q3vkKUuRWOV9
         a4Wcm6Wcw2a331LlEt2w22YGNIVJEhzato59jlml/xrk0txWGTigockGiwIpb0FL9STt
         t2rk0+HI11YBMYieGy2HZKw8yoadOCM9rSbc/N8GIeh5mjT+SgN2KTinZiTPniMBHthj
         cw1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nOUOG75GOz571OX8ITuOEpvSRHg2zXkMyJh97BY3RUY=;
        b=NAdOt/EnYA+H0DWJJqIcMdDHySiQxiGDi9C7ubQ+KvDR4nNluXpn60PuOOEF7iqtBn
         B4fVH+OF3+Hbv/OOkQIpT9CGqF/HMhrrl+bTv1iB35aDfqm7nsHx5g4BUV6/rwYR88xG
         hXc4IExmcYRs2M+JdFtg/HSViG2uEi/OGS992xa5Xdvd4Xwe7Op5svQYoC/CI5zTgqlf
         TZDdiJv2TRmdugYJsZ3k7U9KAf8pa8VdyybOKypolR8anBVEKlnj4ug2hfTxXhG9+w3l
         zYV6ogPZV6CIs/R9SSIZm6BvDY/fZnRxrcDACGnwmeilemAgpu4uVPMMuCPpYliBTE+M
         8dTQ==
X-Gm-Message-State: AOAM531Epfu3leHcNBcC2j4SFIdSZDEPC4gUIzmP3r4vf7DrniE6Upn6
	4xvBXeqJNhA8qk1ntwYbDOY3rZlgXQouDA==
X-Google-Smtp-Source: ABdhPJxvPqjCvYrNlgvVOuQYRuzxkAEBoERlUud1NqfPmVJFcqleK6VZh409vbqQY0ZNiqLipkcD8Q==
X-Received: by 2002:a2e:a37a:: with SMTP id i26mr9180044ljn.466.1631883686553;
        Fri, 17 Sep 2021 06:01:26 -0700 (PDT)
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
Subject: [PATCH] xen-pciback: allow compiling on other archs than x86
Date: Fri, 17 Sep 2021 16:01:23 +0300
Message-Id: <20210917130123.1764493-1-andr2000@gmail.com>
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
Tested on Arm and x86.
---
 arch/x86/include/asm/xen/pci.h     | 24 ----------
 arch/x86/pci/xen.c                 | 74 +----------------------------
 drivers/xen/Kconfig                |  2 +-
 drivers/xen/events/events_base.c   |  1 +
 drivers/xen/pci.c                  | 75 ++++++++++++++++++++++++++++++
 drivers/xen/xen-pciback/pci_stub.c |  3 +-
 drivers/xen/xen-pciback/xenbus.c   |  2 +-
 include/xen/pci.h                  | 34 ++++++++++++++
 8 files changed, 115 insertions(+), 100 deletions(-)
 create mode 100644 include/xen/pci.h

diff --git a/arch/x86/include/asm/xen/pci.h b/arch/x86/include/asm/xen/pci.h
index 3506d8c598c1..9ff7b49bca08 100644
--- a/arch/x86/include/asm/xen/pci.h
+++ b/arch/x86/include/asm/xen/pci.h
@@ -14,30 +14,6 @@ static inline int pci_xen_hvm_init(void)
 	return -1;
 }
 #endif
-#if defined(CONFIG_XEN_DOM0)
-int __init pci_xen_initial_domain(void);
-int xen_find_device_domain_owner(struct pci_dev *dev);
-int xen_register_device_domain_owner(struct pci_dev *dev, uint16_t domain);
-int xen_unregister_device_domain_owner(struct pci_dev *dev);
-#else
-static inline int __init pci_xen_initial_domain(void)
-{
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
-}
-#endif
 
 #if defined(CONFIG_PCI_MSI)
 #if defined(CONFIG_PCI_XEN)
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
diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index a78704ae3618..35493ff0d146 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -65,6 +65,7 @@
 #include <xen/interface/vcpu.h>
 #include <xen/xenbus.h>
 #include <asm/hw_irq.h>
+#include <xen/pci.h>
 
 #include "events_internal.h"
 
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
index 000000000000..5c988d5ff38f
--- /dev/null
+++ b/include/xen/pci.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __XEN_PCI_H__
+#define __XEN_PCI_H__
+
+#if defined(CONFIG_XEN_DOM0)
+int __init pci_xen_initial_domain(void);
+int xen_find_device_domain_owner(struct pci_dev *dev);
+int xen_register_device_domain_owner(struct pci_dev *dev, uint16_t domain);
+int xen_unregister_device_domain_owner(struct pci_dev *dev);
+#else
+static inline int __init pci_xen_initial_domain(void)
+{
+	return -1;
+}
+
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


