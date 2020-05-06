Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4FD1C66B4
	for <lists+xen-devel@lfdr.de>; Wed,  6 May 2020 06:21:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWBXS-00060l-1L; Wed, 06 May 2020 04:20:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=POZY=6U=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1jWBXP-0005gD-Rk
 for xen-devel@lists.xenproject.org; Wed, 06 May 2020 04:20:03 +0000
X-Inumbo-ID: db0248b8-8f50-11ea-b07b-bc764e2007e4
Received: from mail-qt1-x843.google.com (unknown [2607:f8b0:4864:20::843])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id db0248b8-8f50-11ea-b07b-bc764e2007e4;
 Wed, 06 May 2020 04:20:02 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id h26so344344qtu.8
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2020 21:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=v4sxVkW1RAfUO6uH6SANXyFvtNXk2seAii2bb50iF1w=;
 b=QulVLVJgrqu0wa8By35J/mLxpDQrKEk0GiTz1XCDB+MIgcxX9sxhB8k3+7/ikOmTq3
 vvmA86dgjGW6oaQvhHTpmdfN+3kP2GZxDkcchVEN6xdj9ug19X4qr8Bwy7I19vZlVjVL
 O7M957QT/nzo5Xy3gHm4wDjqOlLKH7rOYcV/Dq8X+fnZnc8vosSUYJF0f4rvojFFlNpZ
 lfEnMaCmkGXHJIznPKcAcGGhvYeKO5oq6toK6NVbymRzlJ5Wx6JLcTRPqfJOWGoQlaZh
 9i/URJ57fKMIywhf/3wH4gt2XHCAPXP/Vnl2QC49R/8Rd7FUuRHnIj2A0ZWCabMXB4u6
 vl3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=v4sxVkW1RAfUO6uH6SANXyFvtNXk2seAii2bb50iF1w=;
 b=nD57K6R/f1mvoCHWBn4w9uzalG1j9pK4WY5wmceTh/VJeRCJs6hkgxDkYGU0gBqDiN
 E+XAfIWXeBOvaqnOHGm7+iyuLFIi+uXEP7iZFuv6YR20mr05qjLC/UbGCBFSLaYb/R5u
 sBG1zKzNmGiGF6LuvdGSKziQ2jNCeiT7rq97LMDo5JUdLnhUV4buJkE27BBA7SfrhjvL
 JoDuvroTMO/NINuwCGrENhT7IhF2eMKTKRxVIm2KQi8O3wYUfcRSS52CG5Rg0EdiO465
 /cucWJCq7j8V8pT8doIRXsDsY21yuZw9EhYOVxqIyhzNA7AOAks0S51M5s/WtkaKrgT0
 0bAA==
X-Gm-Message-State: AGi0Pua2XEja2JHF3F7e4ZEQRCNIkG97ZMVxVDOe2EcC3rJwlUa/mlf4
 679ttXSJM4gA05FNLDp8Y4pUmXGZV2CL3qRw9j6z2A==
X-Google-Smtp-Source: APiQypIXC8ZUZ+RMxwQ3B8pFIIXGlPjwkiT6mxhRPyzG3SI1P9MCQ2Pvt1yIfxzBbRtrLOJzCSyxwQPnAomxQveAN08=
X-Received: by 2002:ac8:2c78:: with SMTP id e53mr6354937qta.365.1588738801846; 
 Tue, 05 May 2020 21:20:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAMmSBy_A4xJmCo-PiWukv0+vkEhXXDpYwZAKAiJ=mmpuY1CbMA@mail.gmail.com>
 <20200501114201.GE9902@minyard.net>
 <CAMmSBy_h9=5cjMv3+-BKHYhBikgna731DoA+t-8FK-2tbPUH-A@mail.gmail.com>
 <20200502021647.GG9902@minyard.net>
 <4f6ef562-e213-8952-66d6-0f083bf8c593@xen.org>
 <20200502173529.GH9902@minyard.net>
 <ed02b555-dbaa-2ebf-d09f-0474e1a7a745@xen.org>
 <20200504124453.GI9902@minyard.net>
 <CAMmSBy-w1HOyGGCjB_nJcn2xw+4sNdDrtJ8PC3foaxJOtdRmnQ@mail.gmail.com>
 <alpine.DEB.2.21.2005042004500.14706@sstabellini-ThinkPad-T480s>
 <CAMmSBy-yymEGQcuUBHZi-tL9ra7x9nDv+ms8SLiZr1H=BpHUiQ@mail.gmail.com>
 <alpine.DEB.2.21.2005051508180.14706@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2005051508180.14706@sstabellini-ThinkPad-T480s>
