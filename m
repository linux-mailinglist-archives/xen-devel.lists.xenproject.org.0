Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D637430B0
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 00:44:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557187.870310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF0N0-0006Po-QR; Thu, 29 Jun 2023 22:44:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557187.870310; Thu, 29 Jun 2023 22:44:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF0N0-0006Nq-Nf; Thu, 29 Jun 2023 22:44:10 +0000
Received: by outflank-mailman (input) for mailman id 557187;
 Thu, 29 Jun 2023 22:44:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XWGL=CR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qF0Mz-0006Nk-Vr
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 22:44:09 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74a85810-16ce-11ee-b237-6b7b168915f2;
 Fri, 30 Jun 2023 00:44:08 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A972760F8C;
 Thu, 29 Jun 2023 22:44:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E260C433C0;
 Thu, 29 Jun 2023 22:44:05 +0000 (UTC)
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
X-Inumbo-ID: 74a85810-16ce-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688078646;
	bh=9filNv0J2cotGulkPBa7/YioCxziO3ygn5pSV3LDoq0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TUm4SyCcjZ83+JixEE8t+MVWjHfHLxLRtxWkxEYXUK/FC29xUwYMZr164TfXb/o7l
	 DSf2nooqn4mdBSBvFI9YBcb++QposdQYmMS6Kmw4+TPHybuhquS6C37FsX5sj6QRNF
	 n01sUX9c4ly6/U3EUjVFrTv69H/VODKAyFtPAUeoFY0D3oLRHqLZsY+szcW0/KLLoB
	 AEGzzBcIMdWne1tiVGLsFoqGONGecZpnoSjTMrfzytsghgnueDwCud3AmUnUYMr6PX
	 Nc3cGRZ37zkYvtxEWxpnx4+/A3mju1BkrmKzOYv47C2DtOxRXrAPt8I3V289unjdpz
	 +2Q7Bb0KcE06w==
Date: Thu, 29 Jun 2023 15:44:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Petr Pavlu <petr.pavlu@suse.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
    "jgross@suse.com" <jgross@suse.com>, vikram.garhwal@amd.com
Subject: Re: [PATCH 2/2] xen/virtio: Avoid use of the dom0 backend in dom0
In-Reply-To: <b21398eb-2fb2-4fca-dd90-d2c81d8df1c4@epam.com>
Message-ID: <alpine.DEB.2.22.394.2306291502150.3936094@ubuntu-linux-20-04-desktop>
References: <20230621131214.9398-1-petr.pavlu@suse.com> <20230621131214.9398-3-petr.pavlu@suse.com> <15e31609-6c45-7372-76ee-0adf7a64fe88@epam.com> <alpine.DEB.2.22.394.2306281745010.3936094@ubuntu-linux-20-04-desktop>
 <b21398eb-2fb2-4fca-dd90-d2c81d8df1c4@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 29 Jun 2023, Oleksandr Tyshchenko wrote:
