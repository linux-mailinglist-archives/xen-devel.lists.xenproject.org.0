Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEB0A2AC20
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 16:06:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882925.1293051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg3SZ-0004AK-Ty; Thu, 06 Feb 2025 15:06:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882925.1293051; Thu, 06 Feb 2025 15:06:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg3SZ-000485-PT; Thu, 06 Feb 2025 15:06:31 +0000
Received: by outflank-mailman (input) for mailman id 882925;
 Thu, 06 Feb 2025 15:06:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rEyC=U5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tg3SX-0002qU-O8
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 15:06:29 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0e4c8fa-e49b-11ef-a073-877d107080fb;
 Thu, 06 Feb 2025 16:06:28 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-ab74ecfdae4so152183166b.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Feb 2025 07:06:28 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab772f842a5sm112190766b.43.2025.02.06.07.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 07:06:27 -0800 (PST)
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
X-Inumbo-ID: f0e4c8fa-e49b-11ef-a073-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738854388; x=1739459188; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=54IsyjeaR6PU2ZI4fbX9EXq6TKKgpbduJj8jzthLGEQ=;
        b=KTONNa/aFGTpaMZ2NAR8UGdWKFP+X8YPa2nXwwoiZAqa4ihISBP5VpzQgUD8pbxzBl
         Y1PxK6WN8SaUQZ95GOt2ES0Al785ayrlHByUfzDJVORWOY4MK/QnC4VcVv/CCNUBwhQC
         wyLAey92/wIXDirHzIZR7/7Ks+i3vtTxpkVSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738854388; x=1739459188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=54IsyjeaR6PU2ZI4fbX9EXq6TKKgpbduJj8jzthLGEQ=;
        b=uXmrYqbS4x77jCAZD5AXGDzznXdERbNZWjn37JV53rhnGOpqRo1UZ1BqMwtf3XkKXi
         6m3xfa+tBnsWESq+vAHP5dhqnwXUqM2aGhY4kfzRu/VMW/nvmRv5eQM6Jf3QeVitSGxA
         kkGJ86m5lDzKS7ks7loCYYtLQp/e0qZMPamNUZaiDLyg2zqvOBiskDBVXoNwG4CoCz5a
         eF7R88y4EOhXBfulSwIKyycnbatLNFb6HUjgiRNMjG3pgdpkR+gZ0/7+5VcH5/y1Byr3
         Chu/2B6AhWsHSGmhyX5V5S3DIqEh7VW6/ceMw11PIU2Je2/k/6jsKQSnrpQ+5shIFpDB
         qLdQ==
X-Gm-Message-State: AOJu0Yzv2eM3UC0awFw74N3lkhiaPqfYBPdEx99KOd/1do2UGIsQ4VyX
	mpvRNKTRWOjyh4elZ65zUmoNWJNj5arKixfYhPMGBPpwe2rt28zfNtAZ1Gn3KIzDhKnsQ+OIFlZ
	j
X-Gm-Gg: ASbGncubV4To9soJ47E2V20H3WCunM6qc9VioOSKlxS1m3Y+6qKaT5bJAFjw+PfC334
	VEfNq7M/qeI/ZXu8DK2m9T0Z2BuZb+YZ6Umj1m1rlzNgWs0G1vEJW1c+qQeDGr3ixP1xQSc79GV
	UQgCGWC5RfceSf2lDnhfpZqU4kqeJMc5dcn42Eon0T2fIA0PuKavb/kXyscQfqDBtHgeRM4HPxl
	9NFa3JcfM3MYhxL6oLlAghIskWQ8J2LVx08SRwoK1lpvJQYGwBouYH2Ks1Ey7IqZ2SXq8sAX2kQ
	JxZVdD8aQ1/vl/esr5vr
X-Google-Smtp-Source: AGHT+IE+G9fd4+/h481OwTZe16KfLx8FrIvqJv3B5R5S7j0ovNsKJOOtNzp56KhI3/IPrMbqjeCQaQ==
X-Received: by 2002:a17:907:6e92:b0:aa6:9eac:4b8e with SMTP id a640c23a62f3a-ab75e2f6e43mr994010366b.41.1738854387948;
        Thu, 06 Feb 2025 07:06:27 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 5/5] x86/iommu: disable interrupts at shutdown
Date: Thu,  6 Feb 2025 16:06:15 +0100
Message-ID: <20250206150615.52052-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250206150615.52052-1-roger.pau@citrix.com>
References: <20250206150615.52052-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a new hook to inhibit interrupt generation by the IOMMU(s).  Note the
hook is currently only implemented for x86 IOMMUs.  The purpose is to
disable interrupt generation at shutdown so any kexec chained image finds
the IOMMU(s) in a quiesced state.

It would also prevent "Receive accept error" being raised as a result of
non-disabled interrupts targeting offline CPUs.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - New in this version.
---
 xen/arch/x86/crash.c                        |  1 +
 xen/arch/x86/smp.c                          |  1 +
 xen/drivers/passthrough/amd/iommu.h         |  1 +
 xen/drivers/passthrough/amd/iommu_init.c    | 17 +++++++++++++++++
 xen/drivers/passthrough/amd/pci_amd_iommu.c |  1 +
 xen/drivers/passthrough/iommu.c             |  6 ++++++
 xen/drivers/passthrough/vtd/iommu.c         | 19 +++++++++++++++++++
 xen/include/xen/iommu.h                     |  3 +++
 8 files changed, 49 insertions(+)

diff --git a/xen/arch/x86/crash.c b/xen/arch/x86/crash.c
index c946225c0b9b..a5feed298d1e 100644
--- a/xen/arch/x86/crash.c
+++ b/xen/arch/x86/crash.c
@@ -178,6 +178,7 @@ static void nmi_shootdown_cpus(void)
         disable_IO_APIC();
         hpet_disable();
         pci_disable_msi_all();
+        iommu_quiesce();
     }
 }
 
diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
index f58c8d3cafe1..06c0e84d40b3 100644
--- a/xen/arch/x86/smp.c
+++ b/xen/arch/x86/smp.c
@@ -377,6 +377,7 @@ void smp_send_stop(void)
     disable_IO_APIC();
     hpet_disable();
     pci_disable_msi_all();
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
index 302362502033..2e60aef151b0 100644
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -1611,3 +1611,20 @@ void cf_check amd_iommu_resume(void)
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
index 9e74a1fc72fa..35c08ee0612c 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -663,6 +663,12 @@ void iommu_crash_shutdown(void)
 #endif
 }
 
+void iommu_quiesce(void)
+{
+    if ( iommu_enabled )
+        iommu_vcall(iommu_get_ops(), quiesce);
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


