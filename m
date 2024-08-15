Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D5B9526EC
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2024 02:31:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777771.1187851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seOOM-00040A-Sj; Thu, 15 Aug 2024 00:31:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777771.1187851; Thu, 15 Aug 2024 00:31:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seOOM-0003xl-Pb; Thu, 15 Aug 2024 00:31:02 +0000
Received: by outflank-mailman (input) for mailman id 777771;
 Thu, 15 Aug 2024 00:31:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7zbS=PO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1seOOL-0003xd-RW
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2024 00:31:01 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3d4e271-5a9d-11ef-8776-851b0ebba9a2;
 Thu, 15 Aug 2024 02:30:58 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6493061D28;
 Thu, 15 Aug 2024 00:30:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95437C116B1;
 Thu, 15 Aug 2024 00:30:55 +0000 (UTC)
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
X-Inumbo-ID: a3d4e271-5a9d-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723681857;
	bh=ecw7tX4Vobo53DUaAja97qvW/PTv+6irWz+Rprva9Ck=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ovhf8xU5CW4LqYFoLqv7te1xkr4Li2A0iIF/GEO9jwbT4ymYQvUkx9471wi+YWjEo
	 mmcJ02kD4yDxS1fgDQ3SA2a41v19c9PmrT6qOWEPy+jnay54HH9RzsrM550e0G709P
	 A1P0I4AlaJfmxTkDqL1ARYo2ABdicA0ABHEyvG459RuiPpD0u4mnWCkB8u6LxJ7zv0
	 grn2J4V4W9uQzFsH5oEzqQJru5fV2GsLyLhZlG8NP1J6efvB2jAG35/78AZSGWZn1t
	 lVFf3+QVpDPcf14aZXOEKcbmwK59xr3laKGVzh/0p73YWGfUgwBu4L1skzkTVw0jS+
	 YucdMaN6N7oiQ==
Date: Wed, 14 Aug 2024 17:30:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org, 
    anthony@xenproject.org, paul@xen.org, peter.maydell@linaro.org, 
    alex.bennee@linaro.org, xenia.ragiadakou@amd.com, jason.andryuk@amd.com, 
    edgar.iglesias@amd.com, xen-devel@lists.xenproject.org, 
    qemu-arm@nongnu.org, andrew.cooper3@citrix.com
Subject: Re: [PATCH v1 04/10] hw/arm: xenpvh: Add support for SMP guests
In-Reply-To: <ZryZwOoadeb1UWK8@zapote>
Message-ID: <alpine.DEB.2.22.394.2408141719400.298534@ubuntu-linux-20-04-desktop>
References: <20240812130606.90410-1-edgar.iglesias@gmail.com> <20240812130606.90410-5-edgar.iglesias@gmail.com> <alpine.DEB.2.22.394.2408121650590.298534@ubuntu-linux-20-04-desktop> <ZruRm34zIMtUm7oH@zapote> <alpine.DEB.2.22.394.2408131550080.298534@ubuntu-linux-20-04-desktop>
 <ZryZwOoadeb1UWK8@zapote>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 14 Aug 2024, Edgar E. Iglesias wrote:
