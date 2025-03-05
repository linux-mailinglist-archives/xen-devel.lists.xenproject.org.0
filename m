Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC24FA4F999
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 10:12:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901866.1309797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpknH-0006nk-RC; Wed, 05 Mar 2025 09:11:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901866.1309797; Wed, 05 Mar 2025 09:11:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpknH-0006hf-Nv; Wed, 05 Mar 2025 09:11:59 +0000
Received: by outflank-mailman (input) for mailman id 901866;
 Wed, 05 Mar 2025 09:11:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0bc7=VY=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1tpknG-0006ew-CS
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 09:11:58 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2b81052-f9a1-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 10:11:56 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5495078cd59so5447378e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 01:11:56 -0800 (PST)
Received: from EPUAKYIW02F7.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5495de028fasm1078264e87.139.2025.03.05.01.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 01:11:54 -0800 (PST)
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
X-Inumbo-ID: e2b81052-f9a1-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741165915; x=1741770715; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LEJ+ewCk5ZTsC4h3KIII2AfTInBLPsRgNesFUNdRhA8=;
        b=XmB1CAfUGYCLP4asxcaDV+AIZnqCeGh9c2U68tlR9zHXe+SreNzVEtoHSwK8NRCI5K
         rqliaTolehAp8EYJIb+F/G0hgDhfVH1VrcPm6IwmaBAi+0AOhagdDOpi1z1TRoMdGL0u
         pERA9KRD2aCRa0Vp8k1HCaaaFlfsffk8/X2PZxnOhafJ6nNNr+5AULnVx95ZZw48Yu1K
         Oqcgnh5/VBaA4XmkoPVDyBR7T0cfeoFUjTxma0SPBio557IRt8sKFMMPKkseADezBcFV
         EYn+BMyfXVNkmSBiGKLxi6Y4NvWW+RRmThs4saOb5yd3tpa9V8mC/AReXKUdlJMbZw8n
         xaUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741165915; x=1741770715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LEJ+ewCk5ZTsC4h3KIII2AfTInBLPsRgNesFUNdRhA8=;
        b=NznHqM3NgzT0Lr2ut9Z/1sou+R0G56LhfXxICj45dZddGY0KqKOpsgVlwJkkpZu1s6
         XXAE0gPlr0gvS8wjD3FwdYl8AeW/xcdEi2THCroSKnbjay0gpzRnwQXcLlyB5mk/7nJu
         mRFcl9IMM4v56KClXFIQEz5e8xESBjYW1AZMxKMjMVy/xFiFwTg9An7D5cXMiKd3s5Zm
         al7ta9DBDjKKT61STt+7hO4rmGhf0ViNQVFy5NZ1YXbIYaHSwXpT30HIWntzJTsiN548
         9i6Bg7fgH0lbkAn3AgdZDkbqoEuretDI/XMpfxOwsaTSqe/7SF8DzYnsXzPy61DZHBVe
         OuKA==
X-Gm-Message-State: AOJu0Yyl7IR0KeMVbh8Stx4Lzu7t+VLEowMmQPvBVKSs+9NYNlOd4LQc
	igmbJpo9K+smmuZBvRrrIvgNeAph6NwNQz+YjYTollu1LhR7c0MqxSNeIiX4
X-Gm-Gg: ASbGnctCYmK94SPMUANJnm7GgXJM5AM+ic3NHhtMHYkVPxP82sN3G492y6iF7GQvPMS
	BmvYCEdWzkvnU39bSVrEH94NmnPQqjGjbmTpJkYN5ekUTWnf0veLJB2ubvF71puaV6R5ZTEin5Z
	G3g5/yGryKL3bJMvbKU4RxYS4vjHgGkNzx+KkDkW6s+Nh5X95ceWycNeLnh+ciuzumX7VGwjPui
	1BBjtmz32joFnDdMp7DekxSdgpW6YV1y9gLolaNdTBU40StEfjJE5a7ptPYHECnJ1/G0SxvjRYt
	WyjQI2wWDgNn8kn+9NqqCglhgSBPtHKN4w8bHYPFcFq41Lh1zQ==
