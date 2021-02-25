Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCF432525F
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 16:26:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89815.169580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFIWu-0006fX-5J; Thu, 25 Feb 2021 15:26:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89815.169580; Thu, 25 Feb 2021 15:26:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFIWu-0006em-0e; Thu, 25 Feb 2021 15:26:16 +0000
Received: by outflank-mailman (input) for mailman id 89815;
 Thu, 25 Feb 2021 15:26:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yJgK=H3=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lFIWr-0006Ig-UJ
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 15:26:13 +0000
Received: from mail-oi1-x22f.google.com (unknown [2607:f8b0:4864:20::22f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d7244bbf-df56-4aca-b737-d3d6dbf87f08;
 Thu, 25 Feb 2021 15:25:52 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id a13so6444675oid.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Feb 2021 07:25:52 -0800 (PST)
Received: from localhost.localdomain (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id l4sm1047292ooq.33.2021.02.25.07.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 07:25:46 -0800 (PST)
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
X-Inumbo-ID: d7244bbf-df56-4aca-b737-d3d6dbf87f08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jxV1oAouWd/8cftdD9YIWNtxa9BAEzSaS3HYHAZ9n7k=;
        b=FPDMXmJDygUszxoLuOCNlrK28lNTqViFFXeA0ZgzHrRe0vMa9QsIBJF35QYplkl4k0
         aq2hPWx2bYUA/SqjEDYB/fnMT4eBplPKShoJNUDrIJd0ubpi6cTBoGXkgezY4HURd/BW
         XKg6qiz/1aB0hwjwSjAki6A1nUu5fJbRkk4UWMCNCcCleT3AQjU0dXVeIZ0bllAG50oA
         MSGZvyYHewjouj+MJtdAS6DxDp4LQuj+gEyXypER2heqQmsTRUeC/ZAD9U/IUnkUpo2c
         UXD+Tnw5zE4xqPUFic5G/JH3XupQP57xGObgCm390n6wo9snotkhbo8ybzhJmX66jcm4
         3jXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jxV1oAouWd/8cftdD9YIWNtxa9BAEzSaS3HYHAZ9n7k=;
        b=C9b50dW/UIYisUrqYCogweEEdgHWofof3EEdl4LaayWI7D/5BKAY3YxYj+8QpS49My
         KS/E5fcgiOM3F1QxJm+0lUsClQwgqIegSatdUkBQ+8f4T8QVuh8q/c86Z3dUDbArOJ/U
         yYVpD7gVxM3ilfEuOckHeGa5TnUXfuAVlGWMqyyQNBPBM1921wPpQia+Refl5tLLELIj
         +Jybcng/zgjgDiVWPxdwxu3dMppWF8UQsaBncvadvzmt7+lXvm15xWK2msLSGtIECHd2
         /JU1Dp3jXOUqjamDHp6+n5IuApWOCW6EdiWwR65T+WqL5CVNhi5qsnhyBilX/SU85zSL
         jvEQ==
X-Gm-Message-State: AOAM532NEUikFT+YfdBjjKkw3nvilW4TbqI3BNRCC20/FMH7Ff+lmZoK
	CwocP3yWNr//1GEZfXg57RT5NTWmPSEgo+zV
X-Google-Smtp-Source: ABdhPJzS3WdZA0j6jUhkkWJ7oLhmSrPSDG0oMoeYLDffemXWgyI+2RnZwhmjmLAZLTPOtddziiimzA==
X-Received: by 2002:aca:3887:: with SMTP id f129mr2244058oia.19.1614266746814;
        Thu, 25 Feb 2021 07:25:46 -0800 (PST)
From: Connor Davis <connojdavis@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Dario Faggioli <dfaggioli@suse.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH for-next 0/6] Minimal build for RISCV
Date: Thu, 25 Feb 2021 08:23:59 -0700
Message-Id: <cover.1614265718.git.connojdavis@gmail.com>
X-Mailer: git-send-email 2.27.0
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

The first 4 patches are mods to non-RISCV bits that enable building a
config with:

  !CONFIG_HAS_NS16550
  !CONFIG_HAS_PASSTHROUGH
  NR_CPUS == 1
  !CONFIG_GRANT_TABLE

respectively. The fifth patch adds the RISCV files, and the last patch
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

Connor Davis (6):
  xen/char: Default HAS_NS16550 to y only for X86 and ARM
  xen/common: Guard iommu symbols with CONFIG_HAS_PASSTHROUGH
  xen/sched: Fix build when NR_CPUS == 1
  xen: Fix build when !CONFIG_GRANT_TABLE
  xen: Add files needed for minimal riscv build
  automation: add container for riscv64 builds

 automation/build/archlinux/riscv64.dockerfile |  32 ++
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
 xen/arch/riscv/p2m.c                          | 150 +++++++
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
 xen/common/domain.c                           |   2 +
 xen/common/memory.c                           |  10 +
 xen/common/sched/core.c                       |   2 +-
 xen/common/sysctl.c                           |   2 +
 xen/drivers/char/Kconfig                      |   2 +-
 xen/drivers/char/serial.c                     |   1 +
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
 xen/include/asm-riscv/delay.h                 |  15 +
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
 xen/include/asm-riscv/vm_event.h              |  55 +++
 xen/include/asm-riscv/xenoprof.h              |  12 +
 xen/include/public/arch-riscv.h               | 183 +++++++++
 xen/include/public/arch-riscv/hvm/save.h      |  39 ++
 xen/include/public/hvm/save.h                 |   2 +
 xen/include/public/pmu.h                      |   2 +
 xen/include/public/xen.h                      |   2 +
 xen/include/xen/domain.h                      |   1 +
 xen/include/xen/grant_table.h                 |   2 +
 105 files changed, 5421 insertions(+), 4 deletions(-)
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
2.27.0


