Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2C7B2873F
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 22:41:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083892.1443402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un1Ey-0007HJ-Kl; Fri, 15 Aug 2025 20:41:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083892.1443402; Fri, 15 Aug 2025 20:41:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un1Ey-0007Bc-3F; Fri, 15 Aug 2025 20:41:32 +0000
Received: by outflank-mailman (input) for mailman id 1083892;
 Fri, 15 Aug 2025 20:41:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oFbR=23=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1un1Ev-0005Rl-IV
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 20:41:29 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 376d5f8f-7a18-11f0-b898-0df219b8e170;
 Fri, 15 Aug 2025 22:41:27 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-45a1b0cd668so11569915e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 13:41:27 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3bb5d089e07sm3153924f8f.0.2025.08.15.13.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Aug 2025 13:41:26 -0700 (PDT)
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
X-Inumbo-ID: 376d5f8f-7a18-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755290487; x=1755895287; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXNyVngOEhOHNH/b7q938K73j9wIxC+b5U4uBb+L+Oc=;
        b=LVmwXDOuKOIGG1nmVGi3isqu3JBt8oPlHVoQNh8qP6VWUyg/nIPGE1mXsODDvfq7jJ
         V8ji6hhgFyZ4BOCBk7VNLt9Llr1Ql9HAJob5j43boW08inR60LP+/goUofTlenoxblgE
         hzJELlf2HYaMY4/9XJyJ8W83UGTJzLTQCQ7Oc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755290487; x=1755895287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXNyVngOEhOHNH/b7q938K73j9wIxC+b5U4uBb+L+Oc=;
        b=DXTO+LLzAC8ZwB8rRrU6WSbarY2MmZTTjUDhTKGra2aUngZXmFNG2UYUVXC5hFdDU0
         ySWAyGH7bCIJ2OlcZxwAnq5OcQPx5PVW5EzIe8jHrcPqCN2XAffBFdnvQ8FuIHFAwl8H
         X4aC0fahsIyoLfD/nU2W4buiXkNzyR0+sSmEj2CxctTmDQtYiJBseAyyZ84fO2v8Ucrm
         d3PkM8F0rgnlGZ2YPUt0lP98a5hpThR+3GloSj1hSR1KWEMurbNFhIAcZzLgrz4T93JH
         1dKVQ6DK4eBemzWjGC3bGJp9gpomgKnRSS0GuD1pWWHNe0bhJ9IbO59UxVQi0yZyVwI7
         yy3g==
X-Gm-Message-State: AOJu0YwHCwzL5ZIkMu1gdebd6xJVR17zHTN3gLgf/OrZDs09/0Wnn2Cg
	+MlAiXcOOOiPsGI/NbyGwrrsjYjWCcOe9g5T7ZTnG1kc84XRBxrWin5pelIkTg/PaZkWECwBZCg
	qFjFe
X-Gm-Gg: ASbGncs6jE0eSiU8WD58KZm5JvEx4JcWhacBuSopuq5ekrImHXIcj3wMFbbZuXTLzwT
	SyywleQW9d/Ob+FRORTPL8Kh9EU4u+oor7C13ngyoI6uejy2PUc8NpotTtPMaatpXiH9IevKbER
	PqCnWynOV4GyqwB79aUR1dnZS13MgVS3T/YdvBwKcBdl9gGYZ/fExM53pdA/HLQMUt4t4VPnM5C
	wRu5Lm+BSK03Kard7zPpvWJm8ipEd53HBSYBjCMrfS7zFo8pEPeEZ7QmhcdEDnt/HAxFQk9A/gO
	wWMhCzHWXHCIU6Wc24e/4USJWF9kJmKU6tlh8qva5Mr20xhEk/uD5ucvgZqXYjsIM45ivtO66dq
	IlCP4gw7gBl9/UOuMdhU20IW9BIFo1DN97nKh8UHBlxpFEWLpZHszhftCJR3xuZZs7nzGH7mgv/
	Wy
X-Google-Smtp-Source: AGHT+IERbAFAL3Ci1q7SYpibLQpNPLvDtFGVRZkn2GMM5I+jZ7s5bpsYM73D0whD2jnzaR8gVXSR4w==
X-Received: by 2002:a05:600c:1e03:b0:450:d3b9:4ba4 with SMTP id 5b1f17b1804b1-45a21d49bcemr31971645e9.2.1755290486820;
        Fri, 15 Aug 2025 13:41:26 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 08/16] x86: Clean up asm/time.h
