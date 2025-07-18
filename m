Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D1AB0A60F
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 16:20:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048844.1419061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uclwe-0006KN-1i; Fri, 18 Jul 2025 14:20:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048844.1419061; Fri, 18 Jul 2025 14:20:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uclwd-0006FZ-Oc; Fri, 18 Jul 2025 14:20:15 +0000
Received: by outflank-mailman (input) for mailman id 1048844;
 Fri, 18 Jul 2025 14:20:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=00bL=Z7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uclwc-0005sk-40
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 14:20:14 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51d8db19-63e2-11f0-a319-13f23c93f187;
 Fri, 18 Jul 2025 16:20:13 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4563cfac2d2so6110435e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jul 2025 07:20:13 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca48cb9sm2005490f8f.45.2025.07.18.07.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 07:20:12 -0700 (PDT)
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
X-Inumbo-ID: 51d8db19-63e2-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752848413; x=1753453213; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YElKLyiSf6iRZVbIUiya2Igy3WhWeDaluxJE0+b/rwI=;
        b=Bn2hkEIOYaiQrTx6fIhew/SNX0iW1uRoAMJN4ezgFO+N3SKHe/y0RD++vscXi8I6RC
         9asf/3XwGD2rmxBXbfUr48nv6dEKWSU35xdEwFgssmgDSzsDEiGyeE0JwvL2IxYHQuXz
         mAFLWD0x3o+cwlAY5PUPwSlI+GbOxspX4MAfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752848413; x=1753453213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YElKLyiSf6iRZVbIUiya2Igy3WhWeDaluxJE0+b/rwI=;
        b=v2c8E6xBYoGxduS8SmrYMGmVKRSdTHdemzFHzGQieqKG9LbwccVzjfxuE+yNgHEqkX
         Z7mtkpo6qocuaCQl5Zd/PHc92u8MxMD0dnQEJCZ5G/jRxgCnW7J/81YyHc49t7xWv3Z7
         WT9vhhRiT62EofZpQrwuXcxBaK4KmQPjBGWHV/lX5BwzBeDeXE9ZhTIqdsZ3tIHgnGRl
         HfsNsOV4eytETqh98vlP27mdHRd7/jjODz90i1AUpImBT8sBuysk/QZKT+/jg/oMT/O7
         aXOWkMjEpIf8m+ymJ6rDeuYGQ5xAPvVPg5JL3KuqYkoGBLwb5ZsPBwEpXazt/XjKex5n
         BdUQ==
X-Gm-Message-State: AOJu0YyvO34OQB46OtUu+1ZaPFbdFCNhflyRLFKGR492ssS/ogvgxrYT
	stE2EY3oTRG6CCCpJnl3wpnWbRKksNywW4ojZvy5Av31IMSBdyP4L0WVynfjFWNFO3y/tJf6kfM
	G9WrGg670ww==
X-Gm-Gg: ASbGncscuw3aJHVqO/43SppF+yaSfBdPvgWp8NxsMBlEF/rHjWi2TXgubwbkDNT0e4t
	qZHPkqHcntITUHff+7o/+VojanIWJ0CUFy0pGrN3XwvTvJ8h0jCyrOldwI92OD/nw51l1rdcPIx
	6ZQrWRjGAPuddgXjX1qdid78KzsECEShPOj+sKPDX6LXGvsFBWTUcJFPp1N5WMqzeGq1GUy0VsZ
	zQxvKKNIgke8asQsZtCURqrIGiPEVjHg2cbXkICtfHjFEgAQrSpb3j365znjoao7xJp2UXPlEZg
	TLWxr3zcDNRaGJPG9WcLBL7BbMWsSnbiofFwMKWHm1PWIYf1vftkADF4MtzeOgSaXbOR8ozVqaj
	6MxKY94p4kKs37QbUpVRvHFyG5G+7NziR5gtcOShJhFlJoyBB670aRBuZTwbzHlWtBuTRbgAC4R
	3t
