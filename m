Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A69F5849E45
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 16:33:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676197.1052173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0xi-0007eD-RI; Mon, 05 Feb 2024 15:32:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676197.1052173; Mon, 05 Feb 2024 15:32:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0xi-0007Zg-LS; Mon, 05 Feb 2024 15:32:46 +0000
Received: by outflank-mailman (input) for mailman id 676197;
 Mon, 05 Feb 2024 15:32:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TPgQ=JO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rX0xg-0007I6-NG
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 15:32:44 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd64af5d-c43b-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 16:32:42 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-50eac018059so5500705e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 07:32:42 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 s1-20020a056512314100b005114d401157sm474445lfi.2.2024.02.05.07.32.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 07:32:40 -0800 (PST)
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
X-Inumbo-ID: cd64af5d-c43b-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707147161; x=1707751961; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XkKBTIpds/dxSWE/+St+qbfVnfucg4jDXBYkSl6B8WQ=;
        b=GXnLvwbuTQpegs5+P0zjBMhOcLQORpb3yr4Mph+Dc1/bTqDWFKmuCzs1c5B9r9IRWU
         ZcRtMFf/WdbrXM9VeB5VCYgjU/UtxGtstsPAgQT43e1rINimBsptn4f+AVwmpeKp4hCC
         kEY4K3QRJqymy1JYXL5MNff3K3WQnICU7b23VYM5Cr9/doQqS5vb1+KiIRQmbgU/qCUo
         I9TH+R+xZ0qyhJNY4qEXgoqF7NcPee1YQvJZHl1/QZEfpDAk6UwMTAZ9quJn63Mj9sZJ
         N5DU4LJKIzm+hZhFg4Ni+xQsQsi2rEYli2Ki5BNXoVzr4tmG2MNHcK4xxvmrr2LY46/5
         ehfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707147161; x=1707751961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XkKBTIpds/dxSWE/+St+qbfVnfucg4jDXBYkSl6B8WQ=;
        b=jSn7pjRHvR8zMwaAMVAAKJWfD5zsl8w2xCnwoquhGGUfpfFA5GZ/mHvuFBTB19aXeI
         //3xuoVHWTEsmEtAann/A00i+UOP/y3mLlsnKwghghiaKCrMYKUVpoEHNNfZthiulrAZ
         21YVyXFTp2JHGqXNmB65LEUVGF5F4FEflrvlpOke2ltpOrFASkwHvR8VGHuR++MwaWT1
         SXxobm6wG2dkRz0y1eRc+rav/L4Kz6ZQ7jPN902xYkhf5c9XkQEkeBVAUaxDL4S2pSOn
         UXIomOwM/t4T9Uso5cSjv5X7G4sni609p0qK8cqdDfuebBmQCgU1jlPvyvU36yPdA1+l
         MbvA==
X-Gm-Message-State: AOJu0Yy03UYu8WvbAR21DqhXSQU70aSaxLZe2dvmw1xL6i0wI5km+XUe
	JTDJJ6zNU5eFamNHSBJxopGqEbQswtcB+cTar7iXzzJ81YeEpxitKKFaF8Em
X-Google-Smtp-Source: AGHT+IEF8E/nDMiQpL9fiHzdUvzAl/ml77VloKsI50UdF2sGA8VSWi2E7/ekkWZ8fwWv95YeR3AUhQ==
X-Received: by 2002:ac2:46f7:0:b0:511:454e:6030 with SMTP id q23-20020ac246f7000000b00511454e6030mr4123262lfo.24.1707147160832;
        Mon, 05 Feb 2024 07:32:40 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCX9xbflx0XvRv31KwZ+AL5hyPj2S2QvGmuphBjFrxFJbiUK89oq/5QUcJld8GvY1mH/15a1YjNUGwHCXe4oqOaUjItiqaJqZOAj5vqzwGZxVp8RZuPBXGfe5/5DUYXnu/xC1M8SLN9l/ULjsr5uGm7GqR5N3KsYh4NO7DwlR/TQ8ho0hwR/0y+kN29BF3f4VLwv5XDGm5Otik7ieghpuVU6xh8s3E7uHW5SFbOJZ0dwMkKk7HK4haAhgdDugAK6956odUOmFoR0GeUW9UWjD1RRJRcObM1SMRAHW1ngJ1Hei8PBgIywnEw+eqOS6fUPj0Q2wTbAqs9iC1e6VePLn/c/ANMSzhg3Btm3R/+8HGZqYDFCh8MFMEcb/7okQAlQ87djw6/7M6sTenTnIpeL6bpG/yCXpsc0RXAwgo7S64Hc5KtQGdyDybWbejg5351fBjA2LO5T5Q17/d/kNPyyftOJPJKpvQXGNxs3uaEghZ5t9Fku+iNn0FcFM2FQq3t2ryEBXMPAxfxtVenP1W807JmT//WuXJMboxmNDODHDuTRpnv+tU9S+0gvOQCaJjtILhfNPcYY9VhFVFVbm3xDwFsJbF1KC5MifwX8x8F1G1mo6B5pS78LMgclLF0PDaWjG+DZxvE=
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [PATCH v4 00/30]  Enable build of full Xen for RISC-V
Date: Mon,  5 Feb 2024 16:32:07 +0100
Message-ID: <cover.1707146506.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series performs all of the additions necessary to drop the
build overrides for RISCV and enable the full Xen build. Except in cases
where compatibile implementations already exist (e.g. atomic.h and
bitops.h), the newly added definitions are simple.

