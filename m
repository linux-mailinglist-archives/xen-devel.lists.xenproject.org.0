Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1915B2AFAD9
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 22:53:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25294.52973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcy2x-0006EC-PE; Wed, 11 Nov 2020 21:52:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25294.52973; Wed, 11 Nov 2020 21:52:55 +0000
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
	id 1kcy2x-0006DO-JU; Wed, 11 Nov 2020 21:52:55 +0000
Received: by outflank-mailman (input) for mailman id 25294;
 Wed, 11 Nov 2020 21:52:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1kcy2w-00064v-Ov
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 21:52:54 +0000
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f491eefb-b04a-4d17-a8d0-0fde8a7e6418;
 Wed, 11 Nov 2020 21:52:41 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id w24so3718977wmi.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 13:52:41 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com.
 [5.71.162.151])
 by smtp.gmail.com with ESMTPSA id u23sm4096078wmc.32.2020.11.11.13.52.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Nov 2020 13:52:39 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	id 1kcy2w-00064v-Ov
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 21:52:54 +0000
X-Inumbo-ID: f491eefb-b04a-4d17-a8d0-0fde8a7e6418
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f491eefb-b04a-4d17-a8d0-0fde8a7e6418;
	Wed, 11 Nov 2020 21:52:41 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id w24so3718977wmi.0
        for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 13:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ILeuG5HDLbKOJMGFigti9pLkxVcIcfbMYnxrhvicuhs=;
        b=An+8CipOTaoiE77z9aL89YeTyY7pLgZ2kaLDHIAXOkU1pGPFomBfw0AajX8cqN2V62
         ZFsXaQMUSrZbGWHIBCSze3xG7u6Y0Dgq8Hd8oyTqG+w5t0juFbp5ch0ULIiluky58wg1
         mZqq4mr+fruNareInBW0rw3GhzIwD6JhPlpdsbEkhsbUxP9OxE5LS8Q4PX3fYiOBPlyM
         gtti3xPSoN9XJyt+w8viVVe5r6YgJ/k1aw+g8T0WKinw1Gz91Y0aXxbEVElpJLC0hJtK
         GNLy5f8jwq+2qGLIyl9olQLp/kgvP2zFoOMjdeBAFgccghfQnfcFX5jYsMplpqrBrD7N
         DRFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ILeuG5HDLbKOJMGFigti9pLkxVcIcfbMYnxrhvicuhs=;
        b=U6/alKj2phDC3EdYPbxNA7PIstQ7AOmeSEOOrM83Hfdxziomgd/Ccs04Tbx32zOiJa
         RafwvdppsKJE/xqOj8PxYWCBZPKbs41MVCgEvYz5ycqPLr91HpuZat43mHI6RLbBoz+w
         jXyLxubL7k4Dvu99NuSsV5bLkujDlnTCFD6aVjaNDUZKvZpPLejkAGkuBuOvK9UjzQWt
         91TrBetBmJ2QOmB11tXUkeVCLCwwStBZkmGOyxZbObYIiQ2khOoOn89oUbwY+K9kP5KH
         kLAU2hwjXQsDv2FBoveAE5xl1gzIB3K47xE9pDv7V6hkHG0a4HcukodjMPUZGIF0PfJG
         rmxA==
X-Gm-Message-State: AOAM533IMiVxrNjlgC/jqJdi9OaE4EihlzElDxXFduXV7UGtXpDtRbqB
	lSmPGa/MVy0+/EtAW7N1g1I5d5mhj1c=
X-Google-Smtp-Source: ABdhPJwv9av7Lz91Xd/usJaADjr8A2KccXvtsZlJPdPKY01xUJM6J8xIOnuQYFnTLXt8u5BtGyH1lQ==
X-Received: by 2002:a1c:1906:: with SMTP id 6mr6054100wmz.87.1605131560190;
        Wed, 11 Nov 2020 13:52:40 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com. [5.71.162.151])
        by smtp.gmail.com with ESMTPSA id u23sm4096078wmc.32.2020.11.11.13.52.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2020 13:52:39 -0800 (PST)
From: Ash Wilding <ash.j.wilding@gmail.com>
X-Google-Original-From: Ash Wilding
To: xen-devel@lists.xenproject.org
Cc: Ash Wilding <ash.j.wilding@gmail.com>,
	julien@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com
Subject: [RFC PATCH v2 03/15] xen/arm: Add ARM64_HAS_LSE_ATOMICS hwcap
Date: Wed, 11 Nov 2020 21:51:51 +0000
Message-Id: <20201111215203.80336-4-ash.j.wilding@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201111215203.80336-1-ash.j.wilding@gmail.com>
References: <20201111215203.80336-1-ash.j.wilding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ash Wilding <ash.j.wilding@gmail.com>

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


