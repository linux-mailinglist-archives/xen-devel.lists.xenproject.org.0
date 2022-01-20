Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA1749458E
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jan 2022 02:29:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258929.446450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAMFb-0003ua-5J; Thu, 20 Jan 2022 01:28:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258929.446450; Thu, 20 Jan 2022 01:28:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAMFb-0003st-1S; Thu, 20 Jan 2022 01:28:31 +0000
Received: by outflank-mailman (input) for mailman id 258929;
 Thu, 20 Jan 2022 01:28:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4vKw=SE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nAMFZ-0003sX-1N
 for xen-devel@lists.xenproject.org; Thu, 20 Jan 2022 01:28:29 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4334f7bf-7990-11ec-8fa7-f31e035a9116;
 Thu, 20 Jan 2022 02:28:26 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 939816152B;
 Thu, 20 Jan 2022 01:28:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3716C340E3;
 Thu, 20 Jan 2022 01:28:23 +0000 (UTC)
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
X-Inumbo-ID: 4334f7bf-7990-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642642104;
	bh=kAtV/ltM9FkVByfFGUmsG/SUhGbLw6EM8pspv+JESRw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cMLsuGG0yQxTGUYzcNKDdmVr2/5fWnHC1BgQcz4lAmQvh8KAdtLSF7DCygttUh6SA
	 f9njjRNP3mwfsVcwhUgELIHMxM3miiRhntKz0hqMOCkp6NJ5s+4VIQ2Ki4fIdKgE4M
	 LI6T3fLZjNlmnN8NAKhtNrXXAYUxqwiplJ2aW7rH2l3aTMAeBXeSzgNrN5EaXkmPI5
	 tXptjdbNAz/YVNB8RScXxtAJu0KjrA+nb1I9ykX8OK5mWw2z3SsKA4kVxCR6OPmXc3
	 +3meG6RFwYxhXw01u44YXfn9GWAuZuUPIM699Qxjqw51W0N+0o77S9hm67JwP7GHxk
	 dJR7CDoqe3XqA==
