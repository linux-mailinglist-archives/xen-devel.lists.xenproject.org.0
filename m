Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CD8C6A5B9
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 16:40:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165055.1491878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLNo5-0004e0-Bh; Tue, 18 Nov 2025 15:39:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165055.1491878; Tue, 18 Nov 2025 15:39:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLNo5-0004c1-8W; Tue, 18 Nov 2025 15:39:49 +0000
Received: by outflank-mailman (input) for mailman id 1165055;
 Tue, 18 Nov 2025 15:39:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n9C8=52=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vLNo3-0004bv-7Y
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 15:39:47 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cef8b762-c494-11f0-9d18-b5c5bf9af7f9;
 Tue, 18 Nov 2025 16:39:45 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b735ce67d1dso726415766b.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Nov 2025 07:39:45 -0800 (PST)
Received: from EPUAKYIW02F7.. (pool185-5-253-54.as6723.net. [185.5.253.54])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fd80d27sm1391385266b.40.2025.11.18.07.39.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 07:39:43 -0800 (PST)
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
X-Inumbo-ID: cef8b762-c494-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763480385; x=1764085185; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PUBxZxu1lwBqJ05KLC6IWQDKtIZoU6QUJa/RF+r/zco=;
        b=M/kdnscTu0aLB731siignaUJ4e42MbaBkJGVFlQdlF36SWSgiqmaEK8kCyD5Necd62
         v7r3f/8LyQ6eBO4ZntkG/zPVCjTL1UbTUX+HKiu/wWZT2kSfgugaPvqXx12qHhtiqZsR
         yHGm/m9L+creFsQKQ3d4U85cITzIWqWpwAtfWg1OjJe3kuiIIW3YCVhPyC21bSqHYpOe
         3dodcN6xTxKQKT2p2klZn7mfnFSlc3umDPRjWfKMi32zYDnZrQEFFQUBGVD8kQ4Lu6+G
         FIEFOzIuyRTEA2vgwX4pi1QzX/g5agkJ+IPfm89ooxENX4AF4rhzjcrKxAVFxUsBv1u9
         KQFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763480385; x=1764085185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PUBxZxu1lwBqJ05KLC6IWQDKtIZoU6QUJa/RF+r/zco=;
        b=WE3fvnKWznKa4qBuldwl3oJ08+M6iel8NaNIboNrtUlhksAt/lFjYiIcE/b2e01tgH
         lRHTqxoq1kwyWSck0prtpt9dUNk5JgoTYBl+fJxPuvI2kpbk7d2iAcuEcz3SEjEt7927
         c2kBDJ2KuBVQYQzcown3/9uccoS/eDKVYIh0ceiD8rhjk8gVsAFRd/ad3uKALd+qp7Bt
         EtvgKlJIGdd9RDXAAvmtzDFgDcfXJPCfk8s/Hz9s/1kNh2urSLthj61qlk8oGIfiq3C1
         mYli7E885JC7KK0b936e7amuIL9Z0TpG6sIFcmiSiH7KKUkIjawr9ucPazvR2qqYVo6k
         Td7g==
X-Gm-Message-State: AOJu0Yz/wx1irmzHoalEIYTBhbR8iuuFiqbVH6LXyv4tsqo9qZ3mGSnr
	Aq+WWr9UCsRzO0Utl1F/V3nAprvTWh4dq3Sw9ABbpLPb4zNSkUpVgEfFkKNG6ASEsVw=
