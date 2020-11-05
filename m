Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4E22A868A
	for <lists+xen-devel@lfdr.de>; Thu,  5 Nov 2020 19:57:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20053.45673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kakRd-0006oV-Kg; Thu, 05 Nov 2020 18:57:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20053.45673; Thu, 05 Nov 2020 18:57:13 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kakRd-0006nl-EQ; Thu, 05 Nov 2020 18:57:13 +0000
Received: by outflank-mailman (input) for mailman id 20053;
 Thu, 05 Nov 2020 18:57:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1kakRb-0006gr-O1
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 18:57:11 +0000
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f58eff1-99bd-4287-a10e-6e50cea65f9f;
 Thu, 05 Nov 2020 18:57:07 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id 33so2992898wrl.7
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2020 10:57:07 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com.
 [5.71.162.151])
 by smtp.gmail.com with ESMTPSA id n14sm3451536wrt.8.2020.11.05.10.57.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 05 Nov 2020 10:57:06 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	id 1kakRb-0006gr-O1
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 18:57:11 +0000
X-Inumbo-ID: 9f58eff1-99bd-4287-a10e-6e50cea65f9f
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9f58eff1-99bd-4287-a10e-6e50cea65f9f;
	Thu, 05 Nov 2020 18:57:07 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id 33so2992898wrl.7
        for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2020 10:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c0zMNTYfmc28SWK0VrVhI6pcULa51GufXevQj+g5qp8=;
        b=Lm6c8SGbxdYDpNzRTRwm/sWoLyrOkZnr2F9fvPCjnOOgtDeXdXv1HT0Jvb0dxwBJuK
         FED+Jq9PlHfWxAG3CpMFvwil5wK9S7T1qXTZA8q5DYx6uCL8aHJ+3EfS0nqaovekyX/u
         jbN7fRn2sEhfIAT2Y9uFgUbNIeenFCc6tS7HYnK/JgEFxrdJNapdJjT5nR2TeQzleE0C
         6X4tzQ3i/HR19NjsouoJppPYeT1mq2KoGXZ/LLLVvO+wVDghQXeRs8DtFUx6wUN/QjYF
         CpEVcuPrRp05kVldRCbKd9o7zW4zI1J7r5bgnwHXvVstwyVbPMWNuv1AVDEV3NOp6l1P
         JzqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c0zMNTYfmc28SWK0VrVhI6pcULa51GufXevQj+g5qp8=;
        b=PBeDbSSdFlmgXiO2I7wJD+kLKMZJCs7iryllgUdRhQEn7IfCrlAanaySPE6pWs88M1
         JWceC31AeUUmzWcdW2YdGld94Bp9GgPou7vl7NqdnhKSQYOF7sfj9ou7EwkrpMIJlnWN
         h2+o7DJdgV8Nbv5aV9VZgoJLO1WRPrW1adgGt8F/RVESqzc61bpu+tUiLL8/Zx4CL3f6
         5bJzKsCJQHW/qccmksk6pSS4IyJnRyTxwo0tcNP7GsWSGNgqnWGMn9LqkRyPGXW7N+dv
         b9ute9Rbw+DM6HyxBw25HzB9+wJfLTGDrtrQ/z1Evq0VsWG1V0FAIy76h271pAEiYCAY
         BIXQ==
X-Gm-Message-State: AOAM533HS88wnfwaWVf5qUpHVLcOOTEi864rrQgPe2gvubVHDfq5FRFf
	rBP8ZL1lF1X3kXvwUgdUvCtROPjpt9s=
X-Google-Smtp-Source: ABdhPJxD3UGgnbHrtL2aQwE7zcXO2D+ilM1nPJwwd/BSpSb7pACKUt2+fZo+z3sKTTEBtTttsyQjzw==
X-Received: by 2002:a5d:6944:: with SMTP id r4mr4667895wrw.151.1604602626876;
        Thu, 05 Nov 2020 10:57:06 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com. [5.71.162.151])
        by smtp.gmail.com with ESMTPSA id n14sm3451536wrt.8.2020.11.05.10.57.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Nov 2020 10:57:06 -0800 (PST)
