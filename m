Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F532500128
	for <lists+xen-devel@lfdr.de>; Wed, 13 Apr 2022 23:25:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304322.518942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nekTc-0002rf-NW; Wed, 13 Apr 2022 21:24:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304322.518942; Wed, 13 Apr 2022 21:24:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nekTc-0002oX-KM; Wed, 13 Apr 2022 21:24:36 +0000
Received: by outflank-mailman (input) for mailman id 304322;
 Wed, 13 Apr 2022 21:24:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aqKT=UX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nekTb-0002oR-Bu
 for xen-devel@lists.xenproject.org; Wed, 13 Apr 2022 21:24:35 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c0e9db2-bb70-11ec-a405-831a346695d4;
 Wed, 13 Apr 2022 23:24:33 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8AA0C61E9E;
 Wed, 13 Apr 2022 21:24:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87D61C385A3;
 Wed, 13 Apr 2022 21:24:30 +0000 (UTC)
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
X-Inumbo-ID: 1c0e9db2-bb70-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649885071;
	bh=WB/lD2jHIvvQgr8ggEfqJ614aG5XvkFNca7xisIutu0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dlP+h3PN/ReOe9wb4iEt3/8Qw10mIbIlkHnMrwk1I1T/jQoBbjTnkuBOoxT1Wd7ST
	 t/yUKp8v5IN5Eg46XkpeN0L+hZAIXaJNzqMlZKKrgKN7+MLsSjK/Yx4Z6KK9lABEqa
	 Hfxosma6DQZTyKGFZVkXVISUEPusDSuhhSRSq7zg8jGZ8/oTgs5VH+6S06c7CE4bCt
	 V/6Fx3z/dknj6aoSY+2wkSKLzSVZ+BifR6OAJNGiPfKlaLhlO0OPF2NwcdeqCNYN9J
	 kq+SXZrUC8BOfcrqzFYI3FtFfdbSxBsI9rBUgbw3VwyKq18CxqZC0x82jaWJIfvVig
	 rnKPxzvZ4pr2Q==
Date: Wed, 13 Apr 2022 14:24:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Rahul Singh <Rahul.Singh@arm.com>
cc: xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, jgross@suse.com, 
    boris.ostrovsky@oracle.com
Subject: Re: xen-swiotlb issue when NVMe driver is enabled in Dom0 on ARM
In-Reply-To: <C82612B1-FED5-4139-9B87-FB33DD81F01A@arm.com>
Message-ID: <alpine.DEB.2.22.394.2204131354190.3066615@ubuntu-linux-20-04-desktop>
References: <C82612B1-FED5-4139-9B87-FB33DD81F01A@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1451968002-1649883768=:3066615"
Content-ID: <alpine.DEB.2.22.394.2204131402540.3066615@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1451968002-1649883768=:3066615
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2204131402541.3066615@ubuntu-linux-20-04-desktop>

On Wed, 13 Apr 2022, Rahul Singh wrote:
> Hello All,
> 
> We are trying to boot the Xen 4.15.1 and dom0 Linux Kernel (5.10.27-ampere-lts-standard from [1] ) on Ampere Altra / AVA Developer Platform
> [2] with ACPI.
> 
> NVMe storage is connected to PCIe. Native Linux kernel boot fine and also I am able to detect and access NVMe storage.
> However, during XEN boot when NVME driver is requesting the DMA buffer we are observing the Oops with XEN.

Hi Rahul,

Thanks for the bug report. More comments below.