Date: Wed, 19 Jan 2022 17:28:21 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [RFC v1 3/5] xen/arm: introduce SCMI-SMC mediator driver
In-Reply-To: <20220119120400.GA3779126@EPUAKYIW015D>
Message-ID: <alpine.DEB.2.22.394.2201191644400.19362@ubuntu-linux-20-04-desktop>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com> <e9dadd96aa5b64b9232e10a083ce393af620adde.1639472078.git.oleksii_moisieiev@epam.com> <alpine.DEB.2.22.394.2112171709140.2060010@ubuntu-linux-20-04-desktop> <20211220181215.GA1702335@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2112201613210.2060010@ubuntu-linux-20-04-desktop> <20211221200305.GA2460476@EPUAKYIW015D> <alpine.DEB.2.22.394.2112211310000.2060010@ubuntu-linux-20-04-desktop> <20211222110414.GA2883815@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2112221627190.2060010@ubuntu-linux-20-04-desktop> <20220119120400.GA3779126@EPUAKYIW015D>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 19 Jan 2022, Oleksii Moisieiev wrote:
> On Wed, Dec 22, 2021 at 06:23:24PM -0800, Stefano Stabellini wrote:
> > On Wed, 22 Dec 2021, Oleksii Moisieiev wrote:
> > > On Tue, Dec 21, 2021 at 01:22:50PM -0800, Stefano Stabellini wrote:
> > > > On Tue, 21 Dec 2021, Oleksii Moisieiev wrote:
> > > > > Hi Stefano,
> > > > > 
> > > > > On Mon, Dec 20, 2021 at 04:52:01PM -0800, Stefano Stabellini wrote:
> > > > > > On Mon, 20 Dec 2021, Oleksii Moisieiev wrote:
> > > > > > > Hi Stefano,
> > > > > > > 
> > > > > > > On Fri, Dec 17, 2021 at 06:14:55PM -0800, Stefano Stabellini wrote:
> > > > > > > > On Tue, 14 Dec 2021, Oleksii Moisieiev wrote:
> > > > > > > > > This is the implementation of SCI interface, called SCMI-SMC driver,
> > > > > > > > > which works as the mediator between XEN Domains and Firmware (SCP, ATF etc).
> > > > > > > > > This allows devices from the Domains to work with clocks, resets and
> > > > > > > > > power-domains without access to CPG.
> > > > > > > > > 
> > > > > > > > > The following features are implemented:
> > > > > > > > > - request SCMI channels from ATF and pass channels to Domains;
> > > > > > > > > - set device permissions for Domains based on the Domain partial
> > > > > > > > > device-tree. Devices with permissions are able to work with clocks,
> > > > > > > > > resets and power-domains via SCMI;
> > > > > > > > > - redirect scmi messages from Domains to ATF.
> > > > > > > > > 
> > > > > > > > > Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> > > > > > > > > ---
> > > > > > > > >  xen/arch/arm/Kconfig          |   2 +
> > > > > > > > >  xen/arch/arm/sci/Kconfig      |  10 +
> > > > > > > > >  xen/arch/arm/sci/Makefile     |   1 +
> > > > > > > > >  xen/arch/arm/sci/scmi_smc.c   | 795 ++++++++++++++++++++++++++++++++++
> > > > > > > > >  xen/include/public/arch-arm.h |   1 +
> > > > > > > > >  5 files changed, 809 insertions(+)
> > > > > > > > >  create mode 100644 xen/arch/arm/sci/Kconfig
> > > > > > > > >  create mode 100644 xen/arch/arm/sci/scmi_smc.c
> > > > > > > > > 
> > > > > > > > > diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> > > > > > > > > index 186e1db389..02d96c6cfc 100644
> > > > > > > > > --- a/xen/arch/arm/Kconfig
> > > > > > > > > +++ b/xen/arch/arm/Kconfig
> > > > > > > > > @@ -114,6 +114,8 @@ config SCI
> > > > > > > > >  	  support. It allows guests to control system resourcess via one of
> > > > > > > > >  	  SCI mediators implemented in XEN.
> > > > > > > > >  
> > > > > > > > > +source "arch/arm/sci/Kconfig"
> > > > > > > > > +
> > > > > > > > >  endmenu
> > > > > > > > >  
> > > > > > > > >  menu "ARM errata workaround via the alternative framework"
> > > > > > > > > diff --git a/xen/arch/arm/sci/Kconfig b/xen/arch/arm/sci/Kconfig
> > > > > > > > > new file mode 100644
> > > > > > > > > index 0000000000..9563067ddc
> > > > > > > > > --- /dev/null
> > > > > > > > > +++ b/xen/arch/arm/sci/Kconfig
> > > > > > > > > @@ -0,0 +1,10 @@
> > > > > > > > > +config SCMI_SMC
> > > > > > > > > +	bool "Enable SCMI-SMC mediator driver"
> > > > > > > > > +	default n
> > > > > > > > > +	depends on SCI
> > > > > > > > > +	---help---
> > > > > > > > > +
> > > > > > > > > +	Enables mediator in XEN to pass SCMI requests from Domains to ATF.
> > > > > > > > > +	This feature allows drivers from Domains to work with System
> > > > > > > > > +	Controllers (such as power,resets,clock etc.). SCP is used as transport
> > > > > > > > > +	for communication.
> > > > > > > > > diff --git a/xen/arch/arm/sci/Makefile b/xen/arch/arm/sci/Makefile
> > > > > > > > > index 837dc7492b..67f2611872 100644
> > > > > > > > > --- a/xen/arch/arm/sci/Makefile
> > > > > > > > > +++ b/xen/arch/arm/sci/Makefile
> > > > > > > > > @@ -1 +1,2 @@
> > > > > > > > >  obj-y += sci.o
> > > > > > > > > +obj-$(CONFIG_SCMI_SMC) += scmi_smc.o
> > > > > > > > > diff --git a/xen/arch/arm/sci/scmi_smc.c b/xen/arch/arm/sci/scmi_smc.c
> > > > > > > > > new file mode 100644
> > > > > > > > > index 0000000000..2eb01ea82d
> > > > > > > > > --- /dev/null
> > > > > > > > > +++ b/xen/arch/arm/sci/scmi_smc.c
> > > > > > > > > @@ -0,0 +1,795 @@
> > > > > > > > > +/*
> > > > > > > > > + * xen/arch/arm/sci/scmi_smc.c
> > > > > > > > > + *
> > > > > > > > > + * SCMI mediator driver, using SCP as transport.
> > > > > > > > > + *
> > > > > > > > > + * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> > > > > > > > > + * Copyright (C) 2021, EPAM Systems.
> > > > > > > > > + *
> > > > > > > > > + * This program is free software; you can redistribute it and/or modify
> > > > > > > > > + * it under the terms of the GNU General Public License as published by
> > > > > > > > > + * the Free Software Foundation; either version 2 of the License, or
> > > > > > > > > + * (at your option) any later version.
> > > > > > > > > + *
> > > > > > > > > + * This program is distributed in the hope that it will be useful,
> > > > > > > > > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > > > > > > > > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > > > > > > > > + * GNU General Public License for more details.
> > > > > > > > > + */
> > > > > > > > > +
> > > > > > > > > +#include <asm/sci/sci.h>
> > > > > > > > > +#include <asm/smccc.h>
> > > > > > > > > +#include <asm/io.h>
> > > > > > > > > +#include <xen/bitops.h>
> > > > > > > > > +#include <xen/config.h>
> > > > > > > > > +#include <xen/sched.h>
> > > > > > > > > +#include <xen/device_tree.h>
> > > > > > > > > +#include <xen/iocap.h>
> > > > > > > > > +#include <xen/init.h>
> > > > > > > > > +#include <xen/err.h>
> > > > > > > > > +#include <xen/lib.h>
> > > > > > > > > +#include <xen/list.h>
> > > > > > > > > +#include <xen/mm.h>
> > > > > > > > > +#include <xen/string.h>
> > > > > > > > > +#include <xen/time.h>
> > > > > > > > > +#include <xen/vmap.h>
> > > > > > > > > +
> > > > > > > > > +#define SCMI_BASE_PROTOCOL                  0x10
> > > > > > > > > +#define SCMI_BASE_PROTOCOL_ATTIBUTES        0x1
> > > > > > > > > +#define SCMI_BASE_SET_DEVICE_PERMISSIONS    0x9
> > > > > > > > > +#define SCMI_BASE_RESET_AGENT_CONFIGURATION 0xB
> > > > > > > > > +#define SCMI_BASE_DISCOVER_AGENT            0x7
> > > > > > > > > +
> > > > > > > > > +/* SCMI return codes. See section 4.1.4 of SCMI spec (DEN0056C) */
> > > > > > > > > +#define SCMI_SUCCESS              0
> > > > > > > > > +#define SCMI_NOT_SUPPORTED      (-1)
> > > > > > > > > +#define SCMI_INVALID_PARAMETERS (-2)
> > > > > > > > > +#define SCMI_DENIED             (-3)
> > > > > > > > > +#define SCMI_NOT_FOUND          (-4)
> > > > > > > > > +#define SCMI_OUT_OF_RANGE       (-5)
> > > > > > > > > +#define SCMI_BUSY               (-6)
> > > > > > > > > +#define SCMI_COMMS_ERROR        (-7)
> > > > > > > > > +#define SCMI_GENERIC_ERROR      (-8)
> > > > > > > > > +#define SCMI_HARDWARE_ERROR     (-9)
> > > > > > > > > +#define SCMI_PROTOCOL_ERROR     (-10)
> > > > > > > > > +
> > > > > > > > > +#define DT_MATCH_SCMI_SMC DT_MATCH_COMPATIBLE("arm,scmi-smc")
> > > > > > > > > +
> > > > > > > > > +#define SCMI_SMC_ID                        "arm,smc-id"
> > > > > > > > > +#define SCMI_SHARED_MEMORY                 "linux,scmi_mem"
> > > > > > > > 
> > > > > > > > I could find the following SCMI binding in Linux, which describes
> > > > > > > > the arm,scmi-smc compatible and the arm,smc-id property:
> > > > > > > > 
> > > > > > > > Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> > > > > > > > 
> > > > > > > > However, linux,scmi_mem is not described. Aren't you supposed to read
> > > > > > > > the "shmem" property instead? And the compatible string used for this
> > > > > > > > seems to be "arm,scmi-shmem".
> > > > > > > > 
> > > > > > > 
> > > > > > > We use linux,scmi_mem node to reserve memory, needed for all
> > > > > > > channels:
> > > > > > > 
> > > > > > > reserved-memory {
> > > > > > >     /* reserved region for scmi channels*/
> > > > > > >     scmi_memory: linux,scmi_mem@53FF0000 {
> > > > > > >         no-map;
> > > > > > >         reg = <0x0 0x53FF0000 0x0 0x10000>;
> > > > > > >     };
> > > > > > > };
> > > > > > > 
> > > > > > > arm,scmi-shmem node used in shmem property defines only 1 page needed to
> > > > > > > the current scmi channel:
> > > > > > > 
> > > > > > > cpu_scp_shm: scp-shmem@0x53FF0000 {
> > > > > > >     compatible = "arm,scmi-shmem";
> > > > > > >     reg = <0x0 0x53FF0000 0x0 0x1000>;
> > > > > > > };
> > > > > > > 
> > > > > > > For each Domain reg points to unigue page from linux,scmi_mem region,
> > > > > > > assigned to this agent.
> > > > > > 
> > > > > > If we were to use "linux,scmi_mem" we would have to introduce it as a
> > > > > > compatible string, not as a node name, and it would need to be described
> > > > > > in Documentation/devicetree/bindings/firmware/arm,scmi.yaml.
> > > > > > 
> > > > > > But from your description I don't think it is necessary. We can just use
> > > > > > "arm,scmi-shmem" to describe all the required regions:
> > > > > > 
> > > > > > reserved-memory {
> > > > > >     scp-shmem@0x53FF0000 {
> > > > > >         compatible = "arm,scmi-shmem";
> > > > > >         reg = <0x0 0x53FF0000 0x0 0x1000>;
> > > > > >     };
> > > > > >     scp-shmem@0x53FF1000 {
> > > > > >         compatible = "arm,scmi-shmem";
> > > > > >         reg = <0x0 0x53FF1000 0x0 0x1000>;
> > > > > >     };
> > > > > >     scp-shmem@0x53FF2000 {
> > > > > >         compatible = "arm,scmi-shmem";
> > > > > >         reg = <0x0 0x53FF2000 0x0 0x1000>;
> > > > > >     };
> > > > > >     ...
> > > > > > 
> > > > > > In other words, if all the individual channel pages are described as
> > > > > > "arm,scmi-shmem", why do we also need a single larger region as
> > > > > > "linux,scmi_mem"?
> > > > > > 
> > > > > 
> > > > > That was my first implementation. But I've met a problem with
> > > > > scmi driver in kernel. I don't remember the exact place, but I remember
> > > > > there were some if, checking if memory weren't reserved.
> > > > > That's why I ended up splitting nodes reserved memory region and actual
> > > > > shmem page.
> > > > > For linux,scmi_mem node I took format from /reserved-memory/linux,lossy_decompress@54000000,
> > > > > which has no compatible string and provides no-map property.
> > > > > linux,scmi_shmem node is needed to prevent xen from allocating this
> > > > > space for the domain.
> > > > > 
> > > > > Very interesting question about should I introduce linux,scmi_mem node
> > > > > and scmi_devid property to the
> > > > > Documentation/devicetree/bindings/firmware/arm,scmi.yaml?
> > > > > Those node and property are needed only for Xen and useless for
> > > > > non-virtualized systems. I can add this node and property description to
> > > > > arm,scmi.yaml, but leave a note that this is Xen specific params.
> > > > > What do you think about it?
> > > > 
> > > > Reply below
> > > > 
> > > > [...]
> > > >  
> > > > 
> > > > > > In general we can't use properties that are not part of the device tree
> > > > > > spec, either https://urldefense.com/v3/__https://www.devicetree.org/specifications/__;!!GF_29dbcQIUBPA!kNodtgmOQBc1iO76_6vTK-O1SoLxee_ChowYQiQYC595rMOsrnmof2zmk7BnhXCSnJPN$ [devicetree[.]org] or
> > > > > > https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings__;!!GF_29dbcQIUBPA!kNodtgmOQBc1iO76_6vTK-O1SoLxee_ChowYQiQYC595rMOsrnmof2zmk7BnhXloYUaj$ [git[.]kernel[.]org]
> > > > > > 
> > > > > > "linux,scmi_mem" is currently absent. Are you aware of any upstreaming
> > > > > > activities to get "linux,scmi_mem" upstream under
> > > > > > Documentation/devicetree/bindings in Linux?
> > > > > > 
> > > > > > If "linux,scmi_mem" is going upstream in Linux, then we could use it.
> > > > > > Otherwise, first "linux,scmi_mem" needs to be added somewhere under
> > > > > > Documentation/devicetree/bindings (probably
> > > > > > Documentation/devicetree/bindings/firmware/arm,scmi.yaml), then we can
> > > > > > work on the Xen code that makes use of it.
> > > > > > 
> > > > > > Does it make sense?
> > > > > > 
> > > > > 
> > > > > Yes I agree. I think linux,scmi_mem and scmi_devid should be upstreamed.
> > > > > I will add those properties to arm,scmi.yaml, mark them as related to XEN and send patch.
> > > > 
> > > > I didn't realize that linux,scmi_mem and scmi_devid are supposed to be
> > > > Xen specific. In general, it would be best not to introduce Xen specific
> > > > properties into generic bindings. It is a problem both from a
> > > > specification perspective (because it has hard to handle Xen specific
> > > > cases in fully generic bindings, especially as those bindings are
> > > > maintained as part of the Linux kernel) and from a user perspective
> > > > (because now the user has to deal with a Xen-specific dtb, or has to
> > > > modify the host dtb to add Xen-specific information by hand.)
> > > > 
> > > > 
> > > > Let me start from scmi_devid.  Why would scmi_devid be Xen-specific? It
> > > > looks like a generic property that should be needed for the Linux SCMI
> > > > driver too. Why the Linux driver doesn't need it?
> > > > 
> > > 
> > > scmi_devid used during domain build. It passed as input parameter for SCMI_BASE_SET_DEVICE_PERMISSIONS message.
> > > On non-virtualized systems - there is no need of this call, because OS
> > > is the only one entity, running on the system.
> > 
> > OK. Even if it is only required for virtualized systems, I think that
> > scmi_devid is important enough that should be part of the upstream
> > binding. I think it is worth starting an email thread on the LKML with
> > Rob Herring and the SCMI maintainers to discuss the addition of
> > scmi_devid to the binding.
> > 
> > 
> > > I've chatted with Volodymyr_Babchuk and he gave a great idea to add a
> > > list of device_ids to dom.cfg, such as:
> > > sci_devs = [ 0, 1, 15, 35 ];
> > > 
> > > Using this approach, we can remove scmi_devid from the device tree and
> > > just pass a list of scmi_devids to XEN using additional hypercall.
> > > We can probably make hypercall taking devid list as input parameter.
> > > This will take only 1 hypercall to setup sci permissions.
> > 
> > But how would a user know which are the right SCMI IDs to add to the
> > sci_devs list? Would the user have to go and read the reference manual
> > of the platform to find the SCMI IDs and then write sci_devs by hand?
> > If that is the case, then I think that it would be better to add
> > scmi_devid to device tree.
> > 
> > In general, I think this configuration should happen automatically
> > without user intervention. The user should just specify "enable SCMI"
> > and it should work.
> > 
> > 
> > > > In regards to linux,scmi_mem, I think it would be best to do without it
> > > > and fix the Linux SCMI driver if we need to do so. Xen should be able to
> > > > parse the native "arm,scmi-shmem" nodes and Linux (dom0 or domU) should
> > > > be able to parse the "arm,scmi-shmem" nodes generated by Xen. Either
> > > > way, I don't think we should need linux,scmi_mem.
> > > 
> > > This requires further investigation. I will try to make implementation
> > > without linux,scmi_mem, using only arm,scmi-shmem nodes and share
> > > reuslts with you.
> > 
> > OK, thanks.
> 
> Hi Stefano,
> 
> As I did some investigation about using reserved-memory area
> linux,scmi_mem and now I need your advice.
> 
> I see 2 possible implementations for now:
> 1) Add memory-region parameter to cpu_scp_shm node which points to the
> reserved memory region.
> So device-tree will look like this:
> 
> 	reserved-memory {
> 		/* reserved region for scmi channels*/
> 		scmi_memory: region@53FF0000{
> 			no-map;
> 			reg = <0x0 0x53FF0000 0x0 0x10000>;
> 		};
> 	};
> 	cpu_scp_shm: scp-shmem@0x53FF0000 {
> 		compatible = "arm,scmi-shmem";
> 		reg = <0x0 0x53FF0000 0x0 0x1000>;
> 		memory-region = <&scmi_memory>;
> 	};
> 
> So cpu_scp_shm node has a reference to scmi_memory region. This mean
> that xen can find reserved memory region without adding additional names
> to the device-tree bindings.
> memory-region parameter as a reference to reserved memory and region
> creation described in:
> https://github.com/torvalds/linux/blob/v5.15/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> 
> This approach I've implemented already and it works.

