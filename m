Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EA2A30957
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 12:02:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885350.1295189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tho2C-0006Fk-VC; Tue, 11 Feb 2025 11:02:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885350.1295189; Tue, 11 Feb 2025 11:02:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tho2C-0006CL-Pz; Tue, 11 Feb 2025 11:02:32 +0000
Received: by outflank-mailman (input) for mailman id 885350;
 Tue, 11 Feb 2025 11:02:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jP5V=VC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tho2A-00057K-TZ
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 11:02:30 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id afd7ccd6-e867-11ef-a075-877d107080fb;
 Tue, 11 Feb 2025 12:02:30 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5de6069ceb5so5053701a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 03:02:30 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5de5b2e4497sm6718505a12.47.2025.02.11.03.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 03:02:28 -0800 (PST)
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
X-Inumbo-ID: afd7ccd6-e867-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739271749; x=1739876549; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v0J/6r0HcECbtbHLj0e8Cd/ZV4FHW6f0HmCPoT2vw4U=;
        b=hpNlYn+kVw/xld2+ERWYaVy9va/IkvfXxk2N6ztNQ+YKf/tKGaWMe/NSIF/ZPt2UCi
         g+DfXrFJJmXdNNtGWb8N/PXfVQk0Ha0ipzwvIfL2WdIZat7O+7lHwvDRygNjOaJzohs2
         Bu6RHGKL3VnKrOwmVMa1YL0ed3+7xz0OxNyrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739271749; x=1739876549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v0J/6r0HcECbtbHLj0e8Cd/ZV4FHW6f0HmCPoT2vw4U=;
        b=uy1cpiU8A5E4Lxt/DaNSbnMccBAy/oRcV1OnjlPESK9AHGV5gUeJ+Wdq2lKH6o9fFK
         Qz7rim73qjNeo36eY1rfAVBuK6el8V1bRCmaDE+jNOWJ97nd/gqQSmkms8rA/RxzFqhz
         uSzvPVjVAVzIRkl4hscVgGf5XR84Yk0JnfwhJGdS2thvut4uddALPXSr79d+1cVNkWcm
         uf0jA9DGILTdq4euMQBa+V6ND7TTHNE7T7MgW9wR5glAZELcZgy4Yq/MDpq097+KFB3i
         PNXgsF5N4IiEdw7TmicfsBA6yHOqYYVoQAPA+jrQbXggBIEXipeRv2QKWXaJCTsnwJmK
         qnhg==
X-Gm-Message-State: AOJu0YyqGNXci9hQYboxvvNpR0PJy6w5s+4TyUDsdNeebxCpU5n7HM25
	lTuGbbBMSi5ax9Tjjeh1+5lgi7gmd6QNZfxJ+1k6mAiyqy59GXhPEz5T2Z18OXgUm8w//5ip4YX
	6
X-Gm-Gg: ASbGncuDcLDMChM6b2w/tfCYaUtyktIU1NgdUcDPALXKMQUSNXot62D7Agp4DYjNQal
	6C7PPN7itzrX0Y+zvbBdQK/W0aG5JQTNKRWL6U7UU/qTH/TEdk/e05KPjcBfYcHNEYTRPEXcV2g
	+b5QSSHfvveoDE0SkE5kNraRTTQENTBYtPUznCkYAQM0H7DQhUAoU1xBYZn85p8W673qEMjH9eg
	Dg3OJ/gmoIWCeJggOsY0UDqMvseqfSR0eEXdBQi9mIJix7gMQh5SsJkjG8lfC28rDM1mO08jPm2
	hxo7rsxpTn/j8N5wtMjy
X-Google-Smtp-Source: AGHT+IEzXzVT2milST5C1MLhluEq9opcNHlF3cwCWBiloyjpzgF15jKKC/E0RoqiGjP2JjsjJTttCQ==
X-Received: by 2002:a05:6402:34cb:b0:5d9:a5b:d84c with SMTP id 4fb4d7f45d1cf-5de9b8d6bf0mr2758961a12.3.1739271749347;
        Tue, 11 Feb 2025 03:02:29 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: oleksii.kurochko@gmail.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH for-4.20 v3 5/5] x86/iommu: disable interrupts at shutdown
Date: Tue, 11 Feb 2025 12:02:09 +0100
Message-ID: <20250211110209.86974-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250211110209.86974-1-roger.pau@citrix.com>
References: <20250211110209.86974-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a new hook to inhibit interrupt generation by the IOMMU(s).  Note the
hook is currently only implemented for x86 IOMMUs.  The purpose is to
disable interrupt generation at shutdown so any kexec chained image finds
the IOMMU(s) in a quiesced state.

It would also prevent "Receive accept error" being raised as a result of
non-disabled interrupts targeting offline CPUs.

Note that the iommu_quiesce() call in nmi_shootdown_cpus() is still
required even when there's a preceding iommu_crash_shutdown() call; the
later can become a no-op depending on the setting of the "crash-disable"
command line option.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - New in this version.
 - Expand commit message.
 - Check if the hook is implemented before attempting to call it.
---
 xen/arch/x86/crash.c                        |  1 +
 xen/arch/x86/smp.c                          |  1 +
 xen/drivers/passthrough/amd/iommu.h         |  1 +
 xen/drivers/passthrough/amd/iommu_init.c    | 17 +++++++++++++++++
 xen/drivers/passthrough/amd/pci_amd_iommu.c |  1 +
 xen/drivers/passthrough/iommu.c             | 12 ++++++++++++
 xen/drivers/passthrough/vtd/iommu.c         | 19 +++++++++++++++++++
 xen/include/xen/iommu.h                     |  3 +++
 8 files changed, 55 insertions(+)

