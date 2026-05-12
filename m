Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4au7GvdeA2r55QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 19:10:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFB45257BD
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 19:10:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307283.1579050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMqcE-0007P4-Vq; Tue, 12 May 2026 17:09:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307283.1579050; Tue, 12 May 2026 17:09:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMqcE-0007I9-N5; Tue, 12 May 2026 17:09:54 +0000
Received: by outflank-mailman (input) for mailman id 1307283;
 Tue, 12 May 2026 17:09:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wMqcD-0007Av-Q1
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 17:09:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMqcD-007RzZ-6w
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 19:09:53 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a035ec9-2eae-0a2a0a5409dd-0a2a4501afae-36
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 19:09:53 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a035ee1-c1f2-0a2a45010019-d155802cc06e-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 19:09:53 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-488a9033b2cso53223425e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 10:09:53 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.26.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fc8cccf90sm10838845e9.0.2026.05.12.10.09.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 10:09:51 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778605792; x=1779210592; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pT1AJ8vJVr+Es3f8Ijw7DVXZgIihu6GcB10i8wyJqXY=;
        b=XQaNkCv8e/xa6SJp6IaorzUiICTIe73+1JmcUsd7VJNI0RZcR/jVPptk9XT+g4F8XT
         dpgdWPnMiKlTQPjnBTk7R7O/LBC8bki+4WzgRIelT0JFTndVNaBdBlT9UkgC24RfqeHi
         bCuebZD7KY52QT8zBbzic4P7578bpyk174LxK9ItpjjjFapdw/SB0I85P8m2LAZqa7n/
         V1eop4xuJVZGvu5Iij9vfSL0VVVJa2NGkzOp2b8k+TOsrb8V3tEb41kZHw225i7HAiiw
         cSSgBR8CPd4SUxa5tVMRGafOHG5YNJZ5aDx90aOq9oWTMuLS5x21NwQ7xu7W6moho+uW
         xTCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778605792; x=1779210592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pT1AJ8vJVr+Es3f8Ijw7DVXZgIihu6GcB10i8wyJqXY=;
        b=TenhDgYb3Qkuxlbo6e+xIykiN77Qb26G4xBrgHnmruAXNWm+zKDD811w1t6nvZLnnM
         lIPvSfAxsvp9j+UFFm5srk3KuD0Bfq1pGjSeL0IjsIlVyA3R8oacExbAPXAUtYq1yWuZ
         tW7A3dEJ4J1uGvyxlSNsDRqXbqB/WFjEQ492mLKo5coS4piZwX2BYT+hR2QCNPtaTnTc
         ImYh2sNqDK01ZtRnSmmC8CKQG8cuxnBcConKb+gmvRT0JMvYETH0NuXpFiIwXJeR68lo
         6Kaj9nYTzBcKjhh6mnaNmsZHodj4H+ec6RcGLcuuDkdPPzk4o1sTwwMVx3Nxog2gT0Of
         y4Mg==
X-Gm-Message-State: AOJu0YzpJJL9q5yNmz9vUVyTuSIeXrRBJxIyBjUtiGkvB6O3yjh7kAzM
	mvkY3wvhIPmkkUJJ7KeboRfU+oM8QvVKB21AYkC7Ubv3IVfkUVo7mDoGxVMmCg==
X-Gm-Gg: Acq92OHfz1CjpF/tiBPvlJR8Ais0/YSYfZOnUJe12xXnbNF/XnV7xbg8CF450W+kCAR
	8DZpVYMQ2uMZCMm3Ov2xHbnztZKQ1c8lrGlF7RMx8hZUYW19PAisKeOeebwJ8aDW/az2smWpZSx
	kpzFAvdYPwGaxXyZne4KO46JYRLwsakaT1ItmhVYSqzHB2xi6qoLuRF4jo/NQIUqQF9bygu4Jrb
	IBmbyPVdkKE4v7QHpHd4TnT72kT+ESyexAuwpNqRI0sx5IdvUlKqV1fhWaiTJGiZvha9zPznRDN
	dem1VqLHSc3omvQp5aYdvdpX5AnQ6+/7Mt51AN8MjXLn0Gle8aa6UKeBp/K+NS0SDfXyeaJJHHj
	3oazqu/gZOMW8sp86uTt/IzT16FqanYobOfW6VT63a7XHvxRzxq9B2TVoO8gkGSpnwSyUymNL7t
	w8Dt1a28it85GM4kC3kZsvmYYe+A==
X-Received: by 2002:a05:600c:4ec7:b0:48e:51f8:eb37 with SMTP id 5b1f17b1804b1-48e706d8ad9mr242690535e9.25.1778605791897;
        Tue, 12 May 2026 10:09:51 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v9 08/13] iommu/ipmmu-vmsa: Implement suspend/resume callbacks
Date: Tue, 12 May 2026 20:07:15 +0300
Message-ID: <4162aa58c351677a4a267fe85989c6d4e07487d8.1778605274.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1778605274.git.mykola_kvach@epam.com>
References: <cover.1778605274.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1778605793-B715BFF4-1027C592/0/0
X-purgate-type: clean
X-purgate-size: 13768
X-Rspamd-Queue-Id: ECFB45257BD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Store and restore active context and micro-TLB registers.

Tested on R-Car H3 Starter Kit.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in V9:
- set dt_device_set_protected() only after ipmmu_alloc_ctx_suspend()
  succeeds, so DT devices do not remain protected on allocation failure.

Changes in V7:
- moved suspend context allocation before pci stuff
---
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 319 +++++++++++++++++++++--
 1 file changed, 304 insertions(+), 15 deletions(-)

diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
index fa9ab9cb13..e1b47a5824 100644
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
 
@@ -1338,10 +1606,11 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
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
@@ -1358,17 +1627,24 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
     if ( !to_ipmmu(dev) )
         return -ENODEV;
 
-    if ( !dev_is_pci(dev) )
+    if ( !dev_is_pci(dev) && dt_device_is_protected(dev_to_dt(dev)) )
     {
-        if ( dt_device_is_protected(dev_to_dt(dev)) )
-        {
-            dev_err(dev, "Already added to IPMMU\n");
-            return -EEXIST;
-        }
+        dev_err(dev, "Already added to IPMMU\n");
+        return -EEXIST;
+    }
 
-        /* Let Xen know that the master device is protected by an IOMMU. */
-        dt_device_set_protected(dev_to_dt(dev));
+#ifdef CONFIG_SYSTEM_SUSPEND
+    if ( ipmmu_alloc_ctx_suspend(dev) )
+    {
+        dev_err(dev, "Failed to allocate context for suspend\n");
+        return -ENOMEM;
     }
+#endif
+
+    /* Let Xen know that the master device is protected by an IOMMU. */
+    if ( !dev_is_pci(dev) )
+        dt_device_set_protected(dev_to_dt(dev));
+
 #ifdef CONFIG_HAS_PCI
     if ( dev_is_pci(dev) )
     {
@@ -1377,26 +1653,28 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
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
@@ -1405,7 +1683,7 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
         if ( ret < 0 )
         {
             dev_err(dev, "No unused OSID regs\n");
-            return ret;
+            goto free_suspend_ctx;
         }
         reg_id = ret;
 
@@ -1420,7 +1698,7 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
         {
             rcar4_pcie_osid_bdf_clear(bridge, reg_id);
             rcar4_pcie_osid_reg_free(bridge, reg_id);
-            return ret;
+            goto free_suspend_ctx;
         }
     }
 #endif
@@ -1429,6 +1707,13 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
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
@@ -1490,6 +1775,10 @@ static const struct iommu_ops ipmmu_iommu_ops =
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


