Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEOKFo2mGWrtyAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 16:45:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEAC603D9A
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 16:45:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1322226.1588577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSySc-0006Jr-QL; Fri, 29 May 2026 14:45:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1322226.1588577; Fri, 29 May 2026 14:45:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSySc-0006B1-38; Fri, 29 May 2026 14:45:18 +0000
Received: by outflank-mailman (input) for mailman id 1322226;
 Fri, 29 May 2026 14:45:15 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3eKYZagYKCYMzlhuqjnvvnsl.jvt4lu-kl2lsspz0z.4luwyvqlj0.vyn@flex--seanjc.bounces.google.com>)
 id 1wSySZ-0005h2-8z
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 14:45:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSySY-00BR8Q-LK
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 16:45:14 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3eKYZagYKCYMzlhuqjnvvnsl.jvt4lu-kl2lsspz0z.4luwyvqlj0.vyn@flex--seanjc.bounces.google.com>)
 id 6a19a675-bab6-0a2a0a5309dd-0a2a450bdfe8-14
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 16:45:14 +0200
Received: from [209.85.214.202] (helo=mail-pl1-f202.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3eKYZagYKCYMzlhuqjnvvnsl.jvt4lu-kl2lsspz0z.4luwyvqlj0.vyn@flex--seanjc.bounces.google.com>)
 id 6a19a679-212f-0a2a450b0019-d155d6cab1d7-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 16:45:14 +0200
Received: by mail-pl1-f202.google.com with SMTP id
 d9443c01a7336-2bf30576aa3so2122645ad.3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 07:45:14 -0700 (PDT)
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
        d=google.com; s=20251104; t=1780065912; x=1780670712; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=3J4tSt2+/CTMv4tcKt5oCpoZW7w+XDXf08twJvjnqkg=;
        b=k/7vSZjGfhgLmvVz31GtsBc1e3yJM6epR4XtoNBxKt8DNq/4secfgzEVYm/l9XOpcL
         SPgDVC79JNWKWQGc+HAiJAAQfYt7alDJJIAgZk4nlPPolY2TP2VG4DKbBxFqNXX8sBta
         /SapJ/9KyDwy1dYg+3aORaZtDddwNADULkd6bh89z8NLuC2shUp7mFrjXWYvjXYeLIFZ
         y6Xif9JVYjZi1MV5ifuuTpSO3r8lmBOIOmSxTeoYk7UK9zym4YUX9/a+/VQNaFtc8GRE
         ksxN4f6zADYOkgy9X6/pgEVoRbu3zWtsrRQjNdzZzTRAhxxZPZ9NmAfILuSsqBI4uEOy
         W/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065912; x=1780670712;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3J4tSt2+/CTMv4tcKt5oCpoZW7w+XDXf08twJvjnqkg=;
        b=s2lY3Hl6WvxvfqF4Vglc94zdAWfSTDaPMCl+6OaodoEoJ7fNVvrmBGtgZ7Xo6eVZCv
         gDVfwkf1HFTLPK83kNfCoWOxY2OHbYCL2hRE1lo5bQr5rHiadoTYIcAODsbCkNS6KGSw
         RPq0AlA0Cs4AW+wwHK160ShlIQSmzj6gGiV2SHi98Kbq2aPNtzZvny/H3Lxd93rNHuC9
         NyR6hXi6cnyf5LxjKG4BOj3DvQWC503fFFztxIMXgRruKqpcVuGq/iVpy/6jXF0N6aJu
         E4QlHJtiOK3nPqaC1Mnk3cgK9s4kaB0MU8YH0qe7qaUHTtrzmDyhubmnxE4gU9PxQFxD
         sGxA==
X-Forwarded-Encrypted: i=1; AFNElJ9HYI63mWAhRMt2FFm5NKccmrCyk4MjnxerJlX7Q2PSGo9Cy6PgVwN8lgFAZ/XTdlLAUCZMO1stdSU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyIU1UjjpwSYLUbxrYt+sa/QDVhateiihWYIokQK2FNBoWmT1Z4
	kZ3Cy1B45Oaa88tQkX8apMKcHySZBUjRtFlzgd1tHN5MtLh8J9Ch2WXQZjFmiitiGvn1BnaD+Em
	8/bDE3w==
X-Received: from plbkk16.prod.google.com ([2002:a17:903:710:b0:2bf:222e:c947])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:15cf:b0:2b0:ac1e:9737
 with SMTP id d9443c01a7336-2bf367c2eb0mr1549335ad.12.1780065912148; Fri, 29
 May 2026 07:45:12 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 29 May 2026 07:44:04 -0700
