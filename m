Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE2CB14A75
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 10:52:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062241.1427885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugg4W-0006FI-4Y; Tue, 29 Jul 2025 08:52:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062241.1427885; Tue, 29 Jul 2025 08:52:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugg4W-0006CA-15; Tue, 29 Jul 2025 08:52:32 +0000
Received: by outflank-mailman (input) for mailman id 1062241;
 Tue, 29 Jul 2025 08:52:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R+Pi=2K=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1ugg4U-0006C0-Id
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 08:52:30 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ba3e343-6c59-11f0-a31e-13f23c93f187;
 Tue, 29 Jul 2025 10:52:29 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-55b73b2f5edso994688e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 01:52:29 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b63375ca4sm1584998e87.124.2025.07.29.01.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jul 2025 01:52:27 -0700 (PDT)
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
X-Inumbo-ID: 5ba3e343-6c59-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753779149; x=1754383949; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oQ1YJGBCM0JRPzKI4sOPDNzb8NC1Inrtbwljq163XV0=;
        b=lRvvs+JgIhifrzudjJl6DBxBk6fnXrL5y1pk+Zm1ko4jO/88YX7TLKWXEFY4XZPP7l
         XFKxFAyzuGL/qPLsze/8TyDE1Im62tjLlEWXRE59we6pGvCthe+QoFQzlyPFfa62KKdg
         5u4rVCylO3TmzSIFGmSJ4H+hy2CGnkvmtfLyST6vXkBeEhkSZOrDC/XTND/cqrPGgpHv
         sz2urOc1yEbQnIqqZpa9MWjLtBHlgtVxfUmv62CpUFNJFGqc5DroZj3xviq/d85jXdGk
         IS9YBKaBshuG09zHi6ZhXVaq7VCtDCrPyS7vP0hqVKlQvKT1wI3TvuMWCw+MzO7vhfUk
         qFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753779149; x=1754383949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oQ1YJGBCM0JRPzKI4sOPDNzb8NC1Inrtbwljq163XV0=;
        b=Oc4BI7Krv5rdmnEc98wLRJs6CLQ6IumEpSW4u5YHHUZE7z+SRmmiFdDCEMHqM8D7BZ
         5iS/Q9GVUvHXRoGmf0qvkg66UflDrv3AeoLeIWFNTdGWPRYO+pEDz8oLU/VMu/SZ5ASQ
         DOpu16ayPLbmth/zhGrt9a8TJtLCGStWZjqq6+ExVxKKA2pUPMKnHU51HB33J0FON4ZX
         EBa28LeicRGwfifqMEBgRb+zy3c5H8csUgoUdA0XGydJwrb+F3tR1Ju3DP7Yi2StH++0
         LAijz+8+6KlhDggtTuzpwaAB7Q7pV5szmBVXcqK7m8DxW1TVhZHHO0KeOjMExx2lUHtK
         /WNA==
X-Gm-Message-State: AOJu0Yz6fsxu2z7VgziBVm8ChOFqetUkFaD1HEDQEwdjyto5xRPwBcLS
	nIjk8khyOCAXUltKrA0CJbRY5oyFi7p1b29TFVLpIMVHP7dkDmw5/Adm+DIM2w==
X-Gm-Gg: ASbGncuMhDOM2kCLu/nOFUXhCCfU3+J0jt+0Oz7x+AnV/7/57fYtnm15c5ouLSPFf5N
	i7qaSThAd+25OERwMX3q8NM0A1ikwFINcYvfRA7/J1v7udb8nguo8470UUZfFXLqphI72GTRpX/
	3eucvtub14tRDNiv5vAptna/Oggb62PgXyiSqK+kWTbpVx858SKTvGgWH5v2asXTWmfQflqZ5Fu
	wDEMHgdqlqaTbyszZ3E6Wl72bEAoQ4DhKf9gy/6LuFs5mwdBoRm64t5LFJZr8MJD4cJMyQdSbhr
	1x5g524EeiEzAZaQawjgw6PpuJl4wVOy6nD2Zq6mwQR5EZc7h26qGFtm8khdZ+cGlf5bmSDF7un
	WKNEpJI1/RqtO3uIXBVo8R8mLbmSOw+Mmb3Jzd+xncNYRDBaNFMPRSUysBP4clw==
X-Google-Smtp-Source: AGHT+IH/dd7EEbZOQ2a+5HVf5hQnmdA/b0wvhpcIS0eZ9PyQY3WlJKKVu6LRRUfz3DIkeV9iKiMMiA==
X-Received: by 2002:a05:6512:234c:b0:558:f96d:f74b with SMTP id 2adb3069b0e04-55b5f48979bmr3960896e87.38.1753779148397;
        Tue, 29 Jul 2025 01:52:28 -0700 (PDT)
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
Subject: [PATCH v7 0/4] Enable guest suspend/resume support on ARM via vPSCI
Date: Tue, 29 Jul 2025 11:52:10 +0300
Message-ID: <cover.1753778926.git.mykola_kvach@epam.com>
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
 xen/arch/arm/domain.c                 |   3 +
 xen/arch/arm/include/asm/perfc_defn.h |   1 +
 xen/arch/arm/include/asm/psci.h       |   2 +
 xen/arch/arm/include/asm/vpsci.h      |   2 +-
 xen/arch/arm/vpsci.c                  | 104 ++++++++++++++++++++++----
 xen/common/domain.c                   |  25 +++++--
 xen/include/xen/sched.h               |   7 ++
 15 files changed, 139 insertions(+), 37 deletions(-)

-- 
2.48.1