X-Google-Smtp-Source: AGHT+IEcD4nTgk8YL1I3NFmMRdVB+e1X/El3bdT1f0iXJeyTNmwDL7bL1fH+nT7mNFvH+Zw1GvGK8A==
X-Received: by 2002:a05:6512:33d1:b0:545:2efc:7458 with SMTP id 2adb3069b0e04-5497d377827mr726453e87.39.1741165914831;
        Wed, 05 Mar 2025 01:11:54 -0800 (PST)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <gwd@xenproject.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH 00/16] Suspend to RAM support for Xen on arm64
Date: Wed,  5 Mar 2025 11:11:08 +0200
Message-ID: <cover.1741164138.git.xakep.amatop@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is V1 series from Mirela Simonovic. Ported to 4.16 and with added changes
suggested here
https://lore.kernel.org/all/CAKPH-NjmaZENb8gT=+FobrAycRF01_--6GuRA2ck9Di5wiudhA@mail.gmail.com

This is V2 series form Mykyta Poturai:
https://marc.info/?l=xen-devel&m=166514782207736&w=2

This series introduces support for suspend-to-RAM (referred to as "suspend"
in the following text) for Xen on ARM64. The primary focus of this patch series
is to add Xen system suspend support. Previous patch series raised many
questions regarding VCPU context restoration, so the necessary changes will be
addressed in the next part of this series.
As part of these changes, all domain flags and related code (which affected
common functions like vcpu_unblock) have been removed, keeping only the
essential modifications for Xen suspend/resume. Suspend/resume is now fully
supported only for the hardware domain. Proper support for domU suspend/resume
will be added in the next part of this patch series.

The implementation is aligned with the design specification that has been
proposed on xen-devel list:
https://lists.xenproject.org/archives/html/xen-devel/2017-12/msg01574.html

At a high-level the series contains:
1) Support for suspending guests via virtual PSCI SYSTEM_SUSPEND call
2) Support for resuming a guest on an interrupt targeted to that guest
3) Support for suspending Xen after dom0 finalizes the suspend
4) Support for resuming Xen on an interrupt that is targeted to a guest

--------------------------------------------------------------------------------
TODO:
1) Add VCPU context reset/restore for non-hardware domains.
2) Implement xl suspend/resume for Arm (should it follow the x86 approach?).
3) Support suspend/resume for GICv3.
4) Add suspend support for Arm32.

--------------------------------------------------------------------------------
In more details:

*** About suspending/resuming guests

The patches included in this series allow PSCI compliant guests that have
support for suspend to RAM (e.g. echo mem > /sys/power/state in Linux) to
suspend and resume on top of Xen without any EL1 code changes.

During their suspend procedure guests will hot-unplug their secondary CPUs,
triggering Xen's virtual CPU_OFF PSCI implementation, and then finalize the
suspend from their boot CPU, triggering Xen's virtual SYSTEM_SUSPEND PSCI.
Guests will save/restore their own EL1 context on suspend/resume.

A guest is expected to leave enabled interrupts that are considered to be its
wake-up sources. Those interrupts will be able to wake up the guest. This holds
regardless of the state of the underlying software layers, i.e. whether Xen gets
suspended or not doesn't affect the ability of the guest to wake up.

First argument of SYSTEM_SUSPEND PSCI call is a resume entry point, from which
the guest assumes to start on resume. On resume, guests assume to be running in
an environment whose state matches the CPU state after reset, e.g. with reset
register values, MMU disabled, etc. To ensure this, Xen has to 'reset' the
VCPU context and save the resume entry point into program counter before the
guest's VCPU gets scheduled in on resume. This is done when the guest resumes.
Xen also needs to take care that the guest's view of GIC and timer gets saved.
Also, while a guest is suspended its watchdogs are paused, in order to avoid
watchdog triggered shutdown of a guest that has been asleep for a period of time
that is longer than the watchdog period.

After this point, from Xen's point of view a suspended guest has one VCPU
blocked, waiting for an interrupt. When such an interrupt comes, Xen will
unblock the VCPU of the suspended domain, which results in the guest
resuming.

