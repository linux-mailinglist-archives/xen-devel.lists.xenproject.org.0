Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hcrRIWhrRWq1/goAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 21:32:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 222286F0E27
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 21:32:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=JpFMN4mP;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=google.com
Received: from list by lists.xenproject.org with outflank-mailman.1350363.1607811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0fc-0007cE-SE; Wed, 01 Jul 2026 19:32:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350363.1607811; Wed, 01 Jul 2026 19:32:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0fc-0007Zk-P0; Wed, 01 Jul 2026 19:32:28 +0000
Received: by outflank-mailman (input) for mailman id 1350363;
 Wed, 01 Jul 2026 19:32:28 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3SGtFagYKCY09vr40tx55x2v.t53Ev4-uvCv22z9A9.Ev46850vtA.58x@flex--seanjc.bounces.google.com>)
 id 1wf0fc-0007Ze-26
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 19:32:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wf0fb-004o0g-BE
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 21:32:27 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3SGtFagYKCY09vr40tx55x2v.t53Ev4-uvCv22z9A9.Ev46850vtA.58x@flex--seanjc.bounces.google.com>)
 id 6a456b44-2eae-0a2a0a5409dd-0a2a4509ddee-18
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:32:27 +0200
Received: from [209.85.215.201] (helo=mail-pg1-f201.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3SGtFagYKCY09vr40tx55x2v.t53Ev4-uvCv22z9A9.Ev46850vtA.58x@flex--seanjc.bounces.google.com>)
 id 6a456b49-97e6-0a2a45090019-d155d7c9f06b-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:32:26 +0200
Received: by mail-pg1-f201.google.com with SMTP id
 41be03b00d2f7-c88da04b719so795266a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 12:32:26 -0700 (PDT)
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
        d=google.com; s=20251104; t=1782934345; x=1783539145; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q5DLB1BjKje3f1c5FruZIw3+wsrQVQC55+bIjsMSwHk=;
        b=JpFMN4mPtJD46ArcdgAMsPMZlVGQOXA/fBCFWCnpab2xVVaxbSRGfH698Hzdy9fYY7
         tv7IhdyQEPk971zAuAnJU0bEFM5X13FjqXwNDT1ucHNOym2K4ceo/V6Manl5LaH3UBUv
         DXljgQnXZ954da359zQWS0/oo6J1JPPjb45HBiPrfYNfuvZFrCttGDGvS4CknwKmBWkb
         ZQP9CX4zTid60oPIoSRTvHvBxFENVcnwFhS4P6C8s0dR5pRy7IcQDAWp2g2AlyyadiuJ
         yytp0UHh/81RZshdHrbX0g3bLXTBba1xbyvEE7pQAsUQjMZOIngmKczqCjJYgIXg4KVE
         xO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934345; x=1783539145;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Q5DLB1BjKje3f1c5FruZIw3+wsrQVQC55+bIjsMSwHk=;
        b=hWvW1Ie0z9yqMFYUV8LNxK54w/y9Mi4JV9AkL52CDVeJGgi/XnETGMOlG4/8hBgtKJ
         EUR9rNCM5gykoSuro9twlNbBXukrqjS/hW7rB5a/Hyf8QrUqg8Qkik1qqX7opj6SW/hx
         qVjMBQR8BtXzG84mj1xMC4yZMmBfPD5GtpMD7/0REd9dxHJIPAQ6Y4ZbHskPNEh+rTt0
         YXoFq9wXCcWkrIElXlAt4B0V4mXyCzeqMwhkJbmnD78QaWn2JiEsGuaII47hX1M1USjm
         YncIYzGGYv3rcBDfDUb9U/tTme0PJqZ/mrnNdWUe36+OwOIocbsv937jvvelmQSaYMz+
         uSfQ==
X-Forwarded-Encrypted: i=1; AHgh+RoCmppyAUWlHpTmiymMlVOS1CxYP1DQLTMZUbp8rdMx94yiiUUSj0jVQOwmiy9EE1FfA7Ad7hNYZnE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YytNaNWf8YtTac8Ctw6AWnE8dHb6oOvs31dgbgZh/8Egy7Fm72b
	feiQZF9dI6I6zsRFBw43hc9ZNm0JwocAquN5ZsjVVOqRGsFQa54u7/0NFu+6SU5N5CWEQaZmOVt
	MsydxTw==
