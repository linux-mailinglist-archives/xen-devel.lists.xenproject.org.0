Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NaHGo6mGWruyAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 16:45:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22308603DAB
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 16:45:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1322231.1588591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSySh-0007Mw-Ow; Fri, 29 May 2026 14:45:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1322231.1588591; Fri, 29 May 2026 14:45:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSySg-0006x4-Fh; Fri, 29 May 2026 14:45:22 +0000
Received: by outflank-mailman (input) for mailman id 1322231;
 Fri, 29 May 2026 14:45:18 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3eqYZagYKCYU1njwslpxxpun.lxv6nw-mn4nuur121.6nwy0xsnl2.x0p@flex--seanjc.bounces.google.com>)
 id 1wSySb-0006AC-Hh
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 14:45:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSySa-00BR7N-TT
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 16:45:16 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3eqYZagYKCYU1njwslpxxpun.lxv6nw-mn4nuur121.6nwy0xsnl2.x0p@flex--seanjc.bounces.google.com>)
 id 6a19a670-5cb7-0a2a0a5109dd-0a2a45079b98-38
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 16:45:16 +0200
Received: from [209.85.214.201] (helo=mail-pl1-f201.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3eqYZagYKCYU1njwslpxxpun.lxv6nw-mn4nuur121.6nwy0xsnl2.x0p@flex--seanjc.bounces.google.com>)
 id 6a19a67b-229c-0a2a45070019-d155d6c9a517-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 16:45:16 +0200
Received: by mail-pl1-f201.google.com with SMTP id
 d9443c01a7336-2bf11699875so19125195ad.1
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 07:45:16 -0700 (PDT)
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
        d=google.com; s=20251104; t=1780065915; x=1780670715; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=33AEblmPZenCG7ncxIbBQYlPZl7MWXLQcjQTaHUg1Zw=;
        b=d1LTvsuQnIoy+PIGbkjWvU0lmVsHG7Tk9PePtk8hEEa1lCxDoCuUZArBBrT/uT56Xd
         KI54wWEPs/eTRFILwrvaMRMCLnbVHCtotAjPaay9N/XNPWVkK6BBMla1rZsXmSDFO7t2
         izl72tYT7Sw8TwOsv/7l6VjqUul4CHs8bvYWqHU4frgMU4wd9A7+Qspt1+Kn6LqiShQE
         hX9WPxj63+a8mJzQ6tHauVknMfJksIAh7x0EHu5AoLsirGqR6v1zhXw5RLVLNo9rp8UA
         uOM1YWCODKMBXN8QTGI4eSWJF1yKxiAfsnsEB9PPpUtgoSCwlQBHEXiiFlRdklpSV1Ly
         W5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065915; x=1780670715;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=33AEblmPZenCG7ncxIbBQYlPZl7MWXLQcjQTaHUg1Zw=;
        b=lLef64oPTRx2d74sTjEv27Pou2o1qqmg+VPmudtpXnfUYdlEOQC909dseATceAwDYp
         5HjAZhcCQvteJKLzpnhgAaohp1vSYfohq1dUUUYg9HKxaxvsK5euJbB7h9oO6KJjFcNa
         n32JfO23oY4Xt3IX60nnc9ylzja3kyN+9Vqu+18tji92/3nmU71hkX2lbikkn1WFgAx0
         lDsm8UcUBzb/8EB9iXXIiPepXRyN5RWxOa/oEbbOvTpQLGF21uTce9NMsGtJfAPhIQe8
         7yI8tvE+Z/snXrM+Y1OILV8l31Axr6GPIHMyhVV8LBOwtHtGHyr5d5zTm/gSuemyr1We
         zmYQ==
X-Forwarded-Encrypted: i=1; AFNElJ/5tCwO+2kRmHhK4GmoJCrlICfr3ma8+weMkr0wqfsnIk+z9VtBFb8NSoKtk93hXnAGR5d6O3Pf+yo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwLetWGkcRXS8W8rzpo8jswl4h+dn0pY98j3v2R9kUVBSo6tpUr
	qw4FapTbX6kqZjWZzzCD239Yn59Pkcm//LTdDfk8ynMIRfOxLV+E/RcgOVcoor8A+c2ZaOQMhf6
	6obtLqw==
