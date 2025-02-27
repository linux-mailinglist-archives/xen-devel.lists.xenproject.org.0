Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFEEA47285
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 03:25:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897470.1306193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTav-0006pO-QQ; Thu, 27 Feb 2025 02:25:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897470.1306193; Thu, 27 Feb 2025 02:25:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTav-0006lw-Kg; Thu, 27 Feb 2025 02:25:49 +0000
Received: by outflank-mailman (input) for mailman id 897470;
 Thu, 27 Feb 2025 02:25:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gOoK=VS=flex--seanjc.bounces.google.com=30Mu_ZwYKCasdPLYUNRZZRWP.NZXiPY-OPgPWWTded.iPYacZUPNe.ZcR@srs-se1.protection.inumbo.net>)
 id 1tnTVK-0005qU-BD
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 02:20:02 +0000
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [2607:f8b0:4864:20::104a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58d77496-f4b1-11ef-9aaf-95dc52dad729;
 Thu, 27 Feb 2025 03:20:01 +0100 (CET)
Received: by mail-pj1-x104a.google.com with SMTP id
 98e67ed59e1d1-2fe98fad333so1066307a91.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 18:20:01 -0800 (PST)
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
X-Inumbo-ID: 58d77496-f4b1-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740622800; x=1741227600; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=SUWURP6DS00BmWQuQkka/ewYMygd0uN/XlEQWE3xarE=;
        b=1SwvhmWWtXw3Y02jVM9OXi2DMHZlOTX4lVGk580BiDJ/dZX7fDCIwYBIVS3mdltBb+
         g/62CiA95WoicGEGR5sAjmaunnDYtD0NDoS6W7LxbGW6m1l4FF8rZz2+hPtPL08F84xd
         psacq1srYs4V1EL+lT1/4wmpGvrkCBJTXsmeIx4AiftR0/Y/lype2h2D89nGZYzSINbJ
         L5XuKQpLxGrQb3GAV5WTOPXHHelAAro9bYe7wV9pYAzvo/ZDPusMGl2zjBe5k18WeLkf
         BLYhrXBQnckWYYgZDF8khDtvAGYoUc1XE18YgGvaaKJUmAcWRcjOOVtoow7h3MQhw7BS
         p1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740622800; x=1741227600;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SUWURP6DS00BmWQuQkka/ewYMygd0uN/XlEQWE3xarE=;
        b=JK3oLNRQGC7oFhiscrR/yBiz7DvT78cVv1YgtQPKwLQn6bB6pluUxY5ruLYJXdQAL+
         4f4TmHSaNzpeuzZnu88nvpQrxBke9txCB3ixFHfFMoxe8WXD719blpSgcSfjQ4CHrX+T
         YVx8JFpMb1crYay1cVOODmpNoXnxPF5Guc9Kt6OO54fLoSyE15gJpZDaVXjnDQmN25g9
         dHEDVTYjhSI4GCoj2eH8YwEJrnM/FB9JSeMpeSL5G5/+yNUZNYMmraDwEBF/Zo1Avn46
         cQJrhDUfbTGQ5UjfHl+wDj7z2F6vF7C0vmvC3AqTTszrxoJ5H/5OncesD3Z/9uC8MGOY
         y+IA==
X-Forwarded-Encrypted: i=1; AJvYcCVJgNtI712FRPty8INGVHuEmIqiMuepl5jNzemvIR/lsrzmIp3oNPX1RXGzW2sEwPCa70DMRA9JSeM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyKlkQ0mfD/G6iaI+wzYjd3u0HsuksRPP4fvdAqwA2ery3CvWaB
	SU+aS1wTda+64ZwbqRYBTr7vWECCag8Er8TYsJSzLBrCwDvOTRsUotTTZ500ig0q7uAaj+ludS5
	rUA==
X-Google-Smtp-Source: AGHT+IEaJegSwuz7gp17gUBIq0YV/a5p90hmpWu2RxMMtE/LMlRmTHKg61dycPOdBb/l8JsfSEdKtOPrkAY=
X-Received: from pjboh8.prod.google.com ([2002:a17:90b:3a48:b0:2fc:2b96:2d4b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4fcf:b0:2f8:34df:5652
 with SMTP id 98e67ed59e1d1-2fce78beb41mr33366155a91.21.1740622800327; Wed, 26
 Feb 2025 18:20:00 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Feb 2025 18:18:49 -0800
In-Reply-To: <20250227021855.3257188-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250227021855.3257188-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227021855.3257188-34-seanjc@google.com>
Subject: [PATCH v2 33/38] x86/kvmclock: Mark TSC as reliable when it's
 constant and nonstop
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Juergen Gross <jgross@suse.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	John Stultz <jstultz@google.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, virtualization@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>
Content-Type: text/plain; charset="UTF-8"

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
 arch/x86/kernel/kvmclock.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index ce676e735ced..b924b19e8f0f 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -362,6 +362,7 @@ static void __init kvm_sched_clock_init(bool stable)
 
 void __init kvmclock_init(void)
 {
+	enum tsc_properties tsc_properties = TSC_FREQUENCY_KNOWN;
 	bool stable = false;
 
 	if (!kvm_para_available() || !kvmclock)
@@ -400,18 +401,6 @@ void __init kvmclock_init(void)
 			 PVCLOCK_TSC_STABLE_BIT;
 	}
 
-	kvm_sched_clock_init(stable);
-
-	tsc_register_calibration_routines(kvm_get_tsc_khz, kvm_get_tsc_khz,
-					  TSC_FREQUENCY_KNOWN);
-
-	x86_platform.get_wallclock = kvm_get_wallclock;
-	x86_platform.set_wallclock = kvm_set_wallclock;
-#ifdef CONFIG_SMP
-	x86_cpuinit.early_percpu_clock_init = kvm_setup_secondary_clock;
-#endif
-	kvm_get_preset_lpj();
-
 	/*
 	 * X86_FEATURE_NONSTOP_TSC is TSC runs at constant rate
 	 * with P/T states and does not stop in deep C-states.
@@ -422,8 +411,22 @@ void __init kvmclock_init(void)
 	 */
 	if (boot_cpu_has(X86_FEATURE_CONSTANT_TSC) &&
 	    boot_cpu_has(X86_FEATURE_NONSTOP_TSC) &&
-	    !check_tsc_unstable())
+	    !check_tsc_unstable()) {
 		kvm_clock.rating = 299;
+		tsc_properties = TSC_FREQ_KNOWN_AND_RELIABLE;
+	}
+
+	kvm_sched_clock_init(stable);
+
+	tsc_register_calibration_routines(kvm_get_tsc_khz, kvm_get_tsc_khz,
+					  tsc_properties);
+
+	x86_platform.get_wallclock = kvm_get_wallclock;
+	x86_platform.set_wallclock = kvm_set_wallclock;
+#ifdef CONFIG_SMP
+	x86_cpuinit.early_percpu_clock_init = kvm_setup_secondary_clock;
+#endif
+	kvm_get_preset_lpj();
 
 	clocksource_register_hz(&kvm_clock, NSEC_PER_SEC);
 	pv_info.name = "KVM";
-- 
2.48.1.711.g2feabab25a-goog


