Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EAD23D4C1
	for <lists+xen-devel@lfdr.de>; Thu,  6 Aug 2020 02:38:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3TuK-0008Sy-Fo; Thu, 06 Aug 2020 00:37:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=flvv=BQ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k3TuI-0008St-Ks
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 00:37:18 +0000
X-Inumbo-ID: 677f2daf-3738-4a90-8d48-2da1ce953f19
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 677f2daf-3738-4a90-8d48-2da1ce953f19;
 Thu, 06 Aug 2020 00:37:16 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4714720842;
 Thu,  6 Aug 2020 00:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596674235;
 bh=QL2X5XhqFxDTG6/bMrTWuGUIjxEqBB6EpA4FLHOdu94=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=K+RgeZLA5Yn124yXBV/brINIkhAyoYii2OQ9X2vyBUKIsU6UWzgDRPSIQT74Iam/b
 EqfnuLN30qpXXYLisXtq6TwLphrEN/Becv3R6c7CAj3z1HADho/6/JDYAd17k7eyHg
 e+lup9+nFhys67svZc3s9E3tyA9HK0VmF5vSgtkY=
Date: Wed, 5 Aug 2020 17:37:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [RFC PATCH V1 05/12] hvm/dm: Introduce
 xendevicemodel_set_irq_level DM op
In-Reply-To: <00e261e0-295a-9cd8-ed11-7e3801a4eb58@xen.org>
Message-ID: <alpine.DEB.2.21.2008050943300.5748@sstabellini-ThinkPad-T480s>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-6-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2008041358150.5748@sstabellini-ThinkPad-T480s>
 <00e261e0-295a-9cd8-ed11-7e3801a4eb58@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, 5 Aug 2020, Julien Grall wrote:
> On 05/08/2020 00:22, Stefano Stabellini wrote:
> > On Mon, 3 Aug 2020, Oleksandr Tyshchenko wrote:
> > > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > 
> > > This patch adds ability to the device emulator to notify otherend
> > > (some entity running in the guest) using a SPI and implements Arm
> > > specific bits for it. Proposed interface allows emulator to set
> > > the logical level of a one of a domain's IRQ lines.
> > > 
> > > Please note, this is a split/cleanup of Julien's PoC:
> > > "Add support for Guest IO forwarding to a device emulator"
> > > 
> > > Signed-off-by: Julien Grall <julien.grall@arm.com>
> > > Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > ---
> > >   tools/libs/devicemodel/core.c                   | 18 ++++++++++++++++++
> > >   tools/libs/devicemodel/include/xendevicemodel.h |  4 ++++
> > >   tools/libs/devicemodel/libxendevicemodel.map    |  1 +
> > >   xen/arch/arm/dm.c                               | 22
> > > +++++++++++++++++++++-
> > >   xen/common/hvm/dm.c                             |  1 +
> > >   xen/include/public/hvm/dm_op.h                  | 15 +++++++++++++++
> > >   6 files changed, 60 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/tools/libs/devicemodel/core.c b/tools/libs/devicemodel/core.c
> > > index 4d40639..30bd79f 100644
> > > --- a/tools/libs/devicemodel/core.c
> > > +++ b/tools/libs/devicemodel/core.c
> > > @@ -430,6 +430,24 @@ int xendevicemodel_set_isa_irq_level(
> > >       return xendevicemodel_op(dmod, domid, 1, &op, sizeof(op));
> > >   }
> > >   +int xendevicemodel_set_irq_level(
> > > +    xendevicemodel_handle *dmod, domid_t domid, uint32_t irq,
> > > +    unsigned int level)
> > 
> > It is a pity that having xen_dm_op_set_pci_intx_level and
> > xen_dm_op_set_isa_irq_level already we need to add a third one, but from
> > the names alone I don't think we can reuse either of them.
> 
> The problem is not the name...
> 
> > 
> > It is very similar to set_isa_irq_level. We could almost rename
> > xendevicemodel_set_isa_irq_level to xendevicemodel_set_irq_level or,
> > better, just add an alias to it so that xendevicemodel_set_irq_level is
> > implemented by calling xendevicemodel_set_isa_irq_level. Honestly I am
> > not sure if it is worth doing it though. Any other opinions?
> 
> ... the problem is the interrupt field is only 8-bit. So we would only be able
> to cover IRQ 0 - 255.

Argh, that's not going to work :-(  I wasn't sure if it was a good idea
anyway.


> It is not entirely clear how the existing subop could be extended without
> breaking existing callers.
>
> > But I think we should plan for not needing two calls (one to set level
> > to 1, and one to set it to 0):
> > https://marc.info/?l=xen-devel&m=159535112027405
> 
> I am not sure to understand your suggestion here? Are you suggesting to remove
> the 'level' parameter?

My hope was to make it optional to call the hypercall with level = 0,
not necessarily to remove 'level' from the struct.

