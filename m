Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DC757A5A0
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 19:43:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370807.602765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDrFj-0008S3-Nw; Tue, 19 Jul 2022 17:43:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370807.602765; Tue, 19 Jul 2022 17:43:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDrFj-0008ID-Ec; Tue, 19 Jul 2022 17:43:23 +0000
Received: by outflank-mailman (input) for mailman id 370807;
 Tue, 19 Jul 2022 17:43:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D6sG=XY=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oDrFh-00065X-Em
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 17:43:21 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 478036d2-078a-11ed-924f-1f966e50362f;
 Tue, 19 Jul 2022 19:43:20 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id m16so20604833edb.11
 for <xen-devel@lists.xenproject.org>; Tue, 19 Jul 2022 10:43:20 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 wj18-20020a170907051200b0072af92fa086sm6903268ejb.32.2022.07.19.10.43.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 10:43:19 -0700 (PDT)
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
X-Inumbo-ID: 478036d2-078a-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rMoBmnl3ZpBTv1UmtiTdiuto4NAuEX1ahKih6uEYEJw=;
        b=j+R/OvzbEZtIhpUEhIGWc3q1bbZHYp0Ul+K4Dz37jhZz1+6vh8PCxAdE6dTmaGXtW6
         AVnPLavEd7Syclorws2JcUeO0Ym2q9+9XlivFihN3LffQaeuDEQZcQuLS3PhI8c3e0M8
         H5d8biejz0cHioAeGCZa0kcBFxN6ksKnK8+XWSKEeS/l4Cqv9N4V7/f6qbhg629nMOnw
         rEOKgkL+i552j3dW2PRr0/3H69bdD2k/vTwnLDG49dNpkqLKW+ac3A6SNOchhs6cCtVK
         MXNTUs9RN9Ubp8B9PbOMfDTxeUqgEOhqONELTgmT+axiBQMnvZvssNO2OpyaF6kTEi/y
         r7Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rMoBmnl3ZpBTv1UmtiTdiuto4NAuEX1ahKih6uEYEJw=;
        b=5dyBaKsu0MYfAYICVh/9ljA9TidTryulC0zAlKibiN4Jtv/iZd2vtecXdUO1bZFb4s
         cLSWIjqUEo1AJzzhzzZrzJV5uIOnqX4sIrwTWuhpuMau7rinA9gSe4f8heCMZECpUnSo
         oeff1Zl1X3c+n0LilhRkBNU1mTtxg9WkGd96bwDqS2c6ASgDhg2j++zXIHc6g28buszI
         1gF2e0S2EX2y7Bxn/ygVFDuGG7MW3VGpKxcLrCVjXwv/W7wVk8MkF0YOXk3/H9Z5rram
         fllaNCc49P42kmpOIxDYcaE9F8dhjMbPl1nfg0dVLi4mMWnFASxobpWgtRsncWmZkZ4i
         9gsg==
X-Gm-Message-State: AJIora8gcIF0U8o3ZWD8XBZ7AIqgPoi+XEI9jDImLyIPHwzp+CS5fTD1
	w5UUc7/KbrcdSSKm5a3CTfXFDeF9ylUWtw==
X-Google-Smtp-Source: AGRyM1vwWKS94qRtIYCQT74pZ5Yf4pcr8nEvoMGSizTcpXdveRMSImguFS8MGQrIxdv0ZUQ8RxYMAg==
X-Received: by 2002:a05:6402:26c3:b0:43a:a846:b2c1 with SMTP id x3-20020a05640226c300b0043aa846b2c1mr45920791edd.133.1658252599786;
        Tue, 19 Jul 2022 10:43:19 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH V7 09/11] vpci: add initial support for virtual PCI bus topology
Date: Tue, 19 Jul 2022 20:42:51 +0300
Message-Id: <20220719174253.541965-10-olekstysh@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220719174253.541965-1-olekstysh@gmail.com>
References: <20220719174253.541965-1-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Assign SBDF to the PCI devices being passed through with bus 0.
The resulting topology is where PCIe devices reside on the bus 0 of the
root complex itself (embedded endpoints).
This implementation is limited to 32 devices which are allowed on
a single PCI bus.

Please note, that at the moment only function 0 of a multifunction
device can be passed through.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
Since v6:
- re-work wrt new locking scheme
- OT: add ASSERT(pcidevs_write_locked()); to add_virtual_device()
Since v5:
- s/vpci_add_virtual_device/add_virtual_device and make it static
- call add_virtual_device from vpci_assign_device and do not use
  REGISTER_VPCI_INIT machinery
- add pcidevs_locked ASSERT
- use DECLARE_BITMAP for vpci_dev_assigned_map
Since v4:
- moved and re-worked guest sbdf initializers
- s/set_bit/__set_bit
- s/clear_bit/__clear_bit
- minor comment fix s/Virtual/Guest/
- added VPCI_MAX_VIRT_DEV constant (PCI_SLOT(~0) + 1) which will be used
  later for counting the number of MMIO handlers required for a guest
  (Julien)
Since v3:
 - make use of VPCI_INIT
 - moved all new code to vpci.c which belongs to it
 - changed open-coded 31 to PCI_SLOT(~0)
 - added comments and code to reject multifunction devices with
   functions other than 0
 - updated comment about vpci_dev_next and made it unsigned int
 - implement roll back in case of error while assigning/deassigning devices
 - s/dom%pd/%pd
