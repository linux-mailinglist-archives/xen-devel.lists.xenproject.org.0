Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9A6B2873A
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 22:41:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083884.1443328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un1Es-0005Tx-2E; Fri, 15 Aug 2025 20:41:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083884.1443328; Fri, 15 Aug 2025 20:41:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un1Er-0005SL-RN; Fri, 15 Aug 2025 20:41:25 +0000
Received: by outflank-mailman (input) for mailman id 1083884;
 Fri, 15 Aug 2025 20:41:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oFbR=23=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1un1Eq-0005E7-25
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 20:41:24 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35163475-7a18-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 22:41:23 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3b9d41cd38dso1675740f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 13:41:23 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3bb5d089e07sm3153924f8f.0.2025.08.15.13.41.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Aug 2025 13:41:22 -0700 (PDT)
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
X-Inumbo-ID: 35163475-7a18-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755290483; x=1755895283; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=paeLb+OeWm7Kh4afS3Tq+uDEFsCiAJMk5Nnn8+ey0D4=;
        b=OHN4L3LLc64luS8hYrI1Sq9Lc+4kTqBvQL67lJ9mCgASSXaOe4tkOvrZYH4bfytR1X
         Hz3adDXY70lHFF4cIe25DICmgJ534y4ROJ+DUaCvguG992m1l07oPfU8QAzW3xoYcjRs
         Ji+dMqMjK7kRWDuLVsz3rrNWp+bhxBvdyLOnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755290483; x=1755895283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=paeLb+OeWm7Kh4afS3Tq+uDEFsCiAJMk5Nnn8+ey0D4=;
        b=J9ByAzHL2Q9R3L2ui9Tyi7ZKMCTIntQ40mqIrkr+njKgpOsDP63ikmQKDBKdZfehvk
         LSnOIbLDGCLPQbihEfnhTgEPSwZXFKCqYJnSNHDUcbKeZJyOpDN619c6MXxoVBqhkRFI
         niyDYZSFppKbfo6PARIJkkhdhE2hi4M/QBKLAaa3HAR3WwWty0q/aC0vPCELev9KWcUV
         uKS/o6LVdVAM0JBbcLIGJAM/IDqJPOkx0Lj76vud0d0m76q8kOUYfCatgRvFNtmCLTmR
         hDS7lbrQh0bJ5Bk68FZwXVvEk95CCuYOz88BA2ULbEOkMcwhhEePst8Hz4nSDG5nU1j2
         H1KA==
X-Gm-Message-State: AOJu0Yyajeyn+0KuiJAsw3eeDClAa6Vb6ONObAwrJcmECsIvUyoQxeaT
	VxFC9V1aVtYLgOgPfFsyCy+j0+9ymTMPHsB2Xp0S57db99xmT8tCKBsnG9hYGQJvHYW0cyOl3U4
	fOseR
X-Gm-Gg: ASbGncsf34wQHiG53et00rg/q+coh3WIfXHqgX5BKSYrTR759oJaOnEdxVOGwxHJTLC
	+E0b2JN4wy90n6KslVMbthm+WVYa+zfW2JnyGCnd3ls7F3v1JqXlr7pCI5v3q2Lu91hs3bAV6lk
	ONT9m6EfcZIIeSMqs0UZU67XPwAMJxxaQ78tpv2um129GmNGBp2kU+0/BSCkrl0mGpxRezMjCMv
	/asHxiNKdmmf2IMWNkybEXeasYE6K7bOSf11iVuP3CEiRufTITQdbNGaPlvtehKUuW1dHnX0Pm0
	jgcoz/c1F3+l86IyXUJW3gugwWcUFBrOwpBfJU87mH99Pk1srWrfltCWA91UzXB7/RtkRUe3ddC
	TDNE5DRJXQQIiJXfJu2t4yYCTOKlvIVKUXoQcNqT+EAjBaAxeeZptJZL0+46wDpLasGhQPPyEJH
	dd
X-Google-Smtp-Source: AGHT+IGifGN3xZ06BUeGeyRrpuDRd2B66yl+ECqdoH4ziQ81hz+1O0IIjPXxjds+8gHb/yjolvgiVA==
X-Received: by 2002:a05:6000:2f88:b0:3b7:84fc:ef4c with SMTP id ffacd0b85a97d-3bb66180488mr2439327f8f.6.1755290482728;
        Fri, 15 Aug 2025 13:41:22 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 03/16] x86: Sort headers
