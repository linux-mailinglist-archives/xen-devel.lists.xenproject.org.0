Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 559A1B3F989
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 11:04:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105848.1456672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utMvl-0000I5-IH; Tue, 02 Sep 2025 09:03:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105848.1456672; Tue, 02 Sep 2025 09:03:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utMvl-0000FU-Bm; Tue, 02 Sep 2025 09:03:57 +0000
Received: by outflank-mailman (input) for mailman id 1105848;
 Tue, 02 Sep 2025 09:03:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X/no=3N=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1utMvk-0000FD-4y
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 09:03:56 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf157b78-87db-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 11:03:52 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-55f6e0eed29so2657689e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 02:03:52 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-560827aabf5sm524019e87.137.2025.09.02.02.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 02:03:50 -0700 (PDT)
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
X-Inumbo-ID: bf157b78-87db-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756803831; x=1757408631; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mg1UFQy8b4+Jl9em9JGkjavl7PzPMrHRsrQ0Kx7AK2g=;
        b=gIUBXGttowOXKOprZTrglvN9qYzywZUIE+Kj6CsruKJf6WcUsyOCIPodimAIdIbqLS
         EjmbYRqozUaKejuTjkNBtrQ6H6iXrdm/QgeQuX+lvQga/6xZPbl8qc1T1BpT5Df8elvD
         vRmu6ZaK8lL+dLP2rSb6dGo/SQSkVkjYfF76kPSiECqPDqwEa74kq2uaIk/z+07ZiwB9
         IFFFVpwL/Zg6lPKqnUDspMD0fYwzs4WhjPxf1azt3TCiNoV8EUiyEuuchtOpuE7aiH2V
         jqWMOQAAQ5VheHuBC4iHbPIaSoGf27j1Qgn/lK/tSMxh+JSA+6/gEnU3QPVkgg2Gs2J9
         eAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756803831; x=1757408631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mg1UFQy8b4+Jl9em9JGkjavl7PzPMrHRsrQ0Kx7AK2g=;
        b=KjjPFRNqPbJM+IHLYWxKR1ZVolqAnsWvb/oDgtdiZtQKFcy9sqlgA6Zv0gQ/19Q3J5
         cU+GrTngt6l4CbMS7YgxoS4ickHhKXRYzrsfq2ihl09VYptff5f3HdBWCdnNAWosKnN3
         WMkRiiCy8C78+TGQH902sadNmTNJZQ98TSzkcs6yLUrOF9aOo5d8oM1zj3r8B4Gjxo3Y
         0EHqaMPvj2wWyWzfUGAsFz0f+1uj0id4WtZN56flphOea1doPr2ipfooMeYMgSPconq9
         VlHGtxNmhvxYEC3KbU7SWAL5a0aq9AIZiwBfEDa0Zn7eV5wyr74z7f/5+G6thQsxOlcN
         6YBg==
X-Gm-Message-State: AOJu0YxxfZVeYwJjGOURySYAbpqiJwtgBHn8mP1H/XOvNpGL/G06yx2L
	9MFvnmMHK7Rts8F5GJx1kD2mB/MoT0K1/irq6KJuysD1T5ZxrwIS5ExJEFm25xQY
X-Gm-Gg: ASbGnct0HcGXtDaKtWZhYLqpBz7IAFfzbgs5k5IgOyeErbbodBGH616j3NGgT1f4RUe
	mTDfTsSidoC7aO9gvvfPoXuKimF5rai+I+RKKArsQ12UfrXleLauFu+hru3/O0LwjF36gvK3udo
	3s0YSG4Swt26WHe+YXjpMWa0bOkUIOm07YxYUQZRiIb6J6LGF92py1bJl0nZz3hGQrl9p9TFY4T
	ifDrKia9w+lV2g1sp/EgfS1Jshz1IRibIOUnIefii5KyKbrGjeFEghTZ0uuTPHHF1ncIRTeBUXT
	tX/hzg8GxqZdUYKBAA5XrUEALfmOGT0W/KtlLuTj9koVxJajdwjvwtL/ZfP4jnnoWrAzIjywR4j
	LcnRRhq/z4yeLetDRQ3ZSy5xX3hPo4IWSWCM/j8Ty09AYX0t2V0X9c5fuebvAfcd9LzRyxXZr
X-Google-Smtp-Source: AGHT+IE//cHmWTkVqedXGgDeK8sxQBuWl7s9c0VP6A9ciaBmwpc4OyWf+D0ng4OnkDvmYmQ/vQ365g==
X-Received: by 2002:a05:6512:6398:b0:55f:6a38:f6c0 with SMTP id 2adb3069b0e04-55f709c0be8mr2454788e87.42.1756803831093;
        Tue, 02 Sep 2025 02:03:51 -0700 (PDT)
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
Subject: [PATCH v13 0/4] Enable guest suspend/resume support on ARM via vPSCI
Date: Tue,  2 Sep 2025 12:03:44 +0300
Message-ID: <cover.1756803419.git.mykola_kvach@epam.com>
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
    https://patchew.org/Xen/cover.1756763487.git.mykola._5Fkvach@epam.com/
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
 xen/arch/arm/include/asm/suspend.h    |  18 ++++
 xen/arch/arm/include/asm/vpsci.h      |   5 +-
 xen/arch/arm/vpsci.c                  | 116 +++++++++++++++++++++-----
 xen/common/domain.c                   |   9 ++
 xen/include/xen/domain.h              |  11 +++
 17 files changed, 200 insertions(+), 37 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/suspend.h

-- 
2.48.1


