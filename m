Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D0E54E2F9
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jun 2022 16:07:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350629.577083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1q93-0002wi-2p; Thu, 16 Jun 2022 14:06:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350629.577083; Thu, 16 Jun 2022 14:06:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1q92-0002uS-W8; Thu, 16 Jun 2022 14:06:48 +0000
Received: by outflank-mailman (input) for mailman id 350629;
 Thu, 16 Jun 2022 13:57:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/+X/=WX=gmail.com=dmitry.semenets@srs-se1.protection.inumbo.net>)
 id 1o1pzw-0001j4-Um
 for xen-devel@lists.xenproject.org; Thu, 16 Jun 2022 13:57:24 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f578ffc-ed7c-11ec-bd2c-47488cf2e6aa;
 Thu, 16 Jun 2022 15:57:23 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id p18so2378446lfr.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jun 2022 06:57:23 -0700 (PDT)
Received: from localhost.localdomain ([91.219.254.75])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a19e30e000000b0047255d2119csm247998lfh.203.2022.06.16.06.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 06:57:22 -0700 (PDT)
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
X-Inumbo-ID: 3f578ffc-ed7c-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ANBsMVrpOfPHJzpBSaRzY2rH8VlpLm1cTHGBO/4dLYw=;
        b=o8QT9fCMAbLqvgsY43URvSBp8El0higCNMiWpPwvSAndk98VIzqw8MboBtu27S/BoO
         EPeruhLLIp48iFMAkh3AnuRrJWhBsyor/Vbmb3UjQS7DWSsUXDFjIQ19Aq0yCNwiSnLV
         CGrQhjJ08zzvGykyvjh+vhycUXAJ9OpVeCtHPr/LWWPJBhqOZbucrwBE35FrsissMpsL
         Vr5sRCi72/tnWm4vZFanhAHYiUKLYxGRxTf7xMsbuQjuKZsut79i0IbnPnBGPZIRf8Xm
         NiU3zCXGjNYMMpsz7TZhjpQ1qBK3w/IK9dHFr+1MEJRU6OwFL0OEGbgUjec1TloasWQ6
         l8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ANBsMVrpOfPHJzpBSaRzY2rH8VlpLm1cTHGBO/4dLYw=;
        b=6vQrGzttFDOckb1etzURf7yW57oSVOLE/13EqwKb8PE3WbAKgy/sqmbvNq/MVF+9vG
         yT2lsBGi6UASuAYRW4WTUuqfe3KN09E8B01MLpEI/YbZZlYC2tREkzdT248MaJ/BDPV2
         LeE6b25ix7KGQZccQs1id0sqdrn+qXsCLaxQWuU0YkysQ43ZiSvnhfXyCmqSp7uJkXbw
         TJ15mSpmfZpdcE7WToT/AmtPh6dqV9pd/FK8uyzUQmqdBDE+9S4XmTRgmM/zZGPAJRWR
         yDDhRW5Sp7/g1i6xgEPzE7tBf4sCp0kuGysXlXsX6ZGLlk2vvgICuPpqXvmmxDcNvY7C
         RZ7A==
X-Gm-Message-State: AJIora/PPhrgzAm+3xSiM8Rk8ow1keav1RNOpY21kkl24Su1jxTb/JQz
	ukAgNJEtWOJ8JQM3DZ5t5VIbCW1hMetfXw==
X-Google-Smtp-Source: AGRyM1tfcSG6v/Y1mxyIKgQusuV7BJdQ9SFFJInnpvCu/6k9QEXdec/CjffsGBXxXPGZOS/jrDvAxQ==
X-Received: by 2002:a05:6512:3408:b0:479:5933:fb7 with SMTP id i8-20020a056512340800b0047959330fb7mr2735242lfr.300.1655387842753;
        Thu, 16 Jun 2022 06:57:22 -0700 (PDT)
From: dmitry.semenets@gmail.com
To: xen-devel@lists.xenproject.org
Cc: Dmytro Semenets <dmytro_semenets@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: [PATCH] xen: Don't call panic if ARM TF cpu off returns DENIED
Date: Thu, 16 Jun 2022 16:55:41 +0300
Message-Id: <20220616135541.3333760-1-dmitry.semenets@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmytro Semenets <dmytro_semenets@epam.com>

According to PSCI specification ARM TF can return DENIED on CPU OFF.
This patch brings the hypervisor into compliance with the PSCI
specification.
Refer to "Arm Power State Coordination Interface (DEN0022D.b)"
section 5.5.2

Signed-off-by: Dmytro Semenets <dmytro_semenets@epam.com>
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/arch/arm/psci.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
index 0c90c2305c..55787fde58 100644
--- a/xen/arch/arm/psci.c
+++ b/xen/arch/arm/psci.c
@@ -63,8 +63,9 @@ void call_psci_cpu_off(void)
 
         /* If successfull the PSCI cpu_off call doesn't return */
         arm_smccc_smc(PSCI_0_2_FN32_CPU_OFF, &res);
-        panic("PSCI cpu off failed for CPU%d err=%d\n", smp_processor_id(),
-              PSCI_RET(res));
+        if ( PSCI_RET(res) != PSCI_DENIED )
+            panic("PSCI cpu off failed for CPU%d err=%d\n", smp_processor_id(),
+                PSCI_RET(res));
     }
 }
 
-- 
2.25.1


