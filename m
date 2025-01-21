Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 621AFA1825F
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2025 17:56:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875611.1286058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taHYG-0003gE-5F; Tue, 21 Jan 2025 16:56:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875611.1286058; Tue, 21 Jan 2025 16:56:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taHYG-0003du-1a; Tue, 21 Jan 2025 16:56:32 +0000
Received: by outflank-mailman (input) for mailman id 875611;
 Tue, 21 Jan 2025 16:56:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qQWO=UN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1taHYF-0003do-4I
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2025 16:56:31 +0000
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [2a00:1450:4864:20::542])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a88aa2fd-d818-11ef-99a4-01e77a169b0f;
 Tue, 21 Jan 2025 17:56:29 +0100 (CET)
Received: by mail-ed1-x542.google.com with SMTP id
 4fb4d7f45d1cf-5d3d0205bd5so9525822a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2025 08:56:29 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5db73697174sm7377310a12.45.2025.01.21.08.56.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 08:56:28 -0800 (PST)
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
X-Inumbo-ID: a88aa2fd-d818-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737478588; x=1738083388; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aJMA+NwRz9Q4wQth1iLhNf8fNKE6Vjh+DxIWkVVgb04=;
        b=IADM2SyXWUHUkD/1SMJ6UuVd7dz1+SnUxScXyaBOAns9kkUKkauwYJm9fXg4/UdtLQ
         hXpkp7SkeSBx3IPtpaCaExUmBHLdTNqH1/VpS3rpTdQC7fBlq5MrKBszft6tu8/A+CUS
         CBJjiNfeU4jcOiYHoRyIDRYSWu7pBqn8Lk/QE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737478588; x=1738083388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aJMA+NwRz9Q4wQth1iLhNf8fNKE6Vjh+DxIWkVVgb04=;
        b=eaNM2sLxaGMDaEC591W3kfOjCDY0qdiAbMRxXytBmhVSQ0RTNjtRhAzGSLbhWYXeli
         e+xgjkydTDoSm/o0Tb6D8c1Q7AatKjUH8SEe1gISufGiyzbvD4Lxxzv3nGoNEy2qdQIM
         Nn/StHBT8ea/VcTKpQ61SpqFJkn4HFtdsTdo9V3ysnI3HBiLr7bFz/JukyV5pNxXEWWc
         7G/Q6ii8DWlg3KCG0NFAQi1/TqkVzOZZA9C7i8D7+c0zI1S3g++XnLULkKp8CY1o89K+
         rqdKzDf3DSAA8gG9xBxdPTB0khL2dYUfPKD3HQqQ9/XhIa6fcoLDm7Z8qsPBe+yODRDU
         VGSw==
X-Gm-Message-State: AOJu0Yy7CP05v+0/tYz7kO+yGQzLoa3/7wsczQUiewQ9CJX9+GbwjNlx
	TuJ8kIRTCAkgkXLpfiGov3FMW1mCdhqPSRZCwWEcqLws61mfS/rA7tAXgE6e9WTB+nXE1LlpI9G
	c/xoG8Q==
X-Gm-Gg: ASbGncu1VO/mlImxc9Jbtq9894yeq+wyS2TSRwN0nmKXOfiNrwo4sA1azNMA7iiTRmF
	hTlMes6AhaCgmQPAMzlsyfWwB4L2sR6jCfYLW+BaWFh4sHBiCN246hIq6Iov0P4FCtpGkf055pJ
	IER31fX/HOwAOOpjY21N0FsEPxyA0QVbd+Q58PZ7aaud3atm9wPjYURz6stTNrJ8itu/3RB8XOn
	+/DlM5v4HcNkWdLlCPUPnD9EmPxwNJTE8xMfRW7YdUsF6b1MrShseDKSY7GXeRwvsNZy4NUdWMI
	MOwrtuG0ALA4sloB3q3NvKsgDWkmnQ+uk4Rr71MVez8yuUnshw==
X-Google-Smtp-Source: AGHT+IEztnPdON91e+BElFap+6j1zBaaefdtCNoo2J1bSnKRifwrsDk8mjz5XHrhMs/ipgcqsbL87g==
X-Received: by 2002:a50:c010:0:b0:5d9:8877:895a with SMTP id 4fb4d7f45d1cf-5db7d300e78mr13640317a12.17.1737478588313;
        Tue, 21 Jan 2025 08:56:28 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jonathan Katz <jonathan.katz@aptar.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.20 v2] x86/intel: Fix PERF_GLOBAL fixup when virtualised
Date: Tue, 21 Jan 2025 16:56:26 +0000
Message-Id: <20250121165626.380627-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250121142510.358996-1-andrew.cooper3@citrix.com>
References: <20250121142510.358996-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Logic using performance counters needs to look at
MSR_MISC_ENABLE.PERF_AVAILABLE before touching any other resources.

When virtualised under ESX, Xen dies with a #GP fault trying to read
MSR_CORE_PERF_GLOBAL_CTRL.

