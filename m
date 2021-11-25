Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C55B245DB65
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 14:41:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231209.399955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqEzN-0007sv-ER; Thu, 25 Nov 2021 13:40:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231209.399955; Thu, 25 Nov 2021 13:40:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqEzN-0007lo-7y; Thu, 25 Nov 2021 13:40:37 +0000
Received: by outflank-mailman (input) for mailman id 231209;
 Thu, 25 Nov 2021 13:40:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nd7+=QM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mqEzK-0007NX-If
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 13:40:35 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40d07d31-4df5-11ec-9787-a32c541c8605;
 Thu, 25 Nov 2021 14:40:30 +0100 (CET)
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
X-Inumbo-ID: 40d07d31-4df5-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637847630;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DzvwX2p4CzntBZ/jg2t5IVxo/46/IjDyI06TF7RS/n0=;
  b=SxHOly6P+/d7xeXpygD00VHOIWBs5oorYHNI0ZNeJjdMDxb+l3j0GV8x
   R8/USxqt0+Pm5z55faJ6ZkWm2DDS/x1Dru2Pvxon1di0Qu0+MtH2Th6el
   6xzEDxCugcK6fCaNm9BFxi8B/uGL7f6cDv3UDPFY1iUxyqXHhQ3JLlbwj
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Q9l8HMJyru+zeX1DEV0Mk8DTWIP50rx9K6gtZLB6b4HLZb00xxuFKu9dH5F1H37s5fnLd4hvpt
 M8uYH7FSqdDlgQ5CBYVZuQYcKMKEWtekJKGG+UPNkZBI4XgI1AOFEO0g7bcb51wTRG3D4AHhzW
 Zu2o9LkeOeTfUfUkUunNbKzzdWcwgvtJJv/uwv9p4SM3i64squrqqbMdJL8/MwO2kUt7txjIW4
 LorpcUJKoP4z2r7Xg2ahMJ+ldJc453x70QHT2BlLMihMTpuIaMFclsCWCghoOG3eBK1PgVzGDV
 pOh524xP3NEOxgjfWRcodffH
X-SBRS: 5.1
X-MesageID: 58617606
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:a20vu6zObCTu3QquEGV6t+eFwCrEfRIJ4+MujC+fZmUNrF6WrkUCn
 TZJDzjVMq3ca2vzct8nPdzk8k4PvsDcmNZmSlFo/iAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAuLeNYYH1500s6wrRk2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt+J/1
 d5W7aGpdRksOKfHw+YQCxxBGhgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVors0lMMnsOpJZonx6xCvVJf0nXYrCU+PB4towMDIY25AQRKmAP
 5RxhTxHNDDvOyJhB3QrJZ86uMOwr2DPIhkbtwfAzUYwyzeKl1EguFT3C/LOYcCDT8hRmkeep
 0rF8n7/DxVcM8aQoRKH73ati+nnjS79HoUIG9WQ6vdviUa72m8XBRsZRFa/5/K+jyaWRNZ3O
 0ESvC00osAa9kamU938VB2Qu2Ofs1gXXN84O+439gCLjLbV6gCxB24YQzoHY9sj3OcyWD8jz
 U3Pn9r2Hy1rs7q9TXOb66fSrDWuNCxTJmgHDQcFUgkt89TluJs0jB/EUpBkCqHdpsX8BDXY0
 z2M6i8kiN07hM8Q3qS/9HjNgi6gq5bESAI4/EPcWWfNxgh+YoiiZYCh91nAxflFJYedCFKGu
 RAsksyf9/wHDIvLmjaERu4MB5m26/3DOzrZ6XZ/Ep9k+zmz9nqLeYFL/Co4NEpvKtwDezLif
 AnUoww5zJ1OOj2sZKx+YYO0Auwry7TtEZLuUfW8RtBJaJJgeRSH+CxrbEi40GXkkUxqmqY6U
 b+ldsKrAWcfGL5Q5jO8TOcA0pcm3ik7g2jUQPjT1wymy7GXYHefVJ8PMUeCY+406q+JukPe9
 NM3H8iNzQ9WXKvhYy3U2YkJJFsOID4wApWeg8ZabPKZKwxqXmQoEebMwKgJcpZg2a9Sk4/1E
 mqVAxECjgCl3DuedFvMOisLhK7TsYhXn3wmNjd0AE+UxX0la4307qpHcoI+ROxynAB89sJcQ
 /4AcsSGJ/1ATDXb5jgQBaXAQJxemAeD3lzXYXf8CNQrV9s5HlGSpIe4Fuf63HBWVnLfiCcon
 1G3Ouo3q7InTh8qMsvZYenHI7iZ7SlEw7Ias6clz7BulKTQHGpCd3OZYhwfeZhkxfD/Ktyyj
 Vv+PPvgjbORy7LZCfGQ7Ux+k6+nEvFlAm1RFHTB4LC9OEHypzT4ntAfAbbYLGqDBQsYHZlOg
 s0PkZnB3AAvxg4W4+KQ7Z43pU7B2zcfj+ADlVk1dJk6R1+qFqlhMhG7MTpn7cVwKktikVLuA
 Cqno4ACUZ3QYZ+NOANBdWINM7XYvdlJy2a60BjACBijjMOB1OHcChs60tjloHE1EYaZx6t5m
 7p845BPtFTk4vfoW/7f5h1pG623BiRoe80aWlsyWucHUyInlQNPZ4LyECjz7M3dYtlAKBByc
 DSVmLDDl/JXwU+bKyg/En3E3Ox8g5USuU8VkA9edgrRwteV1OUq2BBx8CgsSlgHxBtwzO8ua
 HNgMFd4JPvS8m4w1tRDRW2lBypIGAadph7q01IMmWCAFxuoW2XBIXcTI+GI+ExFoWtQciICp
 OOTyXr/UCasd8b0h3NgVUlgov3lbNpw6gydx5z3Q5XbR8E3OGO3jLWvaGwErwrcLfkw3ECX9
 /N3+OtQaLHgMXJCqaMMFITHh68bTwqJJTIeTKg5rr8JB2zVZBq7xSOKdxKqYspIKvHHrR24B
 shpKp4dXhiyzn/T/DUSBKpKKL5ohv85otEFf+qzd2IBtrKeqBtvsY7RqXei1DN6HY02nJZvM
 J7VehKDDneU1CldlGL6pcVZPna1PIsfbwrm0eHpqOgEGvrvag23nZ3eBldsg0ioDQ==
IronPort-HdrOrdr: A9a23:tEy8DaPz2vhEY8BcTvmjsMiBIKoaSvp037Eqv3oedfUzSL3gqy
 nOpoV86faaslYssR0b9exofZPwJE80lqQFhrX5X43SPzUO0VHAROoJgLcKgQeQfxEWntQtrZ
 uIGJIeNDSfNzdHZL7BkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="58617606"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Tamas K Lengyel
	<tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>, "Petre
 Pircalabu" <ppircalabu@bitdefender.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>, Bob Eshleman <bobbyeshleman@gmail.com>,
	"Alistair Francis" <alistair.francis@wdc.com>, Connor Davis
	<connojdavis@gmail.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>
