Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC0FB07C15
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 19:32:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045523.1415705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc5yr-0004CJ-J8; Wed, 16 Jul 2025 17:31:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045523.1415705; Wed, 16 Jul 2025 17:31:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc5yr-00049L-E1; Wed, 16 Jul 2025 17:31:45 +0000
Received: by outflank-mailman (input) for mailman id 1045523;
 Wed, 16 Jul 2025 17:31:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uFaK=Z5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uc5yp-00030y-Tu
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 17:31:43 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bcbb50ef-626a-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 19:31:42 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-451d41e1ad1so557875e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 10:31:42 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e7f2e68sm27048625e9.1.2025.07.16.10.31.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 10:31:40 -0700 (PDT)
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
X-Inumbo-ID: bcbb50ef-626a-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752687101; x=1753291901; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LCdmRIQ27rwgE2yCA9bmvyBIJOmpFRV7SefCKLOpp1c=;
        b=Ln0z75RIQZ1E8bmFL54eF8lrG+LnC3QdB8/6QkcXXx38ttbAMlCbaBJV4HncJ3D4CE
         WHHv2fYcSp6s8VxgFFraDcwB02gb1NLkdvrz+tMnV/E+EHs2O6RKK45SWghcKfiTkm6t
         m8w1QEy4cHpbq/73Gso0r71uVYF8TOPk+Q8+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752687101; x=1753291901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LCdmRIQ27rwgE2yCA9bmvyBIJOmpFRV7SefCKLOpp1c=;
        b=n1++AhWn/jP3oZpcLZvQTXosoWqt899/7SnUY4ZLXImUlz2WzJcw40BmllDsBukhoJ
         3LjIl+GLSBRdZHJ6Cryn5pTHfg0vagOb73qiywAq4VI8mdQxX7VjfVvgGz0AgS+cZHN4
         j9B11stkPCCd+J8HAxzv4P7yOISC/7LtG9mR6gZs0l4hNI0pGXMyTOFkDhnUdUPBn4rM
         Cako/vMkWizFdt3K3HyQfR4huJy/aNLxwFH5Wxwmf28XzgK6aYTXoM6MfA66ACviGGYg
         /UDEqZ73EdRBSdDwpdQbejkriiI4P73i6xhJNLJLb+Yq0gVwHIrkiHwqpnhCa6OsqKnM
         4pZw==
X-Gm-Message-State: AOJu0Yx/tuwBcSuXznl0GuT8d3FtefXNiPjZ2Fj5z64msi5Z9OVWKcOm
	811fE40qFlhwxYsVMw+oYxfU8pDK99DJ/XPRIJesL95VPZFgCRoZ5WYAGtUcgnAPjmNPEl2azOy
	yObXEqsHivQ==
X-Gm-Gg: ASbGnct4T3o7yTdC07gRCjn9OZHG9s0VuX/88YvryTveJYtBLRjH+l5OI3zl4wybRLC
	idlMTIOIdKB1ry8ab3so/+jQTmdFl8XtylvMxB0xid7wdCceFL6wIiMhpscH9iSLxR2LZ77+k6Y
	wu7h4ofei5IfCoqyMuDiN6Id3VnDivpl6YTnYymyZlEkN8HEVJinwjCSJcQIQYtQvKkQ8giw54a
	2A3t0JMT9vy7gl1F6uhG2gdG1h9sMxhguFsVyQNvvufEBannBObeaXiLzAPvXQgiAYCBM2p3aI3
	enV40kphKdiTUkTl7e9wNfOqYbKaquXNgoo4b24X4Sv7WHX39fkG0LvvMCU1HgcZ1pMpaDP34BV
	8a0ZbFQwBulw+Sh2XPd0f3bme381SdCRPq1rHzZWpXZQAPtYJGMLFJKmShkqdUqeyGK7CH94ahG
	zf
X-Google-Smtp-Source: AGHT+IEG58dhEhZvnXvn8P7XJ4Ia6N+uuMUqPSmCPFS+5ao3mhFWC8kyh0y+xvyOS8aJcQXH8hEdqw==
X-Received: by 2002:a05:600c:450f:b0:455:fab4:4b80 with SMTP id 5b1f17b1804b1-4562e275cd0mr37034325e9.19.1752687101375;
        Wed, 16 Jul 2025 10:31:41 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 6/6] x86/apic: Convert the TSC deadline errata table to X86_MATCH_*()
