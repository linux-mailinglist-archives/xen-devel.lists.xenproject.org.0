Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 380CA1BDA5C
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 13:09:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTkaW-0002AK-0w; Wed, 29 Apr 2020 11:09:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4OoD=6N=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jTkaU-0002AF-Cs
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 11:09:10 +0000
X-Inumbo-ID: d94d50eb-8a09-11ea-992b-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d94d50eb-8a09-11ea-992b-12813bfff9fa;
 Wed, 29 Apr 2020 11:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588158549;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=+Mpp+ZiKK/GN+G1qHHbpqgfpTjZ0iwfW7+0MYUZWHa0=;
 b=S1tAY0moUM+LACguwUV2EbyWBBfsbiTFpwQQbXZeV9P9tp/Qp7pSFkI7
 ibStcnwMMFFd0WHwsX2lzpUFvz7Ffd3/mw+5snj3mRrrnTK4ng8vaTbPg
 Ep9GhmGvpoFZuESkxdRwK/Yv2sVGQY9kz3hqUEirb1CmpD0EWkPdIhuqP I=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: IipDfsvVfyuOULKzjBnm4yi3ldiVKOdjz/WPOlbQyFBt9zVo3D5dQEthKrRWYwhV/O02oQoRSs
 skBBtlLu4Rbw3SeBJLpjLVaByEpq8nqI2nVwaDVCJ+A2gwxW8GOVQUUv3YqD/DXGVi/gQkIk0Z
 GBGbMSVP+k0BCbPXY0rkem3v3S17gAc2CWhB+PpjEWPH8dnE1RLcVOJ6LIfdHEYuWF1Ol/jNbA
 BSDbqqt/xAZ1RrMlfnXkCbjzeuMlcPAGFjwNBXg7u5uERaP7D2p+HRHDEWIYUslijYAOXUmNi4
 h3U=
X-SBRS: 2.7
X-MesageID: 17119842
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,331,1583211600"; d="scan'208";a="17119842"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/S3: Drop {save, restore}_rest_processor_state() completely
Date: Wed, 29 Apr 2020 12:09:03 +0100
Message-ID: <20200429110903.15418-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

There is no need to save/restore FS/GS/XCR0 state.  It will be handled
suitably on the context switch away from the idle.

The CR4 restoration in restore_rest_processor_state() was actually fighting
later code in enter_state() which tried to keep CR4.MCE clear until everything
was set up.  Delete the intermediate restoration, and defer final restoration
until after MCE is reconfigured.

Changing PAT should be done before paging is enabled.  Move it into the
trampoline during setup for 64bit.

The only remaing piece of restoration is load_system_tables(), so suspend.c
can be deleted in its entirety.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monne <roger.pau@citrix.com>
---
 xen/arch/x86/acpi/Makefile      |  2 +-
 xen/arch/x86/acpi/power.c       |  9 ++++----
 xen/arch/x86/acpi/suspend.c     | 49 -----------------------------------------
 xen/arch/x86/acpi/wakeup_prot.S |  4 +---
 xen/arch/x86/boot/trampoline.S  |  5 +++++
 5 files changed, 11 insertions(+), 58 deletions(-)
 delete mode 100644 xen/arch/x86/acpi/suspend.c

diff --git a/xen/arch/x86/acpi/Makefile b/xen/arch/x86/acpi/Makefile
index 1b9e625713..041377e2bb 100644
--- a/xen/arch/x86/acpi/Makefile
+++ b/xen/arch/x86/acpi/Makefile
@@ -1,4 +1,4 @@
 obj-y += cpufreq/
 
-obj-y += lib.o power.o suspend.o cpu_idle.o cpuidle_menu.o
+obj-y += lib.o power.o cpu_idle.o cpuidle_menu.o
 obj-bin-y += boot.init.o wakeup_prot.o
diff --git a/xen/arch/x86/acpi/power.c b/xen/arch/x86/acpi/power.c
index 6dfd4c7891..0cda362045 100644
--- a/xen/arch/x86/acpi/power.c
+++ b/xen/arch/x86/acpi/power.c
@@ -195,7 +195,6 @@ static int enter_state(u32 state)
     unsigned long flags;
     int error;
     struct cpu_info *ci;
-    unsigned long cr4;
 
     if ( (state <= ACPI_STATE_S0) || (state > ACPI_S_STATES_MAX) )
         return -EINVAL;
