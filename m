Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B59AC41D4E5
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 09:57:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199537.353716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqwK-0007aB-C8; Thu, 30 Sep 2021 07:57:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199537.353716; Thu, 30 Sep 2021 07:57:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqwK-0007Xb-7x; Thu, 30 Sep 2021 07:57:12 +0000
Received: by outflank-mailman (input) for mailman id 199537;
 Thu, 30 Sep 2021 07:57:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OAwA=OU=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mVqsc-00017f-6R
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 07:53:22 +0000
Received: from mail-lf1-x12d.google.com (unknown [2a00:1450:4864:20::12d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 15844ac1-baf8-4ff5-8fba-69a9900d443d;
 Thu, 30 Sep 2021 07:52:36 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id y26so21641542lfa.11
 for <xen-devel@lists.xenproject.org>; Thu, 30 Sep 2021 00:52:36 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id 13sm251099ljf.51.2021.09.30.00.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 00:52:35 -0700 (PDT)
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
X-Inumbo-ID: 15844ac1-baf8-4ff5-8fba-69a9900d443d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IvOUvJEBvxetANJzBoBgBMczs7Ntkr0TVyDjFYQuZ/M=;
        b=VoB77MfqKEQnQtKp+lPWH1kg+gpqtdmADxdUy6EQRGw1QG6Bpabmz8yFGEsugn5XlN
         XAyQBFqu7TT4/qCP8RqsLPEGtUuyM53MQx37PL4X84E1UzWXD+zf3bN4anHofgQL+eoE
         4tL7ybx5OYRjtT8cztLSwMusaE9J+8JXxD0e0+UtX7O2lzWOnfAYbkHwWjtKM/FRSS22
         lwsQBCEKwhKyG8yWEEiT7JG4LMyllM/1Mr8/vmGhABarplV3lAQgwhOjSX+qMAM0VQtD
         NjO9u7+bBSv0EMamA/xDsvtBA63G2LIIM4iyBYWhKAnIairyEVCZTYZHOhRXt38yyapX
         TX2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IvOUvJEBvxetANJzBoBgBMczs7Ntkr0TVyDjFYQuZ/M=;
        b=Tuynr6w9faHH7FgeePdyYoqCMHRZIYjSwVc/L2DeZPGRhjViB56NYBAQO957QEy8I+
         Qiboaxdm02HK7owR9z2n8empcW70+uI4W1tIuAt9LrQqD1H35yIMoDriN4D+oTj/QZsH
         3Yq157SF145aYjVCqxEQC/QZ68CM8FJ69k/P4/WZZXc9YVxWsa0fPjNs6zaqxP6ymOcc
         SYOZ8Uw2f6veqYdemmbVROZ0rxrNCr90iICM0jr9yHA1d324MXOy7xWdteHw5RxTprrR
         o5a51RIDO4OwW3/VPZmt1/bfC34sVpt2UKVSPvuhQmgqAvQBXMfFDoQz71PtD5u4idiQ
         xBYw==
X-Gm-Message-State: AOAM533fDSe/9837sIXbggKgQL0KGLdLttcJBEIGjaKupYd0/CFpARrL
	PwgRJd5UGzNT4vzX/XBSfrFdXIsVqg0=
X-Google-Smtp-Source: ABdhPJzHAYn0FeIUINVCTCrJ6p1OupRcFNPn66qoht+4Rh+LnDfq3NvAUqoEvvgCWqQcD7851GTPEw==
X-Received: by 2002:a19:f515:: with SMTP id j21mr4274651lfb.125.1632988355472;
        Thu, 30 Sep 2021 00:52:35 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v3 10/11] vpci: Add initial support for virtual PCI bus topology
Date: Thu, 30 Sep 2021 10:52:22 +0300
Message-Id: <20210930075223.860329-11-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210930075223.860329-1-andr2000@gmail.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Assign SBDF to the PCI devices being passed through with bus 0.
The resulting topology is where PCIe devices reside on the bus 0 of the
root complex itself (embedded endpoints).
This implementation is limited to 32 devices which are allowed on
a single PCI bus.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

---
Since v2:
 - remove casts that are (a) malformed and (b) unnecessary
 - add new line for better readability
 - remove CONFIG_HAS_VPCI_GUEST_SUPPORT ifdef's as the relevant vPCI
    functions are now completely gated with this config
 - gate common code with CONFIG_HAS_VPCI_GUEST_SUPPORT
New in v2
---
 xen/common/domain.c           |  3 ++
 xen/drivers/passthrough/pci.c | 60 +++++++++++++++++++++++++++++++++++
 xen/drivers/vpci/vpci.c       | 14 +++++++-
 xen/include/xen/pci.h         | 22 +++++++++++++
 xen/include/xen/sched.h       |  8 +++++
 5 files changed, 106 insertions(+), 1 deletion(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 40d67ec34232..e0170087612d 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -601,6 +601,9 @@ struct domain *domain_create(domid_t domid,
 
 #ifdef CONFIG_HAS_PCI
     INIT_LIST_HEAD(&d->pdev_list);
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+    INIT_LIST_HEAD(&d->vdev_list);
+#endif
 #endif
 
     /* All error paths can depend on the above setup. */
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 805ab86ed555..5b963d75d1ba 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -831,6 +831,66 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
     return ret;
 }
 
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+static struct vpci_dev *pci_find_virtual_device(const struct domain *d,
+                                                const struct pci_dev *pdev)
+{
+    struct vpci_dev *vdev;
+
+    list_for_each_entry ( vdev, &d->vdev_list, list )
+        if ( vdev->pdev == pdev )
+            return vdev;
+    return NULL;
+}
+
+int pci_add_virtual_device(struct domain *d, const struct pci_dev *pdev)
+{
+    struct vpci_dev *vdev;
+
+    ASSERT(!pci_find_virtual_device(d, pdev));
+
+    /* Each PCI bus supports 32 devices/slots at max. */
+    if ( d->vpci_dev_next > 31 )
+        return -ENOSPC;
+
+    vdev = xzalloc(struct vpci_dev);
+    if ( !vdev )
+        return -ENOMEM;
+
+    /* We emulate a single host bridge for the guest, so segment is always 0. */
+    vdev->seg = 0;
+
+    /*
+     * The bus number is set to 0, so virtual devices are seen
+     * as embedded endpoints behind the root complex.
+     */
+    vdev->bus = 0;
+    vdev->devfn = PCI_DEVFN(d->vpci_dev_next++, 0);
+
+    vdev->pdev = pdev;
+    vdev->domain = d;
+
+    pcidevs_lock();
+    list_add_tail(&vdev->list, &d->vdev_list);
+    pcidevs_unlock();
+
+    return 0;
+}
+
+int pci_remove_virtual_device(struct domain *d, const struct pci_dev *pdev)
+{
+    struct vpci_dev *vdev;
+
+    pcidevs_lock();
+    vdev = pci_find_virtual_device(d, pdev);
+    if ( vdev )
+        list_del(&vdev->list);
+    pcidevs_unlock();
+    xfree(vdev);
+    return 0;
+}
+#endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
+
 /* Caller should hold the pcidevs_lock */
 static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
                            uint8_t devfn)
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 702f7b5d5dda..d787f13e679e 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -91,20 +91,32 @@ int __hwdom_init vpci_add_handlers(struct pci_dev *pdev)
 /* Notify vPCI that device is assigned to guest. */
 int vpci_assign_device(struct domain *d, const struct pci_dev *dev)
 {
+    int rc;
+
     /* It only makes sense to assign for hwdom or guest domain. */
     if ( is_system_domain(d) || !has_vpci(d) )
         return 0;
 
-    return vpci_bar_add_handlers(d, dev);
+    rc = vpci_bar_add_handlers(d, dev);
+    if ( rc )
+        return rc;
+
+    return pci_add_virtual_device(d, dev);
 }
 
 /* Notify vPCI that device is de-assigned from guest. */
 int vpci_deassign_device(struct domain *d, const struct pci_dev *dev)
 {
+    int rc;
+
     /* It only makes sense to de-assign from hwdom or guest domain. */
     if ( is_system_domain(d) || !has_vpci(d) )
         return 0;
 
+    rc = pci_remove_virtual_device(d, dev);
+    if ( rc )
+        return rc;
+
     return vpci_bar_remove_handlers(d, dev);
 }
 #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index 43b8a0817076..33033a3a8f8d 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -137,6 +137,24 @@ struct pci_dev {
     struct vpci *vpci;
 };
 
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+struct vpci_dev {
+    struct list_head list;
+    /* Physical PCI device this virtual device is connected to. */
+    const struct pci_dev *pdev;
+    /* Virtual SBDF of the device. */
+    union {
+        struct {
+            uint8_t devfn;
+            uint8_t bus;
+            uint16_t seg;
+        };
+        pci_sbdf_t sbdf;
+    };
+    struct domain *domain;
+};
+#endif
+
 #define for_each_pdev(domain, pdev) \
     list_for_each_entry(pdev, &(domain)->pdev_list, domain_list)
 
@@ -167,6 +185,10 @@ const unsigned long *pci_get_ro_map(u16 seg);
 int pci_add_device(u16 seg, u8 bus, u8 devfn,
                    const struct pci_dev_info *, nodeid_t node);
 int pci_remove_device(u16 seg, u8 bus, u8 devfn);
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+int pci_add_virtual_device(struct domain *d, const struct pci_dev *pdev);
+int pci_remove_virtual_device(struct domain *d, const struct pci_dev *pdev);
+#endif
 int pci_ro_device(int seg, int bus, int devfn);
 int pci_hide_device(unsigned int seg, unsigned int bus, unsigned int devfn);
 struct pci_dev *pci_get_pdev(int seg, int bus, int devfn);
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 28146ee404e6..ecdb04b4f7fc 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -444,6 +444,14 @@ struct domain
 
 #ifdef CONFIG_HAS_PCI
     struct list_head pdev_list;
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+    struct list_head vdev_list;
+    /*
+     * Current device number used by the virtual PCI bus topology
+     * to assign a unique SBDF to a passed through virtual PCI device.
+     */
+    int vpci_dev_next;
+#endif
 #endif
 
 #ifdef CONFIG_HAS_PASSTHROUGH
-- 
2.25.1


