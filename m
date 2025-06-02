Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D2AACAB23
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 11:05:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1002940.1382350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM16E-0007o0-6Z; Mon, 02 Jun 2025 09:04:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1002940.1382350; Mon, 02 Jun 2025 09:04:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM16E-0007kt-3m; Mon, 02 Jun 2025 09:04:54 +0000
Received: by outflank-mailman (input) for mailman id 1002940;
 Mon, 02 Jun 2025 09:04:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qKV=YR=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uM16C-0007kh-M3
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 09:04:52 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3ee79bc-3f90-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 11:04:50 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-55324062ea8so5504480e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 02:04:50 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5533791cdc3sm1507541e87.176.2025.06.02.02.04.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 02:04:48 -0700 (PDT)
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
X-Inumbo-ID: a3ee79bc-3f90-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748855090; x=1749459890; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uXSQSjQZGKU0T7Hq11MWc0zTSBaXNkHaMHY+7QO6x6g=;
        b=QtpUJEtN4emVwGrcotqX/eDpzHNKuCdww/VErUOkzen2o0qXAbapOfXpYMBkjJg/nI
         FTrYMNQ5WnlCIJ7quSdesY19ddFzDdFifompD5qhjmL6pvTkL2rKoCtCB5L8swIW49Hz
         xXrWRzSRcku6mS/N1Lmd29y4y2Mj7pgYTOd+tKHQJpnPe8f4U2NRG5SwMgsCygprP+cP
         4pd2m8hR6NdjGLBnY11emv+T9rC0wki0fceLbEeNWH17FobJcXmGOJ9PrJ4/g49eS9v4
         qE05RUfj63nJL3kfotPjW2xYOCOVHtB27j0fRbATFiDFthX8YqlY4gP/3zKlUZ5RKR8n
         7jYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748855090; x=1749459890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uXSQSjQZGKU0T7Hq11MWc0zTSBaXNkHaMHY+7QO6x6g=;
        b=Db8UaagHk59Dtu56eQoB/7QCzJ5lyp1Fq2AC0gYjvUwHmdEp8qGGXkwSqJvpcA3uBi
         D69Z3fSTqYZsOgwqUbC92XUHX3Mq+CIuNMjga1UeLBedrOr3+ly89Y86mdEe6lq+I/XW
         RTwmmcY4jEkPBKpzoh6CXWyxgBiUoVLUJjXKSmyHFGvdoYY/qV3eX51VPtCHV+OhM95Z
         PxbrvneVl0kp9fC1dLjKXGp6OJIHk7gLj68iOOcnlhb+GXfHKbUFjMR9X6hGe4eYV9mE
         F9xCNUbFCZFe6iXKw1K3WAc2sx9RrjYosMhVb19vdQb0HD2nwzzzGBC1qWhF27Ad9GLn
         TJFw==
X-Gm-Message-State: AOJu0YwgiychfKJPh+uipYntNXZHyzTipBAfaEk0ZjcgujfXdd+Wdavk
	63CCItkY7M4YMHWFdwkcOQON0geZgrptuLZGiA6kJbNkEEUs4KAGEc/VwCw9OuaYcAg=
X-Gm-Gg: ASbGnctD9iAJ8D2pyONdodPZqlZWlp7jTYgKPB8ZVnVDyMbJeO7gxIHW+BoUpyMGyWc
	NZ0FMm2DA/I1Z9aLfpcnT6ikxxOfp7AQYfDgwx2cWTISe6A6+HpVh86WsPrhU3ikCU4zju/526Q
	e+VGxPr/CKIXJLBdLSHH41WX6vaBCu1aOkA8B8OXB/hR3/P722AyAJx1ajmaFHhsNOloLYURVWW
	k6E8XK5uF4+WDMePojAQxUmghvbg6viO/iB5uaQiXtubsYM0N009B67uxYZAKI8iY10be7sYZhd
	lrdJwHxPghg6QJW5c9utqSab7k59trf3GoDld70iyIek7bXsSLEzGo7M48trMJIUggjAew8Nidr
	2J0tPXFndK7/TBROxWUivmieTCw==
X-Google-Smtp-Source: AGHT+IFZ3gOyH/son6jCZ1hSmo99fS4cVJYmopNYROqvOmRtmwz8SBOI0kHmuXoyv34FjsA6xOK0bg==
X-Received: by 2002:a05:6512:104f:b0:553:2450:5895 with SMTP id 2adb3069b0e04-55342f5212emr2046464e87.4.1748855089525;
        Mon, 02 Jun 2025 02:04:49 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: xakep.amatop@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v4][PART 2 00/10] Add initial Xen Suspend-to-RAM support on ARM64
Date: Mon,  2 Jun 2025 12:04:11 +0300
Message-ID: <cover.1748848482.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

This is part 2 of version 4 of the ARM Xen system suspend/resume patch
series, based on earlier work by Mirela Simonovic and Mykyta Poturai.
This version is ported to Xen master (4.21-unstable) and includes
extensive improvements based on reviewer feedback. The patch series
restructures code to improve robustness, maintainability, and implements
system Suspend-to-RAM support on ARM64 hardware domains.

Part 1 of the v4 patch series is available here:
  https://patchew.org/Xen/cover.1748337249.git.mykola._5Fkvach@epam.com/

This part also depends on the patch that introduces CONFIG_SYSTEM_SUSPEND:
  https://patchew.org/Xen/cover.1748381788.git.mykola._5Fkvach@epam.com/eb586049ef5180bb33e9414c4754ee2621a772bc.1748381788.git.mykola._5Fkvach@epam.com/

