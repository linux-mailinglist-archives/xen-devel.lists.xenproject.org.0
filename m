Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B84222A8687
	for <lists+xen-devel@lfdr.de>; Thu,  5 Nov 2020 19:57:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20050.45648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kakRX-0006hb-VQ; Thu, 05 Nov 2020 18:57:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20050.45648; Thu, 05 Nov 2020 18:57:07 +0000
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
	id 1kakRX-0006h7-S1; Thu, 05 Nov 2020 18:57:07 +0000
Received: by outflank-mailman (input) for mailman id 20050;
 Thu, 05 Nov 2020 18:57:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1kakRW-0006gr-PL
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 18:57:06 +0000
Received: from mail-wr1-x429.google.com (unknown [2a00:1450:4864:20::429])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3df7f1a5-ac49-40de-ac32-b14f6008216d;
 Thu, 05 Nov 2020 18:57:05 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id w1so3009385wrm.4
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2020 10:57:05 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com.
 [5.71.162.151])
 by smtp.gmail.com with ESMTPSA id n14sm3451536wrt.8.2020.11.05.10.57.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 05 Nov 2020 10:57:03 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	id 1kakRW-0006gr-PL
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 18:57:06 +0000
X-Inumbo-ID: 3df7f1a5-ac49-40de-ac32-b14f6008216d
Received: from mail-wr1-x429.google.com (unknown [2a00:1450:4864:20::429])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3df7f1a5-ac49-40de-ac32-b14f6008216d;
	Thu, 05 Nov 2020 18:57:05 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id w1so3009385wrm.4
        for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2020 10:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JXV2grd6INUy3gkR3e7DtGC7TFJVb0kBB00hdfAKmbI=;
        b=JQMuCwVvrfUlQSiYlywTVwmSgq7MvlOrDxhoITNqLZ0yUQu7Uk+BoyIxaXj6j56MJA
         WXmv04DJuD9lMEalI2Bv4LQUKFmdIGENeZ0AdGbRSS6bmQ4qaoCjZNkOdHyM351lGzSC
         1pOBENorcNwxeBsZO6L/xceFIwgu8k3psV+yn1ipXOJzTrj9ZuGYT96SY9tX2z3SEp5d
         EZRtBqRjSoHA54NUV6URJmI/3SQR2kWouCeeP1M5ZA0HF5ZeGXrK4+PvPeKnn9GNS819
         5GnhlM/jBhJ6xuWqN7FwJmAbOmvHVY46cQZN8e4ymXQ0Hd9lnrkzWcpgtCnUQBlmETiL
         Apng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JXV2grd6INUy3gkR3e7DtGC7TFJVb0kBB00hdfAKmbI=;
        b=iRXBej+Mosg57Hwvp1Vv/di1f9VVJu6c4PG86GFILjd9DPGYK5wTEgQ6XW+MpV/rxi
         nNPJxosV7LapdWTL12/S3jujQas/AEtf5It7Obj1LTSdZ98VKQ5BQVdng/wTUgmnFS9c
         UVkptaQLC4oj+/JfaCOZFUEyyi2efuYqBCA1s834NhHJ2DAmFfQgkz25G2u5xIm8vin7
         5S+nJV3CwqWOL47LEaTdp0Eu0gjbfbdcGMoOQQ9SIoPJ73FkjbdYOgSoV4CCrmdDZCjR
         LQaNUEHD/7NVAwTyLJKTsoPW8dyVSGFKFPgm7on9ISoT5vi/LH6x/RwZPfmZ1xvUZfAB
         b+dQ==
X-Gm-Message-State: AOAM531Cb4GImtruvNIAoz20C9LQ8Wc+FmDQKKL6jPkeG81/Rgii03cY
	uDaTXXgVTwpbHtYjEK+abPT0UwgFlx0=
X-Google-Smtp-Source: ABdhPJyCljWIKg/99jagCmcOIk9a+ZtYzbTERdVozWW3gWffCC+jUgvSlr1Z2bFuN9Tx+wIr+rHbgQ==
X-Received: by 2002:adf:ed4c:: with SMTP id u12mr4564286wro.63.1604602624600;
        Thu, 05 Nov 2020 10:57:04 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com. [5.71.162.151])
        by smtp.gmail.com with ESMTPSA id n14sm3451536wrt.8.2020.11.05.10.57.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Nov 2020 10:57:03 -0800 (PST)
From: Ash Wilding <ash.j.wilding@gmail.com>
X-Google-Original-From: Ash Wilding
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Ash Wilding <ash.j.wilding@gmail.com>
Subject: [RFC PATCH 1/6] xen/arm: Support detection of CPU features in other ID registers
Date: Thu,  5 Nov 2020 18:55:58 +0000
Message-Id: <20201105185603.24149-2-ash.j.wilding@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201105185603.24149-1-ash.j.wilding@gmail.com>
References: <20201105185603.24149-1-ash.j.wilding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current Arm boot_cpu_feature64() and boot_cpu_feature32() macros
are hardcoded to only detect features in ID_AA64PFR{0,1}_EL1 and
ID_PFR{0,1} respectively.

This patch replaces these macros with a new macro, boot_cpu_feature(),
which takes an explicit ID register name as an argument.

While we're here, cull cpu_feature64() and cpu_feature32() as they
have no callers (we only ever use the boot CPU features), and update
the printk() messages in setup.c to use the new macro.

Signed-off-by: Ash Wilding <ash.j.wilding@gmail.com>
---
 xen/arch/arm/setup.c             |  8 +++---
 xen/include/asm-arm/cpufeature.h | 44 +++++++++++++++-----------------
 2 files changed, 24 insertions(+), 28 deletions(-)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 7fcff9af2a..5121f06fc5 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -134,16 +134,16 @@ static void __init processor_id(void)
            cpu_has_gicv3 ? " GICv3-SysReg" : "");
 
     /* Warn user if we find unknown floating-point features */
