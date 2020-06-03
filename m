Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 368BE1ED720
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 21:56:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgZUb-00067V-KE; Wed, 03 Jun 2020 19:56:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cLay=7Q=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1jgZUZ-00067P-Qh
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 19:56:03 +0000
X-Inumbo-ID: 4024ba02-a5d4-11ea-81bc-bc764e2007e4
Received: from mail-qk1-x743.google.com (unknown [2607:f8b0:4864:20::743])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4024ba02-a5d4-11ea-81bc-bc764e2007e4;
 Wed, 03 Jun 2020 19:56:01 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id q8so3510940qkm.12
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2020 12:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k2W1eXLJo+wIryPHXd9bNoAzHFLoc5awp3RPJsnVKfg=;
 b=RCs7DT+GET4pG5HUmWbUCIsY8MjRxEz4cXFtCs53LzKAEEGQuiTosYVcwO1judnbFW
 EZhIq/P7l8GmdVtUnWmme/Aa4NnaWyRtBRPIBRppC1rlmNuwTSGTpM5zUjARncpu9G2t
 LFXBVLj73gutMfQ1EwDN49ARpO2wUSZ8hAdqcQDjfNlser18D3ye6WvxcZ9ps+ViK94h
 xLQ/y8bHw5JVo2eXcLQnt48ZFiKpWTb6Fgy7sSJfFh5lnRQIBH78iQM+/te2xBL7IbyT
 laHmZ7cIfI8UO1J3/kIZqoeSCHeGEVtj414s24bQFiopz6v2vvFicrL2WMSsmKj+FpG7
 oOVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k2W1eXLJo+wIryPHXd9bNoAzHFLoc5awp3RPJsnVKfg=;
 b=JXHhSn+3ceY8vmV7QyODLVlYSxyyWjihoSFq8YcKdYX2lya4C/+SXPc2UFkuPgO+L0
 iC+soi6kVb0UyJxoZ2POEQTJI6nL4nU1V6nhH396Dtccfr1zQTcs9LkwLYQ8Sqf4QPBr
 ngQInYZISaO3Xp/z7/5jG4nnjHZhYTFlLKsOkmTLMp3SB8eXVMgcTOPyXwvNZqbS7tKt
 5kPgdmK00MA66VCfmPmjlH8dQEwjk2z5SN3Qa4qEjgg908uS6NFB74zjjrve7hrUL90O
 xtcU0WGwQRYcgN5fAlLnkCRXzh1Q6Z1WRfDsSobPsEPKW05wYwY9W+iRUEEz/MxaVum6
 Grtw==
X-Gm-Message-State: AOAM533fEgNJ4KPeHyND5tOEyww0J7fAqSmtOijI68fz1OzL0xXpZ0CN
 OuNCv+Cos6E2lJfRHY1nzwupfAKzKuyUBN76q4yF9Q==
X-Google-Smtp-Source: ABdhPJwS6Rrx7oQF4n3QWuFwqxLWZNOTDEBBbKK363AC/SbW+fwMgo8lyTvyaBNjc8A5PON2Jw+FksE3132/e36XXCY=
X-Received: by 2002:a37:5283:: with SMTP id g125mr1332987qkb.157.1591214161274; 
 Wed, 03 Jun 2020 12:56:01 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.21.2005060956120.14706@sstabellini-ThinkPad-T480s>
 <CAMmSBy_wcSD3BVcVFJVR1y1CtvxA9xMkobKwbsdf8dGxS5Hcbw@mail.gmail.com>
 <alpine.DEB.2.21.2005121723240.26167@sstabellini-ThinkPad-T480s>
 <42253259-9663-67e8-117f-8ba631243585@xen.org>
 <alpine.DEB.2.21.2005130810270.26167@sstabellini-ThinkPad-T480s>
 <d940d405-5706-c749-f546-c0c60528394d@xen.org>
 <d19f82a9-160e-ccc5-ebf9-8eb397dbeb08@xen.org>
 <alpine.DEB.2.21.2005131249570.26167@sstabellini-ThinkPad-T480s>
 <20200602183420.GE2880@minyard.net>
 <alpine.DEB.2.21.2006021222490.6774@sstabellini-ThinkPad-T480s>
 <20200603152914.GJ2880@minyard.net>
 <alpine.DEB.2.21.2006030835170.6774@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2006030835170.6774@sstabellini-ThinkPad-T480s>
