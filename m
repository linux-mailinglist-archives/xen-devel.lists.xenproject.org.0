Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPbzKB1yB2qc3wIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 21:21:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D579556AC0
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 21:21:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1310175.1581023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNy50-0005Ng-GJ; Fri, 15 May 2026 19:20:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1310175.1581023; Fri, 15 May 2026 19:20:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNy50-0005Ko-Cb; Fri, 15 May 2026 19:20:14 +0000
Received: by outflank-mailman (input) for mailman id 1310175;
 Fri, 15 May 2026 19:20:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <36HEHagYKCUEvhdqmfjrrjoh.frp0hq-ghyhoolvwv.0hqsurmhfw.ruj@flex--seanjc.bounces.google.com>)
 id 1wNy4y-00059c-21
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 19:20:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNy4x-0039nU-EU
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 21:20:11 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <36HEHagYKCUEvhdqmfjrrjoh.frp0hq-ghyhoolvwv.0hqsurmhfw.ruj@flex--seanjc.bounces.google.com>)
 id 6a0771e9-2eae-0a2a0a5409dd-0a2a4501c83a-4
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 21:20:11 +0200
Received: from [209.85.210.202] (helo=mail-pf1-f202.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <36HEHagYKCUEvhdqmfjrrjoh.frp0hq-ghyhoolvwv.0hqsurmhfw.ruj@flex--seanjc.bounces.google.com>)
 id 6a0771e9-c1f2-0a2a45010019-d155d2cab997-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 21:20:11 +0200
Received: by mail-pf1-f202.google.com with SMTP id
 d2e1a72fcca58-8386367b23cso110465b3a.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 12:20:10 -0700 (PDT)
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
        d=google.com; s=20251104; t=1778872809; x=1779477609; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=jST9oUAeGChZmjVu7tMLxKyDKtrkhYcd1woip2cswJk=;
        b=TN1PoJ7EL+ReIRdJl32XQHAeNNxYyAhVZTF0irM00ioxF7AJieDo0Ao8rykpxbNB+r
         9Uea0A9zEmUfNAFc4p2Lb1kJ8wgCCI2EaAYX88+ogYEfZShBh9COVcAy75b0ndE1At2k
         NYXvE/tUgx5/3+9Pc4b7cdYcomzcHDz4oTZHY35Bi7PVfJceSG8Iph5siWfHNke8XDgn
         6Ey0KvUrK1ZvOIbtyMHZMJpQDZG/gLUG2axpqdNoodqvs7MbBE+euk5bhP9v+fOtxtke
         23kh5wsJwl/Xdy8yEfZgM2lmElHPA7RFZ6fR36HCzd1eiosr8jPg7/mWsZrGCxNJN6+p
         Fn9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778872809; x=1779477609;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jST9oUAeGChZmjVu7tMLxKyDKtrkhYcd1woip2cswJk=;
        b=TO4KccPr9RYo7p7/YyznZwAxqVvVFUZIOVT9ovplRqYtXbBfAAoA+T1nhw14AUErth
         8kjQNjiGmUEyeCUkDgO7hXkDQiWzZMdsIMwVsEgUXQCj34OlN0HcT7bUpVpH43LmAK2c
         P6bB9iXoVGXFE5GLVpkZXTLK1/n7GGpILdfa4y2RwW63hKSFlhx17GJo1iLYemkuTxxM
         SrSsXxMcEyEfu76YVOqadss56MbCsZPqgLOYTFowhc7tXcM7/hczokQdS+C7NLr3QKW0
         UBRQJVaLikVQ1i+Um+BioWIXVj8/9GgkbhXQHSuiA7kE1WLqMe9YOOtwkYXv0v6eppUJ
         OA8Q==
X-Forwarded-Encrypted: i=1; AFNElJ+J911UjvC5K5JWNG69mIhl3yM+UjPu4a4G2hrf3rSHMTOz4WSl1KtSy2HxvFJTO+613i167vXDjMg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyILEV1rudPFmxfsJ+I2HzELD6F1UdPYvo9TvKYtmnDtjRy/XKW
	fSjVudGbXEtCmCqNOwZjyYDkvhiP6ITLL05cnIQWTF4FG06kKabZQ80yxJlSJhaNEGEeYhtou0v
	H+QwCQQ==
