Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 117FBA4275C
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2025 17:07:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895264.1303867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmazE-00044G-WB; Mon, 24 Feb 2025 16:07:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895264.1303867; Mon, 24 Feb 2025 16:07:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmazE-00042k-SJ; Mon, 24 Feb 2025 16:07:16 +0000
Received: by outflank-mailman (input) for mailman id 895264;
 Mon, 24 Feb 2025 16:07:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=48j1=VP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tmazC-0003oc-Tr
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2025 16:07:15 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 690c9190-f2c9-11ef-9aae-95dc52dad729;
 Mon, 24 Feb 2025 17:07:13 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43aac0390e8so5807175e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Feb 2025 08:07:13 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02d6837sm109356675e9.13.2025.02.24.08.07.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 08:07:11 -0800 (PST)
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
X-Inumbo-ID: 690c9190-f2c9-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740413233; x=1741018033; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JvCaSQyWyY+FfA/0O37EX9qIMHCSri3oO6tt1sgXoWI=;
        b=ViPtUzDw465K6WlJUNmHTgZlKAFWw57mV/QMQg/C/L8PIkWGIbIhW7X2gsPOLyPvJv
         u+yBnnJDnm1pbuq8PzL20LJEhyocObxgRI5DceeBdAe1kdV0rILOhb89p/u3A5IGcjTM
         iM6j0Ypgbc/0w6JuNXD3tiaq5e0bjQnaTvaBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740413233; x=1741018033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JvCaSQyWyY+FfA/0O37EX9qIMHCSri3oO6tt1sgXoWI=;
        b=m90XipnWIA7mwKNOc410GNZmZIm8s00Av5fuiciIA9TwP6MP5l1bXmdMQkzRccj6iF
         GOkIYYXGznk/+wFdQSM3IBBQrScunRvw3jnNEVpxjUvTm9mN05zk/oJK6N1jq420rhWv
         ru9oVS4H5licaMSslbSdkMKYd0ebSyFigGhiskUncj00xS1Odd+o712u45mA0nI0dXsw
         3jLNhzUOfkV/fSYhILG9Kp7Spi2pAcw54Z6AQUoFxerXLuEqgJd82k+QBvuZhgg/m5st
         PsmASslXX8WrrRv2i0KnB3RSaXDQtPID5D28gmgGluxAZPYPUQgsUcC7OUfL2lHdWADg
         VZGA==
X-Gm-Message-State: AOJu0YxtDalCEfJu/PoBIoGTndsVXE1YPNno7ZmNN8sNzkFf/jOQT0iE
	3XZT9SuvF8V1KRwMNYglYIeN6NVgd+OxlPVh07lvI9CwBcH2f7ufo5QO9CueRE9VD7FFf9SUWaY
	8
X-Gm-Gg: ASbGncvid2eo6T4kBP3JHHc6Of9+xD0bGGezvEdC3J0+s7a254NtIy1MB53lXPSDcQ7
	SJF8rDdbGCevDvvCF2LFnchLN5CTaGFtiYyn1aPuIc6uvqD1SoQPBMjnOrdoV2sUd9MCrawHzMn
	0lO1wQ5NhqlONxhCmFOMKFphemdQQwsDEXPg9XM2m6zmvCkj3qCHHc+oNFr2C7+/+pb7pHnRq56
	CKm8PZ/Pd0Hpi+WihAQgHzYvh1FAJw1lSDz0ppYMIN1aaagD8D6QMAT4XTUjozy57GSuYBQqVVb
	cWCBRwncmoqin1Ego2SGEzRz5JRbzIhrP6EVNNoLtt5BoXcien43WRM4SmFL2YJgxHPE0GPoVaL
	cB9Z5Gg==
X-Google-Smtp-Source: AGHT+IHpCNuKguKsVgryvYncGdJmySmys+0NiLMW5l1uYv1H3AVOCvOB6AXKqOdatQ8d1+juBkhxyw==
X-Received: by 2002:a05:600c:1c83:b0:434:a4b3:5ebe with SMTP id 5b1f17b1804b1-439ae21ce20mr91851365e9.24.1740413232063;
        Mon, 24 Feb 2025 08:07:12 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/8] x86: Sort includes in various files
Date: Mon, 24 Feb 2025 16:05:02 +0000
Message-Id: <20250224160509.1117847-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250224160509.1117847-1-andrew.cooper3@citrix.com>
References: <20250224160509.1117847-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

