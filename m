Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F58D3802BD
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 06:18:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127190.239017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhPHJ-0003mj-Sw; Fri, 14 May 2021 04:18:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127190.239017; Fri, 14 May 2021 04:18:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhPHJ-0003j7-Ny; Fri, 14 May 2021 04:18:21 +0000
Received: by outflank-mailman (input) for mailman id 127190;
 Fri, 14 May 2021 04:18:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CSkR=KJ=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lhPHH-0003er-Mh
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 04:18:19 +0000
Received: from mail-il1-x134.google.com (unknown [2607:f8b0:4864:20::134])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 85699491-d6b8-4c61-a5c5-239e5970dadc;
 Fri, 14 May 2021 04:17:58 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id w7so8107589ilg.13
 for <xen-devel@lists.xenproject.org>; Thu, 13 May 2021 21:17:58 -0700 (PDT)
Received: from localhost.localdomain (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id g11sm2401505ilq.38.2021.05.13.21.17.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 21:17:55 -0700 (PDT)
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
X-Inumbo-ID: 85699491-d6b8-4c61-a5c5-239e5970dadc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fwwzqx7aNAcHmdpy5K/S5WgbBGtOuN5CLTXXUV7UWpg=;
        b=HI9H8ha1t552U/6traNKVkv3VUhu+cj6bFoxHQGkz/polbf61kMxToCgD2/M4A2a9P
         xOvbctKNG3u/GfRY3JTmmPJUlOKIUW2qae2T1c4vXhmTViI18TP51pSBTrE+ryKv8Jgh
         7hOqbYzJC7/TYUqcJPjvh4vNzgLj0N/9J9hXupM2x4RzjiOZUw+4B/uDe9jFSf1vv9wM
         hpfX6jbIAiwCih+L89DpCu3hrXPXkErmUFOn3+nHd6SnE/lzo5cdCzgmIOPhlD5Sw1Qk
         Yl5idiuHDLZWQPWZOCXK1Z08CQyFrZynuxdlKF7ZeZsj0keI1N7yyRFKveozZkpH4OHw
         1CSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fwwzqx7aNAcHmdpy5K/S5WgbBGtOuN5CLTXXUV7UWpg=;
        b=jMB7t69i2svb0o55GE8RJn1+RmG5TmhP+IALUsC6CrV81sMFnGStsRxae54aykBlLR
         jEfvXLU0g7xvwoEOaDbJrRs8kwA8hnB5bLuVVl/muTcNpYBh1YtrJ4eid9dbLktbrBVM
         9S/WnmxY/wHklos8iPuNe60EYt3k/kYKj0BuXOWdyPZK6g7nqPzzZwFSpsJ/dGT9Q4vK
         jwWEtruPqGE0yb/tf8q1ZkYs+zb98dWnV2on3T1anNRctlxn1xtsDRjBoarFZ9MhOTF4
         O7kRog4gBnE8QVOFWY1pL03NBzK9jVsRpS3fFAfhOw5nrA8jPCGm6p3pFwHriDMSNf9V
         rtYw==
X-Gm-Message-State: AOAM532BurWUc4r9Jb3g0uUodYdCSJ7oy3N7UcaW6PEtBve4pTTzQ8AK
	GnEZF+o6T+wLtvAk9si2ZOcQOfA2utW5Ow==
X-Google-Smtp-Source: ABdhPJx+fJcZVVCrxsnJ9oIOQs9GDEnDIuBa9BERRgVFcoMcVKd9RFqlo9IMgW8xDd6J9bazqwXVUA==
X-Received: by 2002:a92:ce07:: with SMTP id b7mr10748131ilo.94.1620965876282;
        Thu, 13 May 2021 21:17:56 -0700 (PDT)
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
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [PATCH v2 4/5] xen: Add files needed for minimal riscv build
Date: Thu, 13 May 2021 22:17:11 -0600
Message-Id: <c5d130b06de3d724921488387f1743d7996aac11.1620965208.git.connojdavis@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1620965208.git.connojdavis@gmail.com>
References: <cover.1620965208.git.connojdavis@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the minimum code required to get xen to build with
XEN_TARGET_ARCH=riscv64. It is minimal in the sense that every file and
function added is required for a successful build, given the .config
generated from riscv64_defconfig. The function implementations are just
stubs; actual implmentations will need to be added later.

Signed-off-by: Connor Davis <connojdavis@gmail.com>
---
 config/riscv64.mk                        |   7 +
 xen/Makefile                             |   8 +-
 xen/arch/riscv/Kconfig                   |  54 ++++
 xen/arch/riscv/Kconfig.debug             |   0
 xen/arch/riscv/Makefile                  |  57 ++++
 xen/arch/riscv/README.source             |  19 ++
 xen/arch/riscv/Rules.mk                  |  13 +
 xen/arch/riscv/arch.mk                   |   7 +
 xen/arch/riscv/configs/riscv64_defconfig |  12 +
 xen/arch/riscv/delay.c                   |  16 +
 xen/arch/riscv/domain.c                  | 144 +++++++++
 xen/arch/riscv/domctl.c                  |  36 +++
 xen/arch/riscv/guestcopy.c               |  57 ++++
 xen/arch/riscv/head.S                    |   6 +
 xen/arch/riscv/irq.c                     |  78 +++++
 xen/arch/riscv/lib/Makefile              |   1 +
 xen/arch/riscv/lib/find_next_bit.c       | 284 +++++++++++++++++
 xen/arch/riscv/mm.c                      |  93 ++++++
 xen/arch/riscv/p2m.c                     | 144 +++++++++
 xen/arch/riscv/percpu.c                  |  17 +
 xen/arch/riscv/platforms/Kconfig         |  31 ++
 xen/arch/riscv/riscv64/asm-offsets.c     |  31 ++
 xen/arch/riscv/setup.c                   |  27 ++
 xen/arch/riscv/shutdown.c                |  28 ++
 xen/arch/riscv/smp.c                     |  35 +++
 xen/arch/riscv/smpboot.c                 |  34 ++
 xen/arch/riscv/sysctl.c                  |  33 ++
 xen/arch/riscv/time.c                    |  35 +++
 xen/arch/riscv/traps.c                   |  35 +++
 xen/arch/riscv/vm_event.c                |  39 +++
 xen/arch/riscv/xen.lds.S                 | 113 +++++++
 xen/include/asm-riscv/altp2m.h           |  39 +++
 xen/include/asm-riscv/asm.h              |  77 +++++
 xen/include/asm-riscv/asm_defns.h        |  24 ++
 xen/include/asm-riscv/atomic.h           | 204 ++++++++++++
 xen/include/asm-riscv/bitops.h           | 331 ++++++++++++++++++++
 xen/include/asm-riscv/bug.h              |  54 ++++
 xen/include/asm-riscv/byteorder.h        |  16 +
 xen/include/asm-riscv/cache.h            |  24 ++
 xen/include/asm-riscv/cmpxchg.h          | 382 +++++++++++++++++++++++
 xen/include/asm-riscv/compiler_types.h   |  32 ++
 xen/include/asm-riscv/config.h           | 110 +++++++
 xen/include/asm-riscv/cpufeature.h       |  17 +
 xen/include/asm-riscv/csr.h              | 219 +++++++++++++
 xen/include/asm-riscv/current.h          |  47 +++
 xen/include/asm-riscv/debugger.h         |  15 +
 xen/include/asm-riscv/delay.h            |  17 +
 xen/include/asm-riscv/desc.h             |  12 +
 xen/include/asm-riscv/device.h           |  15 +
 xen/include/asm-riscv/div64.h            |  23 ++
 xen/include/asm-riscv/domain.h           |  50 +++
 xen/include/asm-riscv/event.h            |  42 +++
 xen/include/asm-riscv/fence.h            |  12 +
 xen/include/asm-riscv/flushtlb.h         |  34 ++
 xen/include/asm-riscv/grant_table.h      |  12 +
 xen/include/asm-riscv/guest_access.h     |  41 +++
 xen/include/asm-riscv/guest_atomics.h    |  60 ++++
 xen/include/asm-riscv/hardirq.h          |  27 ++
 xen/include/asm-riscv/hypercall.h        |  12 +
 xen/include/asm-riscv/init.h             |  42 +++
 xen/include/asm-riscv/io.h               | 283 +++++++++++++++++
 xen/include/asm-riscv/iocap.h            |  13 +
 xen/include/asm-riscv/iommu.h            |  46 +++
 xen/include/asm-riscv/irq.h              |  58 ++++
 xen/include/asm-riscv/mem_access.h       |   4 +
 xen/include/asm-riscv/mm.h               | 246 +++++++++++++++
 xen/include/asm-riscv/monitor.h          |  65 ++++
 xen/include/asm-riscv/nospec.h           |  25 ++
 xen/include/asm-riscv/numa.h             |  41 +++
 xen/include/asm-riscv/p2m.h              | 218 +++++++++++++
 xen/include/asm-riscv/page-bits.h        |  11 +
 xen/include/asm-riscv/page.h             |  73 +++++
 xen/include/asm-riscv/paging.h           |  15 +
 xen/include/asm-riscv/pci.h              |  31 ++
 xen/include/asm-riscv/percpu.h           |  33 ++
 xen/include/asm-riscv/processor.h        |  59 ++++
 xen/include/asm-riscv/random.h           |   9 +
 xen/include/asm-riscv/regs.h             |  23 ++
 xen/include/asm-riscv/setup.h            |  14 +
 xen/include/asm-riscv/smp.h              |  46 +++
 xen/include/asm-riscv/softirq.h          |  16 +
 xen/include/asm-riscv/spinlock.h         |  12 +
 xen/include/asm-riscv/string.h           |  28 ++
 xen/include/asm-riscv/sysregs.h          |  16 +
 xen/include/asm-riscv/system.h           |  99 ++++++
 xen/include/asm-riscv/time.h             |  31 ++
 xen/include/asm-riscv/trace.h            |  12 +
 xen/include/asm-riscv/types.h            |  60 ++++
 xen/include/asm-riscv/vm_event.h         |  60 ++++
 xen/include/asm-riscv/xenoprof.h         |  12 +
 xen/include/public/arch-riscv.h          | 134 ++++++++
 xen/include/public/arch-riscv/hvm/save.h |  39 +++
 xen/include/public/hvm/save.h            |   2 +
 xen/include/public/pmu.h                 |   2 +
 xen/include/public/xen.h                 |   2 +
 xen/include/xen/domain.h                 |   1 +
 96 files changed, 5321 insertions(+), 2 deletions(-)
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

diff --git a/config/riscv64.mk b/config/riscv64.mk
new file mode 100644
index 0000000000..0ec97838f9
--- /dev/null
+++ b/config/riscv64.mk
@@ -0,0 +1,7 @@
+CONFIG_RISCV := y
+CONFIG_RISCV_64 := y
+CONFIG_RISCV_$(XEN_OS) := y
+
+CONFIG_XEN_INSTALL_SUFFIX :=
+
+CFLAGS +=
diff --git a/xen/Makefile b/xen/Makefile
index 9f3be7766d..60de4cc6cd 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -26,7 +26,9 @@ MAKEFLAGS += -rR
 EFI_MOUNTPOINT ?= $(BOOT_DIR)/efi
 
 ARCH=$(XEN_TARGET_ARCH)
-SRCARCH=$(shell echo $(ARCH) | sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g')
+SRCARCH=$(shell echo $(ARCH) | \
+	  sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
+	      -e s'/riscv.*/riscv/g')
 
 # Don't break if the build process wasn't called from the top level
 # we need XEN_TARGET_ARCH to generate the proper config
@@ -35,7 +37,8 @@ include $(XEN_ROOT)/Config.mk
 # Set ARCH/SUBARCH appropriately.
 export TARGET_SUBARCH  := $(XEN_TARGET_ARCH)
 export TARGET_ARCH     := $(shell echo $(XEN_TARGET_ARCH) | \
-                            sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g')
+                            sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
+			        -e s'/riscv.*/riscv/g')
 
 # Allow someone to change their config file
 export KCONFIG_CONFIG ?= .config
@@ -335,6 +338,7 @@ _clean: delete-unfresh-files
 	$(MAKE) $(clean) xsm
 	$(MAKE) $(clean) crypto
 	$(MAKE) $(clean) arch/arm
+	$(MAKE) $(clean) arch/riscv
 	$(MAKE) $(clean) arch/x86
 	$(MAKE) $(clean) test
 	$(MAKE) -f $(BASEDIR)/tools/kconfig/Makefile.kconfig ARCH=$(ARCH) SRCARCH=$(SRCARCH) clean
diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
new file mode 100644
index 0000000000..1b44564053
--- /dev/null
+++ b/xen/arch/riscv/Kconfig
@@ -0,0 +1,54 @@
+config 64BIT
+	bool
+
+config RISCV_64
+	bool
+	depends on 64BIT
+
+config RISCV
+	def_bool y
+
+config ARCH_DEFCONFIG
+	string
+	default "arch/riscv/configs/riscv64_defconfig" if RISCV_64
+
+menu "Architecture Features"
+
+source "arch/Kconfig"
+
+endmenu
+
+menu "ISA Selection"
+
+choice
+	prompt "Base ISA"
+        default RISCV_ISA_RV64IMA
+        help
+          This selects the base ISA extensions that Xen will target.
+
+config RISCV_ISA_RV64IMA
+	bool "RV64IMA"
+        select 64BIT
+        select RISCV_64
+        help
+           Use the RV64I base ISA, plus the "M" and "A" extensions
+           for integer multiply/divide and atomic instructions, respectively.
+
+endchoice
+
+config RISCV_ISA_C
+	bool "Compressed extension"
+        help
+           Add "C" to the ISA subsets that the toolchain is allowed
+           to emit when building Xen, which results in compressed
+           instructions in the Xen binary.
+
+           If unsure, say N.
+
+endmenu
+
+source "arch/riscv/platforms/Kconfig"
+
+source "common/Kconfig"
+
+source "drivers/Kconfig"
diff --git a/xen/arch/riscv/Kconfig.debug b/xen/arch/riscv/Kconfig.debug
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
new file mode 100644
index 0000000000..bf67c17d1b
--- /dev/null
+++ b/xen/arch/riscv/Makefile
@@ -0,0 +1,57 @@
+obj-y += lib/
+
+obj-y += domain.o
+obj-y += domctl.o
+obj-y += delay.o
+obj-y += guestcopy.o
+obj-y += irq.o
+obj-y += mm.o
+obj-y += p2m.o
+obj-y += percpu.o
+obj-y += setup.o
+obj-y += shutdown.o
+obj-y += smp.o
+obj-y += smpboot.o
+obj-y += sysctl.o
+obj-y += time.o
+obj-y += traps.o
+obj-y += vm_event.o
+
+ALL_OBJS := head.o $(ALL_OBJS)
+
+$(TARGET): $(TARGET)-syms
+	$(OBJCOPY) -O binary -S $< $@
+
+prelink.o: $(ALL_OBJS) $(ALL_LIBS) FORCE
+	$(call if_changed,ld)
+
+targets += prelink.o
+
+$(TARGET)-syms: prelink.o xen.lds
+	$(LD) $(XEN_LDFLAGS) -T xen.lds -N prelink.o \
+	    $(BASEDIR)/common/symbols-dummy.o -o $(@D)/.$(@F).0
+	$(NM) -pa --format=sysv $(@D)/.$(@F).0 \
+		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).0.S
+	$(MAKE) -f $(BASEDIR)/Rules.mk $(@D)/.$(@F).0.o
+	$(LD) $(XEN_LDFLAGS) -T xen.lds -N prelink.o \
+	    $(@D)/.$(@F).0.o -o $(@D)/.$(@F).1
+	$(NM) -pa --format=sysv $(@D)/.$(@F).1 \
+		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).1.S
+	$(MAKE) -f $(BASEDIR)/Rules.mk $(@D)/.$(@F).1.o
+	$(LD) $(XEN_LDFLAGS) -T xen.lds -N prelink.o $(build_id_linker) \
+	    $(@D)/.$(@F).1.o -o $@
+	$(NM) -pa --format=sysv $(@D)/$(@F) \
+		| $(BASEDIR)/tools/symbols --all-symbols --xensyms --sysv --sort \
+		>$(@D)/$(@F).map
+	rm -f $(@D)/.$(@F).[0-9]*
+
+asm-offsets.s: $(TARGET_SUBARCH)/asm-offsets.c
+	$(CC) $(filter-out -flto,$(c_flags)) -S -o $@ $<
+
+xen.lds: xen.lds.S
+	$(CPP) -P $(a_flags) -MQ $@ -o $@ $<
+
+.PHONY: clean
+clean::
+	rm -f asm-offsets.s xen.lds
+	rm -f $(BASEDIR)/.xen-syms.[0-9]*
diff --git a/xen/arch/riscv/README.source b/xen/arch/riscv/README.source
new file mode 100644
index 0000000000..a04e06c5f7
--- /dev/null
+++ b/xen/arch/riscv/README.source
@@ -0,0 +1,19 @@
+External RISCV Sources
+======================
+This documents the files copied from other projects for use in the
+RISCV code of Xen. 
+
+Linux (commit f40ddce88593, Feb. 14 2021)
+=========================================
+The following files were copied from arch/riscv/include/asm to
+xen/include/asm-riscv:
+
+asm.h -> asm.h
+atomic.h -> atomic.h
+bitops.h -> bitops.h
+csr.h -> csr.h
+{mmio,io}.h -> io.h
+fence.h -> fence.h
+cmpxchg.h -> cmpxchg.h
+compiler_types.h -> compiler_types.h
+timex.h -> time.h
diff --git a/xen/arch/riscv/Rules.mk b/xen/arch/riscv/Rules.mk
new file mode 100644
index 0000000000..3c368fa05d
--- /dev/null
+++ b/xen/arch/riscv/Rules.mk
@@ -0,0 +1,13 @@
+########################################
+# RISCV-specific definitions
+
+ifeq ($(CONFIG_RISCV_64),y)
+    c_flags += -mabi=lp64
+    a_flags += -mabi=lp64
+endif
+
+riscv-march-$(CONFIG_RISCV_ISA_RV64IMA) := rv64ima
+riscv-march-$(CONFIG_RISCV_ISA_C)       := $(riscv-march-y)c
+
+c_flags += -march=$(riscv-march-y) -mstrict-align -mcmodel=medany
+a_flags += -march=$(riscv-march-y) -mstrict-align -mcmodel=medany
diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
new file mode 100644
index 0000000000..d5d68c9150
--- /dev/null
+++ b/xen/arch/riscv/arch.mk
@@ -0,0 +1,7 @@
+########################################
+# riscv-specific definitions
+
+CFLAGS += -I$(BASEDIR)/include
+
+$(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
+$(call cc-option-add,CFLAGS,CC,-Wnested-externs)
diff --git a/xen/arch/riscv/configs/riscv64_defconfig b/xen/arch/riscv/configs/riscv64_defconfig
new file mode 100644
index 0000000000..664a5d2378
--- /dev/null
+++ b/xen/arch/riscv/configs/riscv64_defconfig
@@ -0,0 +1,12 @@
+# CONFIG_SCHED_CREDIT is not set
+# CONFIG_SCHED_RTDS is not set
+# CONFIG_SCHED_NULL is not set
+# CONFIG_SCHED_ARINC653 is not set
+# CONFIG_TRACEBUFFER is not set
+# CONFIG_DEBUG is not set
+# CONFIG_DEBUG_INFO is not set
+# CONFIG_HYPFS is not set
+# CONFIG_GRANT_TABLE is not set
+# CONFIG_SPECULATIVE_HARDEN_ARRAY is not set
+
+CONFIG_EXPERT=y
diff --git a/xen/arch/riscv/delay.c b/xen/arch/riscv/delay.c
new file mode 100644
index 0000000000..403b139b96
--- /dev/null
+++ b/xen/arch/riscv/delay.c
@@ -0,0 +1,16 @@
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
+void udelay(unsigned long usecs)
+{
+}
+EXPORT_SYMBOL(udelay);
diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
new file mode 100644
index 0000000000..a9fdb1f94f
--- /dev/null
+++ b/xen/arch/riscv/domain.c
@@ -0,0 +1,144 @@
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
+#include <xen/errno.h>
+#include <xen/sched.h>
+#include <xen/domain.h>
+#include <public/domctl.h>
+#include <public/xen.h>
+
+DEFINE_PER_CPU(struct vcpu *, curr_vcpu);
+
+void context_switch(struct vcpu *prev, struct vcpu *next)
+{
+}
+
+void continue_running(struct vcpu *same)
+{
+}
+
+void sync_local_execstate(void)
+{
+}
+
+void sync_vcpu_execstate(struct vcpu *v)
+{
+}
+
+unsigned long hypercall_create_continuation(
+    unsigned int op, const char *format, ...)
+{
+
+    return 0;
+}
+
+struct domain *alloc_domain_struct(void)
+{
+    return 0;
+}
+
+void free_domain_struct(struct domain *d)
+{
+}
+
+void dump_pageframe_info(struct domain *d)
+{
+}
+
+int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
+{
+    return -EOPNOTSUPP;
+}
+
+
+int arch_domain_create(struct domain *d,
+                       struct xen_domctl_createdomain *config)
+{
+    return -EOPNOTSUPP;
+}
+
+void arch_domain_destroy(struct domain *d)
+{
+}
+
+void arch_domain_shutdown(struct domain *d)
+{
+}
+
+void arch_domain_pause(struct domain *d)
+{
+}
+
+void arch_domain_unpause(struct domain *d)
+{
+}
+
+int arch_domain_soft_reset(struct domain *d)
+{
+    return -EOPNOTSUPP;
+}
+
+void arch_domain_creation_finished(struct domain *d)
+{
+}
+
+int domain_relinquish_resources(struct domain *d)
+{
+    return -EOPNOTSUPP;
+}
+
+void arch_dump_domain_info(struct domain *d)
+{
+}
+
+long arch_do_vcpu_op(int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
+{
+    return -EOPNOTSUPP;
+}
+
+void arch_dump_vcpu_info(struct vcpu *v)
+{
+}
+
+int arch_set_info_guest(
+    struct vcpu *v, vcpu_guest_context_u c)
+{
+    return -EOPNOTSUPP;
+}
+
+struct vcpu *alloc_vcpu_struct(const struct domain *d)
+{
+    return 0;
+}
+
+void free_vcpu_struct(struct vcpu *v)
+{
+}
+
+int arch_initialise_vcpu(struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
+{
+    return -EOPNOTSUPP;
+}
+
+int arch_vcpu_reset(struct vcpu *v)
+{
+    return -EOPNOTSUPP;
+}
+
+int arch_vcpu_create(struct vcpu *v)
+{
+    return -EOPNOTSUPP;
+}
+
+void arch_vcpu_destroy(struct vcpu *v)
+{
+}
diff --git a/xen/arch/riscv/domctl.c b/xen/arch/riscv/domctl.c
new file mode 100644
index 0000000000..f81a13a9c4
--- /dev/null
+++ b/xen/arch/riscv/domctl.c
@@ -0,0 +1,36 @@
+/******************************************************************************
+ * Arch-specific domctl.c
+ *
+ * Copyright (c) 2012, Citrix Systems
+ */
+
+#include <xen/errno.h>
+#include <xen/guest_access.h>
+#include <xen/hypercall.h>
+#include <xen/sched.h>
+#include <public/domctl.h>
+
+void arch_get_domain_info(const struct domain *d,
+                          struct xen_domctl_getdomaininfo *info)
+{
+}
+
+long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
+                    XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
+{
+    return -EOPNOTSUPP;
+}
+
+void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
+{
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
index 0000000000..d8fcf98a0e
--- /dev/null
+++ b/xen/arch/riscv/guestcopy.c
@@ -0,0 +1,57 @@
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
+#include <asm/guest_access.h>
+
+unsigned long raw_copy_to_guest(void *to, const void *from, unsigned len)
+{
+    return -EOPNOTSUPP;
+}
+
+unsigned long raw_copy_to_guest_flush_dcache(void *to, const void *from,
+                                             unsigned len)
+{
+    return -EOPNOTSUPP;
+}
+
+unsigned long raw_clear_guest(void *to, unsigned len)
+{
+    return -EOPNOTSUPP;
+}
+
+unsigned long raw_copy_from_guest(void *to, const void __user *from, unsigned len)
+{
+    return -EOPNOTSUPP;
+}
+
+unsigned long copy_to_guest_phys_flush_dcache(struct domain *d,
+                                              paddr_t gpa,
+                                              void *buf,
+                                              unsigned int len)
+{
+    return -EOPNOTSUPP;
+}
+
+int access_guest_memory_by_ipa(struct domain *d, paddr_t gpa, void *buf,
+                               uint32_t size, bool is_write)
+{
+    return -EOPNOTSUPP;
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
diff --git a/xen/arch/riscv/head.S b/xen/arch/riscv/head.S
new file mode 100644
index 0000000000..0dbc27ba75
--- /dev/null
+++ b/xen/arch/riscv/head.S
@@ -0,0 +1,6 @@
+#include <asm/config.h>
+
+        .text
+
+ENTRY(start)
+        j  start
diff --git a/xen/arch/riscv/irq.c b/xen/arch/riscv/irq.c
new file mode 100644
index 0000000000..65137e5f11
--- /dev/null
+++ b/xen/arch/riscv/irq.c
@@ -0,0 +1,78 @@
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
+
+const unsigned int nr_irqs = NR_IRQS;
+
+static void ack_none(struct irq_desc *irq)
+{
+}
+
+static void end_none(struct irq_desc *irq)
+{
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
+    return -EOPNOTSUPP;
+}
+
+struct pirq *alloc_pirq_struct(struct domain *d)
+{
+    return NULL;
+}
+
+irq_desc_t *__irq_to_desc(int irq)
+{
+    return NULL;
+}
+
+int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
+{
+    return -EOPNOTSUPP;
+}
+
+void pirq_guest_unbind(struct domain *d, struct pirq *pirq)
+{
+}
+
+void pirq_set_affinity(struct domain *d, int pirq, const cpumask_t *mask)
+{
+}
+
+void smp_send_state_dump(unsigned int cpu)
+{
+}
+
+void arch_move_irqs(struct vcpu *v)
+{
+}
+
+int setup_irq(unsigned int irq, unsigned int irqflags, struct irqaction *new)
+{
+    return -EOPNOTSUPP;
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
index 0000000000..adaa25f32b
--- /dev/null
+++ b/xen/arch/riscv/lib/find_next_bit.c
@@ -0,0 +1,284 @@
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
+	return result + ffs(tmp);
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
index 0000000000..72322b9adc
--- /dev/null
+++ b/xen/arch/riscv/mm.c
@@ -0,0 +1,93 @@
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
+#include <xen/compile.h>
+#include <xen/types.h>
+#include <xen/init.h>
+#include <xen/mm.h>
+
+unsigned long max_page;
+unsigned long total_pages;
+unsigned long frametable_base_mfn;
+
+void flush_page_to_ram(unsigned long mfn, bool sync_icache)
+{
+}
+
+void arch_dump_shared_mem_info(void)
+{
+}
+
+int steal_page(struct domain *d, struct page_info *page, unsigned int memflags)
+{
+    return 0;
+}
+
+int page_is_ram_type(unsigned long mfn, unsigned long mem_type)
+{
+    return 0;
+}
+
+unsigned long domain_get_maximum_gpfn(struct domain *d)
+{
+    return 0;
+}
+
+int xenmem_add_to_physmap_one(struct domain *d, unsigned int space,
+                              union add_to_physmap_extra extra,
+                              unsigned long idx, gfn_t gfn)
+{
+    return 0;
+}
+
+long arch_memory_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg)
+{
+    return 0;
+}
+
+struct domain *page_get_owner_and_reference(struct page_info *page)
+{
+    return (void *) 0xdeadbeef;
+}
+
+void put_page(struct page_info *page)
+{
+}
+
+bool get_page(struct page_info *page, const struct domain *domain)
+{
+    return false;
+}
+
+int get_page_type(struct page_info *page, unsigned long type)
+{
+    return 0;
+}
+
+void put_page_type(struct page_info *page)
+{
+    return;
+}
+
+unsigned long get_upper_mfn_bound(void)
+{
+    return -1;
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
index 0000000000..91b86a2bc7
--- /dev/null
+++ b/xen/arch/riscv/p2m.c
@@ -0,0 +1,144 @@
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
+#include <xen/sched.h>
+
+#define INVALID_VMID 0 /* VMID 0 is reserved */
+
+void p2m_write_unlock(struct p2m_domain *p2m)
+{
+}
+
+void p2m_dump_info(struct domain *d)
+{
+}
+
+void memory_type_changed(struct domain *d)
+{
+}
+
+void dump_p2m_lookup(struct domain *d, paddr_t addr)
+{
+}
+
+void p2m_save_state(struct vcpu *p)
+{
+}
+
+void p2m_restore_state(struct vcpu *n)
+{
+}
+
+mfn_t gfn_to_mfn(struct domain *d, gfn_t gfn)
+{
+    return _mfn(gfn_x(gfn));
+}
+
+int p2m_set_entry(struct p2m_domain *p2m,
+                  gfn_t sgfn,
+                  unsigned long nr,
+                  mfn_t smfn,
+                  p2m_type_t t,
+                  p2m_access_t a)
+{
+    int rc = 0;
+
+
+    return rc;
+}
+
+mfn_t p2m_lookup(struct domain *d, gfn_t gfn, p2m_type_t *t)
+{
+    return _mfn(gfn_x(gfn));
+}
+
+mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
+                    p2m_type_t *t, p2m_access_t *a,
+                    unsigned int *page_order,
+                    bool *valid)
+{
+    return _mfn(gfn_x(gfn));
+}
+
+void p2m_tlb_flush_sync(struct p2m_domain *p2m)
+{
+}
+
+int map_regions_p2mt(struct domain *d,
+                     gfn_t gfn,
+                     unsigned long nr,
+                     mfn_t mfn,
+                     p2m_type_t p2mt)
+{
+    return 0;
+}
+
+int unmap_regions_p2mt(struct domain *d,
+                       gfn_t gfn,
+                       unsigned long nr,
+                       mfn_t mfn)
+{
+    return 0;
+}
+
+int map_mmio_regions(struct domain *d,
+                     gfn_t start_gfn,
+                     unsigned long nr,
+                     mfn_t mfn)
+{
+    return 0;
+}
+
+int unmap_mmio_regions(struct domain *d,
+                       gfn_t start_gfn,
+                       unsigned long nr,
+                       mfn_t mfn)
+{
+    return 0;
+}
+
+int map_dev_mmio_region(struct domain *d,
+                        gfn_t gfn,
+                        unsigned long nr,
+                        mfn_t mfn)
+{
+    return 0;
+}
+
+int guest_physmap_add_entry(struct domain *d,
+                            gfn_t gfn,
+                            mfn_t mfn,
+                            unsigned long page_order,
+                            p2m_type_t t)
+{
+    return 0;
+}
+
+int set_foreign_p2m_entry(struct domain *d, const struct domain *fd,
+                          unsigned long gfn, mfn_t mfn)
+{
+    return 0;
+}
+
+struct page_info *p2m_get_page_from_gfn(struct domain *d, gfn_t gfn,
+                                        p2m_type_t *t)
+{
+    return NULL;
+}
+
+void vcpu_mark_events_pending(struct vcpu *v)
+{
+}
+
+void vcpu_update_evtchn_irq(struct vcpu *v)
+{
+}
diff --git a/xen/arch/riscv/percpu.c b/xen/arch/riscv/percpu.c
new file mode 100644
index 0000000000..31c0cce606
--- /dev/null
+++ b/xen/arch/riscv/percpu.c
@@ -0,0 +1,17 @@
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
+#include <xen/percpu.h>
+#include <xen/cpu.h>
+#include <xen/init.h>
+
+unsigned long __per_cpu_offset[NR_CPUS];
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
diff --git a/xen/arch/riscv/riscv64/asm-offsets.c b/xen/arch/riscv/riscv64/asm-offsets.c
new file mode 100644
index 0000000000..994d5f60c9
--- /dev/null
+++ b/xen/arch/riscv/riscv64/asm-offsets.c
@@ -0,0 +1,31 @@
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
+#include <asm/init.h>
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
+   BLANK();
+   OFFSET(INITINFO_stack, struct init_info, stack);
+}
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
new file mode 100644
index 0000000000..129e3db58f
--- /dev/null
+++ b/xen/arch/riscv/setup.c
@@ -0,0 +1,27 @@
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
+#include <xen/types.h>
+#include <public/version.h>
+
+void arch_get_xen_caps(xen_capabilities_info_t *info)
+{
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
diff --git a/xen/arch/riscv/shutdown.c b/xen/arch/riscv/shutdown.c
new file mode 100644
index 0000000000..bfa1174366
--- /dev/null
+++ b/xen/arch/riscv/shutdown.c
@@ -0,0 +1,28 @@
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
+void machine_halt(void)
+{
+}
+
+void machine_restart(unsigned int delay_millisecs)
+{
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
index 0000000000..66f1012b37
--- /dev/null
+++ b/xen/arch/riscv/smp.c
@@ -0,0 +1,35 @@
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
+#include <xen/cpumask.h>
+#include <asm/smp.h>
+
+void arch_flush_tlb_mask(const cpumask_t *mask)
+{
+}
+
+void smp_send_event_check_mask(const cpumask_t *mask)
+{
+}
+
+void smp_send_call_function_mask(const cpumask_t *mask)
+{
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
index 0000000000..567d12a262
--- /dev/null
+++ b/xen/arch/riscv/smpboot.c
@@ -0,0 +1,34 @@
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
+struct init_info init_data = {};
diff --git a/xen/arch/riscv/sysctl.c b/xen/arch/riscv/sysctl.c
new file mode 100644
index 0000000000..9b4ef27aac
--- /dev/null
+++ b/xen/arch/riscv/sysctl.c
@@ -0,0 +1,33 @@
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
+void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
+{
+}
+
+long arch_do_sysctl(struct xen_sysctl *sysctl,
+                    XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
+{
+    return -EOPNOTSUPP;
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
index 0000000000..4d7269195d
--- /dev/null
+++ b/xen/arch/riscv/time.c
@@ -0,0 +1,35 @@
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
+#include <xen/sched.h>
+#include <xen/time.h>
+
+unsigned long __read_mostly cpu_khz;  /* CPU clock frequency in kHz. */
+
+s_time_t get_s_time(void)
+{
+    return 0;
+}
+
+/* VCPU PV timers. */
+void send_timer_event(struct vcpu *v)
+{
+}
+
+void domain_set_time_offset(struct domain *d, int64_t time_offset_seconds)
+{
+}
+
+int reprogram_timer(s_time_t timeout)
+{
+    return 0;
+}
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
new file mode 100644
index 0000000000..5287894954
--- /dev/null
+++ b/xen/arch/riscv/traps.c
@@ -0,0 +1,35 @@
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
+#include <public/xen.h>
+#include <xen/multicall.h>
+#include <xen/sched.h>
+#include <asm/processor.h>
+
+void show_execution_state(const struct cpu_user_regs *regs)
+{
+}
+
+void vcpu_show_execution_state(struct vcpu *v)
+{
+}
+
+void arch_hypercall_tasklet_result(struct vcpu *v, long res)
+{
+}
+
+enum mc_disposition arch_do_multicall_call(struct mc_state *state)
+{
+    return mc_continue;
+}
diff --git a/xen/arch/riscv/vm_event.c b/xen/arch/riscv/vm_event.c
new file mode 100644
index 0000000000..6c759f85a6
--- /dev/null
+++ b/xen/arch/riscv/vm_event.c
@@ -0,0 +1,39 @@
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
+}
+
+void vm_event_set_registers(struct vcpu *v, vm_event_response_t *rsp)
+{
+}
+
+void vm_event_monitor_next_interrupt(struct vcpu *v)
+{
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
index 0000000000..6b95fc84da
--- /dev/null
+++ b/xen/arch/riscv/xen.lds.S
@@ -0,0 +1,113 @@
+/* Excerpts written by Martin Mares <mj@atrey.karlin.mff.cuni.cz> */
+/* Modified for i386/x86-64 Xen by Keir Fraser */
+/* Modified for ARM Xen by Ian Campbell */
+
+#include <xen/cache.h>
+#include <asm/page.h>
+#undef ENTRY
+#undef ALIGN
+
+ENTRY(start)
+OUTPUT_ARCH(riscv)
+
+PHDRS
+{
+  text PT_LOAD ;
+#if defined(BUILD_ID)
+  note PT_NOTE ;
+#endif
+}
+SECTIONS
+{
+  . = XEN_VIRT_START;
+  _start = .;
+  .text : {
+        _stext = .;            /* Text section */
+       *(.text)
+       *(.text.cold)
+       *(.text.unlikely)
+       *(.fixup)
+       *(.gnu.warning)
+       _etext = .;             /* End of text section */
+  } :text = 0x9090
+
+  . = ALIGN(PAGE_SIZE);
+  .rodata : {
+        _srodata = .;          /* Read-only data */
+        /* Bug frames table */
+       __start_bug_frames = .;
+       *(.bug_frames.0)
+       __stop_bug_frames_0 = .;
+       *(.bug_frames.1)
+       __stop_bug_frames_1 = .;
+       *(.bug_frames.2)
+       __stop_bug_frames_2 = .;
+       *(.bug_frames.3)
+       __stop_bug_frames_3 = .;
+       *(.rodata)
+       *(.rodata.*)
+       *(.data.rel.ro)
+       *(.data.rel.ro.*)
+  } :text
+
+#if defined(BUILD_ID)
+  . = ALIGN(4);
+  .note.gnu.build-id : {
+       __note_gnu_build_id_start = .;
+       *(.note.gnu.build-id)
+       __note_gnu_build_id_end = .;
+  } :note :text
+#endif
+  _erodata = .;                /* End of read-only data */
+
+  .data : {                    /* Data */
+       . = ALIGN(PAGE_SIZE);
+       *(.data.page_aligned)
+       *(.data)
+
+       . = ALIGN(8);
+       __start_schedulers_array = .;
+       *(.data.schedulers)
+       __end_schedulers_array = .;
+
+       *(.data.rel)
+       *(.data.rel.*)
+       CONSTRUCTORS
+  } :text
+
+  . = ALIGN(SMP_CACHE_BYTES);
+  .data.read_mostly : {
+       *(.data.read_mostly)
+  } :text
+
+  . = ALIGN(PAGE_SIZE);        /* Init code and data */
+  __init_begin = .;
+  .init.text : {
+       _sinittext = .;
+       *(.init.text)
+       _einittext = .;
+  } :text
+  . = ALIGN(PAGE_SIZE);
+  .init.data : {
+       *(.init.rodata)
+       *(.init.rodata.*)
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
+       *(.init.data)
+       *(.init.data.rel)
+       *(.init.data.rel.*)
+  } :text
+  . = ALIGN(STACK_SIZE);
+  __init_end = .;
+  _end = . ;
+}
diff --git a/xen/include/asm-riscv/altp2m.h b/xen/include/asm-riscv/altp2m.h
new file mode 100644
index 0000000000..8554495f94
--- /dev/null
+++ b/xen/include/asm-riscv/altp2m.h
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
diff --git a/xen/include/asm-riscv/asm.h b/xen/include/asm-riscv/asm.h
new file mode 100644
index 0000000000..2dafac5b35
--- /dev/null
+++ b/xen/include/asm-riscv/asm.h
@@ -0,0 +1,77 @@
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
+#define REG_SC		__REG_SEL(sc.d, sc.w)
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
diff --git a/xen/include/asm-riscv/asm_defns.h b/xen/include/asm-riscv/asm_defns.h
new file mode 100644
index 0000000000..9145f9cbf1
--- /dev/null
+++ b/xen/include/asm-riscv/asm_defns.h
@@ -0,0 +1,24 @@
+#ifndef __RISCV_ASM_DEFNS_H__
+#define __RISCV_ASM_DEFNS_H__
+
+#ifndef COMPILE_OFFSETS
+/* NB. Auto-generated from arch/.../asm-offsets.c */
+#include <asm/asm-offsets.h>
+#endif
+#include <asm/processor.h>
+
+#define ASM_INT(label, val)                 \
+    .p2align 2;                             \
+label: .long (val);                         \
+    .size label, . - label;                 \
+    .type label, @object
+
+#endif /* __RISCV_ASM_DEFNS_H__ */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/asm-riscv/atomic.h b/xen/include/asm-riscv/atomic.h
new file mode 100644
index 0000000000..7ffae3bd74
--- /dev/null
+++ b/xen/include/asm-riscv/atomic.h
@@ -0,0 +1,204 @@
+/**
+ * Copyright (c) 2018 Anup Patel.
+ * Copyright (c) 2019 Alistair Francis <alistair.francis@wdc.com>
+ * Copyright (c) 2021 Connor Davis <connojd@pm.me>
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
+ */
+
+#ifndef _ASM_RISCV_ATOMIC_H
+#define _ASM_RISCV_ATOMIC_H
+
+#include <xen/atomic.h>
+#include <asm/compiler_types.h>
+#include <asm/cmpxchg.h>
+#include <asm/system.h>
+
+void __bad_atomic_size(void);
+
+/*
+ * Adapted from {READ,WRITE}_ONCE in linux/include/asm-generic/rwonce.h,
+ * with the exception of only allowing types with size at most sizeof(long).
+ * Linux allows sizes <= sizeof(long long), but long long's will tear on
+ * RV32, so we exclude them.
+ */
+#define read_atomic(p) ({                                        \
+    BUILD_BUG_ON(!__native_word(typeof(*(p))));                  \
+    (*(const volatile __unqual_scalar_typeof(*(p)) *)(p));       \
+})
+
+#define write_atomic(p, x)                                       \
+do {						                 \
+    BUILD_BUG_ON(!__native_word(typeof(*(p))));                  \
+    *(volatile typeof(*(p)) *)(p) = (x);                         \
+} while (0)
+
+#define build_add_sized(name, size, type)                        \
+static inline void name(volatile type *addr, type val)           \
+{                                                                \
+    type t;                                                      \
+    asm volatile("l" size "u %1, %0\n"                           \
+                 "add %1, %1, %2\n"                              \
+                 "s" size " %1, %0\n"                            \
+                 : "+m" (*addr), "=&r" (t)                       \
+                 : "r" (val));                                   \
+}
+
+build_add_sized(add_u8_sized, "b", uint8_t)
+build_add_sized(add_u16_sized, "h", uint16_t)
+build_add_sized(add_u32_sized, "w", uint32_t)
+
+#define add_sized(p, x) ({                                \
+    typeof(*(p)) x_ = (x);                                \
+    switch ( sizeof(*(p)) )                               \
+    {                                                     \
+    case 1: add_u8_sized((uint8_t *)(p), x_); break;      \
+    case 2: add_u16_sized((uint16_t *)(p), x_); break;    \
+    case 4: add_u32_sized((uint32_t *)(p), x_); break;    \
+    default: __bad_atomic_size(); break;                  \
+    }                                                     \
+})
+
+/*
+ * Snipped from linux/arch/riscv/include/asm/atomic.h:
+ *
+ * First, the atomic ops that have no ordering constraints and therefor don't
+ * have the AQ or RL bits set.  These don't return anything, so there's only
+ * one version to worry about.
+ */
+#define ATOMIC_OP(op, asm_op, I)                              		\
+static always_inline void atomic_##op(int i, atomic_t *v)               \
+{									\
+	__asm__ __volatile__ (						\
+		"	amo" #asm_op ".w" " zero, %1, %0"	        \
+		: "+A" (v->counter)					\
+		: "r" (I)						\
+		: "memory");						\
+}									\
+
+ATOMIC_OP(add, add,  i)
+ATOMIC_OP(sub, add, -i)
+ATOMIC_OP(and, and,  i)
+
+#undef ATOMIC_OP
+
+/* The *_return variants provide full barriers */
+#define ATOMIC_OP_RETURN(op, asm_op, c_op, I)                   	\
+static always_inline int atomic_fetch_##op(int i, atomic_t *v)	        \
+{									\
+	register int ret;						\
+	__asm__ __volatile__ (						\
+		"	amo" #asm_op ".w.aqrl  %1, %2, %0"      	\
+		: "+A" (v->counter), "=r" (ret)				\
+		: "r" (I)						\
+		: "memory");						\
+	return ret;							\
+}                                                                       \
+static always_inline int atomic_##op##_return(int i, atomic_t *v)	\
+{									\
+        return atomic_fetch_##op(i, v) c_op I;          		\
+}
+
+ATOMIC_OP_RETURN(add, add, +,  i)
+ATOMIC_OP_RETURN(sub, add, +, -i)
+
+#undef ATOMIC_OP_RETURN
+
+static inline int atomic_read(const atomic_t *v)
+{
+    return read_atomic(&v->counter);
+}
+
+static inline int _atomic_read(atomic_t v)
+{
+    return v.counter;
+}
+
+static inline void atomic_set(atomic_t *v, int i)
+{
+    write_atomic(&v->counter, i);
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
+static inline int atomic_inc_and_test(atomic_t *v)
+{
+    return atomic_add_return(1, v) == 0;
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
+static inline int atomic_cmpxchg(atomic_t *v, int old, int new)
+{
+	return cmpxchg(&v->counter, old, new);
+}
+
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
+
+#endif /* _ASM_RISCV_ATOMIC_H */
diff --git a/xen/include/asm-riscv/bitops.h b/xen/include/asm-riscv/bitops.h
new file mode 100644
index 0000000000..f2f6f63b03
--- /dev/null
+++ b/xen/include/asm-riscv/bitops.h
@@ -0,0 +1,331 @@
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
+#define BITS_PER_WORD           32
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
+        const volatile unsigned int *addr = (const volatile unsigned int *)p;
+
+        return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_WORD-1)));
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
+#ifdef CONFIG_GENERIC_FIND_FIRST_BIT
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
+#else /* CONFIG_GENERIC_FIND_FIRST_BIT */
+
+#define find_first_bit(addr, size) find_next_bit((addr), (size), 0)
+#define find_first_zero_bit(addr, size) find_next_zero_bit((addr), (size), 0)
+
+#endif /* CONFIG_GENERIC_FIND_FIRST_BIT */
+
+#define ffs(x) ({ unsigned int __t = (x); fls(__t & -__t); })
+#define ffsl(x) ({ unsigned long __t = (x); flsl(__t & -__t); })
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
diff --git a/xen/include/asm-riscv/bug.h b/xen/include/asm-riscv/bug.h
new file mode 100644
index 0000000000..cdf4c0ebd4
--- /dev/null
+++ b/xen/include/asm-riscv/bug.h
@@ -0,0 +1,54 @@
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
+#ifndef _ASM_RISCV_BUG_H
+#define _ASM_RISCV_BUG_H
+
+#define BUGFRAME_NR     4
+
+#ifndef __ASSEMBLY__
+
+struct bug_frame {
+    signed int loc_disp;    /* Relative address to the bug address */
+    signed int file_disp;   /* Relative address to the filename */
+    signed int msg_disp;    /* Relative address to the predicate (for ASSERT) */
+    uint16_t line;          /* Line number */
+    uint32_t pad0:16;       /* Padding for 8-bytes align */
+};
+
+#define BUG()							\
+do {								\
+    __asm__ __volatile__ ("ebreak\n");			        \
+    unreachable();						\
+} while (0)
+
+#define WARN()                                                  \
+do {                                                            \
+    BUG();                                                      \
+} while (0)
+
+#define assert_failed(msg) do {                                 \
+    BUG();                                                      \
+} while (0)
+
+#define run_in_exception_handler(fn) BUG()
+
+extern const struct bug_frame __start_bug_frames[],
+                              __stop_bug_frames_0[],
+                              __stop_bug_frames_1[],
+                              __stop_bug_frames_2[],
+                              __stop_bug_frames_3[];
+
+#endif /* !__ASSEMBLY__ */
+
+#endif /* _ASM_RISCV_BUG_H */
diff --git a/xen/include/asm-riscv/byteorder.h b/xen/include/asm-riscv/byteorder.h
new file mode 100644
index 0000000000..320a03c88f
--- /dev/null
+++ b/xen/include/asm-riscv/byteorder.h
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
diff --git a/xen/include/asm-riscv/cache.h b/xen/include/asm-riscv/cache.h
new file mode 100644
index 0000000000..394782ca8e
--- /dev/null
+++ b/xen/include/asm-riscv/cache.h
@@ -0,0 +1,24 @@
+/*
+ * Copyright (C) 2017 Chen Liqin <liqin.chen@sunplusct.com>
+ * Copyright (C) 2012 Regents of the University of California
+ * Copyright (C) 2021 Connor Davis <connojd@pm.me>
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
+#define L1_CACHE_SHIFT		CONFIG_RISCV_L1_CACHE_SHIFT
+#define L1_CACHE_BYTES		(1 << L1_CACHE_SHIFT)
+
+#define __read_mostly __section(".data.read_mostly")
+
+#endif /* _ASM_RISCV_CACHE_H */
diff --git a/xen/include/asm-riscv/cmpxchg.h b/xen/include/asm-riscv/cmpxchg.h
new file mode 100644
index 0000000000..b7113fa546
--- /dev/null
+++ b/xen/include/asm-riscv/cmpxchg.h
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
+	__typeof__(*(ptr)) __ret = 0;					\
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
+	__typeof__(*(ptr)) __ret = 0;					\
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
+	__typeof__(*(ptr)) __ret = 0;					\
+	register unsigned int __rc = 0;					\
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
+	__typeof__(*(ptr)) __old = (__typeof__(*(ptr)))(old);		\
+	__typeof__(*(ptr)) __new = (__typeof__(*(ptr)))(new);	        \
+	__typeof__(*(ptr)) __ret = 0;					\
+	register unsigned int __rc = 0;					\
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
diff --git a/xen/include/asm-riscv/compiler_types.h b/xen/include/asm-riscv/compiler_types.h
new file mode 100644
index 0000000000..dbe4a8bbff
--- /dev/null
+++ b/xen/include/asm-riscv/compiler_types.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __LINUX_COMPILER_TYPES_H
+#define __LINUX_COMPILER_TYPES_H
+
+/*
+ * __unqual_scalar_typeof(x) - Declare an unqualified scalar type, leaving
+ *			       non-scalar types unchanged.
+ */
+/*
+ * Prefer C11 _Generic for better compile-times and simpler code. Note: 'char'
+ * is not type-compatible with 'signed char', and we define a separate case.
+ */
+#define __scalar_type_to_expr_cases(type)				\
+		unsigned type:	(unsigned type)0,			\
+		signed type:	(signed type)0
+
+#define __unqual_scalar_typeof(x) typeof(				\
+		_Generic((x),						\
+			 char:	(char)0,				\
+			 __scalar_type_to_expr_cases(char),		\
+			 __scalar_type_to_expr_cases(short),		\
+			 __scalar_type_to_expr_cases(int),		\
+			 __scalar_type_to_expr_cases(long),		\
+			 __scalar_type_to_expr_cases(long long),	\
+			 default: (x)))
+
+/* Is this type a native word size -- useful for atomic operations */
+#define __native_word(t) \
+	(sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
+	 sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
+
+#endif /* __LINUX_COMPILER_TYPES_H */
diff --git a/xen/include/asm-riscv/config.h b/xen/include/asm-riscv/config.h
new file mode 100644
index 0000000000..84cb436dc1
--- /dev/null
+++ b/xen/include/asm-riscv/config.h
@@ -0,0 +1,110 @@
+/******************************************************************************
+ * config.h
+ *
+ * A Linux-style configuration list.
+ */
+
+#ifndef __RISCV_CONFIG_H__
+#define __RISCV_CONFIG_H__
+
+#if defined(CONFIG_RISCV_64)
+# define LONG_BYTEORDER 3
+# define ELFSIZE 64
+#else
+# error "Unsupported RISCV variant"
+#endif
+
+#define BYTES_PER_LONG (1 << LONG_BYTEORDER)
+#define BITS_PER_LONG  (BYTES_PER_LONG << 3)
+#define POINTER_ALIGN  BYTES_PER_LONG
+
+#define BITS_PER_LLONG 64
+
+/* xen_ulong_t is always 64 bits */
+#define BITS_PER_XEN_ULONG 64
+
+#define CONFIG_RISCV 1
+#define CONFIG_RISCV_L1_CACHE_SHIFT 6
+
+#define CONFIG_PAGEALLOC_MAX_ORDER 18
+#define CONFIG_DOMU_MAX_ORDER      9
+#define CONFIG_HWDOM_MAX_ORDER     10
+
+#define OPT_CONSOLE_STR "dtuart"
+
+#ifdef CONFIG_RISCV_64
+#define MAX_VIRT_CPUS 128u
+#else
+#error "Unsupported RISCV variant"
+#endif
+
+#define INVALID_VCPU_ID MAX_VIRT_CPUS
+
+/* Linkage for RISCV */
+#ifdef __ASSEMBLY__
+#define ALIGN .align 2
+
+#define ENTRY(name)                                \
+  .globl name;                                     \
+  ALIGN;                                           \
+  name:
+#endif
+
+#include <xen/const.h>
+
+#ifdef CONFIG_RISCV_64
+
+/*
+ * RISC-V Layout:
+ *   0x0000000000000000 - 0x0000003fffffffff (256GB, L2 slots [0-255])
+ *     Unmapped
+ *   0x0000004000000000 - 0xffffffbfffffffff
+ *     Inaccessible: sv39 only supports 39-bit sign-extended VAs.
+ *   0xffffffc000000000 - 0xffffffc0001fffff (2MB, L2 slot [256])
+ *     Unmapped
+ *   0xffffffc000200000 - 0xffffffc0003fffff (2MB, L2 slot [256])
+ *     Xen text, data, bss
+ *   0xffffffc000400000 - 0xffffffc0005fffff (2MB, L2 slot [256])
+ *     Fixmap: special-purpose 4K mapping slots
+ *   0xffffffc000600000 - 0xffffffc0009fffff (4MB, L2 slot [256])
+ *     Early boot mapping of FDT
+ *   0xffffffc000a00000 - 0xffffffc000bfffff (2MB, L2 slot [256])
+ *     Early relocation address, used when relocating Xen and later
+ *     for livepatch vmap (if compiled in)
+ *   0xffffffc040000000 - 0xffffffc07fffffff (1GB, L2 slot [257])
+ *     VMAP: ioremap and early_ioremap
+ *   0xffffffc080000000 - 0xffffffc13fffffff (3GB, L2 slots [258..260])
+ *     Unmapped
+ *   0xffffffc140000000 - 0xffffffc1bfffffff (2GB, L2 slots [261..262])
+ *     Frametable: 48 bytes per page for 133GB of RAM
+ *   0xffffffc1c0000000 - 0xffffffe1bfffffff (128GB, L2 slots [263..390])
+ *     1:1 direct mapping of RAM
+ *   0xffffffe1c0000000 - 0xffffffffffffffff (121GB, L2 slots [391..511])
+ *     Unmapped
+ */
+
+#define L2_ENTRY_BITS  30
+#define L2_ENTRY_BYTES (_AC(1,UL) << L2_ENTRY_BITS)
+#define L2_ADDR(_slot)                                      \
+    (((_AC(_slot, UL) >> 8) * _AC(0xffffff8000000000,UL)) | \
+     (_AC(_slot, UL) << L2_ENTRY_BITS))
+
+#define XEN_VIRT_START         _AT(vaddr_t, L2_ADDR(256) + MB(2))
+#define HYPERVISOR_VIRT_START  XEN_VIRT_START
+
+#define FRAMETABLE_VIRT_START  _AT(vaddr_t, L2_ADDR(261))
+
+#endif /* CONFIG_RISCV_64 */
+
+#define STACK_ORDER            3
+#define STACK_SIZE             (PAGE_SIZE << STACK_ORDER)
+
+#endif /* __RISCV_CONFIG_H__ */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/asm-riscv/cpufeature.h b/xen/include/asm-riscv/cpufeature.h
new file mode 100644
index 0000000000..15133ed63e
--- /dev/null
+++ b/xen/include/asm-riscv/cpufeature.h
@@ -0,0 +1,17 @@
+#ifndef __ASM_RISCV_CPUFEATURE_H
+#define __ASM_RISCV_CPUFEATURE_H
+
+static inline int cpu_nr_siblings(unsigned int cpu)
+{
+    return 1;
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
diff --git a/xen/include/asm-riscv/csr.h b/xen/include/asm-riscv/csr.h
new file mode 100644
index 0000000000..2c84efde99
--- /dev/null
+++ b/xen/include/asm-riscv/csr.h
@@ -0,0 +1,219 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2015 Regents of the University of California
+ */
+
+#ifndef _ASM_RISCV_CSR_H
+#define _ASM_RISCV_CSR_H
+
+#include <asm/asm.h>
+#include <xen/const.h>
+
+/* Status register flags */
+#define SR_SIE		_AC(0x00000002, UL) /* Supervisor Interrupt Enable */
+#define SR_MIE		_AC(0x00000008, UL) /* Machine Interrupt Enable */
+#define SR_SPIE		_AC(0x00000020, UL) /* Previous Supervisor IE */
+#define SR_MPIE		_AC(0x00000080, UL) /* Previous Machine IE */
+#define SR_SPP		_AC(0x00000100, UL) /* Previously Supervisor */
+#define SR_MPP		_AC(0x00001800, UL) /* Previously Machine */
+#define SR_SUM		_AC(0x00040000, UL) /* Supervisor User Memory Access */
+
+#define SR_FS		_AC(0x00006000, UL) /* Floating-point Status */
+#define SR_FS_OFF	_AC(0x00000000, UL)
+#define SR_FS_INITIAL	_AC(0x00002000, UL)
+#define SR_FS_CLEAN	_AC(0x00004000, UL)
+#define SR_FS_DIRTY	_AC(0x00006000, UL)
+
+#define SR_XS		_AC(0x00018000, UL) /* Extension Status */
+#define SR_XS_OFF	_AC(0x00000000, UL)
+#define SR_XS_INITIAL	_AC(0x00008000, UL)
+#define SR_XS_CLEAN	_AC(0x00010000, UL)
+#define SR_XS_DIRTY	_AC(0x00018000, UL)
+
+#ifndef CONFIG_64BIT
+#define SR_SD		_AC(0x80000000, UL) /* FS/XS dirty */
+#else
+#define SR_SD		_AC(0x8000000000000000, UL) /* FS/XS dirty */
+#endif
+
+/* SATP flags */
+#ifndef CONFIG_64BIT
+#define SATP_PPN	_AC(0x003FFFFF, UL)
+#define SATP_MODE_32	_AC(0x80000000, UL)
+#define SATP_MODE	SATP_MODE_32
+#else
+#define SATP_PPN	_AC(0x00000FFFFFFFFFFF, UL)
+#define SATP_MODE_39	_AC(0x8000000000000000, UL)
+#define SATP_MODE	SATP_MODE_39
+#endif
+
+/* Exception cause high bit - is an interrupt if set */
+#define CAUSE_IRQ_FLAG		(_AC(1, UL) << (__riscv_xlen - 1))
+
+/* Interrupt causes (minus the high bit) */
+#define IRQ_S_SOFT		1
+#define IRQ_M_SOFT		3
+#define IRQ_S_TIMER		5
+#define IRQ_M_TIMER		7
+#define IRQ_S_EXT		9
+#define IRQ_M_EXT		11
+
+/* Exception causes */
+#define EXC_INST_MISALIGNED	0
+#define EXC_INST_ACCESS		1
+#define EXC_BREAKPOINT		3
+#define EXC_LOAD_ACCESS		5
+#define EXC_STORE_ACCESS	7
+#define EXC_SYSCALL		8
+#define EXC_INST_PAGE_FAULT	12
+#define EXC_LOAD_PAGE_FAULT	13
+#define EXC_STORE_PAGE_FAULT	15
+
+/* PMP configuration */
+#define PMP_R			0x01
+#define PMP_W			0x02
+#define PMP_X			0x04
+#define PMP_A			0x18
+#define PMP_A_TOR		0x08
+#define PMP_A_NA4		0x10
+#define PMP_A_NAPOT		0x18
+#define PMP_L			0x80
+
+/* symbolic CSR names: */
+#define CSR_CYCLE		0xc00
+#define CSR_TIME		0xc01
+#define CSR_INSTRET		0xc02
+#define CSR_CYCLEH		0xc80
+#define CSR_TIMEH		0xc81
+#define CSR_INSTRETH		0xc82
+
+#define CSR_SSTATUS		0x100
+#define CSR_SIE			0x104
+#define CSR_STVEC		0x105
+#define CSR_SCOUNTEREN		0x106
+#define CSR_SSCRATCH		0x140
+#define CSR_SEPC		0x141
+#define CSR_SCAUSE		0x142
+#define CSR_STVAL		0x143
+#define CSR_SIP			0x144
+#define CSR_SATP		0x180
+
+#define CSR_MSTATUS		0x300
+#define CSR_MISA		0x301
+#define CSR_MIE			0x304
+#define CSR_MTVEC		0x305
+#define CSR_MSCRATCH		0x340
+#define CSR_MEPC		0x341
+#define CSR_MCAUSE		0x342
+#define CSR_MTVAL		0x343
+#define CSR_MIP			0x344
+#define CSR_PMPCFG0		0x3a0
+#define CSR_PMPADDR0		0x3b0
+#define CSR_MHARTID		0xf14
+
+#ifdef CONFIG_RISCV_M_MODE
+# define CSR_STATUS	CSR_MSTATUS
+# define CSR_IE		CSR_MIE
+# define CSR_TVEC	CSR_MTVEC
+# define CSR_SCRATCH	CSR_MSCRATCH
+# define CSR_EPC	CSR_MEPC
+# define CSR_CAUSE	CSR_MCAUSE
+# define CSR_TVAL	CSR_MTVAL
+# define CSR_IP		CSR_MIP
+
+# define SR_IE		SR_MIE
+# define SR_PIE		SR_MPIE
+# define SR_PP		SR_MPP
+
+# define RV_IRQ_SOFT    IRQ_M_SOFT
+# define RV_IRQ_TIMER	IRQ_M_TIMER
+# define RV_IRQ_EXT     IRQ_M_EXT
+#else /* CONFIG_RISCV_M_MODE */
+# define CSR_STATUS	CSR_SSTATUS
+# define CSR_IE		CSR_SIE
+# define CSR_TVEC	CSR_STVEC
+# define CSR_SCRATCH	CSR_SSCRATCH
+# define CSR_EPC	CSR_SEPC
+# define CSR_CAUSE	CSR_SCAUSE
+# define CSR_TVAL	CSR_STVAL
+# define CSR_IP		CSR_SIP
+
+# define SR_IE		SR_SIE
+# define SR_PIE		SR_SPIE
+# define SR_PP		SR_SPP
+
+# define RV_IRQ_SOFT    IRQ_S_SOFT
+# define RV_IRQ_TIMER	IRQ_S_TIMER
+# define RV_IRQ_EXT     IRQ_S_EXT
+#endif /* CONFIG_RISCV_M_MODE */
+
+/* IE/IP (Supervisor/Machine Interrupt Enable/Pending) flags */
+#define IE_SIE		(_AC(0x1, UL) << RV_IRQ_SOFT)
+#define IE_TIE		(_AC(0x1, UL) << RV_IRQ_TIMER)
+#define IE_EIE		(_AC(0x1, UL) << RV_IRQ_EXT)
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
diff --git a/xen/include/asm-riscv/current.h b/xen/include/asm-riscv/current.h
new file mode 100644
index 0000000000..b9f319e9c4
--- /dev/null
+++ b/xen/include/asm-riscv/current.h
@@ -0,0 +1,47 @@
+#ifndef __ASM_CURRENT_H
+#define __ASM_CURRENT_H
+
+#include <xen/page-size.h>
+#include <xen/percpu.h>
+#include <asm/processor.h>
+
+#ifndef __ASSEMBLY__
+
+struct vcpu;
+
+/* Which VCPU is "current" on this PCPU. */
+DECLARE_PER_CPU(struct vcpu *, curr_vcpu);
+
+#define current              (this_cpu(curr_vcpu))
+#define set_current(vcpu)    do { current = (vcpu); } while (0)
+#define get_cpu_current(cpu) (per_cpu(curr_vcpu, cpu))
+
+/* Per-VCPU state that lives at the top of the stack */
+struct cpu_info {
+    struct cpu_user_regs guest_cpu_user_regs;
+    unsigned long elr;
+    uint32_t flags;
+};
+
+static inline struct cpu_info *get_cpu_info(void)
+{
+    register unsigned long sp asm ("sp");
+
+    return (struct cpu_info *)((sp & ~(STACK_SIZE - 1)) +
+                               STACK_SIZE - sizeof(struct cpu_info));
+}
+
+#define guest_cpu_user_regs() (&get_cpu_info()->guest_cpu_user_regs)
+
+DECLARE_PER_CPU(unsigned int, cpu_id);
+
+#define get_processor_id() (this_cpu(cpu_id))
+
+#define set_processor_id(id)  do {                      \
+    csr_write(CSR_SCRATCH, __per_cpu_offset[id]);       \
+    this_cpu(cpu_id) = (id);                            \
+} while(0)
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* __ASM_CURRENT_H */
diff --git a/xen/include/asm-riscv/debugger.h b/xen/include/asm-riscv/debugger.h
new file mode 100644
index 0000000000..af4fc8a838
--- /dev/null
+++ b/xen/include/asm-riscv/debugger.h
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
diff --git a/xen/include/asm-riscv/delay.h b/xen/include/asm-riscv/delay.h
new file mode 100644
index 0000000000..8f2da8b78b
--- /dev/null
+++ b/xen/include/asm-riscv/delay.h
@@ -0,0 +1,17 @@
+#ifndef __RISCV_DELAY_H__
+#define __RISCV_DELAY_H__
+
+#include <asm/processor.h>
+
+extern void udelay(unsigned long usecs);
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
diff --git a/xen/include/asm-riscv/desc.h b/xen/include/asm-riscv/desc.h
new file mode 100644
index 0000000000..a4d02d5eef
--- /dev/null
+++ b/xen/include/asm-riscv/desc.h
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
diff --git a/xen/include/asm-riscv/device.h b/xen/include/asm-riscv/device.h
new file mode 100644
index 0000000000..e38d2a9712
--- /dev/null
+++ b/xen/include/asm-riscv/device.h
@@ -0,0 +1,15 @@
+#ifndef __ASM_RISCV_DEVICE_H
+#define __ASM_RISCV_DEVICE_H
+
+typedef struct device device_t;
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
diff --git a/xen/include/asm-riscv/div64.h b/xen/include/asm-riscv/div64.h
new file mode 100644
index 0000000000..0a88dd30ad
--- /dev/null
+++ b/xen/include/asm-riscv/div64.h
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
diff --git a/xen/include/asm-riscv/domain.h b/xen/include/asm-riscv/domain.h
new file mode 100644
index 0000000000..ebf2c5bfe1
--- /dev/null
+++ b/xen/include/asm-riscv/domain.h
@@ -0,0 +1,50 @@
+#ifndef __ASM_DOMAIN_H__
+#define __ASM_DOMAIN_H__
+
+#include <xen/cache.h>
+#include <xen/sched.h>
+#include <asm/page.h>
+#include <asm/p2m.h>
+#include <public/hvm/params.h>
+#include <xen/serial.h>
+#include <xen/rbtree.h>
+
+struct hvm_domain {
+    uint64_t params[HVM_NR_PARAMS];
+};
+
+/* The hardware domain has always its memory direct mapped. */
+#define is_domain_direct_mapped(d) ((d) == hardware_domain)
+
+struct arch_domain {
+    struct hvm_domain hvm;
+} __cacheline_aligned;
+
+struct arch_vcpu {
+}  __cacheline_aligned;
+
+void vcpu_show_execution_state(struct vcpu *);
+void vcpu_show_registers(const struct vcpu *);
+
+static inline struct vcpu_guest_context *alloc_vcpu_guest_context(void)
+{
+    return (struct vcpu_guest_context *)0xdeadbeef;
+}
+
+static inline void free_vcpu_guest_context(struct vcpu_guest_context *vgc)
+{
+}
+
+static inline void arch_vcpu_block(struct vcpu *v) {}
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
diff --git a/xen/include/asm-riscv/event.h b/xen/include/asm-riscv/event.h
new file mode 100644
index 0000000000..88e10f414b
--- /dev/null
+++ b/xen/include/asm-riscv/event.h
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
diff --git a/xen/include/asm-riscv/fence.h b/xen/include/asm-riscv/fence.h
new file mode 100644
index 0000000000..2b443a3a48
--- /dev/null
+++ b/xen/include/asm-riscv/fence.h
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
diff --git a/xen/include/asm-riscv/flushtlb.h b/xen/include/asm-riscv/flushtlb.h
new file mode 100644
index 0000000000..7a4a4eee23
--- /dev/null
+++ b/xen/include/asm-riscv/flushtlb.h
@@ -0,0 +1,34 @@
+#ifndef __ASM_RISCV_FLUSHTLB_H__
+#define __ASM_RISCV_FLUSHTLB_H__
+
+#include <xen/cpumask.h>
+
+/*
+ * Filter the given set of CPUs, removing those that definitely flushed their
+ * TLB since @page_timestamp.
+ */
+/* XXX lazy implementation just doesn't clear anything.... */
+static inline void tlbflush_filter(cpumask_t *mask, uint32_t page_timestamp) {}
+
+/* Returning 0 from tlbflush_current_time will always force a flush. */
+static inline uint32_t tlbflush_current_time(void)
+{
+    return 0;
+}
+
+static inline void page_set_tlbflush_timestamp(struct page_info *page)
+{
+}
+
+/* Flush specified CPUs' TLBs */
+void arch_flush_tlb_mask(const cpumask_t *mask);
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
diff --git a/xen/include/asm-riscv/grant_table.h b/xen/include/asm-riscv/grant_table.h
new file mode 100644
index 0000000000..8bcc05a60b
--- /dev/null
+++ b/xen/include/asm-riscv/grant_table.h
@@ -0,0 +1,12 @@
+#ifndef __ASM_GRANT_TABLE_H__
+#define __ASM_GRANT_TABLE_H__
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
diff --git a/xen/include/asm-riscv/guest_access.h b/xen/include/asm-riscv/guest_access.h
new file mode 100644
index 0000000000..61a16044b2
--- /dev/null
+++ b/xen/include/asm-riscv/guest_access.h
@@ -0,0 +1,41 @@
+#ifndef __ASM_RISCV_GUEST_ACCESS_H__
+#define __ASM_RISCV_GUEST_ACCESS_H__
+
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
+unsigned long copy_to_guest_phys_flush_dcache(struct domain *d,
+                                              paddr_t phys,
+                                              void *buf,
+                                              unsigned int len);
+
+int access_guest_memory_by_ipa(struct domain *d, paddr_t ipa, void *buf,
+                               uint32_t size, bool is_write);
+
+#define __raw_copy_to_guest raw_copy_to_guest
+#define __raw_copy_from_guest raw_copy_from_guest
+#define __raw_clear_guest raw_clear_guest
+
+/*
+ * Pre-validate a guest handle.
+ * Allows use of faster __copy_* functions.
+ */
+#define guest_handle_okay(hnd, nr) (1)
+#define guest_handle_subrange_okay(hnd, first, last) (1)
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
diff --git a/xen/include/asm-riscv/guest_atomics.h b/xen/include/asm-riscv/guest_atomics.h
new file mode 100644
index 0000000000..85e82e8c7c
--- /dev/null
+++ b/xen/include/asm-riscv/guest_atomics.h
@@ -0,0 +1,60 @@
+/*
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
+ */
+
+#ifndef _RISCV_GUEST_ATOMICS_H
+#define _RISCV_GUEST_ATOMICS_H
+
+#define guest_testop(name)                                                  \
+static inline int guest_##name(struct domain *d, int nr, volatile void *p)  \
+{                                                                           \
+    (void) d;                                                               \
+    (void) nr;                                                              \
+    (void) p;                                                               \
+                                                                            \
+    return 0;                                                               \
+}
+
+guest_testop(test_and_set_bit)
+guest_testop(test_and_clear_bit)
+guest_testop(test_and_change_bit)
+
+#undef guest_testop
+
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
+#define guest_test_bit(d, nr, p) ((void)(d), test_bit(nr, p))
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
diff --git a/xen/include/asm-riscv/hardirq.h b/xen/include/asm-riscv/hardirq.h
new file mode 100644
index 0000000000..67b6a673db
--- /dev/null
+++ b/xen/include/asm-riscv/hardirq.h
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
diff --git a/xen/include/asm-riscv/hypercall.h b/xen/include/asm-riscv/hypercall.h
new file mode 100644
index 0000000000..8af474b5e2
--- /dev/null
+++ b/xen/include/asm-riscv/hypercall.h
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
diff --git a/xen/include/asm-riscv/init.h b/xen/include/asm-riscv/init.h
new file mode 100644
index 0000000000..d72e62f0c9
--- /dev/null
+++ b/xen/include/asm-riscv/init.h
@@ -0,0 +1,42 @@
+#ifndef _XEN_ASM_INIT_H
+#define _XEN_ASM_INIT_H
+
+#ifndef __ASSEMBLY__
+
+struct init_info {
+    /* Pointer to the stack, used by head.S when entering in C */
+    unsigned char *stack;
+
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
diff --git a/xen/include/asm-riscv/io.h b/xen/include/asm-riscv/io.h
new file mode 100644
index 0000000000..92d17ebfa8
--- /dev/null
+++ b/xen/include/asm-riscv/io.h
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
diff --git a/xen/include/asm-riscv/iocap.h b/xen/include/asm-riscv/iocap.h
new file mode 100644
index 0000000000..e38a7ff3dc
--- /dev/null
+++ b/xen/include/asm-riscv/iocap.h
@@ -0,0 +1,13 @@
+#ifndef __RISCV_IOCAP_H__
+#define __RISCV_IOCAP_H__
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
diff --git a/xen/include/asm-riscv/iommu.h b/xen/include/asm-riscv/iommu.h
new file mode 100644
index 0000000000..c4f24574ec
--- /dev/null
+++ b/xen/include/asm-riscv/iommu.h
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
diff --git a/xen/include/asm-riscv/irq.h b/xen/include/asm-riscv/irq.h
new file mode 100644
index 0000000000..ae17872d4d
--- /dev/null
+++ b/xen/include/asm-riscv/irq.h
@@ -0,0 +1,58 @@
+#ifndef _ASM_HW_IRQ_H
+#define _ASM_HW_IRQ_H
+
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
+#endif /* _ASM_HW_IRQ_H */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/asm-riscv/mem_access.h b/xen/include/asm-riscv/mem_access.h
new file mode 100644
index 0000000000..8348a04a53
--- /dev/null
+++ b/xen/include/asm-riscv/mem_access.h
@@ -0,0 +1,4 @@
+#ifndef __RISCV_MEM_ACCESS_H__
+#define __RISCV_MEM_ACCESS_H__
+
+#endif
diff --git a/xen/include/asm-riscv/mm.h b/xen/include/asm-riscv/mm.h
new file mode 100644
index 0000000000..e1972a8c20
--- /dev/null
+++ b/xen/include/asm-riscv/mm.h
@@ -0,0 +1,246 @@
+#ifndef __ARCH_RISCV_MM__
+#define __ARCH_RISCV_MM__
+
+#include <xen/errno.h>
+#include <asm/page.h>
+#include <public/xen.h>
+
+extern unsigned long max_page;
+extern unsigned long total_pages;
+extern unsigned long frametable_base_mfn;
+extern mfn_t xenheap_mfn_start;
+extern mfn_t xenheap_mfn_end;
+extern vaddr_t xenheap_virt_end;
+extern vaddr_t xenheap_virt_start;
+
+/* Per-page-frame information. */
+struct page_info {
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
+        } free;
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
+    } v;
+
+    union {
+        /*
+         * Timestamp from 'TLB clock', used to avoid extra safety flushes.
+         * Only valid for: a) free pages, and b) pages with zero type count
+         */
+        u32 tlbflush_timestamp;
+    };
+};
+
+#define PFN_ORDER(_pfn) ((_pfn)->v.free.order)
+
+#define PG_shift(idx)   (BITS_PER_LONG - (idx))
+#define PG_mask(x, idx) (x ## UL << PG_shift(idx))
+
+#define PGT_writable_page   PG_mask(1, 1)  /* has writable mappings?         */
+
+/* Count of uses of this frame as its current type. */
+#define PGT_count_width     PG_shift(2)
+#define PGT_count_mask      ((1UL<<PGT_count_width)-1)
+
+/* Cleared when the owning guest 'frees' this page. */
+#define _PGC_allocated      PG_shift(1)
+#define PGC_allocated       PG_mask(1, 1)
+
+/* Page is Xen heap? */
+#define _PGC_xen_heap       PG_shift(2)
+#define PGC_xen_heap        PG_mask(1, 2)
+
+/* Page is broken? */
+#define _PGC_broken         PG_shift(7)
+#define PGC_broken          PG_mask(1, 7)
+
+/* Mutually-exclusive page states: { inuse, offlining, offlined, free }. */
+#define PGC_state           PG_mask(3, 9)
+#define PGC_state_inuse     PG_mask(0, 9)
+#define PGC_state_offlining PG_mask(1, 9)
+#define PGC_state_offlined  PG_mask(2, 9)
+#define PGC_state_free      PG_mask(3, 9)
+#define page_state_is(pg, st) (((pg)->count_info & PGC_state) == PGC_state_##st)
+
+/* Page is not reference counted */
+#define _PGC_extra          PG_shift(10)
+#define PGC_extra           PG_mask(1, 10)
+
+/* Count of references to this frame. */
+#define PGC_count_width     PG_shift(9)
+#define PGC_count_mask      ((1UL<<PGC_count_width)-1)
+
+/*
+ * Page needs to be scrubbed. Since this bit can only be set on a page that is
+ * free (i.e. in PGC_state_free) we can reuse PGC_allocated bit.
+ */
+#define _PGC_need_scrub   _PGC_allocated
+#define PGC_need_scrub    PGC_allocated
+
+#define is_xen_heap_page(page) ((page)->count_info & PGC_xen_heap)
+#define is_xen_heap_mfn(mfn) \
+    (mfn_valid(_mfn(mfn)) && is_xen_heap_page(mfn_to_page(_mfn(mfn))))
+
+#define is_xen_fixed_mfn(mfn)                                   \
+    ((mfn_to_maddr(mfn) >= virt_to_maddr(&_start)) &&           \
+     (mfn_to_maddr(mfn) <= virt_to_maddr(&_end)))
+
+#define page_get_owner(_p)    (_p)->v.inuse.domain
+#define page_set_owner(_p,_d) ((_p)->v.inuse.domain = (_d))
+
+#define maddr_get_owner(ma)   (page_get_owner(maddr_to_page((ma))))
+
+#define mfn_valid(mfn) ({                                          \
+    unsigned long mfn_ = mfn_x(mfn);                               \
+    likely(mfn_ >= frametable_base_mfn && mfn_ < max_page);        \
+})
+
+/* Convert between machine frame numbers and page-info structures. */
+#define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)
+#define mfn_to_page(mfn)                                           \
+    (frame_table + (mfn_x(mfn) - frametable_base_mfn))
+#define page_to_mfn(pg)                                            \
+    _mfn(((unsigned long)((pg) - frame_table) + frametable_base_mfn))
+
+/* Convert between machine addresses and page-info structures. */
+#define maddr_to_page(ma) mfn_to_page(maddr_to_mfn(ma))
+#define page_to_maddr(pg) (mfn_to_maddr(page_to_mfn(pg)))
+
+/* Convert between frame number and address formats.  */
+#define pfn_to_paddr(pfn) ((paddr_t)(pfn) << PAGE_SHIFT)
+#define paddr_to_pfn(pa)  ((unsigned long)((pa) >> PAGE_SHIFT))
+#define mfn_to_maddr(mfn) pfn_to_paddr(mfn_x(mfn))
+#define maddr_to_mfn(ma)  _mfn(paddr_to_pfn(ma))
+#define vmap_to_mfn(va)   maddr_to_mfn(virt_to_maddr((vaddr_t)va))
+#define vmap_to_page(va)  mfn_to_page(vmap_to_mfn(va))
+
+static inline void *maddr_to_virt(paddr_t ma)
+{
+    return (void *)0xdeadbeef;
+}
+
+static inline paddr_t __virt_to_maddr(vaddr_t va)
+{
+    return 0;
+}
+
+#define virt_to_maddr(va)  __virt_to_maddr((vaddr_t) (va))
+
+/* Convert between Xen-heap virtual addresses and machine addresses. */
+#define __pa(x)            (virt_to_maddr(x))
+#define __va(x)            (maddr_to_virt(x))
+
+/* Convert between Xen-heap virtual addresses and machine frame numbers. */
+#define __virt_to_mfn(va)  (virt_to_maddr(va) >> PAGE_SHIFT)
+#define __mfn_to_virt(mfn) (maddr_to_virt((paddr_t)(mfn) << PAGE_SHIFT))
+
+/*
+ * We define non-underscored wrappers for above conversion functions.
+ * These are overriden in various source files while underscored version
+ * remain intact.
+ */
+#define virt_to_mfn(va)    __virt_to_mfn(va)
+#define mfn_to_virt(mfn)   __mfn_to_virt(mfn)
+
+/* Convert between Xen-heap virtual addresses and page-info structures. */
+static inline struct page_info *virt_to_page(const void *v)
+{
+    return (void *)0xdeadbeef;
+}
+
+static inline void *page_to_virt(const struct page_info *pg)
+{
+    return (void *)0xdeadbeef;
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
+/* Xen always owns P2M on RISC-V */
+#define set_gpfn_from_mfn(mfn, pfn) do { (void) (mfn), (void)(pfn); } while (0)
+#define mfn_to_gmfn(_d, mfn)  (mfn)
+
+/* Arch-specific portion of memory_op hypercall. */
+long arch_memory_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg);
+
+extern void put_page_type(struct page_info *page);
+
+static inline void put_page_and_type(struct page_info *page)
+{
+}
+
+int guest_physmap_mark_populate_on_demand(struct domain *d, unsigned long gfn,
+                                          unsigned int order);
+
+unsigned long domain_get_maximum_gpfn(struct domain *d);
+
+/*
+ * On RISC-V, all the RAM is currently direct mapped in Xen.
+ * Hence return always true.
+ */
+static inline bool arch_mfn_in_directmap(unsigned long mfn)
+{
+    return true;
+}
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
diff --git a/xen/include/asm-riscv/monitor.h b/xen/include/asm-riscv/monitor.h
new file mode 100644
index 0000000000..e77d21dba4
--- /dev/null
+++ b/xen/include/asm-riscv/monitor.h
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
diff --git a/xen/include/asm-riscv/nospec.h b/xen/include/asm-riscv/nospec.h
new file mode 100644
index 0000000000..55087fa831
--- /dev/null
+++ b/xen/include/asm-riscv/nospec.h
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
diff --git a/xen/include/asm-riscv/numa.h b/xen/include/asm-riscv/numa.h
new file mode 100644
index 0000000000..52bdfbc16b
--- /dev/null
+++ b/xen/include/asm-riscv/numa.h
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
diff --git a/xen/include/asm-riscv/p2m.h b/xen/include/asm-riscv/p2m.h
new file mode 100644
index 0000000000..1bb2009d53
--- /dev/null
+++ b/xen/include/asm-riscv/p2m.h
@@ -0,0 +1,218 @@
+#ifndef _XEN_P2M_H
+#define _XEN_P2M_H
+
+#include <xen/mm.h>
+#include <xen/mem_access.h>
+#include <xen/errno.h>
+
+struct domain;
+
+extern void memory_type_changed(struct domain *);
+
+/* Per-p2m-table state */
+struct p2m_domain {
+};
+
+typedef enum {
+    p2m_invalid = 0
+} p2m_type_t;
+
+/* All common type definitions should live ahead of this inclusion. */
+#ifdef _XEN_P2M_COMMON_H
+# error "xen/p2m-common.h should not be included directly"
+#endif
+#include <xen/p2m-common.h>
+
+static inline bool arch_acquire_resource_check(struct domain *d)
+{
+    return true;
+}
+
+static inline
+void p2m_altp2m_check(struct vcpu *v, uint16_t idx)
+{
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
+/* Remove mapping refcount on each mapping page in the p2m */
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
+}
+
+void p2m_write_unlock(struct p2m_domain *p2m);
+
+static inline void p2m_read_lock(struct p2m_domain *p2m)
+{
+}
+
+static inline void p2m_read_unlock(struct p2m_domain *p2m)
+{
+}
+
+static inline int p2m_is_locked(struct p2m_domain *p2m)
+{
+    return 0;
+}
+
+static inline int p2m_is_write_locked(struct p2m_domain *p2m)
+{
+    return 0;
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
+    return 0;
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
+static inline struct page_info *get_page_from_gfn(
+    struct domain *d, unsigned long gfn, p2m_type_t *t, p2m_query_t q)
+{
+    *t = p2m_invalid;
+    return (void *) 0xdeadbeef;
+}
+
+int get_page_type(struct page_info *page, unsigned long type);
+bool is_iomem_page(mfn_t mfn);
+static inline int get_page_and_type(struct page_info *page,
+                                    struct domain *domain,
+                                    unsigned long type)
+{
+    return 0;
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
+    return gfn;
+}
+
+/*
+ * A vCPU has cache enabled only when the MMU is enabled and data cache
+ * is enabled.
+ */
+static inline bool vcpu_has_cache_enabled(struct vcpu *v)
+{
+    return 0;
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
diff --git a/xen/include/asm-riscv/page-bits.h b/xen/include/asm-riscv/page-bits.h
new file mode 100644
index 0000000000..5a47701fea
--- /dev/null
+++ b/xen/include/asm-riscv/page-bits.h
@@ -0,0 +1,11 @@
+#ifndef __RISCV_PAGE_SHIFT_H__
+#define __RISCV_PAGE_SHIFT_H__
+
+#define PAGE_SHIFT              12
+
+#ifdef CONFIG_RISCV_64
+#define PADDR_BITS              56
+#define VADDR_BITS              39
+#endif
+
+#endif /* __RISCV_PAGE_SHIFT_H__ */
diff --git a/xen/include/asm-riscv/page.h b/xen/include/asm-riscv/page.h
new file mode 100644
index 0000000000..36c8732efe
--- /dev/null
+++ b/xen/include/asm-riscv/page.h
@@ -0,0 +1,73 @@
+/*
+ * Copyright (C) 2009 Chen Liqin <liqin.chen@sunplusct.com>
+ * Copyright (C) 2012 Regents of the University of California
+ * Copyright (C) 2017 SiFive
+ * Copyright (C) 2017 XiaojingZhu <zhuxiaoj@ict.ac.cn>
+ * Copyright (C) 2019 Bobby Eshleman <bobbyeshleman@gmail.com>
+ * Copyright (C) 2021 Connor Davis <connojd@pm.me>
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
+#include <xen/const.h>
+#include <xen/page-size.h>
+
+#define PAGE_ALIGN(x)   (((x) + PAGE_SIZE - 1) & PAGE_MASK)
+#define paddr_bits      PADDR_BITS
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
+#ifndef __ASSEMBLY__
+
+#define PAGE_HYPERVISOR_RO  (PTE_VALID|PTE_READABLE|PTE_ACCESSED)
+#define PAGE_HYPERVISOR_RX  (PAGE_HYPERVISOR_RO|PTE_EXECUTABLE)
+#define PAGE_HYPERVISOR_RW  (PAGE_HYPERVISOR_RO|PTE_WRITABLE|PTE_DIRTY)
+
+/*
+ * RISC-V does not encode cacheability attributes in the PTEs;
+ * instead mappings must consult the platform PMAs.
+ */
+#define PAGE_HYPERVISOR         PAGE_HYPERVISOR_RW
+#define PAGE_HYPERVISOR_NOCACHE PAGE_HYPERVISOR
+#define PAGE_HYPERVISOR_WC      PAGE_HYPERVISOR
+
+typedef struct {
+    unsigned long pte;
+} pte_t;
+
+#define clear_page(pgaddr)  memset((pgaddr), 0, PAGE_SIZE)
+#define copy_page(to, from) memcpy((to), (from), PAGE_SIZE)
+
+/*
+ * Ensure that stores to instruction memory are locally visible to
+ * subsequent fetches on this hart.
+ */
+static inline void invalidate_icache(void)
+{
+    asm volatile ("fence.i" ::: "memory");
+}
+
+/* Flush the dcache for an entire page. */
+void flush_page_to_ram(unsigned long mfn, bool sync_icache);
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* _ASM_RISCV_PAGE_H */
diff --git a/xen/include/asm-riscv/paging.h b/xen/include/asm-riscv/paging.h
new file mode 100644
index 0000000000..3f9f704273
--- /dev/null
+++ b/xen/include/asm-riscv/paging.h
@@ -0,0 +1,15 @@
+#ifndef _XEN_PAGING_H
+#define _XEN_PAGING_H
+
+#define paging_mode_translate(d)              (1)
+
+#endif /* _XEN_PAGING_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/asm-riscv/pci.h b/xen/include/asm-riscv/pci.h
new file mode 100644
index 0000000000..0ccf335e34
--- /dev/null
+++ b/xen/include/asm-riscv/pci.h
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
diff --git a/xen/include/asm-riscv/percpu.h b/xen/include/asm-riscv/percpu.h
new file mode 100644
index 0000000000..0d165d6aa1
--- /dev/null
+++ b/xen/include/asm-riscv/percpu.h
@@ -0,0 +1,33 @@
+#ifndef __RISCV_PERCPU_H__
+#define __RISCV_PERCPU_H__
+
+#ifndef __ASSEMBLY__
+
+#include <xen/types.h>
+#include <asm/sysregs.h>
+
+extern char __per_cpu_start[], __per_cpu_data_end[];
+extern unsigned long __per_cpu_offset[NR_CPUS];
+void percpu_init_areas(void);
+
+#define per_cpu(var, cpu)  \
+    (*RELOC_HIDE(&per_cpu__##var, __per_cpu_offset[cpu]))
+#define this_cpu(var) \
+    (*RELOC_HIDE(&per_cpu__##var, csr_read(CSR_SCRATCH)))
+
+#define per_cpu_ptr(var, cpu)  \
+    (*RELOC_HIDE(var, __per_cpu_offset[cpu]))
+#define this_cpu_ptr(var) \
+    (*RELOC_HIDE(var, csr_read(CSR_SCRATCH)))
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
diff --git a/xen/include/asm-riscv/processor.h b/xen/include/asm-riscv/processor.h
new file mode 100644
index 0000000000..19e681652a
--- /dev/null
+++ b/xen/include/asm-riscv/processor.h
@@ -0,0 +1,59 @@
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
+#ifndef _ASM_RISCV_PROCESSOR_H
+#define _ASM_RISCV_PROCESSOR_H
+
+#ifndef __ASSEMBLY__
+
+/* On stack VCPU state */
+struct cpu_user_regs {
+    unsigned long r0;
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
diff --git a/xen/include/asm-riscv/random.h b/xen/include/asm-riscv/random.h
new file mode 100644
index 0000000000..b4acee276b
--- /dev/null
+++ b/xen/include/asm-riscv/random.h
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
diff --git a/xen/include/asm-riscv/regs.h b/xen/include/asm-riscv/regs.h
new file mode 100644
index 0000000000..82e7dd2aee
--- /dev/null
+++ b/xen/include/asm-riscv/regs.h
@@ -0,0 +1,23 @@
+#ifndef __ARM_REGS_H__
+#define __ARM_REGS_H__
+
+#ifndef __ASSEMBLY__
+
+#include <asm/current.h>
+
+static inline bool guest_mode(const struct cpu_user_regs *r)
+{
+    return false;
+}
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
diff --git a/xen/include/asm-riscv/setup.h b/xen/include/asm-riscv/setup.h
new file mode 100644
index 0000000000..d0fc75054e
--- /dev/null
+++ b/xen/include/asm-riscv/setup.h
@@ -0,0 +1,14 @@
+#ifndef __RISCV_SETUP_H_
+#define __RISCV_SETUP_H_
+
+#define max_init_domid (0)
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
diff --git a/xen/include/asm-riscv/smp.h b/xen/include/asm-riscv/smp.h
new file mode 100644
index 0000000000..f0f0b06501
--- /dev/null
+++ b/xen/include/asm-riscv/smp.h
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
+/*
+ * Do we, for platform reasons, need to actually keep CPUs online when we
+ * would otherwise prefer them to be off?
+ */
+#define park_offline_cpus true
+
+#define cpu_is_offline(cpu) unlikely(!cpu_online(cpu))
+
+#define smp_processor_id() get_processor_id()
+
+#endif /* _ASM_RISCV_SMP_H */
diff --git a/xen/include/asm-riscv/softirq.h b/xen/include/asm-riscv/softirq.h
new file mode 100644
index 0000000000..976e0ebd70
--- /dev/null
+++ b/xen/include/asm-riscv/softirq.h
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
diff --git a/xen/include/asm-riscv/spinlock.h b/xen/include/asm-riscv/spinlock.h
new file mode 100644
index 0000000000..77e6736e71
--- /dev/null
+++ b/xen/include/asm-riscv/spinlock.h
@@ -0,0 +1,12 @@
+#ifndef __ASM_SPINLOCK_H
+#define __ASM_SPINLOCK_H
+
+#define arch_lock_acquire_barrier()
+#define arch_lock_release_barrier()
+
+#define arch_lock_relax()
+#define arch_lock_signal()
+
+#define arch_lock_signal_wmb()
+
+#endif /* __ASM_SPINLOCK_H */
diff --git a/xen/include/asm-riscv/string.h b/xen/include/asm-riscv/string.h
new file mode 100644
index 0000000000..733e9e00d3
--- /dev/null
+++ b/xen/include/asm-riscv/string.h
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
diff --git a/xen/include/asm-riscv/sysregs.h b/xen/include/asm-riscv/sysregs.h
new file mode 100644
index 0000000000..ae0945d902
--- /dev/null
+++ b/xen/include/asm-riscv/sysregs.h
@@ -0,0 +1,16 @@
+#ifndef __ASM_RISCV_SYSREGS_H
+#define __ASM_RISCV_SYSREGS_H
+
+#include <asm/csr.h>
+
+#endif /* __ASM_RISCV_SYSREGS_H */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
+
+
diff --git a/xen/include/asm-riscv/system.h b/xen/include/asm-riscv/system.h
new file mode 100644
index 0000000000..276e7ba550
--- /dev/null
+++ b/xen/include/asm-riscv/system.h
@@ -0,0 +1,99 @@
+/*
+ * Based on arch/arm/include/asm/system.h
+ *
+ * Copyright (C) 2012 ARM Ltd.
+ * Copyright (C) 2013 Regents of the University of California
+ * Copyright (C) 2017 SiFive
+ * Copyright (C) 2021 Connor Davis <connojd@pm.me>
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
+
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
+	return csr_read(CSR_STATUS);
+}
+
+static inline void local_irq_enable(void)
+{
+	csr_set(CSR_STATUS, SR_IE);
+}
+
+static inline void local_irq_disable(void)
+{
+	csr_clear(CSR_STATUS, SR_IE);
+}
+
+#define local_irq_save(x)                                               \
+({                                                                      \
+	x = csr_read_clear(CSR_STATUS, SR_IE);                          \
+})
+
+static inline void local_irq_restore(unsigned long flags)
+{
+	csr_set(CSR_STATUS, flags & SR_IE);
+}
+
+static inline int local_irq_is_enabled(void)
+{
+	unsigned long flags = local_save_flags();
+
+	return !!(flags & SR_IE);
+}
+
+#define arch_fetch_and_add(x, v) __sync_fetch_and_add(x, v)
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* _ASM_RISCV_BARRIER_H */
diff --git a/xen/include/asm-riscv/time.h b/xen/include/asm-riscv/time.h
new file mode 100644
index 0000000000..af1a8ece45
--- /dev/null
+++ b/xen/include/asm-riscv/time.h
@@ -0,0 +1,31 @@
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
+typedef uint64_t cycles_t;
+
+#ifdef CONFIG_64BIT
+static inline cycles_t get_cycles(void)
+{
+	cycles_t n;
+
+	__asm__ __volatile__ (
+		"rdtime %0"
+		: "=r" (n));
+	return n;
+}
+#endif
+
+#endif /* _ASM_RISCV_TIMEX_H */
diff --git a/xen/include/asm-riscv/trace.h b/xen/include/asm-riscv/trace.h
new file mode 100644
index 0000000000..e06def61f6
--- /dev/null
+++ b/xen/include/asm-riscv/trace.h
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
diff --git a/xen/include/asm-riscv/types.h b/xen/include/asm-riscv/types.h
new file mode 100644
index 0000000000..b1c76a59c2
--- /dev/null
+++ b/xen/include/asm-riscv/types.h
@@ -0,0 +1,60 @@
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
+#if defined(CONFIG_RISCV_64)
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
+#if defined(CONFIG_RISCV_64)
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
diff --git a/xen/include/asm-riscv/vm_event.h b/xen/include/asm-riscv/vm_event.h
new file mode 100644
index 0000000000..a0a9ce81d4
--- /dev/null
+++ b/xen/include/asm-riscv/vm_event.h
@@ -0,0 +1,60 @@
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
+    return 0;
+}
+
+static inline void vm_event_cleanup_domain(struct domain *d)
+{
+}
+
+static inline void vm_event_toggle_singlestep(struct domain *d, struct vcpu *v,
+                                              vm_event_response_t *rsp)
+{
+}
+
+static inline
+void vm_event_register_write_resume(struct vcpu *v, vm_event_response_t *rsp)
+{
+}
+
+static inline
+void vm_event_emulate_check(struct vcpu *v, vm_event_response_t *rsp)
+{
+}
+
+static inline
+void vm_event_sync_event(struct vcpu *v, bool value)
+{
+}
+
+static inline
+void vm_event_reset_vmtrace(struct vcpu *v)
+{
+}
+
+#endif /* __ASM_RISCV_VM_EVENT_H__ */
diff --git a/xen/include/asm-riscv/xenoprof.h b/xen/include/asm-riscv/xenoprof.h
new file mode 100644
index 0000000000..3db6ce3ab2
--- /dev/null
+++ b/xen/include/asm-riscv/xenoprof.h
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
diff --git a/xen/include/public/arch-riscv.h b/xen/include/public/arch-riscv.h
new file mode 100644
index 0000000000..1b31ba7290
--- /dev/null
+++ b/xen/include/public/arch-riscv.h
@@ -0,0 +1,134 @@
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
+#include <xen/types.h>
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
+ * in a struct in memory. On rv64 it is 8 bytes long and 8-byte aligned.
+ *
+ * XEN_GUEST_HANDLE_PARAM represents a guest pointer, when passed as a
+ * hypercall argument. It is 4 bytes on rv32 and 8 bytes on rv64.
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
+struct vcpu_guest_core_regs {
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
+#endif
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
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 1708c36964..fd0b75677c 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -60,6 +60,7 @@ void arch_vcpu_destroy(struct vcpu *v);
 int map_vcpu_info(struct vcpu *v, unsigned long gfn, unsigned offset);
 void unmap_vcpu_info(struct vcpu *v);
 
+struct xen_domctl_createdomain;
 int arch_domain_create(struct domain *d,
                        struct xen_domctl_createdomain *config);
 
-- 
2.31.1


