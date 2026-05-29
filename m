Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHhMOoqmGWruyAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 16:45:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C2E603D72
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 16:45:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1322206.1588486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSySN-0003Gp-0G; Fri, 29 May 2026 14:45:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1322206.1588486; Fri, 29 May 2026 14:45:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSySM-0003Dz-Qo; Fri, 29 May 2026 14:45:02 +0000
Received: by outflank-mailman (input) for mailman id 1322206;
 Fri, 29 May 2026 14:45:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3aqYZagYKCXUlXTgcVZhhZeX.VhfqXg-WXoXeeblml.qXgikhcXVm.hkZ@flex--seanjc.bounces.google.com>)
 id 1wSySL-0002zV-Ie
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 14:45:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSySK-000xpH-V8
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 16:45:00 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3aqYZagYKCXUlXTgcVZhhZeX.VhfqXg-WXoXeeblml.qXgikhcXVm.hkZ@flex--seanjc.bounces.google.com>)
 id 6a19a663-bab6-0a2a0a5309dd-0a2a450cd4ea-34
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 16:45:00 +0200
Received: from [209.85.214.201] (helo=mail-pl1-f201.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3aqYZagYKCXUlXTgcVZhhZeX.VhfqXg-WXoXeeblml.qXgikhcXVm.hkZ@flex--seanjc.bounces.google.com>)
 id 6a19a66b-62f1-0a2a450c0019-d155d6c9e4c4-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 16:45:00 +0200
Received: by mail-pl1-f201.google.com with SMTP id
 d9443c01a7336-2ba718173d1so106709105ad.0
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 07:45:00 -0700 (PDT)
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
        d=google.com; s=20251104; t=1780065899; x=1780670699; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=fwFQzI2jeVi8q9emUB9u5qsW4Gj215t9UPhq3t/oEkw=;
        b=pFPDOYbX7nWOlF04QIQ2le4gdTxa8BcGoJz6DdC/jKm1VFMILRUoRTjlFEWyJLtzBH
         N/hEceHP1oIk1WrvQroRaDEHx2MievW0lKnIsNPSTVEGFOWjIz7GDiCqP4YtNguL8u3y
         xzFZwGCbW8OnsNsuHybdBjIP3/5h2CRLwyQuTrn3sOnXz+ALiH+am0Gw7QBwtAqqFBPH
         RbPjw77ijh9L+UxA+o2YrHzizttzo2mHn2XdbDLP7c2k71JvlNlt+FmtFOMUbIbZPzya
         jR0D89Sa2kOJtZi4KArLGn1ZV8uUNUzy16O+hATPj3D+CXI9DctovE4hcmOSidASFs85
         mLFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065899; x=1780670699;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fwFQzI2jeVi8q9emUB9u5qsW4Gj215t9UPhq3t/oEkw=;
        b=QoQqPPABEhGAX6cJPti1IKCPwE2sxt9aCRNO7WZIQ3nnZKW+Fx5qi3PUlGzQ5BXA66
         FVllYAFBdJ9BeuV6x3I19FictPF/li9H63MLaoK77Yd4aksOaeg7OHxhcmHemiUsIswu
         b3gEqVkF9ixlArdeWy5Y6Ukc0r0ElmCPk9C9IXPkwsyUH0O8ejY0TkCQwZFERT0xyWT1
         MDAgfWQpq/0U2EUxA0pNr+Dag7aQt2vzox9an5/26yuMOQmLzRSAkBa5c8rFLJbeiY5l
         k5Gp9hwA2z535rKanCeuBqJjfXcZDJNIQJCdbYlvLmcj5fjMinHkeoHR/AoVc31vwW+k
         q9zQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Q8HBk82vI3IDtHvN0MZwW5rAZPljFOds8nLBciZQdB+idFdvqIiNyDZi7j3gFReFRGUTeCBY6I4s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YybPzOifZDpAsF+UeiZCYfxvpe47XmcHgR23aH/9KAOLN/F95KF
	XCMMXLqbBk+emOn0FCTSwSVhmEGI5nwijqA4EMMsscAeky6yKoJAMKgt9wwfMHtKTiB4IzHn1DA
	CbjddsQ==