FRED support involves quite a lot of header file shuffling and cleanup.  Start
by sorting the includes of impacted files, and dropping duplciates.

  domain.c: Double asm/spec_ctrl.h
  power.c:  Double xen/sched.h
  setup.c:  Double xen/serial.h
  mm.c:     Double xen/mm.h

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

No difference in compiled binary either, except for embedded line numbers.
---
 xen/arch/x86/acpi/power.c    | 19 ++++----
 xen/arch/x86/cpu/common.c    | 15 ++++---
 xen/arch/x86/crash.c         | 32 +++++++-------
 xen/arch/x86/domain.c        | 84 ++++++++++++++++++------------------
 xen/arch/x86/hvm/vmx/vmcs.c  | 25 +++++------
 xen/arch/x86/machine_kexec.c |  5 ++-
 xen/arch/x86/mm.c            | 54 ++++++++++++-----------
 xen/arch/x86/setup.c         | 84 ++++++++++++++++++------------------
 xen/arch/x86/smpboot.c       | 22 +++++-----
 xen/arch/x86/traps.c         | 79 +++++++++++++++++----------------
 xen/arch/x86/x86_64/traps.c  | 25 ++++++-----
 11 files changed, 229 insertions(+), 215 deletions(-)

diff --git a/xen/arch/x86/acpi/power.c b/xen/arch/x86/acpi/power.c
index 08a7fc250800..d0b67614d521 100644
--- a/xen/arch/x86/acpi/power.c
+++ b/xen/arch/x86/acpi/power.c
@@ -11,28 +11,29 @@
  */
 
 #include <xen/acpi.h>
+#include <xen/console.h>
+#include <xen/cpu.h>
+#include <xen/domain.h>
 #include <xen/errno.h>
 #include <xen/iocap.h>
+#include <xen/iommu.h>
 #include <xen/param.h>
 #include <xen/sched.h>
-#include <asm/acpi.h>
-#include <asm/irq.h>
 #include <xen/spinlock.h>
-#include <xen/sched.h>
-#include <xen/domain.h>
-#include <xen/console.h>
-#include <xen/iommu.h>
 #include <xen/watchdog.h>
-#include <xen/cpu.h>
-#include <public/platform.h>
-#include <asm/tboot.h>
+
+#include <asm/acpi.h>
 #include <asm/apic.h>
 #include <asm/io_apic.h>
+#include <asm/irq.h>
 #include <asm/microcode.h>
 #include <asm/prot-key.h>
 #include <asm/spec_ctrl.h>
+#include <asm/tboot.h>
 #include <asm/trampoline.h>
 
+#include <public/platform.h>
+
 #include <acpi/cpufreq/cpufreq.h>
 
 uint32_t system_reset_counter = 1;
diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 067d855badf0..1cc4adccb471 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -1,24 +1,25 @@
-#include <xen/init.h>
-#include <xen/string.h>
 #include <xen/delay.h>
+#include <xen/init.h>
 #include <xen/param.h>
 #include <xen/smp.h>
+#include <xen/string.h>
 
 #include <asm/amd.h>
+#include <asm/apic.h>
 #include <asm/cpu-policy.h>
 #include <asm/current.h>
 #include <asm/debugreg.h>
-#include <asm/processor.h>
-#include <asm/xstate.h>
-#include <asm/msr.h>
 #include <asm/io.h>
 #include <asm/mpspec.h>
-#include <asm/apic.h>
+#include <asm/msr.h>
+#include <asm/processor.h>
 #include <asm/prot-key.h>
 #include <asm/random.h>
 #include <asm/setup.h>
 #include <asm/shstk.h>
-#include <public/sysctl.h> /* for XEN_INVALID_{SOCKET,CORE}_ID */
+#include <asm/xstate.h>
+
+#include <public/sysctl.h>
 
 #include "cpu.h"
 #include "mcheck/x86_mca.h"
diff --git a/xen/arch/x86/crash.c b/xen/arch/x86/crash.c
index 26057c71d3c9..4afe0ad859a7 100644
--- a/xen/arch/x86/crash.c
+++ b/xen/arch/x86/crash.c
@@ -8,27 +8,29 @@
  * - Magnus Damm <magnus@valinux.co.jp>
  */
 
