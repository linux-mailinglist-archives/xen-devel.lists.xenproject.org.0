Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD6DB0A058
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 12:08:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048335.1418546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uci0I-0000J6-88; Fri, 18 Jul 2025 10:07:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048335.1418546; Fri, 18 Jul 2025 10:07:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uci0I-0000HG-4v; Fri, 18 Jul 2025 10:07:46 +0000
Received: by outflank-mailman (input) for mailman id 1048335;
 Fri, 18 Jul 2025 10:07:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=00bL=Z7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uci0G-0000HA-Ts
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 10:07:44 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b79b175-63bf-11f0-a319-13f23c93f187;
 Fri, 18 Jul 2025 12:07:43 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a548a73ff2so1754286f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jul 2025 03:07:43 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4563b740c51sm15510005e9.19.2025.07.18.03.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 03:07:41 -0700 (PDT)
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
X-Inumbo-ID: 0b79b175-63bf-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752833262; x=1753438062; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ca4sD/GUNWo8CV4mlthsrUbL++Bxj48v/SmbyqYVvys=;
        b=smmCQ4742UYXksfrdJeCQl3/w8PBa39XHYUIKIFOspU/rpWiQ+6mjffG/mqpY79liI
         +McuAlQhtBJFY0sI/Lx4F+KMqLlS3bnn4CA3vjJOdrh8G+d70bU6J7x7QRVRR+qgtzW3
         MAD1Qh1fbDj0IKHlR9Md4VtLAKvI7GUuwaevw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752833262; x=1753438062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ca4sD/GUNWo8CV4mlthsrUbL++Bxj48v/SmbyqYVvys=;
        b=AmOR9jTjg4c7N7lPgGTHdYMk/NOB3xC/BQ3IY1zewkQ3AVLE+aHLqoIZEADdsubPjR
         zUt8F+9NjwhIMjTnRckADf+9VGBAyK3AAsRyp6qib/XCcQNTFJ+Xz16ncZvBOuPcr5Aw
         e8aSQXTif7l8E9utHtMNt+FDjf37EZuoYLKKUIRMjx9R612uAzPJ6doziznXvwHGqWP6
         w8WSE1Ca7LmxFIROQvcmNA9TAEGq42qSI3ZMUVmKZRES1/nblAL37AJuHhSmBbs4iyG/
         dQ08hd2OQW1xcgGxiIRJo7eQWTExngRqLdVl/m9eBl2cnCv+fn8Br/qkb4zN6sT0dgQu
         HAJA==
X-Gm-Message-State: AOJu0Yxj31w7X58I1PYvf3d05rKZWwIsg7iO53z+9fPKt91R67Ru1w7O
	I7F+Y8qVURh3ZE1zn1zeh+FTZQdDvtod6GSxRKS57fzBMvnBS+cvMEaoy15PfY54ZYYg3N0rN13
	78zwKkHrTJw==
X-Gm-Gg: ASbGnctFTiv4sD80n2xrHFUis5P2V1JSg4MQpiNAtSiPmyLpgUv6klsUlFXhlormeGL
	xf6TuqwWW0oMOIbPblCBBh2LwQo+F2JNJXvEVKeu3M/TTfsMqeVGGM08LDmffBFIaja9IbUVZSU
	gauojHP2aPxmIcGEJtLHymEerrKZPQKTh3c5oe2NPObhqsuy5h2DqeMAugp8m1mRpTJLE90FjZ6
	6+jmJYOyD3L2IUd8PB+AXvVQ1eyuzHa6OgT4S53id1cE4vtKdPiPfoDgW0JS6Hp12/rPVuANuam
	ae70NMKKpHwX7d42zTeIDx1FhogMFfcUiUvcJxnfXcf5/QfBbUT4v4FFFyeDBI7MRuw9KO1UX7F
	J3KX0KtzNCIqfq1BUPEUfkhHWFyWZZ+jxWiYZetErHGmlNLVlttaHoxSoXxNBrLy6Rc4WgtZJRs
	LJ
X-Google-Smtp-Source: AGHT+IH3lWx7KcCZa3azwFNaOvE+7aXL0AQ4em3pQ9AVy7138lUpUClN9e+A0Q5RNy/sf2dRO5Ditg==
X-Received: by 2002:a05:6000:290d:b0:3a4:d53d:be23 with SMTP id ffacd0b85a97d-3b60dd731cfmr8928419f8f.30.1752833262272;
        Fri, 18 Jul 2025 03:07:42 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v1.1 6/6] x86/apic: Convert the TSC deadline errata table to X86_MATCH_*()
Date: Fri, 18 Jul 2025 11:07:39 +0100
Message-Id: <20250718100739.2369750-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250716173132.2213891-7-andrew.cooper3@citrix.com>
References: <20250716173132.2213891-7-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With the ability to match on steppings, introduce a new X86_MATCH_VFMS()
helper to match a specific stepping, and use it to rework deadline_match[].

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
 xen/arch/x86/apic.c                  | 93 +++++++---------------------
 xen/arch/x86/include/asm/match-cpu.h |  5 ++
 2 files changed, 28 insertions(+), 70 deletions(-)

diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index c4272ab4de4f..c4a27fa00230 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -1051,70 +1051,30 @@ static void setup_APIC_timer(void)
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
 
@@ -1125,14 +1085,7 @@ static void __init check_deadline_errata(void)
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
index 3862e766ccfc..b491232c351f 100644
--- a/xen/arch/x86/include/asm/match-cpu.h
+++ b/xen/arch/x86/include/asm/match-cpu.h
@@ -35,6 +35,11 @@ struct x86_cpu_id {
                   VFM_MODEL(vfm), X86_STEPPINGS_ANY,            \
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


