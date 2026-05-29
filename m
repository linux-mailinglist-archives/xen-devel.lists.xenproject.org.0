Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKsMLYemGWptyAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 16:45:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9A5603D26
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 16:45:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1322212.1588522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSySS-0004P3-KA; Fri, 29 May 2026 14:45:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1322212.1588522; Fri, 29 May 2026 14:45:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSySS-0004KQ-Cy; Fri, 29 May 2026 14:45:08 +0000
Received: by outflank-mailman (input) for mailman id 1322212;
 Fri, 29 May 2026 14:45:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3b6YZagYKCXoqcYlhaemmejc.amkvcl-bctcjjgqrq.vclnpmhcar.mpe@flex--seanjc.bounces.google.com>)
 id 1wSySQ-0003pl-39
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 14:45:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSySP-00FvB4-Fp
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 16:45:05 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3b6YZagYKCXoqcYlhaemmejc.amkvcl-bctcjjgqrq.vclnpmhcar.mpe@flex--seanjc.bounces.google.com>)
 id 6a19a66f-2eae-0a2a0a5409dd-0a2a450c88da-18
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 16:45:05 +0200
Received: from [209.85.214.202] (helo=mail-pl1-f202.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3b6YZagYKCXoqcYlhaemmejc.amkvcl-bctcjjgqrq.vclnpmhcar.mpe@flex--seanjc.bounces.google.com>)
 id 6a19a66f-62f1-0a2a450c0019-d155d6cab40c-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 16:45:05 +0200
Received: by mail-pl1-f202.google.com with SMTP id
 d9443c01a7336-2ba5f794825so112106045ad.0
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 07:45:04 -0700 (PDT)
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
        d=google.com; s=20251104; t=1780065903; x=1780670703; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=H0GwXhoguEvRGovrleKtlxRg6q5h/dMOER9+6opKAAY=;
        b=hvNffYvQ/D54LpXmOYRyyyO9ByIH0rcRHvQN1CRRR/953LWD/v/k/6lJlgPquI3mP6
         sgx08gjaeZXLvONVrgiOxdTpedgXr1an5HaZfJcCxHiSY8vGRXPhqlftJpOUXWFH2HSv
         hfbTja6KmI/tZe16c1Z+xvDrGTEWitpld67+DG/uuPTKct7b0nETss6OR1VNU1d7ZZpj
         I1Zoy4UpNEEHqYelt7C88HVYnC6RTdk3ICl2FE3G+05/mxT6MTJ0FJihgLZo1Gb7K5cQ
         gxC2HSjnbpBa8TK5K9Y/qNSgJz6KWSb53/9ZwsLV1LiKjgxudWDzylu4QeC8rMTXvhEl
         BGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065903; x=1780670703;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H0GwXhoguEvRGovrleKtlxRg6q5h/dMOER9+6opKAAY=;
        b=rmJQvJhFaZY/UCUMdSAzXHtHnoMuI5KEC7i1mogezrC+u8zrEKtICrXuLwHy+R/Lgg
         j+f5CVo4iqU6j6UT2d2Vp1EFydhcumam6PVYH6YijqaK9XA7D9LnAKaLrEDlnPVetIqg
         duP6NYXqlGTIQg8edKjElVIMjNlnbEUN03OAmApq2FvK3FgUnYZARMtzViqs2AMiVubU
         Ii8GJ907N3HjyXHGGzoh3q9FFJ0HC6+N8VUbemy4vdIm+dbqu+tokc56c8Mb0yiP6p/p
         rg6v62w0lyLTMTW98z2+oGSUDm4LFS/wVgOtSslc2U2AiR1boAjdd/0vZqlTiNBNy9A3
         F5hw==
X-Forwarded-Encrypted: i=1; AFNElJ8VfrlwJDiZUfNQ2CmV/n4BDue84jEh/7mLue29RW8b4RAW1mXVkKRNfk/dMx738UvlzXn7YpT+YMs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yypwf7NW3/uSeW+yWAX8dS5pa7rw1p4Cld4WeVuCoCC7T1k+Lh/
	RQX7haAW3XfXmcbjnHiocqh020mCft3TRaxYWE+TMYHzqErgM+UdY8fe+B8xJFuiS0UrGXf5OXB
	qYj/zSg==
X-Received: from pgc24.prod.google.com ([2002:a05:6a02:2f98:b0:c80:192c:51ff])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:c94c:b0:2b2:be01:5532
 with SMTP id d9443c01a7336-2bf3686d1dcmr856725ad.35.1780065903103; Fri, 29
 May 2026 07:45:03 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 29 May 2026 07:43:57 -0700
In-Reply-To: <20260529144435.704127-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260529144435.704127-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529144435.704127-11-seanjc@google.com>
Subject: [PATCH v4 10/47] x86/tsc: Consolidate forcing of X86_FEATURE_TSC_KNOWN_FREQ
 for PV code
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
X-purgate-ID: tlsNG-d25034/1780065905-D996DCF5-F5EF5524/0/0
X-purgate-type: clean
X-purgate-size: 6001
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
X-Rspamd-Queue-Id: 6B9A5603D26
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Now that all paravirt code that explicitly specifies the TSC frequency
also sets X86_FEATURE_TSC_KNOWN_FREQ, replace all of the one-off code
and simply set X86_FEATURE_TSC_KNOWN_FREQ if the TSC frequency is known.

