Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D2052EF07
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 17:23:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.334398.558411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns4Sf-0003s4-9E; Fri, 20 May 2022 15:22:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 334398.558411; Fri, 20 May 2022 15:22:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns4Sf-0003ol-56; Fri, 20 May 2022 15:22:41 +0000
Received: by outflank-mailman (input) for mailman id 334398;
 Fri, 20 May 2022 15:22:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oIPw=V4=citrix.com=prvs=132b3d1f7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ns4Sd-0003ob-4c
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 15:22:39 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad40d70e-d850-11ec-837e-e5687231ffcc;
 Fri, 20 May 2022 17:22:37 +0200 (CEST)
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
X-Inumbo-ID: ad40d70e-d850-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653060157;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Fn6fsFdz+u8WTlc5u0ycVtt/0N0wQVoIjarOnUcgIpU=;
  b=Jdd2KRl80L5b5ei/Q1QrtiGp6mfph7fBhE3BgUHZhryMHg9DmZDKPZ2v
   4zfpTtTCeAMbua+EDAvbNIHH41V3dk5ZKYxduqgMtA+XrvwEHCdv2hRge
   8gQRM36HbdHNTQKdJFgI5VALWcanBrnE7IC+v9n5qfvyMoZMD4BoZSOZy
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 71798530
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:DZKpYKkSIIEjrhbtsfE6B6bo5gwBJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJMUG2Cb/6JMGbzeIhxPYng90gFvJCAzNA1HQVpqn02HiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EsLd9IR2NYy24DkWVvV4
 LsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYb1wZGIeLw70nChQfKB1aBLIY3I6aCC3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3s3d8zTbfHLA+TIrKWani7t5ExjYgwMtJGJ4yY
 uJGMGU+PEmbO3WjPH8FEqouosDv2UXeWBNc63e3vJM8wlncmVkZPL/Fb4OOJ43iqd9utkSFo
 mPL+UzpDxdcM8aQoRKe6W6ljOLLmSL9WaoRGae++/osh0ecrkQZBQcKT1K9rb+8g1SnRtNEA
 0UO/2wlqq1a3EuvQ9rmVhu0ukmYrwUcUNpdFe49wAyVw6+S6AGcbkA6STpGZM0jpdUBbzUg3
 V+UnPvkHTVq9raSTBq15rqS6D+/JyURBWsDfjMfCxsI5cH5p4M+hQ6JScxseIayitD2Ai3h2
 DCioy03hrFVhskOv4254FTGjjTqqYLASgod7x/SGGmi62tRZoG/YJezwUPG9vsGJ4GcJnGeu
 FAUls7Y6/oBZaxhjwTUHr9LRuvwoa/YbnuM2jaDAqXN6RyLoE6FV8cLuQsnKQBSDuI9ZmHNU
 RL67FY5CIBoAJe6UUNmS9vvVp9ylPC+SYuNuuP8NYQXPMUoHOOT1GQ3PBPLgTiw+KQ5uftnU
 ap3Z/pAGprz5U5P6DOtD9kQ3rYwrszV7TOCHMurp/hLPFf3WZJ0dVvmGAHXBgzBxPnYyDg5C
 v4GXydw9z1RUfflfg7c+pMJIFYBIBATXM6r8ZwGJr7de1E4QgnN7sM9Jpt4JORYc1l9zL+Ur
 hlRpGcFoLYAuZE3AVrTMS0yAF8edZ1+sWg6LUQR0aWAghAejXKUxP5HLfMfJOB/nMQ6lKIcZ
 6RVKq2oX6UUIhyaqmt1UHUIhNE7HPhdrVnVZHTNjflWV8MIejElDfe/JVuzpHdUX3Xr3Sb8y
 pX5vj7mrVM4b1wKJK7rhDiHkztdYVB1dDpOYnb1
IronPort-HdrOrdr: A9a23:ZBQqxKE/OM+w1cmppLqE7seALOsnbusQ8zAXP0AYc3Jom+ij5q
 STdZMgpHjJYVcqKRQdcL+7VZVoLUmxyXcx2/h2AV7AZniFhILLFuFfBOLZqlWKcREWtNQttp
 uIG5IOceEYZmIasS+V2maFL+o=
