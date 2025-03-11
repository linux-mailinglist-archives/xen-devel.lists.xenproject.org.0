Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6A0A5D29A
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 23:36:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909506.1316444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts8Cf-0007Ib-SY; Tue, 11 Mar 2025 22:36:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909506.1316444; Tue, 11 Mar 2025 22:36:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts8Cf-0007G3-PY; Tue, 11 Mar 2025 22:36:01 +0000
Received: by outflank-mailman (input) for mailman id 909506;
 Tue, 11 Mar 2025 22:36:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ts8Ce-0007Fv-A8
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 22:36:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ts8Cd-00Ekqq-07;
 Tue, 11 Mar 2025 22:35:58 +0000
Received: from [2a02:8012:3a1:0:9c08:78f4:b949:88f8]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ts8Cc-005YwK-1y;
 Tue, 11 Mar 2025 22:35:58 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=QMcVRnPEtpojrQJR8QwSjlU+582yLVBHHfLqxmuv9HM=; b=sBW0a3D1OsVEGwgJg6myRoIbKx
	K5j5r243bE4hR2B4GwEfb/0Fyjx45elbsMBOVo1OXVo+69Q0Ciiu18L0hpv0CmsDc0/RUPcWkW+yz
	Fr3e1ZcIMYU1dHMatsx+bqqOAAosjzG43xKSvHPVXWmDhnnCO6L3CgJJyKbYqzh0GZE0=;
Message-ID: <fdadd945-2069-4346-be07-b93198332118@xen.org>
Date: Tue, 11 Mar 2025 22:35:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/16] Suspend to RAM support for Xen on arm64
Content-Language: en-GB
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>
References: <cover.1741164138.git.xakep.amatop@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <cover.1741164138.git.xakep.amatop@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 05/03/2025 09:11, Mykola Kvach wrote:
> This is V1 series from Mirela Simonovic. Ported to 4.16 and with added changes
> suggested here
> https://lore.kernel.org/all/CAKPH-NjmaZENb8gT=+FobrAycRF01_--6GuRA2ck9Di5wiudhA@mail.gmail.com
> 
> This is V2 series form Mykyta Poturai:
> https://marc.info/?l=xen-devel&m=166514782207736&w=2
> 
> This series introduces support for suspend-to-RAM (referred to as "suspend"
> in the following text) for Xen on ARM64. The primary focus of this patch series
> is to add Xen system suspend support. Previous patch series raised many
> questions regarding VCPU context restoration, so the necessary changes will be
> addressed in the next part of this series.

I can't exactly remember the details. But from what you wrote here...

> As part of these changes, all domain flags and related code (which affected
> common functions like vcpu_unblock) have been removed, keeping only the
> essential modifications for Xen suspend/resume. Suspend/resume is now fully
> supported only for the hardware domain.

... it is not clear hwo suspend/resume would work even for the hardware 
domain. Can you clarify?

  Proper support for domU suspend/resume
> will be added in the next part of this patch series.
> 
> The implementation is aligned with the design specification that has been
> proposed on xen-devel list:
> https://lists.xenproject.org/archives/html/xen-devel/2017-12/msg01574.html
> 
> At a high-level the series contains:
 > 1) Support for suspending guests via virtual PSCI SYSTEM_SUSPEND call

This is contradicting what you wrote above. If the call is not meant to 
work for guests, then the call should be forbidden.

> 2) Support for resuming a guest on an interrupt targeted to that guest
> 3) Support for suspending Xen after dom0 finalizes the suspend
> 4) Support for resuming Xen on an interrupt that is targeted to a guest
> 
> --------------------------------------------------------------------------------
> TODO:
> 1) Add VCPU context reset/restore for non-hardware domains.
> 2) Implement xl suspend/resume for Arm (should it follow the x86 approach?).
> 3) Support suspend/resume for GICv3.
> 4) Add suspend support for Arm32.
> 
> --------------------------------------------------------------------------------
> In more details:
> 
> *** About suspending/resuming guests
> 
> The patches included in this series allow PSCI compliant guests that have
> support for suspend to RAM (e.g. echo mem > /sys/power/state in Linux) to
> suspend and resume on top of Xen without any EL1 code changes.
> 
> During their suspend procedure guests will hot-unplug their secondary CPUs,
> triggering Xen's virtual CPU_OFF PSCI implementation, and then finalize the
> suspend from their boot CPU, triggering Xen's virtual SYSTEM_SUSPEND PSCI.
> Guests will save/restore their own EL1 context on suspend/resume.
> 
> A guest is expected to leave enabled interrupts that are considered to be its
> wake-up sources. Those interrupts will be able to wake up the guest. This holds
> regardless of the state of the underlying software layers, i.e. whether Xen gets
> suspended or not doesn't affect the ability of the guest to wake up.
> 
> First argument of SYSTEM_SUSPEND PSCI call is a resume entry point, from which
> the guest assumes to start on resume. On resume, guests assume to be running in
> an environment whose state matches the CPU state after reset, e.g. with reset
> register values, MMU disabled, etc. To ensure this, Xen has to 'reset' the
> VCPU context and save the resume entry point into program counter before the
> guest's VCPU gets scheduled in on resume. This is done when the guest resumes.
> Xen also needs to take care that the guest's view of GIC and timer gets saved.
> Also, while a guest is suspended its watchdogs are paused, in order to avoid
> watchdog triggered shutdown of a guest that has been asleep for a period of time
> that is longer than the watchdog period.
> 
> After this point, from Xen's point of view a suspended guest has one VCPU
> blocked, waiting for an interrupt. When such an interrupt comes, Xen will
> unblock the VCPU of the suspended domain, which results in the guest
> resuming.
> 
> *** About suspending/resuming Xen
> 
> Xen starts its own suspend procedure once dom0 is suspended. Dom0 is
> considered to be the decision maker for EL1 and EL2.
> On suspend, Xen will first freeze all domains. Then, Xen disables physical
> secondary CPUs, which leads to physical CPU_OFF to be called by each secondary
> CPU. After that Xen finalizes the suspend from the boot CPU.
> 
> This consists of suspending the timer, i.e. suppressing its interrupts (we don't
> want to be woken up by a timer, there is no VCPU ready to be scheduled). Then
> the state of GIC is saved, console is suspended, and CPU context is saved. The
> saved context tells where Xen needs to continue execution on resume.
> Since Xen will resume with MMU disabled, the first thing to do in resume is to
> resume memory management in order to be able to access the context that needs to
> be restored (we know virtual address of the context data). Finally Xen calls
> SYSTEM_SUSPEND PSCI to the EL3.
> 
> When resuming, all the steps done in suspend need to be reverted. This is
> completed by unblocking dom0's VCPU, because we always want the dom0 to
> resume,
> regardless of the target domain whose interrupt woke up Xen.
> 
> *** Handling of unprivileged guests during Xen suspend/resume
> 
> Any domU that is not suspended when dom0 suspends will be frozen, domUs that are
> already suspended remain suspended. On resume the suspended domUs still remain
> suspended (unless their wake interrupt caused Xen to wake) while the
> others will be thawed.
> 
> For more details please refer to patches or the design specification:
> https://lists.xenproject.org/archives/html/xen-devel/2017-12/msg01574.html
> 
> --------------------------------------------------------------------------------
> CHANGELOG
> 
> In this cover letter and in the commit messages within the changelog section:
> - patch series V1 refers to https://marc.info/?l=xen-devel&m=154202231501850&w=2
> - patch series V2 refers to https://marc.info/?l=xen-devel&m=166514782207736&w=2
> 
> Changes introduced in V3:

