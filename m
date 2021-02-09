Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE04315560
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 18:48:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83368.154973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9X6y-0006UZ-PI; Tue, 09 Feb 2021 17:47:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83368.154973; Tue, 09 Feb 2021 17:47:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9X6y-0006UA-MO; Tue, 09 Feb 2021 17:47:40 +0000
Received: by outflank-mailman (input) for mailman id 83368;
 Tue, 09 Feb 2021 17:47:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SKhV=HL=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l9X6x-0006U5-93
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 17:47:39 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6e53976b-0b80-4321-a460-aaa049aeb2dd;
 Tue, 09 Feb 2021 17:47:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6283F64EB6;
 Tue,  9 Feb 2021 17:47:37 +0000 (UTC)
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
X-Inumbo-ID: 6e53976b-0b80-4321-a460-aaa049aeb2dd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612892857;
	bh=2OnZR6eknH107cFTlwNMe+fdbVtEGcuFuTOJfubpQII=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LHl3q/G6A6xS56pUJQfg9LP3ormdXNypdzxC/FVLxFf5mUtWUKdnElMEvl8+ukX9w
	 WmHy7YlDVYR5JwP2xH25ew7cA/hiHvVf466zARxwAFlfeh9Ocu6rUSYHr3XXSi065G
	 Fy1rEqSEhjggOuc9bQ53K3TANWAG/Uxupw0IHgF6ShBefr8Zpfe20Z76Pj2RzImDvg
	 Z7s0fN4fEiVIErz5Qjp96WiKhiEczwyxTKqhjeVdn6fkEcNAlUzEPaAfAkorhBUp/c
	 ixVAedar9CMEoLlYN1L054Q7cqeCmPBdQ+JoBIFM3Lh6LtslMtSjvwhsx0+W5YC+Vu
	 XpTKbC7JtFUNg==
Date: Tue, 9 Feb 2021 09:47:36 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    "ehem+xen@m5p.com" <ehem+xen@m5p.com>
Subject: Re: [PATCH] xen: workaround missing device_type property in pci/pcie
 nodes
In-Reply-To: <22372A39-83F4-41AB-8FCC-B3A9C8551604@arm.com>
Message-ID: <alpine.DEB.2.21.2102090944240.8948@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2102081544230.8948@sstabellini-ThinkPad-T480s> <22372A39-83F4-41AB-8FCC-B3A9C8551604@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-589529193-1612892761=:8948"
Content-ID: <alpine.DEB.2.21.2102090946510.8948@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-589529193-1612892761=:8948
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2102090946511.8948@sstabellini-ThinkPad-T480s>

On Tue, 9 Feb 2021, Bertrand Marquis wrote:
> Hi Stefano,
> 
> > On 8 Feb 2021, at 23:56, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > PCI buses differ from default buses in a few important ways, so it is
> > important to detect them properly. Normally, PCI buses are expected to
> > have the following property:
> > 
> >    device_type = "pci"
> > 
> > In reality, it is not always the case. To handle PCI bus nodes that
> > don't have the device_type property, also consider the node name: if the
> > node name is "pcie" or "pci" then consider the bus as a PCI bus.
> > 
> > This commit is based on the Linux kernel commit
> > d1ac0002dd29 "of: address: Work around missing device_type property in
> > pcie nodes".
> > 
> > This fixes Xen boot on RPi4.
> 
> We are really handling here a wrong device-tree bug that could easily be fixed
> by the user.
> We should at least mention in the commit message that this is a workaround
> to solve RPi4 buggy device tree.

Not sure if it can be "easily" fixed by the user -- it took me a few
hours to figure out what the problem was, and I know Xen and device tree
pretty well :-)

Yes it would be good to have a link to the discussion in the commit
message, using the Link tag. It could be done on commit, or I can add it
to the next version.

Link: https://lore.kernel.org/xen-devel/YBmQQ3Tzu++AadKx@mattapan.m5p.com/


> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > 
> > diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> > index 18825e333e..f1a96a3b90 100644
> > --- a/xen/common/device_tree.c
> > +++ b/xen/common/device_tree.c
> > @@ -563,14 +563,28 @@ static unsigned int dt_bus_default_get_flags(const __be32 *addr)
> >  * PCI bus specific translator
> >  */
> > 
> > +static bool_t dt_node_is_pci(const struct dt_device_node *np)
> > +{
> > +    bool is_pci = !strcmp(np->name, "pcie") || !strcmp(np->name, "pci");
> 
> The Linux commit is a bit more restrictive and only does that for “pcie”.
> Any reason why you also want to have this workaround done also for “pci” ?

Yes, that's because in our case the offending node is named "pci" not
"pcie" so the original Linux commit wouldn't cover it.


> > +
> > +    if (is_pci)
> > +        printk(XENLOG_WARNING "%s: Missing device_type\n", np->full_name);
> > +
> > +    return is_pci;
> > +}
> > +
> > static bool_t dt_bus_pci_match(const struct dt_device_node *np)
> > {
> >     /*
> >      * "pciex" is PCI Express "vci" is for the /chaos bridge on 1st-gen PCI
> >      * powermacs "ht" is hypertransport
> > +     *
> > +     * If none of the device_type match, and that the node name is
> > +     * "pcie" or "pci", accept the device as PCI (with a warning).
> >      */
> >     return !strcmp(np->type, "pci") || !strcmp(np->type, "pciex") ||
> > -        !strcmp(np->type, "vci") || !strcmp(np->type, "ht");
> > +        !strcmp(np->type, "vci") || !strcmp(np->type, "ht") ||
> > +        dt_node_is_pci(np);
> > }
> > 
> > static void dt_bus_pci_count_cells(const struct dt_device_node *np,
> > 
> 
> 
--8323329-589529193-1612892761=:8948--

