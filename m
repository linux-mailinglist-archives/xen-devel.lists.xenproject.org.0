Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id X1V2B2prRWq7/goAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 21:32:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B62A76F0E3F
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 21:32:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=LjMGxlcZ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=google.com
Received: from list by lists.xenproject.org with outflank-mailman.1350374.1607888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0fq-0001Fo-7i; Wed, 01 Jul 2026 19:32:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350374.1607888; Wed, 01 Jul 2026 19:32:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0fp-0001B4-Tw; Wed, 01 Jul 2026 19:32:41 +0000
Received: by outflank-mailman (input) for mailman id 1350374;
 Wed, 01 Jul 2026 19:32:40 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3VGtFagYKCZkL73GC59HH9E7.5HFQ7G-67O7EEBLML.Q7GIKHC75M.HK9@flex--seanjc.bounces.google.com>)
 id 1wf0fo-0000nC-2S
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 19:32:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wf0fn-009wqs-FV
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 21:32:39 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3VGtFagYKCZkL73GC59HH9E7.5HFQ7G-67O7EEBLML.Q7GIKHC75M.HK9@flex--seanjc.bounces.google.com>)
 id 6a456b4a-e002-0a2a0a5209dd-0a2a45049d7c-34
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:32:39 +0200
Received: from [209.85.210.202] (helo=mail-pf1-f202.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3VGtFagYKCZkL73GC59HH9E7.5HFQ7G-67O7EEBLML.Q7GIKHC75M.HK9@flex--seanjc.bounces.google.com>)
 id 6a456b55-a01d-0a2a45040019-d155d2cacc45-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:32:39 +0200
Received: by mail-pf1-f202.google.com with SMTP id
 d2e1a72fcca58-847a90cc5e2so1364488b3a.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 12:32:38 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782934357; x=1783539157; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=f4XM+SKEbnv+9fV8zEMQX/tlhGFDki//v0QnInqZVcA=;
        b=LjMGxlcZe9/21PnqsFCidISoH4+TMUcyJBOijy9FCEn+u+0iZHcoMUmLqKUX6y5ZVO
         bo/FOer8XdjdunOfT2tDkjFHI/4cYysJzS7AfiiZshQ2pyPXtzD9bRSdVrwFjWIeBGWa
         zWdQLFDf8gX+oju+QhL7tjFIm06VymrFj9u/jpKT2e/j4QcQ/oM0SKfGujWY7NmrtfWh
         9KSNxIXRU5PAvNqFxoPxtqu5q+vnNyAHK6bDrnFdvqDdzEGcQPzxzWUKrxs0xfO3RFaH
         XNn8qIrCGefoV2ShdQsEjf2vilAXwO1P9Dzm1R0B6l7imZtTPqn53YTswxBshs32Sqfx
         dAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934357; x=1783539157;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f4XM+SKEbnv+9fV8zEMQX/tlhGFDki//v0QnInqZVcA=;
        b=Q8OSZ9uifmUQn+HDwKLhSOABeql6O22F3E0diz1pcD4K4WOthfbj4WSXX2Zjk81IDj
         3L6ibpEqu+up8R4EhitEkDhWNjTTGPwxVvFEVg1A+MWrmOYOTyROW7Gxl9Q1h4aRPqAd
         FTBMJUH2u50aqmNRLxgSql+D32aWj/W5dkvK5CUCHWy/h48K+HCiT7DJ95akNMfePEzk
         AsBJ9lKqDpuZXKQi8pOGMK8jHA4k0UIGsEq+gdvu9HhAFiIRoWq7d1coKM8+wDomybNO
         an4OJN31miTq6RWkJCxt0KV3kjLv1JWt3IvRbM3ap/dtVGHups8qqG4hDJUiPDdvr4MF
         s52A==
X-Forwarded-Encrypted: i=1; AFNElJ9Jeq2UUfbQ5qImPL1HZ9SpkY1q5ORzNYn9P98mIkeluIHeBhU9gY/H4Gm9Q9R7bbuhAmHI8bTfskM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy0Tk3Vch6lKIZH57XDngi5mQqcHCQx/E24KTdnnMpD3I0n8mrT
	jrDsJkMMR78Sl0Acauu01HhdJpMSeyr15eeusjYnHwcGi6vrmPtO+NWoLttUmST93ke/hcBFwll
	sIgvk9A==
X-Received: from pgge10.prod.google.com ([2002:a63:db0a:0:b0:c8c:b193:3b13])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:a104:b0:3bf:6c08:fb81
 with SMTP id adf61e73a8af0-3bfed44c700mr3262662637.49.1782934356969; Wed, 01
 Jul 2026 12:32:36 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:31:30 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-10-seanjc@google.com>