The patch series is based on the following patch series:
-	[PATCH v6 0/9] Introduce generic headers   [1]
- [PATCH] move __read_mostly to xen/cache.h  [2]
- [PATCH] xen: move BUG_ON(), WARN_ON(), ASSERT(), ASSERT_UNREACHABLE() to xen/bug.h [3]
- [XEN PATCH v2 1/3] xen: introduce STATIC_ASSERT_UNREACHABLE() [4]
- [PATCH] xen/lib: introduce generic find next bit operations [5]

Right now, the patch series doesn't have a direct dependency on [2] and it
provides __read_mostly in the patch:
    [PATCH v3 26/34] xen/riscv: add definition of __read_mostly
However, it will be dropped as soon as [2] is merged or at least when the
final version of the patch [2] is provided.

[1] https://lore.kernel.org/xen-devel/cover.1703072575.git.oleksii.kurochko@gmail.com/
[2] https://lore.kernel.org/xen-devel/f25eb5c9-7c14-6e23-8535-2c66772b333e@suse.com/
[3] https://lore.kernel.org/xen-devel/4887b2d91a4bf2e8b4b66f03964259651981403b.1706897023.git.oleksii.kurochko@gmail.com/
[4] https://lore.kernel.org/xen-devel/42fc6ae8d3eb802429d29c774502ff232340dc84.1706259490.git.federico.serafini@bugseng.com/
[5] https://lore.kernel.org/xen-devel/52730e6314210ba4164a9934a720c4fda201447b.1706266854.git.oleksii.kurochko@gmail.com/

---
Changes in V4:
 - Update the cover letter message: new patch series dependencies.
 - Some patches were merged to staging, so they were dropped in this patch series:
     [PATCH v3 09/34] xen/riscv: introduce system.h
     [PATCH v3 18/34] xen/riscv: introduce domain.h
     [PATCH v3 19/34] xen/riscv: introduce guest_access.h
 - Was sent out of this patch series:
     [PATCH v3 16/34] xen/lib: introduce generic find next bit operations
 - [PATCH v3 17/34] xen/riscv: add compilation of generic find-next-bit.c was
   droped as CONFIG_GENERIC_FIND_NEXT_BIT was dropped.
 - All other changes are specific to a specific patch.
---
Changes in V3:
 - Update the cover letter message
 - The following patches were dropped as they were merged to staging:
    [PATCH v2 03/39] xen/riscv:introduce asm/byteorder.h
    [PATCH v2 04/39] xen/riscv: add public arch-riscv.h
    [PATCH v2 05/39] xen/riscv: introduce spinlock.h
    [PATCH v2 20/39] xen/riscv: define bug frame tables in xen.lds.S
    [PATCH v2 34/39] xen: add RISCV support for pmu.h
    [PATCH v2 35/39] xen: add necessary headers to common to build full Xen for RISC-V
 - Instead of the following patches were introduced new:
    [PATCH v2 10/39] xen/riscv: introduce asm/iommu.h
    [PATCH v2 11/39] xen/riscv: introduce asm/nospec.h
 - remove "asm/"  for commit messages which start with "xen/riscv:"
 - code style updates.
 - add emulation of {cmp}xchg_* for 1 and 2 bytes types.
 - code style fixes.
 - add SPDX and footer for the newly added headers.
 - introduce generic find-next-bit.c.
 - some other mionor changes. ( details please find in a patch )
