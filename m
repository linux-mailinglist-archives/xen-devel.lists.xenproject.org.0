Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CDBB3A2C6
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 16:54:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099030.1452941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ure17-0006sX-Fv; Thu, 28 Aug 2025 14:54:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099030.1452941; Thu, 28 Aug 2025 14:54:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ure17-0006qz-D5; Thu, 28 Aug 2025 14:54:21 +0000
Received: by outflank-mailman (input) for mailman id 1099030;
 Thu, 28 Aug 2025 14:54:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mimg=3I=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1ure16-0006qt-7d
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 14:54:20 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e00b63bb-841e-11f0-8adc-4578a1afcccb;
 Thu, 28 Aug 2025 16:54:19 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-3366f102680so8633431fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 07:54:19 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f42101509sm2635661e87.106.2025.08.28.07.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 07:54:16 -0700 (PDT)
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
X-Inumbo-ID: e00b63bb-841e-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756392858; x=1756997658; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NR6yXtdSNOXfRuoowRl1lmRlIoUAXhFkxOLUpv1u/tQ=;
        b=Fq4UXxwUOgkK+IkSMpj0AcQdWRGLr+Y3mUUGlqSDv1up2oleoCsZUsNPlrvmFd5hoD
         lIYY0xgdl/iSNTMIb+IHCBJ1GO5FgAv/wfw8Cp3Zn3ryH1yFq/ea/gTqhNd2D7NZzu7h
         ggH4UrNdkT0EdH7J12Mq4p3TpJCVX1R6Reso9gDC0XsO3YdG8bGHgvm83TKXWw2AgB/e
         3WybJPYKpHQ0M/o85sDkZdugKOQBTl8VtNkdBrSoArfmIvcJpEqGev43iezt49w2035e
         glg7rlyhMHIi3yzI82xRpFbyS7qobXNBu/Xa6GrHZfrqrk/KAyDvlfWTUd0Ek6JWa5Hd
         6rXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756392858; x=1756997658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NR6yXtdSNOXfRuoowRl1lmRlIoUAXhFkxOLUpv1u/tQ=;
        b=m1udT6cjG/Zc94kA98Udn9xzHR3pB93KhqZsvkc0y83eZ21MktndfA9BEfolXwg5LS
         kI0LwL0m3G42C2MvcMRUHxUxtDQKnHur1hS3R95s6rp4p4+dsNW+NugxAxFD6+f0jkw0
         R0wv7u/i2+4l45Ax1EVEHOtPxl2x4h7yk50yfjUgoU6u1Uo5p6W1Hi9sALLVjYZn3wbb
         1rUL39UqGgFn4knL5meriWXRe7C2BX4XkImJXgPl0zryDZj4jy4X5MNUFWFUxBNIZxuc
         eTrf+x4UTMP90cY61aCc0MEJQDliKOH5mxWJT7/59K8VY5On90VuaFMYVal64QNdlk4g
         YRbw==
X-Gm-Message-State: AOJu0YzzEI+AK7pe7EbC7Eu7sSri6wk7tDmGVbr8/p2+rx/OUhMbTwNF
	9gFYz+5cBgt4n1EtyjJrLC6sD9yuv1JDZeIGkQJosRgClmo19GaGTbAXaM3bVQ==
X-Gm-Gg: ASbGncvRNboFjihhSUtrk6pzO4NcKznb65tiG+fTYRHYQcU3A3zO56VvLGpAv9BqgvF
	+RKk4ZAZnLbfPDDPHcoUksGJWBOwwkWBOhfi8P/7tqixR1o0giYFRm2FVHgKG+wTz7mXsExrKdA
	dGa4VklSk7X3nOfLI/pLv9yLWIAoWumu/U+lbNkRatdHGGWDEk79Nw2tvgVemgeWZQdCCw3lPXZ
	Q1tLaSq2OocEDVxif3L+ceP0OwOWI7hL+w9ptiwBcS2o/Q8m/2sILE3ORWpAXaAbPO3FpH468UF
	kdbuJ1udSKev7bjsJ6GiEQAfyZiaEZUsx2hWMWKXpM20xhZ3iscWFHo6mpP6D8oowxYekTR7rBQ
	Q7pBWnc4bk+vjhyICHYejAzXkVymt7SxEsf56GFRKUHB4xSMB8MAxdHfpMRUzfUsNTNIKROp3
X-Google-Smtp-Source: AGHT+IHJS2p+0ZjSH2rIBbIBZThwx6bQoH9lf8LKcqGXG0Nk0pkAOQZrm3tvWojiQkTj9fR7to0u5Q==
X-Received: by 2002:a05:651c:1505:b0:336:91c7:535d with SMTP id 38308e7fff4ca-33691c78ea0mr18375571fa.45.1756392858014;
        Thu, 28 Aug 2025 07:54:18 -0700 (PDT)
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
Subject: [PATCH v11 0/4] Enable guest suspend/resume support on ARM via vPSCI
Date: Thu, 28 Aug 2025 17:54:03 +0300
Message-ID: <cover.1756392094.git.mykola_kvach@epam.com>
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
 xen/arch/arm/domain.c                 |  22 +++++
 xen/arch/arm/include/asm/domain.h     |   6 ++
 xen/arch/arm/include/asm/perfc_defn.h |   1 +
 xen/arch/arm/include/asm/psci.h       |   2 +
 xen/arch/arm/include/asm/vpsci.h      |   5 +-
 xen/arch/arm/vpsci.c                  | 114 +++++++++++++++++++++-----
 xen/arch/ppc/stubs.c                  |   5 ++
 xen/arch/riscv/stubs.c                |   5 ++
 xen/arch/x86/domain.c                 |   5 ++
 xen/common/domain.c                   |   9 ++
 xen/include/xen/domain.h              |   2 +
 19 files changed, 173 insertions(+), 35 deletions(-)

-- 
2.48.1


