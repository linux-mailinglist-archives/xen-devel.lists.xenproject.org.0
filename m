Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 178F94A940B
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 07:35:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265014.458376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFsBi-0002qQ-Ra; Fri, 04 Feb 2022 06:35:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265014.458376; Fri, 04 Feb 2022 06:35:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFsBi-0002dg-4p; Fri, 04 Feb 2022 06:35:18 +0000
Received: by outflank-mailman (input) for mailman id 265014;
 Fri, 04 Feb 2022 06:35:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tguk=ST=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1nFsBf-0008DX-6C
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 06:35:15 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c0d2cc9-8584-11ec-8eb8-a37418f5ba1a;
 Fri, 04 Feb 2022 07:35:14 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id o12so10664148lfg.12
 for <xen-devel@lists.xenproject.org>; Thu, 03 Feb 2022 22:35:14 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id f34sm163027lfv.165.2022.02.03.22.35.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 22:35:13 -0800 (PST)
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
X-Inumbo-ID: 9c0d2cc9-8584-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tGFLOQCwkEQFlI9mFVvLvlv0pMnFdRny8N7SLfH9TJA=;
        b=YlgiD5lGb3evZ6RR1LePZhPhqzkgUVHIPb2Gy3O72gERgeDAmwDTYaB0XUarTQgsD8
         pmdw7nrr7tOpf/VkdnbF851kb5Y8xpkUCSOphdAW69ua0+sdexi8ht29J6xt3629QdYw
         8q421az1QnqIpTccWIu2jw9mRqZwIRJJQr9fjZjEvRHqTXgN99wxLu6k7zzlJ+iZexcK
         j131pVe1Bn0fM1phTaY1dA0B3H4DUjCi07cAHQi7H+H/6xGbYmNtrY/+dguki/2iv26P
         ps40BdLcc/ktXwgv/LnZ8VTYgZaZEO5Ys52gDX5rQ7GrNIjDR46fhSUVc4ThlvEPF0Vf
         kRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tGFLOQCwkEQFlI9mFVvLvlv0pMnFdRny8N7SLfH9TJA=;
        b=3OSLR+PccHK9fCyIlslFJKh+x68f924fQVGXqIcwpFy68BovlCqqaRP9jKCunkKBna
         zw7Qok2HaYc3glIJ3iwYzRt+LV8XZwz1waeFrsFvxuD1f+eO0/Kd0EtgDbZmkdT5jkOf
         RwwWeEnBHB2jRm9qqlsNqB+rBDmYvE1IsODGRTbz+DDFD2/V4iRC+HXnJ6mz+wBXfnWS
         WzYO822evOxIbpjB2ZlacN44+dYukA0I0b8sWkxxoDhkf8l70WlRyn6j+yApRuMupTIc
         knl1hqKHhV55AQdpsCP5fHHxNAkLfmA6X/u6pLK1WKvjI5gHoA2PuQ/YN/JEKFndbbRS
         Ztjw==
X-Gm-Message-State: AOAM530G2eU6sZ2vjGp6aIC62W9pCotfYBWy9qe2s03BqwTjMU+MqpBB
	wT3KG0hBdaK9Btd7cNgv+sHlSD17jgo=
X-Google-Smtp-Source: ABdhPJwPzBAmRPwkr5ocrvbHVI7IaKNMChAL/CL0c1126BAXRRe8+v+tzkGTEQ3jLHc1eLnLZCqIZg==
X-Received: by 2002:a05:6512:683:: with SMTP id t3mr1289026lfe.61.1643956513698;
        Thu, 03 Feb 2022 22:35:13 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	artem_mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	paul@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v6 11/13] vpci: add initial support for virtual PCI bus topology
Date: Fri,  4 Feb 2022 08:34:57 +0200
Message-Id: <20220204063459.680961-12-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204063459.680961-1-andr2000@gmail.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
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
 xen/drivers/vpci/vpci.c | 74 +++++++++++++++++++++++++++++++++++++++--
 xen/include/xen/sched.h |  8 +++++
 xen/include/xen/vpci.h  | 11 ++++++
 3 files changed, 91 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 3177f13c1c22..7d422d11f83d 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -89,6 +89,9 @@ int vpci_add_handlers(struct pci_dev *pdev)
         return -ENOMEM;
 
     INIT_LIST_HEAD(&vpci->handlers);
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+    vpci->guest_sbdf.sbdf = ~0;
+#endif
 
     spin_lock(&pdev->vpci_lock);
     pdev->vpci = vpci;
@@ -114,6 +117,57 @@ int vpci_add_handlers(struct pci_dev *pdev)
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
+    ASSERT(pcidevs_locked());
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
+static void vpci_remove_virtual_device(struct domain *d,
+                                       const struct pci_dev *pdev)
+{
+    __clear_bit(pdev->vpci->guest_sbdf.dev, &d->vpci_dev_assigned_map);
+    pdev->vpci->guest_sbdf.sbdf = ~0;
+}
+
 /* Notify vPCI that device is assigned to guest. */
 int vpci_assign_device(struct domain *d, struct pci_dev *pdev)
 {
@@ -124,8 +178,16 @@ int vpci_assign_device(struct domain *d, struct pci_dev *pdev)
 
     rc = vpci_add_handlers(pdev);
     if ( rc )
-        vpci_deassign_device(d, pdev);
+        goto fail;
+
+    rc = add_virtual_device(pdev);
+    if ( rc )
+        goto fail;
 
+    return 0;
+
+ fail:
+    vpci_deassign_device(d, pdev);
     return rc;
 }
 
@@ -135,7 +197,15 @@ void vpci_deassign_device(struct domain *d, struct pci_dev *pdev)
     if ( !has_vpci(d) )
         return;
 
-    vpci_remove_device(pdev);
+    spin_lock(&pdev->vpci_lock);
+    if ( !pdev->vpci )
+        goto done;
+
+    vpci_remove_virtual_device(d, pdev);
+    vpci_remove_device_locked(pdev);
+
+ done:
+    spin_unlock(&pdev->vpci_lock);
 }
 #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
 
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 37f78cc4c4c9..3c25e265eaa8 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -444,6 +444,14 @@ struct domain
 
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
index f1f49db959c7..1f04d34a2369 100644
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
@@ -140,6 +147,10 @@ struct vpci {
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


