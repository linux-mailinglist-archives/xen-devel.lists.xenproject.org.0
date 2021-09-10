Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF09F407299
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 22:30:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184780.333521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOnA1-0007CR-5z; Fri, 10 Sep 2021 20:30:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184780.333521; Fri, 10 Sep 2021 20:30:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOnA1-0007Ae-24; Fri, 10 Sep 2021 20:30:09 +0000
Received: by outflank-mailman (input) for mailman id 184780;
 Fri, 10 Sep 2021 20:30:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WGUI=OA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mOnA0-0007AY-E4
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 20:30:08 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7dd30426-6353-49b5-965c-8376f547e563;
 Fri, 10 Sep 2021 20:30:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2476061074;
 Fri, 10 Sep 2021 20:30:06 +0000 (UTC)
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
X-Inumbo-ID: 7dd30426-6353-49b5-965c-8376f547e563
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631305806;
	bh=rfdBbdaI5Rc/WfF8f5SA31qpkpvfKGbPHuwbBJfsqbU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Ou1fBqQNYMA6UXSMIoYfQzVm5NCH0sb071L0ykcTN9SxF/NL/+OV/mmMc87oGthLw
	 fMdFKSXPt5GbzTlcvHnMWcE1dp0P/BuxJtrGqXsJ9xyamzTpY2LULLcOfskf3QO/jd
	 H8q9E/bZP9Je1lCqgBQIXPm8RgRgccboIejM//YyINxHwY7GYNyRutt6M0exJvAJEa
	 zLGSAGVyM7KhrY+5IXDzAvF6D6uLqII23gSKJg4CktO9xjRMzvIfmk2eo73gtS8Xa4
	 haxtxc5joZs3swoBwKKhH7PzsZwyyAve2ghx/PO13HmJTPNaAJ2J1A9ai0fU+le10v
	 i08JHGPYELd0A==
Date: Fri, 10 Sep 2021 13:30:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, 
    Oleksandr Andrushchenko <andr2000@gmail.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "sstabellini@kernel.org" <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Artem Mygaiev <Artem_Mygaiev@epam.com>, 
    "roger.pau@citrix.com" <roger.pau@citrix.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Rahul Singh <rahul.singh@arm.com>
Subject: Re: [PATCH 10/11] xen/arm: Do not map PCI ECAM space to Domain-0's
 p2m
