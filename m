Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA820B3F0DD
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 00:10:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105404.1456391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utCjS-0006qc-Lp; Mon, 01 Sep 2025 22:10:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105404.1456391; Mon, 01 Sep 2025 22:10:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utCjS-0006kP-El; Mon, 01 Sep 2025 22:10:34 +0000
Received: by outflank-mailman (input) for mailman id 1105404;
 Mon, 01 Sep 2025 22:10:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pPXY=3M=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1utCjQ-0005XP-Gp
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 22:10:32 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79e20492-8780-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 00:10:31 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-55f7ad815ceso1676658e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 15:10:31 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608279307asm123038e87.75.2025.09.01.15.10.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 15:10:30 -0700 (PDT)
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
X-Inumbo-ID: 79e20492-8780-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756764631; x=1757369431; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pux8zQR0d0n5/4MKkffDUfDraLZ/szsPvbUCV13VP9s=;
        b=PGGhcZ/hfRBGET+34FZXXy8e9qfhTeoJKvb0IdwX+Ak+g0G97wyBa26UM7q0xp43jI
         gq/fsySj86GTvTPOPUVlgZTyZicgN9pMkqlr85sGakaQeYQdmh9RQBjnJ4nvUUbEB3h0
         xaicmoCEs7a8vEPdS/2PG9twkX76E1FY6mSau1bgjeLXHZVjNgqQBeY9GO2gFQB0iLwN
         pxwUdc2pAQc0qMhab4xCzgs8wmdWf2+OQyKNrc55WRj1JMzriure58cY1J9eEKFZfu8N
         +YnrwHNmG0lA63ccmbrXAbCoUEhESIXDN4S2HeMYTQ6x4sFKLLzepyfuVIWvcZvEXjU9
         5tXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756764631; x=1757369431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pux8zQR0d0n5/4MKkffDUfDraLZ/szsPvbUCV13VP9s=;
        b=uQsueeDGTNzsWjuH/K+YRLhIGDR+jjCoIml4wkolRxMpHMNvGLX3k+C5aXone2kFUu
         +UqIWI4dfgeEmuau/BnjWUKxTyFYcPigvRe0+dQDBQ2oAPeXKQ/nlCkkl9fWGGMCbUk9
         C549kJeWLovTEyee0a6Bpsqs4HkzUaHVo4qzSqusE/4F6qOoVpoSl+9wXSSKeowjTYzb
         tbhFDxJwNZaWojYrd6vwgVoHEmAd2hJ2BxMrYknyHGZ+ntofIGImnkMNoXIp3i/p7Gfj
         9QJQQBLp0tKu2jBiyKJyXzKvrCYaJ06kLx9KEYeAr8KOBeHEOOZfsdyQKlXds7iGN1ts
         mZWg==
X-Gm-Message-State: AOJu0YwIaqPx7/xzKFkBzl5kO6Gd937/V3oa6KsUlwZKnDpqTnZE/fB3
	8AfeoVGjfRCLJlBQs0832tvLz39NfrMjQ3h4Fr0vw9a+pvCv5dSKnCJ/iDSzHbDm
X-Gm-Gg: ASbGncteqzkOOGFq9iF6sSGTRZ6kyYuDVoLndEqiQ7gyXNsoO5h5vdy1ys7t8GgYqDC
	TtNZi7CIduHgzSNDVRgbOei47yjXW3JtzqpMvg+mwuTio/BxNkribCwhzMTGMKObpYTFquNmeZJ
	3GbpW98AURgh4zRD82lsgc4PHzl0dfCLYZjM8KuNT7O0ijJ4QaYtqnePyNtw80G0Otv33KoJYD3
	qxSkH2z6ctMRHunXMRhvLNEx0ohtTizevPLLrd1hRYypGeyahkYK32opul8GUUJUcqbS53Usi6F
	Ul/G2mqORPHdRUkYuzh/J0TNroyPMkvONugHsaN7GR+pE8QzoGz7c6pX/RfpXy4kbfPMJeXZkl5
	uAD8Lh3/YR0zyyTk5yBcr6o1EN/2+0/6LbsclHZEheaa+ZNwlJT0FH7iicqklaV0H0S485yC4
X-Google-Smtp-Source: AGHT+IHac5NYtAevecrJdPsnvQsSQwBeZX1PPUz7eIaje6LakHkn37It/dfRC3WdGHf3MYfBkW7PZQ==
X-Received: by 2002:a05:6512:2c94:b0:55f:5b65:a3e3 with SMTP id 2adb3069b0e04-55f7093e96amr2529872e87.35.1756764631025;
        Mon, 01 Sep 2025 15:10:31 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mirela Simonovic <mirela.simonovic@aggios.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
	Mykyta Poturai <mykyta_poturai@epam.com>,
	Mykola Kvach <mykola_kvach@epam.com>
Subject: [PATCH v6 08/13] xen/arm: Implement PSCI SYSTEM_SUSPEND call (host interface)
Date: Tue,  2 Sep 2025 01:10:12 +0300
Message-ID: <20b6774cafc2d4d6c92c220d3aa94a666d55c930.1756763487.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1756763487.git.mykola_kvach@epam.com>
References: <cover.1756763487.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mirela Simonovic <mirela.simonovic@aggios.com>