This approach would require a discussion with the upstream device tree
maintainers. Likely, we would need to add a note about the usage of the
"memory-region" property to arm,scmi.yaml.

Also, I have the feeling that they would ask to add the "memory-region"
property directly to the "arm,scmi-smc" node, as an alternative (or
in addition) to the existing "shmem" property.

That said, from my point of view this approach is also a viable option.
I don't see any major problems.

The main question (after reading everything else that you wrote below)
is whether the "arm,scmi-smc" node in this case could be automatically
generated.


> 2) The second approach is the format you suggested:
> > > > > > reserved-memory {
> > > > > >     scp-shmem@0x53FF0000 {
> > > > > >         compatible = "arm,scmi-shmem";
> > > > > >         reg = <0x0 0x53FF0000 0x0 0x1000>;
> > > > > >     };
> > > > > >     scp-shmem@0x53FF1000 {
> > > > > >         compatible = "arm,scmi-shmem";
> > > > > >         reg = <0x0 0x53FF1000 0x0 0x1000>;
> > > > > >     };
> > > > > >     scp-shmem@0x53FF2000 {
> > > > > >         compatible = "arm,scmi-shmem";
> > > > > >         reg = <0x0 0x53FF2000 0x0 0x1000>;
> > > > > >     };
> > > > > >     ...
> 
> This approach has an advantage that xen ARM_SCI driver do not know about
> how channels are placed in the reserved memory, but introduces some
> disadvantages:
> a) We provide extra 14 (in our case) arm,scmi-shmem nodes which are not used
> in the device-tree. In current implementation I have separate scmi.dtsi
> file which introduces scmi support for both XEN-based and
> non-virtualized systems. Having 14 extra channels in the device-tree may
> be confusing.