Date: Fri, 15 Aug 2025 21:41:04 +0100
Message-Id: <20250815204117.3312742-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

I'm disappointed to notice that this is the second time I've done this to
arch/x86/domain.c recently, and screwed it up the first time.

I think we need some tooling to help keep this in order, not that I remotely
have time to look into this.
---
 xen/arch/x86/acpi/cpufreq/acpi.c   |  2 +-
 xen/arch/x86/cpu/mcheck/mce.h      |  2 +-
 xen/arch/x86/domain.c              |  4 +-
 xen/arch/x86/domctl.c              | 44 ++++++++---------
 xen/arch/x86/hvm/hvm.c             | 76 +++++++++++++++---------------
 xen/arch/x86/hvm/svm/svm.c         |  6 +--
 xen/arch/x86/hvm/svm/vmcb.c        |  4 +-
 xen/arch/x86/hvm/vmx/vmx.c         | 54 +++++++++++----------
 xen/arch/x86/hvm/vmx/vvmx.c        |  6 +--
 xen/arch/x86/include/asm/hvm/hvm.h |  2 +-
 xen/arch/x86/tboot.c               | 15 +++---
 xen/arch/x86/xstate.c              |  4 +-
 xen/drivers/acpi/apei/apei-base.c  | 14 +++---
 13 files changed, 121 insertions(+), 112 deletions(-)

diff --git a/xen/arch/x86/acpi/cpufreq/acpi.c b/xen/arch/x86/acpi/cpufreq/acpi.c
index 0c2537640608..b81f2afc9b9b 100644
--- a/xen/arch/x86/acpi/cpufreq/acpi.c
+++ b/xen/arch/x86/acpi/cpufreq/acpi.c
@@ -11,8 +11,8 @@
  *      porting acpi-cpufreq.c from Linux 2.6.23 to Xen hypervisor
  */
 
-#include <xen/errno.h>
 #include <xen/delay.h>
+#include <xen/errno.h>
 #include <xen/param.h>
 #include <xen/types.h>
 
diff --git a/xen/arch/x86/cpu/mcheck/mce.h b/xen/arch/x86/cpu/mcheck/mce.h
index eba4b536c797..6157a41aaeea 100644
--- a/xen/arch/x86/cpu/mcheck/mce.h
+++ b/xen/arch/x86/cpu/mcheck/mce.h
@@ -7,8 +7,8 @@
 #include <xen/sched.h>
 #include <xen/smp.h>
 
-#include <asm/traps.h>
 #include <asm/atomic.h>
+#include <asm/traps.h>
 
 #include "x86_mca.h"
 #include "mctelem.h"
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 28c91cf023f1..6e3fd35c934e 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -24,11 +24,13 @@
 #include <xen/hypercall.h>
 #include <xen/init.h>
 #include <xen/iocap.h>
+#include <xen/iommu.h>
 #include <xen/irq.h>
 #include <xen/kernel.h>
 #include <xen/lib.h>
 #include <xen/livepatch.h>
 #include <xen/multicall.h>
+#include <xen/numa.h>
 #include <xen/paging.h>
 #include <xen/pci.h>
 #include <xen/percpu.h>
@@ -64,8 +66,6 @@
 #include <asm/system.h>
 #include <asm/traps.h>
 #include <asm/xstate.h>
-#include <xen/iommu.h>
-#include <xen/numa.h>
 
 #include <public/arch-x86/cpuid.h>
 #include <public/sysctl.h>
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index f07cae6a70b8..d7781b7dc5fd 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -4,39 +4,41 @@
  * Copyright (c) 2002-2006, K A Fraser
  */
 
-#include <xen/types.h>
-#include <xen/lib.h>
-#include <xen/mm.h>
-#include <xen/guest_access.h>
 #include <xen/compat.h>
-#include <xen/pci.h>
-#include <public/domctl.h>
-#include <xen/sched.h>
+#include <xen/console.h>
 #include <xen/domain.h>
-#include <xen/event.h>
 #include <xen/domain_page.h>
-#include <asm/msr.h>
-#include <xen/trace.h>
-#include <xen/console.h>
+#include <xen/event.h>
+#include <xen/guest_access.h>
+#include <xen/hypercall.h>
 #include <xen/iocap.h>
+#include <xen/iommu.h>
+#include <xen/lib.h>
+#include <xen/mm.h>
 #include <xen/paging.h>
