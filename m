Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5440E47B4ED
	for <lists+xen-devel@lfdr.de>; Mon, 20 Dec 2021 22:16:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.249998.430547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzQ19-0006kE-I8; Mon, 20 Dec 2021 21:16:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 249998.430547; Mon, 20 Dec 2021 21:16:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzQ19-0006aW-4M; Mon, 20 Dec 2021 21:16:23 +0000
Received: by outflank-mailman (input) for mailman id 249998;
 Mon, 20 Dec 2021 21:16:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6gYK=RF=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mzQ16-0005IB-Dq
 for xen-devel@lists.xenproject.org; Mon, 20 Dec 2021 21:16:20 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13523567-61da-11ec-85d3-df6b77346a89;
 Mon, 20 Dec 2021 22:16:19 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id x7so63029lfu.8
 for <xen-devel@lists.xenproject.org>; Mon, 20 Dec 2021 13:16:19 -0800 (PST)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id b35sm635132lfv.209.2021.12.20.13.16.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 Dec 2021 13:16:18 -0800 (PST)
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
X-Inumbo-ID: 13523567-61da-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=87T9wZal9/PpckvFihuEE4uSOyOrETTBOP9Ojac4rmQ=;
        b=lm/UwovJiZ2A0shy8on5i1ls/8SdPLOeJgsONiV+OnXuTRDbCHZSaTi1SVmXyF3DC5
         bHHt7lF3q1aAfQSuuGe0OH9IGb5m+X3iinBjYBihd2XqsxftqKzWTHFS2KBwBWGWtVWQ
         U85NZU+PmJeqBJY1fAGUkb0UVuQ3AImVOCSe5hv3VhiIF9yTH9bXI48A7lWcTk/NuNjg
         nDEg001M6hMYrGFoUiEz4YQ3m5kp7E9tMgE5RB6XgExlJN0X3ArrP6vIu7nQZKupAdzN
         hBNmtkgA6mY8X72r122WfilD7nY+iVCVsR2EDN6CdF1+jqmLKXJgH0MngZw2+WpxOZg3
         SG7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=87T9wZal9/PpckvFihuEE4uSOyOrETTBOP9Ojac4rmQ=;
        b=Mihs2RE0gY8g7PSsRHPtICEqdlGfoa6eXBTbaVbRtoiBYtScyTyDz+snQPz4ZJ0F/b
         bG6BMH/0JFrn/NGQWVDrz2/FTND3Khtt77XDey6oJ2FGgwMVu/mGpql7+YJaK6YRW8UD
         KULVibL+7rslLxRORxY80HCdz6cLP51IOyl5ZS3awUnYBWox1tRhn7NyRYgUsycilTBD
         m1j8dzYSPfVnePXRlubaxi23PZNc7U7k6//PjCJ4dSliyZM4s0wRzlBQf9UFIZErSADG
         SBeJoWuJH30+A0ObSAuzhn0Uh+xZtcuqcp6LTawB07nfVeMYulqpC3XFKfSWkw7npXJv
         tI0w==
X-Gm-Message-State: AOAM530WtNLeSjAukE4PRcFZbLoQH6EWv9iQrQV88TJ9HX14adzz1+Wt
	qDJRFzPotfGONd5wHqIFTKeXC5PzH5Y=
X-Google-Smtp-Source: ABdhPJwCNkbhTcm5bsmmqZ29yWpUf5zoMFKKU17b6heYFWrAoMSYvi/3Cd/DsQK+ZG+g3LKFDRzqNg==
X-Received: by 2002:a05:6512:695:: with SMTP id t21mr6375lfe.390.1640034979130;
        Mon, 20 Dec 2021 13:16:19 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH V2 06/10] iommu/ipmmu-vmsa: Add utlb_offset_base
Date: Mon, 20 Dec 2021 23:15:53 +0200
Message-Id: <1640034957-19764-7-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1640034957-19764-1-git-send-email-olekstysh@gmail.com>
References: <1640034957-19764-1-git-send-email-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This is a non-verbatim port of corresponding Linux upsteam commit:
1289f7f15001c7ed36be6d23cb145c1d5feacdc8

Original commit message:
 commit 1289f7f15001c7ed36be6d23cb145c1d5feacdc8
 Author: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
 Date:   Wed Nov 6 11:35:50 2019 +0900

  iommu/ipmmu-vmsa: Add utlb_offset_base

  Since we will have changed memory mapping of the IPMMU in the future,
  this patch adds a utlb_offset_base into struct ipmmu_features
  for IMUCTR and IMUASID registers. No behavior change.

  Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Signed-off-by: Joerg Roedel <jroedel@suse.de>

**********

This is a prereq work needed to add support for S4 series easily
in the future.

Almost the same change as original commit makes, but without updating
struct ipmmu_features_default which Xen driver doesn't have (there is
no support of old Arm32 based Gen2 SoCs).

No change in behavior.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
Changes V1 -> V2:
   - add R-b
---
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
index ca33456..d8f96fc 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -111,6 +111,7 @@ struct ipmmu_features {
     unsigned int num_utlbs;
     unsigned int ctx_offset_base;
     unsigned int ctx_offset_stride;
+    unsigned int utlb_offset_base;
 };
 
 /* Root/Cache IPMMU device's information */
@@ -374,7 +375,7 @@ static void ipmmu_ctx_write_all(struct ipmmu_vmsa_domain *domain,
 
 static uint32_t ipmmu_utlb_reg(struct ipmmu_vmsa_device *mmu, uint32_t reg)
 {
-    return reg;
+    return mmu->features->utlb_offset_base + reg;
 }
 
 static void ipmmu_imuasid_write(struct ipmmu_vmsa_device *mmu,
@@ -738,6 +739,7 @@ static const struct ipmmu_features ipmmu_features_rcar_gen3 = {
     .num_utlbs = 48,
     .ctx_offset_base = 0,
     .ctx_offset_stride = 0x40,
+    .utlb_offset_base = 0,
 };
 
 static void ipmmu_device_reset(struct ipmmu_vmsa_device *mmu)
-- 
2.7.4