In-Reply-To: <20260529144435.704127-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260529144435.704127-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529144435.704127-18-seanjc@google.com>
Subject: [PATCH v4 17/47] x86/kvm: Mark TSC as reliable when it's constant and nonstop
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
X-purgate-ID: tlsNG-42698a/1780065914-13F7EF3B-2BDF8279/0/0
X-purgate-type: clean
X-purgate-size: 4118
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
X-Rspamd-Queue-Id: 0FEAC603D9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Mark the TSC as reliable if the hypervisor (KVM) has enumerated the TSC
as constant and nonstop, and the admin hasn't explicitly marked the TSC
as unstable.  Like most (all?) virtualization setups, any secondary
clocksource that's used as a watchdog is guaranteed to be less reliable
than a constant, nonstop TSC, as all clocksources the kernel uses as a
watchdog are all but guaranteed to be emulated when running as a KVM
guest.  I.e. any observed discrepancies between the TSC and watchdog will
be due to jitter in the watchdog.

This is especially true for KVM, as the watchdog clocksource is usually
emulated in host userspace, i.e. reading the clock incurs a roundtrip
cost of thousands of cycles.

Marking the TSC reliable addresses a flaw where the TSC will occasionally
be marked unstable if the host is under moderate/heavy load.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_para.h |  2 +-
 arch/x86/kernel/kvm.c           | 16 +++++++++++++++-
 arch/x86/kernel/kvmclock.c      | 15 +++++----------
 3 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/arch/x86/include/asm/kvm_para.h b/arch/x86/include/asm/kvm_para.h
index 4a47c16e2df8..4a49fc286b4c 100644
--- a/arch/x86/include/asm/kvm_para.h
+++ b/arch/x86/include/asm/kvm_para.h
@@ -118,7 +118,7 @@ static inline long kvm_sev_hypercall3(unsigned int nr, unsigned long p1,
 }
 
 #ifdef CONFIG_KVM_GUEST
-void kvmclock_init(void);
+void kvmclock_init(bool prefer_tsc);
 void kvmclock_disable(void);
 bool kvm_para_available(void);
 unsigned int kvm_arch_para_features(void);
diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index 909d3e5e5bcd..4fe9c69bf40b 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -978,6 +978,7 @@ static void __init kvm_init_platform(void)
 		.mask_hi = (BIT_ULL(boot_cpu_data.x86_phys_bits) - 1) >> 32,
 	};
 	u32 timing_info_leaf;
+	bool tsc_is_reliable;
 
 	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) &&
 	    kvm_para_has_feature(KVM_FEATURE_MIGRATION_CONTROL)) {
@@ -1040,7 +1041,20 @@ static void __init kvm_init_platform(void)
 		}
 	}
 
-	kvmclock_init();
+        /*
+         * If the TSC counts at a constant frequency across P/T states, counts
+         * in deep C-states, and the TSC hasn't been marked unstable, treat the
+         * TSC reliable, as guaranteed by KVM.  Note, the TSC unstable check
+         * exists purely to honor the TSC being marked unstable via command
+         * line, any runtime detection of an unstable will happen after this.
+         */
+	tsc_is_reliable = boot_cpu_has(X86_FEATURE_CONSTANT_TSC) &&
+			  boot_cpu_has(X86_FEATURE_NONSTOP_TSC) &&
+			  !check_tsc_unstable();
+	if (tsc_is_reliable)
+		setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
+
+	kvmclock_init(tsc_is_reliable);
 	x86_platform.apic_post_init = kvm_apic_init;
 
 	/*
diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 404f60741aa8..69a15fbfb779 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -285,7 +285,7 @@ static int kvmclock_setup_percpu(unsigned int cpu)
 	return p ? 0 : -ENOMEM;
 }
 
-void __init kvmclock_init(void)
+void __init kvmclock_init(bool prefer_tsc)
 {
 	u8 flags;
 
@@ -334,16 +334,11 @@ void __init kvmclock_init(void)
 	kvm_get_preset_lpj();
 
 	/*
-	 * X86_FEATURE_NONSTOP_TSC is TSC runs at constant rate
-	 * with P/T states and does not stop in deep C-states.
-	 *
-	 * Invariant TSC exposed by host means kvmclock is not necessary:
-	 * can use TSC as clocksource.
-	 *
+	 * If TSC is preferred over kvmlock, drop kvmclock's rating so that TSC
+	 * is chosen as the clocksource (but still register kvmclock in case
+	 * the kernel doesn't want to use TSC for whatever reason).
 	 */
-	if (boot_cpu_has(X86_FEATURE_CONSTANT_TSC) &&
-	    boot_cpu_has(X86_FEATURE_NONSTOP_TSC) &&
-	    !check_tsc_unstable())
+	if (prefer_tsc)
 		kvm_clock.rating = 299;
 
 	clocksource_register_hz(&kvm_clock, NSEC_PER_SEC);
-- 
2.54.0.823.g6e5bcc1fc9-goog


