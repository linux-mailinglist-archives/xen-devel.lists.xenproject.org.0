Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD2C82BEF5
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 12:10:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666832.1037745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOFQU-0000p4-Dp; Fri, 12 Jan 2024 11:10:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666832.1037745; Fri, 12 Jan 2024 11:10:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOFQU-0000mU-9e; Fri, 12 Jan 2024 11:10:14 +0000
Received: by outflank-mailman (input) for mailman id 666832;
 Fri, 12 Jan 2024 11:10:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=flvc=IW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rOFQS-0008DP-Ga
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2024 11:10:12 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26bfb0fe-b13b-11ee-9b0f-b553b5be7939;
 Fri, 12 Jan 2024 12:10:10 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40e68d836bcso685465e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jan 2024 03:10:10 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 z15-20020a056000110f00b00336751cd4ebsm3602157wrw.72.2024.01.12.03.10.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 03:10:09 -0800 (PST)
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
X-Inumbo-ID: 26bfb0fe-b13b-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705057809; x=1705662609; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2zpalpvILeRSgBXoHohbB9YC1Sb183LE28BuW4yOvrQ=;
        b=JaEvFXvFSFz80I5GuTr1TqmAZPCjSNnhc3jJdvoCO77SK2SwcEwiWJ4JNNLvalvjIT
         Sm/FgYaMXKpWA58cd+wBBJknSbsJdEO92qvM6HkpQvXTk1TFWvaoZcoJEY7uYKZMq3bd
         fVnnUmVrL3mC4O6sAY2PBKKhu8o/r2c0DElQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705057809; x=1705662609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2zpalpvILeRSgBXoHohbB9YC1Sb183LE28BuW4yOvrQ=;
        b=FB+FR3ASBOSZyg/Jqxy7KDIfC+MdpeckWhBSKEoxBqn7k4Sy21ljRKf6+cXFH/64+M
         CLAGY2C8bMoKeiSinMOLkCwgXi+jqLIO/vRaygG2guhZLwDc1JxThh56Om17Cs6pnNjk
         cctxnz3S/s/br88IJYqUFGti3zR5LmpZW7fYsQHXjRJVhS+XrLHNBCuYmwIKC0ABHKBQ
         WLwnwysCZq1WcYe0HmOiLxlHdCClI+Ij7plDUudKqE8crkw0xNstwScfYVByFbnZJ+/9
         WGjVnr3qvxNqAxph8hG7NGz0n9urEuUQUSsn4IbvgXWRvr8FgxKNE8v6XzOrSvre4jcv
         fWGQ==
X-Gm-Message-State: AOJu0YyDOzod4Xv+RW+WcZkmbD62ypWMoAvcuTuOBMa7Q9B8SWlUcbT8
	M1xvJJD+dIHBUTpnsheLz/yhG7hipExOY9cB4EJJzilPPAg=
X-Google-Smtp-Source: AGHT+IFcZZSG3fB9KLeDwmdrIxaAkXqtI7urdQAtFF7ukQLakZCaPiQi5I4dYBErtN1hXp0t2rZH6w==
X-Received: by 2002:a05:600c:3b87:b0:40e:6275:e6be with SMTP id n7-20020a05600c3b8700b0040e6275e6bemr688938wms.43.1705057809424;
        Fri, 12 Jan 2024 03:10:09 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4] x86/intel: ensure Global Performance Counter Control is setup correctly
Date: Fri, 12 Jan 2024 12:09:46 +0100
Message-ID: <20240112110946.75582-1-roger.pau@citrix.com>
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

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - Revert previous change and require 2 counters.

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
index dfee64689ffe..b5490eb06e00 100644
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
+		if ((eax & 0xff) && (cnt > 1) && (cnt <= 32)) {
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


