Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E71C501CDB
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 22:40:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.305117.519987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf6Fg-0002uQ-QZ; Thu, 14 Apr 2022 20:39:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 305117.519987; Thu, 14 Apr 2022 20:39:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf6Fg-0002sa-NY; Thu, 14 Apr 2022 20:39:40 +0000
Received: by outflank-mailman (input) for mailman id 305117;
 Thu, 14 Apr 2022 20:39:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qEdm=UY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nf6Ff-0002sE-60
 for xen-devel@lists.xenproject.org; Thu, 14 Apr 2022 20:39:39 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff54faeb-bc32-11ec-8fbe-03012f2f19d4;
 Thu, 14 Apr 2022 22:39:37 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7600D61B98;
 Thu, 14 Apr 2022 20:39:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CDE4C385A1;
 Thu, 14 Apr 2022 20:39:34 +0000 (UTC)
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
X-Inumbo-ID: ff54faeb-bc32-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649968774;
	bh=R1wd4B+cBCa/YB/NXjO8virq7TohKQ4D10Gi/ExkIP8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ayshRXFHMAzv6sXVHiluh0E0+yR3ug3hrkX+Pwwyh/10waIWmmQIZPng1coPtEJiX
	 5EQ1x8Sr1J6rLi7YcQg+3yY13rd79e08MXc/HwS4OuCDoi1NBqtQoxYideK4is9yVs
	 MbwzPoAnXWUOZrphp7y4uJCPQ6Ne/dfh2Vvn33T0aWNpIgMnKH9akO7mvX6Bk5hDNC
	 u3Da5v4sAoc2Fnje0iZ0eqg2KXRPUBeAXO6S6W/konKIbp/zOv/hjLZw5lDXhDHhOj
	 /XVm08oI1puCqdCeF4yVBiwPIv5NJX/8sMFkHjZxER1ZkYl0gq2xQlOIIGyuHT61Fq
	 1S2HAL+i+20NA==
Date: Thu, 14 Apr 2022 13:39:23 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Rahul Singh <Rahul.Singh@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, 
    Jan Beulich <jbeulich@suse.com>, "jgross@suse.com" <jgross@suse.com>, 
    "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, hch@lst.de
Subject: Re: xen-swiotlb issue when NVMe driver is enabled in Dom0 on ARM
In-Reply-To: <8C511888-6183-421E-A4C7-B271DAF46696@arm.com>
Message-ID: <alpine.DEB.2.22.394.2204141329290.894007@ubuntu-linux-20-04-desktop>
References: <C82612B1-FED5-4139-9B87-FB33DD81F01A@arm.com> <alpine.DEB.2.22.394.2204131354190.3066615@ubuntu-linux-20-04-desktop> <8C511888-6183-421E-A4C7-B271DAF46696@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-332270353-1649968266=:894007"
Content-ID: <alpine.DEB.2.22.394.2204141331150.894007@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-332270353-1649968266=:894007
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2204141331151.894007@ubuntu-linux-20-04-desktop>

+ Christoph

Hi Christoph,

Rahul is seeing a swiotlb-xen failure on Ampere Altra triggered by the
NVME driver doing DMA. There is stacktrace below.

I asked Rahul to check the code path taken with and without Xen and it
looks like everything checks out. See below.