I can see that while it would be ideal for Xen to see all 14+1 channels
in device tree (on the host device tree), we wouldn't want to expose all
of them to the domains, not even to dom0. 

How many channels do we want dom0 to see by the way? For this
discussion, I'll just assume for now that dom0 only sees 1 channel like
the domUs.

Now we have a problem: how do we go about "filtering" the
"arm,scmi-shmem" device tree nodes? Which is also what you are asking
below in point b).


> b) In case if we have all 15 channels, described in partial device-tree,

I think you meant "described in the host device tree", right?


> we should not copy any node to the domain device-tree. I think it will
> be better to generate arm,scmi-shmem node in the Domain device-tree.

Yes, I think it makes sense for Xen to generate the "arm,scmi-shmem"
device tree description for the DomU/Dom0 based on the channels
allocated to the domain.


> The problem is that arm,scmi-smc node, which is using arm,scmi-shmem
> node can't be generated. I prefer it to be copied from the partial
> device-tree because it includes some platform specific configuration,
> such as func-id and list of the protocols (for example different
> platforms may require different list of the protocols). So in this
> case we will have 1 node copied and 1 node generated.
>
> I think even for dom0less we should use arm,scmi-smc node from the
> device-tree because protocol configuration and funcid is related to the
> platform.

I am not sure I understood what you wrote. You are saying that the
"arm,scmi-smc" node includes some platform specific configurations so
it cannot be automatically generated by Xen (or by the tools) and
instead it needs to be manually provided as part of the partial dtb for
the domU. Is that correct?

