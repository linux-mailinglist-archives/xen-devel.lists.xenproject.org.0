Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A31B216C6
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 22:49:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077943.1438948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulZRq-0005f9-Up; Mon, 11 Aug 2025 20:48:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077943.1438948; Mon, 11 Aug 2025 20:48:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulZRq-0005cz-SB; Mon, 11 Aug 2025 20:48:50 +0000
Received: by outflank-mailman (input) for mailman id 1077943;
 Mon, 11 Aug 2025 20:48:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=21ui=2X=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1ulZRp-0005co-DK
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 20:48:49 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94474483-76f4-11f0-a327-13f23c93f187;
 Mon, 11 Aug 2025 22:48:48 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-af93c3bac8fso681521966b.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 13:48:48 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.Dlink ([77.52.179.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a3bd2sm2065710466b.54.2025.08.11.13.48.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 13:48:45 -0700 (PDT)
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
X-Inumbo-ID: 94474483-76f4-11f0-a327-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754945327; x=1755550127; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/zKmv3HZfbb0UnE05p/JthhUdKNDnTKWEZfs7hIFgJo=;
        b=UWJU5gVekW7qkS0CqziR9lNZbSwEGMv7mZsGzdkBOtiZJes+SJGVWlrfmQtnqBXKCc
         t+1R7gEmHJhJC7X3aFvGwJQFGSw1CMq3Inrk5AKX4ou9r7al6UVFh9cvt+Vd12UHVovU
         l3BC2H9tVmM2k3WX+qdc7sqMNL9CA0EF0NeSyF3LCKtzjFWTFKp0vIFzuB9Izldy9tA0
         rHm3ew02FZb6jqPAV5H1VCDA7OY+X9JDBzOsiMdRPkXQq2QRsE7uXaF4tweXFoVSx7je
         LvxTEIWjONd8TiY1j4uW9NeGfp+PWkfInaTcBZDEHC0SVMBSQH53l7HVAC97Uy/GS4ko
         Ferg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754945327; x=1755550127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/zKmv3HZfbb0UnE05p/JthhUdKNDnTKWEZfs7hIFgJo=;
        b=Dl/6Z6xBJQZmugfKXEXLUMnAO0fK3WWrbMckeMsVOlcxMKDi9HlQdbybDuPOzsE4jt
         JK0St6oh57ZHT+sq1aPIA4wWT76SQdSoivUIOTOetGeH9do7OQbxXjIXOLOUhuqQsLdX
         1jyKZDspvAUFT8QpI3oQ3Yk/cR0fTtVCwb7L0i6C8s7rNt6jkY5pjBhvLeQLjFeIVsE4
         HScJiUqChfxsgLgcZ3jIvzK/DewrcMCI07rjs1CEM5URTLMoIBnlQgDK9wUpzNNeCODr
         eyxOvdzT/vZ0/49vGsi9of1NQobum0FYhlem+U5DLHncHFROhY1G7MApJ9OPrI8kQ4yR
         e4DA==
X-Gm-Message-State: AOJu0YxDZ6lGWVuUKT1yPmovWBJx0xXLeWW5Gc28nzxkVjPtQSxli2b+
	fHGQJaREbxgXwMnwSQqbasus5SpAzsCaBGJbt93pvkWyOaO7ycDlVx6wOInzpA==
X-Gm-Gg: ASbGncsbWwCm6ropOmJTuxzg4e++mXwdPvXV1yLqPLFil1HMh7q5ZTlvjuAzRMEihPM
	VlCS2OxAdhbqUrdaUwj9CXAd/3zRNVn/JG2eMHapffXsQHu4ohE9MW5ITZhs7BMgr9tp4zH+YVp
	p9GAoObxhAlb+Ulm2C97O8LGR594Ieq2bTb3DQCnbH0U2rPS7ZXBxdPHDSS5CBV/d5Og62Yhr6o
	1L60T4VVmdMCZ0EymXUs9m6VU1Q9d5xW/nDCWnCngyYgC/+Dn8WRfW4SAiLODRQJvM4Q4T0SxB3
	SdeOkyOGhpxUCtdqs2Jdm3Bget0HkXQHJflMiijjGOnTL29BX2KDcXMFUtetLaLxoB6u5euby1i
	8I9IiFBfxqKL+iWgazmVc09mniU1VBCDf2JOF0qD946mNiSt07AuKz75iUtQFRS4HnNXty793H8
	C+rA==
X-Google-Smtp-Source: AGHT+IEJW8MGwUFBhpxdJITfiUDESQH6D/AB2pOrpUohXurxydBSsrKc775CXm4diSKn+ljG8uoRNg==
X-Received: by 2002:a17:907:3e13:b0:af9:3341:8dd with SMTP id a640c23a62f3a-af9c64f23d6mr1464638866b.31.1754945326494;
        Mon, 11 Aug 2025 13:48:46 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 00/12] Add initial Xen Suspend-to-RAM support on ARM64
Date: Mon, 11 Aug 2025 23:47:56 +0300
Message-ID: <cover.1754943874.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

This is part 2 of version 5 of the ARM Xen system suspend/resume patch
series, based on earlier work by Mirela Simonovic and Mykyta Poturai.
This version is ported to Xen master (4.21-unstable) and includes
extensive improvements based on reviewer feedback. The patch series
restructures code to improve robustness, maintainability, and implements
system Suspend-to-RAM support on ARM64 hardware domains.

At a high-level, this patch series provides:
 - Support for Host system suspend/resume via PSCI SYSTEM_SUSPEND (ARM64)
 - Suspend/resume infrastructure for CPU context, timers, GICv2/GICv3 and IPMMU-VMSA
 - Proper error propagation and recovery throughout the suspend/resume flow

Key updates in this series:
 - Introduced architecture-specific suspend/resume infrastructure (new `suspend.c`, `suspend.h`, low-level context save/restore in `head.S`)
 - Integrated GICv2/GICv3 suspend and resume, including memory-backed context save/restore with error handling
 - Added time and IRQ suspend/resume hooks, ensuring correct timer/interrupt state across suspend cycles
 - Implemented proper PSCI SYSTEM_SUSPEND invocation and version checks
 - Improved state management and recovery in error cases during suspend/resume
 - Added support for IPMMU-VMSA context save/restore

---
TODOs:
 - Test system suspend with llc_coloring_enabled set and verify functionality
 - Implement SMMUv3 suspend/resume handlers
 - Enable "xl suspend" support on ARM
 - Properly disable Xen timer watchdog from relevant services (only init.d left)
 - Add suspend/resume CI test for ARM (QEMU if feasible)
 - Investigate feasibility and need for implementing system suspend on ARM32
---
Changes introduced in V5:
 - Add support for IPMMU-VMSA context save/restore
 - Add support for GICv3 context save/restore
 - Select HAS_SYSTEM_SUSPEND in ARM_64 instead of ARM
 - Check llc_coloring_enabled instead of LLC_COLORING during the selection
   of HAS_SYSTEM_SUSPEND config
 - Call host_system_suspend from guest PSCI system suspend instead of
   arch_domain_shutdown, reducing the complexity of the new code

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

Previous versions:
  V1: https://marc.info/?l=xen-devel&m=154202231501850&w=2
  V2: https://marc.info/?l=xen-devel&m=166514782207736&w=2
  V3: https://lists.xen.org/archives/html/xen-devel/2025-03/msg00168.html

Mirela Simonovic (6):
  xen/arm: Add suspend and resume timer helpers
  xen/arm: gic-v2: Implement GIC suspend/resume functions
  xen/arm: Add support for system suspend triggered by hardware domain
  xen/arm: Implement PSCI SYSTEM_SUSPEND call (host interface)
  xen/arm: Resume memory management on Xen resume
  xen/arm: Save/restore context on suspend/resume

Mykola Kvach (4):
  xen/arm: gic-v3: Implement GICv3 suspend/resume functions
  xen/arm: Prevent crash during disable_nonboot_cpus on suspend
  xen/arm: irq: avoid local IRQ descriptors reinit on system resume
  xen/arm: irq: Restore state of local IRQs during system resume

Oleksandr Tyshchenko (2):
  iommu/ipmmu-vmsa: Implement suspend/resume callbacks
  xen/arm: Suspend/resume IOMMU on Xen suspend/resume

 xen/arch/arm/Kconfig                     |   1 +
 xen/arch/arm/Makefile                    |   1 +
 xen/arch/arm/arm64/head.S                | 113 ++++++++++
 xen/arch/arm/gic-v2.c                    | 154 +++++++++++++
 xen/arch/arm/gic-v3.c                    | 233 ++++++++++++++++++++
 xen/arch/arm/gic.c                       |  35 +++
 xen/arch/arm/include/asm/gic.h           |  12 +
 xen/arch/arm/include/asm/mm.h            |   2 +
 xen/arch/arm/include/asm/psci.h          |   1 +
 xen/arch/arm/include/asm/suspend.h       |  44 ++++
 xen/arch/arm/include/asm/time.h          |   5 +
 xen/arch/arm/irq.c                       |  48 ++++
 xen/arch/arm/mmu/smpboot.c               |   2 +-
 xen/arch/arm/psci.c                      |  23 +-
 xen/arch/arm/suspend.c                   | 196 +++++++++++++++++
 xen/arch/arm/tee/ffa_notif.c             |   2 +-
 xen/arch/arm/time.c                      |  56 ++++-
 xen/arch/arm/vpsci.c                     |  12 +-
 xen/common/domain.c                      |   4 +
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 269 +++++++++++++++++++++++
 20 files changed, 1197 insertions(+), 16 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/suspend.h
 create mode 100644 xen/arch/arm/suspend.c

-- 
2.48.1