Subject: [XEN PATCH v8 02/47] xen: move include/asm-* to arch/*/include/asm
Date: Thu, 25 Nov 2021 13:39:21 +0000
Message-ID: <20211125134006.1076646-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125134006.1076646-1-anthony.perard@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This avoid the need to create the symbolic link "include/asm".

Whenever a comment refer to an "asm" headers, this patch avoid
spelling the arch when not needed to avoid some code churn.

One unrelated change is to sort entries in MAINTAINERS for "INTEL(R)
VT FOR X86 (VT-X)"

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Acked-by: Paul Durrant <paul@xen.org>
---

Notes:
    v8:
    - in tools/include/Makefile, write `ln -s $dir/asm xen/`
      instead of `ln -s $dir/asm xen/asm`.
    - in common/page_alloc.c, fix comment specify the full location of the
      arch specific numa.h header (instead of just asm/numa.h).
    
    v7:
    - fix MAINTAINERS entry for arch-riscv
    - move to arch/*/include/asm instead
    - In most comment refering to an asm headers, avoid spelling the arch
      name when not needed.
      That doesn't work "common/efi/runtime.c" as the description of Xen's
      stack is only in x86's "asm/current.h" and not in arm's "asm/current.h".
    - sort entries in MAINTAINERS for "INTEL(R) VT FOR X86 (VT-X)"

 .gitignore                                    |  5 +--
 MAINTAINERS                                   | 37 +++++++++----------
 tools/include/Makefile                        |  2 +-
 tools/misc/xen-access.c                       |  4 +-
 tools/tests/vhpet/Makefile                    |  2 +-
 xen/Makefile                                  | 13 +++----
 xen/arch/arm/README.LinuxPrimitives           | 10 ++---
 xen/arch/arm/arch.mk                          |  1 +
 xen/arch/arm/arm32/head.S                     |  2 +-
 xen/arch/arm/arm64/head.S                     |  2 +-
 .../asm-arm => arch/arm/include/asm}/acpi.h   |  0
 .../arm/include/asm}/alternative.h            |  0
 .../asm-arm => arch/arm/include/asm}/altp2m.h |  0
 .../arm/include/asm}/arm32/atomic.h           |  0
 .../arm/include/asm}/arm32/bitops.h           |  0
 .../arm/include/asm}/arm32/bug.h              |  0
 .../arm/include/asm}/arm32/cmpxchg.h          |  0
 .../arm/include/asm}/arm32/flushtlb.h         |  0
 .../arm/include/asm}/arm32/insn.h             |  0
 .../arm/include/asm}/arm32/io.h               |  0
 .../arm/include/asm}/arm32/macros.h           |  0
 .../arm/include/asm}/arm32/mm.h               |  0
 .../arm/include/asm}/arm32/page.h             |  0
 .../arm/include/asm}/arm32/processor.h        |  0
 .../arm/include/asm}/arm32/sysregs.h          |  0
 .../arm/include/asm}/arm32/system.h           |  0
 .../arm/include/asm}/arm32/traps.h            |  0
 .../arm/include/asm}/arm32/vfp.h              |  0
 .../arm/include/asm}/arm64/atomic.h           |  0
 .../arm/include/asm}/arm64/bitops.h           |  0
 .../arm/include/asm}/arm64/brk.h              |  0
 .../arm/include/asm}/arm64/bug.h              |  0
 .../arm/include/asm}/arm64/cmpxchg.h          |  0
 .../arm/include/asm}/arm64/cpufeature.h       |  0
 .../arm/include/asm}/arm64/efibind.h          |  0
 .../arm/include/asm}/arm64/flushtlb.h         |  0
 .../arm/include/asm}/arm64/hsr.h              |  0
 .../arm/include/asm}/arm64/insn.h             |  0
 .../arm/include/asm}/arm64/io.h               |  0
 .../arm/include/asm}/arm64/macros.h           |  0
 .../arm/include/asm}/arm64/mm.h               |  0
 .../arm/include/asm}/arm64/page.h             |  0
 .../arm/include/asm}/arm64/processor.h        |  0
 .../arm/include/asm}/arm64/sysregs.h          |  0
 .../arm/include/asm}/arm64/system.h           |  0
 .../arm/include/asm}/arm64/traps.h            |  0
 .../arm/include/asm}/arm64/vfp.h              |  0
 .../arm/include/asm}/asm_defns.h              |  0
 .../asm-arm => arch/arm/include/asm}/atomic.h |  0
 .../asm-arm => arch/arm/include/asm}/bitops.h |  0
 .../asm-arm => arch/arm/include/asm}/bug.h    |  0
 .../arm/include/asm}/byteorder.h              |  0
 .../asm-arm => arch/arm/include/asm}/cache.h  |  0
 .../arm/include/asm}/cadence-uart.h           |  0
 .../asm-arm => arch/arm/include/asm}/config.h |  0
 .../asm-arm => arch/arm/include/asm}/cpregs.h |  0
 .../arm/include/asm}/cpuerrata.h              |  0
 .../arm/include/asm}/cpufeature.h             |  0
 .../arm/include/asm}/current.h                |  0
 .../arm/include/asm}/debugger.h               |  0
 .../asm-arm => arch/arm/include/asm}/delay.h  |  0
 .../asm-arm => arch/arm/include/asm}/desc.h   |  0
 .../asm-arm => arch/arm/include/asm}/device.h |  0
 .../asm-arm => arch/arm/include/asm}/div64.h  |  0
 .../asm-arm => arch/arm/include/asm}/domain.h |  0
 .../arm/include/asm}/domain_build.h           |  0
 .../arm/include/asm}/early_printk.h           |  0
 .../arm/include/asm}/efibind.h                |  0
 .../asm-arm => arch/arm/include/asm}/elf.h    |  0
 .../asm-arm => arch/arm/include/asm}/event.h  |  0
 .../arm/include/asm}/exynos4210-uart.h        |  0
 .../arm/include/asm}/flushtlb.h               |  0
 .../asm-arm => arch/arm/include/asm}/gic.h    |  0
 .../arm/include/asm}/gic_v3_defs.h            |  0
 .../arm/include/asm}/gic_v3_its.h             |  0
 .../arm/include/asm}/grant_table.h            |  0
 .../arm/include/asm}/guest_access.h           |  0
 .../arm/include/asm}/guest_atomics.h          |  0
 .../arm/include/asm}/guest_walk.h             |  0
 .../arm/include/asm}/hardirq.h                |  0
 .../asm-arm => arch/arm/include/asm}/hsr.h    |  0
 .../arm/include/asm}/hypercall.h              |  0
 .../asm-arm => arch/arm/include/asm}/init.h   |  0
 .../asm-arm => arch/arm/include/asm}/insn.h   |  0
 .../asm-arm => arch/arm/include/asm}/io.h     |  0
 .../asm-arm => arch/arm/include/asm}/iocap.h  |  0
 .../asm-arm => arch/arm/include/asm}/iommu.h  |  0
 .../arm/include/asm}/iommu_fwspec.h           |  0
 .../asm-arm => arch/arm/include/asm}/ioreq.h  |  0
 .../asm-arm => arch/arm/include/asm}/irq.h    |  0
 .../asm-arm => arch/arm/include/asm}/kernel.h |  0
 .../arm/include/asm}/livepatch.h              |  0
 .../asm-arm => arch/arm/include/asm}/lpae.h   |  0
 .../asm-arm => arch/arm/include/asm}/macros.h |  0
 .../arm/include/asm}/mem_access.h             |  0
 .../asm-arm => arch/arm/include/asm}/mm.h     |  0
 .../asm-arm => arch/arm/include/asm}/mmio.h   |  0
 .../arm/include/asm}/monitor.h                |  0
 .../arm/include/asm}/new_vgic.h               |  0
 .../asm-arm => arch/arm/include/asm}/nospec.h |  0
 .../asm-arm => arch/arm/include/asm}/numa.h   |  0
 .../asm-arm => arch/arm/include/asm}/p2m.h    |  0
 .../arm/include/asm}/page-bits.h              |  0
 .../asm-arm => arch/arm/include/asm}/page.h   |  0
 .../asm-arm => arch/arm/include/asm}/paging.h |  0
 .../asm-arm => arch/arm/include/asm}/pci.h    |  0
 .../asm-arm => arch/arm/include/asm}/percpu.h |  0
 .../asm-arm => arch/arm/include/asm}/perfc.h  |  0
 .../arm/include/asm}/perfc_defn.h             |  0
 .../arm/include/asm}/pl011-uart.h             |  0
 .../arm/include/asm}/platform.h               |  0
 .../arm/include/asm}/platforms/exynos5.h      |  0
 .../arm/include/asm}/platforms/midway.h       |  0
 .../arm/include/asm}/platforms/omap5.h        |  0
 .../arm/include/asm}/platforms/vexpress.h     |  0
 .../asm}/platforms/xilinx-zynqmp-eemi.h       |  0
 .../arm/include/asm}/processor.h              |  0
 .../arm/include/asm}/procinfo.h               |  0
 .../asm-arm => arch/arm/include/asm}/psci.h   |  0
 .../asm-arm => arch/arm/include/asm}/random.h |  0
 .../asm-arm => arch/arm/include/asm}/regs.h   |  0
 .../arm/include/asm}/scif-uart.h              |  0
 .../asm-arm => arch/arm/include/asm}/setup.h  |  0
 .../arm/include/asm}/short-desc.h             |  0
 .../asm-arm => arch/arm/include/asm}/smccc.h  |  0
 .../asm-arm => arch/arm/include/asm}/smp.h    |  0
 .../arm/include/asm}/softirq.h                |  0
 .../arm/include/asm}/spinlock.h               |  0
 .../asm-arm => arch/arm/include/asm}/string.h |  0
 .../arm/include/asm}/sysregs.h                |  0
 .../asm-arm => arch/arm/include/asm}/system.h |  0
 .../arm/include/asm}/tee/optee_msg.h          |  0
 .../arm/include/asm}/tee/optee_rpc_cmd.h      |  0
 .../arm/include/asm}/tee/optee_smc.h          |  0
 .../arm/include/asm}/tee/tee.h                |  0
 .../asm-arm => arch/arm/include/asm}/time.h   |  0
 .../asm-arm => arch/arm/include/asm}/trace.h  |  0
 .../asm-arm => arch/arm/include/asm}/traps.h  |  0
 .../asm-arm => arch/arm/include/asm}/types.h  |  0
 .../asm-arm => arch/arm/include/asm}/vfp.h    |  0
 .../arm/include/asm}/vgic-emul.h              |  0
 .../asm-arm => arch/arm/include/asm}/vgic.h   |  0
 .../arm/include/asm}/vm_event.h               |  0
 .../asm-arm => arch/arm/include/asm}/vpl011.h |  0
 .../asm-arm => arch/arm/include/asm}/vpsci.h  |  0
 .../asm-arm => arch/arm/include/asm}/vreg.h   |  0
 .../asm-arm => arch/arm/include/asm}/vtimer.h |  0
 .../arm/include/asm}/xenoprof.h               |  0
 xen/arch/arm/smpboot.c                        |  2 +-
 xen/arch/arm/vpsci.c                          |  2 +-
 xen/arch/riscv/arch.mk                        |  1 +
 .../riscv/include/asm}/config.h               |  0
 xen/arch/x86/Makefile                         |  6 +--
 xen/arch/x86/arch.mk                          |  5 ++-
 .../asm-x86 => arch/x86/include/asm}/acpi.h   |  0
 .../x86/include/asm}/alternative-asm.h        |  0
 .../x86/include/asm}/alternative.h            |  0
 .../asm-x86 => arch/x86/include/asm}/altp2m.h |  0
 .../asm-x86 => arch/x86/include/asm}/amd.h    |  0
 .../asm-x86 => arch/x86/include/asm}/apic.h   |  0
 .../x86/include/asm}/apicdef.h                |  0
 .../x86/include/asm}/asm-defns.h              |  0
 .../x86/include/asm}/asm_defns.h              |  0
 .../asm-x86 => arch/x86/include/asm}/atomic.h |  0
 .../asm-x86 => arch/x86/include/asm}/bitops.h |  0
 .../asm-x86 => arch/x86/include/asm}/bug.h    |  0
 .../x86/include/asm}/byteorder.h              |  0
 .../x86/include/asm}/bzimage.h                |  0
 .../asm-x86 => arch/x86/include/asm}/cache.h  |  0
 .../asm-x86 => arch/x86/include/asm}/compat.h |  0
 .../asm-x86 => arch/x86/include/asm}/config.h |  0
 .../x86/include/asm}/cpufeature.h             |  0
 .../x86/include/asm}/cpufeatures.h            |  0
 .../x86/include/asm}/cpufeatureset.h          |  0
 .../asm-x86 => arch/x86/include/asm}/cpuid.h  |  0
 .../x86/include/asm}/cpuidle.h                |  0
 .../x86/include/asm}/current.h                |  2 +-
 .../x86/include/asm}/debugger.h               |  0
 .../x86/include/asm}/debugreg.h               |  0
 .../asm-x86 => arch/x86/include/asm}/delay.h  |  0
 .../asm-x86 => arch/x86/include/asm}/desc.h   |  0
 .../asm-x86 => arch/x86/include/asm}/device.h |  0
 .../asm-x86 => arch/x86/include/asm}/div64.h  |  0
 .../x86/include/asm}/dom0_build.h             |  0
 .../asm-x86 => arch/x86/include/asm}/domain.h |  2 +-
 .../asm-x86 => arch/x86/include/asm}/e820.h   |  0
 .../asm-x86 => arch/x86/include/asm}/edd.h    |  0
 .../x86/include/asm}/efibind.h                |  0
 .../asm-x86 => arch/x86/include/asm}/elf.h    |  0
 .../asm-x86 => arch/x86/include/asm}/event.h  |  0
 .../asm-x86 => arch/x86/include/asm}/fixmap.h |  0
 .../x86/include/asm}/flushtlb.h               |  0
 .../x86/include/asm}/genapic.h                |  0
 .../x86/include/asm}/grant_table.h            |  0
 .../asm-x86 => arch/x86/include/asm}/guest.h  |  0
 .../x86/include/asm}/guest/hyperv-hcall.h     |  0
 .../x86/include/asm}/guest/hyperv-tlfs.h      |  0
 .../x86/include/asm}/guest/hyperv.h           |  0
 .../x86/include/asm}/guest/hypervisor.h       |  0
 .../x86/include/asm}/guest/pvh-boot.h         |  0
 .../x86/include/asm}/guest/xen-hcall.h        |  0
 .../x86/include/asm}/guest/xen.h              |  0
 .../x86/include/asm}/guest_access.h           |  0
 .../x86/include/asm}/guest_atomics.h          |  0
 .../x86/include/asm}/guest_pt.h               |  0
 .../asm-x86 => arch/x86/include/asm}/hap.h    |  0
 .../x86/include/asm}/hardirq.h                |  0
 .../asm-x86 => arch/x86/include/asm}/hpet.h   |  0
 .../x86/include/asm}/hvm/asid.h               |  0
 .../x86/include/asm}/hvm/cacheattr.h          |  0
 .../x86/include/asm}/hvm/domain.h             |  0
 .../x86/include/asm}/hvm/emulate.h            |  0
 .../x86/include/asm}/hvm/grant_table.h        |  0
 .../x86/include/asm}/hvm/guest_access.h       |  0
 .../x86/include/asm}/hvm/hvm.h                |  0
 .../asm-x86 => arch/x86/include/asm}/hvm/io.h |  0
 .../x86/include/asm}/hvm/ioreq.h              |  0
 .../x86/include/asm}/hvm/irq.h                |  0
 .../x86/include/asm}/hvm/monitor.h            |  0
 .../x86/include/asm}/hvm/nestedhvm.h          |  0
 .../x86/include/asm}/hvm/save.h               |  0
 .../x86/include/asm}/hvm/support.h            |  0
 .../x86/include/asm}/hvm/svm/asid.h           |  0
 .../x86/include/asm}/hvm/svm/emulate.h        |  0
 .../x86/include/asm}/hvm/svm/intr.h           |  0
 .../x86/include/asm}/hvm/svm/nestedsvm.h      |  0
 .../x86/include/asm}/hvm/svm/svm.h            |  0
 .../x86/include/asm}/hvm/svm/svmdebug.h       |  0
 .../x86/include/asm}/hvm/svm/vmcb.h           |  0
 .../x86/include/asm}/hvm/trace.h              |  0
 .../x86/include/asm}/hvm/vcpu.h               |  0
 .../x86/include/asm}/hvm/vioapic.h            |  0
 .../x86/include/asm}/hvm/viridian.h           |  0
 .../x86/include/asm}/hvm/vlapic.h             |  0
 .../x86/include/asm}/hvm/vm_event.h           |  0
 .../x86/include/asm}/hvm/vmx/vmcs.h           |  0
 .../x86/include/asm}/hvm/vmx/vmx.h            |  0
 .../x86/include/asm}/hvm/vmx/vvmx.h           |  0
 .../x86/include/asm}/hvm/vpic.h               |  0
 .../x86/include/asm}/hvm/vpt.h                |  0
 .../x86/include/asm}/hypercall.h              |  0
 .../asm-x86 => arch/x86/include/asm}/i387.h   |  0
 .../asm-x86 => arch/x86/include/asm}/init.h   |  0
 .../x86/include/asm}/invpcid.h                |  0
 .../asm-x86 => arch/x86/include/asm}/io.h     |  0
 .../x86/include/asm}/io_apic.h                |  0
 .../asm-x86 => arch/x86/include/asm}/iocap.h  |  0
 .../asm-x86 => arch/x86/include/asm}/iommu.h  |  0
 .../asm-x86 => arch/x86/include/asm}/ioreq.h  |  0
 .../asm-x86 => arch/x86/include/asm}/irq.h    |  0
 .../asm-x86 => arch/x86/include/asm}/ldt.h    |  0
 .../x86/include/asm}/livepatch.h              |  0
 .../x86/include/asm}/mach-default/bios_ebda.h |  0
 .../x86/include/asm}/mach-default/io_ports.h  |  0
 .../include/asm}/mach-default/irq_vectors.h   |  0
 .../include/asm}/mach-default/mach_mpparse.h  |  0
 .../include/asm}/mach-default/mach_mpspec.h   |  0
 .../x86/include/asm}/mach-generic/mach_apic.h |  0
 .../include/asm}/mach-generic/mach_mpparse.h  |  0
 .../x86/include/asm}/machine_kexec.h          |  0
 .../x86/include/asm}/mc146818rtc.h            |  0
 .../asm-x86 => arch/x86/include/asm}/mce.h    |  0
 .../x86/include/asm}/mem_access.h             |  0
 .../x86/include/asm}/mem_paging.h             |  0
 .../x86/include/asm}/mem_sharing.h            |  0
 .../x86/include/asm}/microcode.h              |  0
 .../asm-x86 => arch/x86/include/asm}/mm.h     |  0
 .../x86/include/asm}/monitor.h                |  0
 .../asm-x86 => arch/x86/include/asm}/mpspec.h |  0
 .../x86/include/asm}/mpspec_def.h             |  0
 .../asm-x86 => arch/x86/include/asm}/msi.h    |  0
 .../x86/include/asm}/msr-index.h              |  0
 .../asm-x86 => arch/x86/include/asm}/msr.h    |  0
 .../asm-x86 => arch/x86/include/asm}/mtrr.h   |  0
 .../x86/include/asm}/multicall.h              |  0
 .../asm-x86 => arch/x86/include/asm}/mwait.h  |  0
 .../asm-x86 => arch/x86/include/asm}/nmi.h    |  0
 .../asm-x86 => arch/x86/include/asm}/nops.h   |  0
 .../asm-x86 => arch/x86/include/asm}/nospec.h |  0
 .../asm-x86 => arch/x86/include/asm}/numa.h   |  0
 .../asm-x86 => arch/x86/include/asm}/p2m.h    |  0
 .../x86/include/asm}/page-bits.h              |  0
 .../asm-x86 => arch/x86/include/asm}/page.h   |  0
 .../asm-x86 => arch/x86/include/asm}/paging.h |  0
 .../asm-x86 => arch/x86/include/asm}/pci.h    |  0
 .../asm-x86 => arch/x86/include/asm}/percpu.h |  0
 .../asm-x86 => arch/x86/include/asm}/perfc.h  |  0
 .../x86/include/asm}/perfc_defn.h             |  0
 .../x86/include/asm}/processor.h              |  0
 .../asm-x86 => arch/x86/include/asm}/psr.h    |  0
 .../x86/include/asm}/pv/domain.h              |  0
 .../x86/include/asm}/pv/grant_table.h         |  0
 .../asm-x86 => arch/x86/include/asm}/pv/mm.h  |  0
 .../x86/include/asm}/pv/shim.h                |  0
 .../x86/include/asm}/pv/trace.h               |  0
 .../x86/include/asm}/pv/traps.h               |  0
 .../asm-x86 => arch/x86/include/asm}/random.h |  0
 .../asm-x86 => arch/x86/include/asm}/regs.h   |  0
 .../asm-x86 => arch/x86/include/asm}/setup.h  |  0
 .../asm-x86 => arch/x86/include/asm}/shadow.h |  0
 .../asm-x86 => arch/x86/include/asm}/shared.h |  0
 .../asm-x86 => arch/x86/include/asm}/smp.h    |  0
 .../x86/include/asm}/softirq.h                |  0
 .../x86/include/asm}/spec_ctrl.h              |  0
 .../x86/include/asm}/spec_ctrl_asm.h          |  0
 .../x86/include/asm}/spinlock.h               |  0
 .../asm-x86 => arch/x86/include/asm}/string.h |  0
 .../asm-x86 => arch/x86/include/asm}/system.h |  0
 .../asm-x86 => arch/x86/include/asm}/tboot.h  |  0
 .../asm-x86 => arch/x86/include/asm}/time.h   |  0
 .../asm-x86 => arch/x86/include/asm}/trace.h  |  0
 .../asm-x86 => arch/x86/include/asm}/traps.h  |  0
 .../asm-x86 => arch/x86/include/asm}/types.h  |  0
 .../x86/include/asm}/uaccess.h                |  0
 .../x86/include/asm}/unaligned.h              |  0
 .../x86/include/asm}/vm_event.h               |  0
 .../asm-x86 => arch/x86/include/asm}/vpmu.h   |  0
 .../x86/include/asm}/x86-defns.h              |  0
 .../x86/include/asm}/x86-vendors.h            |  0
 .../x86/include/asm}/x86_64/efibind.h         |  0
 .../x86/include/asm}/x86_64/elf.h             |  0
 .../x86/include/asm}/x86_64/page.h            |  0
 .../x86/include/asm}/x86_64/regs.h            |  0
 .../x86/include/asm}/x86_64/system.h          |  0
 .../x86/include/asm}/x86_64/uaccess.h         |  0
 .../x86/include/asm}/x86_emulate.h            |  2 +-
 .../x86/include/asm}/xenoprof.h               |  0
 .../asm-x86 => arch/x86/include/asm}/xstate.h |  0
 xen/common/efi/runtime.c                      |  2 +-
 xen/common/page_alloc.c                       |  2 +-
 xen/include/xen/acpi.h                        |  5 ++-
 xen/include/xen/bitmap.h                      |  2 +-
 332 files changed, 55 insertions(+), 56 deletions(-)
 rename xen/{include/asm-arm => arch/arm/include/asm}/acpi.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/alternative.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/altp2m.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm32/atomic.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm32/bitops.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm32/bug.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm32/cmpxchg.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm32/flushtlb.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm32/insn.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm32/io.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm32/macros.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm32/mm.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm32/page.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm32/processor.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm32/sysregs.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm32/system.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm32/traps.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm32/vfp.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/atomic.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/bitops.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/brk.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/bug.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/cmpxchg.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/cpufeature.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/efibind.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/flushtlb.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/hsr.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/insn.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/io.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/macros.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/mm.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/page.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/processor.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/sysregs.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/system.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/traps.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/vfp.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/asm_defns.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/atomic.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/bitops.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/bug.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/byteorder.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/cache.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/cadence-uart.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/config.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/cpregs.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/cpuerrata.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/cpufeature.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/current.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/debugger.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/delay.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/desc.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/device.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/div64.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/domain.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/domain_build.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/early_printk.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/efibind.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/elf.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/event.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/exynos4210-uart.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/flushtlb.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/gic.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/gic_v3_defs.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/gic_v3_its.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/grant_table.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/guest_access.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/guest_atomics.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/guest_walk.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/hardirq.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/hsr.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/hypercall.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/init.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/insn.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/io.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/iocap.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/iommu.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/iommu_fwspec.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/ioreq.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/irq.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/kernel.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/livepatch.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/lpae.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/macros.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/mem_access.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/mm.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/mmio.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/monitor.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/new_vgic.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/nospec.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/numa.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/p2m.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/page-bits.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/page.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/paging.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/pci.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/percpu.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/perfc.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/perfc_defn.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/pl011-uart.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/platform.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/platforms/exynos5.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/platforms/midway.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/platforms/omap5.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/platforms/vexpress.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/platforms/xilinx-zynqmp-eemi.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/processor.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/procinfo.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/psci.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/random.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/regs.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/scif-uart.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/setup.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/short-desc.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/smccc.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/smp.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/softirq.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/spinlock.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/string.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/sysregs.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/system.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/tee/optee_msg.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/tee/optee_rpc_cmd.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/tee/optee_smc.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/tee/tee.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/time.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/trace.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/traps.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/types.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/vfp.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/vgic-emul.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/vgic.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/vm_event.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/vpl011.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/vpsci.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/vreg.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/vtimer.h (100%)
 rename xen/{include/asm-arm => arch/arm/include/asm}/xenoprof.h (100%)
 rename xen/{include/asm-riscv => arch/riscv/include/asm}/config.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/acpi.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/alternative-asm.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/alternative.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/altp2m.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/amd.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/apic.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/apicdef.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/asm-defns.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/asm_defns.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/atomic.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/bitops.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/bug.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/byteorder.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/bzimage.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/cache.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/compat.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/config.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/cpufeature.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/cpufeatures.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/cpufeatureset.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/cpuid.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/cpuidle.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/current.h (99%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/debugger.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/debugreg.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/delay.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/desc.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/device.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/div64.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/dom0_build.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/domain.h (99%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/e820.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/edd.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/efibind.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/elf.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/event.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/fixmap.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/flushtlb.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/genapic.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/grant_table.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/guest.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/guest/hyperv-hcall.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/guest/hyperv-tlfs.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/guest/hyperv.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/guest/hypervisor.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/guest/pvh-boot.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/guest/xen-hcall.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/guest/xen.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/guest_access.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/guest_atomics.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/guest_pt.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hap.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hardirq.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hpet.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/asid.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/cacheattr.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/domain.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/emulate.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/grant_table.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/guest_access.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/hvm.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/io.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/ioreq.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/irq.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/monitor.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/nestedhvm.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/save.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/support.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/svm/asid.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/svm/emulate.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/svm/intr.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/svm/nestedsvm.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/svm/svm.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/svm/svmdebug.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/svm/vmcb.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/trace.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/vcpu.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/vioapic.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/viridian.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/vlapic.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/vm_event.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/vmx/vmcs.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/vmx/vmx.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/vmx/vvmx.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/vpic.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/vpt.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/hypercall.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/i387.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/init.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/invpcid.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/io.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/io_apic.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/iocap.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/iommu.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/ioreq.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/irq.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/ldt.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/livepatch.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/mach-default/bios_ebda.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/mach-default/io_ports.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/mach-default/irq_vectors.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/mach-default/mach_mpparse.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/mach-default/mach_mpspec.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/mach-generic/mach_apic.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/mach-generic/mach_mpparse.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/machine_kexec.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/mc146818rtc.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/mce.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/mem_access.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/mem_paging.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/mem_sharing.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/microcode.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/mm.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/monitor.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/mpspec.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/mpspec_def.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/msi.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/msr-index.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/msr.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/mtrr.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/multicall.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/mwait.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/nmi.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/nops.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/nospec.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/numa.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/p2m.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/page-bits.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/page.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/paging.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/pci.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/percpu.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/perfc.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/perfc_defn.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/processor.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/psr.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/pv/domain.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/pv/grant_table.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/pv/mm.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/pv/shim.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/pv/trace.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/pv/traps.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/random.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/regs.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/setup.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/shadow.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/shared.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/smp.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/softirq.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/spec_ctrl.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/spec_ctrl_asm.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/spinlock.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/string.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/system.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/tboot.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/time.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/trace.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/traps.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/types.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/uaccess.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/unaligned.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/vm_event.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/vpmu.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/x86-defns.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/x86-vendors.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/x86_64/efibind.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/x86_64/elf.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/x86_64/page.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/x86_64/regs.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/x86_64/system.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/x86_64/uaccess.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/x86_emulate.h (89%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/xenoprof.h (100%)
 rename xen/{include/asm-x86 => arch/x86/include/asm}/xstate.h (100%)

diff --git a/.gitignore b/.gitignore
index 9513506dd948..841ba1c0a84c 100644
--- a/.gitignore
+++ b/.gitignore
@@ -316,6 +316,7 @@ xen/arch/x86/boot/*.lnk
 xen/arch/x86/efi.lds
 xen/arch/x86/efi/check.efi
 xen/arch/x86/efi/mkreloc
+xen/arch/x86/include/asm/asm-macros.h
 xen/arch/*/xen.lds
 xen/arch/*/efi/boot.c
 xen/arch/*/efi/compat.c
@@ -323,12 +324,10 @@ xen/arch/*/efi/ebmalloc.c
 xen/arch/*/efi/efi.h
 xen/arch/*/efi/pe.c
 xen/arch/*/efi/runtime.c
+xen/arch/*/include/asm/asm-offsets.h
 xen/common/config_data.S
 xen/common/config.gz
 xen/include/headers*.chk
-xen/include/asm
-xen/include/asm-*/asm-offsets.h
-xen/include/asm-x86/asm-macros.h
 xen/include/compat/*
 xen/include/config/
 xen/include/generated/
diff --git a/MAINTAINERS b/MAINTAINERS
index f67f70aed398..3f6ff32c05cd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -246,7 +246,6 @@ F:	xen/drivers/char/omap-uart.c
 F:	xen/drivers/char/pl011.c
 F:	xen/drivers/char/scif-uart.c
 F:	xen/drivers/passthrough/arm/
-F:	xen/include/asm-arm/
 F:	xen/include/public/arch-arm/
 F:	xen/include/public/arch-arm.h
 
@@ -292,10 +291,10 @@ EFI
 M:	Jan Beulich <jbeulich@suse.com>
 S:	Supported
 F:	xen/arch/x86/efi/
+F:	xen/arch/x86/include/asm/efi*.h
+F:	xen/arch/x86/include/asm/x86_*/efi*.h
 F:	xen/common/efi/
 F:	xen/include/efi/
-F:	xen/include/asm-x86/efi*.h
-F:	xen/include/asm-x86/x86_*/efi*.h
 
 GDBSX DEBUGGER
 M:	Elena Ufimtseva <elena.ufimtseva@oracle.com>
@@ -321,8 +320,8 @@ F:	xen/include/xen/hypfs.h
 INTEL(R) TRUSTED EXECUTION TECHNOLOGY (TXT)
 R:	Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>
 S:	Odd Fixes
+F:	xen/arch/x86/include/asm/tboot.h
 F:	xen/arch/x86/tboot.c
-F:	xen/include/asm-x86/tboot.h
 
 INTEL(R) VT FOR DIRECTED I/O (VT-D)
 M:	Kevin Tian <kevin.tian@intel.com>
@@ -333,10 +332,10 @@ INTEL(R) VT FOR X86 (VT-X)
 M:	Jun Nakajima <jun.nakajima@intel.com>
 M:	Kevin Tian <kevin.tian@intel.com>
 S:	Supported
+F:	xen/arch/x86/cpu/vpmu_intel.c
 F:	xen/arch/x86/hvm/vmx/
+F:	xen/arch/x86/include/asm/hvm/vmx/
 F:	xen/arch/x86/mm/p2m-ept.c
-F:	xen/include/asm-x86/hvm/vmx/
-F:	xen/arch/x86/cpu/vpmu_intel.c
 
 IOMMU VENDOR INDEPENDENT CODE
 M:	Jan Beulich <jbeulich@suse.com>
@@ -412,10 +411,10 @@ M:	Ross Lagerwall <ross.lagerwall@citrix.com>
 S:	Supported
 F:	docs/misc/livepatch.pandoc
 F:	tools/misc/xen-livepatch.c
+F:	xen/arch/*/include/asm/livepatch.h
 F:	xen/arch/*/livepatch*
 F:	xen/arch/*/*/livepatch*
 F:	xen/common/livepatch*
-F:	xen/include/asm-*/livepatch.h
 F:	xen/include/xen/livepatch*
 F:	xen/test/livepatch/*
 
@@ -485,7 +484,6 @@ R:	Connor Davis <connojdavis@gmail.com>
 S:	Supported
 F:	config/riscv64.mk
 F:	xen/arch/riscv/
-F:	xen/include/asm-riscv/
 
 RTDS SCHEDULER
 M:	Dario Faggioli <dfaggioli@suse.com>
@@ -514,8 +512,8 @@ F:	stubdom/
 TEE MEDIATORS
 M:	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
 S:	Supported
+F:	xen/arch/arm/include/asm/tee
 F:	xen/arch/arm/tee/
-F:	xen/include/asm-arm/tee
 
 TOOLSTACK
 M:	Ian Jackson <iwj@xenproject.org>
@@ -543,6 +541,8 @@ F:	tools/misc/xen-access.c
 F:	xen/arch/*/monitor.c
 F:	xen/arch/*/vm_event.c
 F:	xen/arch/arm/mem_access.c
+F:	xen/arch/x86/include/asm/hvm/monitor.h
+F:	xen/arch/x86/include/asm/hvm/vm_event.h
 F:	xen/arch/x86/mm/mem_access.c
 F:	xen/arch/x86/hvm/monitor.c
 F:	xen/arch/x86/hvm/vm_event.c
@@ -552,8 +552,6 @@ F:	xen/common/vm_event.c
 F:	xen/include/*/mem_access.h
 F:	xen/include/*/monitor.h
 F:	xen/include/*/vm_event.h
-F:	xen/include/asm-x86/hvm/monitor.h
-F:	xen/include/asm-x86/hvm/vm_event.h
 
 VPCI
 M:	Roger Pau Monné <roger.pau@citrix.com>
@@ -579,7 +577,6 @@ R:	Wei Liu <wl@xen.org>
 S:	Supported
 L:	xen-devel@lists.xenproject.org
 F:	xen/arch/x86/
-F:	xen/include/asm-x86/
 F:	xen/include/public/arch-x86/
 F:	xen/include/xen/lib/x86
 F:	xen/lib/x86
@@ -599,10 +596,10 @@ F:	xen/arch/x86/hvm/emulate.c
 F:	xen/arch/x86/hvm/intercept.c
 F:	xen/arch/x86/hvm/io.c
 F:	xen/arch/x86/hvm/ioreq.c
-F:	xen/include/asm-x86/hvm/emulate.h
-F:	xen/include/asm-x86/hvm/io.h
-F:	xen/include/asm-x86/hvm/ioreq.h
-F:	xen/include/asm-x86/ioreq.h
+F:	xen/arch/x86/include/asm/hvm/emulate.h
+F:	xen/arch/x86/include/asm/hvm/io.h
+F:	xen/arch/x86/include/asm/hvm/ioreq.h
+F:	xen/arch/x86/include/asm/ioreq.h
 
 X86 MEMORY MANAGEMENT
 M:	Jan Beulich <jbeulich@suse.com>
@@ -634,10 +631,10 @@ M:	Wei Liu <wl@xen.org>
 S:	Supported
 F:	xen/arch/x86/guest/hyperv/
 F:	xen/arch/x86/hvm/viridian/
-F:	xen/include/asm-x86/guest/hyperv.h
-F:	xen/include/asm-x86/guest/hyperv-hcall.h
-F:	xen/include/asm-x86/guest/hyperv-tlfs.h
-F:	xen/include/asm-x86/hvm/viridian.h
+F:	xen/arch/x86/include/asm/guest/hyperv.h
+F:	xen/arch/x86/include/asm/guest/hyperv-hcall.h
+F:	xen/arch/x86/include/asm/guest/hyperv-tlfs.h
+F:	xen/arch/x86/include/asm/hvm/viridian.h
 
 XENSTORE
 M:	Ian Jackson <iwj@xenproject.org>
diff --git a/tools/include/Makefile b/tools/include/Makefile
index 42605d46b937..d7b51006e032 100644
--- a/tools/include/Makefile
+++ b/tools/include/Makefile
@@ -30,7 +30,7 @@ xen-dir:
 	ln -s $(XEN_ROOT)/xen/include/acpi/platform acpi/
 	ln -s $(XEN_ROOT)/xen/include/acpi/ac*.h acpi/
 ifeq ($(CONFIG_X86),y)
-	ln -s $(XEN_ROOT)/xen/include/asm-x86 xen/asm
+	ln -s $(XEN_ROOT)/xen/arch/x86/include/asm xen/
 	mkdir -p xen/lib/x86
 	ln -s $(filter-out %autogen.h,$(wildcard $(XEN_ROOT)/xen/include/xen/lib/x86/*.h)) xen/lib/x86/
 	ln -s $(XEN_ROOT)/xen/include/xen/lib/x86/Makefile xen/lib/x86/
diff --git a/tools/misc/xen-access.c b/tools/misc/xen-access.c
index 4bbef0bd2e10..0731c20b8355 100644
--- a/tools/misc/xen-access.c
+++ b/tools/misc/xen-access.c
@@ -56,11 +56,11 @@
 #define ERROR(a, b...) fprintf(stderr, a "\n", ## b)
 #define PERROR(a, b...) fprintf(stderr, a ": %s\n", ## b, strerror(errno))
 
-/* From xen/include/asm-x86/processor.h */
+/* From xen/arch/x86/include/asm/processor.h */
 #define X86_TRAP_DEBUG  1
 #define X86_TRAP_INT3   3
 
-/* From xen/include/asm-x86/x86-defns.h */
+/* From xen/arch/x86/include/asm/x86-defns.h */
 #define X86_CR4_PGE        0x00000080 /* enable global pages */
 
 typedef struct vm_event {
diff --git a/tools/tests/vhpet/Makefile b/tools/tests/vhpet/Makefile
index cb88dd01c5f8..2d56ffdfd9c5 100644
--- a/tools/tests/vhpet/Makefile
+++ b/tools/tests/vhpet/Makefile
@@ -32,7 +32,7 @@ distclean: clean
 .PHONY: install
 install:
 
-hpet.h: $(XEN_ROOT)/xen/include/asm-x86/hpet.h
+hpet.h: $(XEN_ROOT)/xen/arch/x86/include/asm/hpet.h
 	cp $< $@
 
 hpet.c: $(XEN_ROOT)/xen/arch/x86/hvm/hpet.c
diff --git a/xen/Makefile b/xen/Makefile
index 1fd48af7ae82..b2a63edca1eb 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -166,7 +166,7 @@ ifeq ($(TARGET_ARCH),x86)
 t1 = $(call as-insn,$(CC),".L0: .L1: .skip (.L1 - .L0)",,-no-integrated-as)
 
 # Check whether clang asm()-s support .include.
-t2 = $(call as-insn,$(CC) -I$(BASEDIR)/include,".include \"asm-x86/asm-defns.h\"",,-no-integrated-as)
+t2 = $(call as-insn,$(CC) -I$(BASEDIR)/arch/x86/include,".include \"asm/asm-defns.h\"",,-no-integrated-as)
 
 # Check whether clang keeps .macro-s between asm()-s:
 # https://bugs.llvm.org/show_bug.cgi?id=36110
@@ -382,7 +382,7 @@ _clean: delete-unfresh-files
 		-o -name ".*.o.tmp" -o -name "*~" -o -name "core" \
 		-o -name "*.gcno" -o -name ".*.cmd" -o -name "lib.a" \) -exec rm -f {} \;
 	rm -f include/asm $(TARGET) $(TARGET).gz $(TARGET).efi $(TARGET).efi.map $(TARGET)-syms $(TARGET)-syms.map *~ core
-	rm -f asm-offsets.s include/asm-*/asm-offsets.h
+	rm -f asm-offsets.s arch/*/include/asm/asm-offsets.h
 	rm -f .banner .allconfig.tmp
 
 .PHONY: _distclean
@@ -396,7 +396,6 @@ $(TARGET).gz: $(TARGET)
 $(TARGET): delete-unfresh-files
 	$(MAKE) -C tools
 	$(MAKE) -f $(BASEDIR)/Rules.mk include/xen/compile.h
-	[ -e include/asm ] || ln -sf asm-$(TARGET_ARCH) include/asm
 	[ -e arch/$(TARGET_ARCH)/efi ] && for f in $$(cd common/efi; echo *.[ch]); \
 		do test -r arch/$(TARGET_ARCH)/efi/$$f || \
 		   ln -nsf ../../../common/efi/$$f arch/$(TARGET_ARCH)/efi/; \
@@ -404,7 +403,7 @@ $(TARGET): delete-unfresh-files
 		true
 	$(MAKE) -f $(BASEDIR)/Rules.mk -C include
 	$(MAKE) -f $(BASEDIR)/Rules.mk -C arch/$(TARGET_ARCH) include
-	$(MAKE) -f $(BASEDIR)/Rules.mk include/asm-$(TARGET_ARCH)/asm-offsets.h
+	$(MAKE) -f $(BASEDIR)/Rules.mk arch/$(TARGET_ARCH)/include/asm/asm-offsets.h
 	$(MAKE) -f $(BASEDIR)/Rules.mk -C arch/$(TARGET_ARCH) $@
 
 # drivers/char/console.o contains static banner/compile info. Blow it away.
@@ -450,7 +449,7 @@ asm-offsets.s: arch/$(TARGET_ARCH)/$(TARGET_SUBARCH)/asm-offsets.c
 	$(CC) $(call cpp_flags,$(c_flags)) -S -g0 -o $@.new -MQ $@ $<
 	$(call move-if-changed,$@.new,$@)
 
-include/asm-$(TARGET_ARCH)/asm-offsets.h: asm-offsets.s
+arch/$(TARGET_ARCH)/include/asm/asm-offsets.h: asm-offsets.s
 	@(set -e; \
 	  echo "/*"; \
 	  echo " * DO NOT MODIFY."; \
@@ -468,8 +467,8 @@ include/asm-$(TARGET_ARCH)/asm-offsets.h: asm-offsets.s
 
 SUBDIRS = xsm arch/$(TARGET_ARCH) common drivers lib test
 define all_sources
-    ( find include/asm-$(TARGET_ARCH) -name '*.h' -print; \
-      find include -name 'asm-*' -prune -o -name '*.h' -print; \
+    ( find arch/$(TARGET_ARCH)/include -name '*.h' -print; \
+      find include -name '*.h' -print; \
       find $(SUBDIRS) -name '*.[chS]' -print )
 endef
 
diff --git a/xen/arch/arm/README.LinuxPrimitives b/xen/arch/arm/README.LinuxPrimitives
index 664a9f89ed27..1d53e6a898da 100644
--- a/xen/arch/arm/README.LinuxPrimitives
+++ b/xen/arch/arm/README.LinuxPrimitives
@@ -8,19 +8,19 @@ arm64:
 
 bitops: last sync @ v3.16-rc6 (last commit: 8715466b6027)
 
-linux/arch/arm64/include/asm/bitops.h   xen/include/asm-arm/arm64/bitops.h
+linux/arch/arm64/include/asm/bitops.h   xen/arch/arm/include/asm/arm64/bitops.h
 
 ---------------------------------------------------------------------
 
 cmpxchg: last sync @ v3.16-rc6 (last commit: e1dfda9ced9b)
 
-linux/arch/arm64/include/asm/cmpxchg.h  xen/include/asm-arm/arm64/cmpxchg.h
+linux/arch/arm64/include/asm/cmpxchg.h  xen/arch/arm/include/asm/arm64/cmpxchg.h
 
 ---------------------------------------------------------------------
 
 atomics: last sync @ v3.16-rc6 (last commit: 8715466b6027)
 
-linux/arch/arm64/include/asm/atomic.h   xen/include/asm-arm/arm64/atomic.h
+linux/arch/arm64/include/asm/atomic.h   xen/arch/arm/include/asm/arm64/atomic.h
 
 The following functions were taken from Linux:
     atomic_add(), atomic_add_return(), atomic_sub(), atomic_sub_return(),
@@ -76,13 +76,13 @@ diff -u ../linux/arch/arm/lib/findbit.S xen/arch/arm/arm32/lib/findbit.S
 
 cmpxchg: last sync @ v3.16-rc6 (last commit: c32ffce0f66e)
 
-linux/arch/arm/include/asm/cmpxchg.h    xen/include/asm-arm/arm32/cmpxchg.h
+linux/arch/arm/include/asm/cmpxchg.h    xen/arch/arm/include/asm/arm32/cmpxchg.h
 
 ---------------------------------------------------------------------
 
 atomics: last sync @ v3.16-rc6 (last commit: 030d0178bdbd)
 
-linux/arch/arm/include/asm/atomic.h     xen/include/asm-arm/arm32/atomic.h
+linux/arch/arm/include/asm/atomic.h     xen/arch/arm/include/asm/arm32/atomic.h
 
 The following functions were taken from Linux:
     atomic_add(), atomic_add_return(), atomic_sub(), atomic_sub_return(),
diff --git a/xen/arch/arm/arch.mk b/xen/arch/arm/arch.mk
index 6a2982059486..c3ac443b3788 100644
--- a/xen/arch/arm/arch.mk
+++ b/xen/arch/arm/arch.mk
@@ -2,6 +2,7 @@
 # arm-specific definitions
 
 CFLAGS += -I$(BASEDIR)/include
+CFLAGS += -I$(BASEDIR)/arch/$(TARGET_ARCH)/include
 
 $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 $(call cc-option-add,CFLAGS,CC,-Wnested-externs)
diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index 7178865f48c3..b5912d381b98 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -599,7 +599,7 @@ remove_identity_mapping:
         strd  r2, r3, [r0, r1]
 
 identity_mapping_removed:
-        /* See asm-arm/arm32/flushtlb.h for the explanation of the sequence. */
+        /* See asm/arm32/flushtlb.h for the explanation of the sequence. */
         dsb   nshst
         mcr   CP32(r0, TLBIALLH)
         dsb   nsh
diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index aa1f88c76498..51b00ab0bea6 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -737,7 +737,7 @@ remove_identity_mapping:
         str   xzr, [x0, x1, lsl #3]
 
 identity_mapping_removed:
-        /* See asm-arm/arm64/flushtlb.h for the explanation of the sequence. */
+        /* See asm/arm64/flushtlb.h for the explanation of the sequence. */
         dsb   nshst
         tlbi  alle2
         dsb   nsh
diff --git a/xen/include/asm-arm/acpi.h b/xen/arch/arm/include/asm/acpi.h
similarity index 100%
rename from xen/include/asm-arm/acpi.h
rename to xen/arch/arm/include/asm/acpi.h
diff --git a/xen/include/asm-arm/alternative.h b/xen/arch/arm/include/asm/alternative.h
similarity index 100%
rename from xen/include/asm-arm/alternative.h
rename to xen/arch/arm/include/asm/alternative.h
diff --git a/xen/include/asm-arm/altp2m.h b/xen/arch/arm/include/asm/altp2m.h
similarity index 100%
rename from xen/include/asm-arm/altp2m.h
rename to xen/arch/arm/include/asm/altp2m.h
diff --git a/xen/include/asm-arm/arm32/atomic.h b/xen/arch/arm/include/asm/arm32/atomic.h
similarity index 100%
rename from xen/include/asm-arm/arm32/atomic.h
rename to xen/arch/arm/include/asm/arm32/atomic.h
diff --git a/xen/include/asm-arm/arm32/bitops.h b/xen/arch/arm/include/asm/arm32/bitops.h
similarity index 100%
rename from xen/include/asm-arm/arm32/bitops.h
rename to xen/arch/arm/include/asm/arm32/bitops.h
diff --git a/xen/include/asm-arm/arm32/bug.h b/xen/arch/arm/include/asm/arm32/bug.h
similarity index 100%
rename from xen/include/asm-arm/arm32/bug.h
rename to xen/arch/arm/include/asm/arm32/bug.h
diff --git a/xen/include/asm-arm/arm32/cmpxchg.h b/xen/arch/arm/include/asm/arm32/cmpxchg.h
similarity index 100%
rename from xen/include/asm-arm/arm32/cmpxchg.h
rename to xen/arch/arm/include/asm/arm32/cmpxchg.h
diff --git a/xen/include/asm-arm/arm32/flushtlb.h b/xen/arch/arm/include/asm/arm32/flushtlb.h
similarity index 100%
rename from xen/include/asm-arm/arm32/flushtlb.h
rename to xen/arch/arm/include/asm/arm32/flushtlb.h
diff --git a/xen/include/asm-arm/arm32/insn.h b/xen/arch/arm/include/asm/arm32/insn.h
similarity index 100%
rename from xen/include/asm-arm/arm32/insn.h
rename to xen/arch/arm/include/asm/arm32/insn.h
diff --git a/xen/include/asm-arm/arm32/io.h b/xen/arch/arm/include/asm/arm32/io.h
similarity index 100%
rename from xen/include/asm-arm/arm32/io.h
rename to xen/arch/arm/include/asm/arm32/io.h
diff --git a/xen/include/asm-arm/arm32/macros.h b/xen/arch/arm/include/asm/arm32/macros.h
similarity index 100%
rename from xen/include/asm-arm/arm32/macros.h
rename to xen/arch/arm/include/asm/arm32/macros.h
diff --git a/xen/include/asm-arm/arm32/mm.h b/xen/arch/arm/include/asm/arm32/mm.h
similarity index 100%
rename from xen/include/asm-arm/arm32/mm.h
rename to xen/arch/arm/include/asm/arm32/mm.h
diff --git a/xen/include/asm-arm/arm32/page.h b/xen/arch/arm/include/asm/arm32/page.h
similarity index 100%
rename from xen/include/asm-arm/arm32/page.h
rename to xen/arch/arm/include/asm/arm32/page.h
diff --git a/xen/include/asm-arm/arm32/processor.h b/xen/arch/arm/include/asm/arm32/processor.h
similarity index 100%
rename from xen/include/asm-arm/arm32/processor.h
rename to xen/arch/arm/include/asm/arm32/processor.h
diff --git a/xen/include/asm-arm/arm32/sysregs.h b/xen/arch/arm/include/asm/arm32/sysregs.h
similarity index 100%
rename from xen/include/asm-arm/arm32/sysregs.h
rename to xen/arch/arm/include/asm/arm32/sysregs.h
diff --git a/xen/include/asm-arm/arm32/system.h b/xen/arch/arm/include/asm/arm32/system.h
similarity index 100%
rename from xen/include/asm-arm/arm32/system.h
rename to xen/arch/arm/include/asm/arm32/system.h
diff --git a/xen/include/asm-arm/arm32/traps.h b/xen/arch/arm/include/asm/arm32/traps.h
similarity index 100%
rename from xen/include/asm-arm/arm32/traps.h
rename to xen/arch/arm/include/asm/arm32/traps.h
diff --git a/xen/include/asm-arm/arm32/vfp.h b/xen/arch/arm/include/asm/arm32/vfp.h
similarity index 100%
rename from xen/include/asm-arm/arm32/vfp.h
rename to xen/arch/arm/include/asm/arm32/vfp.h
diff --git a/xen/include/asm-arm/arm64/atomic.h b/xen/arch/arm/include/asm/arm64/atomic.h
similarity index 100%
rename from xen/include/asm-arm/arm64/atomic.h
rename to xen/arch/arm/include/asm/arm64/atomic.h
diff --git a/xen/include/asm-arm/arm64/bitops.h b/xen/arch/arm/include/asm/arm64/bitops.h
similarity index 100%
rename from xen/include/asm-arm/arm64/bitops.h
rename to xen/arch/arm/include/asm/arm64/bitops.h
diff --git a/xen/include/asm-arm/arm64/brk.h b/xen/arch/arm/include/asm/arm64/brk.h
similarity index 100%
rename from xen/include/asm-arm/arm64/brk.h
rename to xen/arch/arm/include/asm/arm64/brk.h
diff --git a/xen/include/asm-arm/arm64/bug.h b/xen/arch/arm/include/asm/arm64/bug.h
similarity index 100%
rename from xen/include/asm-arm/arm64/bug.h
rename to xen/arch/arm/include/asm/arm64/bug.h
diff --git a/xen/include/asm-arm/arm64/cmpxchg.h b/xen/arch/arm/include/asm/arm64/cmpxchg.h
similarity index 100%
rename from xen/include/asm-arm/arm64/cmpxchg.h
rename to xen/arch/arm/include/asm/arm64/cmpxchg.h
diff --git a/xen/include/asm-arm/arm64/cpufeature.h b/xen/arch/arm/include/asm/arm64/cpufeature.h
similarity index 100%
rename from xen/include/asm-arm/arm64/cpufeature.h
rename to xen/arch/arm/include/asm/arm64/cpufeature.h
diff --git a/xen/include/asm-arm/arm64/efibind.h b/xen/arch/arm/include/asm/arm64/efibind.h
similarity index 100%
rename from xen/include/asm-arm/arm64/efibind.h
rename to xen/arch/arm/include/asm/arm64/efibind.h
diff --git a/xen/include/asm-arm/arm64/flushtlb.h b/xen/arch/arm/include/asm/arm64/flushtlb.h
similarity index 100%
rename from xen/include/asm-arm/arm64/flushtlb.h
rename to xen/arch/arm/include/asm/arm64/flushtlb.h
diff --git a/xen/include/asm-arm/arm64/hsr.h b/xen/arch/arm/include/asm/arm64/hsr.h
similarity index 100%
rename from xen/include/asm-arm/arm64/hsr.h
rename to xen/arch/arm/include/asm/arm64/hsr.h
diff --git a/xen/include/asm-arm/arm64/insn.h b/xen/arch/arm/include/asm/arm64/insn.h
similarity index 100%
rename from xen/include/asm-arm/arm64/insn.h
rename to xen/arch/arm/include/asm/arm64/insn.h
diff --git a/xen/include/asm-arm/arm64/io.h b/xen/arch/arm/include/asm/arm64/io.h
similarity index 100%
rename from xen/include/asm-arm/arm64/io.h
rename to xen/arch/arm/include/asm/arm64/io.h
diff --git a/xen/include/asm-arm/arm64/macros.h b/xen/arch/arm/include/asm/arm64/macros.h
similarity index 100%
rename from xen/include/asm-arm/arm64/macros.h
rename to xen/arch/arm/include/asm/arm64/macros.h
diff --git a/xen/include/asm-arm/arm64/mm.h b/xen/arch/arm/include/asm/arm64/mm.h
similarity index 100%
rename from xen/include/asm-arm/arm64/mm.h
rename to xen/arch/arm/include/asm/arm64/mm.h
diff --git a/xen/include/asm-arm/arm64/page.h b/xen/arch/arm/include/asm/arm64/page.h
similarity index 100%
rename from xen/include/asm-arm/arm64/page.h
rename to xen/arch/arm/include/asm/arm64/page.h
diff --git a/xen/include/asm-arm/arm64/processor.h b/xen/arch/arm/include/asm/arm64/processor.h
similarity index 100%
rename from xen/include/asm-arm/arm64/processor.h
rename to xen/arch/arm/include/asm/arm64/processor.h
diff --git a/xen/include/asm-arm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
similarity index 100%
rename from xen/include/asm-arm/arm64/sysregs.h
rename to xen/arch/arm/include/asm/arm64/sysregs.h
diff --git a/xen/include/asm-arm/arm64/system.h b/xen/arch/arm/include/asm/arm64/system.h
similarity index 100%
rename from xen/include/asm-arm/arm64/system.h
rename to xen/arch/arm/include/asm/arm64/system.h
diff --git a/xen/include/asm-arm/arm64/traps.h b/xen/arch/arm/include/asm/arm64/traps.h
similarity index 100%
rename from xen/include/asm-arm/arm64/traps.h
rename to xen/arch/arm/include/asm/arm64/traps.h
diff --git a/xen/include/asm-arm/arm64/vfp.h b/xen/arch/arm/include/asm/arm64/vfp.h
similarity index 100%
rename from xen/include/asm-arm/arm64/vfp.h
rename to xen/arch/arm/include/asm/arm64/vfp.h
diff --git a/xen/include/asm-arm/asm_defns.h b/xen/arch/arm/include/asm/asm_defns.h
similarity index 100%
rename from xen/include/asm-arm/asm_defns.h
rename to xen/arch/arm/include/asm/asm_defns.h
diff --git a/xen/include/asm-arm/atomic.h b/xen/arch/arm/include/asm/atomic.h
similarity index 100%
rename from xen/include/asm-arm/atomic.h
rename to xen/arch/arm/include/asm/atomic.h
diff --git a/xen/include/asm-arm/bitops.h b/xen/arch/arm/include/asm/bitops.h
similarity index 100%
rename from xen/include/asm-arm/bitops.h
rename to xen/arch/arm/include/asm/bitops.h
diff --git a/xen/include/asm-arm/bug.h b/xen/arch/arm/include/asm/bug.h
similarity index 100%
rename from xen/include/asm-arm/bug.h
rename to xen/arch/arm/include/asm/bug.h
diff --git a/xen/include/asm-arm/byteorder.h b/xen/arch/arm/include/asm/byteorder.h
similarity index 100%
rename from xen/include/asm-arm/byteorder.h
rename to xen/arch/arm/include/asm/byteorder.h
diff --git a/xen/include/asm-arm/cache.h b/xen/arch/arm/include/asm/cache.h
similarity index 100%
rename from xen/include/asm-arm/cache.h
rename to xen/arch/arm/include/asm/cache.h
diff --git a/xen/include/asm-arm/cadence-uart.h b/xen/arch/arm/include/asm/cadence-uart.h
similarity index 100%
rename from xen/include/asm-arm/cadence-uart.h
rename to xen/arch/arm/include/asm/cadence-uart.h
diff --git a/xen/include/asm-arm/config.h b/xen/arch/arm/include/asm/config.h
similarity index 100%
rename from xen/include/asm-arm/config.h
rename to xen/arch/arm/include/asm/config.h
diff --git a/xen/include/asm-arm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
similarity index 100%
rename from xen/include/asm-arm/cpregs.h
rename to xen/arch/arm/include/asm/cpregs.h
diff --git a/xen/include/asm-arm/cpuerrata.h b/xen/arch/arm/include/asm/cpuerrata.h
similarity index 100%
rename from xen/include/asm-arm/cpuerrata.h
rename to xen/arch/arm/include/asm/cpuerrata.h
diff --git a/xen/include/asm-arm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
similarity index 100%
rename from xen/include/asm-arm/cpufeature.h
rename to xen/arch/arm/include/asm/cpufeature.h
diff --git a/xen/include/asm-arm/current.h b/xen/arch/arm/include/asm/current.h
similarity index 100%
rename from xen/include/asm-arm/current.h
rename to xen/arch/arm/include/asm/current.h
diff --git a/xen/include/asm-arm/debugger.h b/xen/arch/arm/include/asm/debugger.h
similarity index 100%
rename from xen/include/asm-arm/debugger.h
rename to xen/arch/arm/include/asm/debugger.h
diff --git a/xen/include/asm-arm/delay.h b/xen/arch/arm/include/asm/delay.h
similarity index 100%
rename from xen/include/asm-arm/delay.h
rename to xen/arch/arm/include/asm/delay.h
diff --git a/xen/include/asm-arm/desc.h b/xen/arch/arm/include/asm/desc.h
similarity index 100%
rename from xen/include/asm-arm/desc.h
rename to xen/arch/arm/include/asm/desc.h
diff --git a/xen/include/asm-arm/device.h b/xen/arch/arm/include/asm/device.h
similarity index 100%
rename from xen/include/asm-arm/device.h
rename to xen/arch/arm/include/asm/device.h
diff --git a/xen/include/asm-arm/div64.h b/xen/arch/arm/include/asm/div64.h
similarity index 100%
rename from xen/include/asm-arm/div64.h
rename to xen/arch/arm/include/asm/div64.h
diff --git a/xen/include/asm-arm/domain.h b/xen/arch/arm/include/asm/domain.h
similarity index 100%
rename from xen/include/asm-arm/domain.h
rename to xen/arch/arm/include/asm/domain.h
diff --git a/xen/include/asm-arm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
similarity index 100%
rename from xen/include/asm-arm/domain_build.h
rename to xen/arch/arm/include/asm/domain_build.h
diff --git a/xen/include/asm-arm/early_printk.h b/xen/arch/arm/include/asm/early_printk.h
similarity index 100%
rename from xen/include/asm-arm/early_printk.h
rename to xen/arch/arm/include/asm/early_printk.h
diff --git a/xen/include/asm-arm/efibind.h b/xen/arch/arm/include/asm/efibind.h
similarity index 100%
rename from xen/include/asm-arm/efibind.h
rename to xen/arch/arm/include/asm/efibind.h
diff --git a/xen/include/asm-arm/elf.h b/xen/arch/arm/include/asm/elf.h
similarity index 100%
rename from xen/include/asm-arm/elf.h
rename to xen/arch/arm/include/asm/elf.h
diff --git a/xen/include/asm-arm/event.h b/xen/arch/arm/include/asm/event.h
similarity index 100%
rename from xen/include/asm-arm/event.h
rename to xen/arch/arm/include/asm/event.h
diff --git a/xen/include/asm-arm/exynos4210-uart.h b/xen/arch/arm/include/asm/exynos4210-uart.h
similarity index 100%
rename from xen/include/asm-arm/exynos4210-uart.h
rename to xen/arch/arm/include/asm/exynos4210-uart.h
diff --git a/xen/include/asm-arm/flushtlb.h b/xen/arch/arm/include/asm/flushtlb.h
similarity index 100%
rename from xen/include/asm-arm/flushtlb.h
rename to xen/arch/arm/include/asm/flushtlb.h
diff --git a/xen/include/asm-arm/gic.h b/xen/arch/arm/include/asm/gic.h
similarity index 100%
rename from xen/include/asm-arm/gic.h
rename to xen/arch/arm/include/asm/gic.h
diff --git a/xen/include/asm-arm/gic_v3_defs.h b/xen/arch/arm/include/asm/gic_v3_defs.h
similarity index 100%
rename from xen/include/asm-arm/gic_v3_defs.h
rename to xen/arch/arm/include/asm/gic_v3_defs.h
diff --git a/xen/include/asm-arm/gic_v3_its.h b/xen/arch/arm/include/asm/gic_v3_its.h
similarity index 100%
rename from xen/include/asm-arm/gic_v3_its.h
rename to xen/arch/arm/include/asm/gic_v3_its.h
diff --git a/xen/include/asm-arm/grant_table.h b/xen/arch/arm/include/asm/grant_table.h
similarity index 100%
rename from xen/include/asm-arm/grant_table.h
rename to xen/arch/arm/include/asm/grant_table.h
diff --git a/xen/include/asm-arm/guest_access.h b/xen/arch/arm/include/asm/guest_access.h
similarity index 100%
rename from xen/include/asm-arm/guest_access.h
rename to xen/arch/arm/include/asm/guest_access.h
diff --git a/xen/include/asm-arm/guest_atomics.h b/xen/arch/arm/include/asm/guest_atomics.h
similarity index 100%
rename from xen/include/asm-arm/guest_atomics.h
rename to xen/arch/arm/include/asm/guest_atomics.h
diff --git a/xen/include/asm-arm/guest_walk.h b/xen/arch/arm/include/asm/guest_walk.h
similarity index 100%
rename from xen/include/asm-arm/guest_walk.h
rename to xen/arch/arm/include/asm/guest_walk.h
diff --git a/xen/include/asm-arm/hardirq.h b/xen/arch/arm/include/asm/hardirq.h
similarity index 100%
rename from xen/include/asm-arm/hardirq.h
rename to xen/arch/arm/include/asm/hardirq.h
diff --git a/xen/include/asm-arm/hsr.h b/xen/arch/arm/include/asm/hsr.h
similarity index 100%
rename from xen/include/asm-arm/hsr.h
rename to xen/arch/arm/include/asm/hsr.h
diff --git a/xen/include/asm-arm/hypercall.h b/xen/arch/arm/include/asm/hypercall.h
similarity index 100%
rename from xen/include/asm-arm/hypercall.h
rename to xen/arch/arm/include/asm/hypercall.h
diff --git a/xen/include/asm-arm/init.h b/xen/arch/arm/include/asm/init.h
similarity index 100%
rename from xen/include/asm-arm/init.h
rename to xen/arch/arm/include/asm/init.h
diff --git a/xen/include/asm-arm/insn.h b/xen/arch/arm/include/asm/insn.h
similarity index 100%
rename from xen/include/asm-arm/insn.h
rename to xen/arch/arm/include/asm/insn.h
diff --git a/xen/include/asm-arm/io.h b/xen/arch/arm/include/asm/io.h
similarity index 100%
rename from xen/include/asm-arm/io.h
rename to xen/arch/arm/include/asm/io.h
diff --git a/xen/include/asm-arm/iocap.h b/xen/arch/arm/include/asm/iocap.h
similarity index 100%
rename from xen/include/asm-arm/iocap.h
rename to xen/arch/arm/include/asm/iocap.h
diff --git a/xen/include/asm-arm/iommu.h b/xen/arch/arm/include/asm/iommu.h
similarity index 100%
rename from xen/include/asm-arm/iommu.h
rename to xen/arch/arm/include/asm/iommu.h
diff --git a/xen/include/asm-arm/iommu_fwspec.h b/xen/arch/arm/include/asm/iommu_fwspec.h
similarity index 100%
rename from xen/include/asm-arm/iommu_fwspec.h
rename to xen/arch/arm/include/asm/iommu_fwspec.h
diff --git a/xen/include/asm-arm/ioreq.h b/xen/arch/arm/include/asm/ioreq.h
similarity index 100%
rename from xen/include/asm-arm/ioreq.h
rename to xen/arch/arm/include/asm/ioreq.h
diff --git a/xen/include/asm-arm/irq.h b/xen/arch/arm/include/asm/irq.h
similarity index 100%
rename from xen/include/asm-arm/irq.h
rename to xen/arch/arm/include/asm/irq.h
diff --git a/xen/include/asm-arm/kernel.h b/xen/arch/arm/include/asm/kernel.h
similarity index 100%
rename from xen/include/asm-arm/kernel.h
rename to xen/arch/arm/include/asm/kernel.h
diff --git a/xen/include/asm-arm/livepatch.h b/xen/arch/arm/include/asm/livepatch.h
similarity index 100%
rename from xen/include/asm-arm/livepatch.h
rename to xen/arch/arm/include/asm/livepatch.h
diff --git a/xen/include/asm-arm/lpae.h b/xen/arch/arm/include/asm/lpae.h
similarity index 100%
rename from xen/include/asm-arm/lpae.h
rename to xen/arch/arm/include/asm/lpae.h
diff --git a/xen/include/asm-arm/macros.h b/xen/arch/arm/include/asm/macros.h
similarity index 100%
rename from xen/include/asm-arm/macros.h
rename to xen/arch/arm/include/asm/macros.h
diff --git a/xen/include/asm-arm/mem_access.h b/xen/arch/arm/include/asm/mem_access.h
similarity index 100%
rename from xen/include/asm-arm/mem_access.h
rename to xen/arch/arm/include/asm/mem_access.h
diff --git a/xen/include/asm-arm/mm.h b/xen/arch/arm/include/asm/mm.h
similarity index 100%
rename from xen/include/asm-arm/mm.h
rename to xen/arch/arm/include/asm/mm.h
diff --git a/xen/include/asm-arm/mmio.h b/xen/arch/arm/include/asm/mmio.h
similarity index 100%
rename from xen/include/asm-arm/mmio.h
rename to xen/arch/arm/include/asm/mmio.h
diff --git a/xen/include/asm-arm/monitor.h b/xen/arch/arm/include/asm/monitor.h
similarity index 100%
rename from xen/include/asm-arm/monitor.h
rename to xen/arch/arm/include/asm/monitor.h
diff --git a/xen/include/asm-arm/new_vgic.h b/xen/arch/arm/include/asm/new_vgic.h
similarity index 100%
rename from xen/include/asm-arm/new_vgic.h
rename to xen/arch/arm/include/asm/new_vgic.h
diff --git a/xen/include/asm-arm/nospec.h b/xen/arch/arm/include/asm/nospec.h
similarity index 100%
rename from xen/include/asm-arm/nospec.h
rename to xen/arch/arm/include/asm/nospec.h
diff --git a/xen/include/asm-arm/numa.h b/xen/arch/arm/include/asm/numa.h
similarity index 100%
rename from xen/include/asm-arm/numa.h
rename to xen/arch/arm/include/asm/numa.h
diff --git a/xen/include/asm-arm/p2m.h b/xen/arch/arm/include/asm/p2m.h
similarity index 100%
rename from xen/include/asm-arm/p2m.h
rename to xen/arch/arm/include/asm/p2m.h
diff --git a/xen/include/asm-arm/page-bits.h b/xen/arch/arm/include/asm/page-bits.h
similarity index 100%
rename from xen/include/asm-arm/page-bits.h
rename to xen/arch/arm/include/asm/page-bits.h
diff --git a/xen/include/asm-arm/page.h b/xen/arch/arm/include/asm/page.h
similarity index 100%
rename from xen/include/asm-arm/page.h
rename to xen/arch/arm/include/asm/page.h
diff --git a/xen/include/asm-arm/paging.h b/xen/arch/arm/include/asm/paging.h
similarity index 100%
rename from xen/include/asm-arm/paging.h
rename to xen/arch/arm/include/asm/paging.h
diff --git a/xen/include/asm-arm/pci.h b/xen/arch/arm/include/asm/pci.h
similarity index 100%
rename from xen/include/asm-arm/pci.h
rename to xen/arch/arm/include/asm/pci.h
diff --git a/xen/include/asm-arm/percpu.h b/xen/arch/arm/include/asm/percpu.h
similarity index 100%
rename from xen/include/asm-arm/percpu.h
rename to xen/arch/arm/include/asm/percpu.h
diff --git a/xen/include/asm-arm/perfc.h b/xen/arch/arm/include/asm/perfc.h
similarity index 100%
rename from xen/include/asm-arm/perfc.h
rename to xen/arch/arm/include/asm/perfc.h
diff --git a/xen/include/asm-arm/perfc_defn.h b/xen/arch/arm/include/asm/perfc_defn.h
similarity index 100%
rename from xen/include/asm-arm/perfc_defn.h
rename to xen/arch/arm/include/asm/perfc_defn.h
diff --git a/xen/include/asm-arm/pl011-uart.h b/xen/arch/arm/include/asm/pl011-uart.h
similarity index 100%
rename from xen/include/asm-arm/pl011-uart.h
rename to xen/arch/arm/include/asm/pl011-uart.h
diff --git a/xen/include/asm-arm/platform.h b/xen/arch/arm/include/asm/platform.h
similarity index 100%
rename from xen/include/asm-arm/platform.h
rename to xen/arch/arm/include/asm/platform.h
diff --git a/xen/include/asm-arm/platforms/exynos5.h b/xen/arch/arm/include/asm/platforms/exynos5.h
similarity index 100%
rename from xen/include/asm-arm/platforms/exynos5.h
rename to xen/arch/arm/include/asm/platforms/exynos5.h
diff --git a/xen/include/asm-arm/platforms/midway.h b/xen/arch/arm/include/asm/platforms/midway.h
similarity index 100%
rename from xen/include/asm-arm/platforms/midway.h
rename to xen/arch/arm/include/asm/platforms/midway.h
diff --git a/xen/include/asm-arm/platforms/omap5.h b/xen/arch/arm/include/asm/platforms/omap5.h
similarity index 100%
rename from xen/include/asm-arm/platforms/omap5.h
rename to xen/arch/arm/include/asm/platforms/omap5.h
diff --git a/xen/include/asm-arm/platforms/vexpress.h b/xen/arch/arm/include/asm/platforms/vexpress.h
similarity index 100%
rename from xen/include/asm-arm/platforms/vexpress.h
rename to xen/arch/arm/include/asm/platforms/vexpress.h
diff --git a/xen/include/asm-arm/platforms/xilinx-zynqmp-eemi.h b/xen/arch/arm/include/asm/platforms/xilinx-zynqmp-eemi.h
similarity index 100%
rename from xen/include/asm-arm/platforms/xilinx-zynqmp-eemi.h
rename to xen/arch/arm/include/asm/platforms/xilinx-zynqmp-eemi.h
diff --git a/xen/include/asm-arm/processor.h b/xen/arch/arm/include/asm/processor.h
similarity index 100%
rename from xen/include/asm-arm/processor.h
rename to xen/arch/arm/include/asm/processor.h
diff --git a/xen/include/asm-arm/procinfo.h b/xen/arch/arm/include/asm/procinfo.h
similarity index 100%
rename from xen/include/asm-arm/procinfo.h
rename to xen/arch/arm/include/asm/procinfo.h
diff --git a/xen/include/asm-arm/psci.h b/xen/arch/arm/include/asm/psci.h
similarity index 100%
rename from xen/include/asm-arm/psci.h
rename to xen/arch/arm/include/asm/psci.h
diff --git a/xen/include/asm-arm/random.h b/xen/arch/arm/include/asm/random.h
similarity index 100%
rename from xen/include/asm-arm/random.h
rename to xen/arch/arm/include/asm/random.h
diff --git a/xen/include/asm-arm/regs.h b/xen/arch/arm/include/asm/regs.h
similarity index 100%
rename from xen/include/asm-arm/regs.h
rename to xen/arch/arm/include/asm/regs.h
diff --git a/xen/include/asm-arm/scif-uart.h b/xen/arch/arm/include/asm/scif-uart.h
similarity index 100%
rename from xen/include/asm-arm/scif-uart.h
rename to xen/arch/arm/include/asm/scif-uart.h
diff --git a/xen/include/asm-arm/setup.h b/xen/arch/arm/include/asm/setup.h
similarity index 100%
rename from xen/include/asm-arm/setup.h
rename to xen/arch/arm/include/asm/setup.h
diff --git a/xen/include/asm-arm/short-desc.h b/xen/arch/arm/include/asm/short-desc.h
similarity index 100%
rename from xen/include/asm-arm/short-desc.h
rename to xen/arch/arm/include/asm/short-desc.h
diff --git a/xen/include/asm-arm/smccc.h b/xen/arch/arm/include/asm/smccc.h
similarity index 100%
rename from xen/include/asm-arm/smccc.h
rename to xen/arch/arm/include/asm/smccc.h
diff --git a/xen/include/asm-arm/smp.h b/xen/arch/arm/include/asm/smp.h
similarity index 100%
rename from xen/include/asm-arm/smp.h
rename to xen/arch/arm/include/asm/smp.h
diff --git a/xen/include/asm-arm/softirq.h b/xen/arch/arm/include/asm/softirq.h
similarity index 100%
rename from xen/include/asm-arm/softirq.h
rename to xen/arch/arm/include/asm/softirq.h
diff --git a/xen/include/asm-arm/spinlock.h b/xen/arch/arm/include/asm/spinlock.h
similarity index 100%
rename from xen/include/asm-arm/spinlock.h
rename to xen/arch/arm/include/asm/spinlock.h
diff --git a/xen/include/asm-arm/string.h b/xen/arch/arm/include/asm/string.h
similarity index 100%
rename from xen/include/asm-arm/string.h
rename to xen/arch/arm/include/asm/string.h
diff --git a/xen/include/asm-arm/sysregs.h b/xen/arch/arm/include/asm/sysregs.h
similarity index 100%
rename from xen/include/asm-arm/sysregs.h
rename to xen/arch/arm/include/asm/sysregs.h
diff --git a/xen/include/asm-arm/system.h b/xen/arch/arm/include/asm/system.h
similarity index 100%
rename from xen/include/asm-arm/system.h
rename to xen/arch/arm/include/asm/system.h
diff --git a/xen/include/asm-arm/tee/optee_msg.h b/xen/arch/arm/include/asm/tee/optee_msg.h
similarity index 100%
rename from xen/include/asm-arm/tee/optee_msg.h
rename to xen/arch/arm/include/asm/tee/optee_msg.h
diff --git a/xen/include/asm-arm/tee/optee_rpc_cmd.h b/xen/arch/arm/include/asm/tee/optee_rpc_cmd.h
similarity index 100%
rename from xen/include/asm-arm/tee/optee_rpc_cmd.h
rename to xen/arch/arm/include/asm/tee/optee_rpc_cmd.h
diff --git a/xen/include/asm-arm/tee/optee_smc.h b/xen/arch/arm/include/asm/tee/optee_smc.h
similarity index 100%
rename from xen/include/asm-arm/tee/optee_smc.h
rename to xen/arch/arm/include/asm/tee/optee_smc.h
diff --git a/xen/include/asm-arm/tee/tee.h b/xen/arch/arm/include/asm/tee/tee.h
similarity index 100%
rename from xen/include/asm-arm/tee/tee.h
rename to xen/arch/arm/include/asm/tee/tee.h
diff --git a/xen/include/asm-arm/time.h b/xen/arch/arm/include/asm/time.h
similarity index 100%
rename from xen/include/asm-arm/time.h
rename to xen/arch/arm/include/asm/time.h
diff --git a/xen/include/asm-arm/trace.h b/xen/arch/arm/include/asm/trace.h
similarity index 100%
rename from xen/include/asm-arm/trace.h
rename to xen/arch/arm/include/asm/trace.h
diff --git a/xen/include/asm-arm/traps.h b/xen/arch/arm/include/asm/traps.h
similarity index 100%
rename from xen/include/asm-arm/traps.h
rename to xen/arch/arm/include/asm/traps.h
diff --git a/xen/include/asm-arm/types.h b/xen/arch/arm/include/asm/types.h
similarity index 100%
rename from xen/include/asm-arm/types.h
rename to xen/arch/arm/include/asm/types.h
diff --git a/xen/include/asm-arm/vfp.h b/xen/arch/arm/include/asm/vfp.h
similarity index 100%
rename from xen/include/asm-arm/vfp.h
rename to xen/arch/arm/include/asm/vfp.h
diff --git a/xen/include/asm-arm/vgic-emul.h b/xen/arch/arm/include/asm/vgic-emul.h
similarity index 100%
rename from xen/include/asm-arm/vgic-emul.h
rename to xen/arch/arm/include/asm/vgic-emul.h
diff --git a/xen/include/asm-arm/vgic.h b/xen/arch/arm/include/asm/vgic.h
similarity index 100%
rename from xen/include/asm-arm/vgic.h
rename to xen/arch/arm/include/asm/vgic.h
diff --git a/xen/include/asm-arm/vm_event.h b/xen/arch/arm/include/asm/vm_event.h
similarity index 100%
rename from xen/include/asm-arm/vm_event.h
rename to xen/arch/arm/include/asm/vm_event.h
diff --git a/xen/include/asm-arm/vpl011.h b/xen/arch/arm/include/asm/vpl011.h
similarity index 100%
rename from xen/include/asm-arm/vpl011.h
rename to xen/arch/arm/include/asm/vpl011.h
diff --git a/xen/include/asm-arm/vpsci.h b/xen/arch/arm/include/asm/vpsci.h
similarity index 100%
rename from xen/include/asm-arm/vpsci.h
rename to xen/arch/arm/include/asm/vpsci.h
diff --git a/xen/include/asm-arm/vreg.h b/xen/arch/arm/include/asm/vreg.h
similarity index 100%
rename from xen/include/asm-arm/vreg.h
rename to xen/arch/arm/include/asm/vreg.h
diff --git a/xen/include/asm-arm/vtimer.h b/xen/arch/arm/include/asm/vtimer.h
similarity index 100%
rename from xen/include/asm-arm/vtimer.h
rename to xen/arch/arm/include/asm/vtimer.h
diff --git a/xen/include/asm-arm/xenoprof.h b/xen/arch/arm/include/asm/xenoprof.h
similarity index 100%
rename from xen/include/asm-arm/xenoprof.h
rename to xen/arch/arm/include/asm/xenoprof.h
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 60c0e82fc559..7bfd0a73a7d2 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -46,7 +46,7 @@ struct cpuinfo_arm cpu_data[NR_CPUS];
 /* CPU logical map: map xen cpuid to an MPIDR */
 register_t __cpu_logical_map[NR_CPUS] = { [0 ... NR_CPUS-1] = MPIDR_INVALID };
 
-/* Fake one node for now. See also include/asm-arm/numa.h */
+/* Fake one node for now. See also asm/numa.h */
 nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
 
 /* Xen stack for bringing up the first CPU. */
diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
index c1e250be5967..744d43ec2798 100644
--- a/xen/arch/arm/vpsci.c
+++ b/xen/arch/arm/vpsci.c
@@ -278,7 +278,7 @@ bool do_vpsci_0_1_call(struct cpu_user_regs *regs, uint32_t fid)
 bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid)
 {
     /*
-     * /!\ VPSCI_NR_FUNCS (in asm-arm/vpsci.h) should be updated when
+     * /!\ VPSCI_NR_FUNCS (in asm/vpsci.h) should be updated when
      * adding/removing a function. SCCC_SMCCC_*_REVISION should be
      * updated once per release.
      */
diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
index 53dadb897591..39ae6ffea94d 100644
--- a/xen/arch/riscv/arch.mk
+++ b/xen/arch/riscv/arch.mk
@@ -12,3 +12,4 @@ riscv-march-$(CONFIG_RISCV_ISA_C)       := $(riscv-march-y)c
 
 CFLAGS += -march=$(riscv-march-y) -mstrict-align -mcmodel=medany
 CFLAGS += -I$(BASEDIR)/include
+CFLAGS += -I$(BASEDIR)/arch/$(TARGET_ARCH)/include
diff --git a/xen/include/asm-riscv/config.h b/xen/arch/riscv/include/asm/config.h
similarity index 100%
rename from xen/include/asm-riscv/config.h
rename to xen/arch/riscv/include/asm/config.h
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 669e16e72690..8db4cb98edbb 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -273,11 +273,11 @@ efi/buildid.o efi/relocs-dummy.o: $(BASEDIR)/arch/x86/efi/built_in.o
 efi/buildid.o efi/relocs-dummy.o: ;
 
 .PHONY: include
-include: $(BASEDIR)/include/asm-x86/asm-macros.h
+include: $(BASEDIR)/arch/x86/include/asm/asm-macros.h
 
 asm-macros.i: CFLAGS-y += -D__ASSEMBLY__ -P
 
-$(BASEDIR)/include/asm-x86/asm-macros.h: asm-macros.i Makefile
+$(BASEDIR)/arch/x86/include/asm/asm-macros.h: asm-macros.i Makefile
 	echo '#if 0' >$@.new
 	echo '.if 0' >>$@.new
 	echo '#endif' >>$@.new
@@ -304,7 +304,7 @@ efi/mkreloc: efi/mkreloc.c
 .PHONY: clean
 clean::
 	rm -f *.lds *.new boot/*.o boot/*~ boot/core boot/mkelf32
-	rm -f asm-macros.i $(BASEDIR)/include/asm-x86/asm-macros.*
+	rm -f asm-macros.i $(BASEDIR)/arch/x86/include/asm/asm-macros.*
 	rm -f $(BASEDIR)/.xen-syms.[0-9]* boot/.*.d $(BASEDIR)/.xen.elf32
 	rm -f $(BASEDIR)/.xen.efi.[0-9]* efi/*.efi efi/mkreloc
 	rm -f boot/cmdline.S boot/reloc.S boot/*.lnk boot/*.bin
diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index ce0c1a0e7fb2..eea320e618b9 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -4,8 +4,9 @@
 export XEN_IMG_OFFSET := 0x200000
 
 CFLAGS += -I$(BASEDIR)/include
-CFLAGS += -I$(BASEDIR)/include/asm-x86/mach-generic
-CFLAGS += -I$(BASEDIR)/include/asm-x86/mach-default
+CFLAGS += -I$(BASEDIR)/arch/$(TARGET_ARCH)/include
+CFLAGS += -I$(BASEDIR)/arch/x86/include/asm/mach-generic
+CFLAGS += -I$(BASEDIR)/arch/x86/include/asm/mach-default
 CFLAGS += -DXEN_IMG_OFFSET=$(XEN_IMG_OFFSET)
 
 # Prevent floating-point variables from creeping into Xen.
diff --git a/xen/include/asm-x86/acpi.h b/xen/arch/x86/include/asm/acpi.h
similarity index 100%
rename from xen/include/asm-x86/acpi.h
rename to xen/arch/x86/include/asm/acpi.h
diff --git a/xen/include/asm-x86/alternative-asm.h b/xen/arch/x86/include/asm/alternative-asm.h
similarity index 100%
rename from xen/include/asm-x86/alternative-asm.h
rename to xen/arch/x86/include/asm/alternative-asm.h
diff --git a/xen/include/asm-x86/alternative.h b/xen/arch/x86/include/asm/alternative.h
similarity index 100%
rename from xen/include/asm-x86/alternative.h
rename to xen/arch/x86/include/asm/alternative.h
diff --git a/xen/include/asm-x86/altp2m.h b/xen/arch/x86/include/asm/altp2m.h
similarity index 100%
rename from xen/include/asm-x86/altp2m.h
rename to xen/arch/x86/include/asm/altp2m.h
diff --git a/xen/include/asm-x86/amd.h b/xen/arch/x86/include/asm/amd.h
similarity index 100%
rename from xen/include/asm-x86/amd.h
rename to xen/arch/x86/include/asm/amd.h
diff --git a/xen/include/asm-x86/apic.h b/xen/arch/x86/include/asm/apic.h
similarity index 100%
rename from xen/include/asm-x86/apic.h
rename to xen/arch/x86/include/asm/apic.h
diff --git a/xen/include/asm-x86/apicdef.h b/xen/arch/x86/include/asm/apicdef.h
similarity index 100%
rename from xen/include/asm-x86/apicdef.h
rename to xen/arch/x86/include/asm/apicdef.h
diff --git a/xen/include/asm-x86/asm-defns.h b/xen/arch/x86/include/asm/asm-defns.h
similarity index 100%
rename from xen/include/asm-x86/asm-defns.h
rename to xen/arch/x86/include/asm/asm-defns.h
diff --git a/xen/include/asm-x86/asm_defns.h b/xen/arch/x86/include/asm/asm_defns.h
similarity index 100%
rename from xen/include/asm-x86/asm_defns.h
rename to xen/arch/x86/include/asm/asm_defns.h
diff --git a/xen/include/asm-x86/atomic.h b/xen/arch/x86/include/asm/atomic.h
similarity index 100%
rename from xen/include/asm-x86/atomic.h
rename to xen/arch/x86/include/asm/atomic.h
diff --git a/xen/include/asm-x86/bitops.h b/xen/arch/x86/include/asm/bitops.h
similarity index 100%
rename from xen/include/asm-x86/bitops.h
rename to xen/arch/x86/include/asm/bitops.h
diff --git a/xen/include/asm-x86/bug.h b/xen/arch/x86/include/asm/bug.h
similarity index 100%
rename from xen/include/asm-x86/bug.h
rename to xen/arch/x86/include/asm/bug.h
diff --git a/xen/include/asm-x86/byteorder.h b/xen/arch/x86/include/asm/byteorder.h
similarity index 100%
rename from xen/include/asm-x86/byteorder.h
rename to xen/arch/x86/include/asm/byteorder.h
diff --git a/xen/include/asm-x86/bzimage.h b/xen/arch/x86/include/asm/bzimage.h
similarity index 100%
rename from xen/include/asm-x86/bzimage.h
rename to xen/arch/x86/include/asm/bzimage.h
diff --git a/xen/include/asm-x86/cache.h b/xen/arch/x86/include/asm/cache.h
similarity index 100%
rename from xen/include/asm-x86/cache.h
rename to xen/arch/x86/include/asm/cache.h
diff --git a/xen/include/asm-x86/compat.h b/xen/arch/x86/include/asm/compat.h
similarity index 100%
rename from xen/include/asm-x86/compat.h
rename to xen/arch/x86/include/asm/compat.h
diff --git a/xen/include/asm-x86/config.h b/xen/arch/x86/include/asm/config.h
similarity index 100%
rename from xen/include/asm-x86/config.h
rename to xen/arch/x86/include/asm/config.h
diff --git a/xen/include/asm-x86/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
similarity index 100%
rename from xen/include/asm-x86/cpufeature.h
rename to xen/arch/x86/include/asm/cpufeature.h
diff --git a/xen/include/asm-x86/cpufeatures.h b/xen/arch/x86/include/asm/cpufeatures.h
similarity index 100%
rename from xen/include/asm-x86/cpufeatures.h
rename to xen/arch/x86/include/asm/cpufeatures.h
diff --git a/xen/include/asm-x86/cpufeatureset.h b/xen/arch/x86/include/asm/cpufeatureset.h
similarity index 100%
rename from xen/include/asm-x86/cpufeatureset.h
rename to xen/arch/x86/include/asm/cpufeatureset.h
diff --git a/xen/include/asm-x86/cpuid.h b/xen/arch/x86/include/asm/cpuid.h
similarity index 100%
rename from xen/include/asm-x86/cpuid.h
rename to xen/arch/x86/include/asm/cpuid.h
diff --git a/xen/include/asm-x86/cpuidle.h b/xen/arch/x86/include/asm/cpuidle.h
similarity index 100%
rename from xen/include/asm-x86/cpuidle.h
rename to xen/arch/x86/include/asm/cpuidle.h
diff --git a/xen/include/asm-x86/current.h b/xen/arch/x86/include/asm/current.h
similarity index 99%
rename from xen/include/asm-x86/current.h
rename to xen/arch/x86/include/asm/current.h
index a74ad4bc4c44..cfbedc31983f 100644
--- a/xen/include/asm-x86/current.h
+++ b/xen/arch/x86/include/asm/current.h
@@ -53,7 +53,7 @@ struct cpu_info {
     unsigned long xen_cr3;
     unsigned long pv_cr3;
 
-    /* See asm-x86/spec_ctrl_asm.h for usage. */
+    /* See asm/spec_ctrl_asm.h for usage. */
     unsigned int shadow_spec_ctrl;
     uint8_t      xen_spec_ctrl;
     uint8_t      spec_ctrl_flags;
diff --git a/xen/include/asm-x86/debugger.h b/xen/arch/x86/include/asm/debugger.h
similarity index 100%
rename from xen/include/asm-x86/debugger.h
rename to xen/arch/x86/include/asm/debugger.h
diff --git a/xen/include/asm-x86/debugreg.h b/xen/arch/x86/include/asm/debugreg.h
similarity index 100%
rename from xen/include/asm-x86/debugreg.h
rename to xen/arch/x86/include/asm/debugreg.h
diff --git a/xen/include/asm-x86/delay.h b/xen/arch/x86/include/asm/delay.h
similarity index 100%
rename from xen/include/asm-x86/delay.h
rename to xen/arch/x86/include/asm/delay.h
diff --git a/xen/include/asm-x86/desc.h b/xen/arch/x86/include/asm/desc.h
similarity index 100%
rename from xen/include/asm-x86/desc.h
rename to xen/arch/x86/include/asm/desc.h
diff --git a/xen/include/asm-x86/device.h b/xen/arch/x86/include/asm/device.h
similarity index 100%
rename from xen/include/asm-x86/device.h
rename to xen/arch/x86/include/asm/device.h
diff --git a/xen/include/asm-x86/div64.h b/xen/arch/x86/include/asm/div64.h
similarity index 100%
rename from xen/include/asm-x86/div64.h
rename to xen/arch/x86/include/asm/div64.h
diff --git a/xen/include/asm-x86/dom0_build.h b/xen/arch/x86/include/asm/dom0_build.h
similarity index 100%
rename from xen/include/asm-x86/dom0_build.h
rename to xen/arch/x86/include/asm/dom0_build.h
diff --git a/xen/include/asm-x86/domain.h b/xen/arch/x86/include/asm/domain.h
similarity index 99%
rename from xen/include/asm-x86/domain.h
rename to xen/arch/x86/include/asm/domain.h
index 92d54de0b9a1..e62e10959801 100644
--- a/xen/include/asm-x86/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -384,7 +384,7 @@ struct arch_domain
     struct PITState vpit;
 
     /* TSC management (emulation, pv, scaling, stats) */
-    int tsc_mode;            /* see include/asm-x86/time.h */
+    int tsc_mode;            /* see asm/time.h */
     bool_t vtsc;             /* tsc is emulated (may change after migrate) */
     s_time_t vtsc_last;      /* previous TSC value (guarantee monotonicity) */
     uint64_t vtsc_offset;    /* adjustment for save/restore/migrate */
diff --git a/xen/include/asm-x86/e820.h b/xen/arch/x86/include/asm/e820.h
similarity index 100%
rename from xen/include/asm-x86/e820.h
rename to xen/arch/x86/include/asm/e820.h
diff --git a/xen/include/asm-x86/edd.h b/xen/arch/x86/include/asm/edd.h
similarity index 100%
rename from xen/include/asm-x86/edd.h
rename to xen/arch/x86/include/asm/edd.h
diff --git a/xen/include/asm-x86/efibind.h b/xen/arch/x86/include/asm/efibind.h
similarity index 100%
rename from xen/include/asm-x86/efibind.h
rename to xen/arch/x86/include/asm/efibind.h
diff --git a/xen/include/asm-x86/elf.h b/xen/arch/x86/include/asm/elf.h
similarity index 100%
rename from xen/include/asm-x86/elf.h
rename to xen/arch/x86/include/asm/elf.h
diff --git a/xen/include/asm-x86/event.h b/xen/arch/x86/include/asm/event.h
similarity index 100%
rename from xen/include/asm-x86/event.h
rename to xen/arch/x86/include/asm/event.h
diff --git a/xen/include/asm-x86/fixmap.h b/xen/arch/x86/include/asm/fixmap.h
similarity index 100%
rename from xen/include/asm-x86/fixmap.h
rename to xen/arch/x86/include/asm/fixmap.h
diff --git a/xen/include/asm-x86/flushtlb.h b/xen/arch/x86/include/asm/flushtlb.h
similarity index 100%
rename from xen/include/asm-x86/flushtlb.h
rename to xen/arch/x86/include/asm/flushtlb.h
diff --git a/xen/include/asm-x86/genapic.h b/xen/arch/x86/include/asm/genapic.h
similarity index 100%
rename from xen/include/asm-x86/genapic.h
rename to xen/arch/x86/include/asm/genapic.h
diff --git a/xen/include/asm-x86/grant_table.h b/xen/arch/x86/include/asm/grant_table.h
similarity index 100%
rename from xen/include/asm-x86/grant_table.h
rename to xen/arch/x86/include/asm/grant_table.h
diff --git a/xen/include/asm-x86/guest.h b/xen/arch/x86/include/asm/guest.h
similarity index 100%
rename from xen/include/asm-x86/guest.h
rename to xen/arch/x86/include/asm/guest.h
diff --git a/xen/include/asm-x86/guest/hyperv-hcall.h b/xen/arch/x86/include/asm/guest/hyperv-hcall.h
similarity index 100%
rename from xen/include/asm-x86/guest/hyperv-hcall.h
rename to xen/arch/x86/include/asm/guest/hyperv-hcall.h
diff --git a/xen/include/asm-x86/guest/hyperv-tlfs.h b/xen/arch/x86/include/asm/guest/hyperv-tlfs.h
similarity index 100%
rename from xen/include/asm-x86/guest/hyperv-tlfs.h
rename to xen/arch/x86/include/asm/guest/hyperv-tlfs.h
diff --git a/xen/include/asm-x86/guest/hyperv.h b/xen/arch/x86/include/asm/guest/hyperv.h
similarity index 100%
rename from xen/include/asm-x86/guest/hyperv.h
rename to xen/arch/x86/include/asm/guest/hyperv.h
diff --git a/xen/include/asm-x86/guest/hypervisor.h b/xen/arch/x86/include/asm/guest/hypervisor.h
similarity index 100%
rename from xen/include/asm-x86/guest/hypervisor.h
rename to xen/arch/x86/include/asm/guest/hypervisor.h
diff --git a/xen/include/asm-x86/guest/pvh-boot.h b/xen/arch/x86/include/asm/guest/pvh-boot.h
similarity index 100%
rename from xen/include/asm-x86/guest/pvh-boot.h
rename to xen/arch/x86/include/asm/guest/pvh-boot.h
diff --git a/xen/include/asm-x86/guest/xen-hcall.h b/xen/arch/x86/include/asm/guest/xen-hcall.h
similarity index 100%
rename from xen/include/asm-x86/guest/xen-hcall.h
rename to xen/arch/x86/include/asm/guest/xen-hcall.h
diff --git a/xen/include/asm-x86/guest/xen.h b/xen/arch/x86/include/asm/guest/xen.h
similarity index 100%
rename from xen/include/asm-x86/guest/xen.h
rename to xen/arch/x86/include/asm/guest/xen.h
diff --git a/xen/include/asm-x86/guest_access.h b/xen/arch/x86/include/asm/guest_access.h
similarity index 100%
rename from xen/include/asm-x86/guest_access.h
rename to xen/arch/x86/include/asm/guest_access.h
diff --git a/xen/include/asm-x86/guest_atomics.h b/xen/arch/x86/include/asm/guest_atomics.h
similarity index 100%
rename from xen/include/asm-x86/guest_atomics.h
rename to xen/arch/x86/include/asm/guest_atomics.h
diff --git a/xen/include/asm-x86/guest_pt.h b/xen/arch/x86/include/asm/guest_pt.h
similarity index 100%
rename from xen/include/asm-x86/guest_pt.h
rename to xen/arch/x86/include/asm/guest_pt.h
diff --git a/xen/include/asm-x86/hap.h b/xen/arch/x86/include/asm/hap.h
similarity index 100%
rename from xen/include/asm-x86/hap.h
rename to xen/arch/x86/include/asm/hap.h
diff --git a/xen/include/asm-x86/hardirq.h b/xen/arch/x86/include/asm/hardirq.h
similarity index 100%
rename from xen/include/asm-x86/hardirq.h
rename to xen/arch/x86/include/asm/hardirq.h
diff --git a/xen/include/asm-x86/hpet.h b/xen/arch/x86/include/asm/hpet.h
similarity index 100%
rename from xen/include/asm-x86/hpet.h
rename to xen/arch/x86/include/asm/hpet.h
diff --git a/xen/include/asm-x86/hvm/asid.h b/xen/arch/x86/include/asm/hvm/asid.h
similarity index 100%
rename from xen/include/asm-x86/hvm/asid.h
rename to xen/arch/x86/include/asm/hvm/asid.h
diff --git a/xen/include/asm-x86/hvm/cacheattr.h b/xen/arch/x86/include/asm/hvm/cacheattr.h
similarity index 100%
rename from xen/include/asm-x86/hvm/cacheattr.h
rename to xen/arch/x86/include/asm/hvm/cacheattr.h
diff --git a/xen/include/asm-x86/hvm/domain.h b/xen/arch/x86/include/asm/hvm/domain.h
similarity index 100%
rename from xen/include/asm-x86/hvm/domain.h
rename to xen/arch/x86/include/asm/hvm/domain.h
diff --git a/xen/include/asm-x86/hvm/emulate.h b/xen/arch/x86/include/asm/hvm/emulate.h
similarity index 100%
rename from xen/include/asm-x86/hvm/emulate.h
rename to xen/arch/x86/include/asm/hvm/emulate.h
diff --git a/xen/include/asm-x86/hvm/grant_table.h b/xen/arch/x86/include/asm/hvm/grant_table.h
similarity index 100%
rename from xen/include/asm-x86/hvm/grant_table.h
rename to xen/arch/x86/include/asm/hvm/grant_table.h
diff --git a/xen/include/asm-x86/hvm/guest_access.h b/xen/arch/x86/include/asm/hvm/guest_access.h
similarity index 100%
rename from xen/include/asm-x86/hvm/guest_access.h
rename to xen/arch/x86/include/asm/hvm/guest_access.h
diff --git a/xen/include/asm-x86/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
similarity index 100%
rename from xen/include/asm-x86/hvm/hvm.h
rename to xen/arch/x86/include/asm/hvm/hvm.h
diff --git a/xen/include/asm-x86/hvm/io.h b/xen/arch/x86/include/asm/hvm/io.h
similarity index 100%
rename from xen/include/asm-x86/hvm/io.h
rename to xen/arch/x86/include/asm/hvm/io.h
diff --git a/xen/include/asm-x86/hvm/ioreq.h b/xen/arch/x86/include/asm/hvm/ioreq.h
similarity index 100%
rename from xen/include/asm-x86/hvm/ioreq.h
rename to xen/arch/x86/include/asm/hvm/ioreq.h
diff --git a/xen/include/asm-x86/hvm/irq.h b/xen/arch/x86/include/asm/hvm/irq.h
similarity index 100%
rename from xen/include/asm-x86/hvm/irq.h
rename to xen/arch/x86/include/asm/hvm/irq.h
diff --git a/xen/include/asm-x86/hvm/monitor.h b/xen/arch/x86/include/asm/hvm/monitor.h
similarity index 100%
rename from xen/include/asm-x86/hvm/monitor.h
rename to xen/arch/x86/include/asm/hvm/monitor.h
diff --git a/xen/include/asm-x86/hvm/nestedhvm.h b/xen/arch/x86/include/asm/hvm/nestedhvm.h
similarity index 100%
rename from xen/include/asm-x86/hvm/nestedhvm.h
rename to xen/arch/x86/include/asm/hvm/nestedhvm.h
diff --git a/xen/include/asm-x86/hvm/save.h b/xen/arch/x86/include/asm/hvm/save.h
similarity index 100%
rename from xen/include/asm-x86/hvm/save.h
rename to xen/arch/x86/include/asm/hvm/save.h
diff --git a/xen/include/asm-x86/hvm/support.h b/xen/arch/x86/include/asm/hvm/support.h
similarity index 100%
rename from xen/include/asm-x86/hvm/support.h
rename to xen/arch/x86/include/asm/hvm/support.h
diff --git a/xen/include/asm-x86/hvm/svm/asid.h b/xen/arch/x86/include/asm/hvm/svm/asid.h
similarity index 100%
rename from xen/include/asm-x86/hvm/svm/asid.h
rename to xen/arch/x86/include/asm/hvm/svm/asid.h
diff --git a/xen/include/asm-x86/hvm/svm/emulate.h b/xen/arch/x86/include/asm/hvm/svm/emulate.h
similarity index 100%
rename from xen/include/asm-x86/hvm/svm/emulate.h
rename to xen/arch/x86/include/asm/hvm/svm/emulate.h
diff --git a/xen/include/asm-x86/hvm/svm/intr.h b/xen/arch/x86/include/asm/hvm/svm/intr.h
similarity index 100%
rename from xen/include/asm-x86/hvm/svm/intr.h
rename to xen/arch/x86/include/asm/hvm/svm/intr.h
diff --git a/xen/include/asm-x86/hvm/svm/nestedsvm.h b/xen/arch/x86/include/asm/hvm/svm/nestedsvm.h
similarity index 100%
rename from xen/include/asm-x86/hvm/svm/nestedsvm.h
rename to xen/arch/x86/include/asm/hvm/svm/nestedsvm.h
diff --git a/xen/include/asm-x86/hvm/svm/svm.h b/xen/arch/x86/include/asm/hvm/svm/svm.h
similarity index 100%
rename from xen/include/asm-x86/hvm/svm/svm.h
rename to xen/arch/x86/include/asm/hvm/svm/svm.h
diff --git a/xen/include/asm-x86/hvm/svm/svmdebug.h b/xen/arch/x86/include/asm/hvm/svm/svmdebug.h
similarity index 100%
rename from xen/include/asm-x86/hvm/svm/svmdebug.h
rename to xen/arch/x86/include/asm/hvm/svm/svmdebug.h
diff --git a/xen/include/asm-x86/hvm/svm/vmcb.h b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
similarity index 100%
rename from xen/include/asm-x86/hvm/svm/vmcb.h
rename to xen/arch/x86/include/asm/hvm/svm/vmcb.h
diff --git a/xen/include/asm-x86/hvm/trace.h b/xen/arch/x86/include/asm/hvm/trace.h
similarity index 100%
rename from xen/include/asm-x86/hvm/trace.h
rename to xen/arch/x86/include/asm/hvm/trace.h
diff --git a/xen/include/asm-x86/hvm/vcpu.h b/xen/arch/x86/include/asm/hvm/vcpu.h
similarity index 100%
rename from xen/include/asm-x86/hvm/vcpu.h
rename to xen/arch/x86/include/asm/hvm/vcpu.h
diff --git a/xen/include/asm-x86/hvm/vioapic.h b/xen/arch/x86/include/asm/hvm/vioapic.h
similarity index 100%
rename from xen/include/asm-x86/hvm/vioapic.h
rename to xen/arch/x86/include/asm/hvm/vioapic.h
diff --git a/xen/include/asm-x86/hvm/viridian.h b/xen/arch/x86/include/asm/hvm/viridian.h
similarity index 100%
rename from xen/include/asm-x86/hvm/viridian.h
rename to xen/arch/x86/include/asm/hvm/viridian.h
diff --git a/xen/include/asm-x86/hvm/vlapic.h b/xen/arch/x86/include/asm/hvm/vlapic.h
similarity index 100%
rename from xen/include/asm-x86/hvm/vlapic.h
rename to xen/arch/x86/include/asm/hvm/vlapic.h
diff --git a/xen/include/asm-x86/hvm/vm_event.h b/xen/arch/x86/include/asm/hvm/vm_event.h
similarity index 100%
rename from xen/include/asm-x86/hvm/vm_event.h
rename to xen/arch/x86/include/asm/hvm/vm_event.h
diff --git a/xen/include/asm-x86/hvm/vmx/vmcs.h b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
similarity index 100%
rename from xen/include/asm-x86/hvm/vmx/vmcs.h
rename to xen/arch/x86/include/asm/hvm/vmx/vmcs.h
diff --git a/xen/include/asm-x86/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
similarity index 100%
rename from xen/include/asm-x86/hvm/vmx/vmx.h
rename to xen/arch/x86/include/asm/hvm/vmx/vmx.h
diff --git a/xen/include/asm-x86/hvm/vmx/vvmx.h b/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
similarity index 100%
rename from xen/include/asm-x86/hvm/vmx/vvmx.h
rename to xen/arch/x86/include/asm/hvm/vmx/vvmx.h
diff --git a/xen/include/asm-x86/hvm/vpic.h b/xen/arch/x86/include/asm/hvm/vpic.h
similarity index 100%
rename from xen/include/asm-x86/hvm/vpic.h
rename to xen/arch/x86/include/asm/hvm/vpic.h
diff --git a/xen/include/asm-x86/hvm/vpt.h b/xen/arch/x86/include/asm/hvm/vpt.h
similarity index 100%
rename from xen/include/asm-x86/hvm/vpt.h
rename to xen/arch/x86/include/asm/hvm/vpt.h
diff --git a/xen/include/asm-x86/hypercall.h b/xen/arch/x86/include/asm/hypercall.h
similarity index 100%
rename from xen/include/asm-x86/hypercall.h
rename to xen/arch/x86/include/asm/hypercall.h
diff --git a/xen/include/asm-x86/i387.h b/xen/arch/x86/include/asm/i387.h
similarity index 100%
rename from xen/include/asm-x86/i387.h
rename to xen/arch/x86/include/asm/i387.h
diff --git a/xen/include/asm-x86/init.h b/xen/arch/x86/include/asm/init.h
similarity index 100%
rename from xen/include/asm-x86/init.h
rename to xen/arch/x86/include/asm/init.h
diff --git a/xen/include/asm-x86/invpcid.h b/xen/arch/x86/include/asm/invpcid.h
similarity index 100%
rename from xen/include/asm-x86/invpcid.h
rename to xen/arch/x86/include/asm/invpcid.h
diff --git a/xen/include/asm-x86/io.h b/xen/arch/x86/include/asm/io.h
similarity index 100%
rename from xen/include/asm-x86/io.h
rename to xen/arch/x86/include/asm/io.h
diff --git a/xen/include/asm-x86/io_apic.h b/xen/arch/x86/include/asm/io_apic.h
similarity index 100%
rename from xen/include/asm-x86/io_apic.h
rename to xen/arch/x86/include/asm/io_apic.h
diff --git a/xen/include/asm-x86/iocap.h b/xen/arch/x86/include/asm/iocap.h
similarity index 100%
rename from xen/include/asm-x86/iocap.h
rename to xen/arch/x86/include/asm/iocap.h
diff --git a/xen/include/asm-x86/iommu.h b/xen/arch/x86/include/asm/iommu.h
similarity index 100%
rename from xen/include/asm-x86/iommu.h
rename to xen/arch/x86/include/asm/iommu.h
diff --git a/xen/include/asm-x86/ioreq.h b/xen/arch/x86/include/asm/ioreq.h
similarity index 100%
rename from xen/include/asm-x86/ioreq.h
rename to xen/arch/x86/include/asm/ioreq.h
diff --git a/xen/include/asm-x86/irq.h b/xen/arch/x86/include/asm/irq.h
similarity index 100%
rename from xen/include/asm-x86/irq.h
rename to xen/arch/x86/include/asm/irq.h
diff --git a/xen/include/asm-x86/ldt.h b/xen/arch/x86/include/asm/ldt.h
similarity index 100%
rename from xen/include/asm-x86/ldt.h
rename to xen/arch/x86/include/asm/ldt.h
diff --git a/xen/include/asm-x86/livepatch.h b/xen/arch/x86/include/asm/livepatch.h
similarity index 100%
rename from xen/include/asm-x86/livepatch.h
rename to xen/arch/x86/include/asm/livepatch.h
diff --git a/xen/include/asm-x86/mach-default/bios_ebda.h b/xen/arch/x86/include/asm/mach-default/bios_ebda.h
similarity index 100%
rename from xen/include/asm-x86/mach-default/bios_ebda.h
rename to xen/arch/x86/include/asm/mach-default/bios_ebda.h
diff --git a/xen/include/asm-x86/mach-default/io_ports.h b/xen/arch/x86/include/asm/mach-default/io_ports.h
similarity index 100%
rename from xen/include/asm-x86/mach-default/io_ports.h
rename to xen/arch/x86/include/asm/mach-default/io_ports.h
diff --git a/xen/include/asm-x86/mach-default/irq_vectors.h b/xen/arch/x86/include/asm/mach-default/irq_vectors.h
similarity index 100%
rename from xen/include/asm-x86/mach-default/irq_vectors.h
rename to xen/arch/x86/include/asm/mach-default/irq_vectors.h
diff --git a/xen/include/asm-x86/mach-default/mach_mpparse.h b/xen/arch/x86/include/asm/mach-default/mach_mpparse.h
similarity index 100%
rename from xen/include/asm-x86/mach-default/mach_mpparse.h
rename to xen/arch/x86/include/asm/mach-default/mach_mpparse.h
diff --git a/xen/include/asm-x86/mach-default/mach_mpspec.h b/xen/arch/x86/include/asm/mach-default/mach_mpspec.h
similarity index 100%
rename from xen/include/asm-x86/mach-default/mach_mpspec.h
rename to xen/arch/x86/include/asm/mach-default/mach_mpspec.h
diff --git a/xen/include/asm-x86/mach-generic/mach_apic.h b/xen/arch/x86/include/asm/mach-generic/mach_apic.h
similarity index 100%
rename from xen/include/asm-x86/mach-generic/mach_apic.h
rename to xen/arch/x86/include/asm/mach-generic/mach_apic.h
diff --git a/xen/include/asm-x86/mach-generic/mach_mpparse.h b/xen/arch/x86/include/asm/mach-generic/mach_mpparse.h
similarity index 100%
rename from xen/include/asm-x86/mach-generic/mach_mpparse.h
rename to xen/arch/x86/include/asm/mach-generic/mach_mpparse.h
diff --git a/xen/include/asm-x86/machine_kexec.h b/xen/arch/x86/include/asm/machine_kexec.h
similarity index 100%
rename from xen/include/asm-x86/machine_kexec.h
rename to xen/arch/x86/include/asm/machine_kexec.h
diff --git a/xen/include/asm-x86/mc146818rtc.h b/xen/arch/x86/include/asm/mc146818rtc.h
similarity index 100%
rename from xen/include/asm-x86/mc146818rtc.h
rename to xen/arch/x86/include/asm/mc146818rtc.h
diff --git a/xen/include/asm-x86/mce.h b/xen/arch/x86/include/asm/mce.h
similarity index 100%
rename from xen/include/asm-x86/mce.h
rename to xen/arch/x86/include/asm/mce.h
diff --git a/xen/include/asm-x86/mem_access.h b/xen/arch/x86/include/asm/mem_access.h
similarity index 100%
rename from xen/include/asm-x86/mem_access.h
rename to xen/arch/x86/include/asm/mem_access.h
diff --git a/xen/include/asm-x86/mem_paging.h b/xen/arch/x86/include/asm/mem_paging.h
similarity index 100%
rename from xen/include/asm-x86/mem_paging.h
rename to xen/arch/x86/include/asm/mem_paging.h
diff --git a/xen/include/asm-x86/mem_sharing.h b/xen/arch/x86/include/asm/mem_sharing.h
similarity index 100%
rename from xen/include/asm-x86/mem_sharing.h
rename to xen/arch/x86/include/asm/mem_sharing.h
diff --git a/xen/include/asm-x86/microcode.h b/xen/arch/x86/include/asm/microcode.h
similarity index 100%
rename from xen/include/asm-x86/microcode.h
rename to xen/arch/x86/include/asm/microcode.h
diff --git a/xen/include/asm-x86/mm.h b/xen/arch/x86/include/asm/mm.h
similarity index 100%
rename from xen/include/asm-x86/mm.h
rename to xen/arch/x86/include/asm/mm.h
diff --git a/xen/include/asm-x86/monitor.h b/xen/arch/x86/include/asm/monitor.h
similarity index 100%
rename from xen/include/asm-x86/monitor.h
rename to xen/arch/x86/include/asm/monitor.h
diff --git a/xen/include/asm-x86/mpspec.h b/xen/arch/x86/include/asm/mpspec.h
similarity index 100%
rename from xen/include/asm-x86/mpspec.h
rename to xen/arch/x86/include/asm/mpspec.h
diff --git a/xen/include/asm-x86/mpspec_def.h b/xen/arch/x86/include/asm/mpspec_def.h
similarity index 100%
rename from xen/include/asm-x86/mpspec_def.h
rename to xen/arch/x86/include/asm/mpspec_def.h
diff --git a/xen/include/asm-x86/msi.h b/xen/arch/x86/include/asm/msi.h
similarity index 100%
rename from xen/include/asm-x86/msi.h
rename to xen/arch/x86/include/asm/msi.h
diff --git a/xen/include/asm-x86/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
similarity index 100%
rename from xen/include/asm-x86/msr-index.h
rename to xen/arch/x86/include/asm/msr-index.h
diff --git a/xen/include/asm-x86/msr.h b/xen/arch/x86/include/asm/msr.h
similarity index 100%
rename from xen/include/asm-x86/msr.h
rename to xen/arch/x86/include/asm/msr.h
diff --git a/xen/include/asm-x86/mtrr.h b/xen/arch/x86/include/asm/mtrr.h
similarity index 100%
rename from xen/include/asm-x86/mtrr.h
rename to xen/arch/x86/include/asm/mtrr.h
diff --git a/xen/include/asm-x86/multicall.h b/xen/arch/x86/include/asm/multicall.h
similarity index 100%
rename from xen/include/asm-x86/multicall.h
rename to xen/arch/x86/include/asm/multicall.h
diff --git a/xen/include/asm-x86/mwait.h b/xen/arch/x86/include/asm/mwait.h
similarity index 100%
rename from xen/include/asm-x86/mwait.h
rename to xen/arch/x86/include/asm/mwait.h
diff --git a/xen/include/asm-x86/nmi.h b/xen/arch/x86/include/asm/nmi.h
similarity index 100%
rename from xen/include/asm-x86/nmi.h
rename to xen/arch/x86/include/asm/nmi.h
diff --git a/xen/include/asm-x86/nops.h b/xen/arch/x86/include/asm/nops.h
similarity index 100%
rename from xen/include/asm-x86/nops.h
rename to xen/arch/x86/include/asm/nops.h
diff --git a/xen/include/asm-x86/nospec.h b/xen/arch/x86/include/asm/nospec.h
similarity index 100%
rename from xen/include/asm-x86/nospec.h
rename to xen/arch/x86/include/asm/nospec.h
diff --git a/xen/include/asm-x86/numa.h b/xen/arch/x86/include/asm/numa.h
similarity index 100%
rename from xen/include/asm-x86/numa.h
rename to xen/arch/x86/include/asm/numa.h
diff --git a/xen/include/asm-x86/p2m.h b/xen/arch/x86/include/asm/p2m.h
similarity index 100%
rename from xen/include/asm-x86/p2m.h
rename to xen/arch/x86/include/asm/p2m.h
diff --git a/xen/include/asm-x86/page-bits.h b/xen/arch/x86/include/asm/page-bits.h
similarity index 100%
rename from xen/include/asm-x86/page-bits.h
rename to xen/arch/x86/include/asm/page-bits.h
diff --git a/xen/include/asm-x86/page.h b/xen/arch/x86/include/asm/page.h
similarity index 100%
rename from xen/include/asm-x86/page.h
rename to xen/arch/x86/include/asm/page.h
diff --git a/xen/include/asm-x86/paging.h b/xen/arch/x86/include/asm/paging.h
similarity index 100%
rename from xen/include/asm-x86/paging.h
rename to xen/arch/x86/include/asm/paging.h
diff --git a/xen/include/asm-x86/pci.h b/xen/arch/x86/include/asm/pci.h
similarity index 100%
rename from xen/include/asm-x86/pci.h
rename to xen/arch/x86/include/asm/pci.h
diff --git a/xen/include/asm-x86/percpu.h b/xen/arch/x86/include/asm/percpu.h
similarity index 100%
rename from xen/include/asm-x86/percpu.h
rename to xen/arch/x86/include/asm/percpu.h
diff --git a/xen/include/asm-x86/perfc.h b/xen/arch/x86/include/asm/perfc.h
similarity index 100%
rename from xen/include/asm-x86/perfc.h
rename to xen/arch/x86/include/asm/perfc.h
diff --git a/xen/include/asm-x86/perfc_defn.h b/xen/arch/x86/include/asm/perfc_defn.h
similarity index 100%
rename from xen/include/asm-x86/perfc_defn.h
rename to xen/arch/x86/include/asm/perfc_defn.h
diff --git a/xen/include/asm-x86/processor.h b/xen/arch/x86/include/asm/processor.h
similarity index 100%
rename from xen/include/asm-x86/processor.h
rename to xen/arch/x86/include/asm/processor.h
diff --git a/xen/include/asm-x86/psr.h b/xen/arch/x86/include/asm/psr.h
similarity index 100%
rename from xen/include/asm-x86/psr.h
rename to xen/arch/x86/include/asm/psr.h
diff --git a/xen/include/asm-x86/pv/domain.h b/xen/arch/x86/include/asm/pv/domain.h
similarity index 100%
rename from xen/include/asm-x86/pv/domain.h
rename to xen/arch/x86/include/asm/pv/domain.h
diff --git a/xen/include/asm-x86/pv/grant_table.h b/xen/arch/x86/include/asm/pv/grant_table.h
similarity index 100%
rename from xen/include/asm-x86/pv/grant_table.h
rename to xen/arch/x86/include/asm/pv/grant_table.h
diff --git a/xen/include/asm-x86/pv/mm.h b/xen/arch/x86/include/asm/pv/mm.h
similarity index 100%
rename from xen/include/asm-x86/pv/mm.h
rename to xen/arch/x86/include/asm/pv/mm.h
diff --git a/xen/include/asm-x86/pv/shim.h b/xen/arch/x86/include/asm/pv/shim.h
similarity index 100%
rename from xen/include/asm-x86/pv/shim.h
rename to xen/arch/x86/include/asm/pv/shim.h
diff --git a/xen/include/asm-x86/pv/trace.h b/xen/arch/x86/include/asm/pv/trace.h
similarity index 100%
rename from xen/include/asm-x86/pv/trace.h
rename to xen/arch/x86/include/asm/pv/trace.h
diff --git a/xen/include/asm-x86/pv/traps.h b/xen/arch/x86/include/asm/pv/traps.h
similarity index 100%
rename from xen/include/asm-x86/pv/traps.h
rename to xen/arch/x86/include/asm/pv/traps.h
diff --git a/xen/include/asm-x86/random.h b/xen/arch/x86/include/asm/random.h
similarity index 100%
rename from xen/include/asm-x86/random.h
rename to xen/arch/x86/include/asm/random.h
diff --git a/xen/include/asm-x86/regs.h b/xen/arch/x86/include/asm/regs.h
similarity index 100%
rename from xen/include/asm-x86/regs.h
rename to xen/arch/x86/include/asm/regs.h
diff --git a/xen/include/asm-x86/setup.h b/xen/arch/x86/include/asm/setup.h
similarity index 100%
rename from xen/include/asm-x86/setup.h
rename to xen/arch/x86/include/asm/setup.h
diff --git a/xen/include/asm-x86/shadow.h b/xen/arch/x86/include/asm/shadow.h
similarity index 100%
rename from xen/include/asm-x86/shadow.h
rename to xen/arch/x86/include/asm/shadow.h
diff --git a/xen/include/asm-x86/shared.h b/xen/arch/x86/include/asm/shared.h
similarity index 100%
rename from xen/include/asm-x86/shared.h
rename to xen/arch/x86/include/asm/shared.h
diff --git a/xen/include/asm-x86/smp.h b/xen/arch/x86/include/asm/smp.h
similarity index 100%
rename from xen/include/asm-x86/smp.h
rename to xen/arch/x86/include/asm/smp.h
diff --git a/xen/include/asm-x86/softirq.h b/xen/arch/x86/include/asm/softirq.h
similarity index 100%
rename from xen/include/asm-x86/softirq.h
rename to xen/arch/x86/include/asm/softirq.h
diff --git a/xen/include/asm-x86/spec_ctrl.h b/xen/arch/x86/include/asm/spec_ctrl.h
similarity index 100%
rename from xen/include/asm-x86/spec_ctrl.h
rename to xen/arch/x86/include/asm/spec_ctrl.h
diff --git a/xen/include/asm-x86/spec_ctrl_asm.h b/xen/arch/x86/include/asm/spec_ctrl_asm.h
similarity index 100%
rename from xen/include/asm-x86/spec_ctrl_asm.h
rename to xen/arch/x86/include/asm/spec_ctrl_asm.h
diff --git a/xen/include/asm-x86/spinlock.h b/xen/arch/x86/include/asm/spinlock.h
similarity index 100%
rename from xen/include/asm-x86/spinlock.h
rename to xen/arch/x86/include/asm/spinlock.h
diff --git a/xen/include/asm-x86/string.h b/xen/arch/x86/include/asm/string.h
similarity index 100%
rename from xen/include/asm-x86/string.h
rename to xen/arch/x86/include/asm/string.h
diff --git a/xen/include/asm-x86/system.h b/xen/arch/x86/include/asm/system.h
similarity index 100%
rename from xen/include/asm-x86/system.h
rename to xen/arch/x86/include/asm/system.h
diff --git a/xen/include/asm-x86/tboot.h b/xen/arch/x86/include/asm/tboot.h
similarity index 100%
rename from xen/include/asm-x86/tboot.h
rename to xen/arch/x86/include/asm/tboot.h
diff --git a/xen/include/asm-x86/time.h b/xen/arch/x86/include/asm/time.h
similarity index 100%
rename from xen/include/asm-x86/time.h
rename to xen/arch/x86/include/asm/time.h
diff --git a/xen/include/asm-x86/trace.h b/xen/arch/x86/include/asm/trace.h
similarity index 100%
rename from xen/include/asm-x86/trace.h
rename to xen/arch/x86/include/asm/trace.h
diff --git a/xen/include/asm-x86/traps.h b/xen/arch/x86/include/asm/traps.h
similarity index 100%
rename from xen/include/asm-x86/traps.h
rename to xen/arch/x86/include/asm/traps.h
diff --git a/xen/include/asm-x86/types.h b/xen/arch/x86/include/asm/types.h
similarity index 100%
rename from xen/include/asm-x86/types.h
rename to xen/arch/x86/include/asm/types.h
diff --git a/xen/include/asm-x86/uaccess.h b/xen/arch/x86/include/asm/uaccess.h
similarity index 100%
rename from xen/include/asm-x86/uaccess.h
rename to xen/arch/x86/include/asm/uaccess.h
diff --git a/xen/include/asm-x86/unaligned.h b/xen/arch/x86/include/asm/unaligned.h
similarity index 100%
rename from xen/include/asm-x86/unaligned.h
rename to xen/arch/x86/include/asm/unaligned.h
diff --git a/xen/include/asm-x86/vm_event.h b/xen/arch/x86/include/asm/vm_event.h
similarity index 100%
rename from xen/include/asm-x86/vm_event.h
rename to xen/arch/x86/include/asm/vm_event.h
diff --git a/xen/include/asm-x86/vpmu.h b/xen/arch/x86/include/asm/vpmu.h
similarity index 100%
rename from xen/include/asm-x86/vpmu.h
rename to xen/arch/x86/include/asm/vpmu.h
diff --git a/xen/include/asm-x86/x86-defns.h b/xen/arch/x86/include/asm/x86-defns.h
similarity index 100%
rename from xen/include/asm-x86/x86-defns.h
rename to xen/arch/x86/include/asm/x86-defns.h
diff --git a/xen/include/asm-x86/x86-vendors.h b/xen/arch/x86/include/asm/x86-vendors.h
similarity index 100%
rename from xen/include/asm-x86/x86-vendors.h
rename to xen/arch/x86/include/asm/x86-vendors.h
diff --git a/xen/include/asm-x86/x86_64/efibind.h b/xen/arch/x86/include/asm/x86_64/efibind.h
similarity index 100%
rename from xen/include/asm-x86/x86_64/efibind.h
rename to xen/arch/x86/include/asm/x86_64/efibind.h
diff --git a/xen/include/asm-x86/x86_64/elf.h b/xen/arch/x86/include/asm/x86_64/elf.h
similarity index 100%
rename from xen/include/asm-x86/x86_64/elf.h
rename to xen/arch/x86/include/asm/x86_64/elf.h
diff --git a/xen/include/asm-x86/x86_64/page.h b/xen/arch/x86/include/asm/x86_64/page.h
similarity index 100%
rename from xen/include/asm-x86/x86_64/page.h
rename to xen/arch/x86/include/asm/x86_64/page.h
diff --git a/xen/include/asm-x86/x86_64/regs.h b/xen/arch/x86/include/asm/x86_64/regs.h
similarity index 100%
rename from xen/include/asm-x86/x86_64/regs.h
rename to xen/arch/x86/include/asm/x86_64/regs.h
diff --git a/xen/include/asm-x86/x86_64/system.h b/xen/arch/x86/include/asm/x86_64/system.h
similarity index 100%
rename from xen/include/asm-x86/x86_64/system.h
rename to xen/arch/x86/include/asm/x86_64/system.h
diff --git a/xen/include/asm-x86/x86_64/uaccess.h b/xen/arch/x86/include/asm/x86_64/uaccess.h
similarity index 100%
rename from xen/include/asm-x86/x86_64/uaccess.h
rename to xen/arch/x86/include/asm/x86_64/uaccess.h
diff --git a/xen/include/asm-x86/x86_emulate.h b/xen/arch/x86/include/asm/x86_emulate.h
similarity index 89%
rename from xen/include/asm-x86/x86_emulate.h
rename to xen/arch/x86/include/asm/x86_emulate.h
index 9125807e24fa..c184c0053c93 100644
--- a/xen/include/asm-x86/x86_emulate.h
+++ b/xen/arch/x86/include/asm/x86_emulate.h
@@ -16,6 +16,6 @@
 #include <xen/lib.h>
 #include <asm/regs.h>
 
-#include "../../arch/x86/x86_emulate/x86_emulate.h"
+#include "../../x86_emulate/x86_emulate.h"
 
 #endif /* __ASM_X86_X86_EMULATE_H__ */
diff --git a/xen/include/asm-x86/xenoprof.h b/xen/arch/x86/include/asm/xenoprof.h
similarity index 100%
rename from xen/include/asm-x86/xenoprof.h
rename to xen/arch/x86/include/asm/xenoprof.h
diff --git a/xen/include/asm-x86/xstate.h b/xen/arch/x86/include/asm/xstate.h
similarity index 100%
rename from xen/include/asm-x86/xstate.h
rename to xen/arch/x86/include/asm/xstate.h
diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
index d2fdc28df3e0..541e462d961d 100644
--- a/xen/common/efi/runtime.c
+++ b/xen/common/efi/runtime.c
@@ -12,7 +12,7 @@ struct efi_rs_state {
 #ifdef CONFIG_X86
  /*
   * The way stacks get set up leads to them always being on an 8-byte
-  * boundary not evenly divisible by 16 (see asm-x86/current.h). The EFI ABI,
+  * boundary not evenly divisible by 16 (see asm/current.h). The EFI ABI,
   * just like the CPU one, however requires stacks to be 16-byte aligned
   * before every function call. Since the compiler assumes this (unless
   * passing it -mpreferred-stack-boundary=3), it wouldn't generate code to
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index d0baaa2ecd20..653f1ab09f63 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -245,7 +245,7 @@ PAGE_LIST_HEAD(page_broken_list);
 
 /*
  * first_valid_mfn is exported because it is use in ARM specific NUMA
- * helpers. See comment in asm-arm/numa.h.
+ * helpers. See comment in arch/arm/include/asm/numa.h.
  */
 mfn_t first_valid_mfn = INVALID_MFN_INITIALIZER;
 
diff --git a/xen/include/xen/acpi.h b/xen/include/xen/acpi.h
index 088c238a504a..08834f140266 100644
--- a/xen/include/xen/acpi.h
+++ b/xen/include/xen/acpi.h
@@ -40,8 +40,9 @@
 #define ACPI_MADT_GET_TRIGGER(inti)	ACPI_MADT_GET_(TRIGGER, inti)
 
 /*
- * Fixmap pages to reserve for ACPI boot-time tables (see asm-x86/fixmap.h or
- * asm-arm/config.h, 64 pages(256KB) is large enough for most cases.)
+ * Fixmap pages to reserve for ACPI boot-time tables (see
+ * arch/x86/include/asm/fixmap.h or arch/arm/include/asm/config.h,
+ * 64 pages(256KB) is large enough for most cases.)
  */
 #define NUM_FIXMAP_ACPI_PAGES  64
 
diff --git a/xen/include/xen/bitmap.h b/xen/include/xen/bitmap.h
index e9175ab54a59..3caf92c76d6d 100644
--- a/xen/include/xen/bitmap.h
+++ b/xen/include/xen/bitmap.h
@@ -14,7 +14,7 @@
  *
  * Function implementations generic to all architectures are in
  * lib/bitmap.c.  Functions implementations that are architecture
- * specific are in various include/asm-<arch>/bitops.h headers
+ * specific are in various asm/bitops.h headers
  * and other arch/<arch> specific files.
  *
  * See lib/bitmap.c for more details.
-- 
Anthony PERARD