Since v2:
 - remove casts that are (a) malformed and (b) unnecessary
 - add new line for better readability
 - remove CONFIG_HAS_VPCI_GUEST_SUPPORT ifdef's as the relevant vPCI
    functions are now completely gated with this config
 - gate common code with CONFIG_HAS_VPCI_GUEST_SUPPORT
New in v2
---
 xen/drivers/vpci/vpci.c | 70 ++++++++++++++++++++++++++++++++++++++++-
 xen/include/xen/sched.h |  8 +++++
 xen/include/xen/vpci.h  | 11 +++++++
 3 files changed, 88 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index f683346285..d4601ecf9b 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -84,6 +84,9 @@ int vpci_add_handlers(struct pci_dev *pdev)
 
     INIT_LIST_HEAD(&pdev->vpci->handlers);
     spin_lock_init(&pdev->vpci->lock);
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+    pdev->vpci->guest_sbdf.sbdf = ~0;
+#endif
 
     for ( i = 0; i < NUM_VPCI_INIT; i++ )
     {
@@ -99,6 +102,62 @@ int vpci_add_handlers(struct pci_dev *pdev)
 }
 
 #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+static int add_virtual_device(struct pci_dev *pdev)
+{
+    struct domain *d = pdev->domain;
+    pci_sbdf_t sbdf = { 0 };
+    unsigned long new_dev_number;
+
+    if ( is_hardware_domain(d) )
+        return 0;
+
+    ASSERT(pcidevs_write_locked());
+
+    /*
+     * Each PCI bus supports 32 devices/slots at max or up to 256 when
+     * there are multi-function ones which are not yet supported.
+     */
+    if ( pdev->info.is_extfn )
+    {
+        gdprintk(XENLOG_ERR, "%pp: only function 0 passthrough supported\n",
+                 &pdev->sbdf);
+        return -EOPNOTSUPP;
+    }
+
+    new_dev_number = find_first_zero_bit(d->vpci_dev_assigned_map,
+                                         VPCI_MAX_VIRT_DEV);
+    if ( new_dev_number >= VPCI_MAX_VIRT_DEV )
+        return -ENOSPC;
+
+    __set_bit(new_dev_number, &d->vpci_dev_assigned_map);
+
+    /*
+     * Both segment and bus number are 0:
+     *  - we emulate a single host bridge for the guest, e.g. segment 0
+     *  - with bus 0 the virtual devices are seen as embedded
+     *    endpoints behind the root complex
+     *
+     * TODO: add support for multi-function devices.
+     */
+    sbdf.devfn = PCI_DEVFN(new_dev_number, 0);
+    pdev->vpci->guest_sbdf = sbdf;
+
+    return 0;
+
+}
+
+static void vpci_remove_virtual_device(const struct pci_dev *pdev)
+{
+    ASSERT(pcidevs_write_locked());
+
+    if ( pdev->vpci )
+    {
+        __clear_bit(pdev->vpci->guest_sbdf.dev,
+                    &pdev->domain->vpci_dev_assigned_map);
+        pdev->vpci->guest_sbdf.sbdf = ~0;
+    }
+}
+
 /* Notify vPCI that device is assigned to guest. */
 int vpci_assign_device(struct pci_dev *pdev)
 {
@@ -111,8 +170,16 @@ int vpci_assign_device(struct pci_dev *pdev)
 
     rc = vpci_add_handlers(pdev);
     if ( rc )
-        vpci_deassign_device(pdev);
+        goto fail;
+
+    rc = add_virtual_device(pdev);
+    if ( rc )
+        goto fail;
+
+    return 0;
 
+ fail:
+    vpci_deassign_device(pdev);
     return rc;
 }
 
@@ -124,6 +191,7 @@ void vpci_deassign_device(struct pci_dev *pdev)
     if ( !has_vpci(pdev->domain) )
         return;
 
+    vpci_remove_virtual_device(pdev);
     vpci_remove_device(pdev);
 }
 #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index b9515eb497..a2848a5740 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -457,6 +457,14 @@ struct domain
 
 #ifdef CONFIG_HAS_PCI
     struct list_head pdev_list;
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+    /*
+     * The bitmap which shows which device numbers are already used by the
+     * virtual PCI bus topology and is used to assign a unique SBDF to the
+     * next passed through virtual PCI device.
+     */
+    DECLARE_BITMAP(vpci_dev_assigned_map, VPCI_MAX_VIRT_DEV);
+#endif
 #endif
 
 #ifdef CONFIG_HAS_PASSTHROUGH
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 1010f68c28..cc14b0086d 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -21,6 +21,13 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
 
 #define VPCI_ECAM_BDF(addr)     (((addr) & 0x0ffff000) >> 12)
 
+/*
+ * Maximum number of devices supported by the virtual bus topology:
+ * each PCI bus supports 32 devices/slots at max or up to 256 when
+ * there are multi-function ones which are not yet supported.
+ */
+#define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
+
 #define REGISTER_VPCI_INIT(x, p)                \
   static vpci_register_init_t *const x##_entry  \
                __used_section(".data.vpci." p) = x
@@ -145,6 +152,10 @@ struct vpci {
             struct vpci_arch_msix_entry arch;
         } entries[];
     } *msix;
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+    /* Guest SBDF of the device. */
+    pci_sbdf_t guest_sbdf;
+#endif
 #endif
 };
 
-- 
2.25.1


