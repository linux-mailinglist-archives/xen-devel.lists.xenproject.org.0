Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA0CCB6F06
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 19:46:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184546.1506962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTlfk-0003Q9-Af; Thu, 11 Dec 2025 18:45:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184546.1506962; Thu, 11 Dec 2025 18:45:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTlfk-0003LY-75; Thu, 11 Dec 2025 18:45:52 +0000
Received: by outflank-mailman (input) for mailman id 1184546;
 Thu, 11 Dec 2025 18:45:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QWGN=6R=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vTlfi-0003I9-Hb
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 18:45:50 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9bcab944-d6c1-11f0-9cce-f158ae23cfc8;
 Thu, 11 Dec 2025 19:45:48 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b76b5afdf04so81056866b.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 10:45:48 -0800 (PST)
Received: from EPUAKYIW02F7.. (pool185-5-253-4.as6723.net. [185.5.253.4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7cfa5d0b0dsm345870466b.67.2025.12.11.10.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 10:45:46 -0800 (PST)
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
X-Inumbo-ID: 9bcab944-d6c1-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765478747; x=1766083547; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aDNyNuv61rTQkRcvMIs1ekn0SWXLuqr0Rx/eBFoPIHY=;
        b=fP4WAbMXo5yR4S3go4lsuZhtx2TS0SFOW/N8XF4pnZLovGy6bopu2wD5VXsIhJ98i/
         vdHU9IA4nmhHNs+eZPw0Tfy59kHT+bL9ncnl0FRU6FpvBmpBMevONv116GErXvg0T+VM
         c0QdOA968Qk6YQ5bvPuqMSxPH2W1NV2KCrw+XjXCIdyBl8fV5IR/9vsz6CGPzk25HHW/
         uX8P6WTLa6saaGb7Egt7qaKY30fSo3ohJOoQRk6fxnAZbSzc8sIVOi9J3IE3wDAYEMTL
         m8K2p82aTIkTVVJX0Ld5v5L3RstJECAZ9qMfhe6IYlyHYGZDRKpkPcW87uFOLvAt8UXv
         CZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765478747; x=1766083547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aDNyNuv61rTQkRcvMIs1ekn0SWXLuqr0Rx/eBFoPIHY=;
        b=J9fAWJk7Ai/RtZGSqDzcA9NHDTGRzznJBvGaX5N6nhlONnxE/e/Jtc/G5uWsmje1+t
         UrFm+FPDWikq8IPLacbIZJv6xHMCECIMgERMfO4fIMfx8LVAU5EzvktI0B9vbZ3xYg4k
         ksbR79xVfBLEqC+AAYZ/JICNj9KgQogD6rGzBy+Q0R+i3Zs0FyE91Td9+XSqKJQn2DE0
         lVMouXf753CeCAzdltQ1Y/8j6JYz9f3wU+qMNcWdQ692NB7A69l9/EQPW5hTo/GUvooQ
         jiEqjzW2ho4DGYvEIuE59vg526ObP2rf1sci6nf3vJWzHEcrhjv4B/H3poyIGKjiCxmX
         dz3A==
X-Gm-Message-State: AOJu0YyZ97peVn4Q9ZF0TShxdmwp+HvQTsX+snwl43Rzv+T8VuOjQ2qb
	f269Xj46J+N8kNHG7NXGwN25XpTMszQwLOIOytE7af/3BlsZINRwRCze9qNOU28v
X-Gm-Gg: AY/fxX4hfC+KYNI4IR+pVzrYdfvE6JAnsfdC7u78jRVbJ+w9nlwa4uIay7Whokz07Fr
	/0wh2aekHKg7FrhWsh1BsGvERMDPXaKZQJuexrdJ9hJJBZkk5hJ8jWjXAPZEfaa21BzeD+xeyG9
	AJsH4mX4QScnVV4R+GDmPvdCDn20QX9NdXYhlVDvHXliRtK/DJSQpRmMjE4CyvVQSjqjFkGLxlQ
	8BjIjpDu/AL0GFX7GrAhxQcNQ03Qw/vKOZI03ENH/J2KS/CBmpKAbUx1KQQHRpfRQu6yCdtuKqQ
	UI4c5aU/r/KjBCNZpIkt+eX7dM82iEo7ZGQpGv4k22X1WFe/2N/FfyJ1v38V5KImyFB4hKL6qLg
	ysdv0slci+Gb4dIRxohpfZZVIhG7lroMXEiQVUtgwHcOLL1dXRj1raB1xuoP2dZXgLyzsDGvbN/
	L+QbkTrf7w5nZtMSJ8hPx9oFydohhKxZCQ4mCLs29/
X-Google-Smtp-Source: AGHT+IFm4NeTfQ9xmDk7GfTvvFZ9mCEEJhtzChUQNcs8E9MYwMmZt5mL0u7P9Pmlmjh5XlxyPuE1Gw==
X-Received: by 2002:a17:907:3cca:b0:b73:853d:540e with SMTP id a640c23a62f3a-b7ce841d73emr743131966b.30.1765478746840;
        Thu, 11 Dec 2025 10:45:46 -0800 (PST)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
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
Subject: [PATCH v7 00/12] Add initial Xen Suspend-to-RAM support on ARM64 
Date: Thu, 11 Dec 2025 20:43:24 +0200
Message-ID: <cover.1765472890.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

This is part 2 of version 7 of the ARM Xen system suspend/resume patch
series, based on earlier work by Mirela Simonovic and Mykyta Poturai.

The first part is here:
https://patchew.org/Xen/cover.1764755558.git.xakep.amatop@gmail.com/

NOTE: Most of the code is guarded by CONFIG_SYSTEM_SUSPEND, which can
currently only be selected when UNSUPPORTED is set, and thus the
functionality is neither enabled by default nor even built.

This version is ported to Xen master and includes extensive improvements
based on reviewer feedback. The patch series restructures code to improve
robustness, maintainability, and implements system Suspend-to-RAM support
on ARM64 hardware/control domains.

Key updates in this series:
 - Introduced architecture-specific suspend/resume infrastructure
 - Integrated GICv2/GICv3 suspend and resume, including memory-backed context
   save/restore with error handling
 - Added time and IRQ suspend/resume hooks, ensuring correct timer/interrupt
   state across suspend cycles
 - Implemented proper PSCI SYSTEM_SUSPEND invocation and version checks
 - Improved state management and recovery in error cases during suspend/resume
 - Added support for IPMMU-VMSA/SMMUv3 context save/restore
 - Added support for GICv3 eSPI registers context save/restore
 - Added support for ITS registers context save/restore
---

TODOs:
 - Enable "xl suspend" support on ARM
 - Properly disable Xen timer watchdog from relevant services (only init.d left)
 - Add suspend/resume CI test for ARM (QEMU if feasible)
---

Detailed changelogs can be found in each patch.

Changes in v7:
- Timer helper renamed/clarified; virtual/hyper/phys handling documented.
- GICv2 uses one context block; restore saved CTLR; panic on alloc failure.
- GICv3/eSPI/ITS always suspend/resume; restore LPI/eSPI; rdist timeout.
- IPMMU suspend context allocated before PCI setup.
- System suspend: control domain drives host suspend.
- Dropped v6 IRQ descriptor restore patches; use setup_irq and re-register
  local IRQs on resume instead.

For earlier changelogs, please refer to the previous cover letters.

Mirela Simonovic (6):
  xen/arm: Add suspend and resume timer helpers
  xen/arm: gic-v2: Implement GIC suspend/resume functions
  xen/arm: Resume memory management on Xen resume
  xen/arm: Save/restore context on suspend/resume
  xen/arm: Implement PSCI SYSTEM_SUSPEND call (host interface)
  xen/arm: Add support for system suspend triggered by control domain

Mykola Kvach (5):
  xen/arm: gic-v3: Implement GICv3 suspend/resume functions
  xen/arm: gic-v3: add ITS suspend/resume support
  xen/arm: tee: keep init_tee_secondary() for hotplug and resume
  xen/arm: ffa: fix notification SRI across CPU hotplug/suspend
  arm/smmu-v3: add suspend/resume handlers

Oleksandr Tyshchenko (1):
  iommu/ipmmu-vmsa: Implement suspend/resume callbacks

 xen/arch/arm/Kconfig                     |   1 +
 xen/arch/arm/Makefile                    |   1 +
 xen/arch/arm/arm64/head.S                | 112 ++++++++
 xen/arch/arm/gic-v2.c                    | 126 +++++++++
 xen/arch/arm/gic-v3-its.c                |  91 +++++++
 xen/arch/arm/gic-v3-lpi.c                |   3 +
 xen/arch/arm/gic-v3.c                    | 332 ++++++++++++++++++++++-
 xen/arch/arm/gic.c                       |  29 ++
 xen/arch/arm/include/asm/gic.h           |  12 +
 xen/arch/arm/include/asm/gic_v3_defs.h   |   1 +
 xen/arch/arm/include/asm/gic_v3_its.h    |  23 ++
 xen/arch/arm/include/asm/mm.h            |   2 +
 xen/arch/arm/include/asm/psci.h          |   1 +
 xen/arch/arm/include/asm/suspend.h       |  31 +++
 xen/arch/arm/include/asm/time.h          |   5 +
 xen/arch/arm/mmu/smpboot.c               |   2 +-
 xen/arch/arm/psci.c                      |  23 +-
 xen/arch/arm/suspend.c                   | 153 +++++++++++
 xen/arch/arm/tee/ffa_notif.c             |  63 ++++-
 xen/arch/arm/tee/tee.c                   |   2 +-
 xen/arch/arm/time.c                      |  44 ++-
 xen/arch/arm/vpsci.c                     |  12 +-
 xen/common/Kconfig                       |   5 +
 xen/common/domain.c                      |   7 +-
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 305 ++++++++++++++++++++-
 xen/drivers/passthrough/arm/smmu-v3.c    | 170 +++++++++---
 xen/drivers/passthrough/arm/smmu.c       |  10 +
 xen/include/xen/list.h                   |  14 +
 28 files changed, 1507 insertions(+), 73 deletions(-)
 create mode 100644 xen/arch/arm/suspend.c

-- 
2.43.0

