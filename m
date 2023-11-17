Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 996C37EF292
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 13:25:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635115.990917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3xu3-0002B7-5i; Fri, 17 Nov 2023 12:24:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635115.990917; Fri, 17 Nov 2023 12:24:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3xu3-000294-0t; Fri, 17 Nov 2023 12:24:55 +0000
Received: by outflank-mailman (input) for mailman id 635115;
 Fri, 17 Nov 2023 12:24:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c3wv=G6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r3xu1-0000ZQ-3D
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 12:24:53 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ef436a2-8544-11ee-98dc-6d05b1d4d9a1;
 Fri, 17 Nov 2023 13:24:52 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-507a62d4788so2777331e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 17 Nov 2023 04:24:52 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a18-20020ac25e72000000b005094d95e8bcsm209811lfr.218.2023.11.17.04.24.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 04:24:50 -0800 (PST)
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
X-Inumbo-ID: 4ef436a2-8544-11ee-98dc-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700223891; x=1700828691; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CmF4A4d7FVu2Lm9OasCXvIiEmLVAs/RA3iaDX7HMtUc=;
        b=b+I2yTAKSwoQRzMOLIdTdSxjL2yNH2QjzoBAMBxLSg6d3L68T33hElYE68UnA6ZI45
         FzMvazIh023YMv7EMjjZSiLhtEkDn/lwAdVE/s7qYIQVJW3YkJ036UM2gmt4KqmsVObb
         W/MemWCl3ISFhtzN/Y/ULZX8hJEN7k8llrWJZoHrpG7kdaUujoDBeBpNOWMJ3bdVPbMJ
         d09vPcfDCT2UBMnMBiJH+E8UKsJCJTTG2iums3sN7Cw2WGV1lAEcnFihZ6TQFBMCXeBk
         5x3b6APt9U1TbASc/WV1FBXgV88pROZCFYgJLExh30YNIIdlkeJqIfJGO0CDkCThULG+
         uiOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700223891; x=1700828691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CmF4A4d7FVu2Lm9OasCXvIiEmLVAs/RA3iaDX7HMtUc=;
        b=mvyPq1rw3XVZTIVkF8BZRi6U2Ulbeks2WmwJF904QOiGr0T1WfdnQJYfv5Ofs1QHwR
         ZGBc84EygCzzrHcVT1IbpZ5+nMlGkNP2CPUfU7hRV0pg414PeqjBgFfLRtSf6M8z+TUQ
         llDvxgztTftOIOUINwb+mOoCh2Y7sxP8j8JUCVgQUQGNtU0CX5j4sQbBMkoM7Gk6GudZ
         pzOK5C2DgMTRpOu/SYS5aAenVtmRL8bJWJrwHparRxrBH2MaXMWuaTH7F6VYS02c/O7S
         poEleg8UlbcLRo4mwjtl/Ogt+a/0u5X0DLGQhJXL19DsKYIpK2mLribvhZNWSBvTOqsp
         m1lA==
X-Gm-Message-State: AOJu0YyqXlgJ0ERJ/r8HTDufVtjExLlrbr9ZeRYfentqKfYu3XG3Nhej
	Vst4S37bYqQ4SEb4Oh5TzR07Bw9FyOQ=
X-Google-Smtp-Source: AGHT+IEMNUY2VtMbTfqAN5gjDSjk+v1jx+g+65pLhs0lhW5GsA9mnX6iU7yUHbyRmcVc4Cxu3P2IjA==
X-Received: by 2002:a05:6512:41c:b0:509:2b81:fc40 with SMTP id u28-20020a056512041c00b005092b81fc40mr12290127lfk.9.1700223891250;
        Fri, 17 Nov 2023 04:24:51 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 06/14] xen/asm-generic: introduce generic header percpu.h
Date: Fri, 17 Nov 2023 14:24:30 +0200
Message-ID: <51ce486a825a1654998db01c4e07c127e4b1b38b.1700221559.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1700221559.git.oleksii.kurochko@gmail.com>
References: <cover.1700221559.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces generic percpu.h which was based on Arm's version
with the following changes:
 * makes __per_cpu_data_end[] constant
 * introduce get_per_cpu_offset() for macros this_cpu() and this_cpu_ptr()
 * add inclustion of <asm/current.h> as get_per_cpu_offset() is located there.

Also it was changed a place where <asm/percpu.h> is included in <xen/percpu.h>
because asm-generic version of percpu.h started to include <asm/current.h> which
requires definition of DECLARE_PER_CPU.

As well the patch switches Arm, PPC and x86 architectures to use asm-generic
version of percpu.h.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
 - switch all architectures to asm-generic version of percpu.h
 - introduce get_per_cpu_offset() and implement it architectures.
 - make __per_cpu_data_end constamt.
 - update the commit message.
---
Changes in V2:
	- use smp_processor_id() instead of get_processor_id().
 	- update commit message .
