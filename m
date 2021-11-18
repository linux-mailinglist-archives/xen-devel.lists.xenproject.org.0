Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA3D455304
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 04:01:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227077.392639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnXg5-0004VO-KK; Thu, 18 Nov 2021 03:01:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227077.392639; Thu, 18 Nov 2021 03:01:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnXg5-0004Tc-Gw; Thu, 18 Nov 2021 03:01:33 +0000
Received: by outflank-mailman (input) for mailman id 227077;
 Thu, 18 Nov 2021 03:01:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vl7d=QF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mnXg4-0004S1-4b
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 03:01:32 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3fddd1d-481b-11ec-9787-a32c541c8605;
 Thu, 18 Nov 2021 04:01:30 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 044E16187F;
 Thu, 18 Nov 2021 03:01:28 +0000 (UTC)
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
X-Inumbo-ID: d3fddd1d-481b-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637204489;
	bh=9aorx6iNIVy8X/FfNQZ1UkrkeVrcRlB1qXJsSrWUY0U=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=J68LGInGIIyzX5F+KsVcsxL3pMoArgqhXeNxmgsqe/mVmimq7gMdgXEI9xUM1yvos
	 mnRC0uUkqf3eJ3UNBofcOv/i0Yjd6p7T/5mDLIu5bmq03WiT/NFQsvetrB4YrZZG5z
	 hLLHxPr1nEYzXV5H3RqxOcNJj01xwVsqxAyD5ZfmD+d3FHXvMGe2FclfMdApYTJtSn
	 F8xEyteOq51KY0i0MSH6SnRYQi7hy3g/rmZOAodeUMXpuWdEOkWWglK0YtNIKHopMZ
	 s9tySAvy4yFXxlNIOkWZkx0M7PEPb6KgoGn6CFirsywi2og6Q78HNO95+ftwMfqQU9
	 K2VyJ7PYFFUGA==
Date: Wed, 17 Nov 2021 19:01:27 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Juergen Gross <jgross@suse.com>
cc: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org, 
    bertrand.marquis@arm.com, wei.chen@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, 
    Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [RFC PATCH 1/2] xen/cpupool: Create different cpupools at boot
 time
