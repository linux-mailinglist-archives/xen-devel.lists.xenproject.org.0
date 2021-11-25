Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0478145D8AD
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 12:03:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230878.399179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqCWv-0003AB-2T; Thu, 25 Nov 2021 11:03:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230878.399179; Thu, 25 Nov 2021 11:03:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqCWu-00035p-Sy; Thu, 25 Nov 2021 11:03:04 +0000
Received: by outflank-mailman (input) for mailman id 230878;
 Thu, 25 Nov 2021 11:03:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=68NU=QM=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1mqCWs-0001K8-8b
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 11:03:02 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41629d9c-4ddf-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 12:03:01 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id b40so15316060lfv.10
 for <xen-devel@lists.xenproject.org>; Thu, 25 Nov 2021 03:03:01 -0800 (PST)
Received: from a2klaptop.epam.com (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id bt10sm235165lfb.193.2021.11.25.03.02.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 03:02:59 -0800 (PST)
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
X-Inumbo-ID: 41629d9c-4ddf-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zlqkD9o6TFSW+Z9K8vbwXV06GGEnSpeGFpgXT4iChkc=;
        b=YDQqX6VgoUvas8T8U7uF/ZLbFzxhShXfl9FTIgBLp8Q+oRbGtdqWaYd21MvW81oXtN
         fW7Bd5DWXl28WqLF6KJ+d/ELkGV3pRxGU25kkgGylCZqSSdkoMzdedK3pwRa0RDwOlJG
         1GD7o9W9TxuYIbLvINCio03CCNYqrNxoJzZx04Ok5b9G2SLzi78SxzwcBQ5zM3ICsvPk
         XEccye87xQtrzBAaNhnLDOcZlaWW2euSsvnqYk6DCkooXq54LT/OpPU4otO6j5lO41mT
         sbamG8EVXMbRhcK5kGLapbetYx9q+49PKfZT3eoWtSjk/APfmI1spEoC1nRW020gdGWm
         5gBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zlqkD9o6TFSW+Z9K8vbwXV06GGEnSpeGFpgXT4iChkc=;
        b=3NuhXg5tYWyHQksLCay99pgS0c0ev4NbFkN+w3da56Z/KsxUETRZbXBNPeThjK4gvr
         2C+wYy/blDO8T7UpG8woSHCpYa5emtmFWmJzMsCb+aQcCwQrGS1IoClOYysvJvoSSYoj
         4NXVeutR27/yt+3zwvjHBB5obZukD7wfqkiWvQszJ5RZvI44h07UJk7RjUNYlnFAbb3n
         z2lK5ti/lHnw8AJS2Ddxuym1QgWkH9CViVI+maDf8eRtp1SObLW0NsJlewZQsSMRnThb
         /V0kAg5c3ETF2rOYinTqcjTRDh+Qo/BxtHxI8azJpWgxXiDqrppISBwOX4xCNN6EUuDJ
         I6tA==
X-Gm-Message-State: AOAM531+cGalkxWUw+NjZJrTqlcAgKXgWccIgghv15gb2/Q6pPMBQIDb
	TdIrrxDIZG5WCGJvnKuw8lLXT/Kr9ovsNg==
X-Google-Smtp-Source: ABdhPJyO225gyuzeTIpsa5rB1IrCqUbVttrUzf067KVOPkjsXGLJoVBo9SPRvxvDMrWxlwUzJj7+2Q==
X-Received: by 2002:a19:ac46:: with SMTP id r6mr23521138lfc.42.1637838180416;
        Thu, 25 Nov 2021 03:03:00 -0800 (PST)
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
Subject: [PATCH v5 05/14] vpci: add hooks for PCI device assign/de-assign
Date: Thu, 25 Nov 2021 13:02:42 +0200
Message-Id: <20211125110251.2877218-6-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211125110251.2877218-1-andr2000@gmail.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

When a PCI device gets assigned/de-assigned some work on vPCI side needs
to be done for that device. Introduce a pair of hooks so vPCI can handle
that.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
Since v4:
 - de-assign vPCI from the previous domain on device assignment
 - do not remove handlers in vpci_assign_device as those must not
   exist at that point
Since v3:
 - remove toolstack roll-back description from the commit message
   as error are to be handled with proper cleanup in Xen itself
 - remove __must_check
 - remove redundant rc check while assigning devices
 - fix redundant CONFIG_HAS_VPCI check for CONFIG_HAS_VPCI_GUEST_SUPPORT
 - use REGISTER_VPCI_INIT machinery to run required steps on device
   init/assign: add run_vpci_init helper
Since v2:
- define CONFIG_HAS_VPCI_GUEST_SUPPORT so dead code is not compiled
  for x86
Since v1:
 - constify struct pci_dev where possible
 - do not open code is_system_domain()
 - extended the commit message
---
 xen/drivers/Kconfig           |  4 +++
 xen/drivers/passthrough/pci.c | 10 ++++++
 xen/drivers/vpci/vpci.c       | 61 +++++++++++++++++++++++++++++------
 xen/include/xen/vpci.h        | 16 +++++++++
 4 files changed, 82 insertions(+), 9 deletions(-)

diff --git a/xen/drivers/Kconfig b/xen/drivers/Kconfig
index db94393f47a6..780490cf8e39 100644
--- a/xen/drivers/Kconfig
+++ b/xen/drivers/Kconfig
@@ -15,4 +15,8 @@ source "drivers/video/Kconfig"
 config HAS_VPCI
 	bool
 
+config HAS_VPCI_GUEST_SUPPORT
+	bool
+	depends on HAS_VPCI
+
 endmenu
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 286808b25e65..d9ef91571adf 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -874,6 +874,10 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
     if ( ret )
         goto out;
 
+    ret = vpci_deassign_device(d, pdev);
+    if ( ret )
+        goto out;
+
     if ( pdev->domain == hardware_domain  )
         pdev->quarantine = false;
 
@@ -1429,6 +1433,10 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
     ASSERT(pdev && (pdev->domain == hardware_domain ||
                     pdev->domain == dom_io));
 
+    rc = vpci_deassign_device(pdev->domain, pdev);
+    if ( rc )
+        goto done;
+
     rc = pdev_msix_assign(d, pdev);
     if ( rc )
         goto done;
@@ -1446,6 +1454,8 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
         rc = hd->platform_ops->assign_device(d, devfn, pci_to_dev(pdev), flag);
     }
 