+#include <xen/pci.h>
+#include <xen/sched.h>
+#include <xen/trace.h>
+#include <xen/types.h>
+#include <xen/vm_event.h>
 
+#include <asm/acpi.h>
+#include <asm/cpu-policy.h>
 #include <asm/gdbsx.h>
-#include <asm/irq.h>
 #include <asm/hvm/emulate.h>
 #include <asm/hvm/hvm.h>
+#include <asm/io_apic.h>
+#include <asm/irq.h>
+#include <asm/mem_sharing.h>
+#include <asm/msr.h>
 #include <asm/processor.h>
-#include <asm/acpi.h> /* for hvm_acpi_power_button */
-#include <xen/hypercall.h> /* for arch_do_domctl */
+#include <asm/psr.h>
+#include <asm/xstate.h>
+
 #include <xsm/xsm.h>
-#include <xen/iommu.h>
-#include <xen/vm_event.h>
+
+#include <public/domctl.h>
 #include <public/vm_event.h>
-#include <asm/mem_sharing.h>
-#include <asm/xstate.h>
-#include <asm/psr.h>
-#include <asm/cpu-policy.h>
-#include <asm/io_apic.h>
 
 static int update_domain_cpu_policy(struct domain *d,
                                     xen_domctl_cpu_policy_t *xdpc)
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index cb8ecd050d41..6d2b937b62ba 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -7,64 +7,66 @@
  * Copyright (c) 2008, Citrix Systems, Inc.
  */
 
+#include <xen/console.h>
+#include <xen/cpu.h>
+#include <xen/domain.h>
+#include <xen/domain_page.h>
+#include <xen/event.h>
+#include <xen/guest_access.h>
+#include <xen/hypercall.h>
 #include <xen/init.h>
 #include <xen/io.h>
 #include <xen/ioreq.h>
-#include <xen/lib.h>
-#include <xen/trace.h>
-#include <xen/sched.h>
 #include <xen/irq.h>
-#include <xen/softirq.h>
-#include <xen/domain.h>
-#include <xen/domain_page.h>
-#include <xen/hypercall.h>
-#include <xen/guest_access.h>
-#include <xen/event.h>
-#include <xen/cpu.h>
-#include <xen/wait.h>
+#include <xen/lib.h>
 #include <xen/mem_access.h>
-#include <xen/rangeset.h>
 #include <xen/monitor.h>
-#include <xen/param.h>
-#include <xen/warning.h>
-#include <xen/vpci.h>
 #include <xen/nospec.h>
+#include <xen/param.h>
+#include <xen/rangeset.h>
+#include <xen/sched.h>
+#include <xen/softirq.h>
+#include <xen/trace.h>
 #include <xen/vm_event.h>
-#include <xen/console.h>
-#include <asm/shadow.h>
-#include <asm/hap.h>
+#include <xen/vpci.h>
+#include <xen/wait.h>
+#include <xen/warning.h>
+
+#include <asm/altp2m.h>
+#include <asm/apic.h>
+#include <asm/cpufeature.h>
 #include <asm/current.h>
 #include <asm/debugreg.h>
 #include <asm/e820.h>
-#include <asm/regs.h>
-#include <asm/cpufeature.h>
-#include <asm/processor.h>
-#include <asm/msr.h>
-#include <asm/i387.h>
-#include <asm/xstate.h>
-#include <asm/traps.h>
-#include <asm/mc146818rtc.h>
-#include <asm/mce.h>
-#include <asm/monitor.h>
+#include <asm/hap.h>
+#include <asm/hvm/cacheattr.h>
 #include <asm/hvm/emulate.h>
 #include <asm/hvm/hvm.h>
-#include <asm/hvm/vpt.h>
-#include <asm/hvm/support.h>
-#include <asm/hvm/cacheattr.h>
-#include <asm/hvm/nestedhvm.h>
 #include <asm/hvm/monitor.h>
+#include <asm/hvm/nestedhvm.h>
+#include <asm/hvm/support.h>
 #include <asm/hvm/viridian.h>
 #include <asm/hvm/vm_event.h>
-#include <asm/altp2m.h>
+#include <asm/hvm/vpt.h>
+#include <asm/i387.h>
+#include <asm/mc146818rtc.h>
+#include <asm/mce.h>
+#include <asm/monitor.h>
+#include <asm/msr.h>
 #include <asm/mtrr.h>