X-IronPort-AV: E=Sophos;i="5.91,239,1647316800"; 
   d="scan'208";a="71798530"
Date: Fri, 20 May 2022 16:22:23 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Oleksandr <olekstysh@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Julien Grall <julien.grall@arm.com>, Wei
 Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH V8 2/2] libxl: Introduce basic virtio-mmio support on Arm
Message-ID: <YoeyL1uLo+BPKUOj@perard.uk.xensource.com>
References: <1651598763-12162-1-git-send-email-olekstysh@gmail.com>
 <1651598763-12162-3-git-send-email-olekstysh@gmail.com>
 <YoTTEBSlz0t8LslO@perard.uk.xensource.com>
 <755f075c-db1f-bcd3-9f0d-f5979237e431@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <755f075c-db1f-bcd3-9f0d-f5979237e431@gmail.com>

On Thu, May 19, 2022 at 08:16:16PM +0300, Oleksandr wrote:
> On 18.05.22 14:05, Anthony PERARD wrote:
> > On Tue, May 03, 2022 at 08:26:03PM +0300, Oleksandr Tyshchenko wrote:
> > > +    for (i = 0; i < d_config->num_disks; i++) {
> > > +        libxl_device_disk *disk = &d_config->disks[i];
> > > +
> > > +        if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO) {
> > > +            disk->base = alloc_virtio_mmio_base(gc, &virtio_mmio_base);
> > > +            if (!disk->base)
> > > +                return ERROR_FAIL;
> > > +
> > > +            disk->irq = alloc_virtio_mmio_irq(gc, &virtio_mmio_irq);
> > > +            if (!disk->irq)
> > > +                return ERROR_FAIL;
> > > +
> > > +            if (virtio_irq < disk->irq)
> > > +                virtio_irq = disk->irq;
> > > +            virtio_enabled = true;
> > > +
> > > +            LOG(DEBUG, "Allocate Virtio MMIO params for Vdev %s: IRQ %u BASE 0x%"PRIx64,
> > > +                disk->vdev, disk->irq, disk->base);
> > > +        }
> > > +    }
> > > +
> > > +    if (virtio_enabled)
> > > +        nr_spis += (virtio_irq - 32) + 1;
> > Is it possible to update "nr_spis" inside the loop?
> 
> yes, but ...
> 
> 
> >   The added value
> > seems to be "number of virtio device + 1",
> 
>    ... not really ...
> 
> 
> >   so updating "nr_spis" and
> > adding +1 after the loop could work, right?
> 
>    ... from my understanding, we cannot just increment nr_spis by "one"
> inside a loop, we need to calculate it.
> 
> 
> Something like that (not tested):
> 
>        uint32_t spi;
> 
>        ...
> 
>        spi = irq - 32;
>        if (nr_spis <= spi)
>            nr_spis = spi + 1;
> 
> 
> Shall I update "nr_spis" inside the loop?
> 
> Are you asking because of eliminating "virtio_enabled" and/or "virtio_irq"
> locals? They are used down the code.

I'm asking because the calculation doesn't really make sense to me yet. At the
moment "virtio_irq-32+1" happen to be the "number of disk + 1" and we
have "nr_spis += " which I don't think makes sense with the "+1".

Doesn't "nr_spis" only need to be the highest irq value for the devices
we're adding? (Maybe with +1) (also -32 because I think I understand
what 32 stand for now) (also, the "num_irqs" loop just after this loop
seems to do exactly that)

But I think what this line of code needs the most is a comment.

> > Also, what is "32"? Is it "GUEST_VIRTIO_MMIO_SPI_FIRST - 1" ?
> 
> Although currently "GUEST_VIRTIO_MMIO_SPI_FIRST - 1" = "32", we cannot rely
> on this (I mean to use "GUEST_VIRTIO_MMIO_SPI_FIRST - 1"
> 
> instead of "32"),  because "32" has yet another meaning. This is an offset
> for SPI, the values before 32 are for private IRQs (PPI, SGI).

Do you think it could be possible to name that value? I've seen other
use of 32 in the same function that have probably the same meaning. But
if you don't have a good name, I guess we can also live a bit longer
with a plain "32".

Cheers,

-- 
Anthony PERARD