From: Ash Wilding <ash.j.wilding@gmail.com>
X-Google-Original-From: Ash Wilding
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Ash Wilding <ash.j.wilding@gmail.com>
Subject: [RFC PATCH 3/6] xen/arm: Add ARM64_HAS_LSE_ATOMICS hwcap
Date: Thu,  5 Nov 2020 18:56:00 +0000
Message-Id: <20201105185603.24149-4-ash.j.wilding@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201105185603.24149-1-ash.j.wilding@gmail.com>
References: <20201105185603.24149-1-ash.j.wilding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch introduces the ARM64_HAS_LSE_ATOMICS hwcap.

While doing this, CONFIG_ARM64_LSE_ATOMICS is added to control whether
the hwcap is actually detected and set at runtime. Without this Kconfig
being set we will always fallback on LL/SC atomics using Armv8.0 exlusive
accesses.

Note this patch does not actually add the ALTERNATIVE() switching based
on the hwcap being detected and set; that comes later in the series.

Signed-off-by: Ash Wilding <ash.j.wilding@gmail.com>
---
 xen/arch/arm/Kconfig             | 11 +++++++++++
 xen/arch/arm/Makefile            |  1 +
 xen/arch/arm/lse.c               | 13 +++++++++++++
 xen/include/asm-arm/cpufeature.h |  3 ++-
 4 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/lse.c

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 2777388265..febc41e492 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -78,6 +78,17 @@ config SBSA_VUART_CONSOLE
 	  Allows a guest to use SBSA Generic UART as a console. The
 	  SBSA Generic UART implements a subset of ARM PL011 UART.
 
+config ARM64_LSE_ATOMICS
+	bool "Armv8.1-LSE Atomics"
+	depends on ARM_64 && HAS_ALTERNATIVE
+	default y
+	---help---
+	When set, dynamically patch Xen at runtime to use Armv8.1-LSE
+	atomics when supported by the system.
+
+	When unset, or when Armv8.1-LSE atomics are not supported by the
+	system, fallback on LL/SC atomics using Armv8.0 exclusive accesses.
+
 config ARM_SSBD
 	bool "Speculative Store Bypass Disable" if EXPERT
 	depends on HAS_ALTERNATIVE
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 296c5e68bb..cadd0ad253 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -63,6 +63,7 @@ obj-y += vsmc.o
 obj-y += vpsci.o
 obj-y += vuart.o
 extra-y += $(TARGET_SUBARCH)/head.o
+obj-$(CONFIG_ARM64_LSE_ATOMICS) += lse.o
 
 #obj-bin-y += ....o
 
diff --git a/xen/arch/arm/lse.c b/xen/arch/arm/lse.c
new file mode 100644
index 0000000000..8274dac671
--- /dev/null
+++ b/xen/arch/arm/lse.c
@@ -0,0 +1,13 @@
+
+#include <asm/cpufeature.h>
+#include <xen/init.h>
+
+static int __init update_lse_caps(void)
+{
+    if ( cpu_has_lse_atomics )
+        cpus_set_cap(ARM64_HAS_LSE_ATOMICS);
+
+    return 0;
+}
+
+__initcall(update_lse_caps);
diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
index 2366926e82..48c172ee29 100644
--- a/xen/include/asm-arm/cpufeature.h
+++ b/xen/include/asm-arm/cpufeature.h
@@ -42,8 +42,9 @@
 #define ARM_SSBD 7
 #define ARM_SMCCC_1_1 8
 #define ARM64_WORKAROUND_AT_SPECULATE 9
+#define ARM64_HAS_LSE_ATOMICS 10
 
-#define ARM_NCAPS           10
+#define ARM_NCAPS           11
 
 #ifndef __ASSEMBLY__
 
-- 
2.24.3 (Apple Git-128)


