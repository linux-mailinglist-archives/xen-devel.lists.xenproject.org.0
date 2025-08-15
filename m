Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9768FB28740
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 22:41:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083893.1443409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un1Ez-0007W4-Mi; Fri, 15 Aug 2025 20:41:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083893.1443409; Fri, 15 Aug 2025 20:41:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un1Ez-0007OA-8O; Fri, 15 Aug 2025 20:41:33 +0000
Received: by outflank-mailman (input) for mailman id 1083893;
 Fri, 15 Aug 2025 20:41:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oFbR=23=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1un1Ew-0005Rl-DS
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 20:41:30 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37bbaf58-7a18-11f0-b898-0df219b8e170;
 Fri, 15 Aug 2025 22:41:28 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3b9e4148134so1245330f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 13:41:28 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3bb5d089e07sm3153924f8f.0.2025.08.15.13.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Aug 2025 13:41:27 -0700 (PDT)
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
X-Inumbo-ID: 37bbaf58-7a18-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755290487; x=1755895287; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wp9GcfERhSc9RphdTohoYWO6tq4mmGqIFpMiNdNkKno=;
        b=nc7FURIpoPVqGQ8aB4ByHuI6HpOWqhwSGSdiwse8/TijTZqynl9Ivs8usxAX/Kh5SU
         ZRTcIOEMftzNl/Kt63w3VIEWA2cuGCAIx+PyVtKKhE/bhNwH44d3JzT5HPC7E+GUuvvX
         Pf0ra2gUuKSeBe6V3NR/sEWbCOsU4qFWgibrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755290487; x=1755895287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wp9GcfERhSc9RphdTohoYWO6tq4mmGqIFpMiNdNkKno=;
        b=vlxbW6MNbWEiaruMw5BpyEfSu/B9Vtl9DKfsQ0760havv8Gf3TXOxtze8/iePkez/h
         7dOZA6ls71pSSIDl5ZMUSHA0srZIOXpIkQwKugUjdoibDI/EAJLUngcU4ovqArYj2FTI
         vRO4WIrqJ4F77pYBRJPBBDkwICcWTzUpvUgbGnTK9HRTTwDneD7uTFRfvNCGy7BGWZ0K
         ZF18gjVjVVn+PEo8C9Z12EhjmE0c9ZY4U2AnrLvI/mXLzkD3uGUslnRwIwgPkKYdoQVG
         syMLHyUfFfBFaa6Z48XJsyxUR/fBiaRbtLRAg+oZIuj8IRTpek7Vg5HrbbeOw2ucEeA5
         9URA==
X-Gm-Message-State: AOJu0Yy75NtK76aQVanVVzmkLK2E/GCNp/+o+gVpwyuvkTRoZ+8f7a2B
	VQ9S6CoMVRtyCH6HnV4Jb/qZbJrErxoZK+w75PbzEN5T+Q2/s3TRrUZIqc31OaFJM58eDfAxW0q
	Qm+HT
X-Gm-Gg: ASbGncsFhYrVfAqTWakt4Rjm0YcloCVjW3h/AzGGZ5+fn6C3IS61UM6o4US/BrFJRqo
	hELEdWaWEoZlmyYw94qNIwFUwVcdQIA0U73nNuc0Hv9gs12hvc1b6mm3KBNeANMpzIYzySze/zS
	xptQOZOPwxq30wJ4Vjpv9hXLCSu5OTwGq/9rXBmQTq9TQn/LRd8xh4a+whuyAxynHTHUW4RV/ZG
	S+KL3U2XTooCXUaiWTWkR43DwCbM7iifBulEwvhhEMBvwiAVLrvAZ1W4ylIiz7MGHeleteNdW5v
	c58Aa7uGcQEagH1u+ylH01c91FVKa3y3zJBThvbrfvLUdIjz1pGhqpYof4QKh4lJNmh0gGN9EdI
	AXeMehDqz6XGUUXzk5LeJ/tGpRYGMat+X8+nXFQtOERXyFlKgxGgKfZRx/Lx/vyUTS6GEqi9hGK
	tA
X-Google-Smtp-Source: AGHT+IEEyLbKPN+sxUmYC4dnDd/MtkqdHPkIGELrbZjq83w5vLTDWuOrlWJnQQ0xO23PMPLGtWuNVw==
X-Received: by 2002:a05:6000:420d:b0:3a3:63d3:369a with SMTP id ffacd0b85a97d-3bb670fc6famr2575056f8f.25.1755290487435;
        Fri, 15 Aug 2025 13:41:27 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 09/16] x86: Clean up asm/msr.h