If so, I would like to understand the reasons behind it. Manual
device tree editing is problematic.

I looked for "func-id" in
Documentation/devicetree/bindings/firmware/arm,scmi.yaml but couldn't
find any results. Do you have an example of the platform specific
configuration or protocol configuration that would make it difficult to
automatically generate the "arm,scmi-smc" node for the domains?

Also, is this a problem just for approach #2 or also for approach #1?
If it is a problem only for approach #2, then let's just go with
approach #1.


> I prefer the second approach and will try to make it if it's OK to copy
> arm,scmi-smc node from partial Device-tree and generate arm,scmi-shmem
> node.
> 
> What do you think about that?

From a device tree specification perspective, I think both approaches
are OK (with a minor comment on the first approach as I wrote above.)

But from a Xen perspective I think it is important that we don't require
the user to manually provide the SCMI configuration in the partial DTB.
It would be better if we could generate it automatically from Xen or the
tools (or even an independent script). Or copy the "arm,scmi-smc" node
from the host device tree to the domU device tree without modifications.

So if using approach #1 allows us to automatically generate the
"arm,scmi-smc" node for the guest, then I think it's best for sure.


> Also I wanted to mention that I'm not planning to make ARM_SCI support for
> dom0less in terms of this patch series bacause I can't test
> dom0less configuration for now. So let me know if some of my
> functionality breaks dom0less.
 
That's fine. I don't mean to scope-creep your patch series, which is
extremely valuable as is.

That said, I would be happy to provide you with a very simple dom0less
configuration for your platform to enable you to test, or alternatively
I could write a patch to add dom0less domU support if you are happy to
help reviewing and testing it.

