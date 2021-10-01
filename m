Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2498741E586
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 02:30:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200310.354798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mW6RK-00009u-AS; Fri, 01 Oct 2021 00:30:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200310.354798; Fri, 01 Oct 2021 00:30:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mW6RK-00007V-7M; Fri, 01 Oct 2021 00:30:14 +0000
Received: by outflank-mailman (input) for mailman id 200310;
 Fri, 01 Oct 2021 00:30:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cSXX=OV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mW6RJ-00007P-95
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 00:30:13 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d723d2e5-8ee0-40a5-b59c-b43602099123;
 Fri, 01 Oct 2021 00:30:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6C4C1619F8;
 Fri,  1 Oct 2021 00:30:11 +0000 (UTC)
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
X-Inumbo-ID: d723d2e5-8ee0-40a5-b59c-b43602099123
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633048211;
	bh=A4UT5UMPTUTuCdooBtSch4hmu7SDaU5wwi2Xxm20lEg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZeL2GpYvtAZ4uzqCOBBF6Hq+52UnMuz2X6hg4SO1jRqmWsNOxyE2ezubxus/ge1gN
	 q5hxwV/78zR83NUt3ZMNqfh9ZbANlsAu28a0uSexccIB8rb0zXjvXHjywoOp+POCGW
	 8cGlhqYzmNy1AY8Gd56T/zNm+OtYggA12j9PPloIwx58z370jh0cIWZshEaYzayDpi
	 kr5pgctgjX76cp+wO7qbsbVCXVkmTK8G2ZRsqKk/iCJv2JhkvpCjhxpTiI3Y8/tBxR
	 gtno5uYBa4atXPr0eOE1cKy7hgvjyVptd2VbAGdwkrOoha2iR7TE/Nue1Rz10uuU4y
	 IEckTTDrLUD0w==
Date: Thu, 30 Sep 2021 17:30:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Oleksandr Andrushchenko <andr2000@gmail.com>, 
    xen-devel@lists.xenproject.org, julien@xen.org, 
    oleksandr_tyshchenko@epam.com, volodymyr_babchuk@epam.com, 
    Artem_Mygaiev@epam.com, roger.pau@citrix.com, bertrand.marquis@arm.com, 
    rahul.singh@arm.com, 
    Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v3 03/11] xen/arm: Introduce pci_find_host_bridge_node
 helper
In-Reply-To: <alpine.DEB.2.21.2109301729210.3209@sstabellini-ThinkPad-T480s>
Message-ID: <alpine.DEB.2.21.2109301730010.3209@sstabellini-ThinkPad-T480s>
References: <20210930071326.857390-1-andr2000@gmail.com> <20210930071326.857390-4-andr2000@gmail.com> <alpine.DEB.2.21.2109301729210.3209@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 30 Sep 2021, Stefano Stabellini wrote:
> On Thu, 30 Sep 2021, Oleksandr Andrushchenko wrote:
> > From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> > 
> > Get host bridge node given a PCI device attached to it.
> > 
> > This helper will be re-used for adding PCI devices by the subsequent
> > patches.
> > 
> > Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> > Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

I meant to say:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> > ---
> > Since v2:
> >  - !! dropped Stefano's r-b because of the changes
> >  - s/PRI_pci/%pp after rebase onto Arm series
> > ---
> >  xen/arch/arm/pci/pci-host-common.c | 16 ++++++++++++++++
> >  xen/include/asm-arm/pci.h          |  1 +
> >  2 files changed, 17 insertions(+)
> > 
> > diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
> > index 593beeb48ce4..592c01aae5bb 100644
> > --- a/xen/arch/arm/pci/pci-host-common.c
> > +++ b/xen/arch/arm/pci/pci-host-common.c
> > @@ -276,6 +276,22 @@ int pci_get_host_bridge_segment(const struct dt_device_node *node,
> >      return -EINVAL;
> >  }
> >  
> > +/*
> > + * Get host bridge node given a device attached to it.
> > + */
> > +struct dt_device_node *pci_find_host_bridge_node(struct device *dev)
> > +{
> > +    struct pci_host_bridge *bridge;
> > +    struct pci_dev *pdev = dev_to_pci(dev);
> > +
> > +    bridge = pci_find_host_bridge(pdev->seg, pdev->bus);
> > +    if ( unlikely(!bridge) )
> > +    {
> > +        printk(XENLOG_ERR "Unable to find PCI bridge for %pp\n", &pdev->sbdf);
> > +        return NULL;
> > +    }
> > +    return bridge->dt_node;
> > +}
> >  /*
> >   * Local variables:
> >   * mode: C
> > diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
> > index 603a1fc072d1..e6d4000e2ac8 100644
> > --- a/xen/include/asm-arm/pci.h
> > +++ b/xen/include/asm-arm/pci.h
> > @@ -99,6 +99,7 @@ void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
> >  struct pci_host_bridge *pci_find_host_bridge(uint16_t segment, uint8_t bus);
> >  int pci_get_host_bridge_segment(const struct dt_device_node *node,
> >                                  uint16_t *segment);
> > +struct dt_device_node *pci_find_host_bridge_node(struct device *dev);
> >  
> >  static always_inline bool is_pci_passthrough_enabled(void)
> >  {
> > -- 
> > 2.25.1
> > 
> 

