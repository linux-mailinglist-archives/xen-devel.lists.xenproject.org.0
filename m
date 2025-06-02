Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08556ACAB22
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 11:05:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1002950.1382436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM16Q-0001az-Ct; Mon, 02 Jun 2025 09:05:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1002950.1382436; Mon, 02 Jun 2025 09:05:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM16Q-0001WP-6N; Mon, 02 Jun 2025 09:05:06 +0000
Received: by outflank-mailman (input) for mailman id 1002950;
 Mon, 02 Jun 2025 09:05:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qKV=YR=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uM16O-0007kh-GL
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 09:05:04 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab32a00e-3f90-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 11:05:02 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-55320ddb9edso4626327e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 02:05:02 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5533791cdc3sm1507541e87.176.2025.06.02.02.05.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 02:05:01 -0700 (PDT)
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
X-Inumbo-ID: ab32a00e-3f90-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748855102; x=1749459902; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xVrfy+vq7RG5yhPUKzBrjh3pK5+yQTsG+Zt3de4iBS0=;
        b=YPAX9AgwzlBcLOXw9GYbEM9R9RjEDqkbAGnvs2wEJsBONx8PgDU3ViCPGR8HbkOa2U
         3y2FndoZZ1sGJFzVnjSZStGamjjqz27jdjU9KIdPhWHdLRsllnRk0+GPjH3B/JGSDhWR
         HdIwT4MBiYYQ4/Sz0o4jKZ/fNCxK/+W1dz/p8p8WhI1z5hsKNDo5mwQDRPbjLGu8QMoz
         tr48Lv+/nqBiEM8MZnmSeYcPYH8qXuk6BUvQCXWM2J0AbRuaYGoTEEOoNR1iqjH8JNGC
         m4jYqBwObqZskDiLxdpWrMHTF3GxY419s+HMe00H/ab+n7Ut/tL7UQDy7sugt2x+czaS
         whbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748855102; x=1749459902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xVrfy+vq7RG5yhPUKzBrjh3pK5+yQTsG+Zt3de4iBS0=;
        b=w3VycqwDzvAvf+iUF0x2yZ6/aqvjen8/5bYpeZyAz3s3eD1CXKvp/YLlXdcc1loAVw
         qmcUImH67JEZmvpUpeG+SzH8Pt+CZAc/LTxqCl64tCKKnKKRPPs7ehnaMMssnOmdjY42
         eCaKIiM34IP3khWjlwUU7NudxD4Vj4xrohpsRr+vBN1Hgte6iAAkneJxWQo55HOqKADG
         Z0+R00v0ng/mGePlH7DQINB2ZjXKzkVV+FQI13IPzf6IePsWIy3OnwBGR6IQ5NoTWDgl
         Q1lzJgee25gkNS6XJIv8YANr8aeYhda4Wwe6aKoS/05H4mzgPgXzgx6HvcjszJ29l3lR
         vjZg==
X-Gm-Message-State: AOJu0YxAmmo1mwrk/2D1zt+us3yBiuFzCq5L35kX/NPonMmv8nKAsxqg
	Qn1jcAJ+mG2qDWAe5fmWqmfEofIKwhc+A5p5BabC0wszyo1hMXBRYy6CNDuUKVgK
X-Gm-Gg: ASbGncu1cAs7iHtMGfcCKag1hxdsnwuvvEulGDoqRdrlQTHJug8iV6dnSwo1XowWEuM
	OKz4i11eLTmTCA9JlaTFouXhSFUIEL2S1gBz7lphWVzu0/BafGXoxcrJ3GuycpeV5YeP3SoeLE3
	hyTeV28JYhXRt4deXu1IEyHzcHNSanyUFQy/qxfjYD9pBQ7HI9Tvn53A+kSca3jPhvqrBjIY6nk
	jVjfD7KgGyt+KEYSeNQpNZ0vJk4ryZYnrppWfmoiqtdzBVr0aiLvMftNSjOTGuLQKThN5/taWVv
	eLa7s3NaqgpvAGWYL7AyL1KNkU64viXOSJMecWE/41xgIhAGlzWg6HBxfFtFG3zN97fPYfp7ckt
	fQvDK43vpz7u4Ntg=
X-Google-Smtp-Source: AGHT+IEzvXRcRJQ8PQGVzDpd6OcQsKQvl49VrWAqrNtL/IwwXOCr/Woxdx0f+/LYoggsghv0r2tfcg==
X-Received: by 2002:a05:6512:1284:b0:553:2f49:ff2a with SMTP id 2adb3069b0e04-5533b92e3c3mr3620581e87.38.1748855101772;
        Mon, 02 Jun 2025 02:05:01 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: xakep.amatop@gmail.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4][PART 2 08/10] xen/arm: Implement PSCI SYSTEM_SUSPEND call (host interface)
Date: Mon,  2 Jun 2025 12:04:19 +0300
Message-ID: <482f5988adbfe209ef01ebffd48f37e2b210556e.1748848482.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1748848482.git.mykola_kvach@epam.com>
References: <cover.1748848482.git.mykola_kvach@epam.com>
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
  - select the appropriate PSCI SYSTEM_SUSPEND function ID based on arch
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
index 13e59015c0..e3a9b68622 100644
--- a/xen/arch/arm/suspend.c
+++ b/xen/arch/arm/suspend.c
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <asm/psci.h>
 #include <xen/console.h>
 #include <xen/cpu.h>
 #include <xen/sched.h>
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


