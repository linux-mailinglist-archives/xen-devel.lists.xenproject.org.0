Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 719E24600C3
	for <lists+xen-devel@lfdr.de>; Sat, 27 Nov 2021 18:52:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234019.406200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mr1ri-0004od-Rp; Sat, 27 Nov 2021 17:51:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234019.406200; Sat, 27 Nov 2021 17:51:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mr1ri-0004cq-GA; Sat, 27 Nov 2021 17:51:58 +0000
Received: by outflank-mailman (input) for mailman id 234019;
 Sat, 27 Nov 2021 17:51:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BaOL=QO=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mr1rg-0004Ig-76
 for xen-devel@lists.xenproject.org; Sat, 27 Nov 2021 17:51:56 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4aae86a-4faa-11ec-b941-1df2895da90e;
 Sat, 27 Nov 2021 18:51:54 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id k23so25480764lje.1
 for <xen-devel@lists.xenproject.org>; Sat, 27 Nov 2021 09:51:54 -0800 (PST)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id f18sm827075ljc.104.2021.11.27.09.51.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 27 Nov 2021 09:51:52 -0800 (PST)
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
X-Inumbo-ID: b4aae86a-4faa-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I496Z+swiWyAchqbkA9TA+qXRaefRbc6db3siiLMLlI=;
        b=ab2NL+08Ekqzqf/v9FO9StivTv/vi/Xk9zCd6Ja59vmCjRrhLwCGPvVhDYzk16riJM
         XAKyNIoaus6fnFuPkL2CE06ST3OkI/bn4L2RNH/DqlD6A+K3bQ9deBeDNzeLjkDQ+Xf1
         dqpek9pUF6Rrvno17DsFivKeleYFoYyQugd1EUNXqUrL8weR+tJ1JLFVgV2/b434AcPu
         VS5OUVyfUEQ0W0N88/caso1XhyyEydcQICUEtghNVAUYRxAnTbuZx3y2MuReI6b+sd7T
         dzJLwJjEX+obkspGYR5GUrmLmNt1lJuicvmgVV0yNrLRwJyn+yiLJ2XFZOJ6i6OYGngC
         Z/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I496Z+swiWyAchqbkA9TA+qXRaefRbc6db3siiLMLlI=;
        b=b8VpjUknwvekozD/NS+uxEsWnuD+3X1ZfVPRfJKZMRQVgMeDBu5Qu+hSLao7jSW3B8
         7op/3jIGrd/YaL/yUuPYHXQtyVJy13VVVP9F+imWkQaWPB56zmLZEgyLxm+HDQSnX8+l
         6TyQ+dFm6vszp649fscGbWthNIBYbR2K2CBeq8KTCEusp+vUM7WVmm7LXWBD2mAq3bB/
         mfFY4Kg5TYa1TOrcdnHQEyG3UopYk6Ot2OLgVkZReOEj2lKg1RmHGKwxVvanMEJKCHdc
         opQRcLLPdqe4y8sFkLIg/lRGdhw+LmenaQ+FojL1fIoF1K1X2xISRauGYNPf7Z4ISCFs
         S6+A==
X-Gm-Message-State: AOAM530xOLrpNPlJPznlTSwxfkWIqHblJWZ92rdKjYy53YxJRrIYUZzr
	3JMZRyfVLynVMtVBxUcWxaIXhJZxx/8=
X-Google-Smtp-Source: ABdhPJx9ZItP/jmf1Mc3AFgG0Q7hrJ+0biPwpDlU/DbtkxUet5+vtuy5UDixp9AFkPzx+JPv2msi/A==
X-Received: by 2002:a05:651c:106b:: with SMTP id y11mr38555280ljm.504.1638035513198;
        Sat, 27 Nov 2021 09:51:53 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 02/10] iommu/ipmmu-vmsa: Add helper functions for MMU "context" registers
Date: Sat, 27 Nov 2021 19:51:37 +0200
Message-Id: <1638035505-16931-3-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1638035505-16931-1-git-send-email-olekstysh@gmail.com>
References: <1638035505-16931-1-git-send-email-olekstysh@gmail.com>
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