From: Roman Shaposhnik <roman@zededa.com>
Date: Tue, 5 May 2020 21:19:50 -0700
Message-ID: <CAMmSBy9vgeCw4LCtKuWaq8SDw16+pJX4F=i6gA3SN8V=BBENjA@mail.gmail.com>
Subject: Re: Troubles running Xen on Raspberry Pi 4 with 5.6.1 DomU
To: Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, peng.fan@nxp.com,
 Julien Grall <julien@xen.org>, minyard@acm.org, jeff.kubascik@dornerworks.com,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, May 5, 2020 at 3:34 PM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> + Boris, J=C3=BCrgen
>
> See the crash Roman is seeing booting dom0 on the Raspberry Pi. It is
> related to the recent xen dma_ops changes. Possibly the same thing
> reported by Peng here:
>
> https://marc.info/?l=3Dlinux-kernel&m=3D158805976230485&w=3D2
>
> An in-depth analysis below.
>
>
> On Mon, 4 May 2020, Roman Shaposhnik wrote:
> > > > [    2.534292] Unable to handle kernel paging request at virtual
> > > > address 000000000026c340
> > > > [    2.542373] Mem abort info:
> > > > [    2.545257]   ESR =3D 0x96000004
> > > > [    2.548421]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> > > > [    2.553877]   SET =3D 0, FnV =3D 0
> > > > [    2.557023]   EA =3D 0, S1PTW =3D 0
> > > > [    2.560297] Data abort info:
> > > > [    2.563258]   ISV =3D 0, ISS =3D 0x00000004
> > > > [    2.567208]   CM =3D 0, WnR =3D 0
> > > > [    2.570294] [000000000026c340] user address but active_mm is swa=
pper
> > > > [    2.576783] Internal error: Oops: 96000004 [#1] SMP
> > > > [    2.581784] Modules linked in:
> > > > [    2.584950] CPU: 3 PID: 135 Comm: kworker/3:1 Not tainted 5.6.1-=
default #9
> > > > [    2.591970] Hardware name: Raspberry Pi 4 Model B (DT)
> > > > [    2.597256] Workqueue: events deferred_probe_work_func
> > > > [    2.602509] pstate: 60000005 (nZCv daif -PAN -UAO)
> > > > [    2.607431] pc : xen_swiotlb_free_coherent+0x198/0x1d8
> > > > [    2.612696] lr : dma_free_attrs+0x98/0xd0
> > > > [    2.616827] sp : ffff800011db3970
> > > > [    2.620242] x29: ffff800011db3970 x28: 00000000000f7b00
> > > > [    2.625695] x27: 0000000000001000 x26: ffff000037b68410
> > > > [    2.631129] x25: 0000000000000001 x24: 00000000f7b00000
> > > > [    2.636583] x23: 0000000000000000 x22: 0000000000000000
> > > > [    2.642017] x21: ffff800011b0d000 x20: ffff80001179b548
> > > > [    2.647461] x19: ffff000037b68410 x18: 0000000000000010
> > > > [    2.652905] x17: ffff000035d66a00 x16: 00000000deadbeef
> > > > [    2.658348] x15: ffffffffffffffff x14: ffff80001179b548
> > > > [    2.663792] x13: ffff800091db37b7 x12: ffff800011db37bf
> > > > [    2.669236] x11: ffff8000117c7000 x10: ffff800011db3740
> > > > [    2.674680] x9 : 00000000ffffffd0 x8 : ffff80001071e980
> > > > [    2.680124] x7 : 0000000000000132 x6 : ffff80001197a6ab
> > > > [    2.685568] x5 : 0000000000000000 x4 : 0000000000000000
> > > > [    2.691012] x3 : 00000000f7b00000 x2 : fffffdffffe00000
> > > > [    2.696465] x1 : 000000000026c340 x0 : 000002000046c340
> > > > [    2.701899] Call trace:
> > > > [    2.704452]  xen_swiotlb_free_coherent+0x198/0x1d8
> > > > [    2.709367]  dma_free_attrs+0x98/0xd0
> > > > [    2.713143]  rpi_firmware_property_list+0x1e4/0x240
> > > > [    2.718146]  rpi_firmware_property+0x6c/0xb0
> > > > [    2.722535]  rpi_firmware_probe+0xf0/0x1e0
> > > > [    2.726760]  platform_drv_probe+0x50/0xa0
> > > > [    2.730879]  really_probe+0xd8/0x438
> > > > [    2.734567]  driver_probe_device+0xdc/0x130
> > > > [    2.738870]  __device_attach_driver+0x88/0x108
> > > > [    2.743434]  bus_for_each_drv+0x78/0xc8
> > > > [    2.747386]  __device_attach+0xd4/0x158
> > > > [    2.751337]  device_initial_probe+0x10/0x18
> > > > [    2.755649]  bus_probe_device+0x90/0x98
> > > > [    2.759590]  deferred_probe_work_func+0x88/0xd8
> > > > [    2.764244]  process_one_work+0x1f0/0x3c0
> > > > [    2.768369]  worker_thread+0x138/0x570
> > > > [    2.772234]  kthread+0x118/0x120
> > > > [    2.775571]  ret_from_fork+0x10/0x18
> > > > [    2.779263] Code: d34cfc00 f2dfbfe2 d37ae400 8b020001 (f8626800)
> > > > [    2.785492] ---[ end trace 4c435212e349f45f ]---
> > > > [    2.793340] usb 1-1: New USB device found, idVendor=3D2109,
> > > > idProduct=3D3431, bcdDevice=3D 4.20
> > > > [    2.801038] usb 1-1: New USB device strings: Mfr=3D0, Product=3D=
1, SerialNumber=3D0
> > > > [    2.808297] usb 1-1: Product: USB2.0 Hub
> > > > [    2.813710] hub 1-1:1.0: USB hub found
> > > > [    2.817117] hub 1-1:1.0: 4 ports detected
> > > >
> > > > This is bailing out right here:
> > > >      https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.g=
it/tree/drivers/firmware/raspberrypi.c?h=3Dv5.6.1#n125
> > > >
> > > > FYIW (since I modified the source to actually print what was return=
ed
> > > > right before it bails) we get:
> > > >    buf[1] =3D=3D 0x800000004
> > > >    buf[2] =3D=3D 0x00000001
> > > >
> > > > Status 0x800000004 is of course suspicious since it is not even lis=
ted here:
> > > >     https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.gi=
t/tree/include/soc/bcm2835/raspberrypi-firmware.h#n14
> > > >
> > > > So it appears that this DMA request path is somehow busted and it
> > > > would be really nice to figure out why.
> > >
> > > You have actually discovered a genuine bug in the recent xen dma rewo=
rk
> > > in Linux. Congrats :-)
> >
> > Nice! ;-)
> >
> > > I am doing some guesswork here, but from what I read in the thread an=
d
> > > the information in this email I think this patch might fix the issue.
> > > If it doesn't fix the issue please add a few printks in
> > > drivers/xen/swiotlb-xen.c:xen_swiotlb_free_coherent and please let me
> > > know where exactly it crashes.
> > >
> > >
> > > diff --git a/include/xen/arm/page-coherent.h b/include/xen/arm/page-c=
oherent.h
> > > index b9cc11e887ed..ff4677ed9788 100644
> > > --- a/include/xen/arm/page-coherent.h
> > > +++ b/include/xen/arm/page-coherent.h
> > > @@ -8,12 +8,17 @@
> > >  static inline void *xen_alloc_coherent_pages(struct device *hwdev, s=
ize_t size,
> > >                 dma_addr_t *dma_handle, gfp_t flags, unsigned long at=
trs)
> > >  {
> > > +       void *cpu_addr;
> > > +       if (dma_alloc_from_dev_coherent(hwdev, size, dma_handle, &cpu=
_addr))
> > > +               return cpu_addr;
> > >         return dma_direct_alloc(hwdev, size, dma_handle, flags, attrs=
);
> > >  }
> > >
> > >  static inline void xen_free_coherent_pages(struct device *hwdev, siz=
e_t size,
> > >                 void *cpu_addr, dma_addr_t dma_handle, unsigned long =
attrs)
> > >  {
> > > +       if (dma_release_from_dev_coherent(hwdev, get_order(size), cpu=
_addr))
> > > +               return;
> > >         dma_direct_free(hwdev, size, cpu_addr, dma_handle, attrs);
> > >  }
> >
> > Applied the patch, but it didn't help and after printk's it turns out
> > it surprisingly crashes right inside this (rather convoluted if you
> > ask me) if statement:
> >     https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tr=
ee/drivers/xen/swiotlb-xen.c?h=3Dv5.6.1#n349
> >
> > So it makes sense that the patch didn't help -- we never hit that
> > xen_free_coherent_pages.
>
> The crash happens here:
>
>         if (!WARN_ON((dev_addr + size - 1 > dma_mask) ||
>                      range_straddles_page_boundary(phys, size)) &&
>             TestClearPageXenRemapped(virt_to_page(vaddr)))
>                 xen_destroy_contiguous_region(phys, order);
>
> I don't know exactly what is causing the crash. Is it the WARN_ON somehow=
?
> Is it TestClearPageXenRemapped? Neither should cause a crash in theory.
>
>
> But I do know that there are problems with that if statement on ARM. It
> can trigger for one of the following conditions:
>
> 1) dev_addr + size - 1 > dma_mask
> 2) range_straddles_page_boundary(phys, size)
>
>
> The first condition might happen after bef4d2037d214 because
> dma_direct_alloc might not respect the device dma_mask. It is actually a
> bug and I would like to keep the WARN_ON for that. The patch I sent
> yesterday (https://marc.info/?l=3Dxen-devel&m=3D158865080224504) should
> solve that issue. But Roman is telling us that the crash still persists.
>
> The second condition is completely normal and not an error on ARM
> because dom0 is 1:1 mapped. It is not an issue if the address range is
> straddling a page boundary. We certainly shouldn't WARN (or crash).
>
> So, I suggest something similar to Peng's patch, appended.
>
> Roman, does it solve your problem?
>
>
> diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> index b6d27762c6f8..994ca3a4b653 100644
> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -346,9 +346,8 @@ xen_swiotlb_free_coherent(struct device *hwdev, size_=
t size, void *vaddr,
>         /* Convert the size to actually allocated. */
>         size =3D 1UL << (order + XEN_PAGE_SHIFT);
>
> -       if (!WARN_ON((dev_addr + size - 1 > dma_mask) ||
> -                    range_straddles_page_boundary(phys, size)) &&
> -           TestClearPageXenRemapped(virt_to_page(vaddr)))
> +       WARN_ON(dev_addr + size - 1 > dma_mask);
> +       if (TestClearPageXenRemapped(virt_to_page(vaddr)))
>                 xen_destroy_contiguous_region(phys, order);
>
>         xen_free_coherent_pages(hwdev, size, vaddr, (dma_addr_t)phys, att=
rs);


Ok, so "the plot thickens" it seems ;-)

It definitely crashes inside of the
TestClearPageXenRemapped(virt_to_page(vaddr)) statement

Now, to test what part of it -- I actually unpacked the statement
which also allowed me to see what page virt_to_page(vaddr) returns by
doing:
    struct page *page =3D virt_to_page(vaddr);
Turns out the value of the page (as per %px) is 000000000026a340
(which doesn't seem odd to me -- but may be it will to you Stefano)

That address, however, doesn't seem to be mapped -- when I try adding a sim=
ple:
    printk(KERN_CRIT "page flags %ld\n", page->flags);
it crashes trying to dereference a page.

Thanks,
Roman.