@@ -270,15 +269,15 @@ static int enter_state(u32 state)
 
     system_state = SYS_STATE_resume;
 
-    /* Restore CR4 and EFER from cached values. */
-    cr4 = read_cr4();
-    write_cr4(cr4 & ~X86_CR4_MCE);
+    /* Restore EFER from cached value. */
     write_efer(read_efer());
 
     device_power_up(SAVED_ALL);
 
     mcheck_init(&boot_cpu_data, false);
-    write_cr4(cr4);
+
+    /* Restore CR4 from cached value, now MCE is set up. */
+    write_cr4(read_cr4());
 
     printk(XENLOG_INFO "Finishing wakeup from ACPI S%d state.\n", state);
 
diff --git a/xen/arch/x86/acpi/suspend.c b/xen/arch/x86/acpi/suspend.c
deleted file mode 100644
index 3c1a3cbb34..0000000000
--- a/xen/arch/x86/acpi/suspend.c
+++ /dev/null
@@ -1,49 +0,0 @@
-/*
- * Portions are:
- *  Copyright (c) 2002 Pavel Machek <pavel@suse.cz>
- *  Copyright (c) 2001 Patrick Mochel <mochel@osdl.org>
- */
-
-#include <xen/acpi.h>
-#include <xen/smp.h>
-#include <asm/processor.h>
-#include <asm/msr.h>
-#include <asm/debugreg.h>
-#include <asm/hvm/hvm.h>
-#include <asm/hvm/support.h>
-#include <asm/i387.h>
-#include <asm/xstate.h>
-#include <xen/hypercall.h>
-
-static unsigned long saved_fs_base, saved_gs_base, saved_kernel_gs_base;
-static uint64_t saved_xcr0;
-
-void save_rest_processor_state(void)
-{
-    saved_fs_base = rdfsbase();
-    saved_gs_base = rdgsbase();
-    rdmsrl(MSR_SHADOW_GS_BASE, saved_kernel_gs_base);
-
-    if ( cpu_has_xsave )
-        saved_xcr0 = get_xcr0();
-}
-
-
-void restore_rest_processor_state(void)
-{
-    load_system_tables();
-
-    /* Restore full CR4 (inc MCE) now that the IDT is in place. */
-    write_cr4(mmu_cr4_features);
-
-    wrfsbase(saved_fs_base);
-    wrgsbase(saved_gs_base);
-    wrmsrl(MSR_SHADOW_GS_BASE, saved_kernel_gs_base);
-
-    if ( cpu_has_xsave && !set_xcr0(saved_xcr0) )
-        BUG();
-
-    wrmsrl(MSR_IA32_CR_PAT, XEN_MSR_PAT);
-
-    mtrr_bp_restore();
-}
diff --git a/xen/arch/x86/acpi/wakeup_prot.S b/xen/arch/x86/acpi/wakeup_prot.S
index 0ce96e26a9..4dba6020a7 100644
--- a/xen/arch/x86/acpi/wakeup_prot.S
+++ b/xen/arch/x86/acpi/wakeup_prot.S
@@ -15,8 +15,6 @@ ENTRY(do_suspend_lowlevel)
         mov     %cr0, %rax
         mov     %rax, saved_cr0(%rip)
 
-        call    save_rest_processor_state
-
         /* enter sleep state physically */
         mov     $3, %edi
         call    acpi_enter_sleep_state
@@ -51,7 +49,7 @@ ENTRY(s3_resume)
         lretq
 1:
 
-        call restore_rest_processor_state
+        call    load_system_tables
 
 .Lsuspend_err:
         pop     %r15
diff --git a/xen/arch/x86/boot/trampoline.S b/xen/arch/x86/boot/trampoline.S
index 18c6638924..662e6bdd3c 100644
--- a/xen/arch/x86/boot/trampoline.S
+++ b/xen/arch/x86/boot/trampoline.S
@@ -91,6 +91,11 @@ trampoline_protmode_entry:
         and     %edi,%edx
         wrmsr
 1:
+        /* Set up PAT before enabling paging. */
+        mov     $XEN_MSR_PAT & 0xffffffff, %eax
+        mov     $XEN_MSR_PAT >> 32, %edx
+        mov     $MSR_IA32_CR_PAT, %ecx
+        wrmsr
 
         /* Set up EFER (Extended Feature Enable Register). */
         movl    $MSR_EFER,%ecx
-- 
2.11.0