diff --git a/xen/arch/x86/crash.c b/xen/arch/x86/crash.c
index 621af81acc09..7a65f806100f 100644
--- a/xen/arch/x86/crash.c
+++ b/xen/arch/x86/crash.c
@@ -184,6 +184,7 @@ static void nmi_shootdown_cpus(void)
 
         disable_IO_APIC();
         hpet_disable();
+        iommu_quiesce();
     }
 }
 
diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
index 28bc041e03a9..516dab5528c1 100644
--- a/xen/arch/x86/smp.c
+++ b/xen/arch/x86/smp.c
@@ -377,6 +377,7 @@ void smp_send_stop(void)
     pci_disable_msi_all();
     disable_IO_APIC();
     hpet_disable();
+    iommu_quiesce();
 
     if ( num_online_cpus() > 1 )
     {
diff --git a/xen/drivers/passthrough/amd/iommu.h b/xen/drivers/passthrough/amd/iommu.h
index c32e9e9a1602..00e81b4b2ab3 100644
--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -292,6 +292,7 @@ extern unsigned long *shared_intremap_inuse;
 void cf_check amd_iommu_resume(void);
 int __must_check cf_check amd_iommu_suspend(void);
 void cf_check amd_iommu_crash_shutdown(void);
+void cf_check amd_iommu_quiesce(void);
 
 static inline u32 get_field_from_reg_u32(u32 reg_value, u32 mask, u32 shift)
 {
diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
index ed5e684b93da..934adc5abe59 100644
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -1608,3 +1608,20 @@ void cf_check amd_iommu_resume(void)
         invalidate_all_domain_pages();
     }
 }
+
+void cf_check amd_iommu_quiesce(void)
+{
+    struct amd_iommu *iommu;
+
+    for_each_amd_iommu ( iommu )
+    {
+        if ( iommu->ctrl.int_cap_xt_en )
+        {
+            iommu->ctrl.int_cap_xt_en = false;
+            writeq(iommu->ctrl.raw,
+                   iommu->mmio_base + IOMMU_CONTROL_MMIO_OFFSET);
+        }
+        else
+            amd_iommu_msi_enable(iommu, IOMMU_CONTROL_DISABLED);
+    }
+}
diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
index f96f59440bcc..d00697edb3a2 100644
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -791,6 +791,7 @@ static const struct iommu_ops __initconst_cf_clobber _iommu_ops = {
     .crash_shutdown = amd_iommu_crash_shutdown,
     .get_reserved_device_memory = amd_iommu_get_reserved_device_memory,
     .dump_page_tables = amd_dump_page_tables,
+    .quiesce = amd_iommu_quiesce,
 };
 
 static const struct iommu_init_ops __initconstrel _iommu_init_ops = {
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 9e74a1fc72fa..16aad86973f9 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -663,6 +663,18 @@ void iommu_crash_shutdown(void)
 #endif
 }
 
+void iommu_quiesce(void)
+{
+    const struct iommu_ops *ops;
+
+    if ( !iommu_enabled )
+        return;
+
+    ops = iommu_get_ops();
+    if ( ops->quiesce )
+        iommu_vcall(ops, quiesce);
+}
+
 int iommu_get_reserved_device_memory(iommu_grdm_t *func, void *ctxt)
 {
     const struct iommu_ops *ops;
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index 9d7a9977a6a6..a1927d9f126d 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -3207,6 +3207,24 @@ static int cf_check intel_iommu_quarantine_init(struct pci_dev *pdev,
     return rc;
 }
 
+static void cf_check vtd_quiesce(void)
+{
+    const struct acpi_drhd_unit *drhd;
+
+    for_each_drhd_unit ( drhd )
+    {
+        const struct vtd_iommu *iommu = drhd->iommu;
+        uint32_t sts = dmar_readl(iommu->reg, DMAR_FECTL_REG);
+
+        /*
+         * Open code dma_msi_mask() to avoid taking the spinlock which could
+         * deadlock if called from crash context.
+         */
+        sts |= DMA_FECTL_IM;
+        dmar_writel(iommu->reg, DMAR_FECTL_REG, sts);
+    }
+}
+
 static const struct iommu_ops __initconst_cf_clobber vtd_ops = {
     .page_sizes = PAGE_SIZE_4K,
     .init = intel_iommu_domain_init,
@@ -3236,6 +3254,7 @@ static const struct iommu_ops __initconst_cf_clobber vtd_ops = {
     .iotlb_flush = iommu_flush_iotlb,
     .get_reserved_device_memory = intel_iommu_get_reserved_device_memory,
     .dump_page_tables = vtd_dump_page_tables,
+    .quiesce = vtd_quiesce,
 };
 
 const struct iommu_init_ops __initconstrel intel_iommu_init_ops = {
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index b928c67e1995..77a514019cc6 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -314,6 +314,8 @@ struct iommu_ops {
      */
     int (*dt_xlate)(device_t *dev, const struct dt_phandle_args *args);
 #endif
+    /* Inhibit all interrupt generation, to be used at shutdown. */
+    void (*quiesce)(void);
 };
 
 /*
@@ -404,6 +406,7 @@ static inline int iommu_do_domctl(struct xen_domctl *domctl, struct domain *d,
 int __must_check iommu_suspend(void);
 void iommu_resume(void);
 void iommu_crash_shutdown(void);
+void iommu_quiesce(void);
 int iommu_get_reserved_device_memory(iommu_grdm_t *func, void *ctxt);
 int iommu_quarantine_dev_init(device_t *dev);
 
-- 
2.46.0


