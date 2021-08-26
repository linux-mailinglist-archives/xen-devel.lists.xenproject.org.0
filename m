Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D280B3F7F38
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 02:09:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172627.315006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJ2xE-0006p0-An; Thu, 26 Aug 2021 00:09:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172627.315006; Thu, 26 Aug 2021 00:09:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJ2xE-0006mE-6v; Thu, 26 Aug 2021 00:09:12 +0000
Received: by outflank-mailman (input) for mailman id 172627;
 Thu, 26 Aug 2021 00:09:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Zrd=NR=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mJ2xC-0006m6-SR
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 00:09:10 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3d096df3-4142-4856-8913-ed14b2d38549;
 Thu, 26 Aug 2021 00:09:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 76968610A6;
 Thu, 26 Aug 2021 00:09:08 +0000 (UTC)
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
X-Inumbo-ID: 3d096df3-4142-4856-8913-ed14b2d38549
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629936548;
	bh=O1C7Jp8N0FMkpzL8q8PAqewkZonGTiCO9ZIluIs4GfQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nO/zc09cOCpjfmU0LrGdpKj3iddGHuu6J1j3uzExtlB6G7yPldLxXyZufMdZEb6R4
	 NvunICmFGixhN8qr0kYH3kuMuwv+ICgcy/AKffWs2SF8BiiTa8az56B1gb/nih0Ojf
	 a7wUaBqq7V0yy4KC7Om6vOn/LaZDZyhtABY5AXGTMTH3cxErUKkLf0YQi6nu0VcUrs
	 ObFiSf9EDhF1CoRMCxeKIpyQVmviw50NBF+8QMWVg/8UEVGjRJppnhMkbMGBBmAg+L
	 o26NJQ6PcdLz0zWeHFagmHq9v4XS5sRH6CrHEOzksxTUUS2xznxvxHKu1e8HX3abwm
	 A2bR548JD895A==
Date: Wed, 25 Aug 2021 17:09:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <wei.chen@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    jbeulich@suse.com, Bertrand.Marquis@arm.com, andrew.cooper3@citrix.com
Subject: Re: [XEN RFC PATCH 00/40] Add device tree based NUMA support to
 Arm64
In-Reply-To: <20210811102423.28908-1-wei.chen@arm.com>
Message-ID: <alpine.DEB.2.21.2108251644150.24433@sstabellini-ThinkPad-T480s>
References: <20210811102423.28908-1-wei.chen@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Thanks for the big contribution!

I just wanted to let you know that the series passed all the gitlab-ci
build tests without issues.

The runtime tests originally failed due to unrelated problems (there was
a Debian testing upgrade that broke Gitlab-CI.) I fix the underlying
issue and restarted the failed tests and now they passed.

This is the pipeline:
https://gitlab.com/xen-project/patchew/xen/-/pipelines/351484940

There are still two runtime x86 tests that fail but I don't think the
failures are related to your series.


