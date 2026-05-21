Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNiaDoRFD2qNIgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 19:48:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E08995AA8E7
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 19:48:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315649.1585358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ7VK-00019z-Uv; Thu, 21 May 2026 17:48:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315649.1585358; Thu, 21 May 2026 17:48:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ7VK-00017f-Rb; Thu, 21 May 2026 17:48:18 +0000
Received: by outflank-mailman (input) for mailman id 1315649;
 Thu, 21 May 2026 17:48:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wQ7VJ-00017S-73
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 17:48:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ7VI-00BluR-Ii
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 19:48:16 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0f4548-bab6-0a2a0a5309dd-0a2a4505c21c-12
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 19:48:16 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0f4560-aaa8-0a2a45050019-d1558031e459-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 19:48:16 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-490388fd0dbso9362045e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 10:48:16 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.24.36]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49033d8e24bsm74565925e9.10.2026.05.21.10.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 10:48:15 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779385696; x=1779990496; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x4159oRt/HJtjR5zuxsLlhFZFH8epi6PhD6RsyzvFnc=;
        b=WbDRSTHRYqK0RVfTIzObla3Tb9Hz9PCFOZ5kLtXmA3BNgZNP8xLcEhUosn4Swn+9PH
         qXwg430HH4JHIC3FuWL6oqw4ewH5wbtC+Yaj+X61/KSJxnSGIVyTTD/xbsMb48R+CM6l
         dNR+hiGrnr7WA5UWlfRHATqMtWy0xGc4E3DY2UGnADDEaEsu6nkoIoulvsBKvMk2Ijam
         +YuSDU39TY72R9u58giECrDi0FRq/B5OLKPNo6fgwVU0TUm7PVC7lzdyc+IMVLvvcrd0
         83yiq8y5xj6nPTB18SBnaP084hXwkCuf/s9SouFokQ5ZC6wRrpf67OR4BaDvlFUlXl2W
         fv7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779385696; x=1779990496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x4159oRt/HJtjR5zuxsLlhFZFH8epi6PhD6RsyzvFnc=;
        b=sr8Hafkqa4w0CXc7UpdVLbhMe9SKA5fsTc1sAqPCQks0DmQtwb4LpbwEmvo/SgH4E/
         AwVhm3CJNx+fPXYbTHTxFmaSWOI6cKXuDBS0Gs0QXd66WNH2iFEuJYeId0aqHXrjMs9Z
         GwgBNI5GXG8PP+mCr/p75AIvtoOKszY09nTMJ7zwz2JkZRPTtmjcBvBqjWQTrKJbYocN
         dxoX1viSQQTIguKicVwIhYW4huSpS9cFaPnBQZ4bQpEDJSTVjI4yXuegExvScEvNIwD9
         WGPBAgFHHzk5Jhc+5tnTTyKqWBuGEcFDf9SFBTs3JbcpAWR9brHwvG4eK2AE54XWlNDl
         xQoQ==
X-Gm-Message-State: AOJu0Yz1/GBl2Oy3lpMs/BiG59IYLO2XI27z5o0XtQyaDca5rHX4hja9
	1EnxI3MtCJ6NehPOv1x1p7oAz9rLtFf15lvAYMtlLAeJB0LngoZ5JIckOhiqfWY9
X-Gm-Gg: Acq92OEfydtEaFk6VpyV/x0wKWAZYRuUDOUDDxQJlp2ARRfhFxpY9YahE/J/+N1+iJi
	ccea5LD44+xHIHMeerXU5rIvJ0K1PStfCGorbQj4NKX1jilYDqOsIiQ9dxM6MhNnFqYJoZ0IbTC
	Fc1CeKhiSrE+wJ5+C8AsKIPp1bJXngoJk4ok364NohzwQhkXegk7D7hLoy7UzP85960RHuFlvo4
	WQ/UVGUADGBrCC07PBd5oh2y5Ygwgs0JW3u9vabYsVQbNkgw0UlF/oPQElAu1xmK9+vMTWlNH4t
	HJ/S9gLvf5wVR30Gx4pqeYq2DvK/ua6ojvCYUNINciF8uoPBA9itJoSDz+45e/1rGsHY/uIBoI1
	3gk1YpGgykmowsF2jA61jOzfqgICbA4y7AUVpod2sDdnTR9GxtP9qejtI+lIu2vpeo60HKKUPU9
	Cu9DPu8/Z0Z/RXtrS3whofxETXYA==
