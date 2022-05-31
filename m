Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74431538BD1
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 09:09:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339119.563939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvvzi-0000hq-49; Tue, 31 May 2022 07:08:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339119.563939; Tue, 31 May 2022 07:08:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvvzi-0000g3-0d; Tue, 31 May 2022 07:08:46 +0000
Received: by outflank-mailman (input) for mailman id 339119;
 Tue, 31 May 2022 06:57:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rfOh=WH=gmail.com=xiexun162534@srs-se1.protection.inumbo.net>)
 id 1nvvoj-0007zl-9G
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 06:57:25 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8c71bdf-e0ae-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 08:57:17 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id t13so17293977wrg.9
 for <xen-devel@lists.xenproject.org>; Mon, 30 May 2022 23:57:22 -0700 (PDT)
Received: from localhost ([2a03:b0c0:1:d0::944:e002])
 by smtp.gmail.com with ESMTPSA id
 n1-20020adfe341000000b0020e68dd2598sm10560448wrj.97.2022.05.30.23.57.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 23:57:21 -0700 (PDT)
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
X-Inumbo-ID: e8c71bdf-e0ae-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c0bMw9AJl7TeQCQj406kPF3Bu90A+j+TU6LdtIz6Az0=;
        b=Vsq7qAY0e3aDExFl4jXCTLXFiB0qDqvkz3reOxmcg3bJLmI0js2GukBlY3ZXncaOOM
         hcPiFXtzrDtV0213wwLX5MeemxJ0ZCxIHg7oBogJeZ+TxFI3twbxI+mW4sFQwXbsHX4U
         j3yew6/4Fq4HoGAVVj0e3BV5M+oursZvro68FM6wbkLo6767vJ9Yamk+HHfS10hLs40t
         Dy/j66TbiAw8gtI4g2NaGcXKxVcnopJ8oM+IaERO0u8q4QzyZ/pxyN5TD53b3jGx0FTd
         kkl8L1hSPe9G9S5XJV5QmYwHjnSMN4tf/wXmJNyoYxzqhEDvaifVYc8klej/74JUHtH6
         fKvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c0bMw9AJl7TeQCQj406kPF3Bu90A+j+TU6LdtIz6Az0=;
        b=KqSDXq3jdV/C6MPPcywmL3mJa0B2snQvOmWyRaFyQT24yoDRPa7IJ2fFshYw2WbL94
         an3UfS94T0EF8oS1R4vIzunqXvm5cMOtzg6CRMg6deDha9taZYTZEvciLRpU9zYMsir1
         O7CeNoBu1aVlFESrGzqjAudUohDH93YGwGoaGbi/+6eJtOqzfHaC0AynaamQEPJjs+05
         WoxVIGSbM55f1RwPs7RVmQdnWCZdDt3mCbsR2fj9Xdsh8omet/bBwOxD8bXSijQ2hivb
         tfhuPGCwIg/mWlylJnRgdkIZXEcf9VUvEnEVvLkHcuPzNXnZfFj8v8MESNd4PLF42D2S
         CfDA==
X-Gm-Message-State: AOAM533oQAS7XrEmcrkwmTsYfxpliboRhYY07v5ZzBjrSr6tD7KuO26i
	lLOUfdllhS3ProseVW3/pc7loB6woerJzQ==
X-Google-Smtp-Source: ABdhPJzMQwNXXt38e3xEdAE/qGE5Qqp7Dx/onDpLZUii6xIw5i8FYV3hsvLz7w9QNLOpBxr8UCPWCw==
X-Received: by 2002:a05:6000:344:b0:210:2a22:9ca4 with SMTP id e4-20020a056000034400b002102a229ca4mr11155744wre.276.1653980241992;
        Mon, 30 May 2022 23:57:21 -0700 (PDT)
From: Xie Xun <xiexun162534@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Xie Xun <xiexun162534@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Juergen Gross <jgross@suse.com>
Subject: [RFC PATCH 0/6] xen/riscv: Add necessary files for RISC-V Xen build.
Date: Tue, 31 May 2022 14:57:06 +0800
Message-Id: <cover.1653977696.git.xiexun162534@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


Hello everyone,

My name is Xie Xun and I am a graduate student in computer science. I
spend some time porting Xen to RISV-V based on Bobby's work. Now Xen
can use device tree to initialize memory and load guest kernel. Timer
interrupt is also enabled for both xen and guest kernel.

This patch series is the first part of the work. It only adds
necessary files for a successful xen build. The only thing xen will do
is printing a message.

There are some problems though. The first patch of this series is
very large, but it seems most of the code is necessary for building
xen. I am trying my best to remove some code but it still has more
than 8000 lines of code.

