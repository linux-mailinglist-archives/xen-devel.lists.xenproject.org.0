Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wB8cBImmGWruyAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 16:45:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94398603D36
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 16:45:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1322209.1588503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSySP-0003nq-Oe; Fri, 29 May 2026 14:45:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1322209.1588503; Fri, 29 May 2026 14:45:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSySP-0003ka-Hx; Fri, 29 May 2026 14:45:05 +0000
Received: by outflank-mailman (input) for mailman id 1322209;
 Fri, 29 May 2026 14:45:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3bKYZagYKCXcnZVieXbjjbgZ.XjhsZi-YZqZggdnon.sZikmjeZXo.jmb@flex--seanjc.bounces.google.com>)
 id 1wSySO-0003aj-Ih
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 14:45:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSySN-005qNj-V4
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 16:45:03 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3bKYZagYKCXcnZVieXbjjbgZ.XjhsZi-YZqZggdnon.sZikmjeZXo.jmb@flex--seanjc.bounces.google.com>)
 id 6a19a66e-5cb7-0a2a0a5109dd-0a2a450acfc8-4
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 16:45:03 +0200
Received: from [209.85.216.74] (helo=mail-pj1-f74.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3bKYZagYKCXcnZVieXbjjbgZ.XjhsZi-YZqZggdnon.sZikmjeZXo.jmb@flex--seanjc.bounces.google.com>)
 id 6a19a66d-56b3-0a2a450a0019-d155d84ae0bb-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 16:45:03 +0200
Received: by mail-pj1-f74.google.com with SMTP id
 98e67ed59e1d1-36b7c55406bso1676717a91.2
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 07:45:02 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=google.com header.i="@google.com" header.h="Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780065901; x=1780670701; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=i9cAaOxfY6rOh6V3wNZ8kkRpxZiPqefGKbUNNO0Sbyc=;
        b=FBQOfytJkLM/zm3wQnkSSYpjeryfLTAwu0urH7iFM+aRbh7NIY1Uicectk4RtQFVsY
         vSaqRcWBy5SQurd4KaK+1BTBJAhZ49oUhVLirzQ7tsNRAVVRyZP77TpdDBkfkeDqzlLn
         nrGBJnMXMRrbEpqJKiPCJ1ht4EOEOudMfYIAcx5HE/OhUlHPR+1OL0CHH7djoWhfiTqt
         YV5TpSNwIJ94nnADxoTxNKcuhHd/NzknJQJdALn2FDa6piegMpkycko0YVERQ3rRxz0c
         +Pol1gpQHSeEJ+lHAmMJ86PuIgB2+Cia+2WBL8ISszJuERXy0NJwVqOdUY7KVxAv7pey
         KZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065901; x=1780670701;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i9cAaOxfY6rOh6V3wNZ8kkRpxZiPqefGKbUNNO0Sbyc=;
        b=iYRkwb8eocI70K0ob5akvjJzAhG00hao2+94FjL/OZZ7AFsVQ8G58YVuiJ15Av+0Cj
         EMonwXP5tgfODyX5T4BW+HK/ElwHRuAVdEO01qVeCXYHl8zfC+5RbdOnxHL63rpbOVgo
         Ee0n3j4Ok2ljsBmkQosh9x6oNghZqujThbJI/vRm9HuhwyRIzu70wA+h/hrmSZErDj7v
         XwoO/eSejs47Cnb/rI7ZOGsES/YBAPjXfmoIcFnLE1zjCZc86RjyuT0VwkgYlfKHXvGr
         tlPUV2yngAuFMJPdYdakw2mWiNkJWa4JIReJVSgGwUDAqqBo0+b0oe3dLly2u+qphn83
         AVbw==
X-Forwarded-Encrypted: i=1; AFNElJ+VBsaa5EjVol9+9s0Ir8I69fdxLyUI+8fDSuPVSfKhmN8akb739bcEcTtTbNqxhZEBDg+PckTqAUo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzLynSWNnZDdJ+tNaNj2YqwQvd9xE3IQaesgyNLpLWY89pm04lW
	NtGS55RRoF3Sb33A02jn7lExB7Vo83h7I1SyhndWT6OnJft1MleZHkhpBR74avsx9P4InfgySXo
	ZhzyfWw==