X-Received: from plaq13.prod.google.com ([2002:a17:903:204d:b0:2bf:68:53db])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ffcb:b0:2b9:cabe:ce37
 with SMTP id d9443c01a7336-2bf204679c2mr35097225ad.1.1780065914467; Fri, 29
 May 2026 07:45:14 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 29 May 2026 07:44:06 -0700
In-Reply-To: <20260529144435.704127-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260529144435.704127-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529144435.704127-20-seanjc@google.com>
Subject: [PATCH v4 19/47] x86/tsc: Add standalone helper for getting CPU
 frequency from CPUID
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
X-purgate-ID: tlsNG-ef75cf/1780065916-0A16DC48-AF566691/0/0
X-purgate-type: clean
X-purgate-size: 2830
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
X-Rspamd-Queue-Id: 22308603DAB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Extract the guts of cpu_khz_from_cpuid() to a standalone helper that
doesn't restrict the usage to Intel CPUs.  This will allow sharing the
core logic with KVM-as-a-guest, as KVM generally doesn't restrict CPUID
based on vendor.

No functional change intended.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/tsc.h |  1 +
 arch/x86/kernel/tsc.c      | 32 +++++++++++++++-----------------
 2 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/arch/x86/include/asm/tsc.h b/arch/x86/include/asm/tsc.h
index 4a224f99c3b9..7ff2bfdcdf38 100644
--- a/arch/x86/include/asm/tsc.h
+++ b/arch/x86/include/asm/tsc.h
@@ -90,6 +90,7 @@ struct cpuid_tsc_info {
 	unsigned int tsc_khz;
 };
 extern int __init cpuid_get_tsc_freq(struct cpuid_tsc_info *info);
+extern unsigned int __cpu_khz_from_cpuid(void);
 
 extern void tsc_early_init(void);
 extern void tsc_init(void);
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 3e911f0f7364..bdff8c988866 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -692,6 +692,18 @@ int __init cpuid_get_tsc_freq(struct cpuid_tsc_info *info)
 	return 0;
 }
 
+unsigned int __cpu_khz_from_cpuid(void)
+{
+	unsigned int eax_base_mhz, ebx, ecx, edx;
+
+	if (boot_cpu_data.cpuid_level < CPUID_LEAF_FREQ)
+		return 0;
+
+	cpuid(CPUID_LEAF_FREQ, &eax_base_mhz, &ebx, &ecx, &edx);
+
+	return eax_base_mhz * 1000;
+}
+
 /**
  * native_calibrate_tsc - determine TSC frequency
  * Determine TSC frequency via CPUID, else return 0.
@@ -727,13 +739,8 @@ static unsigned long native_calibrate_tsc(void)
 	 * clock, but we can easily calculate it to a high degree of accuracy
 	 * by considering the crystal ratio and the CPU speed.
 	 */
-	if (!info.crystal_khz && boot_cpu_data.cpuid_level >= CPUID_LEAF_FREQ) {
-		unsigned int eax_base_mhz, ebx, ecx, edx;
-
-		cpuid(CPUID_LEAF_FREQ, &eax_base_mhz, &ebx, &ecx, &edx);
-		info.crystal_khz = eax_base_mhz * 1000 *
-			info.denominator / info.numerator;
-	}
+	if (!info.crystal_khz)
+		info.crystal_khz = __cpu_khz_from_cpuid() * info.denominator / info.numerator;
 
 	if (!info.crystal_khz)
 		return 0;
@@ -760,19 +767,10 @@ static unsigned long native_calibrate_tsc(void)
 
 static unsigned long cpu_khz_from_cpuid(void)
 {
-	unsigned int eax_base_mhz, ebx_max_mhz, ecx_bus_mhz, edx;
-
 	if (boot_cpu_data.x86_vendor != X86_VENDOR_INTEL)
 		return 0;
 
-	if (boot_cpu_data.cpuid_level < CPUID_LEAF_FREQ)
-		return 0;
-
-	eax_base_mhz = ebx_max_mhz = ecx_bus_mhz = edx = 0;
-
-	cpuid(CPUID_LEAF_FREQ, &eax_base_mhz, &ebx_max_mhz, &ecx_bus_mhz, &edx);
-
-	return eax_base_mhz * 1000;
+	return __cpu_khz_from_cpuid();
 }
 
 /*
-- 
2.54.0.823.g6e5bcc1fc9-goog