*** About suspending/resuming Xen

Xen starts its own suspend procedure once dom0 is suspended. Dom0 is
considered to be the decision maker for EL1 and EL2.
On suspend, Xen will first freeze all domains. Then, Xen disables physical
secondary CPUs, which leads to physical CPU_OFF to be called by each secondary
CPU. After that Xen finalizes the suspend from the boot CPU.

This consists of suspending the timer, i.e. suppressing its interrupts (we don't
want to be woken up by a timer, there is no VCPU ready to be scheduled). Then
the state of GIC is saved, console is suspended, and CPU context is saved. The
saved context tells where Xen needs to continue execution on resume.
Since Xen will resume with MMU disabled, the first thing to do in resume is to
resume memory management in order to be able to access the context that needs to
be restored (we know virtual address of the context data). Finally Xen calls
SYSTEM_SUSPEND PSCI to the EL3.

When resuming, all the steps done in suspend need to be reverted. This is
completed by unblocking dom0's VCPU, because we always want the dom0 to
resume,
regardless of the target domain whose interrupt woke up Xen.

*** Handling of unprivileged guests during Xen suspend/resume

Any domU that is not suspended when dom0 suspends will be frozen, domUs that are
already suspended remain suspended. On resume the suspended domUs still remain
suspended (unless their wake interrupt caused Xen to wake) while the
others will be thawed.

For more details please refer to patches or the design specification:
https://lists.xenproject.org/archives/html/xen-devel/2017-12/msg01574.html

--------------------------------------------------------------------------------
CHANGELOG

In this cover letter and in the commit messages within the changelog section:
- patch series V1 refers to https://marc.info/?l=xen-devel&m=154202231501850&w=2
- patch series V2 refers to https://marc.info/?l=xen-devel&m=166514782207736&w=2

Changes introduced in V3:
- drop all domain flags and related code (which touched common functions like
  vcpu_unblock), keeping only the necessary changes for Xen suspend/resume,
  i.e. suspend/resume is now fully supported only for the hardware domain.
  Proper support for domU suspend/resume will be added in a future patch.
  This patch does not yet include VCPU context reset or domain context
  restoration in VCPU.
- add checks before calling IOMMU suspend/resume. These functions may be
  unimplemented, so check that they exist before calling to prevent crashes
- prevent disable_nonboot_cpus crash on ARM64. If we call disable_nonboot_cpus
  on ARM64 with system_state set to SYS_STATE_suspend, the ASSERT_ALLOC_CONTEXT
  assertion will be triggered