-#include <asm/apic.h>
+#include <asm/processor.h>
+#include <asm/regs.h>
+#include <asm/shadow.h>
+#include <asm/traps.h>
 #include <asm/vm_event.h>
-#include <public/sched.h>
+#include <asm/xstate.h>
+
+#include <public/arch-x86/cpuid.h>
 #include <public/hvm/ioreq.h>
-#include <public/version.h>
 #include <public/memory.h>
+#include <public/sched.h>
+#include <public/version.h>
 #include <public/vm_event.h>
-#include <public/arch-x86/cpuid.h>
 
 #include <compat/hvm/hvm_op.h>
 
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 57520ac3ec2d..a807cab305aa 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -18,7 +18,6 @@
 #include <asm/cpufeature.h>
 #include <asm/current.h>
 #include <asm/debugreg.h>
-#include <asm/idt.h>
 #include <asm/gdbsx.h>
 #include <asm/hvm/emulate.h>
 #include <asm/hvm/hvm.h>
@@ -29,13 +28,14 @@
 #include <asm/hvm/svm/svm.h>
 #include <asm/hvm/svm/svmdebug.h>
 #include <asm/hvm/svm/vmcb.h>
-#include <asm/iocap.h>
 #include <asm/i387.h>
+#include <asm/idt.h>
+#include <asm/iocap.h>
 #include <asm/monitor.h>
 #include <asm/msr.h>
+#include <asm/p2m.h>
 #include <asm/paging.h>
 #include <asm/processor.h>
-#include <asm/p2m.h>
 #include <asm/x86_emulate.h>
 #include <asm/xenoprof.h>
 
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index 839d3ff91b5a..e4c797608f25 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -14,11 +14,11 @@
 #include <xen/sched.h>
 #include <xen/softirq.h>
 
+#include <asm/hvm/svm/svm.h>
+#include <asm/hvm/svm/svmdebug.h>
 #include <asm/hvm/svm/vmcb.h>
 #include <asm/msr-index.h>
 #include <asm/p2m.h>
-#include <asm/hvm/svm/svm.h>
-#include <asm/hvm/svm/svmdebug.h>
 #include <asm/spec_ctrl.h>
 
 struct vmcb_struct *alloc_vmcb(void)
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 6341fa20457c..c6bf435b744a 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4,51 +4,53 @@
  * Copyright (c) 2004, Intel Corporation.
  */
 
+#include <xen/domain_page.h>
 #include <xen/guest_access.h>
+#include <xen/hypercall.h>
 #include <xen/init.h>
+#include <xen/irq.h>
 #include <xen/lib.h>
 #include <xen/param.h>
-#include <xen/trace.h>
+#include <xen/perfc.h>
 #include <xen/sched.h>
-#include <xen/irq.h>
 #include <xen/softirq.h>
-#include <xen/domain_page.h>
-#include <xen/hypercall.h>
-#include <xen/perfc.h>
-#include <asm/current.h>
-#include <asm/io.h>
-#include <asm/iocap.h>
-#include <asm/regs.h>
+#include <xen/trace.h>
+
+#include <asm/altp2m.h>
+#include <asm/apic.h>
 #include <asm/cpufeature.h>
-#include <asm/processor.h>
+#include <asm/current.h>
 #include <asm/debugreg.h>
-#include <asm/msr.h>
-#include <asm/p2m.h>
-#include <asm/mem_sharing.h>
+#include <asm/event.h>
+#include <asm/gdbsx.h>
 #include <asm/hvm/emulate.h>
 #include <asm/hvm/hvm.h>
+#include <asm/hvm/monitor.h>
+#include <asm/hvm/nestedhvm.h>
 #include <asm/hvm/support.h>
-#include <asm/hvm/vmx/vmx.h>
-#include <asm/hvm/vmx/vmcs.h>
-#include <public/sched.h>
-#include <public/hvm/ioreq.h>
 #include <asm/hvm/vlapic.h>
-#include <asm/x86_emulate.h>
+#include <asm/hvm/vmx/vmcs.h>
+#include <asm/hvm/vmx/vmx.h>
 #include <asm/hvm/vpt.h>
-#include <public/hvm/save.h>
-#include <asm/hvm/monitor.h>
-#include <asm/xenoprof.h>
-#include <asm/gdbsx.h>
-#include <asm/apic.h>
-#include <asm/hvm/nestedhvm.h>
-#include <asm/altp2m.h>
-#include <asm/event.h>
+#include <asm/io.h>
+#include <asm/iocap.h>
 #include <asm/mce.h>
