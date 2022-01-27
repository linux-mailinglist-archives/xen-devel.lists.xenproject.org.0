Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8F649EB66
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 20:56:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261720.453392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDAsh-00029B-3A; Thu, 27 Jan 2022 19:56:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261720.453392; Thu, 27 Jan 2022 19:56:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDAsg-000269-Vd; Thu, 27 Jan 2022 19:56:30 +0000
Received: by outflank-mailman (input) for mailman id 261720;
 Thu, 27 Jan 2022 19:56:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NFuB=SL=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nDAsf-0001qT-84
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 19:56:29 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36c40072-7fab-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 20:56:27 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id c7so5392215ljr.13
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jan 2022 11:56:28 -0800 (PST)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id j18sm897631lja.26.2022.01.27.11.56.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Jan 2022 11:56:27 -0800 (PST)
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
X-Inumbo-ID: 36c40072-7fab-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=eo+OIjpWTXwwmP6Pj09KcPNoGuASdj6ZBH9bhBu2VCw=;
        b=iDUfuS+F3RXhOl1S+NtxvwmywXVfdpg/1suc17SJauTt31SRjVBqOSPkY8HPRZ3yht
         V5rDuJcBddF2xl3DbceoNuYAQUUSF5qiU0E52+J/aACS257yTq1T6Nn+iPxdZdaE9kDL
         hf2T1BPiO/T3Sa86kIZztllTb4j+uouEzdxgh0tu6ZzNjiEgvtVjlw7zn91CzZZFcjz7
         Sc3dQrctP6ihBiQKEFE7e8XdNr9NhI0fceClfyLTbSsdSxuC0UT5saRMxGnNvELm1Jad
         QjtHBIJJlYfR5e8F03PVzrDbj4OQvKjuaXZsyB+YTvqlJ8GtE0X8NwZyY5ixxO3wH5XY
         E68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=eo+OIjpWTXwwmP6Pj09KcPNoGuASdj6ZBH9bhBu2VCw=;
        b=LTtVdKlzLSCs+4OXazw/x2pcIVG3MmA420q+U6x3tvugG2ngkekTTnD4kwigxvaFxA
         6kVGCJb5FlUEJnuRYcp8HHnxxtB9WCckOj3G/e3fsDV+uZti8WjHLg8YSZGC19jYy5eI
         LK2/nYBeAK+O1K1SECCDDlrkQd3L+M3CnW6pB7OaPQzlJUZHMqnHXh4/+OPmgxtADkwl
         UsrTobqukwEiN9lAO4ujOXwNgP2T9JBpAye7sOc7M4hEIEBhM6gm/vC7VpU+/eYTNpN7
         DSjycmtkPiZJba6CKTv+eWpR5AzutOXaP3mj2D7WnYPvmGAvyK9tZjPT3pktMbDzVIdX
         1HXw==
X-Gm-Message-State: AOAM532KGCYVmToaa67mwl3PT/bK82mP+yh9oqbeqyz/4rBuWNKRBKnP
	lxhT7eqixU7o7bLS2r0K2WA1ARnN9Vk=
X-Google-Smtp-Source: ABdhPJyd1lR2ZBeKpiYRAK/LysWfxNy0vopwBbbkjjazDv5ZCPLS4hfEdTurAUDwwUCv2rBBBlQH1Q==
X-Received: by 2002:a2e:a786:: with SMTP id c6mr3545836ljf.385.1643313387620;
        Thu, 27 Jan 2022 11:56:27 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH V3 1/2] iommu/ipmmu-vmsa: Use refcount for the micro-TLBs
Date: Thu, 27 Jan 2022 21:55:51 +0200
Message-Id: <1643313352-29940-2-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643313352-29940-1-git-send-email-olekstysh@gmail.com>
References: <1643313352-29940-1-git-send-email-olekstysh@gmail.com>

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

Changes V2 -> V3:
   - add comment to the code
---
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
index 649b9f6..c912120 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -127,6 +127,7 @@ struct ipmmu_vmsa_device {
     spinlock_t lock;    /* Protects ctx and domains[] */
     DECLARE_BITMAP(ctx, IPMMU_CTX_MAX);
     struct ipmmu_vmsa_domain *domains[IPMMU_CTX_MAX];
+    unsigned int utlb_refcount[IPMMU_UTLB_MAX];
     const struct ipmmu_features *features;
 };
 
@@ -468,12 +469,17 @@ static int ipmmu_utlb_enable(struct ipmmu_vmsa_domain *domain,
     }
 
     /*
-     * TODO: Reference-count the micro-TLB as several bus masters can be
-     * connected to the same micro-TLB.
+     * Reference-count the micro-TLBs as several bus masters can be connected
+     * to the same micro-TLB. The platform devices get assigned/deassigned
+     * together during domain creation/destruction. The PCI devices which use
+     * the same micro-TLB must also be hot-(un)plugged together.
      */
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
@@ -484,7 +490,10 @@ static void ipmmu_utlb_disable(struct ipmmu_vmsa_domain *domain,
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