---
 xen/arch/arm/include/asm/Makefile             |  1 +
 xen/arch/arm/include/asm/current.h            |  3 +++
 xen/arch/ppc/include/asm/Makefile             |  1 +
 xen/arch/ppc/include/asm/current.h            |  6 +++++
 xen/arch/ppc/include/asm/percpu.h             | 24 -------------------
 xen/arch/x86/include/asm/Makefile             |  2 ++
 xen/arch/x86/include/asm/current.h            |  2 ++
 xen/arch/x86/include/asm/percpu.h             | 22 -----------------
 .../asm => include/asm-generic}/percpu.h      | 18 ++++++++------
 xen/include/xen/percpu.h                      |  4 ++--
 10 files changed, 28 insertions(+), 55 deletions(-)
 delete mode 100644 xen/arch/ppc/include/asm/percpu.h
 create mode 100644 xen/arch/x86/include/asm/Makefile
 delete mode 100644 xen/arch/x86/include/asm/percpu.h
 rename xen/{arch/arm/include/asm => include/asm-generic}/percpu.h (57%)

diff --git a/xen/arch/arm/include/asm/Makefile b/xen/arch/arm/include/asm/Makefile
index cac6d5e3df..3faf1251ec 100644
--- a/xen/arch/arm/include/asm/Makefile
+++ b/xen/arch/arm/include/asm/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 generic-y += iocap.h
 generic-y += paging.h
+generic-y += percpu.h
 generic-y += random.h
 generic-y += vm_event.h
diff --git a/xen/arch/arm/include/asm/current.h b/xen/arch/arm/include/asm/current.h
index 51d1c8efa8..0be7ad6ef9 100644
--- a/xen/arch/arm/include/asm/current.h
+++ b/xen/arch/arm/include/asm/current.h
@@ -5,6 +5,7 @@
 #include <xen/percpu.h>
 
 #include <asm/processor.h>
+#include <asm/sysregs.h>
 
 /* Tell whether the guest vCPU enabled Workaround 2 (i.e variant 4) */
 #define CPUINFO_WORKAROUND_2_FLAG_SHIFT   0
@@ -60,6 +61,8 @@ do {                                                    \
     this_cpu(cpu_id) = (id);                            \
 } while ( 0 )
 
+#define get_per_cpu_offset()  READ_SYSREG(TPIDR_EL2)
+
 #endif
 
 #endif /* __ARM_CURRENT_H__ */
diff --git a/xen/arch/ppc/include/asm/Makefile b/xen/arch/ppc/include/asm/Makefile
index d8f2a1453c..c0badf5717 100644
--- a/xen/arch/ppc/include/asm/Makefile
+++ b/xen/arch/ppc/include/asm/Makefile
@@ -2,5 +2,6 @@
 generic-y += hypercall.h
 generic-y += iocap.h
 generic-y += paging.h
+generic-y += percpu.h
 generic-y += random.h
 generic-y += vm_event.h
diff --git a/xen/arch/ppc/include/asm/current.h b/xen/arch/ppc/include/asm/current.h
index 0ca06033f9..3d0d316bae 100644
--- a/xen/arch/ppc/include/asm/current.h
+++ b/xen/arch/ppc/include/asm/current.h
@@ -4,6 +4,8 @@
 
 #include <xen/percpu.h>
 
+#include <asm/processor.h>
+
 #ifndef __ASSEMBLY__
 
 struct vcpu;
@@ -38,6 +40,10 @@ static inline struct cpu_info *get_cpu_info(void)
 
 #define guest_cpu_user_regs() (&get_cpu_info()->guest_cpu_user_regs)
 
