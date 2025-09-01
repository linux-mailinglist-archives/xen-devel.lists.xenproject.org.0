Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EA5B3F0DC
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 00:10:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105397.1456321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utCjK-00058r-1Q; Mon, 01 Sep 2025 22:10:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105397.1456321; Mon, 01 Sep 2025 22:10:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utCjJ-000561-Up; Mon, 01 Sep 2025 22:10:25 +0000
Received: by outflank-mailman (input) for mailman id 1105397;
 Mon, 01 Sep 2025 22:10:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pPXY=3M=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1utCjI-00055o-GB
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 22:10:24 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 742fcd6f-8780-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 00:10:22 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-55f7b6e4145so1330644e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 15:10:22 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608279307asm123038e87.75.2025.09.01.15.10.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 15:10:20 -0700 (PDT)
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
X-Inumbo-ID: 742fcd6f-8780-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756764621; x=1757369421; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P0ROChEhFSQ6tMRvQy04P3RZc8I7Rkyakj4KgtEzBVg=;
        b=MsJSEfATCfIV22pSWyvdlBsHLHEp+jX/ShN5/X1pIMN6qqa2geMWEui18x4iePX6eZ
         QKmO7/LQGajkVx2KF9P1qkfimwUOC6AVuaDvbeQm7gAgi7MoO5FqVh/Lpj5698w/P9EZ
         RRlLj3I37HdW5ctb4cBsSRm1sW9WY/jMU7oO1D1D2eIWo5m150Oe0t5Qs3qOfx0ZnK8V
         CFmtgkWH99bjCgXRadz7yHQn8RPth9iyw7EMycj+C93zL+z3qG0yXVRB00IpLr7rKx7r
         8rNkRKe8pvK4E1z+OUOXlC2bwKFBrwWrdC/FE/VfWcMYNLseUALmGRSfLoI+8k0Oqc1v
         H0Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756764621; x=1757369421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P0ROChEhFSQ6tMRvQy04P3RZc8I7Rkyakj4KgtEzBVg=;
        b=XQ+tceXC+iZqL7FHEuUb68/LWAsN35L90z8q4jva8taNcJL/x+eX12EBoINKrCvvll
         sdgkm50g6ZZ7ezBnCAkyDe9tV6k4i4ttJ7FCL/5VIiOKnuHhR+glqdptS8e1EHT1+yAW
         wNWI1shKClT1A/QuOiYZKhr7fpAZ4hCIixKFRwtS+C8wTrp9Knoos75nSt7Dk3FK5mq9
         t4SbrDbimfvNdRAwLJkpXwNoZPNJ8UpERWSGPghUqC3/kpA/ngJchVAgxfyQa5RCgMIq
         xg5noAoZ+mrPUA0wrtkjN89AUAfxh6keZ+qJnuFQcQKPsl7l78XGJFzo6ItJqK+WdRzv
         0ALw==
X-Gm-Message-State: AOJu0YyKCKoAjAqBNW7aO9IBp+Qm/Z8xVpcw7yMXBh/nqrERpNRy6Tth
	FGw8wv1KzRqPqIoXULJWlZU1PyvtW3Yc+F2cp1rSOdAmAqd2E0ojMg7Z4ivkHqB/
X-Gm-Gg: ASbGnctB/LTmwkdWNnl/4p6PMBJA5Z9G0ffL29SDjad331h0kmSIKs5HCbBjzMNoJDi
	OmryY48wn/O5VsU+KuAK7iybZ2F9dx4i9lPBheYtCjnAE7h4k9BnFKY2/zQmq8ofITc2tV46oe1
	npgeIHTlFSKEG6ID9RbTqQJxxfPCW2JVDNyFjDKzdI90gYnv9loe29djxvbbwa+pPJpcM1VfVgY
	e6CNY+lW9N8OcezOY+Fag/4ws6U5/qyq/ikoXWHJ70vZbaSmQ5pv6T+xQtZUhI1zrHNGOBoD6k4
	w6yBpKGonsIfTL+V4tO3kiOv2lonopa7oJpRcp1cOVTscRR9okExeftODLZPThXYH+Rv1+FTUwy
	3yITw3VOK2Eg4sXVcf7VSkRVfbWlrKDRR8tBROflRST0fKKVO6qijzw/7tk2SZQ==
