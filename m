Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A549B516B
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 18:55:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827778.1242490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5qR3-00034f-KN; Tue, 29 Oct 2024 17:55:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827778.1242490; Tue, 29 Oct 2024 17:55:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5qR3-000329-Gu; Tue, 29 Oct 2024 17:55:17 +0000
Received: by outflank-mailman (input) for mailman id 827778;
 Tue, 29 Oct 2024 17:55:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YGhd=RZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t5qR2-000321-He
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 17:55:16 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f010a9cc-961e-11ef-a0c3-8be0dac302b0;
 Tue, 29 Oct 2024 18:55:09 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c9150f9ed4so7394016a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 10:55:09 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f298dc4sm492024866b.124.2024.10.29.10.55.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 10:55:07 -0700 (PDT)
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
X-Inumbo-ID: f010a9cc-961e-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmQiLCJoZWxvIjoibWFpbC1lZDEteDUyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImYwMTBhOWNjLTk2MWUtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjI0NTA5LjQyMDM3OSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730224508; x=1730829308; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6BbM7rIsfqQ52N4fxzS/e+HPw8oF6QxWBr66WOwuncM=;
        b=Ohm34SP50Q6cWUVmFthjPRLyeG52WcNwWzZeUe7/IX3f6JW+r/3OT4N/w7e10U3KUq
         gF7i4Z1vzJmr+zR5v2A6p/EwtrvZrM22KxOeJvJ8WCSr4x4gHDJPpiMWTjUzdSOyfpBW
         GG1nDIDQOQYriRT9tDJSZ52tojTg/pcC4B0u8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730224508; x=1730829308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6BbM7rIsfqQ52N4fxzS/e+HPw8oF6QxWBr66WOwuncM=;
        b=Jom6Y6f8SdPFRwAAy8n5FyDl/XVxqu1pBAvvIhZJ11Tj4IK+pIOXhvC66Sik4xpBHL
         PuxaMI5QuwuYYDcCrM/i8ThKbY0p/LAYuNbzauBLK+78W8/8dTHU1sxYOg8pRCsy2Hkk
         JfoCazoo/RnAANYF6hj0v0OyjH/2lTolAp2U4KmBPmUBzPRNEUA7uPw/GA3/GQFaXK0T
         lTjF3Hck9FjevvHl+n4CPmIOn3V6aHwqoeqiwj7O37OzNUoJI+zcTjl8xSCdGFRgsnS5
         fVtIn6tGSIipUGoYKr2DD+gnb1lX0k4WsBYehbmnAcvblnBQvRgFkPTQ7i29yBLQlAcL
         pFrw==
X-Gm-Message-State: AOJu0YzfdKvijHr8nQesLgRaxo7Qw0CaxZoE57uyQPWI9GRvj29vmbhY
	6VpDZL4pE/LpYNefZ/QHzvxU/E1cL+lq1kdxEBdyrhMDc/D313pwgTZwKaJycyNeCvR6EDHAWXv
	4
X-Google-Smtp-Source: AGHT+IEg7lSIABLWHp/uw50QoWD0z1BwMuRDbMkHCOcEo1M3MJqVQG4Svh0AYshqwL5vbQZcQYRFcA==
X-Received: by 2002:a17:907:6eac:b0:a9a:7f91:8c76 with SMTP id a640c23a62f3a-a9de5a3e0ebmr1386332666b.0.1730224507968;
        Tue, 29 Oct 2024 10:55:07 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [PATCH] x86/cpu-policy: Extend the guest max policy max leaf/subleaves
Date: Tue, 29 Oct 2024 17:55:05 +0000
Message-Id: <20241029175505.2698661-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We already have one migration case opencoded (feat.max_subleaf).  A more
recent discovery is that we advertise x2APIC to guests without ensuring that
we provide max_leaf >= 0xb.

In general, any leaf known to Xen can be safely configured by the toolstack if
it doesn't violate other constraints.

Therefore, introduce guest_common_{max,default}_leaves() to generalise the
special case we currently have for feat.max_subleaf, in preparation to be able
to provide x2APIC topology in leaf 0xb even on older hardware.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>

