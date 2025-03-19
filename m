Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 173BCA68C43
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 13:01:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920400.1324589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tus6U-0005b1-4Y; Wed, 19 Mar 2025 12:00:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920400.1324589; Wed, 19 Mar 2025 12:00:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tus6U-0005YW-0j; Wed, 19 Mar 2025 12:00:58 +0000
Received: by outflank-mailman (input) for mailman id 920400;
 Wed, 19 Mar 2025 12:00:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eFby=WG=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1tus6S-0004qj-Kz
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 12:00:56 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0495fee-04b9-11f0-9ea0-5ba50f476ded;
 Wed, 19 Mar 2025 13:00:55 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5499659e669so7527147e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 05:00:55 -0700 (PDT)
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
X-Inumbo-ID: d0495fee-04b9-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742385655; x=1742990455; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LCpJxmJrUIVhvJkhCnVRAdYDZPfT1HCUmBaFf2vpgh4=;
        b=CPq/UkoxT01k4wjoP1j8vtUOWykfyWwi5Agq/thO4kvGDEdYQyBnN+YkVeLnJq6pjB
         NXLGxw86RLfaLHEmM0jgKXlX0eHDNYc0n9SdIQMRk0Zladzunbp3pOpRiZd2yi9BaICH
         aCpqdEkjrS63Hvxv/hdiYnEK0r9UyFacqX9V6uyPWLzGMSwLrEgigAU1uonmVRPAix7g
         4m2uGjS65ZQ5OadcMV+GiIsxjc1Ahr+er+YopHLh/ADXwATJkuW1+l256+0yPfLmAOzG
         OroWewQU6O0g4jNfKcwa7AzHjXPUlhkjVb5+g2nKh0LviF6g30v4qxERpgeLrAXvPh+q
         hAWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742385655; x=1742990455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LCpJxmJrUIVhvJkhCnVRAdYDZPfT1HCUmBaFf2vpgh4=;
        b=TtEnPgqwN9xOLgfRedHH7QPeJb+5isGWSBE3OsEytSi3KdmfpSpXgQWtYbCrRnpJSg
         87oBKtl0QGg267hO90D3Mk15NdmB9uRFy6vkIHROyn5hP+mJH3b8TMOCo3dKrkLDkFT+
         LP3pX6bPiJFETSTGJ8vjWug9NOx5H8flBeunHsHMLzbi7MpfaBF17CLiwm1cQZcdXau3
         aJ8X1fbPK35dL2iuUsEnclMyuWbKliCUPCzUvLZ9a4Jjr45XB/GAIA8T3Y4OW+yjyXdC
         wcC0RCpIkWZ3v+Nf2QFMu8IoxnptO3p6LAYfyY2DgcPsrxOy6sQV9zqq19+FLv8E0Jc6
         s/6Q==
X-Gm-Message-State: AOJu0Yzv6um4dZjALpU1Y7HpwCHUwA7RI3NXsL1kuSSL4GrZxMR5f88P
	8OO7MZw6AbZe7rE3qHXPpuqRbqoGiYO1LFZUPxVao4ng1jY0hadEVleBM32+Jd06gl5MjnytEEb
	Hr3EFGnVZJS1b6zXiE6s4bi7odIIqHQ==
X-Gm-Gg: ASbGnct0WznnkgYemYUKnNI1jl4PoDGxNpehD537mRfNA/9/IccvatLkmjW8ZsEZCSd
	01HcxAl8shmDRZFw7B0bjEhGu9qigzZy8pA2zLs1hyHk9ZSNtT89MVLYtvddjFpYLtAI/z54gFm
	nnLK+7amzAYKo1IyJ0wdgxhn3j
X-Google-Smtp-Source: AGHT+IGr+Ovauo+3tovu+LmY5x5+0jFUQazWhkFvCliSGYvXJp0fJcuXjNxE5eoNsOuRO/knyCf8PmXiY9xyNS6hw+8=
X-Received: by 2002:a05:6512:3d86:b0:549:8db6:b2da with SMTP id
 2adb3069b0e04-54acb1d43b0mr765391e87.30.1742385654852; Wed, 19 Mar 2025
 05:00:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1741164138.git.xakep.amatop@gmail.com> <fdadd945-2069-4346-be07-b93198332118@xen.org>