-#include <asm/atomic.h>
-#include <asm/elf.h>
-#include <xen/types.h>
-#include <xen/irq.h>
-#include <asm/nmi.h>
-#include <xen/string.h>
+#include <xen/console.h>
+#include <xen/delay.h>
 #include <xen/elf.h>
 #include <xen/elfcore.h>
-#include <xen/smp.h>
-#include <xen/delay.h>
-#include <xen/perfc.h>
+#include <xen/iommu.h>
+#include <xen/irq.h>
 #include <xen/kexec.h>
-#include <xen/sched.h>
 #include <xen/keyhandler.h>
-#include <public/xen.h>
-#include <asm/shared.h>
+#include <xen/perfc.h>
+#include <xen/sched.h>
+#include <xen/smp.h>
+#include <xen/string.h>
+#include <xen/types.h>
+
 #include <asm/apic.h>
-#include <asm/io_apic.h>
-#include <xen/iommu.h>
+#include <asm/atomic.h>
+#include <asm/elf.h>
 #include <asm/hpet.h>
-#include <xen/console.h>
+#include <asm/io_apic.h>
+#include <asm/nmi.h>
+#include <asm/shared.h>
+
+#include <public/xen.h>
 
 static cpumask_t waiting_to_crash;
 static unsigned int crashing_cpu;
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 78a13e6812c9..7b2549091fd3 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -11,66 +11,68 @@
  *  Gareth Hughes <gareth@valinux.com>, May 2000
  */
 
-#include <xen/init.h>
-#include <xen/lib.h>
-#include <xen/errno.h>
-#include <xen/sched.h>
-#include <xen/domain.h>
-#include <xen/smp.h>
+#include <xen/acpi.h>
+#include <xen/compat.h>
+#include <xen/console.h>
+#include <xen/cpu.h>
 #include <xen/delay.h>
-#include <xen/softirq.h>
+#include <xen/domain.h>
+#include <xen/errno.h>
+#include <xen/event.h>
 #include <xen/grant_table.h>
+#include <xen/guest_access.h>
+#include <xen/hypercall.h>
+#include <xen/init.h>
 #include <xen/iocap.h>
+#include <xen/irq.h>
 #include <xen/kernel.h>
-#include <xen/hypercall.h>
+#include <xen/lib.h>
+#include <xen/livepatch.h>
 #include <xen/multicall.h>
-#include <xen/irq.h>
-#include <xen/event.h>
-#include <xen/console.h>
-#include <xen/percpu.h>
-#include <xen/compat.h>
-#include <xen/acpi.h>
-#include <xen/pci.h>
 #include <xen/paging.h>
-#include <xen/cpu.h>
+#include <xen/pci.h>
+#include <xen/percpu.h>
+#include <xen/sched.h>
+#include <xen/smp.h>
+#include <xen/softirq.h>
 #include <xen/wait.h>
-#include <xen/guest_access.h>
-#include <xen/livepatch.h>
-#include <public/arch-x86/cpuid.h>
-#include <public/sysctl.h>
-#include <public/hvm/hvm_vcpu.h>
-#include <asm/regs.h>
-#include <asm/mc146818rtc.h>
-#include <asm/system.h>
-#include <asm/io.h>
-#include <asm/processor.h>
-#include <asm/desc.h>
-#include <asm/i387.h>
-#include <asm/xstate.h>
+
+#include <asm/amd.h>
+#include <asm/cpu-policy.h>
 #include <asm/cpuidle.h>
-#include <asm/mpspec.h>
-#include <asm/ldt.h>
+#include <asm/debugreg.h>
+#include <asm/desc.h>
 #include <asm/hvm/hvm.h>
 #include <asm/hvm/nestedhvm.h>
 #include <asm/hvm/svm/svm.h>
 #include <asm/hvm/viridian.h>
-#include <asm/debugreg.h>
+#include <asm/i387.h>
+#include <asm/io.h>
+#include <asm/ldt.h>
+#include <asm/mc146818rtc.h>
+#include <asm/mce.h>
+#include <asm/mpspec.h>
 #include <asm/msr.h>
+#include <asm/nmi.h>
+#include <asm/processor.h>
+#include <asm/psr.h>
+#include <asm/pv/domain.h>
+#include <asm/pv/mm.h>
+#include <asm/regs.h>
 #include <asm/spec_ctrl.h>
