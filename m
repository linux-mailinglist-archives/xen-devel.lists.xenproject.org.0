Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDDBB3F0DF
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 00:10:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105403.1456377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utCjR-0006Ta-8I; Mon, 01 Sep 2025 22:10:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105403.1456377; Mon, 01 Sep 2025 22:10:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utCjR-0006MQ-3N; Mon, 01 Sep 2025 22:10:33 +0000
Received: by outflank-mailman (input) for mailman id 1105403;
 Mon, 01 Sep 2025 22:10:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pPXY=3M=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1utCjP-0005XP-Gv
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 22:10:31 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7927e6f3-8780-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 00:10:30 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-55f7b6e4145so1330704e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 15:10:30 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608279307asm123038e87.75.2025.09.01.15.10.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 15:10:28 -0700 (PDT)
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
X-Inumbo-ID: 7927e6f3-8780-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756764630; x=1757369430; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RY9tX/c5T2T5//S4piNjlgD25sf5vU9/GmLRb02Wl1w=;
        b=XVAO+pdutTd1AVWu2A18pCKhyfR6/QhArEcEJ7X3+UTFtlM/oJ9Cy/qe6lmWvBLSnU
         W8rfxGND1yHwimQgs/cMVsJMad1BPYGQN9y0Cl3dsFh5OvIkYTmwEJIlNhcbrIDm4UM+
         aKw3bTlXu3zlKLUwLYXXgiQaZFhtqrHQ7pDjfKLt7bdnKGCdSncNslurzFXY9dAMXF1i
         C6jvYlxu8fF1yR32WsIu6GzUgywRGya6P3IkLAfjFll0qjaI+n9/Xrnz1oPKkifMvrwU
         bn/gXOcj2zsp+NPlUU1Fv8Wif8nU9DcLVpLxXB7atTrJ5qSkKCDH1XymDV5X6pezRbBK
         gEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756764630; x=1757369430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RY9tX/c5T2T5//S4piNjlgD25sf5vU9/GmLRb02Wl1w=;
        b=dwpBemIhreX5Y7mic3+KIwzrMMNjTYbu63IQNz+EW8dYauFOEXBpLuwCKxSXqeWpPy
         Jj8m0hEm5ubw4YVMU8DkYQpd8rzxg31AnuKSq2FgCQjyhA+tGeA84N6cH+Vd+BIbBbZd
         dNlQyhGwg7jIXv6vKfYhrjNl4riMym6DP1IfU4tX0NPnB+JxVu/nfkydB/kM1KAer1pD
         h82njPNp2bvsIBa3YZdqrm8jSWLjk5SzJ/d27MisnlUbDnRAQ94mvlwFgOJLMHDXjdfz
         BNbCOcyzMiet/nBtzDMj5zhSHzMM0g1Ns9OLRgeQ5Ndy6Q5wTutgg3YsHBixkaKFEkZ3
         jmEg==
X-Gm-Message-State: AOJu0YxcAJX7JeNY3sM6JxdWw/Gd15b4CUWFrNfg3wt0Wo6aATpxJSJb
	va5DLK7WRlAhcpKRKtc6JjAgs63yif4EC83eJO7+8Rs6bQMMAkpe3DE2hJfUV9fu
X-Gm-Gg: ASbGnctGeLmsAG2+gOEXpO+u7BkNVmQyya/6toY8/EqzdwtGEWokrzmUYleOTQUVRsZ
	JA0TzUy6NIyGQNn9eGA70TiB/85d+XWEDVct6eidFI5NPHhRADVugqEY3fDL8axr2PcrfMw7xwQ
	SYzm+5plEIX0NnHmOCcO9mhtm90FneLtJ3bfN1GTbs41+E1uAIwKyxpIZb3SuKWnhcjm+7TTy0i
	n4XaUlulaWlTRO0r/sRYk7+RvxXMZIp8N2PkvA4Z8wHbzegQU18nGExiWgxlus9ocFFilUqjDIb
	SbPbBv2mUn4uNRngECfZKk3HEsVhAJLESm2QBIipbfSO8ZOB2GUAiFv6XelQ3pzChIJ3RkJF+JX
	caK9ollVKydjbOMX2XJZ0s/j6Eo9ccJN62fp/ReNaM8xUgM/ZGB6qvFAY5SmAnlFJ0i1GMq2K
X-Google-Smtp-Source: AGHT+IEkwBm4cpJTQnKBoX8tD+SaJ/XRbp9ktMXnYGjhR+0nJcJbopep6TTT4iDCLZRyqgZKntvLtQ==
X-Received: by 2002:a05:6512:2610:b0:55f:3f03:946d with SMTP id 2adb3069b0e04-55f708b60dcmr2388583e87.23.1756764629748;
        Mon, 01 Sep 2025 15:10:29 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Mykola Kvach <mykola_kvach@epam.com>
Subject: [PATCH v6 07/13] iommu/ipmmu-vmsa: Implement suspend/resume callbacks
Date: Tue,  2 Sep 2025 01:10:11 +0300
Message-ID: <3a05d0f188943173703690981a7590fd12fabd4c.1756763487.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1756763487.git.mykola_kvach@epam.com>
References: <cover.1756763487.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Store and restore active context and micro-TLB registers.

Tested on R-Car H3 Starter Kit.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in V6:
- refactor code related to hw_register struct, from now it's called
  ipmmu_reg_ctx
---
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 257 +++++++++++++++++++++++
 1 file changed, 257 insertions(+)

diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
index ea9fa9ddf3..0973559861 100644
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
@@ -547,6 +570,222 @@ static void ipmmu_domain_free_context(struct ipmmu_vmsa_device *mmu,
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
+    printk(XENLOG_DEBUG "ipmmu: Suspending ...\n");
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
+    printk(XENLOG_DEBUG "ipmmu: Resuming ...\n");
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
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 static int ipmmu_domain_init_context(struct ipmmu_vmsa_domain *domain)
 {
     uint64_t ttbr;
@@ -559,6 +798,9 @@ static int ipmmu_domain_init_context(struct ipmmu_vmsa_domain *domain)
         return ret;
 
     domain->context_id = ret;
+#ifdef CONFIG_SYSTEM_SUSPEND
+    domain->mmu->root->reg_backup[ret] = &root_pgtable[ret];
+#endif
 
     /*
      * TTBR0
@@ -615,6 +857,9 @@ static void ipmmu_domain_destroy_context(struct ipmmu_vmsa_domain *domain)
     ipmmu_ctx_write_root(domain, IMCTR, IMCTR_FLUSH);
     ipmmu_tlb_sync(domain);
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+    domain->mmu->root->reg_backup[domain->context_id] = NULL;
+#endif
     ipmmu_domain_free_context(domain->mmu->root, domain->context_id);
 }
 
@@ -1427,6 +1672,14 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
     }
 #endif
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+    if ( ipmmu_alloc_ctx_suspend(dev) )
+    {
+        dev_err(dev, "Failed to allocate context for suspend\n");
+        return -ENOMEM;
+    }
+#endif
+
     dev_info(dev, "Added master device (IPMMU %s micro-TLBs %u)\n",
              dev_name(fwspec->iommu_dev), fwspec->num_ids);
 
@@ -1492,6 +1745,10 @@ static const struct iommu_ops ipmmu_iommu_ops =
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
2.48.1