In-Reply-To: <fdadd945-2069-4346-be07-b93198332118@xen.org>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 19 Mar 2025 14:00:42 +0200
X-Gm-Features: AQ5f1JruQuP5ipOakDTB0Br-8_Ujv8YNxVg4pwtw5Y0nyJ1gFcf9o3AfgtBF1yw
Message-ID: <CAGeoDV8Y4kZSe6aRVcngX6_rNhsgu6bFTL_XQQcafpZVhJdMyg@mail.gmail.com>
Subject: Re: [PATCH 00/16] Suspend to RAM support for Xen on arm64
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
	Community Manager <community.manager@xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Mar 12, 2025 at 12:36=E2=80=AFAM Julien Grall <julien@xen.org> wrot=
e:
>
> Hi,
>
> On 05/03/2025 09:11, Mykola Kvach wrote:
> > This is V1 series from Mirela Simonovic. Ported to 4.16 and with added =
changes
> > suggested here
> > https://lore.kernel.org/all/CAKPH-NjmaZENb8gT=3D+FobrAycRF01_--6GuRA2ck=
9Di5wiudhA@mail.gmail.com
> >
> > This is V2 series form Mykyta Poturai:
> > https://marc.info/?l=3Dxen-devel&m=3D166514782207736&w=3D2
> >
> > This series introduces support for suspend-to-RAM (referred to as "susp=
end"
> > in the following text) for Xen on ARM64. The primary focus of this patc=
h series
> > is to add Xen system suspend support. Previous patch series raised many
> > questions regarding VCPU context restoration, so the necessary changes =
will be
> > addressed in the next part of this series.
>
> I can't exactly remember the details. But from what you wrote here...
>
> > As part of these changes, all domain flags and related code (which affe=
cted
> > common functions like vcpu_unblock) have been removed, keeping only the
> > essential modifications for Xen suspend/resume. Suspend/resume is now f=
ully
> > supported only for the hardware domain.
>
> ... it is not clear hwo suspend/resume would work even for the hardware
> domain. Can you clarify?

It can work on a simple setup with a thin Dom0 that has only basic
resources like CPUs,
a virtual console, GIC and a timer, without requiring additional hardware.
vcpu_unblock called directly during resuming the hardware domain.

>
>   Proper support for domU suspend/resume
> > will be added in the next part of this patch series.
> >
> > The implementation is aligned with the design specification that has be=
en
> > proposed on xen-devel list:
> > https://lists.xenproject.org/archives/html/xen-devel/2017-12/msg01574.h=
tml
> >
> > At a high-level the series contains:
>  > 1) Support for suspending guests via virtual PSCI SYSTEM_SUSPEND call
>
> This is contradicting what you wrote above. If the call is not meant to
> work for guests, then the call should be forbidden.

Oops! It seems like not all parts of the cover letter were updated
after the last changes
I used the previous version as a base. I'll fix it. Thank you for
pointing that out

>
> > 2) Support for resuming a guest on an interrupt targeted to that guest
> > 3) Support for suspending Xen after dom0 finalizes the suspend
> > 4) Support for resuming Xen on an interrupt that is targeted to a guest
> >
> > -----------------------------------------------------------------------=
---------
> > TODO:
> > 1) Add VCPU context reset/restore for non-hardware domains.
> > 2) Implement xl suspend/resume for Arm (should it follow the x86 approa=
ch?).
> > 3) Support suspend/resume for GICv3.
> > 4) Add suspend support for Arm32.
> >
> > -----------------------------------------------------------------------=
---------
> > In more details:
> >
> > *** About suspending/resuming guests
> >
> > The patches included in this series allow PSCI compliant guests that ha=
ve
> > support for suspend to RAM (e.g. echo mem > /sys/power/state in Linux) =
to
> > suspend and resume on top of Xen without any EL1 code changes.
> >
> > During their suspend procedure guests will hot-unplug their secondary C=
PUs,
> > triggering Xen's virtual CPU_OFF PSCI implementation, and then finalize=
 the