+#include <asm/system.h>
 #include <asm/traps.h>
-#include <asm/nmi.h>
-#include <asm/mce.h>
-#include <asm/amd.h>
-#include <xen/numa.h>
+#include <asm/xstate.h>
 #include <xen/iommu.h>
+#include <xen/numa.h>
+
+#include <public/arch-x86/cpuid.h>
+#include <public/sysctl.h>
+#include <public/hvm/hvm_vcpu.h>
+
 #ifdef CONFIG_COMPAT
 #include <compat/vcpu.h>
 #endif
-#include <asm/cpu-policy.h>
-#include <asm/psr.h>
-#include <asm/pv/domain.h>
-#include <asm/pv/mm.h>
-#include <asm/spec_ctrl.h>
 
 DEFINE_PER_CPU(struct vcpu *, curr_vcpu);
 
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 8c0ea789c1a3..fa9d8b3267ea 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -4,33 +4,34 @@
  * Copyright (c) 2004, Intel Corporation.
  */
 
-#include <xen/init.h>
-#include <xen/mm.h>
-#include <xen/lib.h>
-#include <xen/param.h>
-#include <xen/errno.h>
 #include <xen/domain_page.h>
+#include <xen/errno.h>
 #include <xen/event.h>
+#include <xen/init.h>
 #include <xen/kernel.h>
 #include <xen/keyhandler.h>
+#include <xen/lib.h>
+#include <xen/mm.h>
+#include <xen/param.h>
 #include <xen/vm_event.h>
-#include <asm/current.h>
+
+#include <asm/apic.h>
 #include <asm/cpufeature.h>
-#include <asm/processor.h>
-#include <asm/msr.h>
-#include <asm/xstate.h>
+#include <asm/current.h>
+#include <asm/flushtlb.h>
 #include <asm/hvm/hvm.h>
 #include <asm/hvm/io.h>
 #include <asm/hvm/nestedhvm.h>
+#include <asm/hvm/vmx/vmcs.h>
 #include <asm/hvm/vmx/vmx.h>
 #include <asm/hvm/vmx/vvmx.h>
-#include <asm/hvm/vmx/vmcs.h>
-#include <asm/flushtlb.h>
 #include <asm/monitor.h>
+#include <asm/msr.h>
+#include <asm/processor.h>
 #include <asm/shadow.h>
 #include <asm/spec_ctrl.h>
 #include <asm/tboot.h>
-#include <asm/apic.h>
+#include <asm/xstate.h>
 
 static bool __read_mostly opt_vpid_enabled = true;
 boolean_param("vpid", opt_vpid_enabled);
diff --git a/xen/arch/x86/machine_kexec.c b/xen/arch/x86/machine_kexec.c
index d50772ad6ca3..e20e8d0b1563 100644
--- a/xen/arch/x86/machine_kexec.c
+++ b/xen/arch/x86/machine_kexec.c
@@ -15,14 +15,15 @@
  * Version 2.  See the file COPYING for more details.
  */
 
-#include <xen/types.h>
 #include <xen/domain_page.h>
 #include <xen/elfstructs.h>
 #include <xen/kexec.h>
+#include <xen/types.h>
+
 #include <asm/fixmap.h>
 #include <asm/hpet.h>
-#include <asm/page.h>
 #include <asm/machine_kexec.h>
+#include <asm/page.h>
 
 /*
  * Add a mapping for a page to the page tables used during kexec.
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index fa21903eb25a..6b34b908efcd 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -87,51 +87,53 @@
  * doing the final put_page(), and remove it from the iommu if so.
  */
 
+#include <xen/domain.h>
+#include <xen/domain_page.h>
+#include <xen/efi.h>
+#include <xen/err.h>
+#include <xen/event.h>
+#include <xen/guest_access.h>
+#include <xen/hypercall.h>
 #include <xen/init.h>
+#include <xen/iocap.h>
 #include <xen/ioreq.h>
+#include <xen/irq.h>
 #include <xen/kernel.h>
 #include <xen/lib.h>
 #include <xen/livepatch.h>
 #include <xen/mm.h>
 #include <xen/param.h>
-#include <xen/domain.h>
-#include <xen/sched.h>
-#include <xen/err.h>
 #include <xen/perfc.h>