Previous versions:
  V1: https://marc.info/?l=xen-devel&m=154202231501850&w=2
  V2: https://marc.info/?l=xen-devel&m=166514782207736&w=2
  V3: https://lists.xen.org/archives/html/xen-devel/2025-03/msg00168.html


At a high-level, this patch series provides:
 - Support for Host system suspend/resume via PSCI SYSTEM_SUSPEND (ARM64)
 - Suspend/resume infrastructure for CPU context, timers, and GICv2
 - Proper error propagation and recovery throughout the suspend/resume flow

Key updates in this series:
 - Introduced architecture-specific suspend/resume infrastructure (new `suspend.c`, `suspend.h`, low-level context save/restore in `head.S`)
 - Integrated GICv2 suspend and resume, including memory-backed context save/restore with error handling
 - Added time and IRQ suspend/resume hooks, ensuring correct timer/interrupt state across suspend cycles
 - Refactored domain shutdown flow to consistently propagate errors from arch-specific suspend handlers
 - Implemented proper PSCI SYSTEM_SUSPEND invocation and version checks
 - Improved state management and recovery in error cases during suspend/resume

---
TODOs:
 - Test system suspend with LLC_COLORING enabled and verify functionality
 - Implement IOMMU suspend/resume handlers and integrate them into the
   suspend/resume path
 - Add GICv3 suspend/resume support if required
 - Enable "xl suspend" support on ARM
 - Properly disable Xen timer watchdog from relevant services
 - Add suspend/resume CI test for ARM (QEMU if feasible)
 - Investigate feasibility and need for implementing system suspend on ARM32
---
Changes introduced in V4:
  - Remove the prior tasklet-based workaround in favor of a more
    straightforward and safer solution.
  - Rework the approach by adding explicit system state checks around
    request_irq and release_irq calls; skip these calls during suspend
    and resume states to avoid unsafe memory operations when IRQs are
    disabled.
  - Prevent reinitialization of local IRQ descriptors on system resume.
  - Restore the state of local IRQs during system resume for secondary CPUs.
  - Drop code for saving and restoring VCPU context (see part 1 of the patch
    series for details).
  - Remove IOMMU suspend and resume calls until these features are implemented.
  - Move system suspend logic to arch_domain_shutdown, invoked from
    domain_shutdown.
  - Add console_end_sync to the resume path after system suspend.
  - Drop unnecessary DAIF masking; interrupts are already masked on resume.
  - Remove leftover TLB flush instructions; flushing is handled in enable_mmu.
  - Avoid setting x19 in hyp_resume as it is not required.
  - Replace prepare_secondary_mm with set_init_ttbr, and call it from system_suspend.
  - Produce a build-time error for ARM32 when CONFIG_SYSTEM_SUSPEND is enabled.
  - Use register_t instead of uint64_t in the cpu_context structure.
  - Apply minor fixes such as renaming functions, updating comments, and
    modifying commit messages to accurately reflect the changes introduced
    by this patch series.

For earlier changelogs, please refer to the previous cover letters.

Mirela Simonovic (7):
  xen/x86: Move freeze/thaw_domains to common code
  xen/arm: Add suspend and resume timer helpers
  xen/arm: Implement GIC suspend/resume functions (gicv2 only)
  xen/arm: Add support for system suspend triggered by hardware domain
  xen/arm: Implement PSCI SYSTEM_SUSPEND call (host interface)
  xen/arm: Resume memory management on Xen resume
  xen/arm: Save/restore context on suspend/resume

Mykola Kvach (3):
  xen/arm: Prevent crash during disable_nonboot_cpus on suspend
  xen/arm: irq: avoid local IRQ descriptors reinit on system resume
  xen/arm: irq: Restore state of local IRQs during system resume

 xen/arch/arm/Kconfig               |   1 +
 xen/arch/arm/Makefile              |   1 +
 xen/arch/arm/arm64/head.S          | 110 +++++++++++++++++++
 xen/arch/arm/domain.c              |  21 +++-
 xen/arch/arm/gic-v2.c              | 154 ++++++++++++++++++++++++++
 xen/arch/arm/gic.c                 |  35 ++++++
 xen/arch/arm/include/asm/gic.h     |  12 +++
 xen/arch/arm/include/asm/mm.h      |   2 +
 xen/arch/arm/include/asm/psci.h    |   1 +
 xen/arch/arm/include/asm/suspend.h |  44 ++++++++
 xen/arch/arm/include/asm/time.h    |   5 +
 xen/arch/arm/irq.c                 |  48 +++++++++
 xen/arch/arm/mmu/smpboot.c         |   2 +-
 xen/arch/arm/psci.c                |  23 +++-
 xen/arch/arm/suspend.c             | 167 +++++++++++++++++++++++++++++
 xen/arch/arm/tee/ffa_notif.c       |   2 +-
 xen/arch/arm/time.c                |  56 +++++++---
 xen/arch/arm/vpsci.c               |   4 -
 xen/arch/ppc/stubs.c               |   2 +-
 xen/arch/riscv/stubs.c             |   2 +-
 xen/arch/x86/acpi/power.c          |  25 -----
 xen/arch/x86/domain.c              |   4 +-
 xen/common/domain.c                |  34 +++++-
 xen/include/xen/domain.h           |   2 +-
 xen/include/xen/sched.h            |   3 +
 25 files changed, 709 insertions(+), 51 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/suspend.h
 create mode 100644 xen/arch/arm/suspend.c

-- 
2.48.1


