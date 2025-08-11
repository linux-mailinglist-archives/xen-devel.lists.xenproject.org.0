Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AE2B216C9
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 22:49:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077954.1439029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulZS5-0007t2-Lg; Mon, 11 Aug 2025 20:49:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077954.1439029; Mon, 11 Aug 2025 20:49:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulZS5-0007po-DP; Mon, 11 Aug 2025 20:49:05 +0000
Received: by outflank-mailman (input) for mailman id 1077954;
 Mon, 11 Aug 2025 20:49:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=21ui=2X=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1ulZS3-0005co-Io
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 20:49:03 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c916888-76f4-11f0-a327-13f23c93f187;
 Mon, 11 Aug 2025 22:49:02 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-af9a25f091fso642644066b.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 13:49:02 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.Dlink ([77.52.179.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a3bd2sm2065710466b.54.2025.08.11.13.48.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 13:49:00 -0700 (PDT)
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
X-Inumbo-ID: 9c916888-76f4-11f0-a327-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754945341; x=1755550141; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WV3I3iVcTMMqNyOJNyQt08YG5fWdAf6qVI+oDW1WgEk=;
        b=cKJuw1XecDJZ8r3iZ/XGO0iRRYWQOExemJyAASxe95qw/V3a39O5JPFAzCaaSWCbVV
         p6gMtcI6aqhv97XcLr5Astq1zgLzyvO+b7K/TZzKVEo5VKecuDtGVfJ31NAgZ694XdwI
         oS5+rR8Muz1czrdCLOGrIb/67NJaymkPpuSVETaQnU+Fre9GCkX/7cmrp36s0BIzrZTk
         YwexBTOk2DYu22R4wkqFwHsUqXgtRAZusYYdxK5yKuvIMpy8kX/paXGK+/gKPEhb1hAU
         oydJJqy6mvNOVoaxzKeNLzmk8K8uwkJ16ugTc2mhGEW1Qdj/EGSOUlmLXDIQXUG4vIW4
         XveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754945341; x=1755550141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WV3I3iVcTMMqNyOJNyQt08YG5fWdAf6qVI+oDW1WgEk=;
        b=L4B6LUv6b5/9x7XKwuzt+qaMjHl4TKK7dbgxjkmZb4bi/NHa1FHZGsJ8ocdiIU20WY
         8hLQXxZizGan030sTfWgIYnAe7X7+JKn5SO2TMclofmuxdXNVCtziCZYX211cBty8EDH
         GoePd2d6xf1kXXivSXA3/IF7e7xpXLWq1jgTT7MS3mjjYcYy4INUtwXF1Ff3M/nxYLgh
         zL8BXCYtGUHhXXmbmWIPGKUhzi1BainhSOIX46cMr7p4qlfeoS/u0hdldlOdlaUm5KKl
         4n+RW/g6nAyvByALCpys7f6xW9l3K9W+PdY5iVY0JB4/rSaV3aXEY1TkPYISbswG/+yE
         qQKg==
X-Gm-Message-State: AOJu0Yxewy7hGe3ExZSzk7GlO7UPQao++YTypEbDvnvGOyTMTfR7z7XE
	JCHOMADFwc9YrKlFhWN/T8nVLW7ZkEBp6CqFwMH2QRMiiLhAZMFkZNbKEsrpNg==
X-Gm-Gg: ASbGncuao7HGlF4Qa3XsxbGPsyBvDRKawS8L5z7iCaTURDnGWVNf79YQxkDGS9d07xS
	XeUxJv2uAsZ+r/d9jqQMCziRc86EwIOPzf26E6NAxnwGupjYGz2U2FcKTjCaVvDw4x3mvfOFXh0
	SQLx5vDTydr3+H3Rwoqe/qCxLLtO8N7eAZ3NFfSMwJHc0+i4VGOyR1F3RtARB9Y7Y0VcUjRHn+5
	cNWcWvjJJv+lFikjobhYd8/oEUob5t/CPa/ce3LMrA2EkCyuqtx9qBWhvAIhpA/WPIIudsxjhYy
	hCM6ZC+OzYvSl1Je2XSfHd1fVgc0BNXeHyRncNtxgUKKcPjWK2eZ6EIoY26lvpMNWqaY3MLNApA
	eQshwr3ypTCvk7jq02ajNPOEkF5sZsRTB2QJfXQMTdo8rdPlCJqln2gYI/DENW1MhfCk=
X-Google-Smtp-Source: AGHT+IH8tgHqjKRy9ou+a/j6Sb5A7FZAPXUwRxtrBIzlXSCp55Ks+Gv58Suvi0Zmu2sioQAf9PPhBQ==
X-Received: by 2002:a17:907:3dab:b0:adf:7740:9284 with SMTP id a640c23a62f3a-afa1e13bccemr83193966b.57.1754945340811;
        Mon, 11 Aug 2025 13:49:00 -0700 (PDT)
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
Subject: [PATCH v5 08/12] xen/arm: Implement PSCI SYSTEM_SUSPEND call (host interface)
Date: Mon, 11 Aug 2025 23:48:04 +0300
Message-ID: <c5d6e20ff49fd9367c46e63b96e8a9aa687ffbd3.1754943875.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1754943874.git.mykola_kvach@epam.com>
References: <cover.1754943874.git.mykola_kvach@epam.com>
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
Changes in v4:
  - select the appropriate PSCI SYSTEM_SUSPEND function ID based on platform
  - update comments and commit message to reflect recent changes

Changes in v3:
  - return PSCI_NOT_SUPPORTED instead of a hardcoded 1 on ARM32
  - check PSCI version before invoking SYSTEM_SUSPEND in call_psci_system_suspend
---
 xen/arch/arm/arm64/head.S          |  8 ++++++++
 xen/arch/arm/include/asm/psci.h    |  1 +
 xen/arch/arm/include/asm/suspend.h |  2 ++
 xen/arch/arm/psci.c                | 23 ++++++++++++++++++++++-
 xen/arch/arm/suspend.c             |  5 +++++
 5 files changed, 38 insertions(+), 1 deletion(-)

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
index 78d0e2383b..55041a5d06 100644
--- a/xen/arch/arm/include/asm/suspend.h
+++ b/xen/arch/arm/include/asm/suspend.h
@@ -7,6 +7,8 @@
 
 int host_system_suspend(void);
 
+void hyp_resume(void);
+
 #endif /* CONFIG_SYSTEM_SUSPEND */
 
 #endif /* __ASM_ARM_SUSPEND_H__ */
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
diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
index abf4b928ce..11e86b7f51 100644
--- a/xen/arch/arm/suspend.c
+++ b/xen/arch/arm/suspend.c
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <asm/psci.h>
 #include <xen/console.h>
 #include <xen/cpu.h>
 #include <xen/llc-coloring.h>
@@ -70,6 +71,10 @@ static long system_suspend(void *data)
      */
     update_boot_mapping(true);
 
+    status = call_psci_system_suspend();
+    if ( status )
+        dprintk(XENLOG_WARNING, "PSCI system suspend failed, err=%d\n", status);
+
     system_state = SYS_STATE_resume;
     update_boot_mapping(false);
 
-- 
2.48.1


