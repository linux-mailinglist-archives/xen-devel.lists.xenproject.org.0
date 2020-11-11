Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 016BE2AFAD8
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 22:53:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25292.52949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcy2o-00066p-U4; Wed, 11 Nov 2020 21:52:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25292.52949; Wed, 11 Nov 2020 21:52:46 +0000
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
	id 1kcy2o-00066K-Pz; Wed, 11 Nov 2020 21:52:46 +0000
Received: by outflank-mailman (input) for mailman id 25292;
 Wed, 11 Nov 2020 21:52:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1kcy2m-00064v-Oj
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 21:52:44 +0000
Received: from mail-wm1-x330.google.com (unknown [2a00:1450:4864:20::330])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a17d2cbb-8852-4648-a661-1c53bca5fd55;
 Wed, 11 Nov 2020 21:52:39 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id c9so3559012wml.5
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 13:52:39 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com.
 [5.71.162.151])
 by smtp.gmail.com with ESMTPSA id u23sm4096078wmc.32.2020.11.11.13.52.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Nov 2020 13:52:37 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	id 1kcy2m-00064v-Oj
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 21:52:44 +0000
X-Inumbo-ID: a17d2cbb-8852-4648-a661-1c53bca5fd55
Received: from mail-wm1-x330.google.com (unknown [2a00:1450:4864:20::330])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a17d2cbb-8852-4648-a661-1c53bca5fd55;
	Wed, 11 Nov 2020 21:52:39 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id c9so3559012wml.5
        for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 13:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u7aluI1nuZMrv7pbrDJ9eHy15M26syg8r4F17Forexw=;
        b=AaXUZNDndVWbWZNl/rKaq8I01YExK21+vqGN9RXrjEsbsDX58L0Ql0iQ0dJPdqvMl5
         IeljEHP5YJFKhWPrgIU1Me2d5/adn2sNpj6cHk9NJ+coqLF+s1+ggGoYGgMLzjtrzDZd
         elBF2488JIz4wIzzfkQn9dUUlkj/2RH+LG2TTep0KDMy18KJ7mRrZ4ArNVu9+0m7Vl4O
         KfWi2nIKFgGBvAtBSHRZhBl+jTnPeXuWk1qN+HTlrqiEpXanJZhAen1SBlLL5Z7bFOER
         pSr/p1Mh/vMihla1PSLl7eLrDfOOYLR3Wz/vV2SoOfEKnMIBkqcieN+3bokSU2kycoDa
         TODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u7aluI1nuZMrv7pbrDJ9eHy15M26syg8r4F17Forexw=;
        b=NLz8bj7YjkTPWQpJPg+Dpzx52ohyZy0A9/ckc+vSIN3IIvDVDin9qglbKANet1mEle
         Z2k+juyT691bVeKBrY5Gn755h0bnyZD5Gq0t8tZ/LDW+BRLWfhFm7Mz/G461WhHJ/ogB
         3FQhp0SRWWFXmLt2MG11BpTlqvMWK8lNBtXGsOqOZ5zzT/9GhxLWzlco6JyFozGlqe4d
         JmY2rzxXSCRS9pj0au4B0pzdfsyNyxFbHNoMhU8UeU2b4mY1xoNymDyFXi7aSVZOj+A2
         DJuWaCnN01ZOkodmrmvvxctZWhtI3W97S+8O+wwJWB7G5q97O5nrJwNqpoJT7Vx5QvFv
         r6xQ==
X-Gm-Message-State: AOAM5311oYe7Bw8um+OgnvRxipZ+rH2DCT+pVQvmaDdRC+OpVdFfRw7p
	6aMwD6/VG7Qq5reUcadBmxkUKk2hBKA=
X-Google-Smtp-Source: ABdhPJxqxeloMs0OpqsobCRlKw8L4J9/KoX+2kcXY1LPtgscBNYgLhXT7DvlMqN+lXX38yWPulhAMA==
X-Received: by 2002:a1c:5585:: with SMTP id j127mr6489117wmb.90.1605131558299;
        Wed, 11 Nov 2020 13:52:38 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com. [5.71.162.151])
        by smtp.gmail.com with ESMTPSA id u23sm4096078wmc.32.2020.11.11.13.52.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2020 13:52:37 -0800 (PST)
From: Ash Wilding <ash.j.wilding@gmail.com>
X-Google-Original-From: Ash Wilding
To: xen-devel@lists.xenproject.org
Cc: Ash Wilding <ash.j.wilding@gmail.com>,
	julien@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com
Subject: [RFC PATCH v2 01/15] xen/arm: Support detection of CPU features in other ID registers
Date: Wed, 11 Nov 2020 21:51:49 +0000
Message-Id: <20201111215203.80336-2-ash.j.wilding@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201111215203.80336-1-ash.j.wilding@gmail.com>
References: <20201111215203.80336-1-ash.j.wilding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ash Wilding <ash.j.wilding@gmail.com>

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


