Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C393B3F0E1
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 00:10:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105412.1456440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utCjZ-0008Tt-SR; Mon, 01 Sep 2025 22:10:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105412.1456440; Mon, 01 Sep 2025 22:10:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utCjZ-0008Pb-JL; Mon, 01 Sep 2025 22:10:41 +0000
Received: by outflank-mailman (input) for mailman id 1105412;
 Mon, 01 Sep 2025 22:10:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pPXY=3M=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1utCjX-00055o-TK
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 22:10:39 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d232868-8780-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 00:10:37 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-55f69cf4b77so3061906e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 15:10:37 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608279307asm123038e87.75.2025.09.01.15.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 15:10:36 -0700 (PDT)
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
X-Inumbo-ID: 7d232868-8780-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756764637; x=1757369437; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7jLnGK/W9IzxOZ6CLKOO5BPor3o3fyjNQvRa1agLv/o=;
        b=iTP2GJ/agVaLRIl9CbyxtbmKv9vK0Kmfc0vQvD9UJJ+VsWHnwm0C91teejA5069jbj
         lvFqrgdbERgifdjCWjURa5l9Bu8c9emdO4e8DqxZj/ebimOAlGs4BZfd5yFcFhvquTeq
         3WEwZw9jewRdjaDmWlnViXn/8J7ukMTjdNha7uVsH2IPYGmmWmbyfOIJmcaLwd3ZFrBu
         D/00UtgdFwaF+rNmxT0mDBvPftWN4BWm4PH+wJadGkCpR+z2S3Jk+1j7lpNbf43tAw5D
         oTMCxYXZacmJUr+LstIXKxlSy7FlwXJczRaazLnvNJdP04Y/B1SLm12N05aetx+kk1Ul
         fL2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756764637; x=1757369437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7jLnGK/W9IzxOZ6CLKOO5BPor3o3fyjNQvRa1agLv/o=;
        b=Kl6XnjXUI5L8r90NrRQ6pL1FYqA9VjslaIcnFvcd+wC8o9gGLZEe/FJ0cHe/za5YHG
         +O864eobkRAnUpfO1ym45/ZAuwi0/FaYxXtFK+I+mkrztqMa3AL8iAV7VMNt35OSnMPp
         Ry/YbM7saD1Ns1eW3j4lMLJnxnw9Y8Ji6Tyf33pHCAqlEEz/uOeGV4XvY+KKp6vB3TeR
         Dd6e6vf1OJtgVUGIVGgmWS7ZMVMuE53iw4O2KTUIzEG/I7B+Iaozo4tYgSIZWVXnE2Vo
         CcBl3a1d8j4d8hnAvL7/SScYfFGOSYQgaNSsUYBIEhTB3bYgPeJHCtzL1REO22f4WBhb
         uFhg==
X-Gm-Message-State: AOJu0Yx7K6ZRTJAE2/O1XtvM83f05XC1xVpsDmedUEbd0E0wWaorTb3a
	pGesJ2r/BX7HGZ0n1i6LQdF9Gfkh0mGmuH5wwfycrQKKgN4gZz4FArsxL7nnyiTS
X-Gm-Gg: ASbGnct64cGiOEmevkj+8JPF/y1Zve+X5FLAzDZ2VjPvBHf8PxHlAKXg/uoJtNBuHCf
	Z28SAmUyv5sDYQjdNzuJOaWqnJnSGkfDOgCcPo8QWEBXx/dCdsm9eGMgkZJD9z+OTunwz4Qmv8i
	Ew1GmlKramjC2vUOe2hMo9n5pCHVhxnMvfaZ6egEettEf48Jt+9I+JaAXyj+fjnMtroKISWA5si
	WdKWQMznb/eJAs0vV9mYyOez/H6NWAnC2ZWoqD4JvnqenRSwiTXXB1O12camonfEZ3Hiec7n/Y2
	MppBAalrq4m39+HD0PlQmDuGPnJKzGU7daSBslhCnvQlglIxr/yZoAyd8gEgV0+D1+oj9xAnvBg
	NSZJkkmlotKRwVF5qEoOKGv6mQ5n4vNoXeEKcHAw8RX8k6PvDQ0YtVWjkzaLZnQ==
