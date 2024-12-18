Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AB69F6630
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 13:49:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860360.1272381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNtUA-0002PH-1R; Wed, 18 Dec 2024 12:49:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860360.1272381; Wed, 18 Dec 2024 12:49:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNtU9-0002MN-Ui; Wed, 18 Dec 2024 12:49:05 +0000
Received: by outflank-mailman (input) for mailman id 860360;
 Wed, 18 Dec 2024 12:49:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xglw=TL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tNtU8-0002MF-7B
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 12:49:04 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75b75e50-bd3e-11ef-a0d6-8be0dac302b0;
 Wed, 18 Dec 2024 13:49:03 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-aa543c4db92so13017466b.0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2024 04:49:03 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab96087b41sm550388966b.87.2024.12.18.04.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 04:49:01 -0800 (PST)
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
X-Inumbo-ID: 75b75e50-bd3e-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734526142; x=1735130942; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ECBT7XQea3ud/yVLfGyT/XfYKCyUP/SbpIhDz6Y3eF4=;
        b=IxHkks3pQ/Gqzn3Ghh3pm9oHyY404WfvbN/4N3W+fAnk4bgedPxJd+a/81hEIdySRv
         vPwfrMa8BY4BQSRspXQ6wMylhz2QWN+VNPLDfixJRyZwQR5Bkp1ckfTJY/ixDA6IcBNH
         88b0tF4j1+9fBn+VXFDorW88V8NFbyl4UJjRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734526142; x=1735130942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ECBT7XQea3ud/yVLfGyT/XfYKCyUP/SbpIhDz6Y3eF4=;
        b=SSw0exnRJpomtd50mLohneRVuxLoJ2rkLCx8vWCsKSKKIYETIVCvS203fluT/9/+P6
         isHN3orNWb4gFPuV1f92/Ei540xksyYZQf+CAPPVWhUs3ThVLMw4IT6rlXHuUjzl8kfI
         e8hITV+2sH8J2qTVQFhstZ+7Yl4Zx4vN2/I5N9AS3avJrH4HcRNhz7pATz2jOzw2y9r6
         RP5Q2MWelk+dEy1OuqBVi1wxZGy8x/XJS3izlmPKCEQoHJBDBzLyKk+Z57NcgXvRdtr8
         FdydlaHoky1f9l6S7Fg8XRDbDDFL7XIKh5lHaDhChl/2LKOCM4nCAEsazFrvp6hXQDJl
         jA0w==
X-Gm-Message-State: AOJu0YzUISqubYadt4AXOYLZG/+46E7x8rpAIYAQ9XpR0i/uE/5gwajd
	+OSl3LJ3arjWFX00EAQkhSNXcjQub7IyOafpfViCLucNHxbuYDLOnjj1bCFdTvwmJxypCnsO7k1
	13pY=
X-Gm-Gg: ASbGncv118Vt6CHbUKxdvVvtctPXEQFh2Vbh09zP+sUoTyLXeyx6URflzOBNjbglFhA
	F5LnqIKmaColp91vkEZxti3mc5RnDn1OjSfvnmDZBCAcS+dEZaMuBjXIjt9UgOF0gUwqo+vb3G4
	PmHDy6EHDr8GQDPqFh1zvLjEr4Efmm81RclRchNfIocyY4eiufWt/cXoW1dbKdFHh1Q3eQo53xM
	+WK3NEbdr8FwHFWbV8TQr6KK4I3PdCn5d4/XwS6Yequ0JA9UqP3PvdRlMRTVmCfftfzlELCvhk0
	MWGN50Ro6RYmrJ1xySqFrdCSM9zDp3zg5eRQ
X-Google-Smtp-Source: AGHT+IFDESo+jhssZfxr8FAnOXlH8RtC8DVz39/Lb28PJg08KVN4PS8UwYuJIdcr1fDHan+HnQYCQw==
X-Received: by 2002:a17:906:bfea:b0:aa6:668b:2733 with SMTP id a640c23a62f3a-aabf47d7f69mr196732066b.33.1734526141921;
        Wed, 18 Dec 2024 04:49:01 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] xen/sched: Untangle credit2 vs cpu_nr_siblings()
Date: Wed, 18 Dec 2024 12:49:00 +0000
Message-Id: <20241218124900.60886-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Credit2 has no buisness including asm/cpufeature.h or asm/processor.h.

This was caused by a bad original abstraction, and an even less wise attempt
to fix the build on my behalf.  It is also the sole reason why PPC and RISC-V
need cpufeature.h header.