X-Received: from pjbmd5.prod.google.com ([2002:a17:90b:23c5:b0:36a:f1b9:c389])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5410:b0:36b:bbee:fb28
 with SMTP id 98e67ed59e1d1-36bbcc14662mr3769042a91.2.1780065900790; Fri, 29
 May 2026 07:45:00 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 29 May 2026 07:43:55 -0700
In-Reply-To: <20260529144435.704127-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260529144435.704127-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529144435.704127-9-seanjc@google.com>
Subject: [PATCH v4 08/47] x86/tsc: Add dedicated hypervisor hooks for getting
 known TSC/CPU frequencies
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, John Stultz <jstultz@google.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev, 
	xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	David Woodhouse <dwmw2@infradead.org>, Michael Kelley <mhklinux@outlook.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-4011c0/1780065903-705648B7-27505DA5/0/0
X-purgate-type: clean
X-purgate-size: 10836
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[zytor.com,intel.com,redhat.com,broadcom.com,oracle.com,kernel.org,vger.kernel.org,lists.linux.dev,lists.xenproject.org,amazon.co.uk,amd.com,infradead.org,outlook.com,linutronix.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pbonzini@redhat.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:kas@kernel.org,m:seanjc@google.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:jan.kiszka@siemens.com,m:luto@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:daniel.lezcano@kernel.org,m:jstultz@google.com,m:hpa@zytor.com,m:rick.p.edgecombe@intel.com,m:vkuznets@redhat.com,m:bcm-kernel-feedback-list@broadcom.com,m:boris.ostrovsky@oracle.com,m:sboyd@kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-coco@lists.linux.dev,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:dwmw@amazon.co.uk,m:thomas.lendacky@amd.com,m:nikunj@amd.com,m:dwmw2@infradead.org,m:mhklinux@outlook.com,m:tglx@linutronix.de,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[39];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[seanjc@google.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FROM_NEQ_ENVFROM(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 94398603D36
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add dedicated hypervisor hooks for getting known TSC/CPU frequencies
instead of overriding seemingly generic platform hooks, and explicitly
priotize hypervisor-provided frequencies over native methods, but do NOT
clobber the frequency obtained from trusted firmware.  While shuffling the
hooks around is arguably "six of one, half dozen of the other", scoping
them to x86_hyper_init makes their purpose more obvious, and allows for
explicitly defining the priority of sources (as is done here).

Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/acrn.h     |  5 -----
 arch/x86/include/asm/x86_init.h |  4 ++++
 arch/x86/kernel/cpu/acrn.c      | 10 +++++++---
 arch/x86/kernel/cpu/mshyperv.c  |  6 +++---
 arch/x86/kernel/cpu/vmware.c    |  8 ++++----
 arch/x86/kernel/jailhouse.c     |  6 +++---
 arch/x86/kernel/kvmclock.c      |  6 +++---
 arch/x86/kernel/tsc.c           | 23 +++++++++++++++++++----
 arch/x86/xen/time.c             |  4 ++--
 9 files changed, 45 insertions(+), 27 deletions(-)

diff --git a/arch/x86/include/asm/acrn.h b/arch/x86/include/asm/acrn.h
index db42b477c41d..a892179c61c6 100644
--- a/arch/x86/include/asm/acrn.h
+++ b/arch/x86/include/asm/acrn.h
@@ -32,11 +32,6 @@ static inline u32 acrn_cpuid_base(void)
 	return 0;
 }
 
-static inline unsigned long acrn_get_tsc_khz(void)
-{
-	return cpuid_eax(ACRN_CPUID_TIMING_INFO);
-}
-
 /*
  * Hypercalls for ACRN
  *
diff --git a/arch/x86/include/asm/x86_init.h b/arch/x86/include/asm/x86_init.h
index 6c8a6ead84f6..a4f8a4aa601d 100644
--- a/arch/x86/include/asm/x86_init.h
+++ b/arch/x86/include/asm/x86_init.h
@@ -120,6 +120,8 @@ struct x86_init_pci {
  * @msi_ext_dest_id:		MSI supports 15-bit APIC IDs
  * @init_mem_mapping:		setup early mappings during init_mem_mapping()
  * @init_after_bootmem:		guest init after boot allocator is finished
+ * @get_tsc_khz:		get the TSC frequency (returns 0 if frequency is unknown)
+ * @get_cpu_khz:		get the CPU frequency (returns 0 if frequency is unknown)
  */
 struct x86_hyper_init {
 	void (*init_platform)(void);
@@ -128,6 +130,8 @@ struct x86_hyper_init {
 	bool (*msi_ext_dest_id)(void);
 	void (*init_mem_mapping)(void);
 	void (*init_after_bootmem)(void);
+	unsigned int (*get_tsc_khz)(void);
+	unsigned int (*get_cpu_khz)(void);
 };
 
 /**
diff --git a/arch/x86/kernel/cpu/acrn.c b/arch/x86/kernel/cpu/acrn.c
index dc119af83524..ad8f2da8003b 100644
--- a/arch/x86/kernel/cpu/acrn.c
+++ b/arch/x86/kernel/cpu/acrn.c
@@ -24,13 +24,15 @@ static u32 __init acrn_detect(void)
 	return acrn_cpuid_base();
 }
 
+static unsigned int __init acrn_get_tsc_khz(void)
+{
+	return cpuid_eax(ACRN_CPUID_TIMING_INFO);
+}
+
 static void __init acrn_init_platform(void)
 {
 	/* Install system interrupt handler for ACRN hypervisor callback */
 	sysvec_install(HYPERVISOR_CALLBACK_VECTOR, sysvec_acrn_hv_callback);
-
-	x86_platform.calibrate_tsc = acrn_get_tsc_khz;
-	x86_platform.calibrate_cpu = acrn_get_tsc_khz;
 }
 
 static bool acrn_x2apic_available(void)
@@ -78,4 +80,6 @@ const __initconst struct hypervisor_x86 x86_hyper_acrn = {
 	.type			= X86_HYPER_ACRN,
 	.init.init_platform     = acrn_init_platform,
 	.init.x2apic_available  = acrn_x2apic_available,
+	.init.get_tsc_khz	= acrn_get_tsc_khz,
+	.init.get_cpu_khz	= acrn_get_tsc_khz,
 };
diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyperv.c
index 185d4f677ec0..733e12d5a7dd 100644
--- a/arch/x86/kernel/cpu/mshyperv.c
+++ b/arch/x86/kernel/cpu/mshyperv.c
@@ -395,7 +395,7 @@ static int hv_nmi_unknown(unsigned int val, struct pt_regs *regs)
 }
 #endif
 
-static unsigned long hv_get_tsc_khz(void)
+static unsigned int __init hv_get_tsc_khz(void)
 {
 	unsigned long freq;
 
@@ -573,8 +573,8 @@ static void __init ms_hyperv_init_platform(void)
 
 	if (ms_hyperv.features & HV_ACCESS_FREQUENCY_MSRS &&
 	    ms_hyperv.misc_features & HV_FEATURE_FREQUENCY_MSRS_AVAILABLE) {
-		x86_platform.calibrate_tsc = hv_get_tsc_khz;
-		x86_platform.calibrate_cpu = hv_get_tsc_khz;
+		x86_init.hyper.get_tsc_khz = hv_get_tsc_khz;
+		x86_init.hyper.get_cpu_khz = hv_get_tsc_khz;
 		setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
 	}
 
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 34b73573b108..7c8cf4885e82 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -64,7 +64,7 @@ struct vmware_steal_time {
 	u64 reserved[7];
 };
 
-static unsigned long vmware_tsc_khz __ro_after_init;
+static unsigned long vmware_tsc_khz __initdata;
 static u8 vmware_hypercall_mode     __ro_after_init;
 
 unsigned long vmware_hypercall_slow(unsigned long cmd,
@@ -137,7 +137,7 @@ static inline int __vmware_platform(void)
 	return eax != UINT_MAX && ebx == VMWARE_HYPERVISOR_MAGIC;
 }
 
-static unsigned long vmware_get_tsc_khz(void)
+static unsigned int __init vmware_get_tsc_khz(void)
 {
 	return vmware_tsc_khz;
 }
@@ -419,8 +419,8 @@ static void __init vmware_platform_setup(void)
 		}
 
 		vmware_tsc_khz = tsc_khz;
-		x86_platform.calibrate_tsc = vmware_get_tsc_khz;
-		x86_platform.calibrate_cpu = vmware_get_tsc_khz;
+		x86_init.hyper.get_tsc_khz = vmware_get_tsc_khz;
+		x86_init.hyper.get_cpu_khz = vmware_get_tsc_khz;
 
 #ifdef CONFIG_X86_LOCAL_APIC
 		/* Skip lapic calibration since we know the bus frequency. */
diff --git a/arch/x86/kernel/jailhouse.c b/arch/x86/kernel/jailhouse.c
index f58ce9220e0f..4034e08c5f11 100644
--- a/arch/x86/kernel/jailhouse.c
+++ b/arch/x86/kernel/jailhouse.c
@@ -68,7 +68,7 @@ static void __init jailhouse_timer_init(void)
 	lapic_timer_period = setup_data.v1.apic_khz * (1000 / HZ);
 }
 
