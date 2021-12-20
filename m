Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD4A47B4EF
	for <lists+xen-devel@lfdr.de>; Mon, 20 Dec 2021 22:16:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.249994.430495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzQ15-0005YR-S5; Mon, 20 Dec 2021 21:16:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 249994.430495; Mon, 20 Dec 2021 21:16:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzQ15-0005Pt-La; Mon, 20 Dec 2021 21:16:19 +0000
Received: by outflank-mailman (input) for mailman id 249994;
 Mon, 20 Dec 2021 21:16:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6gYK=RF=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mzQ13-0005IB-FC
 for xen-devel@lists.xenproject.org; Mon, 20 Dec 2021 21:16:17 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 117e7a93-61da-11ec-85d3-df6b77346a89;
 Mon, 20 Dec 2021 22:16:16 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id b22so24579611lfb.9
 for <xen-devel@lists.xenproject.org>; Mon, 20 Dec 2021 13:16:16 -0800 (PST)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id b35sm635132lfv.209.2021.12.20.13.16.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 Dec 2021 13:16:16 -0800 (PST)
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
X-Inumbo-ID: 117e7a93-61da-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IcYUSZSwq8KqsYZymm7EDYV5w0Nvikp7Q2gZniejYm0=;
        b=AyKxPiiJPVhC/7JOQ/aRq6rTrMS0jzHgIDPh5CteMINaaQk//DlcT8W2eCtp5t/ruD
         1OXJneoc0AWC/P3AG9DbIijvwHyh00kh4GfqxyxmQlz67ZMubIFHMpPcMKqEMTN96bdJ
         5rLX1Jqgkjv9k6jaQI/ZCJqFPxrxaBoK6rYL5PgngX2Oo447nXOdeee4Vl9OfFXzscbV
         ZlUkBkjHNVpY6T01xqZWLDoxqlDkk5wMkirGNL20txR5uYuMUw/FzF+El1SSmT47c6KY
         Ra6G5ul4X6aEKW7mlCyY/c+lpNkbSTxM1qdfZuUY0sm5Vraz4yIvGinZad7uLx/KYJgn
         IQAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IcYUSZSwq8KqsYZymm7EDYV5w0Nvikp7Q2gZniejYm0=;
        b=ZJRSB/e1IAQXcGpBpuJZhqszCOMbmwXTDF+kmH47KHlegiCy3Zb8ogprGtGVrOwC2k
         9XNTO1Ap9Rir1+VSz+5SK6ZCg322OAuZlf0kshGbE6QDVY+8IpzQ7oVBMWQC9PMImjYF
         wIa4jj7IV6bSMyqy0QmBBIvwOX/YCQn4HRiJfPORcy5F4yaRjADiWaq+Hf8xO0UqA9RM
         roQWKvQJOn49ZRkB7XMqYW/OhqcVhvVB8nZSGHTDhR02DXOraas9q8Fx5WfHCUifajvm
         Dr/gwgtGYxvT12e9H3/HpABqhDk6Y4iL2m2XoPSLmMEVG7x9kFX5N4jQBQAsaAR3yMdN
         peDQ==
X-Gm-Message-State: AOAM530hCVHktdr1gZpoLMXFPWFgWbhn0H8PyLSDY7IcsoezhOlrD6bf
	fXGD+iREaVVvNy3IrkFXZHMql6gmKdc=
X-Google-Smtp-Source: ABdhPJxtcms+sAXHt2sK2O2BBuG/He6QCMgCPzr3nG5Rz21E4S6lu+3lxbKwcZQsk5kkqukgFKw33A==
X-Received: by 2002:a05:6512:b81:: with SMTP id b1mr15523896lfv.301.1640034976255;
        Mon, 20 Dec 2021 13:16:16 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH V2 02/10] iommu/ipmmu-vmsa: Add helper functions for MMU "context" registers