X-Google-Smtp-Source: AGHT+IFsqmDtDL0W7m2uoMV6idneKeegAhMuNt11HC4G9I7LiPLy2NFX2KdvjCLKxVxBheSqypPnUA==
X-Received: by 2002:a05:600c:468b:b0:456:2419:dc05 with SMTP id 5b1f17b1804b1-4562e33db7fmr119715235e9.12.1752848412917;
        Fri, 18 Jul 2025 07:20:12 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 3/3] x86/apic: Convert the TSC deadline errata table to X86_MATCH_*()
Date: Fri, 18 Jul 2025 15:20:06 +0100
Message-Id: <20250718142006.2471129-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250718142006.2471129-1-andrew.cooper3@citrix.com>
References: <20250718142006.2471129-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With the ability to match on steppings, introduce a new X86_MATCH_VFMS()
helper to match a specific stepping, and use it to rework deadline_match[].

Currently, the table is scanned on all systems, even those without the
TSC_DEADLINE feature.  Introduce another early exit for that case, which
removes the need to encode every row in the table with TSC_DEADLINE.

Notably this removes the overloading of driver_data possibly being a function
pointer, and removes the latent bug where the target functions are missing
ENDBR instructions owing to the lack of the cf_check attribute.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Move deadline_match[] into check_deadline_errata() which produces a far
   more legible diff.
 * Check for TSC_DEADLINE early and skip the search on non-capable CPUs.

The bloat-o-meter summary shows that the use of functions really wasn't the
wisest idea:

  add/remove: 0/3 grow/shrink: 1/2 up/down: 80/-146 (-66)
  Function                                     old     new   delta
  deadline_match                               224     304     +80
  APIC_init_uniprocessor                       334     331      -3
  skx_deadline_rev                              30       -     -30
  CSWTCH                                       335     299     -36
  hsx_deadline_rev                              38       -     -38
  bdx_deadline_rev                              39       -     -39
---
 xen/arch/x86/apic.c                  | 95 +++++++---------------------
 xen/arch/x86/include/asm/match-cpu.h |  5 ++
 2 files changed, 29 insertions(+), 71 deletions(-)

diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index c4272ab4de4f..0fd8bdba7067 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -1051,88 +1051,41 @@ static void setup_APIC_timer(void)
     local_irq_restore(flags);
 }
 