So this series is v3?

> Mirela Simonovic (9):
>    xen/x86: Move freeze/thaw_domains into common files
>    xen/arm: introduce a separate struct for watchdog timers
>    xen/arm: add suspend and resume timer helpers
>    xen/arm: Implement GIC suspend/resume functions (gicv2 only)
>    xen/arm: Implement PSCI system suspend
>    xen/arm: Trigger Xen suspend when hardware domain completes suspend
>    xen/arm: Implement PSCI SYSTEM_SUSPEND call (physical interface)
>    xen/arm: Resume memory management on Xen resume
>    xen/arm: Save/restore context on suspend/resume
> 
> Mykola Kvach (6):
>    xen/cpu: prevent disable_nonboot_cpus crash on ARM64
>    xen/percpu: don't initialize percpu on resume
>    xen/arm: Introduce system suspend config option
>    xen/char: implement suspend/resume calls for SCIF driver
>    xen/arm: add watchdog domain suspend/resume helpers
>    CHANGELOG: Mention Xen suspend/resume to RAM feature on arm64
> 
> Mykyta Poturai (1):
>    iommu: Add checks before calling iommu suspend/resume

This series is quite large and complex to review. I am wondering if it 
would make sense to split in smaller chunk so it is quicker to 
review/merge. One split I can think of is:

* disabling CPU (could be tested using the hotplug hypercall)
* guest suspend/resume (could be tested using xl suspend/resume)
* System suspend/resume

> 
>   CHANGELOG.md                          |   2 +
>   xen/arch/arm/Kconfig                  |  11 +
>   xen/arch/arm/Makefile                 |   1 +
>   xen/arch/arm/arm64/head.S             | 117 ++++++++++
>   xen/arch/arm/gic-v2.c                 | 142 ++++++++++++
>   xen/arch/arm/gic.c                    |  29 +++
>   xen/arch/arm/include/asm/domain.h     |   3 +
>   xen/arch/arm/include/asm/gic.h        |  12 +
>   xen/arch/arm/include/asm/perfc_defn.h |   1 +
>   xen/arch/arm/include/asm/psci.h       |   3 +
>   xen/arch/arm/include/asm/suspend.h    |  41 ++++
>   xen/arch/arm/include/asm/time.h       |   5 +
>   xen/arch/arm/psci.c                   |  19 ++
>   xen/arch/arm/setup.c                  |   8 +
>   xen/arch/arm/suspend.c                | 320 ++++++++++++++++++++++++++
>   xen/arch/arm/time.c                   |  26 +++
>   xen/arch/arm/vpsci.c                  |  32 +++
>   xen/arch/x86/acpi/power.c             |  29 ---
>   xen/common/cpu.c                      |  43 ++++
>   xen/common/domain.c                   |  30 +++
>   xen/common/keyhandler.c               |   2 +-
>   xen/common/percpu.c                   |   3 +-
>   xen/common/sched/core.c               |  50 +++-
>   xen/drivers/char/scif-uart.c          |  31 ++-
>   xen/drivers/passthrough/iommu.c       |   4 +-
>   xen/include/xen/sched.h               |  15 +-
>   xen/include/xen/watchdog.h            |   6 +

You also want to update SUPPORT.md for the two/three new features. They 
probably want to be experimental until you fix everything mentioned in 
the cover letter (aside maybe cpu off which can be tech preview).

>   27 files changed, 945 insertions(+), 40 deletions(-)
>   create mode 100644 xen/arch/arm/include/asm/suspend.h
>   create mode 100644 xen/arch/arm/suspend.c
> 

Cheers,

-- 
Julien Grall


