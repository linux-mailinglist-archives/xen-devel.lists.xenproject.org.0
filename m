Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0258D69F815
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 16:34:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499552.770847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUr8K-0004l8-2A; Wed, 22 Feb 2023 15:34:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499552.770847; Wed, 22 Feb 2023 15:34:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUr8I-0004Uq-Ml; Wed, 22 Feb 2023 15:34:14 +0000
Received: by outflank-mailman (input) for mailman id 499552;
 Wed, 22 Feb 2023 15:34:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvgA=6S=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pUr8C-0001MH-FF
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 15:34:08 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 578f1631-b2c6-11ed-93b6-47a8fe42b414;
 Wed, 22 Feb 2023 16:34:06 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id f18so10544559lfa.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Feb 2023 07:34:06 -0800 (PST)
Received: from localhost.localdomain (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 q9-20020ac25289000000b004db0d26adb4sm927746lfm.182.2023.02.22.07.34.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 07:34:06 -0800 (PST)
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
X-Inumbo-ID: 578f1631-b2c6-11ed-93b6-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G/X5KC3KPrylB3VOA87nQRK8zMTV0Yo7K5jzAEfaZqM=;
        b=BiBI0jbPKBI4welALwUtVN89qYfR1BkiTBwDkT+C+bFarA7eY6ZdgmyUhfcVoS/s7i
         fXFHx6g832m6SZgh/t7IJsN88hltOFTld2HhEPu4QaYwfl3vANaBPgWrmO5Lp0mGWbDL
         x+lQPW4lbO9T59cm5Mrgx5T+W/elLyPsnXGTnziFG5UCPI/qdFZvAdwiLSnmOzPRpvW4
         drWtFTcmGlkd8EjrT65Gen771+9AQVo9CcDQg1mEtNZMo18qgmcHWJ+ZXVt6m+V0j+oA
         dbg6qQyOv0n78sT+K9SsZ3VLR7DOx/lFAYF3GIdAg4eVQnd2OptSu0GKMyHTuos75W10
         79AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G/X5KC3KPrylB3VOA87nQRK8zMTV0Yo7K5jzAEfaZqM=;
        b=EbEamxhxbhQsoinuNhFVaSOMWnm+4Ir9PC1Riy3rrRlyewUGof9BGy2y1MToGEnj4t
         27Oav7m24cv8xJAtzxofvikeViWexoe7KbfBeXr6D6oAFuKPdAclAmlr0KxtRdC/LwM3
         fKZZkZVG3JcNgK88MU8mopICJI94KA1xbgu/VJji1wcFwq98PgsqvXunT4WF7tiWGc1x
         ga3tiGe8rUkU/pP2koNmXohJM0kfVcF+eYvkVOc/YB1swgDpTuht2Lu2aAI3/huUQCbi
         bh2MlqxvbeuG50MDCFl+K7WsFGqOmLcmpX7xEK9mYEHJzyDiDSNga3CU50hGMzBTFSg3
         sGOw==
X-Gm-Message-State: AO0yUKUoPtIcvm/S6FF2vZ4JXarcsFvSBMJswuDCRHkIf3vIERqfsyuU
	YE26ngsevYlIJhYShkBAo4q3WISZ68/5x4XIxKM=
X-Google-Smtp-Source: AK7set+y8n4M2F+vnq1AqE4NZOLtp1Zn6O1TO09h1u14zQ6vavsu3iXYmjkK47rB0n7oRpzNE3zN7w==
X-Received: by 2002:a05:6512:31cd:b0:4db:5120:367 with SMTP id j13-20020a05651231cd00b004db51200367mr3754959lfe.31.1677080046518;
        Wed, 22 Feb 2023 07:34:06 -0800 (PST)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com,
	Marc Bonnici <marc.bonnici@arm.com>,
	Achin Gupta <achin.gupta@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [XEN PATCH v7 15/20] xen/arm: move regpair_to_uint64() and uint64_to_regpair() to regs.h
Date: Wed, 22 Feb 2023 16:33:12 +0100
Message-Id: <ee6ebe4d22c3aecf35b7a4813ca95b2978eed534.1677079672.git.jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677079671.git.jens.wiklander@linaro.org>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Moves the two helper functions regpair_to_uint64() and
uint64_to_regpair() from xen/arch/arm/tee/optee.c to the common arm
specific regs.h. This enables reuse of these functions in the FF-A
mediator in a subsequent patch.

Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/include/asm/regs.h | 12 ++++++++++++
 xen/arch/arm/tee/optee.c        | 11 -----------
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/include/asm/regs.h b/xen/arch/arm/include/asm/regs.h
index 0693a681315f..aa39e83ee5f4 100644
--- a/xen/arch/arm/include/asm/regs.h
+++ b/xen/arch/arm/include/asm/regs.h
@@ -60,6 +60,18 @@ static inline bool guest_mode(const struct cpu_user_regs *r)
 register_t get_user_reg(struct cpu_user_regs *regs, int reg);
 void set_user_reg(struct cpu_user_regs *regs, int reg, register_t val);
 
+static inline uint64_t regpair_to_uint64(register_t reg0, register_t reg1)
+{
+    return ((uint64_t)reg0 << 32) | (uint32_t)reg1;
+}
+
+static inline void uint64_to_regpair(register_t *reg0, register_t *reg1,
+                                     uint64_t val)
+{
+    *reg0 = val >> 32;
+    *reg1 = (uint32_t)val;
+}
+
 #endif
 
 #endif /* __ARM_REGS_H__ */
diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
index 9cb9f16d43cb..47027ecef47c 100644
--- a/xen/arch/arm/tee/optee.c
+++ b/xen/arch/arm/tee/optee.c
@@ -268,17 +268,6 @@ static int optee_domain_init(struct domain *d)
     return 0;
 }
 
-static uint64_t regpair_to_uint64(register_t reg0, register_t reg1)
-{
-    return ((uint64_t)reg0 << 32) | (uint32_t)reg1;
-}
-
-static void uint64_to_regpair(register_t *reg0, register_t *reg1, uint64_t val)
-{
-    *reg0 = val >> 32;
-    *reg1 = (uint32_t)val;
-}
-
 static struct page_info *get_domain_ram_page(gfn_t gfn)
 {
     struct page_info *page;
-- 
2.34.1


