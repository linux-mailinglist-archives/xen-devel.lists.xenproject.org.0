Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C63B38B4C
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 23:23:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096964.1451480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urNc4-0003lx-MN; Wed, 27 Aug 2025 21:23:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096964.1451480; Wed, 27 Aug 2025 21:23:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urNc4-0003iz-I3; Wed, 27 Aug 2025 21:23:24 +0000
Received: by outflank-mailman (input) for mailman id 1096964;
 Wed, 27 Aug 2025 21:23:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4G5n=3H=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1urNc2-0003ij-Ge
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 21:23:22 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e7645b0-838c-11f0-aeb2-fb57b961d000;
 Wed, 27 Aug 2025 23:23:21 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-333f901b2d2so2416591fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 27 Aug 2025 14:23:21 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3365e2687acsm29844061fa.32.2025.08.27.14.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Aug 2025 14:23:19 -0700 (PDT)
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
X-Inumbo-ID: 0e7645b0-838c-11f0-aeb2-fb57b961d000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756329800; x=1756934600; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dIHkATse3Q+6+zG1pS+GXwcrJ8GyErfGpMUy7fqjQQc=;
        b=lXQ2RSyj53aJsXDQ84sv4sTSWUsZwDul53Oj+cjaT5spXt5L6pdCs3tCcF9cNWVfwP
         hS/F3Oz+EeHZLb2k/h/2wl8ew567u27lZ4u/EI/O6Uq0tQgkMdpClRW/ePttJjeKWJh3
         dZDA8NXg1Mz0ocP7pQ29xsBXrC4cMQQCDsCNa5smP2tcn6XFGSTioJwa3cv6i5V0b267
         hCUeGC0ny1JiXJxyNRoqL281NsyBtbHtisFVdTVPusyrMYdRgCWM3Uq/A0FC1mf6fIbT
         al5NByCKZbb7zFV9+AZ38GrJCNDLUkS6alNUcbLd8bFoa9c6F9PfNjzSgh74yY5y7ShV
         1/oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756329800; x=1756934600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dIHkATse3Q+6+zG1pS+GXwcrJ8GyErfGpMUy7fqjQQc=;
        b=gf/YyXyOCcvlIC8rPDSJZqolWyHm03da2q+wT2b1z2RxYgj7i30U0xL51+xnUIiSom
         SPGdQW/yaIWFa0AWTI/0BjsGUYfd9VPU9iiVpxQXmh8QX3hrLg7QbiO67rX8L3EoGSKq
         E76mfGOPFnH6avqKa5jE2VV+Dj4T5aQi9gZrzDR5N2+NznZX/fTZTBB8byQ788Zmts4r
         6F8LkjahPvlntEZjeP8X70XWTO/qC6EcyxIrgsbW3OhHP2HsFdEGAJcfvH5KzBA5pVd7
         ZLgBcheZ/RJ1B0VH8H+Ivq/egfWu8o9K+yxGlf9QgPqZZHOO6VdT1x/KJp0Qec2n/AHU
         ypJw==
X-Gm-Message-State: AOJu0YxXVVsGqd9bh06LAkkGg3YA9AgJl7uJx/4eoIW9GvDX09Lg2gB9
	wPAnBtVz30GfNIIazW0XdR8Yog95EyzWj1SVOIxaehqysWlxSLS441LzNhbY+A==
X-Gm-Gg: ASbGnctBPn98xpbtAjunkyYKmD8+GctVaJkhVq4tnx5TGTd7yGrTMWIHYw0ZCp6t3OH
	No4okF/DxR7V0MGVBS+2pA5kv8l/tkDS4fHLZt9auPmJKtEhJEudLjiTEJAb2ae8qb7NKdNyjTw
	aWCgYYG5sk6IScJ4/Ht1zCC03yBpD348wCjEoUJiexhoed1mu2ofRYncc78H0qYt6g5QaJ8bTrb
	v1YexdDr8pny8E5/CfEftHPPTs4P+8xBKJw765xsrLbGyfXSmyL/AdY6cYCj1XXJU60/FrHUZrd
	ZdURjqWu38qAtRj5XzbM9dsmoaNgRCzosGRQHjSC/hFl2CfZJT7aaDcjp12u6paHUpOoqb61rM6
	EFmsHmwYG1HyMu9KqmMHn2wlE0V/cAglYThiZZasp2+suMToxd6xZAZovqHdR48dZrHGsR6tn
X-Google-Smtp-Source: AGHT+IHVfIk+udn2PYwm7UszF7DIDCHr7OtwJP2/CFKW5HVBGcOQq1qbA5Dy9eR3v3gb628CO9Cr9A==
X-Received: by 2002:a2e:a58d:0:b0:335:34e2:cb8c with SMTP id 38308e7fff4ca-33650fa81e0mr67228331fa.29.1756329799775;
        Wed, 27 Aug 2025 14:23:19 -0700 (PDT)
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
Subject: [PATCH v10 0/4] Enable guest suspend/resume support on ARM via vPSCI
Date: Thu, 28 Aug 2025 00:21:32 +0300
Message-ID: <cover.1756329091.git.mykola_kvach@epam.com>
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
 tools/xl/xl_vmcontrol.c               |  12 ++--
 xen/arch/arm/domain.c                 |  21 +++++-
 xen/arch/arm/include/asm/domain.h     |   2 +
 xen/arch/arm/include/asm/perfc_defn.h |   1 +
 xen/arch/arm/include/asm/psci.h       |   2 +
 xen/arch/arm/include/asm/vpsci.h      |   2 +-
 xen/arch/arm/vpsci.c                  | 100 ++++++++++++++++++++++----
 xen/common/domain.c                   |  35 +++++++--
 xen/include/xen/sched.h               |   3 +
 16 files changed, 158 insertions(+), 40 deletions(-)

-- 
2.48.1


