Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A658538BD4
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 09:09:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339121.563946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvvzi-0000q1-Gw; Tue, 31 May 2022 07:08:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339121.563946; Tue, 31 May 2022 07:08:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvvzi-0000hp-BY; Tue, 31 May 2022 07:08:46 +0000
Received: by outflank-mailman (input) for mailman id 339121;
 Tue, 31 May 2022 06:57:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rfOh=WH=gmail.com=xiexun162534@srs-se1.protection.inumbo.net>)
 id 1nvvpF-00080v-3m
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 06:57:57 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa89a466-e0ae-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 08:57:47 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id y24so7449003wmq.5
 for <xen-devel@lists.xenproject.org>; Mon, 30 May 2022 23:57:52 -0700 (PDT)
Received: from localhost ([2a03:b0c0:1:d0::944:e002])
 by smtp.gmail.com with ESMTPSA id
 26-20020a05600c029a00b0039bc95cf4b2sm1243406wmk.11.2022.05.30.23.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 23:57:50 -0700 (PDT)
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
X-Inumbo-ID: fa89a466-e0ae-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EiUUvhcfkzFNIN2pfXahh8nCsRZ1m3WiWE9lRsHcZsk=;
        b=VcRwHCjMvMtez13ud8hj+4fCW0qa7ar6vPcP0SsTRSO4KC8aPlt2ArJj07u56Ns9to
         HSeJyWehj4AywLY2N4nZuG1opWmAMTiPZEhP60uSSneqA2L4b2bosmAv/hbQ8bnBlErk
         Vp+MgFv/q8D6ep70OLILyfiWwx9bjfGrSd7HKOCWxbIiZTUQmDh7jJW9vZNQO25cw0A8
         pSti006F0p/04QG4GONP8Pe+V9YRRyC/KxwLw9ICa4eCvJAtZP3n1FBBWQARjYyqPq36
         IoOwKVQdI6MOfvFCxpBpKqmZyVgdvZA5EZvinZD4vqSkYcR4AFsrThau2ldzgkf3iH7/
         yCbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EiUUvhcfkzFNIN2pfXahh8nCsRZ1m3WiWE9lRsHcZsk=;
        b=psYBqDZIfCDP3iLIBn4+9iE3ZFx8zFS5P4gtTUBYD9SG6LNy1UYjZucO6989sBwNju
         chYZ7h7R/iMn74DcU3RKyHvBgii+GotN8XNDSScABN/JEhc0QWHzMMaVBAkmLE06e03D
         06+k7uXfoDhJuNd1itLOypbvBIg2IaUE0bSLHMRgnB3ciFlZI0RLV3NdtbjnQJJHUfWY
         2vrSaFiT1/AvF6VkFkRIRSmq1OOgYA+eDKIF5g+DSkQEUZavj6Me2/+Ma88F8vqhxY19
         9bUT8QRKYSiFh1eRLm+pZnLuDp6txquZMmFyOHaDTFstGIBHRbKUZ+5kN1aW/3eREh7h
         IiVw==
X-Gm-Message-State: AOAM531PDPfvbKMj7wMbZZfIWdDX5nXSYvcGyt6ybC1J8kutRU4HyKxC
	mSBp9eL9FwYDcjv7IWO7XDbMHbYLBVKchA==
X-Google-Smtp-Source: ABdhPJxpbTH8tzTIkAlBTsnqASJHI1Mh3WR0XiJbXczBo9TkKJ/7sGbMom+NgrMQKTgisYskIRjR3A==
X-Received: by 2002:a05:600c:3b2a:b0:397:3e63:3db8 with SMTP id m42-20020a05600c3b2a00b003973e633db8mr21452000wms.40.1653980270851;
        Mon, 30 May 2022 23:57:50 -0700 (PDT)
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
Subject: [RFC PATCH 1/6] xen/riscv: Add necessary headers and definitions to build xen.
Date: Tue, 31 May 2022 14:57:07 +0800
Message-Id: <e1a82be152f9e7e344032bd253aadca502a01ab6.1653977696.git.xiexun162534@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1653977696.git.xiexun162534@gmail.com>
References: <cover.1653977696.git.xiexun162534@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Target xen and xen-syms can be built with:

$ make XEN_TARGET_ARCH=riscv64 CROSS_COMPILE=riscv64-linux-gnu- tiny64_defconfig
$ make XEN_TARGET_ARCH=riscv64 CROSS_COMPILE=riscv64-linux-gnu-

It can be tested with Qemu.

$ qemu-system-riscv64 -machine virt -m 1G -kernel xen

Xen will jump into an infinite loop and there will be no output.

Signed-off-by: Xie Xun <xiexun162534@gmail.com>
---
 xen/arch/riscv/Kconfig                      |   2 +
 xen/arch/riscv/Makefile                     |  51 ++
 xen/arch/riscv/Rules.mk                     |  57 ++
 xen/arch/riscv/delay.c                      |  14 +
 xen/arch/riscv/domain.c                     | 191 ++++
 xen/arch/riscv/domctl.c                     |  52 ++
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
 xen/arch/riscv/mm.c                         | 409 +++++++++
 xen/arch/riscv/p2m.c                        |  97 ++
 xen/arch/riscv/percpu.c                     |  84 ++
 xen/arch/riscv/platforms/Kconfig            |  31 +
 xen/arch/riscv/riscv64/Makefile             |   2 +-
 xen/arch/riscv/riscv64/asm-offsets.c        |  39 +
 xen/arch/riscv/riscv64/head.S               |  13 +-
 xen/arch/riscv/setup.c                      |  65 ++
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
 92 files changed, 8286 insertions(+), 8 deletions(-)
 create mode 100644 xen/arch/riscv/delay.c
 create mode 100644 xen/arch/riscv/domain.c
 create mode 100644 xen/arch/riscv/domctl.c
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

diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index 468e250c86..e8c9ae6219 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -1,5 +1,7 @@
 config RISCV
 	def_bool y
+        select HAS_PDX
+        select HAS_DEVICE_TREE
 
 config RISCV_64
 	def_bool y
diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 942e4ffbc1..3a57556631 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -1,2 +1,53 @@
+obj-y += lib/
+
+obj-y   += domctl.o
+obj-y   += domain.o
+obj-y   += delay.o
+obj-y   += guestcopy.o
+obj-y   += irq.o
+obj-y   += p2m.o
+obj-y   += mm.o
+obj-y   += percpu.o
+obj-y   += setup.o
+obj-y   += shutdown.o
+obj-y   += smp.o
+obj-y   += smpboot.o
+obj-y   += sysctl.o
+obj-y   += traps.o
+obj-y   += time.o
+obj-y   += vm_event.o
+
+obj-y	+= $(TARGET_SUBARCH)/
+
+#obj-bin-y += ....o
+
+$(TARGET): $(TARGET)-syms
+	$(OBJCOPY) -O binary -S $< $@
+
+$(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< \
+	    $(objtree)/common/symbols-dummy.o -o $(@D)/.$(@F).0
+	$(NM) -pa --format=sysv $(@D)/.$(@F).0 \
+		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).0.S
+	$(MAKE) $(build)=$(@D) $(@D)/.$(@F).0.o
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< \
+	    $(@D)/.$(@F).0.o -o $(@D)/.$(@F).1
+	$(NM) -pa --format=sysv $(@D)/.$(@F).1 \
+		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).1.S
+	$(MAKE) $(build)=$(@D) $(@D)/.$(@F).1.o
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
+	    $(@D)/.$(@F).1.o -o $@
+	$(NM) -pa --format=sysv $(@D)/$(@F) \
+		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
+		>$(@D)/$(@F).map
+	rm -f $(@D)/.$(@F).[0-9]*
+
+$(obj)/xen.lds: $(src)/xen.lds.S FORCE
+	$(call if_changed_dep,cpp_lds_S)
+
+.PHONY: clean
+clean::
+	rm -f $(objtree)/.xen-syms.[0-9]*
+
 .PHONY: include
 include:
diff --git a/xen/arch/riscv/Rules.mk b/xen/arch/riscv/Rules.mk
index e69de29bb2..85e0cc5e64 100644
--- a/xen/arch/riscv/Rules.mk
+++ b/xen/arch/riscv/Rules.mk
@@ -0,0 +1,57 @@
+########################################
+# riscv-specific definitions
+
+#
+# If you change any of these configuration options then you must
+# 'make clean' before rebuilding.
+#
+
+CFLAGS += -I$(BASEDIR)/include
+
+$(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
+$(call cc-option-add,CFLAGS,CC,-Wnested-externs)
+$(call cc-option-add,CFLAGS,CC,-mstrict-align)
+$(call cc-option-add,CFLAGS,CC,-mtune=size)
+
+EARLY_PRINTK := n
+
+ifeq ($(CONFIG_DEBUG),y)
+
+# See docs/misc/arm/early-printk.txt for syntax
+
+EARLY_PRINTK := 8250,0x1c021000,2
+
+ifneq ($(EARLY_PRINTK_$(CONFIG_EARLY_PRINTK)),)
+EARLY_PRINTK_CFG := $(subst $(comma), ,$(EARLY_PRINTK_$(CONFIG_EARLY_PRINTK)))
+else
+EARLY_PRINTK_CFG := $(subst $(comma), ,$(CONFIG_EARLY_PRINTK))
+endif
+
+# Extract configuration from string
+EARLY_PRINTK_INC := $(word 1,$(EARLY_PRINTK_CFG))
+EARLY_UART_BASE_ADDRESS := $(word 2,$(EARLY_PRINTK_CFG))
+
+# UART specific options
+ifeq ($(EARLY_PRINTK_INC),8250)
+EARLY_UART_REG_SHIFT := $(word 3,$(EARLY_PRINTK_CFG))
+endif
+
+ifneq ($(EARLY_PRINTK_INC),)
+EARLY_PRINTK := y
+endif
+
+CFLAGS-$(EARLY_PRINTK) += -DCONFIG_EARLY_PRINTK
+CFLAGS-$(EARLY_PRINTK_INIT_UART) += -DEARLY_PRINTK_INIT_UART
+CFLAGS-$(EARLY_PRINTK) += -DEARLY_PRINTK_INC=\"debug-$(EARLY_PRINTK_INC).inc\"
+CFLAGS-$(EARLY_PRINTK) += -DEARLY_PRINTK_BAUD=$(EARLY_PRINTK_BAUD)
+CFLAGS-$(EARLY_PRINTK) += -DEARLY_UART_BASE_ADDRESS=$(EARLY_UART_BASE_ADDRESS)
+CFLAGS-$(EARLY_PRINTK) += -DEARLY_UART_REG_SHIFT=$(EARLY_UART_REG_SHIFT)
+
+else # !CONFIG_DEBUG
+
+ifneq ($(CONFIG_EARLY_PRINTK),)
+# Early printk is dependant on a debug build.
+$(error CONFIG_EARLY_PRINTK enabled for non-debug build)
+endif
+
+endif
diff --git a/xen/arch/riscv/delay.c b/xen/arch/riscv/delay.c
new file mode 100644
index 0000000000..4a712e97e8
--- /dev/null
+++ b/xen/arch/riscv/delay.c
@@ -0,0 +1,14 @@
+void __delay(unsigned long cycles)
+{
+}
+EXPORT_SYMBOL(__delay);
+
+void udelay(unsigned long usecs)
+{
+}
+EXPORT_SYMBOL(udelay);
+
+void ndelay(unsigned long nsecs)
+{
+}
+EXPORT_SYMBOL(ndelay);
diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
new file mode 100644
index 0000000000..c99023731f
--- /dev/null
+++ b/xen/arch/riscv/domain.c
@@ -0,0 +1,191 @@
+#include <xen/errno.h>
+#include <xen/init.h>
+#include <xen/lib.h>
+#include <xen/sched.h>
+#include <xen/domain.h>
+#include <xen/softirq.h>
+#include <asm/traps.h>
+#include <public/domctl.h>
+#include <public/xen.h>
+
+DEFINE_PER_CPU(struct vcpu *, curr_vcpu);
+
+struct vcpu *alloc_dom0_vcpu0(struct domain *dom0)
+{
+    return vcpu_create(dom0, 0);
+}
+
+void context_switch(struct vcpu *prev, struct vcpu *next)
+{
+    /* TODO */
+}
+
+void idle_loop(void)
+{
+    /* TODO */
+}
+
+void noreturn startup_cpu_idle_loop(void)
+{
+    struct vcpu *v = current;
+
+    ASSERT(is_idle_vcpu(v));
+
+    reset_stack_and_jump(idle_loop);
+
+    /* This function is noreturn */
+    BUG();
+}
+
+void continue_running(struct vcpu *same)
+{
+    /* TODO */
+}
+
+void sync_local_execstate(void)
+{
+    /* TODO */
+}
+
+void sync_vcpu_execstate(struct vcpu *v)
+{
+    /* TODO */
+}
+
+unsigned long hypercall_create_continuation(
+    unsigned int op, const char *format, ...)
+{
+	/* TODO */
+
+	return 0;
+}
+
+struct domain *alloc_domain_struct(void)
+{
+    return NULL;
+}
+
+void free_domain_struct(struct domain *d)
+{
+    /* TODO */
+}
+
+void dump_pageframe_info(struct domain *d)
+{
+    /* TODO */
+}
+
+int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
+{
+    return 0;
+}
+
+
+int arch_domain_create(struct domain *d,
+                       struct xen_domctl_createdomain *config,
+                        unsigned int flags)
+{
+    return -ENOSYS;
+}
+
+void arch_domain_destroy(struct domain *d)
+{
+    /* TODO */
+}
+
+void arch_domain_shutdown(struct domain *d)
+{
+    /* TODO */
+}
+
+void arch_domain_pause(struct domain *d)
+{
+    /* TODO */
+}
+
+void arch_domain_unpause(struct domain *d)
+{
+    /* TODO */
+}
+
+int arch_domain_soft_reset(struct domain *d)
+{
+    /* TODO */
+    return -ENOSYS;
+}
+
+void arch_domain_creation_finished(struct domain *d)
+{
+    /* TODO */
+}
+
+int domain_relinquish_resources(struct domain *d)
+{
+    /* TODO */
+    return -ENOSYS;
+}
+
+void arch_dump_domain_info(struct domain *d)
+{
+    /* TODO */
+}
+
+long arch_do_vcpu_op(int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
+{
+    /* TODO */
+    return -ENOSYS;
+}
+
+void arch_dump_vcpu_info(struct vcpu *v)
+{
+    /* TODO */
+}
+
+int arch_set_info_guest(
+    struct vcpu *v, vcpu_guest_context_u c)
+{
+    /* TODO */
+    return -ENOSYS;
+}
+
+/* taken from arm/domain.c */
+struct vcpu *alloc_vcpu_struct(const struct domain *d)
+{
+    return NULL;
+}
+
+void free_vcpu_struct(struct vcpu *v)
+{
+    /* TODO */
+}
+
+int arch_initialise_vcpu(struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
+{
+    /* TODO */
+    return -ENOSYS;
+}
+
+int arch_vcpu_reset(struct vcpu *v)
+{
+    /* TODO */
+    return -ENOSYS;
+}
+
+int arch_vcpu_create(struct vcpu *v)
+{
+    return -ENOSYS;
+}
+
+void arch_vcpu_destroy(struct vcpu *v)
+{
+    /* TODO */
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/domctl.c b/xen/arch/riscv/domctl.c
new file mode 100644
index 0000000000..5024118662
--- /dev/null
+++ b/xen/arch/riscv/domctl.c
@@ -0,0 +1,52 @@
+/******************************************************************************
+ * Arch-specific domctl.c
+ *
+ * Copyright (c) 2012, Citrix Systems
+ */
+
+#include <xen/errno.h>
+#include <xen/guest_access.h>
+#include <xen/hypercall.h>
+#include <xen/iocap.h>
+#include <xen/lib.h>
+#include <xen/mm.h>
+#include <xen/sched.h>
+#include <xen/types.h>
+#include <xsm/xsm.h>
+#include <public/domctl.h>
+
+void arch_get_domain_info(const struct domain *d,
+                          struct xen_domctl_getdomaininfo *info)
+{
+    info->flags |= XEN_DOMINF_hap;
+}
+
+long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
+                    XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
+{
+    /* TODO */
+
+    switch ( domctl->cmd ) {
+    case XEN_DOMCTL_cacheflush:
+    case XEN_DOMCTL_bind_pt_irq:
+    case XEN_DOMCTL_unbind_pt_irq:
+    case XEN_DOMCTL_vuart_op:
+    default:
+        return 0;
+    }
+}
+
+void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
+{
+    /* TODO */
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/guestcopy.c b/xen/arch/riscv/guestcopy.c
new file mode 100644
index 0000000000..76d6a82409
--- /dev/null
+++ b/xen/arch/riscv/guestcopy.c
@@ -0,0 +1,59 @@
+#include <asm/guest_access.h>
+#include <asm/traps.h>
+#include <xen/domain_page.h>
+
+unsigned long raw_copy_to_guest(void *to, const void *from, unsigned len)
+{
+    return -ENOSYS;
+}
+
+unsigned long raw_copy_to_guest_flush_dcache(void *to, const void *from,
+                                             unsigned len)
+{
+    return -ENOSYS;
+}
+
+unsigned long raw_clear_guest(void *to, unsigned len)
+{
+    return -ENOSYS;
+}
+
+unsigned long raw_copy_from_guest(void *to, const void __user *from, unsigned len)
+{
+    return -ENOSYS;
+}
+
+unsigned long copy_to_guest_phys(struct domain *d,
+                                 paddr_t gpa,
+                                 void *buf,
+                                 unsigned int len)
+{
+    return -ENOSYS;
+}
+
+
+/**
+ * riscv_vcpu_unpriv_read -- Read machine word from Guest memory
+ *
+ * @vcpu: The VCPU pointer
+ * @read_insn: Flag representing whether we are reading instruction
+ * @guest_addr: Guest address to read
+ * @trap: Output pointer to trap details
+ */
+unsigned long riscv_vcpu_unpriv_read(struct vcpu *vcpu,
+					 bool read_insn,
+					 unsigned long guest_addr,
+					 struct riscv_trap *trap)
+{
+    /* TODO */
+    return -ENOSYS;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/include/asm/acpi.h b/xen/arch/riscv/include/asm/acpi.h
new file mode 100644
index 0000000000..efede99d65
--- /dev/null
+++ b/xen/arch/riscv/include/asm/acpi.h
@@ -0,0 +1,9 @@
+#ifndef _ASM_RISCV_ACPI_H
+#define _ASM_RISCV_ACPI_H
+
+#include <asm/setup.h>
+
+extern bool acpi_disabled;
+
+
+#endif /*_ASM_RISCV_ACPI_H*/
diff --git a/xen/arch/riscv/include/asm/altp2m.h b/xen/arch/riscv/include/asm/altp2m.h
new file mode 100644
index 0000000000..8554495f94
--- /dev/null
+++ b/xen/arch/riscv/include/asm/altp2m.h
@@ -0,0 +1,39 @@
+/*
+ * Alternate p2m
+ *
+ * Copyright (c) 2014, Intel Corporation.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef __ASM_RISCV_ALTP2M_H
+#define __ASM_RISCV_ALTP2M_H
+
+#include <xen/sched.h>
+
+/* Alternate p2m on/off per domain */
+static inline bool altp2m_active(const struct domain *d)
+{
+    /* Not implemented on RISCV. */
+    return false;
+}
+
+/* Alternate p2m VCPU */
+static inline uint16_t altp2m_vcpu_idx(const struct vcpu *v)
+{
+    /* Not implemented on RISCV, should not be reached. */
+    BUG();
+    return 0;
+}
+
+#endif /* __ASM_RISCV_ALTP2M_H */
diff --git a/xen/arch/riscv/include/asm/asm.h b/xen/arch/riscv/include/asm/asm.h
new file mode 100644
index 0000000000..5ad4cb622b
--- /dev/null
+++ b/xen/arch/riscv/include/asm/asm.h
@@ -0,0 +1,76 @@
+/*
+ * Copyright (C) 2015 Regents of the University of California
+ *
+ *   This program is free software; you can redistribute it and/or
+ *   modify it under the terms of the GNU General Public License
+ *   as published by the Free Software Foundation, version 2.
+ *
+ *   This program is distributed in the hope that it will be useful,
+ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *   GNU General Public License for more details.
+ */
+
+#ifndef _ASM_RISCV_ASM_H
+#define _ASM_RISCV_ASM_H
+
+#ifdef __ASSEMBLY__
+#define __ASM_STR(x)	x
+#else
+#define __ASM_STR(x)	#x
+#endif
+
+#if __riscv_xlen == 64
+#define __REG_SEL(a, b)	__ASM_STR(a)
+#elif __riscv_xlen == 32
+#define __REG_SEL(a, b)	__ASM_STR(b)
+#else
+#error "Unexpected __riscv_xlen"
+#endif
+
+#define REG_L		__REG_SEL(ld, lw)
+#define REG_S		__REG_SEL(sd, sw)
+#define SZREG		__REG_SEL(8, 4)
+#define LGREG		__REG_SEL(3, 2)
+
+#if __SIZEOF_POINTER__ == 8
+#ifdef __ASSEMBLY__
+#define RISCV_PTR		.dword
+#define RISCV_SZPTR		8
+#define RISCV_LGPTR		3
+#else
+#define RISCV_PTR		".dword"
+#define RISCV_SZPTR		"8"
+#define RISCV_LGPTR		"3"
+#endif
+#elif __SIZEOF_POINTER__ == 4
+#ifdef __ASSEMBLY__
+#define RISCV_PTR		.word
+#define RISCV_SZPTR		4
+#define RISCV_LGPTR		2
+#else
+#define RISCV_PTR		".word"
+#define RISCV_SZPTR		"4"
+#define RISCV_LGPTR		"2"
+#endif
+#else
+#error "Unexpected __SIZEOF_POINTER__"
+#endif
+
+#if (__SIZEOF_INT__ == 4)
+#define RISCV_INT		__ASM_STR(.word)
+#define RISCV_SZINT		__ASM_STR(4)
+#define RISCV_LGINT		__ASM_STR(2)
+#else
+#error "Unexpected __SIZEOF_INT__"
+#endif
+
+#if (__SIZEOF_SHORT__ == 2)
+#define RISCV_SHORT		__ASM_STR(.half)
+#define RISCV_SZSHORT		__ASM_STR(2)
+#define RISCV_LGSHORT		__ASM_STR(1)
+#else
+#error "Unexpected __SIZEOF_SHORT__"
+#endif
+
+#endif /* _ASM_RISCV_ASM_H */
diff --git a/xen/arch/riscv/include/asm/atomic.h b/xen/arch/riscv/include/asm/atomic.h
new file mode 100644
index 0000000000..d4849cf282
--- /dev/null
+++ b/xen/arch/riscv/include/asm/atomic.h
@@ -0,0 +1,375 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Taken and modified from Linux.
+ * 
+ * Copyright (C) 2007 Red Hat, Inc. All Rights Reserved.
+ * Copyright (C) 2012 Regents of the University of California
+ * Copyright (C) 2017 SiFive
+ * Copyright (C) 2021 Vates SAS
+ */
+
+#ifndef _ASM_RISCV_ATOMIC_H
+#define _ASM_RISCV_ATOMIC_H
+
+#include <xen/atomic.h>
+#include <asm/cmpxchg.h>
+#include <asm/fence.h>
+#include <asm/io.h>
+#include <asm/system.h>
+
+void __bad_atomic_size(void);
+
+static always_inline void read_atomic_size(const volatile void *p,
+                                           void *res,
+                                           unsigned int size)
+{
+    switch ( size ) {
+    case 1: *(uint8_t *)res = readb((uint8_t *)p); break;
+    case 2: *(uint16_t *)res = readw((uint16_t *)p); break;
+    case 4: *(uint32_t *)res = readl((uint32_t *)p); break;
+    case 8: *(uint32_t *)res  = readq((uint64_t *)p); break;
+    default: __bad_atomic_size(); break;
+    }
+}
+
+#define read_atomic(p) ({                                               \
+    union { typeof(*p) val; char c[0]; } x_;                            \
+    read_atomic_size(p, x_.c, sizeof(*p));                              \
+    x_.val;                                                             \
+})
+
+
+#define write_atomic(p, x) ({                                           \
+    typeof(*p) __x = (x);                                               \
+    switch ( sizeof(*p) ) {                                             \
+    case 1: writeb((uint8_t)__x,  (uint8_t *)  p); break;              \
+    case 2: writew((uint16_t)__x, (uint16_t *) p); break;              \
+    case 4: writel((uint32_t)__x, (uint32_t *) p); break;              \
+    case 8: writeq((uint64_t)__x, (uint64_t *) p); break;              \
+    default: __bad_atomic_size(); break;                                \
+    }                                                                   \
+    __x;                                                                \
+})
+
+/* TODO: Fix this */
+#define add_sized(p, x) ({                                              \
+    typeof(*(p)) __x = (x);                                             \
+    switch ( sizeof(*(p)) )                                             \
+    {                                                                   \
+    case 1: writeb(read_atomic(p) + __x, (uint8_t *)(p)); break;        \
+    case 2: writew(read_atomic(p) + __x, (uint16_t *)(p)); break;       \
+    case 4: writel(read_atomic(p) + __x, (uint32_t *)(p)); break;       \
+    default: __bad_atomic_size(); break;                                \
+    }                                                                   \
+})
+
+/*
+ *  __unqual_scalar_typeof(x) - Declare an unqualified scalar type, leaving
+ *               non-scalar types unchanged.
+ *
+ * Prefer C11 _Generic for better compile-times and simpler code. Note: 'char'
+ * is not type-compatible with 'signed char', and we define a separate case.
+ */
+#define __scalar_type_to_expr_cases(type)               \
+    unsigned type:  (unsigned type)0,                   \
+    signed type:    (signed type)0
+
+#define __unqual_scalar_typeof(x) typeof(               \
+    _Generic((x),                                       \
+        char:  (char)0,                                 \
+        __scalar_type_to_expr_cases(char),              \
+        __scalar_type_to_expr_cases(short),             \
+        __scalar_type_to_expr_cases(int),               \
+        __scalar_type_to_expr_cases(long),              \
+        __scalar_type_to_expr_cases(long long),         \
+        default: (x)))
+
+#define READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
+#define WRITE_ONCE(x, val)                                      \
+    do {                                                        \
+            *(volatile typeof(x) *)&(x) = (val);                \
+    } while (0)
+
+#define __atomic_acquire_fence()					\
+	__asm__ __volatile__(RISCV_ACQUIRE_BARRIER "" ::: "memory")
+
+#define __atomic_release_fence()					\
+	__asm__ __volatile__(RISCV_RELEASE_BARRIER "" ::: "memory");
+
+static inline int atomic_read(const atomic_t *v)
+{
+	return READ_ONCE(v->counter);
+}
+
+static inline int _atomic_read(atomic_t v)
+{
+    return v.counter;
+}
+
+static inline void atomic_set(atomic_t *v, int i)
+{
+	WRITE_ONCE(v->counter, i);
+}
+
+static inline void _atomic_set(atomic_t *v, int i)
+{
+    v->counter = i;
+}
+
+static inline int atomic_sub_and_test(int i, atomic_t *v)
+{
+    return atomic_sub_return(i, v) == 0;
+}
+
+static inline void atomic_inc(atomic_t *v)
+{
+    atomic_add(1, v);
+}
+
+static inline int atomic_inc_return(atomic_t *v)
+{
+    return atomic_add_return(1, v);
+}
+
+static inline void atomic_dec(atomic_t *v)
+{
+    atomic_sub(1, v);
+}
+
+static inline int atomic_dec_return(atomic_t *v)
+{
+    return atomic_sub_return(1, v);
+}
+
+
+static inline int atomic_dec_and_test(atomic_t *v)
+{
+    return atomic_sub_return(1, v) == 0;
+}
+
+static inline int atomic_add_negative(int i, atomic_t *v)
+{
+    return atomic_add_return(i, v) < 0;
+}
+
+static inline int atomic_inc_and_test(atomic_t *v)
+{
+    return atomic_add_return(1, v) == 0;
+}
+
+/*
+ * First, the atomic ops that have no ordering constraints and therefor don't
+ * have the AQ or RL bits set.  These don't return anything, so there's only
+ * one version to worry about.
+ */
+#define ATOMIC_OP(op, asm_op, I, asm_type, c_type, prefix)		\
+static inline							\
+void atomic##prefix##_##op(c_type i, atomic##prefix##_t *v)		\
+{									\
+	__asm__ __volatile__ (						\
+		"	amo" #asm_op "." #asm_type " zero, %1, %0"	\
+		: "+A" (v->counter)					\
+		: "r" (I)						\
+		: "memory");						\
+}									\
+
+#define ATOMIC_OPS(op, asm_op, I)					\
+        ATOMIC_OP (op, asm_op, I, w, int,   )
+
+ATOMIC_OPS(add, add,  i)
+ATOMIC_OPS(sub, add, -i)
+ATOMIC_OPS(and, and,  i)
+ATOMIC_OPS( or,  or,  i)
+ATOMIC_OPS(xor, xor,  i)
+
+#undef ATOMIC_OP
+#undef ATOMIC_OPS
+
+/*
+ * Atomic ops that have ordered, relaxed, acquire, and release variants.
+ * There's two flavors of these: the arithmatic ops have both fetch and return
+ * versions, while the logical ops only have fetch versions.
+ */
+#define ATOMIC_FETCH_OP(op, asm_op, I, asm_type, c_type, prefix)	\
+static inline							\
+c_type atomic##prefix##_fetch_##op##_relaxed(c_type i,			\
+					     atomic##prefix##_t *v)	\
+{									\
+	register c_type ret;						\
+	__asm__ __volatile__ (						\
+		"	amo" #asm_op "." #asm_type " %1, %2, %0"	\
+		: "+A" (v->counter), "=r" (ret)				\
+		: "r" (I)						\
+		: "memory");						\
+	return ret;							\
+}									\
+static inline							\
+c_type atomic##prefix##_fetch_##op(c_type i, atomic##prefix##_t *v)	\
+{									\
+	register c_type ret;						\
+	__asm__ __volatile__ (						\
+		"	amo" #asm_op "." #asm_type ".aqrl  %1, %2, %0"	\
+		: "+A" (v->counter), "=r" (ret)				\
+		: "r" (I)						\
+		: "memory");						\
+	return ret;							\
+}
+
+#define ATOMIC_OP_RETURN(op, asm_op, c_op, I, asm_type, c_type, prefix)	\
+static inline							\
+c_type atomic##prefix##_##op##_return_relaxed(c_type i,			\
+					      atomic##prefix##_t *v)	\
+{									\
+        return atomic##prefix##_fetch_##op##_relaxed(i, v) c_op I;	\
+}									\
+static inline							\
+c_type atomic##prefix##_##op##_return(c_type i, atomic##prefix##_t *v)	\
+{									\
+        return atomic##prefix##_fetch_##op(i, v) c_op I;		\
+}
+
+#define ATOMIC_OPS(op, asm_op, c_op, I)					\
+        ATOMIC_FETCH_OP( op, asm_op,       I, w, int,   )		\
+        ATOMIC_OP_RETURN(op, asm_op, c_op, I, w, int,   )
+
+ATOMIC_OPS(add, add, +,  i)
+ATOMIC_OPS(sub, add, +, -i)
+
+#define atomic_add_return_relaxed	atomic_add_return_relaxed
+#define atomic_sub_return_relaxed	atomic_sub_return_relaxed
+#define atomic_add_return		atomic_add_return
+#define atomic_sub_return		atomic_sub_return
+
+#define atomic_fetch_add_relaxed	atomic_fetch_add_relaxed
+#define atomic_fetch_sub_relaxed	atomic_fetch_sub_relaxed
+#define atomic_fetch_add		atomic_fetch_add
+#define atomic_fetch_sub		atomic_fetch_sub
+
+#undef ATOMIC_OPS
+
+#define ATOMIC_OPS(op, asm_op, I)					\
+        ATOMIC_FETCH_OP(op, asm_op, I, w, int,   )
+
+ATOMIC_OPS(and, and, i)
+ATOMIC_OPS( or,  or, i)
+ATOMIC_OPS(xor, xor, i)
+
+#define atomic_fetch_and_relaxed	atomic_fetch_and_relaxed
+#define atomic_fetch_or_relaxed		atomic_fetch_or_relaxed
+#define atomic_fetch_xor_relaxed	atomic_fetch_xor_relaxed
+#define atomic_fetch_and		atomic_fetch_and
+#define atomic_fetch_or			atomic_fetch_or
+#define atomic_fetch_xor		atomic_fetch_xor
+
+#undef ATOMIC_OPS
+
+#undef ATOMIC_FETCH_OP
+#undef ATOMIC_OP_RETURN
+
+/* This is required to provide a full barrier on success. */
+static inline int atomic_add_unless(atomic_t *v, int a, int u)
+{
+       int prev, rc;
+
+	__asm__ __volatile__ (
+		"0:	lr.w     %[p],  %[c]\n"
+		"	beq      %[p],  %[u], 1f\n"
+		"	add      %[rc], %[p], %[a]\n"
+		"	sc.w.rl  %[rc], %[rc], %[c]\n"
+		"	bnez     %[rc], 0b\n"
+		"	fence    rw, rw\n"
+		"1:\n"
+		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
+		: [a]"r" (a), [u]"r" (u)
+		: "memory");
+	return prev;
+}
+#define atomic_fetch_add_unless atomic_fetch_add_unless
+
+/*
+ * atomic_{cmp,}xchg is required to have exactly the same ordering semantics as
+ * {cmp,}xchg and the operations that return, so they need a full barrier.
+ */
+#define ATOMIC_OP(c_t, prefix, size)					\
+static inline							\
+c_t atomic##prefix##_xchg_relaxed(atomic##prefix##_t *v, c_t n)		\
+{									\
+	return __xchg_relaxed(&(v->counter), n, size);			\
+}									\
+static inline							\
+c_t atomic##prefix##_xchg_acquire(atomic##prefix##_t *v, c_t n)		\
+{									\
+	return __xchg_acquire(&(v->counter), n, size);			\
+}									\
+static inline							\
+c_t atomic##prefix##_xchg_release(atomic##prefix##_t *v, c_t n)		\
+{									\
+	return __xchg_release(&(v->counter), n, size);			\
+}									\
+static inline							\
+c_t atomic##prefix##_xchg(atomic##prefix##_t *v, c_t n)			\
+{									\
+	return __xchg(&(v->counter), n, size);				\
+}									\
+static inline							\
+c_t atomic##prefix##_cmpxchg_relaxed(atomic##prefix##_t *v,		\
+				     c_t o, c_t n)			\
+{									\
+	return __cmpxchg_relaxed(&(v->counter), o, n, size);		\
+}									\
+static inline							\
+c_t atomic##prefix##_cmpxchg_acquire(atomic##prefix##_t *v,		\
+				     c_t o, c_t n)			\
+{									\
+	return __cmpxchg_acquire(&(v->counter), o, n, size);		\
+}									\
+static inline							\
+c_t atomic##prefix##_cmpxchg_release(atomic##prefix##_t *v,		\
+				     c_t o, c_t n)			\
+{									\
+	return __cmpxchg_release(&(v->counter), o, n, size);		\
+}									\
+static inline							\
+c_t atomic##prefix##_cmpxchg(atomic##prefix##_t *v, c_t o, c_t n)	\
+{									\
+	return __cmpxchg(&(v->counter), o, n, size);			\
+}
+
+#define ATOMIC_OPS()							\
+	ATOMIC_OP(int,   , 4)
+
+ATOMIC_OPS()
+
+#define atomic_xchg_relaxed atomic_xchg_relaxed
+#define atomic_xchg_acquire atomic_xchg_acquire
+#define atomic_xchg_release atomic_xchg_release
+#define atomic_xchg atomic_xchg
+#define atomic_cmpxchg_relaxed atomic_cmpxchg_relaxed
+#define atomic_cmpxchg_acquire atomic_cmpxchg_acquire
+#define atomic_cmpxchg_release atomic_cmpxchg_release
+#define atomic_cmpxchg atomic_cmpxchg
+
+#undef ATOMIC_OPS
+#undef ATOMIC_OP
+
+static inline int atomic_sub_if_positive(atomic_t *v, int offset)
+{
+       int prev, rc;
+
+	__asm__ __volatile__ (
+		"0:	lr.w     %[p],  %[c]\n"
+		"	sub      %[rc], %[p], %[o]\n"
+		"	bltz     %[rc], 1f\n"
+		"	sc.w.rl  %[rc], %[rc], %[c]\n"
+		"	bnez     %[rc], 0b\n"
+		"	fence    rw, rw\n"
+		"1:\n"
+		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
+		: [o]"r" (offset)
+		: "memory");
+	return prev - offset;
+}
+
+#define atomic_dec_if_positive(v)	atomic_sub_if_positive(v, 1)
+
+#endif /* _ASM_RISCV_ATOMIC_H */
diff --git a/xen/arch/riscv/include/asm/bitops.h b/xen/arch/riscv/include/asm/bitops.h
new file mode 100644
index 0000000000..edb0f35449
--- /dev/null
+++ b/xen/arch/riscv/include/asm/bitops.h
@@ -0,0 +1,397 @@
+/*
+ * Copyright (C) 2012 Regents of the University of California
+ *
+ *   This program is free software; you can redistribute it and/or
+ *   modify it under the terms of the GNU General Public License
+ *   as published by the Free Software Foundation, version 2.
+ *
+ *   This program is distributed in the hope that it will be useful,
+ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *   GNU General Public License for more details.
+ */
+
+#ifndef _ASM_RISCV_BITOPS_H
+#define _ASM_RISCV_BITOPS_H
+
+#include <asm/system.h>
+
+#define BITS_PER_WORD           32
+#define BIT_ULL(nr)		(1ULL << (nr))
+#define BIT_MASK(nr)		(1UL << ((nr) % BITS_PER_LONG))
+#define BIT_WORD(nr)		((nr) / BITS_PER_LONG)
+#define BIT_ULL_MASK(nr)	(1ULL << ((nr) % BITS_PER_LONG_LONG))
+#define BIT_ULL_WORD(nr)	((nr) / BITS_PER_LONG_LONG)
+#define BITS_PER_BYTE		8
+
+#define __set_bit(n,p)            set_bit(n,p)
+#define __clear_bit(n,p)          clear_bit(n,p)
+
+#ifndef smp_mb__before_clear_bit
+#define smp_mb__before_clear_bit()  smp_mb()
+#define smp_mb__after_clear_bit()   smp_mb()
+#endif /* smp_mb__before_clear_bit */
+
+#if (BITS_PER_LONG == 64)
+#define __AMO(op)	"amo" #op ".d"
+#elif (BITS_PER_LONG == 32)
+#define __AMO(op)	"amo" #op ".w"
+#else
+#error "Unexpected BITS_PER_LONG"
+#endif
+
+#define __test_and_op_bit_ord(op, mod, nr, addr, ord)		\
+({								\
+	unsigned long __res, __mask;				\
+	__mask = BIT_MASK(nr);					\
+	__asm__ __volatile__ (					\
+		__AMO(op) #ord " %0, %2, %1"			\
+		: "=r" (__res), "+A" (addr[BIT_WORD(nr)])	\
+		: "r" (mod(__mask))				\
+		: "memory");					\
+	((__res & __mask) != 0);				\
+})
+
+#define __op_bit_ord(op, mod, nr, addr, ord)			\
+	__asm__ __volatile__ (					\
+		__AMO(op) #ord " zero, %1, %0"			\
+		: "+A" (addr[BIT_WORD(nr)])			\
+		: "r" (mod(BIT_MASK(nr)))			\
+		: "memory");
+
+#define __test_and_op_bit(op, mod, nr, addr) 			\
+	__test_and_op_bit_ord(op, mod, nr, addr, .aqrl)
+#define __op_bit(op, mod, nr, addr)				\
+	__op_bit_ord(op, mod, nr, addr, )
+
+/* Bitmask modifiers */
+#define __NOP(x)	(x)
+#define __NOT(x)	(~(x))
+
+/**
+ * __test_and_set_bit - Set a bit and return its old value
+ * @nr: Bit to set
+ * @addr: Address to count from
+ *
+ * This operation may be reordered on other architectures than x86.
+ */
+static inline int __test_and_set_bit(int nr, volatile void *p)
+{
+	volatile unsigned long *addr = p;
+
+	return __test_and_op_bit(or, __NOP, nr, addr);
+}
+
+/**
+ * __test_and_clear_bit - Clear a bit and return its old value
+ * @nr: Bit to clear
+ * @addr: Address to count from
+ *
+ * This operation can be reordered on other architectures other than x86.
+ */
+static inline int __test_and_clear_bit(int nr, volatile void *p)
+{
+	volatile unsigned long *addr = p;
+
+	return __test_and_op_bit(and, __NOT, nr, addr);
+}
+
+/**
+ * __test_and_change_bit - Change a bit and return its old value
+ * @nr: Bit to change
+ * @addr: Address to count from
+ *
+ * This operation is atomic and cannot be reordered.
+ * It also implies a memory barrier.
+ */
+static inline int __test_and_change_bit(int nr, volatile void *p)
+{
+	volatile unsigned long *addr = p;
+
+	return __test_and_op_bit(xor, __NOP, nr, addr);
+}
+
+/**
+ * set_bit - Atomically set a bit in memory
+ * @nr: the bit to set
+ * @addr: the address to start counting from
+ *
+ * Note: there are no guarantees that this function will not be reordered
+ * on non x86 architectures, so if you are writing portable code,
+ * make sure not to rely on its reordering guarantees.
+ *
+ * Note that @nr may be almost arbitrarily large; this function is not
+ * restricted to acting on a single-word quantity.
+ */
+static inline void set_bit(int nr, volatile void *p)
+{
+	volatile unsigned long *addr = p;
+
+	__op_bit(or, __NOP, nr, addr);
+}
+
+/**
+ * clear_bit - Clears a bit in memory
+ * @nr: Bit to clear
+ * @addr: Address to start counting from
+ *
+ * Note: there are no guarantees that this function will not be reordered
+ * on non x86 architectures, so if you are writing portable code,
+ * make sure not to rely on its reordering guarantees.
+ */
+static inline void clear_bit(int nr, volatile void *p)
+{
+	volatile unsigned long *addr = p;
+
+	__op_bit(and, __NOT, nr, addr);
+}
+
+static inline int test_bit(int nr, const volatile void *p)
+{
+	const volatile unsigned long *addr = (const volatile unsigned long *)p;
+
+	return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
+}
+
+/**
+ * change_bit - Toggle a bit in memory
+ * @nr: Bit to change
+ * @addr: Address to start counting from
+ *
+ * change_bit()  may be reordered on other architectures than x86.
+ * Note that @nr may be almost arbitrarily large; this function is not
+ * restricted to acting on a single-word quantity.
+ */
+static inline void change_bit(int nr, volatile void *p)
+{
+	volatile unsigned long *addr = p;
+
+	__op_bit(xor, __NOP, nr, addr);
+}
+
+/**
+ * test_and_set_bit_lock - Set a bit and return its old value, for lock
+ * @nr: Bit to set
+ * @addr: Address to count from
+ *
+ * This operation is atomic and provides acquire barrier semantics.
+ * It can be used to implement bit locks.
+ */
+static inline int test_and_set_bit_lock(
+	unsigned long nr, volatile void *p)
+{
+	volatile unsigned long *addr = p;
+
+	return __test_and_op_bit_ord(or, __NOP, nr, addr, .aq);
+}
+
+/**
+ * clear_bit_unlock - Clear a bit in memory, for unlock
+ * @nr: the bit to set
+ * @addr: the address to start counting from
+ *
+ * This operation is atomic and provides release barrier semantics.
+ */
+static inline void clear_bit_unlock(
+	unsigned long nr, volatile void *p)
+{
+	volatile unsigned long *addr = p;
+
+	__op_bit_ord(and, __NOT, nr, addr, .rl);
+}
+
+/**
+ * __clear_bit_unlock - Clear a bit in memory, for unlock
+ * @nr: the bit to set
+ * @addr: the address to start counting from
+ *
+ * This operation is like clear_bit_unlock, however it is not atomic.
+ * It does provide release barrier semantics so it can be used to unlock
+ * a bit lock, however it would only be used if no other CPU can modify
+ * any bits in the memory until the lock is released (a good example is
+ * if the bit lock itself protects access to the other bits in the word).
+ *
+ * On RISC-V systems there seems to be no benefit to taking advantage of the
+ * non-atomic property here: it's a lot more instructions and we still have to
+ * provide release semantics anyway.
+ */
+static inline void __clear_bit_unlock(
+	unsigned long nr, volatile unsigned long *addr)
+{
+	clear_bit_unlock(nr, addr);
+}
+
+#undef __test_and_op_bit
+#undef __op_bit
+#undef __NOP
+#undef __NOT
+#undef __AMO
+
+static inline int fls(unsigned int x)
+{
+    return generic_fls(x);
+}
+
+static inline int flsl(unsigned long x)
+{
+   return generic_flsl(x);
+}
+
+
+#define test_and_set_bit   __test_and_set_bit
+#define test_and_clear_bit __test_and_clear_bit
+
+/* Based on linux/include/asm-generic/bitops/find.h */
+
+#ifndef find_next_bit
+/**
+ * find_next_bit - find the next set bit in a memory region
+ * @addr: The address to base the search on
+ * @offset: The bitnumber to start searching at
+ * @size: The bitmap size in bits
+ */
+extern unsigned long find_next_bit(const unsigned long *addr, unsigned long
+		size, unsigned long offset);
+#endif
+
+#ifndef find_next_zero_bit
+/**
+ * find_next_zero_bit - find the next cleared bit in a memory region
+ * @addr: The address to base the search on
+ * @offset: The bitnumber to start searching at
+ * @size: The bitmap size in bits
+ */
+extern unsigned long find_next_zero_bit(const unsigned long *addr, unsigned
+		long size, unsigned long offset);
+#endif
+
+/**
+ * find_first_bit - find the first set bit in a memory region
+ * @addr: The address to start the search at
+ * @size: The maximum size to search
+ *
+ * Returns the bit number of the first set bit.
+ */
+extern unsigned long find_first_bit(const unsigned long *addr,
+				    unsigned long size);
+
+/**
+ * find_first_zero_bit - find the first cleared bit in a memory region
+ * @addr: The address to start the search at
+ * @size: The maximum size to search
+ *
+ * Returns the bit number of the first cleared bit.
+ */
+extern unsigned long find_first_zero_bit(const unsigned long *addr,
+					 unsigned long size);
+
+#define ffs(x) ({ unsigned int __t = (x); fls(__t & -__t); })
+/**
+ * ffs - find first bit in word.
+ * @word: The word to search
+ *
+ * Returns 0 if no bit exists, otherwise returns 1-indexed bit location.
+ */
+static inline unsigned long __ffs(unsigned long word)
+{
+	int num = 0;
+
+#if BITS_PER_LONG == 64
+	if ((word & 0xffffffff) == 0) {
+		num += 32;
+		word >>= 32;
+	}
+#endif
+	if ((word & 0xffff) == 0) {
+		num += 16;
+		word >>= 16;
+	}
+	if ((word & 0xff) == 0) {
+		num += 8;
+		word >>= 8;
+	}
+	if ((word & 0xf) == 0) {
+		num += 4;
+		word >>= 4;
+	}
+	if ((word & 0x3) == 0) {
+		num += 2;
+		word >>= 2;
+	}
+	if ((word & 0x1) == 0)
+		num += 1;
+	return num;
+}
+
+/**
+ * ffsl - find first bit in long.
+ * @word: The word to search
+ *
+ * Returns 0 if no bit exists, otherwise returns 1-indexed bit location.
+ */
+static inline unsigned int ffsl(unsigned long word)
+{
+    int num = 1;
+
+    if (!word)
+        return 0;
+
+#if BITS_PER_LONG == 64
+    if ((word & 0xffffffff) == 0) {
+        num += 32;
+        word >>= 32;
+    }
+#endif
+    if ((word & 0xffff) == 0) {
+        num += 16;
+        word >>= 16;
+    }
+    if ((word & 0xff) == 0) {
+        num += 8;
+        word >>= 8;
+    }
+    if ((word & 0xf) == 0) {
+        num += 4;
+        word >>= 4;
+    }
+    if ((word & 0x3) == 0) {
+        num += 2;
+        word >>= 2;
+    }
+    if ((word & 0x1) == 0)
+        num += 1;
+    return num;
+}
+
+/*
+ * ffz - find first zero in word.
+ * @word: The word to search
+ *
+ * Undefined if no zero exists, so code should check against ~0UL first.
+ */
+#define ffz(x)  ffs(~(x))
+
+/**
+ * find_first_set_bit - find the first set bit in @word
+ * @word: the word to search
+ *
+ * Returns the bit-number of the first set bit (first bit being 0).
+ * The input must *not* be zero.
+ */
+static inline unsigned int find_first_set_bit(unsigned long word)
+{
+        return ffsl(word) - 1;
+}
+
+/**
+ * hweightN - returns the hamming weight of a N-bit word
+ * @x: the word to weigh
+ *
+ * The Hamming Weight of a number is the total number of bits set in it.
+ */
+#define hweight64(x) generic_hweight64(x)
+#define hweight32(x) generic_hweight32(x)
+#define hweight16(x) generic_hweight16(x)
+#define hweight8(x) generic_hweight8(x)
+
+#endif /* _ASM_RISCV_BITOPS_H */
diff --git a/xen/arch/riscv/include/asm/bug.h b/xen/arch/riscv/include/asm/bug.h
new file mode 100644
index 0000000000..2616c9ced1
--- /dev/null
+++ b/xen/arch/riscv/include/asm/bug.h
@@ -0,0 +1,67 @@
+/*
+ * Copyright (C) 2012 Regents of the University of California
+ * Copyright (C) 2021 Vates
+ *
+ *   This program is free software; you can redistribute it and/or
+ *   modify it under the terms of the GNU General Public License
+ *   as published by the Free Software Foundation, version 2.
+ *
+ *   This program is distributed in the hope that it will be useful,
+ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *   GNU General Public License for more details.
+ */
+
+#ifndef _ASM_RISCV_BUG_H
+#define _ASM_RISCV_BUG_H
+
+#define BUGFRAME_NR     3
+
+struct bug_frame {
+    signed int loc_disp;    /* Relative address to the bug address */
+    signed int file_disp;   /* Relative address to the filename */
+    signed int msg_disp;    /* Relative address to the predicate (for ASSERT) */
+    uint16_t line;          /* Line number */
+    uint32_t pad0:16;       /* Padding for 8-bytes align */
+};
+
+#ifndef __ASSEMBLY__
+
+#define BUG()							\
+do {								\
+	__asm__ __volatile__ ("ebreak\n");			\
+	unreachable();						\
+} while (0)
+
+#define WARN()             \
+do {                \
+  __asm__ __volatile__ ("ebreak\n");      \
+} while (0)
+
+#endif /* !__ASSEMBLY__ */
+
+#ifndef __ASSEMBLY__
+
+struct pt_regs;
+struct task_struct;
+
+#endif /* !__ASSEMBLY__ */
+
+#define assert_failed(msg) do {                                \
+    BUG();                                                     \
+    unreachable();                                             \
+} while (0)
+
+extern const struct bug_frame __start_bug_frames[],
+                              __stop_bug_frames_0[],
+                              __stop_bug_frames_1[],
+                              __stop_bug_frames_2[],
+                              __stop_bug_frames_3[];
+
+#define run_in_exception_handler(fn) do {                                   \
+        asm ("add a0, %0, zero"                                             \
+                :: "r" (fn));                                               \
+        BUG();                                                              \
+    } while( 0 )
+
+#endif /* _ASM_RISCV_BUG_H */
diff --git a/xen/arch/riscv/include/asm/byteorder.h b/xen/arch/riscv/include/asm/byteorder.h
new file mode 100644
index 0000000000..320a03c88f
--- /dev/null
+++ b/xen/arch/riscv/include/asm/byteorder.h
@@ -0,0 +1,16 @@
+#ifndef __ASM_RISCV_BYTEORDER_H__
+#define __ASM_RISCV_BYTEORDER_H__
+
+#define __BYTEORDER_HAS_U64__
+
+#include <xen/byteorder/little_endian.h>
+
+#endif /* __ASM_RISCV_BYTEORDER_H__ */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/include/asm/cache.h b/xen/arch/riscv/include/asm/cache.h
new file mode 100644
index 0000000000..1fdc702828
--- /dev/null
+++ b/xen/arch/riscv/include/asm/cache.h
@@ -0,0 +1,24 @@
+/*
+ * Copyright (C) 2017 Chen Liqin <liqin.chen@sunplusct.com>
+ * Copyright (C) 2012 Regents of the University of California
+ *
+ *   This program is free software; you can redistribute it and/or
+ *   modify it under the terms of the GNU General Public License
+ *   as published by the Free Software Foundation, version 2.
+ *
+ *   This program is distributed in the hope that it will be useful,
+ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *   GNU General Public License for more details.
+ */
+
+#ifndef _ASM_RISCV_CACHE_H
+#define _ASM_RISCV_CACHE_H
+
+#define L1_CACHE_SHIFT		6
+
+#define L1_CACHE_BYTES		(1 << L1_CACHE_SHIFT)
+
+#define __read_mostly __section(".data.read_mostly")
+
+#endif /* _ASM_RISCV_CACHE_H */
diff --git a/xen/arch/riscv/include/asm/cmpxchg.h b/xen/arch/riscv/include/asm/cmpxchg.h
new file mode 100644
index 0000000000..256facce13
--- /dev/null
+++ b/xen/arch/riscv/include/asm/cmpxchg.h
@@ -0,0 +1,382 @@
+/*
+ * Copyright (C) 2014 Regents of the University of California
+ *
+ *   This program is free software; you can redistribute it and/or
+ *   modify it under the terms of the GNU General Public License
+ *   as published by the Free Software Foundation, version 2.
+ *
+ *   This program is distributed in the hope that it will be useful,
+ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *   GNU General Public License for more details.
+ */
+
+#ifndef _ASM_RISCV_CMPXCHG_H
+#define _ASM_RISCV_CMPXCHG_H
+
+#include <asm/system.h>
+#include <asm/fence.h>
+#include <xen/lib.h>
+
+#define __xchg_relaxed(ptr, new, size)					\
+({									\
+	__typeof__(ptr) __ptr = (ptr);					\
+	__typeof__(new) __new = (new);					\
+	__typeof__(*(ptr)) __ret;					\
+	switch (size) {							\
+	case 4:								\
+		__asm__ __volatile__ (					\
+			"	amoswap.w %0, %2, %1\n"			\
+			: "=r" (__ret), "+A" (*__ptr)			\
+			: "r" (__new)					\
+			: "memory");					\
+		break;							\
+	case 8:								\
+		__asm__ __volatile__ (					\
+			"	amoswap.d %0, %2, %1\n"			\
+			: "=r" (__ret), "+A" (*__ptr)			\
+			: "r" (__new)					\
+			: "memory");					\
+		break;							\
+	default:							\
+		ASSERT_UNREACHABLE();					\
+	}								\
+	__ret;								\
+})
+
+#define xchg_relaxed(ptr, x)						\
+({									\
+	__typeof__(*(ptr)) _x_ = (x);					\
+	(__typeof__(*(ptr))) __xchg_relaxed((ptr),			\
+					    _x_, sizeof(*(ptr)));	\
+})
+
+#define __xchg_acquire(ptr, new, size)					\
+({									\
+	__typeof__(ptr) __ptr = (ptr);					\
+	__typeof__(new) __new = (new);					\
+	__typeof__(*(ptr)) __ret;					\
+	switch (size) {							\
+	case 4:								\
+		__asm__ __volatile__ (					\
+			"	amoswap.w %0, %2, %1\n"			\
+			RISCV_ACQUIRE_BARRIER				\
+			: "=r" (__ret), "+A" (*__ptr)			\
+			: "r" (__new)					\
+			: "memory");					\
+		break;							\
+	case 8:								\
+		__asm__ __volatile__ (					\
+			"	amoswap.d %0, %2, %1\n"			\
+			RISCV_ACQUIRE_BARRIER				\
+			: "=r" (__ret), "+A" (*__ptr)			\
+			: "r" (__new)					\
+			: "memory");					\
+		break;							\
+	default:							\
+		ASSERT_UNREACHABLE();					\
+	}								\
+	__ret;								\
+})
+
+#define xchg_acquire(ptr, x)						\
+({									\
+	__typeof__(*(ptr)) _x_ = (x);					\
+	(__typeof__(*(ptr))) __xchg_acquire((ptr),			\
+					    _x_, sizeof(*(ptr)));	\
+})
+
+#define __xchg_release(ptr, new, size)					\
+({									\
+	__typeof__(ptr) __ptr = (ptr);					\
+	__typeof__(new) __new = (new);					\
+	__typeof__(*(ptr)) __ret;					\
+	switch (size) {							\
+	case 4:								\
+		__asm__ __volatile__ (					\
+			RISCV_RELEASE_BARRIER				\
+			"	amoswap.w %0, %2, %1\n"			\
+			: "=r" (__ret), "+A" (*__ptr)			\
+			: "r" (__new)					\
+			: "memory");					\
+		break;							\
+	case 8:								\
+		__asm__ __volatile__ (					\
+			RISCV_RELEASE_BARRIER				\
+			"	amoswap.d %0, %2, %1\n"			\
+			: "=r" (__ret), "+A" (*__ptr)			\
+			: "r" (__new)					\
+			: "memory");					\
+		break;							\
+	default:							\
+		ASSERT_UNREACHABLE();					\
+	}								\
+	__ret;								\
+})
+
+#define xchg_release(ptr, x)						\
+({									\
+	__typeof__(*(ptr)) _x_ = (x);					\
+	(__typeof__(*(ptr))) __xchg_release((ptr),			\
+					    _x_, sizeof(*(ptr)));	\
+})
+
+#define __xchg(ptr, new, size)						\
+({									\
+	__typeof__(ptr) __ptr = (ptr);					\
+	__typeof__(new) __new = (new);					\
+	__typeof__(*(ptr)) __ret;					\
+	switch (size) {							\
+	case 4:								\
+		__asm__ __volatile__ (					\
+			"	amoswap.w.aqrl %0, %2, %1\n"		\
+			: "=r" (__ret), "+A" (*__ptr)			\
+			: "r" (__new)					\
+			: "memory");					\
+		break;							\
+	case 8:								\
+		__asm__ __volatile__ (					\
+			"	amoswap.d.aqrl %0, %2, %1\n"		\
+			: "=r" (__ret), "+A" (*__ptr)			\
+			: "r" (__new)					\
+			: "memory");					\
+		break;							\
+	default:							\
+		ASSERT_UNREACHABLE();					\
+	}								\
+	__ret;								\
+})
+
+#define xchg(ptr, x)							\
+({									\
+	__typeof__(*(ptr)) _x_ = (x);					\
+	(__typeof__(*(ptr))) __xchg((ptr), _x_, sizeof(*(ptr)));	\
+})
+
+#define xchg32(ptr, x)							\
+({									\
+	BUILD_BUG_ON(sizeof(*(ptr)) != 4);				\
+	xchg((ptr), (x));						\
+})
+
+#define xchg64(ptr, x)							\
+({									\
+	BUILD_BUG_ON(sizeof(*(ptr)) != 8);				\
+	xchg((ptr), (x));						\
+})
+
+/*
+ * Atomic compare and exchange.  Compare OLD with MEM, if identical,
+ * store NEW in MEM.  Return the initial value in MEM.  Success is
+ * indicated by comparing RETURN with OLD.
+ */
+#define __cmpxchg_relaxed(ptr, old, new, size)				\
+({									\
+	__typeof__(ptr) __ptr = (ptr);					\
+	__typeof__(*(ptr)) __old = (old);				\
+	__typeof__(*(ptr)) __new = (new);				\
+	__typeof__(*(ptr)) __ret;					\
+	register unsigned int __rc;					\
+	switch (size) {							\
+	case 4:								\
+		__asm__ __volatile__ (					\
+			"0:	lr.w %0, %2\n"				\
+			"	bne  %0, %z3, 1f\n"			\
+			"	sc.w %1, %z4, %2\n"			\
+			"	bnez %1, 0b\n"				\
+			"1:\n"						\
+			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
+			: "rJ" (__old), "rJ" (__new)			\
+			: "memory");					\
+		break;							\
+	case 8:								\
+		__asm__ __volatile__ (					\
+			"0:	lr.d %0, %2\n"				\
+			"	bne %0, %z3, 1f\n"			\
+			"	sc.d %1, %z4, %2\n"			\
+			"	bnez %1, 0b\n"				\
+			"1:\n"						\
+			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
+			: "rJ" (__old), "rJ" (__new)			\
+			: "memory");					\
+		break;							\
+	default:							\
+		ASSERT_UNREACHABLE();					\
+	}								\
+	__ret;								\
+})
+
+#define cmpxchg_relaxed(ptr, o, n)					\
+({									\
+	__typeof__(*(ptr)) _o_ = (o);					\
+	__typeof__(*(ptr)) _n_ = (n);					\
+	(__typeof__(*(ptr))) __cmpxchg_relaxed((ptr),			\
+					_o_, _n_, sizeof(*(ptr)));	\
+})
+
+#define __cmpxchg_acquire(ptr, old, new, size)				\
+({									\
+	__typeof__(ptr) __ptr = (ptr);					\
+	__typeof__(*(ptr)) __old = (old);				\
+	__typeof__(*(ptr)) __new = (new);				\
+	__typeof__(*(ptr)) __ret;					\
+	register unsigned int __rc;					\
+	switch (size) {							\
+	case 4:								\
+		__asm__ __volatile__ (					\
+			"0:	lr.w %0, %2\n"				\
+			"	bne  %0, %z3, 1f\n"			\
+			"	sc.w %1, %z4, %2\n"			\
+			"	bnez %1, 0b\n"				\
+			RISCV_ACQUIRE_BARRIER				\
+			"1:\n"						\
+			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
+			: "rJ" (__old), "rJ" (__new)			\
+			: "memory");					\
+		break;							\
+	case 8:								\
+		__asm__ __volatile__ (					\
+			"0:	lr.d %0, %2\n"				\
+			"	bne %0, %z3, 1f\n"			\
+			"	sc.d %1, %z4, %2\n"			\
+			"	bnez %1, 0b\n"				\
+			RISCV_ACQUIRE_BARRIER				\
+			"1:\n"						\
+			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
+			: "rJ" (__old), "rJ" (__new)			\
+			: "memory");					\
+		break;							\
+	default:							\
+		ASSERT_UNREACHABLE();					\
+	}								\
+	__ret;								\
+})
+
+#define cmpxchg_acquire(ptr, o, n)					\
+({									\
+	__typeof__(*(ptr)) _o_ = (o);					\
+	__typeof__(*(ptr)) _n_ = (n);					\
+	(__typeof__(*(ptr))) __cmpxchg_acquire((ptr),			\
+					_o_, _n_, sizeof(*(ptr)));	\
+})
+
+#define __cmpxchg_release(ptr, old, new, size)				\
+({									\
+	__typeof__(ptr) __ptr = (ptr);					\
+	__typeof__(*(ptr)) __old = (old);				\
+	__typeof__(*(ptr)) __new = (new);				\
+	__typeof__(*(ptr)) __ret;					\
+	register unsigned int __rc;					\
+	switch (size) {							\
+	case 4:								\
+		__asm__ __volatile__ (					\
+			RISCV_RELEASE_BARRIER				\
+			"0:	lr.w %0, %2\n"				\
+			"	bne  %0, %z3, 1f\n"			\
+			"	sc.w %1, %z4, %2\n"			\
+			"	bnez %1, 0b\n"				\
+			"1:\n"						\
+			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
+			: "rJ" (__old), "rJ" (__new)			\
+			: "memory");					\
+		break;							\
+	case 8:								\
+		__asm__ __volatile__ (					\
+			RISCV_RELEASE_BARRIER				\
+			"0:	lr.d %0, %2\n"				\
+			"	bne %0, %z3, 1f\n"			\
+			"	sc.d %1, %z4, %2\n"			\
+			"	bnez %1, 0b\n"				\
+			"1:\n"						\
+			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
+			: "rJ" (__old), "rJ" (__new)			\
+			: "memory");					\
+		break;							\
+	default:							\
+		ASSERT_UNREACHABLE();					\
+	}								\
+	__ret;								\
+})
+
+#define cmpxchg_release(ptr, o, n)					\
+({									\
+	__typeof__(*(ptr)) _o_ = (o);					\
+	__typeof__(*(ptr)) _n_ = (n);					\
+	(__typeof__(*(ptr))) __cmpxchg_release((ptr),			\
+					_o_, _n_, sizeof(*(ptr)));	\
+})
+
+#define __cmpxchg(ptr, old, new, size)					\
+({									\
+	__typeof__(ptr) __ptr = (ptr);					\
+	__typeof__(*(ptr)) __old = (__typeof__(*(ptr)))(old);				\
+	__typeof__(*(ptr)) __new = (__typeof__(*(ptr)))(new);				\
+	__typeof__(*(ptr)) __ret;					\
+	register unsigned int __rc;					\
+	switch (size) {							\
+	case 4:								\
+		__asm__ __volatile__ (					\
+			"0:	lr.w %0, %2\n"				\
+			"	bne  %0, %z3, 1f\n"			\
+			"	sc.w.rl %1, %z4, %2\n"			\
+			"	bnez %1, 0b\n"				\
+			"	fence rw, rw\n"				\
+			"1:\n"						\
+			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
+			: "rJ" (__old), "rJ" (__new)			\
+			: "memory");					\
+		break;							\
+	case 8:								\
+		__asm__ __volatile__ (					\
+			"0:	lr.d %0, %2\n"				\
+			"	bne %0, %z3, 1f\n"			\
+			"	sc.d.rl %1, %z4, %2\n"			\
+			"	bnez %1, 0b\n"				\
+			"	fence rw, rw\n"				\
+			"1:\n"						\
+			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
+			: "rJ" (__old), "rJ" (__new)			\
+			: "memory");					\
+		break;							\
+	default:							\
+		ASSERT_UNREACHABLE();					\
+	}								\
+	__ret;								\
+})
+
+#define cmpxchg(ptr, o, n)						\
+({									\
+	__typeof__(*(ptr)) _o_ = (o);					\
+	__typeof__(*(ptr)) _n_ = (n);					\
+	(__typeof__(*(ptr))) __cmpxchg((ptr),				\
+				       _o_, _n_, sizeof(*(ptr)));	\
+})
+
+#define cmpxchg_local(ptr, o, n)					\
+	(__cmpxchg_relaxed((ptr), (o), (n), sizeof(*(ptr))))
+
+#define cmpxchg32(ptr, o, n)						\
+({									\
+	BUILD_BUG_ON(sizeof(*(ptr)) != 4);				\
+	cmpxchg((ptr), (o), (n));					\
+})
+
+#define cmpxchg32_local(ptr, o, n)					\
+({									\
+	BUILD_BUG_ON(sizeof(*(ptr)) != 4);				\
+	cmpxchg_relaxed((ptr), (o), (n))				\
+})
+
+#define cmpxchg64(ptr, o, n)						\
+({									\
+	BUILD_BUG_ON(sizeof(*(ptr)) != 8);				\
+	cmpxchg((ptr), (o), (n));					\
+})
+
+#define cmpxchg64_local(ptr, o, n)					\
+({									\
+	BUILD_BUG_ON(sizeof(*(ptr)) != 8);				\
+	cmpxchg_relaxed((ptr), (o), (n));				\
+})
+
+#endif /* _ASM_RISCV_CMPXCHG_H */
diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
index e2ae21de61..1ca898bde5 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -1,6 +1,38 @@
 #ifndef __RISCV_CONFIG_H__
 #define __RISCV_CONFIG_H__
 
