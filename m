Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBdTOBtyB2qa3wIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 21:20:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFB7556A7B
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 21:20:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1310174.1581013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNy4z-0005CZ-8k; Fri, 15 May 2026 19:20:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1310174.1581013; Fri, 15 May 2026 19:20:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNy4z-00059i-0v; Fri, 15 May 2026 19:20:13 +0000
Received: by outflank-mailman (input) for mailman id 1310174;
 Fri, 15 May 2026 19:20:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <353EHagYKCUAugcpleiqqing.eqozgp-fgxgnnkuvu.zgprtqlgev.qti@flex--seanjc.bounces.google.com>)
 id 1wNy4x-00059W-17
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 19:20:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNy4w-00BX6R-Cy
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 21:20:10 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <353EHagYKCUAugcpleiqqing.eqozgp-fgxgnnkuvu.zgprtqlgev.qti@flex--seanjc.bounces.google.com>)
 id 6a0771d8-5cb7-0a2a0a5109dd-0a2a450aade8-22
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 21:20:10 +0200
Received: from [209.85.215.201] (helo=mail-pg1-f201.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <353EHagYKCUAugcpleiqqing.eqozgp-fgxgnnkuvu.zgprtqlgev.qti@flex--seanjc.bounces.google.com>)
 id 6a0771e8-56b3-0a2a450a0019-d155d7c9cce9-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 21:20:10 +0200
Received: by mail-pg1-f201.google.com with SMTP id
 41be03b00d2f7-c82bd90afbbso184383a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 12:20:09 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=google.com header.i="@google.com" header.h="Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778872808; x=1779477608; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n6Bo/RhEQ+ohQ2bSS/OTKsKl1FaExY7Ds1WzHI7v1C0=;
        b=tIQlCw72CdnN83Bio8mqAjXcQhO64QeqKGYxFx+fyajkUA2iz47h4zIzPo1qD65LnI
         QHgWhGikARyaWo0RAyrQgincyNy3bLOmJ8WymfgcPZyqJAJhcH1qZv2VJraURRadZKQ2
         nljMTDwfUPo1WD7VfKuJE+x2vu+qfTYr4CzH6N2kHtQ4IdPgkHnjXIWaXHZm9Xr1tdkH
         GCCnzhyGECg5Jr2IT+amCno4CdpHUu1suPmmsQIVvfaX8wdPwmQ765sb+AmCEFo/HyN7
         q1wHfSzEk8obmJ9t4qxGFE9hmYpx0h//UExqNuoOuzHAyCndtq4yEOYVJ32TlWQkKGy7
         OSOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778872808; x=1779477608;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n6Bo/RhEQ+ohQ2bSS/OTKsKl1FaExY7Ds1WzHI7v1C0=;
        b=egl/pO/0IehFemDG/rs6ToPInQ24WgmdseXkoaB9WP+CLKG5jkq3ae2gTg9JHYJxMY
         dCTw20Rd30TU70EdUNrJPK5xIfoZ96170+9+HD8jxlno+Lcs26pz/v26TuZ1xYGSYg3B
         ypuFMAhrrbDSjxifMEiMJhGGLZl2rtvXGRiBhCnsGW6ptXOjSRuOGZ9USvC6KvzxXxYe
         N2firZQ778gZ9xvhSHeXTtE1sulNd/l8Peq4n8FpYCjuvb0mjIYPeRDoxULKN+Ci7NB7
         zmoUBms2xSbw9gKdGacmQYASso3girA4At290cMQQmPgGQYJE8/qFJEJymgNMmz+3Npi
         8duA==
X-Forwarded-Encrypted: i=1; AFNElJ9hu4l5VT08sOSexenV+ulGQ1WpQeH6VnWpaIeQxm4LT6fYzObTSmpl5MmHD6kjG5H4wttdV8OQR+A=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz3LI9kZ3uIxl4OYDw6XASXgbtblzbVJXOjYYkU8obKGmM7ZK6p
	uFEG9vKul1gNbRMbK9HkJdrDNJ1J5URX6ZoJ4MnB9g6YcaxTQaTeeQHMYZh/Ptq8JeSxkhyPQbX
	hIfUVVQ==
X-Received: from pgbcq13.prod.google.com ([2002:a05:6a02:408d:b0:c80:26d4:20ea])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:1595:b0:398:7df5:2dae
 with SMTP id adf61e73a8af0-3b22e67bbfbmr6212145637.9.1778872807764; Fri, 15
 May 2026 12:20:07 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 15 May 2026 12:19:01 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260515191942.1892718-1-seanjc@google.com>
Subject: [PATCH v3 00/41] x86: Try to wrangle PV clocks vs. TSC
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
X-purgate-ID: tlsNG-4011c0/1778872810-7EB898B7-290D3FC3/0/0
X-purgate-type: clean
X-purgate-size: 7912
X-Rspamd-Queue-Id: 8EFB7556A7B
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

Dave/Thomas/Peter/Boris, what's the going rate for bribes to take something
like this through the tip tree?  