Date: Fri, 15 Aug 2025 21:41:09 +0100
Message-Id: <20250815204117.3312742-9-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With asm/tsc.h split out, asm/time.h shouldn't be including asm/msr.h, but it
turns out that an outrageous number of files (even some headers) are pulling
their dependentices transitively through asm/time.h -> asm/msr.h

Most are asm/msr{,-index}.h, but in some cases it's printk(), va_args, and
even PRIxxx macros.

Give asm/time.h an SPDX tag, and strip trailing whitespace.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

Randconfig in CI has stopped finding new issues, but there's a reasonable risk
that more is still lurking.

ubsan.c needing asm/processor.h isn't good but it does work with all 4
architectures right now.  We really ought to have dump_execution_state()
somewhere more common.
---
 xen/arch/x86/acpi/cpufreq/acpi.c    |  3 ++-
 xen/arch/x86/acpi/cpufreq/cpufreq.c |  3 +++
 xen/arch/x86/cpu/mcheck/mce.h       |  1 +
 xen/arch/x86/debug.c                |  1 +
 xen/arch/x86/guest/hyperv/hyperv.c  |  1 +
 xen/arch/x86/hvm/ioreq.c            |  1 +
 xen/arch/x86/hvm/vmx/vvmx.c         |  1 +
 xen/arch/x86/include/asm/hvm/hvm.h  |  1 +
 xen/arch/x86/include/asm/time.h     | 12 ++++++------
 xen/arch/x86/machine_kexec.c        |  1 +
 xen/arch/x86/psr.c                  |  2 ++
 xen/arch/x86/tboot.c                |  1 +
 xen/arch/x86/xstate.c               |  1 +
 xen/common/efi/runtime.c            |  1 +
 xen/common/ubsan/ubsan.c            |  2 ++
 xen/drivers/acpi/apei/apei-base.c   |  1 +
 xen/drivers/acpi/tables/tbfadt.c    |  2 ++
 xen/drivers/acpi/utilities/utmisc.c |  3 +++
 xen/lib/x86/private.h               |  2 +-
 19 files changed, 32 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/acpi/cpufreq/acpi.c b/xen/arch/x86/acpi/cpufreq/acpi.c
index b81f2afc9b9b..567c10dd0643 100644
--- a/xen/arch/x86/acpi/cpufreq/acpi.c
+++ b/xen/arch/x86/acpi/cpufreq/acpi.c
@@ -14,7 +14,8 @@
 #include <xen/delay.h>
 #include <xen/errno.h>
 #include <xen/param.h>
-#include <xen/types.h>
+
+#include <asm/msr.h>
 
 #include <acpi/acpi.h>
 #include <acpi/cpufreq/cpufreq.h>
diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/cpufreq/cpufreq.c
index 45f301f354ac..d18735c7ae1b 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -30,6 +30,9 @@
 #include <xen/errno.h>
 #include <xen/param.h>
 #include <xen/sched.h>
+
+#include <asm/msr.h>
+
 #include <acpi/cpufreq/cpufreq.h>
 
 struct acpi_cpufreq_data *cpufreq_drv_data[NR_CPUS];
diff --git a/xen/arch/x86/cpu/mcheck/mce.h b/xen/arch/x86/cpu/mcheck/mce.h
index 6157a41aaeea..aa00e94cb5b1 100644
--- a/xen/arch/x86/cpu/mcheck/mce.h
+++ b/xen/arch/x86/cpu/mcheck/mce.h
@@ -8,6 +8,7 @@
 #include <xen/smp.h>
 
 #include <asm/atomic.h>
+#include <asm/msr.h>
 #include <asm/traps.h>
 
 #include "x86_mca.h"
diff --git a/xen/arch/x86/debug.c b/xen/arch/x86/debug.c
index 11b0a7e5475a..037f97d6f17b 100644
--- a/xen/arch/x86/debug.c
+++ b/xen/arch/x86/debug.c
@@ -10,6 +10,7 @@
 #include <asm/current.h>
 #include <asm/debugreg.h>
 #include <asm/guest-msr.h>
