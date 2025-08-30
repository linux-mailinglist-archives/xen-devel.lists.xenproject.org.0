Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B308B3CFC6
	for <lists+xen-devel@lfdr.de>; Sun, 31 Aug 2025 00:12:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1103289.1455082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1usTnf-0004FP-P9; Sat, 30 Aug 2025 22:11:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1103289.1455082; Sat, 30 Aug 2025 22:11:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1usTnf-0004Dd-Hg; Sat, 30 Aug 2025 22:11:55 +0000
Received: by outflank-mailman (input) for mailman id 1103289;
 Sat, 30 Aug 2025 22:11:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IC44=3K=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1usTne-0004DI-22
 for xen-devel@lists.xenproject.org; Sat, 30 Aug 2025 22:11:54 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53c537bd-85ee-11f0-8dd7-1b34d833f44b;
 Sun, 31 Aug 2025 00:11:50 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-33682342180so29166271fa.0
 for <xen-devel@lists.xenproject.org>; Sat, 30 Aug 2025 15:11:50 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-336d0e3f39dsm4662091fa.45.2025.08.30.15.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Aug 2025 15:11:48 -0700 (PDT)
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
X-Inumbo-ID: 53c537bd-85ee-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756591909; x=1757196709; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qZp0lPgPe4HlwnbMcyoSq9Puvmd7k9VTEkM+R0CcSMc=;
        b=AN8s9+0UJmYQlDl8iA5prt3/KPozBOpwwIXUX9r1E1ZRQ117uJtWWCXNEvhmercVA/
         7+7xKDyEmOBc6frt18Gf0q6mZtgJCuvss4l2GY/PR2yeU42cVSc9Gio7adL+t1Exy+6Q
         AApuPpg2Ld8A0Bs7a7Y06fjDEX7fA75HOW1m2XdCjOVHJPZuSb36coQgV07Y4o6hFmoD
         kjuAa/ZzAx5OjOAjrWmZkDU3q4ljOrZOCsYki1YwKjQRQUr/M5HAT8b+XjfmE+zZVLQH
         udjCON5iiaJ5ijLQMF9eBoesKwciblI1mtuN/lghZjbQmVCXxCCdPxaVAC4Rzxrvd6CG
         6NOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756591909; x=1757196709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qZp0lPgPe4HlwnbMcyoSq9Puvmd7k9VTEkM+R0CcSMc=;
        b=nY1xzZ9T+p6kYN+yBHgm6AVIIPj2IcQBA4M3hwVuwRm1+iJPfN1M+RZ4xgVFNiLBj6
         wO0Xz6aC9L/ca5B4gIwWDsvhIl9ZY7gWcAUr1dkw0GOrVj9jBVLN0ZHnvXkTFpkPfOxO
         89OFQOIfdqwWzkns6nmc31Lx2DFzCepX/uUliTaPNXyi2CECoqj4aLrDF2/zfIU7MiMZ
         rh0Bs7fDdmcUZh/venA10ZFlHMt3BEly+Q1P9H0Q11W3Y4Da0s7tr34XaNMbNHPPDpZu
         bwuldRaNLiv97oMd66bzU6M1IXiQ6qPtR60O9pfM87PhChblqxTTAgQfmwdDdHEAS2W/
         xCrA==
X-Gm-Message-State: AOJu0YzK5z+W8htjDksVHgHAMbrf3Q02n/K1HwXDLeNYQrLhq3s/K4eS
	UzuqJDf1p9yYKWUHlMxI+/Lvcxsn7OFibar9p4bqdcW3Eeu6WUE/VktJdSlxsXcU
X-Gm-Gg: ASbGncsdjE1UzDNJQRsnu32e1g6X1liJMYm0e9154yjQHgCQX4JZcesgPvVEpbEljhZ
	Pyyjh6IopfUpe2nn41Xt5UBBjIudcLJDF6LbNBNPTDX9yQyIWhQAWEV2jJEPiaQU1mXyCDNd6wq
	liSWwJhOCR6AtgOnVwpgI5lr5jALafP5SWQN6nfoyrrJkgAvSRIlfqPCiVzkcDeX0kr3FnJBGrv
	U4Ts6AhYpVP3BfrdkGo5YoM5pZwpX5dM6rx6VSDqQAWa854DF6k4f6g6IliVyfKIVmcyMNKqrgp
	dikx19749ybP1MaEXioP6HIh4DKHX1uzbEtdsaL17/fqAWuCNjytMtYgjIS8Cmn8HP38zsWMe99
	XVvFOekTzeEwSlr85o+XemerGrQwbYWp00QuOk9h1iN/E1bafOyqYeLQXVIYRrA==
X-Google-Smtp-Source: AGHT+IGpiA0Ene6qFKdtJFpXJCjSNsEg7lgYEnD7D8AoqBEsq6/9Y69yteNTjlSgxc+3GIY7LPjJ/A==
X-Received: by 2002:a05:651c:19a3:b0:336:527a:5b4d with SMTP id 38308e7fff4ca-336caac9b8dmr6766541fa.19.1756591909184;
        Sat, 30 Aug 2025 15:11:49 -0700 (PDT)
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
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Juergen Gross <jgross@suse.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v12 0/4] Enable guest suspend/resume support on ARM via vPSCI
Date: Sun, 31 Aug 2025 01:10:27 +0300
Message-ID: <cover.1756586648.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