-static unsigned long jailhouse_get_tsc(void)
+static unsigned int __init jailhouse_get_tsc(void)
 {
 	return precalibrated_tsc_khz;
 }
@@ -210,8 +210,6 @@ static void __init jailhouse_init_platform(void)
 	x86_init.mpparse.parse_smp_cfg		= jailhouse_parse_smp_config;
 	x86_init.pci.arch_init			= jailhouse_pci_arch_init;
 
-	x86_platform.calibrate_cpu		= jailhouse_get_tsc;
-	x86_platform.calibrate_tsc		= jailhouse_get_tsc;
 	x86_platform.get_wallclock		= jailhouse_get_wallclock;
 	x86_platform.legacy.rtc			= 0;
 	x86_platform.legacy.warm_reset		= 0;
@@ -293,5 +291,7 @@ const struct hypervisor_x86 x86_hyper_jailhouse __refconst = {
 	.detect			= jailhouse_detect,
 	.init.init_platform	= jailhouse_init_platform,
 	.init.x2apic_available	= jailhouse_x2apic_available,
+	.init.get_tsc_khz	= jailhouse_get_tsc,
+	.init.get_cpu_khz	= jailhouse_get_tsc,
 	.ignore_nopv		= true,
 };
diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index b5991d53fc0e..ec888eef74aa 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -115,7 +115,7 @@ static inline void kvm_sched_clock_init(bool stable)
  * poll of guests can be running and trouble each other. So we preset
  * lpj here
  */