The bulk of the changes are in kvmclock and TSC, but pretty much every
hypervisor's guest-side code gets touched at some point.  I am reaonsably
confident in the correctness of the KVM changes.  Michael tested Hyper-V in
v2, and while there were conflicts when rebasing, they were largely
superficial (and I've just jinxed myself).  For all other hypervisors, assume
the code is compile-tested only, but those changes are all quite small and
straightforward.

The only changes that are questionable/contentious are the last two patches,
which have KVM-as-a-guest use CPUID 0x16 to get the CPU frequency, even on
AMD (that's the dubious part).  I very deliberately put them last, so that
they can be dropped at will (I don't care terribly if those patches land).
To merge them, I would want explicit Acks from Paolo and David W.

So, except for the last two patches, to get the stuff I really care about
landed, I think/hope it's just the TSC and guest-side CoCo changes that need
reviews/acks?

The primary goal of this series is (or at least was, when I started) to
fix flaws with SNP and TDX guests where a PV clock provided by the untrusted
hypervisor is used instead of the secure/trusted TSC that is controlled by
trusted firmware.

The secondary goal is to draft off of the SNP and TDX changes to slightly
modernize running under KVM.  Currently, KVM guests will use TSC for
clocksource, but not sched_clock.  And they ignore Intel's CPUID-based TSC
and CPU frequency enumeration, even when using the TSC instead of kvmclock.
And if the host provides the core crystal frequency in CPUID.0x15, then KVM
guests can use that for the APIC timer period instead of manually calibrating
the frequency.

The tertiary goal is to clean up all of the PV clock code to deduplicate logic
across hypervisors, and to hopefully make it all easier to maintain going
forward.

Lots more background on the SNP/TDX motiviation:
https://lore.kernel.org/all/20250106124633.1418972-13-nikunj@amd.com

Note, I deliberately omitted:

  jailhouse-dev@googlegroups.com

from the To/Cc, as those emails bounced on v1, AFAICT nothing has changed, and
I have zero desire to get 41 emails telling me an email couldn't be delivered.

v3:
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
  x86/kvmclock: Obtain TSC frequency from CPUID if present

Sean Christopherson (39):
  x86/tsc: Add a standalone helpers for getting TSC info from CPUID.0x15
  x86/tsc: Add helper to register CPU and TSC freq calibration routines
  x86/sev: Mark TSC as reliable when configuring Secure TSC
  x86/sev: Move check for SNP Secure TSC support to tsc_early_init()
  x86/tdx: Override PV calibration routines with CPUID-based calibration
  x86/acrn: Mark TSC frequency as known when using ACRN for calibration
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
  x86/xen/time: Nullify x86_platform's sched_clock save/restore hooks
  x86/vmware: Nullify save/restore hooks when using VMware's sched_clock
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
  x86/kvmclock: Enable kvmclock on APs during onlining if kvmclock isn't
    sched_clock
  x86/paravirt: Mark __paravirt_set_sched_clock() as __init
  x86/paravirt: Plumb a return code into __paravirt_set_sched_clock()
  x86/paravirt: Don't use a PV sched_clock in CoCo guests with trusted
    TSC
  x86/tsc: Pass KNOWN_FREQ and RELIABLE as params to registration
  x86/tsc: Rejects attempts to override TSC calibration with lesser
    routine
  x86/kvmclock: Mark TSC as reliable when it's constant and nonstop
  x86/kvmclock: Get local APIC bus frequency from PV CPUID Timing Info
  x86/kvmclock: Use TSC for sched_clock if it's constant and non-stop
  x86/paravirt: kvmclock: Setup kvmclock early iff it's sched_clock
  x86/paravirt: Move using_native_sched_clock() stub into timer.h
  x86/tsc: Add standalone helper for getting CPU frequency from CPUID
  x86/kvmclock: Get CPU base frequency from CPUID when it's available

 Documentation/virt/kvm/x86/cpuid.rst |  12 ++
 arch/x86/coco/sev/core.c             |   9 +-
 arch/x86/coco/tdx/tdx.c              |  27 ++-
 arch/x86/include/asm/kvm_para.h      |  12 +-
 arch/x86/include/asm/tdx.h           |   2 +
 arch/x86/include/asm/timer.h         |  18 +-
 arch/x86/include/asm/tsc.h           |  20 +++
 arch/x86/include/asm/x86_init.h      |   2 -
 arch/x86/include/uapi/asm/kvm_para.h |  11 ++
 arch/x86/kernel/cpu/acrn.c           |   5 +-
 arch/x86/kernel/cpu/mshyperv.c       |  69 +-------
 arch/x86/kernel/cpu/vmware.c         |  11 +-
 arch/x86/kernel/jailhouse.c          |   6 +-
 arch/x86/kernel/kvm.c                |  62 +++++--
 arch/x86/kernel/kvmclock.c           | 250 +++++++++++++++++++--------
 arch/x86/kernel/pvclock.c            |   9 +-
 arch/x86/kernel/smpboot.c            |   3 +-
 arch/x86/kernel/tsc.c                | 184 +++++++++++++++-----
 arch/x86/kernel/x86_init.c           |   1 -
 arch/x86/mm/mem_encrypt_amd.c        |   3 -
 arch/x86/xen/time.c                  |  13 +-
 drivers/clocksource/hyperv_timer.c   |  38 ++--
 include/clocksource/hyperv_timer.h   |   2 -
 kernel/time/timekeeping.c            |   9 +-
 24 files changed, 537 insertions(+), 241 deletions(-)


base-commit: 1196e304db58189264bb5953b4e8da7e90cda615
-- 
2.54.0.563.g4f69b47b94-goog