---
Changes in V2:
  - Drop the following patches as they are the part of [2]:
      [PATCH v1 06/57] xen/riscv: introduce paging.h
      [PATCH v1 08/57] xen/riscv: introduce asm/device.h
      [PATCH v1 10/57] xen/riscv: introduce asm/grant_table.h
      [PATCH v1 12/57] xen/riscv: introduce asm/hypercall.h
      [PATCH v1 13/57] xen/riscv: introduce asm/iocap.h
      [PATCH v1 15/57] xen/riscv: introduce asm/mem_access.h
      [PATCH v1 18/57] xen/riscv: introduce asm/random.h
      [PATCH v1 21/57] xen/riscv: introduce asm/xenoprof.h
      [PATCH v1 24/57] xen/riscv: introduce asm/percpu.h
      [PATCH v1 29/57] xen/riscv: introduce asm/hardirq.h
      [PATCH v1 33/57] xen/riscv: introduce asm/altp2m.h
      [PATCH v1 38/57] xen/riscv: introduce asm/monitor.h
      [PATCH v1 39/57] xen/riscv: introduce asm/numa.h
      [PATCH v1 42/57] xen/riscv: introduce asm/softirq.h
  - xen/lib.h in most of the cases were changed to xen/bug.h as
    mostly functionilty of bug.h is used.
  - align arch-riscv.h with Arm's version of it.
  - change the Author of commit with introduction of asm/atomic.h.
  - update some definition from spinlock.h.
  - code style changes.
---

Bobby Eshleman (1):
  xen/riscv: introduce atomic.h