Invoke PSCI SYSTEM_SUSPEND to finalize Xen's suspend sequence on ARM64 platforms.
Pass the resume entry point (hyp_resume) as the first argument to EL3. The resume
handler is currently a stub and will be implemented later in assembly. Ignore the
context ID argument, as is done in Linux.

Only enable this path when CONFIG_SYSTEM_SUSPEND is set and
PSCI version is >= 1.0.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v6:
- move calling of call_psci_system_suspend to commit that
  implements system_suspend call

Changes in v4:
  - select the appropriate PSCI SYSTEM_SUSPEND function ID based on platform
  - update comments and commit message to reflect recent changes

Changes in v3:
  - return PSCI_NOT_SUPPORTED instead of a hardcoded 1 on ARM32
  - check PSCI version before invoking SYSTEM_SUSPEND in call_psci_system_suspend
---
 xen/arch/arm/arm64/head.S          |  8 ++++++++
 xen/arch/arm/include/asm/psci.h    |  1 +
 xen/arch/arm/include/asm/suspend.h | 22 ++++++++++++++++++++++
 xen/arch/arm/psci.c                | 23 ++++++++++++++++++++++-
 4 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/include/asm/suspend.h

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 72c7b24498..3522c497c5 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -561,6 +561,14 @@ END(efi_xen_start)
 
 #endif /* CONFIG_ARM_EFI */
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+FUNC(hyp_resume)
+        b .
+END(hyp_resume)
+
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 /*
  * Local variables:
  * mode: ASM
diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm/psci.h
index 48a93e6b79..bb3c73496e 100644
--- a/xen/arch/arm/include/asm/psci.h
+++ b/xen/arch/arm/include/asm/psci.h
@@ -23,6 +23,7 @@ int call_psci_cpu_on(int cpu);
 void call_psci_cpu_off(void);
 void call_psci_system_off(void);
 void call_psci_system_reset(void);
+int call_psci_system_suspend(void);
 
 /* Range of allocated PSCI function numbers */
 #define	PSCI_FNUM_MIN_VALUE                 _AC(0,U)
diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/asm/suspend.h
new file mode 100644
index 0000000000..7e04c6e915
--- /dev/null
+++ b/xen/arch/arm/include/asm/suspend.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ASM_ARM_SUSPEND_H__
+#define __ASM_ARM_SUSPEND_H__
+
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+void hyp_resume(void);
+
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
+#endif /* __ASM_ARM_SUSPEND_H__ */
+
+ /*
+  * Local variables:
+  * mode: C
+  * c-file-style: "BSD"
+  * c-basic-offset: 4
+  * tab-width: 4
+  * indent-tabs-mode: nil
+  * End:
+  */
diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
index b6860a7760..c9d126b195 100644
--- a/xen/arch/arm/psci.c
+++ b/xen/arch/arm/psci.c
@@ -17,17 +17,20 @@
 #include <asm/cpufeature.h>
 #include <asm/psci.h>
 #include <asm/acpi.h>
+#include <asm/suspend.h>
 
 /*
  * While a 64-bit OS can make calls with SMC32 calling conventions, for
  * some calls it is necessary to use SMC64 to pass or return 64-bit values.
- * For such calls PSCI_0_2_FN_NATIVE(x) will choose the appropriate
+ * For such calls PSCI_*_FN_NATIVE(x) will choose the appropriate
  * (native-width) function ID.
  */
 #ifdef CONFIG_ARM_64
 #define PSCI_0_2_FN_NATIVE(name)    PSCI_0_2_FN64_##name
+#define PSCI_1_0_FN_NATIVE(name)    PSCI_1_0_FN64_##name
 #else
 #define PSCI_0_2_FN_NATIVE(name)    PSCI_0_2_FN32_##name
+#define PSCI_1_0_FN_NATIVE(name)    PSCI_1_0_FN32_##name
 #endif
 
 uint32_t psci_ver;
@@ -60,6 +63,24 @@ void call_psci_cpu_off(void)
     }
 }
 
+int call_psci_system_suspend(void)
+{
+#ifdef CONFIG_SYSTEM_SUSPEND
+    struct arm_smccc_res res;
+
+    if ( psci_ver < PSCI_VERSION(1, 0) )
+        return PSCI_NOT_SUPPORTED;
+
+    /* 2nd argument (context ID) is not used */
+    arm_smccc_smc(PSCI_1_0_FN_NATIVE(SYSTEM_SUSPEND), __pa(hyp_resume), &res);
+    return PSCI_RET(res);
+#else
+    dprintk(XENLOG_WARNING,
+            "SYSTEM_SUSPEND not supported (CONFIG_SYSTEM_SUSPEND disabled)\n");
+    return PSCI_NOT_SUPPORTED;
+#endif
+}
+
 void call_psci_system_off(void)
 {
     if ( psci_ver > PSCI_VERSION(0, 1) )
-- 
2.48.1


