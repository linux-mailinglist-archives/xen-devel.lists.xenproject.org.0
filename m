Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 261A6B106A9
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 11:42:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055529.1423885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uesSc-0007pg-Vo; Thu, 24 Jul 2025 09:41:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055529.1423885; Thu, 24 Jul 2025 09:41:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uesSc-0007nc-SY; Thu, 24 Jul 2025 09:41:58 +0000
Received: by outflank-mailman (input) for mailman id 1055529;
 Thu, 24 Jul 2025 09:41:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t79f=2F=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uesSb-0007nR-40
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 09:41:57 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e90fe10-6872-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 11:41:54 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-32ce252c3acso3629741fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 02:41:54 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-331e08e98aesm2418261fa.54.2025.07.24.02.41.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 02:41:52 -0700 (PDT)
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
X-Inumbo-ID: 6e90fe10-6872-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753350113; x=1753954913; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=237uHaylDH9dH1IDMpJ3vqHe1NIwO5jPVg+Y2GYdfIQ=;
        b=CY6RDCkblAim3MwROFhKAmh2UKZ9YEasX/xlmc/lSpYfnYk2tCZwmJqRKGgGAhsdFE
         Ur4g1fOtwuvCzdaSXHurpaMVoIicSNX2YUC8pLtRu3kaIEKWpA39pl1t608VUixHKtNW
         2+Dsgreq1SjX1/M6sJt5svDE0hGOmfxD0SlF3E5Wdj64ygCHBAA6Bk4/12peqA5zeRog
         I1OvkROTM81XlKibSGiBxMTKfoT9qwXMC30VXLOeE1MI0eN+idY6V7TdYvnkSCMmPUVD
         wr0QG8FucjBJVNw66YZpZdV6Etob3j5kPO3jsUJgTb8CvYzgJiwrp3z74M6xNg6jlHme
         fcEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753350113; x=1753954913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=237uHaylDH9dH1IDMpJ3vqHe1NIwO5jPVg+Y2GYdfIQ=;
        b=Zctl+uqyprpnNTcbC0wZIPtGOvvsXtEt3ERiw9hU9qp3VL5FrmmUF5cvQAjLnOTr5c
         OUyYHMhO9ON1T+vVEIzbm6mdHG7Px7SgJdPGdnplg99DlYxdS41CvHiO0TSlszw7ZgLq
         9bnrD7Wp8Akdagx+G6foaz2YZzDv5HclkNsb4BCfwjHpm1Uq6Pz6L+QsSf20Bvndg+MB
         5pIbFTRyAq42OKJu7VjjSEKVL7Mhp/ZcIAaL+PUUNkZnyEB8MVzGMM3+19/h5E1pznxt
         1lV6mkozAJ0C+4mfZCj2lkVYba64Wa9JcF3+gkGdxfO9QDczEzmPOCltxUdegSkvGnBR
         0ynQ==
X-Gm-Message-State: AOJu0Yy8qsNhUwD4SC72f7NVedbeYwnaG7M5uti4Z73sabKwOuBSf1d7
	NkfC/hzjzfYN/RdSIzJFXCzkLjbTyihzfbrCKA+o1AAJ/it3P/WfQ6QLA0plbw==
X-Gm-Gg: ASbGncsHnVDnIljqQ5/4vuFGA12M/Clv4qky/4mkYoeD92CwgUriWjw3S/WUP72GKf2
	CqqeBDahSA+/nSnuCM7l9XQhSj257NCKVoDhNL26PWeF1zvr6ejnF3xcnroHLMmvArneitzr1K+
	fKXjkOksItYyPE+wmojBF0PNe31Ze0JR10w9HuhxvlwYN80sUo2L5HA/0/87ugx/mCCL6Mv86ur
	e53iXpEgc6aCrILtownvOn11zWavqM/r/96kuFHtX7+lmEy/JejfJIOSrK7LmzoYbwmIShGM+k/
	O68bEAtji0qPUBPFVhfFGlmiUREDoO8OSVzXgJDyVnIwBEHOEb/l6EdO6pnigISlB4XCEmlwjVO
	joeDTsX21GG/ArgKXOiomP8S75ltZ10V4etLomsdHmgeI6gPJTCIDqPmj6N55qA==
X-Google-Smtp-Source: AGHT+IHS5kcZ/uv/i8BZ0RsDSiM/o0SIeNNKGh6A6THdod+Va+O+MABTJX20WmL9PDfIlgCEG03Yew==
X-Received: by 2002:a2e:a592:0:b0:32a:8764:ecf1 with SMTP id 38308e7fff4ca-330dfb87c6cmr17350961fa.4.1753350112615;
        Thu, 24 Jul 2025 02:41:52 -0700 (PDT)
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
Subject: [PATCH v6 0/4] Enable guest suspend/resume support on ARM via vPSCI
Date: Thu, 24 Jul 2025 12:40:55 +0300
Message-ID: <cover.1753349108.git.mykola_kvach@epam.com>
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
Previous versions of this patch series:
  V1: https://lists.xenproject.org/archives/html/xen-devel/2018-11/msg01093.html
  V2: https://marc.info/?l=xen-devel&m=166514782207736&w=2
  V3: https://lists.xenproject.org/archives/html/xen-devel/2025-03/msg00168.html


This is the first part of previous patch series and originally consist only
with necessary changes needed for guest domain suspend.

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

Mykola Kvach (4):
  xen/arm: Implement PSCI SYSTEM_SUSPEND call for guests
  tools/xl: Allow compilation of 'xl resume' command on Arm
  SUPPORT.md: Document PSCI SYSTEM_SUSPEND support for guests
  CHANGELOG: Document guest suspend/resume to RAM support on Arm

 CHANGELOG.md                          |  2 +
 SUPPORT.md                            |  5 +-
 tools/include/libxl.h                 |  5 +-
 tools/xl/xl.h                         | 10 +--
 tools/xl/xl_cmdtable.c                |  8 +--
 tools/xl/xl_migrate.c                 |  4 +-
 tools/xl/xl_saverestore.c             |  4 +-
 tools/xl/xl_vmcontrol.c               | 14 ++---
 xen/arch/arm/domain.c                 |  4 ++
 xen/arch/arm/include/asm/perfc_defn.h |  1 +
 xen/arch/arm/include/asm/psci.h       |  2 +
 xen/arch/arm/include/asm/vpsci.h      |  2 +-
 xen/arch/arm/vpsci.c                  | 90 +++++++++++++++++++++++----
 xen/common/domain.c                   | 30 ++++++---
 xen/include/xen/sched.h               |  2 +
 15 files changed, 137 insertions(+), 46 deletions(-)

-- 
2.48.1