X-Received: from pfbfc32.prod.google.com ([2002:a05:6a00:2e20:b0:82f:96ee:b9ab])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3004:b0:838:a932:de26
 with SMTP id d2e1a72fcca58-83f33bca63emr5607513b3a.1.1778872808989; Fri, 15
 May 2026 12:20:08 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 15 May 2026 12:19:02 -0700
In-Reply-To: <20260515191942.1892718-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260515191942.1892718-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260515191942.1892718-2-seanjc@google.com>
Subject: [PATCH v3 01/41] x86/tsc: Add a standalone helpers for getting TSC
 info from CPUID.0x15
From: Sean Christopherson <seanjc@google.com>
To: Kiryl Shutsemau <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	John Stultz <jstultz@google.com>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, x86@kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Michael Kelley <mhklinux@outlook.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-d62444/1778872811-AED59FF4-9655EA66/0/0
X-purgate-type: clean
X-purgate-size: 5244
X-Rspamd-Queue-Id: 5D579556AC0
X-Rspamd-Server: lfdr
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
	FREEMAIL_CC(0.00)[intel.com,redhat.com,broadcom.com,oracle.com,kernel.org,lists.linux.dev,vger.kernel.org,lists.xenproject.org,outlook.com,amd.com,linutronix.de,amazon.co.uk];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kas@kernel.org,m:pbonzini@redhat.com,m:seanjc@google.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:jan.kiszka@siemens.com,m:dave.hansen@linux.intel.com,m:luto@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:daniel.lezcano@kernel.org,m:tglx@kernel.org,m:jstultz@google.com,m:rick.p.edgecombe@intel.com,m:vkuznets@redhat.com,m:bcm-kernel-feedback-list@broadcom.com,m:boris.ostrovsky@oracle.com,m:sboyd@kernel.org,m:x86@kernel.org,m:linux-coco@lists.linux.dev,m:kvm@vger.kernel.org,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:mhklinux@outlook.com,m:thomas.lendacky@amd.com,m:nikunj@amd.com,m:tglx@linutronix.de,m:dwmw@amazon.co.uk,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[35];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[seanjc@google.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Action: no action

Extract retrieval of TSC frequency information from CPUID into standalone
helpers so that TDX guest support can reuse the logic.  Provide a version
that includes the multiplier math as TDX does NOT want to use
native_calibrate_tsc()'s fallback logic that derives the TSC frequency
based on CPUID.0x16, when the core crystal frequency isn't known.

Opportunsitically drop native_calibrate_tsc()'s "== 0" and "!= 0" checks
in favor of the kernel's preferred style.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/tsc.h |  9 +++++
 arch/x86/kernel/tsc.c      | 67 +++++++++++++++++++++++++-------------
 2 files changed, 53 insertions(+), 23 deletions(-)

diff --git a/arch/x86/include/asm/tsc.h b/arch/x86/include/asm/tsc.h
index 4f7f09f50552..0c57fadc4a39 100644
--- a/arch/x86/include/asm/tsc.h
+++ b/arch/x86/include/asm/tsc.h
@@ -83,6 +83,15 @@ static inline cycles_t get_cycles(void)
 }
 #define get_cycles get_cycles
 
+struct cpuid_tsc_info {
+	unsigned int denominator;
+	unsigned int numerator;
+	unsigned int crystal_khz;
+	unsigned int tsc_khz;
+};
+extern int cpuid_get_tsc_info(struct cpuid_tsc_info *info);
+extern int cpuid_get_tsc_freq(struct cpuid_tsc_info *info);
+
 extern void tsc_early_init(void);
 extern void tsc_init(void);
 extern void mark_tsc_unstable(char *reason);
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index c5110eb554bc..f92236f40cbc 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -658,46 +658,67 @@ static unsigned long quick_pit_calibrate(void)
 	return delta;
 }
 