-#include <xen/irq.h>
-#include <xen/softirq.h>
-#include <xen/domain_page.h>
-#include <xen/event.h>
-#include <xen/iocap.h>
-#include <xen/guest_access.h>
 #include <xen/pfn.h>
+#include <xen/sched.h>
+#include <xen/softirq.h>
+#include <xen/trace.h>
 #include <xen/vmap.h>
 #include <xen/xmalloc.h>
-#include <xen/efi.h>
-#include <xen/hypercall.h>
-#include <xen/mm.h>
-#include <asm/paging.h>
-#include <asm/shadow.h>
-#include <asm/page.h>
+
+#include <asm/e820.h>
+#include <asm/fixmap.h>
 #include <asm/flushtlb.h>
+#include <asm/guest.h>
 #include <asm/io.h>
+#include <asm/io_apic.h>
 #include <asm/ldt.h>
-#include <asm/x86_emulate.h>
-#include <asm/e820.h>
-#include <asm/shared.h>
 #include <asm/mem_sharing.h>
-#include <public/memory.h>
-#include <public/sched.h>
-#include <xsm/xsm.h>
-#include <xen/trace.h>
-#include <asm/setup.h>
-#include <asm/fixmap.h>
-#include <asm/io_apic.h>
+#include <asm/page.h>
+#include <asm/paging.h>
 #include <asm/pci.h>
-#include <asm/guest.h>
 #include <asm/pv/domain.h>
 #include <asm/pv/mm.h>
+#include <asm/setup.h>
+#include <asm/shadow.h>
+#include <asm/shared.h>
 #include <asm/trampoline.h>
+#include <asm/x86_emulate.h>
+
+#include <public/memory.h>
+#include <public/sched.h>
+
+#include <xsm/xsm.h>
 
 #ifdef CONFIG_PV
 #include "pv/mm.h"
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 8ebe5a9443f3..143749e5da5b 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1,68 +1,70 @@
-#include <xen/init.h>
-#include <xen/lib.h>
+#include <xen/acpi.h>
+#include <xen/bitops.h>
+#include <xen/console.h>
+#include <xen/cpu.h>
+#include <xen/cpuidle.h>
+#include <xen/dmi.h>
+#include <xen/domain.h>
+#include <xen/domain_page.h>
+#include <xen/efi.h>
 #include <xen/err.h>
 #include <xen/grant_table.h>
+#include <xen/hypercall.h>
+#include <xen/init.h>
+#include <xen/kexec.h>
+#include <xen/keyhandler.h>
+#include <xen/lib.h>
+#include <xen/multiboot.h>
+#include <xen/nodemask.h>
+#include <xen/numa.h>
 #include <xen/param.h>
+#include <xen/pfn.h>
+#include <xen/rcupdate.h>
 #include <xen/sched.h>
-#include <xen/domain.h>
 #include <xen/sections.h>
 #include <xen/serial.h>
 #include <xen/softirq.h>
-#include <xen/acpi.h>
-#include <xen/efi.h>
-#include <xen/console.h>
-#include <xen/serial.h>
 #include <xen/trace.h>
-#include <xen/multiboot.h>
-#include <xen/domain_page.h>
 #include <xen/version.h>
-#include <xen/hypercall.h>
-#include <xen/keyhandler.h>
-#include <xen/numa.h>
-#include <xen/rcupdate.h>
 #include <xen/vga.h>
-#include <xen/dmi.h>
-#include <xen/pfn.h>
-#include <xen/nodemask.h>
 #include <xen/virtual_region.h>
 #include <xen/watchdog.h>
-#include <public/version.h>
-#ifdef CONFIG_COMPAT
-#include <compat/platform.h>
-#include <compat/xen.h>
-#endif
-#include <xen/bitops.h>
-#include <asm/bootinfo.h>
-#include <asm/smp.h>
-#include <asm/processor.h>
-#include <asm/mpspec.h>
+
+#include <asm/alternative.h>
 #include <asm/apic.h>
-#include <asm/msi.h>
+#include <asm/bootinfo.h>
+#include <asm/bzimage.h>
+#include <asm/cpu-policy.h>
 #include <asm/desc.h>
-#include <asm/paging.h>
 #include <asm/e820.h>
-#include <xen/kexec.h>
 #include <asm/edd.h>
-#include <xsm/xsm.h>
-#include <asm/tboot.h>
-#include <asm/bzimage.h> /* for bzimage_headroom */
 #include <asm/genapic.h>