X-Google-Smtp-Source: AGHT+IGbjvMD0r9yNJ8/BpcCQjITDXNh1n6xrczamQXqodO0WmvR2poWjszQoodP64wEuUIk/MlbSw==
X-Received: by 2002:a05:6512:4608:b0:55f:67d5:938e with SMTP id 2adb3069b0e04-55f7094f818mr2235255e87.39.1756764621091;
        Mon, 01 Sep 2025 15:10:21 -0700 (PDT)
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Rahul Singh <rahul.singh@arm.com>
Subject: [PATCH v6 00/13] Add initial Xen Suspend-to-RAM support on ARM64
Date: Tue,  2 Sep 2025 01:10:04 +0300
Message-ID: <cover.1756763487.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

This is part 2 of version 5 of the ARM Xen system suspend/resume patch
series, based on earlier work by Mirela Simonovic and Mykyta Poturai.

The first part is here:
https://marc.info/?l=xen-devel&m=175659181415965&w=2

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
 - Added support for GICv3 eSPI registers context save/restore

---
TODOs:
 - Test system suspend with llc_coloring_enabled set and verify functionality
 - Implement SMMUv3 suspend/resume handlers
 - Enable "xl suspend" support on ARM
 - Properly disable Xen timer watchdog from relevant services (only init.d left)
 - Add suspend/resume CI test for ARM (QEMU if feasible)
 - Investigate feasibility and need for implementing system suspend on ARM32
---

Changelog for v6:
 - Add suspend/resume support for GICv3 eSPI registers (to be applied after the
   main eSPI series).
 - Drop redundant iommu_enabled check from host system suspend.
 - Switch from continue_hypercall_on_cpu to a dedicated tasklet for system
   suspend, avoiding user register modification and decoupling guest/system
   suspend status.
 - Refactor IOMMU register context code.
 - Improve IRQ handling: call handler->disable(), move system state checks, and
   skip IRQ release during suspend inside release_irq().
 - Remove redundant GICv3 save/restore state logic now handled during vCPU
   context switch.
 - Clarify and unify error/warning messages, comments, and documentation.
 - Correct loops for saving/restoring priorities and merge loops where possible.
 - Add explicit error for unimplemented ITS suspend support.
 - Add missing GICD_CTLR_DS bit definition and clarify GICR_WAKER comments.
 - Cleanup active and enable registers before restoring.
 - Minor comment improvements and code cleanups.

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
  xen/arm: Implement PSCI SYSTEM_SUSPEND call (host interface)
  xen/arm: Resume memory management on Xen resume
  xen/arm: Save/restore context on suspend/resume
  xen/arm: Add support for system suspend triggered by hardware domain

Mykola Kvach (5):
  xen/arm: gic-v3: Implement GICv3 suspend/resume functions
  xen/arm: Don't release IRQs on suspend
  xen/arm: irq: avoid local IRQ descriptors reinit on system resume
  xen/arm: irq: Restore state of local IRQs during system resume
  xen/arm: gic-v3: Add suspend/resume support for eSPI registers

Oleksandr Tyshchenko (2):
  iommu/ipmmu-vmsa: Implement suspend/resume callbacks
  xen/arm: Suspend/resume IOMMU on Xen suspend/resume

 xen/arch/arm/Kconfig                     |   1 +
 xen/arch/arm/Makefile                    |   1 +
 xen/arch/arm/arm64/head.S                | 112 +++++++++
 xen/arch/arm/gic-v2.c                    | 143 +++++++++++
 xen/arch/arm/gic-v3-lpi.c                |   3 +
 xen/arch/arm/gic-v3.c                    | 288 +++++++++++++++++++++++
 xen/arch/arm/gic.c                       |  32 +++
 xen/arch/arm/include/asm/gic.h           |  12 +
 xen/arch/arm/include/asm/gic_v3_defs.h   |   1 +
 xen/arch/arm/include/asm/mm.h            |   2 +
 xen/arch/arm/include/asm/psci.h          |   1 +
 xen/arch/arm/include/asm/suspend.h       |  46 ++++
 xen/arch/arm/include/asm/time.h          |   5 +
 xen/arch/arm/irq.c                       |  46 ++++
 xen/arch/arm/mmu/smpboot.c               |   2 +-
 xen/arch/arm/psci.c                      |  23 +-
 xen/arch/arm/suspend.c                   | 175 ++++++++++++++
 xen/arch/arm/tee/ffa_notif.c             |   2 +-
 xen/arch/arm/time.c                      |  49 +++-
 xen/arch/arm/vpsci.c                     |   9 +-
 xen/common/domain.c                      |   4 +
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 257 ++++++++++++++++++++
 xen/drivers/passthrough/arm/smmu-v3.c    |  10 +
 xen/drivers/passthrough/arm/smmu.c       |  10 +
 24 files changed, 1220 insertions(+), 14 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/suspend.h
 create mode 100644 xen/arch/arm/suspend.c

-- 
2.48.1


