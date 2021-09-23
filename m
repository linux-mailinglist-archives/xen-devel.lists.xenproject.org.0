Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4A2415F38
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 15:08:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194212.346033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTOSs-0004Xa-2e; Thu, 23 Sep 2021 13:08:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194212.346033; Thu, 23 Sep 2021 13:08:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTOSr-0004VD-Ui; Thu, 23 Sep 2021 13:08:37 +0000
Received: by outflank-mailman (input) for mailman id 194212;
 Thu, 23 Sep 2021 13:08:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JD/Q=ON=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mTOHu-0004it-7y
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:57:18 +0000
Received: from mail-lf1-x12e.google.com (unknown [2a00:1450:4864:20::12e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bf96aaab-a758-4d13-82cb-0f9b9f285ee2;
 Thu, 23 Sep 2021 12:55:16 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id b20so26425942lfv.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Sep 2021 05:55:16 -0700 (PDT)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id o12sm453010lft.254.2021.09.23.05.55.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 05:55:14 -0700 (PDT)
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
X-Inumbo-ID: bf96aaab-a758-4d13-82cb-0f9b9f285ee2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=01d6SaTi/ep3sxri+AlZsSZXy8XnKOJzH2RZEoLRhnE=;
        b=EWpEK98V3gn+BXUIniS4aeCA9MHYJ+uraGzPRHWI6TQV1B/vOoZeupB+37cr+IGN5l
         ecgShTHEtU2cFr68IVOvI7ZjrPH0mELx7q5M2RfFA8RxYf62iGZGZgB4d9huCMUKwJfI
         rGF75wr4M7zdy8Vi/3omiimpqMmoiPB++DcA182+C+cCOS5SNWsaGte1VMc4ISIdMYeU
         rvNSAtt5UvAYcglcHlgkOy6E/D+dEtx4joYE3SnnrHq3wzNfOPDbQQ5ep1vQAXvSRdWv
         ZwRm1UayVuL8hQeFccvHM3BPFjlSdpDw6ZPFeeWU6FplECWsRyCoua3q5zY1abpy29BS
         TyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=01d6SaTi/ep3sxri+AlZsSZXy8XnKOJzH2RZEoLRhnE=;
        b=nlcDXV1u1cnc+4YFn2ba3tN+MGMyo7eUUp1AuyM5rohwKnRgY+7oW0X6RtD5eUJ7+e
         AqYMP9BBVaOlTKaGkRt4R54QFKzSbbNwPwpicQTodRd7BiSTQXxLV5kzi8lpDOm6qwkQ
         ye4PgQrSTQHy5gaIOcl/x+3T3bQi75+LN/sx/Ug7N1k8u6vrZ/mH1FbfnKjfcOx3Xfzx
         Fb5FwOgfOUnzqqAtUPZTyHdzcWB3sWimRMyKFLrSSLZrk/sAeVS1mm0kTRfM2kG4D+hx
         EQtoqiFas0VSEZSQqJBoWg5wSrk/+sAqHLBv5mWR5pZMJoQtcyDXc43gDsYdbIAPJnt4
         K88w==
X-Gm-Message-State: AOAM530ziUhSgaeuaJ6B9MN3eXhcEwn5DSVjiDSnr4jS0ZrYc0ctve/1
	zZt8XsdKY4miS6JmE6ymVZBk41ACHtlJ2g==
X-Google-Smtp-Source: ABdhPJx3puHxJXs6dd2LzzWCWWYJzbY4YRnuivwUaxA1/mtGOwJpGs6ZnDTtx7CE1RfoyWW9sphKRw==
X-Received: by 2002:a2e:6e08:: with SMTP id j8mr4786466ljc.247.1632401715286;
        Thu, 23 Sep 2021 05:55:15 -0700 (PDT)
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
Subject: [PATCH v2 10/11] vpci: Add initial support for virtual PCI bus topology
Date: Thu, 23 Sep 2021 15:55:00 +0300
Message-Id: <20210923125501.234252-11-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923125501.234252-1-andr2000@gmail.com>
References: <20210923125501.234252-1-andr2000@gmail.com>
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
New in v2
---
 xen/common/domain.c           |  1 +
 xen/drivers/passthrough/pci.c | 57 +++++++++++++++++++++++++++++++++++
 xen/drivers/vpci/vpci.c       | 18 +++++++++--
 xen/include/xen/pci.h         | 18 +++++++++++
 xen/include/xen/sched.h       |  6 ++++
 5 files changed, 97 insertions(+), 3 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 40d67ec34232..b80ff2e5e2e6 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -601,6 +601,7 @@ struct domain *domain_create(domid_t domid,
 
 #ifdef CONFIG_HAS_PCI
     INIT_LIST_HEAD(&d->pdev_list);
+    INIT_LIST_HEAD(&d->vdev_list);
 #endif
 
     /* All error paths can depend on the above setup. */
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index e1da283d73ad..4552ace855e0 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -833,6 +833,63 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
     return ret;
 }
 
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
+    *(u16*) &vdev->seg = 0;
+    /*
+     * The bus number is set to 0, so virtual devices are seen
+     * as embedded endpoints behind the root complex.
+     */
+    *((u8*) &vdev->bus) = 0;
+    *((u8*) &vdev->devfn) = PCI_DEVFN(d->vpci_dev_next++, 0);
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
+
 /* Caller should hold the pcidevs_lock */
 static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
                            uint8_t devfn)
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 0cdc0c3f75c4..a40a138a14f7 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -90,24 +90,36 @@ int __hwdom_init vpci_add_handlers(struct pci_dev *pdev)
 /* Notify vPCI that device is assigned to guest. */
 int vpci_assign_device(struct domain *d, const struct pci_dev *dev)
 {
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+    int rc;
+#endif
+
     /* It only makes sense to assign for hwdom or guest domain. */
     if ( is_system_domain(d) || !has_vpci(d) )
         return 0;
 
 #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
-    return vpci_bar_add_handlers(d, dev);
-#else
-    return 0;
+    rc = vpci_bar_add_handlers(d, dev);
+    if ( rc )
+        return rc;
 #endif
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
 #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
     return vpci_bar_remove_handlers(d, dev);
 #else
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index 2b2dfb6f1b49..35ae1d093921 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -136,6 +136,22 @@ struct pci_dev {
     struct vpci *vpci;
 };
 
+struct vpci_dev {
+    struct list_head list;
+    /* Physical PCI device this virtual device is connected to. */
+    const struct pci_dev *pdev;
+    /* Virtual SBDF of the device. */
+    const union {
+        struct {
+            uint8_t devfn;
+            uint8_t bus;
+            uint16_t seg;
+        };
+        pci_sbdf_t sbdf;
+    };
+    struct domain *domain;
+};
+
 #define for_each_pdev(domain, pdev) \
     list_for_each_entry(pdev, &(domain)->pdev_list, domain_list)
 
@@ -165,7 +181,9 @@ int pci_add_segment(u16 seg);
 const unsigned long *pci_get_ro_map(u16 seg);
 int pci_add_device(u16 seg, u8 bus, u8 devfn,
                    const struct pci_dev_info *, nodeid_t node);
+int pci_add_virtual_device(struct domain *d, const struct pci_dev *pdev);
 int pci_remove_device(u16 seg, u8 bus, u8 devfn);
+int pci_remove_virtual_device(struct domain *d, const struct pci_dev *pdev);
 int pci_ro_device(int seg, int bus, int devfn);
 int pci_hide_device(unsigned int seg, unsigned int bus, unsigned int devfn);
 struct pci_dev *pci_get_pdev(int seg, int bus, int devfn);
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 28146ee404e6..d304c7ebe766 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -444,6 +444,12 @@ struct domain
 
 #ifdef CONFIG_HAS_PCI
     struct list_head pdev_list;
+    struct list_head vdev_list;
+    /*
+     * Current device number used by the virtual PCI bus topology
+     * to assign a unique SBDF to a passed through virtual PCI device.
+     */
+    int vpci_dev_next;
 #endif
 
 #ifdef CONFIG_HAS_PASSTHROUGH
-- 
2.25.1