+#include <asm/guest.h>
+#include <asm/invpcid.h>
 #include <asm/io_apic.h>
-#include <asm/setup.h>
-#include <xen/cpu.h>
-#include <xen/cpuidle.h>
-#include <asm/nmi.h>
-#include <asm/alternative.h>
 #include <asm/mc146818rtc.h>
-#include <asm/cpu-policy.h>
-#include <asm/invpcid.h>
-#include <asm/spec_ctrl.h>
-#include <asm/guest.h>
 #include <asm/microcode.h>
+#include <asm/mpspec.h>
+#include <asm/msi.h>
+#include <asm/nmi.h>
+#include <asm/paging.h>
+#include <asm/processor.h>
 #include <asm/prot-key.h>
 #include <asm/pv/domain.h>
+#include <asm/setup.h>
+#include <asm/smp.h>
+#include <asm/spec_ctrl.h>
+#include <asm/tboot.h>
 #include <asm/trampoline.h>
 
+#include <xsm/xsm.h>
+
+#include <public/version.h>
+#ifdef CONFIG_COMPAT
+#include <compat/platform.h>
+#include <compat/xen.h>
+#endif
+
 /* opt_nosmp: If true, secondary processors are ignored. */
 static bool __initdata opt_nosmp;
 boolean_param("nosmp", opt_nosmp);
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 891a29fca146..f904d5623272 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -7,39 +7,39 @@
  *  (c) 1998, 1999, 2000 Ingo Molnar <mingo@redhat.com>
  */
 
+#include <xen/cpu.h>
+#include <xen/delay.h>
+#include <xen/domain.h>
+#include <xen/domain_page.h>
 #include <xen/init.h>
+#include <xen/irq.h>
 #include <xen/kernel.h>
 #include <xen/mm.h>
-#include <xen/domain.h>
-#include <xen/domain_page.h>
+#include <xen/numa.h>
 #include <xen/sched.h>
-#include <xen/irq.h>
-#include <xen/delay.h>
+#include <xen/serial.h>
 #include <xen/softirq.h>
 #include <xen/tasklet.h>
-#include <xen/serial.h>
-#include <xen/numa.h>
-#include <xen/cpu.h>
 
 #include <asm/apic.h>
-#include <asm/io_apic.h>
 #include <asm/cpuidle.h>
 #include <asm/current.h>
-#include <asm/mc146818rtc.h>
 #include <asm/desc.h>
 #include <asm/div64.h>
 #include <asm/flushtlb.h>
 #include <asm/guest.h>
+#include <asm/io_apic.h>
+#include <asm/irq-vectors.h>
+#include <asm/mc146818rtc.h>
 #include <asm/microcode.h>
 #include <asm/msr.h>
 #include <asm/mtrr.h>
 #include <asm/prot-key.h>
 #include <asm/setup.h>
 #include <asm/spec_ctrl.h>
-#include <asm/time.h>
 #include <asm/tboot.h>
+#include <asm/time.h>
 #include <asm/trampoline.h>
-#include <asm/irq-vectors.h>
 
 uint32_t __ro_after_init trampoline_phys;
 enum ap_boot_method __read_mostly ap_boot_method = AP_BOOT_NORMAL;
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index dca11a613dbd..e8d5aa9fd46b 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -12,68 +12,71 @@
  * Gareth Hughes <gareth@valinux.com>, May 2000
  */
 
+#include <xen/bitops.h>
 #include <xen/bug.h>
-#include <xen/init.h>
-#include <xen/sched.h>
-#include <xen/lib.h>
+#include <xen/console.h>
+#include <xen/delay.h>
+#include <xen/domain_page.h>
 #include <xen/err.h>
 #include <xen/errno.h>
+#include <xen/event.h>
+#include <xen/guest_access.h>
 #include <xen/hypercall.h>
+#include <xen/init.h>
+#include <xen/iocap.h>
+#include <xen/irq.h>
+#include <xen/kexec.h>
+#include <xen/lib.h>
+#include <xen/livepatch.h>
 #include <xen/mm.h>
+#include <xen/paging.h>
 #include <xen/param.h>
-#include <xen/console.h>
-#include <xen/shutdown.h>
-#include <xen/guest_access.h>
-#include <asm/regs.h>
-#include <xen/delay.h>
-#include <xen/event.h>
-#include <xen/spinlock.h>
-#include <xen/irq.h>
 #include <xen/perfc.h>
