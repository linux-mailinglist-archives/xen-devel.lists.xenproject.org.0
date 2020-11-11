Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C37412AFAD6
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 22:53:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25293.52960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcy2u-00069z-6w; Wed, 11 Nov 2020 21:52:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25293.52960; Wed, 11 Nov 2020 21:52:52 +0000
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
	id 1kcy2u-00069U-39; Wed, 11 Nov 2020 21:52:52 +0000
Received: by outflank-mailman (input) for mailman id 25293;
 Wed, 11 Nov 2020 21:52:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1kcy2r-00064v-Ok
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 21:52:49 +0000
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2483e5c9-4c86-4ff1-9b5f-9efaf2ce6fcd;
 Wed, 11 Nov 2020 21:52:40 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id k2so3998943wrx.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 13:52:40 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com.
 [5.71.162.151])
 by smtp.gmail.com with ESMTPSA id u23sm4096078wmc.32.2020.11.11.13.52.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Nov 2020 13:52:38 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	id 1kcy2r-00064v-Ok
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 21:52:49 +0000
X-Inumbo-ID: 2483e5c9-4c86-4ff1-9b5f-9efaf2ce6fcd
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 2483e5c9-4c86-4ff1-9b5f-9efaf2ce6fcd;
	Wed, 11 Nov 2020 21:52:40 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id k2so3998943wrx.2
        for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 13:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CODXTx/qAJFmAOdmnrKmfVlPhSYEzSAm6huhIA2Mo1I=;
        b=oQNVr3As2iNhoTTgUw08EzCuvEeUJGdh+BijVSabFb5qFpbq5mcVhXfZK8uabpWOud
         gQpUHRAaRFa620hoH7jmrUdB1CSM3GcXaHjhv7grkduuprEhqRzK1EidJxWkjM9td51q
         v2xaE6eozqeLg0M+qdJE3hm6fl6YCeQpO8KRtd+WTHFur/s6IaEJk8p7AoOXX40b/WNI
         s8auOJusZejoyZdyPLc58iepBaX2ulQds/oeP/hqXdOXklyllHvoUvwG5l68mmTnkFX6
         EHppP93AqRDWliZnx89JN0lYN7oEHseaVL4zwNHrVwZ9Sb8tKznlrHRmlMmyqRNS92hd
         nlug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CODXTx/qAJFmAOdmnrKmfVlPhSYEzSAm6huhIA2Mo1I=;
        b=r/VhnlazKEFtz3S66anfAgLolYgH9ry7G4kv3uNarUL95XTUqwI3QWE/jAnXr/2N1c
         Lh8Clax9FeNpeRVqI8HBYau6O9dN9wBrQArz/tymcUysoIgFLe+r35VOECQvzRlonQwH
         i0i36B38erK+iaAGMIzgbczEeMbAsyjGlOM6tmBEu2XyPDbNDQfVI8Viju37kCbl9vr8
         jRg42m7HzDkrtB7DaSEFmax4zLikJqiDBpGDxdX/bT7+StwmjN7Yqgc124JxJnHzM5+T
         pkkdN5k+sBiyd2oEieYKtmqtlhzRkSlNuxnLkggAibSIs26UxeiZHIIqUtqi0sQP0O4A
         gz3w==
X-Gm-Message-State: AOAM531+pEkYZxZQxVFdNzCAvEk/VnF78WQz3JxYhcAXk1IOFCxKzBsP
	6JtEwRYLLP4u5JGaV439k4p/yPq6oyY=
X-Google-Smtp-Source: ABdhPJzBDSOrdcdgHWz1ZLiR2a2Q81rePOml0YZw0Qnuq0gjXwXFCubF2rtCDjJm1Bwj3aDpBXXauA==
X-Received: by 2002:adf:f607:: with SMTP id t7mr5085487wrp.169.1605131559247;
        Wed, 11 Nov 2020 13:52:39 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com. [5.71.162.151])
        by smtp.gmail.com with ESMTPSA id u23sm4096078wmc.32.2020.11.11.13.52.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2020 13:52:38 -0800 (PST)
From: Ash Wilding <ash.j.wilding@gmail.com>
X-Google-Original-From: Ash Wilding
To: xen-devel@lists.xenproject.org
Cc: Ash Wilding <ash.j.wilding@gmail.com>,
	julien@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com
Subject: [RFC PATCH v2 02/15] xen/arm: Add detection of Armv8.1-LSE atomic instructions
Date: Wed, 11 Nov 2020 21:51:50 +0000
Message-Id: <20201111215203.80336-3-ash.j.wilding@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201111215203.80336-1-ash.j.wilding@gmail.com>
References: <20201111215203.80336-1-ash.j.wilding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ash Wilding <ash.j.wilding@gmail.com>

Use the new infrastructure for detecting CPU features in other ID
registers to detect the presence of Armv8.1-LSE atomic instructions,
as reported by ID_AA64ISAR0_EL1.Atomic.

While we're here, print detection of these instructions in setup.c's
processor_id().

Signed-off-by: Ash Wilding <ash.j.wilding@gmail.com>
---
 xen/arch/arm/setup.c             |  5 +++--
 xen/include/asm-arm/cpufeature.h | 10 +++++++++-
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 5121f06fc5..138e1957c5 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -128,10 +128,11 @@ static void __init processor_id(void)
            cpu_has_el2_32 ? "64+32" : cpu_has_el2_64 ? "64" : "No",
            cpu_has_el1_32 ? "64+32" : cpu_has_el1_64 ? "64" : "No",
            cpu_has_el0_32 ? "64+32" : cpu_has_el0_64 ? "64" : "No");
-    printk("    Extensions:%s%s%s\n",
+    printk("    Extensions:%s%s%s%s\n",
            cpu_has_fp ? " FloatingPoint" : "",
            cpu_has_simd ? " AdvancedSIMD" : "",
-           cpu_has_gicv3 ? " GICv3-SysReg" : "");
+           cpu_has_gicv3 ? " GICv3-SysReg" : "",
+           cpu_has_lse_atomics ? " LSE-Atomics" : "");
 
     /* Warn user if we find unknown floating-point features */
     if ( cpu_has_fp && (boot_cpu_feature(pfr64, fp) >= 2) )
diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
index f9281ea343..2366926e82 100644
--- a/xen/include/asm-arm/cpufeature.h
+++ b/xen/include/asm-arm/cpufeature.h
@@ -15,6 +15,7 @@
 #define cpu_has_fp              (boot_cpu_feature(pfr64, fp) < 8)
 #define cpu_has_simd            (boot_cpu_feature(pfr64, simd) < 8)
 #define cpu_has_gicv3           (boot_cpu_feature(pfr64, gic) == 1)
+#define cpu_has_lse_atomics     (boot_cpu_feature(isa64, atomic) == 2)
 #endif
 
 #define cpu_has_arm       (boot_cpu_feature(pfr32, arm) == 1)
@@ -187,8 +188,15 @@ struct cpuinfo_arm {
         };
     } mm64;
 
-    struct {
+    union {
         uint64_t bits[2];
+        struct {
+            unsigned long __res0 : 20;
+            unsigned long atomic : 4;
+            unsigned long __res1 : 40;
+
+            unsigned long __res2 : 64;
+        };
     } isa64;
 
 #endif
-- 
2.24.3 (Apple Git-128)