Looking forward to your feedback.


Xen can be built with:

$ make XEN_TARGET_ARCH=riscv64 CROSS_COMPILE=riscv64-linux-gnu- tiny64_defconfig
$ make XEN_TARGET_ARCH=riscv64 CROSS_COMPILE=riscv64-linux-gnu-

Run with Qemu:
$ qemu-system-riscv64 -machine virt -m 1G -kernel xen

Bobby and Alistair's patch:
https://lists.xenproject.org/archives/html/xen-devel/2020-01/msg01731.html

This patch series is based on Bobby's Repo:
https://gitlab.com/xen-on-risc-v/xen/-/tree/riscv-rebase

This patch series is available in:
https://github.com/xiexun162534/xen/tree/riscv-patch

My latest work:
https://github.com/xiexun162534/xen/tree/riscv-port

Xie Xun (6):
  xen/riscv: Add necessary headers and definitions to build xen.
  xen/riscv: Add early page table setup code.
  xen/riscv: Add head.S
  xen/riscv: Add sbi.c, sbi.h
  xen/riscv: Add early_printk
  xen/riscv: Print "xen start" in start_xen using early_printk.

 xen/arch/riscv/Kconfig                      |   2 +
 xen/arch/riscv/Makefile                     |  53 ++
 xen/arch/riscv/Rules.mk                     |  57 ++
 xen/arch/riscv/delay.c                      |  14 +
 xen/arch/riscv/domain.c                     | 191 ++++
 xen/arch/riscv/domctl.c                     |  52 ++
 xen/arch/riscv/early_printk.c               |  48 +
 xen/arch/riscv/guestcopy.c                  |  59 ++
 xen/arch/riscv/include/asm/acpi.h           |   9 +
 xen/arch/riscv/include/asm/altp2m.h         |  39 +
 xen/arch/riscv/include/asm/asm.h            |  76 ++
 xen/arch/riscv/include/asm/atomic.h         | 375 ++++++++
 xen/arch/riscv/include/asm/bitops.h         | 397 ++++++++
 xen/arch/riscv/include/asm/bug.h            |  67 ++
 xen/arch/riscv/include/asm/byteorder.h      |  16 +
 xen/arch/riscv/include/asm/cache.h          |  24 +
 xen/arch/riscv/include/asm/cmpxchg.h        | 382 ++++++++
 xen/arch/riscv/include/asm/config.h         | 149 ++-
 xen/arch/riscv/include/asm/cpufeature.h     |  68 ++
 xen/arch/riscv/include/asm/csr.h            |  81 ++
 xen/arch/riscv/include/asm/current.h        |  41 +
 xen/arch/riscv/include/asm/debugger.h       |  15 +
 xen/arch/riscv/include/asm/delay.h          |  28 +
 xen/arch/riscv/include/asm/desc.h           |  12 +
 xen/arch/riscv/include/asm/device.h         |  93 ++
 xen/arch/riscv/include/asm/div64.h          |  23 +
 xen/arch/riscv/include/asm/domain.h         |  80 ++
 xen/arch/riscv/include/asm/early_printk.h   |  10 +
 xen/arch/riscv/include/asm/event.h          |  42 +
 xen/arch/riscv/include/asm/fence.h          |  12 +
 xen/arch/riscv/include/asm/flushtlb.h       |  56 ++
 xen/arch/riscv/include/asm/grant_table.h    |  93 ++
 xen/arch/riscv/include/asm/guest_access.h   | 125 +++
 xen/arch/riscv/include/asm/guest_atomics.h  |  62 ++
 xen/arch/riscv/include/asm/hardirq.h        |  27 +
 xen/arch/riscv/include/asm/hypercall.h      |  12 +
 xen/arch/riscv/include/asm/init.h           |  42 +
 xen/arch/riscv/include/asm/io.h             | 283 ++++++
 xen/arch/riscv/include/asm/iocap.h          |  16 +
 xen/arch/riscv/include/asm/iommu.h          |  46 +
 xen/arch/riscv/include/asm/iommu_fwspec.h   |  68 ++
 xen/arch/riscv/include/asm/irq.h            |  62 ++
 xen/arch/riscv/include/asm/mem_access.h     |  35 +
 xen/arch/riscv/include/asm/mm.h             | 320 +++++++
 xen/arch/riscv/include/asm/monitor.h        |  65 ++
 xen/arch/riscv/include/asm/nospec.h         |  25 +
 xen/arch/riscv/include/asm/numa.h           |  41 +
 xen/arch/riscv/include/asm/p2m.h            | 307 +++++++
 xen/arch/riscv/include/asm/page-bits.h      |  14 +
 xen/arch/riscv/include/asm/page.h           | 319 +++++++
 xen/arch/riscv/include/asm/paging.h         |  16 +
 xen/arch/riscv/include/asm/pci.h            |  31 +
 xen/arch/riscv/include/asm/percpu.h         |  35 +
 xen/arch/riscv/include/asm/processor.h      | 176 ++++
 xen/arch/riscv/include/asm/random.h         |   9 +
 xen/arch/riscv/include/asm/regs.h           |  42 +
 xen/arch/riscv/include/asm/riscv_encoding.h | 960 ++++++++++++++++++++
 xen/arch/riscv/include/asm/sbi.h            | 275 ++++++
 xen/arch/riscv/include/asm/setup.h          |  23 +
 xen/arch/riscv/include/asm/smp.h            |  69 ++
 xen/arch/riscv/include/asm/softirq.h        |  16 +
 xen/arch/riscv/include/asm/spinlock.h       |  13 +
 xen/arch/riscv/include/asm/string.h         |  28 +
 xen/arch/riscv/include/asm/system.h         |  98 ++
 xen/arch/riscv/include/asm/time.h           |  81 ++
 xen/arch/riscv/include/asm/trace.h          |  12 +
 xen/arch/riscv/include/asm/traps.h          |  30 +
 xen/arch/riscv/include/asm/types.h          |  73 ++
 xen/arch/riscv/include/asm/vm_event.h       |  63 ++
 xen/arch/riscv/include/asm/xenoprof.h       |  12 +
 xen/arch/riscv/irq.c                        | 126 +++
 xen/arch/riscv/lib/Makefile                 |   1 +
 xen/arch/riscv/lib/find_next_bit.c          | 285 ++++++
 xen/arch/riscv/mm.c                         | 633 +++++++++++++
 xen/arch/riscv/p2m.c                        |  97 ++
 xen/arch/riscv/percpu.c                     |  84 ++
 xen/arch/riscv/platforms/Kconfig            |  31 +
 xen/arch/riscv/riscv64/Makefile             |   2 +-
 xen/arch/riscv/riscv64/asm-offsets.c        |  39 +
 xen/arch/riscv/riscv64/head.S               | 219 ++++-
 xen/arch/riscv/sbi.c                        | 483 ++++++++++
 xen/arch/riscv/setup.c                      |  67 ++
 xen/arch/riscv/shutdown.c                   |  24 +
 xen/arch/riscv/smp.c                        |  38 +
 xen/arch/riscv/smpboot.c                    |  78 ++
 xen/arch/riscv/sysctl.c                     |  31 +
 xen/arch/riscv/time.c                       |  69 ++
 xen/arch/riscv/traps.c                      |  87 ++
 xen/arch/riscv/vm_event.c                   |  51 ++
 xen/arch/riscv/xen.lds.S                    | 274 ++++++
 xen/include/public/arch-riscv.h             | 182 ++++
 xen/include/public/arch-riscv/hvm/save.h    |  39 +
 xen/include/public/hvm/save.h               |   2 +
 xen/include/public/io/protocols.h           |   3 +
 xen/include/public/pmu.h                    |   2 +
 xen/include/public/xen.h                    |   2 +
 96 files changed, 9536 insertions(+), 8 deletions(-)
 create mode 100644 xen/arch/riscv/delay.c
 create mode 100644 xen/arch/riscv/domain.c
 create mode 100644 xen/arch/riscv/domctl.c
 create mode 100644 xen/arch/riscv/early_printk.c
 create mode 100644 xen/arch/riscv/guestcopy.c
 create mode 100644 xen/arch/riscv/include/asm/acpi.h
 create mode 100644 xen/arch/riscv/include/asm/altp2m.h
 create mode 100644 xen/arch/riscv/include/asm/asm.h
 create mode 100644 xen/arch/riscv/include/asm/atomic.h
 create mode 100644 xen/arch/riscv/include/asm/bitops.h
 create mode 100644 xen/arch/riscv/include/asm/bug.h
 create mode 100644 xen/arch/riscv/include/asm/byteorder.h
 create mode 100644 xen/arch/riscv/include/asm/cache.h
 create mode 100644 xen/arch/riscv/include/asm/cmpxchg.h
 create mode 100644 xen/arch/riscv/include/asm/cpufeature.h
 create mode 100644 xen/arch/riscv/include/asm/csr.h
 create mode 100644 xen/arch/riscv/include/asm/current.h
 create mode 100644 xen/arch/riscv/include/asm/debugger.h
 create mode 100644 xen/arch/riscv/include/asm/delay.h
 create mode 100644 xen/arch/riscv/include/asm/desc.h
 create mode 100644 xen/arch/riscv/include/asm/device.h
 create mode 100644 xen/arch/riscv/include/asm/div64.h
 create mode 100644 xen/arch/riscv/include/asm/domain.h
 create mode 100644 xen/arch/riscv/include/asm/early_printk.h
 create mode 100644 xen/arch/riscv/include/asm/event.h
 create mode 100644 xen/arch/riscv/include/asm/fence.h
 create mode 100644 xen/arch/riscv/include/asm/flushtlb.h
 create mode 100644 xen/arch/riscv/include/asm/grant_table.h
 create mode 100644 xen/arch/riscv/include/asm/guest_access.h
 create mode 100644 xen/arch/riscv/include/asm/guest_atomics.h
 create mode 100644 xen/arch/riscv/include/asm/hardirq.h
 create mode 100644 xen/arch/riscv/include/asm/hypercall.h
 create mode 100644 xen/arch/riscv/include/asm/init.h
 create mode 100644 xen/arch/riscv/include/asm/io.h
 create mode 100644 xen/arch/riscv/include/asm/iocap.h
 create mode 100644 xen/arch/riscv/include/asm/iommu.h
 create mode 100644 xen/arch/riscv/include/asm/iommu_fwspec.h
 create mode 100644 xen/arch/riscv/include/asm/irq.h
 create mode 100644 xen/arch/riscv/include/asm/mem_access.h
 create mode 100644 xen/arch/riscv/include/asm/mm.h
 create mode 100644 xen/arch/riscv/include/asm/monitor.h
 create mode 100644 xen/arch/riscv/include/asm/nospec.h
 create mode 100644 xen/arch/riscv/include/asm/numa.h
 create mode 100644 xen/arch/riscv/include/asm/p2m.h
 create mode 100644 xen/arch/riscv/include/asm/page-bits.h
 create mode 100644 xen/arch/riscv/include/asm/page.h
 create mode 100644 xen/arch/riscv/include/asm/paging.h
 create mode 100644 xen/arch/riscv/include/asm/pci.h
 create mode 100644 xen/arch/riscv/include/asm/percpu.h
 create mode 100644 xen/arch/riscv/include/asm/processor.h
 create mode 100644 xen/arch/riscv/include/asm/random.h
 create mode 100644 xen/arch/riscv/include/asm/regs.h
 create mode 100644 xen/arch/riscv/include/asm/riscv_encoding.h
 create mode 100644 xen/arch/riscv/include/asm/sbi.h
 create mode 100644 xen/arch/riscv/include/asm/setup.h
 create mode 100644 xen/arch/riscv/include/asm/smp.h
 create mode 100644 xen/arch/riscv/include/asm/softirq.h
 create mode 100644 xen/arch/riscv/include/asm/spinlock.h
 create mode 100644 xen/arch/riscv/include/asm/string.h
 create mode 100644 xen/arch/riscv/include/asm/system.h
 create mode 100644 xen/arch/riscv/include/asm/time.h
 create mode 100644 xen/arch/riscv/include/asm/trace.h
 create mode 100644 xen/arch/riscv/include/asm/traps.h
 create mode 100644 xen/arch/riscv/include/asm/types.h
 create mode 100644 xen/arch/riscv/include/asm/vm_event.h
 create mode 100644 xen/arch/riscv/include/asm/xenoprof.h
 create mode 100644 xen/arch/riscv/irq.c
 create mode 100644 xen/arch/riscv/lib/Makefile
 create mode 100644 xen/arch/riscv/lib/find_next_bit.c
 create mode 100644 xen/arch/riscv/mm.c
 create mode 100644 xen/arch/riscv/p2m.c
 create mode 100644 xen/arch/riscv/percpu.c
 create mode 100644 xen/arch/riscv/platforms/Kconfig
 create mode 100644 xen/arch/riscv/sbi.c
 create mode 100644 xen/arch/riscv/setup.c
 create mode 100644 xen/arch/riscv/shutdown.c
 create mode 100644 xen/arch/riscv/smp.c
 create mode 100644 xen/arch/riscv/smpboot.c
 create mode 100644 xen/arch/riscv/sysctl.c
 create mode 100644 xen/arch/riscv/time.c
 create mode 100644 xen/arch/riscv/traps.c
 create mode 100644 xen/arch/riscv/vm_event.c
 create mode 100644 xen/arch/riscv/xen.lds.S
 create mode 100644 xen/include/public/arch-riscv.h
 create mode 100644 xen/include/public/arch-riscv/hvm/save.h

-- 
2.30.2