> Please find the attached detail logs for Xen and dom0 booting.
> 
> Snip from logs:
> (XEN) d0v0: vGICR: SGI: unhandled word write 0x000000ffffffff to ICACTIVER0
> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x413fd0c1]
> [    0.000000] Linux version 5.10.27-ampere-lts-standard (oe-user@oe-host) (aarch64-poky-linux-gcc (GCC) 11.2.0, GNU ld (GNU Binutils)
> 2.37.20210721) #1 SMP PREEMPT Sat Sep 18 06:01:59 UTC 2021
> [    0.000000] Xen XEN_VERSION.XEN_SUBVERSION support found
> [    0.000000] efi: EFI v2.50 by Xen
> [    0.000000] efi: ACPI 2.0=0x807f66cece8
> [    0.000000] ACPI: Early table checksum verification disabled
> [    0.000000] ACPI: RSDP 0x00000807F66CECE8 000024 (v02 Ampere)
> [    0.000000] ACPI: XSDT 0x00000807F66CEC38 0000AC (v01 Ampere Altra    00000002 AMP. 01000013)
> [    0.000000] ACPI: FACP 0x00000807F66CE000 000114 (v06 Ampere Altra    00000002 AMP. 01000013)
> [    0.000000] ACPI: DSDT 0x00000807F8DB0018 02C19E (v02 Ampere Jade     00000001 INTL 20201217)
> [    0.000000] ACPI: BERT 0x00000807FA0DFF98 000030 (v01 Ampere Altra    00000002 AMP. 01000013)
> [    0.000000] ACPI: DBG2 0x00000807FA0DFA98 00005C (v00 Ampere Altra    00000002 AMP. 01000013)
> [    0.000000] ACPI: GTDT 0x00000807FA0DE998 000110 (v03 Ampere Altra    00000002 AMP. 01000013)
> [    0.000000] ACPI: SPCR 0x00000807FA0DFE18 000050 (v02 Ampere Altra    00000002 AMP. 01000013)
> [    0.000000] ACPI: EINJ 0x00000807FA0DF598 000150 (v01 Ampere Altra    00000001 INTL 20201217)
> [    0.000000] ACPI: HEST 0x00000807FA0DEB18 0001F4 (v01 Ampere Altra    00000001 INTL 20201217)
> [    0.000000] ACPI: SSDT 0x00000807FA0DFA18 00002D (v02 Ampere Altra    00000001 INTL 20201217)
> [    0.000000] ACPI: TPM2 0x00000807FA0DFD18 00004C (v04 Ampere Altra    00000002 AMP. 01000013)
> [    0.000000] ACPI: MCFG 0x00000807FA0DF718 00007C (v01 Ampere Altra    00000001 AMP. 01000013)
> [    0.000000] ACPI: IORT 0x00000807FA0DEF18 0003DC (v00 Ampere Altra    00000002 AMP. 01000013)
> [    0.000000] ACPI: APIC 0x00000807F66CE118 000AF4 (v05 Ampere Altra    00000002 AMP. 01000013)
> [    0.000000] ACPI: PPTT 0x00000807FA0D8618 004520 (v02 Ampere Altra    00000002 AMP. 01000013)
> [    0.000000] ACPI: SLIT 0x00000807FA0DFD98 00002D (v01 Ampere Altra    00000002 AMP. 01000013)
> [    0.000000] ACPI: SRAT 0x00000807FA0DCE18 000370 (v03 Ampere Altra    00000002 AMP. 01000013)
> [    0.000000] ACPI: PCCT 0x00000807FA0DE318 000576 (v02 Ampere Altra    00000002 AMP. 01000013)
> [    0.000000] ACPI: STAO 0x00000807F66CEC10 000025 (v01 Ampere Altra    00000002 AMP. 01000013)
> [    0.000000] ACPI: SPCR: console: pl011,mmio32,0x100002600000,115200
> [    0.000000] ACPI: SRAT: Node 0 PXM 0 [mem 0x88300000-0x883fffff]
> [    0.000000] ACPI: SRAT: Node 0 PXM 0 [mem 0x90000000-0xffffffff]
> [    0.000000] ACPI: SRAT: Node 0 PXM 0 [mem 0x80000000000-0x8007fffffff]
> [    0.000000] ACPI: SRAT: Node 0 PXM 0 [mem 0x80100000000-0x807ffffffff]
> [    0.000000] NUMA: NODE_DATA [mem 0x8079fbf5e00-0x8079fbf7fff]
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x0000000098000000-0x00000000ffffffff]
> [    0.000000]   DMA32    empty
> [    0.000000]   Normal   [mem 0x0000000100000000-0x00000807fa0dffff]
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> ….
> 
> [    0.000000] Dentry cache hash table entries: 262144 (order: 9, 2097152 bytes, linear)
> [    0.000000] Inode-cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)
> [    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
> [    0.000000] software IO TLB: mapped [mem 0x00000000f4000000-0x00000000f8000000] (64MB)
> [    0.000000] Memory: 1929152K/2097412K available (13568K kernel code, 1996K rwdata, 3476K rodata, 4160K init, 822K bss, 168260K reserved,
> 0K cma-reserved)
> [    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=32, Nodes=1
> [    0.000000] ftrace: allocating 41306 entries in 162 pages
> ….
> 
> ….
> [   12.599484] loop: module loaded
> [   12.603160] nvme nvme0: pci function 0005:04:00.0
> [   12.608129] igb: Intel(R) Gigabit Ethernet Network Driver
> [   12.613495] igb: Copyright (c) 2007-2014 Intel Corporation.
> [   12.613636] nvme nvme0: missing or invalid SUBNQN field.
> [   12.625941] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000008
> [   12.634726] Mem abort info:
> [   12.637520]   ESR = 0x96000044
> [   12.640646]   EC = 0x25: DABT (current EL), IL = 32 bits
> [   12.646055]   SET = 0, FnV = 0
> [   12.649153]   EA = 0, S1PTW = 0
> [   12.652365] Data abort info:
> [   12.655314]   ISV = 0, ISS = 0x00000044
> [   12.659231]   CM = 0, WnR = 1
> [   12.662260] [0000000000000008] user address but active_mm is swapper
> [   12.668724] Internal error: Oops: 96000044 [#1] PREEMPT SMP
> [   12.674358] Modules linked in:
> [   12.677455] CPU: 0 PID: 7 Comm: kworker/u64:0 Tainted: G        W         5.10.27-ampere-lts-standard #1
> [   12.687083] Workqueue: nvme-reset-wq nvme_reset_work
> [   12.692059] pstate: 60c00085 (nZCv daIf +PAN +UAO -TCO BTYPE=--)
> [   12.698149] pc : steal_suitable_fallback+0x138/0x2f0
> [   12.703170] lr : steal_suitable_fallback+0x1bc/0x2f0
> [   12.708203] sp : ffff80001196b820
> [   12.711569] x29: ffff80001196b820 x28: 0000000000000000
> [   12.716975] x27: 0000000000000000 x26: ffff8000114dbcb0
> [   12.722357] x25: fffffdffffe00000 x24: 0000000000000001
> [   12.727740] x23: 0000000000000000 x22: fffffe201bf60000
> [   12.733120] x21: ffff08071fbf6980 x20: 0000000000000901
> [   12.738502] x19: 0000000000080000 x18: ffffffffffffffff
> [   12.743884] x17: 0000000000000000 x16: 0000000000000012
> [   12.749266] x15: ffff08070508c683 x14: 0000000000000058
> [   12.754648] x13: 00000000000000c0 x12: 0000000000000000
> [   12.760030] x11: 0000000000000400 x10: 000000000000000c
> [   12.765412] x9 : ffff800010039d58 x8 : 0000000020000000
> [   12.770794] x7 : 0000000000000018 x6 : ffff800011750890
> [   12.776176] x5 : ffff800011750878 x4 : 0000000000000000
> [   12.781558] x3 : 0000000000000000 x2 : 0000000000000000
> [   12.786940] x1 : 0000000000000200 x0 : 0000000000000000
> [   12.792322] Call trace:
> [   12.794806]  steal_suitable_fallback+0x138/0x2f0
> [   12.799520]  get_page_from_freelist+0xe30/0x12a0
> [   12.804207]  __alloc_pages_nodemask+0x148/0xe00
> [   12.808809]  __dma_direct_alloc_pages+0xa4/0x1d0
> [   12.813496]  dma_direct_alloc+0x1d8/0x340
> [   12.817571]  xen_swiotlb_alloc_coherent+0x68/0x370
> [   12.822439]  dma_alloc_attrs+0xe8/0xf0
> [   12.826246]  nvme_reset_work+0x1030/0x1520
> [   12.830417]  process_one_work+0x1dc/0x4bc
> [   12.834495]  worker_thread+0x144/0x470
> [   12.838313]  kthread+0x14c/0x160
> [   12.841604]  ret_from_fork+0x10/0x38
> [   12.845255] Code: a94082c4 d37ef463 cb3c4063 8b3c4042 (f9000480)
> [   12.851447] ---[ end trace f68728a0d3053b72 ]---
> [   12.856117] note: kworker/u64:0[7] exited with preempt_count
 
xen_swiotlb_alloc_coherent calls dma_direct_alloc which fails for the
device.

Without swiotlb_xen, dma_alloc_attrs would do:

	if (dma_alloc_direct(dev, ops))
		cpu_addr = dma_direct_alloc(dev, size, dma_handle, flag, attrs);
	else if (ops->alloc)
		cpu_addr = ops->alloc(dev, size, dma_handle, flag, attrs);

dma_alloc_direct is the very same call that fails when called from
xen_swiotlb_alloc_coherent. So it must be that the path meant to be
taken is ops->alloc instead.

ops->alloc is the dma_ops function to allocate a coherent buffer.
When swiotlb-xen is enabled, it points to xen_swiotlb_alloc_coherent.
Often dma_ops is NULL when Xen is disabled.

I think the most likely explanation is that the nvme device require a
specific dma_ops. When swiotlb-xen is enabled, it gets overwritten by
arch/arm64/mm/dma-mapping.c:arch_setup_dma_ops.

Can you double-check this theory by adding a few printks in
arch/arm64/mm/dma-mapping.c:arch_setup_dma_ops, to check the dma_ops
used when !CONFIG_XEN, and also in kernel/dma/mapping.c:dma_alloc_attrs
to check the code path taken when !CONFIG_XEN?

From there we should be able to understand quickly the difference
between the non-swiotlb-xen and the swiotlb-xen cases.

Thanks!
--8323329-1451968002-1649883768=:3066615--

