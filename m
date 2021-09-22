Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A2C414216
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 08:42:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192197.342523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSvxn-0007dd-Bk; Wed, 22 Sep 2021 06:42:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192197.342523; Wed, 22 Sep 2021 06:42:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSvxn-0007bj-83; Wed, 22 Sep 2021 06:42:39 +0000
Received: by outflank-mailman (input) for mailman id 192197;
 Wed, 22 Sep 2021 06:42:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ybNQ=OM=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1mSvxl-0007bW-HM
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 06:42:37 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 45f3b2a4-1b70-11ec-b960-12813bfff9fa;
 Wed, 22 Sep 2021 06:42:36 +0000 (UTC)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-87lOpWjOOziKNF9tF7pvrQ-1; Wed, 22 Sep 2021 02:42:35 -0400
Received: by mail-ed1-f69.google.com with SMTP id
 e7-20020aa7d7c7000000b003d3e6df477cso1787985eds.20
 for <xen-devel@lists.xenproject.org>; Tue, 21 Sep 2021 23:42:35 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id dh16sm622370edb.63.2021.09.21.23.42.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 23:42:33 -0700 (PDT)
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
X-Inumbo-ID: 45f3b2a4-1b70-11ec-b960-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632292956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WYW/P0Q1oqTDlsP5noOn+TZGFQp14YjumKQL9bn9bmM=;
	b=OwDlj4XQQpZT4OsqQaH31/flFA59cMPL27LqTTDDH7+e3S6KXkHQkCB1/NpJTOXokjOvJc
	kcWkh4xmATgF6Hm6EAO9v7SyeI8C/fzLdH8EywdpI339GOnUzdJ9cNVw+Phso+FKXikfnr
	Yuq8eq/NQ7Yxhdn1JzoPP1zcqQxlt6k=
X-MC-Unique: 87lOpWjOOziKNF9tF7pvrQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WYW/P0Q1oqTDlsP5noOn+TZGFQp14YjumKQL9bn9bmM=;
        b=MiLElagnVKy8noiOd1hhDjsZfQ+Fu0Mgyxz6nGat66xJr3Ra2saIpFLdbCUxUch3b9
         jzffQw0vBJOMFSDqbWD9LtLTJGzR+9778G2hJ6VPZFePoSK+vECGOhfdugEC7fQO/41o
         mR9HsfgL3EUHpPetUPHlsZ0yV+pMsHbgEOhNBastpSGgegApuq8IlP3A/WbzfIsyAtXh
         KX1BI/33k+Is0p5RxRJDOxXEYxoYZ5GcduBFtLreu1UeGm58HwNqMaVjao32UZxDp2T7
         vDZ5YfedE4h7ntXkj2ZQwRA9QaDBMbDh/Vmi53qpVD4SpXDQUgCXVOv/q9nXaYXb5Evx
         CeWg==
X-Gm-Message-State: AOAM533bzuNf5F4mj46Oy5AddUTlHGqBoo5tx29SxI/G1wc5zfdZLdir
	C9+zlysae/hxPfFtkc9Vtj90jwAu3bCl6HSSjWPUyS4jHQ9rLaU3UtyeEFFDkCLSLocJ4uhB/S1
	7AK2uC/s9XbREbG/uvT6IGIQYqw0=
X-Received: by 2002:a17:906:369a:: with SMTP id a26mr39372081ejc.539.1632292954038;
        Tue, 21 Sep 2021 23:42:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkdDvJZEuqy4z2jeakskcrSYfL6dBq85KTjMRgyfnCoMn+hPyF2F91qCQRXVCbzc6p2Cz+kg==
X-Received: by 2002:a17:906:369a:: with SMTP id a26mr39372025ejc.539.1632292953733;
        Tue, 21 Sep 2021 23:42:33 -0700 (PDT)
Subject: Re: [PATCH v3 00/16] perf: KVM: Fix, optimize, and clean up callbacks
To: Sean Christopherson <seanjc@google.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
 Guo Ren <guoren@kernel.org>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvmarm@lists.cs.columbia.edu,
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
 Artem Kashkanov <artem.kashkanov@intel.com>,
 Like Xu <like.xu.linux@gmail.com>, Zhu Lingshan <lingshan.zhu@intel.com>
References: <20210922000533.713300-1-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <edecd594-fb34-f4c9-964d-75ae16eadff6@redhat.com>
Date: Wed, 22 Sep 2021 08:42:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210922000533.713300-1-seanjc@google.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22/09/21 02:05, Sean Christopherson wrote:
> Peter, I left the Intel PT mess as-is.  Having to pass a NULL pointer
> from KVM arm64 seemed to be a lesser evil than more exports and multiple
> registration paths.
> 
> This is a combination of ~2 series to fix bugs in the perf+KVM callbacks,
> optimize the callbacks by employing static_call, and do a variety of
> cleanup in both perf and KVM.
> 
> Patch 1 fixes a mostly-theoretical bug where perf can deref a NULL
> pointer if KVM unregisters its callbacks while they're being accessed.
> In practice, compilers tend to avoid problematic reloads of the pointer
> and the PMI handler doesn't lose the race against module unloading,
> i.e doesn't hit a use-after-free.
> 
> Patches 2 and 3 fix an Intel PT handling bug where KVM incorrectly
> eats PT interrupts when PT is supposed to be owned entirely by the host.
> 
> Patches 4-9 clean up perf's callback infrastructure and switch to
> static_call for arm64 and x86 (the only survivors).
> 
> Patches 10-16 clean up related KVM code and unify the arm64/x86 callbacks.
> 
> Based on "git://git.kernel.org/pub/scm/virt/kvm/kvm.git queue", commit
> 680c7e3be6a3 ("KVM: x86: Exit to userspace ...").

