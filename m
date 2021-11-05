Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D96445FEB
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 07:56:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222095.384216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mit9c-0002op-W2; Fri, 05 Nov 2021 06:56:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222095.384216; Fri, 05 Nov 2021 06:56:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mit9c-0002fW-Ay; Fri, 05 Nov 2021 06:56:48 +0000
Received: by outflank-mailman (input) for mailman id 222095;
 Fri, 05 Nov 2021 06:56:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gmz5=PY=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1mit9Z-0008NQ-EU
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 06:56:45 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 898bd0fe-3e05-11ec-a9d2-d9f7a1cc8784;
 Fri, 05 Nov 2021 07:56:44 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id ee33so29969942edb.8
 for <xen-devel@lists.xenproject.org>; Thu, 04 Nov 2021 23:56:44 -0700 (PDT)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id dt4sm3735150ejb.27.2021.11.04.23.56.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 23:56:43 -0700 (PDT)
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
X-Inumbo-ID: 898bd0fe-3e05-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AyhDGXJChmWgqH4NGZkz5hh623ehbMnVZq0mFeTc4N8=;
        b=S74F3KC5Ll7YUiFRMNzJmPU1QEjH37KMs0pYrg9xJLZn2V9McTPuQuSvBOMyE6IBK+
         ZXL6caNB4Kay83nmnMI3A1oFymf6Cw5M25klv8kmgHbY1ztmnBiqWxYUHj4POot147SE
         4DqfjshSdkR/0W39QQzvMjANhQnkY9Iw31TugmdSyBwgTot+HT+Nw/z/EiECBR9TZCq3
         URK3xEVJPcu3gw2TEOiRoc8j2YkbdCNfljotoetQ5Xk31cn4AMf8+sDwZSs7/gpjWYL4
         vDo42kC/mXAW1BtQlM7rZ+yA8N2+4waNT34QDVF5laHsNflg4G7RrBXyH1UgRUxeHo2Q
         URNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AyhDGXJChmWgqH4NGZkz5hh623ehbMnVZq0mFeTc4N8=;
        b=km3EKa1tvfgetkE3+2nhpqBtV6QaWSl13f1Noi/Bxx7JiIgFRB8RzUu6ubn20sK1lG
         sZZNxUx88act7ON9JUsRkZvZn5+ajdK+MENWKKRgKpceVZblUF9frK7/qam4cwF99pC8
         2HexSECQeWZ9YGWCjx2uZGoeB8HNn+kr+FKJIa7d5XbTzyEV68tsZTplfsYiLckQv1UB
         V7PjtkTE7lPZxyhhCxgEylr/YQMFR4afzq9utLgSphdtgGypQ4ysNxgYqBpwbO1steKQ
         gydJlJYzkbx2MK5i9ku77JUS8Sl4jn2io/Qb2ecnka7Mo5l1du+DWm0YBoMP0VPYVybg
         3AfA==
X-Gm-Message-State: AOAM530vTxRyKO3kM9+fWgdQiuVTP9RtVzsdY/Tjmh3JdrV7ZFReJRTc
	xb9fMmQwnu80XehqLnnHvVlBYMsXFcOVtA==
X-Google-Smtp-Source: ABdhPJwEvro3SUyelH8U7WRbrV+bXktuw9rqoGQ+lFYh6UrNug2qOPwBNRl25+SrND7hV+wShj6HEg==
X-Received: by 2002:a05:6402:520b:: with SMTP id s11mr37432396edd.213.1636095404026;
        Thu, 04 Nov 2021 23:56:44 -0700 (PDT)
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
Subject: [PATCH v4 10/11] vpci: add initial support for virtual PCI bus topology
Date: Fri,  5 Nov 2021 08:56:28 +0200
Message-Id: <20211105065629.940943-11-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211105065629.940943-1-andr2000@gmail.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
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
Since v3:
 - make use of VPCI_INIT
 - moved all new code to vpci.c which belongs to it
 - changed open-coded 31 to PCI_SLOT(~0)
 - revisited locking: add dedicated vdev list's lock
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
 xen/drivers/vpci/vpci.c | 52 +++++++++++++++++++++++++++++++++++++++++
 xen/include/xen/sched.h |  8 +++++++
 xen/include/xen/vpci.h  |  4 ++++
 3 files changed, 64 insertions(+)

diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 45733300f00b..6657d236dc1a 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -101,6 +101,9 @@ int vpci_add_handlers(struct pci_dev *pdev)
 
     INIT_LIST_HEAD(&pdev->vpci->handlers);
     spin_lock_init(&pdev->vpci->lock);
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+    pdev->vpci->guest_sbdf.sbdf = ~0;
+#endif
 
     header = &pdev->vpci->header;
     for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
@@ -125,6 +128,54 @@ int vpci_add_handlers(struct pci_dev *pdev)
 }
 
 #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+int vpci_add_virtual_device(struct pci_dev *pdev)
+{
+    struct domain *d = pdev->domain;
+    pci_sbdf_t sbdf;
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
+                                         PCI_SLOT(~0) + 1);
+    if ( new_dev_number > PCI_SLOT(~0) )
+        return -ENOSPC;
+
+    set_bit(new_dev_number, &d->vpci_dev_assigned_map);
+
+    /*
+     * Both segment and bus number are 0:
+     *  - we emulate a single host bridge for the guest, e.g. segment 0
+     *  - with bus 0 the virtual devices are seen as embedded
+     *    endpoints behind the root complex
+     *
+     * TODO: add support for multi-function devices.
+     */
+    sbdf.sbdf = 0;
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
+    clear_bit(pdev->vpci->guest_sbdf.dev, &d->vpci_dev_assigned_map);
+    pdev->vpci->guest_sbdf.sbdf = ~0;
+}
+
 /* Notify vPCI that device is assigned to guest. */
 int vpci_assign_device(struct domain *d, struct pci_dev *pdev)
 {
@@ -150,6 +201,7 @@ int vpci_deassign_device(struct domain *d, struct pci_dev *pdev)
     if ( is_system_domain(d) || !has_vpci(d) )
         return 0;
 
+    vpci_remove_virtual_device(d, pdev);
     vpci_remove_device_handlers(pdev);
 
     return 0;
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
index 143f3166a730..9cc7071bc0af 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -145,6 +145,10 @@ struct vpci {
             struct vpci_arch_msix_entry arch;
         } entries[];
     } *msix;
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+    /* Virtual SBDF of the device. */
+    pci_sbdf_t guest_sbdf;
+#endif
 #endif
 };
 
-- 
2.25.1


