Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFCB7CED17
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 03:02:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618860.963082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtHPp-0005P9-8y; Thu, 19 Oct 2023 01:01:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618860.963082; Thu, 19 Oct 2023 01:01:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtHPp-0005KI-5j; Thu, 19 Oct 2023 01:01:33 +0000
Received: by outflank-mailman (input) for mailman id 618860;
 Thu, 19 Oct 2023 01:01:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZCy=GB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qtHPn-0004en-Rr
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 01:01:31 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09dccb10-6e1b-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 03:01:30 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id C2AA5B82557;
 Thu, 19 Oct 2023 01:01:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C26FC433C7;
 Thu, 19 Oct 2023 01:01:28 +0000 (UTC)
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
X-Inumbo-ID: 09dccb10-6e1b-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697677289;
	bh=x4Cc5DcGwgOHO1iqfr/CxeDGSA8RYrUExZsQiHLGXu0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AX3REtdqBLmzODLW+P3KGWw3IAjqR8frGM/9DHHp3S4hG71dLbO4y09/waEGHz39m
	 5a2XkMFhL+dVHdAcYgvXkFqAiKIXi2be9oAxfGHiR9OnkhHtt4ZXppaAiMz1PRKqa2
	 6tiYt34lIr6QEEH7shslkmHEa8Uy+QKuD9clQ7171R0uCjP5cyQY3gVkWKrmrbnWBN
	 tC1VUa4eNR91/wvcwDWbKebh8e0cJclZgEmLB723IPVxV54OCX/fjyD93retVPu5I/
	 pFz/LUp4yLSEHcIbJEReUKu4z/hRW18R6mjVJr4GmK6OhorE+YJhOdFNoKJRuJ4Boc
	 rHJzkStdPXECw==
Date: Wed, 18 Oct 2023 18:01:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Simone Ballarin <simone.ballarin@bugseng.com>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    sstabellini@kernel.org, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH 1/4] xen/arm: address violations of MISRA C:2012 Rule
 13.1
In-Reply-To: <41d82896-5471-4eaa-8bdd-a192e28d5546@xen.org>
Message-ID: <alpine.DEB.2.22.394.2310181759310.965337@ubuntu-linux-20-04-desktop>
References: <cover.1697638210.git.simone.ballarin@bugseng.com> <31a926a09dfcef43d13a402fd3b235aeba48009d.1697638210.git.simone.ballarin@bugseng.com> <41d82896-5471-4eaa-8bdd-a192e28d5546@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 18 Oct 2023, Julien Grall wrote:
> Hi,
> 
> On 18/10/2023 15:18, Simone Ballarin wrote:
> > Rule 13.1: Initializer lists shall not contain persistent side effects
> > 
> > This patch moves expressions with side-effects into new variables before
> > the initializer lists.
> 
> Looking at the code, I feel the commit message should be a bit more verbose
> because they are no apparent side-effects.
> 
> > 
> > Function calls do not necessarily have side-effects, in these cases the
> > GCC pure or const attributes are added when possible.
> 
> You are only adding pure in this patch.
> 
> > 
> > No functional changes.
> > 
> > Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> > 
> > ---
> > Function attributes pure and const do not need to be added as GCC
> > attributes, they can be added using ECLAIR configurations.
> > ---
> >   xen/arch/arm/device.c              |  6 +++---
> >   xen/arch/arm/guestcopy.c           | 12 ++++++++----
> >   xen/arch/arm/include/asm/current.h |  2 +-
> >   3 files changed, 12 insertions(+), 8 deletions(-)
> > 
> > diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
> > index 1f631d3274..e9be078415 100644
> > --- a/xen/arch/arm/device.c
> > +++ b/xen/arch/arm/device.c
> > @@ -319,6 +319,8 @@ int handle_device(struct domain *d, struct
> > dt_device_node *dev, p2m_type_t p2mt,
> >       int res;
> >       paddr_t addr, size;
> >       bool own_device = !dt_device_for_passthrough(dev);
> > +    bool dev_is_hostbridge = is_pci_passthrough_enabled() &&
> > +                             device_get_class(dev) ==
> > DEVICE_PCI_HOSTBRIDGE;
> 
> The commit message suggests that the code is moved because there are
> side-effects. But none of them should have any side-effects.
> 
> In fact, if I am not mistaken, both is_pci_passthrough_enabled() and
> device_get_class() could be marked as pure.
> 
> >       /*
> >        * We want to avoid mapping the MMIO in dom0 for the following cases:
> >        *   - The device is owned by dom0 (i.e. it has been flagged for
> > @@ -329,9 +331,7 @@ int handle_device(struct domain *d, struct
> > dt_device_node *dev, p2m_type_t p2mt,
> >       struct map_range_data mr_data = {
> >           .d = d,
> >           .p2mt = p2mt,
> > -        .skip_mapping = !own_device ||
> > -                        (is_pci_passthrough_enabled() &&
> > -                        (device_get_class(dev) == DEVICE_PCI_HOSTBRIDGE)),
> > +        .skip_mapping = !own_device || dev_is_hostbridge,
> >           .iomem_ranges = iomem_ranges,
> >           .irq_ranges = irq_ranges
> >       };
> > diff --git a/xen/arch/arm/guestcopy.c b/xen/arch/arm/guestcopy.c
> > index 6716b03561..3ec6743bf6 100644
> > --- a/xen/arch/arm/guestcopy.c
> > +++ b/xen/arch/arm/guestcopy.c
> > @@ -109,27 +109,31 @@ static unsigned long copy_guest(void *buf, uint64_t
> > addr, unsigned int len,
> >     unsigned long raw_copy_to_guest(void *to, const void *from, unsigned int
> > len)
> >   {
> > +    struct vcpu *current_vcpu = current;
> 
> It is not clear to me what is the perceived side effect here and the others
> below. Can you clarify?

I am guessing that's because current is a global variable? But only
reading (not writing) a global variable should be OK?

