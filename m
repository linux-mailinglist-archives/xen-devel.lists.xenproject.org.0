Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLTMC/deA2qE5QEAu9opvQ:T2
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 19:10:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E44505257BC
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 19:10:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307273.1578984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMqc5-0005eu-4Z; Tue, 12 May 2026 17:09:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307273.1578984; Tue, 12 May 2026 17:09:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMqc4-0005cF-Tc; Tue, 12 May 2026 17:09:44 +0000
Received: by outflank-mailman (input) for mailman id 1307273;
 Tue, 12 May 2026 17:09:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wMqc2-0005Ur-KU
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 17:09:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMqc2-007Rte-1E
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 19:09:42 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a035ecd-2eae-0a2a0a5409dd-0a2a450cc83c-20
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 19:09:41 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a035ed5-62f1-0a2a450c0019-d155802ca4e3-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 19:09:41 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4891f625344so54025605e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 10:09:41 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.26.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fc8cccf90sm10838845e9.0.2026.05.12.10.09.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 10:09:40 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778605781; x=1779210581; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lkAVF3rUIUDvK/pY3FL3dGuLtmv4jNNUzUEEqbDZZd4=;
        b=XsQrhaJNR2quaPSnsm6vTg24R52rvxYUrlsalkC+cR1iqRKezwRtKAw1KYNbOBnwc3
         AL4UQMRD+jUzXWRcT6BcSflpgN4/KVTrT+ZhYrI+Kh2SLcIB0Ei6aVURKpOPQ4kEn3n2
         xJVHGc1XZZ8Sw3ziK8BVrAtOysW4OLIdnhsfbeReh5sh41ZBfP4M2/9iumQHgWKBuzEI
         i95uCu9sKGsuqyVJOjtB9d0t6kebUG/dW+NFeu+TKm1QLFzGbBfelxef+pfMYr/7AYeD
         bh1kVXHd6+NBHzyxmYHFq4gYk/0BPYU8IFxd0kvHJXJqc/WGGXJjdRmKBoT/CNY4oLDM
         7L6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778605781; x=1779210581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lkAVF3rUIUDvK/pY3FL3dGuLtmv4jNNUzUEEqbDZZd4=;
        b=MTMsYwyO2G674oVbQEO27TiGqkC436jF+v5Jtr/C5CIuV4A2C9e/OXYwim5AQYkVXE
         mCjC+VFn3Srdywd+fxouIrmLZO+ad8pTpsjfpGnZHt+wSFXf/eB1jGF3qMDqOqpD8QaZ
         hddmrceJoBQHtQoymp7RdHjUVnYdLCpfMzevSormh7/jmaZaRB62IOOq9RdmCuec64RA
         4F/pfM0GIqv8GEE6kBU10pTqU9bvjui7JLuViHZMYoxxCBIrIbFyJde+w1SFhBLcvGWC
         HwrBvpJtN54uOd381QJXLubpsqI2wPzHpIsYRLPRoxUvGBxWpfH3LxO+FtBJNsXonr7E
         nWNw==
X-Gm-Message-State: AOJu0Yz7kK+zGwo/kGYo6bzGDQDUkA/3gXtIa7+u2zYEcro08B3V40dZ
	0yfxon7JjS7/XyvASzpq8LjCiG+EwUq+33ds5SEB1jvOJZCIT3rGOSODX9qrbQ==
X-Gm-Gg: Acq92OFgorAv8qDYo98E6KKB177zZKfv0r6KfKg/ghmI/6HYPPNBd7rFB1fad19OQDt
	aSxwbYS0Y+0OP/hp1bDttAMfWntC44GVajR13mM4rB9i8up9BNrZcnS11Z/5JLqOCDMUMUnWW6E
	gRJWKr1SAVO8YgM9bhEa2sbWDuaN9mStuBsf8dvNWeJqFp+pA23hjaOpiJNyhipvd1ys18MiTsi
	biILDazm9R85KPAKNot4p9d3SSaLHSJ0lkbOP1n2wOdkjrt7eUz4pXiuIll1as6HzU28RknEkRn
	973pHaHP1uehwcJ+eBNbvcuMgs3FmOJfiknKC21CrRJcyO3OXfnta42+33zB+2lQXP7Jq/jVXk5
	pNpZuSFG5UClS1LX0Mvp/il6ejPQE+KSHypUkH7EuDDcfnPKVUqiSBpexMd+BtWtDPFi0JJ1kiP
	nAg3hYSqvlUgtv1/pq59CYwv0TQw==
X-Received: by 2002:a05:600c:3488:b0:488:aa33:dc8f with SMTP id 5b1f17b1804b1-48e8decf95amr67028955e9.0.1778605780569;
        Tue, 12 May 2026 10:09:40 -0700 (PDT)
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
	Jens Wiklander <jens.wiklander@linaro.org>,
	Rahul Singh <rahul.singh@arm.com>
Subject: [PATCH v9 00/13] Add initial Xen Suspend-to-RAM support on ARM64
Date: Tue, 12 May 2026 20:07:07 +0300
Message-ID: <cover.1778605274.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1778605781-E2975CF5-D2B20BCB/0/0
X-purgate-type: clean
X-purgate-size: 6549
X-Rspamd-Queue-Id: E44505257BC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:jens.wiklander@linaro.org,m:rahul.singh@arm.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TAGGED_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

From: Mykola Kvach <mykola_kvach@epam.com>

This is part 2 of the ARM Xen system suspend/resume patch series, based
on earlier work by Mirela Simonovic and Mykyta Poturai.

Part 1, covering guest suspend functionality, is already in mainline.