Date: Mon, 20 Dec 2021 23:15:49 +0200
Message-Id: <1640034957-19764-3-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1640034957-19764-1-git-send-email-olekstysh@gmail.com>
References: <1640034957-19764-1-git-send-email-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This is a non-verbatim port of corresponding Linux upsteam commit:
16d9454f5e0447f9c19cbf350b35ed377b9f64eb

Original commit message:
 commit 16d9454f5e0447f9c19cbf350b35ed377b9f64eb
 Author: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
 Date:   Wed Nov 6 11:35:47 2019 +0900

  iommu/ipmmu-vmsa: Add helper functions for MMU "context" registers

  Since we will have changed memory mapping of the IPMMU in the future,
  This patch adds helper functions ipmmu_ctx_{reg,read,write}()
  for MMU "context" registers. No behavior change.

  Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
  Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Signed-off-by: Joerg Roedel <jroedel@suse.de>

**********

This is a prereq work needed to add support for S4 series easily
in the future.

Besides changes done in the original commit, we also need to update
an extra call sites which Linux driver doesn't have, but Xen driver
has such as ipmmu_ctx_write_cache(), etc.

No change in behavior.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
Changes V1 -> V2:
   - add R-b
---
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
index 4a8a974..ce5c3bc 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -307,18 +307,35 @@ static void ipmmu_write(struct ipmmu_vmsa_device *mmu, uint32_t offset,
     writel(data, mmu->base + offset);
 }
 
+static unsigned int ipmmu_ctx_reg(struct ipmmu_vmsa_device *mmu,
+                                  unsigned int context_id, uint32_t reg)
+{
+    return context_id * IM_CTX_SIZE + reg;
+}
+
+static uint32_t ipmmu_ctx_read(struct ipmmu_vmsa_device *mmu,
+                               unsigned int context_id, uint32_t reg)
+{
+    return ipmmu_read(mmu, ipmmu_ctx_reg(mmu, context_id, reg));
+}
+
+static void ipmmu_ctx_write(struct ipmmu_vmsa_device *mmu,
+                            unsigned int context_id, uint32_t reg,
+                            uint32_t data)
+{
+    ipmmu_write(mmu, ipmmu_ctx_reg(mmu, context_id, reg), data);
+}
+
 static uint32_t ipmmu_ctx_read_root(struct ipmmu_vmsa_domain *domain,
                                     uint32_t reg)
 {
-    return ipmmu_read(domain->mmu->root,
-                      domain->context_id * IM_CTX_SIZE + reg);
+    return ipmmu_ctx_read(domain->mmu->root, domain->context_id, reg);
 }
 
 static void ipmmu_ctx_write_root(struct ipmmu_vmsa_domain *domain,
                                  uint32_t reg, uint32_t data)
 {
-    ipmmu_write(domain->mmu->root,
-                domain->context_id * IM_CTX_SIZE + reg, data);
+    ipmmu_ctx_write(domain->mmu->root, domain->context_id, reg, data);
 }
 
 static void ipmmu_ctx_write_cache(struct ipmmu_vmsa_domain *domain,
@@ -329,8 +346,8 @@ static void ipmmu_ctx_write_cache(struct ipmmu_vmsa_domain *domain,
 
     /* Mask fields which are implemented in IPMMU-MM only. */
     if ( !ipmmu_is_root(domain->mmu) )
-        ipmmu_write(domain->mmu, domain->context_id * IM_CTX_SIZE + reg,
-                    data & IMCTR_COMMON_MASK);
+        ipmmu_ctx_write(domain->mmu, domain->context_id, reg,
+                        data & IMCTR_COMMON_MASK);
 }
 
 /*
@@ -693,7 +710,7 @@ static void ipmmu_device_reset(struct ipmmu_vmsa_device *mmu)
 
     /* Disable all contexts. */
     for ( i = 0; i < mmu->num_ctx; ++i )
-        ipmmu_write(mmu, i * IM_CTX_SIZE + IMCTR, 0);
+        ipmmu_ctx_write(mmu, i, IMCTR, 0);
 }
 
 /* R-Car Gen3 SoCs product and cut information. */
-- 
2.7.4


