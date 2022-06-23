Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E439557425
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 09:44:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354494.581628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4HW1-0003Ba-EY; Thu, 23 Jun 2022 07:44:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354494.581628; Thu, 23 Jun 2022 07:44:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4HW1-00039T-Bb; Thu, 23 Jun 2022 07:44:37 +0000
Received: by outflank-mailman (input) for mailman id 354494;
 Thu, 23 Jun 2022 07:44:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0A1Q=W6=gmail.com=dmitry.semenets@srs-se1.protection.inumbo.net>)
 id 1o4HW0-000394-2t
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 07:44:36 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 538ea0c9-f2c8-11ec-b725-ed86ccbb4733;
 Thu, 23 Jun 2022 09:44:35 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id y32so31899391lfa.6
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jun 2022 00:44:35 -0700 (PDT)
Received: from localhost.localdomain ([91.219.254.75])
 by smtp.gmail.com with ESMTPSA id
 w24-20020a194918000000b0047255d21190sm2869071lfa.191.2022.06.23.00.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jun 2022 00:44:33 -0700 (PDT)
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
X-Inumbo-ID: 538ea0c9-f2c8-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mwbVZbkGb1mIzAb6cGBQmcbXv0Qp1YQ7XptNOzCcVVU=;
        b=agdJCNDWKtal+dxhtZ0ntcI1xPHADJTK+qpcTEREiEVTjCMQ8nWc04LwjGNQXfb1Oq
         0Gd0Hm9q+eC2xXn1OXmWlc1qNYPmqpRMC0vNfjDSESlZNeG4GG5SHeo8zcKdRStA8B58
         qtM1yoD5192Hyr2BD/0nRD79AJZvaqS0WiNQ6NdSmA+AM0M0laYHCiKHs2+CHjFyB5Yp
         cVR85k04ofgLqDuciqcc6C7RNZUmumtPKRVdMVX2CQWZg5lHMYIrzYbZRw40ydg1uRgk
         rOuvy9U80p8cOzOpwBCrVL2ET+Ru0D3LXsVKhKqWnFjPvarYrUJlR8ZEqp9q7NaD2WzI
         bGcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mwbVZbkGb1mIzAb6cGBQmcbXv0Qp1YQ7XptNOzCcVVU=;
        b=t5FVhtUswOYC3v8Nd5i74M+POBsGPDEU58E2sYHE6QsMH/ZPFQt64ZOxv10k/WpwXA
         lbX+Ojs/7QZzu3QxHDm498PupG2nZmrt7x5QH9VT2wwAdGQqD7Sop5DqVHY066SvrGbe
         mVUFiwPyRUHoVzyQvk8XUbrHBYZK1UckKkjWVQP35ugIFbuBlj/g+zWt2TOPfAxn8Bww
         1iF5Oh+RCmy3L/QujPLBQF7WihyeGyOFXU+5RU3YNmpjJpcaTlAihhu9ODVy/twY9oSM
         dvZnoJBd5WCP5cExD+wYfvQTFaa6IiBD71kWBIAuAW1v4lMY/2LPJX4waKEIDI7jVuDz
         h51A==
X-Gm-Message-State: AJIora/S7AVz1IuwSpKIxHbyWeEDlqRsot/fQy3aB7R1vnvuzLSRhcvJ
	rnywN6Tbpln41Bz1Hn1E3kiqfoceHJs6oA==
X-Google-Smtp-Source: AGRyM1tgGEDjTbPw3X1ZM+Cnm2NXts2D69Tzg5f9IP0yHqdEP6loNsINQiZduPQRxoczuewJNo8IWw==
X-Received: by 2002:a05:6512:2398:b0:479:24aa:6454 with SMTP id c24-20020a056512239800b0047924aa6454mr4829473lfv.664.1655970274322;
        Thu, 23 Jun 2022 00:44:34 -0700 (PDT)
From: dmitry.semenets@gmail.com
To: xen-devel@lists.xenproject.org
Cc: Dmytro Semenets <dmytro_semenets@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen: arm: Don't use stop_cpu() in halt_this_cpu()
Date: Thu, 23 Jun 2022 10:44:28 +0300
Message-Id: <20220623074428.226719-1-dmitry.semenets@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmytro Semenets <dmytro_semenets@epam.com>

When shutting down (or rebooting) the platform, Xen will call stop_cpu()
on all the CPUs but one. The last CPU will then request the system to
shutdown/restart.

On platform using PSCI, stop_cpu() will call PSCI CPU off. Per the spec
(section 5.5.2 DEN0022D.b), the call could return DENIED if the Trusted
OS is resident on the CPU that is about to be turned off.

As Xen doesn't migrate off the trusted OS (which BTW may not be
migratable), it would be possible to hit the panic().

In the ideal situation, Xen should migrate the trusted OS or make sure
the CPU off is not called. However, when shutting down (or rebooting)
the platform, it is pointless to try to turn off all the CPUs (per
section 5.10.2, it is only required to put the core in a known state).

So solve the problem by open-coding stop_cpu() in halt_this_cpu() and
not call PSCI CPU off.

Signed-off-by: Dmytro Semenets <dmytro_semenets@epam.com>
---
 xen/arch/arm/shutdown.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/shutdown.c b/xen/arch/arm/shutdown.c
index 3dc6819d56..a9aea19e8e 100644
--- a/xen/arch/arm/shutdown.c
+++ b/xen/arch/arm/shutdown.c
@@ -8,7 +8,12 @@
 
 static void noreturn halt_this_cpu(void *arg)
 {
-    stop_cpu();
+    local_irq_disable();
+    /* Make sure the write happens before we sleep forever */
+    dsb(sy);
+    isb();
+    while ( 1 )
+        wfi();
 }
 
 void machine_halt(void)
-- 
2.25.1


