Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A39A74600BC
	for <lists+xen-devel@lfdr.de>; Sat, 27 Nov 2021 18:52:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234021.406218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mr1rk-0005CC-4P; Sat, 27 Nov 2021 17:52:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234021.406218; Sat, 27 Nov 2021 17:52:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mr1rj-0004w9-LV; Sat, 27 Nov 2021 17:51:59 +0000
Received: by outflank-mailman (input) for mailman id 234021;
 Sat, 27 Nov 2021 17:51:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BaOL=QO=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mr1rh-0004Ih-CJ
 for xen-devel@lists.xenproject.org; Sat, 27 Nov 2021 17:51:57 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b680862a-4faa-11ec-976b-d102b41d0961;
 Sat, 27 Nov 2021 18:51:56 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id k37so32613100lfv.3
 for <xen-devel@lists.xenproject.org>; Sat, 27 Nov 2021 09:51:56 -0800 (PST)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id f18sm827075ljc.104.2021.11.27.09.51.55
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
X-Inumbo-ID: b680862a-4faa-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dtfeyRHebMlcl10xVwWyfn47FIgKMBc9tKO7DdPGuNk=;
        b=Kuoy10M2GVMPc/DLyV92XhRBKu1oetKKHZouKB4xhmG22hJ8XRv1Y3F+tWbUlaCQYB
         /QYEADs698QECXWxg1hchlVSOBP1yUNvEjnhdFPC6QD5Axs3kCUR0acovI0L1d3UXQsC
         Zqyvl6vtQrmY+rbsB076LkUUbeHCjR7RlAAgpokibB+UYQW8RAZJhBFWOVgiMrjLKOvM
         3mVlQxV36iAjZJazDL3i7K5dHBaYcsaWL/k5AfEs754euLyLkP/gr1BLFSj4qvzMkAMy
         vveR2/mkuOmUtfdpLSTfRPICp21xIzA9PqDi8LTu/+bRnZB9o5yON46cDNj90HVHfvr/
         X9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dtfeyRHebMlcl10xVwWyfn47FIgKMBc9tKO7DdPGuNk=;
        b=s3cPKb7nnElYRpwOozmJuJoMlZVSQLvRI1jdNkK7PpRGpKQwYmQRsbS8aC5bpWxzJ/
         z9HKxdYXamXLQcqMkk2bDD4Sdb4WnG8YrUE4uTfkoZ7y7B4FbRPrzP3qfFJuRTP6682m
         56bxcHF5QxcB1wR3OBQjcCdXZ6uKH2rOBh2YhrxXeAESFxZUfcvSPKe9IJu3G/GwFn9R
         M3BGa8zR3EvZnL4x3AR9rWLRg3W0Ft9trl1Oe6Yp5pRm2aBqGrLA10IA/tnLXUCLlKrn
         N9dffAPQnIcWkKwtrxbCMMlQ41yq0rQqpPahrwCW3j4/nDE4k7Is3RR1uxiUSpEfCyJA
         jHNQ==
X-Gm-Message-State: AOAM530ZYWv3WSNJUlqwiMZtqlphNEIMvnQL6dOY4LMTquELh2D5TSZt
	ftKbx1j35dAltJpoEGcoYqBrfwclrFo=
X-Google-Smtp-Source: ABdhPJzMWLvRMudm97ubcULlgNgZHOkIpC398jyRErsvnGV1oHhEM+JhWsbw84Zdot73uTkXhqOi4w==
X-Received: by 2002:a05:6512:3d8c:: with SMTP id k12mr38698652lfv.365.1638035516219;
        Sat, 27 Nov 2021 09:51:56 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 06/10] iommu/ipmmu-vmsa: Add utlb_offset_base
Date: Sat, 27 Nov 2021 19:51:41 +0200
Message-Id: <1638035505-16931-7-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1638035505-16931-1-git-send-email-olekstysh@gmail.com>
References: <1638035505-16931-1-git-send-email-olekstysh@gmail.com>
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