In-Reply-To: <eef43ca6-dce1-9d24-7ee6-7ced8a709f00@suse.com>
Message-ID: <alpine.DEB.2.22.394.2111171859580.1412361@ubuntu-linux-20-04-desktop>
References: <20211117095711.26596-1-luca.fancellu@arm.com> <20211117095711.26596-2-luca.fancellu@arm.com> <eef43ca6-dce1-9d24-7ee6-7ced8a709f00@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 17 Nov 2021, Juergen Gross wrote:
> On 17.11.21 10:57, Luca Fancellu wrote:
> > Introduce an architecture specific way to create different
> > cpupool at boot time, this is particularly useful on ARM
> > biglittle system where there might be the need to have
> > different cpupools for each type of core, but also systems
> > using NUMA can have different cpu pool for each node.
> > 
> > Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> > ---
> >   xen/arch/arm/Kconfig       | 15 +++++++
> >   xen/arch/arm/Makefile      |  1 +
> >   xen/arch/arm/cpupool.c     | 84 ++++++++++++++++++++++++++++++++++++++
> >   xen/common/sched/cpupool.c |  5 ++-
> >   xen/include/xen/cpupool.h  | 30 ++++++++++++++
> >   5 files changed, 134 insertions(+), 1 deletion(-)
> >   create mode 100644 xen/arch/arm/cpupool.c
> >   create mode 100644 xen/include/xen/cpupool.h
> > 
> > diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> > index ecfa6822e4..4d7cc9f3bc 100644
> > --- a/xen/arch/arm/Kconfig
> > +++ b/xen/arch/arm/Kconfig
> > @@ -33,6 +33,21 @@ config ACPI
> >   	  Advanced Configuration and Power Interface (ACPI) support for Xen is
> >   	  an alternative to device tree on ARM64.
> >   +config BOOT_TIME_CPUPOOLS
> > +	bool "Create cpupools per cpu type at boot time."
> > +	depends on ARM
> > +	default n
> > +	help
> > +
> > +	  Creates, during boot, a cpu pool for each type of CPU found on
> > +	  the system. This option is useful on system with heterogeneous
> > +	  types of core.
> > +
> > +config MAX_BOOT_TIME_CPUPOOLS
> > +	depends on BOOT_TIME_CPUPOOLS
> > +	int "Maximum number of cpupools that can be created at boot time."
> > +	default 16
> > +
> >   config GICV3
> >   	bool "GICv3 driver"
> >   	depends on ARM_64 && !NEW_VGIC
> > diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> > index 07f634508e..0bb8b84750 100644
> > --- a/xen/arch/arm/Makefile
> > +++ b/xen/arch/arm/Makefile
> > @@ -13,6 +13,7 @@ obj-$(CONFIG_HAS_ALTERNATIVE) += alternative.o
> >   obj-y += bootfdt.init.o
> >   obj-y += cpuerrata.o
> >   obj-y += cpufeature.o
> > +obj-$(CONFIG_BOOT_TIME_CPUPOOLS) += cpupool.o
> >   obj-y += decode.o
> >   obj-y += device.o
> >   obj-$(CONFIG_IOREQ_SERVER) += dm.o
> > diff --git a/xen/arch/arm/cpupool.c b/xen/arch/arm/cpupool.c
> > new file mode 100644
> > index 0000000000..550521e352
> > --- /dev/null
> > +++ b/xen/arch/arm/cpupool.c
> > @@ -0,0 +1,84 @@
> > +/******************************************************************************
> > + * cpupool.c
> > + *
> > + * (C) 2021, arm
> > + */
> > +
> > +#include <xen/cpumask.h>
> > +#include <xen/cpupool.h>
> > +#include <xen/err.h>
> > +#include <xen/sched.h>
> > +#include <asm/cpufeature.h>
> > +#include <asm/processor.h>
> > +#include "../../common/sched/private.h"
> 
> No, please don't do that.
> 
> You should try to add architecture agnostic service functions in
> common/sched/cpupool.c removing the need to include that file here.
> 
> > +
> > +typedef struct {
> > +    register_t     midr;
> > +    struct cpupool *pool;
> > +} pool_t;
> > +
> > +static pool_t __initdata pool_cpu_map[CONFIG_MAX_BOOT_TIME_CPUPOOLS];
> > +
> > +void __init arch_allocate_cpupools(const cpumask_t *cpu_online_map,
> > +                                   cpupool_create_t cpupool_create)
> 
> Drop the cpupool_create parameter here and ...
> 
> > +{
> > +    unsigned int cpu, i;
> > +
> > +    /* First pool is the default pool0 associated with midr of the boot
> > core */
> > +    pool_cpu_map[0].midr = system_cpuinfo.midr.bits;
> > +    pool_cpu_map[0].pool = cpupool0;
> > +
> > +    for_each_cpu ( cpu, cpu_online_map )
> > +    {
> > +        for ( i = 0; i < CONFIG_MAX_BOOT_TIME_CPUPOOLS; i++ )
> > +            if ( !pool_cpu_map[i].pool ||
> > +                 (cpu_data[cpu].midr.bits == pool_cpu_map[i].midr) )
> > +                break;
> > +
> > +        if ( i < CONFIG_MAX_BOOT_TIME_CPUPOOLS )
> > +        {
> > +            if ( !pool_cpu_map[i].pool )
> > +            {
> > +                /* There is no pool for this cpu midr, create it */
> > +                pool_cpu_map[i].midr = cpu_data[cpu].midr.bits;
> > +                debugtrace_printk("Create pool %u for cpu MIDR: 0x%"
> > +                                  PRIregister"\n", i,
> > pool_cpu_map[i].midr);
> > +                pool_cpu_map[i].pool =
> > +                    cpupool_create(i, scheduler_get_default()->sched_id);
> > +                BUG_ON(IS_ERR(pool_cpu_map[i].pool));
> > +                cpupool_put(pool_cpu_map[i].pool);
> 
> ... call a new wrapper in common/sched/cpupool.c taking just the id as
> parameter (e.g. "cpupool *cpupool_create_default(unsigned int id)")
> which will use the default scheduler and do the cpupool_create() and
> cpupool_put() calls internally.

What if sched=something is also passed on the command line? Shouldn't
that be used for all cpupools? Or maybe sched=something works because it
changes the "default scheduler"?

