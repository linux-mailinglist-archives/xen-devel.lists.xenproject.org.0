Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB56445FEE
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 07:57:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222089.384149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mit9T-0000jr-S1; Fri, 05 Nov 2021 06:56:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222089.384149; Fri, 05 Nov 2021 06:56:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mit9T-0000da-Lg; Fri, 05 Nov 2021 06:56:39 +0000
Received: by outflank-mailman (input) for mailman id 222089;
 Fri, 05 Nov 2021 06:56:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gmz5=PY=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1mit9S-0008Eb-Ei
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 06:56:38 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 855f26ec-3e05-11ec-9787-a32c541c8605;
 Fri, 05 Nov 2021 07:56:37 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id b15so10471843edd.7
 for <xen-devel@lists.xenproject.org>; Thu, 04 Nov 2021 23:56:37 -0700 (PDT)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id dt4sm3735150ejb.27.2021.11.04.23.56.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 23:56:36 -0700 (PDT)
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
X-Inumbo-ID: 855f26ec-3e05-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/BhVSzCyfrKMDozwQH/ExTubI3Dx6s3goXHMqPKDfjg=;
        b=K7U9vUsEU4wDAlfzmWQaQ3shYxNk5c+bFa7pzSjVc9szODwmj997M5/1FpSgD0eaVK
         7WplqIySozk5AxYy4oMhaEPLGSxfkN7celQjwmaMeHS+9al9oeFLxn+hEpRWIJa0eRol
         dlHYax4HBRFmhwYC3bpinjWlU6KifLIXjkHPNDZCfYl72u7mFp94E98wGor0WhXKYgxH
         qQEwipLYMJzmuI3UVKAce6WXBmnz/4GF2u00pzkS12WokvNCrlTiduespTGbsV7HPQ7H
         nOb5v5gbIG0bG+S8nGlsSF0o31vuHYLCu5UMBL/Az9um0vy3VGFtqOD3W4GYs+hpk3ur
         x7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/BhVSzCyfrKMDozwQH/ExTubI3Dx6s3goXHMqPKDfjg=;
        b=SQq3uEdo7fmz7TJxivUoW8bVukEoAv/vH6ieZUZdIei13N6BKsniNPyQqpHaKUsyP4
         FmRz2rIWhX35FFw7Ls4I6HH0rrXGTTNg2h/gZmkHJw+zt0TIeoQnh+RtwPZV44Ziiy9P
         6P3HCJZMgaFm1ncT/4p+5KGQwcyvm5OwBZA2Ck00WhmpEgLNct78YxnUU1p6t/hMezf7
         j7MPwReGMLFEALfrm267j/Zs/DKargxbOWTl5Niz5ligCl9J873xbj4nLOMSJueTnXHP
         6ePn3jvdR5Hfatc4KWQhIBMRSHAHJWy0k4CJ/WAtOCDr0UKgGypIErhVrYWLmuNZhlg7
         poFA==
X-Gm-Message-State: AOAM532sxEcSLL6kVmZhBTXlGBFYtaxadXAx7lOfnr1UFSiknYSKZyYa
	54rCsZIYsfk0ZWj6a5B71cXEAVuWhbaraQ==
X-Google-Smtp-Source: ABdhPJwH3nj2qgzWQi6uwb8KYRy2nn02Sm8YsU5o9cvWZgY9/c+lRZTPHGNkKX53KMbOHn9w8eTdEg==
X-Received: by 2002:a17:906:3408:: with SMTP id c8mr14550874ejb.41.1636095397004;
        Thu, 04 Nov 2021 23:56:37 -0700 (PDT)
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
Subject: [PATCH v4 04/11] vpci: add hooks for PCI device assign/de-assign
Date: Fri,  5 Nov 2021 08:56:22 +0200
Message-Id: <20211105065629.940943-5-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211105065629.940943-1-andr2000@gmail.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

When a PCI device gets assigned/de-assigned some work on vPCI side needs
to be done for that device. Introduce a pair of hooks so vPCI can handle
that.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
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
 xen/drivers/passthrough/pci.c |  6 ++++
 xen/drivers/vpci/vpci.c       | 57 ++++++++++++++++++++++++++++++-----
 xen/include/xen/vpci.h        | 16 ++++++++++
 4 files changed, 75 insertions(+), 8 deletions(-)

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
index a9d31293ac09..529a4f50aa80 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -873,6 +873,10 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
     if ( ret )
         goto out;
 
+    ret = vpci_deassign_device(d, pdev);
+    if ( ret )
+        goto out;
+
     if ( pdev->domain == hardware_domain  )
         pdev->quarantine = false;
 
@@ -1445,6 +1449,8 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
         rc = hd->platform_ops->assign_device(d, devfn, pci_to_dev(pdev), flag);
     }
 
+    rc = vpci_assign_device(d, pdev);
+
  done:
     if ( rc )
         printk(XENLOG_G_WARNING "%pd: assign (%pp) failed (%d)\n",
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index d7f033a0811f..5f086398a98c 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -63,11 +63,25 @@ void vpci_remove_device(struct pci_dev *pdev)
     pdev->vpci = NULL;
 }
 
-int vpci_add_handlers(struct pci_dev *pdev)
+static int run_vpci_init(struct pci_dev *pdev)
 {
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
+    int rc;
+
     if ( !has_vpci(pdev->domain) )
         return 0;
 
@@ -81,18 +95,45 @@ int vpci_add_handlers(struct pci_dev *pdev)
     INIT_LIST_HEAD(&pdev->vpci->handlers);
     spin_lock_init(&pdev->vpci->lock);
 
-    for ( i = 0; i < NUM_VPCI_INIT; i++ )
-    {
-        rc = __start_vpci_array[i](pdev);
-        if ( rc )
-            break;
-    }
-
+    rc = run_vpci_init(pdev);
     if ( rc )
         vpci_remove_device(pdev);
 
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
+    vpci_remove_device_handlers(pdev);
+
+    rc = run_vpci_init(pdev);
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
+    vpci_remove_device_handlers(pdev);
+
+    return 0;
+}
+#endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
+
 #endif /* __XEN__ */
 
 static int vpci_register_cmp(const struct vpci_register *r1,
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 1883b9d08a70..a016b4197801 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -262,6 +262,22 @@ static inline void vpci_cancel_pending(const struct pci_dev *pdev)
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


