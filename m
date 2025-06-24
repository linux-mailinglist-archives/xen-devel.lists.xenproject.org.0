Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3261EAE6C9F
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 18:40:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023954.1400041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU6gk-0000mT-Pr; Tue, 24 Jun 2025 16:40:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023954.1400041; Tue, 24 Jun 2025 16:40:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU6gk-0000hQ-KL; Tue, 24 Jun 2025 16:40:02 +0000
Received: by outflank-mailman (input) for mailman id 1023954;
 Tue, 24 Jun 2025 16:40:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X7et=ZH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uU6gi-00006A-Rw
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 16:40:00 +0000
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [2a00:1450:4864:20::443])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id deada2f6-5119-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 18:40:00 +0200 (CEST)
Received: by mail-wr1-x443.google.com with SMTP id
 ffacd0b85a97d-3a4f379662cso4592513f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 09:40:00 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6e810caefsm2295472f8f.87.2025.06.24.09.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jun 2025 09:39:58 -0700 (PDT)
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
X-Inumbo-ID: deada2f6-5119-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750783199; x=1751387999; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YY0iNm4JGds+kin8aZfprVF5SX7hTwH9tOxocIXXJ6g=;
        b=onG1AVWLY+vhlyaFkWI9HV7F7lNEopuMzpCDsB4nhCvsDSCLi0XV5wDIxUUQGAGoH4
         5oONiXXq8kDrNNq8W7RlDO1yrlGM6zlFxV+hrZuFujtXo+R1FYQof/wSnVyqE3b9tPTZ
         XDU/rDMk5PJcaXpkVan2+EST2t/Tq9QHjF2b0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750783199; x=1751387999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YY0iNm4JGds+kin8aZfprVF5SX7hTwH9tOxocIXXJ6g=;
        b=s5e9RCkZFnpomr7JmJyK8qqxNrPvYnM4zGjM0cbCIxvstxjniPtpWzduMCNHoPl1vd
         Zm+OIpVIiBvKd7ijkRqvua8GNKjlQAFjPAzV22yZsZhCR/cKezi5YHcJI2nIqu24blYe
         QS5Vtl4hi7vy1Y1tANFQ1K3K0jYpAi/wRacFsrqKFatJnZUrHMppdf3AiqwEX+CDRRFs
         X+caGT+87+n5f9To85lX0pLr2zyytjzVR2W0sFOUj5igPBtMyx6c5IqG6DWgBuBpB/y3
         mWEwTGKiISfCwpyBfLsENq3vP8MEvMTVKsv9kiNdp7enOFY56o6e06QP8R4NVGuTK9s4
         SBuw==
X-Gm-Message-State: AOJu0Yxy7JTT+m2IeCp5bG5IiXwpoTPwh00L4msMXDVVIV6NDdwgyxv+
	7LyRSt3S+/OFuFvYtfRq0LzrwmSUaUnEKZeOKniKuA7nhHh2wKKG2xXGVm+bbvbNrU3zfcJsA3E
	EmYhQ+s0S+tTH
X-Gm-Gg: ASbGnctHIBL5GaecG0AEjmF8Zexv/MZvis4lOx4lNMz8nwpNYns+rsqt6UlICIeRIIo
	eqaUyFQ9bN6MSa+2cQAGpJKCPTCt3Ld0ial+8jh75/ZY9tXEt5RO8ncRE6i7NoVO5WrAGRMVwkp
	JtG3ZSf6PZqN00ye7+0UYrdwtC2BWDHH0D0PrK3ne+Q1GDixBO5RvhCduD2qF7Up7EiPnmS8HsH
	q71fH3zybgEuGSqf78jkJK0hMX2oWbAoLhrEcQCwKEUDqrUJ4lzRIw15sKXqKd1pMWp8GuUkrTu
	Awe04xr5Bkdbw9U24LSrbAWM7p9GvIHEYKmwmY2jiq8fU/EcYFbwMrHk1djBYKUn8R13EhYFOuq
	gc8s4uCxE/w9Be8glfVdt48B+qUCkdrn95uyOVImCljsUIw==