+int cpuid_get_tsc_info(struct cpuid_tsc_info *info)
+{
+	unsigned int ecx_hz, edx;
+
+	memset(info, 0, sizeof(*info));
+
+	if (boot_cpu_data.cpuid_level < CPUID_LEAF_TSC)
+		return -ENOENT;
+
+	/* CPUID 15H TSC/Crystal ratio, plus optionally Crystal Hz */
+	cpuid(CPUID_LEAF_TSC, &info->denominator, &info->numerator, &ecx_hz, &edx);
+
+	if (!info->denominator || !info->numerator)
+		return -ENOENT;
+
+	/*
+	 * Note, some CPUs provide the multiplier information, but not the core
+	 * crystal frequency.  The multiplier information is still useful for
+	 * such CPUs, as the crystal frequency can be gleaned from CPUID.0x16.
+	 */
+	info->crystal_khz = ecx_hz / 1000;
+	return 0;
+}
+
+int cpuid_get_tsc_freq(struct cpuid_tsc_info *info)
+{
+	if (cpuid_get_tsc_info(info) || !info->crystal_khz)
+		return -ENOENT;
+
+	info->tsc_khz = info->crystal_khz * info->numerator / info->denominator;
+	return 0;
+}
+
 /**
  * native_calibrate_tsc - determine TSC frequency
  * Determine TSC frequency via CPUID, else return 0.
  */
 unsigned long native_calibrate_tsc(void)
 {
-	unsigned int eax_denominator, ebx_numerator, ecx_hz, edx;
-	unsigned int crystal_khz;
+	struct cpuid_tsc_info info;
 
 	if (boot_cpu_data.x86_vendor != X86_VENDOR_INTEL)
 		return 0;
 
-	if (boot_cpu_data.cpuid_level < CPUID_LEAF_TSC)
+	if (cpuid_get_tsc_info(&info))
 		return 0;
 
-	eax_denominator = ebx_numerator = ecx_hz = edx = 0;
-
-	/* CPUID 15H TSC/Crystal ratio, plus optionally Crystal Hz */
-	cpuid(CPUID_LEAF_TSC, &eax_denominator, &ebx_numerator, &ecx_hz, &edx);
-
-	if (ebx_numerator == 0 || eax_denominator == 0)
-		return 0;
-
-	crystal_khz = ecx_hz / 1000;
-
 	/*
 	 * Denverton SoCs don't report crystal clock, and also don't support
 	 * CPUID_LEAF_FREQ for the calculation below, so hardcode the 25MHz
 	 * crystal clock.
 	 */
-	if (crystal_khz == 0 &&
-			boot_cpu_data.x86_vfm == INTEL_ATOM_GOLDMONT_D)
-		crystal_khz = 25000;
+	if (!info.crystal_khz && boot_cpu_data.x86_vfm == INTEL_ATOM_GOLDMONT_D)
+		info.crystal_khz = 25000;
 
 	/*
 	 * TSC frequency reported directly by CPUID is a "hardware reported"
 	 * frequency and is the most accurate one so far we have. This
 	 * is considered a known frequency.
 	 */
-	if (crystal_khz != 0)
+	if (info.crystal_khz)
 		setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
 
 	/*
@@ -705,15 +726,15 @@ unsigned long native_calibrate_tsc(void)
 	 * clock, but we can easily calculate it to a high degree of accuracy
 	 * by considering the crystal ratio and the CPU speed.
 	 */
-	if (crystal_khz == 0 && boot_cpu_data.cpuid_level >= CPUID_LEAF_FREQ) {
+	if (!info.crystal_khz && boot_cpu_data.cpuid_level >= CPUID_LEAF_FREQ) {
 		unsigned int eax_base_mhz, ebx, ecx, edx;
 
 		cpuid(CPUID_LEAF_FREQ, &eax_base_mhz, &ebx, &ecx, &edx);
-		crystal_khz = eax_base_mhz * 1000 *
-			eax_denominator / ebx_numerator;
+		info.crystal_khz = eax_base_mhz * 1000 *
+			info.denominator / info.numerator;
 	}
 
-	if (crystal_khz == 0)
+	if (!info.crystal_khz)
 		return 0;
 
 	/*
@@ -730,10 +751,10 @@ unsigned long native_calibrate_tsc(void)
 	 * lapic_timer_period here to avoid having to calibrate the APIC
 	 * timer later.
 	 */
-	lapic_timer_period = crystal_khz * 1000 / HZ;
+	lapic_timer_period = info.crystal_khz * 1000 / HZ;
 #endif
 
-	return crystal_khz * ebx_numerator / eax_denominator;
+	return info.crystal_khz * info.numerator / info.denominator;
 }
 
 static unsigned long cpu_khz_from_cpuid(void)
-- 
2.54.0.563.g4f69b47b94-goog


