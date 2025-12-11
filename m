Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD3DCB6F17
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 19:46:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184553.1507033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTlft-0005Ef-9x; Thu, 11 Dec 2025 18:46:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184553.1507033; Thu, 11 Dec 2025 18:46:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTlft-00054Y-2p; Thu, 11 Dec 2025 18:46:01 +0000
Received: by outflank-mailman (input) for mailman id 1184553;
 Thu, 11 Dec 2025 18:45:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QWGN=6R=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vTlfr-0003I9-0K
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 18:45:59 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a104575a-d6c1-11f0-9cce-f158ae23cfc8;
 Thu, 11 Dec 2025 19:45:56 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b7a6e56193cso84167366b.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 10:45:56 -0800 (PST)
Received: from EPUAKYIW02F7.. (pool185-5-253-4.as6723.net. [185.5.253.4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7cfa5d0b0dsm345870466b.67.2025.12.11.10.45.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 10:45:54 -0800 (PST)
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
X-Inumbo-ID: a104575a-d6c1-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765478756; x=1766083556; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/YQHTjWfFNRfU47XoZ3xNzm7CYArEgw/v+Ue+GlOW0=;
        b=HbQimVh+9Ftqd8z0fD/kPvnVs7wrtno7QCfLdeRYtXvk6wptP9SaGD/jH+mQyHBNT6
         aVEzOKTWueF8Qkg/DrhmRm3s80abL1MViRV1fYVVUb+P1OFvSVpGbVLTiBmGbjs8WmEi
         hOU6+iVDKtowkvgxpIXvu/bqiqpKAbjh2MH8CIpwo0kIVC6+enM78LDuaD12v1+BkhM+
         sxqE+zX2ODk+PYagHiHNEaS26NY4P3lVaqEbqxPCZzd9kB8oCvRsiNnMQ2UMUkjz4+wW
         BMlYTL5SJj5D2iooiz6B/mji8VY7U0vW3aH5vUNs9NqIrnFvTVL5QsdpI4WNHo2v/5R4
         eQdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765478756; x=1766083556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k/YQHTjWfFNRfU47XoZ3xNzm7CYArEgw/v+Ue+GlOW0=;
        b=ilRJX4An0otrYhMMgeNaAyRoB9s3OSUHDCpQ/h7JRKGc0z+J2ViejWrmtWN1UFLfyP
         4gps0uOn8sJDvtMlH1MjrjV2rjQFLvCP/7Z00xD9Jo9rKPfNvqTUDGtuR4x3vBVx/VN8
         vybtF/sqD1In7BUY5CQpm7sfxZuf7PBVPf5DiM1p/QQ/tr7cweVk0SmKebIgPbpjl3zp
         D6khscJat3px8F88VNRcyIEGYvLMuYd5xXrogIKSVrZzL7ZTe7ShI3mtPsHTQToTXxSX
         aXTR4ZvWeTW2nWzzTOnoCXshiqtDyMXdViEmFEKJ/hefSJiXJiESZwfpbxdgHS6jnCTu
         nxsw==
X-Gm-Message-State: AOJu0Ywy3gq5rKmjWEyPZRhWH4DdPZCdkPlNoY3IHqWeTxerYAHQQqvO
	igtP0xbW4L6nVx8JnzWCvZ6Jbt8LPZ2UjiSaJEjzoiP1fNT3AjJZL4/+WqqFz0ZX
X-Gm-Gg: AY/fxX5rr3sQ+gwmAG2faWeE7/qJimfg1/MWRB8D+kHyQggXE1D+ZNTdntADlyTSbY9
	j23CaXO9lMlR4wTUbLvTTAPu43/IGm6JQfXRk2d5nWBVTrukv1WWXnsXKQ2Zh5k8tH2Diqf9J71
	VaN04CeGfEWA3+evrLIPK23szIuKtrQmdyadHfNtwN4gNH1nAZGwPRjyrGWEe/L2WLlGKBk6Hm7
	pLwPx2tHf9dode0T4FY/hPyiLvRowwqMTdMWqw0hEt8Mldi5WvR/S6Q00iGhH6olVzhIr+P7vpI
	hWMnTIR0NCP4UvZUwRIAtD8duHwoTp1BBsCEHx4F2b0V9P1RR6QAM7BcGnEuuw3hdYB09DazAAx
	1iq0eP7UeIKjkCCq+NgEVGJgwtN6gmQvVoawi4IFgPNc0MwtfWIMHtBf4co0N9OJ5JtdAy/7WIv
	kVmLzuULxp9Gvs60ULLrHVmL6Y3XQDRd305975o6xL
X-Google-Smtp-Source: AGHT+IH85KHr2aOHxwE9RCp0pBn4R4LzUOG7kFSsLpxoAJMEMAJUDSPELOGwpr48HzXuALSeeczMXw==
X-Received: by 2002:a17:906:7316:b0:b76:3476:a83c with SMTP id a640c23a62f3a-b7ce84d9466mr815044466b.40.1765478755558;
        Thu, 11 Dec 2025 10:45:55 -0800 (PST)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v7 07/12] iommu/ipmmu-vmsa: Implement suspend/resume callbacks
Date: Thu, 11 Dec 2025 20:43:31 +0200
Message-ID: <220c777ee30fd35afeedefff5a73d62d6ea1e0ac.1765472890.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1765472890.git.mykola_kvach@epam.com>
References: <cover.1765472890.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Store and restore active context and micro-TLB registers.

Tested on R-Car H3 Starter Kit.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in V7:
- moved suspend context allocation before pci stuff
---
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 305 ++++++++++++++++++++++-
 1 file changed, 298 insertions(+), 7 deletions(-)

diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
index ea9fa9ddf3..6765bd3083 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -71,6 +71,8 @@
 })
 #endif
 
