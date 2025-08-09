Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB69B1F4F7
	for <lists+xen-devel@lfdr.de>; Sat,  9 Aug 2025 16:33:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1075987.1437754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukkdD-0000R8-Ec; Sat, 09 Aug 2025 14:33:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1075987.1437754; Sat, 09 Aug 2025 14:33:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukkdD-0000Ph-Bm; Sat, 09 Aug 2025 14:33:11 +0000
Received: by outflank-mailman (input) for mailman id 1075987;
 Sat, 09 Aug 2025 14:33:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pqdr=2V=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1ukkdC-0000Pb-HP
 for xen-devel@lists.xenproject.org; Sat, 09 Aug 2025 14:33:10 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4c54883-752d-11f0-b898-0df219b8e170;
 Sat, 09 Aug 2025 16:33:08 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5561ab55c4dso3118194e87.2
 for <xen-devel@lists.xenproject.org>; Sat, 09 Aug 2025 07:33:08 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cc859266dsm254716e87.38.2025.08.09.07.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Aug 2025 07:33:06 -0700 (PDT)
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
X-Inumbo-ID: c4c54883-752d-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754749988; x=1755354788; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MYfp+c3nhwNqnX6G10kpUDWkp2DnR8OEjC6Y4iNd7tk=;
        b=aVxdPqL1GthpEttWaSlNYTHaFD1H1y5XOpTRTAFtj0tZz9hBxIEyCrvaVpQ+erF1PS
         Y6FVaodCcRzFDDhk2+0JaGFFm6nTQv/CU4m6ooxhOWsk/c/cOJPWDdQ4QAyGUpbkX1Kn
         dpRLZ3f+VCFw6BHp8NLFXPmUXJC/r0YGkgo60CsEu9i9LCB8CsrVB0dcziU4S0e3OO/A
         Z5BH13Z8zrPFv2uTjCuRPlZtSosMNumcDlvlUWxmOaTTZErjzm43/OHKEZdrRm/WRPGb
         x79PTAzELEZfz1nNq5o8U7uc52twEEzB8goLTjtEZb4bF1MsWpuHGcmE+K25D0xlMKHl
         VrmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754749988; x=1755354788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MYfp+c3nhwNqnX6G10kpUDWkp2DnR8OEjC6Y4iNd7tk=;
        b=rSzKQq46H0CEtJSxP3BZ2JAM3M6a25mUw9j3bzHZiF/fRkJJx1eOAWp6Ig7amg680N
         oKZR1aJRUKNQq4GAKkqvcLE1lbH+1i0BCHOCb3bKqiz3ZRk5XkQjbBUUK+RBJKXZGLfQ
         eB+/g9wMwfxu0hTOtRpwuARzh5ngldMRzkowBC8VmHE1SGeRW1ZZhTS2wehuRnJRxqAM
         Ftjt2lmcrZ0t7/pqqr2CEIrPjsBlCgwex78pOXn8iSehZOL5zs60WsvtkhWVfVnRRetO
         ETOLW2m+tNalNCU7IGOn8+q5vo+OgCgHvUMIjPEEcJKnk2BiQkCb2Xa2tkaWa2FVISvQ
         uoPg==
X-Gm-Message-State: AOJu0YyOmUs0Sh4+EOqArvu0a3vjq5n+XP8eDGAMfX3/7v/mo7ycGe2x
	0nSpG/fvk+lXB4pAO4NCHOS/F2EBUXMYAAHZcY/gx2Hj/zWXZMbpDLv8vFgtuA==
X-Gm-Gg: ASbGnctb4zepVT8KG2c85I8OuxIjNISNZXMXz3nqvrstc4LA9Y/lDoX7gQPvJtcHxz+
	+6IPtlWO0chmU9UFM3Q4C3AM7nXrx0h3eHqXJahcCxFjq7914SXhMPDcScPLmfqPP5P6bxDU9Wg
	2uCh1Zvy4rV/dUKhNUcvvrGKpPC74XXP7P/dp8qONziiwZqZPNdsbTIytfxW3Q2s/5mZJ0R+Bxu
	Ub5og2FdeqjVmcIm1HTGLN8G6pYOg6LwcIr2CaKS5xC0xGZtT5e/kpb5arj1W1C8R7PIPbKoMBW
	7GSesdEgvB+X57YWZoifviiA56bI94qCU5AbuLZfuTLSNDjKI9qkcgiq4By3icznVZcj9FYYMBk
	eFD/Eth4Un3Z+g7YmFFNzqJCGlq2XuUwUWx7pYMH5vl7IwAcqkh4pAvOrVktUzQ==
X-Google-Smtp-Source: AGHT+IGa5z6R6QL8Zn7/8joMosEoXHJ0mRodGl0MTubwKSJ4t2/8Qhgd3FHFNvIfvb4Iow6aItTKcQ==
X-Received: by 2002:a05:6512:3b0f:b0:553:cede:6a9 with SMTP id 2adb3069b0e04-55cc014da54mr1724142e87.55.1754749987270;
        Sat, 09 Aug 2025 07:33:07 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: irq: add missing spin_unlock() in init_local_irq_data() error path
Date: Sat,  9 Aug 2025 17:32:41 +0300
Message-ID: <bd707bd0fd88fc53974a1214313a9b9103162bcc.1754749899.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

If init_one_irq_desc() fails, init_local_irq_data() returns without
releasing local_irqs_type_lock, leading to a possible deadlock.

Release the lock before returning to ensure proper cleanup.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 xen/arch/arm/irq.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 4bbf0b0664..02ca82c089 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -94,7 +94,10 @@ static int init_local_irq_data(unsigned int cpu)
         int rc = init_one_irq_desc(desc);
 
         if ( rc )
+        {
+            spin_unlock(&local_irqs_type_lock);
             return rc;
+        }
 
         desc->irq = irq;
         desc->action  = NULL;
-- 
2.48.1


