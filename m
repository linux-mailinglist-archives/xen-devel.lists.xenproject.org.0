Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FBB41E5D2
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 03:32:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200366.354875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mW7Oi-0000JE-Gg; Fri, 01 Oct 2021 01:31:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200366.354875; Fri, 01 Oct 2021 01:31:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mW7Oi-0000GT-Dl; Fri, 01 Oct 2021 01:31:36 +0000
Received: by outflank-mailman (input) for mailman id 200366;
 Fri, 01 Oct 2021 01:31:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cSXX=OV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mW7Oh-0000GM-0v
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 01:31:35 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9415e72b-44ea-4c8d-9a8c-0118239f446a;
 Fri, 01 Oct 2021 01:31:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B02260F5B;
 Fri,  1 Oct 2021 01:31:32 +0000 (UTC)
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
X-Inumbo-ID: 9415e72b-44ea-4c8d-9a8c-0118239f446a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633051893;
	bh=sZxlshwitUX9/kpFFURc5YnmHjnh9zBGb4HL5Udalg8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cLVFWqacMMGgn+NFmrRr7BTtM6rfOOz3nsOoEkZwKqKwRTdZll5LyGo8W4KgxX1rX
	 2UEww/MaAkHJAZ30SjGXPlDCh+0D5aH2YGBBzWkNCwodUG2J1zjVtf4vhuRYiKZuc/
	 0WcD5HSAOZUbzABQmOY7w5LQfpzcTWsaZ9J987fiCaJWk7QcK+ldtDTQKeq/33JE7r
	 dEUVwQKmMOYX7yZ7wP2eOHjl1bSYrAdxA3fxXTNsc+2WpA9farOYJxpB/N/nI1Z+j9
	 Wsh1F65ciSLGpNG5PTGG0SG+6SIXTFkLqerU7OSoeTbM0eUF0/pfnWVMrcE+olGbsF
	 F+0yf0MK7jIEQ==
Date: Thu, 30 Sep 2021 18:31:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Andre.Przywara@arm.com, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, 
    Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, 
    Daniel De Graaf <dgdegra@tycho.nsa.gov>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Juergen Gross <jgross@suse.com>, 
    Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v3 00/17] PCI devices passthrough on Arm
In-Reply-To: <cover.1632847120.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2109301829580.3209@sstabellini-ThinkPad-T480s>
References: <cover.1632847120.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

To make the series a bit easier to manage, given that they were fully
acked, I committed patches #1, #2, #6, #7, #8 from the series.