X-Received: from plble15.prod.google.com ([2002:a17:902:fb0f:b0:2bf:aa7:47b9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:c94c:b0:2b0:bebb:1081
 with SMTP id d9443c01a7336-2bf368698abmr864185ad.28.1780065898563; Fri, 29
 May 2026 07:44:58 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 29 May 2026 07:43:53 -0700
In-Reply-To: <20260529144435.704127-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260529144435.704127-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529144435.704127-7-seanjc@google.com>
Subject: [PATCH v4 06/47] x86/sev: Shove SNP's secure/trusted TSC frequency
 directly into "calibration"
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
X-purgate-ID: tlsNG-d25034/1780065900-E2368CF5-14FADCA7/0/0
X-purgate-type: clean
X-purgate-size: 5650
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
X-Rspamd-Queue-Id: A2C2E603D72
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

As a first step towards dropping .calibrate_{cpu,tsc}() and explicitly
defining precedence/priority for "calibration" routines, pass the secure
TSC frequency obtained from SNP firmware directly to
determine_cpu_tsc_frequencies() instead of overriding the .calibrate_tsc()
hook.

Unlike the native calibration routines, all of the paravirtual overrides,
including SNP and TDX, are constant in the sense that the frequency
provided by the hypervisor or trusted firmware is fixed, known, and always
available during early boot.  More importantly, for CoCo (SNP and TDX) VMs,
it's imperative that the kernel uses the frequency provided by the trusted
firmware, not by the untrusted hypervisor.  Enforcing the priority between
sources by carefully ordering seemingly unrelated init calls, so that the
trusted override "wins", is brittle and all but impossible to follow.

While it's rather weird, deliberately prioritize tsc_early_khz over all
else to maintain existing behavior.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/coco/sev/core.c   | 14 ++++----------
 arch/x86/include/asm/sev.h |  4 ++--
 arch/x86/kernel/tsc.c      | 19 ++++++++++++-------
 3 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index 403dcea86452..bc5ae9ef74da 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -99,7 +99,6 @@ static const char * const sev_status_feat_names[] = {
  */
 static u64 snp_tsc_scale __ro_after_init;
 static u64 snp_tsc_offset __ro_after_init;
-static unsigned long snp_tsc_freq_khz __ro_after_init;
 
 DEFINE_PER_CPU(struct sev_es_runtime_data*, runtime_data);
 DEFINE_PER_CPU(struct sev_es_save_area *, sev_vmsa);
@@ -2014,15 +2013,10 @@ void __init snp_secure_tsc_prepare(void)
 	pr_debug("SecureTSC enabled");
 }
 
-static unsigned long securetsc_get_tsc_khz(void)
-{
-	return snp_tsc_freq_khz;
-}
-
-void __init snp_secure_tsc_init(void)
+unsigned int __init snp_secure_tsc_init(void)
 {
+	unsigned long snp_tsc_freq_khz, tsc_freq_mhz;
 	struct snp_secrets_page *secrets;
-	unsigned long tsc_freq_mhz;
 	void *mem;
 
 	mem = early_memremap_encrypted(sev_secrets_pa, PAGE_SIZE);
@@ -2043,7 +2037,7 @@ void __init snp_secure_tsc_init(void)
 
 	snp_tsc_freq_khz = SNP_SCALE_TSC_FREQ(tsc_freq_mhz * 1000, secrets->tsc_factor);
 
-	x86_platform.calibrate_tsc = securetsc_get_tsc_khz;
-
 	early_memunmap(mem, PAGE_SIZE);
+
+	return snp_tsc_freq_khz;
 }
diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
index 594cfa19cbd4..05ebf0b73ef4 100644
--- a/arch/x86/include/asm/sev.h
+++ b/arch/x86/include/asm/sev.h
@@ -530,7 +530,7 @@ int snp_send_guest_request(struct snp_msg_desc *mdesc, struct snp_guest_req *req
 int snp_svsm_vtpm_send_command(u8 *buffer);
 
 void __init snp_secure_tsc_prepare(void);
-void __init snp_secure_tsc_init(void);
+unsigned int snp_secure_tsc_init(void);
 enum es_result savic_register_gpa(u64 gpa);
 enum es_result savic_unregister_gpa(u64 *gpa);
 u64 savic_ghcb_msr_read(u32 reg);
@@ -637,7 +637,7 @@ static inline int snp_send_guest_request(struct snp_msg_desc *mdesc,
 					 struct snp_guest_req *req) { return -ENODEV; }
 static inline int snp_svsm_vtpm_send_command(u8 *buffer) { return -ENODEV; }
 static inline void __init snp_secure_tsc_prepare(void) { }
-static inline void __init snp_secure_tsc_init(void) { }
+static inline unsigned int __init snp_secure_tsc_init(void) { return 0; }
 static inline void sev_evict_cache(void *va, int npages) {}
 static inline enum es_result savic_register_gpa(u64 gpa) { return ES_UNSUPPORTED; }
 static inline enum es_result savic_unregister_gpa(u64 *gpa) { return ES_UNSUPPORTED; }
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 833eed5c048a..2b8f94c3fcc7 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -1474,15 +1474,16 @@ static int __init init_tsc_clocksource(void)
  */
 device_initcall(init_tsc_clocksource);
 
-static bool __init determine_cpu_tsc_frequencies(bool early)
+static bool __init determine_cpu_tsc_frequencies(bool early,
+						 unsigned int known_tsc_khz)
 {
 	/* Make sure that cpu and tsc are not already calibrated */
 	WARN_ON(cpu_khz || tsc_khz);
 
 	if (early) {
 		cpu_khz = x86_platform.calibrate_cpu();
-		if (tsc_early_khz)
-			tsc_khz = tsc_early_khz;
+		if (known_tsc_khz)
+			tsc_khz = known_tsc_khz;
 		else
 			tsc_khz = x86_platform.calibrate_tsc();
 	} else {
@@ -1537,16 +1538,20 @@ static void __init tsc_enable_sched_clock(void)
 
 void __init tsc_early_init(void)
 {
+	unsigned int known_tsc_khz = 0;
+
 	if (!boot_cpu_has(X86_FEATURE_TSC))
 		return;
 	/* Don't change UV TSC multi-chassis synchronization */
 	if (is_early_uv_system())
 		return;
 
-	if (cc_platform_has(CC_ATTR_GUEST_SNP_SECURE_TSC))
-		snp_secure_tsc_init();
+	if (tsc_early_khz)
+		known_tsc_khz = tsc_early_khz;
+	else if (cc_platform_has(CC_ATTR_GUEST_SNP_SECURE_TSC))
+		known_tsc_khz = snp_secure_tsc_init();
 
-	if (!determine_cpu_tsc_frequencies(true))
+	if (!determine_cpu_tsc_frequencies(true, known_tsc_khz))
 		return;
 	tsc_enable_sched_clock();
 }
@@ -1567,7 +1572,7 @@ void __init tsc_init(void)
 
 	if (!tsc_khz) {
 		/* We failed to determine frequencies earlier, try again */
-		if (!determine_cpu_tsc_frequencies(false)) {
+		if (!determine_cpu_tsc_frequencies(false, 0)) {
 			mark_tsc_unstable("could not calculate TSC khz");
 			setup_clear_cpu_cap(X86_FEATURE_TSC_DEADLINE_TIMER);
 			return;
-- 
2.54.0.823.g6e5bcc1fc9-goog