Do NOT force set TSC_KNOWN_FREQ if the "known" TSC frequency was provided
by the user.  Per commit bd35c77e32e4 ("x86/tsc: Add tsc_early_khz command
line parameter"), one of the goals of the param is to allow the refined
calibration work "to do meaningful error checking".

Note, preferring the user-provided TSC frequency over the frequency from
the hypervisor or trusted firmware, while simultaneously not treating the
user-provided frequency as gospel, is obviously incongruous.  Sweep the
problem under the rug for now to avoid opening a big can of worms that
likely doesn't have a great answer.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/coco/sev/core.c       | 1 -
 arch/x86/coco/tdx/tdx.c        | 1 -
 arch/x86/kernel/cpu/acrn.c     | 2 --
 arch/x86/kernel/cpu/mshyperv.c | 1 -
 arch/x86/kernel/cpu/vmware.c   | 2 --
 arch/x86/kernel/jailhouse.c    | 1 -
 arch/x86/kernel/kvmclock.c     | 1 -
 arch/x86/kernel/tsc.c          | 9 +++++++++
 arch/x86/xen/time.c            | 1 -
 9 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index bc5ae9ef74da..72313b36b6f5 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -2027,7 +2027,6 @@ unsigned int __init snp_secure_tsc_init(void)
 
 	secrets = (__force struct snp_secrets_page *)mem;
 
-	setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
 	setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
 
 	rdmsrq(MSR_AMD64_GUEST_TSC_FREQ, tsc_freq_mhz);
diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index 5d7976359220..ab463c2b2dab 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -1205,7 +1205,6 @@ unsigned int __init tdx_tsc_init(void)
 
 	/* TSC is the only reliable clock in TDX guest */
 	setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
-	setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
 
 	return info.tsc_khz;
 }
diff --git a/arch/x86/kernel/cpu/acrn.c b/arch/x86/kernel/cpu/acrn.c
index 0303fe6a2efa..ad8f2da8003b 100644
--- a/arch/x86/kernel/cpu/acrn.c
+++ b/arch/x86/kernel/cpu/acrn.c
@@ -33,8 +33,6 @@ static void __init acrn_init_platform(void)
 {
 	/* Install system interrupt handler for ACRN hypervisor callback */
 	sysvec_install(HYPERVISOR_CALLBACK_VECTOR, sysvec_acrn_hv_callback);
-
-	setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
 }
 
 static bool acrn_x2apic_available(void)
diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyperv.c
index 733e12d5a7dd..f8653fc05a40 100644
--- a/arch/x86/kernel/cpu/mshyperv.c
+++ b/arch/x86/kernel/cpu/mshyperv.c
@@ -575,7 +575,6 @@ static void __init ms_hyperv_init_platform(void)
 	    ms_hyperv.misc_features & HV_FEATURE_FREQUENCY_MSRS_AVAILABLE) {
 		x86_init.hyper.get_tsc_khz = hv_get_tsc_khz;
 		x86_init.hyper.get_cpu_khz = hv_get_tsc_khz;
-		setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
 	}
 
 	if (ms_hyperv.priv_high & HV_ISOLATION) {
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 7c8cf4885e82..2d0624c66799 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -390,8 +390,6 @@ static void __init vmware_set_capabilities(void)
 {
 	setup_force_cpu_cap(X86_FEATURE_CONSTANT_TSC);
 	setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
-	if (vmware_tsc_khz)
-		setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
 	if (vmware_hypercall_mode == CPUID_VMWARE_FEATURES_ECX_VMCALL)
 		setup_force_cpu_cap(X86_FEATURE_VMCALL);
 	else if (vmware_hypercall_mode == CPUID_VMWARE_FEATURES_ECX_VMMCALL)
diff --git a/arch/x86/kernel/jailhouse.c b/arch/x86/kernel/jailhouse.c
index 4034e08c5f11..e4d7d9e2cd69 100644
--- a/arch/x86/kernel/jailhouse.c
+++ b/arch/x86/kernel/jailhouse.c
@@ -255,7 +255,6 @@ static void __init jailhouse_init_platform(void)
 	pr_debug("Jailhouse: PM-Timer IO Port: %#x\n", pmtmr_ioport);
 
 	precalibrated_tsc_khz = setup_data.v1.tsc_khz;
-	setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
 
 	pci_probe = 0;
 
diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index ec888eef74aa..69752b170e0a 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -117,7 +117,6 @@ static inline void kvm_sched_clock_init(bool stable)
  */
 static unsigned int __init kvm_get_tsc_khz(void)
 {
-	setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
 	return pvclock_tsc_khz(this_cpu_pvti());
 }
 
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 362596612442..8cef918486db 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -1569,6 +1569,15 @@ void __init tsc_early_init(void)
 	if (!known_tsc_khz && x86_init.hyper.get_tsc_khz)
 		known_tsc_khz = x86_init.hyper.get_tsc_khz();
 
+	/*
+	 * Mark the TSC frequency as known if it was obtained from a hypervisor
+	 * or trusted firmware.  Don't mark the frequency as known if the user
+	 * specified the frequency, as the user-provided frequency is intended
+	 * as a "starting point", not a known, guaranteed frequency.
+	 */
+	if (known_tsc_khz && !tsc_early_khz)
+		setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
+
 	if (!determine_cpu_tsc_frequencies(true, known_cpu_khz, known_tsc_khz))
 		return;
 	tsc_enable_sched_clock();
diff --git a/arch/x86/xen/time.c b/arch/x86/xen/time.c
index 1adb44fdddb2..487ad838c441 100644
--- a/arch/x86/xen/time.c
+++ b/arch/x86/xen/time.c
@@ -43,7 +43,6 @@ static unsigned int __init xen_tsc_khz(void)
 	struct pvclock_vcpu_time_info *info =
 		&HYPERVISOR_shared_info->vcpu_info[0].time;
 
-	setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
 	return pvclock_tsc_khz(info);
 }
 
-- 
2.54.0.823.g6e5bcc1fc9-goog


