Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD35BB1DD83
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 21:40:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073698.1436565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk6T8-0003Wh-HU; Thu, 07 Aug 2025 19:40:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073698.1436565; Thu, 07 Aug 2025 19:40:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk6T8-0003Uy-Dk; Thu, 07 Aug 2025 19:40:06 +0000
Received: by outflank-mailman (input) for mailman id 1073698;
 Thu, 07 Aug 2025 19:40:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gbW2=2T=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uk6T6-0002bD-UG
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 19:40:05 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5011acef-73c6-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 21:40:03 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-55b9855f671so1097703e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 12:40:03 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b8898bfc6sm2759188e87.10.2025.08.07.12.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 12:40:01 -0700 (PDT)
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
X-Inumbo-ID: 5011acef-73c6-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754595602; x=1755200402; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3PCKBVkOOiGwztb7dubHx+ShtxfyDDP66VQQbwirhOY=;
        b=hPl/dmVZupC9iScdWmXGaemNAITxpLDBzHTayVBrg/djA3Um2WN7ow8FmnRqI846/f
         4INBWXvnCPkW8oF1JCN5apDP3xecXRwYvs9N7iw5b1MKjgf2nHkiPGovS1CBtmLUmlLJ
         9c8eu2GvUcu98GAbmtnnl1HtnIpvIQDHIVY8eYirfsubCCrDUSKUlHjk16kTlg6UlOMV
         mXiOm4o+sVjVK2GsI6VYBWxF/IuC55iuj7rjoVMkrNdYpZStqVpEIrD76bcH3r/mnTXw
         c77QhSdHGS8k6rXdGXL4+yLLDeYGrzCeqZBFtHKKWYXaQ6KYeJhshP6t8BeD1Era9n1k
         LYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754595602; x=1755200402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3PCKBVkOOiGwztb7dubHx+ShtxfyDDP66VQQbwirhOY=;
        b=FaXII8d50ZIvaGen9e5XLvThspZHQ42VD063/J6u6jcDkzZ6yBbp7RgBUpFs1szsJs
         HpQHN2zVd48D9FflEKot4QwbGyYkmTCJnNrEHo0ySED0qtKz5J6l3ZGibMebP3B/+aIC
         HSe6rQ+pnJ7m1h4CTeZ7nYUZFENNsXMwstH30nBMC6dbZtt5XHCaGiK10M3nAd7q7gGa
         M8/jhgvY6b9rjRdxowZL6IKTxpeNFVnNK97ha97aBav689lth5TsGfbId/63XdeZrR0y
         R7LVmOoEjy8a08GyBeorL4/5v0wG6ns41Sx+8l2IAGsb2MvElQdK3JnHEVKg/sJFWJpS
         j7vQ==
X-Gm-Message-State: AOJu0YwMMwPU1wigVcoFU/oWIgN+OZgVecC3CuPvy+5E2y+gymes3ylk
	zhkLtOQj23BtHMGS/OgSCDh8PGKWUlZNlZBwe7/6ISuIPMFiKpplcJHNEAKR0ZUkF6w=
X-Gm-Gg: ASbGnctbhs9azpuSxBR6TBP3e10h2YCsE8I7kGa5fkwOxOxGK/wqYJw6p7bnve1g9pA
	VLlrIaYubpb0OGHjlvlAdU8hNZnod+HJIDMlpcM/uq8anKaaWa321D9kxqBSvHze5kbrs41BKxi
	Yl8DQL18o61mVg2JCwpqpOObRSkjbV6kVxejKxR6zYkIwLPN1dm/zTlpeFiWHLRXJiNH/8DukVz
	9l0Dl8j1KfjpW7EDFLQVsn/owkQiPCESjnymceN0yjtbTgevtJ9fQJCyTKp7o9u2tQgplQ8iCGz
	mPiUfToy3nzsnv6EriNAVJ63LjZz7RlTNr2vr3yhfGJ/eEaMXGXp2cEMddjXzqrGw3ffd/J0qeW
	sQIDsR1429YRpDjgZbMxypYksXEASKPfPyCswILFoMyv+167F83Gq3vyGLcshMg==
X-Google-Smtp-Source: AGHT+IEcX+5TflQqQCCowXcla5nXZQlyNz6i14wmvRuwklH41h2IcJZ3jqsT9dcgBKwlRHwdpapRHA==
X-Received: by 2002:a05:6512:3d9e:b0:550:e8b6:6996 with SMTP id 2adb3069b0e04-55cb5c7886fmr1371456e87.2.1754595602201;
        Thu, 07 Aug 2025 12:40:02 -0700 (PDT)
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
	Juergen Gross <jgross@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v8 0/4] Enable guest suspend/resume support on ARM via vPSCI
Date: Thu,  7 Aug 2025 22:39:24 +0300
Message-ID: <cover.1754595198.git.mykola_kvach@epam.com>
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

TODO: enable "xl suspend" for ARM
---

This is the first part of previous patch series and originally consist only
with necessary changes needed for guest domain suspend.

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
 xen/arch/arm/domain.c                 |  17 +++--
 xen/arch/arm/include/asm/perfc_defn.h |   1 +
 xen/arch/arm/include/asm/psci.h       |   2 +
 xen/arch/arm/include/asm/vpsci.h      |   2 +-
 xen/arch/arm/vpsci.c                  | 101 ++++++++++++++++++++++----
 xen/common/domain.c                   |  22 ++++--
 xen/include/xen/sched.h               |   6 ++
 15 files changed, 139 insertions(+), 44 deletions(-)

-- 
2.48.1


