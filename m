Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF78B29CB2
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 10:50:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1085662.1443964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unvZ3-0005N5-Jh; Mon, 18 Aug 2025 08:50:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1085662.1443964; Mon, 18 Aug 2025 08:50:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unvZ3-0005Kw-GK; Mon, 18 Aug 2025 08:50:01 +0000
Received: by outflank-mailman (input) for mailman id 1085662;
 Mon, 18 Aug 2025 08:49:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HFvU=26=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1unvZ1-0005Kq-OO
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 08:49:59 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5236df53-7c10-11f0-a329-13f23c93f187;
 Mon, 18 Aug 2025 10:49:58 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-55ce526ac04so3694199e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 01:49:58 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef351579sm1571950e87.4.2025.08.18.01.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 01:49:57 -0700 (PDT)
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
X-Inumbo-ID: 5236df53-7c10-11f0-a329-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755506998; x=1756111798; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hW/7VFVj3gFV3bTpR8NW4J9ddwdqSRR2zUWCWCtlG8k=;
        b=UaD8kElSGNQdiZbQBgOeW6oXlaG/6qXEz/NB5qnbaIyX5FXZRY/fU5M7C/d8d4UKRu
         /KGl9CKe7NkxetGYGQf7hXG0AhkXrqwOUPINB5L2ddd+Jc2BqfpetDlJq/TWtMd3Ljhf
         Y9Kg1iLSJ60hd4ZGaRPjvqlxD1FUvN/H6zWIWjP9+WgSXJVpcTAr5e60nJesaFsxvvgi
         CcSpDAuDeU5gEu48ee9gNK3PMRvP6jysqs0VSl7KkxNezkQAYozoIQqtd0sO7gzUHVoB
         LBlxNCAixwbrClYi2HRfKrqfFtwixgv19Lz+NKWunwuWnEPTuDv3KdhEvfMNliGtmU/9
         Ya7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755506998; x=1756111798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hW/7VFVj3gFV3bTpR8NW4J9ddwdqSRR2zUWCWCtlG8k=;
        b=Bebkp/2O0QNK5st2iR2GzQsaYBgT7aA0VrYUlogi7LE7NcETQAIEIUkBIfU69i6Mhj
         wu2qRGpLnaIxdDSf8yIC8l/Rhg+w7LomUNui1KfqQntPXFkSdjuhse5qjNcIPwOV2g6Y
         +/kyqOr4ycCMa3N5Ge4ulwrWYhw4Zi6yAw7g9hi2Frr18BGhX5sdxn0LwGkKhnKhFmYF
         bi4F1iMF5hsMmvnCKhVT1ic9Y4We+YiW+2OG3zycgKViAW1iI+VlZusI3Xig35l6ViL+
         TdF1Lb/OvpqHfH3wJur2LjNnhHfsGWEkndCzwt2qIBgiczx9X+zbpXu0KjcIzO5hkC0a
         DP7g==
X-Gm-Message-State: AOJu0Yy7nL+gwx/Km5mXyoq+pipUxL5jAtEhd2s0v5gH6XXPNhtomLgI
	iijNZ1nng6Mp1tMBGqIhx0M/3Pw2vB2oNDEcO9DRbxRKt/9rSuaPsEA/XINU5w==
X-Gm-Gg: ASbGncsorO37shb2EBPahY7CxQZQdFC3EvbuJNdr2MLMIpBHnBHezf6e4Vz+8NYT9zT
	HfQ6u8dVRmscT4mgS87z96AoHU76+Y0uNM2uZo+IDHS36VSn92XewxNK6geKI5VFOdLOGmbjnLO
	NmPctmUyzH6m7elu+2GejqdbRlq6XGiB3KGEd8gPFJHEbkJlhz9Zy1GayBD3vmXQL4DgiHP5sp/
	imbUVt0N/VjQuReUZmoH5BImx/7TVzEN52vsVQp4Uf79BvN/EBcj1/ZdTwGm47FYl77F0FnHyv5
	v39X4fTRUS43UY7/wg7YSFz/eNwvPTloDHy+1wJ61oLtrDqDAEe2bcs2S/xEkyHfB4AZYOwwkh0
	YDI3WlQddGybb2+Uca6OfU1Q+k4tWVDzb8I/2kol7v36bFLc4VDQtXZQne9C3HPYtucmgROAtUV
	8+UTCKToQ=
X-Google-Smtp-Source: AGHT+IH004jORsTtNpWQSNfLNVA8Fwtmr6rKuVx2zqiCUvCqettieqJJqSTMHcp+BjYSyfqz7v0WDQ==
X-Received: by 2002:a05:6512:118a:b0:55c:e5c3:29c with SMTP id 2adb3069b0e04-55ceebbaf89mr3325010e87.56.1755506997770;
        Mon, 18 Aug 2025 01:49:57 -0700 (PDT)
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
Subject: [PATCH v9 0/4] Enable guest suspend/resume support on ARM via vPSCI
Date: Mon, 18 Aug 2025 11:49:23 +0300
Message-ID: <cover.1755506449.git.mykola_kvach@epam.com>
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

The second part can be found here:
    https://patchew.org/Xen/cover.1754943874.git.mykola._5Fkvach@epam.com/

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
 xen/arch/arm/domain.c                 |  17 +++--
 xen/arch/arm/include/asm/perfc_defn.h |   1 +
 xen/arch/arm/include/asm/psci.h       |   2 +
 xen/arch/arm/include/asm/vpsci.h      |   2 +-
 xen/arch/arm/vpsci.c                  | 101 ++++++++++++++++++++++----
 xen/common/domain.c                   |  31 ++++++--
 xen/include/xen/sched.h               |   6 ++
 15 files changed, 148 insertions(+), 44 deletions(-)

-- 
2.48.1