On Tue, 28 Sep 2021, Rahul Singh wrote:
> Hello All,
> 
> The purpose of this patch series is to add PCI passthrough support to Xen on
> Arm. PCI passthrough support on ARM is the collaboration work between EPAM and
> ARM. ARM submitted the partial RFC [1][2] last year to get early feedback. We
> tried to fix all the comments and added more features to this patch series.
> 
> Working POC with all the features can be found at [3]. Working POC is tested
> on x86 so that there will be no regression on x86. Design presentation can be
> found at [4]
> 
> PCI passthrough support is divided into different patches. This patch series
> includes following features: 
> 
> Preparatory work to implement the PCI passthrough support for the ARM:
> - Refactor MSI code.
> - Fixed compilation error when HAS_PCI enabled for ARM.
> 
> Discovering PCI Host Bridge in XEN:
> - PCI init to initialize the PCI driver.
> - PCI host bridge discovery in XEN and map the PCI ECAM configuration space to
>   the XEN memory.
> - PCI access functions.
> 
> Discovering PCI devices:
> - To support the PCI passthrough, XEN should be aware of the PCI
>   devices.
> - Hardware domain is in charge of doing the PCI enumeration and will discover
>   the PCI devices and then communicate to the XEN via a hypercall to add the
>   PCI devices in XEN.
> 
> Enable the existing x86 virtual PCI support for ARM:
> - Add VPCI trap handler for each of the PCI device added for config space
>   access.
> - Register the trap handler in XEN for each of the host bridge PCI ECAM config
>   space access.
> 
> Emulated PCI device tree node in libxl:
> - Create a virtual PCI device tree node in libxl to enable the guest OS to
>   discover the virtual PCI during guest boot.
> 
> This patch series does not inlcude the following features. Following features
> will be send for review in the next version of the patch series once initial
> patch series merged.
> 
> - VPCI support for DOMU guests (Non-identity mappings guest view of the BARs)
> - Virtual bus topology implementation
> - IOMMU related changes (generic, SMMUv2, SMMUv3)
> - MSI support for DOMU guests.
> - Virual ITS support for DOMU guests
> 
> [1] https://lists.xenproject.org/archives/html/xen-devel/2020-07/msg01184.html
> [2] https://lists.xenproject.org/archives/html/xen-devel/2020-07/threads.html#01184
> [3] https://gitlab.com/rahsingh/xen-integration/-/commits/pci-passthrough-upstream-all
> [4] https://static.sched.com/hosted_files/xen2021/e4/PCI_Device_Passthrough_On_Arm.pdf
> 
> Oleksandr Andrushchenko (1):
>   xen/arm: Add support for Xilinx ZynqMP PCI host controller
> 
> Rahul Singh (16):
>   xen/pci: Refactor MSI code that implements MSI functionality within
>     XEN
>   xen/arm: pci: Add stubs to allow selecting HAS_PCI
>   xen/arm: solve compilation error on ARM with ACPI && HAS_PCI
>   xen/arm: xc_domain_ioport_permission(..) not supported on ARM.
>   xen/arm: Add PHYSDEVOP_pci_device_* support for ARM
>   xen/device-tree: Add dt_property_read_variable_u32_array helper
>   xen/device-tree: Add dt_property_read_u32_array helper
>   xen/device-tree: Add dt_get_pci_domain_nr helper
>   xen/arm: Add support for PCI init to initialize the PCI driver.
>   xen/arm: Add cmdline boot option "pci-passthrough = <boolean>"
>   xen/arm: PCI host bridge discovery within XEN on ARM
>   xen/arm: Implement pci access functions
>   xen/arm: Enable the existing x86 virtual PCI support for ARM.
>   xen/arm: Transitional change to build HAS_VPCI on ARM.
>   arm/libxl: Emulated PCI device tree node in libxl
>   xen/arm: Add linux,pci-domain property for hwdom if not available.
> 
>  docs/misc/xen-command-line.pandoc   |   7 +
>  tools/include/libxl.h               |   6 +
>  tools/libs/ctrl/xc_domain.c         |   9 +
>  tools/libs/light/libxl_arm.c        | 105 ++++++++++
>  tools/libs/light/libxl_create.c     |   3 +
>  tools/libs/light/libxl_types.idl    |   1 +
>  tools/xl/xl_parse.c                 |   2 +
>  xen/arch/arm/Makefile               |   2 +
>  xen/arch/arm/domain.c               |   8 +-
>  xen/arch/arm/domain_build.c         |  19 ++
>  xen/arch/arm/pci/Makefile           |   6 +
>  xen/arch/arm/pci/ecam.c             |  61 ++++++
>  xen/arch/arm/pci/pci-access.c       | 140 ++++++++++++++
>  xen/arch/arm/pci/pci-host-common.c  | 287 ++++++++++++++++++++++++++++
>  xen/arch/arm/pci/pci-host-generic.c |  46 +++++
>  xen/arch/arm/pci/pci-host-zynqmp.c  |  63 ++++++
>  xen/arch/arm/pci/pci.c              |  98 ++++++++++
>  xen/arch/arm/physdev.c              |   5 +-
>  xen/arch/arm/vpci.c                 | 102 ++++++++++
>  xen/arch/arm/vpci.h                 |  36 ++++
>  xen/arch/x86/Kconfig                |   1 +
>  xen/arch/x86/domain.c               |   6 +
>  xen/arch/x86/physdev.c              |  50 +----
>  xen/arch/x86/x86_64/physdev.c       |   4 +-
>  xen/common/Makefile                 |   1 +
>  xen/common/device_tree.c            |  73 +++++++
>  xen/common/domain.c                 |   2 +-
>  xen/common/physdev.c                |  87 +++++++++
>  xen/drivers/passthrough/Makefile    |   1 +
>  xen/drivers/passthrough/arm/iommu.c |   9 +
>  xen/drivers/passthrough/msi.c       |  83 ++++++++
>  xen/drivers/passthrough/pci.c       |  69 +++----
>  xen/drivers/pci/Kconfig             |   4 +
>  xen/drivers/vpci/Makefile           |   3 +-
>  xen/drivers/vpci/header.c           |   2 +
>  xen/include/asm-arm/device.h        |   1 +
>  xen/include/asm-arm/domain.h        |   8 +-
>  xen/include/asm-arm/hypercall.h     |   2 -
>  xen/include/asm-arm/numa.h          |   5 +
>  xen/include/asm-arm/pci.h           | 116 ++++++++++-
>  xen/include/asm-x86/hypercall.h     |   9 +-
>  xen/include/asm-x86/pci.h           |  10 +-
>  xen/include/public/arch-arm.h       |  17 ++
>  xen/include/public/domctl.h         |   4 +-
>  xen/include/xen/device_tree.h       |  73 +++++++
>  xen/include/xen/hypercall.h         |   8 +
>  xen/include/xen/msi.h               |  43 +++++
>  xen/include/xen/pci.h               |   5 +-
>  xen/xsm/flask/hooks.c               |   8 +-
>  49 files changed, 1593 insertions(+), 117 deletions(-)
>  create mode 100644 xen/arch/arm/pci/Makefile
>  create mode 100644 xen/arch/arm/pci/ecam.c
>  create mode 100644 xen/arch/arm/pci/pci-access.c
>  create mode 100644 xen/arch/arm/pci/pci-host-common.c
>  create mode 100644 xen/arch/arm/pci/pci-host-generic.c
>  create mode 100644 xen/arch/arm/pci/pci-host-zynqmp.c
>  create mode 100644 xen/arch/arm/pci/pci.c
>  create mode 100644 xen/arch/arm/vpci.c
>  create mode 100644 xen/arch/arm/vpci.h
>  create mode 100644 xen/common/physdev.c
>  create mode 100644 xen/drivers/passthrough/msi.c
>  create mode 100644 xen/include/xen/msi.h
> 
> -- 
> 2.17.1
> 