+#include <xen/sched.h>
+#include <xen/shutdown.h>
 #include <xen/softirq.h>
-#include <xen/domain_page.h>
+#include <xen/spinlock.h>
 #include <xen/symbols.h>
-#include <xen/iocap.h>
-#include <xen/version.h>
-#include <xen/kexec.h>
 #include <xen/trace.h>
-#include <xen/paging.h>
+#include <xen/version.h>
 #include <xen/virtual_region.h>
 #include <xen/watchdog.h>
-#include <xen/livepatch.h>
-#include <asm/system.h>
-#include <asm/io.h>
+
+#include <asm/apic.h>
 #include <asm/atomic.h>
-#include <xen/bitops.h>
-#include <asm/desc.h>
+#include <asm/cpuid.h>
 #include <asm/debugreg.h>
-#include <asm/gdbsx.h>
-#include <asm/smp.h>
+#include <asm/desc.h>
 #include <asm/flushtlb.h>
-#include <asm/uaccess.h>
+#include <asm/gdbsx.h>
+#include <asm/hpet.h>
+#include <asm/hvm/vpt.h>
 #include <asm/i387.h>
-#include <asm/xstate.h>
+#include <asm/io.h>
+#include <asm/irq-vectors.h>
+#include <asm/mc146818rtc.h>
+#include <asm/mce.h>
 #include <asm/msr.h>
 #include <asm/nmi.h>
-#include <asm/xenoprof.h>
+#include <asm/pv/mm.h>
+#include <asm/pv/trace.h>
+#include <asm/pv/traps.h>
+#include <asm/regs.h>
 #include <asm/shared.h>
-#include <asm/x86_emulate.h>
+#include <asm/shstk.h>
+#include <asm/smp.h>
+#include <asm/system.h>
 #include <asm/traps.h>
-#include <asm/hvm/vpt.h>
-#include <asm/mce.h>
-#include <asm/apic.h>
-#include <asm/mc146818rtc.h>
-#include <asm/hpet.h>
+#include <asm/uaccess.h>
 #include <asm/vpmu.h>
+#include <asm/x86_emulate.h>
+#include <asm/xenoprof.h>
+#include <asm/xstate.h>
+
 #include <public/arch-x86/cpuid.h>
 #include <public/hvm/params.h>
-#include <asm/cpuid.h>
+
 #include <xsm/xsm.h>
-#include <asm/irq-vectors.h>
-#include <asm/pv/traps.h>
-#include <asm/pv/trace.h>
-#include <asm/pv/mm.h>
-#include <asm/shstk.h>
 
 /*
  * opt_nmi: one of 'ignore', 'dom0', or 'fatal'.
diff --git a/xen/arch/x86/x86_64/traps.c b/xen/arch/x86/x86_64/traps.c
index 02fdb3637d09..93f32ac66c92 100644
--- a/xen/arch/x86/x86_64/traps.c
+++ b/xen/arch/x86/x86_64/traps.c
@@ -1,28 +1,27 @@
-
-#include <xen/version.h>
+#include <xen/console.h>
+#include <xen/errno.h>
+#include <xen/guest_access.h>
+#include <xen/hypercall.h>
 #include <xen/init.h>
-#include <xen/sched.h>
+#include <xen/irq.h>
 #include <xen/lib.h>
-#include <xen/errno.h>
 #include <xen/mm.h>
-#include <xen/irq.h>
-#include <xen/symbols.h>
-#include <xen/console.h>
 #include <xen/sched.h>
 #include <xen/shutdown.h>
-#include <xen/guest_access.h>
+#include <xen/symbols.h>
+#include <xen/version.h>
 #include <xen/watchdog.h>
-#include <xen/hypercall.h>
+
 #include <asm/current.h>
-#include <asm/flushtlb.h>
-#include <asm/traps.h>
 #include <asm/endbr.h>
 #include <asm/event.h>
-#include <asm/nmi.h>
+#include <asm/flushtlb.h>
+#include <asm/hvm/hvm.h>
 #include <asm/msr.h>
+#include <asm/nmi.h>
 #include <asm/page.h>
 #include <asm/shared.h>
-#include <asm/hvm/hvm.h>
+#include <asm/traps.h>
 
 
 static void print_xen_info(void)
-- 
2.39.5


