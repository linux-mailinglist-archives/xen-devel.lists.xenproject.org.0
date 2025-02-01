Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA60A2468A
	for <lists+xen-devel@lfdr.de>; Sat,  1 Feb 2025 03:18:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880060.1290289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1te34s-0004w0-Ba; Sat, 01 Feb 2025 02:17:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880060.1290289; Sat, 01 Feb 2025 02:17:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1te34s-0004t1-1s; Sat, 01 Feb 2025 02:17:46 +0000
Received: by outflank-mailman (input) for mailman id 880060;
 Sat, 01 Feb 2025 02:17:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CUeW=UY=flex--seanjc.bounces.google.com=3RYSdZwYKCQg0mivrkowwotm.kwu5mv-lm3mttq010.5mvxzwrmk1.wzo@srs-se1.protection.inumbo.net>)
 id 1te34p-0002sH-O1
 for xen-devel@lists.xenproject.org; Sat, 01 Feb 2025 02:17:43 +0000
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com
 [2607:f8b0:4864:20::64a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b763b9e9-e042-11ef-a0e6-8be0dac302b0;
 Sat, 01 Feb 2025 03:17:43 +0100 (CET)
Received: by mail-pl1-x64a.google.com with SMTP id
 d9443c01a7336-21638389f63so42368475ad.1
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jan 2025 18:17:42 -0800 (PST)
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
X-Inumbo-ID: b763b9e9-e042-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738376261; x=1738981061; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=fjq2RAKOugqtigb0Q/zSm7wR8ZLcl6wCuY/1ydRYBE0=;
        b=IJ3i2x4TmhnuTvF9HkXnKLSnYPzYS7KSEm6d8gK8Q8pEeh8k2XmsFrhFZaPN3Z41zR
         KbTxH2R+10u+d+Pz4XKQPpjkZv/EhDdcz6EvsdNcpOPRJgDn97AuRvAMzDrHPjZAA0Yy
         xlrIqAagkWcVkqUfjdR4jS656zemPquP7dyWdEjW5yJZuUPyrMo7QS7QPzJ1aA8UUjgI
         CQEhtNgjujA53F45IsGf5Q836ICEZnHj9M6gNpfzbhBdcBQ1GxCbIapLCSiPr7f/Xxsx
         5I/He0V8zcUKkejmuIVMVYSY+3L6El5UkPAtQKLXSlVIyG51Mk91mYOrbg0ekvN8Jh3e
         gvpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738376261; x=1738981061;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fjq2RAKOugqtigb0Q/zSm7wR8ZLcl6wCuY/1ydRYBE0=;
        b=K3l0OtGd9wTgzZ9tO4yNVz/cSlQn1HCjEQo6I0n6Kwz8OatZubLx0tKYxD48j2s7zL
         vSydW3LjnQRlolFWlPq2590VKb2f8JXn64e9qK2vPm7+wBDWilYKbyPLdpXZni5mn7l6
         u10wjcoccVhl+TQRQ6XzJlZYQ5WAn9RQy+n9bqpptIfm9Mj1jBubApZv8QCWpQ445tzg
         bWcTqa3egVWjibgkpUKFDtBk7mY9XO1eXGkoVAUXBt4sjE15hb6vAV/ZaNn0SpEFJpuP
         P48QMqvIgl2D4eovQl5aqUYZAhwZfJ2i3vRguy9lO1xtPCMd9SlZLOidG6fEWd7Y6p2q
         dDog==
X-Forwarded-Encrypted: i=1; AJvYcCX4ERua1DuEa6Aq5dYYT3HwTm+lc1VsFDIV5iWqRo0eGlOLrTgqooG5DqJaVcbo378RiDNigBGkFLk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzihQPHATWq7e/G3um2agGxgWBmNCZQXktA2DJHlE/KGs2mGo7W
	kHkY/d7pU3P3QFFZZZZcS1IvlTzOb8PvrKD5oxQ+vA5PCoTxUVxuZJZCJ3H5GgjN0MYvVlohGjX
	gUQ==
X-Google-Smtp-Source: AGHT+IEzM58dX9KoHCeq7XuQ3ZLuiQUuTP7JBFBKc9/3u2bcW6PA+cqHRPb1Z08cdz7ppSJkxA+MEfhtD78=
X-Received: from pjbpx11.prod.google.com ([2002:a17:90b:270b:b0:2e9:5043:f55b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ce8b:b0:215:e98c:c5c1
 with SMTP id d9443c01a7336-21dd7d78f78mr169836355ad.30.1738376261457; Fri, 31
 Jan 2025 18:17:41 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 31 Jan 2025 18:17:10 -0800
In-Reply-To: <20250201021718.699411-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250201021718.699411-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250201021718.699411-9-seanjc@google.com>
Subject: [PATCH 08/16] x86/tsc: Pass KNOWN_FREQ and RELIABLE as params to registration
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Juergen Gross <jgross@suse.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Alexey Makhalov <alexey.amakhalov@broadcom.com>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	virtualization@lists.linux.dev, linux-hyperv@vger.kernel.org, 
	jailhouse-dev@googlegroups.com, kvm@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Sean Christopherson <seanjc@google.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="UTF-8"

Add a "tsc_properties" set of flags and use it to annotate whether the
TSC operates at a known and/or reliable frequency when registering a
paravirtual TSC calibration routine.  Currently, each PV flow manually
sets the associated feature flags, but often in haphazard fashion that
makes it difficult for unfamiliar readers to see the properties of the
TSC when running under a particular hypervisor.

The other, bigger issue with manually setting the feature flags is that
it decouples the flags from the calibration routine.  E.g. in theory, PV
code could mark the TSC as having a known frequency, but then have its
PV calibration discarded in favor of a method that doesn't use that known
frequency.  Passing the TSC properties along with the calibration routine
will allow adding sanity checks to guard against replacing a "better"
calibration routine with a "worse" routine.

As a bonus, the flags also give developers working on new PV code a heads
up that they should at least mark the TSC as having a known frequency.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/coco/sev/core.c       |  6 ++----
 arch/x86/coco/tdx/tdx.c        |  7 ++-----
 arch/x86/include/asm/tsc.h     |  8 +++++++-
 arch/x86/kernel/cpu/acrn.c     |  4 ++--
 arch/x86/kernel/cpu/mshyperv.c | 10 +++++++---
 arch/x86/kernel/cpu/vmware.c   |  7 ++++---
 arch/x86/kernel/jailhouse.c    |  4 ++--
 arch/x86/kernel/kvmclock.c     |  4 ++--
 arch/x86/kernel/tsc.c          |  8 +++++++-
 arch/x86/xen/time.c            |  4 ++--
 10 files changed, 37 insertions(+), 25 deletions(-)

diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index dab386f782ce..29dd50552715 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -3284,12 +3284,10 @@ void __init snp_secure_tsc_init(void)
 {
 	unsigned long long tsc_freq_mhz;
 
-	setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
-	setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
-
 	rdmsrl(MSR_AMD64_GUEST_TSC_FREQ, tsc_freq_mhz);
 	snp_tsc_freq_khz = (unsigned long)(tsc_freq_mhz * 1000);
 
 	tsc_register_calibration_routines(securetsc_get_tsc_khz,
-					  securetsc_get_tsc_khz);
+					  securetsc_get_tsc_khz,
+					  TSC_FREQ_KNOWN_AND_RELIABLE);
 }
diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index 9d95dc713331..b1e3cca091b3 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -1135,14 +1135,11 @@ static unsigned long tdx_get_tsc_khz(void)
 
 void __init tdx_tsc_init(void)
 {
-	/* TSC is the only reliable clock in TDX guest */
-	setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
-	setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
-
 	/*
 	 * Override the PV calibration routines (if set) with more trustworthy
 	 * CPUID-based calibration.  The TDX module emulates CPUID, whereas any
 	 * PV information is provided by the hypervisor.
 	 */
-	tsc_register_calibration_routines(tdx_get_tsc_khz, NULL);
+	tsc_register_calibration_routines(tdx_get_tsc_khz, NULL,
+					  TSC_FREQ_KNOWN_AND_RELIABLE);
 }
diff --git a/arch/x86/include/asm/tsc.h b/arch/x86/include/asm/tsc.h
index 82a6cc27cafb..e99966f10594 100644
--- a/arch/x86/include/asm/tsc.h
+++ b/arch/x86/include/asm/tsc.h
@@ -88,8 +88,14 @@ static inline int cpuid_get_cpu_freq(unsigned int *cpu_khz)
 extern void tsc_early_init(void);
 extern void tsc_init(void);
 #if defined(CONFIG_HYPERVISOR_GUEST) || defined(CONFIG_AMD_MEM_ENCRYPT)
+enum tsc_properties {
+	TSC_FREQUENCY_KNOWN	= BIT(0),
+	TSC_RELIABLE		= BIT(1),
+	TSC_FREQ_KNOWN_AND_RELIABLE = TSC_FREQUENCY_KNOWN | TSC_RELIABLE,
+};
 extern void tsc_register_calibration_routines(unsigned long (*calibrate_tsc)(void),
-					      unsigned long (*calibrate_cpu)(void));
+					      unsigned long (*calibrate_cpu)(void),
+					      enum tsc_properties properties);
 #endif
 extern void mark_tsc_unstable(char *reason);
 extern int unsynchronized_tsc(void);
diff --git a/arch/x86/kernel/cpu/acrn.c b/arch/x86/kernel/cpu/acrn.c
index 2da3de4d470e..4f2f4f7ec334 100644
--- a/arch/x86/kernel/cpu/acrn.c
+++ b/arch/x86/kernel/cpu/acrn.c
@@ -29,9 +29,9 @@ static void __init acrn_init_platform(void)
 	/* Install system interrupt handler for ACRN hypervisor callback */
 	sysvec_install(HYPERVISOR_CALLBACK_VECTOR, sysvec_acrn_hv_callback);
 
-	setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
 	tsc_register_calibration_routines(acrn_get_tsc_khz,
-					  acrn_get_tsc_khz);
+					  acrn_get_tsc_khz,
+					  TSC_FREQUENCY_KNOWN);
 }
 
 static bool acrn_x2apic_available(void)
diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyperv.c
index aa60491bf738..607a3c51eddf 100644
--- a/arch/x86/kernel/cpu/mshyperv.c
+++ b/arch/x86/kernel/cpu/mshyperv.c
@@ -478,8 +478,13 @@ static void __init ms_hyperv_init_platform(void)
 
 	if (ms_hyperv.features & HV_ACCESS_FREQUENCY_MSRS &&
 	    ms_hyperv.misc_features & HV_FEATURE_FREQUENCY_MSRS_AVAILABLE) {
-		tsc_register_calibration_routines(hv_get_tsc_khz, hv_get_tsc_khz);
-		setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
+		enum tsc_properties tsc_properties = TSC_FREQUENCY_KNOWN;
+
+		if (ms_hyperv.features & HV_ACCESS_TSC_INVARIANT)
+			tsc_properties = TSC_FREQ_KNOWN_AND_RELIABLE;
+
+		tsc_register_calibration_routines(hv_get_tsc_khz, hv_get_tsc_khz,
+						  tsc_properties);
 	}
 
 	if (ms_hyperv.priv_high & HV_ISOLATION) {
@@ -582,7 +587,6 @@ static void __init ms_hyperv_init_platform(void)
 		 * is called.
 		 */
 		wrmsrl(HV_X64_MSR_TSC_INVARIANT_CONTROL, HV_EXPOSE_INVARIANT_TSC);
-		setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
 	}
 
 	/*
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index d6f079a75f05..6e4a2053857c 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -385,10 +385,10 @@ static void __init vmware_paravirt_ops_setup(void)
  */
 static void __init vmware_set_capabilities(void)
 {
+	/* TSC is non-stop and reliable even if the frequency isn't known. */
 	setup_force_cpu_cap(X86_FEATURE_CONSTANT_TSC);
 	setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
-	if (vmware_tsc_khz)
-		setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
+
 	if (vmware_hypercall_mode == CPUID_VMWARE_FEATURES_ECX_VMCALL)
 		setup_force_cpu_cap(X86_FEATURE_VMCALL);
 	else if (vmware_hypercall_mode == CPUID_VMWARE_FEATURES_ECX_VMMCALL)
@@ -417,7 +417,8 @@ static void __init vmware_platform_setup(void)
 
 		vmware_tsc_khz = tsc_khz;
 		tsc_register_calibration_routines(vmware_get_tsc_khz,
-						  vmware_get_tsc_khz);
+						  vmware_get_tsc_khz,
+						  TSC_FREQ_KNOWN_AND_RELIABLE);
 
 #ifdef CONFIG_X86_LOCAL_APIC
 		/* Skip lapic calibration since we know the bus frequency. */