-    if ( cpu_has_fp && (boot_cpu_feature64(fp) >= 2) )
+    if ( cpu_has_fp && (boot_cpu_feature(pfr64, fp) >= 2) )
         printk(XENLOG_WARNING "WARNING: Unknown Floating-point ID:%d, "
                "this may result in corruption on the platform\n",
-               boot_cpu_feature64(fp));
+               boot_cpu_feature(pfr64, fp));
 
     /* Warn user if we find unknown AdvancedSIMD features */
-    if ( cpu_has_simd && (boot_cpu_feature64(simd) >= 2) )
+    if ( cpu_has_simd && (boot_cpu_feature(pfr64, simd) >= 2) )
         printk(XENLOG_WARNING "WARNING: Unknown AdvancedSIMD ID:%d, "
                "this may result in corruption on the platform\n",
-               boot_cpu_feature64(simd));
+               boot_cpu_feature(pfr64, simd));
 
     printk("  Debug Features: %016"PRIx64" %016"PRIx64"\n",
            boot_cpu_data.dbg64.bits[0], boot_cpu_data.dbg64.bits[1]);
diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
index 10878ead8a..f9281ea343 100644
--- a/xen/include/asm-arm/cpufeature.h
+++ b/xen/include/asm-arm/cpufeature.h
@@ -1,39 +1,35 @@
 #ifndef __ASM_ARM_CPUFEATURE_H
 #define __ASM_ARM_CPUFEATURE_H
 
+#define boot_cpu_feature(idreg, feat) (boot_cpu_data.idreg.feat)
+
 #ifdef CONFIG_ARM_64
-#define cpu_feature64(c, feat)         ((c)->pfr64.feat)
-#define boot_cpu_feature64(feat)       (boot_cpu_data.pfr64.feat)
-
-#define cpu_has_el0_32    (boot_cpu_feature64(el0) == 2)
-#define cpu_has_el0_64    (boot_cpu_feature64(el0) >= 1)
-#define cpu_has_el1_32    (boot_cpu_feature64(el1) == 2)
-#define cpu_has_el1_64    (boot_cpu_feature64(el1) >= 1)
-#define cpu_has_el2_32    (boot_cpu_feature64(el2) == 2)
-#define cpu_has_el2_64    (boot_cpu_feature64(el2) >= 1)
-#define cpu_has_el3_32    (boot_cpu_feature64(el3) == 2)
-#define cpu_has_el3_64    (boot_cpu_feature64(el3) >= 1)
-#define cpu_has_fp        (boot_cpu_feature64(fp) < 8)
-#define cpu_has_simd      (boot_cpu_feature64(simd) < 8)
-#define cpu_has_gicv3     (boot_cpu_feature64(gic) == 1)
+#define cpu_has_el0_32          (boot_cpu_feature(pfr64, el0) == 2)
+#define cpu_has_el0_64          (boot_cpu_feature(pfr64, el0) >= 1)
+#define cpu_has_el1_32          (boot_cpu_feature(pfr64, el1) == 2)
+#define cpu_has_el1_64          (boot_cpu_feature(pfr64, el1) >= 1)
+#define cpu_has_el2_32          (boot_cpu_feature(pfr64, el2) == 2)
+#define cpu_has_el2_64          (boot_cpu_feature(pfr64, el2) >= 1)
+#define cpu_has_el3_32          (boot_cpu_feature(pfr64, el3) == 2)
+#define cpu_has_el3_64          (boot_cpu_feature(pfr64, el3) >= 1)
+#define cpu_has_fp              (boot_cpu_feature(pfr64, fp) < 8)
+#define cpu_has_simd            (boot_cpu_feature(pfr64, simd) < 8)
+#define cpu_has_gicv3           (boot_cpu_feature(pfr64, gic) == 1)
 #endif
 
-#define cpu_feature32(c, feat)         ((c)->pfr32.feat)
-#define boot_cpu_feature32(feat)       (boot_cpu_data.pfr32.feat)
-
-#define cpu_has_arm       (boot_cpu_feature32(arm) == 1)
-#define cpu_has_thumb     (boot_cpu_feature32(thumb) >= 1)
-#define cpu_has_thumb2    (boot_cpu_feature32(thumb) >= 3)
-#define cpu_has_jazelle   (boot_cpu_feature32(jazelle) > 0)
-#define cpu_has_thumbee   (boot_cpu_feature32(thumbee) == 1)
+#define cpu_has_arm       (boot_cpu_feature(pfr32, arm) == 1)
+#define cpu_has_thumb     (boot_cpu_feature(pfr32, thumb) >= 1)
+#define cpu_has_thumb2    (boot_cpu_feature(pfr32, thumb) >= 3)
+#define cpu_has_jazelle   (boot_cpu_feature(pfr32, jazelle) > 0)
+#define cpu_has_thumbee   (boot_cpu_feature(pfr32, thumbee) == 1)
 #define cpu_has_aarch32   (cpu_has_arm || cpu_has_thumb)
 
 #ifdef CONFIG_ARM_32
-#define cpu_has_gentimer  (boot_cpu_feature32(gentimer) == 1)
+#define cpu_has_gentimer  (boot_cpu_feature(pfr32, gentimer) == 1)
 #else
 #define cpu_has_gentimer  (1)
 #endif
-#define cpu_has_security  (boot_cpu_feature32(security) > 0)
+#define cpu_has_security  (boot_cpu_feature(pfr32, security) > 0)
 
 #define ARM64_WORKAROUND_CLEAN_CACHE    0
 #define ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE    1
-- 
2.24.3 (Apple Git-128)


