Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5553802B9
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 06:18:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127182.238962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhPGm-0001R5-3M; Fri, 14 May 2021 04:17:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127182.238962; Fri, 14 May 2021 04:17:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhPGm-0001OO-0I; Fri, 14 May 2021 04:17:48 +0000
Received: by outflank-mailman (input) for mailman id 127182;
 Fri, 14 May 2021 04:17:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CSkR=KJ=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lhPGk-0001OI-SF
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 04:17:46 +0000
Received: from mail-io1-xd33.google.com (unknown [2607:f8b0:4864:20::d33])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 87656a00-7770-4f5f-8ce8-5cd577aad3e3;
 Fri, 14 May 2021 04:17:44 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id d24so17097648ios.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 May 2021 21:17:44 -0700 (PDT)
Received: from localhost.localdomain (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id g11sm2401505ilq.38.2021.05.13.21.17.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 21:17:43 -0700 (PDT)
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
X-Inumbo-ID: 87656a00-7770-4f5f-8ce8-5cd577aad3e3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vTOGk9Ujn5QyJxmbDoyws86RnXTyUDZH51yCs4bct4o=;
        b=hjTIh9tkjnIn1yDFr8AyHLkj5SfHQCsv4IvPEYNIud99Pdm9MXwbvrWvny515zTM0W
         XQPgUiVqUDmsbljf81EJinSxbWxkOZd03HrZzo2jXZpziCbk5GxlNL6n1RDiMCJ1IyO8
         YkmD2rgD3vQGmNEisUFV4er/kpy+NWBJZMUZTpfZ1dmfAeqwx9X9GAxNdHIKKFAw2eBv
         4GMF+gSflRgTaD9pnC2QBiAJo7YdVb6jT4CezQMB1Ejqxqu+lvFqWD3iPFax5quKeBcA
         5Mxydvc34VgW8IigZcB2J0R+aSNfowc+GG3piRga84Z98fHY604PQJ2TuMjlULk3Ua7c
         NIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vTOGk9Ujn5QyJxmbDoyws86RnXTyUDZH51yCs4bct4o=;
        b=ea08uSCHYq3Ic/MrjZkCxCfJFsO00CoyB1vc5Dy8G5x+5oy2QQOPlqMcPDBkL2A7Er
         RoENzkOey/4N5+buURp2tw8hHZ1VNKZ08oN7i3zDEo8z38/YuhKWfnKLdcyCQ6z+NUFx
         q+9DBRTGgGADvdixSyczK1Dae85/g9TFHpmnyQciwa9dZmbNyQduitgAi29FS2MZweiz
         bL6R9VJ7Qk1yZssnwQThYL7Z5lCfAq7RBclr/+bRn9PRq9C/KOfVtlaHL6/0UKN2zHM9
         bt9Asn3CMFja9xMk2oRiDz0U82epEC/c4QSrNj2obyaTv96Z61BY1/R4kgygecwyhVNs
         yuog==
X-Gm-Message-State: AOAM533amnXSPwY1j3Q68fxSEcSJksgR4hO9Nr+YknJlD+YWoqz8VG8n
	uY0QJ3Zvx2WSyd1Y82a5CPFcriKEWWVRZg==
X-Google-Smtp-Source: ABdhPJy6Q16nkZLa+RVnWmiLi8Y0JVcflNb9CIxqn8QqUN/wV7ZyB0eaHZ0UOiAlsioVxXwczMN2RQ==
X-Received: by 2002:a5e:a902:: with SMTP id c2mr30568174iod.80.1620965864155;
        Thu, 13 May 2021 21:17:44 -0700 (PDT)
From: Connor Davis <connojdavis@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v2 0/5] Minimal build for RISCV
Date: Thu, 13 May 2021 22:17:07 -0600
Message-Id: <cover.1620965208.git.connojdavis@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This series introduces a minimal build for RISCV. It is based on Bobby's
previous work from last year[0]. I have worked to rebase onto current Xen,
as well as update the various header files borrowed from Linux.

This series provides the patches necessary to get a minimal build
working. The build is "minimal" in the sense that 1) it uses a
minimal config and 2) files, functions, and variables are included if
and only if they are required for a successful build based on the
config. It doesn't run at all, as the functions just have stub
implementations.

My hope is that this can serve as a useful example for future ports as
well as inform the community of exactly what is imposed by common code
onto new architectures.

The first 3 patches are mods to non-RISCV bits that enable building a
config with:

  !CONFIG_HAS_NS16550
  !CONFIG_HAS_PASSTHROUGH
  !CONFIG_GRANT_TABLE

