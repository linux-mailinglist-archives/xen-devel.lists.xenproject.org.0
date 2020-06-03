Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A48C1ED716
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 21:50:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgZNx-000544-PY; Wed, 03 Jun 2020 19:49:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TSeS=7Q=gmail.com=tcminyard@srs-us1.protection.inumbo.net>)
 id 1jgZNw-00053z-K2
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 19:49:12 +0000
X-Inumbo-ID: 4be1165c-a5d3-11ea-9947-bc764e2007e4
Received: from mail-oo1-xc42.google.com (unknown [2607:f8b0:4864:20::c42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4be1165c-a5d3-11ea-9947-bc764e2007e4;
 Wed, 03 Jun 2020 19:49:11 +0000 (UTC)
Received: by mail-oo1-xc42.google.com with SMTP id z145so756470ooa.13
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2020 12:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=BjoQVhQ+xvPgNl9Z3U7D5+seTgkSC/GbBFtHU5et3Hc=;
 b=t8/gQnm7BUa1a2dJXcr7l12yBuIa/tgL/Pc7VXe1B7MVeCOMy9nkf5p6rlNKssTX1B
 YTZceJ7XT/uh/0jeMrZOhKEB74iQpxXnR8exYW7BHQD02AMiqOa7cuS8eudMFCp01WcZ
 KydSSId1lRL1EywY3pLolhYiV2FRnbiSUTRNWSuvfv43V2IEpB02X4/lx7Oz7c83u+rl
 b7Z17MVIR/XqFmjlccDJz7ypWfRfsDfsKRLgr0Kn18z1BJIuH3bSmCDK5jrKr31HGTVv
 7PpzOImpyhO7N0XyOPTDDDu2i83577zQGPqXCIW81nomHBnDJtntueikSA3Jnovrs4Cg
 osrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=BjoQVhQ+xvPgNl9Z3U7D5+seTgkSC/GbBFtHU5et3Hc=;
 b=EOb67L9GFyOewZGYtGIHeMeabUoYF+Nlpu5rzNPzHxbw30bcCNsofZI1hXclKp5Yu2
 MdFqcjqQwwLnaHbbcCPbSRK5Q+Q2sb1GIkSFd5OoRxCe2+Y9pzJt/mnh+C/bWSXDb4Tt
 iR7f+pWEo/R4IwU1yAQG7X4S72xG7FBiz9HwqlDEJYELDIfmVlcALTXq9mIoOfuRc65p
 AyOe5EDOmR8uBi4wF+sjoXCnayhSGOSCsAZIiFZH7LizhFdrwrqva2WhnZEtvQCB6foc
 V0BFKHqs3KDsnWY1H2wpOqhuYd6JxmONxumSuuDNiuJjRpXkw0xBTsofjNHUoWOgWoPm
 AAbQ==
X-Gm-Message-State: AOAM530mATIHYPEoDxzofmB4uJHjGI0NKaeonJIPhaqyG3qWvRFg8kqc
 xP+tiilRLrmYAkMvSwm8bw==
X-Google-Smtp-Source: ABdhPJyjAaiGJMdnfUFXumSSQrllyfRCCzBhO4Dfk9s9kG0Pu+ogj1CkP4aoQfjUIpChG0U+kZYP8g==
X-Received: by 2002:a4a:3559:: with SMTP id w25mr1229951oog.6.1591213751312;
 Wed, 03 Jun 2020 12:49:11 -0700 (PDT)
Received: from serve.minyard.net ([47.184.146.204])
 by smtp.gmail.com with ESMTPSA id m9sm741686oon.14.2020.06.03.12.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2020 12:49:10 -0700 (PDT)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:9d35:f7bd:647:6545])
 by serve.minyard.net (Postfix) with ESMTPSA id 4BAEF180050;
 Wed,  3 Jun 2020 19:49:09 +0000 (UTC)
Date: Wed, 3 Jun 2020 14:49:08 -0500
From: Corey Minyard <minyard@acm.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Troubles running Xen on Raspberry Pi 4 with 5.6.1 DomU
Message-ID: <20200603194908.GK2880@minyard.net>
References: <alpine.DEB.2.21.2005121723240.26167@sstabellini-ThinkPad-T480s>
 <42253259-9663-67e8-117f-8ba631243585@xen.org>
 <alpine.DEB.2.21.2005130810270.26167@sstabellini-ThinkPad-T480s>
 <d940d405-5706-c749-f546-c0c60528394d@xen.org>
 <d19f82a9-160e-ccc5-ebf9-8eb397dbeb08@xen.org>
 <alpine.DEB.2.21.2005131249570.26167@sstabellini-ThinkPad-T480s>
 <20200602183420.GE2880@minyard.net>
 <alpine.DEB.2.21.2006021222490.6774@sstabellini-ThinkPad-T480s>
 <20200603152914.GJ2880@minyard.net>
 <alpine.DEB.2.21.2006030835170.6774@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.21.2006030835170.6774@sstabellini-ThinkPad-T480s>
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
Cc: jgross@suse.com, Peng Fan <peng.fan@nxp.com>, Julien Grall <julien@xen.org>,
 roman@zededa.com,
 "jeff.kubascik@dornerworks.com" <jeff.kubascik@dornerworks.com>,
 Julien Grall <julien.grall@arm.com>,
 Nataliya Korovkina <malus.brandywine@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 boris.ostrovsky@oracle.com, Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 03, 2020 at 08:37:09AM -0700, Stefano Stabellini wrote:
> On Wed, 3 Jun 2020, Corey Minyard wrote:
> > On Tue, Jun 02, 2020 at 12:24:05PM -0700, Stefano Stabellini wrote:
> > > On Tue, 2 Jun 2020, Corey Minyard wrote:
> > > > Snip
> > > > 
> > > > > > > > > whether
> > > > > > > > > this was already done:
> > > > > > > > >      1) Does the kernel boot on baremetal (i.e without Xen)? This should
> > > > > > > > > help
> > > > > > > > > to confirm whether the bug is Xen is related.
> > > > > > > > 
> > > > > > > > Yes it boots
> > > > > > > > 
> > > > > > > > >      2) Swiotlb should not be necessary for basic dom0 boot on Arm. Did
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

Well, rpi-5.7.y fails to bootup completely without Xen, and doesn't even
display any console output on top of Xen :-(.  So there are issues, but
probably not with Xen.

I did try rpi-5.6.y and it works.

-corey

> 
> 
> > I'll be integrating this in with our Pi Xen yocto layer at
> > https://github.com/MontaVista-OpenSourceTechnology/meta-raspberrypi-xen
> 
> That's great!


