Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE911C4DB6
	for <lists+xen-devel@lfdr.de>; Tue,  5 May 2020 07:38:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVqGU-00073m-Hz; Tue, 05 May 2020 05:37:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jKJh=6T=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1jVqGS-000733-RA
 for xen-devel@lists.xenproject.org; Tue, 05 May 2020 05:37:08 +0000
X-Inumbo-ID: 7540a65a-8e92-11ea-9887-bc764e2007e4
Received: from mail-qk1-x741.google.com (unknown [2607:f8b0:4864:20::741])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7540a65a-8e92-11ea-9887-bc764e2007e4;
 Tue, 05 May 2020 05:37:07 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id g185so1182170qke.7
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2020 22:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=++FzMEFfP1PBiT6l2HAcsqAZsEvUSdWRF0jHzpVko30=;
 b=fgIX9mM5A6XWOFHl+Jxyy4JjYI/xejc3U3JhVdm0DvOHJEib8drIIWmJlCncdN9QDE
 feOn9mMEeskbm7bLJdPccgpHTXZzlnltAUB2z8YHxuJ30pDoL91fn4AiRF3peIC1Dynm
 hapqK1ELZSciba+Xt7tQm7tBldm7NzG3lpjZglkQsxt6IO1MdqQmBOXr9e+nok4kXfws
 aUO4OpyaGJ7NSzSHQrpniHvVvsVutCy6pbVDbaqQzbScNy9EdC2N7n14TWDZBSOQY2bu
 H8ZRpP5QcBkVZJh9/u5Hmi5F6azYdEvoZVQGcXc7uUtdMpiM6HmHId4OEQzHybypnmSt
 dIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=++FzMEFfP1PBiT6l2HAcsqAZsEvUSdWRF0jHzpVko30=;
 b=TlXUHusxg9B4t+aOjchYhEy8qMRJcpYf/X7uV2cGYRDBwif18Dwa+qEo4H2fQfEFfE
 tAD5hEQ7x4POfhx9bDck91uI/iPAl3FrEQEDUKDKqSXwjjzqYijTJRcOJYkkshAaDx+h
 K+kzlYYKc1UFu+ol2bMi8jY7/xuDhVxsKGJTkdTCS+jp53a9d/asdECajLZZXN5VFw+k
 Rludttt6Gng5v8KyMlEuPtSojXV4kK9QcBvWmcNprVuzHADiEtkZWPtafpi56vwJsUCs
 L7nEpQ7nf3qCKBILZdkhKCTsL066XdvLCmuJFxCTAtP63yjRGNqGv4kvJkGuWzX2r4nx
 I3pQ==
X-Gm-Message-State: AGi0PuZq65H0dh1ZTJLSUBVRVlOGOZSxArVM92EeJ4VKbEiJB8dFxhMr
 Y+FldB+P1lqSp17e0ieUSPt30yFnQkwWgyMVhgAe/Q==
X-Google-Smtp-Source: APiQypLdMzCxpZMthhkTK84Nqls92tR7z98aEK9DX7Sbp014IAlhU5ZoRudas0ZKbamdilthldnfvpN07hZxyuPOj3A=
X-Received: by 2002:a05:620a:16d6:: with SMTP id
 a22mr1760812qkn.291.1588657026736; 
 Mon, 04 May 2020 22:37:06 -0700 (PDT)
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
In-Reply-To: <alpine.DEB.2.21.2005042004500.14706@sstabellini-ThinkPad-T480s>
From: Roman Shaposhnik <roman@zededa.com>
Date: Mon, 4 May 2020 22:36:55 -0700
Message-ID: <CAMmSBy-yymEGQcuUBHZi-tL9ra7x9nDv+ms8SLiZr1H=BpHUiQ@mail.gmail.com>
Subject: Re: Troubles running Xen on Raspberry Pi 4 with 5.6.1 DomU
To: Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Julien Grall <julien@xen.org>, minyard@acm.org,
 jeff.kubascik@dornerworks.com, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, May 4, 2020 at 8:52 PM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> On Mon, 4 May 2020, Roman Shaposhnik wrote:
> > Hi Julien,
> >
> > thank for your patch -- just like Corey I tried it out and it seems to
> > work fine and gets
> > me further. At this point, I'm pretty sure I'm past initial
> > bootstrapping issues and into
> > what can be basically described as Xen DMA issue of some kind (so I'm
> > pretty sure
> > I will need Stefano's help to debug this further). I'm attaching
> > verbose logs, but the
> > culprit seems to be:
> >
> > [    2.534292] Unable to handle kernel paging request at virtual
> > address 000000000026c340
> > [    2.542373] Mem abort info:
> > [    2.545257]   ESR = 0x96000004
> > [    2.548421]   EC = 0x25: DABT (current EL), IL = 32 bits
> > [    2.553877]   SET = 0, FnV = 0
> > [    2.557023]   EA = 0, S1PTW = 0
> > [    2.560297] Data abort info:
> > [    2.563258]   ISV = 0, ISS = 0x00000004
> > [    2.567208]   CM = 0, WnR = 0
> > [    2.570294] [000000000026c340] user address but active_mm is swapper
> > [    2.576783] Internal error: Oops: 96000004 [#1] SMP
> > [    2.581784] Modules linked in:
> > [    2.584950] CPU: 3 PID: 135 Comm: kworker/3:1 Not tainted 5.6.1-default #9
> > [    2.591970] Hardware name: Raspberry Pi 4 Model B (DT)
> > [    2.597256] Workqueue: events deferred_probe_work_func
> > [    2.602509] pstate: 60000005 (nZCv daif -PAN -UAO)
> > [    2.607431] pc : xen_swiotlb_free_coherent+0x198/0x1d8
> > [    2.612696] lr : dma_free_attrs+0x98/0xd0
> > [    2.616827] sp : ffff800011db3970
> > [    2.620242] x29: ffff800011db3970 x28: 00000000000f7b00
> > [    2.625695] x27: 0000000000001000 x26: ffff000037b68410
> > [    2.631129] x25: 0000000000000001 x24: 00000000f7b00000
> > [    2.636583] x23: 0000000000000000 x22: 0000000000000000
> > [    2.642017] x21: ffff800011b0d000 x20: ffff80001179b548
> > [    2.647461] x19: ffff000037b68410 x18: 0000000000000010
> > [    2.652905] x17: ffff000035d66a00 x16: 00000000deadbeef
> > [    2.658348] x15: ffffffffffffffff x14: ffff80001179b548
> > [    2.663792] x13: ffff800091db37b7 x12: ffff800011db37bf
> > [    2.669236] x11: ffff8000117c7000 x10: ffff800011db3740
> > [    2.674680] x9 : 00000000ffffffd0 x8 : ffff80001071e980
> > [    2.680124] x7 : 0000000000000132 x6 : ffff80001197a6ab
> > [    2.685568] x5 : 0000000000000000 x4 : 0000000000000000
> > [    2.691012] x3 : 00000000f7b00000 x2 : fffffdffffe00000
> > [    2.696465] x1 : 000000000026c340 x0 : 000002000046c340
> > [    2.701899] Call trace:
> > [    2.704452]  xen_swiotlb_free_coherent+0x198/0x1d8
> > [    2.709367]  dma_free_attrs+0x98/0xd0
> > [    2.713143]  rpi_firmware_property_list+0x1e4/0x240
> > [    2.718146]  rpi_firmware_property+0x6c/0xb0
> > [    2.722535]  rpi_firmware_probe+0xf0/0x1e0
> > [    2.726760]  platform_drv_probe+0x50/0xa0
> > [    2.730879]  really_probe+0xd8/0x438
> > [    2.734567]  driver_probe_device+0xdc/0x130
> > [    2.738870]  __device_attach_driver+0x88/0x108
> > [    2.743434]  bus_for_each_drv+0x78/0xc8
> > [    2.747386]  __device_attach+0xd4/0x158
> > [    2.751337]  device_initial_probe+0x10/0x18
> > [    2.755649]  bus_probe_device+0x90/0x98
> > [    2.759590]  deferred_probe_work_func+0x88/0xd8
> > [    2.764244]  process_one_work+0x1f0/0x3c0
> > [    2.768369]  worker_thread+0x138/0x570
> > [    2.772234]  kthread+0x118/0x120
> > [    2.775571]  ret_from_fork+0x10/0x18
> > [    2.779263] Code: d34cfc00 f2dfbfe2 d37ae400 8b020001 (f8626800)
> > [    2.785492] ---[ end trace 4c435212e349f45f ]---
> > [    2.793340] usb 1-1: New USB device found, idVendor=2109,
> > idProduct=3431, bcdDevice= 4.20
> > [    2.801038] usb 1-1: New USB device strings: Mfr=0, Product=1, SerialNumber=0
> > [    2.808297] usb 1-1: Product: USB2.0 Hub
> > [    2.813710] hub 1-1:1.0: USB hub found
> > [    2.817117] hub 1-1:1.0: 4 ports detected
> >
> > This is bailing out right here:
> >      https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/firmware/raspberrypi.c?h=v5.6.1#n125
> >
> > FYIW (since I modified the source to actually print what was returned
> > right before it bails) we get:
> >    buf[1] == 0x800000004
> >    buf[2] == 0x00000001
> >
> > Status 0x800000004 is of course suspicious since it is not even listed here:
> >     https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/include/soc/bcm2835/raspberrypi-firmware.h#n14
> >
> > So it appears that this DMA request path is somehow busted and it
> > would be really nice to figure out why.
>
> You have actually discovered a genuine bug in the recent xen dma rework
> in Linux. Congrats :-)

Nice! ;-)

> I am doing some guesswork here, but from what I read in the thread and
> the information in this email I think this patch might fix the issue.
> If it doesn't fix the issue please add a few printks in
> drivers/xen/swiotlb-xen.c:xen_swiotlb_free_coherent and please let me
> know where exactly it crashes.
>
>
> diff --git a/include/xen/arm/page-coherent.h b/include/xen/arm/page-coherent.h
> index b9cc11e887ed..ff4677ed9788 100644
> --- a/include/xen/arm/page-coherent.h
> +++ b/include/xen/arm/page-coherent.h
> @@ -8,12 +8,17 @@
>  static inline void *xen_alloc_coherent_pages(struct device *hwdev, size_t size,
>                 dma_addr_t *dma_handle, gfp_t flags, unsigned long attrs)
>  {
> +       void *cpu_addr;
> +       if (dma_alloc_from_dev_coherent(hwdev, size, dma_handle, &cpu_addr))
> +               return cpu_addr;
>         return dma_direct_alloc(hwdev, size, dma_handle, flags, attrs);
>  }
>
>  static inline void xen_free_coherent_pages(struct device *hwdev, size_t size,
>                 void *cpu_addr, dma_addr_t dma_handle, unsigned long attrs)
>  {
> +       if (dma_release_from_dev_coherent(hwdev, get_order(size), cpu_addr))
> +               return;
>         dma_direct_free(hwdev, size, cpu_addr, dma_handle, attrs);
>  }

Applied the patch, but it didn't help and after printk's it turns out
it surprisingly crashes right inside this (rather convoluted if you
ask me) if statement:
    https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/xen/swiotlb-xen.c?h=v5.6.1#n349

So it makes sense that the patch didn't help -- we never hit that
xen_free_coherent_pages.

Thanks,
Roman.