+#define dev_dbg(dev, fmt, ...)    \
+    dev_print(dev, XENLOG_DEBUG, fmt, ## __VA_ARGS__)
 #define dev_info(dev, fmt, ...)    \
     dev_print(dev, XENLOG_INFO, fmt, ## __VA_ARGS__)
 #define dev_warn(dev, fmt, ...)    \
@@ -130,6 +132,24 @@ struct ipmmu_features {
     unsigned int imuctr_ttsel_mask;
 };
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+struct ipmmu_reg_ctx {
+    unsigned int imttlbr0;
+    unsigned int imttubr0;
+    unsigned int imttbcr;
+    unsigned int imctr;
+};
+
+struct ipmmu_vmsa_backup {
+    struct device *dev;
+    unsigned int *utlbs_val;
+    unsigned int *asids_val;
+    struct list_head list;
+};
+
+#endif
+
 /* Root/Cache IPMMU device's information */
 struct ipmmu_vmsa_device {
     struct device *dev;
@@ -142,6 +162,9 @@ struct ipmmu_vmsa_device {
     struct ipmmu_vmsa_domain *domains[IPMMU_CTX_MAX];
     unsigned int utlb_refcount[IPMMU_UTLB_MAX];
     const struct ipmmu_features *features;
+#ifdef CONFIG_SYSTEM_SUSPEND
+    struct ipmmu_reg_ctx *reg_backup[IPMMU_CTX_MAX];
+#endif
 };
 
 /*
@@ -547,6 +570,245 @@ static void ipmmu_domain_free_context(struct ipmmu_vmsa_device *mmu,
     spin_unlock_irqrestore(&mmu->lock, flags);
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+static DEFINE_SPINLOCK(ipmmu_devices_backup_lock);
+static LIST_HEAD(ipmmu_devices_backup);
+
+static struct ipmmu_reg_ctx root_pgtable[IPMMU_CTX_MAX];
+
+static uint32_t ipmmu_imuasid_read(struct ipmmu_vmsa_device *mmu,
+                                   unsigned int utlb)
+{
+    return ipmmu_read(mmu, ipmmu_utlb_reg(mmu, IMUASID(utlb)));
+}
+
+static void ipmmu_utlbs_backup(struct ipmmu_vmsa_device *mmu)
+{
+    struct ipmmu_vmsa_backup *backup_data;
+
+    dev_dbg(mmu->dev, "Handle micro-TLBs backup\n");
+
+    spin_lock(&ipmmu_devices_backup_lock);
+
+    list_for_each_entry( backup_data, &ipmmu_devices_backup, list )
+    {
+        struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(backup_data->dev);
+        unsigned int i;
+
+        if ( to_ipmmu(backup_data->dev) != mmu )
+            continue;
+
+        for ( i = 0; i < fwspec->num_ids; i++ )
+        {
+            unsigned int utlb = fwspec->ids[i];
+
+            backup_data->asids_val[i] = ipmmu_imuasid_read(mmu, utlb);
+            backup_data->utlbs_val[i] = ipmmu_imuctr_read(mmu, utlb);
+        }
+    }
+
+    spin_unlock(&ipmmu_devices_backup_lock);
+}
+
+static void ipmmu_utlbs_restore(struct ipmmu_vmsa_device *mmu)
+{
+    struct ipmmu_vmsa_backup *backup_data;
+
+    dev_dbg(mmu->dev, "Handle micro-TLBs restore\n");
+
+    spin_lock(&ipmmu_devices_backup_lock);
+
+    list_for_each_entry( backup_data, &ipmmu_devices_backup, list )
+    {
+        struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(backup_data->dev);
+        unsigned int i;
+
+        if ( to_ipmmu(backup_data->dev) != mmu )
+            continue;
+
+        for ( i = 0; i < fwspec->num_ids; i++ )
+        {
+            unsigned int utlb = fwspec->ids[i];
+
+            ipmmu_imuasid_write(mmu, utlb, backup_data->asids_val[i]);
+            ipmmu_imuctr_write(mmu, utlb, backup_data->utlbs_val[i]);
+        }
+    }
+
+    spin_unlock(&ipmmu_devices_backup_lock);
+}
+
+static void ipmmu_domain_backup_context(struct ipmmu_vmsa_domain *domain)
+{
+    struct ipmmu_vmsa_device *mmu = domain->mmu->root;
+    struct ipmmu_reg_ctx *regs = mmu->reg_backup[domain->context_id];
+
+    dev_dbg(mmu->dev, "Handle domain context %u backup\n", domain->context_id);
+
+    regs->imttlbr0 = ipmmu_ctx_read_root(domain, IMTTLBR0);
+    regs->imttubr0 = ipmmu_ctx_read_root(domain, IMTTUBR0);
+    regs->imttbcr  = ipmmu_ctx_read_root(domain, IMTTBCR);
+    regs->imctr    = ipmmu_ctx_read_root(domain, IMCTR);
+}
+
+static void ipmmu_domain_restore_context(struct ipmmu_vmsa_domain *domain)
+{
+    struct ipmmu_vmsa_device *mmu = domain->mmu->root;
+    struct ipmmu_reg_ctx *regs  = mmu->reg_backup[domain->context_id];
+
+    dev_dbg(mmu->dev, "Handle domain context %u restore\n", domain->context_id);
+
+    ipmmu_ctx_write_root(domain, IMTTLBR0, regs->imttlbr0);
+    ipmmu_ctx_write_root(domain, IMTTUBR0, regs->imttubr0);
+    ipmmu_ctx_write_root(domain, IMTTBCR,  regs->imttbcr);
+    ipmmu_ctx_write_all(domain,  IMCTR,    regs->imctr | IMCTR_FLUSH);
+}
+
+/*
+ * Xen: Unlike Linux implementation, Xen uses a single driver instance
+ * for handling all IPMMUs. There is no framework for ipmmu_suspend/resume
+ * callbacks to be invoked for each IPMMU device. So, we need to iterate
+ * through all registered IPMMUs performing required actions.
+ *
+ * Also take care of restoring special settings, such as translation
+ * table format, etc.
+ */
+static int __must_check ipmmu_suspend(void)
+{
+    struct ipmmu_vmsa_device *mmu;
+
+    if ( !iommu_enabled )
+        return 0;
+
+    printk(XENLOG_DEBUG "ipmmu: Suspending...\n");
+
+    spin_lock(&ipmmu_devices_lock);
+
+    list_for_each_entry( mmu, &ipmmu_devices, list )
+    {
+        if ( ipmmu_is_root(mmu) )
+        {
+            unsigned int i;
+
+            for ( i = 0; i < mmu->num_ctx; i++ )
+            {
+                if ( !mmu->domains[i] )
+                    continue;
+                ipmmu_domain_backup_context(mmu->domains[i]);
+            }
+        }
+        else
+            ipmmu_utlbs_backup(mmu);
+    }
+
+    spin_unlock(&ipmmu_devices_lock);
+
+    return 0;
+}
+
+static void ipmmu_resume(void)
+{
+    struct ipmmu_vmsa_device *mmu;
+
+    if ( !iommu_enabled )
+        return;
+
+    printk(XENLOG_DEBUG "ipmmu: Resuming...\n");
+
+    spin_lock(&ipmmu_devices_lock);
+
+    list_for_each_entry( mmu, &ipmmu_devices, list )
+    {
+        uint32_t reg;
+
+        /* Do not use security group function */
+        reg = IMSCTLR + mmu->features->control_offset_base;
+        ipmmu_write(mmu, reg, ipmmu_read(mmu, reg) & ~IMSCTLR_USE_SECGRP);
+
+        if ( ipmmu_is_root(mmu) )
+        {
+            unsigned int i;
+
+            /* Use stage 2 translation table format */
+            reg = IMSAUXCTLR + mmu->features->control_offset_base;
+            ipmmu_write(mmu, reg, ipmmu_read(mmu, reg) | IMSAUXCTLR_S2PTE);
+
+            for ( i = 0; i < mmu->num_ctx; i++ )
+            {
+                if ( !mmu->domains[i] )
+                    continue;
+                ipmmu_domain_restore_context(mmu->domains[i]);
+            }
+        }
+        else
+            ipmmu_utlbs_restore(mmu);
+    }
+
+    spin_unlock(&ipmmu_devices_lock);
+}
+
+static int ipmmu_alloc_ctx_suspend(struct device *dev)
+{
+    struct ipmmu_vmsa_backup *backup_data;
+    unsigned int *utlbs_val, *asids_val;
+    struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+
+    utlbs_val = xzalloc_array(unsigned int, fwspec->num_ids);
+    if ( !utlbs_val )
+        return -ENOMEM;
+
+    asids_val = xzalloc_array(unsigned int, fwspec->num_ids);
+    if ( !asids_val )
+    {
+        xfree(utlbs_val);
+        return -ENOMEM;
+    }
+
+    backup_data = xzalloc(struct ipmmu_vmsa_backup);
+    if ( !backup_data )
+    {
+        xfree(utlbs_val);
+        xfree(asids_val);
+        return -ENOMEM;
+    }
+
+    backup_data->dev = dev;
+    backup_data->utlbs_val = utlbs_val;
+    backup_data->asids_val = asids_val;
+
+    spin_lock(&ipmmu_devices_backup_lock);
+    list_add(&backup_data->list, &ipmmu_devices_backup);
+    spin_unlock(&ipmmu_devices_backup_lock);
+
+    return 0;
+}
+
+#ifdef CONFIG_HAS_PCI
+static void ipmmu_free_ctx_suspend(struct device *dev)
+{
+    struct ipmmu_vmsa_backup *backup_data, *tmp;
+
+    spin_lock(&ipmmu_devices_backup_lock);
+
+    list_for_each_entry_safe( backup_data, tmp, &ipmmu_devices_backup, list )
+    {
+        if ( backup_data->dev == dev )
+        {
+            list_del(&backup_data->list);
+            xfree(backup_data->utlbs_val);
+            xfree(backup_data->asids_val);
+            xfree(backup_data);
+            break;
+        }
+    }
+
+    spin_unlock(&ipmmu_devices_backup_lock);
+}
+#endif /* CONFIG_HAS_PCI */
+
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 static int ipmmu_domain_init_context(struct ipmmu_vmsa_domain *domain)
 {
     uint64_t ttbr;
@@ -559,6 +821,9 @@ static int ipmmu_domain_init_context(struct ipmmu_vmsa_domain *domain)
         return ret;
 
     domain->context_id = ret;
+#ifdef CONFIG_SYSTEM_SUSPEND
+    domain->mmu->root->reg_backup[ret] = &root_pgtable[ret];
+#endif
 
     /*
      * TTBR0
@@ -615,6 +880,9 @@ static void ipmmu_domain_destroy_context(struct ipmmu_vmsa_domain *domain)
     ipmmu_ctx_write_root(domain, IMCTR, IMCTR_FLUSH);
     ipmmu_tlb_sync(domain);
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+    domain->mmu->root->reg_backup[domain->context_id] = NULL;
+#endif
     ipmmu_domain_free_context(domain->mmu->root, domain->context_id);
 }
 
@@ -1340,10 +1608,11 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
     struct iommu_fwspec *fwspec;
 
 #ifdef CONFIG_HAS_PCI
+    int ret;
+
     if ( dev_is_pci(dev) )
     {
         struct pci_dev *pdev = dev_to_pci(dev);
-        int ret;
 
         if ( devfn != pdev->devfn )
             return 0;
@@ -1371,6 +1640,15 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
         /* Let Xen know that the master device is protected by an IOMMU. */
         dt_device_set_protected(dev_to_dt(dev));
     }
+
+#ifdef CONFIG_SYSTEM_SUSPEND
+    if ( ipmmu_alloc_ctx_suspend(dev) )
+    {
+        dev_err(dev, "Failed to allocate context for suspend\n");
+        return -ENOMEM;
+    }
+#endif
+
 #ifdef CONFIG_HAS_PCI
     if ( dev_is_pci(dev) )
     {
@@ -1379,26 +1657,28 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
         struct pci_host_bridge *bridge;
         struct iommu_fwspec *fwspec_bridge;
         unsigned int utlb_osid0 = 0;
-        int ret;
 
         bridge = pci_find_host_bridge(pdev->seg, pdev->bus);
         if ( !bridge )
         {
             dev_err(dev, "Failed to find host bridge\n");
-            return -ENODEV;
+            ret = -ENODEV;
+            goto free_suspend_ctx;
         }
 
         fwspec_bridge = dev_iommu_fwspec_get(dt_to_dev(bridge->dt_node));
         if ( fwspec_bridge->num_ids < 1 )
         {
             dev_err(dev, "Failed to find host bridge uTLB\n");
-            return -ENXIO;
+            ret = -ENXIO;
+            goto free_suspend_ctx;
         }
 
         if ( fwspec->num_ids < 1 )
         {
             dev_err(dev, "Failed to find uTLB");
-            return -ENXIO;
+            ret = -ENXIO;
+            goto free_suspend_ctx;
         }
 
         rcar4_pcie_osid_regs_init(bridge);
@@ -1407,7 +1687,7 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
         if ( ret < 0 )
         {
             dev_err(dev, "No unused OSID regs\n");
-            return ret;
+            goto free_suspend_ctx;
         }
         reg_id = ret;
 
@@ -1422,7 +1702,7 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
         {
             rcar4_pcie_osid_bdf_clear(bridge, reg_id);
             rcar4_pcie_osid_reg_free(bridge, reg_id);
-            return ret;
+            goto free_suspend_ctx;
         }
     }
 #endif
@@ -1431,6 +1711,13 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
              dev_name(fwspec->iommu_dev), fwspec->num_ids);
 
     return 0;
+#ifdef CONFIG_HAS_PCI
+ free_suspend_ctx:
+#ifdef CONFIG_SYSTEM_SUSPEND
+    ipmmu_free_ctx_suspend(dev);
+#endif
+    return ret;
+#endif
 }
 
 static int ipmmu_iommu_domain_init(struct domain *d)
@@ -1492,6 +1779,10 @@ static const struct iommu_ops ipmmu_iommu_ops =
     .unmap_page      = arm_iommu_unmap_page,
     .dt_xlate        = ipmmu_dt_xlate,
     .add_device      = ipmmu_add_device,
+#ifdef CONFIG_SYSTEM_SUSPEND
+    .suspend         = ipmmu_suspend,
+    .resume          = ipmmu_resume,
+#endif
 };
 
 static __init int ipmmu_init(struct dt_device_node *node, const void *data)
-- 
2.43.0