Worst of all, cpu_data[cpu].x86_num_siblings doesn't even have the same
meaning between vendors on x86 CPUS.

Implement cpu_nr_siblings() locally in credit2.c, leaving behind a TODO.  Drop
the stub from each architecture.

Fixes: 8e2aa76dc167 ("xen: credit2: limit the max number of CPUs in a runqueue")
Fixes: ad33a573c009 ("xen/credit2: Fix build following c/s 8e2aa76dc (take 2)")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: Juergen Gross <jgross@suse.com>
---
 xen/arch/arm/include/asm/cpufeature.h   |  5 -----
 xen/arch/ppc/include/asm/cpufeature.h   | 10 ----------
 xen/arch/riscv/include/asm/cpufeature.h | 23 -----------------------
 xen/arch/x86/include/asm/processor.h    |  5 -----
 xen/common/sched/credit2.c              | 15 +++++++++++++--
 5 files changed, 13 insertions(+), 45 deletions(-)
 delete mode 100644 xen/arch/ppc/include/asm/cpufeature.h
 delete mode 100644 xen/arch/riscv/include/asm/cpufeature.h

diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
index 969e043f5bda..50297e53d90e 100644
--- a/xen/arch/arm/include/asm/cpufeature.h
+++ b/xen/arch/arm/include/asm/cpufeature.h
@@ -98,11 +98,6 @@ static inline bool cpus_have_cap(unsigned int num)
     return test_bit(num, cpu_hwcaps);
 }
 
-static inline int cpu_nr_siblings(unsigned int cpu)
-{
-    return 1;
-}
-
 /* System capability check for constant cap */
 #define cpus_have_const_cap(num) ({                 \
         register_t __ret;                           \
diff --git a/xen/arch/ppc/include/asm/cpufeature.h b/xen/arch/ppc/include/asm/cpufeature.h
deleted file mode 100644
index 1c5946512bc5..000000000000
--- a/xen/arch/ppc/include/asm/cpufeature.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_PPC_CPUFEATURE_H__
-#define __ASM_PPC_CPUFEATURE_H__
-
-static inline int cpu_nr_siblings(unsigned int cpu)
-{
-    return 1;
-}
-
-#endif /* __ASM_PPC_CPUFEATURE_H__ */
diff --git a/xen/arch/riscv/include/asm/cpufeature.h b/xen/arch/riscv/include/asm/cpufeature.h
deleted file mode 100644
index 41a792b0b273..000000000000
--- a/xen/arch/riscv/include/asm/cpufeature.h
+++ /dev/null
@@ -1,23 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef ASM__RISCV__CPUFEATURE_H
-#define ASM__RISCV__CPUFEATURE_H
-
-#ifndef __ASSEMBLY__
-
-static inline unsigned int cpu_nr_siblings(unsigned int cpu)
-{
-    return 1;
-}
-
-#endif /* __ASSEMBLY__ */
-
-#endif /* ASM__RISCV__CPUFEATURE_H */
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index 877651212273..d247ef8dd226 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -118,11 +118,6 @@ extern void init_intel_cacheinfo(struct cpuinfo_x86 *c);
 
 unsigned int apicid_to_socket(unsigned int apicid);
 
-static inline int cpu_nr_siblings(unsigned int cpu)
-{
-    return cpu_data[cpu].x86_num_siblings;
-}
-
 /* Some CPUID calls want 'count' to be placed in ecx */
 static inline void cpuid_count(
     unsigned int op,
diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 76a273d4f6d5..4b2ef034ca84 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -26,8 +26,6 @@
 #include <xen/trace.h>
 #include <xen/cpu.h>
 #include <xen/keyhandler.h>
-#include <asm/cpufeature.h>
-#include <asm/processor.h>
 
 #include "private.h"
 
@@ -35,6 +33,19 @@
 /* #define d2printk printk */
 #define d2printk(x...)
 
+/*
+ * TODO: Abstract this properly, and figure out what Credit2 wants to do with
+ *       the fact that x86_num_siblings doesn't even have the same meaning
+ *       between x86 vendors.
+ */
+static unsigned int cpu_nr_siblings(unsigned int cpu)
+{
+#ifdef CONFIG_X86
+    return cpu_data[cpu].x86_num_siblings;
+#else
+    return 1;
+#endif
+}
 
 /*
  * Credit2 tracing events ("only" 512 available!). Check
-- 
2.39.5