NOTE: Host-wide suspend/resume support is guarded by CONFIG_SYSTEM_SUSPEND,
which can currently only be selected when UNSUPPORTED is set, and thus the
host suspend backend is neither enabled by default nor built in supported
configurations. The separate HAS_HWDOM_SYSTEM_SUSPEND policy bit only changes
how ARM treats SHUTDOWN_suspend from the hardware domain; it does not enable
the host-wide suspend backend by itself.

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
 - Add suspend/resume CI test for ARM (QEMU if feasible)
 - PCI suspend ?
---

Detailed changelogs can be found in each patch.

Changes in v9:
- Split the control-domain SYSTEM_SUSPEND flow so host availability,
  runtime blockers and domain-readiness checks are handled separately from
  the host suspend backend.
- Gate vPSCI SYSTEM_SUSPEND on cached host PSCI support and Xen runtime
  suspend blockers, and log firmware support during initialization.
- Fold the arm64 resume trampoline into the CPU context save/restore patch
  and use asm-offsets-generated RESUME_CTX_* definitions for the assembly
  save/restore path.
- Tighten the GICv2/GICv3/ITS/IPMMU/SMMUv3 suspend/resume paths based on
  review feedback, including state-save/restore fixes and safer failure
  handling.
- Reorder the host suspend/resume phases so timer and GIC state are
  handled with local IRQs disabled and restored before console/IOMMU
  resume.

Changes in v8:
- Rebased to latest master and refreshed the series accordingly.
- Added a new GICv3 patch to tolerate retained redistributor LPI state
  across CPU_OFF/CPU_ON.
- GICv2 suspend now disables the CPU interface and distributor before
  saving state.
- GICv3 suspend/resume fixes the redistributor base used for LPI state.
- ITS and SMMUv3 suspend/resume paths were tightened, with safer
  restore/rollback handling and stricter fatal-error handling.
- System suspend now checks that all domains are already in
  SHUTDOWN_suspend before proceeding, and renames the hardware-domain
  suspend capability/helper for clearer semantics.
- Fixed alignment/cleanup issues in the low-level suspend/resume code.

Changes in v7:
- Timer helper renamed/clarified; virtual/hyper/phys handling documented.
- GICv2 uses one context block; restore saved CTLR; panic on alloc failure.
- GICv3/eSPI/ITS always suspend/resume; restore LPI/eSPI; rdist timeout.
- IPMMU suspend context allocated before PCI setup.
- System suspend: control domain drives host suspend.
- Dropped v6 IRQ descriptor restore patches; use setup_irq and re-register
  local IRQs on resume instead.

For earlier changelogs, please refer to the previous cover letters.

Mirela Simonovic (5):
  xen/arm: Add suspend and resume timer helpers
  xen/arm: gic-v2: Implement GIC suspend/resume functions
  xen/arm64: Save/restore CPU context across SYSTEM_SUSPEND
  xen/arm: Implement PSCI SYSTEM_SUSPEND call (host interface)
  xen/arm: Add host system suspend backend

Mykola Kvach (7):
  xen/arm: gic-v3: tolerate retained redistributor LPI state across
    CPU_OFF
  xen/arm: gic-v3: Implement GICv3 suspend/resume functions
  xen/arm: gic-v3: add ITS suspend/resume support
  xen/arm: tee: keep init_tee_secondary() for hotplug and resume
  xen/arm: ffa: fix notification SRI across CPU hotplug/suspend
  xen/arm: smmu-v3: add suspend/resume handlers
  xen/arm: Add vPSCI SYSTEM_SUSPEND policy

Oleksandr Tyshchenko (1):
  iommu/ipmmu-vmsa: Implement suspend/resume callbacks

 xen/arch/arm/Kconfig                     |   2 +
 xen/arch/arm/Makefile                    |   1 +
 xen/arch/arm/arm64/asm-offsets.c         |  20 ++
 xen/arch/arm/arm64/head.S                | 118 +++++++
 xen/arch/arm/gic-v2.c                    | 181 +++++++++++
 xen/arch/arm/gic-v3-its.c                | 133 +++++++-
 xen/arch/arm/gic-v3-lpi.c                |  80 ++++-
 xen/arch/arm/gic-v3.c                    | 394 ++++++++++++++++++++++-
 xen/arch/arm/gic.c                       |  35 ++
 xen/arch/arm/include/asm/gic.h           |  16 +
 xen/arch/arm/include/asm/gic_v3_defs.h   |   1 +
 xen/arch/arm/include/asm/gic_v3_its.h    |  23 ++
 xen/arch/arm/include/asm/mm.h            |   2 +
 xen/arch/arm/include/asm/psci.h          |   4 +
 xen/arch/arm/include/asm/suspend.h       |  36 +++
 xen/arch/arm/include/asm/time.h          |   5 +
 xen/arch/arm/mmu/smpboot.c               |   2 +-
 xen/arch/arm/psci.c                      |  38 ++-
 xen/arch/arm/suspend.c                   | 194 +++++++++++
 xen/arch/arm/tee/ffa_notif.c             |  63 +++-
 xen/arch/arm/tee/tee.c                   |   2 +-
 xen/arch/arm/time.c                      |  44 ++-
 xen/arch/arm/vpsci.c                     | 120 ++++++-
 xen/common/Kconfig                       |   3 +
 xen/common/domain.c                      |   7 +-
 xen/drivers/char/serial.c                |  12 +
 xen/drivers/passthrough/arm/iommu.c      |   4 +
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 319 +++++++++++++++++-
 xen/drivers/passthrough/arm/smmu-v3.c    | 182 ++++++++---
 xen/include/xen/list.h                   |  14 +
 xen/include/xen/serial.h                 |   1 +
 xen/include/xen/suspend.h                |   2 +
 32 files changed, 1951 insertions(+), 107 deletions(-)
 create mode 100644 xen/arch/arm/suspend.c

-- 
2.43.0