+#include <asm/mem_sharing.h>
 #include <asm/monitor.h>
+#include <asm/msr.h>
+#include <asm/p2m.h>
+#include <asm/processor.h>
 #include <asm/prot-key.h>
+#include <asm/regs.h>
 #include <asm/spec_ctrl.h>
 #include <asm/stubs.h>
+#include <asm/x86_emulate.h>
+#include <asm/xenoprof.h>
+
 #include <public/arch-x86/cpuid.h>
+#include <public/hvm/ioreq.h>
+#include <public/hvm/save.h>
+#include <public/sched.h>
 
 static bool __initdata opt_force_ept;
 boolean_param("force-ept", opt_force_ept);
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index 2432af58e0e0..95d3c2ee7b79 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -10,12 +10,12 @@
 
 #include <xen/ioreq.h>
 
-#include <asm/mtrr.h>
-#include <asm/p2m.h>
+#include <asm/hvm/nestedhvm.h>
 #include <asm/hvm/support.h>
 #include <asm/hvm/vmx/vmx.h>
 #include <asm/hvm/vmx/vvmx.h>
-#include <asm/hvm/nestedhvm.h>
+#include <asm/mtrr.h>
+#include <asm/p2m.h>
 
 static DEFINE_PER_CPU(u64 *, vvmcs_buf);
 
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 18e40910ff71..228f47dbde8b 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -14,8 +14,8 @@
 
 #include <asm/asm_defns.h>
 #include <asm/current.h>
-#include <asm/x86_emulate.h>
 #include <asm/hvm/asid.h>
+#include <asm/x86_emulate.h>
 
 struct pirq; /* needed by pi_update_irte */
 
diff --git a/xen/arch/x86/tboot.c b/xen/arch/x86/tboot.c
index d5db60d335e3..319116857d4a 100644
--- a/xen/arch/x86/tboot.c
+++ b/xen/arch/x86/tboot.c
@@ -1,19 +1,20 @@
+#include <xen/acpi.h>
+#include <xen/domain_page.h>
 #include <xen/efi.h>
 #include <xen/init.h>
-#include <xen/types.h>
+#include <xen/iommu.h>
 #include <xen/lib.h>
 #include <xen/param.h>
-#include <xen/sched.h>
-#include <xen/domain_page.h>
-#include <xen/iommu.h>
-#include <xen/acpi.h>
 #include <xen/pfn.h>
+#include <xen/sched.h>
+#include <xen/types.h>
+
+#include <asm/e820.h>
 #include <asm/fixmap.h>
 #include <asm/page.h>
 #include <asm/processor.h>
-#include <asm/e820.h>
-#include <asm/tboot.h>
 #include <asm/setup.h>
+#include <asm/tboot.h>
 #include <asm/trampoline.h>
 
 #include <crypto/vmac.h>
diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index e8e218caed36..f6d677eb121d 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -10,12 +10,12 @@
 #include <xen/sched.h>
 #include <xen/xvmalloc.h>
 
+#include <asm/asm_defns.h>
 #include <asm/cpu-policy.h>
 #include <asm/current.h>
-#include <asm/processor.h>
 #include <asm/i387.h>
+#include <asm/processor.h>
 #include <asm/xstate.h>
-#include <asm/asm_defns.h>
 
 /*
  * Maximum size (in byte) of the XSAVE/XRSTOR save area required by all
diff --git a/xen/drivers/acpi/apei/apei-base.c b/xen/drivers/acpi/apei/apei-base.c
index 053a92c307bb..4fe99573a220 100644
--- a/xen/drivers/acpi/apei/apei-base.c
+++ b/xen/drivers/acpi/apei/apei-base.c
@@ -30,15 +30,17 @@
  * You should have received a copy of the GNU General Public License
  * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
-#include <xen/kernel.h>
-#include <xen/errno.h>
+
+#include <xen/cper.h>
 #include <xen/delay.h>
-#include <xen/string.h>
-#include <xen/types.h>
-#include <xen/spinlock.h>
+#include <xen/errno.h>
 #include <xen/init.h>
-#include <xen/cper.h>
+#include <xen/kernel.h>
+#include <xen/spinlock.h>
+#include <xen/string.h>
+
 #include <asm/io.h>
+
 #include <acpi/acpi.h>
 #include <acpi/apei.h>
 
-- 
2.39.5