> On 29.06.23 04:00, Stefano Stabellini wrote:
> 
> Hello Stefano
> 
> > On Wed, 21 Jun 2023, Oleksandr Tyshchenko wrote:
> >> On 21.06.23 16:12, Petr Pavlu wrote:
> >>
> >>
> >> Hello Petr
> >>
> >>
> >>> When attempting to run Xen on a QEMU/KVM virtual machine with virtio
> >>> devices (all x86_64), dom0 tries to establish a grant for itself which
> >>> eventually results in a hang during the boot.
> >>>
> >>> The backtrace looks as follows, the while loop in __send_control_msg()
> >>> makes no progress:
> >>>
> >>>     #0  virtqueue_get_buf_ctx (_vq=_vq@entry=0xffff8880074a8400, len=len@entry=0xffffc90000413c94, ctx=ctx@entry=0x0 <fixed_percpu_data>) at ../drivers/virtio/virtio_ring.c:2326
> >>>     #1  0xffffffff817086b7 in virtqueue_get_buf (_vq=_vq@entry=0xffff8880074a8400, len=len@entry=0xffffc90000413c94) at ../drivers/virtio/virtio_ring.c:2333
> >>>     #2  0xffffffff8175f6b2 in __send_control_msg (portdev=<optimized out>, port_id=0xffffffff, event=0x0, value=0x1) at ../drivers/char/virtio_console.c:562
> >>>     #3  0xffffffff8175f6ee in __send_control_msg (portdev=<optimized out>, port_id=<optimized out>, event=<optimized out>, value=<optimized out>) at ../drivers/char/virtio_console.c:569
> >>>     #4  0xffffffff817618b1 in virtcons_probe (vdev=0xffff88800585e800) at ../drivers/char/virtio_console.c:2098
> >>>     #5  0xffffffff81707117 in virtio_dev_probe (_d=0xffff88800585e810) at ../drivers/virtio/virtio.c:305
> >>>     #6  0xffffffff8198e348 in call_driver_probe (drv=0xffffffff82be40c0 <virtio_console>, drv=0xffffffff82be40c0 <virtio_console>, dev=0xffff88800585e810) at ../drivers/base/dd.c:579
> >>>     #7  really_probe (dev=dev@entry=0xffff88800585e810, drv=drv@entry=0xffffffff82be40c0 <virtio_console>) at ../drivers/base/dd.c:658
> >>>     #8  0xffffffff8198e58f in __driver_probe_device (drv=drv@entry=0xffffffff82be40c0 <virtio_console>, dev=dev@entry=0xffff88800585e810) at ../drivers/base/dd.c:800
> >>>     #9  0xffffffff8198e65a in driver_probe_device (drv=drv@entry=0xffffffff82be40c0 <virtio_console>, dev=dev@entry=0xffff88800585e810) at ../drivers/base/dd.c:830
> >>>     #10 0xffffffff8198e832 in __driver_attach (dev=0xffff88800585e810, data=0xffffffff82be40c0 <virtio_console>) at ../drivers/base/dd.c:1216
> >>>     #11 0xffffffff8198bfb2 in bus_for_each_dev (bus=<optimized out>, start=start@entry=0x0 <fixed_percpu_data>, data=data@entry=0xffffffff82be40c0 <virtio_console>,
> >>>         fn=fn@entry=0xffffffff8198e7b0 <__driver_attach>) at ../drivers/base/bus.c:368
> >>>     #12 0xffffffff8198db65 in driver_attach (drv=drv@entry=0xffffffff82be40c0 <virtio_console>) at ../drivers/base/dd.c:1233
> >>>     #13 0xffffffff8198d207 in bus_add_driver (drv=drv@entry=0xffffffff82be40c0 <virtio_console>) at ../drivers/base/bus.c:673
> >>>     #14 0xffffffff8198f550 in driver_register (drv=drv@entry=0xffffffff82be40c0 <virtio_console>) at ../drivers/base/driver.c:246
> >>>     #15 0xffffffff81706b47 in register_virtio_driver (driver=driver@entry=0xffffffff82be40c0 <virtio_console>) at ../drivers/virtio/virtio.c:357
> >>>     #16 0xffffffff832cd34b in virtio_console_init () at ../drivers/char/virtio_console.c:2258
> >>>     #17 0xffffffff8100105c in do_one_initcall (fn=0xffffffff832cd2e0 <virtio_console_init>) at ../init/main.c:1246
> >>>     #18 0xffffffff83277293 in do_initcall_level (command_line=0xffff888003e2f900 "root", level=0x6) at ../init/main.c:1319
> >>>     #19 do_initcalls () at ../init/main.c:1335
> >>>     #20 do_basic_setup () at ../init/main.c:1354
> >>>     #21 kernel_init_freeable () at ../init/main.c:1571
> >>>     #22 0xffffffff81f64be1 in kernel_init (unused=<optimized out>) at ../init/main.c:1462
> >>>     #23 0xffffffff81001f49 in ret_from_fork () at ../arch/x86/entry/entry_64.S:308
> >>>     #24 0x0000000000000000 in ?? ()
> >>>
> >>> Fix the problem by preventing xen_grant_init_backend_domid() from
> >>> setting dom0 as a backend when running in dom0.
> >>>
> >>> Fixes: 035e3a4321f7 ("xen/virtio: Optimize the setup of "xen-grant-dma" devices")
> >>
> >>
> >> I am not 100% sure whether the Fixes tag points to precise commit. If I
> >> am not mistaken, the said commit just moves the code in the context
> >> without changing the logic of CONFIG_XEN_VIRTIO_FORCE_GRANT, this was
> >> introduced before.
> >>
> >>
> >>> Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
> >>> ---
> >>>    drivers/xen/grant-dma-ops.c | 4 +++-
> >>>    1 file changed, 3 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
> >>> index 76f6f26265a3..29ed27ac450e 100644
> >>> --- a/drivers/xen/grant-dma-ops.c
> >>> +++ b/drivers/xen/grant-dma-ops.c
> >>> @@ -362,7 +362,9 @@ static int xen_grant_init_backend_domid(struct device *dev,
> >>>    	if (np) {
> >>>    		ret = xen_dt_grant_init_backend_domid(dev, np, backend_domid);
> >>>    		of_node_put(np);
> >>> -	} else if (IS_ENABLED(CONFIG_XEN_VIRTIO_FORCE_GRANT) || xen_pv_domain()) {
> >>> +	} else if ((IS_ENABLED(CONFIG_XEN_VIRTIO_FORCE_GRANT) ||
> >>> +		    xen_pv_domain()) &&
> >>> +		   !xen_initial_domain()) {
> >>
> >> The commit lgtm, just one note:
> >>
> >>
> >> I would even bail out early in xen_virtio_restricted_mem_acc() instead,
> >> as I assume the same issue could happen on Arm with DT (although there
> >> we don't guess the backend's domid, we read it from DT and quite
> >> unlikely we get Dom0 being in Dom0 with correct DT).
> >>
> >> Something like:
> >>
> >> @@ -416,6 +421,10 @@ bool xen_virtio_restricted_mem_acc(struct
> >> virtio_device *dev)
> >>    {
> >>           domid_t backend_domid;
> >>
> >> +       /* Xen grant DMA ops are not used when running as initial domain */
> >> +       if (xen_initial_domain())
> >> +               return false;
> >> +
> >>           if (!xen_grant_init_backend_domid(dev->dev.parent,
> >> &backend_domid)) {
> >>                   xen_grant_setup_dma_ops(dev->dev.parent, backend_domid);
> >>                   return true;
> >> (END)
> >>
> >>
> >>
> >> If so, that commit subject would need to be updated accordingly.
> >>
> >> Let's see what other reviewers will say.
> > 
> > This doesn't work in all cases. Imagine using PCI Passthrough to assign
> > a "physical" virtio device to a domU. The domU will run into the same
> > error, right?
> > 
> > The problem is that we need a way for the virtio backend to advertise
> > its ability of handling grants. Right now we only have a way to do with
> > that with device tree on ARM. On x86, we only have
> > CONFIG_XEN_VIRTIO_FORCE_GRANT, and if we take
> > CONFIG_XEN_VIRTIO_FORCE_GRANT at face value, it also enables grants for
> > "physical" virtio devices. Note that in this case we are fixing a
> > nested-virtualization bug, but there are actually physical
> > virtio-compatible devices out there. CONFIG_XEN_VIRTIO_FORCE_GRANT will
> > break those too.
> 
> 
> If these "physical" virtio devices are also spawned by
> drivers/virtio/virtio.c:virtio_dev_probe(), then yes, otherwise I don't 
> see how this could even be possible, but I might miss something here.

Yes, I would imagine virtio_dev_probe() would be called for them too



> xen_virtio_restricted_mem_acc() gets called indirectly from 
> virtio_dev_probe()->virtio_features_ok()->
> virtio_check_mem_acc_cb(). So the Xen grant DMA ops are only installed 
> for those.
>
>
> > 
> > I think we need to add a second way? It could be anything that can help
> > us distinguish between a non-grants-capable virtio backend and a
> > grants-capable virtio backend, such as:
> > - a string on xenstore
> > - a xen param
> > - a special PCI configuration register value
> > - something in the ACPI tables
> > - the QEMU machine type
> 
> 
> Yes, I remember there was a discussion regarding that. The point is to 
> choose a solution to be functional for both PV and HVM *and* to be able 
> to support a hotplug. IIRC, the xenstore could be a possible candidate.

xenstore would be among the easiest to make work. The only downside is
the dependency on xenstore which otherwise virtio+grants doesn't have.

Vikram is working on virtio with grants support in QEMU as we speak.
Maybe we could find a way to add a flag in QEMU so that we can detect at
runtime if a given virtio device support grants or not.

 
> > Or at least should we change CONFIG_XEN_VIRTIO_FORCE_GRANT into a
> > command line parameter so that it can be disabled in cases like this
> > one?
> 
> IIUC, this will help with HVM only.

For sure this is the least attractive solution, only marginally better
than the fix proposed in this patch
 

> > I realize that fixing this problem properly takes a lot longer than
> > adding a trivial if (dom0) return; check in the code. If you cannot find
> > a good way to solve the problem or you don't have time to do that now
> > and you need this bug fixed quickly, then I would be OK with the if
> > (dom0) return; check but please add a detailed TODO in-code comment to
> > explain that this is just a hack and we are still looking for a real
> > solution.
> > 
> > The check itself I prefer the original position because I want to retain
> > the ability of using virtio frontends with grant on ARM in Dom0 (DomD
> > case).
> 
> Makes sense, agree.

