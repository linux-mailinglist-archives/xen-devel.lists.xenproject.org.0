Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D228A50003
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 14:15:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902251.1310203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpoa6-0005F9-0j; Wed, 05 Mar 2025 13:14:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902251.1310203; Wed, 05 Mar 2025 13:14:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpoa5-0005Ch-SY; Wed, 05 Mar 2025 13:14:37 +0000
Received: by outflank-mailman (input) for mailman id 902251;
 Wed, 05 Mar 2025 13:14:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0bc7=VY=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1tpoa5-0005Ca-2I
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 13:14:37 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8e1e223-f9c3-11ef-9ab4-95dc52dad729;
 Wed, 05 Mar 2025 14:14:35 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5496bc2e1b7so3433704e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 05:14:35 -0800 (PST)
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
X-Inumbo-ID: c8e1e223-f9c3-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741180475; x=1741785275; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8CYg7/FxYYbOQcf9VmsMAYV4DJYhIFi8m+iESi8XBWc=;
        b=Dn1jt8YzhLEPrIi8VidOV53jEGakkbbra5ZUxHqvZrmXs0o1kAH9I65GyvGJytNpDJ
         GtJ2vNd8i9tmVbUgeeGxRq6bInvr6WsLOse1Ujyd0U+DCIophhwAhwgX/f6zlkxjpvqF
         N26OoUofy1REeohwn/+V7lj4ER9Gttdxgm03H3duxQnTGuczZOGyhJ6Bc/09hkkZQI9z
         Vpq0Oj/O9MknymZNawsnyo/Ss92H1HCR0DBZyRYrbGw/Ns2MFNH705jmtg8XBGBC31Pp
         M2pq6Ei3Y94eNYJLBRabW6C0icha2aL/bmgyJXtszmQV8utM1wAsgZ350fnkgbcaHRAG
         k4vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741180475; x=1741785275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8CYg7/FxYYbOQcf9VmsMAYV4DJYhIFi8m+iESi8XBWc=;
        b=nOKOEYVr9BnxCAR0DJm6UtcNlhhfT/8/R+HqHePc1786yGmDrj+/pVlq3k8sbsP9Eu
         wkbp6mblTXvAK/OWkGgFr0pkvSuurZvH9i7I/yK5y6Ph8Rn5apLKHLRxOsz7CSZ0w2cF
         eksMtuNJx0TUznEhbfdZ+OYJGrSkhipvMhos0KtbitcYXXJtyJSlYkQ1znf1bMRj9qA1
         M0xnc/amxx9zKBDCHVbEhEYYoLJExYVz2V/kI+0C3ln0yVtd18JhhWrJuyKD2goR1RFd
         fRCbk48ROzkkUi0+8n9F96udzLb/0amn0mp+VBaCWvIcDY0H1LItd1ZLeST9joH+Xc4d
         dvlQ==
X-Gm-Message-State: AOJu0YxPmRZMqinfoqhNejKbhBXCJAOVumSDuhJNU2tDpVnSRMvNyGed
	VaHOv444REQQ/nMwNzxFvxVSMteU3KFcgIZkt4rF7TfOulVS4FXCGK6oQcprJEBNYeOUn41ZLJS
	nCfOuYOj3q0SAKou+IbqPViuP4Hbypyn5ubMbMg==
X-Gm-Gg: ASbGncsxwwcgMqbIzGygm8z4jLBZUw4lRMSrydT03b2ypf6BnZwAp0wCMH9Fo88MpCC
	ETeG7VI4zoA5oM8KrqpGGYAVXPFzxgAcvWmxMnYaB5oKXgnksyJ1ODceuuaOlSRGb3yQohRvgLR
	QaN21ufTJmZRwwXBtl/UOKK1wn7w==
X-Google-Smtp-Source: AGHT+IH/wMR1vhCFewlIWyWcInAJTNbviD3GVz3iB+Qow6DHc9hcbBO+jEegaArU2LxnS0K8udUigjIwwSdxfYDbnek=
X-Received: by 2002:a05:6512:b8f:b0:549:7c13:e8ac with SMTP id
 2adb3069b0e04-5497d376c9amr1361875e87.33.1741180474395; Wed, 05 Mar 2025
 05:14:34 -0800 (PST)