> > suspend from their boot CPU, triggering Xen's virtual SYSTEM_SUSPEND PS=
CI.
> > Guests will save/restore their own EL1 context on suspend/resume.
> >
> > A guest is expected to leave enabled interrupts that are considered to =
be its
> > wake-up sources. Those interrupts will be able to wake up the guest. Th=
is holds
> > regardless of the state of the underlying software layers, i.e. whether=
 Xen gets
> > suspended or not doesn't affect the ability of the guest to wake up.
> >
> > First argument of SYSTEM_SUSPEND PSCI call is a resume entry point, fro=
m which
> > the guest assumes to start on resume. On resume, guests assume to be ru=
nning in
> > an environment whose state matches the CPU state after reset, e.g. with=
 reset
> > register values, MMU disabled, etc. To ensure this, Xen has to 'reset' =
the
> > VCPU context and save the resume entry point into program counter befor=
e the
> > guest's VCPU gets scheduled in on resume. This is done when the guest r=
esumes.
> > Xen also needs to take care that the guest's view of GIC and timer gets=
 saved.
> > Also, while a guest is suspended its watchdogs are paused, in order to =
avoid
> > watchdog triggered shutdown of a guest that has been asleep for a perio=
d of time
> > that is longer than the watchdog period.
> >
> > After this point, from Xen's point of view a suspended guest has one VC=
PU
> > blocked, waiting for an interrupt. When such an interrupt comes, Xen wi=
ll
> > unblock the VCPU of the suspended domain, which results in the guest
> > resuming.
> >
> > *** About suspending/resuming Xen
> >
> > Xen starts its own suspend procedure once dom0 is suspended. Dom0 is
> > considered to be the decision maker for EL1 and EL2.
> > On suspend, Xen will first freeze all domains. Then, Xen disables physi=
cal
> > secondary CPUs, which leads to physical CPU_OFF to be called by each se=
condary
> > CPU. After that Xen finalizes the suspend from the boot CPU.
> >
> > This consists of suspending the timer, i.e. suppressing its interrupts =
(we don't
> > want to be woken up by a timer, there is no VCPU ready to be scheduled)=
. Then
> > the state of GIC is saved, console is suspended, and CPU context is sav=
ed. The
> > saved context tells where Xen needs to continue execution on resume.
> > Since Xen will resume with MMU disabled, the first thing to do in resum=
e is to
> > resume memory management in order to be able to access the context that=
 needs to
> > be restored (we know virtual address of the context data). Finally Xen =
calls
> > SYSTEM_SUSPEND PSCI to the EL3.
> >
> > When resuming, all the steps done in suspend need to be reverted. This =
is
> > completed by unblocking dom0's VCPU, because we always want the dom0 to
> > resume,
> > regardless of the target domain whose interrupt woke up Xen.
> >
> > *** Handling of unprivileged guests during Xen suspend/resume
> >
> > Any domU that is not suspended when dom0 suspends will be frozen, domUs=
 that are
> > already suspended remain suspended. On resume the suspended domUs still=
 remain
> > suspended (unless their wake interrupt caused Xen to wake) while the
> > others will be thawed.
> >
> > For more details please refer to patches or the design specification:
> > https://lists.xenproject.org/archives/html/xen-devel/2017-12/msg01574.h=
tml
> >
> > -----------------------------------------------------------------------=
---------
> > CHANGELOG
> >
> > In this cover letter and in the commit messages within the changelog se=
ction:
> > - patch series V1 refers to https://marc.info/?l=3Dxen-devel&m=3D154202=
231501850&w=3D2
> > - patch series V2 refers to https://marc.info/?l=3Dxen-devel&m=3D166514=
782207736&w=3D2
> >
> > Changes introduced in V3:
>
> So this series is v3?