+#include <xen/const.h>
+#include <xen/page-size.h>
+#include <asm/page-bits.h>
+
+/*
+ * RISC-V Layout:
+ *   0  -   2M   Unmapped
+ *   2M -   4M   Xen text, data, bss
+ *   4M -   6M   Fixmap: special-purpose 4K mapping slots
+ *   6M -  10M   Early boot mapping of FDT
+ *   10M - 12M   Early relocation address (used when relocating Xen)
+ *               and later for livepatch vmap (if compiled in)
+ *
+ *   All of the above is mapped in L2 slot[0] (except for Unmapped)
+ *
+ *   1G - 2G   VMAP: ioremap and early_ioremap (L2 slot 2)
+ *
+ *   2G - 5G: Unused
+ *
+ *   5G - 8G
+ *   0x140000000 - 0x200000000
+ *   Frametable: 24 bytes per page for 371GB of RAM, GB-aligned (slightly over 2GB, L2 slots [6..7])
+ *
+ *   8G - 12G : Unused
+ *
+ *   0x300000000  - 0x5fffffffff : 371GB, L2 Slots [12...384)
+ *   1:1 mapping of RAM
+ *
+ *   0x6000000000 - 0x7fffffffff : 127GB, L2 slots [384..512)
+ *   Unused
+ */
+
 #if defined(CONFIG_RISCV_64)
 # define LONG_BYTEORDER 3
 # define ELFSIZE 64
@@ -26,14 +58,123 @@
 #define OPT_CONSOLE_STR "dtuart"
 #define INVALID_VCPU_ID MAX_VIRT_CPUS
 
+#ifdef CONFIG_RISCV_64
+
+/* Bit counts for virtual address fields (sv39) */
+#define VPN2_BITS   (9)
+#define VPN1_BITS   (9)
+#define VPN0_BITS   (9)
+#define OFFSET_BITS (12)
+
+/* SLOT2_ENTRY_BITS == 30 */
+#define SLOT2_ENTRY_BITS  (VPN1_BITS + VPN2_BITS + OFFSET_BITS)
+#define SLOT2(slot) (_AT(vaddr_t,slot) << SLOT2_ENTRY_BITS)
+#define SLOT2_ENTRY_SIZE  SLOT2(1)
+
+#define DIRECTMAP_VIRT_START   SLOT2(12)
+
+/* See above "RISC-V Layout" for description of layout (and
+ * where these magic numbers come from */
+#define DIRECTMAP_SIZE         (SLOT2_ENTRY_SIZE * (384-12))
+#define DIRECTMAP_VIRT_END     (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE - 1)
+#define XENHEAP_VIRT_START     xenheap_virt_start
+#define HYPERVISOR_VIRT_END    DIRECTMAP_VIRT_END
+
+#else /* RISCV_32 */
+#error "RISC-V 32-bit is not supported yet"
+#endif
+
+#define FIXMAP_CONSOLE  0  /* The primary UART */
+#define FIXMAP_MISC     1  /* Ephemeral mappings of hardware */
+
+#define CONFIG_PAGING_LEVELS 3
+
+#define CONFIG_PAGEALLOC_MAX_ORDER 18
+#define CONFIG_DOMU_MAX_ORDER      9
+#define CONFIG_HWDOM_MAX_ORDER     10
+
+#ifdef CONFIG_RISCV_64
+#define MAX_VIRT_CPUS 128u
+#else
+#define MAX_VIRT_CPUS 8u
+#endif
+
+#define XEN_VIRT_START         _AT(vaddr_t,0x00200000)
+#define XEN_VIRT_END           _AT(vaddr_t,0x40000000)
+#define FIXMAP_ADDR(n)        (_AT(vaddr_t,0x00400000) + (n) * PAGE_SIZE)
+
+#define BOOT_FDT_VIRT_START    _AT(vaddr_t,0x00600000)
+#define BOOT_FDT_SLOT_SIZE     MB(4)
+#define BOOT_FDT_VIRT_END      (BOOT_FDT_VIRT_START + BOOT_FDT_SLOT_SIZE)
+
+
+#define HYPERVISOR_VIRT_START  XEN_VIRT_START
+
+#define INVALID_VCPU_ID MAX_VIRT_CPUS
+
+#define STACK_ORDER 3
+#define STACK_SIZE  (PAGE_SIZE << STACK_ORDER)
+
+#define VMAP_VIRT_START  GB(1)
+#define VMAP_VIRT_END    (VMAP_VIRT_START + GB(1))
+
+#define FRAMETABLE_VIRT_START  GB(5)
+#define FRAMETABLE_SIZE        GB(1)
+#define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
+#define FRAMETABLE_VIRT_END    (FRAMETABLE_VIRT_START + FRAMETABLE_SIZE - 1)
+
+/**
+ * All RISC-V implementations (except for with C extension) enforce 32-bit
+ * instruction address alignment.  With C extension, 16-bit and 32-bit are
+ * both allowed.
+ */
+#ifndef __ALIGN
+#define __ALIGN     .align 4
+#define __ALIGN_STR ".align 4"
+#endif
+
 /* Linkage for RISCV */
 #ifdef __ASSEMBLY__
-#define ALIGN .align 2
+#define ALIGN __ALIGN
+#define ALIGN_STR __ALIGN_STR
+
+#define ENTRY(name)                                     \
+  .globl name;                                          \
+  ALIGN;                                                \
+  name:
 
-#define ENTRY(name)                                \
-  .globl name;                                     \
-  ALIGN;                                           \
+#define GLOBAL(name)                                    \
+  .globl name;                                          \
   name:
+
+#define WEAK(name)                                      \
+  .weak name;                                           \
+  ALIGN;                                                \
+  name:
+
+#define END(name)                                       \
+  .size name, .-name
+
+#ifndef ASM_NL
+#define ASM_NL		 ;
+#endif
+
+#define SYM_END(name, sym_type)				            \
+  .type name sym_type ASM_NL			                \
+  .size name, .-name
+
+#define SYM_FUNC_END(name)				                \
+  SYM_END(name, STT_FUNC)
+
+/* If symbol 'name' is treated as a subroutine (gets called, and returns)
+ * then please use ENDPROC to mark 'name' as STT_FUNC for the benefit of
+ * static analysis tools such as stack depth analyzer.
+ */
+#define ENDPROC(name) \
+  SYM_FUNC_END(name)
+
+#define __PAGE_ALIGNED_DATA	.section ".data..page_aligned", "aw"
+#define __PAGE_ALIGNED_BSS	.section ".bss..page_aligned", "aw"
 #endif
 
 #endif /* __RISCV_CONFIG_H__ */