MIME-Version: 1.0
References: <cover.1741164138.git.xakep.amatop@gmail.com>
In-Reply-To: <cover.1741164138.git.xakep.amatop@gmail.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 5 Mar 2025 15:14:22 +0200
X-Gm-Features: AQ5f1JqU8RmGd1cWG1FSjbv8ZCUvEpR-I594OZ-EZaafIExz9PtMIEjwvYVMjVU
Message-ID: <CAGeoDV-wz9rE0NK4tGLBwYs9NzBsYZG7fCXZEMkaCMsFXKZ2dQ@mail.gmail.com>
Subject: Re: [PATCH 00/16] Suspend to RAM support for Xen on arm64
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Dario Faggioli <dfaggioli@suse.com>, 
	Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
	Community Manager <community.manager@xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 5, 2025 at 11:11=E2=80=AFAM Mykola Kvach <xakep.amatop@gmail.co=
m> wrote:
>
> This is V1 series from Mirela Simonovic. Ported to 4.16 and with added ch=
anges
> suggested here
> https://lore.kernel.org/all/CAKPH-NjmaZENb8gT=3D+FobrAycRF01_--6GuRA2ck9D=
i5wiudhA@mail.gmail.com
>
> This is V2 series form Mykyta Poturai:
> https://marc.info/?l=3Dxen-devel&m=3D166514782207736&w=3D2
>
> This series introduces support for suspend-to-RAM (referred to as "suspen=
d"
> in the following text) for Xen on ARM64. The primary focus of this patch =
series
> is to add Xen system suspend support. Previous patch series raised many
> questions regarding VCPU context restoration, so the necessary changes wi=
ll be
> addressed in the next part of this series.
> As part of these changes, all domain flags and related code (which affect=
ed
> common functions like vcpu_unblock) have been removed, keeping only the
> essential modifications for Xen suspend/resume. Suspend/resume is now ful=
ly
> supported only for the hardware domain. Proper support for domU suspend/r=
esume
> will be added in the next part of this patch series.
>
> The implementation is aligned with the design specification that has been
> proposed on xen-devel list:
> https://lists.xenproject.org/archives/html/xen-devel/2017-12/msg01574.htm=
l
>
> At a high-level the series contains:
> 1) Support for suspending guests via virtual PSCI SYSTEM_SUSPEND call
> 2) Support for resuming a guest on an interrupt targeted to that guest
> 3) Support for suspending Xen after dom0 finalizes the suspend
> 4) Support for resuming Xen on an interrupt that is targeted to a guest
>
> -------------------------------------------------------------------------=
-------
> TODO:

0) Add suspend/resume handlers to IOMMU drivers (there aren=E2=80=99t any
problems with the current implementation because the domains used for
test are thin, and this patch series implements only the very basic
logic)

> 1) Add VCPU context reset/restore for non-hardware domains.
> 2) Implement xl suspend/resume for Arm (should it follow the x86 approach=
?).
> 3) Support suspend/resume for GICv3.
> 4) Add suspend support for Arm32
>
> -------------------------------------------------------------------------=
-------
> In more details:
>
> *** About suspending/resuming guests
>
> The patches included in this series allow PSCI compliant guests that have
> support for suspend to RAM (e.g. echo mem > /sys/power/state in Linux) to
> suspend and resume on top of Xen without any EL1 code changes.
>
> During their suspend procedure guests will hot-unplug their secondary CPU=
s,
> triggering Xen's virtual CPU_OFF PSCI implementation, and then finalize t=
he
> suspend from their boot CPU, triggering Xen's virtual SYSTEM_SUSPEND PSCI=
.
> Guests will save/restore their own EL1 context on suspend/resume.
>
> A guest is expected to leave enabled interrupts that are considered to be=
 its
> wake-up sources. Those interrupts will be able to wake up the guest. This=
 holds