Date: Fri, 15 Aug 2025 21:41:10 +0100
Message-Id: <20250815204117.3312742-10-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now that content has been split out, minimise the header files as msr.h is
included by many translation units.  A few more TUs were pulling dependencies
in transitively, so fix them up.

Give asm/time.h an SPDX tag, and strip trailing whitespace.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/acpi/cpufreq/acpi.c   |  2 ++
 xen/arch/x86/acpi/cpufreq/hwp.c    |  4 ++++
 xen/arch/x86/cpu/microcode/intel.c |  4 ++++
 xen/arch/x86/include/asm/msr.h     | 22 ++++++----------------
 xen/arch/x86/tsx.c                 |  2 ++
 5 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/acpi/cpufreq/acpi.c b/xen/arch/x86/acpi/cpufreq/acpi.c
index 567c10dd0643..b02745941701 100644
--- a/xen/arch/x86/acpi/cpufreq/acpi.c
+++ b/xen/arch/x86/acpi/cpufreq/acpi.c
@@ -14,8 +14,10 @@
 #include <xen/delay.h>
 #include <xen/errno.h>
 #include <xen/param.h>
+#include <xen/smp.h>
 
 #include <asm/msr.h>
+#include <asm/processor.h>
 
 #include <acpi/acpi.h>
 #include <acpi/cpufreq/cpufreq.h>
diff --git a/xen/arch/x86/acpi/cpufreq/hwp.c b/xen/arch/x86/acpi/cpufreq/hwp.c
index 26dce9aaf89a..38037d8300cd 100644
--- a/xen/arch/x86/acpi/cpufreq/hwp.c
+++ b/xen/arch/x86/acpi/cpufreq/hwp.c
@@ -8,8 +8,12 @@
 #include <xen/cpumask.h>
 #include <xen/init.h>
 #include <xen/param.h>
+#include <xen/smp.h>
 #include <xen/xmalloc.h>
+
 #include <asm/msr.h>
+#include <asm/processor.h>
+
 #include <acpi/cpufreq/cpufreq.h>
 
 static bool __ro_after_init hwp_in_use;
diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index 3f8e9ca63b55..281993e725cc 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -23,8 +23,12 @@
 
 #include <xen/err.h>
 #include <xen/init.h>
+#include <xen/lib.h>
+#include <xen/string.h>
+#include <xen/xmalloc.h>
 
 #include <asm/msr.h>
+#include <asm/processor.h>
 #include <asm/system.h>
 
 #include "private.h"
diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index 4aeb06f6524d..c0d66562956d 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -1,18 +1,13 @@
-#ifndef __ASM_MSR_H
-#define __ASM_MSR_H
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef X86_MSR_H
+#define X86_MSR_H
 
-#include "msr-index.h"
-
-#include <xen/types.h>
 #include <xen/percpu.h>
 #include <xen/errno.h>
-#include <xen/kernel.h>
-
-#include <xen/lib/x86/cpu-policy.h>
 
+#include <asm/alternative.h>
 #include <asm/asm_defns.h>
-#include <asm/cpufeature.h>
-#include <asm/processor.h>
+#include <asm/msr-index.h>
 
 #define rdmsr(msr,val1,val2) \
      __asm__ __volatile__("rdmsr" \
@@ -113,11 +108,6 @@ static inline int wrmsr_safe(unsigned int msr, uint64_t val)
     return -EFAULT;
 }
 
-#define rdpmc(counter,low,high) \
-     __asm__ __volatile__("rdpmc" \
-			  : "=a" (low), "=d" (high) \
-			  : "c" (counter))
-
 DECLARE_PER_CPU(uint64_t, efer);
 static inline uint64_t read_efer(void)
 {
@@ -144,4 +134,4 @@ static inline void wrmsr_tsc_aux(uint32_t val)
     }
 }
 
-#endif /* __ASM_MSR_H */
+#endif /* X86_MSR_H */
diff --git a/xen/arch/x86/tsx.c b/xen/arch/x86/tsx.c
index fbdd05971c8b..2a0c7c08a2ba 100644
--- a/xen/arch/x86/tsx.c
+++ b/xen/arch/x86/tsx.c
@@ -1,7 +1,9 @@
 #include <xen/init.h>
 #include <xen/param.h>
+
 #include <asm/microcode.h>
 #include <asm/msr.h>
+#include <asm/processor.h>
 
 /*
  * Valid values:
-- 
2.39.5


