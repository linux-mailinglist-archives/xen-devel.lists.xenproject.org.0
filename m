Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8421A246AF
	for <lists+xen-devel@lfdr.de>; Sat,  1 Feb 2025 03:20:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880128.1290349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1te37h-0002cm-F8; Sat, 01 Feb 2025 02:20:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880128.1290349; Sat, 01 Feb 2025 02:20:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1te37h-0002a9-Bo; Sat, 01 Feb 2025 02:20:41 +0000
Received: by outflank-mailman (input) for mailman id 880128;
 Sat, 01 Feb 2025 02:20:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LHbF=UY=flex--seanjc.bounces.google.com=3U4SdZwYKCRYE0w95y2AA270.yA8J09-z0H0774EFE.J09BDA50yF.AD2@srs-se1.protection.inumbo.net>)
 id 1te359-0002sH-9m
 for xen-devel@lists.xenproject.org; Sat, 01 Feb 2025 02:18:03 +0000
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [2607:f8b0:4864:20::104a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bfaa0c4c-e042-11ef-a0e6-8be0dac302b0;
 Sat, 01 Feb 2025 03:17:56 +0100 (CET)
Received: by mail-pj1-x104a.google.com with SMTP id
 98e67ed59e1d1-2eebfd6d065so7097197a91.3
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jan 2025 18:17:56 -0800 (PST)
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
X-Inumbo-ID: bfaa0c4c-e042-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738376275; x=1738981075; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=SJJEXGT/CGEg26HmUNCtCBi/lOkkZBhLk4mR9XODbn0=;
        b=t6rzrq9+t+xZ12KuS63bQ3TIW3JqHecj53fMRv3LMU6y4GVMSwBcV5QgS2owJfa/pu
         8QmoXscGuEflNHY+3sONOneb5xPntBIbsXfBbwbBF5yeF2fmC4Hp8rAESa2UJ7Qs1cgJ
         FbRgDRnkcuKqGEGjv1zaaz/SGXfLtgXvDewcIX8gUFrP6HV/RKh5s2mHNFLCBljiW6kG
         LVsc9J+Du4U+Unjn5RcZQo3kaxWymUdLZkDjaFYe11dvIF8udFVc8Qm0g5h5DbMhh2ph
         pL8WdvGmsVQctYk3OVyd1CitaPoibkC+iSq6eOV60ne21GoegksD7UrcCOVMyLVbj403
         aAlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738376275; x=1738981075;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SJJEXGT/CGEg26HmUNCtCBi/lOkkZBhLk4mR9XODbn0=;
        b=i8gJtzcLUnTEZ9K50asKOEFDo7qqAKTwXYudg4X6OKGhzsubSGgXAXNPL7CY5zNXvH
         zDPcH2zkN3UflBJYKDkHpgpAmrrTXeQGrgoLgQID0cMNGdHnVn+QgtcUyKLV1fYIGWH3
         f4CDN9xQIHjtn3CwJkD7+VET7kU4oBPNu5GqD+2/5JMVs8njflZK2Cssd64jHEhnCSh5
         DTh9rAYsz3pkFzFbey3QBcnAlKrW2vWfEBXpEN2FdcqO+1UmW8Wsk7FoTKMwBQ7vNSOb
         mN7oOB8+j/XuvhLzxqsK12YJq2jstUu2LOENTR9SOG7k3U6xKq2QgupwGyPjjMzVPgS7
         IL2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWfCACJ68NE56+RFSM56M3a9pJoaOP0BzJivBFlQ4E8g6iCRv7+6QwMpsbj/C1eo4TUqpFLwvCU3SE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxy2Lb1js+yM08p8qxzrTrjX6Jv192MsswVnRE98X+9hItWMhWm
	r8+e3p8739vfhkUtofXED1W5pYpuTRjZhK+ouehnufcGKlcoNvq9FRLrErXnSvo4JSkEz1BlnrW
	mOA==
X-Google-Smtp-Source: AGHT+IGR6HwuD9w+8Kze6jNqduo1hcKEvlqzGV2yi3bR0PK9E6ixYJtwZg6BVPpJ2g9E6rQRruKKBVyC7NI=
X-Received: from pjtu8.prod.google.com ([2002:a17:90a:c888:b0:2f7:f660:cfe7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2702:b0:2f4:4003:f3d4
 with SMTP id 98e67ed59e1d1-2f83ac83632mr19746549a91.30.1738376275470; Fri, 31
 Jan 2025 18:17:55 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 31 Jan 2025 18:17:18 -0800
In-Reply-To: <20250201021718.699411-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250201021718.699411-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250201021718.699411-17-seanjc@google.com>
Subject: [PATCH 16/16] x86/kvmclock: Use TSC for sched_clock if it's constant
 and non-stop
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

Prefer the TSC over kvmclock for sched_clock if the TSC is constant,
nonstop, and not marked unstable via command line.  I.e. use the same
criteria as tweaking the clocksource rating so that TSC is preferred over
kvmclock.  Per the below comment from native_sched_clock(), sched_clock
is more tolerant of slop than clocksource; using TSC for clocksource but
not sched_clock makes little to no sense, especially now that KVM CoCo
guests with a trusted TSC use TSC, not kvmclock.

        /*
         * Fall back to jiffies if there's no TSC available:
         * ( But note that we still use it if the TSC is marked
         *   unstable. We do this because unlike Time Of Day,
         *   the scheduler clock tolerates small errors and it's
         *   very important for it to be as fast as the platform
         *   can achieve it. )
         */

The only advantage of using kvmclock is that doing so allows for early
and common detection of PVCLOCK_GUEST_STOPPED, but that code has been
broken for nearly two years with nary a complaint, i.e. it can't be
_that_ valuable.  And as above, certain types of KVM guests are losing
the functionality regardless, i.e. acknowledging PVCLOCK_GUEST_STOPPED
needs to be decoupled from sched_clock() no matter what.

Link: https://lore.kernel.org/all/Z4hDK27OV7wK572A@google.com
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 9d05d070fe25..fb8cd8313d18 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -344,23 +344,23 @@ void __init kvmclock_init(void)
 		pvclock_set_flags(PVCLOCK_TSC_STABLE_BIT);
 
 	/*
-	 * X86_FEATURE_NONSTOP_TSC is TSC runs at constant rate
-	 * with P/T states and does not stop in deep C-states.
-	 *
-	 * Invariant TSC exposed by host means kvmclock is not necessary:
-	 * can use TSC as clocksource.
-	 *
+	 * If the TSC counts at a constant frequency across P/T states, counts
+	 * in deep C-states, and the TSC hasn't been marked unstable, prefer
+	 * the TSC over kvmclock for sched_clock and drop kvmclock's rating so
+	 * that TSC is chosen as the clocksource.  Note, the TSC unstable check
+	 * exists purely to honor the TSC being marked unstable via command
+	 * line, any runtime detection of an unstable will happen after this.
 	 */
 	if (boot_cpu_has(X86_FEATURE_CONSTANT_TSC) &&
 	    boot_cpu_has(X86_FEATURE_NONSTOP_TSC) &&
 	    !check_tsc_unstable()) {
 		kvm_clock.rating = 299;
 		tsc_properties = TSC_FREQ_KNOWN_AND_RELIABLE;
+	} else {
+		flags = pvclock_read_flags(&hv_clock_boot[0].pvti);
+		kvm_sched_clock_init(flags & PVCLOCK_TSC_STABLE_BIT);
 	}
 
-	flags = pvclock_read_flags(&hv_clock_boot[0].pvti);
-	kvm_sched_clock_init(flags & PVCLOCK_TSC_STABLE_BIT);
-
 	tsc_register_calibration_routines(kvm_get_tsc_khz, kvm_get_cpu_khz,
 					  tsc_properties);
 
@@ -369,6 +369,11 @@ void __init kvmclock_init(void)
 #ifdef CONFIG_X86_LOCAL_APIC
 	x86_cpuinit.early_percpu_clock_init = kvm_setup_secondary_clock;
 #endif
+	/*
+	 * Save/restore "sched" clock state even if kvmclock isn't being used
+	 * for sched_clock, as kvmclock is still used for wallclock and relies
+	 * on these hooks to re-enable kvmclock after suspend+resume.
+	 */
 	x86_platform.save_sched_clock_state = kvm_save_sched_clock_state;
 	x86_platform.restore_sched_clock_state = kvm_restore_sched_clock_state;
 	kvm_get_preset_lpj();
-- 
2.48.1.362.g079036d154-goog