X-Google-Smtp-Source: AGHT+IGXdEdoSAzn5JEBY3rqDuehu56DiyGTfp49x/4lqJkOcHbolBJuNKUoq29Yojmc/eQDmAjVSQ==
X-Received: by 2002:a05:6512:3c97:b0:55f:6a49:6e71 with SMTP id 2adb3069b0e04-55f708ecdadmr2606498e87.29.1756764636522;
        Mon, 01 Sep 2025 15:10:36 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Rahul Singh <rahul.singh@arm.com>,
	Mykola Kvach <mykola_kvach@epam.com>
Subject: [PATCH v6 12/13] xen/arm: Suspend/resume IOMMU on Xen suspend/resume
Date: Tue,  2 Sep 2025 01:10:16 +0300
Message-ID: <a846121bf586667f9a7a984955589acb9026bd68.1756763487.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1756763487.git.mykola_kvach@epam.com>
References: <cover.1756763487.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This is done using generic iommu_suspend/resume functions that cause
IOMMU driver specific suspend/resume handlers to be called for enabled
IOMMU (if one has suspend/resume driver handlers implemented).

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in V6:
- Drop iommu_enabled check from host system suspend.
---
 xen/arch/arm/suspend.c                | 11 +++++++++++
 xen/drivers/passthrough/arm/smmu-v3.c | 10 ++++++++++
 xen/drivers/passthrough/arm/smmu.c    | 10 ++++++++++
 3 files changed, 31 insertions(+)

diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
index 35b20581f1..f3a3b831c5 100644
--- a/xen/arch/arm/suspend.c
+++ b/xen/arch/arm/suspend.c
@@ -5,6 +5,7 @@
 
 #include <xen/console.h>
 #include <xen/cpu.h>
+#include <xen/iommu.h>
 #include <xen/llc-coloring.h>
 #include <xen/sched.h>
 #include <xen/tasklet.h>
@@ -62,6 +63,13 @@ static void cf_check system_suspend(void *data)
 
     time_suspend();
 
+    status = iommu_suspend();
+    if ( status )
+    {
+        system_state = SYS_STATE_resume;
+        goto resume_time;
+    }
+
     console_start_sync();
     status = console_suspend();
     if ( status )
@@ -118,6 +126,9 @@ static void cf_check system_suspend(void *data)
     console_resume();
     console_end_sync();
 
+    iommu_resume();
+
+ resume_time:
     time_resume();
 
  resume_nonboot_cpus:
diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index 81071f4018..f887faf7dc 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -2854,6 +2854,13 @@ static void arm_smmu_iommu_xen_domain_teardown(struct domain *d)
 	xfree(xen_domain);
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+static int arm_smmu_suspend(void)
+{
+	return -ENOSYS;
+}
+#endif
+
 static const struct iommu_ops arm_smmu_iommu_ops = {
 	.page_sizes		= PAGE_SIZE_4K,
 	.init			= arm_smmu_iommu_xen_domain_init,
@@ -2866,6 +2873,9 @@ static const struct iommu_ops arm_smmu_iommu_ops = {
 	.unmap_page		= arm_iommu_unmap_page,
 	.dt_xlate		= arm_smmu_dt_xlate,
 	.add_device		= arm_smmu_add_device,
+#ifdef CONFIG_SYSTEM_SUSPEND
+	.suspend		= arm_smmu_suspend,
+#endif
 };
 
 static __init int arm_smmu_dt_init(struct dt_device_node *dev,
diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 22d306d0cb..45f29ef8ec 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -2947,6 +2947,13 @@ static void arm_smmu_iommu_domain_teardown(struct domain *d)
 	xfree(xen_domain);
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+static int arm_smmu_suspend(void)
+{
+	return -ENOSYS;
+}
+#endif
+
 static const struct iommu_ops arm_smmu_iommu_ops = {
     .page_sizes = PAGE_SIZE_4K,
     .init = arm_smmu_iommu_domain_init,
@@ -2960,6 +2967,9 @@ static const struct iommu_ops arm_smmu_iommu_ops = {
     .map_page = arm_iommu_map_page,
     .unmap_page = arm_iommu_unmap_page,
     .dt_xlate = arm_smmu_dt_xlate_generic,
+#ifdef CONFIG_SYSTEM_SUSPEND
+    .suspend = arm_smmu_suspend,
+#endif
 };
 
 static struct arm_smmu_device *find_smmu(const struct device *dev)
-- 
2.48.1


