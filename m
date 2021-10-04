Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 283454208CD
	for <lists+xen-devel@lfdr.de>; Mon,  4 Oct 2021 11:54:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201257.355711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXKfz-0004Oi-SF; Mon, 04 Oct 2021 09:54:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201257.355711; Mon, 04 Oct 2021 09:54:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXKfz-0004MU-Np; Mon, 04 Oct 2021 09:54:27 +0000
Received: by outflank-mailman (input) for mailman id 201257;
 Mon, 04 Oct 2021 09:54:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sY6e=OY=gmail.com=rm.skakun@srs-us1.protection.inumbo.net>)
 id 1mXKfy-0003kC-Br
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 09:54:26 +0000
Received: from mail-lf1-x133.google.com (unknown [2a00:1450:4864:20::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7cfb36a7-985a-4f7a-8746-bb783082fc2f;
 Mon, 04 Oct 2021 09:54:18 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id i4so69637767lfv.4
 for <xen-devel@lists.xenproject.org>; Mon, 04 Oct 2021 02:54:17 -0700 (PDT)
Received: from localhost ([178.151.124.169])
 by smtp.gmail.com with ESMTPSA id w14sm1612368ljw.73.2021.10.04.02.54.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 02:54:16 -0700 (PDT)
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
X-Inumbo-ID: 7cfb36a7-985a-4f7a-8746-bb783082fc2f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dvnwbtKXuUTovX39gB85uB/X6CcafQCm1x1qqRSoYLU=;
        b=YNmeI4BJ3NA50ZgVWUtmG53Yz9NzRqEsySE7NtRQV0dVt15bwba1LF7cnFL3leFtCf
         pBEheknC/K/zeSTz3nPcdD830yk8aH0N4ClnDpWJh8AZSzlj0hDbgiCz2+Q2WrRSSYRH
         VJP+uNx6H8U36Rvv15TKmBEulFJBQlHAqa8qZOba1sC1XPebeTCdnl041eT0jGop3wol
         iissrEgIuk8pDlrT1Nnt5f7YPjeQoUu3zS4muj4nBlYYohyYcsHpf3KCAztRqh3OsGqg
         EUMmofKcocqfEFa03Jd2cInRnoDTxY5Ofq/F62slQloVVaPpRL72OuIMol9aZVrGXD7Z
         WMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dvnwbtKXuUTovX39gB85uB/X6CcafQCm1x1qqRSoYLU=;
        b=nJ50rz7cER+32P5FywPKwms5LGlPw+5P5S3fUJ/6gxDBy6N436nkKntwgOM7da0y+U
         rxLGMGh/+B0nwGQLMvcpSlXx1DDFbe8QTPDoont26BGcTwYigs4Pci+2rcytyYqmkjye
         NuOkErsCn537CjArvzPh0Bx5j2ir87HIzlMQvex4m3p3ReWCEV4TweXi0lf3SU/oOuhI
         n8S9TYSv53eY5wtVzqYp4k9dLNy2Tc6eWuuENfeiikwPafUvZ3/JAd5px7l+k60xV2uI
         99oaqTj2uMob+XGH8/23o5a1VFT/QyfRhPfYcwdAN9w5i9ZEQcLixhfcgTUd0s/0Cxg2
         1AAw==
X-Gm-Message-State: AOAM531pzWy7rdBumeF9G5EK1By+/oAErWko7rvEkKYEGJDr+Zn145MN
	Dn3YA2QCIpMuNZqgjP+XSds=
X-Google-Smtp-Source: ABdhPJzyJGasKtm3y+zLqxQVYpV5fmsIGojp/kBAB//FqkuWucfSlK8Vxl8hFgwI2mPCd49zyc8X8g==
X-Received: by 2002:a2e:504a:: with SMTP id v10mr14456170ljd.9.1633341257004;
        Mon, 04 Oct 2021 02:54:17 -0700 (PDT)
From: Roman Skakun <rm.skakun@gmail.com>
X-Google-Original-From: Roman Skakun <Roman_Skakun@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	xen-devel@lists.xenproject.org
Cc: Roman Skakun <roman_skakun@epam.com>,
	Roman Skakun <rm.skakun@gmail.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrii Anisov <andrii_anisov@epam.com>,
	Roman Skakun <Roman_Skakun@epam.com>
Subject: [RFC PATCH] dma-mapping: don't set swiotlb-xen fops for IOMMU-protected devices
Date: Mon,  4 Oct 2021 12:54:03 +0300
Message-Id: <20211004095415.100756-1-Roman_Skakun@epam.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1633106362.git.roman_skakun@epam.com>
References: <cover.1633106362.git.roman_skakun@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prior to this patch swiotlb-xen fops are set for all devices when
we are booting as as Dom0 or direct-mapped DomU.

Since Xen now marks devices which are IOMMU-protected by
adding additional property to the relevant device, we can
check for this property and don't set swiotlb-xen fops for
any IOMMU-protected device.

Signed-off-by: Roman Skakun <Roman_Skakun@epam.com>
---
 arch/arm/mm/dma-mapping.c   | 2 +-
 arch/arm/xen/enlighten.c    | 4 ++++
 arch/arm64/mm/dma-mapping.c | 2 +-
 include/xen/xen.h           | 2 ++
 4 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index c4b8df2ad328..c3e5841d871e 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -2280,7 +2280,7 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
 	set_dma_ops(dev, dma_ops);
 
 #ifdef CONFIG_XEN
-	if (xen_initial_domain())
+	if (xen_initial_domain() && !xen_is_device_protected(dev))
 		dev->dma_ops = &xen_swiotlb_dma_ops;
 #endif
 	dev->archdata.dma_ops_setup = true;
diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
index 49f566ad9acb..6ddef3233095 100644
--- a/arch/arm/xen/enlighten.c
+++ b/arch/arm/xen/enlighten.c
@@ -425,6 +425,10 @@ static int __init xen_pm_init(void)
 }
 late_initcall(xen_pm_init);
 
+bool xen_is_device_protected(void *obj) {
+	struct device *dev = obj;
+	return of_property_read_bool(dev->of_node, "xen,behind-iommu");
+}
 
 /* empty stubs */
 void xen_arch_pre_suspend(void) { }
diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
index 93e87b287556..0af5f7a63124 100644
--- a/arch/arm64/mm/dma-mapping.c
+++ b/arch/arm64/mm/dma-mapping.c
@@ -53,7 +53,7 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
 		iommu_setup_dma_ops(dev, dma_base, size);
 
 #ifdef CONFIG_XEN
-	if (xen_initial_domain())
+	if (xen_initial_domain() && !xen_is_device_protected(dev))
 		dev->dma_ops = &xen_swiotlb_dma_ops;
 #endif
 }
diff --git a/include/xen/xen.h b/include/xen/xen.h
index 43efba045acc..3725d69de6f9 100644
--- a/include/xen/xen.h
+++ b/include/xen/xen.h
@@ -61,4 +61,6 @@ void xen_free_unpopulated_pages(unsigned int nr_pages, struct page **pages);
 #include <xen/balloon.h>
 #endif
 
+bool xen_is_device_protected(void *obj);
+
 #endif	/* _XEN_XEN_H */
-- 
2.27.0