X-Received: from pjtl15.prod.google.com ([2002:a17:90a:c58f:b0:380:5553:77a7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:52:b0:37f:9ce1:735e
 with SMTP id 98e67ed59e1d1-380ba94a46bmr2041513a91.31.1782934344390; Wed, 01
 Jul 2026 12:32:24 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:31:21 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-1-seanjc@google.com>
Subject: [PATCH v5 00/51] x86: Try to wrangle PV clocks vs. TSC
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
X-purgate-ID: tlsNG-bad1c0/1782934347-44528986-E2D4D8F7/0/0
X-purgate-type: clean
X-purgate-size: 11040
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,googlegroups.com:email];
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
X-Rspamd-Queue-Id: 222286F0E27

The primary goal of this series to fix flaws with SNP and TDX guests where a
PV clock provided by the untrusted hypervisor is used instead of the secure
TSC that is controlled by trusted firmware.

The secondary goal is modernize running under KVM.  Currently, KVM guests will
use TSC for clocksource, but not sched_clock.  And Linux-as-a-KVM-guest doesn't
support paravirt enumeration of the TSC/APIC frequencies, even though QEMU
provides that information by default.

The tertiary goal is to clean up the PV clock code to deduplicate logic across
hypervisors, and to hopefully make it all easier to maintain going forward.

The quaternary goal is to clean up the TSC calibration code, which was made
stupidly hard to follow by hypervisor code mixing in with the native
calibration routines, instead of being implemented as a pure alternative.

Note, the VMware and Xen changes still probably should get acks from those
maintainers, as my understanding of what they're trying to do may be flawed.

Lots more background on the SNP/TDX motiviation:
https://lore.kernel.org/all/20250106124633.1418972-13-nikunj@amd.com

As before, I deliberately omitted jailhouse-dev@googlegroups.com from the To/Cc,
as those emails bounced on v1, AFAICT nothing has changed.

v5:
 - Use cpu_feature_enabled() instead of boot_cpu_has(). [Boris]
 - WARN if recalibrate_cpu_khz() runs on a system with TSC_KNOWN_FREQ. [Thomas]
 - Opportunistically drop a line break in native_calibrate_tsc(). [Thomas]
 - Rely on callers of cpuid_get_tsc_info() to check the result instead of
   unnecessarily zeroing the structure. [Boris]
 - Ignore tsc_early_khz if the TSC frequency is provided by trusted firmware
   or by the hypervisor. [Thomas, Sashiko]
 - Cache CPUID output in acrn_init_platform() to avoid introducing a transient
   bug where TSC_KNOWN_FREQ could be set even if the ACRN hypervisor didn't
   actually provide the frequency. [Sashiko]
 - Drop kvmclock's useless/dead check_tsc_unstable() call (it occurs before the
   command line parameter is parsed). [Sashiko]
 - Add helpers to set lapic_timer_period, to fix not-so-theoretical overflow
   in the various "khz * 1000 / HZ" patterns. [Sashiko]
 - Drop the "x86/xen: Obtain TSC frequency from CPUID if present" patch as it
   doesn't have any dependencies/conflicts on/with this series, and Sashiko had
   concerns about the assumptions it was making. [Sashiko]
 - Collect reviews. [David] (Kirill's got dropped because the patch he reviewed
   got completely rewritten).


v4:
 - Use x86_init_noop() to skip save/restore on VMware and Xen instead of
   nullifying x86_platform.{save,restore}_sched_clock_state. [Sashiko]
 - Use '0' to indicate "failure" when getting the CPU frequency from CPUID, to
   avoid using an out-param and thus make it all but impossible to
   unintentionally clobber the global cpu_khz (which v3 did). [Sashiko]
 - Rename cpuid_get_cpu_freq() => __cpu_khz_from_cpuid() to capture its
   relationship with cpu_khz_from_cpuid().
 - Compute lapic_timer_period in units of ticks, not Khz. [Sashiko]
 - Kill off x86_platform_ops.calibrate_{cpu,tsc}(), and instead use dedicated
   hooks for hypervisor code, and direct calls for TDX and SNP. [David, loosely]
 - Drop SNP's secure TSC override of _CPU_ calibration, as there's zero
   evidence it's justified or a net positive.
 - Collect reviews/acks. [David, Wei]
 - Decouple getting TSC/APIC frequencies from KVM PV CPUID from kvmclock. [David]
 - Fix an amusing number of Opportunistically misspellings. [David]
 - Set kvm_sched_clock_offset _before_ registering kvmclock as sched_clock,
   and add a comment to guard against future goofs. [Sashiko]
 - Keep "setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE)" in Hyper-V's handling
   of HV_ACCESS_TSC_INVARIANT, as it's technically possible to have a VM
   with HV_ACCESS_TSC_INVARIANT but not HV_ACCESS_FREQUENCY_MSRS.  Though as
   a _very_ nice side effect of using dedicated sequencing for selecting the
   TSC frequency source, this would have naturally happened anyways. [Sashiko]