From: Roman Shaposhnik <roman@zededa.com>
Date: Wed, 3 Jun 2020 12:55:50 -0700
Message-ID: <CAMmSBy-3gLQZh_kHDoDX=Nm6S7zHXR0vTr2oC1znfhOWRisHuA@mail.gmail.com>
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
Cc: Juergen Gross <jgross@suse.com>, Peng Fan <peng.fan@nxp.com>,
 Julien Grall <julien@xen.org>, Corey Minyard <minyard@acm.org>,
 "jeff.kubascik@dornerworks.com" <jeff.kubascik@dornerworks.com>,
 Julien Grall <julien.grall@arm.com>,
 Nataliya Korovkina <malus.brandywine@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Well it goes without saying, but both Julian's branch and your
patchset can have:

Tested-by: Roman Shaposhnik <roman@zededa.com>

Thanks,
Roman.

P.S. For anyone interested I'll be curating the patchset over here:
    https://github.com/rvs/eve/tree/rpi4/pkg/xen/arch/aarch64
    https://github.com/rvs/eve/tree/rpi4/pkg/new-kernel/patches-5.6.x


On Wed, Jun 3, 2020 at 8:37 AM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> On Wed, 3 Jun 2020, Corey Minyard wrote:
> > On Tue, Jun 02, 2020 at 12:24:05PM -0700, Stefano Stabellini wrote:
> > > On Tue, 2 Jun 2020, Corey Minyard wrote:
> > > > Snip
> > > >
> > > > > > > > > whether
> > > > > > > > > this was already done:
> > > > > > > > >      1) Does the kernel boot on baremetal (i.e without Xen)? This should
> > > > > > > > > help
> > > > > > > > > to confirm whether the bug is Xen is related.
> > > > > > > >
> > > > > > > > Yes it boots
> > > > > > > >
> > > > > > > > >      2) Swiotlb should not be necessary for basic dom0 boot on Arm. Did
> > > > > > > > > you try
> > > > > > > > > to disable it? This should help to confirm whether swiotlb is the
> > > > > > > > > problem or
> > > > > > > > > not.
> > > > > > > >
> > > > > > > > It boots disabling swiotlb-xen
> > > > > > >
> > > > > > > Thank you for the answer! swiotlb-xen should basically be a NOP for dom0. So
> > > > > > > this suggests swiotlb is doing some transformation on the DMA address.
> > > > > > >
> > > > > > > I have an idea what may have gone wrong. AFAICT, xen-swiotlb seems to assume
> > > > > > > the DMA address space and CPU address space is the same. Is RPI using the
> > > > > > > same address space?
> > > > > >
> > > > > > Another question, is the DMA request bounced? If so, are we sure the bounce
> > > > > > buffer is in the first GB?
> > > > >
> > > > > Yes, it is. This is actually where we spent the last few days, and I
> > > > > found another little related bug in the initialization of the
> > > > > swiotlb-xen but now I am sure the memory is under 1GB (0x34000000-0x38000000)
> > > >
> > > > Was anything ever resolved on this issue?  It just kind of ended for me,
> > > > and I looked in the main kernel and didn't find anything that looked
> > > > related.
> > >
> > > Yes, we have a patch series on the list for the Linux kernel to fix this
> > > issue but it hasn't been merged yet:
> > >
> > > https://marc.info/?l=linux-kernel&m=159001831406263&w=2
> >
> > Just FYI, I pulled the changes on top of
> >   https://github.com/raspberrypi/linux.git rpi-5.4.y
> > Along with change
> >   56e35f9c5b87ec dma-mapping: drop the dev argument to arch_sync_dma_for_*
> > before the series so it applies on 5.4, and I was able to boot and
> > create a domU.  So:
> >
> > Tested-by: Corey Minyard <cminyard@mvista.com>
> >
> > At least on 5.4.  If you think it would be valuable, I can test on
> > rpi-5.7.y.
>
> I'd feel better adding your Tested-by to my next upstream submission of
> the series if you could also test on 5.7. Thank you in advance!
>
>
> > I'll be integrating this in with our Pi Xen yocto layer at
> > https://github.com/MontaVista-OpenSourceTechnology/meta-raspberrypi-xen
>
> That's great!

