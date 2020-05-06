Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F611C720F
	for <lists+xen-devel@lfdr.de>; Wed,  6 May 2020 15:49:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWKPl-0004Rf-Fx; Wed, 06 May 2020 13:48:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Be+=6U=gmail.com=tcminyard@srs-us1.protection.inumbo.net>)
 id 1jWKPj-0004Ra-Kv
 for xen-devel@lists.xenproject.org; Wed, 06 May 2020 13:48:43 +0000
X-Inumbo-ID: 4c3f3a3c-8fa0-11ea-b07b-bc764e2007e4
Received: from mail-ot1-x342.google.com (unknown [2607:f8b0:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4c3f3a3c-8fa0-11ea-b07b-bc764e2007e4;
 Wed, 06 May 2020 13:48:42 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id z25so1256119otq.13
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2020 06:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=B1x7s6vfJM3yJXc0YvRLPDwyJ+OwvXIVCSHF6e3S+AE=;
 b=uOiz+EA+CEB9R6mbCd7c4XrojKB5HBlq+bve7HLf2Ok550hAYr5uXKyv463cx6hwUp
 9ABDGaisOrruNr9AmjGjACMm0SKpo/pINzkV5JF9MX6me/s5X3MYzVjlQlvpJ2jm8fY8
 GMC66LkWnHofVIvI2UW30xi0TrAN3hIOLXNNtATE0HF9VjweCA1+KS7UzdZJ77wMAzlP
 z1Tq0zexu5S6PjAn8d5zMxT6UcM9aROxRkIPX6xRAUFvH1nz5EGKqrNh4lFpL51zbjys
 qOq8SSyflVOAwJHzHVKZPYLlVPHx4Oc2m3ABz0wtcz2evPaNxtESRQb7oyQN0gbaGM3b
 r/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to
 :user-agent;
 bh=B1x7s6vfJM3yJXc0YvRLPDwyJ+OwvXIVCSHF6e3S+AE=;
 b=GqeRqFSHcwo0UrutDtjrkVb9Hv5bd9f9Wzrg8FydO42bk0DG3tPEHyA+Opvz2qE5IX
 K09mapWFxgJPgVhk+8r+XzwAEB82JB+B1q3JBUdqiTXDeHDr5D6QEGhv4lbpj2xo3aIZ
 W5Q89o0Q0TFJVhjwMhlfnfj0xlan+Y+FNiJyLvZkdGcIshIm4Q2EpCKl9g6sfrIBQkgL
 Y2WVs1VEdYljrH0J1EJHnoP3j3nfk1ncnBliv8CRwaEP40W65FhWtyiO5oF48MMf7sCY
 4kiTWQHMOmxKBVHNispcJOvps0o2frX62L332aIWb/KqokJAgZ7uvrNXZuNQgxJ/D6Ku
 /JVw==
X-Gm-Message-State: AGi0PuZhDE5O89qhS1aW8puA/rSR/HQKY8NkSagL2Kk2J1S/8e4cdj7P
 ela2FJzypyR8OoqMcsZaAg==
X-Google-Smtp-Source: APiQypJQ52Ya4nI+8bXygKX/fORdQMBdvuIaz162JS9GPv8+X28KuMuDIUvk5P8kaGwzUI6PvA6UfQ==
X-Received: by 2002:a9d:6e3:: with SMTP id 90mr6518859otx.261.1588772921899;
 Wed, 06 May 2020 06:48:41 -0700 (PDT)
Received: from serve.minyard.net ([47.184.149.130])
 by smtp.gmail.com with ESMTPSA id f21sm524753oig.41.2020.05.06.06.48.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 06:48:40 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:8b39:c3f3:f502:5c4e])
 by serve.minyard.net (Postfix) with ESMTPSA id 9E87D180051;
 Wed,  6 May 2020 13:48:39 +0000 (UTC)
Date: Wed, 6 May 2020 08:48:38 -0500
From: Corey Minyard <minyard@acm.org>
To: Julien Grall <julien@xen.org>
Subject: Re: Troubles running Xen on Raspberry Pi 4 with 5.6.1 DomU
Message-ID: <20200506134838.GM9902@minyard.net>
References: <CAMmSBy_A4xJmCo-PiWukv0+vkEhXXDpYwZAKAiJ=mmpuY1CbMA@mail.gmail.com>
 <20200501114201.GE9902@minyard.net>
 <CAMmSBy_h9=5cjMv3+-BKHYhBikgna731DoA+t-8FK-2tbPUH-A@mail.gmail.com>
 <20200502021647.GG9902@minyard.net>
 <4f6ef562-e213-8952-66d6-0f083bf8c593@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f6ef562-e213-8952-66d6-0f083bf8c593@xen.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: minyard@acm.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Roman Shaposhnik <roman@zededa.com>, jeff.kubascik@dornerworks.com,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sat, May 02, 2020 at 12:46:14PM +0100, Julien Grall wrote:
