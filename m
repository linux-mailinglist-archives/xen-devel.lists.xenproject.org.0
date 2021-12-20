Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9401147B4EA
	for <lists+xen-devel@lfdr.de>; Mon, 20 Dec 2021 22:16:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250001.430573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzQ1C-0007aA-MT; Mon, 20 Dec 2021 21:16:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250001.430573; Mon, 20 Dec 2021 21:16:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzQ1C-0007Gz-7V; Mon, 20 Dec 2021 21:16:26 +0000
Received: by outflank-mailman (input) for mailman id 250001;
 Mon, 20 Dec 2021 21:16:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6gYK=RF=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mzQ18-0005IB-Ra
 for xen-devel@lists.xenproject.org; Mon, 20 Dec 2021 21:16:22 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14a0a55c-61da-11ec-85d3-df6b77346a89;
 Mon, 20 Dec 2021 22:16:22 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id u22so18047883lju.7
 for <xen-devel@lists.xenproject.org>; Mon, 20 Dec 2021 13:16:22 -0800 (PST)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id b35sm635132lfv.209.2021.12.20.13.16.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 Dec 2021 13:16:21 -0800 (PST)
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
X-Inumbo-ID: 14a0a55c-61da-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ruH/ZtUTmX8iN6zofPsz6r1KAf8lKOAgjKOqJDL6kwU=;
        b=CDMSfqEUyrVBM25MEGIzHLeoHcUFlBF7AVUEDESUE2sPkWXL1Pj7uRg78VNv5JoKuc
         54fvBdonm1Nq4ZFPMqV5wAT0Burub2MDNaPv3jjEddM4NEa4TLhHI/nQIAGNranFaIv3
         +JXNyPkx9D5HBA/g/4ar7r/RDoZ3Z9N8I6JA/QgJNtlJRziKacOOxL/xiKvpeibC6htM
         JnUDFzpcJqsHwPYmUrz2IxA+MQSteMNkPsvdiRFcYB9H28gvILoJVOoqN6Cl3MK0ajI3
         CfgvX7UrBZdqSEGs4wwbU/zALJm1rUmGQOGszcuDxqlTITemRI+rvjGe9AsDNfT+0ccm
         HwnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ruH/ZtUTmX8iN6zofPsz6r1KAf8lKOAgjKOqJDL6kwU=;
        b=zhjPMWyp+8AOBFtbc+e+Z2nfiME/orkJ5Yx2V/kfJ79Rj/M5THNnsDJWidNJ7y+MgO
         VfqEAujqKsDYqDEBlAWxjsDECF9KvWmFWbpYPx3L/vWWkYWurJ0c8A8DhtHRmkw5nEKg
         Ahdm62dSqQ7iuDhrylDTJOuBBHi7yAc+jCdzL+SN8QRa4A8xj+Td3lgGill1DZ5ZqvgC
         06uWkULJiZ5Ab3m9dABvcfzovdKDe7hLt7XC0AhOQpq2GyiTthGYAI5uMBMeHdhf4Ke3
         LvUMZWXlWGWnqNuLvEEykF9Gt1YSRNb13a0tJ97mh9cSgA6FIMnylKAioBbZBEFc9/9V
         5RMg==
X-Gm-Message-State: AOAM5318VfgoU2m2ST7N8KYvOdK4spF3QC1W4sch8EWFkAx9jtn8QLg8
	tJUQtC+6XQDB4crs9pLVetr7Tuf2MvY=
X-Google-Smtp-Source: ABdhPJygzn941uf9Tjg3K5YR8Nj0KXaAS2tnW+3lvktFAgQUqXlC3Yrmbyf+ZosfHupnIONO+S2H8g==
X-Received: by 2002:a2e:3c17:: with SMTP id j23mr16332638lja.391.1640034981391;
        Mon, 20 Dec 2021 13:16:21 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH V2 09/10] iommu/ipmmu-vmsa: Use refcount for the micro-TLBs
Date: Mon, 20 Dec 2021 23:15:56 +0200
Message-Id: <1640034957-19764-10-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1640034957-19764-1-git-send-email-olekstysh@gmail.com>
References: <1640034957-19764-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Reference-count the micro-TLBs as several bus masters can be
connected to the same micro-TLB (and drop TODO comment).
This wasn't an issue so far, since the platform devices
(this driver deals with) get assigned/deassigned together during
domain creation/destruction. But, in order to support PCI devices
(which are hot-pluggable) in the near future we will need to
take care of.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
Changes V1 -> V2:
   - add R-b
   - add ASSERT() in ipmmu_utlb_disable()
---
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
index 649b9f6..1224ea4 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -127,6 +127,7 @@ struct ipmmu_vmsa_device {
     spinlock_t lock;    /* Protects ctx and domains[] */
     DECLARE_BITMAP(ctx, IPMMU_CTX_MAX);
     struct ipmmu_vmsa_domain *domains[IPMMU_CTX_MAX];
+    unsigned int utlb_refcount[IPMMU_UTLB_MAX];
     const struct ipmmu_features *features;
 };
 
@@ -467,13 +468,12 @@ static int ipmmu_utlb_enable(struct ipmmu_vmsa_domain *domain,
         }
     }
 
-    /*
-     * TODO: Reference-count the micro-TLB as several bus masters can be
-     * connected to the same micro-TLB.
-     */
-    ipmmu_imuasid_write(mmu, utlb, 0);
-    ipmmu_imuctr_write(mmu, utlb, imuctr |
-                       IMUCTR_TTSEL_MMU(domain->context_id) | IMUCTR_MMUEN);
+    if ( mmu->utlb_refcount[utlb]++ == 0 )
+    {
+        ipmmu_imuasid_write(mmu, utlb, 0);
+        ipmmu_imuctr_write(mmu, utlb, imuctr |
+                           IMUCTR_TTSEL_MMU(domain->context_id) | IMUCTR_MMUEN);
+    }
 
     return 0;
 }
@@ -484,7 +484,10 @@ static void ipmmu_utlb_disable(struct ipmmu_vmsa_domain *domain,
 {
     struct ipmmu_vmsa_device *mmu = domain->mmu;
 
-    ipmmu_imuctr_write(mmu, utlb, 0);
+    ASSERT(mmu->utlb_refcount[utlb] > 0);
+
+    if ( --mmu->utlb_refcount[utlb] == 0 )
+        ipmmu_imuctr_write(mmu, utlb, 0);
 }
 
 /* Domain/Context Management */
-- 
2.7.4