respectively. The fourth patch adds the RISCV files, and the last patch
adds a docker container for doing the build. To build from the docker
container (after creating it locally), you can run the following:

  $ make XEN_TARGET_ARCH=riscv64 SUBSYSTEMS=xen 

The sources taken from Linux are documented in arch/riscv/README.sources.
There were also some files copied from arm:

  asm-arm/softirq.h
  asm-arm/random.h
  asm-arm/nospec.h
  asm-arm/numa.h
  asm-arm/p2m.h
  asm-arm/delay.h
  asm-arm/debugger.h
  asm-arm/desc.h
  asm-arm/guest_access.h
  asm-arm/hardirq.h
  lib/find_next_bit.c

I imagine some of these will want some consolidation, but I put them
under the respective RISCV directories for now.

[0] https://lore.kernel.org/xen-devel/cover.1579615303.git.bobbyeshleman@gmail.com/

Thanks,
Connor

--
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
  automation: add container for riscv64 builds

 automation/build/archlinux/riscv64.dockerfile |  33 ++
 automation/scripts/containerize               |   1 +
 config/riscv64.mk                             |   7 +
 xen/Makefile                                  |   8 +-
 xen/arch/riscv/Kconfig                        |  54 +++
 xen/arch/riscv/Kconfig.debug                  |   0
 xen/arch/riscv/Makefile                       |  57 +++
 xen/arch/riscv/README.source                  |  19 +
 xen/arch/riscv/Rules.mk                       |  13 +
 xen/arch/riscv/arch.mk                        |   7 +
 xen/arch/riscv/configs/riscv64_defconfig      |  12 +
 xen/arch/riscv/delay.c                        |  16 +
 xen/arch/riscv/domain.c                       | 144 +++++++
 xen/arch/riscv/domctl.c                       |  36 ++
 xen/arch/riscv/guestcopy.c                    |  57 +++
 xen/arch/riscv/head.S                         |   6 +
 xen/arch/riscv/irq.c                          |  78 ++++
 xen/arch/riscv/lib/Makefile                   |   1 +
 xen/arch/riscv/lib/find_next_bit.c            | 284 +++++++++++++
 xen/arch/riscv/mm.c                           |  93 +++++
 xen/arch/riscv/p2m.c                          | 144 +++++++
 xen/arch/riscv/percpu.c                       |  17 +
 xen/arch/riscv/platforms/Kconfig              |  31 ++
 xen/arch/riscv/riscv64/asm-offsets.c          |  31 ++
 xen/arch/riscv/setup.c                        |  27 ++
 xen/arch/riscv/shutdown.c                     |  28 ++
 xen/arch/riscv/smp.c                          |  35 ++
 xen/arch/riscv/smpboot.c                      |  34 ++
 xen/arch/riscv/sysctl.c                       |  33 ++
 xen/arch/riscv/time.c                         |  35 ++
 xen/arch/riscv/traps.c                        |  35 ++
 xen/arch/riscv/vm_event.c                     |  39 ++
 xen/arch/riscv/xen.lds.S                      | 113 ++++++
 xen/common/memory.c                           |  10 +
 xen/drivers/char/Kconfig                      |   2 +-
 xen/include/asm-riscv/altp2m.h                |  39 ++
 xen/include/asm-riscv/asm.h                   |  77 ++++
 xen/include/asm-riscv/asm_defns.h             |  24 ++
 xen/include/asm-riscv/atomic.h                | 204 ++++++++++
 xen/include/asm-riscv/bitops.h                | 331 +++++++++++++++
 xen/include/asm-riscv/bug.h                   |  54 +++
 xen/include/asm-riscv/byteorder.h             |  16 +
 xen/include/asm-riscv/cache.h                 |  24 ++
 xen/include/asm-riscv/cmpxchg.h               | 382 ++++++++++++++++++
 xen/include/asm-riscv/compiler_types.h        |  32 ++
 xen/include/asm-riscv/config.h                | 110 +++++
 xen/include/asm-riscv/cpufeature.h            |  17 +
 xen/include/asm-riscv/csr.h                   | 219 ++++++++++
 xen/include/asm-riscv/current.h               |  47 +++
 xen/include/asm-riscv/debugger.h              |  15 +
 xen/include/asm-riscv/delay.h                 |  17 +
 xen/include/asm-riscv/desc.h                  |  12 +
 xen/include/asm-riscv/device.h                |  15 +
 xen/include/asm-riscv/div64.h                 |  23 ++
 xen/include/asm-riscv/domain.h                |  50 +++
 xen/include/asm-riscv/event.h                 |  42 ++
 xen/include/asm-riscv/fence.h                 |  12 +
 xen/include/asm-riscv/flushtlb.h              |  34 ++
 xen/include/asm-riscv/grant_table.h           |  12 +
 xen/include/asm-riscv/guest_access.h          |  41 ++
 xen/include/asm-riscv/guest_atomics.h         |  60 +++
 xen/include/asm-riscv/hardirq.h               |  27 ++
 xen/include/asm-riscv/hypercall.h             |  12 +
 xen/include/asm-riscv/init.h                  |  42 ++
 xen/include/asm-riscv/io.h                    | 283 +++++++++++++
 xen/include/asm-riscv/iocap.h                 |  13 +
 xen/include/asm-riscv/iommu.h                 |  46 +++
 xen/include/asm-riscv/irq.h                   |  58 +++
 xen/include/asm-riscv/mem_access.h            |   4 +
 xen/include/asm-riscv/mm.h                    | 246 +++++++++++
 xen/include/asm-riscv/monitor.h               |  65 +++
 xen/include/asm-riscv/nospec.h                |  25 ++
 xen/include/asm-riscv/numa.h                  |  41 ++
 xen/include/asm-riscv/p2m.h                   | 218 ++++++++++
 xen/include/asm-riscv/page-bits.h             |  11 +
 xen/include/asm-riscv/page.h                  |  73 ++++
 xen/include/asm-riscv/paging.h                |  15 +
 xen/include/asm-riscv/pci.h                   |  31 ++
 xen/include/asm-riscv/percpu.h                |  33 ++
 xen/include/asm-riscv/processor.h             |  59 +++
 xen/include/asm-riscv/random.h                |   9 +
 xen/include/asm-riscv/regs.h                  |  23 ++
 xen/include/asm-riscv/setup.h                 |  14 +
 xen/include/asm-riscv/smp.h                   |  46 +++
 xen/include/asm-riscv/softirq.h               |  16 +
 xen/include/asm-riscv/spinlock.h              |  12 +
 xen/include/asm-riscv/string.h                |  28 ++
 xen/include/asm-riscv/sysregs.h               |  16 +
 xen/include/asm-riscv/system.h                |  99 +++++
 xen/include/asm-riscv/time.h                  |  31 ++
 xen/include/asm-riscv/trace.h                 |  12 +
 xen/include/asm-riscv/types.h                 |  60 +++
 xen/include/asm-riscv/vm_event.h              |  60 +++
 xen/include/asm-riscv/xenoprof.h              |  12 +
 xen/include/public/arch-riscv.h               | 134 ++++++
 xen/include/public/arch-riscv/hvm/save.h      |  39 ++
 xen/include/public/hvm/save.h                 |   2 +
 xen/include/public/pmu.h                      |   2 +
 xen/include/public/xen.h                      |   2 +
 xen/include/xen/domain.h                      |   1 +
 xen/include/xen/grant_table.h                 |   3 +-
 xen/include/xen/iommu.h                       |   8 +-
 102 files changed, 5375 insertions(+), 5 deletions(-)
 create mode 100644 automation/build/archlinux/riscv64.dockerfile
 create mode 100644 config/riscv64.mk
 create mode 100644 xen/arch/riscv/Kconfig
 create mode 100644 xen/arch/riscv/Kconfig.debug
 create mode 100644 xen/arch/riscv/Makefile
 create mode 100644 xen/arch/riscv/README.source
 create mode 100644 xen/arch/riscv/Rules.mk
 create mode 100644 xen/arch/riscv/arch.mk
 create mode 100644 xen/arch/riscv/configs/riscv64_defconfig
 create mode 100644 xen/arch/riscv/delay.c
 create mode 100644 xen/arch/riscv/domain.c
 create mode 100644 xen/arch/riscv/domctl.c
 create mode 100644 xen/arch/riscv/guestcopy.c
 create mode 100644 xen/arch/riscv/head.S
 create mode 100644 xen/arch/riscv/irq.c
 create mode 100644 xen/arch/riscv/lib/Makefile
 create mode 100644 xen/arch/riscv/lib/find_next_bit.c
 create mode 100644 xen/arch/riscv/mm.c
 create mode 100644 xen/arch/riscv/p2m.c
 create mode 100644 xen/arch/riscv/percpu.c
 create mode 100644 xen/arch/riscv/platforms/Kconfig
 create mode 100644 xen/arch/riscv/riscv64/asm-offsets.c
 create mode 100644 xen/arch/riscv/setup.c
 create mode 100644 xen/arch/riscv/shutdown.c
 create mode 100644 xen/arch/riscv/smp.c
 create mode 100644 xen/arch/riscv/smpboot.c
 create mode 100644 xen/arch/riscv/sysctl.c
 create mode 100644 xen/arch/riscv/time.c
 create mode 100644 xen/arch/riscv/traps.c
 create mode 100644 xen/arch/riscv/vm_event.c
 create mode 100644 xen/arch/riscv/xen.lds.S
 create mode 100644 xen/include/asm-riscv/altp2m.h
 create mode 100644 xen/include/asm-riscv/asm.h
 create mode 100644 xen/include/asm-riscv/asm_defns.h
 create mode 100644 xen/include/asm-riscv/atomic.h
 create mode 100644 xen/include/asm-riscv/bitops.h
 create mode 100644 xen/include/asm-riscv/bug.h
 create mode 100644 xen/include/asm-riscv/byteorder.h
 create mode 100644 xen/include/asm-riscv/cache.h
 create mode 100644 xen/include/asm-riscv/cmpxchg.h
 create mode 100644 xen/include/asm-riscv/compiler_types.h
 create mode 100644 xen/include/asm-riscv/config.h
 create mode 100644 xen/include/asm-riscv/cpufeature.h
 create mode 100644 xen/include/asm-riscv/csr.h
 create mode 100644 xen/include/asm-riscv/current.h
 create mode 100644 xen/include/asm-riscv/debugger.h
 create mode 100644 xen/include/asm-riscv/delay.h
 create mode 100644 xen/include/asm-riscv/desc.h
 create mode 100644 xen/include/asm-riscv/device.h
 create mode 100644 xen/include/asm-riscv/div64.h
 create mode 100644 xen/include/asm-riscv/domain.h
 create mode 100644 xen/include/asm-riscv/event.h
 create mode 100644 xen/include/asm-riscv/fence.h
 create mode 100644 xen/include/asm-riscv/flushtlb.h
 create mode 100644 xen/include/asm-riscv/grant_table.h
 create mode 100644 xen/include/asm-riscv/guest_access.h
 create mode 100644 xen/include/asm-riscv/guest_atomics.h
 create mode 100644 xen/include/asm-riscv/hardirq.h
 create mode 100644 xen/include/asm-riscv/hypercall.h
 create mode 100644 xen/include/asm-riscv/init.h
 create mode 100644 xen/include/asm-riscv/io.h
 create mode 100644 xen/include/asm-riscv/iocap.h
 create mode 100644 xen/include/asm-riscv/iommu.h
 create mode 100644 xen/include/asm-riscv/irq.h
 create mode 100644 xen/include/asm-riscv/mem_access.h
 create mode 100644 xen/include/asm-riscv/mm.h
 create mode 100644 xen/include/asm-riscv/monitor.h
 create mode 100644 xen/include/asm-riscv/nospec.h
 create mode 100644 xen/include/asm-riscv/numa.h
 create mode 100644 xen/include/asm-riscv/p2m.h
 create mode 100644 xen/include/asm-riscv/page-bits.h
 create mode 100644 xen/include/asm-riscv/page.h
 create mode 100644 xen/include/asm-riscv/paging.h
 create mode 100644 xen/include/asm-riscv/pci.h
 create mode 100644 xen/include/asm-riscv/percpu.h
 create mode 100644 xen/include/asm-riscv/processor.h
 create mode 100644 xen/include/asm-riscv/random.h
 create mode 100644 xen/include/asm-riscv/regs.h
 create mode 100644 xen/include/asm-riscv/setup.h
 create mode 100644 xen/include/asm-riscv/smp.h
 create mode 100644 xen/include/asm-riscv/softirq.h
 create mode 100644 xen/include/asm-riscv/spinlock.h
 create mode 100644 xen/include/asm-riscv/string.h
 create mode 100644 xen/include/asm-riscv/sysregs.h
 create mode 100644 xen/include/asm-riscv/system.h
 create mode 100644 xen/include/asm-riscv/time.h
 create mode 100644 xen/include/asm-riscv/trace.h
 create mode 100644 xen/include/asm-riscv/types.h
 create mode 100644 xen/include/asm-riscv/vm_event.h
 create mode 100644 xen/include/asm-riscv/xenoprof.h
 create mode 100644 xen/include/public/arch-riscv.h
 create mode 100644 xen/include/public/arch-riscv/hvm/save.h

-- 
2.31.1