v3:
 - https://lore.kernel.org/all/20260515191942.1892718-1-seanjc@google.com
 - Collect reviews. [Michael, Thomas]
 - Use Hyper-V reference counter / refcounter instead of Hyper-V timer. [Michael]
 - Use the paravirt CPUID interface first proposed by VMware for KVM's
   "official" mechanism for communicating frequency to KVM-aware guests,
   instead of abusing Intel's CPUID leafs. [David]
 - Deal with paravirt code being moved into asm/timers.h and
   arch/x86/kernel/tsc.c.

v2:
 - https://lore.kernel.org/all/Z8YWttWDtvkyCtdJ@google.com
 - Add struct to hold the TSC CPUID output. [Boris]
 - Don't pointlessly inline the TSC CPUID helpers. [Boris]
 - Fix a variable goof in a helper, hopefully for real this time. [Dan]
 - Collect reviews. [Nikunj]
 - Override the sched_clock save/restore hooks if and only if a PV clock
   is successfully registered.
 - During resome, restore clocksources before reading persistent time.
 - Clean up more warts created by kvmclock.
 - Fix more bugs in kvmclock's suspend/resume handling.
 - Try to harden kvmclock against future bugs.

v1: https://lore.kernel.org/all/20250201021718.699411-1-seanjc@google.com

David Woodhouse (2):
  KVM: x86: Officially define CPUID 0x40000010 as PV Timing Info (TSC
    and Bus)
  x86/kvm: Obtain TSC frequency from PV CPUID if present

