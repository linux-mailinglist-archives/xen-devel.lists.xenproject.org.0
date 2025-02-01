Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF16A24687
	for <lists+xen-devel@lfdr.de>; Sat,  1 Feb 2025 03:18:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880071.1290318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1te34y-00066s-Qs; Sat, 01 Feb 2025 02:17:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880071.1290318; Sat, 01 Feb 2025 02:17:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1te34y-00060b-Bq; Sat, 01 Feb 2025 02:17:52 +0000
Received: by outflank-mailman (input) for mailman id 880071;
 Sat, 01 Feb 2025 02:17:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kIo4=UY=flex--seanjc.bounces.google.com=3TISdZwYKCQ87tp2yrv33v0t.r31Ct2-stAt00x787.Ct2463ytr8.36v@srs-se1.protection.inumbo.net>)
 id 1te34x-0002if-8i
 for xen-devel@lists.xenproject.org; Sat, 01 Feb 2025 02:17:51 +0000
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [2607:f8b0:4864:20::1049])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb62b991-e042-11ef-99a4-01e77a169b0f;
 Sat, 01 Feb 2025 03:17:49 +0100 (CET)
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2ef9b9981f1so7259369a91.3
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jan 2025 18:17:49 -0800 (PST)
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
X-Inumbo-ID: bb62b991-e042-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738376268; x=1738981068; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=IrGW5KyAKjJvdPU9ageDhgEv89aW3VoCTAEai48xeak=;
        b=SUfPFSr3AHHjfl79pN+6b9CqBDtjrmyRC1P7PsnWgbtxUOkdDciA/eFihgRgwfIbiD
         9fksvI73MWIXMajt4Iq4bKZft910DmLLO1lERfg5pILff1j5KQ3UzD1tXhSgjWxjx/Q1
         6lFiogPHAFbvVv8BODETcoljZ0w/vzaGPP8IGF9ZCQK2/2C1+EKU4S34iPOxbLEF/YWE
         IQioG/TEyx+VgN7DRyhkArRQnA8tgoSlCbtYdxrFySjkUIamDextiapkiWXy73JdkSHI
         /ioQqk898jFkX+ZdcKilxOzSyCoUFbWU4YnDEPkTDUlX0ecj1voLgC90M3DyDfntbpzp
         TM5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738376268; x=1738981068;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IrGW5KyAKjJvdPU9ageDhgEv89aW3VoCTAEai48xeak=;
        b=X5wdWLn90hfeqRvWA6VGDsZSB2h/xY6DQ+KIl2PvpOQiW5cjhmb/eEoU7MFQhbwhZ+
         7Xx2nxGwDTqq5w5/C0dC/uCdyhkcyXLMHcGdxnEQVQ/5slVqOzMVi8hgYWWJf2xulasB
         kteeBbHyzSu514VagKrRC7Mjddt8nIScaB2NTD3w05RqMcto+X5Hgd96/NQ+3ucInGWD
         gwIHwsY/s1HgbA5Bs6Kb64HjBY3Vx2ggXaTsZypv0R0cYYEKQu2Nm4QE9/87opUMgTmV
         YsH9IFpaWOc1HtDNqx5KxH3xUglCtje7kYd9gfm2wUDGGqnrUFCeeegfO3fm7K/p6zBY
         eXXw==
X-Forwarded-Encrypted: i=1; AJvYcCX4VKiAN+lroBykKv94cE8F8KwhRaRO+WcVzAmEf2fIRSwmxSPjPW6vI9tZR+iHZDmfmZVIyy3B7ug=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyCkoD/plU13NhoZ/iBN1GsR/MG5PY3oThXOTJ8GEdNSKu4iF98
	TmRtwUxT9+yjKEX1kWYOAS+ZfDPDQsG36Yah0mlWyzZANHZhv8spMOhbM/vAIhO0m4v2dkG2JUP
	OzQ==
X-Google-Smtp-Source: AGHT+IFnviFY5P8yLFi8Q8khLJ9/h4GGB0jx1XaxjiOcD/F0E8KD3icYKrUfW55PtjtMBfI0KqMQJtaVac0=
X-Received: from pgbci10.prod.google.com ([2002:a05:6a02:200a:b0:a97:3102:ea5d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:9102:b0:1e1:faa:d8cf
 with SMTP id adf61e73a8af0-1ed7a6e1efcmr25085282637.40.1738376268141; Fri, 31
 Jan 2025 18:17:48 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 31 Jan 2025 18:17:14 -0800
In-Reply-To: <20250201021718.699411-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250201021718.699411-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250201021718.699411-13-seanjc@google.com>
Subject: [PATCH 12/16] x86/kvmclock: Mark TSC as reliable when it's constant
 and nonstop
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
 arch/x86/kernel/kvmclock.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 890535ddc059..a7c4ae7f92e2 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -283,6 +283,7 @@ static int kvmclock_setup_percpu(unsigned int cpu)
 
 void __init kvmclock_init(void)
 {
+	enum tsc_properties tsc_properties = TSC_FREQUENCY_KNOWN;
 	u8 flags;
 
 	if (!kvm_para_available() || !kvmclock)
@@ -313,11 +314,26 @@ void __init kvmclock_init(void)
 	if (kvm_para_has_feature(KVM_FEATURE_CLOCKSOURCE_STABLE_BIT))
 		pvclock_set_flags(PVCLOCK_TSC_STABLE_BIT);
 
+	/*
+	 * X86_FEATURE_NONSTOP_TSC is TSC runs at constant rate
+	 * with P/T states and does not stop in deep C-states.
+	 *
+	 * Invariant TSC exposed by host means kvmclock is not necessary:
+	 * can use TSC as clocksource.
+	 *
+	 */
+	if (boot_cpu_has(X86_FEATURE_CONSTANT_TSC) &&
+	    boot_cpu_has(X86_FEATURE_NONSTOP_TSC) &&
+	    !check_tsc_unstable()) {
+		kvm_clock.rating = 299;
+		tsc_properties = TSC_FREQ_KNOWN_AND_RELIABLE;
+	}
+
 	flags = pvclock_read_flags(&hv_clock_boot[0].pvti);
 	kvm_sched_clock_init(flags & PVCLOCK_TSC_STABLE_BIT);
 
 	tsc_register_calibration_routines(kvm_get_tsc_khz, kvm_get_tsc_khz,
-					  TSC_FREQUENCY_KNOWN);
+					  tsc_properties);
 
 	x86_platform.get_wallclock = kvm_get_wallclock;
 	x86_platform.set_wallclock = kvm_set_wallclock;
@@ -328,19 +344,6 @@ void __init kvmclock_init(void)
 	x86_platform.restore_sched_clock_state = kvm_restore_sched_clock_state;
 	kvm_get_preset_lpj();
 
-	/*
-	 * X86_FEATURE_NONSTOP_TSC is TSC runs at constant rate
-	 * with P/T states and does not stop in deep C-states.
-	 *
-	 * Invariant TSC exposed by host means kvmclock is not necessary:
-	 * can use TSC as clocksource.
-	 *
-	 */
-	if (boot_cpu_has(X86_FEATURE_CONSTANT_TSC) &&
-	    boot_cpu_has(X86_FEATURE_NONSTOP_TSC) &&
-	    !check_tsc_unstable())
-		kvm_clock.rating = 299;
-
 	clocksource_register_hz(&kvm_clock, NSEC_PER_SEC);
 	pv_info.name = "KVM";
 }
-- 
2.48.1.362.g079036d154-goog


