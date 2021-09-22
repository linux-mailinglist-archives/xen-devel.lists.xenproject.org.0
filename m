Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E001F41538A
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 00:38:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193146.344027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTAs3-0001vU-DA; Wed, 22 Sep 2021 22:37:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193146.344027; Wed, 22 Sep 2021 22:37:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTAs3-0001sS-81; Wed, 22 Sep 2021 22:37:43 +0000
Received: by outflank-mailman (input) for mailman id 193146;
 Wed, 22 Sep 2021 22:37:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ilSY=OM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTAs1-0001ob-BM
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 22:37:41 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab1f4438-d4a5-465b-a633-97a8f5ebf8dc;
 Wed, 22 Sep 2021 22:37:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A5BCF610A0;
 Wed, 22 Sep 2021 22:37:38 +0000 (UTC)
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
X-Inumbo-ID: ab1f4438-d4a5-465b-a633-97a8f5ebf8dc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632350259;
	bh=FnWej46FfN+To0zH+p7BjZJHLdlEhHTBY/bbrmGdwq4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=htbQH+9K8KHMJrN7+OChjn4EJvTXLKOAMUMKO7Y/c6vI1GHfSsYMmhqJ+hGEg50P4
	 elfbppmo4bVobG0RP/9QtWLMULD3FOGRxmzvFyHZdEqkCfGOMMY0ORHyT5ri5dRary
	 H9rSpuHfAqkZkYHvlJw8YAhLS03+JBairAn2i1CMV+Ie5DeV3+AohGtaC481I2fBaH
	 qMETT0ZgEkfgQpFiH9MzcVoq/Z3e4BbB0010cgsntRxmOZ4w1WId5bI46BOuavzi4O
	 Yojfczon9zKlQHlz5KsQEmVN6vEcq/tcVPeeSGlbzmSmLV7VVIlWvJPBNlSNs1KqSJ
	 /xRR96JHglrmg==
Date: Wed, 22 Sep 2021 15:37:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    andre.przywara@arm.com, Stefano Stabellini <sstabellini@kernel.org>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 05/17] xen/arm: Add PHYSDEVOP_pci_device_* support
 for ARM
