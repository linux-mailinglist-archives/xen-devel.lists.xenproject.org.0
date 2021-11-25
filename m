Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0987445D8B2
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 12:03:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230886.399233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqCX4-00051w-NK; Thu, 25 Nov 2021 11:03:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230886.399233; Thu, 25 Nov 2021 11:03:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqCX3-0004kM-Vo; Thu, 25 Nov 2021 11:03:13 +0000
Received: by outflank-mailman (input) for mailman id 230886;
 Thu, 25 Nov 2021 11:03:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=68NU=QM=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1mqCX0-0001Km-0F
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 11:03:10 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4618b0c5-4ddf-11ec-9787-a32c541c8605;
 Thu, 25 Nov 2021 12:03:09 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id 207so11701807ljf.10
 for <xen-devel@lists.xenproject.org>; Thu, 25 Nov 2021 03:03:09 -0800 (PST)
Received: from a2klaptop.epam.com (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id bt10sm235165lfb.193.2021.11.25.03.03.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 03:03:07 -0800 (PST)
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
X-Inumbo-ID: 4618b0c5-4ddf-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v3OzM+kUo0HWtvX10bY+8EGI7EL/11lwc+lbMCf7qNk=;
        b=jUEMnIzqEnMb2tTxWY2ERzXP+gz/bY9eHslY4VclicZg2ER7+KwvDffPj9x2ZLn7sw
         ffHw1O40qtnwyNXxYJmMRn4tIPHZomVIPBa55zou05gEwjanHcE3Gh+C9cCEQ0htPb6R
         PNre5uj/tKGcREoM+UiPIBf0MvRJIYNqly5uJlhBcN6jORMDBbI8cTGxuBcXCsOSUQR9
         8hPIWOS7r5EuaK7MlJNL8PzuHvFBrSNMn28dzcmJUjj3nO9NJ08hvNDG4MDuyap8Mz9E
         xbWnpqnOOnONLnR79ZiQipALs1THJokDQ4StQg6ngoIaCuja8Rp7RK44GO3GGDvj7P3J
         l+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v3OzM+kUo0HWtvX10bY+8EGI7EL/11lwc+lbMCf7qNk=;
        b=qKOQqwAWx+FYaS3fdhfAMxY0zIwS9zniOi2EocZ1Z2bazz4Zvzz7iNM8egVuMuubnJ
         OEbL6uCQAmO88KzJ0Vq0qgQZVgGgKWIsMhSBh1EgzcwjJN9nIoIMy1RO3kZHTX6kG4zo
         ipXEXSgukVmsxeOut6jF5QTysnpf+2EOw0B0HWuF/JFOX7KtNkNiM1ccQxMhNWYqnHO9
         mZbQT+9TNnZ1C3Su9VJYF4spJFA9Dn13onJmn1Cu2bmZ4OgdzMGE9OfU2Io1FOVbACc+
         wTAI8WZ4QO7tw4hx9nmnH8XrSM0yu6KI+BO6nYjFK4PzPuPaDtX1xEqWV3cXydptK1Sh
         WS2g==
X-Gm-Message-State: AOAM532X7pKIoDWMzSDpSXwrjqgseFqRHTkoUyQqNARHELXoxwv1qGoC
	0LYy+fRMCi54wcg87RWo1gCjyGhTfpaQVA==
X-Google-Smtp-Source: ABdhPJzIu53i+hoVd9Ngr9ybt0u7H25mEZU+kuIkiFrLep98sVOIIkcpRt6BfJXfbtsVLlRksnUejg==
X-Received: by 2002:a2e:bc1b:: with SMTP id b27mr24175465ljf.91.1637838188551;
        Thu, 25 Nov 2021 03:03:08 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	paul@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v5 11/14] vpci: add initial support for virtual PCI bus topology
Date: Thu, 25 Nov 2021 13:02:48 +0200
Message-Id: <20211125110251.2877218-12-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211125110251.2877218-1-andr2000@gmail.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
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
 xen/drivers/vpci/vpci.c | 51 +++++++++++++++++++++++++++++++++++++++++
 xen/include/xen/sched.h |  8 +++++++
 xen/include/xen/vpci.h  | 11 +++++++++
 3 files changed, 70 insertions(+)

diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 98b12a61be6f..c2fb4d4db233 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -114,6 +114,9 @@ int vpci_add_handlers(struct pci_dev *pdev)
     spin_lock(&pdev->vpci_lock);
     pdev->vpci = vpci;
     INIT_LIST_HEAD(&pdev->vpci->handlers);
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+    pdev->vpci->guest_sbdf.sbdf = ~0;
+#endif
 
     header = &pdev->vpci->header;
     for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
@@ -145,6 +148,53 @@ int vpci_add_handlers(struct pci_dev *pdev)
 }
 
 #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+int vpci_add_virtual_device(struct pci_dev *pdev)
+{
+    struct domain *d = pdev->domain;
+    pci_sbdf_t sbdf = { 0 };
+    unsigned long new_dev_number;
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
+    new_dev_number = find_first_zero_bit(&d->vpci_dev_assigned_map,
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
+REGISTER_VPCI_INIT(vpci_add_virtual_device, VPCI_PRIORITY_MIDDLE);
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
@@ -171,6 +221,7 @@ int vpci_deassign_device(struct domain *d, struct pci_dev *pdev)
         return 0;
 
     spin_lock(&pdev->vpci_lock);
+    vpci_remove_virtual_device(d, pdev);
     vpci_remove_device_handlers_locked(pdev);
     spin_unlock(&pdev->vpci_lock);
 
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 28146ee404e6..10bff103317c 100644
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
+    unsigned long vpci_dev_assigned_map;
+#endif
 #endif
 
 #ifdef CONFIG_HAS_PASSTHROUGH
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 18319fc329f9..e5258bd7ce90 100644
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
@@ -143,6 +150,10 @@ struct vpci {
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