+    rc = vpci_assign_device(d, pdev);
+
  done:
     if ( rc )
         printk(XENLOG_G_WARNING "%pd: assign (%pp) failed (%d)\n",
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 37103e207635..a9e9e8ec438c 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -74,12 +74,26 @@ void vpci_remove_device(struct pci_dev *pdev)
     spin_unlock(&pdev->vpci_lock);
 }
 
-int vpci_add_handlers(struct pci_dev *pdev)
+static int run_vpci_init(struct pci_dev *pdev)
 {
-    struct vpci *vpci;
     unsigned int i;
     int rc = 0;
 
+    for ( i = 0; i < NUM_VPCI_INIT; i++ )
+    {
+        rc = __start_vpci_array[i](pdev);
+        if ( rc )
+            break;
+    }
+
+    return rc;
+}
+
+int vpci_add_handlers(struct pci_dev *pdev)
+{
+    struct vpci *vpci;
+    int rc;
+
     if ( !has_vpci(pdev->domain) )
         return 0;
 
@@ -94,19 +108,48 @@ int vpci_add_handlers(struct pci_dev *pdev)
     pdev->vpci = vpci;
     INIT_LIST_HEAD(&pdev->vpci->handlers);
 
-    for ( i = 0; i < NUM_VPCI_INIT; i++ )
-    {
-        rc = __start_vpci_array[i](pdev);
-        if ( rc )
-            break;
-    }
-
+    rc = run_vpci_init(pdev);
     if ( rc )
         vpci_remove_device_locked(pdev);
     spin_unlock(&pdev->vpci_lock);
 
     return rc;
 }
+
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+/* Notify vPCI that device is assigned to guest. */
+int vpci_assign_device(struct domain *d, struct pci_dev *pdev)
+{
+    int rc;
+
+    /* It only makes sense to assign for hwdom or guest domain. */
+    if ( is_system_domain(d) || !has_vpci(d) )
+        return 0;
+
+    spin_lock(&pdev->vpci_lock);
+    rc = run_vpci_init(pdev);
+    spin_unlock(&pdev->vpci_lock);
+    if ( rc )
+        vpci_deassign_device(d, pdev);
+
+    return rc;
+}
+
+/* Notify vPCI that device is de-assigned from guest. */
+int vpci_deassign_device(struct domain *d, struct pci_dev *pdev)
+{
+    /* It only makes sense to de-assign from hwdom or guest domain. */
+    if ( is_system_domain(d) || !has_vpci(d) )
+        return 0;
+
+    spin_lock(&pdev->vpci_lock);
+    vpci_remove_device_handlers_locked(pdev);
+    spin_unlock(&pdev->vpci_lock);
+
+    return 0;
+}
+#endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
+
 #endif /* __XEN__ */
 
 static int vpci_register_cmp(const struct vpci_register *r1,
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index cfff87e5801e..ed127a08a953 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -261,6 +261,22 @@ static inline void vpci_cancel_pending_locked(struct pci_dev *pdev)
 }
 #endif
 
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+/* Notify vPCI that device is assigned/de-assigned to/from guest. */
+int vpci_assign_device(struct domain *d, struct pci_dev *pdev);
+int vpci_deassign_device(struct domain *d, struct pci_dev *pdev);
+#else
+static inline int vpci_assign_device(struct domain *d, struct pci_dev *pdev)
+{
+    return 0;
+};
+
+static inline int vpci_deassign_device(struct domain *d, struct pci_dev *pdev)
+{
+    return 0;
+};
+#endif
+
 #endif
 
 /*
-- 
2.25.1


