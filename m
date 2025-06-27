Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C29ADAEB56C
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jun 2025 12:52:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1027508.1402146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV6gV-0003Us-CL; Fri, 27 Jun 2025 10:51:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1027508.1402146; Fri, 27 Jun 2025 10:51:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV6gV-0003Sp-6c; Fri, 27 Jun 2025 10:51:55 +0000
Received: by outflank-mailman (input) for mailman id 1027508;
 Fri, 27 Jun 2025 10:51:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=61Re=ZK=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uV6gT-0002k5-1M
 for xen-devel@lists.xenproject.org; Fri, 27 Jun 2025 10:51:53 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b88a0e31-5344-11f0-b894-0df219b8e170;
 Fri, 27 Jun 2025 12:51:46 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-553bcf41440so2070138e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Jun 2025 03:51:46 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32cd2dea1c0sm5235831fa.3.2025.06.27.03.51.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 03:51:44 -0700 (PDT)
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
X-Inumbo-ID: b88a0e31-5344-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751021506; x=1751626306; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Dr8iArT/LE1lmvmXj9BXJT3sgpq7t+Thr/P2BbYrfk=;
        b=jN9rgfwFBMU9uCdyc5t+Ji8+TCNzCgP/TuzOXwZ/2mkEHAtVfLFpJP4/XzswUv8Jmd
         n2d68chMn4s0VJKaDL1BvrQGhSsp3eMVegMRoGG7lHH2uHe19ry0aC6xW7NHhN3GHq0j
         bsEGqBerrHXsBaZ8BL0IlCz4hk96NejCpLbHhO665pUNou1B0glhRyxw1kvk0yoNMxY9
         gXsxbD5PphQNS4nZ/3fxquL3MYGyJgarn9DFAJ8ZQR54CqHWxHX95LBQ17Yw2he8McEK
         H2uQ2azCfVRbfJ021G/ItcBe23Q/lBYgbih4Mgg2xONm8gos6mpF3rGu75O82mxnVvTr
         ycIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751021506; x=1751626306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Dr8iArT/LE1lmvmXj9BXJT3sgpq7t+Thr/P2BbYrfk=;
        b=tRMax5cNrTTxNjezu7YGksGtq5/1Pi5m84eunRb7XEZOVGZTYkw2BLUf72QlZKxVbU
         Y4A7GeiIVLYJyzP21KpQMhwhLISrFVNc6gnlQ78VIhqh/IBO7neIPTamPQhjXnZHrg38
         lyGd0Md8u52nT81RB80+TV+IjsIKZPERrUeb6TbZ+49y8vCOEjMWG0ReE8kLWQMLkrae
         PCyGKvOFJbIUmnHPS6DCM8aRp7NZ0wAoaiBKslQoG/KOmDS70fi2+JtqD1LrbIRGMxWU
         Z+vyz7KtP3wcCVnUxR2UtOkP/dkEZXOX/Q+FMETZ44V0EYpnahGfBwjlvOSrKt1brmr6
         +Fhg==
X-Gm-Message-State: AOJu0Yww2qUCD4HsrECDDNrdIOkWMC4KzahkCeqH0g6GoeQryBznDSyf
	HIfKcbostj+VTpaSm5nvC8FpgLM1h2GGlx5w7xHoz25eRmq1oA+3YgE1mwZRBFFk
X-Gm-Gg: ASbGncvTTujkgh4oXLw/QuTSlxpNEMYJBZVVhacYKs5S1uG4u5KfW9cZSnWygwYXfsf
	JQ2Vmtgj23Yf4YtZeox8IkEeyKIaVmbM1kNcq63TcuBc30yfkUhe4ThqEpYs5yfhZKzJ5WiECj9
	wzCBErv2vdcFL6Di0alchgKYFcoGYqob/P4o2I8sEfIgtXLJtkxI+Kc8FAEpHIvTQeZxe1Ly5aq
	AC9kx2QgblI7PiO42EV89QNYqb5uWQ+i6Zx4I0Vgz+txqIUz30MIl39cZWeS60F4p9bVuBWOO/M
	tovEA2iJJwLF/Vdnj4NrW0PpFSEMw3OU73s7F78nUKlgALWSeezKRZChkgJnyx1P+p+cMxFR4XL
	iAN9RncRmLo3Hu5T64drAmOAD8w==
X-Google-Smtp-Source: AGHT+IHqwxGUVrmU+ZOCc5tjPVo0FIfRGtWSbu0TTR0/cNaRr7kcWmT9ZPSqJS3cDCfNvEqr8zT3EQ==
X-Received: by 2002:a05:6512:b12:b0:554:f79d:ce59 with SMTP id 2adb3069b0e04-5550b9ee228mr913768e87.27.1751021505458;
        Fri, 27 Jun 2025 03:51:45 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v5 0/4] Enable guest suspend/resume support on ARM via vPSCI
Date: Fri, 27 Jun 2025 13:51:29 +0300
Message-ID: <cover.1751020456.git.mykola_kvach@epam.com>
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


Main change in V5:
  - Reverted the logic related to suspending domains. Instead of the standby
    mode introduced in v4, domains now resume execution at the point provided
    during suspend

The rest of the minor changes are described in the changelog of each commit.


Mykola Kvach (4):
  xen/arm: Implement PSCI SYSTEM_SUSPEND call for guests
  tools/xl: allow resume command compilation for arm
  SUPPORT.md: Add entry for guest PSCI SYSTEM_SUSPEND support
  CHANGELOG: Document guest suspend/resume to RAM support on Arm

 CHANGELOG.md                          |  2 +
 SUPPORT.md                            |  7 ++
 tools/include/libxl.h                 |  1 -
 tools/xl/xl.h                         |  2 +-
 tools/xl/xl_cmdtable.c                |  2 +-
 tools/xl/xl_vmcontrol.c               | 12 ++--
 xen/arch/arm/include/asm/perfc_defn.h |  1 +
 xen/arch/arm/include/asm/psci.h       |  2 +
 xen/arch/arm/include/asm/vpsci.h      |  2 +-
 xen/arch/arm/mmu/p2m.c                |  6 +-
 xen/arch/arm/vpsci.c                  | 96 +++++++++++++++++++++++----
 11 files changed, 109 insertions(+), 24 deletions(-)

-- 
2.48.1


