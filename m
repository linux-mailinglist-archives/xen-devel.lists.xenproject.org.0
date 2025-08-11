Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76098B216D0
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 22:51:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078031.1439061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulZU3-000498-1K; Mon, 11 Aug 2025 20:51:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078031.1439061; Mon, 11 Aug 2025 20:51:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulZU2-00048I-PB; Mon, 11 Aug 2025 20:51:06 +0000
Received: by outflank-mailman (input) for mailman id 1078031;
 Mon, 11 Aug 2025 20:51:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=21ui=2X=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1ulZSA-00063z-2n
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 20:49:10 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9fa45a96-76f4-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 22:49:07 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-af94e75445dso864827266b.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 13:49:07 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.Dlink ([77.52.179.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a3bd2sm2065710466b.54.2025.08.11.13.49.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 13:49:05 -0700 (PDT)
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
X-Inumbo-ID: 9fa45a96-76f4-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754945346; x=1755550146; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DKWyc9yALBseWqY+orGA6xUBZdWqywovXSPAegimSF0=;
        b=JY7DhqLC4jP6D+BTpGs5YLEur644BkZv1h+Bk53KRz3ABuQioO1y9u7pa1aRh8kMh/
         jZQygWQBY4jCk0K2uURsJAMZqwPR7ryX08y6a43UpHM66W7z2WIx33SdWEmULYM3uaae
         5BeE35Tq89hH7KxNSWQiuyDcgsR0VdpLn49bC+gSQgUyNOYzXz7iKlfoTJhjhciEjIp9
         GzJwOZQk6UuE/VfleSPTEkCnci/r085kxpwlnZZu9H5J3vpbbSJewhwmsVJMKGUxyl7a
         YOxVIwIBdKQ69MGMpsbW0DGMqwn7AXus4RP9ozYuZbzOFVoCwhqpssxxJrabUpBRCeIs
         fWoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754945346; x=1755550146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DKWyc9yALBseWqY+orGA6xUBZdWqywovXSPAegimSF0=;
        b=mS2wys4dx9zXodZmWxgk+zbkFzuIvyNeZC2tb15BR/oeysnqnkGjqc05u1DVrHJJsY
         WCzzwS6Wtq8wucsGRqZD9pW2E35WCF4bXMH2THA8u9X0h1DAkt3ipyKJwjk4jz2AJSMr
         WfzaDoPfP4mhUXNslTFJKMn8YfNxSmN6L+7nprxZMo3/HmFU13ut4AW8MvArqG/DocNg
         LGi13hythkxnTULxveh9UWEDSqGu5tGGrFFAOymQz6s9dslHO48Qgxi7RrxSC8z8KSFf
         cduveHVhOOl1PLrEiZ3PDnqJ/kdMzhKyrjLcvME1sTMlesnenzyZg72a2JhuJaBofklK
         p7Cg==
X-Gm-Message-State: AOJu0Yzm1A8/JuVc9nqWbQViG03vRheCVt/h4unM82DvsZF6tgdn3Mte
	Kp3ggu6+92g3LkZEcuNY05PCIP8+EN2RPZruypIJRG0JaZY2xqVA7+WejuufpQ==
X-Gm-Gg: ASbGncsL9GD1VP5PT77/pDqHJF9f5RPfO2y5hAwZxDvL3yAf8eS2ZSENdwnSfYzKU/h
	bp+aO/gQe31uMIuReoNnoEOOLcuyo4wNbF2gTU6tpY9s6cjTVOcyvCLOgf/h8YKftEr3JDEPrHX
	bmhVyRtUscOtg4GJtACBFbZLGbTwPWIG5CnH2TxVSBQ4s7DYL5H4Cv1RldTFWxsVuShmIfL8Tv4
	PXvEOmJKjcATpaRBOcbHPCdEdnGowJod7YeHPduHzNY7mfQ7txj6vUZ0+4Di9VqmrVSVT1YhEiG
	QCdojfX1a2WTkNY0rH7g/T2u2zAssraAXdQDHxLiPYnb5Lgh0kD4RvlNBe2e56ITx+eysZSfZRo
	mx4oVBT0X36WSN4aIeSDHAXr4S1tfxY4sk5RCbjc+BelDd4ArzIE+sRtS7lI55H9mtmpbdTXoQv
	ioFA==
X-Google-Smtp-Source: AGHT+IEvypqo7NpLmFUTRzjOWjD+M/zWBTlCHQtbMInufWtjBmIYbsnsHqopRx+UCqdZKj8BBLeoGw==
X-Received: by 2002:a17:906:ef0b:b0:ade:4121:8d52 with SMTP id a640c23a62f3a-afa1e040d30mr79910766b.16.1754945346249;
        Mon, 11 Aug 2025 13:49:06 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Mykola Kvach <mykola_kvach@epam.com>
Subject: [PATCH v5 11/12] iommu/ipmmu-vmsa: Implement suspend/resume callbacks
Date: Mon, 11 Aug 2025 23:48:07 +0300
Message-ID: <1689d707b930b1ea4f63cc150810e548962cda81.1754943875.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1754943874.git.mykola_kvach@epam.com>
References: <cover.1754943874.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Store and restore active context and micro-TLB registers.

Tested on R-Car H3 Starter Kit.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 269 +++++++++++++++++++++++
 1 file changed, 269 insertions(+)

diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
index dac0dd6d46..ced762657a 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -58,6 +58,8 @@
 #define dev_print(dev, lvl, fmt, ...)    \
     printk(lvl "ipmmu: %s: " fmt, dev_name(dev), ## __VA_ARGS__)
 
+#define dev_dbg(dev, fmt, ...)    \
+    dev_print(dev, XENLOG_DEBUG, fmt, ## __VA_ARGS__)
 #define dev_info(dev, fmt, ...)    \
     dev_print(dev, XENLOG_INFO, fmt, ## __VA_ARGS__)
 #define dev_warn(dev, fmt, ...)    \
@@ -117,6 +119,23 @@ struct ipmmu_features {
     unsigned int imuctr_ttsel_mask;
 };
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+struct hw_register {
+    const char *reg_name;
+    unsigned int reg_offset;
+    unsigned int reg_data;
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
@@ -129,6 +148,9 @@ struct ipmmu_vmsa_device {
     struct ipmmu_vmsa_domain *domains[IPMMU_CTX_MAX];
     unsigned int utlb_refcount[IPMMU_UTLB_MAX];
     const struct ipmmu_features *features;
+#ifdef CONFIG_SYSTEM_SUSPEND
+    struct hw_register *reg_backup[IPMMU_CTX_MAX];
+#endif
 };
 
 /*
@@ -534,6 +556,235 @@ static void ipmmu_domain_free_context(struct ipmmu_vmsa_device *mmu,
     spin_unlock_irqrestore(&mmu->lock, flags);
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+static DEFINE_SPINLOCK(ipmmu_devices_backup_lock);
+static LIST_HEAD(ipmmu_devices_backup);
+
+#define HW_REGISTER_BACKUP_SIZE 4
+
+static struct hw_register root_pgtable[IPMMU_CTX_MAX][HW_REGISTER_BACKUP_SIZE] = {
+    [0 ... (IPMMU_CTX_MAX - 1)] = {
+        {"IMTTLBR0", IMTTLBR0, 0},
+        {"IMTTUBR0", IMTTUBR0, 0},
+        {"IMTTBCR",  IMTTBCR,  0},
+        {"IMCTR",    IMCTR,    0},
+    }
+};
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
+    struct hw_register *reg = mmu->reg_backup[domain->context_id];
+    unsigned int i;
+
+    dev_dbg(mmu->dev, "Handle domain context %u backup\n", domain->context_id);
+
+    for ( i = 0; i < HW_REGISTER_BACKUP_SIZE; i++ )
+        reg[i].reg_data = ipmmu_ctx_read_root(domain, reg[i].reg_offset);
+}
+
+static void ipmmu_domain_restore_context(struct ipmmu_vmsa_domain *domain)
+{
+    struct ipmmu_vmsa_device *mmu = domain->mmu->root;
+    struct hw_register *reg = mmu->reg_backup[domain->context_id];
+    unsigned int i;
+
+    dev_dbg(mmu->dev, "Handle domain context %u restore\n", domain->context_id);
+
+    for ( i = 0; i < HW_REGISTER_BACKUP_SIZE; i++ )
+    {
+        if ( reg[i].reg_offset != IMCTR )
+            ipmmu_ctx_write_root(domain, reg[i].reg_offset, reg[i].reg_data);
+        else
+            ipmmu_ctx_write_all(domain, reg[i].reg_offset,
+                                reg[i].reg_data | IMCTR_FLUSH);
+    }
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
@@ -546,6 +797,9 @@ static int ipmmu_domain_init_context(struct ipmmu_vmsa_domain *domain)
         return ret;
 
     domain->context_id = ret;
+#ifdef CONFIG_SYSTEM_SUSPEND
+    domain->mmu->root->reg_backup[ret] = root_pgtable[ret];
+#endif
 
     /*
      * TTBR0
@@ -602,6 +856,9 @@ static void ipmmu_domain_destroy_context(struct ipmmu_vmsa_domain *domain)
     ipmmu_ctx_write_root(domain, IMCTR, IMCTR_FLUSH);
     ipmmu_tlb_sync(domain);
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+    domain->mmu->root->reg_backup[domain->context_id] = NULL;
+#endif
     ipmmu_domain_free_context(domain->mmu->root, domain->context_id);
 }
 
@@ -1307,6 +1564,14 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
     /* Let Xen know that the master device is protected by an IOMMU. */
     dt_device_set_protected(dev_to_dt(dev));
 
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
 
@@ -1372,6 +1637,10 @@ static const struct iommu_ops ipmmu_iommu_ops =
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