+#define smp_processor_id()      0 /* TODO: Fix this */
+
+#define get_per_cpu_offset()    smp_processor_id()
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* __ASM_PPC_CURRENT_H__ */
diff --git a/xen/arch/ppc/include/asm/percpu.h b/xen/arch/ppc/include/asm/percpu.h
deleted file mode 100644
index e7c40c0f03..0000000000
--- a/xen/arch/ppc/include/asm/percpu.h
+++ /dev/null
@@ -1,24 +0,0 @@
-#ifndef __PPC_PERCPU_H__
-#define __PPC_PERCPU_H__
-
-#ifndef __ASSEMBLY__
-
-extern char __per_cpu_start[], __per_cpu_data_end[];
-extern unsigned long __per_cpu_offset[NR_CPUS];
-void percpu_init_areas(void);
-
-#define smp_processor_id() 0 /* TODO: Fix this */
-
-#define per_cpu(var, cpu)  \
-    (*RELOC_HIDE(&per_cpu__##var, __per_cpu_offset[cpu]))
-#define this_cpu(var) \
-    (*RELOC_HIDE(&per_cpu__##var, smp_processor_id()))
-
-#define per_cpu_ptr(var, cpu)  \
-    (*RELOC_HIDE(var, __per_cpu_offset[cpu]))
-#define this_cpu_ptr(var) \
-    (*RELOC_HIDE(var, smp_processor_id()))
-
-#endif
-
-#endif /* __PPC_PERCPU_H__ */
diff --git a/xen/arch/x86/include/asm/Makefile b/xen/arch/x86/include/asm/Makefile
new file mode 100644
index 0000000000..874429ed30
--- /dev/null
+++ b/xen/arch/x86/include/asm/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+generic-y += percpu.h
diff --git a/xen/arch/x86/include/asm/current.h b/xen/arch/x86/include/asm/current.h
index 35cca5cbe4..10950f36cc 100644
--- a/xen/arch/x86/include/asm/current.h
+++ b/xen/arch/x86/include/asm/current.h
@@ -102,6 +102,8 @@ static inline struct cpu_info *get_cpu_info(void)
 #define smp_processor_id()    (get_cpu_info()->processor_id)
 #define guest_cpu_user_regs() (&get_cpu_info()->guest_cpu_user_regs)
 
+#define get_per_cpu_offset()  (get_cpu_info()->per_cpu_offset)
+
 /*
  * Get the bottom-of-stack, as stored in the per-CPU TSS. This actually points
  * into the middle of cpu_info.guest_cpu_user_regs, at the section that
diff --git a/xen/arch/x86/include/asm/percpu.h b/xen/arch/x86/include/asm/percpu.h
deleted file mode 100644
index 2b0c29a233..0000000000
--- a/xen/arch/x86/include/asm/percpu.h
+++ /dev/null
@@ -1,22 +0,0 @@
-#ifndef __X86_PERCPU_H__
-#define __X86_PERCPU_H__
-
-#ifndef __ASSEMBLY__
-extern char __per_cpu_start[], __per_cpu_data_end[];
-extern unsigned long __per_cpu_offset[NR_CPUS];
-void percpu_init_areas(void);
-#endif
-
-/* var is in discarded region: offset to particular copy we want */
-#define per_cpu(var, cpu)  \
-    (*RELOC_HIDE(&per_cpu__##var, __per_cpu_offset[cpu]))
-#define this_cpu(var) \
-    (*RELOC_HIDE(&per_cpu__##var, get_cpu_info()->per_cpu_offset))
-
-#define this_cpu_ptr(var) \
-    (*RELOC_HIDE(var, get_cpu_info()->per_cpu_offset))
-
-#define per_cpu_ptr(var, cpu)  \
-    (*RELOC_HIDE(var, __per_cpu_offset[cpu]))
-
-#endif /* __X86_PERCPU_H__ */
diff --git a/xen/arch/arm/include/asm/percpu.h b/xen/include/asm-generic/percpu.h
similarity index 57%
rename from xen/arch/arm/include/asm/percpu.h
rename to xen/include/asm-generic/percpu.h
index f1a8768080..60af4f9ff9 100644
--- a/xen/arch/arm/include/asm/percpu.h
+++ b/xen/include/asm-generic/percpu.h
@@ -1,28 +1,32 @@
-#ifndef __ARM_PERCPU_H__
-#define __ARM_PERCPU_H__
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_PERCPU_H__
+#define __ASM_GENERIC_PERCPU_H__
 
 #ifndef __ASSEMBLY__
 
 #include <xen/types.h>
-#include <asm/sysregs.h>
+#include <asm/current.h>
 
-extern char __per_cpu_start[], __per_cpu_data_end[];
+extern char __per_cpu_start[];
+extern const char __per_cpu_data_end[];
 extern unsigned long __per_cpu_offset[NR_CPUS];
 void percpu_init_areas(void);
 
 #define per_cpu(var, cpu)  \
     (*RELOC_HIDE(&per_cpu__##var, __per_cpu_offset[cpu]))
+
 #define this_cpu(var) \
-    (*RELOC_HIDE(&per_cpu__##var, READ_SYSREG(TPIDR_EL2)))
+    (*RELOC_HIDE(&per_cpu__##var, get_per_cpu_offset()))
 
 #define per_cpu_ptr(var, cpu)  \
     (*RELOC_HIDE(var, __per_cpu_offset[cpu]))
 #define this_cpu_ptr(var) \
-    (*RELOC_HIDE(var, READ_SYSREG(TPIDR_EL2)))
+    (*RELOC_HIDE(var, get_per_cpu_offset()))
 
 #endif
 
-#endif /* __ARM_PERCPU_H__ */
+#endif /* __ASM_GENERIC_PERCPU_H__ */
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/xen/percpu.h b/xen/include/xen/percpu.h
index c7bf57cbcd..57522f346b 100644
--- a/xen/include/xen/percpu.h
+++ b/xen/include/xen/percpu.h
@@ -1,8 +1,6 @@
 #ifndef __XEN_PERCPU_H__
 #define __XEN_PERCPU_H__
 
-#include <asm/percpu.h>
-
 #define DECLARE_PER_CPU(type, name) \
     extern __typeof__(type) per_cpu__ ## name
 
@@ -29,6 +27,8 @@
 
 #define get_per_cpu_var(var)  (per_cpu__##var)
 
+#include <asm/percpu.h>
+
 /* Linux compatibility. */
 #define get_cpu_var(var) this_cpu(var)
 #define put_cpu_var(var)
-- 
2.41.0


