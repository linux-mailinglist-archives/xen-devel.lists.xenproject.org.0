Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBD14600C4
	for <lists+xen-devel@lfdr.de>; Sat, 27 Nov 2021 18:52:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234022.406226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mr1rk-0005Lb-R8; Sat, 27 Nov 2021 17:52:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234022.406226; Sat, 27 Nov 2021 17:52:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mr1rk-0005Bl-AK; Sat, 27 Nov 2021 17:52:00 +0000
Received: by outflank-mailman (input) for mailman id 234022;
 Sat, 27 Nov 2021 17:51:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BaOL=QO=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mr1rh-0004Ig-K3
 for xen-devel@lists.xenproject.org; Sat, 27 Nov 2021 17:51:57 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b609122b-4faa-11ec-b941-1df2895da90e;
 Sat, 27 Nov 2021 18:51:56 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id z8so25423585ljz.9
 for <xen-devel@lists.xenproject.org>; Sat, 27 Nov 2021 09:51:55 -0800 (PST)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id f18sm827075ljc.104.2021.11.27.09.51.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 27 Nov 2021 09:51:55 -0800 (PST)
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
X-Inumbo-ID: b609122b-4faa-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bRgqbHRlJsAVyemf2hoNwvqw0txWJXfRZkcU22DnDNE=;
        b=b1LyY1DLdNhBN0nuevSbwwKyxTG66rYthHKPAAuuJZmB12W79J5faarBcjBmLLUVmO
         au4QkhyAEccjEFTyum1u9GESjj2YmkwHLWumWP4Sq+NUZZESd8gxk7Ov6omT1nHmvEVd
         V6JpYLcxB+kW4C1ozsnKJqSvNG60euTtwhvzAFFfqHfzPvnCaPmbp6Xwhos+qO5v4Z7w
         3itFeOu4cnBTrCXi2s+IkkbE/XLy8lCbHq7s46BfMeJbHSf8pyrfIrr3QozvpKoyTGMd
         hc7vOvzYwnhRHVMewe3zG3k0dJT8kybyF4Ye4v6Oby+JmkeJ+UhcnzRJvPwr+x4cAVR6
         FBLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bRgqbHRlJsAVyemf2hoNwvqw0txWJXfRZkcU22DnDNE=;
        b=gGnc1PxHTE4lQs/tW6mYqZLnD1EgqKhyfw+QCH8EeEoSqwfQYH1NL2zL6bP+gyfFAU
         dy1vOBcZq1i5MGuxIIi4vF/WVrmfmjvZs6YCnrIERstU8qeKa3Q8cqL+5WZtvrmvracF
         UiBMKK0wPamE/ex5rgEVL/mvTgaGk6iYw1G49wJuvIOUSfdP3kKL3MFamPUsdFqW9/BK
         j3gT9rVl/tCZSIhVAXIYFtNs21rPAVQPqSgKaL9WFuYUyM9a1Nu9X/p0hlgudATrDMnt
         b4WLawxgwZJnpE12MpE/qzy1kYQDk4K2S/4i/neZE/oCAKfxvQcZXf+Pc2SscDepuc2s
         jrPg==
X-Gm-Message-State: AOAM5314orWfCLFpqFe8iTgRPcDAtho9/2f4Bvyj6iO8zpwy1tW4y/Ai
	vVj2HDdc9lZgH1qy+pizzJvEr5yRvyQ=
X-Google-Smtp-Source: ABdhPJyE0WP62ElK8Vd0xxB1RUFt8QSpNfATcPBZRWSNKjA4vAPYII+CS8Sn5BE6PP58z9nUNcsgnA==
X-Received: by 2002:a2e:bf06:: with SMTP id c6mr38838943ljr.405.1638035515505;
        Sat, 27 Nov 2021 09:51:55 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 05/10] iommu/ipmmu-vmsa: Calculate context registers' offset instead of a macro
Date: Sat, 27 Nov 2021 19:51:40 +0200
Message-Id: <1638035505-16931-6-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1638035505-16931-1-git-send-email-olekstysh@gmail.com>
References: <1638035505-16931-1-git-send-email-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This is a non-verbatim port of corresponding Linux upsteam commit:
3dc28d9f59eaae41461542b27afe70339347ebb3

Original commit message:
 commit 3dc28d9f59eaae41461542b27afe70339347ebb3
 Author: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
 Date:   Wed Nov 6 11:35:48 2019 +0900

  iommu/ipmmu-vmsa: Calculate context registers' offset instead of a macro

  Since we will have changed memory mapping of the IPMMU in the future,
  this patch uses ipmmu_features values instead of a macro to
  calculate context registers offset. No behavior change.

  Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
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
---
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
index 369be4c..ca33456 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -109,6 +109,8 @@ struct ipmmu_vmsa_xen_device {
 struct ipmmu_features {
     unsigned int number_of_contexts;
     unsigned int num_utlbs;
+    unsigned int ctx_offset_base;
+    unsigned int ctx_offset_stride;
 };
 
 /* Root/Cache IPMMU device's information */
@@ -167,8 +169,6 @@ static DEFINE_SPINLOCK(ipmmu_devices_lock);
 #define TLB_LOOP_TIMEOUT    100 /* 100us */
 
 /* Registers Definition */
-#define IM_CTX_SIZE    0x40
-
 #define IMCTR                0x0000
 /*
  * This field is implemented in IPMMU-MM only. So, can be set for
@@ -315,7 +315,8 @@ static void ipmmu_write(struct ipmmu_vmsa_device *mmu, uint32_t offset,
 static unsigned int ipmmu_ctx_reg(struct ipmmu_vmsa_device *mmu,
                                   unsigned int context_id, uint32_t reg)
 {
-    return context_id * IM_CTX_SIZE + reg;
+    return mmu->features->ctx_offset_base +
+        context_id * mmu->features->ctx_offset_stride + reg;
 }
 
 static uint32_t ipmmu_ctx_read(struct ipmmu_vmsa_device *mmu,
@@ -735,6 +736,8 @@ static int ipmmu_init_platform_device(struct device *dev,
 static const struct ipmmu_features ipmmu_features_rcar_gen3 = {
     .number_of_contexts = 8,
     .num_utlbs = 48,
+    .ctx_offset_base = 0,
+    .ctx_offset_stride = 0x40,
 };
 
 static void ipmmu_device_reset(struct ipmmu_vmsa_device *mmu)
-- 
2.7.4


