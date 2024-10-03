Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4EF98F5A8
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 20:00:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809681.1222128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swQ70-0006jw-UP; Thu, 03 Oct 2024 17:59:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809681.1222128; Thu, 03 Oct 2024 17:59:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swQ70-0006hw-Qu; Thu, 03 Oct 2024 17:59:38 +0000
Received: by outflank-mailman (input) for mailman id 809681;
 Thu, 03 Oct 2024 17:59:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d1Re=Q7=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swQ6z-0006hm-2M
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 17:59:37 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f4e4ab5-81b1-11ef-a0ba-8be0dac302b0;
 Thu, 03 Oct 2024 19:59:34 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a8d24f98215so195590366b.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 10:59:34 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99104731a5sm111876166b.180.2024.10.03.10.59.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 10:59:32 -0700 (PDT)
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
X-Inumbo-ID: 3f4e4ab5-81b1-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727978373; x=1728583173; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hLeebrnlGwDU0DN/xsfl05Gj76W+fg5IZGj7AEDrGJ8=;
        b=FNtQnoFcqp+++0Hw0ve2s3HXZurpZuh72UvmZSIwt1wxf2WI7aAEQc+wYsnh3CaAul
         iyHao7cy/xxB836gWV/4ko/N5CoqVTjV7idjjaXHG0m0MhXsEE7TXovsAlFsUtL6HXwV
         Xc0kGLPrs3NR8qMHXYy+ZZCEPjP3NoTo/JXgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727978373; x=1728583173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hLeebrnlGwDU0DN/xsfl05Gj76W+fg5IZGj7AEDrGJ8=;
        b=hl7qfQeGj4AhcJuSQOeNsF6Ilnqf0VJV4nKGbxLpXlbrEEfd2gZ368Y4aA79lNkOyc
         QD7eEwTUQSUrhKnAgTJa7tckymOXy4au0h9IsCmTNvFRlsiv1E9gT4BLDZDYNTX7rMGi
         kQhiqLm4ER278bcPc068cd5lYsDzHcuuUrXdlL5aKnYiBaHaoYTY4GKl4CKcpJJ4QfL9
         pvtrKDVCBqshUtAUfyuu3R1hQk9bI7Ygp19BlIopUCdeTZ13DZYuIevFDWLzlMdXFygU
         1FIF7+ZpUW8Usg62hcMKvrd+in5M4moMnp5MzCyWM7hpd/yNRowmjg1dqt1EL897KFsh
         8Asg==
X-Gm-Message-State: AOJu0Yz2cjAwRxYyIYLaKYvB4i5iUhhtkxbzDrcxJ4HcnrxhxZIA1yWA
	7mTu0ZQAZLQ+RPfFQ7IBZmy+faxWdM3VDx0/NDD92Sox/YHnsYSJL7HfCBTCcRrLYONYdxjd/DD
	X8XM=
X-Google-Smtp-Source: AGHT+IGifIGY1aZgpLnu20v2AwtlU6SzoZb/PEAP0qw7tmsDRwzhy3O7sQwq3Ec1UY600zdPCuDrbw==
X-Received: by 2002:a17:907:3f18:b0:a6f:593f:d336 with SMTP id a640c23a62f3a-a991bd13582mr20281466b.11.1727978373277;
        Thu, 03 Oct 2024 10:59:33 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Tim Deegan <tim@xen.org>,
	Christopher Clark <christopher.w.clark@gmail.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	=?UTF-8?q?Mateusz=20M=C3=B3wka?= <mateusz.mowka@intel.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	George Dunlap <gwd@xenproject.org>
Subject: [PATCH v2 00/19] Update header guards bases on new coding style
Date: Thu,  3 Oct 2024 18:59:00 +0100
Message-Id: <20241003175919.472774-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the help of some scripts and manual checking I updated header guards.

As the changes are pretty large patch was split based on maintainers
to reduce mail spamming.

Excluded public headers from the update, they are API, software like
Qemu will fail to compile if changed.

Changes since v1:
- make all commit compile;
- exclude public headers, their guard is not an API.