X-Google-Smtp-Source: AGHT+IHMBKXngsA9cu19BlMGLWeCIFT1NTU75mT8aDGPfmHjn9bd+SvP254RUlOgN4/hfW0Vr8ZBPQ==
X-Received: by 2002:a05:6000:230b:b0:3a5:8a68:b823 with SMTP id ffacd0b85a97d-3a6d12af83bmr12768448f8f.23.1750783199289;
        Tue, 24 Jun 2025 09:39:59 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/4] x86/idle: Remove MFENCEs for CLFLUSH_MONITOR
Date: Tue, 24 Jun 2025 17:39:49 +0100
Message-Id: <20250624163951.301743-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250624163951.301743-1-andrew.cooper3@citrix.com>
References: <20250624163951.301743-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit 48d32458bcd4 ("x86, idle: add barriers to CLFLUSH workaround") was
inherited from Linux and added MFENCEs around the AAI65 errata fix.

The SDM now states:

  Executions of the CLFLUSH instruction are ordered with respect to each
  other and with respect to writes, locked read-modify-write instructions,
  and fence instructions[1].

with footnote 1 reading:

  Earlier versions of this manual specified that executions of the CLFLUSH
  instruction were ordered only by the MFENCE instruction.  All processors
  implementing the CLFLUSH instruction also order it relative to the other
  operations enumerated above.

I.e. the MFENCEs came about because of an incorrect statement in the SDM.

The Spec Update (no longer available on Intel's website) simply says "issue a
CLFLUSH", with no mention of MFENCEs.

As this erratum is specific to Intel, it's fine to remove the the MFENCEs; AMD
CPUs of a similar vintage do port otherwise-unordered CLFLUSHs.

Move the feature bit into the BUG range (rather than FEATURE), and move the
workaround into monitor() itself.

The erratum check itself must use setup_force_cpu_cap().  It needs activating
if any CPU needs it, not if all of them need it.

Fixes: 48d32458bcd4 ("x86, idle: add barriers to CLFLUSH workaround")
Fixes: 96d1b237ae9b ("x86/Intel: work around Xeon 7400 series erratum AAI65")
Link: https://web.archive.org/web/20090219054841/http://download.intel.com/design/xeon/specupdt/32033601.pdf
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

https://git.kernel.org/linus/1f13c60d84e880df6698441026e64f84c7110c49 is my
equivalent patch to Linux.
---
 xen/arch/x86/acpi/cpu_idle.c           | 22 +++-------------------
 xen/arch/x86/cpu/intel.c               |  3 ++-
 xen/arch/x86/include/asm/cpufeatures.h |  3 ++-
 3 files changed, 7 insertions(+), 21 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index 40af42a18fb8..e9493f7f577f 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -63,6 +63,9 @@
 static always_inline void monitor(
     const void *addr, unsigned int ecx, unsigned int edx)
 {
+    alternative_input("", "clflush (%[addr])", X86_BUG_CLFLUSH_MONITOR,
+                      [addr] "a" (addr));
+
     asm volatile ( "monitor"
                    :: "a" (addr), "c" (ecx), "d" (edx) );
 }
@@ -476,13 +479,6 @@ void mwait_idle_with_hints(unsigned int eax, unsigned int ecx)
     s_time_t expires = per_cpu(timer_deadline, cpu);
     const void *monitor_addr = &mwait_wakeup(cpu);
 
-    if ( boot_cpu_has(X86_FEATURE_CLFLUSH_MONITOR) )
-    {
-        mb();
-        clflush(monitor_addr);
-        mb();
-    }
-
     monitor(monitor_addr, 0, 0);
     smp_mb();
 
@@ -917,19 +913,7 @@ void cf_check acpi_dead_idle(void)
 
         while ( 1 )
         {
-            /*
-             * 1. The CLFLUSH is a workaround for erratum AAI65 for
-             * the Xeon 7400 series.  
-             * 2. The WBINVD is insufficient due to the spurious-wakeup
-             * case where we return around the loop.
-             * 3. Unlike wbinvd, clflush is a light weight but not serializing 
-             * instruction, hence memory fence is necessary to make sure all 
-             * load/store visible before flush cache line.
-             */
-            mb();
-            clflush(mwait_ptr);
             monitor(mwait_ptr, 0, 0);
-            mb();
             mwait(cx->address, 0);
         }
     }
diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index ef9368167a0d..5215b5405c76 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -446,6 +446,7 @@ static void __init probe_mwait_errata(void)
  *
  * Xeon 7400 erratum AAI65 (and further newer Xeons)
  * MONITOR/MWAIT may have excessive false wakeups
+ * https://web.archive.org/web/20090219054841/http://download.intel.com/design/xeon/specupdt/32033601.pdf
  */
 static void Intel_errata_workarounds(struct cpuinfo_x86 *c)
 {
@@ -463,7 +464,7 @@ static void Intel_errata_workarounds(struct cpuinfo_x86 *c)
 
 	if (c->x86 == 6 && cpu_has_clflush &&
 	    (c->x86_model == 29 || c->x86_model == 46 || c->x86_model == 47))
-		__set_bit(X86_FEATURE_CLFLUSH_MONITOR, c->x86_capability);
+		setup_force_cpu_cap(X86_BUG_CLFLUSH_MONITOR);
 
 	probe_c3_errata(c);
 	if (system_state < SYS_STATE_smp_boot)
diff --git a/xen/arch/x86/include/asm/cpufeatures.h b/xen/arch/x86/include/asm/cpufeatures.h
index 9e3ed21c026d..84c93292c80c 100644
--- a/xen/arch/x86/include/asm/cpufeatures.h
+++ b/xen/arch/x86/include/asm/cpufeatures.h
@@ -19,7 +19,7 @@ XEN_CPUFEATURE(ARCH_PERFMON,      X86_SYNTH( 3)) /* Intel Architectural PerfMon
 XEN_CPUFEATURE(TSC_RELIABLE,      X86_SYNTH( 4)) /* TSC is known to be reliable */
 XEN_CPUFEATURE(XTOPOLOGY,         X86_SYNTH( 5)) /* cpu topology enum extensions */
 XEN_CPUFEATURE(CPUID_FAULTING,    X86_SYNTH( 6)) /* cpuid faulting */
-XEN_CPUFEATURE(CLFLUSH_MONITOR,   X86_SYNTH( 7)) /* clflush reqd with monitor */
+/* Bit 7 unused */
 XEN_CPUFEATURE(APERFMPERF,        X86_SYNTH( 8)) /* APERFMPERF */
 XEN_CPUFEATURE(MFENCE_RDTSC,      X86_SYNTH( 9)) /* MFENCE synchronizes RDTSC */
 XEN_CPUFEATURE(XEN_SMEP,          X86_SYNTH(10)) /* SMEP gets used by Xen itself */
@@ -52,6 +52,7 @@ XEN_CPUFEATURE(USE_VMCALL,        X86_SYNTH(30)) /* Use VMCALL instead of VMMCAL
 #define X86_BUG_NULL_SEG          X86_BUG( 1) /* NULL-ing a selector preserves the base and limit. */
 #define X86_BUG_CLFLUSH_MFENCE    X86_BUG( 2) /* MFENCE needed to serialise CLFLUSH */
 #define X86_BUG_IBPB_NO_RET       X86_BUG( 3) /* IBPB doesn't flush the RSB/RAS */
+#define X86_BUG_CLFLUSH_MONITOR   X86_BUG( 4) /* MONITOR requires CLFLUSH */
 
 #define X86_SPEC_NO_LFENCE_ENTRY_PV X86_BUG(16) /* (No) safety LFENCE for SPEC_CTRL_ENTRY_PV. */
 #define X86_SPEC_NO_LFENCE_ENTRY_INTR X86_BUG(17) /* (No) safety LFENCE for SPEC_CTRL_ENTRY_INTR. */
-- 
2.39.5