- drop commit "timer: don't migrate timers during suspend" (see comment
  https://marc.info/?l=xen-devel&m=167036477229741&w=2). There is no freeze of
  dom0 on the latest master
- drop the commit introduced in patch series V2: "xen: don't free percpu areas
  during suspend." This commit was ported from x86 code, but in the new master,
  the percpu CPU state change notification call chain has become common, so
  there is no reason to port this code. The remaining part, which does not
  belong to the aforementioned patch, "don't initialize percpu on resume," has
  been introduced in a new separate commit
- introduce system suspend config option and covered code related to
  suspend/resume with it
- implement suspend/resume calls for SCIF driver (it was needed for test
  purpose, code has been tested on R-Car H3 Starter Kit board)
- the next commits had been appended with "xen/arm: Trigger Xen suspend when
  hardware domain completes suspend":
  -- xen/arm: Disable/enable non-boot physical CPUs on suspend/resume
  -- xen/arm: Add rcu_barrier() before enabling non-boot CPUs on resume
  -- xen/arm: Suspend/resume GIC on system suspend/resume
  -- xen/arm: Resume Dom0 after Xen resumes
  -- xen/arm: Suspend/resume console on Xen suspend/resume
- add iommu suspend/resume calls to system suspend/resume
- return PSCI_NOT_SUPPORTED instead of 1 in case when we call SYSTEM_SUSPEND
  on ARM32
- add checking of PSCI version for SYSTEM_SUSPEND call
- instead of using create_page_tables, enable_mmu, and mmu_init_secondary_cpu,
  the existing function enable_secondary_cpu_mm is now used
- prepare_secondary_mm (previously init_secondary_pagetables in the previous
  patch series) is now called at the end of start_xen instead of
  setup_pagetables. Calling it in the previous location caused a crash
- add early printk init during resume


Changes introduced in V2:
- drop commit "xen/arm: Move code that initializes VCPU context into a separate
  function" (see comment https://marc.info/?l=xen-devel&m=154202861704014&w=2)
- introduce a separate struct for watchdog timers (see comment
  https://marc.info/?l=xen-devel&m=154203624106684&w=2)
- don't initialize percpu on resume, it was a part of "xen: don't free percpu
  areas during suspend"
- drop the call to watchdog_domain_resume from ctxt_switch_to; drop suspended
  field from timer structure introduced for watchdog timer in prev series
- mov hyp_resume to head.S to place it near the rest of the start code
- simplify the code in hyp_resume by using existing functions such as
  check_cpu_mode, cpu_init, create_page_tables, and enable_mmu
- a lot of changes related to reseting/restoring VCPU context of suspended domU

Mirela Simonovic (9):
  xen/x86: Move freeze/thaw_domains into common files
  xen/arm: introduce a separate struct for watchdog timers
  xen/arm: add suspend and resume timer helpers
  xen/arm: Implement GIC suspend/resume functions (gicv2 only)
  xen/arm: Implement PSCI system suspend
  xen/arm: Trigger Xen suspend when hardware domain completes suspend
  xen/arm: Implement PSCI SYSTEM_SUSPEND call (physical interface)
  xen/arm: Resume memory management on Xen resume
  xen/arm: Save/restore context on suspend/resume

Mykola Kvach (6):
  xen/cpu: prevent disable_nonboot_cpus crash on ARM64
  xen/percpu: don't initialize percpu on resume
  xen/arm: Introduce system suspend config option
  xen/char: implement suspend/resume calls for SCIF driver
  xen/arm: add watchdog domain suspend/resume helpers
  CHANGELOG: Mention Xen suspend/resume to RAM feature on arm64

Mykyta Poturai (1):
  iommu: Add checks before calling iommu suspend/resume

 CHANGELOG.md                          |   2 +
 xen/arch/arm/Kconfig                  |  11 +
 xen/arch/arm/Makefile                 |   1 +
 xen/arch/arm/arm64/head.S             | 117 ++++++++++
 xen/arch/arm/gic-v2.c                 | 142 ++++++++++++
 xen/arch/arm/gic.c                    |  29 +++
 xen/arch/arm/include/asm/domain.h     |   3 +
 xen/arch/arm/include/asm/gic.h        |  12 +
 xen/arch/arm/include/asm/perfc_defn.h |   1 +
 xen/arch/arm/include/asm/psci.h       |   3 +
 xen/arch/arm/include/asm/suspend.h    |  41 ++++
 xen/arch/arm/include/asm/time.h       |   5 +
 xen/arch/arm/psci.c                   |  19 ++
 xen/arch/arm/setup.c                  |   8 +
 xen/arch/arm/suspend.c                | 320 ++++++++++++++++++++++++++
 xen/arch/arm/time.c                   |  26 +++
 xen/arch/arm/vpsci.c                  |  32 +++
 xen/arch/x86/acpi/power.c             |  29 ---
 xen/common/cpu.c                      |  43 ++++
 xen/common/domain.c                   |  30 +++
 xen/common/keyhandler.c               |   2 +-
 xen/common/percpu.c                   |   3 +-
 xen/common/sched/core.c               |  50 +++-
 xen/drivers/char/scif-uart.c          |  31 ++-
 xen/drivers/passthrough/iommu.c       |   4 +-
 xen/include/xen/sched.h               |  15 +-
 xen/include/xen/watchdog.h            |   6 +
 27 files changed, 945 insertions(+), 40 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/suspend.h
 create mode 100644 xen/arch/arm/suspend.c

-- 
2.43.0


