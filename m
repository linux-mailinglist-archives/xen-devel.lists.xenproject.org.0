Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54669381019
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 20:54:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127484.239598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhcwo-0001Tq-7V; Fri, 14 May 2021 18:54:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127484.239598; Fri, 14 May 2021 18:54:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhcwo-0001Rw-2e; Fri, 14 May 2021 18:54:06 +0000
Received: by outflank-mailman (input) for mailman id 127484;
 Fri, 14 May 2021 18:54:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CSkR=KJ=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lhcwm-0001R5-OS
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 18:54:04 +0000
Received: from mail-il1-x133.google.com (unknown [2607:f8b0:4864:20::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a9de6ac-36d1-4f37-9263-88d172cc9fb5;
 Fri, 14 May 2021 18:54:03 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id e14so574849ils.12
 for <xen-devel@lists.xenproject.org>; Fri, 14 May 2021 11:54:03 -0700 (PDT)
Received: from localhost.localdomain (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id d81sm2815190iof.26.2021.05.14.11.54.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 11:54:02 -0700 (PDT)
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
X-Inumbo-ID: 0a9de6ac-36d1-4f37-9263-88d172cc9fb5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R/XW10cmwkhPazydDdamIao3szTmAhbyZrhX27c+PLs=;
        b=ifIY9XbKe4yoa6UXhdaMFtBWfGrjFeXFAR9zLOiY6v0OQIxbvJv1j1qB4RAQ0QdV4n
         SBRndWzcvTBuVMGld03AhSTC4lqgUNZep31NHvsOXU1pRQ1/VcAEBXhBNc5KOhk1qK/Y
         H3rAoZqWw6ncgZcfKkA+6e0i87u8KoWtGlOvxk9hfjPOakwl2JocT1vpIayanPXz9sGX
         RDB4jWM1/vINxEfMsk3lps/Vs1l59SZCVoJL2IhpOSk/rrNPmD/zIulnuL6o5NyzeAV/
         IQZ/a4U4ywhd7gPhvjREqUVR5iHhCIvWETrusGJk4EFnc8l/letOi9v1YmSssnvHmA8z
         23LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R/XW10cmwkhPazydDdamIao3szTmAhbyZrhX27c+PLs=;
        b=khV0P5ZaqCjhGBSYRuO2GLnLjZeBMrXzqKvJTnQlhTQXL0Xa7qPW/uR3BuOfueI+D2
         uoOWsidF2J9gaR2PwKBSJBa5e9HesC0pzPunSWcdVVfFA0kX+fbIFglYNrvT/O6mosOX
         +e+sduE3SyweuqoqEZkSPZUn3EiHLeqya4p08OSeK/aVgwJEIVOvTUel+/3dF0exsaZY
         ztAST1VGne0COYWHoGzUj8qfqSiO1o6iI4nlE2S5pTHXu/HfOJZqbM46bD59tiVdEGAY
         sj3o//Va79DSyAAs46mmCkbkHIaxIFvPT/EOl0S88vbu+bn0cKKBNZSTnI/vHAdMmDGM
         zgUA==
X-Gm-Message-State: AOAM533BomzboMkpQwR7dmIyrRGiYwef/KNAN9vW1zcYvT36tB/cYD1S
	dpaRAfryRQ638X9yinQ41Ii3q5Pt8fSw7w==
X-Google-Smtp-Source: ABdhPJzleuecYy7Ze+QcSJFHDhfQij/pvGegmijCQy8EoHk1R/E5zAvLVCSFrNbj7udveQGiqkPSpQ==
X-Received: by 2002:a05:6e02:ec3:: with SMTP id i3mr32479245ilk.250.1621018443134;
        Fri, 14 May 2021 11:54:03 -0700 (PDT)
From: Connor Davis <connojdavis@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair23@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v3 0/5] Minimal build for RISCV
Date: Fri, 14 May 2021 12:53:20 -0600
Message-Id: <cover.1621017334.git.connojdavis@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This series introduces a minimal build for RISCV. It is based on Bobby's
previous work from last year[0] rebased onto current Xen.

This series provides the patches necessary to get a minimal build
working. The build is "minimal" in the sense that it only supports
building TARGET=head.o. The arch/riscv/head.S is just a simple while(1).

The first 3 patches are mods to non-RISCV bits that enable building a
config with:

  !CONFIG_HAS_NS16550
  !CONFIG_HAS_PASSTHROUGH
  !CONFIG_GRANT_TABLE

respectively. The fourth patch adds the make/Kconfig boilerplate
alongside head.S and asm-riscv/config.h (head.S references ENTRY
that is defined in asm-riscv/config.h).

The last adds a docker container for doing the build. To build from the
docker container (after creating it locally), you can run the following:

  $ make XEN_TARGET_ARCH=riscv64 SUBSYSTEMS=xen -C xen TARGET=head.o

--
Changes since v2:
  - Reduced number of riscv files added to ease review

Changes since v1:
  - Dropped "xen/sched: Fix build when NR_CPUS == 1" since this was
    fixed for 4.15
  - Moved #ifdef-ary around iommu_enabled to iommu.h
  - Moved struct grant_table declaration above ifdef CONFIG_GRANT_TABLE
    instead of defining an empty struct when !CONFIG_GRANT_TABLE

Connor Davis (5):
  xen/char: Default HAS_NS16550 to y only for X86 and ARM
  xen/common: Guard iommu symbols with CONFIG_HAS_PASSTHROUGH
  xen: Fix build when !CONFIG_GRANT_TABLE
  xen: Add files needed for minimal riscv build
  automation: Add container for riscv64 builds

 automation/build/archlinux/riscv64.dockerfile |  33 ++++++
 automation/scripts/containerize               |   1 +
 config/riscv64.mk                             |   5 +
 xen/Makefile                                  |   8 +-
 xen/arch/riscv/Kconfig                        |  52 +++++++++
 xen/arch/riscv/Kconfig.debug                  |   0
 xen/arch/riscv/Makefile                       |   0
 xen/arch/riscv/Rules.mk                       |   0
 xen/arch/riscv/arch.mk                        |  16 +++
 xen/arch/riscv/asm-offsets.c                  |   0
 xen/arch/riscv/configs/riscv64_defconfig      |  12 ++
 xen/arch/riscv/head.S                         |   6 +
 xen/common/memory.c                           |  10 ++
 xen/drivers/char/Kconfig                      |   2 +-
 xen/include/asm-riscv/config.h                | 110 ++++++++++++++++++
 xen/include/xen/grant_table.h                 |   3 +-
 xen/include/xen/iommu.h                       |   8 +-
 17 files changed, 261 insertions(+), 5 deletions(-)
 create mode 100644 automation/build/archlinux/riscv64.dockerfile
 create mode 100644 config/riscv64.mk
 create mode 100644 xen/arch/riscv/Kconfig
 create mode 100644 xen/arch/riscv/Kconfig.debug
 create mode 100644 xen/arch/riscv/Makefile
 create mode 100644 xen/arch/riscv/Rules.mk
 create mode 100644 xen/arch/riscv/arch.mk
 create mode 100644 xen/arch/riscv/asm-offsets.c
 create mode 100644 xen/arch/riscv/configs/riscv64_defconfig
 create mode 100644 xen/arch/riscv/head.S
 create mode 100644 xen/include/asm-riscv/config.h

-- 
2.31.1