> On Tue, Aug 13, 2024 at 03:52:32PM -0700, Stefano Stabellini wrote:
> > On Tue, 13 Aug 2024, Edgar E. Iglesias wrote:
> > > On Mon, Aug 12, 2024 at 06:47:17PM -0700, Stefano Stabellini wrote:
> > > > On Mon, 12 Aug 2024, Edgar E. Iglesias wrote:
> > > > > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> > > > > 
> > > > > Add SMP support for Xen PVH ARM guests. Create max_cpus ioreq
> > > > > servers to handle hotplug.
> > > > > 
> > > > > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > > > > ---
> > > > >  hw/arm/xen_arm.c | 5 +++--
> > > > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
> > > > > index 5f75cc3779..ef8315969c 100644
> > > > > --- a/hw/arm/xen_arm.c
> > > > > +++ b/hw/arm/xen_arm.c
> > > > > @@ -173,7 +173,7 @@ static void xen_arm_init(MachineState *machine)
> > > > >  
> > > > >      xen_init_ram(machine);
> > > > >  
> > > > > -    xen_register_ioreq(xam->state, machine->smp.cpus, &xen_memory_listener);
> > > > > +    xen_register_ioreq(xam->state, machine->smp.max_cpus, &xen_memory_listener);
> > > > >  
> > > > >      xen_create_virtio_mmio_devices(xam);
> > > > >  
> > > > > @@ -218,7 +218,8 @@ static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
> > > > >      MachineClass *mc = MACHINE_CLASS(oc);
> > > > >      mc->desc = "Xen PVH ARM machine";
> > > > >      mc->init = xen_arm_init;
> > > > > -    mc->max_cpus = 1;
> > > > > +    /* MAX number of vcpus supported by Xen.  */
> > > > > +    mc->max_cpus = GUEST_MAX_VCPUS;
> > > > 
> > > > Will this cause allocations of data structures with 128 elements?
> > > > Looking at hw/xen/xen-hvm-common.c:xen_do_ioreq_register it seems
> > > > possible? Or hw/xen/xen-hvm-common.c:xen_do_ioreq_register is called
> > > 
> > > Yes, in theory there's probably overhead with this but as you correctly
> > > noted below, a PVH aware xl will set the max_cpus option to a lower value.
> > > 
> > > With a non-pvh aware xl, I was a little worried about the overhead
> > > but I couldn't see any visible slow-down on ARM neither in boot or in network
> > > performance (I didn't run very sophisticated benchmarks).
> >  
> > What do you mean by "non-pvh aware xl"? All useful versions of xl
> > support pvh?
> 
> 
> I mean an xl without our PVH patches merged.
> xl in upstream doesn't know much about PVH yet.
> Even for ARM, we're still carrying significant patches in our tree.
 
Oh I see. In that case, I don't think we need to support "non-pvh aware xl".

 
> > > > later on with the precise vCPU value which should be provided to QEMU
> > > > via the -smp command line option
> > > > (tools/libs/light/libxl_dm.c:libxl__build_device_model_args_new)?
> > > 
> > > Yes, a pvh aware xl will for example pass -smp 2,maxcpus=4 based on
> > > values from the xl.cfg. If the user doesn't set maxvcpus in xl.cfg, xl
> > > will set maxvcpus to the same value as vcpus.
> > 
> > OK good. In that case if this is just an initial value meant to be
> > overwritten, I think it is best to keep it as 1.
> 
> Sorry but that won't work. I think the confusion here may be that
> it's easy to mix up mc->max_cpus and machine->smp.max_cpus, these are
> not the same. They have different purposes.
> 
> I'll try to clarify the 3 values in play.
> 
> machine-smp.cpus:
> Number of guest vcpus active at boot.
> Passed to QEMU via the -smp command-line option.
> We don't use this value in QEMU's ARM PVH machines.
> 
> machine->smp.max_cpus:
> Max number of vcpus that the guest can use (equal or larger than machine-smp.cpus).
> Will be set by xl via the "-smp X,maxcpus=Y" command-line option to QEMU.
> Taken from maxvcpus from xl.cfg, same as XEN_DMOP_nr_vcpus.
> This is what we use for xen_register_ioreq().
> 
> mc->max_cpus:
> Absolute MAX in QEMU used to cap the -smp command-line options.
> If xl tries to set -smp (machine->smp.max_cpus) larger than this, QEMU will bail out.
> Used to setup xen_register_ioreq() ONLY if -smp maxcpus was NOT set (i.e by a non PVH aware xl).
> Cannot be 1 because that would limit QEMU to MAX 1 vcpu.
> 
> I guess we could set mc->max_cpus to what XEN_DMOP_nr_vcpus returns but I'll
> have to check if we can even issue that hypercall this early in QEMU since
> mc->max_cpus is setup before we even parse the machine options. We may
> not yet know what domid we're attaching to yet.
 
If mc->max_cpus is the absolute max and it will not be used if -smp is
passed to QEMU, then I think it is OK to use GUEST_MAX_VCPUS