> regardless of the state of the underlying software layers, i.e. whether X=
en gets
> suspended or not doesn't affect the ability of the guest to wake up.
>
> First argument of SYSTEM_SUSPEND PSCI call is a resume entry point, from =
which
> the guest assumes to start on resume. On resume, guests assume to be runn=
ing in
> an environment whose state matches the CPU state after reset, e.g. with r=
eset
> register values, MMU disabled, etc. To ensure this, Xen has to 'reset' th=
e
> VCPU context and save the resume entry point into program counter before =
the
> guest's VCPU gets scheduled in on resume. This is done when the guest res=
umes.
> Xen also needs to take care that the guest's view of GIC and timer gets s=
aved.
> Also, while a guest is suspended its watchdogs are paused, in order to av=
oid
> watchdog triggered shutdown of a guest that has been asleep for a period =
of time
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
> On suspend, Xen will first freeze all domains. Then, Xen disables physica=
l
> secondary CPUs, which leads to physical CPU_OFF to be called by each seco=
ndary
> CPU. After that Xen finalizes the suspend from the boot CPU.
>
> This consists of suspending the timer, i.e. suppressing its interrupts (w=
e don't
> want to be woken up by a timer, there is no VCPU ready to be scheduled). =
Then
> the state of GIC is saved, console is suspended, and CPU context is saved=
. The
> saved context tells where Xen needs to continue execution on resume.
> Since Xen will resume with MMU disabled, the first thing to do in resume =
is to
> resume memory management in order to be able to access the context that n=
eeds to
> be restored (we know virtual address of the context data). Finally Xen ca=
lls
> SYSTEM_SUSPEND PSCI to the EL3.
>
> When resuming, all the steps done in suspend need to be reverted. This is
> completed by unblocking dom0's VCPU, because we always want the dom0 to
> resume,
> regardless of the target domain whose interrupt woke up Xen.
>
> *** Handling of unprivileged guests during Xen suspend/resume
>
> Any domU that is not suspended when dom0 suspends will be frozen, domUs t=
hat are
> already suspended remain suspended. On resume the suspended domUs still r=
emain
> suspended (unless their wake interrupt caused Xen to wake) while the
> others will be thawed.
>
> For more details please refer to patches or the design specification:
> https://lists.xenproject.org/archives/html/xen-devel/2017-12/msg01574.htm=
l
>
> -------------------------------------------------------------------------=
-------
> CHANGELOG
>
> In this cover letter and in the commit messages within the changelog sect=
ion:
> - patch series V1 refers to https://marc.info/?l=3Dxen-devel&m=3D15420223=
1501850&w=3D2
> - patch series V2 refers to https://marc.info/?l=3Dxen-devel&m=3D16651478=
2207736&w=3D2
>
> Changes introduced in V3:
> - drop all domain flags and related code (which touched common functions =
like
>   vcpu_unblock), keeping only the necessary changes for Xen suspend/resum=
e,
>   i.e. suspend/resume is now fully supported only for the hardware domain=
.
>   Proper support for domU suspend/resume will be added in a future patch.
>   This patch does not yet include VCPU context reset or domain context
>   restoration in VCPU.
> - add checks before calling IOMMU suspend/resume. These functions may be
>   unimplemented, so check that they exist before calling to prevent crash=
es
> - prevent disable_nonboot_cpus crash on ARM64. If we call disable_nonboot=
_cpus
>   on ARM64 with system_state set to SYS_STATE_suspend, the ASSERT_ALLOC_C=
ONTEXT
>   assertion will be triggered
> - drop commit "timer: don't migrate timers during suspend" (see comment
>   https://marc.info/?l=3Dxen-devel&m=3D167036477229741&w=3D2). There is n=
o freeze of
>   dom0 on the latest master
> - drop the commit introduced in patch series V2: "xen: don't free percpu =
areas
>   during suspend." This commit was ported from x86 code, but in the new m=
aster,
>   the percpu CPU state change notification call chain has become common, =
so
>   there is no reason to port this code. The remaining part, which does no=
t
>   belong to the aforementioned patch, "don't initialize percpu on resume,=
" has
>   been introduced in a new separate commit
> - introduce system suspend config option and covered code related to
>   suspend/resume with it
> - implement suspend/resume calls for SCIF driver (it was needed for test
>   purpose, code has been tested on R-Car H3 Starter Kit board)
> - the next commits had been appended with "xen/arm: Trigger Xen suspend w=
hen
>   hardware domain completes suspend":
>   -- xen/arm: Disable/enable non-boot physical CPUs on suspend/resume
>   -- xen/arm: Add rcu_barrier() before enabling non-boot CPUs on resume
>   -- xen/arm: Suspend/resume GIC on system suspend/resume
>   -- xen/arm: Resume Dom0 after Xen resumes
>   -- xen/arm: Suspend/resume console on Xen suspend/resume
> - add iommu suspend/resume calls to system suspend/resume
> - return PSCI_NOT_SUPPORTED instead of 1 in case when we call SYSTEM_SUSP=
END
>   on ARM32
> - add checking of PSCI version for SYSTEM_SUSPEND call
> - instead of using create_page_tables, enable_mmu, and mmu_init_secondary=
_cpu,
>   the existing function enable_secondary_cpu_mm is now used
> - prepare_secondary_mm (previously init_secondary_pagetables in the previ=
ous
>   patch series) is now called at the end of start_xen instead of
>   setup_pagetables. Calling it in the previous location caused a crash
> - add early printk init during resume
>
>
> Changes introduced in V2:
> - drop commit "xen/arm: Move code that initializes VCPU context into a se=
parate
>   function" (see comment https://marc.info/?l=3Dxen-devel&m=3D15420286170=
4014&w=3D2)
> - introduce a separate struct for watchdog timers (see comment
>   https://marc.info/?l=3Dxen-devel&m=3D154203624106684&w=3D2)
> - don't initialize percpu on resume, it was a part of "xen: don't free pe=
rcpu
>   areas during suspend"
> - drop the call to watchdog_domain_resume from ctxt_switch_to; drop suspe=
nded
>   field from timer structure introduced for watchdog timer in prev series
> - mov hyp_resume to head.S to place it near the rest of the start code
> - simplify the code in hyp_resume by using existing functions such as
>   check_cpu_mode, cpu_init, create_page_tables, and enable_mmu
> - a lot of changes related to reseting/restoring VCPU context of suspende=
d domU
>
> Mirela Simonovic (9):
>   xen/x86: Move freeze/thaw_domains into common files
>   xen/arm: introduce a separate struct for watchdog timers
>   xen/arm: add suspend and resume timer helpers
>   xen/arm: Implement GIC suspend/resume functions (gicv2 only)
>   xen/arm: Implement PSCI system suspend
>   xen/arm: Trigger Xen suspend when hardware domain completes suspend
>   xen/arm: Implement PSCI SYSTEM_SUSPEND call (physical interface)
>   xen/arm: Resume memory management on Xen resume
>   xen/arm: Save/restore context on suspend/resume
>
> Mykola Kvach (6):
>   xen/cpu: prevent disable_nonboot_cpus crash on ARM64
>   xen/percpu: don't initialize percpu on resume
>   xen/arm: Introduce system suspend config option
>   xen/char: implement suspend/resume calls for SCIF driver
>   xen/arm: add watchdog domain suspend/resume helpers
>   CHANGELOG: Mention Xen suspend/resume to RAM feature on arm64
>
> Mykyta Poturai (1):
>   iommu: Add checks before calling iommu suspend/resume
>
>  CHANGELOG.md                          |   2 +
>  xen/arch/arm/Kconfig                  |  11 +
>  xen/arch/arm/Makefile                 |   1 +
>  xen/arch/arm/arm64/head.S             | 117 ++++++++++
>  xen/arch/arm/gic-v2.c                 | 142 ++++++++++++
>  xen/arch/arm/gic.c                    |  29 +++
>  xen/arch/arm/include/asm/domain.h     |   3 +
>  xen/arch/arm/include/asm/gic.h        |  12 +
>  xen/arch/arm/include/asm/perfc_defn.h |   1 +
>  xen/arch/arm/include/asm/psci.h       |   3 +
>  xen/arch/arm/include/asm/suspend.h    |  41 ++++
>  xen/arch/arm/include/asm/time.h       |   5 +
>  xen/arch/arm/psci.c                   |  19 ++
>  xen/arch/arm/setup.c                  |   8 +
>  xen/arch/arm/suspend.c                | 320 ++++++++++++++++++++++++++
>  xen/arch/arm/time.c                   |  26 +++
>  xen/arch/arm/vpsci.c                  |  32 +++
>  xen/arch/x86/acpi/power.c             |  29 ---
>  xen/common/cpu.c                      |  43 ++++
>  xen/common/domain.c                   |  30 +++
>  xen/common/keyhandler.c               |   2 +-
>  xen/common/percpu.c                   |   3 +-
>  xen/common/sched/core.c               |  50 +++-
>  xen/drivers/char/scif-uart.c          |  31 ++-
>  xen/drivers/passthrough/iommu.c       |   4 +-
>  xen/include/xen/sched.h               |  15 +-
>  xen/include/xen/watchdog.h            |   6 +
>  27 files changed, 945 insertions(+), 40 deletions(-)
>  create mode 100644 xen/arch/arm/include/asm/suspend.h
>  create mode 100644 xen/arch/arm/suspend.c
>
> --
> 2.43.0
>

