Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC7147DDAE
	for <lists+xen-devel@lfdr.de>; Thu, 23 Dec 2021 03:24:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250928.432166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0DlT-0003eP-N9; Thu, 23 Dec 2021 02:23:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250928.432166; Thu, 23 Dec 2021 02:23:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0DlT-0003bh-Hj; Thu, 23 Dec 2021 02:23:31 +0000
Received: by outflank-mailman (input) for mailman id 250928;
 Thu, 23 Dec 2021 02:23:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yk4J=RI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n0DlS-0003au-Bq
 for xen-devel@lists.xenproject.org; Thu, 23 Dec 2021 02:23:30 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f4118f5-6397-11ec-9e60-abaf8a552007;
 Thu, 23 Dec 2021 03:23:28 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C96AA61D1B;
 Thu, 23 Dec 2021 02:23:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED9C4C36AE8;
 Thu, 23 Dec 2021 02:23:24 +0000 (UTC)
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
X-Inumbo-ID: 4f4118f5-6397-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640226205;
	bh=9/N5xzR7KFKO8jl3ngfgXQLjnAZhY4zvphVIIrOleSE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=raq3KEyCFxAbqqzVH5h5fyOWRsfDQZHMbPT0reFZsb72qfl/X2xA0SLZrUImFMObP
	 TxqA2TVzHMDjC+wwnbvvWJTPw3Yo2B5+7+kWZqAiy5srBOd2Bgts1n1KWPMW2aNdXM
	 dk2h2QbJa5JDSmHBWuY0GLc0P+WmdOwTaE0TJDRsKRFTihL5BnnCPEcKDX9SBq3gfb
	 7uU1UfV12YsR/cxCepr1ahmvTGj9WPaD9jhccCKeDyNAhNx4eWL8LKWFEw2l5w095N
	 GW/ATygRoX5OpZhWywesga19FE1G1QXolxNY9U5kNrAKDEEOSi3zcJZi12K5VOnNm1
	 MrFQ52aiD9WXw==
