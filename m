Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 768EF41D440
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 09:14:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199403.353474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqGT-0006Lb-5o; Thu, 30 Sep 2021 07:13:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199403.353474; Thu, 30 Sep 2021 07:13:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqGS-0006FJ-VT; Thu, 30 Sep 2021 07:13:56 +0000
Received: by outflank-mailman (input) for mailman id 199403;
 Thu, 30 Sep 2021 07:13:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OAwA=OU=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mVqGR-0004B3-A1
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 07:13:55 +0000
Received: from mail-lf1-x131.google.com (unknown [2a00:1450:4864:20::131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 217905a7-2aad-4d67-baac-a2ec09057c84;
 Thu, 30 Sep 2021 07:13:33 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id y26so21269232lfa.11
 for <xen-devel@lists.xenproject.org>; Thu, 30 Sep 2021 00:13:33 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id y3sm267835lfh.132.2021.09.30.00.13.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 00:13:32 -0700 (PDT)
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
X-Inumbo-ID: 217905a7-2aad-4d67-baac-a2ec09057c84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hrW151Pn3PyP3za7zVLCbht2FcxzTewAzo6dwWGEqVU=;
        b=KyfuI8SonaSWtz6zuzp494aO7A2NeB2DFx5t5TBA7HLhBzmr0zEhamJF8rtXINz02Z
         g7xwVq2gx1xENguCWdaZgT02OwqEMKR2hAYJyR5m7BAD4TdoQyQ0IHW7QyeFrniw9C+L
         JgjGmpfvodDgYdTg4KrllQ5NlrOlx3qJmPCcyo0Kd1NEvdetdWK4lpllURpPP5K776wD
         vWo/Yf6W6UHHyTFrlXrB773n5JK+LZchpgueXLVT1EFMqt6C8zBntZDl/osxmcjNtbv4
         weFFl2qpX6aHOjjd2FZ7RIB8UblXwgA6GqOoCQxmm/AiwlMhgia0q9IEWQucM35t3ZgG
         WejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hrW151Pn3PyP3za7zVLCbht2FcxzTewAzo6dwWGEqVU=;
        b=JViZynxMC0BTguzu8kV5IGAWamnM+x1n6tDMZzziKKX0oZh54twgo/QMf47j2G7maJ
         f8D8jWXtV0mndVWn6crjMPZDnd9K9Q8YE2WZPpmHqyNY/TzmmUbXUM8Pyo1GywQBvVtY
         tFf9NjEsfkwqlN/wObcOeDCwRUHK70ONAui/afSBpVN10kSDh/v+b3FftOwttPonNwIp
         azPnrDRHuLUm6XMgfIcpT+XfFQq/fe4MikizVVScvgK/jraF4f3tSGCz7ZxlIkdvAf/r
         VPMNkncdMkMkvWEwJKFnxGyM7gjHPUcfLdIxvH0EzppxgzTOcXLd7WfpzC7XaTY1hTtk
         jgrg==
X-Gm-Message-State: AOAM531SqzYXEIdByPbVtxNE93/K5U9xgUJEWUAbNOdo2ieSBPGtyA1W
	pVgEOPhogo/01silz1c2+3RQoBpWRfg=
X-Google-Smtp-Source: ABdhPJzt9ZlZEBCnM5k9rLLU/Zi6Qrtzj23d7bzRA4B8Hmo0JcAyQKiyusR2vxgD//ruRm6yTB+myQ==
X-Received: by 2002:a2e:9410:: with SMTP id i16mr4390219ljh.134.1632986012562;
        Thu, 30 Sep 2021 00:13:32 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v3 05/11] xen/arm: Mark device as PCI while creating one
Date: Thu, 30 Sep 2021 10:13:20 +0300
Message-Id: <20210930071326.857390-6-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210930071326.857390-1-andr2000@gmail.com>
References: <20210930071326.857390-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

While adding a PCI device mark it as such, so other frameworks
can distinguish it from DT devices.
For that introduce an architecture defined helper which may perform
additional initialization of the newly created PCI device.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
Since v2:
 - !! dropped Stefano's r-b because of the changes
 - introduced arch_pci_init_pdev (Jan)
Since v1:
 - moved the assignment from iommu_add_device to alloc_pdev
---
 xen/arch/arm/pci/pci.c        | 5 +++++
 xen/drivers/passthrough/pci.c | 2 ++
 xen/include/asm-arm/pci.h     | 5 +++++
 xen/include/asm-x86/pci.h     | 2 ++
 4 files changed, 14 insertions(+)

diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
index 9fc522e566a9..a8d10e869603 100644
--- a/xen/arch/arm/pci/pci.c
+++ b/xen/arch/arm/pci/pci.c
@@ -34,6 +34,11 @@ struct pci_dev *dev_to_pci(struct device *dev)
     return container_of(dev, struct pci_dev, arch.dev);
 }
 
+void arch_pci_init_pdev(struct pci_dev *pdev)
+{
+    pci_to_dev(pdev)->type = DEV_PCI;
+}
+
 static int __init dt_pci_init(void)
 {
     struct dt_device_node *np;
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 38eb451448a3..9f804a50e780 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -329,6 +329,8 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
     *((u8*) &pdev->devfn) = devfn;
     pdev->domain = NULL;
 
+    arch_pci_init_pdev(pdev);
+
     rc = pdev_msi_init(pdev);
     if ( rc )
     {
diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
index e6d4000e2ac8..566a9436a18e 100644
--- a/xen/include/asm-arm/pci.h
+++ b/xen/include/asm-arm/pci.h
@@ -105,6 +105,9 @@ static always_inline bool is_pci_passthrough_enabled(void)
 {
     return pci_passthrough_enabled;
 }
+
+void arch_pci_init_pdev(struct pci_dev *pdev);
+
 #else   /*!CONFIG_HAS_PCI*/
 
 struct arch_pci_dev { };
@@ -121,5 +124,7 @@ static inline int pci_get_host_bridge_segment(const struct dt_device_node *node,
     return -EINVAL;
 }
 
+static inline void arch_pci_init_pdev(struct pci_dev *pdev) {}
+
 #endif  /*!CONFIG_HAS_PCI*/
 #endif /* __ARM_PCI_H__ */
diff --git a/xen/include/asm-x86/pci.h b/xen/include/asm-x86/pci.h
index 61b940c91d4a..e7f10beb4eb8 100644
--- a/xen/include/asm-x86/pci.h
+++ b/xen/include/asm-x86/pci.h
@@ -38,4 +38,6 @@ static always_inline bool is_pci_passthrough_enabled(void)
     return true;
 }
 
+static inline void arch_pci_init_pdev(struct pci_dev *pdev) {}
+
 #endif /* __X86_PCI_H__ */
-- 
2.25.1