Looks nice apart from a couple nits, I will gladly accept a topic branch 
with both the perf and the KVM parts.

Thanks,

Paolo

> v3:
>    - Add wrappers for guest callbacks to that stubs can be provided when
>      GUEST_PERF_EVENTS=n.
>    - s/HAVE_GUEST_PERF_EVENTS/GUEST_PERF_EVENTS and select it from KVM
>      and XEN_PV instead of from top-level arm64/x86. [Paolo]
>    - Drop an unnecessary synchronize_rcu() when registering callbacks. [Peter]
>    - Retain a WARN_ON_ONCE() when unregistering callbacks if the caller
>      didn't provide the correct pointer. [Peter]
>    - Rework the static_call patch to move it all to common perf.
>    - Add a patch to drop the (un)register stubs, made possible after
>      having KVM+XEN_PV select GUEST_PERF_EVENTS.
>    - Split dropping guest callback "support" for arm, csky, etc... to a
>      separate patch, to make introducing GUEST_PERF_EVENTS cleaner.
>    
> v2 (relative to static_call v10):
>    - Split the patch into the semantic change (multiplexed ->state) and
>      introduction of static_call.
>    - Don't use '0' for "not a guest RIP".
>    - Handle unregister path.
>    - Drop changes for architectures that can be culled entirely.
> 
> v2 (relative to v1):
>    - https://lkml.kernel.org/r/20210828003558.713983-6-seanjc@google.com
>    - Drop per-cpu approach. [Peter]
>    - Fix mostly-theoretical reload and use-after-free with READ_ONCE(),
>      WRITE_ONCE(), and synchronize_rcu(). [Peter]
>    - Avoid new exports like the plague. [Peter]
> 
> v1:
>    - https://lkml.kernel.org/r/20210827005718.585190-1-seanjc@google.com
> 
> v10 static_call:
>    - https://lkml.kernel.org/r/20210806133802.3528-2-lingshan.zhu@intel.com
> 
> 
> Like Xu (1):
>    perf/core: Rework guest callbacks to prepare for static_call support
> 
> Sean Christopherson (15):
>    perf: Ensure perf_guest_cbs aren't reloaded between !NULL check and
>      deref
>    KVM: x86: Register perf callbacks after calling vendor's
>      hardware_setup()
>    KVM: x86: Register Processor Trace interrupt hook iff PT enabled in
>      guest
>    perf: Stop pretending that perf can handle multiple guest callbacks
>    perf: Drop dead and useless guest "support" from arm, csky, nds32 and
>      riscv
>    perf: Add wrappers for invoking guest callbacks
>    perf: Force architectures to opt-in to guest callbacks
>    perf/core: Use static_call to optimize perf_guest_info_callbacks
>    KVM: x86: Drop current_vcpu for kvm_running_vcpu + kvm_arch_vcpu
>      variable
>    KVM: x86: More precisely identify NMI from guest when handling PMI
>    KVM: Move x86's perf guest info callbacks to generic KVM
>    KVM: x86: Move Intel Processor Trace interrupt handler to vmx.c
>    KVM: arm64: Convert to the generic perf callbacks
>    KVM: arm64: Drop perf.c and fold its tiny bits of code into arm.c /
>      pmu.c
>    perf: Drop guest callback (un)register stubs
> 
>   arch/arm/kernel/perf_callchain.c   | 28 ++------------
>   arch/arm64/include/asm/kvm_host.h  |  9 ++++-
>   arch/arm64/kernel/perf_callchain.c | 13 ++++---
>   arch/arm64/kvm/Kconfig             |  1 +
>   arch/arm64/kvm/Makefile            |  2 +-
>   arch/arm64/kvm/arm.c               | 11 +++++-
>   arch/arm64/kvm/perf.c              | 62 ------------------------------
>   arch/arm64/kvm/pmu.c               |  8 ++++
>   arch/csky/kernel/perf_callchain.c  | 10 -----
>   arch/nds32/kernel/perf_event_cpu.c | 29 ++------------
>   arch/riscv/kernel/perf_callchain.c | 10 -----
>   arch/x86/events/core.c             | 13 ++++---
>   arch/x86/events/intel/core.c       |  5 +--
>   arch/x86/include/asm/kvm_host.h    |  7 +++-
>   arch/x86/kvm/Kconfig               |  1 +
>   arch/x86/kvm/pmu.c                 |  2 +-
>   arch/x86/kvm/svm/svm.c             |  2 +-
>   arch/x86/kvm/vmx/vmx.c             | 25 +++++++++++-
>   arch/x86/kvm/x86.c                 | 58 +++++-----------------------
>   arch/x86/kvm/x86.h                 | 17 ++++++--
>   arch/x86/xen/Kconfig               |  1 +
>   arch/x86/xen/pmu.c                 | 32 +++++++--------
>   include/kvm/arm_pmu.h              |  1 +
>   include/linux/kvm_host.h           | 10 +++++
>   include/linux/perf_event.h         | 41 ++++++++++++++------
>   init/Kconfig                       |  4 ++
>   kernel/events/core.c               | 39 +++++++++++++------
>   virt/kvm/kvm_main.c                | 44 +++++++++++++++++++++
>   28 files changed, 235 insertions(+), 250 deletions(-)
>   delete mode 100644 arch/arm64/kvm/perf.c
> 