Date: Wed, 16 Jul 2025 18:31:32 +0100
Message-Id: <20250716173132.2213891-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250716173132.2213891-1-andrew.cooper3@citrix.com>
References: <20250716173132.2213891-1-andrew.cooper3@citrix.com>
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
 xen/arch/x86/apic.c                  | 79 +++++++---------------------
 xen/arch/x86/include/asm/match-cpu.h |  5 ++
 2 files changed, 25 insertions(+), 59 deletions(-)

diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index c4272ab4de4f..744124185189 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -1051,64 +1051,32 @@ static void setup_APIC_timer(void)
     local_irq_restore(flags);
 }
 
-#define DEADLINE_MODEL_MATCH(m, fr) \
-    { .vendor = X86_VENDOR_INTEL, .family = 6, .model = (m), \
-      .feature = X86_FEATURE_TSC_DEADLINE, \
-      .driver_data = (void *)(unsigned long)(fr) }
+static const struct x86_cpu_id __initconst deadline_match[] = {
+    X86_MATCH_VFMS(INTEL_HASWELL_X,   0x2, 0x3a), /* EP */
+    X86_MATCH_VFMS(INTEL_HASWELL_X,   0x4, 0x0f), /* EX */
 
-static unsigned int __init hsx_deadline_rev(void)
-{
-    switch ( boot_cpu_data.x86_mask )
-    {
-    case 0x02: return 0x3a; /* EP */
-    case 0x04: return 0x0f; /* EX */
-    }
+    X86_MATCH_VFM (INTEL_BROADWELL_X,      0x0b000020),
 
-    return ~0U;
-}
+    X86_MATCH_VFMS(INTEL_BROADWELL_D, 0x2, 0x00000011),
+    X86_MATCH_VFMS(INTEL_BROADWELL_D, 0x3, 0x0700000e),
+    X86_MATCH_VFMS(INTEL_BROADWELL_D, 0x4, 0x0f00000c),
+    X86_MATCH_VFMS(INTEL_BROADWELL_D, 0x5, 0x0e000003),
 
-static unsigned int __init bdx_deadline_rev(void)
-{
-    switch ( boot_cpu_data.x86_mask )
-    {
-    case 0x02: return 0x00000011;
-    case 0x03: return 0x0700000e;
-    case 0x04: return 0x0f00000c;
-    case 0x05: return 0x0e000003;
-    }
+    X86_MATCH_VFMS(INTEL_SKYLAKE_X,   0x3, 0x01000136),
+    X86_MATCH_VFMS(INTEL_SKYLAKE_X,   0x4, 0x02000014),
 
-    return ~0U;
-}
+    X86_MATCH_VFM (INTEL_HASWELL,          0x22),
+    X86_MATCH_VFM (INTEL_HASWELL_L,        0x20),
+    X86_MATCH_VFM (INTEL_HASWELL_G,        0x17),
 
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
+    X86_MATCH_VFM (INTEL_BROADWELL,        0x25),
+    X86_MATCH_VFM (INTEL_BROADWELL_G,      0x17),
 
-    DEADLINE_MODEL_MATCH(0x3d, 0x25),             /* Broadwell */
-    DEADLINE_MODEL_MATCH(0x47, 0x17),             /* Broadwell H */
-    DEADLINE_MODEL_MATCH(0x4f, 0x0b000020),       /* Broadwell EP/EX */
-    DEADLINE_MODEL_MATCH(0x56, bdx_deadline_rev), /* Broadwell D */
+    X86_MATCH_VFM (INTEL_SKYLAKE_L,        0xb2),
+    X86_MATCH_VFM (INTEL_SKYLAKE,          0xb2),
 
-    DEADLINE_MODEL_MATCH(0x4e, 0xb2),             /* Skylake M */
-    DEADLINE_MODEL_MATCH(0x55, skx_deadline_rev), /* Skylake X */
-    DEADLINE_MODEL_MATCH(0x5e, 0xb2),             /* Skylake D */
-
-    DEADLINE_MODEL_MATCH(0x8e, 0x52),             /* Kabylake M */
-    DEADLINE_MODEL_MATCH(0x9e, 0x52),             /* Kabylake D */
+    X86_MATCH_VFM (INTEL_KABYLAKE_L,       0x52),
+    X86_MATCH_VFM (INTEL_KABYLAKE,         0x52),
 
     {}
 };
@@ -1125,14 +1093,7 @@ static void __init check_deadline_errata(void)
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


