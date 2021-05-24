Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A84038E8D2
	for <lists+xen-devel@lfdr.de>; Mon, 24 May 2021 16:34:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131790.246136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llBei-000624-Ac; Mon, 24 May 2021 14:34:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131790.246136; Mon, 24 May 2021 14:34:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llBei-000604-6w; Mon, 24 May 2021 14:34:08 +0000
Received: by outflank-mailman (input) for mailman id 131790;
 Mon, 24 May 2021 14:34:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SOm5=KT=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1llBeg-0005zC-Cp
 for xen-devel@lists.xenproject.org; Mon, 24 May 2021 14:34:06 +0000
Received: from mail-oi1-x22d.google.com (unknown [2607:f8b0:4864:20::22d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ef3ee336-5f12-4f8c-b3c8-a34df3002263;
 Mon, 24 May 2021 14:34:05 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id d21so27198404oic.11
 for <xen-devel@lists.xenproject.org>; Mon, 24 May 2021 07:34:05 -0700 (PDT)
Received: from localhost.localdomain (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id p22sm2840564oop.7.2021.05.24.07.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 07:34:04 -0700 (PDT)
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
X-Inumbo-ID: ef3ee336-5f12-4f8c-b3c8-a34df3002263
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q1zjNygg3B7WteZ4Lbuck9mxhDDUSA/SZm+5egQkVsA=;
        b=AYpWY6MvjUwqiZfOme1wDIaeSZDRMf8LeXC2CgWsB2DQFV/nTAZkJer1Ow4PLz4qiP
         ZKGskVToy6hyiYcuBMmX0TrYp7DfZYSDU4320eBXZxScjR1qv+yR8Z7NhAlMOdQkJWlI
         EsmJQISeNEjMS1Ue7UmFfeWZAEiO+M/BLGUuKwCb/61mzVQCR9o33WTSIfcNAnWRvDk0
         LzQJ8I7Wk4/7jnMPEhN0FMpfRjNI1Z/QrmzOVUEiM1v2A8tUIBjyKn5anJL5fzUGvTZm
         nKc3SywYILL7y5MxJBJF1JwXUF7eh75b/cG1YN3/R01zq87L9ib6GjaiLyDiTkQPFvjv
         tlcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q1zjNygg3B7WteZ4Lbuck9mxhDDUSA/SZm+5egQkVsA=;
        b=S0kWx0f5/cNEHL+yQObSlQRPGfo0NY1RihtTO2gWCzhYEknhzoNt3QUET8bSx+HHZa
         6ZC9FyX4Wb6nSaAIhoBKFO5QQGQ5H7nsAhGiEidTJ2Ho9NHYot3KinGbBlrTEHkREJBc
         quLmaozlmg6FaV5cCK0dObH9LL44EQQZcYD/KZxUfFjZUv9tTdT8yGeP+9PYZkf65VVC
         MerlM8eluI0nUCwWWQxoB1BkaP5bJTMvP5lGkRVcB73BqPXAadryfoU/qUx1joAVWTRK
         ccUYixMQbtcV6BmSc8PNPj6dNWGbBBaLcP/09MMFVQDlHfPVFX8lIc6g+stid9vRk29G
         5meA==
X-Gm-Message-State: AOAM532N0hzawf6QngZlopK9Xa4sDe3+PDmlgLj4gftSHmiCL6q0PZTE
	Xec7ZI9C5NrbbBJ+drIxC1Bpa4m/0TQzKA==
X-Google-Smtp-Source: ABdhPJzA1mz2bVBRqZO1uu/tfVl5uInLR8dFA7CSAogpdfcg7TRo3KvL5giiQS6eyM3yy4t2T9es5g==
X-Received: by 2002:aca:2b17:: with SMTP id i23mr11116150oik.87.1621866844656;
        Mon, 24 May 2021 07:34:04 -0700 (PDT)
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
Subject: [PATCH v4 0/4] Minimal build for RISCV
Date: Mon, 24 May 2021 08:34:24 -0600
Message-Id: <cover.1621712830.git.connojdavis@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This series introduces a minimal build for RISCV. It is based on Bobby's
previous work from last year[0] rebased onto current Xen.

This series provides the patches necessary to get a minimal build
working. The build is "minimal" in the sense that it only supports
building TARGET=head.o. The arch/riscv/head.S is just a simple while(1).

The first 2 patches are mods to non-RISCV bits that enable building a
config with:

  !CONFIG_HAS_NS16550
  !CONFIG_HAS_PASSTHROUGH

respectively. The third patch adds the make/Kconfig boilerplate
alongside head.S and asm-riscv/config.h (head.S references ENTRY
that is defined in asm-riscv/config.h).

The last adds a docker container for doing the build. To build from the
docker container (after creating it locally), you can run the following:

  $ make XEN_TARGET_ARCH=riscv SUBSYSTEMS=xen -C xen tiny64_defconfig
  $ make XEN_TARGET_ARCH=riscv SUBSYSTEMS=xen -C xen TARGET=head.o

[0] https://lore.kernel.org/xen-devel/cover.1579615303.git.bobbyeshleman@gmail.com/

Thanks,
Connor

--
Changes since v3:
  - Dropped "xen: Fix build when !CONFIG_GRANT_TABLE" since this was
    applied by Jan
  - Adjusted Kconfig condition for building NS16550
  - Use bool rather than bool_t
  - Removed riscv memory map, as this should probably be done later once
    the frametable size is figured out
  - Consolidated 64-bit #defines in asm-riscv/config.h
  - Renamed riscv64_defconfig to tiny64_defconfig, added CONFIG_DEBUG
    and CONFIG_DEBUG_INFO
  - Fixed logic/alignment/whitespace issues in Kconfig files
  - Use upstream archlinux riscv64 cross-compiler packages instead of
    custom built toolchain in docker container

Changes since v2:
  - Reduced number of riscv files added to ease review

Changes since v1:
  - Dropped "xen/sched: Fix build when NR_CPUS == 1" since this was
    fixed for 4.15
  - Moved #ifdef-ary around iommu_enabled to iommu.h
  - Moved struct grant_table declaration above ifdef CONFIG_GRANT_TABLE
    instead of defining an empty struct when !CONFIG_GRANT_TABLE
--
Connor Davis (4):
  xen/char: Default HAS_NS16550 to y only for X86 and ARM
  xen/common: Guard iommu symbols with CONFIG_HAS_PASSTHROUGH
  xen: Add files needed for minimal riscv build
  automation: Add container for riscv64 builds

 automation/build/archlinux/riscv64.dockerfile | 19 ++++++++
 automation/scripts/containerize               |  1 +
 config/riscv.mk                               |  4 ++
 xen/Makefile                                  |  8 +++-
 xen/arch/riscv/Kconfig                        | 47 +++++++++++++++++++
 xen/arch/riscv/Kconfig.debug                  |  0
 xen/arch/riscv/Makefile                       |  0
 xen/arch/riscv/Rules.mk                       |  0
 xen/arch/riscv/arch.mk                        | 14 ++++++
 xen/arch/riscv/asm-offsets.c                  |  0
 xen/arch/riscv/configs/tiny64_defconfig       | 13 +++++
 xen/arch/riscv/head.S                         |  6 +++
 xen/common/memory.c                           | 10 ++++
 xen/drivers/char/Kconfig                      |  1 +
 xen/include/asm-riscv/config.h                | 47 +++++++++++++++++++
 xen/include/xen/iommu.h                       |  8 +++-
 16 files changed, 175 insertions(+), 3 deletions(-)
 create mode 100644 automation/build/archlinux/riscv64.dockerfile
 create mode 100644 config/riscv.mk
 create mode 100644 xen/arch/riscv/Kconfig
 create mode 100644 xen/arch/riscv/Kconfig.debug
 create mode 100644 xen/arch/riscv/Makefile
 create mode 100644 xen/arch/riscv/Rules.mk
 create mode 100644 xen/arch/riscv/arch.mk
 create mode 100644 xen/arch/riscv/asm-offsets.c
 create mode 100644 xen/arch/riscv/configs/tiny64_defconfig
 create mode 100644 xen/arch/riscv/head.S
 create mode 100644 xen/include/asm-riscv/config.h


base-commit: d4fb5f166c2bfbaf9ba0de69da0d411288f437a9
-- 
2.31.1