-#define DEADLINE_MODEL_MATCH(m, fr) \
-    { .vendor = X86_VENDOR_INTEL, .family = 6, .model = (m), \
-      .feature = X86_FEATURE_TSC_DEADLINE, \
-      .driver_data = (void *)(unsigned long)(fr) }
-
-static unsigned int __init hsx_deadline_rev(void)
-{
-    switch ( boot_cpu_data.x86_mask )
-    {
-    case 0x02: return 0x3a; /* EP */
-    case 0x04: return 0x0f; /* EX */
-    }
-
-    return ~0U;
-}
-
-static unsigned int __init bdx_deadline_rev(void)
-{
-    switch ( boot_cpu_data.x86_mask )
-    {
-    case 0x02: return 0x00000011;
-    case 0x03: return 0x0700000e;
-    case 0x04: return 0x0f00000c;
-    case 0x05: return 0x0e000003;
-    }
-
-    return ~0U;
-}
-
-static unsigned int __init skx_deadline_rev(void)
-{
-    switch ( boot_cpu_data.x86_mask )
-    {
-    case 0x00 ... 0x02: return ~0U;
-    case 0x03: return 0x01000136;
-    case 0x04: return 0x02000014;
-    }
-
-    return 0;
-}
-
-static const struct x86_cpu_id __initconstrel deadline_match[] = {
-    DEADLINE_MODEL_MATCH(0x3c, 0x22),             /* Haswell */
-    DEADLINE_MODEL_MATCH(0x3f, hsx_deadline_rev), /* Haswell EP/EX */
-    DEADLINE_MODEL_MATCH(0x45, 0x20),             /* Haswell D */
-    DEADLINE_MODEL_MATCH(0x46, 0x17),             /* Haswell H */
-
-    DEADLINE_MODEL_MATCH(0x3d, 0x25),             /* Broadwell */
-    DEADLINE_MODEL_MATCH(0x47, 0x17),             /* Broadwell H */
-    DEADLINE_MODEL_MATCH(0x4f, 0x0b000020),       /* Broadwell EP/EX */
-    DEADLINE_MODEL_MATCH(0x56, bdx_deadline_rev), /* Broadwell D */
-
-    DEADLINE_MODEL_MATCH(0x4e, 0xb2),             /* Skylake M */
-    DEADLINE_MODEL_MATCH(0x55, skx_deadline_rev), /* Skylake X */
-    DEADLINE_MODEL_MATCH(0x5e, 0xb2),             /* Skylake D */
-
-    DEADLINE_MODEL_MATCH(0x8e, 0x52),             /* Kabylake M */
-    DEADLINE_MODEL_MATCH(0x9e, 0x52),             /* Kabylake D */
-
-    {}
-};
-
 static void __init check_deadline_errata(void)
 {
+    static const struct x86_cpu_id __initconst deadline_match[] = {
+        X86_MATCH_VFM (INTEL_HASWELL,          0x22),
+        X86_MATCH_VFMS(INTEL_HASWELL_X,   0x2, 0x3a),
+        X86_MATCH_VFMS(INTEL_HASWELL_X,   0x4, 0x0f),
+        X86_MATCH_VFM (INTEL_HASWELL_L,        0x20),
+        X86_MATCH_VFM (INTEL_HASWELL_G,        0x17),
+        X86_MATCH_VFM (INTEL_BROADWELL,        0x25),
+        X86_MATCH_VFM (INTEL_BROADWELL_G,      0x17),
+        X86_MATCH_VFM (INTEL_BROADWELL_X,      0x0b000020),
+        X86_MATCH_VFMS(INTEL_BROADWELL_D, 0x2, 0x00000011),
+        X86_MATCH_VFMS(INTEL_BROADWELL_D, 0x3, 0x0700000e),
+        X86_MATCH_VFMS(INTEL_BROADWELL_D, 0x4, 0x0f00000c),
+        X86_MATCH_VFMS(INTEL_BROADWELL_D, 0x5, 0x0e000003),
+        X86_MATCH_VFM (INTEL_SKYLAKE_L,        0xb2),
+        X86_MATCH_VFM (INTEL_SKYLAKE,          0xb2),
+        X86_MATCH_VFMS(INTEL_SKYLAKE_X,   0x3, 0x01000136),
+        X86_MATCH_VFMS(INTEL_SKYLAKE_X,   0x4, 0x02000014),
+        X86_MATCH_VFM (INTEL_KABYLAKE_L,       0x52),
+        X86_MATCH_VFM (INTEL_KABYLAKE,         0x52),
+        {}
+    };
+
     const struct x86_cpu_id *m;
     unsigned int rev;
 
-    if ( cpu_has_hypervisor )
+    if ( cpu_has_hypervisor || !boot_cpu_has(X86_FEATURE_TSC_DEADLINE) )
         return;
 
     m = x86_match_cpu(deadline_match);
     if ( !m )
         return;
 
-    /*
-     * Function pointers will have the MSB set due to address layout,
-     * immediate revisions will not.
-     */
-    if ( (long)m->driver_data < 0 )
-        rev = ((unsigned int (*)(void))(m->driver_data))();
-    else
-        rev = (unsigned long)m->driver_data;
+    rev = (unsigned long)m->driver_data;
 
     if ( this_cpu(cpu_sig).rev >= rev )
         return;
diff --git a/xen/arch/x86/include/asm/match-cpu.h b/xen/arch/x86/include/asm/match-cpu.h
index e25f414ea1b4..6d535c41c713 100644
--- a/xen/arch/x86/include/asm/match-cpu.h
+++ b/xen/arch/x86/include/asm/match-cpu.h
@@ -35,6 +35,11 @@ struct x86_cpu_id {
                   VFM_MODEL(vfm), X86_STEPPING_ANY,             \
                   X86_FEATURE_ANY, data)
 
+#define X86_MATCH_VFMS(vfm, stepping, data)                     \
+    X86_MATCH_CPU(VFM_VENDOR(vfm), VFM_FAMILY(vfm),             \
+                  VFM_MODEL(vfm), 1U << (stepping),             \
+                  X86_FEATURE_ANY, data)
+
 /*
  * x86_match_cpu() - match the CPU against an array of x86_cpu_ids[]
  *
-- 
2.39.5


