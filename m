Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B2D96C3BF
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 18:16:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790554.1200415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slsfm-0002g0-F4; Wed, 04 Sep 2024 16:15:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790554.1200415; Wed, 04 Sep 2024 16:15:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slsfm-0002dT-8N; Wed, 04 Sep 2024 16:15:58 +0000
Received: by outflank-mailman (input) for mailman id 790554;
 Wed, 04 Sep 2024 16:15:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ufny=QC=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1slsfk-0000LO-16
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 16:15:56 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f605ec91-6ad8-11ef-99a1-01e77a169b0f;
 Wed, 04 Sep 2024 18:15:54 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5334b0e1a8eso8739576e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 09:15:54 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53569eeb4d9sm143326e87.65.2024.09.04.09.15.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 09:15:52 -0700 (PDT)
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
X-Inumbo-ID: f605ec91-6ad8-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725466554; x=1726071354; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nym7Vpc1+HcpD0fJwqv749eMWZaaEovUQaBKn9/MOQM=;
        b=dR6ILUOPoqO/aIFjvSHqaTRq3ssEFkxZlY9yjvZXpjM2yLtan9Xua3XyfHsZxspH1M
         SH0IyJqxO0l5cTihGwiJR2vPYS95ftVNN8CRfOzzlss7/NI5InOMFvOSVKop0H7Gk29T
         7gqh8sz6HCt7ju+jFsIUQCp+CRCkoNenyH2iijJyEvI7tAt90NcY5LOIcFFw6Kpq7Ofm
         xb5+lb/S8qm/C2hPxj3slhHlf2BcE/ETkWSWL1JLYBNmtuWMhuNMJTGEpv0UM1meoOEt
         C4+dpSbGq/qP7gHcnHf1eheMrcXQ2pqsQYNaljZKvfoMr6j8lTe+MJDYkRamWRQyWxkh
         ElIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725466554; x=1726071354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nym7Vpc1+HcpD0fJwqv749eMWZaaEovUQaBKn9/MOQM=;
        b=lrEzqAfkvoY2B0oKeMRR3WWR5Z0JLemHlPB229+3fL8OYbcArj0PPz3UPy/714vUs0
         FGhAYBdW447G/eUMhLk+hmlDa8v7LKzE38G2ZFiYx3a2c2oeND5L/qxKgOeHw3y+Qs/B
         S4Xibv0PLI+Qvi5X5zpzvmKYr/iVSOK5Br5Q6UMNCuomNdUQcZAOlNTAyK6+mWQYXLta
         IkVzk+tt/ML0P3gyNDSfo6v2O44cfd50G7k8L+Xl0CEUA91rJO47wRzPKBK/rySCixJ/
         ggmZx/16f0GI2Uruoa95+Itwnm+TskrJJ5x6mD20ZPPUMjqEoYl0H8L0XJz1W07LelWz
         Uy3A==
X-Forwarded-Encrypted: i=1; AJvYcCX0udJWNpcuWV0ZEWLdkXqNjeStT7pxPtPDBIVsjlhQelvDdGFRvkM2Bxadg7n3Lk8Niu91XnR64LA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwRDVjQw9hk52ss5RgMdRJRo7lvR1e8gG26aVssjzFAmm5V/Pys
	yF4w8dyuvOjojLVpRvI75zzPbeiNhVtD2Isw+V1ur5UM7roEGCX8
X-Google-Smtp-Source: AGHT+IHdK+MGVaxZaTPG5mtVrOpYHs1uliw2A+U9Y8zDTRSlyKp4eJOx4pA7txuXly/nIFn97leCnQ==
X-Received: by 2002:a05:6512:39d4:b0:530:e228:7799 with SMTP id 2adb3069b0e04-53546bab2e9mr14075298e87.58.1725466553759;
        Wed, 04 Sep 2024 09:15:53 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	xenia.ragiadakou@amd.com,
	jason.andryuk@amd.com,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org,
	qemu-arm@nongnu.org
Subject: [PULL v1 08/12] hw/arm: xenpvh: Rename xen_arm.c -> xen-pvh.c
Date: Wed,  4 Sep 2024 18:15:32 +0200
Message-ID: <20240904161537.664189-9-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240904161537.664189-1-edgar.iglesias@gmail.com>
References: <20240904161537.664189-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Rename xen_arm.c -> xen-pvh.c to better express that this
is a PVH machine and to align with x86 HVM and future PVH
machine filenames:
hw/i386/xen/xen-hvm.c
hw/i386/xen/xen-pvh.c (in preparation)

No functional changes.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 hw/arm/meson.build              | 2 +-
 hw/arm/{xen_arm.c => xen-pvh.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename hw/arm/{xen_arm.c => xen-pvh.c} (100%)

diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 074612b40c..4059d0be2e 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -61,7 +61,7 @@ arm_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-e
 arm_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
 arm_ss.add(when: 'CONFIG_XEN', if_true: files(
   'xen-stubs.c',
-  'xen_arm.c',
+  'xen-pvh.c',
 ))
 
 system_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c'))
diff --git a/hw/arm/xen_arm.c b/hw/arm/xen-pvh.c
similarity index 100%
rename from hw/arm/xen_arm.c
rename to hw/arm/xen-pvh.c
-- 
2.43.0