X-Gm-Gg: ASbGncv/LiS5NVZRubtDGWVNOceqXPgw6mbnToJjkMsYneZVaZzEXIA5MklrIqkAf0h
	GrsS3/6aHOHnmASFg2k2L6MI5DqaRs8rQyQ8SR/7y4iOdBjptfrkmPLz0fyRNy+jUHn+qU4n9WN
	a8jv4mf4RnNMiCOqDMRw1O5gBBJthlXjhAoYsac1QBzNlQCIIBoTOaX6JBh4jiM7swvgYPQ7gvy
	Wahh6YKq/BBec9CWK231malUOFfzecLtd6OSEiL1JChK6oPRCsAukh4eoAvcCO7xK8vS29CAqAK
	qSCU8vEFGdvDh5Mqtc8JcDXlXyX4nkUWpIZt1Iibhkk4Rw6+7bCEzFyPWkhH/FnpIe8k3h+u2uI
	cWuyzSeOEE3ljeH6fWckUS7lt9c5EDoxruO1rf5j4kMVOhyDevtRcZDTJOi0X5JcrRjNAJgNBk3
	U7O79XSyMl5Nq4blD8i68i5PzGddP1ha5WbFk2E9T6kmY=
X-Google-Smtp-Source: AGHT+IHyRtLYTCTV1H0wye6KCJJiNoj0Pt2IF3N8dBdl7UqPFvTmJYle74n5Jg/3qsfd3AXsu6dzfA==
X-Received: by 2002:a17:906:d551:b0:b50:b539:8be6 with SMTP id a640c23a62f3a-b736795c7f0mr1331632466b.43.1763480384556;
        Tue, 18 Nov 2025 07:39:44 -0800 (PST)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
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
Subject: [PATCH v14 0/4] Enable guest suspend/resume support on ARM via vPSCI
Date: Tue, 18 Nov 2025 17:37:27 +0200
Message-ID: <cover.1763479083.git.xakep.amatop@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series introduces the initial support for guest suspend
and resume on ARM platforms using the PSCI SYSTEM_SUSPEND interface. The main
goal is to allow ARM guests to request suspension using PSCI and be resumed
by the control domain (e.g., via "xl resume").


Background

The PSCI SYSTEM_SUSPEND call is part of the PSCI v1.0+ specification and is
used by guests to enter the deepest possible power state. On Xen/ARM, we
emulate this interface in the virtual PSCI (vPSCI) layer for guests.

This series includes:

1. A new vPSCI implementation of the PSCI SYSTEM_SUSPEND function for guests
2. Documentation updates to SUPPORT.md to reflect PSCI and vPSCI support status
3. Enabling "xl resume" command compilation for ARM, which was previously disabled


Usage

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

Changes introduced in v14:
- move arch_domain_resume() to its own header, drop typeof usage for
  the resume context, move resume error prints into arch_domain_resume(),
  and address review nits
- move the suspend-to-RAM changelog entry to the 4.22 section
- commit message tweaks.

Mykola Kvach (4):
  xen/arm: Implement PSCI SYSTEM_SUSPEND call for guests
  tools/xl: Allow compilation of 'xl resume' command on Arm
  SUPPORT.md: Document PSCI SYSTEM_SUSPEND support for guests
  CHANGELOG: Document guest suspend/resume to RAM support on Arm

 CHANGELOG.md                          |   4 +
 SUPPORT.md                            |   5 +-
 tools/include/libxl.h                 |   1 -
 tools/xl/xl.h                         |   4 +-
 tools/xl/xl_cmdtable.c                |   4 +-
 tools/xl/xl_migrate.c                 |   2 +-
 tools/xl/xl_saverestore.c             |   2 +-
 tools/xl/xl_vmcontrol.c               |  12 +--
 xen/arch/arm/domain.c                 |  41 +++++++++
 xen/arch/arm/include/asm/domain.h     |   2 +
 xen/arch/arm/include/asm/perfc_defn.h |   1 +
 xen/arch/arm/include/asm/psci.h       |   2 +
 xen/arch/arm/include/asm/suspend.h    |  24 ++++++
 xen/arch/arm/include/asm/vpsci.h      |   5 +-
 xen/arch/arm/vpsci.c                  | 116 +++++++++++++++++++++-----
 xen/common/domain.c                   |   5 ++
 xen/include/xen/suspend.h             |  15 ++++
 17 files changed, 208 insertions(+), 37 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/suspend.h
 create mode 100644 xen/include/xen/suspend.h

-- 
2.43.0