In-Reply-To: <684b3534-40eb-add7-f46e-c6258904757b@xen.org>
Message-ID: <alpine.DEB.2.21.2109101325110.10523@sstabellini-ThinkPad-T480s>
References: <20210903083347.131786-1-andr2000@gmail.com> <20210903083347.131786-11-andr2000@gmail.com> <35f7faf6-db90-f279-8ed1-fa4ba96812fb@xen.org> <468a868c-1183-e05f-0c92-3cba172cecb3@epam.com> <9ec2c22c-b834-1c87-71af-236e13538c4a@xen.org>
 <15a930ff-77d5-b962-b346-c586a2769009@epam.com> <684b3534-40eb-add7-f46e-c6258904757b@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1425355773-1631305806=:10523"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1425355773-1631305806=:10523
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 10 Sep 2021, Julien Grall wrote:
> On 10/09/2021 15:01, Oleksandr Andrushchenko wrote:
> > On 10.09.21 16:18, Julien Grall wrote:
> > > On 10/09/2021 13:37, Oleksandr Andrushchenko wrote:
> > > > Hi, Julien!
> > > 
> > > Hi Oleksandr,
> > > 
> > > > On 09.09.21 20:58, Julien Grall wrote:
> > > > > On 03/09/2021 09:33, Oleksandr Andrushchenko wrote:
> > > > > > From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> > > > > > 
> > > > > > Host bridge controller's ECAM space is mapped into Domain-0's p2m,
> > > > > > thus it is not possible to trap the same for vPCI via MMIO handlers.
> > > > > > For this to work we need to not map those while constructing the
> > > > > > domain.
> > > > > > 
> > > > > > Note, that during Domain-0 creation there is no pci_dev yet
> > > > > > allocated for
> > > > > > host bridges, thus we cannot match PCI host and its associated
> > > > > > bridge by SBDF. Use dt_device_node field for checks instead.
> > > > > > 
> > > > > > Signed-off-by: Oleksandr Andrushchenko
> > > > > > <oleksandr_andrushchenko@epam.com>
> > > > > > ---
> > > > > >     xen/arch/arm/domain_build.c        |  3 +++
> > > > > >     xen/arch/arm/pci/ecam.c            | 17 +++++++++++++++++
> > > > > >     xen/arch/arm/pci/pci-host-common.c | 22 ++++++++++++++++++++++
> > > > > >     xen/include/asm-arm/pci.h          | 12 ++++++++++++
> > > > > >     4 files changed, 54 insertions(+)
> > > > > > 
> > > > > > diff --git a/xen/arch/arm/domain_build.c
> > > > > > b/xen/arch/arm/domain_build.c
> > > > > > index da427f399711..76f5b513280c 100644
> > > > > > --- a/xen/arch/arm/domain_build.c
> > > > > > +++ b/xen/arch/arm/domain_build.c
> > > > > > @@ -1257,6 +1257,9 @@ static int __init map_range_to_domain(const
> > > > > > struct dt_device_node *dev,
> > > > > >             }
> > > > > >         }
> > > > > >     +    if ( need_mapping && (device_get_class(dev) == DEVICE_PCI)
> > > > > > ) > +        need_mapping = pci_host_bridge_need_p2m_mapping(d, dev,
> > > > > addr, len);
> > > > > 
> > > > > AFAICT, with device_get_class(dev), you know whether the hostbridge is
> > > > > used by Xen. Therefore, I would expect that we don't want to map all
> > > > > the regions of the hostbridges in dom0 (including the BARs).
> > > > > 
> > > > > Can you clarify it?
> > > > We only want to trap ECAM, not MMIOs and any other memory regions as the
> > > > bridge is
> > > > 
> > > > initialized and used by Domain-0 completely.
> > > 
> > > What do you mean by "used by Domain-0 completely"? The hostbridge is owned
> > > by Xen so I don't think we can let dom0 access any MMIO regions by
> > > default.
> > 
> > Now it's my time to ask why do you think Xen owns the bridge?
> > 
> > All the bridges are passed to Domain-0, are fully visible to Domain-0,
> > initialized in Domain-0.
> > 
> > Enumeration etc. is done in Domain-0. So how comes that Xen owns the bridge?
> > In what way it does?
> > 
> > Xen just accesses the ECAM when it needs it, but that's it. Xen traps ECAM
> > access - that is true.
> > 
> > But it in no way uses MMIOs etc. of the bridge - those under direct control
> > of Domain-0
> 
> So I looked on the snipped of the design document you posted. I think you are
> instead referring to a different part:
> 
> " PCI-PCIe enumeration is a process of detecting devices connected to its
> host.
> It is the responsibility of the hardware domain or boot firmware to do the PCI
> enumeration and configure the BAR, PCI capabilities, and MSI/MSI-X
> configuration."
> 
> But I still don't see why it means we have to map the MMIOs right now. Dom0
> should not need to access the MMIOs (aside the hostbridge registers) until the
> BARs are configured.

This is true especially when we are going to assign a specific PCIe
device to a DomU. In that case, the related MMIO regions are going to be
mapped to the DomU and it would be a bad idea to also keep them mapped
in Dom0. Once we do PCIe assignment, the MMIO region of the PCIe device
being assigned should only be mapped in the DomU, right?

If so, it would be better if the MMIO region in question was never
mapped into Dom0 at all rather having to unmap it.

With the current approach, given that the entire PCIe aperture is mapped
to Dom0 since boot, we would have to identify the relevant subset region
and unmap it from Dom0 when doing assignment.
--8323329-1425355773-1631305806=:10523--

