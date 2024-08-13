Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE97C950FE5
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 00:53:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776686.1186854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1se0Ne-00033H-3I; Tue, 13 Aug 2024 22:52:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776686.1186854; Tue, 13 Aug 2024 22:52:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1se0Ne-00030M-0O; Tue, 13 Aug 2024 22:52:42 +0000
Received: by outflank-mailman (input) for mailman id 776686;
 Tue, 13 Aug 2024 22:52:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jgOn=PM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1se0Nc-00030F-9E
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 22:52:40 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbf4147b-59c6-11ef-a505-bb4a2ccca743;
 Wed, 14 Aug 2024 00:52:38 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C4AFB61903;
 Tue, 13 Aug 2024 22:52:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E19E9C32782;
 Tue, 13 Aug 2024 22:52:33 +0000 (UTC)
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
X-Inumbo-ID: bbf4147b-59c6-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723589555;
	bh=/9E0bV+7de54mixbbQS3JvL8Qj9PklPehoTxAy+Sxcs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=B8dh8xal5x36LJnouHDGBoZOprSPE9UDE4eH0Q/ZwWwldb5GrwYDoTu3tOERwkW+Z
	 zald+nejF3aLYlmCP16dQnesfsPyW4n7lDlpBSNRwEK0QAoltX1DZKJUJGeM+/EfDQ
	 1yR9keeLxcHP6j+DHnJpN3JxuuT9o0tx4qgEnrGZ9ywn7X+w7SvT6dT3CcQYqGni/a
	 a69w5E7GxY600EBu0uRdpwZMungKU3eOAfu9iIqnSj9A5cMM+XCDeQZ+i6875UpKkZ
	 UkNPVmVjO5hAlOjmqnco2uKDtyYYxwdVBGbHhL2Ur2kwM+JP83XC0JC2jWkmncBK5H
	 hTgdDZva1rHfg==
Date: Tue, 13 Aug 2024 15:52:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org, 
    anthony@xenproject.org, paul@xen.org, peter.maydell@linaro.org, 
    alex.bennee@linaro.org, xenia.ragiadakou@amd.com, jason.andryuk@amd.com, 
    edgar.iglesias@amd.com, xen-devel@lists.xenproject.org, 
    qemu-arm@nongnu.org
Subject: Re: [PATCH v1 04/10] hw/arm: xenpvh: Add support for SMP guests
In-Reply-To: <ZruRm34zIMtUm7oH@zapote>
Message-ID: <alpine.DEB.2.22.394.2408131550080.298534@ubuntu-linux-20-04-desktop>
References: <20240812130606.90410-1-edgar.iglesias@gmail.com> <20240812130606.90410-5-edgar.iglesias@gmail.com> <alpine.DEB.2.22.394.2408121650590.298534@ubuntu-linux-20-04-desktop> <ZruRm34zIMtUm7oH@zapote>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 13 Aug 2024, Edgar E. Iglesias wrote:
> On Mon, Aug 12, 2024 at 06:47:17PM -0700, Stefano Stabellini wrote:
> > On Mon, 12 Aug 2024, Edgar E. Iglesias wrote:
> > > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> > > 
> > > Add SMP support for Xen PVH ARM guests. Create max_cpus ioreq
> > > servers to handle hotplug.
> > > 
> > > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > > ---
> > >  hw/arm/xen_arm.c | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
> > > index 5f75cc3779..ef8315969c 100644
> > > --- a/hw/arm/xen_arm.c
> > > +++ b/hw/arm/xen_arm.c
> > > @@ -173,7 +173,7 @@ static void xen_arm_init(MachineState *machine)
> > >  
> > >      xen_init_ram(machine);
> > >  
> > > -    xen_register_ioreq(xam->state, machine->smp.cpus, &xen_memory_listener);
> > > +    xen_register_ioreq(xam->state, machine->smp.max_cpus, &xen_memory_listener);
> > >  
> > >      xen_create_virtio_mmio_devices(xam);
> > >  
> > > @@ -218,7 +218,8 @@ static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
> > >      MachineClass *mc = MACHINE_CLASS(oc);
> > >      mc->desc = "Xen PVH ARM machine";
> > >      mc->init = xen_arm_init;
> > > -    mc->max_cpus = 1;
> > > +    /* MAX number of vcpus supported by Xen.  */
> > > +    mc->max_cpus = GUEST_MAX_VCPUS;
> > 
> > Will this cause allocations of data structures with 128 elements?
> > Looking at hw/xen/xen-hvm-common.c:xen_do_ioreq_register it seems
> > possible? Or hw/xen/xen-hvm-common.c:xen_do_ioreq_register is called
> 
> Yes, in theory there's probably overhead with this but as you correctly
> noted below, a PVH aware xl will set the max_cpus option to a lower value.
> 
> With a non-pvh aware xl, I was a little worried about the overhead
> but I couldn't see any visible slow-down on ARM neither in boot or in network
> performance (I didn't run very sophisticated benchmarks).
 
What do you mean by "non-pvh aware xl"? All useful versions of xl
support pvh?

> > later on with the precise vCPU value which should be provided to QEMU
> > via the -smp command line option
> > (tools/libs/light/libxl_dm.c:libxl__build_device_model_args_new)?
> 
> Yes, a pvh aware xl will for example pass -smp 2,maxcpus=4 based on
> values from the xl.cfg. If the user doesn't set maxvcpus in xl.cfg, xl
> will set maxvcpus to the same value as vcpus.

OK good. In that case if this is just an initial value meant to be
overwritten, I think it is best to keep it as 1.