diff --git a/arch/x86/kernel/jailhouse.c b/arch/x86/kernel/jailhouse.c
index b0a053692161..d73a4d0fb118 100644
--- a/arch/x86/kernel/jailhouse.c
+++ b/arch/x86/kernel/jailhouse.c
@@ -218,7 +218,8 @@ static void __init jailhouse_init_platform(void)
 
 	machine_ops.emergency_restart		= jailhouse_no_restart;
 
-	tsc_register_calibration_routines(jailhouse_get_tsc, jailhouse_get_tsc);
+	tsc_register_calibration_routines(jailhouse_get_tsc, jailhouse_get_tsc,
+					  TSC_FREQUENCY_KNOWN);
 
 	while (pa_data) {
 		mapping = early_memremap(pa_data, sizeof(header));
@@ -256,7 +257,6 @@ static void __init jailhouse_init_platform(void)
 	pr_debug("Jailhouse: PM-Timer IO Port: %#x\n", pmtmr_ioport);
 
 	precalibrated_tsc_khz = setup_data.v1.tsc_khz;
-	setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
 
 	pci_probe = 0;
 
diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index b898b95a7d50..b41ac7f27b9f 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -116,7 +116,6 @@ static inline void kvm_sched_clock_init(bool stable)
  */
 static unsigned long kvm_get_tsc_khz(void)
 {
-	setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
 	return pvclock_tsc_khz(this_cpu_pvti());
 }
 
@@ -320,7 +319,8 @@ void __init kvmclock_init(void)
 	flags = pvclock_read_flags(&hv_clock_boot[0].pvti);
 	kvm_sched_clock_init(flags & PVCLOCK_TSC_STABLE_BIT);
 
-	tsc_register_calibration_routines(kvm_get_tsc_khz, kvm_get_tsc_khz);
+	tsc_register_calibration_routines(kvm_get_tsc_khz, kvm_get_tsc_khz,
+					  TSC_FREQUENCY_KNOWN);
 
 	x86_platform.get_wallclock = kvm_get_wallclock;
 	x86_platform.set_wallclock = kvm_set_wallclock;
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 922003059101..47776f450720 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -1252,11 +1252,17 @@ static void __init check_system_tsc_reliable(void)
  */
 #if defined(CONFIG_HYPERVISOR_GUEST) || defined(CONFIG_AMD_MEM_ENCRYPT)
 void tsc_register_calibration_routines(unsigned long (*calibrate_tsc)(void),
-				       unsigned long (*calibrate_cpu)(void))
+				       unsigned long (*calibrate_cpu)(void),
+				       enum tsc_properties properties)
 {
 	if (WARN_ON_ONCE(!calibrate_tsc))
 		return;
 
+	if (properties & TSC_FREQUENCY_KNOWN)
+		setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
+	if (properties & TSC_RELIABLE)
+		setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
+
 	x86_platform.calibrate_tsc = calibrate_tsc;
 	if (calibrate_cpu)
 		x86_platform.calibrate_cpu = calibrate_cpu;
diff --git a/arch/x86/xen/time.c b/arch/x86/xen/time.c
index 9e2e900dc0c7..e7429f3cffc6 100644
--- a/arch/x86/xen/time.c
+++ b/arch/x86/xen/time.c
@@ -40,7 +40,6 @@ static unsigned long xen_tsc_khz(void)
 	struct pvclock_vcpu_time_info *info =
 		&HYPERVISOR_shared_info->vcpu_info[0].time;
 
-	setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
 	return pvclock_tsc_khz(info);
 }
 
@@ -566,7 +565,8 @@ static void __init xen_init_time_common(void)
 	static_call_update(pv_steal_clock, xen_steal_clock);
 	paravirt_set_sched_clock(xen_sched_clock);
 
-	tsc_register_calibration_routines(xen_tsc_khz, NULL);
+	tsc_register_calibration_routines(xen_tsc_khz, NULL,
+					  TSC_FREQUENCY_KNOWN);
 	x86_platform.get_wallclock = xen_get_wallclock;
 }
 
-- 
2.48.1.362.g079036d154-goog


