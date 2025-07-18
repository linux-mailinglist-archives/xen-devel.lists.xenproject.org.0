Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5450B0A7FE
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 17:55:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048949.1419168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucnQV-0001Ho-Bm; Fri, 18 Jul 2025 15:55:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048949.1419168; Fri, 18 Jul 2025 15:55:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucnQV-0001FP-6n; Fri, 18 Jul 2025 15:55:11 +0000
Received: by outflank-mailman (input) for mailman id 1048949;
 Fri, 18 Jul 2025 15:55:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=00bL=Z7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ucnQT-0000xy-HR
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 15:55:09 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93a95bca-63ef-11f0-b894-0df219b8e170;
 Fri, 18 Jul 2025 17:55:07 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-451dbe494d6so24465685e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jul 2025 08:55:07 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca48719sm2276468f8f.47.2025.07.18.08.55.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 08:55:06 -0700 (PDT)
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
X-Inumbo-ID: 93a95bca-63ef-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752854107; x=1753458907; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B0mtlj5ypBaWNZhT7HWh4gBc4hg8/ShwdZlxtNMoOis=;
        b=siEUzMe12CYJqAtVtVB053bYePH5I9k13napE+aZtw84aEQUxi5SpFsK+E6cHFqMu2
         L99me3/xWLPlTbsQ8ulL/plprgyNnLo8u3gHKvxs3x9O3HWnuazwljbVXKRomM84TjJG
         gthSmnqPmvxRUuP+QQmWr8I2J6ncM5T4LrZBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752854107; x=1753458907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B0mtlj5ypBaWNZhT7HWh4gBc4hg8/ShwdZlxtNMoOis=;
        b=nR/EVuDCDx7CLwEwAWgf66sVKh6uNbLd/J1rDFWkOgca6drEcr7Qw552rdBeimy7m9
         f5meTWGsN3duz9xGi3JGADMBkllid8U5Nih2lpFe1ZaV+VAWHktR/d1MMGfF2m3OI1qs
         gu3Xcrh83iUE62DgleoSsLcgpFj65OvVyHKOFg0JC7PGUH4NAKbrnwoS+sJ9t4REXIkV
         VibnwEuLnOwWuiCJ1FhIFMxWDd2x0farYkSj4SI763E8YLecTkwlEm5xtSJrcAtAYbPG
         e8fqASKIjSnFU+aHQgbOXxjG5/K2DrA2Eg/y+vlo9mHpuE8BifQbSDDNx1JYy1QB7nbp
         Vgwg==
X-Gm-Message-State: AOJu0YzgyJzS+GXu+Zvio3uoR+iQT+qqyCt6ZENEjWFSwh6W0rnoUl5J
	IJ1DWGUxJZiQ1IqkFFa3UzIVay6GyTn/J6Pan9sY+uyvV8Djpb9L7GL6lueG00puzescEp21y7f
	xW1MMww0FFw==
X-Gm-Gg: ASbGncvlN5C1VOU1+9YsgBQaAGu7nWAVuBi3e2fAnefDaJIeyijBPybSUEQYhNNQs/Z
	Brt7jAQReV4EKaIx65wHVNugBeEBXadP8JNBHDydVH7bpezAC6s9GgTLg9+e+/6u73O6/mG+mNN
	TVhl9A+WJmQylgyAerAf+Tk/DYCtoZlvWoNaWwQVaqm4QGDSHMDgo/k+w29JG1kW3hHi024jgbZ
	TdjuQbz9wDfiaHzP2MaKQ0PURWYA1xrTHYznYsCHZ+UuTUrKwuUB6atzBhXazhRH0c8Vz4UBrt9
	gAqSqio/VbKOJ12Fhg9jqMgq0wbFtBXa3maNemHHCERnvR3p7Y/OI4kmKXhTx59GZxKtMY8Tbf7
	wv92HJTMQDwFyzp+6kLY1qL7/2arYRJQzu/K/zVFtW6Nxjp10NPWwhguPwphia3NJUk7LDpSnpN
	FE
X-Google-Smtp-Source: AGHT+IHPugLLWY4D06rq8V/X0Jzy/2oL1WHv/ovt6xNBgGCLB6oKqO/yapTkWIqfGAHOtDszJB2+Ug==
X-Received: by 2002:a05:600c:19cb:b0:43c:ee3f:2c3 with SMTP id 5b1f17b1804b1-4562e37a0ecmr91522005e9.7.1752854106658;
        Fri, 18 Jul 2025 08:55:06 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/4] x86/cpu-policy: Update vendor/family/model logic
Date: Fri, 18 Jul 2025 16:55:00 +0100
Message-Id: <20250718155502.2610047-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250718155502.2610047-1-andrew.cooper3@citrix.com>
References: <20250718155502.2610047-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Switch to the new fields and constants.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