On Wed, 11 Aug 2021, Wei Chen wrote:
> Xen memory allocation and scheduler modules are NUMA aware.
> But actually, on x86 has implemented the architecture APIs
> to support NUMA. Arm was providing a set of fake architecture
> APIs to make it compatible with NUMA awared memory allocation
> and scheduler.
> 
> Arm system was working well as a single node NUMA system with
> these fake APIs, because we didn't have multiple nodes NUMA
> system on Arm. But in recent years, more and more Arm devices
> support multiple nodes NUMA system. Like TX2, some Hisilicon
> chips and the Ampere Altra.
> 
> So now we have a new problem. When Xen is running on these Arm
> devices, Xen still treat them as single node SMP systems. The
> NUMA affinity capability of Xen memory allocation and scheduler
> becomes meaningless. Because they rely on input data that does
> not reflect real NUMA layout.
> 
> Xen still think the access time for all of the memory is the
> same for all CPUs. However, Xen may allocate memory to a VM
> from different NUMA nodes with different access speeds. This
> difference can be amplified in workloads inside VM, causing
> performance instability and timeouts. 
> 
> So in this patch series, we implement a set of NUMA API to use
> device tree to describe the NUMA layout. We reuse most of the
> code of x86 NUMA to create and maintain the mapping between
> memory and CPU, create the matrix between any two NUMA nodes.
> Except ACPI and some x86 specified code, we have moved other
> code to common. In next stage, when we implement ACPI based
> NUMA for Arm64, we may move the ACPI NUMA code to common too,
> but in current stage, we keep it as x86 only.
> 
> This patch serires has been tested and booted well on one
> Arm64 NUMA machine and one HPE x86 NUMA machine.
> 
> Hongda Deng (2):
>   xen/arm: return default DMA bit width when platform is not set
>   xen/arm: Fix lowmem_bitsize when arch_get_dma_bitsize return 0
> 
> Wei Chen (38):
>   tools: Fix -Werror=maybe-uninitialized for xlu_pci_parse_bdf
>   xen/arm: Print a 64-bit number in hex from early uart
>   xen/x86: Initialize memnodemapsize while faking NUMA node
>   xen: decouple NUMA from ACPI in Kconfig
>   xen/arm: use !CONFIG_NUMA to keep fake NUMA API
>   xen/x86: Move NUMA memory node map functions to common
>   xen/x86: Move numa_add_cpu_node to common
>   xen/x86: Move NR_NODE_MEMBLKS macro to common
>   xen/x86: Move NUMA nodes and memory block ranges to common
>   xen/x86: Move numa_initmem_init to common
>   xen/arm: introduce numa_set_node for Arm
>   xen/arm: set NUMA nodes max number to 64 by default
>   xen/x86: move NUMA API from x86 header to common header
>   xen/arm: Create a fake NUMA node to use common code
>   xen/arm: Introduce DEVICE_TREE_NUMA Kconfig for arm64
>   xen/arm: Keep memory nodes in dtb for NUMA when boot from EFI
>   xen: fdt: Introduce a helper to check fdt node type
>   xen/arm: implement node distance helpers for Arm64
>   xen/arm: introduce device_tree_numa as a switch for device tree NUMA
>   xen/arm: introduce a helper to parse device tree processor node
>   xen/arm: introduce a helper to parse device tree memory node
>   xen/arm: introduce a helper to parse device tree NUMA distance map
>   xen/arm: unified entry to parse all NUMA data from device tree
>   xen/arm: Add boot and secondary CPU to NUMA system
>   xen/arm: build CPU NUMA node map while creating cpu_logical_map
>   xen/x86: decouple nodes_cover_memory with E820 map
>   xen/arm: implement Arm arch helpers Arm to get memory map info
>   xen: move NUMA memory and CPU parsed nodemasks to common
>   xen/x86: move nodes_cover_memory to common
>   xen/x86: make acpi_scan_nodes to be neutral
>   xen: export bad_srat and srat_disabled to extern
>   xen: move numa_scan_nodes from x86 to common
>   xen: enable numa_scan_nodes for device tree based NUMA
>   xen/arm: keep guest still be NUMA unware
>   xen: introduce an arch helper to do NUMA init failed fallback
>   xen/arm: enable device tree based NUMA in system init
>   xen/x86: move numa_setup to common to support NUMA switch in command
>     line
>   xen/x86: move dump_numa info hotkey to common
> 
>  tools/libs/util/libxlu_pci.c    |   3 +-
>  xen/arch/arm/Kconfig            |  10 +
>  xen/arch/arm/Makefile           |   2 +
>  xen/arch/arm/arm64/head.S       |   9 +-
>  xen/arch/arm/bootfdt.c          |   8 +-
>  xen/arch/arm/domain_build.c     |  17 +-
>  xen/arch/arm/efi/efi-boot.h     |  25 --
>  xen/arch/arm/numa.c             | 162 +++++++++
>  xen/arch/arm/numa_device_tree.c | 292 ++++++++++++++++
>  xen/arch/arm/platform.c         |   4 +-
>  xen/arch/arm/setup.c            |  14 +
>  xen/arch/arm/smpboot.c          |  37 +-
>  xen/arch/x86/Kconfig            |   2 +-
>  xen/arch/x86/numa.c             | 421 +----------------------
>  xen/arch/x86/srat.c             | 147 +-------
>  xen/common/Kconfig              |   3 +
>  xen/common/Makefile             |   1 +
>  xen/common/libfdt/fdt_ro.c      |  15 +
>  xen/common/numa.c               | 588 ++++++++++++++++++++++++++++++++
>  xen/common/page_alloc.c         |   2 +-
>  xen/drivers/acpi/Kconfig        |   3 +-
>  xen/drivers/acpi/Makefile       |   2 +-
>  xen/include/asm-arm/numa.h      |  33 ++
>  xen/include/asm-arm/setup.h     |   6 +
>  xen/include/asm-x86/acpi.h      |   4 -
>  xen/include/asm-x86/config.h    |   1 -
>  xen/include/asm-x86/numa.h      |  65 +---
>  xen/include/asm-x86/setup.h     |   1 -
>  xen/include/xen/libfdt/libfdt.h |  25 ++
>  xen/include/xen/nodemask.h      |   2 +
>  xen/include/xen/numa.h          |  80 +++++
>  31 files changed, 1325 insertions(+), 659 deletions(-)
>  create mode 100644 xen/arch/arm/numa.c
>  create mode 100644 xen/arch/arm/numa_device_tree.c
>  create mode 100644 xen/common/numa.c
> 
> -- 
> 2.25.1
> 