Factor this logic out into a separate function (it's already too squashed to
the RHS), and insert a check of MSR_MISC_ENABLE.PERF_AVAILABLE.

This also avoids setting X86_FEATURE_ARCH_PERFMON if MSR_MISC_ENABLE says that
PERF is unavailable, although oprofile (the only consumer of this flag)
cross-checks too.

Fixes: 6bdb965178bb ("x86/intel: ensure Global Performance Counter Control is setup correctly")
Reported-by: Jonathan Katz <jonathan.katz@aptar.com>
Link: https://xcp-ng.org/forum/topic/10286/nesting-xcp-ng-on-esx-8
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

v2:
 * Drop _safe() on MSR_IA32_MISC_ENABLE read.
 * Fix the setting of X86_FEATURE_ARCH_PERFMON.

Untested, but this is the same pattern used by oprofile and watchdog setup.

I've intentionally stopped using Intel style.  This file is already mixed (as
visible even in context), and it doesn't remotely resemble it's Linux origin
any more.

For 4.20.  This regressions has already been backported.
---
 xen/arch/x86/cpu/intel.c | 64 +++++++++++++++++++++++-----------------
 1 file changed, 37 insertions(+), 27 deletions(-)

diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index 6a7347968ba2..6a680ba38dc9 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -535,39 +535,49 @@ static void intel_log_freq(const struct cpuinfo_x86 *c)
     printk("%u MHz\n", (factor * max_ratio + 50) / 100);
 }
 
+static void init_intel_perf(struct cpuinfo_x86 *c)
+{
+    uint64_t val;
+    unsigned int eax, ver, nr_cnt;
+
+    if ( c->cpuid_level <= 9 ||
+         ({  rdmsrl(MSR_IA32_MISC_ENABLE, val);
+             !(val & MSR_IA32_MISC_ENABLE_PERF_AVAIL); }) )
+        return;
+
+    eax = cpuid_eax(10);
+    ver = eax & 0xff;
+    nr_cnt = (eax >> 8) & 0xff;
+
+    if ( ver && nr_cnt > 1 && nr_cnt <= 32 )
+    {
+        unsigned int cnt_mask = (1UL << nr_cnt) - 1;
+
+        /*
+         * On (some?) Sapphire/Emerald Rapids platforms each package-BSP
+         * starts with all the enable bits for the general-purpose PMCs
+         * cleared.  Adjust so counters can be enabled from EVNTSEL.
+         */
+        rdmsrl(MSR_CORE_PERF_GLOBAL_CTRL, val);
+
+        if ( (val & cnt_mask) != cnt_mask )
+        {
+            printk("FIRMWARE BUG: CPU%u invalid PERF_GLOBAL_CTRL: %#"PRIx64" adjusting to %#"PRIx64"\n",
+                   smp_processor_id(), val, val | cnt_mask);
+            wrmsrl(MSR_CORE_PERF_GLOBAL_CTRL, val | cnt_mask);
+        }
+
+        __set_bit(X86_FEATURE_ARCH_PERFMON, c->x86_capability);
+    }
+}
+
 static void cf_check init_intel(struct cpuinfo_x86 *c)
 {
 	/* Detect the extended topology information if available */
 	detect_extended_topology(c);
 
 	init_intel_cacheinfo(c);
-	if (c->cpuid_level > 9) {
-		unsigned eax = cpuid_eax(10);
-		unsigned int cnt = (eax >> 8) & 0xff;
-
-		/* Check for version and the number of counters */
-		if ((eax & 0xff) && (cnt > 1) && (cnt <= 32)) {
-			uint64_t global_ctrl;
-			unsigned int cnt_mask = (1UL << cnt) - 1;
-
-			/*
-			 * On (some?) Sapphire/Emerald Rapids platforms each
-			 * package-BSP starts with all the enable bits for the
-			 * general-purpose PMCs cleared.  Adjust so counters
-			 * can be enabled from EVNTSEL.
-			 */
-			rdmsrl(MSR_CORE_PERF_GLOBAL_CTRL, global_ctrl);
-			if ((global_ctrl & cnt_mask) != cnt_mask) {
-				printk("CPU%u: invalid PERF_GLOBAL_CTRL: %#"
-				       PRIx64 " adjusting to %#" PRIx64 "\n",
-				       smp_processor_id(), global_ctrl,
-				       global_ctrl | cnt_mask);
-				wrmsrl(MSR_CORE_PERF_GLOBAL_CTRL,
-				       global_ctrl | cnt_mask);
-			}
-			__set_bit(X86_FEATURE_ARCH_PERFMON, c->x86_capability);
-		}
-	}
+	init_intel_perf(c);
 
 	if ( !cpu_has(c, X86_FEATURE_XTOPOLOGY) )
 	{

base-commit: c3f5d1bb40b57d467cb4051eafa86f5933ec9003
-- 
2.39.5