> Hi,
> 
> On 02/05/2020 03:16, Corey Minyard wrote:
> > On Fri, May 01, 2020 at 06:06:11PM -0700, Roman Shaposhnik wrote:
> > > On Fri, May 1, 2020 at 4:42 AM Corey Minyard <minyard@acm.org> wrote:
> > > > 
> > > > On Thu, Apr 30, 2020 at 07:20:05PM -0700, Roman Shaposhnik wrote:
> > > > > Hi!
> > > > > 
> > > > > I'm trying to run Xen on Raspberry Pi 4 with 5.6.1 stock,
> > > > > upstream kernel. The kernel itself works perfectly well
> > > > > on the board. When I try booting it as Dom0 under Xen,
> > > > > it goes into a stacktrace (attached).
> > > > 
> > > > Getting Xen working on the Pi4 requires a lot of moving parts, and they
> > > > all have to be right.
> > > 
> > > Tell me about it! It is a pretty frustrating journey to align
> > > everything just right.
> > > On the other hand -- it seems worth to enable RPi as an ARM development
> > > platform for Xen given how ubiquitous it is.
> > > 
> > > Hence me trying to combine pristine upstream kernel (5.6.1) with
> > > pristine upstream
> > > Xen to enable 100% upstream developer workflow on RPi.
> > > 
> > > > > Looking at what nice folks over at Dornerworks have previously
> > > > > done to make RPi kernels boot as Dom0 I've come across these
> > > > > 3 patches:
> > > > >      https://github.com/dornerworks/xen-rpi4-builder/tree/master/patches/linux
> > > > > 
> > > > > The first patch seems irrelevant (unless I'm missing something
> > > > > really basic here).
> > > > 
> > > > It might be irrelevant for your configuration, assuming that Xen gets
> > > > the right information from EFI.  I haven't tried EFI booting.
> > > 
> > > I'd doing a bit of belt-and-suspenders strategy really -- I'm actually
> > > using UEFI u-boot implementation that pre-populates device trees
> > > and then I'm also forcing an extra copy of it to be load explicitly
> > > via the GRUB devicetree command (GRUB runs as a UEFI payload).
> > > 
> > > I also have access to the semi-official TianoCore RPi4 port that seems
> > > to be working pretty well: https://github.com/pftf/RPi4/releases/tag/v1.5
> > > for booting all sort of UEFI payloads on RPi4.
> > > 
> > > > > The 2nd patch applied with no issue (but
> > > > > I don't think it is related) but the 3d patch failed to apply on
> > > > > account of 5.6.1 kernel no longer having:
> > > > >      dev->archdata.dev_dma_ops
> > > > > E.g.
> > > > >      https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/arm64/mm/dma-mapping.c?h=v5.6.1#n55
> > > > > 
> > > > > I've tried to emulate the effect of the patch by simply introducing
> > > > > a static variable that would signal that we already initialized
> > > > > dev->dma_ops -- but that didn't help at all.
> > > > > 
> > > > > I'm CCing Jeff Kubascik to see if the original authors of that Corey Minyard
> > > > > to see if may be they have any suggestions on how this may be dealt
> > > > > with.
> > > > > 
> > > > > Any advice would be greatly appreciated!
> > > > 
> > > > What's your Pi4 config.txt file look like? The GIC is not being handled
> > > > correctly, and I'm guessing that configuration is wrong.  You can't use
> > > > the stock config.txt file with Xen, you have to modify the configuration a
> > > > bit.
> > > 
> > > Understood. I'm actually using a custom one:
> > >      https://github.com/lf-edge/eve/blob/master/pkg/u-boot/rpi/config.txt
> > > 
> > > I could swear that I had a GIC setting in it -- but apparently no -- so
> > > I added the following at the top of what you could see at the URL above:
> > > 
> > > total_mem=4096
> > > enable_gic=1
> > > 
> > > > I think just adding:
> > > > 
> > > > enable_gic=1
> > > > total_mem=1024
> > > 
> > > Right -- but my board has 4G memory -- so I think what I did above should work.
> > 
> > Nope.  If you say 4096M of RAM, your issue is almost certainly DMA, but
> > it's not (just) the Linux code.  On the Raspberry Pi 4, several devices
> > cannot DMA to above 1024M of RAM, but Xen does not handle this.  The
> > 1024M of RAM is a limitation you will have to live with until Xen has a
> > fix.
> 
> IIUC, dom0 would need to have some memory below 1GB for this to work, am I
> correct?

FYI, this also seems to fix the issue with HDMI not working.

-corey

> 
> If so could you try the following patch?
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 430708753642..002f49dba74b 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -282,7 +282,7 @@ static void __init allocate_memory_11(struct domain *d,
>       */
>      while ( order >= min_low_order )
>      {
> -        for ( bits = order ; bits <= (lowmem ? 32 : PADDR_BITS); bits++ )
> +        for ( bits = order ; bits <= (lowmem ? 30 : PADDR_BITS); bits++ )
>          {
>              pg = alloc_domheap_pages(d, order, MEMF_bits(bits));
>              if ( pg != NULL )
> @@ -313,7 +313,7 @@ static void __init allocate_memory_11(struct domain *d,
>      order = get_allocation_size(kinfo->unassigned_mem);
>      while ( kinfo->unassigned_mem && kinfo->mem.nr_banks < NR_MEM_BANKS )
>      {
> -        pg = alloc_domheap_pages(d, order, lowmem ? MEMF_bits(32) : 0);
> +        pg = alloc_domheap_pages(d, order, lowmem ? MEMF_bits(30) : 0);
>          if ( !pg )
>          {
>              order --;
> 
> 
> Cheers,
> 
> -- 
> Julien Grall