-static unsigned long kvm_get_tsc_khz(void)
+static unsigned int __init kvm_get_tsc_khz(void)
 {
 	setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
 	return pvclock_tsc_khz(this_cpu_pvti());
@@ -321,8 +321,8 @@ void __init kvmclock_init(void)
 	flags = pvclock_read_flags(&hv_clock_boot[0].pvti);
 	kvm_sched_clock_init(flags & PVCLOCK_TSC_STABLE_BIT);
 
-	x86_platform.calibrate_tsc = kvm_get_tsc_khz;
-	x86_platform.calibrate_cpu = kvm_get_tsc_khz;
+	x86_init.hyper.get_tsc_khz = kvm_get_tsc_khz;
+	x86_init.hyper.get_cpu_khz = kvm_get_tsc_khz;
 	x86_platform.get_wallclock = kvm_get_wallclock;
 	x86_platform.set_wallclock = kvm_set_wallclock;
 #ifdef CONFIG_X86_LOCAL_APIC
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 2603f136e29b..362596612442 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -1476,13 +1476,17 @@ static int __init init_tsc_clocksource(void)
 device_initcall(init_tsc_clocksource);
 
 static bool __init determine_cpu_tsc_frequencies(bool early,
+						 unsigned int known_cpu_khz,
 						 unsigned int known_tsc_khz)
 {
 	/* Make sure that cpu and tsc are not already calibrated */
 	WARN_ON(cpu_khz || tsc_khz);
 
 	if (early) {
-		cpu_khz = x86_platform.calibrate_cpu();
+		if (known_cpu_khz)
+			cpu_khz = known_cpu_khz;
+		else
+			cpu_khz = x86_platform.calibrate_cpu();
 		if (known_tsc_khz)
 			tsc_khz = known_tsc_khz;
 		else
@@ -1539,7 +1543,7 @@ static void __init tsc_enable_sched_clock(void)
 
 void __init tsc_early_init(void)
 {
-	unsigned int known_tsc_khz = 0;
+	unsigned int known_cpu_khz = 0, known_tsc_khz = 0;
 
 	if (!boot_cpu_has(X86_FEATURE_TSC))
 		return;
@@ -1547,6 +1551,9 @@ void __init tsc_early_init(void)
 	if (is_early_uv_system())
 		return;
 
+	if (x86_init.hyper.get_cpu_khz)
+		known_cpu_khz = x86_init.hyper.get_cpu_khz();
+
 	if (tsc_early_khz)
 		known_tsc_khz = tsc_early_khz;
 	else if (cc_platform_has(CC_ATTR_GUEST_SNP_SECURE_TSC))
@@ -1554,7 +1561,15 @@ void __init tsc_early_init(void)
 	else if (boot_cpu_has(X86_FEATURE_TDX_GUEST))
 		known_tsc_khz = tdx_tsc_init();
 
-	if (!determine_cpu_tsc_frequencies(true, known_tsc_khz))
+	/*
+	 * If the TSC frequency is still unknown, i.e. not provided by the user
+	 * or by trusted firmware, try to get it from the hypervisor (which is
+	 * untrusted when running as a CoCo guest).
+	 */
+	if (!known_tsc_khz && x86_init.hyper.get_tsc_khz)
+		known_tsc_khz = x86_init.hyper.get_tsc_khz();
+
+	if (!determine_cpu_tsc_frequencies(true, known_cpu_khz, known_tsc_khz))
 		return;
 	tsc_enable_sched_clock();
 }
@@ -1575,7 +1590,7 @@ void __init tsc_init(void)
 
 	if (!tsc_khz) {
 		/* We failed to determine frequencies earlier, try again */
-		if (!determine_cpu_tsc_frequencies(false, 0)) {
+		if (!determine_cpu_tsc_frequencies(false, 0, 0)) {
 			mark_tsc_unstable("could not calculate TSC khz");
 			setup_clear_cpu_cap(X86_FEATURE_TSC_DEADLINE_TIMER);
 			return;
diff --git a/arch/x86/xen/time.c b/arch/x86/xen/time.c
index d62c14334b35..1adb44fdddb2 100644
--- a/arch/x86/xen/time.c
+++ b/arch/x86/xen/time.c
@@ -38,7 +38,7 @@
 static u64 xen_sched_clock_offset __read_mostly;
 
 /* Get the TSC speed from Xen */
-static unsigned long xen_tsc_khz(void)
+static unsigned int __init xen_tsc_khz(void)
 {
 	struct pvclock_vcpu_time_info *info =
 		&HYPERVISOR_shared_info->vcpu_info[0].time;
@@ -569,7 +569,7 @@ static void __init xen_init_time_common(void)
 	static_call_update(pv_steal_clock, xen_steal_clock);
 	paravirt_set_sched_clock(xen_sched_clock);
 
-	x86_platform.calibrate_tsc = xen_tsc_khz;
+	x86_init.hyper.get_tsc_khz = xen_tsc_khz;
 	x86_platform.get_wallclock = xen_get_wallclock;
 }
 
-- 
2.54.0.823.g6e5bcc1fc9-goog