X-Received: by 2002:a05:600c:32af:b0:48a:65ad:1881 with SMTP id 5b1f17b1804b1-49036056678mr38944315e9.13.1779385695369;
        Thu, 21 May 2026 10:48:15 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Luca Fancellu <luca.fancellu@arm.com>,
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
Subject: [PATCH v10 00/13] Add initial Xen Suspend-to-RAM support on ARM64
Date: Thu, 21 May 2026 20:45:18 +0300
Message-ID: <cover.1779385072.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1779385696-E3B8E443-52E1A399/0/0
X-purgate-type: clean
X-purgate-size: 8294
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:luca.fancellu@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:jens.wiklander@linaro.org,m:rahul.singh@arm.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TAGGED_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E08995AA8E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
robustness and maintainability, and implements initial ARM64 host-wide
Suspend-to-RAM support driven by control-domain PSCI SYSTEM_SUSPEND
requests. vPSCI also exposes SYSTEM_SUSPEND as a domain suspend operation
for all domains; attempt-time host-suspend policy failures are reported as
PSCI_DENIED rather than hidden through PSCI_FEATURES.

Key updates in this series:
 - Introduced architecture-specific suspend/resume infrastructure
 - Integrated GICv2/GICv3 suspend and resume, including memory-backed context
   save/restore with error handling
 - Added time and IRQ suspend/resume hooks, ensuring correct timer/interrupt
   state across suspend cycles
 - Implemented proper PSCI SYSTEM_SUSPEND invocation and version checks
 - Added vPSCI SYSTEM_SUSPEND policy for domain suspend and host-wide
   control-domain sequencing
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

Changes in v10:
- Clarify the vPSCI SYSTEM_SUSPEND policy summary: keep SYSTEM_SUSPEND
  advertised once implemented and return PSCI_DENIED, rather than
  PSCI_NOT_SUPPORTED, for attempt-time host-suspend policy failures.
- Tighten GICv2/GICv3 suspend/resume based on review feedback: avoid
  reserved interrupt register ranges, check visible active-priority state,
  restore configuration before enable state, and re-enable the redistributor
  before restoring CPU/virtual interface state on abort paths.
- Refine ITS resume so MAPC is replayed only for ITS-backed collections and
  clarify the collection-ID assumptions.
- Rework IPMMU and SMMUv3 resume/suspend handling, including root-before-cache
  IPMMU restore ordering and disabling SMMU interrupt generation before
  suspend.
- Save and restore CNTHCTL_EL2 in the arm64 CPU resume context and simplify
  the resume trampoline/context hand-off.
- Re-apply boot CPU errata/workaround handling after SYSTEM_SUSPEND and move
  set_init_ttbr() declaration to asm/mmu/mm.h.
- Update patch 12 details: shorten SYSTEM_SUSPEND blocker logs, use %pd for
  control-domain logging, mark serial_suspend_available as __ro_after_init,
  and mention the xen/suspend.h struct domain forward declaration.

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
 xen/arch/arm/arm64/asm-offsets.c         |  21 +
 xen/arch/arm/arm64/head.S                | 122 ++++++
 xen/arch/arm/cpuerrata.c                 |   7 +-
 xen/arch/arm/gic-v2.c                    | 226 +++++++++++
 xen/arch/arm/gic-v3-its.c                | 146 ++++++-
 xen/arch/arm/gic-v3-lpi.c                |  80 +++-
 xen/arch/arm/gic-v3.c                    | 482 ++++++++++++++++++++++-
 xen/arch/arm/gic.c                       |  35 ++
 xen/arch/arm/include/asm/arm64/sysregs.h |   5 +
 xen/arch/arm/include/asm/cpuerrata.h     |   1 +
 xen/arch/arm/include/asm/gic.h           |  16 +
 xen/arch/arm/include/asm/gic_v3_defs.h   |   3 +
 xen/arch/arm/include/asm/gic_v3_its.h    |  28 ++
 xen/arch/arm/include/asm/mmu/mm.h        |   2 +
 xen/arch/arm/include/asm/psci.h          |   4 +
 xen/arch/arm/include/asm/suspend.h       |  37 ++
 xen/arch/arm/include/asm/time.h          |   5 +
 xen/arch/arm/mmu/smpboot.c               |   2 +-
 xen/arch/arm/psci.c                      |  38 +-
 xen/arch/arm/suspend.c                   | 210 ++++++++++
 xen/arch/arm/tee/ffa_notif.c             |  63 ++-
 xen/arch/arm/tee/tee.c                   |   2 +-
 xen/arch/arm/time.c                      |  44 ++-
 xen/arch/arm/vpsci.c                     | 120 +++++-
 xen/common/Kconfig                       |   3 +
 xen/common/domain.c                      |   7 +-
 xen/drivers/char/serial.c                |  12 +
 xen/drivers/passthrough/arm/iommu.c      |   4 +
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 323 ++++++++++++++-
 xen/drivers/passthrough/arm/smmu-v3.c    | 190 +++++++--
 xen/include/xen/list.h                   |  14 +
 xen/include/xen/serial.h                 |   1 +
 xen/include/xen/suspend.h                |   2 +
 35 files changed, 2154 insertions(+), 104 deletions(-)
 create mode 100644 xen/arch/arm/suspend.c

-- 
2.43.0


