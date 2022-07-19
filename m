Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2D357A596
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 19:43:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370809.602783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDrFm-0000ei-B0; Tue, 19 Jul 2022 17:43:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370809.602783; Tue, 19 Jul 2022 17:43:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDrFl-0000a0-UN; Tue, 19 Jul 2022 17:43:25 +0000
Received: by outflank-mailman (input) for mailman id 370809;
 Tue, 19 Jul 2022 17:43:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D6sG=XY=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oDrFi-00065X-Q4
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 17:43:22 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4852fe6a-078a-11ed-924f-1f966e50362f;
 Tue, 19 Jul 2022 19:43:22 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id fy29so27438152ejc.12
 for <xen-devel@lists.xenproject.org>; Tue, 19 Jul 2022 10:43:22 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 wj18-20020a170907051200b0072af92fa086sm6903268ejb.32.2022.07.19.10.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 10:43:20 -0700 (PDT)
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
X-Inumbo-ID: 4852fe6a-078a-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xeDSBefOUDefddwDFekw6Jxk+8IVVFXqS6nwlVZXVQU=;
        b=LFZN7CtylG3g24WT/N4AzwAJAclOs6Jx4biOe+TPkuFnIdk67Ggth4osh4UWA1JQqg
         2gWZv+LO0nfgLBOAcPTUBBLpqIuToascsQZgquN3fv4dbRcVHpZC42GTPl/fvZBywLu0
         y6PM9A0BjpL0q9G5eBCDlAYBBib8KInXOkC7/P7AXDSX68KgfxwcEjjgaaHJE+ZnevXy
         uWnEBnI+2f1rzfKJJZoO1tVwNRHLTCpeMi0g+0m2vcszSZjWYI/3aFQQWPZv6hrp6OxV
         JsvhmJGOcyVFchLGxCfKdJjbXXfHQtAy17DVsp4qdNoFdOyzzam7N2de7xowP84uRxJu
         4GDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xeDSBefOUDefddwDFekw6Jxk+8IVVFXqS6nwlVZXVQU=;
        b=pPtsW0MyvprNACdJUvPTWvoa1ZzFzMR7UnjwJFkDUKPxahb96IqZNmq41wcz8l9/KN
         yt8ZEkuFwJJubNVmGcZ0pSro7oI960c6VvzWJ/ejRjx0ObTz++GY3/l4TS6JJDYfZEJ3
         K3u6oRbbbX6DykbvzkT1CNm+RClhaVsWkBgBwOd2dnZhFDGtNBnq0PD3t9oXoho94bFP
         1adQkTnbVimYXtf9ms1zN1PObUrN1eFJjD9usptpToEIbHNMSg49I0YNx9fhDlrM+QDU
         wNxMIZmaP/2XcSFXRwqbWbozJWWGvErFSRGCSFzg1So1CidxjA//Oar00ySTQvtydMmf
         qkYg==
X-Gm-Message-State: AJIora+NJvarU5EznIjZaA2xL79YT/SwygenFaBd08B2l7pSk0YFfpEG
	BN3Vnyrtl4fvl8D4hq54N2SqzbjDQVFmmw==
X-Google-Smtp-Source: AGRyM1ta7Q2IduHJgFwfDvZzHGMnbRGwVjNFMtsjyrVAgo3Vzo5xc2id5a7tTgOh4fNVI5H16aNGSQ==
X-Received: by 2002:a17:907:7632:b0:72b:4d5d:ecce with SMTP id jy18-20020a170907763200b0072b4d5deccemr32856791ejc.11.1658252601136;
        Tue, 19 Jul 2022 10:43:21 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH V7 10/11] xen/arm: translate virtual PCI bus topology for guests
Date: Tue, 19 Jul 2022 20:42:52 +0300
Message-Id: <20220719174253.541965-11-olekstysh@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220719174253.541965-1-olekstysh@gmail.com>
References: <20220719174253.541965-1-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

There are three  originators for the PCI configuration space access:
1. The domain that owns physical host bridge: MMIO handlers are
there so we can update vPCI register handlers with the values
written by the hardware domain, e.g. physical view of the registers
vs guest's view on the configuration space.
2. Guest access to the passed through PCI devices: we need to properly
map virtual bus topology to the physical one, e.g. pass the configuration
space access to the corresponding physical devices.
3. Emulated host PCI bridge access. It doesn't exist in the physical
topology, e.g. it can't be mapped to some physical host bridge.
So, all access to the host bridge itself needs to be trapped and
emulated.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
Since v6:
- add pcidevs locking to vpci_translate_virtual_device
- update wrt to the new locking scheme
Since v5:
- add vpci_translate_virtual_device for #ifndef CONFIG_HAS_VPCI_GUEST_SUPPORT
  case to simplify ifdefery