This updates one related part in intel.c for ease of ordering subseuqent work.
---
 xen/arch/x86/cpu-policy.c | 19 ++++++++-----------
 xen/arch/x86/cpu/intel.c  |  3 +--
 2 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 3e628e008e92..5ee8ce1ef7bb 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -342,7 +342,7 @@ void calculate_raw_cpu_policy(void)
     x86_cpu_policy_fill_native(p);
 
     /* Nothing good will come from Xen and libx86 disagreeing on vendor. */
-    ASSERT(p->x86_vendor == boot_cpu_data.x86_vendor);
+    ASSERT(p->x86_vendor == boot_cpu_data.vendor);
 
     /*
      * Clear the truly dynamic fields.  These vary with the in-context XCR0
@@ -417,7 +417,7 @@ static void __init guest_common_default_leaves(struct cpu_policy *p)
 
 static void __init guest_common_max_feature_adjustments(uint32_t *fs)
 {
-    switch ( boot_cpu_data.x86_vendor )
+    switch ( boot_cpu_data.vendor )
     {
     case X86_VENDOR_INTEL:
         /*
@@ -460,8 +460,7 @@ static void __init guest_common_max_feature_adjustments(uint32_t *fs)
          * We hid CLWB in the host policy to stop Xen using it, but VMs which
          * have previously seen the CLWB feature can safely run on this CPU.
          */
-        if ( boot_cpu_data.x86 == 6 &&
-             boot_cpu_data.x86_model == INTEL_FAM6_SKYLAKE_X &&
+        if ( boot_cpu_data.vfm == INTEL_SKYLAKE_X &&
              raw_cpu_policy.feat.clwb )
             __set_bit(X86_FEATURE_CLWB, fs);
 
@@ -506,7 +505,7 @@ static void __init guest_common_max_feature_adjustments(uint32_t *fs)
 
 static void __init guest_common_default_feature_adjustments(uint32_t *fs)
 {
-    switch ( boot_cpu_data.x86_vendor )
+    switch ( boot_cpu_data.vendor )
     {
     case X86_VENDOR_INTEL:
         /*
@@ -520,8 +519,7 @@ static void __init guest_common_default_feature_adjustments(uint32_t *fs)
          * (cpuid="host,rdrand=1") in the VM's config file, and VMs which were
          * previously using RDRAND can migrate in.
          */
-        if ( boot_cpu_data.x86 == 6 &&
-             boot_cpu_data.x86_model == INTEL_FAM6_IVYBRIDGE &&
+        if ( boot_cpu_data.vfm == INTEL_IVYBRIDGE &&
              cpu_has_rdrand && !is_forced_cpu_cap(X86_FEATURE_RDRAND) )
             __clear_bit(X86_FEATURE_RDRAND, fs);
 
@@ -548,8 +546,7 @@ static void __init guest_common_default_feature_adjustments(uint32_t *fs)
          * it to the max policy to let VMs migrate in.  Re-hide it in the
          * default policy to disuade VMs from using it in the common case.
          */
-        if ( boot_cpu_data.x86 == 6 &&
-             boot_cpu_data.x86_model == INTEL_FAM6_SKYLAKE_X &&
+        if ( boot_cpu_data.vfm == INTEL_SKYLAKE_X &&
              raw_cpu_policy.feat.clwb )
             __clear_bit(X86_FEATURE_CLWB, fs);
 
@@ -755,7 +752,7 @@ static void __init calculate_hvm_max_policy(void)
      * long mode (and init_amd() has cleared it out of host capabilities), but
      * HVM guests are able if running in protected mode.
      */
-    if ( (boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) &&
+    if ( (boot_cpu_data.vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) &&
          raw_cpu_policy.basic.sep )
         __set_bit(X86_FEATURE_SEP, fs);
 
@@ -983,7 +980,7 @@ void recalculate_cpuid_policy(struct domain *d)
     if ( is_pv_32bit_domain(d) )
     {
         __clear_bit(X86_FEATURE_LM, max_fs);
-        if ( !(boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
+        if ( !(boot_cpu_data.vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
             __clear_bit(X86_FEATURE_SYSCALL, max_fs);
     }
 
diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index 05f78fa5bb30..faace882f1c4 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -672,8 +672,7 @@ static void cf_check init_intel(struct cpuinfo_x86 *c)
 	 * latter is not impacted.  Hide CLWB to cause Xen to fall back to
 	 * using CLFLUSHOPT instead.
 	 */
-	if (c == &boot_cpu_data &&
-	    c->x86 == 6 && c->x86_model == INTEL_FAM6_SKYLAKE_X)
+	if (c == &boot_cpu_data && c->vfm == INTEL_SKYLAKE_X)
 		setup_clear_cpu_cap(X86_FEATURE_CLWB);
 }
 
-- 
2.39.5


