Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F19A47218
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 03:19:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897366.1306032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTUU-00066h-RJ; Thu, 27 Feb 2025 02:19:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897366.1306032; Thu, 27 Feb 2025 02:19:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTUU-00064X-NY; Thu, 27 Feb 2025 02:19:10 +0000
Received: by outflank-mailman (input) for mailman id 897366;
 Thu, 27 Feb 2025 02:19:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=npLm=VS=flex--seanjc.bounces.google.com=3lsu_ZwYKCXEhTPcYRVddVaT.RdbmTc-STkTaaXhih.mTcegdYTRi.dgV@srs-se1.protection.inumbo.net>)
 id 1tnTUT-00063X-J1
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 02:19:09 +0000
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [2607:f8b0:4864:20::1049])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36953f53-f4b1-11ef-9898-31a8f345e629;
 Thu, 27 Feb 2025 03:19:04 +0100 (CET)
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2fc45101191so1079294a91.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 18:19:04 -0800 (PST)
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
X-Inumbo-ID: 36953f53-f4b1-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740622743; x=1741227543; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=st/MNJiEmtSZ09xGK+8+BbgbXd3TSC2HpMD5MWqL4Rs=;
        b=4iPhse8fzmICi5kMN3DW3ov+u5KT2yb5VVkiNR1yXSkVamOh9VGe9eT2czis0Py5ru
         He5B4M+UfEkGTs/lXgG2iUBvnpIXeWK042u6OeT/jn9IHmTD1T8+Eu+NIBvgEDdodd+H
         y1Y7IboUd3bLSYztXLFaUUHoVh00OwnxviItrz/+mEv4/2PerlhalxuO9P9tkh88L2ZY
         IDmclZvlAJ+pwFq6veTZde9EYmzISHmSRtevri/w8VHXQrqWYlGXj5PiVSA1K8IPYPW3
         BrL1U2vs6r/UVzb1V21DXVLJ2Ck+o3hFInwcUs/ydlQxD/LnEB2HwckfRGd9wXbQeaWY
         esBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740622743; x=1741227543;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=st/MNJiEmtSZ09xGK+8+BbgbXd3TSC2HpMD5MWqL4Rs=;
        b=A3AsoL5eFO3OFuPlTTVuMkJM5IAV0cW0/xL2NsoiTFTwuiXHCh833gxMiGXSPnAghC
         34jB7fpKLjdwc1c1hSbuuc5Trlw7hDsUAM3vN9IopwWA5oTTKXGCCwpJTo0edA21q2jL
         zy45Q75h3MmTrf5xXZkXVaULSNjLmAiq2uj3gf/SfOWdOTZucj4L+NsFtgIk54H01wuc
         OQtKWvdZc7huDjodzRW9MWb8FgaU9/xKfsxJXPHqmiWuPevReOBwpWi+PTl7sh0nYcps
         9T2+JBqZxUoFzg2PNG3ym3CHU8fh64F4/cbOjhSQSP2s1yU0/lJI5++vYMW6fP7ARoEY
         Vm0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVCE4TbZigyWkYwRGNVyzzOmZQ6IZSLUCnDGEUBmRrngFU5j1Me4a9qj9k8zu1FDk4/Z+D1LkR4toc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJPpar5bWb4NAzAM9InVQWIWM+uiL+diaRS4btqkecwMDBdH/z
	dQ1pVYCKAddQXGsDs5Ky4vxMRpcmvNxUiz/yw2k9hqrOFvYezXoLtfJt9MYz5kyhwZmpJ2uDr7Z
	pXw==
X-Google-Smtp-Source: AGHT+IH0Z5GBXLArvAZe/lakaosQcAMuaUE8ywgN1crYyvWwIhA/1v2sV6rL/y5U8JWXjzB9EKIe2Lk1Tz0=
X-Received: from pjbqn6.prod.google.com ([2002:a17:90b:3d46:b0:2fc:201d:6026])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:17cd:b0:2f9:c139:b61f
 with SMTP id 98e67ed59e1d1-2fce78a3812mr44219981a91.14.1740622742780; Wed, 26
 Feb 2025 18:19:02 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Feb 2025 18:18:16 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227021855.3257188-1-seanjc@google.com>
Subject: [PATCH v2 00/38] x86: Try to wrangle PV clocks vs. TSC
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

This... snowballed a bit.

The bulk of the changes are in kvmclock and TSC, but pretty much every
hypervisor's guest-side code gets touched at some point.  I am reaonsably
confident in the correctness of the KVM changes.  For all other hypervisors,
assume it's completely broken until proven otherwise.

Note, I deliberately omitted:

  Alexey Makhalov <alexey.amakhalov@broadcom.com>
  jailhouse-dev@googlegroups.com

from the To/Cc, as those emails bounced on the last version, and I have zero
desire to get 38*2 emails telling me an email couldn't be delivered.

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

Lots more background on the SNP/TDX motiviation:
https://lore.kernel.org/all/20250106124633.1418972-13-nikunj@amd.com

v2:
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

Sean Christopherson (38):
  x86/tsc: Add a standalone helpers for getting TSC info from CPUID.0x15
  x86/tsc: Add standalone helper for getting CPU frequency from CPUID
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
  x86/kvmclock: Get CPU base frequency from CPUID when it's available
  x86/kvmclock: Get TSC frequency from CPUID when its available
  x86/kvmclock: Stuff local APIC bus period when core crystal freq comes
    from CPUID
  x86/kvmclock: Use TSC for sched_clock if it's constant and non-stop
  x86/paravirt: kvmclock: Setup kvmclock early iff it's sched_clock

 arch/x86/coco/sev/core.c           |   9 +-
 arch/x86/coco/tdx/tdx.c            |  27 ++-
 arch/x86/include/asm/kvm_para.h    |  10 +-
 arch/x86/include/asm/paravirt.h    |  16 +-
 arch/x86/include/asm/tdx.h         |   2 +
 arch/x86/include/asm/tsc.h         |  20 +++
 arch/x86/include/asm/x86_init.h    |   2 -
 arch/x86/kernel/cpu/acrn.c         |   5 +-
 arch/x86/kernel/cpu/mshyperv.c     |  69 +-------
 arch/x86/kernel/cpu/vmware.c       |  11 +-
 arch/x86/kernel/jailhouse.c        |   6 +-
 arch/x86/kernel/kvm.c              |  39 +++--
 arch/x86/kernel/kvmclock.c         | 260 +++++++++++++++++++++--------
 arch/x86/kernel/paravirt.c         |  35 +++-
 arch/x86/kernel/pvclock.c          |   9 +-
 arch/x86/kernel/smpboot.c          |   2 +-
 arch/x86/kernel/tsc.c              | 141 ++++++++++++----
 arch/x86/kernel/x86_init.c         |   1 -
 arch/x86/mm/mem_encrypt_amd.c      |   3 -
 arch/x86/xen/time.c                |  13 +-
 drivers/clocksource/hyperv_timer.c |  38 +++--
 include/clocksource/hyperv_timer.h |   2 -
 kernel/time/timekeeping.c          |   9 +-
 23 files changed, 487 insertions(+), 242 deletions(-)


base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
-- 
2.48.1.711.g2feabab25a-goog