Subject: [PATCH v5 09/51] x86/tsc: Add a standalone helper for getting TSC
 info from CPUID.0x15
From: Sean Christopherson <seanjc@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Sean Christopherson <seanjc@google.com>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, John Stultz <jstultz@google.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev, 
	xen-devel@lists.xenproject.org, Tom Lendacky <thomas.lendacky@amd.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, David Woodhouse <dwmw@amazon.co.uk>, 
	David Woodhouse <dwmw2@infradead.org>, Michael Kelley <mhklinux@outlook.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-ebf023/1782934359-ACB3B1CC-91C33C96/0/0
X-purgate-type: clean
X-purgate-size: 4244
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,zytor.com,redhat.com,broadcom.com,oracle.com,kernel.org,vger.kernel.org,lists.linux.dev,lists.xenproject.org,amd.com,amazon.co.uk,infradead.org,outlook.com,linutronix.de];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:pbonzini@redhat.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:kas@kernel.org,m:rick.p.edgecombe@intel.com,m:seanjc@google.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:jan.kiszka@siemens.com,m:luto@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:daniel.lezcano@kernel.org,m:jstultz@google.com,m:skhan@linuxfoundation.org,m:hpa@zytor.com,m:vkuznets@redhat.com,m:bcm-kernel-feedback-list@broadcom.com,m:boris.ostrovsky@oracle.com,m:sboyd@kernel.org,m:linux-doc@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-coco@lists.linux.dev,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:thomas.lendacky@amd.com,m:nikunj@amd.com,m:dwmw@amazon.co.uk,m:dwmw2@infradead.org,m:mhklinux@outlook.com
 ,m:tglx@linutronix.de,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_TWELVE(0.00)[42];
	FORGED_SENDER(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[seanjc@google.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,amazon.co.uk:email];
	FROM_NEQ_ENVFROM(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B62A76F0E3F

Extract retrieval of TSC frequency information from CPUID into a standalone
helper so that TDX guest support can reuse the logic.

Opportunistically drop native_calibrate_tsc()'s "== 0" and "!= 0" checks
in favor of the kernel's preferred style.

No functional change intended.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/tsc.c | 61 +++++++++++++++++++++++++++----------------
 1 file changed, 38 insertions(+), 23 deletions(-)

diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index f049c126e47c..12043812c8f5 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -645,46 +645,62 @@ static unsigned long quick_pit_calibrate(void)
 	return delta;
 }
 
+struct cpuid_tsc_info {
+	unsigned int denominator;
+	unsigned int numerator;
+	unsigned int crystal_khz;
+};
+
+static int cpuid_get_tsc_info(struct cpuid_tsc_info *info)
+{
+	unsigned int ecx_hz, edx;
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
+	 * Note: some CPUs provide the multiplier information, but not the core
+	 * crystal frequency.  The multiplier information is still useful for
+	 * such CPUs, as the crystal frequency can be gleaned from CPUID.0x16.
+	 */
+	info->crystal_khz = ecx_hz / 1000;
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
@@ -692,15 +708,14 @@ unsigned long native_calibrate_tsc(void)
 	 * clock, but we can easily calculate it to a high degree of accuracy
 	 * by considering the crystal ratio and the CPU speed.
 	 */
-	if (crystal_khz == 0 && boot_cpu_data.cpuid_level >= CPUID_LEAF_FREQ) {
+	if (!info.crystal_khz && boot_cpu_data.cpuid_level >= CPUID_LEAF_FREQ) {
 		unsigned int eax_base_mhz, ebx, ecx, edx;
 
 		cpuid(CPUID_LEAF_FREQ, &eax_base_mhz, &ebx, &ecx, &edx);
-		crystal_khz = eax_base_mhz * 1000 *
-			eax_denominator / ebx_numerator;
+		info.crystal_khz = eax_base_mhz * 1000 * info.denominator / info.numerator;
 	}
 
-	if (crystal_khz == 0)
+	if (!info.crystal_khz)
 		return 0;
 
 	/*
@@ -716,9 +731,9 @@ unsigned long native_calibrate_tsc(void)
 	 * lapic_timer_period here to avoid having to calibrate the APIC
 	 * timer later.
 	 */
-	apic_set_timer_period_khz(crystal_khz, "CPUID 0x15/0x16");
+	apic_set_timer_period_khz(info.crystal_khz, "CPUID 0x15/0x16");
 
-	return crystal_khz * ebx_numerator / eax_denominator;
+	return info.crystal_khz * info.numerator / info.denominator;
 }
 
 static unsigned long cpu_khz_from_cpuid(void)
-- 
2.55.0.rc0.799.gd6f94ed593-goog