Oleksii Kurochko (29):
  xen/riscv: disable unnecessary configs
  xen/riscv: use some asm-generic headers
  xen: add support in public/hvm/save.h for PPC and RISC-V
  xen/riscv: introduce cpufeature.h
  xen/riscv: introduce guest_atomics.h
  xen: avoid generation of empty asm/iommu.h
  xen/asm-generic: introdure nospec.h
  xen/riscv: introduce setup.h
  xen/riscv: introduce bitops.h
  xen/riscv: introduce flushtlb.h
  xen/riscv: introduce smp.h
  xen/riscv: introduce cmpxchg.h
  xen/riscv: introduce io.h
  xen/riscv: introduce irq.h
  xen/riscv: introduce p2m.h
  xen/riscv: introduce regs.h
  xen/riscv: introduce time.h
  xen/riscv: introduce event.h
  xen/riscv: introduce monitor.h
  xen/riscv: add definition of __read_mostly
  xen/riscv: define an address of frame table
  xen/riscv: add required things to current.h
  xen/riscv: add minimal stuff to page.h to build full Xen
  xen/riscv: add minimal stuff to processor.h to build full Xen
  xen/riscv: add minimal stuff to mm.h to build full Xen
  xen/riscv: introduce vm_event_*() functions
  xen/rirscv: add minimal amount of stubs to build full Xen
  xen/riscv: enable full Xen build
  xen/README: add compiler and binutils versions for RISC-V64

 README                                        |   3 +
 .../gitlab-ci/riscv-fixed-randconfig.yaml     |  27 ++
 docs/misc/riscv/booting.txt                   |   8 +
 xen/arch/arm/include/asm/Makefile             |   1 +
 xen/arch/ppc/include/asm/Makefile             |   1 +
 xen/arch/ppc/include/asm/nospec.h             |  15 -
 xen/arch/riscv/Kconfig                        |   7 +
 xen/arch/riscv/Makefile                       |  18 +-
 xen/arch/riscv/arch.mk                        |   5 +-
 xen/arch/riscv/configs/tiny64_defconfig       |  17 +
 xen/arch/riscv/early_printk.c                 | 168 -------
 xen/arch/riscv/include/asm/Makefile           |  13 +
 xen/arch/riscv/include/asm/atomic.h           | 395 +++++++++++++++++
 xen/arch/riscv/include/asm/bitops.h           | 164 +++++++
 xen/arch/riscv/include/asm/cache.h            |   2 +
 xen/arch/riscv/include/asm/cmpxchg.h          | 237 ++++++++++
 xen/arch/riscv/include/asm/config.h           | 107 +++--
 xen/arch/riscv/include/asm/cpufeature.h       |  23 +
 xen/arch/riscv/include/asm/current.h          |  19 +
 xen/arch/riscv/include/asm/event.h            |  40 ++
 xen/arch/riscv/include/asm/fence.h            |   8 +
 xen/arch/riscv/include/asm/flushtlb.h         |  34 ++
 xen/arch/riscv/include/asm/guest_atomics.h    |  44 ++
 xen/arch/riscv/include/asm/io.h               | 142 ++++++
 xen/arch/riscv/include/asm/irq.h              |  37 ++
 xen/arch/riscv/include/asm/mm.h               | 246 +++++++++++
 xen/arch/riscv/include/asm/monitor.h          |  26 ++
 xen/arch/riscv/include/asm/p2m.h              | 102 +++++
 xen/arch/riscv/include/asm/page.h             |  19 +
 xen/arch/riscv/include/asm/processor.h        |  23 +
 xen/arch/riscv/include/asm/regs.h             |  29 ++
 xen/arch/riscv/include/asm/setup.h            |  17 +
 xen/arch/riscv/include/asm/smp.h              |  26 ++
 xen/arch/riscv/include/asm/time.h             |  29 ++
 xen/arch/riscv/mm.c                           |  52 ++-
 xen/arch/riscv/setup.c                        |  10 +-
 xen/arch/riscv/stubs.c                        | 415 ++++++++++++++++++
 xen/arch/riscv/traps.c                        |  25 ++
 xen/arch/riscv/vm_event.c                     |  19 +
 xen/include/asm-generic/bitops/__ffs.h        |  47 ++
 xen/include/asm-generic/bitops/bitops-bits.h  |  21 +
 xen/include/asm-generic/bitops/ffs.h          |   9 +
 xen/include/asm-generic/bitops/ffsl.h         |  16 +
 xen/include/asm-generic/bitops/ffz.h          |  18 +
 .../asm-generic/bitops/find-first-set-bit.h   |  17 +
 xen/include/asm-generic/bitops/fls.h          |  18 +
 xen/include/asm-generic/bitops/flsl.h         |  10 +
 .../asm-generic/bitops/generic-non-atomic.h   |  89 ++++
 xen/include/asm-generic/bitops/hweight.h      |  13 +
 xen/include/asm-generic/bitops/test-bit.h     |  18 +
 .../asm => include/asm-generic}/nospec.h      |   6 +-
 xen/include/public/hvm/save.h                 |   4 +-
 xen/include/xen/iommu.h                       |   4 +
 53 files changed, 2640 insertions(+), 223 deletions(-)
 create mode 100644 docs/misc/riscv/booting.txt
 delete mode 100644 xen/arch/ppc/include/asm/nospec.h
 create mode 100644 xen/arch/riscv/include/asm/Makefile
 create mode 100644 xen/arch/riscv/include/asm/atomic.h
 create mode 100644 xen/arch/riscv/include/asm/bitops.h
 create mode 100644 xen/arch/riscv/include/asm/cmpxchg.h
 create mode 100644 xen/arch/riscv/include/asm/cpufeature.h
 create mode 100644 xen/arch/riscv/include/asm/event.h
 create mode 100644 xen/arch/riscv/include/asm/fence.h
 create mode 100644 xen/arch/riscv/include/asm/flushtlb.h
 create mode 100644 xen/arch/riscv/include/asm/guest_atomics.h
 create mode 100644 xen/arch/riscv/include/asm/io.h
 create mode 100644 xen/arch/riscv/include/asm/irq.h
 create mode 100644 xen/arch/riscv/include/asm/monitor.h
 create mode 100644 xen/arch/riscv/include/asm/p2m.h
 create mode 100644 xen/arch/riscv/include/asm/regs.h
 create mode 100644 xen/arch/riscv/include/asm/setup.h
 create mode 100644 xen/arch/riscv/include/asm/smp.h
 create mode 100644 xen/arch/riscv/include/asm/time.h
 create mode 100644 xen/arch/riscv/stubs.c
 create mode 100644 xen/arch/riscv/vm_event.c
 create mode 100644 xen/include/asm-generic/bitops/__ffs.h
 create mode 100644 xen/include/asm-generic/bitops/bitops-bits.h
 create mode 100644 xen/include/asm-generic/bitops/ffs.h
 create mode 100644 xen/include/asm-generic/bitops/ffsl.h
 create mode 100644 xen/include/asm-generic/bitops/ffz.h
 create mode 100644 xen/include/asm-generic/bitops/find-first-set-bit.h
 create mode 100644 xen/include/asm-generic/bitops/fls.h
 create mode 100644 xen/include/asm-generic/bitops/flsl.h
 create mode 100644 xen/include/asm-generic/bitops/generic-non-atomic.h
 create mode 100644 xen/include/asm-generic/bitops/hweight.h
 create mode 100644 xen/include/asm-generic/bitops/test-bit.h
 rename xen/{arch/arm/include/asm => include/asm-generic}/nospec.h (79%)

-- 
2.43.0