In-Reply-To: <a1c447ced213f07797eebc9471c48df56a187033.1632307952.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2109221527510.17979@sstabellini-ThinkPad-T480s>
References: <cover.1632307952.git.rahul.singh@arm.com> <a1c447ced213f07797eebc9471c48df56a187033.1632307952.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 22 Sep 2021, Rahul Singh wrote:
> Hardware domain is in charge of doing the PCI enumeration and will
> discover the PCI devices and then will communicate to XEN via hyper
> call PHYSDEVOP_pci_device_add(..) to add the PCI devices in XEN.
> 
> Also implement PHYSDEVOP_pci_device_remove(..) to remove the PCI device.
> 
> As most of the code for PHYSDEVOP_pci_device_* is the same between x86
> and ARM, move the code to a common file to avoid duplication.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
> Change in v2:
> - Add support for PHYSDEVOP_pci_device_remove()
> - Move code to common code
> ---
>  xen/arch/arm/physdev.c          |  5 +-
>  xen/arch/x86/physdev.c          | 50 +-------------------
>  xen/arch/x86/x86_64/physdev.c   |  4 +-
>  xen/common/Makefile             |  1 +
>  xen/common/physdev.c            | 81 +++++++++++++++++++++++++++++++++
>  xen/include/asm-arm/hypercall.h |  2 -
>  xen/include/asm-arm/numa.h      |  5 ++
>  xen/include/asm-x86/hypercall.h |  9 ++--
>  xen/include/xen/hypercall.h     |  8 ++++
>  9 files changed, 106 insertions(+), 59 deletions(-)
>  create mode 100644 xen/common/physdev.c
> 
> diff --git a/xen/arch/arm/physdev.c b/xen/arch/arm/physdev.c
> index e91355fe22..4e00b03aab 100644
> --- a/xen/arch/arm/physdev.c
> +++ b/xen/arch/arm/physdev.c
> @@ -8,10 +8,9 @@
>  #include <xen/lib.h>
>  #include <xen/errno.h>
>  #include <xen/sched.h>
> -#include <asm/hypercall.h>
> +#include <xen/hypercall.h>
>  
> -
> -int do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
> +long arch_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>  {
>      gdprintk(XENLOG_DEBUG, "PHYSDEVOP cmd=%d: not implemented\n", cmd);
>      return -ENOSYS;
> diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
> index 23465bcd00..c00cc99404 100644
> --- a/xen/arch/x86/physdev.c
> +++ b/xen/arch/x86/physdev.c
> @@ -174,7 +174,7 @@ int physdev_unmap_pirq(domid_t domid, int pirq)
>  }
>  #endif /* COMPAT */
>  
> -ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
> +ret_t arch_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>  {
>      int irq;
>      ret_t ret;
> @@ -480,54 +480,6 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          break;
>      }
>  
> -    case PHYSDEVOP_pci_device_add: {
> -        struct physdev_pci_device_add add;
> -        struct pci_dev_info pdev_info;
> -        nodeid_t node;
> -
> -        ret = -EFAULT;
> -        if ( copy_from_guest(&add, arg, 1) != 0 )
> -            break;
> -
> -        pdev_info.is_extfn = !!(add.flags & XEN_PCI_DEV_EXTFN);
> -        if ( add.flags & XEN_PCI_DEV_VIRTFN )
> -        {
> -            pdev_info.is_virtfn = 1;
> -            pdev_info.physfn.bus = add.physfn.bus;
> -            pdev_info.physfn.devfn = add.physfn.devfn;
> -        }
> -        else
> -            pdev_info.is_virtfn = 0;
> -
> -        if ( add.flags & XEN_PCI_DEV_PXM )
> -        {
> -            uint32_t pxm;
> -            size_t optarr_off = offsetof(struct physdev_pci_device_add, optarr) /
> -                                sizeof(add.optarr[0]);
> -
> -            if ( copy_from_guest_offset(&pxm, arg, optarr_off, 1) )
> -                break;
> -
> -            node = pxm_to_node(pxm);
> -        }
> -        else
> -            node = NUMA_NO_NODE;
> -
> -        ret = pci_add_device(add.seg, add.bus, add.devfn, &pdev_info, node);
> -        break;
> -    }
> -
> -    case PHYSDEVOP_pci_device_remove: {
> -        struct physdev_pci_device dev;
> -
> -        ret = -EFAULT;
> -        if ( copy_from_guest(&dev, arg, 1) != 0 )
> -            break;
> -
> -        ret = pci_remove_device(dev.seg, dev.bus, dev.devfn);
> -        break;
> -    }
> -
>      case PHYSDEVOP_prepare_msix:
>      case PHYSDEVOP_release_msix: {
>          struct physdev_pci_device dev;
> diff --git a/xen/arch/x86/x86_64/physdev.c b/xen/arch/x86/x86_64/physdev.c
> index 0a50cbd4d8..5f72652ff7 100644
> --- a/xen/arch/x86/x86_64/physdev.c
> +++ b/xen/arch/x86/x86_64/physdev.c
> @@ -9,9 +9,10 @@ EMIT_FILE;
>  #include <compat/xen.h>
>  #include <compat/event_channel.h>
>  #include <compat/physdev.h>
> -#include <asm/hypercall.h>
> +#include <xen/hypercall.h>
>  
>  #define do_physdev_op compat_physdev_op
> +#define arch_physdev_op arch_compat_physdev_op
>  
>  #define physdev_apic               compat_physdev_apic
>  #define physdev_apic_t             physdev_apic_compat_t
> @@ -82,6 +83,7 @@ CHECK_physdev_pci_device
>  typedef int ret_t;
>  
>  #include "../physdev.c"
> +#include "../../../common/physdev.c"
>  
>  /*
>   * Local variables:
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index 54de70d422..bcb1c8fb03 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -29,6 +29,7 @@ obj-y += notifier.o
>  obj-y += page_alloc.o
>  obj-$(CONFIG_HAS_PDX) += pdx.o
>  obj-$(CONFIG_PERF_COUNTERS) += perfc.o
> +obj-y += physdev.o
>  obj-y += preempt.o
>  obj-y += random.o
>  obj-y += rangeset.o
> diff --git a/xen/common/physdev.c b/xen/common/physdev.c
> new file mode 100644
> index 0000000000..8d44b20db8
> --- /dev/null
> +++ b/xen/common/physdev.c
> @@ -0,0 +1,81 @@
> +
> +#include <xen/guest_access.h>
> +#include <xen/hypercall.h>
> +#include <xen/init.h>
> +
> +#ifndef COMPAT
> +typedef long ret_t;
> +#endif
> +
> +ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
> +{
> +    ret_t ret;
> +
> +    switch ( cmd )
> +    {
> +#ifdef CONFIG_HAS_PCI
> +    case PHYSDEVOP_pci_device_add: {
> +        struct physdev_pci_device_add add;
> +        struct pci_dev_info pdev_info;
> +        nodeid_t node;
> +
> +        ret = -EFAULT;
> +        if ( copy_from_guest(&add, arg, 1) != 0 )
> +            break;
> +
> +        pdev_info.is_extfn = !!(add.flags & XEN_PCI_DEV_EXTFN);
> +        if ( add.flags & XEN_PCI_DEV_VIRTFN )
> +        {
> +            pdev_info.is_virtfn = 1;
> +            pdev_info.physfn.bus = add.physfn.bus;
> +            pdev_info.physfn.devfn = add.physfn.devfn;
> +        }
> +        else
> +            pdev_info.is_virtfn = 0;
> +
> +        if ( add.flags & XEN_PCI_DEV_PXM )
> +        {
> +            uint32_t pxm;
> +            size_t optarr_off = offsetof(struct physdev_pci_device_add, optarr) /
> +                                sizeof(add.optarr[0]);
> +
> +            if ( copy_from_guest_offset(&pxm, arg, optarr_off, 1) )
> +                break;
> +
> +            node = pxm_to_node(pxm);
> +        }
> +        else
> +            node = NUMA_NO_NODE;
> +
> +        ret = pci_add_device(add.seg, add.bus, add.devfn, &pdev_info, node);
> +        break;
> +    }
> +
> +    case PHYSDEVOP_pci_device_remove: {
> +        struct physdev_pci_device dev;
> +
> +        ret = -EFAULT;
> +        if ( copy_from_guest(&dev, arg, 1) != 0 )
> +            break;
> +
> +        ret = pci_remove_device(dev.seg, dev.bus, dev.devfn);
> +        break;
> +    }
> +#endif
> +    default:
> +        ret = arch_physdev_op(cmd, arg);;
                                           ^ a typo?

The ARM and common parts are fine. I am not well-versed in the x86
compat stuff; we need one of the x86 maintainers to review the x86
changes.