On Thu, 14 Apr 2022, Rahul Singh wrote:
> Hi Stefano,
> 
> > On 13 Apr 2022, at 10:24 pm, Stefano Stabellini <sstabellini@kernel.org> wrote:
> >
> > On Wed, 13 Apr 2022, Rahul Singh wrote:
> >> Hello All,
> >>
> >> We are trying to boot the Xen 4.15.1 and dom0 Linux Kernel (5.10.27-ampere-lts-standard from [1] ) on Ampere Altra / AVA Developer
> Platform
> >> [2] with ACPI.
> >>
> >> NVMe storage is connected to PCIe. Native Linux kernel boot fine and also I am able to detect and access NVMe storage.
> >> However, during XEN boot when NVME driver is requesting the DMA buffer we are observing the Oops with XEN.
> >
> > Hi Rahul,
> >
> > Thanks for the bug report. More comments below.
> >
> >
> >
> >> Please find the attached detail logs for Xen and dom0 booting.
> >>
> >> Snip from logs:
> >> (XEN) d0v0: vGICR: SGI: unhandled word write 0x000000ffffffff to ICACTIVER0
> >> [  0.000000] Booting Linux on physical CPU 0x0000000000 [0x413fd0c1]
> >> [  0.000000] Linux version 5.10.27-ampere-lts-standard (oe-user@oe-host) (aarch64-poky-linux-gcc (GCC) 11.2.0, GNU ld (GNU Binutils)
> >> 2.37.20210721) #1 SMP PREEMPT Sat Sep 18 06:01:59 UTC 2021
> >> [  0.000000] Xen XEN_VERSION.XEN_SUBVERSION support found
> >> [  0.000000] efi: EFI v2.50 by Xen
> >> [  0.000000] efi: ACPI 2.0=0x807f66cece8
> >> [  0.000000] ACPI: Early table checksum verification disabled
> >> [  0.000000] ACPI: RSDP 0x00000807F66CECE8 000024 (v02 Ampere)
> >> [  0.000000] ACPI: XSDT 0x00000807F66CEC38 0000AC (v01 Ampere Altra  00000002 AMP. 01000013)
> >> [  0.000000] ACPI: FACP 0x00000807F66CE000 000114 (v06 Ampere Altra  00000002 AMP. 01000013)
> >> [  0.000000] ACPI: DSDT 0x00000807F8DB0018 02C19E (v02 Ampere Jade  00000001 INTL 20201217)
> >> [  0.000000] ACPI: BERT 0x00000807FA0DFF98 000030 (v01 Ampere Altra  00000002 AMP. 01000013)
> >> [  0.000000] ACPI: DBG2 0x00000807FA0DFA98 00005C (v00 Ampere Altra  00000002 AMP. 01000013)
> >> [  0.000000] ACPI: GTDT 0x00000807FA0DE998 000110 (v03 Ampere Altra  00000002 AMP. 01000013)
> >> [  0.000000] ACPI: SPCR 0x00000807FA0DFE18 000050 (v02 Ampere Altra  00000002 AMP. 01000013)
> >> [  0.000000] ACPI: EINJ 0x00000807FA0DF598 000150 (v01 Ampere Altra  00000001 INTL 20201217)
> >> [  0.000000] ACPI: HEST 0x00000807FA0DEB18 0001F4 (v01 Ampere Altra  00000001 INTL 20201217)
> >> [  0.000000] ACPI: SSDT 0x00000807FA0DFA18 00002D (v02 Ampere Altra  00000001 INTL 20201217)
> >> [  0.000000] ACPI: TPM2 0x00000807FA0DFD18 00004C (v04 Ampere Altra  00000002 AMP. 01000013)
> >> [  0.000000] ACPI: MCFG 0x00000807FA0DF718 00007C (v01 Ampere Altra  00000001 AMP. 01000013)
> >> [  0.000000] ACPI: IORT 0x00000807FA0DEF18 0003DC (v00 Ampere Altra  00000002 AMP. 01000013)
> >> [  0.000000] ACPI: APIC 0x00000807F66CE118 000AF4 (v05 Ampere Altra  00000002 AMP. 01000013)
> >> [  0.000000] ACPI: PPTT 0x00000807FA0D8618 004520 (v02 Ampere Altra  00000002 AMP. 01000013)
> >> [  0.000000] ACPI: SLIT 0x00000807FA0DFD98 00002D (v01 Ampere Altra  00000002 AMP. 01000013)
> >> [  0.000000] ACPI: SRAT 0x00000807FA0DCE18 000370 (v03 Ampere Altra  00000002 AMP. 01000013)
> >> [  0.000000] ACPI: PCCT 0x00000807FA0DE318 000576 (v02 Ampere Altra  00000002 AMP. 01000013)
> >> [  0.000000] ACPI: STAO 0x00000807F66CEC10 000025 (v01 Ampere Altra  00000002 AMP. 01000013)
> >> [  0.000000] ACPI: SPCR: console: pl011,mmio32,0x100002600000,115200
> >> [  0.000000] ACPI: SRAT: Node 0 PXM 0 [mem 0x88300000-0x883fffff]
> >> [  0.000000] ACPI: SRAT: Node 0 PXM 0 [mem 0x90000000-0xffffffff]
> >> [  0.000000] ACPI: SRAT: Node 0 PXM 0 [mem 0x80000000000-0x8007fffffff]
> >> [  0.000000] ACPI: SRAT: Node 0 PXM 0 [mem 0x80100000000-0x807ffffffff]
> >> [  0.000000] NUMA: NODE_DATA [mem 0x8079fbf5e00-0x8079fbf7fff]
> >> [  0.000000] Zone ranges:
> >> [  0.000000]  DMA  [mem 0x0000000098000000-0x00000000ffffffff]
> >> [  0.000000]  DMA32  empty
> >> [  0.000000]  Normal  [mem 0x0000000100000000-0x00000807fa0dffff]
> >> [  0.000000] Movable zone start for each node
> >> [  0.000000] Early memory node ranges
> >> ….
> >>
> >> [  0.000000] Dentry cache hash table entries: 262144 (order: 9, 2097152 bytes, linear)
> >> [  0.000000] Inode-cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)
> >> [  0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
> >> [  0.000000] software IO TLB: mapped [mem 0x00000000f4000000-0x00000000f8000000] (64MB)
> >> [  0.000000] Memory: 1929152K/2097412K available (13568K kernel code, 1996K rwdata, 3476K rodata, 4160K init, 822K bss, 168260K
> reserved,
> >> 0K cma-reserved)
> >> [  0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=32, Nodes=1
> >> [  0.000000] ftrace: allocating 41306 entries in 162 pages
> >> ….
> >>
> >> ….
> >> [  12.599484] loop: module loaded
> >> [  12.603160] nvme nvme0: pci function 0005:04:00.0
> >> [  12.608129] igb: Intel(R) Gigabit Ethernet Network Driver
> >> [  12.613495] igb: Copyright (c) 2007-2014 Intel Corporation.
> >> [  12.613636] nvme nvme0: missing or invalid SUBNQN field.
> >> [  12.625941] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000008
> >> [  12.634726] Mem abort info:
> >> [  12.637520]  ESR = 0x96000044
> >> [  12.640646]  EC = 0x25: DABT (current EL), IL = 32 bits
> >> [  12.646055]  SET = 0, FnV = 0
> >> [  12.649153]  EA = 0, S1PTW = 0
> >> [  12.652365] Data abort info:
> >> [  12.655314]  ISV = 0, ISS = 0x00000044
> >> [  12.659231]  CM = 0, WnR = 1
> >> [  12.662260] [0000000000000008] user address but active_mm is swapper
> >> [  12.668724] Internal error: Oops: 96000044 [#1] PREEMPT SMP
> >> [  12.674358] Modules linked in:
> >> [  12.677455] CPU: 0 PID: 7 Comm: kworker/u64:0 Tainted: G  W  5.10.27-ampere-lts-standard #1
> >> [  12.687083] Workqueue: nvme-reset-wq nvme_reset_work
> >> [  12.692059] pstate: 60c00085 (nZCv daIf +PAN +UAO -TCO BTYPE=--)
> >> [  12.698149] pc : steal_suitable_fallback+0x138/0x2f0
> >> [  12.703170] lr : steal_suitable_fallback+0x1bc/0x2f0
> >> [  12.708203] sp : ffff80001196b820
> >> [  12.711569] x29: ffff80001196b820 x28: 0000000000000000
> >> [  12.716975] x27: 0000000000000000 x26: ffff8000114dbcb0
> >> [  12.722357] x25: fffffdffffe00000 x24: 0000000000000001
> >> [  12.727740] x23: 0000000000000000 x22: fffffe201bf60000
> >> [  12.733120] x21: ffff08071fbf6980 x20: 0000000000000901
> >> [  12.738502] x19: 0000000000080000 x18: ffffffffffffffff
> >> [  12.743884] x17: 0000000000000000 x16: 0000000000000012
> >> [  12.749266] x15: ffff08070508c683 x14: 0000000000000058
> >> [  12.754648] x13: 00000000000000c0 x12: 0000000000000000
> >> [  12.760030] x11: 0000000000000400 x10: 000000000000000c
> >> [  12.765412] x9 : ffff800010039d58 x8 : 0000000020000000
> >> [  12.770794] x7 : 0000000000000018 x6 : ffff800011750890
> >> [  12.776176] x5 : ffff800011750878 x4 : 0000000000000000
> >> [  12.781558] x3 : 0000000000000000 x2 : 0000000000000000
> >> [  12.786940] x1 : 0000000000000200 x0 : 0000000000000000
> >> [  12.792322] Call trace:
> >> [  12.794806]  steal_suitable_fallback+0x138/0x2f0
> >> [  12.799520]  get_page_from_freelist+0xe30/0x12a0
> >> [  12.804207]  __alloc_pages_nodemask+0x148/0xe00
> >> [  12.808809]  __dma_direct_alloc_pages+0xa4/0x1d0
> >> [  12.813496]  dma_direct_alloc+0x1d8/0x340
> >> [  12.817571]  xen_swiotlb_alloc_coherent+0x68/0x370
> >> [  12.822439]  dma_alloc_attrs+0xe8/0xf0
> >> [  12.826246]  nvme_reset_work+0x1030/0x1520
> >> [  12.830417]  process_one_work+0x1dc/0x4bc
> >> [  12.834495]  worker_thread+0x144/0x470
> >> [  12.838313]  kthread+0x14c/0x160
> >> [  12.841604]  ret_from_fork+0x10/0x38
> >> [  12.845255] Code: a94082c4 d37ef463 cb3c4063 8b3c4042 (f9000480)
> >> [  12.851447] ---[ end trace f68728a0d3053b72 ]---
> >> [  12.856117] note: kworker/u64:0[7] exited with preempt_count
> >
> > xen_swiotlb_alloc_coherent calls dma_direct_alloc which fails for the
> > device.
> >
> > Without swiotlb_xen, dma_alloc_attrs would do:
> >
> >        if (dma_alloc_direct(dev, ops))
> >                cpu_addr = dma_direct_alloc(dev, size, dma_handle, flag, attrs);
> >        else if (ops->alloc)
> >                cpu_addr = ops->alloc(dev, size, dma_handle, flag, attrs);
> >
> > dma_alloc_direct is the very same call that fails when called from
> > xen_swiotlb_alloc_coherent. So it must be that the path meant to be
> > taken is ops->alloc instead.
> >
> > ops->alloc is the dma_ops function to allocate a coherent buffer.
> > When swiotlb-xen is enabled, it points to xen_swiotlb_alloc_coherent.
> > Often dma_ops is NULL when Xen is disabled.
> >
> > I think the most likely explanation is that the nvme device require a
> > specific dma_ops. When swiotlb-xen is enabled, it gets overwritten by
> > arch/arm64/mm/dma-mapping.c:arch_setup_dma_ops.
> >
> > Can you double-check this theory by adding a few printks in
> > arch/arm64/mm/dma-mapping.c:arch_setup_dma_ops, to check the dma_ops
> > used when !CONFIG_XEN, and also in kernel/dma/mapping.c:dma_alloc_attrs
> > to check the code path taken when !CONFIG_XEN?
> 
> I checked the code path when !CONFID_XEN and SMMU is not enabled in linux, code path is:
>         dma_alloc_attrs() -> dma_alloc_direct()
> and there is no issue in booting and allocating a coherent buffer.
> 
> When !CONFIG_XEN and SMMU is enabled code path is:
>         dma_alloc_attrs()-> ops->alloc -> iommu_dma_alloc()
> and there is no issue in booting and allocating a coherent buffer in this case also.
> 
> When Xen is enabled code path is:
>         dma_alloc_attrs()-> ops->alloc() -> xen_swiotlb_alloc_coherent() -> dma_alloc_direct()
> in this case allocating the coherent buffer failed.
> 
> Only difference I see is the size argument for dma_alloc_direct() in Xen case but I don’t think
> that is causing the issue there is something else causing the issue maybe from
> where the coherent memory is allocated.
>        
>         /* Convert the size to actually allocated. */
>         size = 1UL << (order + XEN_PAGE_SHIFT);
> 
> 
> Please find the attached detailed logs for each case.


OK, now we know that the code path with Xen is correct and it is the
same code path taken (dma_alloc_direct) as when !CONFIG_XEN and !SMMU.
That is how it should be.

I cannot explain why dma_alloc_direct() would fail when called from
xen_swiotlb_alloc_coherent(), but it would succeed when called from
dma_alloc_attrs() without Xen.

I am not aware of any restrictions that xen or swiotlb-xen would
introduce in that regard. Unless you are just running out of memory
because dom0_mem too low.
--8323329-332270353-1649968266=:894007--

