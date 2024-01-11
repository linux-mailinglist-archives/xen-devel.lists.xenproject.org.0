Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CD082AFF0
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 14:47:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666280.1036795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNvOx-0000IU-ML; Thu, 11 Jan 2024 13:47:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666280.1036795; Thu, 11 Jan 2024 13:47:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNvOx-0000FW-Jg; Thu, 11 Jan 2024 13:47:19 +0000
Received: by outflank-mailman (input) for mailman id 666280;
 Thu, 11 Jan 2024 13:47:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4+ne=IV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rNvOw-00008m-1z
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 13:47:18 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee9f74ba-b087-11ee-98f0-6d05b1d4d9a1;
 Thu, 11 Jan 2024 14:47:16 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40e6275e897so2078825e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 05:47:16 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 jg1-20020a05600ca00100b0040d4e1393dcsm5851966wmb.20.2024.01.11.05.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 05:47:15 -0800 (PST)
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
X-Inumbo-ID: ee9f74ba-b087-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1704980835; x=1705585635; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VqW9sc5MGVkvYqaq+nwC17m74Lu95c39UQRoxvyDZuo=;
        b=rvEM1jQStL5G5YyX3/d69EdqUQBMV+y65zwTfIJ6cQoBt8v59oabwkBiUvDEVLbxCS
         uz4lInUN6+owIrDSOt4Q8q4qXEEHW3XL6J1rtIoUmkBFRZ2xXf12xjiZByNvbP5FjHkY
         UztOLeYBoaMKc0sDX8cayx3fULRLnNOipG730=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704980835; x=1705585635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VqW9sc5MGVkvYqaq+nwC17m74Lu95c39UQRoxvyDZuo=;
        b=AyTgW6NKOwWZ0ZOf+rMsW5TrR52yUuXKBsUUbmwDIeOjsJcNGsf9T4D4Rjv3YQAcLG
         YM99LCB/drLzUhkiOF3UvqNUut5mfqrR8vJJcq6mp7Dh38IHSsocrlViZjrQOVJW/Egs
         PnOenufAvj8I5Ln0ZwD/OP/49NaFPsOb9iZxqGuhpWiP40Sui7gUZroXGg/ZRJpDgt2E
         4vqp2Pf/NRA4ekwQHBaLscTQAKnwAkItUxILVnFJtIyTnMXV9J2ZpK5eBo267boXS3za
         BFwgq1uO4CLvQxHCr0kCG/Sr1n0AfoKJ+oAvc1ukqcURVIRav05lGtcsdUxVXwxHU37p
         G0rA==
X-Gm-Message-State: AOJu0YwOkE3ZO9YpU9OCgNyWkDx713gi0OYFsOpkTlUV5vz+zplR0aZF
	MztbXSGBDyZG8GvXAER0MW2jQG7AqC1RLYwZH6QKxCx21t4=
X-Google-Smtp-Source: AGHT+IHmsBVzE5WwgK/bKXGcOMgL6bfpG67SZUxlbBLW+9Qao1lUCuQmJjJVPo70AZ7JQ52yhk5g5g==
X-Received: by 2002:a05:600c:54c2:b0:40e:4156:9f68 with SMTP id iw2-20020a05600c54c200b0040e41569f68mr464137wmb.136.1704980835407;
        Thu, 11 Jan 2024 05:47:15 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3] x86/intel: ensure Global Performance Counter Control is setup correctly
Date: Thu, 11 Jan 2024 14:47:11 +0100
Message-ID: <20240111134711.71144-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When Architectural Performance Monitoring is available, the PERF_GLOBAL_CTRL
MSR contains per-counter enable bits that is ANDed with the enable bit in the
counter EVNTSEL MSR in order for a PMC counter to be enabled.

So far the watchdog code seems to have relied on the PERF_GLOBAL_CTRL enable
bits being set by default, but at least on some Intel Sapphire and Emerald
Rapids this is no longer the case, and Xen reports:

Testing NMI watchdog on all CPUs: 0 40 stuck

The first CPU on each package is started with PERF_GLOBAL_CTRL zeroed, so PMC0
doesn't start counting when the enable bit in EVNTSEL0 is set, due to the
relevant enable bit in PERF_GLOBAL_CTRL not being set.

Check and adjust PERF_GLOBAL_CTRL during CPU initialization so that all the
general-purpose PMCs are enabled.  Doing so brings the state of the package-BSP
PERF_GLOBAL_CTRL in line with the rest of the CPUs on the system.

While there also adjust the check for ARCH_PERFMON in order to require a single
counter to be present instead of two.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Print message on invalid PERF_GLOBAL_CTRL.
 - Use a mask instead of type truncation.
 - Adjust the check to require a single counter instead of 2.

Changes since v1:
 - Do the adjustment of PERF_GLOBAL_CTRL even if the watchdog is not used, and
   enable all counters.
---
 xen/arch/x86/cpu/intel.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index dfee64689ffe..63c270f48256 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -533,9 +533,30 @@ static void cf_check init_intel(struct cpuinfo_x86 *c)
 	init_intel_cacheinfo(c);
 	if (c->cpuid_level > 9) {
 		unsigned eax = cpuid_eax(10);
+		unsigned int cnt = (eax >> 8) & 0xff;
+
 		/* Check for version and the number of counters */
-		if ((eax & 0xff) && (((eax>>8) & 0xff) > 1))
+		if ((eax & 0xff) && cnt && (cnt <= 32)) {
+			uint64_t global_ctrl;
+			unsigned int cnt_mask = (1UL << cnt) - 1;
+
+			/*
+			 * On (some?) Sapphire/Emerald Rapids platforms each
+			 * package-BSP starts with all the enable bits for the
+			 * general-purpose PMCs cleared.  Adjust so counters
+			 * can be enabled from EVNTSEL.
+			 */
+			rdmsrl(MSR_CORE_PERF_GLOBAL_CTRL, global_ctrl);
+			if ((global_ctrl & cnt_mask) != cnt_mask) {
+				printk("CPU%u: invalid PERF_GLOBAL_CTRL: %#"
+				       PRIx64 " adjusting to %#" PRIx64 "\n",
+				       smp_processor_id(), global_ctrl,
+				       global_ctrl | cnt_mask);
+				wrmsrl(MSR_CORE_PERF_GLOBAL_CTRL,
+				       global_ctrl | cnt_mask);
+			}
 			__set_bit(X86_FEATURE_ARCH_PERFMON, c->x86_capability);
+		}
 	}
 
 	if ( !cpu_has(c, X86_FEATURE_XTOPOLOGY) )
-- 
2.43.0


