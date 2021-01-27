Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2994305A3E
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 12:48:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76066.137144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4jIV-0004u7-DU; Wed, 27 Jan 2021 11:47:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76066.137144; Wed, 27 Jan 2021 11:47:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4jIV-0004ti-9o; Wed, 27 Jan 2021 11:47:43 +0000
Received: by outflank-mailman (input) for mailman id 76066;
 Wed, 27 Jan 2021 11:47:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6tFp=G6=unikie.com=jukka.kaartinen@srs-us1.protection.inumbo.net>)
 id 1l4jIT-0004td-2t
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 11:47:41 +0000
Received: from mail-lf1-x131.google.com (unknown [2a00:1450:4864:20::131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1fe099cc-3067-4c2e-910f-df2decf5f97b;
 Wed, 27 Jan 2021 11:47:38 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id b2so2248972lfq.0
 for <xen-devel@lists.xenproject.org>; Wed, 27 Jan 2021 03:47:38 -0800 (PST)
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
X-Inumbo-ID: 1fe099cc-3067-4c2e-910f-df2decf5f97b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5CaSjDeqLLulD0E2h1sBgYzrTplPlkB/cSSzhHraeCY=;
        b=QVrVgUrG1wux4aavzIYCJeLIgMlY6RkUCenDo43ZoO8kb/QOD0NjUB9vgIwrvDaXSz
         L+cn7RULfqQNEIWTJPVnKw0VriXBwNCzA21bejPo67pIHi6p6fc8PkTiw5KYmamZuobc
         fezIqBUY5qcz8CXjQ7dkJKoRBpEteYZjs0LzLCUc+fddXMho+NCakJLzCSEHuJFKl9j6
         FrqJjvL2AKt54vfJLl2u7A2OdwMaOdnT93IhaLcLPTObBy0EhThFJDe8pjvFiM8RvBF1
         iS3Wm/+IlJfq7ht22knueTR7nsMmockYXMA5JkYCCGFJ3xEfJA/1JIgnHj5e5ro4muCQ
         qWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5CaSjDeqLLulD0E2h1sBgYzrTplPlkB/cSSzhHraeCY=;
        b=fJYnexlgYqLmAjcljPmVpriamOrDIc+eQ3jN+lo/X3nC8u7adi79Gt3oTnJZlSGu/5
         MwaPV3yitcX9xcGhFCc8FNEeoZHn9NvvtKSrU8VXKs99pPU8Sjdu7+nk1ZtpZRr8mEyz
         ZyStcGprUbaKC8EyUYXh3aBajeXEpPCYY5bzu23NtRNr03MN4L8wPLn9bEXQ5iOTKN50
         P82LwNk7//dbevwIx38qhUt+Hiz83O9EpiDyESH7mo3dZmFQK1rOdJWGrCfC/FAeN1Rq
         It/Mr55tynrthTKzOFnTabpfDP+X74W1gN/3WW6lUq0b7UNwTu43UzlHHtmXJCQ5R4X3
         O+fw==
X-Gm-Message-State: AOAM533BQwB++tSaADE7/QOl6RoDjrnc9JXjx7elizO0529uYmWPW4xG
	XL+ucBt6B4NrHmSqhdUKqTkdZXpIbtiVSMrf9hkCVQ==
X-Google-Smtp-Source: ABdhPJxKOTUxmRxTjwIZnC4OIVDEVKAaV3BR+4s8mVRaWSw3kxNr01NVW+mdGAWnU7EzAuKuNVAiX4a8dGi5EyW5x6s=
X-Received: by 2002:a19:d611:: with SMTP id n17mr5105162lfg.494.1611748057399;
 Wed, 27 Jan 2021 03:47:37 -0800 (PST)
MIME-Version: 1.0
References: <CAFnJQOouOUox_kBB66sfSuriUiUSvmhSjPxucJjgrB9DdLOwkg@mail.gmail.com>
 <alpine.DEB.2.21.2101221449480.14612@sstabellini-ThinkPad-T480s>
 <CAFnJQOqoqj6mWwR61ZsZj1JxRrdisFtH_87YXCeW619GM+L21Q@mail.gmail.com>
 <alpine.DEB.2.21.2101251646470.20638@sstabellini-ThinkPad-T480s>
 <CAFnJQOpuehAWde5Ta4ud9CGufwZ-K+=60epzSdKc_DnS75O2iA@mail.gmail.com> <alpine.DEB.2.21.2101261149210.2568@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2101261149210.2568@sstabellini-ThinkPad-T480s>
From: Jukka Kaartinen <jukka.kaartinen@unikie.com>
Date: Wed, 27 Jan 2021 13:47:26 +0200
Message-ID: <CAFnJQOpgRM-3_aZsnv36w+aQV=gMcBA18ZEw_-man7zmYb4O4Q@mail.gmail.com>
Subject: Re: Question about xen and Rasp 4B
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Roman Shaposhnik <roman@zededa.com>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Content-Type: multipart/alternative; boundary="0000000000006ddb3d05b9e056ee"

--0000000000006ddb3d05b9e056ee
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 26, 2021 at 10:22 PM Stefano Stabellini <sstabellini@kernel.org>
wrote:

> On Tue, 26 Jan 2021, Jukka Kaartinen wrote:
> > On Tue, Jan 26, 2021 at 2:54 AM Stefano Stabellini <
> sstabellini@kernel.org> wrote:
> >       On Sat, 23 Jan 2021, Jukka Kaartinen wrote:
> >       > Thanks for the response!
> >       >
> >       > On Sat, Jan 23, 2021 at 2:27 AM Stefano Stabellini <
> sstabellini@kernel.org> wrote:
> >       >       + xen-devel, Roman,
> >       >
> >       >
> >       >       On Fri, 22 Jan 2021, Jukka Kaartinen wrote:
> >       >       > Hi Stefano,
> >       >       > I'm Jukka Kaartinen a SW developer working on enabling
> hypervisors on mobile platforms. One of our HW that we use on
> >       >       development is
> >       >       > Raspberry Pi 4B. I wonder if you could help me a bit :).
> >       >       >
> >       >       > I'm trying to enable the GPU with Xen + Raspberry Pi for
> >       >       dom0.
> https://www.raspberrypi.org/forums/viewtopic.php?f=63&t=232323#p1797605
> >       >       >
> >       >       > I got so far that GPU drivers are loaded (v3d & vc4)
> without errors. But now Xen returns error when X is starting:
> >       >       > (XEN) traps.c:1986:d0v1 HSR=0x93880045
> pc=0x00007f97b14e70 gva=0x7f7f817000 gpa=0x0000401315d000
> >       >       >  I tried to debug what causes this and looks
> like find_mmio_handler cannot find handler.
> >       >       > (See more here:
> https://www.raspberrypi.org/forums/viewtopic.php?f=63&t=232323&start=25#p1801691
> )
> >       >       >
> >       >       > Any ideas why the handler is not found?
> >       >
> >       >
> >       >       Hi Jukka,
> >       >
> >       >       I am glad to hear that you are interested in Xen on
> RaspberryPi :-)  I
> >       >       haven't tried the GPU yet, I have been using the serial
> only.
> >       >       Roman, did you ever get the GPU working?
> >       >
> >       >
> >       >       The error is a data abort error: Linux is trying to access
> an address
> >       >       which is not mapped to dom0. The address seems to be
> 0x401315d000. It is
> >       >       a pretty high address; I looked in device tree but
> couldn't spot it.
> >       >
> >       >       >From the HSR (the syndrom register) it looks like it is a
> translation
> >       >       fault at EL1 on stage1. As if the Linux address mapping
> was wrong.
> >       >       Anyone has any ideas how this could happen? Maybe a
> reserved-memory
> >       >       misconfiguration?
> >       >
> >       > I had issues with loading the driver in the first place.
> Apparently swiotlb is used, maybe it can cause this. I also tried to
> >       enable CMA.
> >       > config.txt:
> >       > dtoverlay=vc4-fkms-v3d,cma=320M@0x0-0x40000000
> >       > gpu_mem=128
> >
> >       Also looking at your other reply and the implementation of
> >       vc4_bo_create, it looks like this is a CMA problem.
> >
> >       It would be good to run a test with the swiotlb-xen disabled:
> >
> >       diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
> >       index 467fa225c3d0..2bdd12785d14 100644
> >       --- a/arch/arm/xen/mm.c
> >       +++ b/arch/arm/xen/mm.c
> >       @@ -138,8 +138,7 @@ void xen_destroy_contiguous_region(phys_addr_t
> pstart, unsigned int order)
> >        static int __init xen_mm_init(void)
> >        {
> >               struct gnttab_cache_flush cflush;
> >       -       if (!xen_initial_domain())
> >       -               return 0;
> >       +       return 0;
> >               xen_swiotlb_init(1, false);
> >
> >               cflush.op = 0;
> >
> > With this change the kernel is not booting up. (btw. I'm using USB SSD
> for my OS.)
> > [    0.071081] bcm2835-dma fe007000.dma: Unable to set DMA mask
> > [    0.076277] bcm2835-dma fe007b00.dma: Unable to set DMA mask
> > (XEN) physdev.c:16:d0v0 PHYSDEVOP cmd=25: not implemented
> > (XEN) physdev.c:16:d0v0 PHYSDEVOP cmd=15: not implemented
> > [    0.592695] pci 0000:00:00.0: Failed to add - passthrough or
> MSI/MSI-X might fail!
> > (XEN) physdev.c:16:d0v0 PHYSDEVOP cmd=15: not implemented
> > [    0.606819] pci 0000:01:00.0: Failed to add - passthrough or
> MSI/MSI-X might fail!
> > [    1.212820] usb 1-1: device descriptor read/64, error 18
> > [    1.452815] usb 1-1: device descriptor read/64, error 18
> > [    1.820813] usb 1-1: device descriptor read/64, error 18
> > [    2.060815] usb 1-1: device descriptor read/64, error 18
> > [    2.845548] usb 1-1: device descriptor read/8, error -61
> > [    2.977603] usb 1-1: device descriptor read/8, error -61
> > [    3.237530] usb 1-1: device descriptor read/8, error -61
> > [    3.369585] usb 1-1: device descriptor read/8, error -61
> > [    3.480765] usb usb1-port1: unable to enumerate USB device
> >
> > Traces stop here. I could try with a memory card. Maybe it makes a
> difference.
>
> This is very surprising. Disabling swiotlb-xen should make things better
> not worse. The only reason I can think of why it could make things worse
> is if Linux runs out of low memory. Julien's patch
> 437b0aa06a014ce174e24c0d3530b3e9ab19b18b for Xen should have addressed
> that issue though. Julien, any ideas?
>
I really don't know if this is a problem but in the
allocate_memory_11  arch_get_dma_bitsize is called. That should return the
platform->dma_bitsize but at the early stage of boot platform is not
initialized so default 32 is returned. I tried changing the hard code from
32 -> 30 but it didn't make any difference.

static void __init allocate_memory_11(struct domain *d,
                                      struct kernel_info *kinfo)
{
    const unsigned int min_low_order =
        get_order_from_bytes(min_t(paddr_t, dom0_mem, MB(128)));
    const unsigned int min_order = get_order_from_bytes(MB(4));
    struct page_info *pg;
    unsigned int order = get_allocation_size(kinfo->unassigned_mem);
    int i;

    bool lowmem = true;
    unsigned int lowmem_bitsize = min(32U, *arch_get_dma_bitsize*());

also here the place where static dma_bitsize is set is not called for dom0


void __init end_boot_allocator(void)
{
....
    if ( !dma_bitsize && (num_online_nodes() > 1) )
        dma_bitsize = arch_get_dma_bitsize();


and will lead alloc_domheap_pages not to use dma_bitsize since it is not
set.
struct page_info *alloc_domheap_pages(
    struct domain *d, unsigned int order, unsigned int memflags)
{

uses static: dma_bitsize and currently is not set for raspberry pi.


>
> >       It is going to be fine just to boot Dom0 and DomUs without PV
> drivers.
> >       Also, can you post the device tree that you are using here? Just
> in case
> >       there is an issue with Xen parsing any possible /reserved-memory
> nodes
> >       with CMA info that need to be passed on to Dom0.
> >
> > Here is the device dumped from command line:
> > dtc -I fs /proc/device-tree
> >
> https://drive.google.com/file/d/17u18dJHxRfbGZMtRXIwtLVZZfMj9KwN-/view?usp=sharing
>
> There is a reserved-memory node:
>
>         reserved-memory {
>                 #address-cells = <0x02>;
>                 #size-cells = <0x01>;
>                 ranges;
>                 phandle = <0x3f>;
>
>                 linux,cma {
>                         linux,cma-default;
>                         alloc-ranges = <0x00 0x00 0x30000000>;
>                         compatible = "shared-dma-pool";
>                         size = <0x10000000>;
>                         phandle = <0x40>;
>                         reusable;
>                 };
>         };
>
> But in theory Xen should be able to export it to Dom0. It would be worth
> verifying that by running the same dtc -I fs /proc/device-tree in dom0 (in
> the dom0 configuration that can finish booting of course) you get the
> same reserved-memory node.
>
Actually the device-tree is exported from the dom0.



> There is also another suspicious node here:
>
>         axi {
>                 vc_mem {
>                         reg = <0x3eb00000 0x3ff00000 0xc0000000>;
>                 };
>         };
>
> Which doesn't seem device tree exactly compliant and maybe GPU related.
> But again, Xen would probably export it as is to Dom0.
>
>
>
> >       >       > p.s.
> >       >       > While testing I found issue with Xen master branch and
> your patch: xen/rpi4: implement watchdog-based reset
> >       >       >
> >       >       > Looks like black listing the bcm2835-pm
> >       >       > @@ -37,12 +41,69 @@ static const struct dt_device_match
> rpi4_blacklist_dev[] __initconst =
> >       >       >       * The aux peripheral also shares a page with the
> aux UART.
> >       >       >       */
> >       >       >      DT_MATCH_COMPATIBLE("brcm,bcm2835-aux"),
> >       >       > +    /* Special device used for rebooting */
> >       >       > +    DT_MATCH_COMPATIBLE("brcm,bcm2835-pm"),
> >       >       >
> >       >       > will prevent v3d driver to locate phandle. I think it
> will use the same resource:
> >       >       >   pm: watchdog@7e100000 {
> >       >       >       compatible = "brcm,bcm2835-pm",
> "brcm,bcm2835-pm-wdt";
> >       >       > #power-domain-cells = <1>;
> >       >       > #reset-cells = <1>;
> >       >       > reg = <0x7e100000 0x114>,
> >       >       >      <0x7e00a000 0x24>,
> >       >       >      <0x7ec11000 0x20>;
> >       >       > clocks = <&clocks BCM2835_CLOCK_V3D>,
> >       >       > <&clocks BCM2835_CLOCK_PERI_IMAGE>,
> >       >       > <&clocks BCM2835_CLOCK_H264>,
> >       >       > <&clocks BCM2835_CLOCK_ISP>;
> >       >       > clock-names = "v3d", "peri_image", "h264", "isp";
> >       >       > system-power-controller;
> >       >       >
> >       >       > };
> >       >
> >       >       Yeah, I imagine it could be possible. Can you post the
> error message you
> >       >       are seeing from the v3d driver?
> >       >
> >       > This is the error:
> >       > [    0.069682] OF: /v3dbus/v3d@7ec04000: could not find phandle
> >       > [    0.074828] OF: /v3dbus/v3d@7ec04000: could not find phandle
> >       > v3d driver is not loaded.



-- 
Br,
Jukka Kaartinen

--0000000000006ddb3d05b9e056ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 26, 2021 at 10:22 PM Stef=
ano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org" target=3D"_bla=
nk">sstabellini@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">On Tue, 26 Jan 2021, Jukka Kaartinen wrote:<br>
&gt; On Tue, Jan 26, 2021 at 2:54 AM Stefano Stabellini &lt;<a href=3D"mail=
to:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;=
 wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0On Sat, 23 Jan 2021, Jukka Kaartinen wrote:<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Thanks for the response!<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; On Sat, Jan 23, 2021 at 2:27 AM Stefano=
 Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank"=
>sstabellini@kernel.org</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0+ xen-devel, =
Roman,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0On Fri, 22 Ja=
n 2021, Jukka Kaartinen wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Hi Stefa=
no,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I&#39;m =
Jukka=C2=A0Kaartinen a SW developer working on enabling hypervisors on mobi=
le platforms. One of our HW that we use on<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0development i=
s<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Raspberr=
y Pi 4B. I wonder if you could help me a bit :).<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I&#39;m =
trying to enable the GPU with Xen=C2=A0+ Raspberry Pi for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dom0.=C2=A0<a=
 href=3D"https://www.raspberrypi.org/forums/viewtopic.php?f=3D63&amp;t=3D23=
2323#p1797605" rel=3D"noreferrer" target=3D"_blank">https://www.raspberrypi=
.org/forums/viewtopic.php?f=3D63&amp;t=3D232323#p1797605</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I got so=
 far that GPU drivers are loaded (v3d &amp; vc4) without errors. But now Xe=
n returns error=C2=A0when X is starting:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) tr=
aps.c:1986:d0v1 HSR=3D0x93880045 pc=3D0x00007f97b14e70 gva=3D0x7f7f817000 g=
pa=3D0x0000401315d000<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0I =
tried to debug what causes this and looks like=C2=A0find_mmio_handler=C2=A0=
cannot find handler.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (See mor=
e here: <a href=3D"https://www.raspberrypi.org/forums/viewtopic.php?f=3D63&=
amp;t=3D232323&amp;start=3D25#p1801691" rel=3D"noreferrer" target=3D"_blank=
">https://www.raspberrypi.org/forums/viewtopic.php?f=3D63&amp;t=3D232323&am=
p;start=3D25#p1801691</a> )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Any idea=
s why the handler is not found?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Hi Jukka,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0I am glad to =
hear that you are interested in Xen on RaspberryPi :-)=C2=A0 I<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0haven&#39;t t=
ried the GPU yet, I have been using the serial only.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Roman, did yo=
u ever get the GPU working?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0The error is =
a data abort error: Linux is trying to access an address<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0which is not =
mapped to dom0. The address seems to be 0x401315d000. It is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0a pretty high=
 address; I looked in device tree but couldn&#39;t spot it.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;From the =
HSR (the syndrom register) it looks like it is a translation<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fault at EL1 =
on stage1. As if the Linux address mapping was wrong.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Anyone has an=
y ideas how this could happen? Maybe a reserved-memory<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0misconfigurat=
ion?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I had issues=C2=A0with loading the driv=
er in the first place. Apparently swiotlb is used, maybe it=C2=A0can cause =
this. I also tried to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0enable CMA.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; config.txt:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; dtoverlay=3Dvc4-fkms-v3d,cma=3D320M@0x0=
-0x40000000<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; gpu_mem=3D128<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Also looking at your other reply and the imp=
lementation of<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0vc4_bo_create, it looks like this is a CMA p=
roblem.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0It would be good to run a test with the swio=
tlb-xen disabled:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git a/arch/arm/xen/mm.c b/arch/arm/xe=
n/mm.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0index 467fa225c3d0..2bdd12785d14 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0--- a/arch/arm/xen/mm.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0+++ b/arch/arm/xen/mm.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0@@ -138,8 +138,7 @@ void xen_destroy_contigu=
ous_region(phys_addr_t pstart, unsigned int order)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0static int __init xen_mm_init(void)<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct gnttab_ca=
che_flush cflush;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!xen_initial=
_domain())<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 xen_swiotlb_init=
(1, false);<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 cflush.op =3D 0;=
<br>
&gt; <br>
&gt; With this change the kernel is not booting up. (btw. I&#39;m using USB=
 SSD for my OS.)<br>
&gt; [ =C2=A0 =C2=A00.071081] bcm2835-dma fe007000.dma: Unable to set DMA m=
ask<br>
&gt; [ =C2=A0 =C2=A00.076277] bcm2835-dma fe007b00.dma: Unable to set DMA m=
ask<br>
&gt; (XEN) physdev.c:16:d0v0 PHYSDEVOP cmd=3D25: not implemented<br>
&gt; (XEN) physdev.c:16:d0v0 PHYSDEVOP cmd=3D15: not implemented<br>
&gt; [ =C2=A0 =C2=A00.592695] pci 0000:00:00.0: Failed to add - passthrough=
 or MSI/MSI-X might fail!<br>
&gt; (XEN) physdev.c:16:d0v0 PHYSDEVOP cmd=3D15: not implemented<br>
&gt; [ =C2=A0 =C2=A00.606819] pci 0000:01:00.0: Failed to add - passthrough=
 or MSI/MSI-X might fail!<br>
&gt; [ =C2=A0 =C2=A01.212820] usb 1-1: device descriptor read/64, error 18<=
br>
&gt; [ =C2=A0 =C2=A01.452815] usb 1-1: device descriptor read/64, error 18<=
br>
&gt; [ =C2=A0 =C2=A01.820813] usb 1-1: device descriptor read/64, error 18<=
br>
&gt; [ =C2=A0 =C2=A02.060815] usb 1-1: device descriptor read/64, error 18<=
br>
&gt; [ =C2=A0 =C2=A02.845548] usb 1-1: device descriptor read/8, error -61<=
br>
&gt; [ =C2=A0 =C2=A02.977603] usb 1-1: device descriptor read/8, error -61<=
br>
&gt; [ =C2=A0 =C2=A03.237530] usb 1-1: device descriptor read/8, error -61<=
br>
&gt; [ =C2=A0 =C2=A03.369585] usb 1-1: device descriptor read/8, error -61<=
br>
&gt; [ =C2=A0 =C2=A03.480765] usb usb1-port1: unable to enumerate USB devic=
e<br>
&gt; <br>
&gt; Traces stop here. I could try with a memory card. Maybe it makes a dif=
ference.<br>
<br>
This is very surprising. Disabling swiotlb-xen should make things better<br=
>
not worse. The only reason I can think of why it could make things worse<br=
>
is if Linux runs out of low memory. Julien&#39;s patch<br>
437b0aa06a014ce174e24c0d3530b3e9ab19b18b for Xen should have addressed<br>
that issue though. Julien, any ideas?<br></blockquote><div><div class=3D"gm=
ail_quote"><div>I really don&#39;t know if this is a problem but in the all=
ocate_memory_11=C2=A0=C2=A0arch_get_dma_bitsize is called. That should retu=
rn the platform-&gt;dma_bitsize but at the early stage of boot platform is =
not initialized so default 32 is returned. I tried changing the hard code f=
rom 32 -&gt; 30 but it didn&#39;t make any difference.<br></div></div><bloc=
kquote style=3D"margin:0px 0px 0px 40px;border:none;padding:0px"><div class=
=3D"gmail_quote"><div>static void __init allocate_memory_11(struct domain *=
d,</div></div><div class=3D"gmail_quote"><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct kernel_info *kinfo)</div></div><div =
class=3D"gmail_quote"><div>{</div></div><div class=3D"gmail_quote"><div>=C2=
=A0 =C2=A0 const unsigned int min_low_order =3D</div></div><div class=3D"gm=
ail_quote"><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 get_order_from_bytes(min_t(padd=
r_t, dom0_mem, MB(128)));</div></div><div class=3D"gmail_quote"><div>=C2=A0=
 =C2=A0 const unsigned int min_order =3D get_order_from_bytes(MB(4));</div>=