Frediano Ziglio (19):
  xen: Update header guards - Generic
  xen: Update header guards - X86
  xen: Update header guards - ACPI
  xen: Update header guards - ARGO
  xen: Update header guards - ARM
  xen: Update header guards - Device tree
  xen: Update header guards - EFI
  xen: Update header guards - HYPFS
  xen: Update header guards - Intel TXT
  xen: Update header guards - I/O MMU
  xen: Update header guards - Kconfig
  xen: Update header guards - KEXEC
  xen: Update header guards - Live patch
  xen: Update header guards - PPC 64
  xen: Update header guards - RISC-V
  xen: Update header guards - Scheduling
  xen: Update header guards - VM event, mem access, monitor
  xen: Update header guards - VPCI
  xen: Update header guards - XSM/Flask

 tools/libs/guest/xg_dom_decompress_unsafe_zstd.c        | 2 +-
 xen/arch/arm/arm32/lib/assembler.h                      | 6 +++---
 xen/arch/arm/arm64/lib/assembler.h                      | 6 +++---
 xen/arch/arm/decode.h                                   | 6 +++---
 xen/arch/arm/include/asm/acpi.h                         | 6 +++---
 xen/arch/arm/include/asm/alternative.h                  | 6 +++---
 xen/arch/arm/include/asm/arm32/atomic.h                 | 6 +++---
 xen/arch/arm/include/asm/arm32/bitops.h                 | 6 +++---
 xen/arch/arm/include/asm/arm32/bug.h                    | 6 +++---
 xen/arch/arm/include/asm/arm32/cmpxchg.h                | 4 ++--
 xen/arch/arm/include/asm/arm32/flushtlb.h               | 6 +++---
 xen/arch/arm/include/asm/arm32/insn.h                   | 6 +++---
 xen/arch/arm/include/asm/arm32/io.h                     | 6 +++---
 xen/arch/arm/include/asm/arm32/macros.h                 | 6 +++---
 xen/arch/arm/include/asm/arm32/mm.h                     | 6 +++---
 xen/arch/arm/include/asm/arm32/nospec.h                 | 6 +++---
 xen/arch/arm/include/asm/arm32/page.h                   | 6 +++---
 xen/arch/arm/include/asm/arm32/processor.h              | 6 +++---
 xen/arch/arm/include/asm/arm32/sysregs.h                | 6 +++---
 xen/arch/arm/include/asm/arm32/system.h                 | 4 ++--
 xen/arch/arm/include/asm/arm32/traps.h                  | 6 +++---
 xen/arch/arm/include/asm/arm32/vfp.h                    | 6 +++---
 xen/arch/arm/include/asm/arm64/atomic.h                 | 4 ++--
 xen/arch/arm/include/asm/arm64/bitops.h                 | 6 +++---
 xen/arch/arm/include/asm/arm64/brk.h                    | 6 +++---
 xen/arch/arm/include/asm/arm64/bug.h                    | 6 +++---
 xen/arch/arm/include/asm/arm64/cmpxchg.h                | 4 ++--
 xen/arch/arm/include/asm/arm64/cpufeature.h             | 4 ++--
 xen/arch/arm/include/asm/arm64/efibind.h                | 4 ++--
 xen/arch/arm/include/asm/arm64/flushtlb.h               | 6 +++---
 xen/arch/arm/include/asm/arm64/hsr.h                    | 6 +++---
 xen/arch/arm/include/asm/arm64/insn.h                   | 6 +++---
 xen/arch/arm/include/asm/arm64/io.h                     | 6 +++---
 xen/arch/arm/include/asm/arm64/macros.h                 | 6 +++---
 xen/arch/arm/include/asm/arm64/mm.h                     | 6 +++---
 xen/arch/arm/include/asm/arm64/nospec.h                 | 6 +++---
 xen/arch/arm/include/asm/arm64/page.h                   | 6 +++---
 xen/arch/arm/include/asm/arm64/processor.h              | 6 +++---
 xen/arch/arm/include/asm/arm64/sve.h                    | 6 +++---
 xen/arch/arm/include/asm/arm64/sysregs.h                | 4 ++--
 xen/arch/arm/include/asm/arm64/system.h                 | 4 ++--
 xen/arch/arm/include/asm/arm64/traps.h                  | 6 +++---
 xen/arch/arm/include/asm/arm64/vfp.h                    | 6 +++---
 xen/arch/arm/include/asm/asm_defns.h                    | 6 +++---
 xen/arch/arm/include/asm/atomic.h                       | 6 +++---
 xen/arch/arm/include/asm/bitops.h                       | 6 +++---
 xen/arch/arm/include/asm/bug.h                          | 6 +++---
 xen/arch/arm/include/asm/byteorder.h                    | 6 +++---
 xen/arch/arm/include/asm/cache.h                        | 4 ++--
 xen/arch/arm/include/asm/cadence-uart.h                 | 4 ++--
 xen/arch/arm/include/asm/config.h                       | 6 +++---
 xen/arch/arm/include/asm/cpregs.h                       | 4 ++--
 xen/arch/arm/include/asm/cpuerrata.h                    | 6 +++---
 xen/arch/arm/include/asm/cpufeature.h                   | 4 ++--
 xen/arch/arm/include/asm/current.h                      | 6 +++---
 xen/arch/arm/include/asm/div64.h                        | 4 ++--
 xen/arch/arm/include/asm/dom0less-build.h               | 6 +++---
 xen/arch/arm/include/asm/domain.h                       | 6 +++---
 xen/arch/arm/include/asm/domain_build.h                 | 4 ++--
 xen/arch/arm/include/asm/early_printk.h                 | 4 ++--
 xen/arch/arm/include/asm/elf.h                          | 6 +++---
 xen/arch/arm/include/asm/event.h                        | 4 ++--
 xen/arch/arm/include/asm/exynos4210-uart.h              | 6 +++---
 xen/arch/arm/include/asm/fixmap.h                       | 6 +++---
 xen/arch/arm/include/asm/flushtlb.h                     | 6 +++---
 xen/arch/arm/include/asm/gic.h                          | 4 ++--
 xen/arch/arm/include/asm/gic_v3_defs.h                  | 6 +++---
 xen/arch/arm/include/asm/gic_v3_its.h                   | 4 ++--
 xen/arch/arm/include/asm/grant_table.h                  | 6 +++---
 xen/arch/arm/include/asm/guest_access.h                 | 6 +++---
 xen/arch/arm/include/asm/guest_atomics.h                | 6 +++---
 xen/arch/arm/include/asm/guest_walk.h                   | 6 +++---
 xen/arch/arm/include/asm/hsr.h                          | 6 +++---
 xen/arch/arm/include/asm/hypercall.h                    | 8 ++++----
 xen/arch/arm/include/asm/imx-lpuart.h                   | 6 +++---
 xen/arch/arm/include/asm/insn.h                         | 6 +++---
 xen/arch/arm/include/asm/io.h                           | 4 ++--
 xen/arch/arm/include/asm/iommu.h                        | 6 +++---
 xen/arch/arm/include/asm/iommu_fwspec.h                 | 6 +++---
 xen/arch/arm/include/asm/ioreq.h                        | 6 +++---
 xen/arch/arm/include/asm/irq.h                          | 6 +++---
 xen/arch/arm/include/asm/kernel.h                       | 6 +++---
 xen/arch/arm/include/asm/livepatch.h                    | 6 +++---
 xen/arch/arm/include/asm/lpae.h                         | 6 +++---
 xen/arch/arm/include/asm/macros.h                       | 4 ++--
 xen/arch/arm/include/asm/mem_access.h                   | 6 +++---
 xen/arch/arm/include/asm/mm.h                           | 6 +++---
 xen/arch/arm/include/asm/mmio.h                         | 6 +++---
 xen/arch/arm/include/asm/mmu/layout.h                   | 6 +++---
 xen/arch/arm/include/asm/mmu/mm.h                       | 6 +++---
 xen/arch/arm/include/asm/mmu/p2m.h                      | 6 +++---
 xen/arch/arm/include/asm/monitor.h                      | 6 +++---
 xen/arch/arm/include/asm/new_vgic.h                     | 6 +++---
 xen/arch/arm/include/asm/nospec.h                       | 6 +++---
 xen/arch/arm/include/asm/p2m.h                          | 8 ++++----
 xen/arch/arm/include/asm/page-bits.h                    | 6 +++---
 xen/arch/arm/include/asm/page.h                         | 6 +++---
 xen/arch/arm/include/asm/pci.h                          | 6 +++---
 xen/arch/arm/include/asm/perfc.h                        | 4 ++--
 xen/arch/arm/include/asm/perfc_defn.h                   | 6 +++---
 xen/arch/arm/include/asm/pl011-uart.h                   | 6 +++---
 xen/arch/arm/include/asm/platform.h                     | 6 +++---
 xen/arch/arm/include/asm/platforms/exynos5.h            | 6 +++---
 xen/arch/arm/include/asm/platforms/midway.h             | 2 +-
 xen/arch/arm/include/asm/platforms/omap5.h              | 4 ++--
 xen/arch/arm/include/asm/platforms/vexpress.h           | 6 +++---
 xen/arch/arm/include/asm/platforms/xilinx-zynqmp-eemi.h | 6 +++---
 xen/arch/arm/include/asm/pmap.h                         | 6 +++---
 xen/arch/arm/include/asm/processor.h                    | 6 +++---
 xen/arch/arm/include/asm/procinfo.h                     | 4 ++--
 xen/arch/arm/include/asm/psci.h                         | 6 +++---
 xen/arch/arm/include/asm/regs.h                         | 6 +++---
 xen/arch/arm/include/asm/scif-uart.h                    | 6 +++---
 xen/arch/arm/include/asm/setup.h                        | 4 ++--
 xen/arch/arm/include/asm/short-desc.h                   | 6 +++---
 xen/arch/arm/include/asm/smccc.h                        | 6 +++---
 xen/arch/arm/include/asm/smp.h                          | 4 ++--
 xen/arch/arm/include/asm/spinlock.h                     | 6 +++---
 xen/arch/arm/include/asm/static-evtchn.h                | 6 +++---
 xen/arch/arm/include/asm/static-memory.h                | 6 +++---
 xen/arch/arm/include/asm/static-shmem.h                 | 6 +++---
 xen/arch/arm/include/asm/string.h                       | 6 +++---
 xen/arch/arm/include/asm/sysregs.h                      | 6 +++---
 xen/arch/arm/include/asm/system.h                       | 4 ++--
 xen/arch/arm/include/asm/tee/ffa.h                      | 6 +++---
 xen/arch/arm/include/asm/tee/optee_msg.h                | 6 +++---
 xen/arch/arm/include/asm/tee/optee_rpc_cmd.h            | 6 +++---
 xen/arch/arm/include/asm/tee/optee_smc.h                | 6 +++---
 xen/arch/arm/include/asm/tee/tee.h                      | 6 +++---
 xen/arch/arm/include/asm/time.h                         | 6 +++---
 xen/arch/arm/include/asm/traps.h                        | 6 +++---
 xen/arch/arm/include/asm/types.h                        | 6 +++---
 xen/arch/arm/include/asm/vfp.h                          | 6 +++---
 xen/arch/arm/include/asm/vgic-emul.h                    | 6 +++---
 xen/arch/arm/include/asm/vgic.h                         | 6 +++---
 xen/arch/arm/include/asm/vpl011.h                       | 6 +++---
 xen/arch/arm/include/asm/vpsci.h                        | 6 +++---
 xen/arch/arm/include/asm/vreg.h                         | 6 +++---
 xen/arch/arm/include/asm/vtimer.h                       | 4 ++--
 xen/arch/arm/tee/ffa_private.h                          | 6 +++---
 xen/arch/arm/vgic/vgic-mmio.h                           | 4 ++--
 xen/arch/arm/vgic/vgic.h                                | 4 ++--
 xen/arch/arm/vpci.h                                     | 6 +++---
 xen/arch/arm/vuart.h                                    | 6 +++---
 xen/arch/ppc/include/asm/asm-defns.h                    | 6 +++---
 xen/arch/ppc/include/asm/atomic.h                       | 6 +++---
 xen/arch/ppc/include/asm/bitops.h                       | 6 +++---
 xen/arch/ppc/include/asm/boot.h                         | 6 +++---
 xen/arch/ppc/include/asm/bug.h                          | 6 +++---
 xen/arch/ppc/include/asm/byteorder.h                    | 6 +++---
 xen/arch/ppc/include/asm/cache.h                        | 6 +++---
 xen/arch/ppc/include/asm/config.h                       | 6 +++---
 xen/arch/ppc/include/asm/cpufeature.h                   | 6 +++---
 xen/arch/ppc/include/asm/current.h                      | 6 +++---
 xen/arch/ppc/include/asm/domain.h                       | 6 +++---
 xen/arch/ppc/include/asm/early_printk.h                 | 6 +++---
 xen/arch/ppc/include/asm/event.h                        | 6 +++---
 xen/arch/ppc/include/asm/flushtlb.h                     | 6 +++---
 xen/arch/ppc/include/asm/guest_access.h                 | 6 +++---
 xen/arch/ppc/include/asm/guest_atomics.h                | 6 +++---
 xen/arch/ppc/include/asm/io.h                           | 6 +++---
 xen/arch/ppc/include/asm/iommu.h                        | 6 +++---
 xen/arch/ppc/include/asm/irq.h                          | 6 +++---
 xen/arch/ppc/include/asm/memory.h                       | 4 ++--
 xen/arch/ppc/include/asm/mm.h                           | 6 +++---
 xen/arch/ppc/include/asm/monitor.h                      | 6 +++---
 xen/arch/ppc/include/asm/msr.h                          | 6 +++---
 xen/arch/ppc/include/asm/nospec.h                       | 6 +++---
 xen/arch/ppc/include/asm/opal-api.h                     | 6 +++---
 xen/arch/ppc/include/asm/p2m.h                          | 6 +++---
 xen/arch/ppc/include/asm/page-bits.h                    | 6 +++---
 xen/arch/ppc/include/asm/page.h                         | 6 +++---
 xen/arch/ppc/include/asm/processor.h                    | 6 +++---
 xen/arch/ppc/include/asm/regs.h                         | 6 +++---
 xen/arch/ppc/include/asm/setup.h                        | 6 +++---
 xen/arch/ppc/include/asm/smp.h                          | 4 ++--
 xen/arch/ppc/include/asm/spinlock.h                     | 6 +++---
 xen/arch/ppc/include/asm/string.h                       | 6 +++---
 xen/arch/ppc/include/asm/system.h                       | 4 ++--
 xen/arch/ppc/include/asm/time.h                         | 6 +++---
 xen/arch/ppc/include/asm/types.h                        | 6 +++---
 xen/arch/riscv/include/asm/acpi.h                       | 6 +++---
 xen/arch/riscv/include/asm/asm.h                        | 6 +++---
 xen/arch/riscv/include/asm/atomic.h                     | 6 +++---
 xen/arch/riscv/include/asm/bitops.h                     | 6 +++---
 xen/arch/riscv/include/asm/bug.h                        | 6 +++---
 xen/arch/riscv/include/asm/byteorder.h                  | 6 +++---
 xen/arch/riscv/include/asm/cache.h                      | 6 +++---
 xen/arch/riscv/include/asm/cmpxchg.h                    | 6 +++---
 xen/arch/riscv/include/asm/config.h                     | 6 +++---
 xen/arch/riscv/include/asm/cpufeature.h                 | 6 +++---
 xen/arch/riscv/include/asm/csr.h                        | 6 +++---
 xen/arch/riscv/include/asm/current.h                    | 6 +++---
 xen/arch/riscv/include/asm/domain.h                     | 6 +++---
 xen/arch/riscv/include/asm/early_printk.h               | 6 +++---
 xen/arch/riscv/include/asm/event.h                      | 6 +++---
 xen/arch/riscv/include/asm/fence.h                      | 6 +++---
 xen/arch/riscv/include/asm/fixmap.h                     | 6 +++---
 xen/arch/riscv/include/asm/flushtlb.h                   | 6 +++---
 xen/arch/riscv/include/asm/guest_access.h               | 6 +++---
 xen/arch/riscv/include/asm/guest_atomics.h              | 6 +++---
 xen/arch/riscv/include/asm/io.h                         | 6 +++---
 xen/arch/riscv/include/asm/irq.h                        | 6 +++---
 xen/arch/riscv/include/asm/mm.h                         | 6 +++---
 xen/arch/riscv/include/asm/monitor.h                    | 6 +++---
 xen/arch/riscv/include/asm/nospec.h                     | 6 +++---
 xen/arch/riscv/include/asm/p2m.h                        | 6 +++---
 xen/arch/riscv/include/asm/page-bits.h                  | 6 +++---
 xen/arch/riscv/include/asm/page.h                       | 6 +++---
 xen/arch/riscv/include/asm/pmap.h                       | 6 +++---
 xen/arch/riscv/include/asm/processor.h                  | 6 +++---
 xen/arch/riscv/include/asm/regs.h                       | 6 +++---
 xen/arch/riscv/include/asm/riscv_encoding.h             | 4 ++--
 xen/arch/riscv/include/asm/sbi.h                        | 6 +++---
 xen/arch/riscv/include/asm/setup.h                      | 6 +++---
 xen/arch/riscv/include/asm/smp.h                        | 4 ++--
 xen/arch/riscv/include/asm/spinlock.h                   | 6 +++---
 xen/arch/riscv/include/asm/string.h                     | 6 +++---
 xen/arch/riscv/include/asm/system.h                     | 6 +++---
 xen/arch/riscv/include/asm/time.h                       | 6 +++---
 xen/arch/riscv/include/asm/traps.h                      | 6 +++---
 xen/arch/riscv/include/asm/types.h                      | 6 +++---
 xen/arch/x86/boot/video.h                               | 6 +++---
 xen/arch/x86/cpu/mcheck/barrier.h                       | 6 +++---
 xen/arch/x86/cpu/mcheck/mcaction.h                      | 4 ++--
 xen/arch/x86/cpu/mcheck/mce.h                           | 6 +++---
 xen/arch/x86/cpu/mcheck/mce_amd.h                       | 4 ++--
 xen/arch/x86/cpu/mcheck/mctelem.h                       | 4 ++--
 xen/arch/x86/cpu/mcheck/util.h                          | 4 ++--
 xen/arch/x86/cpu/mcheck/vmce.h                          | 4 ++--
 xen/arch/x86/cpu/mcheck/x86_mca.h                       | 6 +++---
 xen/arch/x86/cpu/microcode/private.h                    | 6 +++---
 xen/arch/x86/cpu/mtrr/mtrr.h                            | 6 +++---
 xen/arch/x86/guest/hyperv/private.h                     | 6 +++---
 xen/arch/x86/hvm/svm/nestedhvm.h                        | 6 +++---
 xen/arch/x86/hvm/svm/svm.h                              | 6 +++---
 xen/arch/x86/hvm/viridian/private.h                     | 6 +++---
 xen/arch/x86/include/asm/acpi.h                         | 4 ++--
 xen/arch/x86/include/asm/alternative-asm.h              | 6 +++---
 xen/arch/x86/include/asm/alternative.h                  | 6 +++---
 xen/arch/x86/include/asm/altp2m.h                       | 6 +++---
 xen/arch/x86/include/asm/amd.h                          | 6 +++---
 xen/arch/x86/include/asm/apic.h                         | 6 +++---
 xen/arch/x86/include/asm/apicdef.h                      | 4 ++--
 xen/arch/x86/include/asm/asm_defns.h                    | 6 +++---
 xen/arch/x86/include/asm/atomic.h                       | 6 +++---
 xen/arch/x86/include/asm/bitops.h                       | 6 +++---
 xen/arch/x86/include/asm/bug.h                          | 6 +++---
 xen/arch/x86/include/asm/byteorder.h                    | 6 +++---
 xen/arch/x86/include/asm/bzimage.h                      | 6 +++---
 xen/arch/x86/include/asm/cache.h                        | 4 ++--
 xen/arch/x86/include/asm/config.h                       | 6 +++---
 xen/arch/x86/include/asm/cpu-policy.h                   | 6 +++---
 xen/arch/x86/include/asm/cpufeature.h                   | 6 +++---
 xen/arch/x86/include/asm/cpufeatureset.h                | 6 +++---
 xen/arch/x86/include/asm/cpuid.h                        | 6 +++---
 xen/arch/x86/include/asm/cpuidle.h                      | 4 ++--
 xen/arch/x86/include/asm/current.h                      | 6 +++---
 xen/arch/x86/include/asm/debugreg.h                     | 6 +++---
 xen/arch/x86/include/asm/desc.h                         | 6 +++---
 xen/arch/x86/include/asm/device.h                       | 6 +++---
 xen/arch/x86/include/asm/dom0_build.h                   | 6 +++---
 xen/arch/x86/include/asm/domain.h                       | 6 +++---
 xen/arch/x86/include/asm/e820.h                         | 6 +++---
 xen/arch/x86/include/asm/edd.h                          | 6 +++---
 xen/arch/x86/include/asm/elf.h                          | 6 +++---
 xen/arch/x86/include/asm/endbr.h                        | 6 +++---
 xen/arch/x86/include/asm/event.h                        | 4 ++--
 xen/arch/x86/include/asm/fixmap.h                       | 4 ++--
 xen/arch/x86/include/asm/flushtlb.h                     | 6 +++---
 xen/arch/x86/include/asm/gdbsx.h                        | 6 +++---
 xen/arch/x86/include/asm/genapic.h                      | 4 ++--
 xen/arch/x86/include/asm/grant_table.h                  | 6 +++---
 xen/arch/x86/include/asm/guest.h                        | 6 +++---
 xen/arch/x86/include/asm/guest/hyperv-hcall.h           | 6 +++---
 xen/arch/x86/include/asm/guest/hyperv-tlfs.h            | 4 ++--
 xen/arch/x86/include/asm/guest/hyperv.h                 | 6 +++---
 xen/arch/x86/include/asm/guest/hypervisor.h             | 6 +++---
 xen/arch/x86/include/asm/guest/pvh-boot.h               | 6 +++---
 xen/arch/x86/include/asm/guest/xen-hcall.h              | 6 +++---
 xen/arch/x86/include/asm/guest/xen.h                    | 6 +++---
 xen/arch/x86/include/asm/guest_access.h                 | 6 +++---
 xen/arch/x86/include/asm/guest_atomics.h                | 6 +++---
 xen/arch/x86/include/asm/guest_pt.h                     | 6 +++---
 xen/arch/x86/include/asm/hap.h                          | 4 ++--
 xen/arch/x86/include/asm/hardirq.h                      | 6 +++---
 xen/arch/x86/include/asm/hpet.h                         | 6 +++---
 xen/arch/x86/include/asm/hvm/asid.h                     | 6 +++---
 xen/arch/x86/include/asm/hvm/cacheattr.h                | 6 +++---
 xen/arch/x86/include/asm/hvm/domain.h                   | 6 +++---
 xen/arch/x86/include/asm/hvm/emulate.h                  | 6 +++---
 xen/arch/x86/include/asm/hvm/grant_table.h              | 6 +++---
 xen/arch/x86/include/asm/hvm/guest_access.h             | 6 +++---
 xen/arch/x86/include/asm/hvm/hvm.h                      | 6 +++---
 xen/arch/x86/include/asm/hvm/io.h                       | 6 +++---
 xen/arch/x86/include/asm/hvm/ioreq.h                    | 6 +++---
 xen/arch/x86/include/asm/hvm/irq.h                      | 6 +++---
 xen/arch/x86/include/asm/hvm/monitor.h                  | 6 +++---
 xen/arch/x86/include/asm/hvm/nestedhvm.h                | 6 +++---
 xen/arch/x86/include/asm/hvm/save.h                     | 6 +++---
 xen/arch/x86/include/asm/hvm/support.h                  | 6 +++---
 xen/arch/x86/include/asm/hvm/svm/nestedsvm.h            | 4 ++--
 xen/arch/x86/include/asm/hvm/svm/svm.h                  | 6 +++---
 xen/arch/x86/include/asm/hvm/svm/svmdebug.h             | 6 +++---
 xen/arch/x86/include/asm/hvm/svm/vmcb.h                 | 4 ++--
 xen/arch/x86/include/asm/hvm/vcpu.h                     | 6 +++---
 xen/arch/x86/include/asm/hvm/vioapic.h                  | 6 +++---
 xen/arch/x86/include/asm/hvm/viridian.h                 | 6 +++---
 xen/arch/x86/include/asm/hvm/vlapic.h                   | 6 +++---
 xen/arch/x86/include/asm/hvm/vm_event.h                 | 6 +++---
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h                 | 4 ++--
 xen/arch/x86/include/asm/hvm/vmx/vmx.h                  | 6 +++---
 xen/arch/x86/include/asm/hvm/vmx/vvmx.h                 | 6 +++---
 xen/arch/x86/include/asm/hvm/vpic.h                     | 6 +++---
 xen/arch/x86/include/asm/hvm/vpt.h                      | 6 +++---
 xen/arch/x86/include/asm/hypercall.h                    | 8 ++++----
 xen/arch/x86/include/asm/i387.h                         | 6 +++---
 xen/arch/x86/include/asm/intel-family.h                 | 6 +++---
 xen/arch/x86/include/asm/invpcid.h                      | 6 +++---
 xen/arch/x86/include/asm/io.h                           | 4 ++--
 xen/arch/x86/include/asm/io_apic.h                      | 4 ++--
 xen/arch/x86/include/asm/iocap.h                        | 6 +++---
 xen/arch/x86/include/asm/iommu.h                        | 6 +++---
 xen/arch/x86/include/asm/ioreq.h                        | 6 +++---
 xen/arch/x86/include/asm/irq.h                          | 6 +++---
 xen/arch/x86/include/asm/ldt.h                          | 4 ++--
 xen/arch/x86/include/asm/livepatch.h                    | 6 +++---
 xen/arch/x86/include/asm/mach-default/bios_ebda.h       | 6 +++---
 xen/arch/x86/include/asm/mach-default/io_ports.h        | 6 +++---
 xen/arch/x86/include/asm/mach-default/irq_vectors.h     | 6 +++---
 xen/arch/x86/include/asm/mach-default/mach_mpspec.h     | 6 +++---
 xen/arch/x86/include/asm/mach-generic/mach_apic.h       | 6 +++---
 xen/arch/x86/include/asm/machine_kexec.h                | 6 +++---
 xen/arch/x86/include/asm/mc146818rtc.h                  | 6 +++---
 xen/arch/x86/include/asm/mce.h                          | 4 ++--
 xen/arch/x86/include/asm/mem_access.h                   | 6 +++---
 xen/arch/x86/include/asm/mem_paging.h                   | 6 +++---
 xen/arch/x86/include/asm/mem_sharing.h                  | 6 +++---
 xen/arch/x86/include/asm/microcode.h                    | 6 +++---
 xen/arch/x86/include/asm/mm.h                           | 6 +++---
 xen/arch/x86/include/asm/monitor.h                      | 6 +++---
 xen/arch/x86/include/asm/mpspec.h                       | 4 ++--
 xen/arch/x86/include/asm/mpspec_def.h                   | 4 ++--
 xen/arch/x86/include/asm/msi.h                          | 6 +++---
 xen/arch/x86/include/asm/msr-index.h                    | 6 +++---
 xen/arch/x86/include/asm/msr.h                          | 6 +++---
 xen/arch/x86/include/asm/mtrr.h                         | 6 +++---
 xen/arch/x86/include/asm/multicall.h                    | 6 +++---
 xen/arch/x86/include/asm/mwait.h                        | 6 +++---
 xen/arch/x86/include/asm/nmi.h                          | 6 +++---
 xen/arch/x86/include/asm/nops.h                         | 6 +++---
 xen/arch/x86/include/asm/nospec.h                       | 6 +++---
 xen/arch/x86/include/asm/numa.h                         | 4 ++--
 xen/arch/x86/include/asm/p2m.h                          | 8 ++++----
 xen/arch/x86/include/asm/page-bits.h                    | 6 +++---
 xen/arch/x86/include/asm/page.h                         | 6 +++---
 xen/arch/x86/include/asm/paging.h                       | 4 ++--
 xen/arch/x86/include/asm/pci.h                          | 6 +++---
 xen/arch/x86/include/asm/perfc.h                        | 4 ++--
 xen/arch/x86/include/asm/perfc_defn.h                   | 6 +++---
 xen/arch/x86/include/asm/processor.h                    | 6 +++---
 xen/arch/x86/include/asm/prot-key.h                     | 6 +++---
 xen/arch/x86/include/asm/psr.h                          | 6 +++---
 xen/arch/x86/include/asm/pt-contig-markers.h            | 6 +++---
 xen/arch/x86/include/asm/pv/domain.h                    | 6 +++---
 xen/arch/x86/include/asm/pv/grant_table.h               | 6 +++---
 xen/arch/x86/include/asm/pv/mm.h                        | 6 +++---
 xen/arch/x86/include/asm/pv/shim.h                      | 6 +++---
 xen/arch/x86/include/asm/pv/trace.h                     | 6 +++---
 xen/arch/x86/include/asm/pv/traps.h                     | 6 +++---
 xen/arch/x86/include/asm/random.h                       | 6 +++---
 xen/arch/x86/include/asm/regs.h                         | 6 +++---
 xen/arch/x86/include/asm/setup.h                        | 4 ++--
 xen/arch/x86/include/asm/shadow.h                       | 6 +++---
 xen/arch/x86/include/asm/shared.h                       | 6 +++---
 xen/arch/x86/include/asm/shstk.h                        | 6 +++---
 xen/arch/x86/include/asm/smp.h                          | 4 ++--
 xen/arch/x86/include/asm/softirq.h                      | 6 +++---
 xen/arch/x86/include/asm/spec_ctrl.h                    | 6 +++---
 xen/arch/x86/include/asm/spec_ctrl_asm.h                | 6 +++---
 xen/arch/x86/include/asm/spinlock.h                     | 6 +++---
 xen/arch/x86/include/asm/string.h                       | 6 +++---
 xen/arch/x86/include/asm/system.h                       | 4 ++--
 xen/arch/x86/include/asm/tboot.h                        | 6 +++---
 xen/arch/x86/include/asm/time.h                         | 6 +++---
 xen/arch/x86/include/asm/trampoline.h                   | 6 +++---
 xen/arch/x86/include/asm/traps.h                        | 6 +++---
 xen/arch/x86/include/asm/types.h                        | 6 +++---
 xen/arch/x86/include/asm/uaccess.h                      | 6 +++---
 xen/arch/x86/include/asm/vm_event.h                     | 6 +++---
 xen/arch/x86/include/asm/vpmu.h                         | 6 +++---
 xen/arch/x86/include/asm/x86-defns.h                    | 6 +++---
 xen/arch/x86/include/asm/x86-vendors.h                  | 6 +++---
 xen/arch/x86/include/asm/x86_64/efibind.h               | 4 ++--
 xen/arch/x86/include/asm/x86_64/elf.h                   | 6 +++---
 xen/arch/x86/include/asm/x86_64/page.h                  | 6 +++---
 xen/arch/x86/include/asm/x86_64/regs.h                  | 4 ++--
 xen/arch/x86/include/asm/x86_64/system.h                | 6 +++---
 xen/arch/x86/include/asm/x86_64/uaccess.h               | 6 +++---
 xen/arch/x86/include/asm/x86_emulate.h                  | 6 +++---
 xen/arch/x86/include/asm/xenoprof.h                     | 6 +++---
 xen/arch/x86/include/asm/xstate.h                       | 6 +++---
 xen/arch/x86/mm/hap/private.h                           | 6 +++---
 xen/arch/x86/mm/mm-locks.h                              | 6 +++---
 xen/arch/x86/mm/p2m.h                                   | 6 +++---
 xen/arch/x86/mm/shadow/private.h                        | 6 +++---
 xen/arch/x86/mm/shadow/types.h                          | 6 +++---
 xen/arch/x86/oprofile/op_counter.h                      | 6 +++---
 xen/arch/x86/oprofile/op_x86_model.h                    | 6 +++---
 xen/arch/x86/pv/emulate.h                               | 6 +++---
 xen/arch/x86/pv/mm.h                                    | 6 +++---
 xen/arch/x86/x86_emulate/x86_emulate.h                  | 6 +++---
 xen/common/coverage/coverage.h                          | 4 ++--
 xen/common/coverage/gcov.h                              | 6 +++---
 xen/common/libelf/libelf-private.h                      | 6 +++---
 xen/common/libfdt/libfdt_internal.h                     | 6 +++---
 xen/common/lz4/defs.h                                   | 6 +++---
 xen/common/sched/private.h                              | 6 +++---
 xen/common/ubsan/ubsan.h                                | 4 ++--
 xen/common/xz/lzma2.h                                   | 4 ++--
 xen/common/xz/private.h                                 | 4 ++--
 xen/common/xz/stream.h                                  | 4 ++--
 xen/common/zstd/bitstream.h                             | 6 +++---
 xen/common/zstd/error_private.h                         | 6 +++---
 xen/common/zstd/fse.h                                   | 6 +++---
 xen/common/zstd/huf.h                                   | 6 +++---
 xen/common/zstd/mem.h                                   | 6 +++---
 xen/common/zstd/zstd_internal.h                         | 6 +++---
 xen/drivers/acpi/apei/apei-internal.h                   | 4 ++--
 xen/drivers/passthrough/amd/iommu-defs.h                | 6 +++---
 xen/drivers/passthrough/amd/iommu.h                     | 6 +++---
 xen/drivers/passthrough/arm/smmu-v3.h                   | 6 +++---
 xen/drivers/passthrough/ats.h                           | 6 +++---
 xen/drivers/passthrough/vtd/dmar.h                      | 6 +++---
 xen/drivers/passthrough/vtd/extern.h                    | 6 +++---
 xen/drivers/passthrough/vtd/iommu.h                     | 4 ++--
 xen/drivers/passthrough/vtd/vtd.h                       | 6 +++---
 xen/drivers/video/font.h                                | 6 +++---
 xen/drivers/video/lfb.h                                 | 4 ++--
 xen/drivers/video/modelines.h                           | 4 ++--
 xen/include/acpi/acconfig.h                             | 6 +++---
 xen/include/acpi/acexcep.h                              | 6 +++---
 xen/include/acpi/acglobal.h                             | 6 +++---
 xen/include/acpi/achware.h                              | 6 +++---
 xen/include/acpi/aclocal.h                              | 6 +++---
 xen/include/acpi/acmacros.h                             | 4 ++--
 xen/include/acpi/acnames.h                              | 6 +++---
 xen/include/acpi/acoutput.h                             | 6 +++---
 xen/include/acpi/acpi.h                                 | 6 +++---
 xen/include/acpi/acpiosxf.h                             | 6 +++---
 xen/include/acpi/acpixf.h                               | 6 +++---
 xen/include/acpi/actables.h                             | 6 +++---
 xen/include/acpi/actbl.h                                | 6 +++---
 xen/include/acpi/actbl1.h                               | 6 +++---
 xen/include/acpi/actbl2.h                               | 6 +++---
 xen/include/acpi/actbl3.h                               | 6 +++---
 xen/include/acpi/actypes.h                              | 6 +++---
 xen/include/acpi/acutils.h                              | 6 +++---
 xen/include/acpi/apei.h                                 | 4 ++--
 xen/include/acpi/cpufreq/cpufreq.h                      | 6 +++---
 xen/include/acpi/cpufreq/processor_perf.h               | 6 +++---
 xen/include/acpi/pdc_intel.h                            | 6 +++---
 xen/include/acpi/platform/acenv.h                       | 6 +++---
 xen/include/acpi/platform/acgcc.h                       | 6 +++---
 xen/include/acpi/platform/aclinux.h                     | 6 +++---
 xen/include/asm-generic/altp2m.h                        | 6 +++---
 xen/include/asm-generic/atomic-ops.h                    | 6 +++---
 xen/include/asm-generic/device.h                        | 6 +++---
 xen/include/asm-generic/div64.h                         | 4 ++--
 xen/include/asm-generic/hardirq.h                       | 6 +++---
 xen/include/asm-generic/hypercall.h                     | 8 ++++----
 xen/include/asm-generic/iocap.h                         | 6 +++---
 xen/include/asm-generic/monitor.h                       | 6 +++---
 xen/include/asm-generic/paging.h                        | 6 +++---
 xen/include/asm-generic/percpu.h                        | 6 +++---
 xen/include/asm-generic/random.h                        | 6 +++---
 xen/include/asm-generic/softirq.h                       | 6 +++---
 xen/include/asm-generic/vm_event.h                      | 6 +++---
 xen/include/crypto/rijndael.h                           | 6 +++---
 xen/include/crypto/vmac.h                               | 4 ++--
 xen/include/efi/efiapi.h                                | 4 ++--
 xen/include/efi/eficapsule.h                            | 4 ++--
 xen/include/efi/eficon.h                                | 4 ++--
 xen/include/efi/efidef.h                                | 4 ++--
 xen/include/efi/efidevp.h                               | 4 ++--
 xen/include/efi/efierr.h                                | 4 ++--
 xen/include/efi/efipciio.h                              | 6 +++---
 xen/include/efi/efiprot.h                               | 4 ++--
 xen/include/public/arch-arm.h                           | 6 +++---
 xen/include/public/arch-arm/hvm/save.h                  | 4 ++--
 xen/include/public/arch-arm/smccc.h                     | 6 +++---
 xen/include/public/arch-x86/cpufeatureset.h             | 6 +++---
 xen/include/public/arch-x86/cpuid.h                     | 6 +++---
 xen/include/public/arch-x86/guest-acpi.h                | 6 +++---
 xen/include/public/arch-x86/hvm/save.h                  | 6 +++---
 xen/include/public/arch-x86/hvm/start_info.h            | 6 +++---
 xen/include/public/arch-x86/pmu.h                       | 6 +++---
 xen/include/public/arch-x86/xen-mca.h                   | 6 +++---
 xen/include/public/arch-x86/xen-x86_32.h                | 6 +++---
 xen/include/public/arch-x86/xen-x86_64.h                | 6 +++---
 xen/include/public/arch-x86/xen.h                       | 6 +++---
 xen/include/public/argo.h                               | 4 ++--
 xen/include/public/vm_event.h                           | 6 +++---
 xen/include/xen/8250-uart.h                             | 6 +++---
 xen/include/xen/acpi.h                                  | 6 +++---
 xen/include/xen/alternative-call.h                      | 6 +++---
 xen/include/xen/argo.h                                  | 4 ++--
 xen/include/xen/atomic.h                                | 6 +++---
 xen/include/xen/bitmap.h                                | 6 +++---
 xen/include/xen/bitops.h                                | 6 +++---
 xen/include/xen/bootfdt.h                               | 6 +++---
 xen/include/xen/bug.h                                   | 6 +++---
 xen/include/xen/byteorder/big_endian.h                  | 6 +++---
 xen/include/xen/byteorder/generic.h                     | 6 +++---
 xen/include/xen/byteorder/little_endian.h               | 6 +++---
 xen/include/xen/byteorder/swab.h                        | 6 +++---
 xen/include/xen/cache.h                                 | 6 +++---
 xen/include/xen/compat.h                                | 6 +++---
 xen/include/xen/compiler.h                              | 6 +++---
 xen/include/xen/config.h                                | 6 +++---
 xen/include/xen/console.h                               | 6 +++---
 xen/include/xen/consoled.h                              | 6 +++---
 xen/include/xen/const.h                                 | 6 +++---
 xen/include/xen/coverage.h                              | 4 ++--
 xen/include/xen/cper.h                                  | 4 ++--
 xen/include/xen/cpu.h                                   | 6 +++---
 xen/include/xen/cpuidle.h                               | 6 +++---
 xen/include/xen/cpumask.h                               | 6 +++---
 xen/include/xen/ctype.h                                 | 4 ++--
 xen/include/xen/decompress.h                            | 4 ++--
 xen/include/xen/delay.h                                 | 6 +++---
 xen/include/xen/device_tree.h                           | 4 ++--
 xen/include/xen/dm.h                                    | 6 +++---
 xen/include/xen/dmi.h                                   | 6 +++---
 xen/include/xen/domain.h                                | 6 +++---
 xen/include/xen/domain_page.h                           | 6 +++---
 xen/include/xen/dt-overlay.h                            | 6 +++---
 xen/include/xen/early_printk.h                          | 4 ++--
 xen/include/xen/earlycpio.h                             | 6 +++---
 xen/include/xen/efi.h                                   | 6 +++---
 xen/include/xen/elf.h                                   | 6 +++---
 xen/include/xen/elfcore.h                               | 6 +++---
 xen/include/xen/elfstructs.h                            | 6 +++---
 xen/include/xen/err.h                                   | 6 +++---
 xen/include/xen/errno.h                                 | 6 +++---
 xen/include/xen/event.h                                 | 6 +++---
 xen/include/xen/grant_table.h                           | 6 +++---
 xen/include/xen/guest_access.h                          | 6 +++---
 xen/include/xen/gunzip.h                                | 4 ++--
 xen/include/xen/hypercall.h                             | 6 +++---
 xen/include/xen/hypfs.h                                 | 6 +++---
 xen/include/xen/init.h                                  | 6 +++---
 xen/include/xen/inttypes.h                              | 6 +++---
 xen/include/xen/iocap.h                                 | 6 +++---
 xen/include/xen/iommu.h                                 | 6 +++---
 xen/include/xen/ioreq.h                                 | 6 +++---
 xen/include/xen/irq.h                                   | 6 +++---
 xen/include/xen/irq_cpustat.h                           | 6 +++---
 xen/include/xen/kconfig.h                               | 6 +++---
 xen/include/xen/kernel.h                                | 6 +++---
 xen/include/xen/kexec.h                                 | 6 +++---
 xen/include/xen/keyhandler.h                            | 6 +++---
 xen/include/xen/kimage.h                                | 6 +++---
 xen/include/xen/lib.h                                   | 6 +++---
 xen/include/xen/lib/x86/cpu-policy.h                    | 6 +++---
 xen/include/xen/libelf.h                                | 6 +++---
 xen/include/xen/libfdt/fdt.h                            | 6 +++---
 xen/include/xen/libfdt/libfdt-xen.h                     | 6 +++---
 xen/include/xen/libfdt/libfdt.h                         | 6 +++---
 xen/include/xen/libfdt/libfdt_env.h                     | 6 +++---
 xen/include/xen/linkage.h                               | 6 +++---
 xen/include/xen/linux-compat.h                          | 6 +++---
 xen/include/xen/list.h                                  | 6 +++---
 xen/include/xen/list_sort.h                             | 4 ++--
 xen/include/xen/livepatch.h                             | 6 +++---
 xen/include/xen/livepatch_elf.h                         | 6 +++---
 xen/include/xen/livepatch_payload.h                     | 6 +++---
 xen/include/xen/lz4.h                                   | 4 ++--
 xen/include/xen/lzo.h                                   | 4 ++--
 xen/include/xen/macros.h                                | 6 +++---
 xen/include/xen/mem_access.h                            | 6 +++---
 xen/include/xen/mm-frame.h                              | 6 +++---
 xen/include/xen/mm.h                                    | 6 +++---
 xen/include/xen/monitor.h                               | 6 +++---
 xen/include/xen/msi.h                                   | 4 ++--
 xen/include/xen/multiboot.h                             | 6 +++---
 xen/include/xen/multiboot2.h                            | 6 +++---
 xen/include/xen/multicall.h                             | 6 +++---
 xen/include/xen/nodemask.h                              | 6 +++---
 xen/include/xen/nospec.h                                | 6 +++---
 xen/include/xen/notifier.h                              | 6 +++---
 xen/include/xen/numa.h                                  | 6 +++---
 xen/include/xen/p2m-common.h                            | 6 +++---
 xen/include/xen/page-defs.h                             | 6 +++---
 xen/include/xen/page-size.h                             | 4 ++--
 xen/include/xen/paging.h                                | 6 +++---
 xen/include/xen/param.h                                 | 6 +++---
 xen/include/xen/pci.h                                   | 6 +++---
 xen/include/xen/pci_regs.h                              | 6 +++---
 xen/include/xen/pdx.h                                   | 6 +++---
 xen/include/xen/percpu.h                                | 6 +++---
 xen/include/xen/perfc.h                                 | 6 +++---
 xen/include/xen/perfc_defn.h                            | 6 +++---
 xen/include/xen/pfn.h                                   | 6 +++---
 xen/include/xen/pmap.h                                  | 6 +++---
 xen/include/xen/pmstat.h                                | 6 +++---
 xen/include/xen/preempt.h                               | 6 +++---
 xen/include/xen/prefetch.h                              | 4 ++--
 xen/include/xen/pv_console.h                            | 6 +++---
 xen/include/xen/radix-tree.h                            | 6 +++---
 xen/include/xen/random.h                                | 6 +++---
 xen/include/xen/rangeset.h                              | 6 +++---
 xen/include/xen/rbtree.h                                | 6 +++---
 xen/include/xen/rcupdate.h                              | 6 +++---
 xen/include/xen/rwlock.h                                | 6 +++---
 xen/include/xen/sched.h                                 | 6 +++---
 xen/include/xen/sections.h                              | 6 +++---
 xen/include/xen/self-tests.h                            | 6 +++---
 xen/include/xen/serial.h                                | 6 +++---
 xen/include/xen/shared.h                                | 6 +++---
 xen/include/xen/shutdown.h                              | 6 +++---
 xen/include/xen/sizes.h                                 | 6 +++---
 xen/include/xen/smp.h                                   | 6 +++---
 xen/include/xen/softirq.h                               | 6 +++---
 xen/include/xen/sort.h                                  | 6 +++---
 xen/include/xen/spinlock.h                              | 6 +++---
 xen/include/xen/stdarg.h                                | 6 +++---
 xen/include/xen/stdbool.h                               | 6 +++---
 xen/include/xen/stdint.h                                | 6 +++---
 xen/include/xen/stop_machine.h                          | 6 +++---
 xen/include/xen/string.h                                | 6 +++---
 xen/include/xen/stringify.h                             | 6 +++---
 xen/include/xen/symbols.h                               | 6 +++---
 xen/include/xen/tasklet.h                               | 6 +++---
 xen/include/xen/time.h                                  | 6 +++---
 xen/include/xen/timer.h                                 | 6 +++---
 xen/include/xen/trace.h                                 | 6 +++---
 xen/include/xen/types.h                                 | 6 +++---
 xen/include/xen/typesafe.h                              | 6 +++---
 xen/include/xen/unaligned.h                             | 6 +++---
 xen/include/xen/version.h                               | 6 +++---
 xen/include/xen/vga.h                                   | 6 +++---
 xen/include/xen/video.h                                 | 6 +++---
 xen/include/xen/virtual_region.h                        | 6 +++---
 xen/include/xen/vm_event.h                              | 6 +++---
 xen/include/xen/vmap.h                                  | 6 +++---
 xen/include/xen/vpci.h                                  | 4 ++--
 xen/include/xen/wait.h                                  | 6 +++---
 xen/include/xen/warning.h                               | 4 ++--
 xen/include/xen/watchdog.h                              | 6 +++---
 xen/include/xen/xen.lds.h                               | 6 +++---
 xen/include/xen/xenoprof.h                              | 4 ++--
 xen/include/xen/xmalloc.h                               | 6 +++---
 xen/include/xen/xxhash.h                                | 6 +++---
 xen/include/xsm/dummy.h                                 | 6 +++---
 xen/include/xsm/xsm.h                                   | 4 ++--
 xen/lib/x86/private.h                                   | 6 +++---
 xen/tools/kconfig/expr.h                                | 6 +++---
 xen/tools/kconfig/images.h                              | 6 +++---
 xen/tools/kconfig/list.h                                | 4 ++--
 xen/tools/kconfig/lkc.h                                 | 6 +++---
 xen/xsm/flask/include/avc.h                             | 6 +++---
 xen/xsm/flask/include/avc_ss.h                          | 6 +++---
 xen/xsm/flask/include/conditional.h                     | 4 ++--
 xen/xsm/flask/include/objsec.h                          | 6 +++---
 xen/xsm/flask/include/security.h                        | 6 +++---
 xen/xsm/flask/private.h                                 | 6 +++---
 xen/xsm/flask/ss/avtab.h                                | 6 +++---
 xen/xsm/flask/ss/conditional.h                          | 6 +++---
 xen/xsm/flask/ss/constraint.h                           | 6 +++---
 xen/xsm/flask/ss/context.h                              | 6 +++---
 xen/xsm/flask/ss/ebitmap.h                              | 6 +++---
 xen/xsm/flask/ss/hashtab.h                              | 4 ++--
 xen/xsm/flask/ss/mls.h                                  | 4 ++--
 xen/xsm/flask/ss/mls_types.h                            | 6 +++---
 xen/xsm/flask/ss/policydb.h                             | 6 +++---
 xen/xsm/flask/ss/services.h                             | 6 +++---
 xen/xsm/flask/ss/sidtab.h                               | 6 +++---
 xen/xsm/flask/ss/symtab.h                               | 6 +++---
 679 files changed, 1929 insertions(+), 1929 deletions(-)

-- 
2.34.1