This patch series introduces the initial support for guest suspend
and resume on ARM platforms using the PSCI SYSTEM_SUSPEND interface. The main
goal is to allow ARM guests to request suspension using PSCI and be resumed
by the control domain (e.g., via "xl resume").

### Background

The PSCI SYSTEM_SUSPEND call is part of the PSCI v1.0+ specification and is
used by guests to enter the deepest possible power state. On Xen/ARM, we
emulate this interface in the virtual PSCI (vPSCI) layer for guests.

This series includes:

1. A new vPSCI implementation of the PSCI SYSTEM_SUSPEND function for guests
2. Documentation updates to SUPPORT.md to reflect PSCI and vPSCI support status
3. Enabling "xl resume" command compilation for ARM, which was previously disabled

### Usage

For Linux-based guests:
  - Suspend can be triggered using: "echo mem > /sys/power/state" or "systemctl suspend"
  - Resume can be performed from control domain using: "xl resume <domain>"

For more information, refer to the official Linux kernel documentation on power management.

Note that currently, SYSTEM_SUSPEND is supported only for guest domains (not for
the hardware domain).
---

This is the first part of previous patch series and originally consist only
with necessary changes needed for guest domain suspend.

The second part can be found here:
    https://patchew.org/Xen/cover.1754943874.git.mykola._5Fkvach@epam.com/
---

Changes in v12:
- Use the input vCPU from vpsci_vcpu_up_prepare function argument instead of current.
- Add a check for the wake_cpu pointer on resume.
- Call arch_domain_resume() under shutdown_lock.
- Drop redundant vgic_clear_pending_irqs() call from vpsci_vcpu_up_prepare().

Changes in V11:
- introduce arch_domain_resume() and vpsci_vcpu_up_prepare(), which are now
called on the resume path to avoid extra modifications to common code.
The vCPU context is now updated during domain resume.

Changes in V10:
- An ARM-specific helper (domain_resume_nopause_helper)
- An isb() is added before p2m_save_state
- The is_64bit_domain check is dropped when masking the upper part of entry
  point and cid for SMC32 SYSTEM_SUSPEND PSCI calls
- Status of vPSCI SYSTEM_SUSPEND changed from "Experimental" to "Tech Preview"

Changes in V9:
- no functional changes
- enhance commit message and add extra comment to the code after review

Changes in V8:
- GIC and virtual timer context saved when the domain suspends
- rework locking
- minor changes after code review

Changes in V7:
- add proper locking
- minor changes after code review

Main changes in V6:
- Skip execution of ctxt_switch_from for VCPUs in paused domains.
- Implement domain_resume_nopause
- Add a helper to determine if a VCPU is in suspended domain.
- Ignore upper 32 bits of arguments for 64-bit domains calling SMC32 SYSTEM_SUSPEND.
- Macro renamed from LIBXL_HAVE_NO_SUSPEND_RESUME to LIBXL_HAVE_NO_SUSPEND for clarity.
- Documentation now focuses only on the SYSTEM_SUSPEND function, with improved wording and structure.
- Changelog and commit messages refined for clarity and to remove redundant explanations.

Main change in V5:
  - Reverted the logic related to suspending domains. Instead of the standby
    mode introduced in v4, domains now resume execution at the point provided
    during suspend

The rest of the minor changes are described in the changelog of each commit.

Previous versions of this patch series:
  V1: https://lists.xenproject.org/archives/html/xen-devel/2018-11/msg01093.html
  V2: https://marc.info/?l=xen-devel&m=166514782207736&w=2
  V3: https://lists.xenproject.org/archives/html/xen-devel/2025-03/msg00168.html

Mykola Kvach (4):
  xen/arm: Implement PSCI SYSTEM_SUSPEND call for guests
  tools/xl: Allow compilation of 'xl resume' command on Arm
  SUPPORT.md: Document PSCI SYSTEM_SUSPEND support for guests
  CHANGELOG: Document guest suspend/resume to RAM support on Arm

 CHANGELOG.md                          |   2 +
 SUPPORT.md                            |   5 +-
 tools/include/libxl.h                 |   1 -
 tools/xl/xl.h                         |   4 +-
 tools/xl/xl_cmdtable.c                |   4 +-
 tools/xl/xl_migrate.c                 |   2 +-
 tools/xl/xl_saverestore.c             |   2 +-
 tools/xl/xl_vmcontrol.c               |  12 +--
 xen/arch/arm/domain.c                 |  37 ++++++++
 xen/arch/arm/include/asm/domain.h     |   6 ++
 xen/arch/arm/include/asm/perfc_defn.h |   1 +
 xen/arch/arm/include/asm/psci.h       |   2 +
 xen/arch/arm/include/asm/vpsci.h      |   5 +-
 xen/arch/arm/vpsci.c                  | 116 +++++++++++++++++++++-----
 xen/arch/ppc/stubs.c                  |   5 ++
 xen/arch/riscv/stubs.c                |   5 ++
 xen/arch/x86/domain.c                 |   5 ++
 xen/common/domain.c                   |   9 ++
 xen/include/xen/domain.h              |   2 +
 19 files changed, 188 insertions(+), 37 deletions(-)

-- 
2.48.1