On a KabyLake I have to hand, here's the delta in what xen-cpuid -p reports:

  git diff --no-index xen-cpuid-p-{before,after}.log
  diff --git a/xen-cpuid-p-before.log b/xen-cpuid-p-after.log
  index 5a76d05..24e22be 100644
  --- a/xen-cpuid-p-before.log
  +++ b/xen-cpuid-p-after.log
  @@ -61,7 +61,7 @@ Host policy: 33 leaves, 2 MSRs
     index    -> value
     000000ce -> 0000000080000000
     0000010a -> 000000000e000c04
  -PV Max policy: 33 leaves, 2 MSRs
  +PV Max policy: 58 leaves, 2 MSRs
    CPUID:
     leaf     subleaf  -> eax      ebx      ecx      edx
     00000000:ffffffff -> 0000000d:756e6547:6c65746e:49656e69
  @@ -75,7 +75,7 @@ PV Max policy: 33 leaves, 2 MSRs
     0000000d:00000000 -> 00000007:00000000:00000340:00000000
     0000000d:00000001 -> 00000007:00000000:00000000:00000000
     0000000d:00000002 -> 00000100:00000240:00000000:00000000
  -  80000000:ffffffff -> 80000008:00000000:00000000:00000000
  +  80000000:ffffffff -> 80000021:00000000:00000000:00000000
     80000001:ffffffff -> 00000000:00000000:00000123:28100800
     80000002:ffffffff -> 65746e49:2952286c:6f655820:2952286e
     80000003:ffffffff -> 55504320:2d334520:30333231:20367620
  @@ -87,7 +87,7 @@ PV Max policy: 33 leaves, 2 MSRs
     index    -> value
     000000ce -> 0000000080000000
     0000010a -> 000000001c020004
  -HVM Max policy: 35 leaves, 2 MSRs
  +HVM Max policy: 60 leaves, 2 MSRs
    CPUID:
     leaf     subleaf  -> eax      ebx      ecx      edx
     00000000:ffffffff -> 0000000d:756e6547:6c65746e:49656e69
  @@ -103,7 +103,7 @@ HVM Max policy: 35 leaves, 2 MSRs
     0000000d:00000002 -> 00000100:00000240:00000000:00000000
     0000000d:00000003 -> 00000040:000003c0:00000000:00000000
     0000000d:00000004 -> 00000040:00000400:00000000:00000000
  -  80000000:ffffffff -> 80000008:00000000:00000000:00000000
  +  80000000:ffffffff -> 80000021:00000000:00000000:00000000
     80000001:ffffffff -> 00000000:00000000:00000123:2c100800
     80000002:ffffffff -> 65746e49:2952286c:6f655820:2952286e
     80000003:ffffffff -> 55504320:2d334520:30333231:20367620
---
 xen/arch/x86/cpu-policy.c | 39 +++++++++++++++++++++++++--------------
 1 file changed, 25 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index b6d9fad56773..78bc9872b09a 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -391,6 +391,27 @@ static void __init calculate_host_policy(void)
     p->platform_info.cpuid_faulting = cpu_has_cpuid_faulting;
 }
 
+/*
+ * Guest max policies can have any max leaf/subleaf within bounds.
+ *
+ * - Some incoming VMs have a larger-than-necessary feat max_subleaf.
+ * - Some VMs we'd like to synthesise leaves not present on the host.
+ */
+static void __init guest_common_max_leaves(struct cpu_policy *p)
+{
+    p->basic.max_leaf       = ARRAY_SIZE(p->basic.raw) - 1;
+    p->feat.max_subleaf     = ARRAY_SIZE(p->feat.raw) - 1;
+    p->extd.max_leaf        = 0x80000000U + ARRAY_SIZE(p->extd.raw) - 1;
+}
+
+/* Guest default policies inherit the host max leaf/subleaf settings. */
+static void __init guest_common_default_leaves(struct cpu_policy *p)
+{
+    p->basic.max_leaf       = host_cpu_policy.basic.max_leaf;
+    p->feat.max_subleaf     = host_cpu_policy.feat.max_subleaf;
+    p->extd.max_leaf        = host_cpu_policy.extd.max_leaf;
+}
+
 static void __init guest_common_max_feature_adjustments(uint32_t *fs)
 {
     if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
@@ -579,11 +600,7 @@ static void __init calculate_pv_max_policy(void)
 
     *p = host_cpu_policy;
 
-    /*
-     * Some VMs may have a larger-than-necessary feat max_subleaf.  Allow them
-     * to migrate in.
-     */
-    p->feat.max_subleaf = ARRAY_SIZE(p->feat.raw) - 1;
+    guest_common_max_leaves(p);
 
     x86_cpu_policy_to_featureset(p, fs);
 
@@ -626,8 +643,7 @@ static void __init calculate_pv_def_policy(void)
 
     *p = pv_max_cpu_policy;
 
-    /* Default to the same max_subleaf as the host. */
-    p->feat.max_subleaf = host_cpu_policy.feat.max_subleaf;
+    guest_common_default_leaves(p);
 
     x86_cpu_policy_to_featureset(p, fs);
 
@@ -666,11 +682,7 @@ static void __init calculate_hvm_max_policy(void)
 
     *p = host_cpu_policy;
 
-    /*
-     * Some VMs may have a larger-than-necessary feat max_subleaf.  Allow them
-     * to migrate in.
-     */
-    p->feat.max_subleaf = ARRAY_SIZE(p->feat.raw) - 1;
+    guest_common_max_leaves(p);
 
     x86_cpu_policy_to_featureset(p, fs);
 
@@ -790,8 +802,7 @@ static void __init calculate_hvm_def_policy(void)
 
     *p = hvm_max_cpu_policy;
 
-    /* Default to the same max_subleaf as the host. */
-    p->feat.max_subleaf = host_cpu_policy.feat.max_subleaf;
+    guest_common_default_leaves(p);
 
     x86_cpu_policy_to_featureset(p, fs);
 

base-commit: 56bd76925ec35085528d778e46123b9d10a66018
-- 
2.39.5