Sean Christopherson (49):
  x86/apic: Provide helpers to set local APIC timer period in hz and khz
  x86/apic: Add CONFIG_X86_LOCAL_APIC=n stubs for
    apic_set_timer_period_{,k}hz()
  x86/tsc: Ensure that TSC recalibration doesn't run if TSC frequency is
    known
  x86/tsc: Restrict recalibrate_cpu_khz() export to p4-clockmod and
    powernow-k7
  x86/sev: Mark TSC as reliable when configuring Secure TSC
  x86/sev: Don't override CPU frequency calibration for SNP's Secure TSC
  x86/sev: Move check for SNP Secure TSC support to tsc_early_init()
  x86/sev: Shove SNP's secure/trusted TSC frequency directly into
    "calibration"
  x86/tsc: Add a standalone helper for getting TSC info from CPUID.0x15
  x86/tdx: Force TSC frequency with CPUID-based info provided by the
    TDX-Module
  x86/tsc: Add dedicated hypervisor hooks for getting known TSC/CPU
    frequencies
  x86/acrn: Register TSC/CPU frequency callbacks iff frequency is
    actually in CPUID
  x86/acrn: Mark TSC frequency as known when using ACRN for calibration
  x86/tsc: Consolidate forcing of X86_FEATURE_TSC_KNOWN_FREQ for PV code
  x86/tsc: Kill off x86_platform_ops.calibrate_{cpu,tsc}() hooks
  x86/tsc: Rename pit_hpet_ptimer_calibrate_cpu() =>
    native_calibrate_cpu_late()
  x86/tsc: Fold native_calibrate_cpu() into recalibrate_cpu_khz()
  x86/kvmclock: Rename kvm_get_tsc_khz() to kvmclock_get_tsc_khz()
  x86/kvmclock: Drop dead check on TSC being unstable during
    kvmclock_init()
  x86/kvm: Mark TSC as reliable when it's constant and nonstop
  x86/tsc: Add standalone helper for getting CPU frequency from CPUID
  x86/kvm: Get CPU base frequency from CPUID when it's available
  clocksource: hyper-v: Register sched_clock save/restore iff it's
    necessary
  clocksource: hyper-v: Drop wrappers to sched_clock save/restore
    helpers
  clocksource: hyper-v: Don't save/restore TSC offset when using HV
    sched_clock
  x86/kvmclock: Setup kvmclock for secondary CPUs iff CONFIG_SMP=y
  x86/kvm: Don't disable kvmclock on BSP in syscore_suspend()
  x86/paravirt: Remove unnecessary PARAVIRT=n stub for
    paravirt_set_sched_clock()
  x86/paravirt: Move handling of unstable PV clocks into
    paravirt_set_sched_clock()
  x86/kvmclock: Move sched_clock save/restore helpers up in kvmclock.c
  x86/xen/time: NOP-ify x86_platform's sched_clock save/restore hooks
  x86/vmware: NOP-ify save/restore hooks when using VMware's sched_clock
  x86/tsc: WARN if TSC sched_clock save/restore used with PV sched_clock
  x86/paravirt: Pass sched_clock save/restore helpers during
    registration
  x86/kvmclock: Move kvm_sched_clock_init() down in kvmclock.c
  x86/xen/time: Mark xen_setup_vsyscall_time_info() as __init
  x86/pvclock: Mark setup helpers and related various as
    __init/__ro_after_init
  x86/pvclock: WARN if pvclock's valid_flags are overwritten
  x86/kvmclock: Refactor handling of PVCLOCK_TSC_STABLE_BIT during
    kvmclock_init()
  timekeeping: Resume clocksources before reading persistent clock
  x86/kvmclock: Hook clocksource.suspend/resume when kvmclock isn't
    sched_clock
  x86/kvmclock: WARN if wall clock is read while kvmclock is suspended
  x86/paravirt: Mark __paravirt_set_sched_clock() as __init
  x86/paravirt: Plumb a return code into __paravirt_set_sched_clock()
  x86/paravirt: Don't use a PV sched_clock in CoCo guests with trusted
    TSC
  x86/kvmclock: Use TSC for sched_clock if it's constant and non-stop
  x86/kvmclock: Plumb in AP-online and BSP-resume to kvmlock, for
    documentation
  x86/paravirt: Move using_native_sched_clock() stub into timer.h
  x86/kvm: Get local APIC bus frequency from PV CPUID Timing Info

 .../admin-guide/kernel-parameters.txt         |   5 +
 Documentation/virt/kvm/x86/cpuid.rst          |  12 +
 arch/x86/coco/sev/core.c                      |  21 +-
 arch/x86/coco/tdx/tdx.c                       |  19 +-
 arch/x86/include/asm/acrn.h                   |   5 -
 arch/x86/include/asm/apic.h                   |   5 +-
 arch/x86/include/asm/kvm_para.h               |  12 +-
 arch/x86/include/asm/sev.h                    |   4 +-
 arch/x86/include/asm/tdx.h                    |   2 +
 arch/x86/include/asm/timer.h                  |  15 +-
 arch/x86/include/asm/tsc.h                    |  10 +-
 arch/x86/include/asm/x86_init.h               |   8 +-
 arch/x86/include/uapi/asm/kvm_para.h          |  11 +
 arch/x86/kernel/apic/apic.c                   |  12 +-
 arch/x86/kernel/cpu/acrn.c                    |  14 +-
 arch/x86/kernel/cpu/mshyperv.c                |  70 +-----
 arch/x86/kernel/cpu/vmware.c                  |  19 +-
 arch/x86/kernel/jailhouse.c                   |   9 +-
 arch/x86/kernel/kvm.c                         | 101 ++++++--
 arch/x86/kernel/kvmclock.c                    | 208 +++++++++++------
 arch/x86/kernel/pvclock.c                     |   9 +-
 arch/x86/kernel/tsc.c                         | 218 +++++++++++-------
 arch/x86/kernel/tsc_msr.c                     |   4 +-
 arch/x86/kernel/x86_init.c                    |   2 -
 arch/x86/mm/mem_encrypt_amd.c                 |   3 -
 arch/x86/xen/time.c                           |  14 +-
 drivers/clocksource/hyperv_timer.c            |  38 ++-
 include/clocksource/hyperv_timer.h            |   2 -
 kernel/time/timekeeping.c                     |   9 +-
 29 files changed, 540 insertions(+), 321 deletions(-)


base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.55.0.rc0.799.gd6f94ed593-goog


