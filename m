Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC72447B4F3
	for <lists+xen-devel@lfdr.de>; Mon, 20 Dec 2021 22:16:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.249997.430521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzQ17-00065w-H5; Mon, 20 Dec 2021 21:16:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 249997.430521; Mon, 20 Dec 2021 21:16:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzQ17-0005s8-3w; Mon, 20 Dec 2021 21:16:21 +0000
Received: by outflank-mailman (input) for mailman id 249997;
 Mon, 20 Dec 2021 21:16:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6gYK=RF=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mzQ15-0005IG-EK
 for xen-devel@lists.xenproject.org; Mon, 20 Dec 2021 21:16:19 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12c2dda6-61da-11ec-9e60-abaf8a552007;
 Mon, 20 Dec 2021 22:16:18 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id g26so8789170lfv.11
 for <xen-devel@lists.xenproject.org>; Mon, 20 Dec 2021 13:16:18 -0800 (PST)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id b35sm635132lfv.209.2021.12.20.13.16.17
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
X-Inumbo-ID: 12c2dda6-61da-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pEksiNlvmWwQkzdEtzPAm9Nfk2gTNz+eLaCmNe+DTYo=;
        b=am8z/7Yob+H2UTGTjya6uTQa7rUdvCbUngOkebg+qKaeSpYGyzSIrvJ7EMwWj1XoKr
         K06N30dXH4Ya6r5NRkfP7Kbq3AUyovcKRlhFAifLaKFjh0wpyqlA1CCvMqnxUIP300XO
         qPZHBw7A3XMfUzY98CqLsXjq4rblPZMW+izlcDchQkkG2Ln7nOn6fsDI3TZmCPIevUhi
         7xTDEfKfOl/tPU8p4Uf4B5yltkAugzAGRcCMG04YsLopZJVabFguruqaafRE5EZUtxdf
         hINrPiF0dBUdgotgLlJGIxiu4AYpO5s6VDf4TTk6b30x2gtrFxSdDjmEYM1T7PqlRLhK
         tasQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pEksiNlvmWwQkzdEtzPAm9Nfk2gTNz+eLaCmNe+DTYo=;
        b=dDuPw21a8x04vSHfw12wt1DQx7QLg40m1FXsnEOFvqhNJgi026dsKrqrIH+GJ1W+VU
         BkVC4iCRQ0RSV1OtW/zyMlQ0kV4POB3Z2QymLYwJ7trc8Oczf9xUo05fBKf8IdmhRUKb
         7IMD7UahJ5OHTrQ3f0oOvNYlu3mmelFhQ4t7HZRk7tCuyC1I3h90w78cVrMsyFDrtj9d
         cprcCdY1aT38LZdkdSF83QVifZKSVdkzTq9ZoEv9o6UGxdMMtQJYKtCFMjHZ2s/QeDxm
         aaf/rm4PtSWFMESgfgWFtqhljZX3vXU5ZCgNnaVYSc4EY8K3l11bnQxm1gPPcR6DHnE0
         Wqyg==
X-Gm-Message-State: AOAM530GVZ+ZtNg9BpCTMV2kA/+vEdiET7qFmqwRkkVtQg07DlNQPvlZ
	6Oy7H+B8Izj5PvHifGBXsv13biq9Fos=
X-Google-Smtp-Source: ABdhPJw93aoMRmely2aqCzGAJO09jqMJYElGYtnjBWYvpkqFmTS/JmHJB974Po0oKy9cfrYkXDq3kQ==
X-Received: by 2002:a19:690e:: with SMTP id e14mr9186lfc.298.1640034978409;
        Mon, 20 Dec 2021 13:16:18 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH V2 05/10] iommu/ipmmu-vmsa: Calculate context registers' offset instead of a macro
Date: Mon, 20 Dec 2021 23:15:52 +0200
Message-Id: <1640034957-19764-6-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1640034957-19764-1-git-send-email-olekstysh@gmail.com>
References: <1640034957-19764-1-git-send-email-olekstysh@gmail.com>
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
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
Changes V1 -> V2:
   - add R-b
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