Yes, it's version 3, but I didn't add the version tag because years
passed between these
three versions, and the previous version of the patch series didn't
include the correct tag
either. If you'd like, I can add the correct version tag during the
next update of this patch
series.

>
> > Mirela Simonovic (9):
> >    xen/x86: Move freeze/thaw_domains into common files
> >    xen/arm: introduce a separate struct for watchdog timers
> >    xen/arm: add suspend and resume timer helpers
> >    xen/arm: Implement GIC suspend/resume functions (gicv2 only)
> >    xen/arm: Implement PSCI system suspend
> >    xen/arm: Trigger Xen suspend when hardware domain completes suspend
> >    xen/arm: Implement PSCI SYSTEM_SUSPEND call (physical interface)
> >    xen/arm: Resume memory management on Xen resume
> >    xen/arm: Save/restore context on suspend/resume
> >
> > Mykola Kvach (6):
> >    xen/cpu: prevent disable_nonboot_cpus crash on ARM64
> >    xen/percpu: don't initialize percpu on resume
> >    xen/arm: Introduce system suspend config option
> >    xen/char: implement suspend/resume calls for SCIF driver
> >    xen/arm: add watchdog domain suspend/resume helpers
> >    CHANGELOG: Mention Xen suspend/resume to RAM feature on arm64
> >
> > Mykyta Poturai (1):
> >    iommu: Add checks before calling iommu suspend/resume
>
> This series is quite large and complex to review. I am wondering if it
> would make sense to split in smaller chunk so it is quicker to
> review/merge. One split I can think of is:
>
> * disabling CPU (could be tested using the hotplug hypercall)
> * guest suspend/resume (could be tested using xl suspend/resume)
> * System suspend/resume

Okay, I'll split this patch series into a few parts

>
> >
> >   CHANGELOG.md                          |   2 +
> >   xen/arch/arm/Kconfig                  |  11 +
> >   xen/arch/arm/Makefile                 |   1 +
> >   xen/arch/arm/arm64/head.S             | 117 ++++++++++
> >   xen/arch/arm/gic-v2.c                 | 142 ++++++++++++
> >   xen/arch/arm/gic.c                    |  29 +++
> >   xen/arch/arm/include/asm/domain.h     |   3 +
> >   xen/arch/arm/include/asm/gic.h        |  12 +
> >   xen/arch/arm/include/asm/perfc_defn.h |   1 +
> >   xen/arch/arm/include/asm/psci.h       |   3 +
> >   xen/arch/arm/include/asm/suspend.h    |  41 ++++
> >   xen/arch/arm/include/asm/time.h       |   5 +
> >   xen/arch/arm/psci.c                   |  19 ++
> >   xen/arch/arm/setup.c                  |   8 +
> >   xen/arch/arm/suspend.c                | 320 +++++++++++++++++++++++++=
+
> >   xen/arch/arm/time.c                   |  26 +++
> >   xen/arch/arm/vpsci.c                  |  32 +++
> >   xen/arch/x86/acpi/power.c             |  29 ---
> >   xen/common/cpu.c                      |  43 ++++
> >   xen/common/domain.c                   |  30 +++
> >   xen/common/keyhandler.c               |   2 +-
> >   xen/common/percpu.c                   |   3 +-
> >   xen/common/sched/core.c               |  50 +++-
> >   xen/drivers/char/scif-uart.c          |  31 ++-
> >   xen/drivers/passthrough/iommu.c       |   4 +-
> >   xen/include/xen/sched.h               |  15 +-
> >   xen/include/xen/watchdog.h            |   6 +
>
> You also want to update SUPPORT.md for the two/three new features. They
> probably want to be experimental until you fix everything mentioned in
> the cover letter (aside maybe cpu off which can be tech preview).

Got it, I'll make the necessary updates.

>
> >   27 files changed, 945 insertions(+), 40 deletions(-)
> >   create mode 100644 xen/arch/arm/include/asm/suspend.h
> >   create mode 100644 xen/arch/arm/suspend.c
> >
>
> Cheers,
>
> --
> Julien Grall
>

Best regards,
Mykola