- add ASSERT(!is_hardware_domain(d)); to vpci_translate_virtual_device
- reset output register on failed virtual SBDF translation
Since v4:
- indentation fixes
- constify struct domain
- updated commit message
- updates to the new locking scheme (pdev->vpci_lock)
Since v3:
- revisit locking
- move code to vpci.c
Since v2:
 - pass struct domain instead of struct vcpu
 - constify arguments where possible
 - gate relevant code with CONFIG_HAS_VPCI_GUEST_SUPPORT
New in v2
---
 xen/arch/arm/vpci.c     | 17 +++++++++++++++++
 xen/drivers/vpci/vpci.c | 26 ++++++++++++++++++++++++++
 xen/include/xen/vpci.h  |  7 +++++++
 3 files changed, 50 insertions(+)

diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index a9fc5817f9..84b2b068a0 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -41,6 +41,16 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
     /* data is needed to prevent a pointer cast on 32bit */
     unsigned long data;
 
+    /*
+     * For the passed through devices we need to map their virtual SBDF
+     * to the physical PCI device being passed through.
+     */
+    if ( !bridge && !vpci_translate_virtual_device(v->domain, &sbdf) )
+    {
+        *r = ~0ul;
+        return 1;
+    }
+
     if ( vpci_ecam_read(sbdf, ECAM_REG_OFFSET(info->gpa),
                         1U << info->dabt.size, &data) )
     {
@@ -59,6 +69,13 @@ static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
     struct pci_host_bridge *bridge = p;
     pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
 
+    /*
+     * For the passed through devices we need to map their virtual SBDF
+     * to the physical PCI device being passed through.
+     */
+    if ( !bridge && !vpci_translate_virtual_device(v->domain, &sbdf) )
+        return 1;
+
     return vpci_ecam_write(sbdf, ECAM_REG_OFFSET(info->gpa),
                            1U << info->dabt.size, r);
 }
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index d4601ecf9b..fc2c51dc3e 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -158,6 +158,32 @@ static void vpci_remove_virtual_device(const struct pci_dev *pdev)
     }
 }
 
+/*
+ * Find the physical device which is mapped to the virtual device
+ * and translate virtual SBDF to the physical one.
+ */
+bool vpci_translate_virtual_device(struct domain *d, pci_sbdf_t *sbdf)
+{
+    struct pci_dev *pdev;
+
+    ASSERT(!is_hardware_domain(d));
+
+    pcidevs_read_lock();
+    for_each_pdev( d, pdev )
+    {
+        if ( pdev->vpci && (pdev->vpci->guest_sbdf.sbdf == sbdf->sbdf) )
+        {
+            /* Replace guest SBDF with the physical one. */
+            *sbdf = pdev->sbdf;
+            pcidevs_read_unlock();
+            return true;
+        }
+    }
+
+    pcidevs_read_unlock();
+    return false;
+}
+
 /* Notify vPCI that device is assigned to guest. */
 int vpci_assign_device(struct pci_dev *pdev)
 {
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index cc14b0086d..5749d8da78 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -276,6 +276,7 @@ static inline bool __must_check vpci_process_pending(struct vcpu *v)
 /* Notify vPCI that device is assigned/de-assigned to/from guest. */
 int vpci_assign_device(struct pci_dev *pdev);
 void vpci_deassign_device(struct pci_dev *pdev);
+bool vpci_translate_virtual_device(struct domain *d, pci_sbdf_t *sbdf);
 #else
 static inline int vpci_assign_device(struct pci_dev *pdev)
 {
@@ -285,6 +286,12 @@ static inline int vpci_assign_device(struct pci_dev *pdev)
 static inline void vpci_deassign_device(struct pci_dev *pdev)
 {
 };
+
+static inline bool vpci_translate_virtual_device(struct domain *d,
+                                                 pci_sbdf_t *sbdf)
+{
+    return false;
+}
 #endif
 
 #endif
-- 
2.25.1


