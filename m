Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A41D498AB5
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jan 2022 20:07:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259963.448831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nC4fU-0006ue-4t; Mon, 24 Jan 2022 19:06:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259963.448831; Mon, 24 Jan 2022 19:06:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nC4fU-0006rA-0x; Mon, 24 Jan 2022 19:06:20 +0000
Received: by outflank-mailman (input) for mailman id 259963;
 Mon, 24 Jan 2022 19:06:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4ZXe=SI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nC4fR-0006r4-Km
 for xen-devel@lists.xenproject.org; Mon, 24 Jan 2022 19:06:18 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1f3d4d5-7d48-11ec-8fa7-f31e035a9116;
 Mon, 24 Jan 2022 20:06:12 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 027A3611DA;
 Mon, 24 Jan 2022 19:06:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 761DBC340E5;
 Mon, 24 Jan 2022 19:06:08 +0000 (UTC)
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
X-Inumbo-ID: b1f3d4d5-7d48-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643051170;
	bh=3VYfxsjznlDqM1PIZbnuL+aczoyIf7rGKuEmehii3xw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QBlG/I7UO6Bgjkrnlr/R0oZ+GtfSIjZ+Cq8CA0Kb/RhzyZMW5sfGkvLvB06XwOMsD
	 levxpN8rQzHKofsrHKcYYXC5CW9keTEKdVaGX1+mx2S80Vf1OTH/VI2nxv4Htv1H29
	 3o0lND5EhOpXwSADcxgm1vuY1Zf15/EsPbR2+cacZlDMfg1OhtJ4bpfJp6NUpdMzma
	 SkAbqLEP21Klq5AC/ahLbRCgTj5f1Yhg0XiQUiN+eTfDFsoM0ut33Kor9JDt2UN6Q6
	 vmmOG83L8kHgK8muNwLk8MceEHJ+wHw+BT7FXGTQvY9jGG7IjtIJBRCTaUQ9i7apSQ
	 Zj4Oe1rUx8DFA==
Date: Mon, 24 Jan 2022 11:06:06 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [RFC v1 3/5] xen/arm: introduce SCMI-SMC mediator driver
In-Reply-To: <20220124182249.GA2485483@EPUAKYIW015D>
Message-ID: <alpine.DEB.2.22.394.2201241056290.27308@ubuntu-linux-20-04-desktop>
References: <20211221200305.GA2460476@EPUAKYIW015D> <alpine.DEB.2.22.394.2112211310000.2060010@ubuntu-linux-20-04-desktop> <20211222110414.GA2883815@EPUAKYIW015D> <alpine.DEB.2.22.394.2112221627190.2060010@ubuntu-linux-20-04-desktop> <20220119120400.GA3779126@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2201191644400.19362@ubuntu-linux-20-04-desktop> <20220120102147.GA4153317@EPUAKYIW015D> <alpine.DEB.2.22.394.2201201230480.27308@ubuntu-linux-20-04-desktop> <20220121150753.GA898010@EPUAKYIW015D> <alpine.DEB.2.22.394.2201211236060.27308@ubuntu-linux-20-04-desktop>
 <20220124182249.GA2485483@EPUAKYIW015D>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Jan 2022, Oleksii Moisieiev wrote:
> On Fri, Jan 21, 2022 at 12:49:55PM -0800, Stefano Stabellini wrote:
> > On Fri, 21 Jan 2022, Oleksii Moisieiev wrote:
> > > On Thu, Jan 20, 2022 at 02:29:41PM -0800, Stefano Stabellini wrote:
> > > > On Thu, 20 Jan 2022, Oleksii Moisieiev wrote:
> > > > > On Wed, Jan 19, 2022 at 05:28:21PM -0800, Stefano Stabellini wrote:
> > > > > > On Wed, 19 Jan 2022, Oleksii Moisieiev wrote:
> > > > > > > On Wed, Dec 22, 2021 at 06:23:24PM -0800, Stefano Stabellini wrote:
> > > > > > > > On Wed, 22 Dec 2021, Oleksii Moisieiev wrote:
> > > > > > > > > On Tue, Dec 21, 2021 at 01:22:50PM -0800, Stefano Stabellini wrote:
> > > > > > > > > > On Tue, 21 Dec 2021, Oleksii Moisieiev wrote:
> > > > > > > > > > > Hi Stefano,
> > > > > > > > > > >
> > > > > > > > > > > On Mon, Dec 20, 2021 at 04:52:01PM -0800, Stefano Stabellini wrote:
> > > > > > > > > > > > On Mon, 20 Dec 2021, Oleksii Moisieiev wrote:
> > > > > > > > > > > > > Hi Stefano,
> > > > > > > > > > > > >
> > > > > > > > > > > > > On Fri, Dec 17, 2021 at 06:14:55PM -0800, Stefano Stabellini wrote:
> > > > > > > > > > > > > > On Tue, 14 Dec 2021, Oleksii Moisieiev wrote:
> > > > > > > > > > > > > > > This is the implementation of SCI interface, called SCMI-SMC driver,
> > > > > > > > > > > > > > > which works as the mediator between XEN Domains and Firmware (SCP, ATF etc).
> > > > > > > > > > > > > > > This allows devices from the Domains to work with clocks, resets and
> > > > > > > > > > > > > > > power-domains without access to CPG.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > The following features are implemented:
> > > > > > > > > > > > > > > - request SCMI channels from ATF and pass channels to Domains;
> > > > > > > > > > > > > > > - set device permissions for Domains based on the Domain partial
> > > > > > > > > > > > > > > device-tree. Devices with permissions are able to work with clocks,
> > > > > > > > > > > > > > > resets and power-domains via SCMI;
> > > > > > > > > > > > > > > - redirect scmi messages from Domains to ATF.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> > > > > > > > > > > > > > > ---
> > > > > > > > > > > > > > >  xen/arch/arm/Kconfig          |   2 +
> > > > > > > > > > > > > > >  xen/arch/arm/sci/Kconfig      |  10 +
> > > > > > > > > > > > > > >  xen/arch/arm/sci/Makefile     |   1 +
> > > > > > > > > > > > > > >  xen/arch/arm/sci/scmi_smc.c   | 795 ++++++++++++++++++++++++++++++++++
> > > > > > > > > > > > > > >  xen/include/public/arch-arm.h |   1 +
> > > > > > > > > > > > > > >  5 files changed, 809 insertions(+)
> > > > > > > > > > > > > > >  create mode 100644 xen/arch/arm/sci/Kconfig
> > > > > > > > > > > > > > >  create mode 100644 xen/arch/arm/sci/scmi_smc.c
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> > > > > > > > > > > > > > > index 186e1db389..02d96c6cfc 100644
> > > > > > > > > > > > > > > --- a/xen/arch/arm/Kconfig
> > > > > > > > > > > > > > > +++ b/xen/arch/arm/Kconfig
> > > > > > > > > > > > > > > @@ -114,6 +114,8 @@ config SCI
> > > > > > > > > > > > > > >  	  support. It allows guests to control system resourcess via one of
> > > > > > > > > > > > > > >  	  SCI mediators implemented in XEN.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > +source "arch/arm/sci/Kconfig"
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > >  endmenu
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > >  menu "ARM errata workaround via the alternative framework"
> > > > > > > > > > > > > > > diff --git a/xen/arch/arm/sci/Kconfig b/xen/arch/arm/sci/Kconfig
> > > > > > > > > > > > > > > new file mode 100644
> > > > > > > > > > > > > > > index 0000000000..9563067ddc
> > > > > > > > > > > > > > > --- /dev/null
> > > > > > > > > > > > > > > +++ b/xen/arch/arm/sci/Kconfig
> > > > > > > > > > > > > > > @@ -0,0 +1,10 @@
> > > > > > > > > > > > > > > +config SCMI_SMC
> > > > > > > > > > > > > > > +	bool "Enable SCMI-SMC mediator driver"
> > > > > > > > > > > > > > > +	default n
> > > > > > > > > > > > > > > +	depends on SCI
> > > > > > > > > > > > > > > +	---help---
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > +	Enables mediator in XEN to pass SCMI requests from Domains to ATF.
> > > > > > > > > > > > > > > +	This feature allows drivers from Domains to work with System
> > > > > > > > > > > > > > > +	Controllers (such as power,resets,clock etc.). SCP is used as transport
> > > > > > > > > > > > > > > +	for communication.
> > > > > > > > > > > > > > > diff --git a/xen/arch/arm/sci/Makefile b/xen/arch/arm/sci/Makefile
> > > > > > > > > > > > > > > index 837dc7492b..67f2611872 100644
> > > > > > > > > > > > > > > --- a/xen/arch/arm/sci/Makefile
> > > > > > > > > > > > > > > +++ b/xen/arch/arm/sci/Makefile
> > > > > > > > > > > > > > > @@ -1 +1,2 @@
> > > > > > > > > > > > > > >  obj-y += sci.o
> > > > > > > > > > > > > > > +obj-$(CONFIG_SCMI_SMC) += scmi_smc.o
> > > > > > > > > > > > > > > diff --git a/xen/arch/arm/sci/scmi_smc.c b/xen/arch/arm/sci/scmi_smc.c
> > > > > > > > > > > > > > > new file mode 100644
> > > > > > > > > > > > > > > index 0000000000..2eb01ea82d
> > > > > > > > > > > > > > > --- /dev/null
> > > > > > > > > > > > > > > +++ b/xen/arch/arm/sci/scmi_smc.c
> > > > > > > > > > > > > > > @@ -0,0 +1,795 @@
> > > > > > > > > > > > > > > +/*
> > > > > > > > > > > > > > > + * xen/arch/arm/sci/scmi_smc.c
> > > > > > > > > > > > > > > + *
> > > > > > > > > > > > > > > + * SCMI mediator driver, using SCP as transport.
> > > > > > > > > > > > > > > + *
> > > > > > > > > > > > > > > + * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> > > > > > > > > > > > > > > + * Copyright (C) 2021, EPAM Systems.
> > > > > > > > > > > > > > > + *
> > > > > > > > > > > > > > > + * This program is free software; you can redistribute it and/or modify
> > > > > > > > > > > > > > > + * it under the terms of the GNU General Public License as published by
> > > > > > > > > > > > > > > + * the Free Software Foundation; either version 2 of the License, or
> > > > > > > > > > > > > > > + * (at your option) any later version.
> > > > > > > > > > > > > > > + *
> > > > > > > > > > > > > > > + * This program is distributed in the hope that it will be useful,
> > > > > > > > > > > > > > > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > > > > > > > > > > > > > > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > > > > > > > > > > > > > > + * GNU General Public License for more details.
> > > > > > > > > > > > > > > + */
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > +#include <asm/sci/sci.h>
> > > > > > > > > > > > > > > +#include <asm/smccc.h>
> > > > > > > > > > > > > > > +#include <asm/io.h>
> > > > > > > > > > > > > > > +#include <xen/bitops.h>
> > > > > > > > > > > > > > > +#include <xen/config.h>
> > > > > > > > > > > > > > > +#include <xen/sched.h>
> > > > > > > > > > > > > > > +#include <xen/device_tree.h>
> > > > > > > > > > > > > > > +#include <xen/iocap.h>
> > > > > > > > > > > > > > > +#include <xen/init.h>
> > > > > > > > > > > > > > > +#include <xen/err.h>
> > > > > > > > > > > > > > > +#include <xen/lib.h>
> > > > > > > > > > > > > > > +#include <xen/list.h>
> > > > > > > > > > > > > > > +#include <xen/mm.h>
> > > > > > > > > > > > > > > +#include <xen/string.h>
> > > > > > > > > > > > > > > +#include <xen/time.h>
> > > > > > > > > > > > > > > +#include <xen/vmap.h>
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > +#define SCMI_BASE_PROTOCOL                  0x10
> > > > > > > > > > > > > > > +#define SCMI_BASE_PROTOCOL_ATTIBUTES        0x1
> > > > > > > > > > > > > > > +#define SCMI_BASE_SET_DEVICE_PERMISSIONS    0x9
> > > > > > > > > > > > > > > +#define SCMI_BASE_RESET_AGENT_CONFIGURATION 0xB
> > > > > > > > > > > > > > > +#define SCMI_BASE_DISCOVER_AGENT            0x7
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > +/* SCMI return codes. See section 4.1.4 of SCMI spec (DEN0056C) */
> > > > > > > > > > > > > > > +#define SCMI_SUCCESS              0
> > > > > > > > > > > > > > > +#define SCMI_NOT_SUPPORTED      (-1)
> > > > > > > > > > > > > > > +#define SCMI_INVALID_PARAMETERS (-2)
> > > > > > > > > > > > > > > +#define SCMI_DENIED             (-3)
> > > > > > > > > > > > > > > +#define SCMI_NOT_FOUND          (-4)
> > > > > > > > > > > > > > > +#define SCMI_OUT_OF_RANGE       (-5)
> > > > > > > > > > > > > > > +#define SCMI_BUSY               (-6)
> > > > > > > > > > > > > > > +#define SCMI_COMMS_ERROR        (-7)
> > > > > > > > > > > > > > > +#define SCMI_GENERIC_ERROR      (-8)
> > > > > > > > > > > > > > > +#define SCMI_HARDWARE_ERROR     (-9)
> > > > > > > > > > > > > > > +#define SCMI_PROTOCOL_ERROR     (-10)
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > +#define DT_MATCH_SCMI_SMC DT_MATCH_COMPATIBLE("arm,scmi-smc")
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > +#define SCMI_SMC_ID                        "arm,smc-id"
> > > > > > > > > > > > > > > +#define SCMI_SHARED_MEMORY                 "linux,scmi_mem"
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > I could find the following SCMI binding in Linux, which describes
> > > > > > > > > > > > > > the arm,scmi-smc compatible and the arm,smc-id property:
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > However, linux,scmi_mem is not described. Aren't you supposed to read
> > > > > > > > > > > > > > the "shmem" property instead? And the compatible string used for this
> > > > > > > > > > > > > > seems to be "arm,scmi-shmem".
> > > > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > We use linux,scmi_mem node to reserve memory, needed for all
> > > > > > > > > > > > > channels:
> > > > > > > > > > > > >
> > > > > > > > > > > > > reserved-memory {
> > > > > > > > > > > > >     /* reserved region for scmi channels*/
> > > > > > > > > > > > >     scmi_memory: linux,scmi_mem@53FF0000 {
> > > > > > > > > > > > >         no-map;
> > > > > > > > > > > > >         reg = <0x0 0x53FF0000 0x0 0x10000>;
> > > > > > > > > > > > >     };
> > > > > > > > > > > > > };
> > > > > > > > > > > > >
> > > > > > > > > > > > > arm,scmi-shmem node used in shmem property defines only 1 page needed to
> > > > > > > > > > > > > the current scmi channel:
> > > > > > > > > > > > >
> > > > > > > > > > > > > cpu_scp_shm: scp-shmem@0x53FF0000 {
> > > > > > > > > > > > >     compatible = "arm,scmi-shmem";
> > > > > > > > > > > > >     reg = <0x0 0x53FF0000 0x0 0x1000>;
> > > > > > > > > > > > > };
> > > > > > > > > > > > >
> > > > > > > > > > > > > For each Domain reg points to unigue page from linux,scmi_mem region,
> > > > > > > > > > > > > assigned to this agent.
> > > > > > > > > > > >
> > > > > > > > > > > > If we were to use "linux,scmi_mem" we would have to introduce it as a
> > > > > > > > > > > > compatible string, not as a node name, and it would need to be described
> > > > > > > > > > > > in Documentation/devicetree/bindings/firmware/arm,scmi.yaml.
> > > > > > > > > > > >
> > > > > > > > > > > > But from your description I don't think it is necessary. We can just use
> > > > > > > > > > > > "arm,scmi-shmem" to describe all the required regions:
> > > > > > > > > > > >
> > > > > > > > > > > > reserved-memory {
> > > > > > > > > > > >     scp-shmem@0x53FF0000 {
> > > > > > > > > > > >         compatible = "arm,scmi-shmem";
> > > > > > > > > > > >         reg = <0x0 0x53FF0000 0x0 0x1000>;
> > > > > > > > > > > >     };
> > > > > > > > > > > >     scp-shmem@0x53FF1000 {
> > > > > > > > > > > >         compatible = "arm,scmi-shmem";
> > > > > > > > > > > >         reg = <0x0 0x53FF1000 0x0 0x1000>;
> > > > > > > > > > > >     };
> > > > > > > > > > > >     scp-shmem@0x53FF2000 {
> > > > > > > > > > > >         compatible = "arm,scmi-shmem";
> > > > > > > > > > > >         reg = <0x0 0x53FF2000 0x0 0x1000>;
> > > > > > > > > > > >     };
> > > > > > > > > > > >     ...
> > > > > > > > > > > >
> > > > > > > > > > > > In other words, if all the individual channel pages are described as
> > > > > > > > > > > > "arm,scmi-shmem", why do we also need a single larger region as
> > > > > > > > > > > > "linux,scmi_mem"?
> > > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > That was my first implementation. But I've met a problem with
> > > > > > > > > > > scmi driver in kernel. I don't remember the exact place, but I remember
> > > > > > > > > > > there were some if, checking if memory weren't reserved.
> > > > > > > > > > > That's why I ended up splitting nodes reserved memory region and actual
> > > > > > > > > > > shmem page.
> > > > > > > > > > > For linux,scmi_mem node I took format from /reserved-memory/linux,lossy_decompress@54000000,
> > > > > > > > > > > which has no compatible string and provides no-map property.
> > > > > > > > > > > linux,scmi_shmem node is needed to prevent xen from allocating this
> > > > > > > > > > > space for the domain.
> > > > > > > > > > >
> > > > > > > > > > > Very interesting question about should I introduce linux,scmi_mem node
> > > > > > > > > > > and scmi_devid property to the
> > > > > > > > > > > Documentation/devicetree/bindings/firmware/arm,scmi.yaml?
> > > > > > > > > > > Those node and property are needed only for Xen and useless for
> > > > > > > > > > > non-virtualized systems. I can add this node and property description to
> > > > > > > > > > > arm,scmi.yaml, but leave a note that this is Xen specific params.
> > > > > > > > > > > What do you think about it?
> > > > > > > > > >
> > > > > > > > > > Reply below
> > > > > > > > > >
> > > > > > > > > > [...]
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > > > In general we can't use properties that are not part of the device tree
> > > > > > > > > > > > spec, either https://urldefense.com/v3/__https://www.devicetree.org/specifications/__;!!GF_29dbcQIUBPA!kNodtgmOQBc1iO76_6vTK-O1SoLxee_ChowYQiQYC595rMOsrnmof2zmk7BnhXCSnJPN$ [devicetree[.]org] or
> > > > > > > > > > > > https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings__;!!GF_29dbcQIUBPA!kNodtgmOQBc1iO76_6vTK-O1SoLxee_ChowYQiQYC595rMOsrnmof2zmk7BnhXloYUaj$ [git[.]kernel[.]org]
> > > > > > > > > > > >
> > > > > > > > > > > > "linux,scmi_mem" is currently absent. Are you aware of any upstreaming
> > > > > > > > > > > > activities to get "linux,scmi_mem" upstream under
> > > > > > > > > > > > Documentation/devicetree/bindings in Linux?
> > > > > > > > > > > >
> > > > > > > > > > > > If "linux,scmi_mem" is going upstream in Linux, then we could use it.
> > > > > > > > > > > > Otherwise, first "linux,scmi_mem" needs to be added somewhere under
> > > > > > > > > > > > Documentation/devicetree/bindings (probably
> > > > > > > > > > > > Documentation/devicetree/bindings/firmware/arm,scmi.yaml), then we can
> > > > > > > > > > > > work on the Xen code that makes use of it.
> > > > > > > > > > > >
> > > > > > > > > > > > Does it make sense?
> > > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > Yes I agree. I think linux,scmi_mem and scmi_devid should be upstreamed.
> > > > > > > > > > > I will add those properties to arm,scmi.yaml, mark them as related to XEN and send patch.
> > > > > > > > > >
> > > > > > > > > > I didn't realize that linux,scmi_mem and scmi_devid are supposed to be
> > > > > > > > > > Xen specific. In general, it would be best not to introduce Xen specific
> > > > > > > > > > properties into generic bindings. It is a problem both from a
> > > > > > > > > > specification perspective (because it has hard to handle Xen specific
> > > > > > > > > > cases in fully generic bindings, especially as those bindings are
> > > > > > > > > > maintained as part of the Linux kernel) and from a user perspective
> > > > > > > > > > (because now the user has to deal with a Xen-specific dtb, or has to
> > > > > > > > > > modify the host dtb to add Xen-specific information by hand.)
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > Let me start from scmi_devid.  Why would scmi_devid be Xen-specific? It
> > > > > > > > > > looks like a generic property that should be needed for the Linux SCMI
> > > > > > > > > > driver too. Why the Linux driver doesn't need it?
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > scmi_devid used during domain build. It passed as input parameter for SCMI_BASE_SET_DEVICE_PERMISSIONS message.
> > > > > > > > > On non-virtualized systems - there is no need of this call, because OS
> > > > > > > > > is the only one entity, running on the system.
> > > > > > > >
> > > > > > > > OK. Even if it is only required for virtualized systems, I think that
> > > > > > > > scmi_devid is important enough that should be part of the upstream
> > > > > > > > binding. I think it is worth starting an email thread on the LKML with
> > > > > > > > Rob Herring and the SCMI maintainers to discuss the addition of
> > > > > > > > scmi_devid to the binding.
> > > > > > > >
> > > > > > > >
> > > > > > > > > I've chatted with Volodymyr_Babchuk and he gave a great idea to add a
> > > > > > > > > list of device_ids to dom.cfg, such as:
> > > > > > > > > sci_devs = [ 0, 1, 15, 35 ];
> > > > > > > > >
> > > > > > > > > Using this approach, we can remove scmi_devid from the device tree and
> > > > > > > > > just pass a list of scmi_devids to XEN using additional hypercall.
> > > > > > > > > We can probably make hypercall taking devid list as input parameter.
> > > > > > > > > This will take only 1 hypercall to setup sci permissions.
> > > > > > > >
> > > > > > > > But how would a user know which are the right SCMI IDs to add to the
> > > > > > > > sci_devs list? Would the user have to go and read the reference manual
> > > > > > > > of the platform to find the SCMI IDs and then write sci_devs by hand?
> > > > > > > > If that is the case, then I think that it would be better to add
> > > > > > > > scmi_devid to device tree.
> > > > > > > >
> > > > > > > > In general, I think this configuration should happen automatically
> > > > > > > > without user intervention. The user should just specify "enable SCMI"
> > > > > > > > and it should work.
> > > > > > > >
> > > > > > > >
> > > > > > > > > > In regards to linux,scmi_mem, I think it would be best to do without it
> > > > > > > > > > and fix the Linux SCMI driver if we need to do so. Xen should be able to
> > > > > > > > > > parse the native "arm,scmi-shmem" nodes and Linux (dom0 or domU) should
> > > > > > > > > > be able to parse the "arm,scmi-shmem" nodes generated by Xen. Either
> > > > > > > > > > way, I don't think we should need linux,scmi_mem.
> > > > > > > > >
> > > > > > > > > This requires further investigation. I will try to make implementation
> > > > > > > > > without linux,scmi_mem, using only arm,scmi-shmem nodes and share
> > > > > > > > > reuslts with you.
> > > > > > > >
> > > > > > > > OK, thanks.
> > > > > > >
> > > > > > > Hi Stefano,
> > > > > > >
> > > > > > > As I did some investigation about using reserved-memory area
> > > > > > > linux,scmi_mem and now I need your advice.
> > > > > > >
> > > > > > > I see 2 possible implementations for now:
> > > > > > > 1) Add memory-region parameter to cpu_scp_shm node which points to the
> > > > > > > reserved memory region.
> > > > > > > So device-tree will look like this:
> > > > > > >
> > > > > > > 	reserved-memory {
> > > > > > > 		/* reserved region for scmi channels*/
> > > > > > > 		scmi_memory: region@53FF0000{
> > > > > > > 			no-map;
> > > > > > > 			reg = <0x0 0x53FF0000 0x0 0x10000>;
> > > > > > > 		};
> > > > > > > 	};
> > > > > > > 	cpu_scp_shm: scp-shmem@0x53FF0000 {
> > > > > > > 		compatible = "arm,scmi-shmem";
> > > > > > > 		reg = <0x0 0x53FF0000 0x0 0x1000>;
> > > > > > > 		memory-region = <&scmi_memory>;
> > > > > > > 	};
> > > > > > >
> > > > > > > So cpu_scp_shm node has a reference to scmi_memory region. This mean
> > > > > > > that xen can find reserved memory region without adding additional names
> > > > > > > to the device-tree bindings.
> > > > > > > memory-region parameter as a reference to reserved memory and region
> > > > > > > creation described in:
> > > > > > > https://urldefense.com/v3/__https://github.com/torvalds/linux/blob/v5.15/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt__;!!GF_29dbcQIUBPA!k6x19x1gYF1CPlgAZj7std3ifqhq-9DXvuF0nwonNPUwMzZpYHYbrRJziJrgdFIOjyan$ [github[.]com]
> > > > > > >
> > > > > > > This approach I've implemented already and it works.
> > > > > >
> > > > > > This approach would require a discussion with the upstream device tree
> > > > > > maintainers. Likely, we would need to add a note about the usage of the
> > > > > > "memory-region" property to arm,scmi.yaml.
> > > > > >
> > > > > > Also, I have the feeling that they would ask to add the "memory-region"
> > > > > > property directly to the "arm,scmi-smc" node, as an alternative (or
> > > > > > in addition) to the existing "shmem" property.
> > > > > >
> > > > > > That said, from my point of view this approach is also a viable option.
> > > > > > I don't see any major problems.
> > > > > >
> > > > > > The main question (after reading everything else that you wrote below)
> > > > > > is whether the "arm,scmi-smc" node in this case could be automatically
> > > > > > generated.
> > > > > >
> > > > > 
> > > > > arm,scmi-smc node can be generated in both cases. I think I'd leave it
> > > > > as backup in case if the second approach will not work.
> > > > > 
> > > > > >
> > > > > > > 2) The second approach is the format you suggested:
> > > > > > > > > > > > reserved-memory {
> > > > > > > > > > > >     scp-shmem@0x53FF0000 {
> > > > > > > > > > > >         compatible = "arm,scmi-shmem";
> > > > > > > > > > > >         reg = <0x0 0x53FF0000 0x0 0x1000>;
> > > > > > > > > > > >     };
> > > > > > > > > > > >     scp-shmem@0x53FF1000 {
> > > > > > > > > > > >         compatible = "arm,scmi-shmem";
> > > > > > > > > > > >         reg = <0x0 0x53FF1000 0x0 0x1000>;
> > > > > > > > > > > >     };
> > > > > > > > > > > >     scp-shmem@0x53FF2000 {
> > > > > > > > > > > >         compatible = "arm,scmi-shmem";
> > > > > > > > > > > >         reg = <0x0 0x53FF2000 0x0 0x1000>;
> > > > > > > > > > > >     };
> > > > > > > > > > > >     ...
> > > > > > >
> > > > > > > This approach has an advantage that xen ARM_SCI driver do not know about
> > > > > > > how channels are placed in the reserved memory, but introduces some
> > > > > > > disadvantages:
> > > > > > > a) We provide extra 14 (in our case) arm,scmi-shmem nodes which are not used
> > > > > > > in the device-tree. In current implementation I have separate scmi.dtsi
> > > > > > > file which introduces scmi support for both XEN-based and
> > > > > > > non-virtualized systems. Having 14 extra channels in the device-tree may
> > > > > > > be confusing.
> > > > > >
> > > > > > I can see that while it would be ideal for Xen to see all 14+1 channels
> > > > > > in device tree (on the host device tree), we wouldn't want to expose all
> > > > > > of them to the domains, not even to dom0.
> > > > > >
> > > > > > How many channels do we want dom0 to see by the way? For this
> > > > > > discussion, I'll just assume for now that dom0 only sees 1 channel like
> > > > > > the domUs.
> > > > > 
> > > > > For dom0 we need only one channel.
> > > > > 
> > > > > >
> > > > > > Now we have a problem: how do we go about "filtering" the
> > > > > > "arm,scmi-shmem" device tree nodes? Which is also what you are asking
> > > > > > below in point b).
> > > > > >
> > > > > 
> > > > > Xen will not need to filter "arm,scmi-shmem" node. It will just
> > > > > create shmem node in Domain device-tree. I don't see any problem for xen
> > > > > configuration here.
> > > > > What bothers me here is that I set scmi configuration for platform dts,
> > > > > not for xen or domu dts files.
> > > > > So for example I have the following structure of the dts files for my
> > > > > platform (r8a77961-salvator-xs):
> > > > >  * r8a77961-scmi.dtsi - this file includes all scmi related nodes and set
> > > > > scmi_devid for the devices, that should use scmi.
> > > > >  * r8a77961-salvator-xs.dts - dts file which generates dtb for the platform.
> > > > > It includes r8a77961-scmi.dtsi so I populate scmi to platform dtb, which
> > > > > is used for system with no hypervisor.
> > > > >  * r8a77961-salvator-xs-xen.dts - dts file for xen which includes
> > > > > r8a77961-salvator-xs.dts and inherits scmi configuration from it.
> > > > >  * r8a77961-salvator-xs-domu.dts - dts file for DomU which includes
> > > > > r8a77961-salvator-xs.dts and inherits scmi configuration from it.
> > > > > 
> > > > > In this case r8a77961-salvator-xs.dtb r8a77961-salvator-xs-xen.dtb
> > > > > r8a77961-salvator-xs-domu.dtb files will inherit 14+1 channel.
> > > > > 
> > > > > I can give you a link to Merge request with this changes if you need it.
> > > > > 
> > > > > For xen and domu dtb it is not a problem because all "arm,scmi-shmem"
> > > > > nodes will be omitted and new will be generated for the domains.
> > > > > 
> > > > > What bothers me is that r8a77961-salvator-xs.dtb will have 14 unused channels.
> > > > > 
> > > > > Just got an idea while writing this: I can create only one
> > > > > "arm,scmi-shmem" node in r8a77961-scmi.dtsi and add 14 more nodes,
> > > > > needed for xen explicitly in r8a77961-salvator-xs-xen.dts.
> > > > > 
> > > > > Then we will have valid configurations for all cases.
> > > > > This can be a solution. What do you think?
> > > > 
> > > > It is good that you brought this up because it helps me explain what I
> > > > mean. And of course it is up to you where you place the nodes in the
> > > > various dts files at your disposal. Either way it would work but I think
> > > > they should belong to r8a77961-salvator-xs.dts.
> > > > 
> > > > Generally the platform vendor (e.g. Xilinx) provides a device tree
> > > > description of the platform to use including all the available resources
> > > > and firmware interfaces. In your case it would be r8a77961-scmi.dtsi +
> > > > r8a77961-salvator-xs.dts. This is what I call the "host device tree"
> > > > below. Users should be able to boot a fully functional system using the
> > > > host device tree pretty much "as is" to run Xen, Linux or any other
> > > > software.
> > > > 
> > > > Certainly the SCMI device tree description should be part of the host
> > > > device tree, so in your case it would be r8a77961-salvator-xs.dts. And
> > > > the description should include all 14+1 channels because this is the
> > > > generic platform description -- we cannot know for sure how the users
> > > > are going to use the system.
> > > > 
> > > > This is why r8a77961-salvator-xs-xen.dts should be as small as possible
> > > > or ideally inexistent. There shouldn't be a need for a special device
> > > > tree modification to allow Xen to run. In reality, even at Xilinx we
> > > > have something like r8a77961-salvator-xs-xen.dts, although it is really
> > > > small.
> > > > 
> > > > But I see that r8a77961-salvator-xs-xen.dts could be viewed as the
> > > > device tree additions to run hypervisors and from that point of view it
> > > > is more acceptable to place the 14 channels there.
> > > > 
> > > > The biggest problem is r8a77961-salvator-xs-domu.dts: who is going to
> > > > write it? And how? It wouldn't be provided by the platform vendor, so it
> > > > is the user the one that has to find a way to write it.
> > > > 
> > > > I know the user already has to write a partial DTB for device
> > > > assignment, but any time the process is more complex than "copy the host
> > > > device tree node for device XXX to the partial DTB" it is a problem.
> > > > Errors are made and the system doesn't work.
> > > > 
> > > > I think we don't want to make it even more difficult by having to
> > > > manually produce the SCMI domU description too. The SCMI description for
> > > > domU could be automatically generated by Xen, or libxl/xl. If that's an
> > > > issue, then the SCMI description could be automatically generated by an
> > > > external tool but I think it would make things more complex and harder
> > > > to maintain.
> > > > 
> > > > In short my point of view is:
> > > > - r8a77961-scmi.dtsi + r8a77961-salvator-xs.dts should be as generic as
> > > >   possible so the SCMI nodes should have 14+1 channels
> > > > - but putting the 14 channels in r8a77961-salvator-xs-xen.dts is still
> > > >   OKish
> > > > - it is important that r8a77961-salvator-xs-domu.dts is automatically
> > > >   generated by Xen or libxl or another software tool
> > > > 
> > > 
> > > Thank you for the detailed response. I'll put all 14+1 channels to
> > > r8a77961-salvator-xs.dts then.
> > > I've described my thoughts about generation of the arm,scmi-smc node below.
> > > 
> > > > 
> > > > > > > b) In case if we have all 15 channels, described in partial device-tree,
> > > > > >
> > > > > > I think you meant "described in the host device tree", right?
> > > > > >
> > > > > Yeah that's what I've meant.
> > > > > >
> > > > > > > we should not copy any node to the domain device-tree. I think it will
> > > > > > > be better to generate arm,scmi-shmem node in the Domain device-tree.
> > > > > >
> > > > > > Yes, I think it makes sense for Xen to generate the "arm,scmi-shmem"
> > > > > > device tree description for the DomU/Dom0 based on the channels
> > > > > > allocated to the domain.
> > > > > >
> > > > > >
> > > > > > > The problem is that arm,scmi-smc node, which is using arm,scmi-shmem
> > > > > > > node can't be generated. I prefer it to be copied from the partial
> > > > > > > device-tree because it includes some platform specific configuration,
> > > > > > > such as func-id and list of the protocols (for example different
> > > > > > > platforms may require different list of the protocols). So in this
> > > > > > > case we will have 1 node copied and 1 node generated.
> > > > > > >
> > > > > > > I think even for dom0less we should use arm,scmi-smc node from the
> > > > > > > device-tree because protocol configuration and funcid is related to the
> > > > > > > platform.
> > > > > >
> > > > > > I am not sure I understood what you wrote. You are saying that the
> > > > > > "arm,scmi-smc" node includes some platform specific configurations so
> > > > > > it cannot be automatically generated by Xen (or by the tools) and
> > > > > > instead it needs to be manually provided as part of the partial dtb for
> > > > > > the domU. Is that correct?
> > > > > >
> > > > > > If so, I would like to understand the reasons behind it. Manual
> > > > > > device tree editing is problematic.
> > > > > >
> > > > > > I looked for "func-id" in
> > > > > > Documentation/devicetree/bindings/firmware/arm,scmi.yaml but couldn't
> > > > > > find any results. Do you have an example of the platform specific
> > > > > > configuration or protocol configuration that would make it difficult to
> > > > > > automatically generate the "arm,scmi-smc" node for the domains?
> > > > > 
> > > > > Sorry, I used wrong term (used term from the specification), arm,smc-id
> > > > > of cause.
> > > > > 
> > > > > >
> > > > > > Also, is this a problem just for approach #2 or also for approach #1?
> > > > > > If it is a problem only for approach #2, then let's just go with
> > > > > > approach #1.
> > > > > >
> > > > > 
> > > > > We can't copy "arm,scmi-smc" in both approaches. The difference is that
> > > > > in the first approach we can copy both "arm,scmi-smc" and
> > > > > "arm,scmi-shmem" nodes while in the second approach we should copy
> > > > > "arm,scmi-smc", but we have to generate "arm,scmi-shmem" node.
> > > > > 
> > > > > arm,scmi-smc node can't be generated because it includes properties and
> > > > > configurations that depends from platform and should be get from the
> > > > > device tree.
> > > > > Here is "arm,scmi-smc" node expample:
> > > > > firmware {
> > > > >     scmi {
> > > > >         compatible = "arm,scmi-smc"
> > > > >         arm,smc-id = <0x82000002>;
> > > > >         shmem = <&cpu_scp_shm>;
> > > > >         #address-cells = <1>;
> > > > >         #size-cells = <0>;
> > > > >         scmi_power: protocol@11 {
> > > > >             reg = <0x11>;
> > > > >             #power-domain-cells = <1>;
> > > > >         };
> > > > > 
> > > > >         scmi_clock: protocol@14 {
> > > > >             ...
> > > > >         };
> > > > > 
> > > > >         scmi_reset: protocol@16 {
> > > > >             ...
> > > > >         };
> > > > >         ...
> > > > >     };
> > > > > };
> > > > > 
> > > > > It has 3 configurable options:
> > > > >  * arm,smc-id parameter, setting func_id for scmi protocol. This id can be
> > > > > different for different platforms.
> > > > > For example stm32mp1 architecture use different scm-id for different
> > > > > agents:
> > > > > https://urldefense.com/v3/__https://github.com/ARM-software/arm-trusted-firmware/blob/0586c41b3f2d52aae847b7212e7b0c7e19197ea2/plat/st/stm32mp1/include/stm32mp1_smc.h*L39__;Iw!!GF_29dbcQIUBPA!mTRUjtSg19iVaYo3Cgjop5ckPWqKsHVo1EZCEA1zCbod9KpNSXX291A8vAuNdTCr46MA$ [github[.]com]
> > > > > 
> > > > >  * shmem which includes phandle to arm,scmi-shmem node. But this is not
> > > > > a problem and can be updated.
> > > > > 
> > > > >  * list of the protocol subnodes. This is also configurable parameter,
> > > > > not regs or names, but the number of the protocols. For example onle
> > > > > platform can use power-domains/clock/resets via scmi, when another will
> > > > > require volage-control and sensor-management to be added.
> > > > > 
> > > > > Xen should know this parameters to be able to generate "arm,scmi-smc" node.
> > > > > 
> > > > > Also we're currently discussing new scmi protocol with ARM: Pinctrl over
> > > > > SCMI.
> > > > > 
> > > > > It should allow domains to access pinctrl subsystem, placed in Firmware
> > > > > through SCMI protocol.
> > > > > scmi_pinctrl node will look like this:
> > > > > 
> > > > > 	firmware {
> > > > > 		scmi {
> > > > > 			...
> > > > > 			scmi_pinctrl: protocol@18 {
> > > > > 				reg = <0x18>;
> > > > > 				#pinctrl-cells = <0>;
> > > > > 
> > > > > 				i2c2_pins: i2c2 {
> > > > > 					groups = <74>; /* i2c2_a */
> > > > > 					function = <15>; /* i2c2 */
> > > > > 				};
> > > > > 
> > > > > 				irq0_pins: irq0 {
> > > > > 					groups = <81>; /* intc_ex_irq0 */
> > > > > 					function = <19>; /* intc_ex */
> > > > > 				};
> > > > > 
> > > > > 				avb_pins: avb {
> > > > > 					mux {
> > > > > 						/* avb_link, avb_mdio, avb_mii */
> > > > > 						groups = <17>, <21>, <22>;
> > > > > 						function = <1>; /* avb */
> > > > > 					};
> > > > > 
> > > > > 					pins_mdio {
> > > > > 						groups = <21>; /* avb_mdio */
> > > > > 						drive-strength = <24>;
> > > > > 					};
> > > > > 
> > > > > 					pins_mii_tx {
> > > > > 						/* PIN_AVB_TX_CTL, PIN_AVB_TXC, PIN_AVB_TD0,
> > > > > 						       PIN_AVB_TD1, PIN_AVB_TD2, PIN_AVB_TD3 */
> > > > > 						pins = <242>, <240>, <236>, <237>, <238>, <239>;
> > > > > 						drive-strength = <12>;
> > > > > 					};
> > > > > 				};
> > > > > 				...
> > > > > 			};
> > > > > 		};
> > > > > 	};
> > > > > 
> > > > > So "arm,scmi-smc" node will have even more platform specific settings.
> > > > > 
> > > > > >
> > > > > > > I prefer the second approach and will try to make it if it's OK to copy
> > > > > > > arm,scmi-smc node from partial Device-tree and generate arm,scmi-shmem
> > > > > > > node.
> > > > > > >
> > > > > > > What do you think about that?
> > > > > >
> > > > > > From a device tree specification perspective, I think both approaches
> > > > > > are OK (with a minor comment on the first approach as I wrote above.)
> > > > > >
> > > > > > But from a Xen perspective I think it is important that we don't require
> > > > > > the user to manually provide the SCMI configuration in the partial DTB.
> > > > > > It would be better if we could generate it automatically from Xen or the
> > > > > > tools (or even an independent script). Or copy the "arm,scmi-smc" node
> > > > > > from the host device tree to the domU device tree without modifications.
> > > > > 
> > > > > I think copy "arm,scmi-smc" node is the only option we have.
> > > > > I'm not sure what do you mean under "host device tree" if you mean Xen
> > > > > device-tree - then I think it will not cover the case with stm32mp1 I've
> > > > > mentioned above. I think it will be better to copy "arm,scmi-smc" node
> > > > > from Domu partial Device-tree to Domu device-tree.
> > > > > So AGENT0 smc-id will be set in xen device-tree and copied to dom0 and
> > > > > AGENT1 scm-is set in domu device-tree and copied to dom-u.
> > > > > 
> > > > > Do you agree with my points?
> > > > 
> > > > I think we are saying similar things, but we are getting mixed up with
> > > > the terminology. Let's start from the basics :-)
> > > > 
> > > > # Host device tree
> > > > The device tree given to Xen at boot time. This is the device tree that
> > > > Xen parses to discover what's available on the platform. In your case,
> > > > it seems to include r8a77961-salvator-xs-xen.dts.
> > > > 
> > > > # Partial DTB
> > > > (Ignoring Dom0less) this is the small DTB that gets passed to xl with
> > > > the "device_tree" option in the xl config file. It is copied verbatim
> > > > to the domU device tree by xl/libxl.
> > > > 
> > > > # Copy the "arm,scmi-smc" node from host device tree
> > > > This means that the domU "arm,scmi-smc" node is an exact copy of the
> > > > host device tree SCMI node. I don't think this is actually possible in
> > > > most cases because the domU description is typically a bit different
> > > > from the host description. For instance, the host description could
> > > > include 14+1 channels while the domU description should only include 1
> > > > channel.
> > > > 
> > > > # Copy the "arm,scmi-smc" node from the partial DTB
> > > > This implies that somebody or something create an "arm,scmi-smc" node
> > > > for the domU and placed it into the partial DTB. Then, Xen and/or
> > > > xl/libxl will copy the node from the partial DTB to the DomU device
> > > > tree. The main question in this case is: who is going to write the
> > > > partial DTB? We dont want the user (i.e. a person) to have to manually
> > > > write the SCMI description for the domU. It should be an automated tools
> > > > that does it. At that point, it is easier if it is Xen or xl/libxl.
> > > > Alternativaly, we could think of an external tool but I think it would
> > > > make things more difficult to maintain.
> > > > 
> > > > # Generate the "arm,scmi-smc" node for domUs
> > > > When I write "generate the arm,scmi-smc node", I mean that Xen and
> > > > libxl/xl will generate the "arm,scmi-smc" node for the domU. Thus, the
> > > > node will not be copied from the partial DTB or from the device tree,
> > > > instead, it should be created directly by Xen and/or libxl/xl.
> > > > 
> > > > However, the domU "arm,scmi-smc" node could still be derived from the
> > > > host device tree "arm,scmi-smc" node. In other words, Xen or xl/libxl
> > > > would look at the host device tree "arm,scmi-smc" node, copy it to the
> > > > domU device tree while making as many changes as necessary.
> > > > 
> > > > The DomU "arm,scmi-smc" node doesn't have to be entirely fake and
> > > > static. It could be dynamically created to match the host device tree
> > > > description. I think this is the best option.
> > > > 
> > > > 
> > > > # Conclusion
> > > > I am suggesting that Xen and/or libxl automatically produce the
> > > > "arm,scmi-smc" node for domUs based on the host device tree description
> > > > and based on the channel mapped to the domU. This way, the user (a
> > > > person) doesn't have to go and manually edit the domU partial DTB.
> > > > 
> > > 
> > > That sounds reasonable. The problem is that arm,scmi-smc node can be
> > > copmlicated and include a lot of configuration. Also for different
> > > mediators this node can be different.
> > > As I inderstand, there is no mechanism for xl to access host device-tree
> > > right now. Correct me if I'm wrong.
> > 
> > Yes, you are right. And the lack of a mechanism for xl to access the
> > host device tree is a problem.
> > 
> > 
> > > I see the following way we can generate arm,scmi-smc node for DomU:
> > > We say that if scmi-smc mediator is enabled - then Dom0 is configured to
> > > use SCMI. This means that Dom0 device-tree will have arm,scmi-smc node
> > > and it can be reached from the userspace.
> > 
> > So far so good
> > 
> > 
> > > In this case xl can use infromation from /proc/device-tree/firmware/scmi
> > > to generate arm,scmi-smc node for DomU. But in this case xl should know
> > > the exact path of scmi node.
> > > 
> > > Or we can generate some special node, called "shared" in Dom0 device-tree
> > > which will include copy of the arm,scmi-smc node, which can be used for domains.
> > > In this case xl can scan /proc/device-tree/shared node and find
> > > arm,scmi-smc copatible node and use it to generate arm,scmi-smc node for
> > > DomU.
> > > Also this can be used for another features in future.
> > > 
> > > What do you think about this?
> > 
> > Basing the domU SCMI node generation on the dom0 SCMI node is not great,
> > because it should be based on the host device tree rather than dom0 and
> > the dom0 SCMI description will be different.
> > 
> > Instead of copying just the host SCMI node somewhere in the dom0 device
> > tree so that xl/libxl can access it via /proc/device-tree, I think it
> > would be better to make the full host DTB available to xl/libxl.
> > 
> > There are probably many ways to do this, but there are a couple I can
> > think of on top of my head:
> > 
> > - introduce a new hypercall to get the full host dtb from Xen
> > The hypercall would pass an address and a size in guest physical memory
> > and Xen would copy the host DTB to it.
> > 
> > - introduce something like /proc/device-tree to hypfs
> > See xen/common/hypfs.c
> 
> 
> Hi Stefano,
> 
> I've found the discussion, indirectly related to our topic [1], in which
> hypervisor <-> toolchain interface topic was raised.
> 
> Where Andrii Anisov proposed to introduce another libxl type (f.e. File) which
> will read device tree file and operate with a binary blob.
> 
> His idea is to introduce new Domctl hypecall, which is able to send device-tree
> blob from toolstack to the hypervisor.
> I was thinking about using his approach, but in opposite direction.
> Such as introduce a set of DOMCTL, which gives ability for xl user to request
> Host Device-tree nodes.
> I see something like that:
> XEN_DOMCTL_host_node_by_path - gets node path as input and returns blob with node;
> XEN_DOMCTL_find_host_compatible_node - gets compatible string and "skip" number
> for the case if there is more than 1 compatible node and returns blob with node.
> 
> Advandages for my sight are:
> - I hope Andrii still has some code, which can be reused during the implementation;
> - Xen can determine if the requesting node can be exposed to the guest, which
> is additional layer of validation;
> - no need to transfer all device-tree to the toolstack.
> 
> As for the hypfs this sounds like a separate feature to me. I'm not sure if we
> need to provide the entire copy of the device-tree. Also there could be some
> problems with this solution.
> For example, xl tool have to scan whole hypfs tree to find node by phandle or
> by compatible string.
> 
> Looking forward for your thoughts about that. Also I would be happy if Julien
> could share his vision.
> 
> [1] https://xen.markmail.org/search/?q=from%3AAndrii+Anisov+device-tree#query:from%3AAndrii%20Anisov%20device-tree+page:2+mid:tvgyp7fzpiyyso3j+state:results

It looks like XEN_DOMCTL_host_node_by_path and
XEN_DOMCTL_find_host_compatible_node would also solve the problem but I
think that a single hypercall that retrieves the entire host DTB would
be easier to implement and more robust in the long term.

hypfs has the advantage that it would create an interface more similar
to the one people are already used to on Linux systems
(/proc/device-tree). xl/libxl would have to scan the whole hypfs tree,
which intuitively I think it would be slower. Also the feature might be
harder to implement but I am not sure.

I don't have a strong preference and this is not a stable interface (we
don't have to be extra paranoid about forward and backward
compatibility). So I am fine either way. Let's see what the others think
as well.