diff --git a/xen/arch/riscv/include/asm/cpufeature.h b/xen/arch/riscv/include/asm/cpufeature.h
new file mode 100644
index 0000000000..45ad9dc69e
--- /dev/null
+++ b/xen/arch/riscv/include/asm/cpufeature.h
@@ -0,0 +1,68 @@
+#ifndef __ASM_RISCV_CPUFEATURE_H
+#define __ASM_RISCV_CPUFEATURE_H
+
+#define RISCV_NCAPS 1
+
+#ifndef __ASSEMBLY__
+
+#include <xen/types.h>
+#include <xen/lib.h>
+#include <xen/bitops.h>
+
+extern DECLARE_BITMAP(cpu_hwcaps, RISCV_NCAPS);
+
+static inline bool cpus_have_cap(unsigned int num)
+{
+    return false;
+}
+
+static inline int cpu_nr_siblings(unsigned int cpu)
+{
+    return 1;
+}
+
+static inline void cpus_set_cap(unsigned int num)
+{
+    if (num >= RISCV_NCAPS)
+        printk(XENLOG_WARNING "Attempt to set an illegal CPU capability (%d >= %d)\n",
+               num, RISCV_NCAPS);
+    else
+        __set_bit(num, cpu_hwcaps);
+}
+
+struct riscv_cpu_capabilities {
+};
+
+void update_cpu_capabilities(const struct riscv_cpu_capabilities *caps,
+                             const char *info);
+
+void enable_cpu_capabilities(const struct riscv_cpu_capabilities *caps);
+int enable_nonboot_cpu_caps(const struct riscv_cpu_capabilities *caps);
+
+/*
+ * capabilities of CPUs
+ */
+struct cpuinfo_riscv {
+};
+
+extern struct cpuinfo_riscv boot_cpu_data;
+
+extern void identify_cpu(struct cpuinfo_riscv *);
+
+extern struct cpuinfo_riscv cpu_data[];
+#define current_cpu_data cpu_data[smp_processor_id()]
+
+extern struct cpuinfo_riscv guest_cpuinfo;
+
+#endif /* __ASSEMBLY__ */
+
+#endif
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
+
diff --git a/xen/arch/riscv/include/asm/csr.h b/xen/arch/riscv/include/asm/csr.h
new file mode 100644
index 0000000000..2e2bf5d706
--- /dev/null
+++ b/xen/arch/riscv/include/asm/csr.h
@@ -0,0 +1,81 @@
+/*
+ * Take from Linux.
+ *
+ * SPDX-License-Identifier: GPL-2.0-only
+ *
+ * Copyright (C) 2015 Regents of the University of California
+ */
+
+#ifndef _ASM_RISCV_CSR_H
+#define _ASM_RISCV_CSR_H
+
+#include <asm/asm.h>
+#include <xen/const.h>
+#include <asm/riscv_encoding.h>
+
+
+#ifndef __ASSEMBLY__
+
+#define csr_swap(csr, val)					\
+({								\
+	unsigned long __v = (unsigned long)(val);		\
+	__asm__ __volatile__ ("csrrw %0, " __ASM_STR(csr) ", %1"\
+			      : "=r" (__v) : "rK" (__v)		\
+			      : "memory");			\
+	__v;							\
+})
+
+#define csr_read(csr)						\
+({								\
+	register unsigned long __v;				\
+	__asm__ __volatile__ ("csrr %0, " __ASM_STR(csr)	\
+			      : "=r" (__v) :			\
+			      : "memory");			\
+	__v;							\
+})
+
+#define csr_write(csr, val)					\
+({								\
+	unsigned long __v = (unsigned long)(val);		\
+	__asm__ __volatile__ ("csrw " __ASM_STR(csr) ", %0"	\
+			      : : "rK" (__v)			\
+			      : "memory");			\
+})
+
+#define csr_read_set(csr, val)					\
+({								\
+	unsigned long __v = (unsigned long)(val);		\
+	__asm__ __volatile__ ("csrrs %0, " __ASM_STR(csr) ", %1"\
+			      : "=r" (__v) : "rK" (__v)		\
+			      : "memory");			\
+	__v;							\
+})
+
+#define csr_set(csr, val)					\
+({								\
+	unsigned long __v = (unsigned long)(val);		\
+	__asm__ __volatile__ ("csrs " __ASM_STR(csr) ", %0"	\
+			      : : "rK" (__v)			\
+			      : "memory");			\
+})
+
+#define csr_read_clear(csr, val)				\
+({								\
+	unsigned long __v = (unsigned long)(val);		\
+	__asm__ __volatile__ ("csrrc %0, " __ASM_STR(csr) ", %1"\
+			      : "=r" (__v) : "rK" (__v)		\
+			      : "memory");			\
+	__v;							\
+})
+
+#define csr_clear(csr, val)					\
+({								\
+	unsigned long __v = (unsigned long)(val);		\
+	__asm__ __volatile__ ("csrc " __ASM_STR(csr) ", %0"	\
+			      : : "rK" (__v)			\
+			      : "memory");			\
+})
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* _ASM_RISCV_CSR_H */
diff --git a/xen/arch/riscv/include/asm/current.h b/xen/arch/riscv/include/asm/current.h
new file mode 100644
index 0000000000..82ed329289
--- /dev/null
+++ b/xen/arch/riscv/include/asm/current.h
@@ -0,0 +1,41 @@
+#ifndef __ASM_CURRENT_H
+#define __ASM_CURRENT_H
+
+#include <xen/percpu.h>
+#include <asm/processor.h>
+
+struct vcpu;
+
+/* Which VCPU is "current" on this PCPU. */
+DECLARE_PER_CPU(struct vcpu *, curr_vcpu);
+
+#define current            (this_cpu(curr_vcpu))
+#define set_current(vcpu)  do { current = (vcpu); } while (0)
+#define get_cpu_current(cpu)  (per_cpu(curr_vcpu, cpu))
+
+/* Per-VCPU state that lives at the top of the stack */
+struct cpu_info {
+    /* This should be the first member. */
+    struct cpu_user_regs guest_cpu_user_regs;
+};
+
+static inline struct cpu_info *get_cpu_info(void)
+{
+    register unsigned long sp asm ("sp");
+    return (struct cpu_info *)((sp & ~(STACK_SIZE - 1)) + STACK_SIZE - sizeof(struct cpu_info));
+}
+
+#define guest_cpu_user_regs() (&get_cpu_info()->guest_cpu_user_regs)
+#define guest_regs(vcpu) (&vcpu->arch.cpu_info->guest_cpu_user_regs)
+
+#define switch_stack_and_jump(stack, fn)                                \
+    asm volatile (                                                      \
+            "mv sp, %0 \n"                                              \
+            "j " #fn :: "r" (stack) :                                   \
+    )
+
+#define reset_stack_and_jump(fn) switch_stack_and_jump(get_cpu_info(), fn)
+
+DECLARE_PER_CPU(unsigned int, cpu_id);
+
+#endif /* __ASM_CURRENT_H */
diff --git a/xen/arch/riscv/include/asm/debugger.h b/xen/arch/riscv/include/asm/debugger.h
new file mode 100644
index 0000000000..af4fc8a838
--- /dev/null
+++ b/xen/arch/riscv/include/asm/debugger.h
@@ -0,0 +1,15 @@
+#ifndef __RISCV_DEBUGGER_H__
+#define __RISCV_DEBUGGER_H__
+
+#define debugger_trap_fatal(v, r) (0)
+#define debugger_trap_immediate() ((void) 0)
+
+#endif /* __RISCV_DEBUGGER_H__ */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/include/asm/delay.h b/xen/arch/riscv/include/asm/delay.h
new file mode 100644
index 0000000000..cbb0c9eb96
--- /dev/null
+++ b/xen/arch/riscv/include/asm/delay.h
@@ -0,0 +1,28 @@
+/*
+ * Copyright (C) 2009 Chen Liqin <liqin.chen@sunplusct.com>
+ * Copyright (C) 2016 Regents of the University of California
+ *
+ *   This program is free software; you can redistribute it and/or
+ *   modify it under the terms of the GNU General Public License
+ *   as published by the Free Software Foundation, version 2.
+ *
+ *   This program is distributed in the hope that it will be useful,
+ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *   GNU General Public License for more details.
+ */
+
+#ifndef _ASM_RISCV_DELAY_H
+#define _ASM_RISCV_DELAY_H
+
+extern unsigned long riscv_timebase;
+
+#define udelay udelay
+extern void udelay(unsigned long usecs);
+
+#define ndelay ndelay
+extern void ndelay(unsigned long nsecs);
+
+extern void __delay(unsigned long cycles);
+
+#endif /* _ASM_RISCV_DELAY_H */
diff --git a/xen/arch/riscv/include/asm/desc.h b/xen/arch/riscv/include/asm/desc.h
new file mode 100644
index 0000000000..a4d02d5eef
--- /dev/null
+++ b/xen/arch/riscv/include/asm/desc.h
@@ -0,0 +1,12 @@
+#ifndef __ARCH_DESC_H
+#define __ARCH_DESC_H
+
+#endif /* __ARCH_DESC_H */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/include/asm/device.h b/xen/arch/riscv/include/asm/device.h
new file mode 100644
index 0000000000..e613f816be
--- /dev/null
+++ b/xen/arch/riscv/include/asm/device.h
@@ -0,0 +1,93 @@
+#ifndef __ASM_RISCV_DEVICE_H
+#define __ASM_RISCV_DEVICE_H
+
+enum device_type
+{
+    DEV_DT,
+};
+
+struct dev_archdata {
+    void *iommu;    /* IOMMU private data */
+};
+
+/* struct device - The basic device structure */
+struct device
+{
+    enum device_type type;
+    struct dt_device_node *of_node; /* Used by drivers imported from Linux */
+    struct dev_archdata archdata;
+    struct iommu_fwspec *iommu_fwspec; /* per-device IOMMU instance data */
+};
+
+typedef struct device device_t;
+
+#include <xen/device_tree.h>
+
+/* TODO: Correctly implement dev_is_pci when PCI is supported on RISCV */
+#define dev_is_pci(dev) ((void)(dev), 0)
+#define dev_is_dt(dev)  ((dev->type == DEV_DT)
+
+enum device_class
+{
+    DEVICE_SERIAL,
+    DEVICE_IOMMU,
+    DEVICE_GIC,
+    /* Use for error */
+    DEVICE_UNKNOWN,
+};
+
+struct device_desc {
+    /* Device name */
+    const char *name;
+    /* Device class */
+    enum device_class class;
+    /* List of devices supported by this driver */
+    const struct dt_device_match *dt_match;
+    /*
+     * Device initialization.
+     *
+     * -EAGAIN is used to indicate that device probing is deferred.
+     */
+    int (*init)(struct dt_device_node *dev, const void *data);
+};
+
+#if 1
+/**
+ *  device_init - Initialize a device
+ *  @dev: device to initialize
+ *  @class: class of the device (serial, network...)
+ *  @data: specific data for initializing the device
+ *
+ *  Return 0 on success.
+ */
+int device_init(struct dt_device_node *dev, enum device_class class,
+                const void *data);
+
+/**
+ * device_get_type - Get the type of the device
+ * @dev: device to match
+ *
+ * Return the device type on success or DEVICE_ANY on failure
+ */
+enum device_class device_get_class(const struct dt_device_node *dev);
+
+#define DT_DEVICE_START(_name, _namestr, _class)                    \
+static const struct device_desc __dev_desc_##_name __used           \
+__section(".dev.info") = {                                          \
+    .name = _namestr,                                               \
+    .class = _class,                                                \
+
+#define DT_DEVICE_END                                               \
+};
+#endif
+
+#endif /* __ASM_RISCV_DEVICE_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/include/asm/div64.h b/xen/arch/riscv/include/asm/div64.h
new file mode 100644
index 0000000000..0a88dd30ad
--- /dev/null
+++ b/xen/arch/riscv/include/asm/div64.h
@@ -0,0 +1,23 @@
+#ifndef __ASM_RISCV_DIV64
+#define __ASM_RISCV_DIV64
+
+#include <asm/system.h>
+#include <xen/types.h>
+
+# define do_div(n,base) ({                                      \
+        uint32_t __base = (base);                               \
+        uint32_t __rem;                                         \
+        __rem = ((uint64_t)(n)) % __base;                       \
+        (n) = ((uint64_t)(n)) / __base;                         \
+        __rem;                                                  \
+ })
+
+#endif
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
new file mode 100644
index 0000000000..a8bbb1460f
--- /dev/null
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -0,0 +1,80 @@
+#ifndef __ASM_DOMAIN_H__
+#define __ASM_DOMAIN_H__
+
+#ifndef __ASSEMBLY__
+
+#include <xen/cache.h>
+#include <xen/sched.h>
+#include <asm/page.h>
+#include <asm/p2m.h>
+#include <public/hvm/params.h>
+#include <xen/serial.h>
+#include <xen/rbtree.h>
+
+
+struct hvm_domain
+{
+    uint64_t              params[HVM_NR_PARAMS];
+};
+
+#ifdef CONFIG_RISCV_64
+enum domain_type {
+    DOMAIN_32BIT,
+    DOMAIN_64BIT,
+};
+#define is_32bit_domain(d) ((d)->arch.type == DOMAIN_32BIT)
+#define is_64bit_domain(d) ((d)->arch.type == DOMAIN_64BIT)
+#else
+#define is_32bit_domain(d) (1)
+#define is_64bit_domain(d) (0)
+#endif
+
+/* The hardware domain has always its memory direct mapped. */
+#define is_domain_direct_mapped(d) ((d) == hardware_domain)
+
+struct arch_domain
+{
+    /* Virtual MMU */
+    struct p2m_domain p2m;
+
+    struct hvm_domain hvm;
+
+}  __cacheline_aligned;
+
+struct arch_vcpu
+{
+    /* TODO */
+}  __cacheline_aligned;
+
+struct arch_vcpu_io {
+    /* TODO */
+};
+
+void vcpu_show_execution_state(struct vcpu *);
+void vcpu_show_registers(const struct vcpu *);
+
+static inline struct vcpu_guest_context *alloc_vcpu_guest_context(void)
+{
+    return xmalloc(struct vcpu_guest_context);
+}
+
+static inline void free_vcpu_guest_context(struct vcpu_guest_context *vgc)
+{
+    xfree(vgc);
+}
+
+static inline void arch_vcpu_block(struct vcpu *v) {}
+
+#endif /* !__ASSEMBLY__ */
+
+#endif /* __ASM_DOMAIN_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/include/asm/event.h b/xen/arch/riscv/include/asm/event.h
new file mode 100644
index 0000000000..88e10f414b
--- /dev/null
+++ b/xen/arch/riscv/include/asm/event.h
@@ -0,0 +1,42 @@
+#ifndef __ASM_EVENT_H__
+#define __ASM_EVENT_H__
+
+#include <xen/errno.h>
+#include <asm/domain.h>
+#include <asm/bug.h>
+
+void vcpu_kick(struct vcpu *v);
+void vcpu_mark_events_pending(struct vcpu *v);
+void vcpu_update_evtchn_irq(struct vcpu *v);
+void vcpu_block_unless_event_pending(struct vcpu *v);
+
+static inline int vcpu_event_delivery_is_enabled(struct vcpu *v)
+{
+    return 0;
+}
+
+static inline int local_events_need_delivery(void)
+{
+    return 0;
+}
+
+static inline void local_event_delivery_enable(void)
+{
+
+}
+
+/* No arch specific virq definition now. Default to global. */
+static inline bool arch_virq_is_global(unsigned int virq)
+{
+    return true;
+}
+
+#endif
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/include/asm/fence.h b/xen/arch/riscv/include/asm/fence.h
new file mode 100644
index 0000000000..2b443a3a48
--- /dev/null
+++ b/xen/arch/riscv/include/asm/fence.h
@@ -0,0 +1,12 @@
+#ifndef _ASM_RISCV_FENCE_H
+#define _ASM_RISCV_FENCE_H
+
+#ifdef CONFIG_SMP
+#define RISCV_ACQUIRE_BARRIER		"\tfence r , rw\n"
+#define RISCV_RELEASE_BARRIER		"\tfence rw,  w\n"
+#else
+#define RISCV_ACQUIRE_BARRIER
+#define RISCV_RELEASE_BARRIER
+#endif
+
+#endif	/* _ASM_RISCV_FENCE_H */
diff --git a/xen/arch/riscv/include/asm/flushtlb.h b/xen/arch/riscv/include/asm/flushtlb.h
new file mode 100644
index 0000000000..083ca3a2be
--- /dev/null
+++ b/xen/arch/riscv/include/asm/flushtlb.h
@@ -0,0 +1,56 @@
+#ifndef __ASM_RISCV_FLUSHTLB_H__
+#define __ASM_RISCV_FLUSHTLB_H__
+
+#include <xen/cpumask.h>
+#include <public/domctl.h>
+
+/*
+ * Filter the given set of CPUs, removing those that definitely flushed their
+ * TLB since @page_timestamp.
+ */
+/* XXX lazy implementation just doesn't clear anything.... */
+static inline void tlbflush_filter(cpumask_t *mask, uint32_t page_timestamp) {}
+
+#define tlbflush_current_time()                 (0)
+
+static inline void page_set_tlbflush_timestamp(struct page_info *page)
+{
+    page->tlbflush_timestamp = tlbflush_current_time();
+}
+
+/* Flush specified CPUs' TLBs */
+void arch_flush_tlb_mask(const cpumask_t *mask);
+
+/* Flush local TLBs, current VMID only */
+static inline void flush_guest_tlb_local(void)
+{
+    /* TODO */
+}
+
+/* Flush innershareable TLBs, current VMID only */
+static inline void flush_guest_tlb(void)
+{
+    /* TODO */
+}
+
+/* Flush local TLBs, all VMIDs, non-hypervisor mode */
+static inline void flush_all_guests_tlb_local(void)
+{
+    /* TODO */
+}
+
+/* Flush innershareable TLBs, all VMIDs, non-hypervisor mode */
+static inline void flush_all_guests_tlb(void)
+{
+	/* TODO */
+}
+
+#endif /* __ASM_RISCV_FLUSHTLB_H__ */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/include/asm/grant_table.h b/xen/arch/riscv/include/asm/grant_table.h
new file mode 100644
index 0000000000..40607ea2c8
--- /dev/null
+++ b/xen/arch/riscv/include/asm/grant_table.h
@@ -0,0 +1,93 @@
+#ifndef __ASM_GRANT_TABLE_H__
+#define __ASM_GRANT_TABLE_H__
+
+#include <xen/grant_table.h>
+#include <xen/kernel.h>
+#include <xen/pfn.h>
+#include <asm/current.h>
+
+#define INITIAL_NR_GRANT_FRAMES 1U
+#define GNTTAB_MAX_VERSION 1
+
+struct grant_table_arch {
+    gfn_t *shared_gfn;
+    gfn_t *status_gfn;
+};
+
+void gnttab_clear_flags(struct domain *d,
+                        unsigned long nr, uint16_t *addr);
+int create_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
+                              unsigned int flags, unsigned int cache_flags);
+#define gnttab_host_mapping_get_page_type(ro, ld, rd) (0)
+int replace_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
+                               unsigned long new_gpaddr, unsigned int flags);
+void gnttab_mark_dirty(struct domain *d, mfn_t mfn);
+#define gnttab_release_host_mappings(domain) 1
+
+/*
+ * The region used by Xen on the memory will never be mapped in DOM0
+ * memory layout. Therefore it can be used for the grant table.
+ *
+ * Only use the text section as it's always present and will contain
+ * enough space for a large grant table
+ */
+#define gnttab_dom0_frames()                                             \
+    min_t(unsigned int, opt_max_grant_frames, PFN_DOWN(_etext - _stext))
+
+#define gnttab_init_arch(gt)                                             \
+({                                                                       \
+    unsigned int ngf_ = (gt)->max_grant_frames;                          \
+    unsigned int nsf_ = grant_to_status_frames(ngf_);                    \
+                                                                         \
+    (gt)->arch.shared_gfn = xmalloc_array(gfn_t, ngf_);                  \
+    (gt)->arch.status_gfn = xmalloc_array(gfn_t, nsf_);                  \
+    if ( (gt)->arch.shared_gfn && (gt)->arch.status_gfn )                \
+    {                                                                    \
+        while ( ngf_-- )                                                 \
+            (gt)->arch.shared_gfn[ngf_] = INVALID_GFN;                   \
+        while ( nsf_-- )                                                 \
+            (gt)->arch.status_gfn[nsf_] = INVALID_GFN;                   \
+    }                                                                    \
+    else                                                                 \
+        gnttab_destroy_arch(gt);                                         \
+    (gt)->arch.shared_gfn ? 0 : -ENOMEM;                                 \
+})
+
+#define gnttab_destroy_arch(gt)                                          \
+    do {                                                                 \
+        XFREE((gt)->arch.shared_gfn);                                    \
+        XFREE((gt)->arch.status_gfn);                                    \
+    } while ( 0 )
+
+#define gnttab_set_frame_gfn(gt, st, idx, gfn)                           \
+    do {                                                                 \
+        ((st) ? (gt)->arch.status_gfn : (gt)->arch.shared_gfn)[idx] =    \
+            (gfn);                                                       \
+    } while ( 0 )
+
+#define gnttab_get_frame_gfn(gt, st, idx) ({                             \
+   (st) ? gnttab_status_gfn(NULL, gt, idx)                               \
+        : gnttab_shared_gfn(NULL, gt, idx);                              \
+})
+
+#define gnttab_shared_gfn(d, t, i)                                       \
+    (((i) >= nr_grant_frames(t)) ? INVALID_GFN : (t)->arch.shared_gfn[i])
+
+#define gnttab_status_gfn(d, t, i)                                       \
+    (((i) >= nr_status_frames(t)) ? INVALID_GFN : (t)->arch.status_gfn[i])
+
+#define gnttab_status_gfn(d, t, i)                                       \
+    (((i) >= nr_status_frames(t)) ? INVALID_GFN : (t)->arch.status_gfn[i])
+
+#define gnttab_need_iommu_mapping(d)                    \
+    (is_domain_direct_mapped(d) && need_iommu_pt_sync(d))
+
+#endif /* __ASM_GRANT_TABLE_H__ */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/include/asm/guest_access.h b/xen/arch/riscv/include/asm/guest_access.h
new file mode 100644
index 0000000000..fd1b458e3f
--- /dev/null
+++ b/xen/arch/riscv/include/asm/guest_access.h
@@ -0,0 +1,125 @@
+#ifndef __ASM_RISCV_GUEST_ACCESS_H__
+#define __ASM_RISCV_GUEST_ACCESS_H__
+
+#include <asm/traps.h>
+#include <xen/guest_access.h>
+#include <xen/errno.h>
+#include <xen/sched.h>
+
+unsigned long raw_copy_to_guest(void *to, const void *from, unsigned len);
+unsigned long raw_copy_to_guest_flush_dcache(void *to, const void *from,
+                                             unsigned len);
+unsigned long raw_copy_from_guest(void *to, const void *from, unsigned len);
+unsigned long raw_clear_guest(void *to, unsigned len);
+
+/* Copy data to guest physical address, then clean the region. */
+unsigned long copy_to_guest_phys(struct domain *d,
+                                 paddr_t phys,
+                                 void *buf,
+                                 unsigned int len);
+
+unsigned long riscv_vcpu_unpriv_read(struct vcpu *vcpu,
+					 bool read_insn,
+					 unsigned long guest_addr,
+					 struct riscv_trap *trap);
+
+#define __raw_copy_to_guest raw_copy_to_guest
+#define __raw_copy_from_guest raw_copy_from_guest
+#define __raw_clear_guest raw_clear_guest
+
+/* Remainder copied from ARM and x86 -- could be common? */
+
+/* Is the guest handle a NULL reference? */
+#define guest_handle_is_null(hnd)        ((hnd).p == NULL)
+
+/* Offset the given guest handle into the array it refers to. */
+#define guest_handle_add_offset(hnd, nr) ((hnd).p += (nr))
+#define guest_handle_subtract_offset(hnd, nr) ((hnd).p -= (nr))
+
+/* Cast a guest handle (either XEN_GUEST_HANDLE or XEN_GUEST_HANDLE_PARAM)
+ * to the specified type of XEN_GUEST_HANDLE_PARAM. */
+#define guest_handle_cast(hnd, type) ({         \
+    type *_x = (hnd).p;                         \
+    (XEN_GUEST_HANDLE_PARAM(type)) { _x };            \
+})
+
+/* Cast a XEN_GUEST_HANDLE to XEN_GUEST_HANDLE_PARAM */
+#define guest_handle_to_param(hnd, type) ({                  \
+    typeof((hnd).p) _x = (hnd).p;                            \
+    XEN_GUEST_HANDLE_PARAM(type) _y = { _x };                \
+    /* type checking: make sure that the pointers inside     \
+     * XEN_GUEST_HANDLE and XEN_GUEST_HANDLE_PARAM are of    \
+     * the same type, then return hnd */                     \
+    (void)(&_x == &_y.p);                                    \
+    _y;                                                      \
+})
+
+
+/* Cast a XEN_GUEST_HANDLE_PARAM to XEN_GUEST_HANDLE */
+#define guest_handle_from_param(hnd, type) ({               \
+    typeof((hnd).p) _x = (hnd).p;                           \
+    XEN_GUEST_HANDLE(type) _y = { _x };                     \
+    /* type checking: make sure that the pointers inside    \
+     * XEN_GUEST_HANDLE and XEN_GUEST_HANDLE_PARAM are of   \
+     * the same type, then return hnd */                    \
+    (void)(&_x == &_y.p);                                   \
+    _y;                                                     \
+})
+
+#define guest_handle_for_field(hnd, type, fld)          \
+    ((XEN_GUEST_HANDLE(type)) { &(hnd).p->fld })
+
+#define guest_handle_from_ptr(ptr, type)        \
+    ((XEN_GUEST_HANDLE_PARAM(type)) { (type *)ptr })
+#define const_guest_handle_from_ptr(ptr, type)  \
+    ((XEN_GUEST_HANDLE_PARAM(const_##type)) { (const type *)ptr })
+
+/*
+ * Clear an array of objects in guest context via a guest handle,
+ * specifying an offset into the guest array.
+ */
+#define clear_guest_offset(hnd, off, nr) ({    \
+    void *_d = (hnd).p;                        \
+    raw_clear_guest(_d+(off), nr);             \
+})
+
+/*
+ * Copy an array of objects from guest context via a guest handle,
+ * specifying an offset into the guest array.
+ */
+#define copy_from_guest_offset(ptr, hnd, off, nr) ({    \
+    const typeof(*(ptr)) *_s = (hnd).p;                 \
+    typeof(*(ptr)) *_d = (ptr);                         \
+    raw_copy_from_guest(_d, _s+(off), sizeof(*_d)*(nr));\
+})
+
+/* Copy sub-field of a structure to guest context via a guest handle. */
+/* Copy sub-field of a structure from guest context via a guest handle. */
+#define copy_field_from_guest(ptr, hnd, field) ({       \
+    const typeof(&(ptr)->field) _s = &(hnd).p->field;   \
+    typeof(&(ptr)->field) _d = &(ptr)->field;           \
+    raw_copy_from_guest(_d, _s, sizeof(*_d));           \
+})
+
+/*
+ * Pre-validate a guest handle.
+ * Allows use of faster __copy_* functions.
+ */
+#define guest_handle_okay(hnd, nr) (1)
+#define guest_handle_subrange_okay(hnd, first, last) (1)
+
+#define __copy_field_from_guest(ptr, hnd, field) ({     \
+    const typeof(&(ptr)->field) _s = &(hnd).p->field;   \
+    typeof(&(ptr)->field) _d = &(ptr)->field;           \
+    __raw_copy_from_guest(_d, _s, sizeof(*_d));         \
+})
+
+#endif /* __ASM_RISCV_GUEST_ACCESS_H__ */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/include/asm/guest_atomics.h b/xen/arch/riscv/include/asm/guest_atomics.h
new file mode 100644
index 0000000000..45064a1b10
--- /dev/null
+++ b/xen/arch/riscv/include/asm/guest_atomics.h
@@ -0,0 +1,62 @@
+#ifndef _RISCV_GUEST_ATOMICS_H
+#define _RISCV_GUEST_ATOMICS_H
+
+/*
+ * TODO: implement guest atomics
+ */
+
+
+/* TODO */
+#define guest_testop(name)                                                  \
+static inline int guest_##name(struct domain *d, int nr, volatile void *p)  \
+{                                                                           \
+    (void) d;       \
+    (void) nr;      \
+    (void) p;       \
+                                                                            \
+    return 0;                                                               \
+}
+
+
+/* TODO */
+#define guest_bitop(name)                                                   \
+static inline void guest_##name(struct domain *d, int nr, volatile void *p) \
+{                                                                           \
+    (void) d;                                                               \
+    (void) nr;                                                              \
+    (void) p;                                                               \
+}
+
+guest_bitop(set_bit)
+guest_bitop(clear_bit)
+guest_bitop(change_bit)
+
+#undef guest_bitop
+
+guest_testop(test_and_set_bit)
+guest_testop(test_and_clear_bit)
+guest_testop(test_and_change_bit)
+
+#undef guest_testop
+
+#define guest_test_bit(d, nr, p) ((void)(d), test_bit(nr, p))
+
+static inline int guest_cmpxchg(void *d, void *ptr, uint32_t o, uint32_t n)
+{                
+    (void) d;       
+    (void) ptr;     
+    (void) o;       
+    (void) n;       
+
+    return 0;
+}
+
+#endif /* _RISCV_GUEST_ATOMICS_H */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/include/asm/hardirq.h b/xen/arch/riscv/include/asm/hardirq.h
new file mode 100644
index 0000000000..67b6a673db
--- /dev/null
+++ b/xen/arch/riscv/include/asm/hardirq.h
@@ -0,0 +1,27 @@
+#ifndef __ASM_HARDIRQ_H
+#define __ASM_HARDIRQ_H
+
+#include <xen/cache.h>
+#include <xen/smp.h>
+
+typedef struct {
+        unsigned long __softirq_pending;
+        unsigned int __local_irq_count;
+} __cacheline_aligned irq_cpustat_t;
+
+#include <xen/irq_cpustat.h>    /* Standard mappings for irq_cpustat_t above */
+
+#define in_irq() (local_irq_count(smp_processor_id()) != 0)
+
+#define irq_enter()     (local_irq_count(smp_processor_id())++)
+#define irq_exit()      (local_irq_count(smp_processor_id())--)
+
+#endif /* __ASM_HARDIRQ_H */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/include/asm/hypercall.h b/xen/arch/riscv/include/asm/hypercall.h
new file mode 100644
index 0000000000..8af474b5e2
--- /dev/null
+++ b/xen/arch/riscv/include/asm/hypercall.h
@@ -0,0 +1,12 @@
+#ifndef __ASM_RISCV_HYPERCALL_H__
+#define __ASM_RISCV_HYPERCALL_H__
+
+#endif /* __ASM_RISCV_HYPERCALL_H__ */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/include/asm/init.h b/xen/arch/riscv/include/asm/init.h
new file mode 100644
index 0000000000..8410ccead3
--- /dev/null
+++ b/xen/arch/riscv/include/asm/init.h
@@ -0,0 +1,42 @@
+#ifndef _XEN_ASM_INIT_H
+#define _XEN_ASM_INIT_H
+
+#ifndef __ASSEMBLY__
+
+struct init_info
+{
+    /* Pointer to the stack, used by head.S when entering in C */
+    unsigned char *stack;
+    /* Logical CPU ID, used by start_secondary */
+    unsigned int cpuid;
+};
+
+#endif /* __ASSEMBLY__ */
+
+/* For assembly routines */
+#define __HEAD		.section	".head.text","ax"
+#define __INIT		.section	".init.text","ax"
+#define __FINIT		.previous
+
+#define __INITDATA	.section	".init.data","aw",%progbits
+#define __INITRODATA	.section	".init.rodata","a",%progbits
+#define __FINITDATA	.previous
+
+#define __MEMINIT        .section	".meminit.text", "ax"
+#define __MEMINITDATA    .section	".meminit.data", "aw"
+#define __MEMINITRODATA  .section	".meminit.rodata", "a"
+
+/* silence warnings when references are OK */
+#define __REF            .section       ".ref.text", "ax"
+#define __REFDATA        .section       ".ref.data", "aw"
+#define __REFCONST       .section       ".ref.rodata", "a"
+
+#endif /* _XEN_ASM_INIT_H */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/include/asm/io.h b/xen/arch/riscv/include/asm/io.h
new file mode 100644
index 0000000000..92d17ebfa8
--- /dev/null
+++ b/xen/arch/riscv/include/asm/io.h
@@ -0,0 +1,283 @@
+/*
+ * {read,write}{b,w,l,q} based on arch/arm64/include/asm/io.h
+ *   which was based on arch/arm/include/io.h
+ *
+ * Copyright (C) 1996-2000 Russell King
+ * Copyright (C) 2012 ARM Ltd.
+ * Copyright (C) 2014 Regents of the University of California
+ *
+ *   This program is free software; you can redistribute it and/or
+ *   modify it under the terms of the GNU General Public License
+ *   as published by the Free Software Foundation, version 2.
+ *
+ *   This program is distributed in the hope that it will be useful,
+ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *   GNU General Public License for more details.
+ */
+
+#ifndef _ASM_RISCV_IO_H
+#define _ASM_RISCV_IO_H
+
+#include <asm/byteorder.h>
+
+/*
+ * The RISC-V ISA doesn't yet specify how to query or modify PMAs, so we can't
+ * change the properties of memory regions.  This should be fixed by the
+ * upcoming platform spec.
+ */
+#define ioremap_nocache(addr, size) ioremap((addr), (size))
+#define ioremap_wc(addr, size) ioremap((addr), (size))
+#define ioremap_wt(addr, size) ioremap((addr), (size))
+
+/* Generic IO read/write.  These perform native-endian accesses. */
+#define __raw_writeb __raw_writeb
+static inline void __raw_writeb(u8 val, volatile void __iomem *addr)
+{
+	asm volatile("sb %0, 0(%1)" : : "r" (val), "r" (addr));
+}
+
+#define __raw_writew __raw_writew
+static inline void __raw_writew(u16 val, volatile void __iomem *addr)
+{
+	asm volatile("sh %0, 0(%1)" : : "r" (val), "r" (addr));
+}
+
+#define __raw_writel __raw_writel
+static inline void __raw_writel(u32 val, volatile void __iomem *addr)
+{
+	asm volatile("sw %0, 0(%1)" : : "r" (val), "r" (addr));
+}
+
+#ifdef CONFIG_64BIT
+#define __raw_writeq __raw_writeq
+static inline void __raw_writeq(u64 val, volatile void __iomem *addr)
+{
+	asm volatile("sd %0, 0(%1)" : : "r" (val), "r" (addr));
+}
+#endif
+
+#define __raw_readb __raw_readb
+static inline u8 __raw_readb(const volatile void __iomem *addr)
+{
+	u8 val;
+
+	asm volatile("lb %0, 0(%1)" : "=r" (val) : "r" (addr));
+	return val;
+}
+
+#define __raw_readw __raw_readw
+static inline u16 __raw_readw(const volatile void __iomem *addr)
+{
+	u16 val;
+
+	asm volatile("lh %0, 0(%1)" : "=r" (val) : "r" (addr));
+	return val;
+}
+
+#define __raw_readl __raw_readl
+static inline u32 __raw_readl(const volatile void __iomem *addr)
+{
+	u32 val;
+
+	asm volatile("lw %0, 0(%1)" : "=r" (val) : "r" (addr));
+	return val;
+}
+
+#ifdef CONFIG_64BIT
+#define __raw_readq __raw_readq
+static inline u64 __raw_readq(const volatile void __iomem *addr)
+{
+	u64 val;
+
+	asm volatile("ld %0, 0(%1)" : "=r" (val) : "r" (addr));
+	return val;
+}
+#endif
+
+/*
+ * Unordered I/O memory access primitives.  These are even more relaxed than
+ * the relaxed versions, as they don't even order accesses between successive
+ * operations to the I/O regions.
+ */
+#define readb_cpu(c)		({ u8  __r = __raw_readb(c); __r; })
+#define readw_cpu(c)		({ u16 __r = le16_to_cpu((__force __le16)__raw_readw(c)); __r; })
+#define readl_cpu(c)		({ u32 __r = le32_to_cpu((__force __le32)__raw_readl(c)); __r; })
+
+#define writeb_cpu(v,c)		((void)__raw_writeb((v),(c)))
+#define writew_cpu(v,c)		((void)__raw_writew((__force u16)cpu_to_le16(v),(c)))
+#define writel_cpu(v,c)		((void)__raw_writel((__force u32)cpu_to_le32(v),(c)))
+
+#ifdef CONFIG_64BIT
+#define readq_cpu(c)		({ u64 __r = le64_to_cpu((__force __le64)__raw_readq(c)); __r; })
+#define writeq_cpu(v,c)		((void)__raw_writeq((__force u64)cpu_to_le64(v),(c)))
+#endif
+
+/*
+ * Relaxed I/O memory access primitives. These follow the Device memory
+ * ordering rules but do not guarantee any ordering relative to Normal memory
+ * accesses.  These are defined to order the indicated access (either a read or
+ * write) with all other I/O memory accesses. Since the platform specification
+ * defines that all I/O regions are strongly ordered on channel 2, no explicit
+ * fences are required to enforce this ordering.
+ */
+/* FIXME: These are now the same as asm-generic */
+#define __io_rbr()		do {} while (0)
+#define __io_rar()		do {} while (0)
+#define __io_rbw()		do {} while (0)
+#define __io_raw()		do {} while (0)
+
+#define readb_relaxed(c)	({ u8  __v; __io_rbr(); __v = readb_cpu(c); __io_rar(); __v; })
+#define readw_relaxed(c)	({ u16 __v; __io_rbr(); __v = readw_cpu(c); __io_rar(); __v; })
+#define readl_relaxed(c)	({ u32 __v; __io_rbr(); __v = readl_cpu(c); __io_rar(); __v; })
+
+#define writeb_relaxed(v,c)	({ __io_rbw(); writeb_cpu((v),(c)); __io_raw(); })
+#define writew_relaxed(v,c)	({ __io_rbw(); writew_cpu((v),(c)); __io_raw(); })
+#define writel_relaxed(v,c)	({ __io_rbw(); writel_cpu((v),(c)); __io_raw(); })
+
+#ifdef CONFIG_64BIT
+#define readq_relaxed(c)	({ u64 __v; __io_rbr(); __v = readq_cpu(c); __io_rar(); __v; })
+#define writeq_relaxed(v,c)	({ __io_rbw(); writeq_cpu((v),(c)); __io_raw(); })
+#endif
+
+/*
+ * I/O memory access primitives. Reads are ordered relative to any
+ * following Normal memory access. Writes are ordered relative to any prior
+ * Normal memory access.  The memory barriers here are necessary as RISC-V
+ * doesn't define any ordering between the memory space and the I/O space.
+ */
+#define __io_br()	do {} while (0)
+#define __io_ar(v)	__asm__ __volatile__ ("fence i,r" : : : "memory");
+#define __io_bw()	__asm__ __volatile__ ("fence w,o" : : : "memory");
+#define __io_aw()	do { } while (0)
+
+#define readb(c)	({ u8  __v; __io_br(); __v = readb_cpu(c); __io_ar(__v); __v; })
+#define readw(c)	({ u16 __v; __io_br(); __v = readw_cpu(c); __io_ar(__v); __v; })
+#define readl(c)	({ u32 __v; __io_br(); __v = readl_cpu(c); __io_ar(__v); __v; })
+
+#define writeb(v,c)	({ __io_bw(); writeb_cpu((v),(c)); __io_aw(); })
+#define writew(v,c)	({ __io_bw(); writew_cpu((v),(c)); __io_aw(); })
+#define writel(v,c)	({ __io_bw(); writel_cpu((v),(c)); __io_aw(); })
+
+#ifdef CONFIG_64BIT
+#define readq(c)	({ u64 __v; __io_br(); __v = readq_cpu(c); __io_ar(__v); __v; })
+#define writeq(v,c)	({ __io_bw(); writeq_cpu((v),(c)); __io_aw(); })
+#endif
+
+/*
+ * Emulation routines for the port-mapped IO space used by some PCI drivers.
+ * These are defined as being "fully synchronous", but also "not guaranteed to
+ * be fully ordered with respect to other memory and I/O operations".  We're
+ * going to be on the safe side here and just make them:
+ *  - Fully ordered WRT each other, by bracketing them with two fences.  The
+ *    outer set contains both I/O so inX is ordered with outX, while the inner just
+ *    needs the type of the access (I for inX and O for outX).
+ *  - Ordered in the same manner as readX/writeX WRT memory by subsuming their
+ *    fences.
+ *  - Ordered WRT timer reads, so udelay and friends don't get elided by the
+ *    implementation.
+ * Note that there is no way to actually enforce that outX is a non-posted
+ * operation on RISC-V, but hopefully the timer ordering constraint is
+ * sufficient to ensure this works sanely on controllers that support I/O
+ * writes.
+ */
+#define __io_pbr()	__asm__ __volatile__ ("fence io,i"  : : : "memory");
+#define __io_par(v)	__asm__ __volatile__ ("fence i,ior" : : : "memory");
+#define __io_pbw()	__asm__ __volatile__ ("fence iow,o" : : : "memory");
+#define __io_paw()	__asm__ __volatile__ ("fence o,io"  : : : "memory");
+
+#define inb(c)		({ u8  __v; __io_pbr(); __v = readb_cpu((void*)(PCI_IOBASE + (c))); __io_par(__v); __v; })
+#define inw(c)		({ u16 __v; __io_pbr(); __v = readw_cpu((void*)(PCI_IOBASE + (c))); __io_par(__v); __v; })
+#define inl(c)		({ u32 __v; __io_pbr(); __v = readl_cpu((void*)(PCI_IOBASE + (c))); __io_par(__v); __v; })
+
+#define outb(v,c)	({ __io_pbw(); writeb_cpu((v),(void*)(PCI_IOBASE + (c))); __io_paw(); })
+#define outw(v,c)	({ __io_pbw(); writew_cpu((v),(void*)(PCI_IOBASE + (c))); __io_paw(); })
+#define outl(v,c)	({ __io_pbw(); writel_cpu((v),(void*)(PCI_IOBASE + (c))); __io_paw(); })
+
+#ifdef CONFIG_64BIT
+#define inq(c)		({ u64 __v; __io_pbr(); __v = readq_cpu((void*)(c)); __io_par(__v); __v; })
+#define outq(v,c)	({ __io_pbw(); writeq_cpu((v),(void*)(c)); __io_paw(); })
+#endif
+
+/*
+ * Accesses from a single hart to a single I/O address must be ordered.  This
+ * allows us to use the raw read macros, but we still need to fence before and
+ * after the block to ensure ordering WRT other macros.  These are defined to
+ * perform host-endian accesses so we use __raw instead of __cpu.
+ */
+#define __io_reads_ins(port, ctype, len, bfence, afence)			\
+	static inline void __ ## port ## len(const volatile void __iomem *addr,	\
+					     void *buffer,			\
+					     unsigned int count)		\
+	{									\
+		bfence;								\
+		if (count) {							\
+			ctype *buf = buffer;					\
+										\
+			do {							\
+				ctype x = __raw_read ## len(addr);		\
+				*buf++ = x;					\
+			} while (--count);					\
+		}								\
+		afence;								\
+	}
+
+#define __io_writes_outs(port, ctype, len, bfence, afence)			\
+	static inline void __ ## port ## len(volatile void __iomem *addr,	\
+					     const void *buffer,		\
+					     unsigned int count)		\
+	{									\
+		bfence;								\
+		if (count) {							\
+			const ctype *buf = buffer;				\
+										\
+			do {							\
+				__raw_write ## len(*buf++, addr);		\
+			} while (--count);					\
+		}								\
+		afence;								\
+	}
+
+__io_reads_ins(reads,  u8, b, __io_br(), __io_ar(addr))
+__io_reads_ins(reads, u16, w, __io_br(), __io_ar(addr))
+__io_reads_ins(reads, u32, l, __io_br(), __io_ar(addr))
+#define readsb(addr, buffer, count) __readsb(addr, buffer, count)
+#define readsw(addr, buffer, count) __readsw(addr, buffer, count)
+#define readsl(addr, buffer, count) __readsl(addr, buffer, count)
+
+__io_reads_ins(ins,  u8, b, __io_pbr(), __io_par(addr))
+__io_reads_ins(ins, u16, w, __io_pbr(), __io_par(addr))
+__io_reads_ins(ins, u32, l, __io_pbr(), __io_par(addr))
+#define insb(addr, buffer, count) __insb((void __iomem *)(long)addr, buffer, count)
+#define insw(addr, buffer, count) __insw((void __iomem *)(long)addr, buffer, count)
+#define insl(addr, buffer, count) __insl((void __iomem *)(long)addr, buffer, count)
+
+__io_writes_outs(writes,  u8, b, __io_bw(), __io_aw())
+__io_writes_outs(writes, u16, w, __io_bw(), __io_aw())
+__io_writes_outs(writes, u32, l, __io_bw(), __io_aw())
+#define writesb(addr, buffer, count) __writesb(addr, buffer, count)
+#define writesw(addr, buffer, count) __writesw(addr, buffer, count)
+#define writesl(addr, buffer, count) __writesl(addr, buffer, count)
+
+__io_writes_outs(outs,  u8, b, __io_pbw(), __io_paw())
+__io_writes_outs(outs, u16, w, __io_pbw(), __io_paw())
+__io_writes_outs(outs, u32, l, __io_pbw(), __io_paw())
+#define outsb(addr, buffer, count) __outsb((void __iomem *)(long)addr, buffer, count)
+#define outsw(addr, buffer, count) __outsw((void __iomem *)(long)addr, buffer, count)
+#define outsl(addr, buffer, count) __outsl((void __iomem *)(long)addr, buffer, count)
+
+#ifdef CONFIG_64BIT
+__io_reads_ins(reads, u64, q, __io_br(), __io_ar(addr))
+#define readsq(addr, buffer, count) __readsq(addr, buffer, count)
+
+__io_reads_ins(ins, u64, q, __io_pbr(), __io_par(addr))
+#define insq(addr, buffer, count) __insq((void __iomem *)addr, buffer, count)
+
+__io_writes_outs(writes, u64, q, __io_bw(), __io_aw())
+#define writesq(addr, buffer, count) __writesq(addr, buffer, count)
+
+__io_writes_outs(outs, u64, q, __io_pbr(), __io_paw())
+#define outsq(addr, buffer, count) __outsq((void __iomem *)addr, buffer, count)
+#endif
+
+#endif /* _ASM_RISCV_IO_H */
diff --git a/xen/arch/riscv/include/asm/iocap.h b/xen/arch/riscv/include/asm/iocap.h
new file mode 100644
index 0000000000..712f34528e
--- /dev/null
+++ b/xen/arch/riscv/include/asm/iocap.h
@@ -0,0 +1,16 @@
+#ifndef __RISCV_IOCAP_H__
+#define __RISCV_IOCAP_H__
+
+#define cache_flush_permitted(d)                        \
+    (!rangeset_is_empty((d)->iomem_caps))
+
+#endif
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/include/asm/iommu.h b/xen/arch/riscv/include/asm/iommu.h
new file mode 100644
index 0000000000..c4f24574ec
--- /dev/null
+++ b/xen/arch/riscv/include/asm/iommu.h
@@ -0,0 +1,46 @@
+/******************************************************************************
+ *
+ * Copyright 2019 (C) Alistair Francis <alistair.francis@wdc.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ */
+
+#ifndef __ARCH_RISCV_IOMMU_H__
+#define __ARCH_RISCV_IOMMU_H__
+
+struct arch_iommu
+{
+    /* Private information for the IOMMU drivers */
+    void *priv;
+};
+
+const struct iommu_ops *iommu_get_ops(void);
+void iommu_set_ops(const struct iommu_ops *ops);
+
+#endif /* __ARCH_RISCV_IOMMU_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/include/asm/iommu_fwspec.h b/xen/arch/riscv/include/asm/iommu_fwspec.h
new file mode 100644
index 0000000000..1a791a19d2
--- /dev/null
+++ b/xen/arch/riscv/include/asm/iommu_fwspec.h
@@ -0,0 +1,68 @@
+/*
+ * xen/include/asm-riscv/iommu_fwspec.h
+ *
+ * Contains a common structure to hold the per-device firmware data and
+ * declaration of functions used to maintain that data
+ *
+ * Based on Linux's iommu_fwspec support you can find at:
+ *    include/linux/iommu.h
+ *
+ * Copyright (C) 2007-2008 Advanced Micro Devices, Inc.
+ *
+ * Copyright (C) 2019 EPAM Systems Inc.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms and conditions of the GNU General Public
+ * License, version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public
+ * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef __ARCH_RISCV_IOMMU_FWSPEC_H__
+#define __ARCH_RISCV_IOMMU_FWSPEC_H__
+
+/* per-device IOMMU instance data */
+struct iommu_fwspec {
+    /* this device's IOMMU */
+    struct device *iommu_dev;
+    /* IOMMU driver private data for this device */
+    void *iommu_priv;
+    /* number of associated device IDs */
+    unsigned int num_ids;
+    /* IDs which this device may present to the IOMMU */
+    uint32_t ids[];
+};
+
+int iommu_fwspec_init(struct device *dev, struct device *iommu_dev);
+void iommu_fwspec_free(struct device *dev);
+int iommu_fwspec_add_ids(struct device *dev, const uint32_t *ids,
+                         unsigned int num_ids);
+
+static inline struct iommu_fwspec *dev_iommu_fwspec_get(struct device *dev)
+{
+    return dev->iommu_fwspec;
+}
+
+static inline void dev_iommu_fwspec_set(struct device *dev,
+                                        struct iommu_fwspec *fwspec)
+{
+    dev->iommu_fwspec = fwspec;
+}
+
+#endif /* __ARCH_RISCV_IOMMU_FWSPEC_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/include/asm/irq.h b/xen/arch/riscv/include/asm/irq.h
new file mode 100644
index 0000000000..4323b6ba60
--- /dev/null
+++ b/xen/arch/riscv/include/asm/irq.h
@@ -0,0 +1,62 @@
+#ifndef _ASM_HW_IRQ_H
+#define _ASM_HW_IRQ_H
+
+#include <xen/device_tree.h>
+#include <public/device_tree_defs.h>
+
+/*
+ * These defines correspond to the Xen internal representation of the
+ * IRQ types. We choose to make them the same as the existing device
+ * tree definitions for convenience.
+ */
+#define IRQ_TYPE_NONE           DT_IRQ_TYPE_NONE
+#define IRQ_TYPE_EDGE_RISING    DT_IRQ_TYPE_EDGE_RISING
+#define IRQ_TYPE_EDGE_FALLING   DT_IRQ_TYPE_EDGE_FALLING
+#define IRQ_TYPE_EDGE_BOTH      DT_IRQ_TYPE_EDGE_BOTH
+#define IRQ_TYPE_LEVEL_HIGH     DT_IRQ_TYPE_LEVEL_HIGH
+#define IRQ_TYPE_LEVEL_LOW      DT_IRQ_TYPE_LEVEL_LOW
+#define IRQ_TYPE_LEVEL_MASK     DT_IRQ_TYPE_LEVEL_MASK
+#define IRQ_TYPE_SENSE_MASK     DT_IRQ_TYPE_SENSE_MASK
+#define IRQ_TYPE_INVALID        DT_IRQ_TYPE_INVALID
+
+#define NR_LOCAL_IRQS	32
+#define NR_IRQS		1024
+
+typedef struct {
+} vmask_t;
+
+struct arch_pirq
+{
+};
+
+struct arch_irq_desc {
+};
+
+struct irq_desc;
+
+struct irq_desc *__irq_to_desc(int irq);
+
+#define irq_to_desc(irq)    __irq_to_desc(irq)
+
+void arch_move_irqs(struct vcpu *v);
+
+#define domain_pirq_to_irq(d, pirq) (pirq)
+
+extern const unsigned int nr_irqs;
+#define nr_static_irqs NR_IRQS
+#define arch_hwdom_irqs(domid) NR_IRQS
+
+#define arch_evtchn_bind_pirq(d, pirq) ((void)((d) + (pirq)))
+
+int irq_set_type(unsigned int irq, unsigned int type);
+int platform_get_irq(const struct dt_device_node *device, int index);
+
+#endif /* _ASM_HW_IRQ_H */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/include/asm/mem_access.h b/xen/arch/riscv/include/asm/mem_access.h
new file mode 100644
index 0000000000..aa7decb629
--- /dev/null
+++ b/xen/arch/riscv/include/asm/mem_access.h
@@ -0,0 +1,35 @@
+/******************************************************************************
+ *
+ * Copyright 2019 (C) Alistair Francis <alistair.francis@wdc.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ */
+
+#ifndef _ASM_RISCV_MEM_ACCESS_H
+#define _ASM_RISCV_MEM_ACCESS_H
+
+#include <xen/errno.h>
+/* vm_event and mem_access are supported on any ARM guest */
+static inline bool p2m_mem_access_sanity_check(struct domain *d)
+{
+    return true;
+}
+
+#endif /* _ASM_RISCV_MEM_ACCESS_H */
diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
new file mode 100644
index 0000000000..2f2ce6362e
--- /dev/null
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -0,0 +1,320 @@
+#ifndef __ARCH_RISCV_MM__
+#define __ARCH_RISCV_MM__
+
+#include <xen/kernel.h>
+#include <asm/page.h>
+#include <public/xen.h>
+#include <xen/pdx.h>
+#include <xen/errno.h>
+
+/* Align Xen to a 2 MiB boundary. */
+#define XEN_PADDR_ALIGN (1 << 21)
+
+/* TODO: Rewrite this file to be correct */
+
+/*
+ * Per-page-frame information.
+ *
+ * Every architecture must ensure the following:
+ *  1. 'struct page_info' contains a 'struct page_list_entry list'.
+ *  2. Provide a PFN_ORDER() macro for accessing the order of a free page.
+ */
+#define PFN_ORDER(_pfn) ((_pfn)->v.free.order)
+
+extern unsigned long frametable_base_pdx;
+
+struct page_info
+{
+    /* Each frame can be threaded onto a doubly-linked list. */
+    struct page_list_entry list;
+
+    /* Reference count and various PGC_xxx flags and fields. */
+    unsigned long count_info;
+
+    /* Context-dependent fields follow... */
+    union {
+        /* Page is in use: ((count_info & PGC_count_mask) != 0). */
+        struct {
+            /* Type reference count and various PGT_xxx flags and fields. */
+            unsigned long type_info;
+        } inuse;
+        /* Page is on a free list: ((count_info & PGC_count_mask) == 0). */
+        union {
+            struct {
+                /*
+                 * Index of the first *possibly* unscrubbed page in the buddy.
+                 * One more bit than maximum possible order to accommodate
+                 * INVALID_DIRTY_IDX.
+                 */
+#define INVALID_DIRTY_IDX ((1UL << (MAX_ORDER + 1)) - 1)
+                unsigned long first_dirty:MAX_ORDER + 1;
+
+                /* Do TLBs need flushing for safety before next page use? */
+                bool need_tlbflush:1;
+
+#define BUDDY_NOT_SCRUBBING    0
+#define BUDDY_SCRUBBING        1
+#define BUDDY_SCRUB_ABORT      2
+                unsigned long scrub_state:2;
+            };
+
+            unsigned long val;
+            } free;
+
+    } u;
+
+    union {
+        /* Page is in use, but not as a shadow. */
+        struct {
+            /* Owner of this page (zero if page is anonymous). */
+            struct domain *domain;
+        } inuse;
+
+        /* Page is on a free list. */
+        struct {
+            /* Order-size of the free chunk this page is the head of. */
+            unsigned int order;
+        } free;
+
+    } v;
+
+    union {
+        /*
+         * Timestamp from 'TLB clock', used to avoid extra safety flushes.
+         * Only valid for: a) free pages, and b) pages with zero type count
+         */
+        u32 tlbflush_timestamp;
+    };
+    u64 pad;
+
+};
+
+#define PG_shift(idx)   (BITS_PER_LONG - (idx))
+#define PG_mask(x, idx) (x ## UL << PG_shift(idx))
+
+#define PGT_none          PG_mask(0, 1)  /* no special uses of this page   */
+#define PGT_writable_page PG_mask(1, 1)  /* has writable mappings?         */
+#define PGT_type_mask     PG_mask(1, 1)  /* Bits 31 or 63.                 */
+
+ /* Count of uses of this frame as its current type. */
+#define PGT_count_width   PG_shift(2)
+#define PGT_count_mask    ((1UL<<PGT_count_width)-1)
+
+ /* Cleared when the owning guest 'frees' this page. */
+#define _PGC_allocated    PG_shift(1)
+#define PGC_allocated     PG_mask(1, 1)
+  /* Page is Xen heap? */
+#define _PGC_xen_heap     PG_shift(2)
+#define PGC_xen_heap      PG_mask(1, 2)
+/* ... */
+/* Page is broken? */
+#define _PGC_broken       PG_shift(7)
+#define PGC_broken        PG_mask(1, 7)
+ /* Mutually-exclusive page states: { inuse, offlining, offlined, free }. */
+#define PGC_state         PG_mask(3, 9)
+#define PGC_state_inuse   PG_mask(0, 9)
+#define PGC_state_offlining PG_mask(1, 9)
+#define PGC_state_offlined PG_mask(2, 9)
+#define PGC_state_free    PG_mask(3, 9)
+#define page_state_is(pg, st) (((pg)->count_info&PGC_state) == PGC_state_##st)
+
+/* Count of references to this frame. */
+#define PGC_count_width   PG_shift(9)
+#define PGC_count_mask    ((1UL<<PGC_count_width)-1)
+
+#define _PGC_extra        PG_shift(10)
+#define PGC_extra         PG_mask(1, 10)
+
+extern mfn_t xenheap_mfn_start, xenheap_mfn_end;
+extern vaddr_t xenheap_virt_end;
+extern vaddr_t xenheap_virt_start;
+
+#define is_xen_heap_page(page) ((page)->count_info & PGC_xen_heap)
+#define is_xen_heap_mfn(mfn) \
+    (mfn_valid(_mfn(mfn)) && is_xen_heap_page(mfn_to_page(_mfn(mfn))))
+
+#define is_xen_fixed_mfn(mfn)                                   \
+    ((mfn_to_maddr(mfn) >= virt_to_maddr(&_start)) &&       \
+     (mfn_to_maddr(mfn) <= virt_to_maddr(&_end)))
+
+#define page_get_owner(_p)    (_p)->v.inuse.domain
+#define page_set_owner(_p,_d) ((_p)->v.inuse.domain = (_d))
+
+#define maddr_get_owner(ma)   (page_get_owner(maddr_to_page((ma))))
+
+#define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)
+
+#define PDX_GROUP_SHIFT (PAGE_SHIFT + 9)
+
+/* XXX -- account for base */
+#define mfn_valid(mfn) ({                                                       \
+    unsigned long __m_f_n = mfn_x(mfn);                                         \
+    likely(pfn_to_pdx(__m_f_n) >= frametable_base_pdx); \
+})
+
+/* Convert between machine frame numbers and page-info structures. */
+#define mfn_to_page(mfn)                                            \
+    (frame_table + (mfn_to_pdx(mfn) - frametable_base_pdx))
+#define page_to_mfn(pg)                                             \
+    pdx_to_mfn((unsigned long)((pg) - frame_table) + frametable_base_pdx)
+
+/* Convert between machine addresses and page-info structures. */
+#define maddr_to_page(ma) mfn_to_page(maddr_to_mfn(ma))
+#define page_to_maddr(pg) (mfn_to_maddr(page_to_mfn(pg)))
+
+/* Convert between frame number and address formats.  */
+#define pfn_to_paddr(pfn) ((paddr_t)(pfn) << PAGE_SHIFT)
+#define paddr_to_pfn(pa)  ((unsigned long)((pa) >> PAGE_SHIFT))
+#define paddr_to_pdx(pa)    mfn_to_pdx(maddr_to_mfn(pa))
+#define gfn_to_gaddr(gfn)   pfn_to_paddr(gfn_x(gfn))
+#define gaddr_to_gfn(ga)    _gfn(paddr_to_pfn(ga))
+#define mfn_to_maddr(mfn)   pfn_to_paddr(mfn_x(mfn))
+#define maddr_to_mfn(ma)    _mfn(paddr_to_pfn(ma))
+#define vmap_to_mfn(va)     maddr_to_mfn(virt_to_maddr((vaddr_t)va))
+#define vmap_to_page(va)    mfn_to_page(vmap_to_mfn(va))
+
+extern unsigned long max_page;
+extern unsigned long total_pages;
+extern unsigned long xenheap_base_pdx;
+
+/* Page-align address and convert to frame number format */
+#define paddr_to_pfn_aligned(paddr)    paddr_to_pfn(PAGE_ALIGN(paddr))
+
+static inline void *maddr_to_virt(paddr_t ma)
+{
+    ASSERT(ma - mfn_to_maddr(xenheap_mfn_start) < DIRECTMAP_SIZE);
+
+    return (void *)(XENHEAP_VIRT_START -
+                    (xenheap_base_pdx << PAGE_SHIFT) +
+                    ((ma & ma_va_bottom_mask) |
+                     ((ma & ma_top_mask) >> pfn_pdx_hole_shift)));
+}
+
+paddr_t __virt_to_maddr(vaddr_t va);
+
+#define virt_to_maddr(va) __virt_to_maddr((vaddr_t) (va))
+
+/* Convert between Xen-heap virtual addresses and machine frame numbers. */
+#define __virt_to_mfn(va)  paddr_to_pfn((vaddr_t)va)
+#define __mfn_to_virt(mfn) (maddr_to_virt((paddr_t)(mfn) << PAGE_SHIFT))
+
+/*
+ * Page needs to be scrubbed. Since this bit can only be set on a page that is
+ * free (i.e. in PGC_state_free) we can reuse PGC_allocated bit.
+ */
+#define _PGC_need_scrub   _PGC_allocated
+#define PGC_need_scrub    PGC_allocated
+
+/*
+ * We define non-underscored wrappers for above conversion functions.
+ * These are overriden in various source files while underscored version
+ * remain intact.
+ */
+#define virt_to_mfn(va)     __virt_to_mfn(va)
+#define mfn_to_virt(mfn)    __mfn_to_virt(mfn)
+
+/* Convert between Xen-heap virtual addresses and page-info structures. */
+static inline struct page_info *virt_to_page(const void *v)
+{
+    unsigned long va = (unsigned long)v;
+    unsigned long pdx;
+
+    ASSERT(va >= XENHEAP_VIRT_START);
+    ASSERT(va < xenheap_virt_end);
+
+    pdx = (va - XENHEAP_VIRT_START) >> PAGE_SHIFT;
+    pdx += pfn_to_pdx(mfn_x(xenheap_mfn_start));
+    return frame_table + pdx - frametable_base_pdx;
+}
+
+static inline void *page_to_virt(const struct page_info *pg)
+{
+    return mfn_to_virt(mfn_x(page_to_mfn(pg)));
+}
+
+#define domain_set_alloc_bitsize(d) ((void)0)
+#define domain_clamp_alloc_bitsize(d, b) (b)
+
+/*
+ * RISC-V does not have an M2P, but common code expects a handful of
+ * M2P-related defines and functions. Provide dummy versions of these.
+ */
+#define INVALID_M2P_ENTRY        (~0UL)
+#define SHARED_M2P_ENTRY         (~0UL - 1UL)
+#define SHARED_M2P(_e)           ((_e) == SHARED_M2P_ENTRY)
+
+/* Xen always owns P2M on RISC-V  (no PV) */
+#define set_gpfn_from_mfn(mfn, pfn) do { (void) (mfn), (void)(pfn); } while (0)
+#define mfn_to_gfn(d, mfn) ((void)(d), _gfn(mfn_x(mfn)))
+
+/* Arch-specific portion of memory_op hypercall. */
+long arch_memory_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg);
+
+extern void put_page_type(struct page_info *page);
+static inline void put_page_and_type(struct page_info *page)
+{
+    put_page_type(page);
+    put_page(page);
+}
+
+int guest_physmap_mark_populate_on_demand(struct domain *d, unsigned long gfn,
+                                          unsigned int order);
+
+unsigned long domain_get_maximum_gpfn(struct domain *d);
+
+static inline
+int arch_acquire_resource(struct domain *d, unsigned int type, unsigned int id,
+                          unsigned long frame, unsigned int nr_frames,
+                          xen_pfn_t mfn_list[])
+{
+    return -EOPNOTSUPP;
+}
+
+/*
+ * On RISC-V, all the RAM is currently direct mapped in Xen.
+ * Hence return always true.
+ */
+static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
+{
+    return true;
+}
+
+void setup_xenheap_mappings(unsigned long heap_start, unsigned long page_cnt);
+
+void setup_frametable_mappings(paddr_t ps, paddr_t pe);
+
+void __attribute__ ((section(".entry")))
+setup_initial_pagetables(pte_t *second,
+                         pte_t *first,
+                         pte_t *zeroeth,
+                         unsigned long map_start,
+                         unsigned long map_end,
+                         unsigned long pa_start);
+
+void __iomem *ioremap_attr(paddr_t start, size_t len, unsigned attributes);
+
+static inline void __iomem *ioremap_cache(paddr_t start, size_t len)
+{
+    return ioremap_attr(start, len, PAGE_HYPERVISOR);
+}
+
+void set_fixmap(unsigned map, mfn_t mfn, unsigned int flags);
+void clear_fixmap(unsigned map);
+void setup_fixmap_mappings(void);
+int pt_update(vaddr_t root, vaddr_t va, paddr_t pa,
+              bool use_xenheap, struct domain *d, unsigned long flags);
+
+paddr_t pt_walk(unsigned long root, vaddr_t va, bool is_xen);
+
+/* Map FDT in boot pagetable */
+extern void *early_fdt_map(paddr_t fdt_paddr);
+
+#endif /*  __ARCH_RISCV_MM__ */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/include/asm/monitor.h b/xen/arch/riscv/include/asm/monitor.h
new file mode 100644
index 0000000000..e77d21dba4
--- /dev/null
+++ b/xen/arch/riscv/include/asm/monitor.h
@@ -0,0 +1,65 @@
+/*
+ * include/asm-RISCV/monitor.h
+ *
+ * Arch-specific monitor_op domctl handler.
+ *
+ * Copyright (c) 2015 Tamas K Lengyel (tamas@tklengyel.com)
+ * Copyright (c) 2016, Bitdefender S.R.L.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public
+ * License v2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public
+ * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef __ASM_RISCV_MONITOR_H__
+#define __ASM_RISCV_MONITOR_H__
+
+#include <xen/sched.h>
+#include <public/domctl.h>
+
+static inline
+void arch_monitor_allow_userspace(struct domain *d, bool allow_userspace)
+{
+}
+
+static inline
+int arch_monitor_domctl_op(struct domain *d, struct xen_domctl_monitor_op *mop)
+{
+    /* No arch-specific monitor ops on RISCV. */
+    return -EOPNOTSUPP;
+}
+
+int arch_monitor_domctl_event(struct domain *d,
+                              struct xen_domctl_monitor_op *mop);
+
+static inline
+int arch_monitor_init_domain(struct domain *d)
+{
+    /* No arch-specific domain initialization on RISCV. */
+    return 0;
+}
+
+static inline
+void arch_monitor_cleanup_domain(struct domain *d)
+{
+    /* No arch-specific domain cleanup on RISCV. */
+}
+
+static inline uint32_t arch_monitor_get_capabilities(struct domain *d)
+{
+    uint32_t capabilities = 0;
+
+    return capabilities;
+}
+
+int monitor_smc(void);
+
+#endif /* __ASM_RISCV_MONITOR_H__ */
diff --git a/xen/arch/riscv/include/asm/nospec.h b/xen/arch/riscv/include/asm/nospec.h
new file mode 100644
index 0000000000..55087fa831
--- /dev/null
+++ b/xen/arch/riscv/include/asm/nospec.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright 2018 Amazon.com, Inc. or its affiliates. All Rights Reserved. */
+
+#ifndef _ASM_RISCV_NOSPEC_H
+#define _ASM_RISCV_NOSPEC_H
+
+static inline bool evaluate_nospec(bool condition)
+{
+    return condition;
+}
+
+static inline void block_speculation(void)
+{
+}
+
+#endif /* _ASM_RISCV_NOSPEC_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/include/asm/numa.h b/xen/arch/riscv/include/asm/numa.h
new file mode 100644
index 0000000000..52bdfbc16b
--- /dev/null
+++ b/xen/arch/riscv/include/asm/numa.h
@@ -0,0 +1,41 @@
+#ifndef __ARCH_RISCV_NUMA_H
+#define __ARCH_RISCV_NUMA_H
+
+#include <xen/mm.h>
+
+typedef u8 nodeid_t;
+
+/* Fake one node for now. See also node_online_map. */
+#define cpu_to_node(cpu) 0
+#define node_to_cpumask(node)   (cpu_online_map)
+
+static inline __attribute__((pure)) nodeid_t phys_to_nid(paddr_t addr)
+{
+    return 0;
+}
+
+/*
+ * TODO: make first_valid_mfn static when NUMA is supported on RISCV, this
+ * is required because the dummy helpers are using it.
+ */
+extern mfn_t first_valid_mfn;
+
+/* XXX: implement NUMA support */
+#define node_spanned_pages(nid) (max_page - mfn_x(first_valid_mfn))
+#define node_start_pfn(nid) (mfn_x(first_valid_mfn))
+#define __node_distance(a, b) (20)
+
+static inline unsigned int arch_get_dma_bitsize(void)
+{
+    return 32;
+}
+
+#endif /* __ARCH_RISCV_NUMA_H */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
new file mode 100644
index 0000000000..e13cad7b82
--- /dev/null
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -0,0 +1,307 @@
+#ifndef _XEN_P2M_H
+#define _XEN_P2M_H
+
+#include <xen/mm.h>
+#include <xen/radix-tree.h>
+#include <xen/rwlock.h>
+#include <xen/mem_access.h>
+#include <xen/errno.h>
+
+#include <asm/current.h>
+#include <asm/page-bits.h>
+
+#define paddr_bits PADDR_BITS
+
+/* Holds the bit size of IPAs in p2m tables.  */
+extern unsigned int p2m_ipa_bits;
+
+struct domain;
+
+extern void memory_type_changed(struct domain *);
+
+/* Per-p2m-table state */
+struct p2m_domain {
+    /*
+     * Lock that protects updates to the p2m.
+     */
+    rwlock_t lock;
+
+    /* Page containing root p2m table */
+    struct page_info *root;
+
+    /* Pages used to construct the p2m */
+    struct page_list_head pages;
+
+    /* Address Translation Table for the p2m */
+    uint64_t hgatp;
+};
+
+/*
+ * List of possible type for each page in the p2m entry.
+ * The number of available bit per page in the pte for this purpose is 4 bits.
+ * So it's possible to only have 16 fields. If we run out of value in the
+ * future, it's possible to use higher value for pseudo-type and don't store
+ * them in the p2m entry.
+ */
+typedef enum {
+    p2m_invalid = 0,    /* Nothing mapped here */
+    p2m_ram_rw,         /* Normal read/write guest RAM */
+    p2m_ram_ro,         /* Read-only; writes are silently dropped */
+    p2m_mmio_direct_dev,/* Read/write mapping of genuine Device MMIO area */
+    p2m_mmio_direct_nc, /* Read/write mapping of genuine MMIO area non-cacheable */
+    p2m_mmio_direct_c,  /* Read/write mapping of genuine MMIO area cacheable */
+    p2m_map_foreign_rw, /* Read/write RAM pages from foreign domain */
+    p2m_map_foreign_ro, /* Read-only RAM pages from foreign domain */
+    p2m_grant_map_rw,   /* Read/write grant mapping */
+    p2m_grant_map_ro,   /* Read-only grant mapping */
+    /* The types below are only used to decide the page attribute in the P2M */
+    p2m_iommu_map_rw,   /* Read/write iommu mapping */
+    p2m_iommu_map_ro,   /* Read-only iommu mapping */
+    p2m_max_real_type,  /* Types after this won't be store in the p2m */
+} p2m_type_t;
+
+/* We use bitmaps and mask to handle groups of types */
+#define p2m_to_mask(_t) (1UL << (_t))
+
+/* RAM types, which map to real machine frames */
+#define P2M_RAM_TYPES (p2m_to_mask(p2m_ram_rw) |        \
+                       p2m_to_mask(p2m_ram_ro))
+
+/* Grant mapping types, which map to a real frame in another VM */
+#define P2M_GRANT_TYPES (p2m_to_mask(p2m_grant_map_rw) |  \
+                         p2m_to_mask(p2m_grant_map_ro))
+
+/* Foreign mappings types */
+#define P2M_FOREIGN_TYPES (p2m_to_mask(p2m_map_foreign_rw) | \
+                           p2m_to_mask(p2m_map_foreign_ro))
+
+/* Useful predicates */
+#define p2m_is_ram(_t) (p2m_to_mask(_t) & P2M_RAM_TYPES)
+#define p2m_is_foreign(_t) (p2m_to_mask(_t) & P2M_FOREIGN_TYPES)
+#define p2m_is_any_ram(_t) (p2m_to_mask(_t) &                   \
+                            (P2M_RAM_TYPES | P2M_GRANT_TYPES |  \
+                             P2M_FOREIGN_TYPES))
+
+/* All common type definitions should live ahead of this inclusion. */
+#ifdef _XEN_P2M_COMMON_H
+# error "xen/p2m-common.h should not be included directly"
+#endif
+#include <xen/p2m-common.h>
+
+static inline
+void p2m_altp2m_check(struct vcpu *v, uint16_t idx)
+{
+    /* Not supported on ARM. */
+}
+
+/* Second stage paging setup, to be called on all CPUs */
+void setup_virt_paging(void);
+
+/* Init the datastructures for later use by the p2m code */
+int p2m_init(struct domain *d);
+
+/* Return all the p2m resources to Xen. */
+void p2m_teardown(struct domain *d);
+
+/*
+ * Remove mapping refcount on each mapping page in the p2m
+ *
+ * TODO: For the moment only foreign mappings are handled
+ */
+int relinquish_p2m_mapping(struct domain *d);
+
+/* Context switch */
+void p2m_save_state(struct vcpu *p);
+void p2m_restore_state(struct vcpu *n);
+
+/* Print debugging/statistial info about a domain's p2m */
+void p2m_dump_info(struct domain *d);
+
+static inline void p2m_write_lock(struct p2m_domain *p2m)
+{
+    write_lock(&p2m->lock);
+}
+
+void p2m_write_unlock(struct p2m_domain *p2m);
+
+static inline void p2m_read_lock(struct p2m_domain *p2m)
+{
+    read_lock(&p2m->lock);
+}
+
+static inline void p2m_read_unlock(struct p2m_domain *p2m)
+{
+    read_unlock(&p2m->lock);
+}
+
+static inline int p2m_is_locked(struct p2m_domain *p2m)
+{
+    return rw_is_locked(&p2m->lock);
+}
+
+static inline int p2m_is_write_locked(struct p2m_domain *p2m)
+{
+    return rw_is_write_locked(&p2m->lock);
+}
+
+void p2m_tlb_flush_sync(struct p2m_domain *p2m);
+
+/* Look up the MFN corresponding to a domain's GFN. */
+mfn_t p2m_lookup(struct domain *d, gfn_t gfn, p2m_type_t *t);
+
+/*
+ * Get details of a given gfn.
+ * The P2M lock should be taken by the caller.
+ */
+mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
+                    p2m_type_t *t, p2m_access_t *a,
+                    unsigned int *page_order,
+                    bool *valid);
+
+/*
+ * Direct set a p2m entry: only for use by the P2M code.
+ * The P2M write lock should be taken.
+ */
+int p2m_set_entry(struct p2m_domain *p2m,
+                  gfn_t sgfn,
+                  unsigned long nr,
+                  mfn_t smfn,
+                  p2m_type_t t,
+                  p2m_access_t a);
+
+bool p2m_resolve_translation_fault(struct domain *d, gfn_t gfn);
+
+void p2m_invalidate_root(struct p2m_domain *p2m);
+
+/*
+ * Clean & invalidate caches corresponding to a region [start,end) of guest
+ * address space.
+ *
+ * start will get updated if the function is preempted.
+ */
+int p2m_cache_flush_range(struct domain *d, gfn_t *pstart, gfn_t end);
+
+void p2m_set_way_flush(struct vcpu *v);
+
+void p2m_toggle_cache(struct vcpu *v, bool was_enabled);
+
+void p2m_flush_vm(struct vcpu *v);
+
+/*
+ * Map a region in the guest p2m with a specific p2m type.
+ * The memory attributes will be derived from the p2m type.
+ */
+int map_regions_p2mt(struct domain *d,
+                     gfn_t gfn,
+                     unsigned long nr,
+                     mfn_t mfn,
+                     p2m_type_t p2mt);
+
+int unmap_regions_p2mt(struct domain *d,
+                       gfn_t gfn,
+                       unsigned long nr,
+                       mfn_t mfn);
+
+int map_dev_mmio_region(struct domain *d,
+                        gfn_t gfn,
+                        unsigned long nr,
+                        mfn_t mfn);
+
+int guest_physmap_add_entry(struct domain *d,
+                            gfn_t gfn,
+                            mfn_t mfn,
+                            unsigned long page_order,
+                            p2m_type_t t);
+
+/* Untyped version for RAM only, for compatibility */
+static inline int guest_physmap_add_page(struct domain *d,
+                                         gfn_t gfn,
+                                         mfn_t mfn,
+                                         unsigned int page_order)
+{
+    return guest_physmap_add_entry(d, gfn, mfn, page_order, p2m_ram_rw);
+}
+
+mfn_t gfn_to_mfn(struct domain *d, gfn_t gfn);
+
+/* Look up a GFN and take a reference count on the backing page. */
+typedef unsigned int p2m_query_t;
+#define P2M_ALLOC    (1u<<0)   /* Populate PoD and paged-out entries */
+#define P2M_UNSHARE  (1u<<1)   /* Break CoW sharing */
+
+struct page_info *p2m_get_page_from_gfn(struct domain *d, gfn_t gfn,
+                                        p2m_type_t *t);
+
+
+struct page_info *get_page_from_gfn(struct domain *d, unsigned long gfn,
+                                    p2m_type_t *t, p2m_query_t q);
+
+int get_page_type(struct page_info *page, unsigned long type);
+bool is_iomem_page(mfn_t mfn);
+static inline int get_page_and_type(struct page_info *page,
+                                    struct domain *domain,
+                                    unsigned long type)
+{
+    int rc = get_page(page, domain);
+
+    if ( likely(rc) && unlikely(!get_page_type(page, type)) )
+    {
+        put_page(page);
+        rc = 0;
+    }
+
+    return rc;
+}
+
+/* get host p2m table */
+#define p2m_get_hostp2m(d) (&(d)->arch.p2m)
+
+static inline bool p2m_vm_event_sanity_check(struct domain *d)
+{
+    return true;
+}
+
+/*
+ * Return the start of the next mapping based on the order of the
+ * current one.
+ */
+static inline gfn_t gfn_next_boundary(gfn_t gfn, unsigned int order)
+{
+    /*
+     * The order corresponds to the order of the mapping (or invalid
+     * range) in the page table. So we need to align the GFN before
+     * incrementing.
+     */
+    gfn = _gfn(gfn_x(gfn) & ~((1UL << order) - 1));
+
+    return gfn_add(gfn, 1UL << order);
+}
+
+/*
+ * A vCPU has cache enabled only when the MMU is enabled and data cache
+ * is enabled.
+ */
+static inline bool vcpu_has_cache_enabled(struct vcpu *v)
+{
+    /* Only works with the current vCPU */
+    ASSERT(current == v);
+
+    return 0;
+}
+
+static inline bool arch_acquire_resource_check(struct domain *d)
+{
+    BUG(); /* unimplemented */
+    return true;
+}
+
+#endif /* _XEN_P2M_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/include/asm/page-bits.h b/xen/arch/riscv/include/asm/page-bits.h
new file mode 100644
index 0000000000..c0e3d80928
--- /dev/null
+++ b/xen/arch/riscv/include/asm/page-bits.h
@@ -0,0 +1,14 @@
+#ifndef __RISCV_PAGE_SHIFT_H__
+#define __RISCV_PAGE_SHIFT_H__
+
+#define PAGE_SHIFT              12
+
+#ifdef CONFIG_RISCV_64
+#define PADDR_BITS              39
+#else
+#define PADDR_BITS              32
+#endif
+
+#define VADDR_BITS              32
+
+#endif /* __RISCV_PAGE_SHIFT_H__ */
diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
new file mode 100644
index 0000000000..4730e21ffb
--- /dev/null
+++ b/xen/arch/riscv/include/asm/page.h
@@ -0,0 +1,319 @@
+/*
+ * Copyright (C) 2009 Chen Liqin <liqin.chen@sunplusct.com>
+ * Copyright (C) 2012 Regents of the University of California
+ * Copyright (C) 2017 SiFive
+ * Copyright (C) 2017 XiaojingZhu <zhuxiaoj@ict.ac.cn>
+ * Copyright (C) 2019 Bobby Eshleman <bobbyeshleman@gmail.com>
+ *
+ *   This program is free software; you can redistribute it and/or
+ *   modify it under the terms of the GNU General Public License
+ *   as published by the Free Software Foundation, version 2.
+ *
+ *   This program is distributed in the hope that it will be useful,
+ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *   GNU General Public License for more details.
+ */
+
+#ifndef _ASM_RISCV_PAGE_H
+#define _ASM_RISCV_PAGE_H
+
+#include <public/xen.h>
+#include <xen/const.h>
+#include <xen/config.h>
+#include <asm/riscv_encoding.h>
+#include <asm/asm.h>
+
+#define KERN_VIRT_SIZE (-PAGE_OFFSET)
+
+#define PAGE_ENTRIES           512
+#define VPN_BITS               (9)
+#define VPN_MASK               ((unsigned long)((1 << VPN_BITS) - 1))
+
+#ifdef CONFIG_RISCV_64
+/* L3 index Bit[47:39] */
+#define THIRD_SHIFT            (39)
+#define THIRD_MASK             (VPN_MASK << THIRD_SHIFT)
+/* L2 index Bit[38:30] */
+#define SECOND_SHIFT           (30)
+#define SECOND_MASK            (VPN_MASK << SECOND_SHIFT)
+/* L1 index Bit[29:21] */
+#define FIRST_SHIFT            (21)
+#define FIRST_MASK             (VPN_MASK << FIRST_SHIFT)
+/* L0 index Bit[20:12] */
+#define ZEROETH_SHIFT          (12)
+#define ZEROETH_MASK           (VPN_MASK << ZEROETH_SHIFT)
+
+#else // CONFIG_RISCV_32
+
+/* L1 index Bit[31:22] */
+#define FIRST_SHIFT            (22)
+#define FIRST_MASK             (VPN_MASK << FIRST_SHIFT)
+
+/* L0 index Bit[21:12] */
+#define ZEROETH_SHIFT          (12)
+#define ZEROETH_MASK           (VPN_MASK << ZEROETH_SHIFT)
+#endif
+
+#define THIRD_SIZE             (1 << THIRD_SHIFT)
+#define THIRD_MAP_MASK         (~(THIRD_SIZE - 1))
+#define SECOND_SIZE            (1 << SECOND_SHIFT)
+#define SECOND_MAP_MASK        (~(SECOND_SIZE - 1))
+#define FIRST_SIZE             (1 << FIRST_SHIFT)
+#define FIRST_MAP_MASK         (~(FIRST_SIZE - 1))
+#define ZEROETH_SIZE           (1 << ZEROETH_SHIFT)
+#define ZEROETH_MAP_MASK       (~(ZEROETH_SIZE - 1))
+
+#define PTE_ADDR_MASK          0x003FFFFFFFFFFC00ULL
+#define PTE_SHIFT              10
+#define PTE_RSW_MASK           0x0000000000000300ULL
+#define PTE_RSW_SHIFT          8
+
+#define PTE_USER_SHIFT         4
+#define PTE_PERM_MASK                (PTE_EXECUTE_MASK | \
+                                      PTE_WRITE_MASK | \
+                                      PTE_READ_MASK)
+
+#define PTE_VALID       BIT(0, UL)
+#define PTE_READABLE    BIT(1, UL)
+#define PTE_WRITABLE    BIT(2, UL)
+#define PTE_EXECUTABLE  BIT(3, UL)
+#define PTE_USER        BIT(4, UL)
+#define PTE_GLOBAL      BIT(5, UL)
+#define PTE_ACCESSED    BIT(6, UL)
+#define PTE_DIRTY       BIT(7, UL)
+#define PTE_RSW         (BIT(8, UL) | BIT(9, UL))
+
+#define PTE_LEAF_DEFAULT (PTE_VALID | PTE_READABLE | PTE_WRITABLE | PTE_EXECUTABLE)
+#define PTE_TABLE (PTE_VALID)
+
+/* Calculate the offsets into the pagetables for a given VA */
+#define zeroeth_linear_offset(va) ((va) >> ZEROETH_SHIFT)
+#define first_linear_offset(va) ((va) >> FIRST_SHIFT)
+#define second_linear_offset(va) ((va) >> SECOND_SHIFT)
+#define third_linear_offset(va) ((va) >> THIRD_SHIFT)
+
+#define pagetable_zeroeth_index(va) zeroeth_linear_offset((va) & ZEROETH_MASK)
+#define pagetable_first_index(va) first_linear_offset((va) & FIRST_MASK)
+#define pagetable_second_index(va) second_linear_offset((va) & SECOND_MASK)
+#define pagetable_third_index(va) third_linear_offset((va) & THIRD_MASK)
+
+#ifndef __ASSEMBLY__
+
+#define PAGE_UP(addr)	(((addr)+((PAGE_SIZE)-1))&(~((PAGE_SIZE)-1)))
+#define PAGE_DOWN(addr)	((addr)&(~((PAGE_SIZE)-1)))
+
+/* align addr on a size boundary - adjust address up/down if needed */
+#define _ALIGN_UP(addr, size)	(((addr)+((size)-1))&(~((size)-1)))
+#define _ALIGN_DOWN(addr, size)	((addr)&(~((size)-1)))
+
+/* align addr on a size boundary - adjust address up if needed */
+#define _ALIGN(addr, size)	_ALIGN_UP(addr, size)
+
+#define clear_page(pgaddr)			memset((pgaddr), 0, PAGE_SIZE)
+#define copy_page(to, from)			memcpy((to), (from), PAGE_SIZE)
+
+#define clear_user_page(pgaddr, vaddr, page)	memset((pgaddr), 0, PAGE_SIZE)
+#define copy_user_page(vto, vfrom, vaddr, topg) \
+			memcpy((vto), (vfrom), PAGE_SIZE)
+
+/*
+ * Attribute Indexes.
+ *
+ */
+#define MT_NORMAL        0x0
+
+#define _PAGE_XN_BIT    3
+#define _PAGE_RO_BIT    4
+#define _PAGE_XN    (1U << _PAGE_XN_BIT)
+#define _PAGE_RO    (1U << _PAGE_RO_BIT)
+#define PAGE_XN_MASK(x) (((x) >> _PAGE_XN_BIT) & 0x1U)
+#define PAGE_RO_MASK(x) (((x) >> _PAGE_RO_BIT) & 0x1U)
+
+/*
+ * _PAGE_DEVICE and _PAGE_NORMAL are convenience defines. They are not
+ * meant to be used outside of this header.
+ */
+#define _PAGE_DEVICE    _PAGE_XN
+#define _PAGE_NORMAL    MT_NORMAL
+
+#define PAGE_HYPERVISOR_RO      (_PAGE_NORMAL|_PAGE_RO|_PAGE_XN)
+#define PAGE_HYPERVISOR_RX      (_PAGE_NORMAL|_PAGE_RO)
+#define PAGE_HYPERVISOR_RW      (_PAGE_NORMAL|_PAGE_XN)
+
+#define PAGE_HYPERVISOR         PAGE_HYPERVISOR_RW
+#define PAGE_HYPERVISOR_NOCACHE (_PAGE_DEVICE)
+#define PAGE_HYPERVISOR_WC      (_PAGE_DEVICE)
+
+/* Invalidate all instruction caches in Inner Shareable domain to PoU */
+static inline void invalidate_icache(void)
+{
+    asm volatile ("fence.i" ::: "memory");
+}
+
+static inline int invalidate_dcache_va_range(const void *p, unsigned long size)
+{
+	/* TODO */
+	return 0;
+}
+
+static inline int clean_dcache_va_range(const void *p, unsigned long size)
+{
+	/* TODO */
+	return 0;
+}
+
+static inline int clean_and_invalidate_dcache_va_range
+    (const void *p, unsigned long size)
+{
+	/* TODO */
+    return 0;
+}
+
+/*
+ * Use struct definitions to apply C type checking
+ */
+
+/* Page Global Directory entry */
+typedef struct {
+	unsigned long pgd;
+} pgd_t;
+
+/* Page Table entry */
+typedef struct {
+    uint64_t pte;
+} pte_t;
+
+typedef struct {
+	unsigned long pgprot;
+} pgprot_t;
+
+typedef struct page *pgtable_t;
+
+#define pte_val(x)	((x).pte)
+#define pgd_val(x)	((x).pgd)
+#define pgprot_val(x)	((x).pgprot)
+
+static inline bool pte_is_table(pte_t *p)
+{
+    return (((p->pte) & (PTE_VALID
+                        | PTE_READABLE
+                        | PTE_WRITABLE
+                        | PTE_EXECUTABLE)) == PTE_VALID);
+}
+
+static inline bool pte_is_valid(pte_t *p)
+{
+    return p->pte & PTE_VALID;
+}
+
+static inline bool pte_is_leaf(pte_t *p)
+{
+    return (p->pte & (PTE_WRITABLE | PTE_READABLE | PTE_EXECUTABLE));
+}
+
+/* Shift the VPN[x] or PPN[x] fields of a virtual or physical address
+ * to become the shifted PPN[x] fields of a page table entry */
+#define addr_to_ppn(x) (((x) >> PAGE_SHIFT) << PTE_SHIFT)
+
+static inline pte_t paddr_to_pte(unsigned long paddr)
+{
+    return (pte_t) { .pte = addr_to_ppn(paddr) };
+}
+
+static inline paddr_t pte_to_paddr(pte_t *p)
+{
+     return (paddr_t) ((p->pte >> PTE_SHIFT) << PAGE_SHIFT);
+}
+
+#define pte_get_mfn(pte_)      _mfn(((pte_).pte) >> PTE_SHIFT)
+
+#define MEGAPAGE_ALIGN(x) ((x) & FIRST_MAP_MASK)
+#define GIGAPAGE_ALIGN(x) ((x) & SECOND_MAP_MASK)
+
+#define paddr_to_megapage_ppn(x) addr_to_ppn(MEGAPAGE_ALIGN(x))
+#define paddr_to_gigapage_ppn(x) addr_to_ppn(GIGAPAGE_ALIGN(x))
+
+#define __pte(x)	((pte_t) { (x) })
+#define __pgd(x)	((pgd_t) { (x) })
+#define __pgprot(x)	((pgprot_t) { (x) })
+
+#ifdef CONFIG_64BIT
+#define PTE_FMT "%016lx"
+#else
+#define PTE_FMT "%08lx"
+#endif
+
+extern unsigned long va_pa_offset;
+extern unsigned long pfn_base;
+
+extern unsigned long max_low_pfn;
+extern unsigned long min_low_pfn;
+
+#define __pa(x)		((unsigned long)(x) - va_pa_offset)
+#define __va(x)		((void *)((unsigned long) (x) + va_pa_offset))
+
+#define pfn_valid(pfn) \
+	(((pfn) >= pfn_base) && (((pfn)-pfn_base) < max_mapnr))
+
+#define ARCH_PFN_OFFSET		(pfn_base)
+
+#endif /* __ASSEMBLY__ */
+
+#define PAGE_ALIGN(x) (((x) + PAGE_SIZE - 1) & PAGE_MASK)
+
+#define virt_addr_valid(vaddr)	(pfn_valid(virt_to_pfn(vaddr)))
+
+#define VM_DATA_DEFAULT_FLAGS	(VM_READ | VM_WRITE | \
+				 VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
+
+/* Flush the dcache for an entire page. */
+void flush_page_to_ram(unsigned long mfn, bool sync_icache);
+
+static inline uint64_t va_to_par(vaddr_t va)
+{
+    register unsigned long __mepc asm ("a2") = va;
+    register unsigned long __mstatus asm ("a3");
+    register unsigned long __bsstatus asm ("a4");
+    unsigned long val;
+    unsigned long rvc_mask = 3, tmp;
+    asm ("csrrs %[mstatus], "STR(CSR_MSTATUS)", %[mprv]\n"
+        "csrrs %[bsstatus], "STR(CSR_BSSTATUS)", %[smxr]\n"
+        "and %[tmp], %[addr], 2\n"
+        "bnez %[tmp], 1f\n"
+#if CONFIG_RISCV_64
+        STR(LWU) " %[insn], (%[addr])\n"
+#else
+        STR(LW) " %[insn], (%[addr])\n"
+#endif
+        "and %[tmp], %[insn], %[rvc_mask]\n"
+        "beq %[tmp], %[rvc_mask], 2f\n"
+        "sll %[insn], %[insn], %[xlen_minus_16]\n"
+        "srl %[insn], %[insn], %[xlen_minus_16]\n"
+        "j 2f\n"
+        "1:\n"
+        "lhu %[insn], (%[addr])\n"
+        "and %[tmp], %[insn], %[rvc_mask]\n"
+        "bne %[tmp], %[rvc_mask], 2f\n"
+        "lhu %[tmp], 2(%[addr])\n"
+        "sll %[tmp], %[tmp], 16\n"
+        "add %[insn], %[insn], %[tmp]\n"
+        "2: csrw "STR(CSR_BSSTATUS)", %[bsstatus]\n"
+        "csrw "STR(CSR_MSTATUS)", %[mstatus]"
+    : [mstatus] "+&r" (__mstatus), [bsstatus] "+&r" (__bsstatus),
+      [insn] "=&r" (val), [tmp] "=&r" (tmp)
+    : [mprv] "r" (MSTATUS_MPRV | SSTATUS_MXR), [smxr] "r" (SSTATUS_MXR),
+      [addr] "r" (__mepc), [rvc_mask] "r" (rvc_mask),
+      [xlen_minus_16] "i" (__riscv_xlen - 16));
+
+    return val;
+}
+
+/* Write a pagetable entry. */
+static inline void write_pte(pte_t *p, pte_t pte)
+{
+    *p = pte;
+    asm volatile ("sfence.vma");
+}
+
+#endif /* _ASM_RISCV_PAGE_H */
diff --git a/xen/arch/riscv/include/asm/paging.h b/xen/arch/riscv/include/asm/paging.h
new file mode 100644
index 0000000000..6d1a000246
--- /dev/null
+++ b/xen/arch/riscv/include/asm/paging.h
@@ -0,0 +1,16 @@
+#ifndef _XEN_PAGING_H
+#define _XEN_PAGING_H
+
+#define paging_mode_translate(d)              (1)
+#define paging_mode_external(d)               (1)
+
+#endif /* XEN_PAGING_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/include/asm/pci.h b/xen/arch/riscv/include/asm/pci.h
new file mode 100644
index 0000000000..0ccf335e34
--- /dev/null
+++ b/xen/arch/riscv/include/asm/pci.h
@@ -0,0 +1,31 @@
+/******************************************************************************
+ *
+ * Copyright 2019 (C) Alistair Francis <alistair.francis@wdc.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ */
+
+#ifndef __RISCV_PCI_H__
+#define __RISCV_PCI_H__
+
+struct arch_pci_dev {
+};
+
+#endif /* __RISCV_PCI_H__ */
diff --git a/xen/arch/riscv/include/asm/percpu.h b/xen/arch/riscv/include/asm/percpu.h
new file mode 100644
index 0000000000..05faa187ab
--- /dev/null
+++ b/xen/arch/riscv/include/asm/percpu.h
@@ -0,0 +1,35 @@
+#ifndef __RISCV_PERCPU_H__
+#define __RISCV_PERCPU_H__
+
+#ifndef __ASSEMBLY__
+
+#include <xen/types.h>
+#include <asm/csr.h>
+#include <asm/processor.h>
+
+extern char __per_cpu_start[], __per_cpu_data_end[];
+extern unsigned long __per_cpu_offset[NR_CPUS];
+void percpu_init_areas(void);
+
+#define per_cpu(var, cpu)  \
+    (*RELOC_HIDE(&per_cpu__##var, __per_cpu_offset[cpu]))
+
+#define this_cpu(var) \
+    (*RELOC_HIDE(&per_cpu__##var, __per_cpu_offset[get_processor_id()]))
+
+#define per_cpu_ptr(var, cpu)  \
+    (*RELOC_HIDE(var, __per_cpu_offset[cpu]))
+#define this_cpu_ptr(var) \
+    (*RELOC_HIDE(var, get_processor_id()))
+
+#endif
+
+#endif /* __RISCV_PERCPU_H__ */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/include/asm/processor.h b/xen/arch/riscv/include/asm/processor.h
new file mode 100644
index 0000000000..30eb2c5987
--- /dev/null
+++ b/xen/arch/riscv/include/asm/processor.h
@@ -0,0 +1,176 @@
+/******************************************************************************
+ *
+ * Copyright 2019 (C) Alistair Francis <alistair.francis@wdc.com>
+ * Copyright 2021 (C) Bobby Eshleman <bobby.eshleman@gmail.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ */
+
+#ifndef _ASM_RISCV_PROCESSOR_H
+#define _ASM_RISCV_PROCESSOR_H
+
+#include <asm/types.h>
+
+#define RISCV_CPU_USER_REGS_zero		0
+#define RISCV_CPU_USER_REGS_ra		    1
+#define RISCV_CPU_USER_REGS_sp		    2
+#define RISCV_CPU_USER_REGS_gp		    3
+#define RISCV_CPU_USER_REGS_tp		    4
+#define RISCV_CPU_USER_REGS_t0		    5
+#define RISCV_CPU_USER_REGS_t1		    6
+#define RISCV_CPU_USER_REGS_t2		    7
+#define RISCV_CPU_USER_REGS_s0		    8
+#define RISCV_CPU_USER_REGS_s1		    9
+#define RISCV_CPU_USER_REGS_a0		    10
+#define RISCV_CPU_USER_REGS_a1		    11
+#define RISCV_CPU_USER_REGS_a2		    12
+#define RISCV_CPU_USER_REGS_a3		    13
+#define RISCV_CPU_USER_REGS_a4		    14
+#define RISCV_CPU_USER_REGS_a5		    15
+#define RISCV_CPU_USER_REGS_a6		    16
+#define RISCV_CPU_USER_REGS_a7		    17
+#define RISCV_CPU_USER_REGS_s2		    18
+#define RISCV_CPU_USER_REGS_s3		    19
+#define RISCV_CPU_USER_REGS_s4		    20
+#define RISCV_CPU_USER_REGS_s5		    21
+#define RISCV_CPU_USER_REGS_s6		    22
+#define RISCV_CPU_USER_REGS_s7		    23
+#define RISCV_CPU_USER_REGS_s8		    24
+#define RISCV_CPU_USER_REGS_s9		    25
+#define RISCV_CPU_USER_REGS_s10		    26
+#define RISCV_CPU_USER_REGS_s11		    27
+#define RISCV_CPU_USER_REGS_t3		    28 
+#define RISCV_CPU_USER_REGS_t4		    29
+#define RISCV_CPU_USER_REGS_t5		    30
+#define RISCV_CPU_USER_REGS_t6		    31
+#define RISCV_CPU_USER_REGS_sepc       	    32
+#define RISCV_CPU_USER_REGS_sstatus    	    33
+#define RISCV_CPU_USER_REGS_pregs    	    34
+#define RISCV_CPU_USER_REGS_last	    35
+
+#define RISCV_CPU_USER_REGS_OFFSET(x)	((RISCV_CPU_USER_REGS_##x) * __SIZEOF_POINTER__)
+#define RISCV_CPU_USER_REGS_SIZE		RISCV_CPU_USER_REGS_OFFSET(last)
+
+#define RISCV_PCPUINFO_processor_id     0
+#define RISCV_PCPUINFO_guest_cpu_info   1
+#define RISCV_PCPUINFO_stack_cpu_regs   2
+#define RISCV_PCPUINFO_tmp              3
+#define RISCV_PCPUINFO_last             4
+#define RISCV_PCPUINFO_OFFSET(x)	((RISCV_PCPUINFO_##x) * __SIZEOF_POINTER__)
+#define RISCV_PCPUINFO_SIZE		    RISCV_PCPUINFO_OFFSET(last)
+
+#ifndef __ASSEMBLY__
+
+register struct pcpu_info *tp asm ("tp");
+
+struct pcpu_info {
+    unsigned long processor_id;
+    /* cpu_info of the guest. Always on the top of the stack. */
+    struct cpu_info *guest_cpu_info;
+    /* CPU registers of the current trap. Differ from guest_cpu_info if trapped from xen. */
+    struct cpu_user_regs *stack_cpu_regs;
+
+    /* temporary variable to be used during save/restore of vcpu regs */
+    unsigned long tmp;
+};
+
+/* tp points to one of these */
+extern struct pcpu_info pcpu_info[NR_CPUS];
+
+#define get_processor_id()    (tp->processor_id)
+#define set_processor_id(id)  do {                          \
+    tp->processor_id = id;                            \
+} while(0)
+
+/* On stack VCPU state */
+struct cpu_user_regs
+{
+    register_t zero;
+    register_t ra;
+    register_t sp;
+    register_t gp;
+    register_t tp;
+    register_t t0;
+    register_t t1;
+    register_t t2;
+    register_t s0;
+    register_t s1;
+    register_t a0;
+    register_t a1;
+    register_t a2;
+    register_t a3;
+    register_t a4;
+    register_t a5;
+    register_t a6;
+    register_t a7;
+    register_t s2;
+    register_t s3;
+    register_t s4;
+    register_t s5;
+    register_t s6;
+    register_t s7;
+    register_t s8;
+    register_t s9;
+    register_t s10;
+    register_t s11;
+    register_t t3;
+    register_t t4;
+    register_t t5;
+    register_t t6;
+    register_t sepc;
+    register_t sstatus;
+    /* pointer to previous stack_cpu_regs */
+    register_t pregs;
+};
+
+void show_execution_state(const struct cpu_user_regs *regs);
+void show_registers(const struct cpu_user_regs *regs);
+
+/* All a bit UP for the moment */
+#define cpu_to_core(_cpu)   (0)
+#define cpu_to_socket(_cpu) (0)
+
+/* Based on Linux: arch/riscv/include/asm/processor.h */
+
+static inline void cpu_relax(void)
+{
+	int dummy;
+	/* In lieu of a halt instruction, induce a long-latency stall. */
+	__asm__ __volatile__ ("div %0, %0, zero" : "=r" (dummy));
+	barrier();
+}
+
+static inline void wait_for_interrupt(void)
+{
+	__asm__ __volatile__ ("wfi");
+}
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* _ASM_RISCV_PROCESSOR_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/include/asm/random.h b/xen/arch/riscv/include/asm/random.h
new file mode 100644
index 0000000000..b4acee276b
--- /dev/null
+++ b/xen/arch/riscv/include/asm/random.h
@@ -0,0 +1,9 @@
+#ifndef __ASM_RANDOM_H__
+#define __ASM_RANDOM_H__
+
+static inline unsigned int arch_get_random(void)
+{
+    return 0;
+}
+
+#endif /* __ASM_RANDOM_H__ */
diff --git a/xen/arch/riscv/include/asm/regs.h b/xen/arch/riscv/include/asm/regs.h
new file mode 100644
index 0000000000..103cf1e91e
--- /dev/null
+++ b/xen/arch/riscv/include/asm/regs.h
@@ -0,0 +1,42 @@
+#ifndef __ARM_REGS_H__
+#define __ARM_REGS_H__
+
+#define PSR_MODE_MASK 0x1f
+
+#ifndef __ASSEMBLY__
+
+#include <xen/lib.h>
+#include <xen/types.h>
+#include <public/xen.h>
+#include <asm/current.h>
+#include <asm/processor.h>
+
+#define hyp_mode(r)     (0)
+
+static inline bool guest_mode(const struct cpu_user_regs *r)
+{
+    unsigned long diff = (char *)guest_cpu_user_regs() - (char *)(r);
+    /* Frame pointer must point into current CPU stack. */
+    ASSERT(diff < STACK_SIZE);
+    /* If not a guest frame, it must be a hypervisor frame. */
+    ASSERT((diff == 0) || hyp_mode(r));
+    /* Return TRUE if it's a guest frame. */
+    return (diff == 0);
+}
+
+#define return_reg(v) ((v)->arch.cpu_info->guest_cpu_user_regs.r0)
+
+register_t get_user_reg(struct cpu_user_regs *regs, int reg);
+void set_user_reg(struct cpu_user_regs *regs, int reg, register_t val);
+
+#endif
+
+#endif /* __ARM_REGS_H__ */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/include/asm/riscv_encoding.h b/xen/arch/riscv/include/asm/riscv_encoding.h
new file mode 100644
index 0000000000..a94ab5e652
--- /dev/null
+++ b/xen/arch/riscv/include/asm/riscv_encoding.h
@@ -0,0 +1,960 @@
+/*
+ * Copyright (c) 2019 Western Digital Corporation or its affiliates.
+ *
+ * Authors:
+ *   Anup Patel <anup.patel@wdc.com>
+ * 
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2, or (at your option)
+ * any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ *
+ * The source has been largely adapted from OpenSBI:
+ * include/sbi/riscv_encodnig.h
+ * 
+ * The original code is licensed under the BSD 2-clause license.
+ * 
+ */
+
+#ifndef __RISCV_ENCODING_H__
+#define __RISCV_ENCODING_H__
+
+#define _UL(X) _AC(X, UL)
+#define _ULL(X) _AC(X, ULL)
+
+/* clang-format off */
+#define MSTATUS_SIE			_UL(0x00000002)
+#define MSTATUS_MIE			_UL(0x00000008)
+#define MSTATUS_SPIE_SHIFT		5
+#define MSTATUS_SPIE			(_UL(1) << MSTATUS_SPIE_SHIFT)
+#define MSTATUS_UBE			_UL(0x00000040)
+#define MSTATUS_MPIE			_UL(0x00000080)
+#define MSTATUS_SPP_SHIFT		8
+#define MSTATUS_SPP			(_UL(1) << MSTATUS_SPP_SHIFT)
+#define MSTATUS_MPP_SHIFT		11
+#define MSTATUS_MPP			(_UL(3) << MSTATUS_MPP_SHIFT)
+#define MSTATUS_FS			_UL(0x00006000)
+#define MSTATUS_FS_OFF			_UL(0x00000000)
+#define MSTATUS_FS_INITIAL		_UL(0x00002000)
+#define MSTATUS_FS_CLEAN		_UL(0x00004000)
+#define MSTATUS_FS_DIRTY		_UL(0x00006000)
+#define MSTATUS_XS			_UL(0x00018000)
+#define MSTATUS_XS_OFF			_UL(0x00000000)
+#define MSTATUS_XS_INITIAL		_UL(0x00008000)
+#define MSTATUS_XS_CLEAN		_UL(0x00010000)
+#define MSTATUS_XS_DIRTY		_UL(0x00018000)
+#define MSTATUS_VS			_UL(0x01800000)
+#define MSTATUS_VS_OFF			_UL(0x00000000)
+#define MSTATUS_VS_INITIAL		_UL(0x00800000)
+#define MSTATUS_VS_CLEAN		_UL(0x01000000)
+#define MSTATUS_VS_DIRTY		_UL(0x01800000)
+#define MSTATUS_MPRV			_UL(0x00020000)
+#define MSTATUS_SUM			_UL(0x00040000)
+#define MSTATUS_MXR			_UL(0x00080000)
+#define MSTATUS_TVM			_UL(0x00100000)
+#define MSTATUS_TW			_UL(0x00200000)
+#define MSTATUS_TSR			_UL(0x00400000)
+#define MSTATUS32_SD			_UL(0x80000000)
+#if __riscv_xlen == 64
+#define MSTATUS_UXL			_ULL(0x0000000300000000)
+#define MSTATUS_SXL			_ULL(0x0000000C00000000)
+#define MSTATUS_SBE			_ULL(0x0000001000000000)
+#define MSTATUS_MBE			_ULL(0x0000002000000000)
+#define MSTATUS_MPV			_ULL(0x0000008000000000)
+#else
+#define MSTATUSH_SBE			_UL(0x00000010)
+#define MSTATUSH_MBE			_UL(0x00000020)
+#define MSTATUSH_MPV			_UL(0x00000080)
+#endif
+#define MSTATUS32_SD			_UL(0x80000000)
+#define MSTATUS64_SD			_ULL(0x8000000000000000)
+
+#define SSTATUS_SIE			MSTATUS_SIE
+#define SSTATUS_SPIE_SHIFT		MSTATUS_SPIE_SHIFT
+#define SSTATUS_SPIE			MSTATUS_SPIE
+#define SSTATUS_SPP_SHIFT		MSTATUS_SPP_SHIFT
+#define SSTATUS_SPP			MSTATUS_SPP
+#define SSTATUS_FS			MSTATUS_FS
+#define SSTATUS_FS_OFF			MSTATUS_FS_OFF
+#define SSTATUS_FS_INITIAL		MSTATUS_FS_INITIAL
+#define SSTATUS_FS_CLEAN		MSTATUS_FS_CLEAN
+#define SSTATUS_FS_DIRTY		MSTATUS_FS_DIRTY
+#define SSTATUS_XS			MSTATUS_XS
+#define SSTATUS_XS_OFF			MSTATUS_XS_OFF
+#define SSTATUS_XS_INITIAL		MSTATUS_XS_INITIAL
+#define SSTATUS_XS_CLEAN		MSTATUS_XS_CLEAN
+#define SSTATUS_XS_DIRTY		MSTATUS_XS_DIRTY
+#define SSTATUS_VS			MSTATUS_VS
+#define SSTATUS_VS_OFF			MSTATUS_VS_OFF
+#define SSTATUS_VS_INITIAL		MSTATUS_VS_INITIAL
+#define SSTATUS_VS_CLEAN		MSTATUS_VS_CLEAN
+#define SSTATUS_VS_DIRTY		MSTATUS_VS_DIRTY
+#define SSTATUS_SUM			MSTATUS_SUM
+#define SSTATUS_MXR			MSTATUS_MXR
+#define SSTATUS32_SD			MSTATUS32_SD
+#define SSTATUS64_UXL			MSTATUS_UXL
+#define SSTATUS64_SD			MSTATUS64_SD
+
+#if __riscv_xlen == 64
+#define HSTATUS_VSXL			_UL(0x300000000)
+#define HSTATUS_VSXL_SHIFT		32
+#endif
+#define HSTATUS_VTSR			_UL(0x00400000)
+#define HSTATUS_VTW			_UL(0x00200000)
+#define HSTATUS_VTVM			_UL(0x00100000)
+#define HSTATUS_VGEIN			_UL(0x0003f000)
+#define HSTATUS_VGEIN_SHIFT		12
+#define HSTATUS_HU			_UL(0x00000200)
+#define HSTATUS_SPVP			_UL(0x00000100)
+#define HSTATUS_SPV			_UL(0x00000080)
+#define HSTATUS_GVA			_UL(0x00000040)
+#define HSTATUS_VSBE			_UL(0x00000020)
+
+#define IRQ_S_SOFT			1
+#define IRQ_VS_SOFT			2
+#define IRQ_M_SOFT			3
+#define IRQ_S_TIMER			5
+#define IRQ_VS_TIMER			6
+#define IRQ_M_TIMER			7
+#define IRQ_S_EXT			9
+#define IRQ_VS_EXT			10
+#define IRQ_M_EXT			11
+#define IRQ_S_GEXT			12
+#define IRQ_PMU_OVF			13
+
+#define MIP_SSIP			(_UL(1) << IRQ_S_SOFT)
+#define MIP_VSSIP			(_UL(1) << IRQ_VS_SOFT)
+#define MIP_MSIP			(_UL(1) << IRQ_M_SOFT)
+#define MIP_STIP			(_UL(1) << IRQ_S_TIMER)
+#define MIP_VSTIP			(_UL(1) << IRQ_VS_TIMER)
+#define MIP_MTIP			(_UL(1) << IRQ_M_TIMER)
+#define MIP_SEIP			(_UL(1) << IRQ_S_EXT)
+#define MIP_VSEIP			(_UL(1) << IRQ_VS_EXT)
+#define MIP_MEIP			(_UL(1) << IRQ_M_EXT)
+#define MIP_SGEIP			(_UL(1) << IRQ_S_GEXT)
+#define MIP_LCOFIP			(_UL(1) << IRQ_PMU_OVF)
+
+#define SIP_SSIP			MIP_SSIP
+#define SIP_STIP			MIP_STIP
+
+#define PRV_U				_UL(0)
+#define PRV_S				_UL(1)
+#define PRV_M				_UL(3)
+
+#define SATP32_MODE			_UL(0x80000000)
+#define SATP32_MODE_SHIFT		31
+#define SATP32_ASID			_UL(0x7FC00000)
+#define SATP32_ASID_SHIFT		22
+#define SATP32_PPN			_UL(0x003FFFFF)
+#define SATP64_MODE			_ULL(0xF000000000000000)
+#define SATP64_MODE_SHIFT		60
+#define SATP64_ASID			_ULL(0x0FFFF00000000000)
+#define SATP64_ASID_SHIFT		44
+#define SATP64_PPN			_ULL(0x00000FFFFFFFFFFF)
+
+#define SATP_MODE_OFF			_UL(0)
+#define SATP_MODE_SV32			_UL(1)
+#define SATP_MODE_SV39			_UL(8)
+#define SATP_MODE_SV48			_UL(9)
+#define SATP_MODE_SV57			_UL(10)
+#define SATP_MODE_SV64			_UL(11)
+
+#define HGATP_MODE_OFF			_UL(0)
+#define HGATP_MODE_SV32X4		_UL(1)
+#define HGATP_MODE_SV39X4		_UL(8)
+#define HGATP_MODE_SV48X4		_UL(9)
+
+#define HGATP32_MODE_SHIFT		31
+#define HGATP32_VMID_SHIFT		22
+#define HGATP32_VMID_MASK		_UL(0x1FC00000)
+#define HGATP32_PPN			_UL(0x003FFFFF)
+
+#define HGATP64_MODE_SHIFT		60
+#define HGATP64_VMID_SHIFT		44
+#define HGATP64_VMID_MASK		_ULL(0x03FFF00000000000)
+#define HGATP64_PPN			_ULL(0x00000FFFFFFFFFFF)
+
+#define PMP_R				_UL(0x01)
+#define PMP_W				_UL(0x02)
+#define PMP_X				_UL(0x04)
+#define PMP_A				_UL(0x18)
+#define PMP_A_TOR			_UL(0x08)
+#define PMP_A_NA4			_UL(0x10)
+#define PMP_A_NAPOT			_UL(0x18)
+#define PMP_L				_UL(0x80)
+
+#define PMP_SHIFT			2
+#define PMP_COUNT			64
+#if __riscv_xlen == 64
+#define PMP_ADDR_MASK			((_ULL(0x1) << 54) - 1)
+#else
+#define PMP_ADDR_MASK			_UL(0xFFFFFFFF)
+#endif
+
+#if __riscv_xlen == 64
+#define MSTATUS_SD			MSTATUS64_SD
+#define SSTATUS_SD			SSTATUS64_SD
+#define SATP_MODE			SATP64_MODE
+#define SATP_MODE_SHIFT			SATP64_MODE_SHIFT
+
+#define HGATP_PPN			HGATP64_PPN
+#define HGATP_VMID_SHIFT		HGATP64_VMID_SHIFT
+#define HGATP_VMID_MASK			HGATP64_VMID_MASK
+#define HGATP_MODE_SHIFT		HGATP64_MODE_SHIFT
+#else
+#define MSTATUS_SD			MSTATUS32_SD
+#define SSTATUS_SD			SSTATUS32_SD
+#define SATP_MODE			SATP32_MODE
+#define SATP_MODE_SHIFT			SATP32_MODE_SHIFT
+
+#define HGATP_PPN			HGATP32_PPN
+#define HGATP_VMID_SHIFT		HGATP32_VMID_SHIFT
+#define HGATP_VMID_MASK			HGATP32_VMID_MASK
+#define HGATP_MODE_SHIFT		HGATP32_MODE_SHIFT
+#endif
+
+#define TOPI_IID_SHIFT			16
+#define TOPI_IID_MASK			0xfff
+#define TOPI_IPRIO_MASK		0xff
+
+#if __riscv_xlen == 64
+#define MHPMEVENT_OF			(_UL(1) << 63)
+#define MHPMEVENT_MINH			(_UL(1) << 62)
+#define MHPMEVENT_SINH			(_UL(1) << 61)
+#define MHPMEVENT_UINH			(_UL(1) << 60)
+#define MHPMEVENT_VSINH			(_UL(1) << 59)
+#define MHPMEVENT_VUINH			(_UL(1) << 58)
+#else
+#define MHPMEVENTH_OF			(_ULL(1) << 31)
+#define MHPMEVENTH_MINH			(_ULL(1) << 30)
+#define MHPMEVENTH_SINH			(_ULL(1) << 29)
+#define MHPMEVENTH_UINH			(_ULL(1) << 28)
+#define MHPMEVENTH_VSINH		(_ULL(1) << 27)
+#define MHPMEVENTH_VUINH		(_ULL(1) << 26)
+
+#define MHPMEVENT_OF			(MHPMEVENTH_OF << 32)
+#define MHPMEVENT_MINH			(MHPMEVENTH_MINH << 32)
+#define MHPMEVENT_SINH			(MHPMEVENTH_SINH << 32)
+#define MHPMEVENT_UINH			(MHPMEVENTH_UINH << 32)
+#define MHPMEVENT_VSINH			(MHPMEVENTH_VSINH << 32)
+#define MHPMEVENT_VUINH			(MHPMEVENTH_VUINH << 32)
+
+#endif
+
+#define MHPMEVENT_SSCOF_MASK		_ULL(0xFFFF000000000000)
+
+#if __riscv_xlen > 32
+#define ENVCFG_STCE			(_ULL(1) << 63)
+#define ENVCFG_PBMTE			(_ULL(1) << 62)
+#else
+#define ENVCFGH_STCE			(_UL(1) << 31)
+#define ENVCFGH_PBMTE			(_UL(1) << 30)
+#endif
+#define ENVCFG_CBZE			(_UL(1) << 7)
+#define ENVCFG_CBCFE			(_UL(1) << 6)
+#define ENVCFG_CBIE_SHIFT		4
+#define ENVCFG_CBIE			(_UL(0x3) << ENVCFG_CBIE_SHIFT)
+#define ENVCFG_CBIE_ILL			_UL(0x0)
+#define ENVCFG_CBIE_FLUSH		_UL(0x1)
+#define ENVCFG_CBIE_INV			_UL(0x3)
+#define ENVCFG_FIOM			_UL(0x1)
+
+/* ===== User-level CSRs ===== */
+
+/* User Trap Setup (N-extension) */
+#define CSR_USTATUS			0x000
+#define CSR_UIE				0x004
+#define CSR_UTVEC			0x005
+
+/* User Trap Handling (N-extension) */
+#define CSR_USCRATCH			0x040
+#define CSR_UEPC			0x041
+#define CSR_UCAUSE			0x042
+#define CSR_UTVAL			0x043
+#define CSR_UIP				0x044
+
+/* User Floating-point CSRs */
+#define CSR_FFLAGS			0x001
+#define CSR_FRM				0x002
+#define CSR_FCSR			0x003
+
+/* User Counters/Timers */
+#define CSR_CYCLE			0xc00
+#define CSR_TIME			0xc01
+#define CSR_INSTRET			0xc02
+#define CSR_HPMCOUNTER3			0xc03
+#define CSR_HPMCOUNTER4			0xc04
+#define CSR_HPMCOUNTER5			0xc05
+#define CSR_HPMCOUNTER6			0xc06
+#define CSR_HPMCOUNTER7			0xc07
+#define CSR_HPMCOUNTER8			0xc08
+#define CSR_HPMCOUNTER9			0xc09
+#define CSR_HPMCOUNTER10		0xc0a
+#define CSR_HPMCOUNTER11		0xc0b
+#define CSR_HPMCOUNTER12		0xc0c
+#define CSR_HPMCOUNTER13		0xc0d
+#define CSR_HPMCOUNTER14		0xc0e
+#define CSR_HPMCOUNTER15		0xc0f
+#define CSR_HPMCOUNTER16		0xc10
+#define CSR_HPMCOUNTER17		0xc11
+#define CSR_HPMCOUNTER18		0xc12
+#define CSR_HPMCOUNTER19		0xc13
+#define CSR_HPMCOUNTER20		0xc14
+#define CSR_HPMCOUNTER21		0xc15
+#define CSR_HPMCOUNTER22		0xc16
+#define CSR_HPMCOUNTER23		0xc17
+#define CSR_HPMCOUNTER24		0xc18
+#define CSR_HPMCOUNTER25		0xc19
+#define CSR_HPMCOUNTER26		0xc1a
+#define CSR_HPMCOUNTER27		0xc1b
+#define CSR_HPMCOUNTER28		0xc1c
+#define CSR_HPMCOUNTER29		0xc1d
+#define CSR_HPMCOUNTER30		0xc1e
+#define CSR_HPMCOUNTER31		0xc1f
+#define CSR_CYCLEH			0xc80
+#define CSR_TIMEH			0xc81
+#define CSR_INSTRETH			0xc82
+#define CSR_HPMCOUNTER3H		0xc83
+#define CSR_HPMCOUNTER4H		0xc84
+#define CSR_HPMCOUNTER5H		0xc85
+#define CSR_HPMCOUNTER6H		0xc86
+#define CSR_HPMCOUNTER7H		0xc87
+#define CSR_HPMCOUNTER8H		0xc88
+#define CSR_HPMCOUNTER9H		0xc89
+#define CSR_HPMCOUNTER10H		0xc8a
+#define CSR_HPMCOUNTER11H		0xc8b
+#define CSR_HPMCOUNTER12H		0xc8c
+#define CSR_HPMCOUNTER13H		0xc8d
+#define CSR_HPMCOUNTER14H		0xc8e
+#define CSR_HPMCOUNTER15H		0xc8f
+#define CSR_HPMCOUNTER16H		0xc90
+#define CSR_HPMCOUNTER17H		0xc91
+#define CSR_HPMCOUNTER18H		0xc92
+#define CSR_HPMCOUNTER19H		0xc93
+#define CSR_HPMCOUNTER20H		0xc94
+#define CSR_HPMCOUNTER21H		0xc95
+#define CSR_HPMCOUNTER22H		0xc96
+#define CSR_HPMCOUNTER23H		0xc97
+#define CSR_HPMCOUNTER24H		0xc98
+#define CSR_HPMCOUNTER25H		0xc99
+#define CSR_HPMCOUNTER26H		0xc9a
+#define CSR_HPMCOUNTER27H		0xc9b
+#define CSR_HPMCOUNTER28H		0xc9c
+#define CSR_HPMCOUNTER29H		0xc9d
+#define CSR_HPMCOUNTER30H		0xc9e
+#define CSR_HPMCOUNTER31H		0xc9f
+
+/* ===== Supervisor-level CSRs ===== */
+
+/* Supervisor Trap Setup */
+#define CSR_SSTATUS			0x100
+#define CSR_SEDELEG			0x102
+#define CSR_SIDELEG			0x103
+#define CSR_SIE				0x104
+#define CSR_STVEC			0x105
+#define CSR_SCOUNTEREN			0x106
+
+/* Supervisor Configuration */
+#define CSR_SENVCFG			0x10a
+
+/* Supervisor Trap Handling */
+#define CSR_SSCRATCH			0x140
+#define CSR_SEPC			0x141
+#define CSR_SCAUSE			0x142
+#define CSR_STVAL			0x143
+#define CSR_SIP				0x144
+
+/* Supervisor Protection and Translation */
+#define CSR_SATP			0x180
+
+/* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
+#define CSR_SISELECT			0x150
+#define CSR_SIREG			0x151
+
+/* Supervisor-Level Interrupts (AIA) */
+#define CSR_STOPI			0xdb0
+
+/* Supervisor-Level IMSIC Interface (AIA) */
+#define CSR_SSETEIPNUM			0x158
+#define CSR_SCLREIPNUM			0x159
+#define CSR_SSETEIENUM			0x15a
+#define CSR_SCLREIENUM			0x15b
+#define CSR_STOPEI			0x15c
+
+/* Supervisor-Level High-Half CSRs (AIA) */
+#define CSR_SIEH			0x114
+#define CSR_SIPH			0x154
+
+/* Supervisor stateen CSRs */
+#define CSR_SSTATEEN0			0x10C
+#define CSR_SSTATEEN1			0x10D
+#define CSR_SSTATEEN2			0x10E
+#define CSR_SSTATEEN3			0x10F
+
+/* ===== Hypervisor-level CSRs ===== */
+
+/* Hypervisor Trap Setup (H-extension) */
+#define CSR_HSTATUS			0x600
+#define CSR_HEDELEG			0x602
+#define CSR_HIDELEG			0x603
+#define CSR_HIE				0x604
+#define CSR_HCOUNTEREN			0x606
+#define CSR_HGEIE			0x607
+
+/* Hypervisor Configuration */
+#define CSR_HENVCFG			0x60a
+#define CSR_HENVCFGH			0x61a
+
+/* Hypervisor Trap Handling (H-extension) */
+#define CSR_HTVAL			0x643
+#define CSR_HIP				0x644
+#define CSR_HVIP			0x645
+#define CSR_HTINST			0x64a
+#define CSR_HGEIP			0xe12
+
+/* Hypervisor Protection and Translation (H-extension) */
+#define CSR_HGATP			0x680
+
+/* Hypervisor Counter/Timer Virtualization Registers (H-extension) */
+#define CSR_HTIMEDELTA			0x605
+#define CSR_HTIMEDELTAH			0x615
+
+/* Virtual Supervisor Registers (H-extension) */
+#define CSR_VSSTATUS			0x200
+#define CSR_VSIE			0x204
+#define CSR_VSTVEC			0x205
+#define CSR_VSSCRATCH			0x240
+#define CSR_VSEPC			0x241
+#define CSR_VSCAUSE			0x242
+#define CSR_VSTVAL			0x243
+#define CSR_VSIP			0x244
+#define CSR_VSATP			0x280
+
+/* Virtual Interrupts and Interrupt Priorities (H-extension with AIA) */
+#define CSR_HVIEN			0x608
+#define CSR_HVICTL			0x609
+#define CSR_HVIPRIO1			0x646
+#define CSR_HVIPRIO2			0x647
+
+/* VS-Level Window to Indirectly Accessed Registers (H-extension with AIA) */
+#define CSR_VSISELECT			0x250
+#define CSR_VSIREG			0x251
+
+/* VS-Level Interrupts (H-extension with AIA) */
+#define CSR_VSTOPI			0xeb0
+
+/* VS-Level IMSIC Interface (H-extension with AIA) */
+#define CSR_VSSETEIPNUM		0x258
+#define CSR_VSCLREIPNUM		0x259
+#define CSR_VSSETEIENUM		0x25a
+#define CSR_VSCLREIENUM		0x25b
+#define CSR_VSTOPEI			0x25c
+
+/* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
+#define CSR_HIDELEGH			0x613
+#define CSR_HVIENH			0x618
+#define CSR_HVIPH			0x655
+#define CSR_HVIPRIO1H			0x656
+#define CSR_HVIPRIO2H			0x657
+#define CSR_VSIEH			0x214
+#define CSR_VSIPH			0x254
+
+/* Hypervisor stateen CSRs */
+#define CSR_HSTATEEN0			0x60C
+#define CSR_HSTATEEN0H			0x61C
+#define CSR_HSTATEEN1			0x60D
+#define CSR_HSTATEEN1H			0x61D
+#define CSR_HSTATEEN2			0x60E
+#define CSR_HSTATEEN2H			0x61E
+#define CSR_HSTATEEN3			0x60F
+#define CSR_HSTATEEN3H			0x61F
+
+/* ===== Machine-level CSRs ===== */
+
+/* Machine Information Registers */
+#define CSR_MVENDORID			0xf11
+#define CSR_MARCHID			0xf12
+#define CSR_MIMPID			0xf13
+#define CSR_MHARTID			0xf14
+
+/* Machine Trap Setup */
+#define CSR_MSTATUS			0x300
+#define CSR_MISA			0x301
+#define CSR_MEDELEG			0x302
+#define CSR_MIDELEG			0x303
+#define CSR_MIE				0x304
+#define CSR_MTVEC			0x305
+#define CSR_MCOUNTEREN			0x306
+#define CSR_MSTATUSH			0x310
+
+/* Machine Configuration */
+#define CSR_MENVCFG			0x30a
+#define CSR_MENVCFGH			0x31a
+
+/* Machine Trap Handling */
+#define CSR_MSCRATCH			0x340
+#define CSR_MEPC			0x341
+#define CSR_MCAUSE			0x342
+#define CSR_MTVAL			0x343
+#define CSR_MIP				0x344
+#define CSR_MTINST			0x34a
+#define CSR_MTVAL2			0x34b
+
+/* Machine Memory Protection */
+#define CSR_PMPCFG0			0x3a0
+#define CSR_PMPCFG1			0x3a1
+#define CSR_PMPCFG2			0x3a2
+#define CSR_PMPCFG3			0x3a3
+#define CSR_PMPCFG4			0x3a4
+#define CSR_PMPCFG5			0x3a5
+#define CSR_PMPCFG6			0x3a6
+#define CSR_PMPCFG7			0x3a7
+#define CSR_PMPCFG8			0x3a8
+#define CSR_PMPCFG9			0x3a9
+#define CSR_PMPCFG10			0x3aa
+#define CSR_PMPCFG11			0x3ab
+#define CSR_PMPCFG12			0x3ac
+#define CSR_PMPCFG13			0x3ad
+#define CSR_PMPCFG14			0x3ae
+#define CSR_PMPCFG15			0x3af
+#define CSR_PMPADDR0			0x3b0
+#define CSR_PMPADDR1			0x3b1
+#define CSR_PMPADDR2			0x3b2
+#define CSR_PMPADDR3			0x3b3
+#define CSR_PMPADDR4			0x3b4
+#define CSR_PMPADDR5			0x3b5
+#define CSR_PMPADDR6			0x3b6
+#define CSR_PMPADDR7			0x3b7
+#define CSR_PMPADDR8			0x3b8
+#define CSR_PMPADDR9			0x3b9
+#define CSR_PMPADDR10			0x3ba
+#define CSR_PMPADDR11			0x3bb
+#define CSR_PMPADDR12			0x3bc
+#define CSR_PMPADDR13			0x3bd
+#define CSR_PMPADDR14			0x3be
+#define CSR_PMPADDR15			0x3bf
+#define CSR_PMPADDR16			0x3c0
+#define CSR_PMPADDR17			0x3c1
+#define CSR_PMPADDR18			0x3c2
+#define CSR_PMPADDR19			0x3c3
+#define CSR_PMPADDR20			0x3c4
+#define CSR_PMPADDR21			0x3c5
+#define CSR_PMPADDR22			0x3c6
+#define CSR_PMPADDR23			0x3c7
+#define CSR_PMPADDR24			0x3c8
+#define CSR_PMPADDR25			0x3c9
+#define CSR_PMPADDR26			0x3ca
+#define CSR_PMPADDR27			0x3cb
+#define CSR_PMPADDR28			0x3cc
+#define CSR_PMPADDR29			0x3cd
+#define CSR_PMPADDR30			0x3ce
+#define CSR_PMPADDR31			0x3cf
+#define CSR_PMPADDR32			0x3d0
+#define CSR_PMPADDR33			0x3d1
+#define CSR_PMPADDR34			0x3d2
+#define CSR_PMPADDR35			0x3d3
+#define CSR_PMPADDR36			0x3d4
+#define CSR_PMPADDR37			0x3d5
+#define CSR_PMPADDR38			0x3d6
+#define CSR_PMPADDR39			0x3d7
+#define CSR_PMPADDR40			0x3d8
+#define CSR_PMPADDR41			0x3d9
+#define CSR_PMPADDR42			0x3da
+#define CSR_PMPADDR43			0x3db
+#define CSR_PMPADDR44			0x3dc
+#define CSR_PMPADDR45			0x3dd
+#define CSR_PMPADDR46			0x3de
+#define CSR_PMPADDR47			0x3df
+#define CSR_PMPADDR48			0x3e0
+#define CSR_PMPADDR49			0x3e1
+#define CSR_PMPADDR50			0x3e2
+#define CSR_PMPADDR51			0x3e3
+#define CSR_PMPADDR52			0x3e4
+#define CSR_PMPADDR53			0x3e5
+#define CSR_PMPADDR54			0x3e6
+#define CSR_PMPADDR55			0x3e7
+#define CSR_PMPADDR56			0x3e8
+#define CSR_PMPADDR57			0x3e9
+#define CSR_PMPADDR58			0x3ea
+#define CSR_PMPADDR59			0x3eb
+#define CSR_PMPADDR60			0x3ec
+#define CSR_PMPADDR61			0x3ed
+#define CSR_PMPADDR62			0x3ee
+#define CSR_PMPADDR63			0x3ef
+
+/* Machine Counters/Timers */
+#define CSR_MCYCLE			0xb00
+#define CSR_MINSTRET			0xb02
+#define CSR_MHPMCOUNTER3		0xb03
+#define CSR_MHPMCOUNTER4		0xb04
+#define CSR_MHPMCOUNTER5		0xb05
+#define CSR_MHPMCOUNTER6		0xb06
+#define CSR_MHPMCOUNTER7		0xb07
+#define CSR_MHPMCOUNTER8		0xb08
+#define CSR_MHPMCOUNTER9		0xb09
+#define CSR_MHPMCOUNTER10		0xb0a
+#define CSR_MHPMCOUNTER11		0xb0b
+#define CSR_MHPMCOUNTER12		0xb0c
+#define CSR_MHPMCOUNTER13		0xb0d
+#define CSR_MHPMCOUNTER14		0xb0e
+#define CSR_MHPMCOUNTER15		0xb0f
+#define CSR_MHPMCOUNTER16		0xb10
+#define CSR_MHPMCOUNTER17		0xb11
+#define CSR_MHPMCOUNTER18		0xb12
+#define CSR_MHPMCOUNTER19		0xb13
+#define CSR_MHPMCOUNTER20		0xb14
+#define CSR_MHPMCOUNTER21		0xb15
+#define CSR_MHPMCOUNTER22		0xb16
+#define CSR_MHPMCOUNTER23		0xb17
+#define CSR_MHPMCOUNTER24		0xb18
+#define CSR_MHPMCOUNTER25		0xb19
+#define CSR_MHPMCOUNTER26		0xb1a
+#define CSR_MHPMCOUNTER27		0xb1b
+#define CSR_MHPMCOUNTER28		0xb1c
+#define CSR_MHPMCOUNTER29		0xb1d
+#define CSR_MHPMCOUNTER30		0xb1e
+#define CSR_MHPMCOUNTER31		0xb1f
+#define CSR_MCYCLEH			0xb80
+#define CSR_MINSTRETH			0xb82
+#define CSR_MHPMCOUNTER3H		0xb83
+#define CSR_MHPMCOUNTER4H		0xb84
+#define CSR_MHPMCOUNTER5H		0xb85
+#define CSR_MHPMCOUNTER6H		0xb86
+#define CSR_MHPMCOUNTER7H		0xb87
+#define CSR_MHPMCOUNTER8H		0xb88
+#define CSR_MHPMCOUNTER9H		0xb89
+#define CSR_MHPMCOUNTER10H		0xb8a
+#define CSR_MHPMCOUNTER11H		0xb8b
+#define CSR_MHPMCOUNTER12H		0xb8c
+#define CSR_MHPMCOUNTER13H		0xb8d
+#define CSR_MHPMCOUNTER14H		0xb8e
+#define CSR_MHPMCOUNTER15H		0xb8f
+#define CSR_MHPMCOUNTER16H		0xb90
+#define CSR_MHPMCOUNTER17H		0xb91
+#define CSR_MHPMCOUNTER18H		0xb92
+#define CSR_MHPMCOUNTER19H		0xb93
+#define CSR_MHPMCOUNTER20H		0xb94
+#define CSR_MHPMCOUNTER21H		0xb95
+#define CSR_MHPMCOUNTER22H		0xb96
+#define CSR_MHPMCOUNTER23H		0xb97
+#define CSR_MHPMCOUNTER24H		0xb98
+#define CSR_MHPMCOUNTER25H		0xb99
+#define CSR_MHPMCOUNTER26H		0xb9a
+#define CSR_MHPMCOUNTER27H		0xb9b
+#define CSR_MHPMCOUNTER28H		0xb9c
+#define CSR_MHPMCOUNTER29H		0xb9d
+#define CSR_MHPMCOUNTER30H		0xb9e
+#define CSR_MHPMCOUNTER31H		0xb9f
+
+/* Machine Counter Setup */
+#define CSR_MCOUNTINHIBIT		0x320
+#define CSR_MHPMEVENT3			0x323
+#define CSR_MHPMEVENT4			0x324
+#define CSR_MHPMEVENT5			0x325
+#define CSR_MHPMEVENT6			0x326
+#define CSR_MHPMEVENT7			0x327
+#define CSR_MHPMEVENT8			0x328
+#define CSR_MHPMEVENT9			0x329
+#define CSR_MHPMEVENT10			0x32a
+#define CSR_MHPMEVENT11			0x32b
+#define CSR_MHPMEVENT12			0x32c
+#define CSR_MHPMEVENT13			0x32d
+#define CSR_MHPMEVENT14			0x32e
+#define CSR_MHPMEVENT15			0x32f
+#define CSR_MHPMEVENT16			0x330
+#define CSR_MHPMEVENT17			0x331
+#define CSR_MHPMEVENT18			0x332
+#define CSR_MHPMEVENT19			0x333
+#define CSR_MHPMEVENT20			0x334
+#define CSR_MHPMEVENT21			0x335
+#define CSR_MHPMEVENT22			0x336
+#define CSR_MHPMEVENT23			0x337
+#define CSR_MHPMEVENT24			0x338
+#define CSR_MHPMEVENT25			0x339
+#define CSR_MHPMEVENT26			0x33a
+#define CSR_MHPMEVENT27			0x33b
+#define CSR_MHPMEVENT28			0x33c
+#define CSR_MHPMEVENT29			0x33d
+#define CSR_MHPMEVENT30			0x33e
+#define CSR_MHPMEVENT31			0x33f
+
+/* For RV32 */
+#define CSR_MHPMEVENT3H			0x723
+#define CSR_MHPMEVENT4H			0x724
+#define CSR_MHPMEVENT5H			0x725
+#define CSR_MHPMEVENT6H			0x726
+#define CSR_MHPMEVENT7H			0x727
+#define CSR_MHPMEVENT8H			0x728
+#define CSR_MHPMEVENT9H			0x729
+#define CSR_MHPMEVENT10H		0x72a
+#define CSR_MHPMEVENT11H		0x72b
+#define CSR_MHPMEVENT12H		0x72c
+#define CSR_MHPMEVENT13H		0x72d
+#define CSR_MHPMEVENT14H		0x72e
+#define CSR_MHPMEVENT15H		0x72f
+#define CSR_MHPMEVENT16H		0x730
+#define CSR_MHPMEVENT17H		0x731
+#define CSR_MHPMEVENT18H		0x732
+#define CSR_MHPMEVENT19H		0x733
+#define CSR_MHPMEVENT20H		0x734
+#define CSR_MHPMEVENT21H		0x735
+#define CSR_MHPMEVENT22H		0x736
+#define CSR_MHPMEVENT23H		0x737
+#define CSR_MHPMEVENT24H		0x738
+#define CSR_MHPMEVENT25H		0x739
+#define CSR_MHPMEVENT26H		0x73a
+#define CSR_MHPMEVENT27H		0x73b
+#define CSR_MHPMEVENT28H		0x73c
+#define CSR_MHPMEVENT29H		0x73d
+#define CSR_MHPMEVENT30H		0x73e
+#define CSR_MHPMEVENT31H		0x73f
+
+/* Counter Overflow CSR */
+#define CSR_SCOUNTOVF			0xda0
+
+/* Debug/Trace Registers */
+#define CSR_TSELECT			0x7a0
+#define CSR_TDATA1			0x7a1
+#define CSR_TDATA2			0x7a2
+#define CSR_TDATA3			0x7a3
+
+/* Debug Mode Registers */
+#define CSR_DCSR			0x7b0
+#define CSR_DPC				0x7b1
+#define CSR_DSCRATCH0			0x7b2
+#define CSR_DSCRATCH1			0x7b3
+
+/* Machine-Level Window to Indirectly Accessed Registers (AIA) */
+#define CSR_MISELECT			0x350
+#define CSR_MIREG			0x351
+
+/* Machine-Level Interrupts (AIA) */
+#define CSR_MTOPI			0xfb0
+
+/* Machine-Level IMSIC Interface (AIA) */
+#define CSR_MSETEIPNUM			0x358
+#define CSR_MCLREIPNUM			0x359
+#define CSR_MSETEIENUM			0x35a
+#define CSR_MCLREIENUM			0x35b
+#define CSR_MTOPEI			0x35c
+
+/* Virtual Interrupts for Supervisor Level (AIA) */
+#define CSR_MVIEN			0x308
+#define CSR_MVIP			0x309
+
+/* Smstateen extension registers */
+/* Machine stateen CSRs */
+#define CSR_MSTATEEN0			0x30C
+#define CSR_MSTATEEN0H			0x31C
+#define CSR_MSTATEEN1			0x30D
+#define CSR_MSTATEEN1H			0x31D
+#define CSR_MSTATEEN2			0x30E
+#define CSR_MSTATEEN2H			0x31E
+#define CSR_MSTATEEN3			0x30F
+#define CSR_MSTATEEN3H			0x31F
+
+/* Machine-Level High-Half CSRs (AIA) */
+#define CSR_MIDELEGH			0x313
+#define CSR_MIEH			0x314
+#define CSR_MVIENH			0x318
+#define CSR_MVIPH			0x319
+#define CSR_MIPH			0x354
+
+/* ===== Trap/Exception Causes ===== */
+
+/* Exception cause high bit - is an interrupt if set */
+#define CAUSE_IRQ_FLAG			(_UL(1) << (__riscv_xlen - 1))
+
+#define CAUSE_MISALIGNED_FETCH		0x0
+#define CAUSE_FETCH_ACCESS		0x1
+#define CAUSE_ILLEGAL_INSTRUCTION	0x2
+#define CAUSE_BREAKPOINT		0x3
+#define CAUSE_MISALIGNED_LOAD		0x4
+#define CAUSE_LOAD_ACCESS		0x5
+#define CAUSE_MISALIGNED_STORE		0x6
+#define CAUSE_STORE_ACCESS		0x7
+#define CAUSE_USER_ECALL		0x8
+#define CAUSE_SUPERVISOR_ECALL		0x9
+#define CAUSE_VIRTUAL_SUPERVISOR_ECALL	0xa
+#define CAUSE_MACHINE_ECALL		0xb
+#define CAUSE_FETCH_PAGE_FAULT		0xc
+#define CAUSE_LOAD_PAGE_FAULT		0xd
+#define CAUSE_STORE_PAGE_FAULT		0xf
+#define CAUSE_FETCH_GUEST_PAGE_FAULT	0x14
+#define CAUSE_LOAD_GUEST_PAGE_FAULT	0x15
+#define CAUSE_VIRTUAL_INST_FAULT	0x16
+#define CAUSE_STORE_GUEST_PAGE_FAULT	0x17
+
+/* Common defines for all smstateen */
+#define SMSTATEEN_MAX_COUNT		4
+#define SMSTATEEN0_CS_SHIFT		0
+#define SMSTATEEN0_CS			(_ULL(1) << SMSTATEEN0_CS_SHIFT)
+#define SMSTATEEN0_FCSR_SHIFT		1
+#define SMSTATEEN0_FCSR			(_ULL(1) << SMSTATEEN0_FCSR_SHIFT)
+#define SMSTATEEN0_IMSIC_SHIFT		58
+#define SMSTATEEN0_IMSIC		(_ULL(1) << SMSTATEEN0_IMSIC_SHIFT)
+#define SMSTATEEN0_AIA_SHIFT		59
+#define SMSTATEEN0_AIA			(_ULL(1) << SMSTATEEN0_AIA_SHIFT)
+#define SMSTATEEN0_SVSLCT_SHIFT		60
+#define SMSTATEEN0_SVSLCT		(_ULL(1) << SMSTATEEN0_SVSLCT_SHIFT)
+#define SMSTATEEN0_HSENVCFG_SHIFT	62
+#define SMSTATEEN0_HSENVCFG		(_ULL(1) << SMSTATEEN0_HSENVCFG_SHIFT)
+#define SMSTATEEN_STATEN_SHIFT		63
+#define SMSTATEEN_STATEN		(_ULL(1) << SMSTATEEN_STATEN_SHIFT)
+
+/* ===== Instruction Encodings ===== */
+
+#define INSN_MATCH_LB			0x3
+#define INSN_MASK_LB			0x707f
+#define INSN_MATCH_LH			0x1003
+#define INSN_MASK_LH			0x707f
+#define INSN_MATCH_LW			0x2003
+#define INSN_MASK_LW			0x707f
+#define INSN_MATCH_LD			0x3003
+#define INSN_MASK_LD			0x707f
+#define INSN_MATCH_LBU			0x4003
+#define INSN_MASK_LBU			0x707f
+#define INSN_MATCH_LHU			0x5003
+#define INSN_MASK_LHU			0x707f
+#define INSN_MATCH_LWU			0x6003
+#define INSN_MASK_LWU			0x707f
+#define INSN_MATCH_SB			0x23
+#define INSN_MASK_SB			0x707f
+#define INSN_MATCH_SH			0x1023
+#define INSN_MASK_SH			0x707f
+#define INSN_MATCH_SW			0x2023
+#define INSN_MASK_SW			0x707f
+#define INSN_MATCH_SD			0x3023
+#define INSN_MASK_SD			0x707f
+
+#define INSN_MATCH_FLW			0x2007
+#define INSN_MASK_FLW			0x707f
+#define INSN_MATCH_FLD			0x3007
+#define INSN_MASK_FLD			0x707f
+#define INSN_MATCH_FLQ			0x4007
+#define INSN_MASK_FLQ			0x707f
+#define INSN_MATCH_FSW			0x2027
+#define INSN_MASK_FSW			0x707f
+#define INSN_MATCH_FSD			0x3027
+#define INSN_MASK_FSD			0x707f
+#define INSN_MATCH_FSQ			0x4027
+#define INSN_MASK_FSQ			0x707f
+
+#define INSN_MATCH_C_LD			0x6000
+#define INSN_MASK_C_LD			0xe003
+#define INSN_MATCH_C_SD			0xe000
+#define INSN_MASK_C_SD			0xe003
+#define INSN_MATCH_C_LW			0x4000
+#define INSN_MASK_C_LW			0xe003
+#define INSN_MATCH_C_SW			0xc000
+#define INSN_MASK_C_SW			0xe003
+#define INSN_MATCH_C_LDSP		0x6002
+#define INSN_MASK_C_LDSP		0xe003
+#define INSN_MATCH_C_SDSP		0xe002
+#define INSN_MASK_C_SDSP		0xe003
+#define INSN_MATCH_C_LWSP		0x4002
+#define INSN_MASK_C_LWSP		0xe003
+#define INSN_MATCH_C_SWSP		0xc002
+#define INSN_MASK_C_SWSP		0xe003
+
+#define INSN_MATCH_C_FLD		0x2000
+#define INSN_MASK_C_FLD			0xe003
+#define INSN_MATCH_C_FLW		0x6000
+#define INSN_MASK_C_FLW			0xe003
+#define INSN_MATCH_C_FSD		0xa000
+#define INSN_MASK_C_FSD			0xe003
+#define INSN_MATCH_C_FSW		0xe000
+#define INSN_MASK_C_FSW			0xe003
+#define INSN_MATCH_C_FLDSP		0x2002
+#define INSN_MASK_C_FLDSP		0xe003
+#define INSN_MATCH_C_FSDSP		0xa002
+#define INSN_MASK_C_FSDSP		0xe003
+#define INSN_MATCH_C_FLWSP		0x6002
+#define INSN_MASK_C_FLWSP		0xe003
+#define INSN_MATCH_C_FSWSP		0xe002
+#define INSN_MASK_C_FSWSP		0xe003
+
+#define INSN_MASK_WFI			0xffffff00
+#define INSN_MATCH_WFI			0x10500000
+
+#define INSN_16BIT_MASK			0x3
+#define INSN_32BIT_MASK			0x1c
+
+#define INSN_IS_16BIT(insn)		\
+	(((insn) & INSN_16BIT_MASK) != INSN_16BIT_MASK)
+#define INSN_IS_32BIT(insn)		\
+	(((insn) & INSN_16BIT_MASK) == INSN_16BIT_MASK && \
+	 ((insn) & INSN_32BIT_MASK) != INSN_32BIT_MASK)
+
+#define INSN_LEN(insn)			(INSN_IS_16BIT(insn) ? 2 : 4)
+
+#if __riscv_xlen == 64
+#define LOG_REGBYTES			3
+#else
+#define LOG_REGBYTES			2
+#endif
+#define REGBYTES			(1 << LOG_REGBYTES)
+
+#define SH_RD				7
+#define SH_RS1				15
+#define SH_RS2				20
+#define SH_RS2C				2
+
+#define RV_X(x, s, n)			(((x) >> (s)) & ((1 << (n)) - 1))
+#define RVC_LW_IMM(x)			((RV_X(x, 6, 1) << 2) | \
+					 (RV_X(x, 10, 3) << 3) | \
+					 (RV_X(x, 5, 1) << 6))
+#define RVC_LD_IMM(x)			((RV_X(x, 10, 3) << 3) | \
+					 (RV_X(x, 5, 2) << 6))
+#define RVC_LWSP_IMM(x)			((RV_X(x, 4, 3) << 2) | \
+					 (RV_X(x, 12, 1) << 5) | \
+					 (RV_X(x, 2, 2) << 6))
+#define RVC_LDSP_IMM(x)			((RV_X(x, 5, 2) << 3) | \
+					 (RV_X(x, 12, 1) << 5) | \
+					 (RV_X(x, 2, 3) << 6))
+#define RVC_SWSP_IMM(x)			((RV_X(x, 9, 4) << 2) | \
+					 (RV_X(x, 7, 2) << 6))
+#define RVC_SDSP_IMM(x)			((RV_X(x, 10, 3) << 3) | \
+					 (RV_X(x, 7, 3) << 6))
+#define RVC_RS1S(insn)			(8 + RV_X(insn, SH_RD, 3))
+#define RVC_RS2S(insn)			(8 + RV_X(insn, SH_RS2C, 3))
+#define RVC_RS2(insn)			RV_X(insn, SH_RS2C, 5)
+
+#define SHIFT_RIGHT(x, y)		\
+	((y) < 0 ? ((x) << -(y)) : ((x) >> (y)))
+
+#define REG_MASK			\
+	((1 << (5 + LOG_REGBYTES)) - (1 << LOG_REGBYTES))
+
+#define REG_OFFSET(insn, pos)		\
+	(SHIFT_RIGHT((insn), (pos) - LOG_REGBYTES) & REG_MASK)
+
+#define REG_PTR(insn, pos, regs)	\
+	(unsigned long *)((unsigned long)(regs) + REG_OFFSET(insn, pos))
+
+#define GET_RM(insn)			(((insn) >> 12) & 7)
+
+#define GET_RS1(insn, regs)		(*REG_PTR(insn, SH_RS1, regs))
+#define GET_RS2(insn, regs)		(*REG_PTR(insn, SH_RS2, regs))
+#define GET_RS1S(insn, regs)		(*REG_PTR(RVC_RS1S(insn), 0, regs))
+#define GET_RS2S(insn, regs)		(*REG_PTR(RVC_RS2S(insn), 0, regs))
+#define GET_RS2C(insn, regs)		(*REG_PTR(insn, SH_RS2C, regs))
+#define GET_SP(regs)			(*REG_PTR(2, 0, regs))
+#define SET_RD(insn, regs, val)		(*REG_PTR(insn, SH_RD, regs) = (val))
+#define IMM_I(insn)			((s32)(insn) >> 20)
+#define IMM_S(insn)			(((s32)(insn) >> 25 << 5) | \
+					 (s32)(((insn) >> 7) & 0x1f))
+#define MASK_FUNCT3			0x7000
+
+/* clang-format on */
+
+#endif
diff --git a/xen/arch/riscv/include/asm/setup.h b/xen/arch/riscv/include/asm/setup.h
new file mode 100644
index 0000000000..682ed84aad
--- /dev/null
+++ b/xen/arch/riscv/include/asm/setup.h
@@ -0,0 +1,23 @@
+#ifndef __RISCV_SETUP_H_
+#define __RISCV_SETUP_H_
+
+#include <public/version.h>
+
+extern domid_t max_init_domid;
+
+#define NR_VCPUS 2
+
+/* Devices */
+#define PLIC_BASE  0xc000000
+#define PLIC_SIZE  0x0210000
+#define PLIC_END (PLIC_BASE + PLIC_SIZE)
+
+#endif /* __RISCV_SETUP_H_ */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/include/asm/smp.h b/xen/arch/riscv/include/asm/smp.h
new file mode 100644
index 0000000000..dc6feda76d
--- /dev/null
+++ b/xen/arch/riscv/include/asm/smp.h
@@ -0,0 +1,69 @@
+/******************************************************************************
+ *
+ * Copyright 2019 (C) Alistair Francis <alistair.francis@wdc.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ */
+
+#ifndef _ASM_RISCV_SMP_H
+#define _ASM_RISCV_SMP_H
+
+#ifndef __ASSEMBLY__
+#include <xen/cpumask.h>
+#include <asm/current.h>
+#endif
+
+DECLARE_PER_CPU(cpumask_var_t, cpu_sibling_mask);
+DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
+
+#define HARTID_INVALID		-1
+
+/*
+ * Do we, for platform reasons, need to actually keep CPUs online when we
+ * would otherwise prefer them to be off?
+ */
+#define park_offline_cpus true
+
+#define cpu_is_offline(cpu) unlikely(!cpu_online(cpu))
+
+static inline unsigned int __raw_smp_processor_id(void)
+{
+    unsigned long id;
+
+    id = get_processor_id();
+
+    /*
+     * Technically the hartid can be greater than what a uint can hold.
+     * If such a system were to exist, we will need to change
+     * the raw_smp_processor_id() API to be unsigned long instead of
+     * unsigned int.
+     */
+    BUG_ON(id > UINT_MAX);
+
+    return (unsigned int)id;
+}
+
+#define raw_smp_processor_id() (__raw_smp_processor_id())
+#define smp_processor_id() (__raw_smp_processor_id())
+
+void smp_clear_cpu_maps (void);
+int smp_get_max_cpus(void);
+
+#endif /* _ASM_RISCV_SMP_H */
diff --git a/xen/arch/riscv/include/asm/softirq.h b/xen/arch/riscv/include/asm/softirq.h
new file mode 100644
index 0000000000..976e0ebd70
--- /dev/null
+++ b/xen/arch/riscv/include/asm/softirq.h
@@ -0,0 +1,16 @@
+#ifndef __ASM_SOFTIRQ_H__
+#define __ASM_SOFTIRQ_H__
+
+#define NR_ARCH_SOFTIRQS       0
+
+#define arch_skip_send_event_check(cpu) 0
+
+#endif /* __ASM_SOFTIRQ_H__ */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/include/asm/spinlock.h b/xen/arch/riscv/include/asm/spinlock.h
new file mode 100644
index 0000000000..2f47b4d9ad
--- /dev/null
+++ b/xen/arch/riscv/include/asm/spinlock.h
@@ -0,0 +1,13 @@
+#ifndef __ASM_SPINLOCK_H
+#define __ASM_SPINLOCK_H
+
+#define arch_lock_acquire_barrier() smp_mb()
+#define arch_lock_release_barrier() smp_mb()
+
+#define arch_lock_relax() cpu_relax()
+#define arch_lock_signal() do { \
+} while(0)
+
+#define arch_lock_signal_wmb()  arch_lock_signal()
+
+#endif /* __ASM_SPINLOCK_H */
diff --git a/xen/arch/riscv/include/asm/string.h b/xen/arch/riscv/include/asm/string.h
new file mode 100644
index 0000000000..733e9e00d3
--- /dev/null
+++ b/xen/arch/riscv/include/asm/string.h
@@ -0,0 +1,28 @@
+/******************************************************************************
+ *
+ * Copyright 2019 (C) Alistair Francis <alistair.francis@wdc.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ */
+
+#ifndef _ASM_RISCV_STRING_H
+#define _ASM_RISCV_STRING_H
+
+#endif /* _ASM_RISCV_STRING_H */
diff --git a/xen/arch/riscv/include/asm/system.h b/xen/arch/riscv/include/asm/system.h
new file mode 100644
index 0000000000..434de6d512
--- /dev/null
+++ b/xen/arch/riscv/include/asm/system.h
@@ -0,0 +1,98 @@
+/*
+ * Based on arch/arm/include/asm/system.h
+ *
+ * Copyright (C) 2012 ARM Ltd.
+ * Copyright (C) 2013 Regents of the University of California
+ * Copyright (C) 2017 SiFive
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef _ASM_RISCV_BARRIER_H
+#define _ASM_RISCV_BARRIER_H
+
+#include <asm/csr.h>
+#include <xen/lib.h>
+
+#ifndef __ASSEMBLY__
+
+#define nop()		__asm__ __volatile__ ("nop")
+
+#define RISCV_FENCE(p, s) \
+	__asm__ __volatile__ ("fence " #p "," #s : : : "memory")
+
+/* These barriers need to enforce ordering on both devices or memory. */
+#define mb()		RISCV_FENCE(iorw,iorw)
+#define rmb()		RISCV_FENCE(ir,ir)
+#define wmb()		RISCV_FENCE(ow,ow)
+
+/* These barriers do not need to enforce ordering on devices, just memory. */
+#define smp_mb()	RISCV_FENCE(rw,rw)
+#define smp_rmb()	RISCV_FENCE(r,r)
+#define smp_wmb()	RISCV_FENCE(w,w)
+#define smp_mb__before_atomic()    smp_mb()
+#define smp_mb__after_atomic()     smp_mb()
+
+#define __smp_store_release(p, v)					\
+do {									\
+	compiletime_assert_atomic_type(*p);				\
+	RISCV_FENCE(rw,w);						\
+	WRITE_ONCE(*p, v);						\
+} while (0)
+
+#define __smp_load_acquire(p)						\
+({									\
+	typeof(*p) ___p1 = READ_ONCE(*p);				\
+	compiletime_assert_atomic_type(*p);				\
+	RISCV_FENCE(r,rw);						\
+	___p1;								\
+})
+
+static inline unsigned long local_save_flags(void)
+{
+	return csr_read(sstatus);
+}
+
+static inline void local_irq_enable(void)
+{
+	csr_set(sstatus, SSTATUS_SIE);
+}
+
+static inline void local_irq_disable(void)
+{
+	csr_clear(sstatus, SSTATUS_SIE);
+}
+
+#define local_irq_save(x)                     \
+({                                            \
+    x = csr_read_clear(CSR_SSTATUS, SSTATUS_SIE);      \
+    local_irq_disable();                      \
+})
+
+static inline void local_irq_restore(unsigned long flags)
+{
+	csr_set(CSR_SSTATUS, flags & SSTATUS_SIE);
+}
+
+static inline int local_irq_is_enabled(void)
+{
+    unsigned long flags = local_save_flags();
+
+    return flags & SSTATUS_SIE;
+}
+
+#define arch_fetch_and_add(x, v) __sync_fetch_and_add(x, v)
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* _ASM_RISCV_BARRIER_H */
diff --git a/xen/arch/riscv/include/asm/time.h b/xen/arch/riscv/include/asm/time.h
new file mode 100644
index 0000000000..3fc1b891b5
--- /dev/null
+++ b/xen/arch/riscv/include/asm/time.h
@@ -0,0 +1,81 @@
+ /*
+ * Copyright (C) 2012 Regents of the University of California
+ *
+ *   This program is free software; you can redistribute it and/or
+ *   modify it under the terms of the GNU General Public License
+ *   as published by the Free Software Foundation, version 2.
+ *
+ *   This program is distributed in the hope that it will be useful,
+ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *   GNU General Public License for more details.
+ */
+
+#ifndef _ASM_RISCV_TIMEX_H
+#define _ASM_RISCV_TIMEX_H
+
+#include <asm/processor.h>
+#include <xen/lib.h>
+
+typedef unsigned long cycles_t;
+
+static inline s_time_t ticks_to_ns(uint64_t ticks)
+{
+    return muldiv64(ticks, SECONDS(1), 1000 * cpu_khz);
+}
+
+static inline uint64_t ns_to_ticks(s_time_t ns)
+{
+    return muldiv64(ns, 1000 * cpu_khz, SECONDS(1));
+}
+
+static inline cycles_t get_cycles_inline(void)
+{
+	cycles_t n;
+
+	__asm__ __volatile__ (
+		"rdtime %0"
+		: "=r" (n));
+	return n;
+}
+#define get_cycles get_cycles_inline
+
+#ifdef CONFIG_64BIT
+static inline uint64_t get_cycles64(void)
+{
+        return get_cycles();
+}
+#else
+static inline uint64_t get_cycles64(void)
+{
+	u32 lo, hi, tmp;
+	__asm__ __volatile__ (
+		"1:\n"
+		"rdtimeh %0\n"
+		"rdtime %1\n"
+		"rdtimeh %2\n"
+		"bne %0, %2, 1b"
+		: "=&r" (hi), "=&r" (lo), "=&r" (tmp));
+	return ((u64)hi << 32) | lo;
+}
+#endif
+
+#define ARCH_HAS_READ_CURRENT_TIMER
+
+static inline int read_current_timer(unsigned long *timer_val)
+{
+	*timer_val = get_cycles();
+	return 0;
+}
+
+extern void preinit_xen_time(void);
+
+extern void init_timer_interrupt(void);
+
+extern void timer_interrupt(unsigned long cause, struct cpu_user_regs *regs);
+
+extern void force_update_vcpu_system_time(struct vcpu *v);
+
+extern uint64_t boot_count;
+
+#endif /* _ASM_RISCV_TIMEX_H */
diff --git a/xen/arch/riscv/include/asm/trace.h b/xen/arch/riscv/include/asm/trace.h
new file mode 100644
index 0000000000..e06def61f6
--- /dev/null
+++ b/xen/arch/riscv/include/asm/trace.h
@@ -0,0 +1,12 @@
+#ifndef __ASM_TRACE_H__
+#define __ASM_TRACE_H__
+
+#endif /* __ASM_TRACE_H__ */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/include/asm/traps.h b/xen/arch/riscv/include/asm/traps.h
new file mode 100644
index 0000000000..1db96a8e3b
--- /dev/null
+++ b/xen/arch/riscv/include/asm/traps.h
@@ -0,0 +1,30 @@
+#ifndef __ASM_TRAPS_H__
+#define __ASM_TRAPS_H__
+
+#ifndef __ASSEMBLY__
+
+void __handle_exception(void);
+void handle_exception(void);
+
+struct riscv_trap {
+    unsigned long sepc;
+    unsigned long scause;
+    unsigned long stval;
+    unsigned long htval;
+    unsigned long htinst;
+};
+
+#endif /* __ASSEMBLY__ */
+
+#define RISCV_TRAP_sepc     0
+#define RISCV_TRAP_scause   1
+#define RISCV_TRAP_stval    2
+#define RISCV_TRAP_htval    3
+#define RISCV_TRAP_htinst   4
+#define RISCV_TRAP_last     5
+#define RISCV_TRAP_OFFSET(x)	((RISCV_TRAP_##x) * __SIZEOF_POINTER__)
+#define RISCV_TRAP_SIZE		    RISCV_TRAP_OFFSET(last)
+
+
+#endif /* __ASM_TRAPS_H__ */
+
diff --git a/xen/arch/riscv/include/asm/types.h b/xen/arch/riscv/include/asm/types.h
new file mode 100644
index 0000000000..48f27f97ba
--- /dev/null
+++ b/xen/arch/riscv/include/asm/types.h
@@ -0,0 +1,73 @@
+#ifndef __RISCV_TYPES_H__
+#define __RISCV_TYPES_H__
+
+#ifndef __ASSEMBLY__
+
+typedef __signed__ char __s8;
+typedef unsigned char __u8;
+
+typedef __signed__ short __s16;
+typedef unsigned short __u16;
+
+typedef __signed__ int __s32;
+typedef unsigned int __u32;
+
+#if defined(__GNUC__) && !defined(__STRICT_ANSI__)
+#if defined(CONFIG_RISCV_32)
+typedef __signed__ long long __s64;
+typedef unsigned long long __u64;
+#elif defined (CONFIG_RISCV_64)
+typedef __signed__ long __s64;
+typedef unsigned long __u64;
+#endif
+#endif
+
+typedef signed char s8;
+typedef unsigned char u8;
+
+typedef signed short s16;
+typedef unsigned short u16;
+
+typedef signed int s32;
+typedef unsigned int u32;
+
+#if defined(CONFIG_RISCV_32)
+typedef signed long long s64;
+typedef unsigned long long u64;
+typedef u32 vaddr_t;
+#define PRIvaddr PRIx32
+typedef u64 paddr_t;
+#define INVALID_PADDR (~0ULL)
+#define PRIpaddr "016llx"
+typedef u32 register_t;
+#define PRIregister "x"
+#elif defined (CONFIG_RISCV_64)
+typedef signed long s64;
+typedef unsigned long u64;
+typedef u64 vaddr_t;
+#define PRIvaddr PRIx64
+typedef u64 paddr_t;
+#define INVALID_PADDR (~0UL)
+#define PRIpaddr "016lx"
+typedef u64 register_t;
+#define PRIregister "lx"
+#endif
+
+#if defined(__SIZE_TYPE__)
+typedef __SIZE_TYPE__ size_t;
+#else
+typedef unsigned long size_t;
+#endif
+typedef signed long ssize_t;
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* __RISCV_TYPES_H__ */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/include/asm/vm_event.h b/xen/arch/riscv/include/asm/vm_event.h
new file mode 100644
index 0000000000..be9ef3bb8d
--- /dev/null
+++ b/xen/arch/riscv/include/asm/vm_event.h
@@ -0,0 +1,63 @@
+/*
+ * vm_event.h: architecture specific vm_event handling routines
+ *
+ * Copyright (c) 2015 Tamas K Lengyel (tamas@tklengyel.com)
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef __ASM_RISCV_VM_EVENT_H__
+#define __ASM_RISCV_VM_EVENT_H__
+
+#include <xen/sched.h>
+#include <xen/vm_event.h>
+#include <public/domctl.h>
+
+static inline int vm_event_init_domain(struct domain *d)
+{
+    /* Nothing to do. */
+    return 0;
+}
+
+static inline void vm_event_cleanup_domain(struct domain *d)
+{
+    memset(&d->monitor, 0, sizeof(d->monitor));
+}
+
+static inline void vm_event_toggle_singlestep(struct domain *d, struct vcpu *v,
+                                              vm_event_response_t *rsp)
+{
+    /* Not supported on RISCV. */
+}
+
+static inline
+void vm_event_register_write_resume(struct vcpu *v, vm_event_response_t *rsp)
+{
+    /* Not supported on RISCV. */
+}
+
+static inline
+void vm_event_emulate_check(struct vcpu *v, vm_event_response_t *rsp)
+{
+    /* Not supported on RISCV. */
+}
+
+static inline
+void vm_event_sync_event(struct vcpu *v, bool value)
+{
+    /* Not supported on RISCV. */
+}
+
+void vm_event_reset_vmtrace(struct vcpu *v);
+
+#endif /* __ASM_RISCV_VM_EVENT_H__ */
diff --git a/xen/arch/riscv/include/asm/xenoprof.h b/xen/arch/riscv/include/asm/xenoprof.h
new file mode 100644
index 0000000000..3db6ce3ab2
--- /dev/null
+++ b/xen/arch/riscv/include/asm/xenoprof.h
@@ -0,0 +1,12 @@
+#ifndef __ASM_XENOPROF_H__
+#define __ASM_XENOPROF_H__
+
+#endif /* __ASM_XENOPROF_H__ */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/irq.c b/xen/arch/riscv/irq.c
new file mode 100644
index 0000000000..66aecdec25
--- /dev/null
+++ b/xen/arch/riscv/irq.c
@@ -0,0 +1,126 @@
+/*
+ * RISC-V Interrupt support
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <xen/lib.h>
+#include <xen/errno.h>
+#include <xen/sched.h>
+#include <xen/device_tree.h>
+
+const unsigned int nr_irqs = NR_IRQS;
+
+/* Describe an IRQ assigned to a guest */
+struct irq_guest
+{
+    struct domain *d;
+    unsigned int virq;
+};
+
+static void ack_none(struct irq_desc *irq)
+{
+    /* TODO */
+    BUG();
+}
+
+static void end_none(struct irq_desc *irq)
+{
+    /* TODO */
+    BUG();
+}
+
+hw_irq_controller no_irq_type = {
+    .typename = "none",
+    .startup = irq_startup_none,
+    .shutdown = irq_shutdown_none,
+    .enable = irq_enable_none,
+    .disable = irq_disable_none,
+    .ack = ack_none,
+    .end = end_none
+};
+
+int arch_init_one_irq_desc(struct irq_desc *desc)
+{
+    /* TODO */
+    BUG();
+    return 0;
+}
+
+struct pirq *alloc_pirq_struct(struct domain *d)
+{
+	/* TODO */
+    BUG();
+    return NULL;
+}
+
+irq_desc_t *__irq_to_desc(int irq)
+{
+    /* TODO */
+    BUG();
+    return 0;
+}
+
+int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
+{
+    BUG();
+}
+
+void pirq_guest_unbind(struct domain *d, struct pirq *pirq)
+{
+
+    BUG();
+}
+
+void pirq_set_affinity(struct domain *d, int pirq, const cpumask_t *mask)
+{
+    BUG();
+}
+
+void smp_send_state_dump(unsigned int cpu)
+{
+    /* TODO */
+}
+
+void arch_move_irqs(struct vcpu *v)
+{
+    /* TODO */
+}
+
+int setup_irq(unsigned int irq, unsigned int irqflags, struct irqaction *new)
+{
+    /* TODO */
+    BUG();
+    return -ENOSYS;;
+}
+
+int platform_get_irq(const struct dt_device_node *device, int index)
+{
+    struct dt_irq dt_irq;
+    unsigned int irq;
+
+    if ( dt_device_get_irq(device, index, &dt_irq) )
+        return -1;
+
+    irq = dt_irq.irq;
+
+    return irq;
+}
+
+int irq_set_spi_type(unsigned int spi, unsigned int type)
+{
+    return 0;
+}
+
+int irq_set_type(unsigned int irq, unsigned int type)
+{
+    return 0;
+}
diff --git a/xen/arch/riscv/lib/Makefile b/xen/arch/riscv/lib/Makefile
new file mode 100644
index 0000000000..6fae6a1f10
--- /dev/null
+++ b/xen/arch/riscv/lib/Makefile
@@ -0,0 +1 @@
+obj-y += find_next_bit.o
diff --git a/xen/arch/riscv/lib/find_next_bit.c b/xen/arch/riscv/lib/find_next_bit.c
new file mode 100644
index 0000000000..bfae3e10de
--- /dev/null
+++ b/xen/arch/riscv/lib/find_next_bit.c
@@ -0,0 +1,285 @@
+/* find_next_bit.c: fallback find next bit implementation
+ *
+ * Copyright (C) 2004 Red Hat, Inc. All Rights Reserved.
+ * Written by David Howells (dhowells@redhat.com)
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ */
+#include <xen/bitops.h>
+#include <xen/kernel.h>
+#include <asm/bitops.h>
+#include <asm/types.h>
+#include <asm/byteorder.h>
+
+#define BITOP_WORD(nr)		((nr) / BITS_PER_LONG)
+
+#ifndef find_next_bit
+/*
+ * Find the next set bit in a memory region.
+ */
+unsigned long find_next_bit(const unsigned long *addr, unsigned long size,
+			    unsigned long offset)
+{
+	const unsigned long *p = addr + BITOP_WORD(offset);
+	unsigned long result = offset & ~(BITS_PER_LONG-1);
+	unsigned long tmp;
+
+	if (offset >= size)
+		return size;
+	size -= result;
+	offset %= BITS_PER_LONG;
+	if (offset) {
+		tmp = *(p++);
+		tmp &= (~0UL << offset);
+		if (size < BITS_PER_LONG)
+			goto found_first;
+		if (tmp)
+			goto found_middle;
+		size -= BITS_PER_LONG;
+		result += BITS_PER_LONG;
+	}
+	while (size & ~(BITS_PER_LONG-1)) {
+		if ((tmp = *(p++)))
+			goto found_middle;
+		result += BITS_PER_LONG;
+		size -= BITS_PER_LONG;
+	}
+	if (!size)
+		return result;
+	tmp = *p;
+
+found_first:
+	tmp &= (~0UL >> (BITS_PER_LONG - size));
+	if (tmp == 0UL)		/* Are any bits set? */
+		return result + size;	/* Nope. */
+found_middle:
+	return result + ffs(tmp);
+}
+EXPORT_SYMBOL(find_next_bit);
+#endif
+
+#ifndef find_next_zero_bit
+/*
+ * This implementation of find_{first,next}_zero_bit was stolen from
+ * Linus' asm-alpha/bitops.h.
+ */
+unsigned long find_next_zero_bit(const unsigned long *addr, unsigned long size,
+				 unsigned long offset)
+{
+	const unsigned long *p = addr + BITOP_WORD(offset);
+	unsigned long result = offset & ~(BITS_PER_LONG-1);
+	unsigned long tmp;
+
+	if (offset >= size)
+		return size;
+	size -= result;
+	offset %= BITS_PER_LONG;
+	if (offset) {
+		tmp = *(p++);
+		tmp |= ~0UL >> (BITS_PER_LONG - offset);
+		if (size < BITS_PER_LONG)
+			goto found_first;
+		if (~tmp)
+			goto found_middle;
+		size -= BITS_PER_LONG;
+		result += BITS_PER_LONG;
+	}
+	while (size & ~(BITS_PER_LONG-1)) {
+		if (~(tmp = *(p++)))
+			goto found_middle;
+		result += BITS_PER_LONG;
+		size -= BITS_PER_LONG;
+	}
+	if (!size)
+		return result;
+	tmp = *p;
+
+found_first:
+	tmp |= ~0UL << size;
+	if (tmp == ~0UL)	/* Are any bits zero? */
+		return result + size;	/* Nope. */
+found_middle:
+	return result + ffz(tmp);
+}
+EXPORT_SYMBOL(find_next_zero_bit);
+#endif
+
+#ifndef find_first_bit
+/*
+ * Find the first set bit in a memory region.
+ */
+unsigned long find_first_bit(const unsigned long *addr, unsigned long size)
+{
+	const unsigned long *p = addr;
+	unsigned long result = 0;
+	unsigned long tmp;
+
+	while (size & ~(BITS_PER_LONG-1)) {
+		if ((tmp = *(p++)))
+			goto found;
+		result += BITS_PER_LONG;
+		size -= BITS_PER_LONG;
+	}
+	if (!size)
+		return result;
+
+	tmp = (*p) & (~0UL >> (BITS_PER_LONG - size));
+	if (tmp == 0UL)		/* Are any bits set? */
+		return result + size;	/* Nope. */
+found:
+	return result + __ffs(tmp);
+}
+EXPORT_SYMBOL(find_first_bit);
+#endif
+
+#ifndef find_first_zero_bit
+/*
+ * Find the first cleared bit in a memory region.
+ */
+unsigned long find_first_zero_bit(const unsigned long *addr, unsigned long size)
+{
+	const unsigned long *p = addr;
+	unsigned long result = 0;
+	unsigned long tmp;
+
+	while (size & ~(BITS_PER_LONG-1)) {
+		if (~(tmp = *(p++)))
+			goto found;
+		result += BITS_PER_LONG;
+		size -= BITS_PER_LONG;
+	}
+	if (!size)
+		return result;
+
+	tmp = (*p) | (~0UL << size);
+	if (tmp == ~0UL)	/* Are any bits zero? */
+		return result + size;	/* Nope. */
+found:
+	return result + ffz(tmp);
+}
+EXPORT_SYMBOL(find_first_zero_bit);
+#endif
+
+#ifdef __BIG_ENDIAN
+
+/* include/linux/byteorder does not support "unsigned long" type */
+static inline unsigned long ext2_swabp(const unsigned long * x)
+{
+#if BITS_PER_LONG == 64
+	return (unsigned long) __swab64p((u64 *) x);
+#elif BITS_PER_LONG == 32
+	return (unsigned long) __swab32p((u32 *) x);
+#else
+#error BITS_PER_LONG not defined
+#endif
+}
+
+/* include/linux/byteorder doesn't support "unsigned long" type */
+static inline unsigned long ext2_swab(const unsigned long y)
+{
+#if BITS_PER_LONG == 64
+	return (unsigned long) __swab64((u64) y);
+#elif BITS_PER_LONG == 32
+	return (unsigned long) __swab32((u32) y);
+#else
+#error BITS_PER_LONG not defined
+#endif
+}
+
+#ifndef find_next_zero_bit_le
+unsigned long find_next_zero_bit_le(const void *addr, unsigned
+		long size, unsigned long offset)
+{
+	const unsigned long *p = addr;
+	unsigned long result = offset & ~(BITS_PER_LONG - 1);
+	unsigned long tmp;
+
+	if (offset >= size)
+		return size;
+	p += BITOP_WORD(offset);
+	size -= result;
+	offset &= (BITS_PER_LONG - 1UL);
+	if (offset) {
+		tmp = ext2_swabp(p++);
+		tmp |= (~0UL >> (BITS_PER_LONG - offset));
+		if (size < BITS_PER_LONG)
+			goto found_first;
+		if (~tmp)
+			goto found_middle;
+		size -= BITS_PER_LONG;
+		result += BITS_PER_LONG;
+	}
+
+	while (size & ~(BITS_PER_LONG - 1)) {
+		if (~(tmp = *(p++)))
+			goto found_middle_swap;
+		result += BITS_PER_LONG;
+		size -= BITS_PER_LONG;
+	}
+	if (!size)
+		return result;
+	tmp = ext2_swabp(p);
+found_first:
+	tmp |= ~0UL << size;
+	if (tmp == ~0UL)	/* Are any bits zero? */
+		return result + size; /* Nope. Skip ffz */
+found_middle:
+	return result + ffz(tmp);
+
+found_middle_swap:
+	return result + ffz(ext2_swab(tmp));
+}
+EXPORT_SYMBOL(find_next_zero_bit_le);
+#endif
+
+#ifndef find_next_bit_le
+unsigned long find_next_bit_le(const void *addr, unsigned
+		long size, unsigned long offset)
+{
+	const unsigned long *p = addr;
+	unsigned long result = offset & ~(BITS_PER_LONG - 1);
+	unsigned long tmp;
+
+	if (offset >= size)
+		return size;
+	p += BITOP_WORD(offset);
+	size -= result;
+	offset &= (BITS_PER_LONG - 1UL);
+	if (offset) {
+		tmp = ext2_swabp(p++);
+		tmp &= (~0UL << offset);
+		if (size < BITS_PER_LONG)
+			goto found_first;
+		if (tmp)
+			goto found_middle;
+		size -= BITS_PER_LONG;
+		result += BITS_PER_LONG;
+	}
+
+	while (size & ~(BITS_PER_LONG - 1)) {
+		tmp = *(p++);
+		if (tmp)
+			goto found_middle_swap;
+		result += BITS_PER_LONG;
+		size -= BITS_PER_LONG;
+	}
+	if (!size)
+		return result;
+	tmp = ext2_swabp(p);
+found_first:
+	tmp &= (~0UL >> (BITS_PER_LONG - size));
+	if (tmp == 0UL)		/* Are any bits set? */
+		return result + size; /* Nope. */
+found_middle:
+	return result + ffs(tmp);
+
+found_middle_swap:
+	return result + ffs(ext2_swab(tmp));
+}
+EXPORT_SYMBOL(find_next_bit_le);
+#endif
+
+#endif /* __BIG_ENDIAN */
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
new file mode 100644
index 0000000000..f366b1ca0c
--- /dev/null
+++ b/xen/arch/riscv/mm.c
@@ -0,0 +1,409 @@
+/*
+ * xen/arch/riscv/mm.c
+ *
+ * MMU code for a RISC-V RV32/64 with hypervisor extensions.
+ *
+ * Copyright (c) 2019 Bobby Eshleman <bobbyeshleman@gmail.com>
+ *
+ * Based on code that is Copyright (c) 2018 Anup Patel.
+ * Based on code that is Copyright (c) 2011 Tim Deegan <tim@xen.org>
+ * Based on code that is Copyright (c) 2011 Citrix Systems.
+ *
+ * Parts of this code are based on:
+ *     ARM/Xen: xen/arch/arm/mm.c.
+ *     Xvisor: arch/riscv/cpu/generic/cpu_mmu_initial_pgtbl.c
+ *         (https://github.com/xvisor/xvisor/tree/v0.2.11)
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <xen/compile.h>
+#include <xen/types.h>
+#include <xen/init.h>
+#include <xen/mm.h>
+#include <asm/p2m.h>
+#include <public/domctl.h>
+#include <asm/page.h>
+#include <xen/preempt.h>
+#include <xen/errno.h>
+#include <xen/grant_table.h>
+#include <xen/softirq.h>
+#include <xen/event.h>
+#include <xen/guest_access.h>
+#include <xen/domain_page.h>
+#include <xen/err.h>
+#include <asm/page.h>
+#include <asm/current.h>
+#include <asm/flushtlb.h>
+#include <public/memory.h>
+#include <xen/sched.h>
+#include <xen/vmap.h>
+#include <xsm/xsm.h>
+#include <xen/pfn.h>
+#include <xen/sizes.h>
+#include <asm/setup.h>
+#include <xen/libfdt/libfdt.h>
+
+#define XEN_TABLE_MAP_FAILED 0
+#define XEN_TABLE_SUPER_PAGE 1
+#define XEN_TABLE_NORMAL_PAGE 2
+
+enum pt_level {
+    pt_level_zero,
+    pt_level_one,
+#if CONFIG_PAGING_LEVELS == 3
+    pt_level_two,
+#endif
+};
+
+/* Override macros from asm/page.h to make them work with mfn_t */
+#undef virt_to_mfn
+#define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
+#undef mfn_to_virt
+#define mfn_to_virt(mfn) __mfn_to_virt(mfn_x(mfn))
+
+/* Limits of the Xen heap */
+mfn_t xenheap_mfn_start __read_mostly = INVALID_MFN_INITIALIZER;
+mfn_t xenheap_mfn_end __read_mostly;
+vaddr_t xenheap_virt_end __read_mostly;
+vaddr_t xenheap_virt_start __read_mostly;
+unsigned long xenheap_base_pdx __read_mostly;
+
+/* Limits of frametable */
+unsigned long frametable_virt_end __read_mostly;
+unsigned long frametable_base_pdx;
+
+static pte_t xen_fixmap[PAGE_ENTRIES] __attribute__((__aligned__(4096)));
+
+#define THIS_CPU_PGTABLE xen_second_pagetable
+
+/* Used by _setup_initial_pagetables() and initialized by head.S */
+extern unsigned long _text_start;
+extern unsigned long _text_end;
+extern unsigned long _cpuinit_start;
+extern unsigned long _cpuinit_end;
+extern unsigned long _spinlock_start;
+extern unsigned long _spinlock_end;
+extern unsigned long _init_start;
+extern unsigned long _init_end;
+extern unsigned long _rodata_start;
+extern unsigned long _rodata_end;
+
+paddr_t phys_offset;
+unsigned long max_page;
+
+static inline pte_t mfn_to_pte(mfn_t mfn)
+{
+    unsigned long pte = mfn_x(mfn) << PTE_SHIFT;
+    return (pte_t){ .pte = pte };
+}
+
+void *__init arch_vmap_virt_end(void)
+{
+    return (void *)VMAP_VIRT_END;
+}
+
+static inline pte_t mfn_to_xen_entry(mfn_t mfn)
+{
+    return mfn_to_pte(mfn);
+}
+
+/* Map a 4k page in a fixmap entry */
+void set_fixmap(unsigned map, mfn_t mfn, unsigned int flags)
+{
+    pte_t pte;
+
+    pte = mfn_to_xen_entry(mfn);
+    pte.pte |= PTE_LEAF_DEFAULT;
+    write_pte(&xen_fixmap[pagetable_zeroeth_index(FIXMAP_ADDR(map))], pte);
+}
+
+/* Remove a mapping from a fixmap entry */
+void clear_fixmap(unsigned map)
+{
+    pte_t pte = {0};
+    write_pte(&xen_fixmap[pagetable_zeroeth_index(FIXMAP_ADDR(map))], pte);
+}
+
+#ifdef CONFIG_DOMAIN_PAGE
+void *map_domain_page_global(mfn_t mfn)
+{
+    return vmap(&mfn, 1);
+}
+
+void unmap_domain_page_global(const void *va)
+{
+    vunmap(va);
+}
+#endif
+
+void flush_page_to_ram(unsigned long mfn, bool sync_icache)
+{
+    void *va = map_domain_page(_mfn(mfn));
+    unmap_domain_page(va);
+
+    /* TODO */
+
+    if ( sync_icache )
+        invalidate_icache();
+}
+
+enum xenmap_operation { INSERT, REMOVE, MODIFY, RESERVE };
+
+int map_pages_to_xen(unsigned long virt, mfn_t mfn, unsigned long nr_mfns,
+                     unsigned int flags)
+{
+    return -ENOSYS;
+}
+
+int populate_pt_range(unsigned long virt, unsigned long nr_mfns)
+{
+    (void) virt;
+    (void) nr_mfns;
+
+    /* TODO */
+
+    return  0;
+}
+
+int destroy_xen_mappings(unsigned long v, unsigned long e)
+{
+    (void) v;
+    (void) e;
+
+    /* TODO */
+
+    return 0;
+}
+
+int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int flags)
+{
+    (void) s;
+    (void) e;
+    (void) flags;
+
+    /* TODO */
+
+    return 0;
+}
+
+void arch_dump_shared_mem_info(void)
+{
+    /* TODO */
+}
+
+int donate_page(struct domain *d, struct page_info *page, unsigned int memflags)
+{
+    ASSERT_UNREACHABLE();
+    return -ENOSYS;
+}
+
+int steal_page(struct domain *d, struct page_info *page, unsigned int memflags)
+{
+    return -EOPNOTSUPP;
+}
+
+int page_is_ram_type(unsigned long mfn, unsigned long mem_type)
+{
+    ASSERT_UNREACHABLE();
+    return 0;
+}
+
+unsigned long domain_get_maximum_gpfn(struct domain *d)
+{
+    BUG();
+    return 0;
+}
+
+void share_xen_page_with_guest(struct page_info *page, struct domain *d,
+                               enum XENSHARE_flags flags)
+{
+    if ( page_get_owner(page) == d )
+        return;
+
+    spin_lock(&d->page_alloc_lock);
+
+    /* TODO */
+
+    spin_unlock(&d->page_alloc_lock);
+}
+
+int xenmem_add_to_physmap_one(struct domain *d, unsigned int space,
+                              union add_to_physmap_extra extra,
+                              unsigned long idx, gfn_t gfn)
+{
+    /* TODO */
+
+    return 0;
+}
+
+long arch_memory_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg)
+{
+    /* TODO */
+    return 0;
+}
+
+struct domain *page_get_owner_and_reference(struct page_info *page)
+{
+    unsigned long x, y = page->count_info;
+    struct domain *owner;
+
+    do
+    {
+        x = y;
+        /*
+         * Count ==  0: Page is not allocated, so we cannot take a reference.
+         * Count == -1: Reference count would wrap, which is invalid.
+         */
+        if ( unlikely(((x + 1) & PGC_count_mask) <= 1) )
+            return NULL;
+    } while ( (y = cmpxchg(&page->count_info, x, x + 1)) != x );
+
+    owner = page_get_owner(page);
+    ASSERT(owner);
+
+    return owner;
+}
+
+void put_page(struct page_info *page)
+{
+    unsigned long nx, x, y = page->count_info;
+
+    do
+    {
+        ASSERT((y & PGC_count_mask) != 0);
+        x = y;
+        nx = x - 1;
+    } while ( unlikely((y = cmpxchg(&page->count_info, x, nx)) != x) );
+
+    if ( unlikely((nx & PGC_count_mask) == 0) )
+    {
+        free_domheap_page(page);
+    }
+}
+
+bool get_page(struct page_info *page, const struct domain *domain)
+{
+    struct domain *owner = page_get_owner_and_reference(page);
+
+    if ( likely(owner == domain) )
+        return true;
+
+    if ( owner != NULL )
+        put_page(page);
+
+    return false;
+}
+
+/* Common code requires get_page_type and put_page_type.
+ * We don't care about typecounts so we just do the minimum to make it
+ * happy. */
+int get_page_type(struct page_info *page, unsigned long type)
+{
+    return 1;
+}
+
+void put_page_type(struct page_info *page)
+{
+    return;
+}
+
+/*
+ * This function should only be used to remap device address ranges
+ * TODO: add a check to verify this assumption
+ */
+void __iomem *ioremap_attr(paddr_t pa, size_t len, unsigned int attributes)
+{
+    mfn_t mfn = _mfn(PFN_DOWN(pa));
+    unsigned int offs = pa & (PAGE_SIZE - 1);
+    unsigned int nr = PFN_UP(offs + len);
+
+    void *ptr = __vmap(&mfn, nr, 1, 1, attributes, VMAP_DEFAULT);
+
+    if ( ptr == NULL )
+        return NULL;
+
+    return ptr + offs;
+}
+
+void *ioremap(paddr_t pa, size_t len)
+{
+    return ioremap_attr(pa, len, PAGE_HYPERVISOR_NOCACHE);
+}
+
+#ifdef CONFIG_GRANT_TABLE
+void gnttab_clear_flags(struct domain *d, unsigned long nr, uint16_t *addr)
+{
+	/* TODO */
+}
+
+void gnttab_mark_dirty(struct domain *d, mfn_t mfn)
+{
+	/* TODO */
+}
+
+int create_grant_host_mapping(unsigned long addr, mfn_t frame,
+                              unsigned int flags, unsigned int cache_flags)
+{
+	/* TODO */
+}
+
+int replace_grant_host_mapping(unsigned long addr, mfn_t mfn,
+                               unsigned long new_addr, unsigned int flags)
+{
+	/* TODO */
+}
+#endif
+
+bool is_iomem_page(mfn_t mfn)
+{
+    return !mfn_valid(mfn);
+}
+
+unsigned long get_upper_mfn_bound(void)
+{
+    /* No memory hotplug yet, so current memory limit is the final one. */
+    return max_page - 1;
+}
+
+/*
+ * Map the table that pte points to.
+ */
+void *map_domain_table(pte_t *pte)
+{
+    return map_domain_page(maddr_to_mfn((paddr_t)pte_to_paddr(pte)));
+}
+
+void unmap_domain_table(pte_t *table)
+{
+    return unmap_domain_page(table);
+}
+
+paddr_t __virt_to_maddr(vaddr_t va)
+{
+    /* TODO */
+    return 0;
+}
+
+int guest_physmap_mark_populate_on_demand(struct domain *d, unsigned long gfn,
+                                          unsigned int order)
+{
+    return 0;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
new file mode 100644
index 0000000000..54207f8230
--- /dev/null
+++ b/xen/arch/riscv/p2m.c
@@ -0,0 +1,97 @@
+#include <xen/cpu.h>
+#include <xen/domain_page.h>
+#include <xen/iocap.h>
+#include <xen/lib.h>
+#include <xen/sched.h>
+#include <xen/softirq.h>
+#include <asm/event.h>
+#include <asm/flushtlb.h>
+#include <asm/page.h>
+
+void memory_type_changed(struct domain *d)
+{
+}
+
+mfn_t gfn_to_mfn(struct domain *d, gfn_t gfn)
+{
+    /* TODO */
+    return INVALID_MFN;
+}
+
+int map_regions_p2mt(struct domain *d,
+                     gfn_t gfn,
+                     unsigned long nr,
+                     mfn_t mfn,
+                     p2m_type_t p2mt)
+{
+    return -ENOSYS;
+}
+
+int unmap_regions_p2mt(struct domain *d,
+                       gfn_t gfn,
+                       unsigned long nr,
+                       mfn_t mfn)
+{
+    return -ENOSYS;
+}
+
+int map_mmio_regions(struct domain *d,
+                     gfn_t start_gfn,
+                     unsigned long nr,
+                     mfn_t mfn)
+{
+    return -ENOSYS;
+}
+
+int unmap_mmio_regions(struct domain *d,
+                       gfn_t start_gfn,
+                       unsigned long nr,
+                       mfn_t mfn)
+{
+    return -ENOSYS;
+}
+
+int guest_physmap_add_entry(struct domain *d,
+                            gfn_t gfn,
+                            mfn_t mfn,
+                            unsigned long page_order,
+                            p2m_type_t t)
+{
+    return -ENOSYS;
+}
+
+int guest_physmap_remove_page(struct domain *d, gfn_t gfn, mfn_t mfn,
+                              unsigned int page_order)
+{
+    return -ENOSYS;
+}
+
+
+void vcpu_mark_events_pending(struct vcpu *v)
+{
+    /* TODO */
+}
+
+void vcpu_update_evtchn_irq(struct vcpu *v)
+{
+    /* TODO */
+}
+
+struct page_info *get_page_from_gfn(struct domain *d, unsigned long gfn,
+                                    p2m_type_t *t, p2m_query_t q)
+{
+    /* TODO */
+    return NULL;
+}
+
+int set_foreign_p2m_entry(struct domain *d, const struct domain *fd,
+                          unsigned long gfn, mfn_t mfn)
+{
+    return -EOPNOTSUPP;
+}
+
+unsigned long p2m_pod_decrease_reservation(struct domain *d, gfn_t gfn,
+                                           unsigned int order)
+{
+    return 0;
+}
diff --git a/xen/arch/riscv/percpu.c b/xen/arch/riscv/percpu.c
new file mode 100644
index 0000000000..25442c48fe
--- /dev/null
+++ b/xen/arch/riscv/percpu.c
@@ -0,0 +1,84 @@
+#include <xen/percpu.h>
+#include <xen/cpu.h>
+#include <xen/init.h>
+#include <xen/mm.h>
+#include <xen/rcupdate.h>
+
+unsigned long __per_cpu_offset[NR_CPUS];
+#define INVALID_PERCPU_AREA (-(long)__per_cpu_start)
+#define PERCPU_ORDER (get_order_from_bytes(__per_cpu_data_end-__per_cpu_start))
+
+void __init percpu_init_areas(void)
+{
+    unsigned int cpu;
+    for ( cpu = 1; cpu < NR_CPUS; cpu++ )
+        __per_cpu_offset[cpu] = INVALID_PERCPU_AREA;
+}
+
+static int init_percpu_area(unsigned int cpu)
+{
+    char *p;
+    if ( __per_cpu_offset[cpu] != INVALID_PERCPU_AREA )
+        return -EBUSY;
+    if ( (p = alloc_xenheap_pages(PERCPU_ORDER, 0)) == NULL )
+        return -ENOMEM;
+    memset(p, 0, __per_cpu_data_end - __per_cpu_start);
+    __per_cpu_offset[cpu] = p - __per_cpu_start;
+    return 0;
+}
+
+struct free_info {
+    unsigned int cpu;
+    struct rcu_head rcu;
+};
+static DEFINE_PER_CPU(struct free_info, free_info);
+
+static void _free_percpu_area(struct rcu_head *head)
+{
+    struct free_info *info = container_of(head, struct free_info, rcu);
+    unsigned int cpu = info->cpu;
+    char *p = __per_cpu_start + __per_cpu_offset[cpu];
+    free_xenheap_pages(p, PERCPU_ORDER);
+    __per_cpu_offset[cpu] = INVALID_PERCPU_AREA;
+}
+
+static void free_percpu_area(unsigned int cpu)
+{
+    struct free_info *info = &per_cpu(free_info, cpu);
+    info->cpu = cpu;
+    call_rcu(&info->rcu, _free_percpu_area);
+}
+
+static int cpu_percpu_callback(
+    struct notifier_block *nfb, unsigned long action, void *hcpu)
+{
+    unsigned int cpu = (unsigned long)hcpu;
+    int rc = 0;
+
+    switch ( action )
+    {
+    case CPU_UP_PREPARE:
+        rc = init_percpu_area(cpu);
+        break;
+    case CPU_UP_CANCELED:
+    case CPU_DEAD:
+        free_percpu_area(cpu);
+        break;
+    default:
+        break;
+    }
+
+    return !rc ? NOTIFY_DONE : notifier_from_errno(rc);
+}
+
+static struct notifier_block cpu_percpu_nfb = {
+    .notifier_call = cpu_percpu_callback,
+    .priority = 100 /* highest priority */
+};
+
+static int __init percpu_presmp_init(void)
+{
+    register_cpu_notifier(&cpu_percpu_nfb);
+    return 0;
+}
+presmp_initcall(percpu_presmp_init);
diff --git a/xen/arch/riscv/platforms/Kconfig b/xen/arch/riscv/platforms/Kconfig
new file mode 100644
index 0000000000..6959ec35a2
--- /dev/null
+++ b/xen/arch/riscv/platforms/Kconfig
@@ -0,0 +1,31 @@
+choice
+	prompt "Platform Support"
+	default ALL_PLAT
+	---help---
+	Choose which hardware platform to enable in Xen.
+
+	If unsure, choose ALL_PLAT.
+
+config ALL_PLAT
+	bool "All Platforms"
+	---help---
+	Enable support for all available hardware platforms. It doesn't
+	automatically select any of the related drivers.
+
+config QEMU
+	bool "QEMU RISC-V virt machine support"
+	depends on RISCV
+	select HAS_NS16550
+	---help---
+	Enable all the required drivers for QEMU RISC-V virt emulated
+	machine.
+
+endchoice
+
+config ALL64_PLAT
+	bool
+	default (ALL_PLAT && RISCV_64)
+
+config ALL32_PLAT
+	bool
+	default (ALL_PLAT && RISCV_32)
diff --git a/xen/arch/riscv/riscv64/Makefile b/xen/arch/riscv/riscv64/Makefile
index 15a4a65f66..3340058c08 100644
--- a/xen/arch/riscv/riscv64/Makefile
+++ b/xen/arch/riscv/riscv64/Makefile
@@ -1 +1 @@
-extra-y += head.o
+obj-y += head.o
diff --git a/xen/arch/riscv/riscv64/asm-offsets.c b/xen/arch/riscv/riscv64/asm-offsets.c
index e69de29bb2..d246e80413 100644
--- a/xen/arch/riscv/riscv64/asm-offsets.c
+++ b/xen/arch/riscv/riscv64/asm-offsets.c
@@ -0,0 +1,39 @@
+/*
+ * Copyright (C) 2012 Regents of the University of California
+ * Copyright (C) 2017 SiFive
+ *
+ *   This program is free software; you can redistribute it and/or
+ *   modify it under the terms of the GNU General Public License
+ *   as published by the Free Software Foundation, version 2.
+ *
+ *   This program is distributed in the hope that it will be useful,
+ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *   GNU General Public License for more details.
+ */
+
+#define COMPILE_OFFSETS
+
+#include <xen/types.h>
+#include <xen/sched.h>
+#include <xen/bitops.h>
+#include <public/xen.h>
+#include <asm/processor.h>
+#include <asm/init.h>
+#include <asm/current.h>
+
+#define DEFINE(_sym, _val)                                                 \
+    asm volatile ("\n.ascii\"==>#define " #_sym " %0 /* " #_val " */<==\"" \
+                  : : "i" (_val) )
+#define BLANK()                                                            \
+    asm volatile ( "\n.ascii\"==><==\"" : : )
+#define OFFSET(_sym, _str, _mem)                                           \
+    DEFINE(_sym, offsetof(_str, _mem));
+
+void asm_offsets(void)
+{
+
+   BLANK();
+   OFFSET(INITINFO_stack, struct init_info, stack);
+   DEFINE(PCPUINFO_sizeof, sizeof(struct pcpu_info));
+}
diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
index 0dbc27ba75..5cccab09c7 100644
--- a/xen/arch/riscv/riscv64/head.S
+++ b/xen/arch/riscv/riscv64/head.S
@@ -1,6 +1,13 @@
+#include <asm/asm.h>
+#include <asm/asm-offsets.h>
+#include <asm/init.h>
+#include <asm/csr.h>
 #include <asm/config.h>
+#include <asm/processor.h>
 
-        .text
-
+	.section .text.header, "ax", %progbits
 ENTRY(start)
-        j  start
+_start_hang:
+	wfi
+	j	_start_hang
+ENDPROC(start)
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
new file mode 100644
index 0000000000..79beb25ff3
--- /dev/null
+++ b/xen/arch/riscv/setup.c
@@ -0,0 +1,65 @@
+/*
+ * xen/arch/riscv/setup.c
+ *
+ *
+ * Early bringup code for a RISC-V RV32/64 with hypervisor
+ * extensions (code H).
+ *
+ * Based off the ARM setup code with copyright Tim Deegan <tim@xen.org>
+ *
+ * Copyright (c) 2019 Bobby Eshleman <bobbyeshleman@gmail.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <xen/lib.h>
+#include <xen/init.h>
+#include <asm/atomic.h>
+#include <public/version.h>
+
+domid_t max_init_domid = 0;
+
+struct domain *xen_dom;
+
+bool acpi_disabled = true;
+
+/* The lucky hart to first increment this variable will boot the other cores */
+atomic_t hart_lottery;
+unsigned long boot_cpu_hartid;
+unsigned long total_pages;
+
+void arch_get_xen_caps(xen_capabilities_info_t *info)
+{
+    /* Interface name is always xen-3.0-* for Xen-3.x. */
+    int major = 3, minor = 0;
+    char s[32];
+
+    (*info)[0] = '\0';
+
+    snprintf(s, sizeof(s), "xen-%d.%d-riscv ", major, minor);
+    safe_strcat(*info, s);
+}
+
+/** start_xen - The C entry point
+ *
+ * The real entry point is in head.S.
+ */
+void __init start_xen(paddr_t fdt_paddr, paddr_t boot_phys_offset)
+{
+}
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/shutdown.c b/xen/arch/riscv/shutdown.c
new file mode 100644
index 0000000000..90ade9a555
--- /dev/null
+++ b/xen/arch/riscv/shutdown.c
@@ -0,0 +1,24 @@
+#include <xen/console.h>
+#include <xen/cpu.h>
+#include <xen/delay.h>
+#include <xen/lib.h>
+#include <xen/smp.h>
+
+void machine_halt(void)
+{
+    /* TODO */
+}
+
+void machine_restart(unsigned int delay_millisecs)
+{
+    /* TODO */
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/smp.c b/xen/arch/riscv/smp.c
new file mode 100644
index 0000000000..847517937c
--- /dev/null
+++ b/xen/arch/riscv/smp.c
@@ -0,0 +1,38 @@
+#include <xen/mm.h>
+#include <xen/smp.h>
+#include <asm/system.h>
+#include <asm/smp.h>
+#include <asm/page.h>
+#include <asm/flushtlb.h>
+
+volatile unsigned long start_secondary_pen_release = HARTID_INVALID;
+
+/* tp points to one of these per cpu */
+struct pcpu_info pcpu_info[NR_CPUS];
+
+void arch_flush_tlb_mask(const cpumask_t *mask)
+{
+    /* TODO */
+    BUG();
+}
+
+void smp_send_event_check_mask(const cpumask_t *mask)
+{
+    /* TODO */
+    printk("%s: smp not supported yet\n", __func__);
+}
+
+void smp_send_call_function_mask(const cpumask_t *mask)
+{
+    /* TODO */
+    printk("%s: smp not supported yet\n", __func__);
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/smpboot.c b/xen/arch/riscv/smpboot.c
new file mode 100644
index 0000000000..b3d19ff880
--- /dev/null
+++ b/xen/arch/riscv/smpboot.c
@@ -0,0 +1,78 @@
+/*
+ * Dummy smpboot support
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+#include <xen/cpu.h>
+#include <xen/cpumask.h>
+#include <xen/errno.h>
+#include <xen/init.h>
+#include <xen/sched.h>
+#include <xen/smp.h>
+#include <xen/nodemask.h>
+
+cpumask_t cpu_online_map;
+cpumask_t cpu_present_map;
+cpumask_t cpu_possible_map;
+
+DEFINE_PER_CPU(unsigned int, cpu_id);
+DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, cpu_sibling_mask);
+DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, cpu_core_mask);
+
+/* Fake one node for now. See also include/asm-arm/numa.h */
+nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
+
+/* Boot cpu data */
+struct init_info init_data =
+{
+};
+
+int __cpu_up(unsigned int cpu)
+{
+    /* TODO */
+    BUG();
+    return 0;
+}
+
+/* Shut down the current CPU */
+void __cpu_disable(void)
+{
+    /* TODO */
+    BUG();
+}
+
+void __cpu_die(unsigned int cpu)
+{
+    /* TODO */
+    BUG();
+}
+
+int __init
+smp_get_max_cpus(void)
+{
+    int i, max_cpus = 0;
+
+    for ( i = 0; i < nr_cpu_ids; i++ )
+        if ( cpu_possible(i) )
+            max_cpus++;
+
+    return max_cpus;
+}
+
+void __init
+smp_clear_cpu_maps (void)
+{
+    cpumask_clear(&cpu_possible_map);
+    cpumask_clear(&cpu_online_map);
+    cpumask_set_cpu(0, &cpu_possible_map);
+    cpumask_set_cpu(0, &cpu_online_map);
+    cpumask_copy(&cpu_present_map, &cpu_possible_map);
+}
diff --git a/xen/arch/riscv/sysctl.c b/xen/arch/riscv/sysctl.c
new file mode 100644
index 0000000000..fbfdb44eff
--- /dev/null
+++ b/xen/arch/riscv/sysctl.c
@@ -0,0 +1,31 @@
+/******************************************************************************
+ * Arch-specific sysctl.c
+ *
+ * System management operations. For use by node control stack.
+ *
+ * Copyright (c) 2012, Citrix Systems
+ */
+
+#include <xen/types.h>
+#include <xen/lib.h>
+#include <xen/errno.h>
+#include <xen/hypercall.h>
+#include <public/sysctl.h>
+
+void arch_do_physinfo(struct xen_sysctl_physinfo *pi) { }
+
+long arch_do_sysctl(struct xen_sysctl *sysctl,
+                    XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
+{
+    return -ENOSYS;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/time.c b/xen/arch/riscv/time.c
new file mode 100644
index 0000000000..465ff63505
--- /dev/null
+++ b/xen/arch/riscv/time.c
@@ -0,0 +1,69 @@
+/*
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <xen/console.h>
+#include <xen/init.h>
+#include <xen/irq.h>
+#include <xen/lib.h>
+#include <xen/mm.h>
+#include <xen/softirq.h>
+#include <xen/sched.h>
+#include <xen/time.h>
+#include <xen/sched.h>
+#include <xen/event.h>
+#include <xen/cpu.h>
+#include <xen/notifier.h>
+#include <asm/acpi.h>
+#include <asm/system.h>
+#include <asm/time.h>
+
+unsigned long __read_mostly cpu_khz;  /* CPU clock frequency in kHz. */
+
+uint64_t __read_mostly boot_count;
+
+
+s_time_t get_s_time(void)
+{
+    uint64_t ticks = get_cycles() - boot_count;
+    return ticks_to_ns(ticks);
+}
+
+
+/* VCPU PV timers. */
+void send_timer_event(struct vcpu *v)
+{
+    /* TODO */
+}
+
+/* VCPU PV clock. */
+void update_vcpu_system_time(struct vcpu *v)
+{
+    /* TODO */
+    BUG();
+}
+
+void force_update_vcpu_system_time(struct vcpu *v)
+{
+    update_vcpu_system_time(v);
+}
+
+void domain_set_time_offset(struct domain *d, int64_t time_offset_seconds)
+{
+    /* TODO */
+    BUG();
+}
+
+int reprogram_timer(s_time_t timeout)
+{
+    /* TODO */
+    return -ENOSYS;
+}
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
new file mode 100644
index 0000000000..083dbf7113
--- /dev/null
+++ b/xen/arch/riscv/traps.c
@@ -0,0 +1,87 @@
+/*
+ * RISC-V Trap handlers
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <xen/domain_page.h>
+#include <xen/const.h>
+#include <xen/errno.h>
+#include <xen/hypercall.h>
+#include <xen/init.h>
+#include <xen/iocap.h>
+#include <xen/irq.h>
+#include <xen/lib.h>
+#include <xen/livepatch.h>
+#include <xen/mem_access.h>
+#include <xen/mm.h>
+#include <xen/perfc.h>
+#include <xen/smp.h>
+#include <xen/softirq.h>
+#include <xen/string.h>
+#include <xen/symbols.h>
+#include <xen/version.h>
+#include <xen/virtual_region.h>
+
+#include <asm/traps.h>
+#include <asm/guest_access.h>
+
+/* Included just for hardcoded values during development */
+#include <asm/setup.h>
+
+#include <public/sched.h>
+#include <public/xen.h>
+
+void __handle_exception(void)
+{
+    /* TODO */
+    BUG();
+}
+
+void show_stack(const struct cpu_user_regs *regs)
+{
+    /* TODO */
+    BUG();
+}
+
+void show_execution_state(const struct cpu_user_regs *regs)
+{
+    /* TODO */
+    BUG();
+}
+
+void vcpu_show_execution_state(struct vcpu *v)
+{
+    /* TODO */
+    BUG();
+}
+
+void arch_hypercall_tasklet_result(struct vcpu *v, long res)
+{
+	/* TODO */
+    BUG();
+}
+
+enum mc_disposition arch_do_multicall_call(struct mc_state *state)
+{
+    /* TODO */
+    BUG();
+    return mc_continue;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/vm_event.c b/xen/arch/riscv/vm_event.c
new file mode 100644
index 0000000000..7433362686
--- /dev/null
+++ b/xen/arch/riscv/vm_event.c
@@ -0,0 +1,51 @@
+/*
+ * Architecture-specific vm_event handling routines
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public
+ * License v2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public
+ * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <xen/sched.h>
+#include <asm/vm_event.h>
+
+void vm_event_fill_regs(vm_event_request_t *req)
+{
+    /* TODO */
+    BUG();
+}
+
+void vm_event_set_registers(struct vcpu *v, vm_event_response_t *rsp)
+{
+    BUG();
+    /* TODO */
+}
+
+void vm_event_monitor_next_interrupt(struct vcpu *v)
+{
+    /* TODO */
+    BUG();
+}
+
+void vm_event_reset_vmtrace(struct vcpu *v)
+{
+    /* TODO */
+    BUG();
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
new file mode 100644
index 0000000000..46f83d8f89
--- /dev/null
+++ b/xen/arch/riscv/xen.lds.S
@@ -0,0 +1,274 @@
+/**
+ * Copyright (c) 2018 Anup Patel.
+ * All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2, or (at your option)
+ * any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ *
+ * @file linker.ld
+ * @author Anup Patel (anup@brainfault.org)
+ * @brief CPU specific linker script
+ */
+
+#include <xen/cache.h>
+#include <asm/percpu.h>
+#undef ENTRY
+#undef ALIGN
+
+OUTPUT_ARCH(riscv)
+ENTRY(start)
+
+PHDRS
+{
+  text PT_LOAD ;
+#if defined(BUILD_ID)
+  note PT_NOTE ;
+#endif
+}
+
+SECTIONS
+{
+  . = XEN_VIRT_START;
+  . = ALIGN(PAGE_SIZE); /* Need this to create proper sections */
+  _start = .;
+  PROVIDE(_code_start = .);
+
+  /* Beginning of the code section */
+
+  .text :
+  {
+    PROVIDE(_text_start = .);
+    _stext = .;            /* Text section */
+    *(.text.header)
+    *(.entry)
+    *(.text)
+    . = ALIGN(8);
+    _etext = .;             /* End of text section */
+    PROVIDE(_text_end = .);
+  } :text = 0x9090
+
+  . = ALIGN(PAGE_SIZE); /* Ensure next section is page aligned */
+
+  .init :
+  {
+    PROVIDE(_init_start = .);
+
+    *(.init.text)
+    . = ALIGN(8);
+
+    PROVIDE(__setup_start = .);
+    *(.setup.init);
+    PROVIDE(__setup_end = .);
+
+    . = ALIGN(PAGE_SIZE);
+    *(.devtree)
+    . = ALIGN(PAGE_SIZE);
+
+    PROVIDE(_init_end = .);
+
+    . = ALIGN(PAGE_SIZE);
+
+    PROVIDE(_initdata_start = .);
+    *(.init.data)
+    . = ALIGN(8);
+    PROVIDE(_initdata_end = .);
+  }
+
+  . = ALIGN(PAGE_SIZE); /* Ensure next section is page aligned */
+
+  .cpuinit :
+  {
+    PROVIDE(_cpuinit_start = .);
+    *(.cpuinit.*)
+    . = ALIGN(8);
+    PROVIDE(_cpuinit_end = .);
+  }
+
+  . = ALIGN(PAGE_SIZE); /* Ensure next section is page aligned */
+
+  .spinlock :
+  {
+    PROVIDE(_spinlock_start = .);
+    *(.spinlock.*)
+    . = ALIGN(8);
+    PROVIDE(_spinlock_end = .);
+  }
+
+  /* End of the code sections */
+
+  /* Beginning of the read-only data sections */
+
+  . = ALIGN(PAGE_SIZE); /* Ensure next section is page aligned */
+
+  .rodata :
+  {
+    PROVIDE(_rodata_start = .);
+    *(.rodata .rodata.*)
+    . = ALIGN(8);
+     _srodata = .;
+     /* Bug frames table */
+    __start_bug_frames = .;
+    *(.bug_frames.0)
+    __stop_bug_frames_0 = .;
+    *(.bug_frames.1)
+    __stop_bug_frames_1 = .;
+    *(.bug_frames.2)
+    __stop_bug_frames_2 = .;
+    *(.bug_frames.3)
+    __stop_bug_frames_3 = .;
+    *(.rodata)
+    *(.rodata.*)
+    *(.data.rel.ro)
+    *(.data.rel.ro.*)
+
+   . = ALIGN(POINTER_ALIGN);
+   __param_start = .;
+   *(.data.param)
+   __param_end = .;
+
+   __proc_info_start = .;
+   *(.proc.info)
+   __proc_info_end = .;
+    PROVIDE(_rodata_end = .);
+  }
+
+  . = ALIGN(4);
+  .note.gnu.build-id : {
+       __note_gnu_build_id_start = .;
+       *(.note.gnu.build-id)
+       __note_gnu_build_id_end = .;
+  } :note :text
+
+  /* End of the read-only data sections */
+
+  /* Beginning of the read-write data sections */
+
+  . = ALIGN(PAGE_SIZE); /* Ensure next section is page aligned */
+
+  .percpu :
+  {
+    PROVIDE(_percpu_start = .);
+    *(.percpu)
+    . = ALIGN(8);
+    PROVIDE(_percpu_end = .);
+  }
+
+  . = ALIGN(PAGE_SIZE); /* Ensure next section is page aligned */
+
+  .data :
+  {
+    PROVIDE(_data_start = .);
+
+   *(.data.page_aligned)
+   *(.data)
+   . = ALIGN(8);
+   __start_schedulers_array = .;
+   *(.data.schedulers)
+   __end_schedulers_array = .;
+   *(.data.rel)
+   *(.data.rel.*)
+   CONSTRUCTORS
+
+    PROVIDE(_data_end = .);
+  }
+
+  . = ALIGN(8);
+  .dev.info : {
+      _sdevice = .;
+      *(.dev.info)
+      _edevice = .;
+  } :text
+
+  . = ALIGN(PAGE_SIZE);             /* Init code and data */
+  __init_begin = .;
+  .init.text : {
+       _sinittext = .;
+       *(.init.text)
+       _einittext = .;
+  } :text
+  . = ALIGN(PAGE_SIZE);
+  .init.data : {
+       *(.init.rodata)
+       *(.init.rodata.rel)
+       *(.init.rodata.str*)
+
+       . = ALIGN(POINTER_ALIGN);
+       __setup_start = .;
+       *(.init.setup)
+       __setup_end = .;
+
+       __initcall_start = .;
+       *(.initcallpresmp.init)
+       __presmp_initcall_end = .;
+       *(.initcall1.init)
+       __initcall_end = .;
+
+       . = ALIGN(4);
+       __alt_instructions = .;
+       *(.altinstructions)
+       __alt_instructions_end = .;
+       . = ALIGN(4);
+       *(.altinstr_replacement)
+
+       *(.init.data)
+       *(.init.data.rel)
+       *(.init.data.rel.*)
+
+       . = ALIGN(8);
+       __ctors_start = .;
+       *(.ctors)
+       *(.init_array)
+       *(SORT(.init_array.*))
+       __ctors_end = .;
+
+  } :text
+  . = ALIGN(STACK_SIZE);
+  __init_end = .;
+
+  . = ALIGN(PAGE_SIZE); /* Ensure next section is page aligned */
+
+  .bss :
+  {
+    PROVIDE(_bss_start = .);
+   *(.bss.stack_aligned)
+   . = ALIGN(PAGE_SIZE);
+   *(.bss.page_aligned)
+   *(.bss)
+   . = ALIGN(SMP_CACHE_BYTES);
+   __per_cpu_start = .;
+   *(.bss.percpu)
+   . = ALIGN(SMP_CACHE_BYTES);
+   *(.bss.percpu.read_mostly)
+   . = ALIGN(SMP_CACHE_BYTES);
+   __per_cpu_data_end = .;
+    PROVIDE(_bss_end = .);
+  }
+
+  . = ALIGN(STACK_SIZE); /* Ensure next section is aligned to the stack size */
+
+  .hvc_stack :
+  {
+    PROVIDE(_hvc_stack_start = .);
+    . = . + (STACK_SIZE * CONFIG_NR_CPUS);
+    . = ALIGN(8);
+    PROVIDE(_hvc_stack_end = .);
+  }
+
+  /* End of the read-write data sections */
+
+  . = ALIGN(PAGE_SIZE); /* Need this to create proper pages */
+
+  PROVIDE(_code_end = .);
+  _end = .;
+}
diff --git a/xen/include/public/arch-riscv.h b/xen/include/public/arch-riscv.h
new file mode 100644
index 0000000000..dfbe188d3b
--- /dev/null
+++ b/xen/include/public/arch-riscv.h
@@ -0,0 +1,182 @@
+/******************************************************************************
+ * arch-riscv.h
+ *
+ * Guest OS interface to RISC-V Xen.
+ * Initially based on the ARM implementation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ * Copyright 2019 (C) Alistair Francis <alistair.francis@wdc.com>
+ */
+
+#ifndef __XEN_PUBLIC_ARCH_RISCV_H__
+#define __XEN_PUBLIC_ARCH_RISCV_H__
+
+#define  int64_aligned_t  int64_t __attribute__((aligned(8)))
+#define uint64_aligned_t uint64_t __attribute__((aligned(8)))
+
+#ifndef __ASSEMBLY__
+#define ___DEFINE_XEN_GUEST_HANDLE(name, type)                  \
+    typedef union { type *p; unsigned long q; }                 \
+        __guest_handle_ ## name;                                \
+    typedef union { type *p; uint64_aligned_t q; }              \
+        __guest_handle_64_ ## name
+
+/*
+ * XEN_GUEST_HANDLE represents a guest pointer, when passed as a field
+ * in a struct in memory. On RISCV is always 8 bytes sizes and 8 bytes
+ * aligned.
+ * XEN_GUEST_HANDLE_PARAM represents a guest pointer, when passed as an
+ * hypercall argument. It is 4 bytes on aarch32 and 8 bytes on aarch64.
+ */
+#define __DEFINE_XEN_GUEST_HANDLE(name, type) \
+    ___DEFINE_XEN_GUEST_HANDLE(name, type);   \
+    ___DEFINE_XEN_GUEST_HANDLE(const_##name, const type)
+#define DEFINE_XEN_GUEST_HANDLE(name)   __DEFINE_XEN_GUEST_HANDLE(name, name)
+#define __XEN_GUEST_HANDLE(name)        __guest_handle_64_ ## name
+#define XEN_GUEST_HANDLE(name)          __XEN_GUEST_HANDLE(name)
+#define XEN_GUEST_HANDLE_PARAM(name)    __guest_handle_ ## name
+#define set_xen_guest_handle_raw(hnd, val)                  \
+    do {                                                    \
+        typeof(&(hnd)) _sxghr_tmp = &(hnd);                 \
+        _sxghr_tmp->q = 0;                                  \
+        _sxghr_tmp->p = val;                                \
+    } while ( 0 )
+#define set_xen_guest_handle(hnd, val) set_xen_guest_handle_raw(hnd, val)
+
+#if defined(__GNUC__) && !defined(__STRICT_ANSI__)
+/* Anonymous union includes both 32- and 64-bit names (e.g., r0/x0). */
+# define __DECL_REG(n64, n32) union {          \
+        uint64_t n64;                          \
+        uint32_t n32;                          \
+    }
+#else
+/* Non-gcc sources must always use the proper 64-bit name (e.g., x0). */
+#define __DECL_REG(n64, n32) uint64_t n64
+#endif
+
+struct vcpu_guest_core_regs
+{
+    unsigned long zero;
+    unsigned long ra;
+    unsigned long sp;
+    unsigned long gp;
+    unsigned long tp;
+    unsigned long t0;
+    unsigned long t1;
+    unsigned long t2;
+    unsigned long s0;
+    unsigned long s1;
+    unsigned long a0;
+    unsigned long a1;
+    unsigned long a2;
+    unsigned long a3;
+    unsigned long a4;
+    unsigned long a5;
+    unsigned long a6;
+    unsigned long a7;
+    unsigned long s2;
+    unsigned long s3;
+    unsigned long s4;
+    unsigned long s5;
+    unsigned long s6;
+    unsigned long s7;
+    unsigned long s8;
+    unsigned long s9;
+    unsigned long s10;
+    unsigned long s11;
+    unsigned long t3;
+    unsigned long t4;
+    unsigned long t5;
+    unsigned long t6;
+    unsigned long sepc;
+    unsigned long sstatus;
+    unsigned long hstatus;
+    unsigned long sp_exec;
+
+    unsigned long hedeleg;
+    unsigned long hideleg;
+    unsigned long bsstatus;
+    unsigned long bsie;
+    unsigned long bstvec;
+    unsigned long bsscratch;
+    unsigned long bsepc;
+    unsigned long bscause;
+    unsigned long bstval;
+    unsigned long bsip;
+    unsigned long bsatp;
+};
+typedef struct vcpu_guest_core_regs vcpu_guest_core_regs_t;
+DEFINE_XEN_GUEST_HANDLE(vcpu_guest_core_regs_t);
+
+typedef uint64_t xen_pfn_t;
+#define PRI_xen_pfn PRIx64
+#define PRIu_xen_pfn PRIu64
+
+typedef uint64_t xen_ulong_t;
+#define PRI_xen_ulong PRIx64
+
+#if defined(__XEN__) || defined(__XEN_TOOLS__)
+
+struct vcpu_guest_context {
+};
+typedef struct vcpu_guest_context vcpu_guest_context_t;
+DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
+
+struct xen_arch_domainconfig {
+};
+
+#endif
+
+struct arch_vcpu_info {
+};
+typedef struct arch_vcpu_info arch_vcpu_info_t;
+
+struct arch_shared_info {
+};
+typedef struct arch_shared_info arch_shared_info_t;
+
+typedef uint64_t xen_callback_t;
+
+
+/* Maximum number of virtual CPUs in legacy multi-processor guests. */
+/* Only one. All other VCPUS must use VCPUOP_register_vcpu_info */
+#define XEN_LEGACY_MAX_VCPUS 1
+
+/* Current supported guest VCPUs */
+#define GUEST_MAX_VCPUS 128
+
+#endif /* __ASSEMBLY__ */
+
+#ifndef __ASSEMBLY__
+/* Stub definition of PMU structure */
+typedef struct xen_pmu_arch { uint8_t dummy; } xen_pmu_arch_t;
+#endif
+
+#endif /*  __XEN_PUBLIC_ARCH_RISCV_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/public/arch-riscv/hvm/save.h b/xen/include/public/arch-riscv/hvm/save.h
new file mode 100644
index 0000000000..fa010f0315
--- /dev/null
+++ b/xen/include/public/arch-riscv/hvm/save.h
@@ -0,0 +1,39 @@
+/*
+ * Structure definitions for HVM state that is held by Xen and must
+ * be saved along with the domain's memory and device-model state.
+ *
+ * Copyright (c) 2012 Citrix Systems Ltd.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#ifndef __XEN_PUBLIC_HVM_SAVE_RISCV_H__
+#define __XEN_PUBLIC_HVM_SAVE_RISCV_H__
+
+#endif
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/public/hvm/save.h b/xen/include/public/hvm/save.h
index bea5e9f50f..c0b245596a 100644
--- a/xen/include/public/hvm/save.h
+++ b/xen/include/public/hvm/save.h
@@ -106,6 +106,8 @@ DECLARE_HVM_SAVE_TYPE(END, 0, struct hvm_save_end);
 #include "../arch-x86/hvm/save.h"
 #elif defined(__arm__) || defined(__aarch64__)
 #include "../arch-arm/hvm/save.h"
+#elif defined(__riscv)
+#include "../arch-riscv/hvm/save.h"
 #else
 #error "unsupported architecture"
 #endif
diff --git a/xen/include/public/io/protocols.h b/xen/include/public/io/protocols.h
index 52b4de0f81..b4d71f86c8 100644
--- a/xen/include/public/io/protocols.h
+++ b/xen/include/public/io/protocols.h
@@ -28,6 +28,7 @@
 #define XEN_IO_PROTO_ABI_X86_32     "x86_32-abi"
 #define XEN_IO_PROTO_ABI_X86_64     "x86_64-abi"
 #define XEN_IO_PROTO_ABI_ARM        "arm-abi"
+#define XEN_IO_PROTO_ABI_RISCV      "riscv-abi"
 
 #if defined(__i386__)
 # define XEN_IO_PROTO_ABI_NATIVE XEN_IO_PROTO_ABI_X86_32
@@ -35,6 +36,8 @@
 # define XEN_IO_PROTO_ABI_NATIVE XEN_IO_PROTO_ABI_X86_64
 #elif defined(__arm__) || defined(__aarch64__)
 # define XEN_IO_PROTO_ABI_NATIVE XEN_IO_PROTO_ABI_ARM
+#elif defined(__riscv)
+# define XEN_IO_PROTO_ABI_NATIVE XEN_IO_PROTO_ABI_RISCV
 #else
 # error arch fixup needed here
 #endif
diff --git a/xen/include/public/pmu.h b/xen/include/public/pmu.h
index cc2fcf8816..3fb1bcd900 100644
--- a/xen/include/public/pmu.h
+++ b/xen/include/public/pmu.h
@@ -28,6 +28,8 @@
 #include "arch-x86/pmu.h"
 #elif defined (__arm__) || defined (__aarch64__)
 #include "arch-arm.h"
+#elif defined (__riscv)
+#include "arch-riscv.h"
 #else
 #error "Unsupported architecture"
 #endif
diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
index e373592c33..1d80b64ee0 100644
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -33,6 +33,8 @@
 #include "arch-x86/xen.h"
 #elif defined(__arm__) || defined (__aarch64__)
 #include "arch-arm.h"
+#elif defined(__riscv)
+#include "arch-riscv.h"
 #else
 #error "Unsupported architecture"
 #endif
-- 
2.30.2