</div><div class=3D"gmail_quote"><div>=C2=A0 =C2=A0 struct page_info *pg;</=
div></div><div class=3D"gmail_quote"><div>=C2=A0 =C2=A0 unsigned int order =
=3D get_allocation_size(kinfo-&gt;unassigned_mem);</div></div><div class=3D=
"gmail_quote"><div>=C2=A0 =C2=A0 int i;</div></div><div class=3D"gmail_quot=
e"><div><br></div></div><div class=3D"gmail_quote"><div>=C2=A0 =C2=A0 bool =
lowmem =3D true;</div></div><div class=3D"gmail_quote"><div>=C2=A0 =C2=A0 u=
nsigned int lowmem_bitsize =3D min(32U, <b>arch_get_dma_bitsize</b>());</di=
v><div><br></div></div></blockquote>also here the place where static dma_bi=
tsize is set is not called for dom0<br><blockquote style=3D"margin:0px 0px =
0px 40px;border:none;padding:0px"><div class=3D"gmail_quote"><div><br></div=
><div>void __init end_boot_allocator(void)<br>{<br></div><div>....</div><di=
v>=C2=A0 =C2=A0 if ( !dma_bitsize &amp;&amp; (num_online_nodes() &gt; 1) )<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 dma_bitsize =3D arch_get_dma_bitsize();<br><=
/div></div></blockquote></div><div>=C2=A0</div><div>and will lead alloc_dom=
heap_pages not to use dma_bitsize since it is not set.</div><div>struct pag=
e_info *alloc_domheap_pages(<br>=C2=A0 =C2=A0 struct domain *d, unsigned in=
t order, unsigned int memflags)<br>{<br></div><div><br></div><div>uses stat=
ic: dma_bitsize and currently is not set for raspberry pi.</div><div><br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0It is going to be fine just to boot Dom0 and=
 DomUs without PV drivers.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Also, can you post the device tree that you =
are using here? Just in case<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0there is an issue with Xen parsing any possi=
ble /reserved-memory nodes<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0with CMA info that need to be passed on to D=
om0.<br>
&gt; <br>
&gt; Here is the device dumped from command line:<br>
&gt; dtc -I fs /proc/device-tree<br>
&gt; <a href=3D"https://drive.google.com/file/d/17u18dJHxRfbGZMtRXIwtLVZZfM=
j9KwN-/view?usp=3Dsharing" rel=3D"noreferrer" target=3D"_blank">https://dri=
ve.google.com/file/d/17u18dJHxRfbGZMtRXIwtLVZZfMj9KwN-/view?usp=3Dsharing</=
a><br>
<br>
There is a reserved-memory node:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 reserved-memory {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #address-cells =3D =
&lt;0x02&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #size-cells =3D &lt=
;0x01&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ranges;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 phandle =3D &lt;0x3=
f&gt;;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linux,cma {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 linux,cma-default;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 alloc-ranges =3D &lt;0x00 0x00 0x30000000&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 compatible =3D &quot;shared-dma-pool&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 size =3D &lt;0x10000000&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 phandle =3D &lt;0x40&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 reusable;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
<br>
But in theory Xen should be able to export it to Dom0. It would be worth<br=
>
verifying that by running the same dtc -I fs /proc/device-tree in dom0 (in<=
br>
the dom0 configuration that can finish booting of course) you get the<br>
same reserved-memory node.<br></blockquote><div>Actually the device-tree is=
 exported from the dom0.</div><div><br></div></div><div class=3D"gmail_quot=
e"><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
There is also another suspicious node here:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 axi {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vc_mem {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 reg =3D &lt;0x3eb00000 0x3ff00000 0xc0000000&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };=C2=A0<br>
<br>
Which doesn&#39;t seem device tree exactly compliant and maybe GPU related.=
<br>
But again, Xen would probably export it as is to Dom0.<br>
<br>
<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; p.s.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; While te=
sting I found issue with Xen master branch and your patch:=C2=A0xen/rpi4: i=
mplement watchdog-based reset<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Looks li=
ke black listing the=C2=A0bcm2835-pm<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; @@ -37,1=
2 +41,69 @@ static const struct dt_device_match rpi4_blacklist_dev[] __init=
const =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =
=C2=A0 =C2=A0 * The aux peripheral also shares a page with the aux UART.<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =
=C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =
=C2=A0 =C2=A0DT_MATCH_COMPATIBLE(&quot;brcm,bcm2835-aux&quot;),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; + =C2=A0=
 =C2=A0/* Special device used for rebooting */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; + =C2=A0=
 =C2=A0DT_MATCH_COMPATIBLE(&quot;brcm,bcm2835-pm&quot;),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; will pre=
vent v3d driver to locate phandle. I think it will use the same resource:<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 p=
m: watchdog@7e100000 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0compatible =3D &quot;brcm,bcm2835-pm&quot;, &quot;brcm,=
bcm2835-pm-wdt&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; #power-d=
omain-cells =3D &lt;1&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; #reset-c=
ells =3D &lt;1&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; reg =3D =
&lt;0x7e100000 0x114&gt;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =
=C2=A0 =C2=A0&lt;0x7e00a000 0x24&gt;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =
=C2=A0 =C2=A0&lt;0x7ec11000 0x20&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; clocks =
=3D &lt;&amp;clocks BCM2835_CLOCK_V3D&gt;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &lt;&amp=
;clocks BCM2835_CLOCK_PERI_IMAGE&gt;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &lt;&amp=
;clocks BCM2835_CLOCK_H264&gt;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &lt;&amp=
;clocks BCM2835_CLOCK_ISP&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; clock-na=
mes =3D &quot;v3d&quot;, &quot;peri_image&quot;, &quot;h264&quot;, &quot;is=
p&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; system-p=
ower-controller;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; };<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Yeah, I imagi=
ne it could be possible. Can you post the error message you<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0are seeing fr=
om the v3d driver?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; This is the error:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.069682] OF: /v3dbus/v3=
d@7ec04000: could not find phandle<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.074828] OF: /v3dbus/v3=
d@7ec04000: could not find phandle<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; v3d driver is not loaded.</blockquote><=
/div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"><div dir=3D"l=
tr"><div>Br,</div><div>Jukka Kaartinen</div></div></div></div>

--0000000000006ddb3d05b9e056ee--

