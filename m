Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNN+FEFyB2qd3wIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 21:21:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5456556AFE
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 21:21:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1310294.1581212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNy6C-000690-Vh; Fri, 15 May 2026 19:21:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1310294.1581212; Fri, 15 May 2026 19:21:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNy6C-00066d-Rv; Fri, 15 May 2026 19:21:28 +0000
Received: by outflank-mailman (input) for mailman id 1310294;
 Fri, 15 May 2026 19:21:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3NHIHagYKCY09vr40tx55x2v.t53Ev4-uvCv22z9A9.Ev46850vtA.58x@flex--seanjc.bounces.google.com>)
 id 1wNy6B-00064U-Hv
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 19:21:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNy6A-0039we-UL
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 21:21:26 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3NHIHagYKCY09vr40tx55x2v.t53Ev4-uvCv22z9A9.Ev46850vtA.58x@flex--seanjc.bounces.google.com>)
 id 6a0771e7-5cb7-0a2a0a5109dd-0a2a4507aa8c-42
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 21:21:26 +0200
Received: from [209.85.215.201] (helo=mail-pg1-f201.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3NHIHagYKCY09vr40tx55x2v.t53Ev4-uvCv22z9A9.Ev46850vtA.58x@flex--seanjc.bounces.google.com>)
 id 6a077235-229c-0a2a45070019-d155d7c9c938-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 21:21:26 +0200
Received: by mail-pg1-f201.google.com with SMTP id
 41be03b00d2f7-c828b1b7fddso60028a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 12:21:26 -0700 (PDT)
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
        d=google.com; s=20251104; t=1778872885; x=1779477685; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=5BJQi7ZR1svDe2KF7RHkPrmL6MBNA7Dkc8gFvThdUD0=;
        b=uRLv+LzdA0cDNLipZ3eejmsfPb//TmpL8yn4dH6B8W60dNkBg10r4HSL54xqTzAmfi
         XjDOj4VZvP7hzRktAyqVYY6ItEojjqNmsAd8/7Tp5Yr0TbmIr+rPHK+Y3HtK1fyfdWSa
         7zNcK4yx27TYcPdjmZgtAPLQtB188jJTiaYE1dChA7j8Uh/3IB2yDmQrFkkYeYPLxZQM
         K3QOZps4Ijy6Cq2nVZp0NlccxpWkUmOqwvs0eSOteJp+uHbosFPjQ2IYTI5P/U1jTvT5
         3M56Y61gco2K9lmGTLw86m40Si076KtCksHUy0eq3TCR8CxWOqCTxyRT2TS3IdF6oD2a
         hrBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778872885; x=1779477685;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5BJQi7ZR1svDe2KF7RHkPrmL6MBNA7Dkc8gFvThdUD0=;
        b=oUlnKB2dioVhF1VKRDxeeNCiaTTUTchgEWxICE6U53AbUnI6In06htLvwE+wogPoUT
         3nAYJV5CDraqGBiwNzfGP4XkVoLL3i4zmCdHyNXmPq3eB2RZFi5t4EUTP9RFQHJjhQSd
         e/uR0gqkcPpnXJhOg7uzbVFx/PY9pWAhmRC0rGrqwpLOCxiSmLP6TAu/xsKCG3IVaHnI
         PLn2Ivwy5FCHwnG3tFvTxZzTAl66AFu3IiTkvQ5i0h/bcBjkoh43DgBhjA56/Y2660Yw
         D1gtGeDKtz04xBn/MNfpOHFxtJ60yZuHCVFhOTUdACC8Zfa6GmCsRN/mnHAcFQrQzBP1
         mN4w==
X-Forwarded-Encrypted: i=1; AFNElJ8xfyK3LD67WWMPdQEmivuduuHt64J/yldjqyEzSXJGlGlEoF1JqfXw2KQ6DTlaDu3YNmIzn1P5Cj0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxnPKMMAdmOdVBWBWopa9+HX0sySbqEaM9chX/xFZxKaD1lL9rK
	YnTmuoUYHWQwRjQ0m6sk94QrrfXxLE4clNwdzJOwCVIUqGEhKyTNu4VDlePRWNoS0RM81lySN4B
	4OgowDQ==
X-Received: from pfbeq4.prod.google.com ([2002:a05:6a00:37c4:b0:82f:344e:386a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:9502:b0:838:1c02:2763
 with SMTP id d2e1a72fcca58-83f33ab667bmr5736284b3a.9.1778872884225; Fri, 15
 May 2026 12:21:24 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 15 May 2026 12:19:42 -0700
In-Reply-To: <20260515191942.1892718-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260515191942.1892718-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260515191942.1892718-42-seanjc@google.com>
Subject: [PATCH v3 41/41] x86/kvmclock: Get CPU base frequency from CPUID when
 it's available
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
X-purgate-ID: tlsNG-ef75cf/1778872886-28C7DC48-DEB56334/0/0
X-purgate-type: clean
X-purgate-size: 1663
X-Rspamd-Queue-Id: C5456556AFE
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

If CPUID.0x16 is present and valid, use the CPU frequency provided by
CPUID instead of assuming that the virtual CPU runs at the same
frequency as TSC and/or kvmclock.  Back before constant TSCs were a
thing, treating the TSC and CPU frequencies as one and the same was
somewhat reasonable, but now it's nonsensical, especially if the
hypervisor explicitly enumerates the CPU frequency.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 62c8ea2e6769..7607920ae386 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -190,6 +190,20 @@ void kvmclock_cpu_action(enum kvm_guest_cpu_action action)
 	}
 }
 
+static unsigned long kvm_get_cpu_khz(void)
+{
+	unsigned int cpu_khz;
+
+	/*
+	 * Prefer CPUID over kvmclock when possible, as the base CPU frequency
+	 * isn't necessarily the same as the kvmlock "TSC" frequency.
+	 */
+	if (!cpuid_get_cpu_freq(&cpu_khz))
+		return cpu_khz;
+
+	return pvclock_tsc_khz(this_cpu_pvti());
+}
+
 /*
  * If we don't do that, there is the possibility that the guest
  * will calibrate under heavy load - thus, getting a lower lpj -
@@ -434,7 +448,7 @@ void __init kvmclock_init(void)
 		kvm_sched_clock_init(stable);
 	}
 
-	tsc_register_calibration_routines(kvm_get_tsc_khz, kvm_get_tsc_khz,
+	tsc_register_calibration_routines(kvm_get_tsc_khz, kvm_get_cpu_khz,
 					  tsc_properties);
 
 	x86_platform.get_wallclock = kvm_get_wallclock;
-- 
2.54.0.563.g4f69b47b94-goog