Date: Wed, 22 Dec 2021 18:23:24 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [RFC v1 3/5] xen/arm: introduce SCMI-SMC mediator driver
In-Reply-To: <20211222110414.GA2883815@EPUAKYIW015D>
Message-ID: <alpine.DEB.2.22.394.2112221627190.2060010@ubuntu-linux-20-04-desktop>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com> <e9dadd96aa5b64b9232e10a083ce393af620adde.1639472078.git.oleksii_moisieiev@epam.com> <alpine.DEB.2.22.394.2112171709140.2060010@ubuntu-linux-20-04-desktop> <20211220181215.GA1702335@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2112201613210.2060010@ubuntu-linux-20-04-desktop> <20211221200305.GA2460476@EPUAKYIW015D> <alpine.DEB.2.22.394.2112211310000.2060010@ubuntu-linux-20-04-desktop> <20211222110414.GA2883815@EPUAKYIW015D>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 22 Dec 2021, Oleksii Moisieiev wrote:
> On Tue, Dec 21, 2021 at 01:22:50PM -0800, Stefano Stabellini wrote:
> > On Tue, 21 Dec 2021, Oleksii Moisieiev wrote:
> > > Hi Stefano,
> > > 
> > > On Mon, Dec 20, 2021 at 04:52:01PM -0800, Stefano Stabellini wrote:
> > > > On Mon, 20 Dec 2021, Oleksii Moisieiev wrote:
> > > > > Hi Stefano,
> > > > > 
> > > > > On Fri, Dec 17, 2021 at 06:14:55PM -0800, Stefano Stabellini wrote:
> > > > > > On Tue, 14 Dec 2021, Oleksii Moisieiev wrote:
> > > > > > > This is the implementation of SCI interface, called SCMI-SMC driver,
> > > > > > > which works as the mediator between XEN Domains and Firmware (SCP, ATF etc).
> > > > > > > This allows devices from the Domains to work with clocks, resets and
> > > > > > > power-domains without access to CPG.
> > > > > > > 
> > > > > > > The following features are implemented:
> > > > > > > - request SCMI channels from ATF and pass channels to Domains;
> > > > > > > - set device permissions for Domains based on the Domain partial
> > > > > > > device-tree. Devices with permissions are able to work with clocks,
> > > > > > > resets and power-domains via SCMI;
> > > > > > > - redirect scmi messages from Domains to ATF.
> > > > > > > 
> > > > > > > Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> > > > > > > ---
> > > > > > >  xen/arch/arm/Kconfig          |   2 +
> > > > > > >  xen/arch/arm/sci/Kconfig      |  10 +
> > > > > > >  xen/arch/arm/sci/Makefile     |   1 +
> > > > > > >  xen/arch/arm/sci/scmi_smc.c   | 795 ++++++++++++++++++++++++++++++++++
> > > > > > >  xen/include/public/arch-arm.h |   1 +
> > > > > > >  5 files changed, 809 insertions(+)
> > > > > > >  create mode 100644 xen/arch/arm/sci/Kconfig
> > > > > > >  create mode 100644 xen/arch/arm/sci/scmi_smc.c
> > > > > > > 
> > > > > > > diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> > > > > > > index 186e1db389..02d96c6cfc 100644
> > > > > > > --- a/xen/arch/arm/Kconfig
> > > > > > > +++ b/xen/arch/arm/Kconfig
> > > > > > > @@ -114,6 +114,8 @@ config SCI
> > > > > > >  	  support. It allows guests to control system resourcess via one of
> > > > > > >  	  SCI mediators implemented in XEN.
> > > > > > >  
> > > > > > > +source "arch/arm/sci/Kconfig"
> > > > > > > +
> > > > > > >  endmenu
> > > > > > >  
> > > > > > >  menu "ARM errata workaround via the alternative framework"
> > > > > > > diff --git a/xen/arch/arm/sci/Kconfig b/xen/arch/arm/sci/Kconfig
> > > > > > > new file mode 100644
> > > > > > > index 0000000000..9563067ddc
> > > > > > > --- /dev/null
> > > > > > > +++ b/xen/arch/arm/sci/Kconfig
> > > > > > > @@ -0,0 +1,10 @@
> > > > > > > +config SCMI_SMC
> > > > > > > +	bool "Enable SCMI-SMC mediator driver"
> > > > > > > +	default n
> > > > > > > +	depends on SCI
> > > > > > > +	---help---
> > > > > > > +
> > > > > > > +	Enables mediator in XEN to pass SCMI requests from Domains to ATF.
> > > > > > > +	This feature allows drivers from Domains to work with System
> > > > > > > +	Controllers (such as power,resets,clock etc.). SCP is used as transport
> > > > > > > +	for communication.
> > > > > > > diff --git a/xen/arch/arm/sci/Makefile b/xen/arch/arm/sci/Makefile
> > > > > > > index 837dc7492b..67f2611872 100644
> > > > > > > --- a/xen/arch/arm/sci/Makefile
> > > > > > > +++ b/xen/arch/arm/sci/Makefile
> > > > > > > @@ -1 +1,2 @@
> > > > > > >  obj-y += sci.o
> > > > > > > +obj-$(CONFIG_SCMI_SMC) += scmi_smc.o
> > > > > > > diff --git a/xen/arch/arm/sci/scmi_smc.c b/xen/arch/arm/sci/scmi_smc.c
> > > > > > > new file mode 100644
> > > > > > > index 0000000000..2eb01ea82d
> > > > > > > --- /dev/null
> > > > > > > +++ b/xen/arch/arm/sci/scmi_smc.c
> > > > > > > @@ -0,0 +1,795 @@
> > > > > > > +/*
> > > > > > > + * xen/arch/arm/sci/scmi_smc.c
> > > > > > > + *
> > > > > > > + * SCMI mediator driver, using SCP as transport.
> > > > > > > + *
> > > > > > > + * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> > > > > > > + * Copyright (C) 2021, EPAM Systems.
> > > > > > > + *
> > > > > > > + * This program is free software; you can redistribute it and/or modify
> > > > > > > + * it under the terms of the GNU General Public License as published by
> > > > > > > + * the Free Software Foundation; either version 2 of the License, or
> > > > > > > + * (at your option) any later version.
> > > > > > > + *
> > > > > > > + * This program is distributed in the hope that it will be useful,
> > > > > > > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > > > > > > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > > > > > > + * GNU General Public License for more details.
> > > > > > > + */
> > > > > > > +
> > > > > > > +#include <asm/sci/sci.h>
> > > > > > > +#include <asm/smccc.h>
> > > > > > > +#include <asm/io.h>
> > > > > > > +#include <xen/bitops.h>
> > > > > > > +#include <xen/config.h>
> > > > > > > +#include <xen/sched.h>
> > > > > > > +#include <xen/device_tree.h>
> > > > > > > +#include <xen/iocap.h>
> > > > > > > +#include <xen/init.h>
> > > > > > > +#include <xen/err.h>
> > > > > > > +#include <xen/lib.h>
> > > > > > > +#include <xen/list.h>
> > > > > > > +#include <xen/mm.h>
> > > > > > > +#include <xen/string.h>
> > > > > > > +#include <xen/time.h>
> > > > > > > +#include <xen/vmap.h>
> > > > > > > +
> > > > > > > +#define SCMI_BASE_PROTOCOL                  0x10
> > > > > > > +#define SCMI_BASE_PROTOCOL_ATTIBUTES        0x1
> > > > > > > +#define SCMI_BASE_SET_DEVICE_PERMISSIONS    0x9
> > > > > > > +#define SCMI_BASE_RESET_AGENT_CONFIGURATION 0xB
> > > > > > > +#define SCMI_BASE_DISCOVER_AGENT            0x7
> > > > > > > +
> > > > > > > +/* SCMI return codes. See section 4.1.4 of SCMI spec (DEN0056C) */
> > > > > > > +#define SCMI_SUCCESS              0
> > > > > > > +#define SCMI_NOT_SUPPORTED      (-1)
> > > > > > > +#define SCMI_INVALID_PARAMETERS (-2)
> > > > > > > +#define SCMI_DENIED             (-3)
> > > > > > > +#define SCMI_NOT_FOUND          (-4)
> > > > > > > +#define SCMI_OUT_OF_RANGE       (-5)
> > > > > > > +#define SCMI_BUSY               (-6)
> > > > > > > +#define SCMI_COMMS_ERROR        (-7)
> > > > > > > +#define SCMI_GENERIC_ERROR      (-8)
> > > > > > > +#define SCMI_HARDWARE_ERROR     (-9)
> > > > > > > +#define SCMI_PROTOCOL_ERROR     (-10)
> > > > > > > +
> > > > > > > +#define DT_MATCH_SCMI_SMC DT_MATCH_COMPATIBLE("arm,scmi-smc")
> > > > > > > +
> > > > > > > +#define SCMI_SMC_ID                        "arm,smc-id"
> > > > > > > +#define SCMI_SHARED_MEMORY                 "linux,scmi_mem"
> > > > > > 
> > > > > > I could find the following SCMI binding in Linux, which describes
> > > > > > the arm,scmi-smc compatible and the arm,smc-id property:
> > > > > > 
> > > > > > Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> > > > > > 
> > > > > > However, linux,scmi_mem is not described. Aren't you supposed to read
> > > > > > the "shmem" property instead? And the compatible string used for this
> > > > > > seems to be "arm,scmi-shmem".
> > > > > > 
> > > > > 
> > > > > We use linux,scmi_mem node to reserve memory, needed for all
> > > > > channels:
> > > > > 
> > > > > reserved-memory {
> > > > >     /* reserved region for scmi channels*/
> > > > >     scmi_memory: linux,scmi_mem@53FF0000 {
> > > > >         no-map;
> > > > >         reg = <0x0 0x53FF0000 0x0 0x10000>;
> > > > >     };
> > > > > };
> > > > > 
> > > > > arm,scmi-shmem node used in shmem property defines only 1 page needed to
> > > > > the current scmi channel:
> > > > > 
> > > > > cpu_scp_shm: scp-shmem@0x53FF0000 {
> > > > >     compatible = "arm,scmi-shmem";
> > > > >     reg = <0x0 0x53FF0000 0x0 0x1000>;
> > > > > };
> > > > > 
> > > > > For each Domain reg points to unigue page from linux,scmi_mem region,
> > > > > assigned to this agent.
> > > > 
> > > > If we were to use "linux,scmi_mem" we would have to introduce it as a
> > > > compatible string, not as a node name, and it would need to be described
> > > > in Documentation/devicetree/bindings/firmware/arm,scmi.yaml.
> > > > 
> > > > But from your description I don't think it is necessary. We can just use
> > > > "arm,scmi-shmem" to describe all the required regions:
> > > > 
> > > > reserved-memory {
> > > >     scp-shmem@0x53FF0000 {
> > > >         compatible = "arm,scmi-shmem";
> > > >         reg = <0x0 0x53FF0000 0x0 0x1000>;
> > > >     };
> > > >     scp-shmem@0x53FF1000 {
> > > >         compatible = "arm,scmi-shmem";
> > > >         reg = <0x0 0x53FF1000 0x0 0x1000>;
> > > >     };
> > > >     scp-shmem@0x53FF2000 {
> > > >         compatible = "arm,scmi-shmem";
> > > >         reg = <0x0 0x53FF2000 0x0 0x1000>;
> > > >     };
> > > >     ...
> > > > 
> > > > In other words, if all the individual channel pages are described as
> > > > "arm,scmi-shmem", why do we also need a single larger region as
> > > > "linux,scmi_mem"?
> > > > 
> > > 
> > > That was my first implementation. But I've met a problem with
> > > scmi driver in kernel. I don't remember the exact place, but I remember
> > > there were some if, checking if memory weren't reserved.
> > > That's why I ended up splitting nodes reserved memory region and actual
> > > shmem page.
> > > For linux,scmi_mem node I took format from /reserved-memory/linux,lossy_decompress@54000000,
> > > which has no compatible string and provides no-map property.
> > > linux,scmi_shmem node is needed to prevent xen from allocating this
> > > space for the domain.
> > > 
> > > Very interesting question about should I introduce linux,scmi_mem node
> > > and scmi_devid property to the
> > > Documentation/devicetree/bindings/firmware/arm,scmi.yaml?
> > > Those node and property are needed only for Xen and useless for
> > > non-virtualized systems. I can add this node and property description to
> > > arm,scmi.yaml, but leave a note that this is Xen specific params.
> > > What do you think about it?
> > 
> > Reply below
> > 
> > [...]
> >  
> > 
> > > > In general we can't use properties that are not part of the device tree
> > > > spec, either https://urldefense.com/v3/__https://www.devicetree.org/specifications/__;!!GF_29dbcQIUBPA!kNodtgmOQBc1iO76_6vTK-O1SoLxee_ChowYQiQYC595rMOsrnmof2zmk7BnhXCSnJPN$ [devicetree[.]org] or
> > > > https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings__;!!GF_29dbcQIUBPA!kNodtgmOQBc1iO76_6vTK-O1SoLxee_ChowYQiQYC595rMOsrnmof2zmk7BnhXloYUaj$ [git[.]kernel[.]org]
> > > > 
> > > > "linux,scmi_mem" is currently absent. Are you aware of any upstreaming
> > > > activities to get "linux,scmi_mem" upstream under
> > > > Documentation/devicetree/bindings in Linux?
> > > > 
> > > > If "linux,scmi_mem" is going upstream in Linux, then we could use it.
> > > > Otherwise, first "linux,scmi_mem" needs to be added somewhere under
> > > > Documentation/devicetree/bindings (probably
> > > > Documentation/devicetree/bindings/firmware/arm,scmi.yaml), then we can
> > > > work on the Xen code that makes use of it.
> > > > 
> > > > Does it make sense?
> > > > 
> > > 
> > > Yes I agree. I think linux,scmi_mem and scmi_devid should be upstreamed.
> > > I will add those properties to arm,scmi.yaml, mark them as related to XEN and send patch.
> > 
> > I didn't realize that linux,scmi_mem and scmi_devid are supposed to be
> > Xen specific. In general, it would be best not to introduce Xen specific
> > properties into generic bindings. It is a problem both from a
> > specification perspective (because it has hard to handle Xen specific
> > cases in fully generic bindings, especially as those bindings are
> > maintained as part of the Linux kernel) and from a user perspective
> > (because now the user has to deal with a Xen-specific dtb, or has to
> > modify the host dtb to add Xen-specific information by hand.)
> > 
> > 
> > Let me start from scmi_devid.  Why would scmi_devid be Xen-specific? It
> > looks like a generic property that should be needed for the Linux SCMI
> > driver too. Why the Linux driver doesn't need it?
> > 
> 
> scmi_devid used during domain build. It passed as input parameter for SCMI_BASE_SET_DEVICE_PERMISSIONS message.
> On non-virtualized systems - there is no need of this call, because OS
> is the only one entity, running on the system.

OK. Even if it is only required for virtualized systems, I think that
scmi_devid is important enough that should be part of the upstream
binding. I think it is worth starting an email thread on the LKML with
Rob Herring and the SCMI maintainers to discuss the addition of
scmi_devid to the binding.


> I've chatted with Volodymyr_Babchuk and he gave a great idea to add a
> list of device_ids to dom.cfg, such as:
> sci_devs = [ 0, 1, 15, 35 ];
> 
> Using this approach, we can remove scmi_devid from the device tree and
> just pass a list of scmi_devids to XEN using additional hypercall.
> We can probably make hypercall taking devid list as input parameter.
> This will take only 1 hypercall to setup sci permissions.

But how would a user know which are the right SCMI IDs to add to the
sci_devs list? Would the user have to go and read the reference manual
of the platform to find the SCMI IDs and then write sci_devs by hand?
If that is the case, then I think that it would be better to add
scmi_devid to device tree.

In general, I think this configuration should happen automatically
without user intervention. The user should just specify "enable SCMI"
and it should work.


> > In regards to linux,scmi_mem, I think it would be best to do without it
> > and fix the Linux SCMI driver if we need to do so. Xen should be able to
> > parse the native "arm,scmi-shmem" nodes and Linux (dom0 or domU) should
> > be able to parse the "arm,scmi-shmem" nodes generated by Xen. Either
> > way, I don't think we should need linux,scmi_mem.
> 
> This requires further investigation. I will try to make implementation
> without linux,scmi_mem, using only arm,scmi-shmem nodes and share
> reuslts with you.

OK, thanks.

