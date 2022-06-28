Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB34355E599
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jun 2022 17:09:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357198.585680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Cpn-0003yw-JC; Tue, 28 Jun 2022 15:08:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357198.585680; Tue, 28 Jun 2022 15:08:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Cpn-0003vi-GD; Tue, 28 Jun 2022 15:08:59 +0000
Received: by outflank-mailman (input) for mailman id 357198;
 Tue, 28 Jun 2022 15:08:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VwHr=XD=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o6Cpm-0003vc-Ai
 for xen-devel@lists.xenproject.org; Tue, 28 Jun 2022 15:08:58 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b7542b4-f6f4-11ec-b725-ed86ccbb4733;
 Tue, 28 Jun 2022 17:08:57 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id g26so26400667ejb.5
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jun 2022 08:08:57 -0700 (PDT)
Received: from uni.. (adsl-146.37.6.170.tellas.gr. [37.6.170.146])
 by smtp.googlemail.com with ESMTPSA id
 q10-20020a170906940a00b006fe8bf56f53sm6668274ejx.43.2022.06.28.08.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 08:08:56 -0700 (PDT)
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
X-Inumbo-ID: 3b7542b4-f6f4-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ACpe12rHHvpdrdhy+82lhTBW41nWcQXj5b1t3gYtOfA=;
        b=khYJQ/k0MsWHAgd+ZQevIeQNilPWk0kdo4dtM9JhXHyjdKPlaG4Pe43HZ2+HvFKrdY
         mmU9MWIYV+1+45zuKuT0nuLVXXgu97I9zIgcHo0NiL1THmPAMQrsUnJ8ww/BA6qhMwVw
         Dg6ndBJFcp0pqIc2XUhCq9Lz4ZB4YcSmthx3BcXCm2tBfENrO+yFWmq5WOEyHWm6Nmgo
         Dmqq4Qr2mjSCkAnvP2VklU9XQ4HKYr6lz/oLSvQOMGUW8ib9n6OvBRWGe3aZgdo+Vvmi
         me04ECpzP88d/yWNJS/HKOt3AoClILdyWhBXSqzmnJBsXiXWdezYrUHA2Kxijn5L3Mwh
         lbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ACpe12rHHvpdrdhy+82lhTBW41nWcQXj5b1t3gYtOfA=;
        b=dH9GIiQAhipKJptmH0/oaTB/a9EGoC8Ny3ErsqaTcupYtNSAKnS1p7N/QrThWnRhUq
         049EA7xFu3Nr9iedMFfkSEVBmHXDQrvJVGDN0xuj9idE0vuqEUbx72qzzyPUT2lfLLSV
         lGhKvvjjF7ybRQywTf84PLaeZsdIYVo1hk/LN0tJJQ1rvRBriiwszectlmm+6dHMGZHa
         yjgHC9X9V1DVCb52xlKv0fucJ+bOKkQ9Ml8nq8t7e1BtPA84IbHcIDtUbhadcuDWCadh
         cGWaywvgmKdWBt065PXfcHcgFkucugMKszKTps/zTaS90xVWti2NGjUP7fpb9byV1s31
         enlA==
X-Gm-Message-State: AJIora+lW0xPvzjMdYoGReqym14rlXBAPGPZGR1Zbo/f5t+x5v+O/GK8
	CPW/4TsLmc71zqSByTxtxhOytquqTiE=
X-Google-Smtp-Source: AGRyM1uPxfWpPy+5aHbKyD8xmSQq4e2Mxji9oMECs2fAmTcKKzFXtl3t0lHG3/Vu0j7rKAVqs/N4tw==
X-Received: by 2002:a17:906:5053:b0:70d:a0cc:b3fd with SMTP id e19-20020a170906505300b0070da0ccb3fdmr18473630ejk.162.1656428936737;
        Tue, 28 Jun 2022 08:08:56 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Rahul Singh <rahul.singh@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: smmu-v3: Fix MISRA C 2012 Rule 1.3 violations
Date: Tue, 28 Jun 2022 18:08:51 +0300
Message-Id: <20220628150851.8627-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The expression 1 << 31 produces undefined behaviour because the type of integer
constant 1 is (signed) int and the result of shifting 1 by 31 bits is not
representable in the (signed) int type.
Change the type of 1 to unsigned int by adding the U suffix.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
Q_OVERFLOW_FLAG has already been fixed in upstream kernel code.
For GBPA_UPDATE I will submit a patch.

 xen/drivers/passthrough/arm/smmu-v3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index 1e857f915a..f2562acc38 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -338,7 +338,7 @@ static int platform_get_irq_byname_optional(struct device *dev,
 #define CR2_E2H				(1 << 0)
 
 #define ARM_SMMU_GBPA			0x44
-#define GBPA_UPDATE			(1 << 31)
+#define GBPA_UPDATE			(1U << 31)
 #define GBPA_ABORT			(1 << 20)
 
 #define ARM_SMMU_IRQ_CTRL		0x50
@@ -410,7 +410,7 @@ static int platform_get_irq_byname_optional(struct device *dev,
 
 #define Q_IDX(llq, p)			((p) & ((1 << (llq)->max_n_shift) - 1))
 #define Q_WRP(llq, p)			((p) & (1 << (llq)->max_n_shift))
-#define Q_OVERFLOW_FLAG			(1 << 31)
+#define Q_OVERFLOW_FLAG			(1U << 31)
 #define Q_OVF(p)			((p) & Q_OVERFLOW_FLAG)
 #define Q_ENT(q, p)			((q)->base +			\
 					 Q_IDX(&((q)->llq), p) *	\
-- 
2.34.1