+#include <asm/msr.h>
 
 /*
  * Merge new bits into dr6.  'new' is always given in positive polarity,
diff --git a/xen/arch/x86/guest/hyperv/hyperv.c b/xen/arch/x86/guest/hyperv/hyperv.c
index 6989af38f180..90757e079362 100644
--- a/xen/arch/x86/guest/hyperv/hyperv.c
+++ b/xen/arch/x86/guest/hyperv/hyperv.c
@@ -12,6 +12,7 @@
 #include <asm/fixmap.h>
 #include <asm/guest.h>
 #include <asm/guest/hyperv-tlfs.h>
+#include <asm/msr.h>
 #include <asm/processor.h>
 
 #include "private.h"
diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index 98b0dd7972c2..d79a1a23655e 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -20,6 +20,7 @@
 #include <asm/hvm/emulate.h>
 #include <asm/hvm/hvm.h>
 #include <asm/hvm/vmx/vmx.h>
+#include <asm/msr.h>
 
 #include <public/hvm/ioreq.h>
 #include <public/hvm/params.h>
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index 6201665d9f4c..e4f3a5fe4c71 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -15,6 +15,7 @@
 #include <asm/hvm/support.h>
 #include <asm/hvm/vmx/vmx.h>
 #include <asm/hvm/vmx/vvmx.h>
+#include <asm/msr.h>
 #include <asm/mtrr.h>
 #include <asm/p2m.h>
 
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 228f47dbde8b..5c5a790f9e41 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -15,6 +15,7 @@
 #include <asm/asm_defns.h>
 #include <asm/current.h>
 #include <asm/hvm/asid.h>
+#include <asm/msr-index.h>
 #include <asm/x86_emulate.h>
 
 struct pirq; /* needed by pi_update_irte */
diff --git a/xen/arch/x86/include/asm/time.h b/xen/arch/x86/include/asm/time.h
index c55b69831448..e474a76e64df 100644
--- a/xen/arch/x86/include/asm/time.h
+++ b/xen/arch/x86/include/asm/time.h
@@ -1,8 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef X86_TIME_H
+#define X86_TIME_H
 
-#ifndef __X86_TIME_H__
-#define __X86_TIME_H__
-
-#include <asm/msr.h>
 #include <asm/tsc.h>
 
 typedef u64 cycles_t;
@@ -38,6 +37,7 @@ uint64_t cf_check acpi_pm_tick_to_ns(uint64_t ticks);
 
 uint64_t tsc_ticks2ns(uint64_t ticks);
 
+struct cpu_user_regs;
 uint64_t pv_soft_rdtsc(const struct vcpu *v, const struct cpu_user_regs *regs);
 uint64_t gtime_to_gtsc(const struct domain *d, uint64_t time);
 uint64_t gtsc_to_gtime(const struct domain *d, uint64_t tsc);
@@ -47,7 +47,7 @@ int tsc_set_info(struct domain *d, uint32_t tsc_mode, uint64_t elapsed_nsec,
 
 void tsc_get_info(struct domain *d, uint32_t *tsc_mode, uint64_t *elapsed_nsec,
                   uint32_t *gtsc_khz, uint32_t *incarnation);
-   
+
 
 void force_update_vcpu_system_time(struct vcpu *v);
 
@@ -93,4 +93,4 @@ u64 scale_delta(u64 delta, const struct time_scale *scale);
 #define PIT_STATUS_NULL_COUNT (1 << 6)
 /* Lower bits match Timer Control Word. */
 
-#endif /* __X86_TIME_H__ */
+#endif /* X86_TIME_H */
diff --git a/xen/arch/x86/machine_kexec.c b/xen/arch/x86/machine_kexec.c
index 35fa5c82e9c2..f921eec5aae6 100644
--- a/xen/arch/x86/machine_kexec.c
+++ b/xen/arch/x86/machine_kexec.c
@@ -24,6 +24,7 @@
 #include <asm/hpet.h>
 #include <asm/idt.h>
 #include <asm/machine_kexec.h>
+#include <asm/msr.h>
 #include <asm/page.h>
 
 /*
diff --git a/xen/arch/x86/psr.c b/xen/arch/x86/psr.c
index 499d320e6163..9c7aab9f4021 100644
--- a/xen/arch/x86/psr.c
+++ b/xen/arch/x86/psr.c
@@ -18,6 +18,8 @@
 #include <xen/init.h>
 #include <xen/param.h>
 #include <xen/sched.h>
+
+#include <asm/msr.h>
 #include <asm/psr.h>
 
 /*
diff --git a/xen/arch/x86/tboot.c b/xen/arch/x86/tboot.c
index 319116857d4a..9d9bb6e7cf6d 100644
--- a/xen/arch/x86/tboot.c
+++ b/xen/arch/x86/tboot.c
@@ -11,6 +11,7 @@
 
 #include <asm/e820.h>
 #include <asm/fixmap.h>
+#include <asm/msr.h>
 #include <asm/page.h>
 #include <asm/processor.h>
 #include <asm/setup.h>
diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index f6d677eb121d..e990abc9d18c 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -14,6 +14,7 @@
 #include <asm/cpu-policy.h>
 #include <asm/current.h>
 #include <asm/i387.h>
+#include <asm/msr.h>
 #include <asm/processor.h>
 #include <asm/xstate.h>
 
diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
index 7e1fce291d92..42386c6bde42 100644
--- a/xen/common/efi/runtime.c
+++ b/xen/common/efi/runtime.c
@@ -33,6 +33,7 @@ void efi_rs_leave(struct efi_rs_state *state);
 
 #ifndef CONFIG_ARM
 # include <asm/i387.h>
+# include <asm/msr.h>
 # include <asm/xstate.h>
 # include <public/platform.h>
 #endif
diff --git a/xen/common/ubsan/ubsan.c b/xen/common/ubsan/ubsan.c
index 20aa0cb598e1..15ae34816412 100644
--- a/xen/common/ubsan/ubsan.c
+++ b/xen/common/ubsan/ubsan.c
@@ -16,6 +16,8 @@
 #include <xen/percpu.h>
 #include <xen/spinlock.h>
 
+#include <asm/processor.h>
+
 #define __noreturn    noreturn
 #define pr_err(...) printk(XENLOG_ERR __VA_ARGS__)
 struct xen_ubsan { int in_ubsan; };
diff --git a/xen/drivers/acpi/apei/apei-base.c b/xen/drivers/acpi/apei/apei-base.c
index 4fe99573a220..1722698ba675 100644
--- a/xen/drivers/acpi/apei/apei-base.c
+++ b/xen/drivers/acpi/apei/apei-base.c
@@ -36,6 +36,7 @@
 #include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/kernel.h>
+#include <xen/lib.h>
 #include <xen/spinlock.h>
 #include <xen/string.h>
 
diff --git a/xen/drivers/acpi/tables/tbfadt.c b/xen/drivers/acpi/tables/tbfadt.c
index a03836e0dc8a..32678700bdc8 100644
--- a/xen/drivers/acpi/tables/tbfadt.c
+++ b/xen/drivers/acpi/tables/tbfadt.c
@@ -42,6 +42,8 @@
  */
 
 #include <xen/init.h>
+#include <xen/inttypes.h>
+
 #include <acpi/acpi.h>
 #include <acpi/actables.h>
 
diff --git a/xen/drivers/acpi/utilities/utmisc.c b/xen/drivers/acpi/utilities/utmisc.c
index ee22c83e3842..b7756e4ebf29 100644
--- a/xen/drivers/acpi/utilities/utmisc.c
+++ b/xen/drivers/acpi/utilities/utmisc.c
@@ -42,6 +42,9 @@
  */
 
 #include <xen/init.h>
+#include <xen/lib.h>
+#include <xen/stdarg.h>
+
 #include <acpi/acpi.h>
 
 #define _COMPONENT          ACPI_UTILITIES
diff --git a/xen/lib/x86/private.h b/xen/lib/x86/private.h
index 60bb82a400b7..aedd8e482121 100644
--- a/xen/lib/x86/private.h
+++ b/xen/lib/x86/private.h
@@ -10,7 +10,7 @@
 #include <xen/nospec.h>
 #include <xen/types.h>
 
-#include <asm/msr-index.h>
+#include <asm/msr.h>
 
 #define copy_to_buffer_offset copy_to_guest_offset
 #define copy_from_buffer_offset copy_from_guest_offset
-- 
2.39.5


