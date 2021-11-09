Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AACDB449FA2
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 01:38:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223653.386439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkF8s-00014d-0n; Tue, 09 Nov 2021 00:37:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223653.386439; Tue, 09 Nov 2021 00:37:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkF8r-00011n-TH; Tue, 09 Nov 2021 00:37:37 +0000
Received: by outflank-mailman (input) for mailman id 223653;
 Tue, 09 Nov 2021 00:37:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i2Q5=P4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mkF8q-00011h-0U
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 00:37:36 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39335a9f-40f5-11ec-a9d2-d9f7a1cc8784;
 Tue, 09 Nov 2021 01:37:32 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B3636113A;
 Tue,  9 Nov 2021 00:37:30 +0000 (UTC)
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
X-Inumbo-ID: 39335a9f-40f5-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636418250;
	bh=tWZ4bsRxKTZAH6oWmZ/3ebLLK8ylId5Rvd8YYcRvROo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kkEA5EOrj0HAQcWOx0+oSC6t8b1QE48vki6R8ljYPfKRpELJtB8rM17HuDa5YgVYT
	 7cBTd4SNKYyBMqQd2Kovu5l6ju5FKe+58DsMiZR4Apye/9M/QrPB4bMQScTk5Y2FLU
	 NAbmMqpGAUCwB4+NtKAzYZN6s+B/4vHsdDVNGkEsqAzX0Ca9gNgZ59VD8WanlfGUDG
	 3ND26dzl2KGemrn5/ZZ38zbZYehsxlivieDP1sy7iwohlIMdm5dBl/sRUaExJ/F6wa
	 QBmUM1i2K1tIzfYq64habQZ/OJayxlZ8f9V2ObesaHpYjrKQzBNenlPBbgDMI83eNf
	 CnK1KxXbPjnNA==
Date: Mon, 8 Nov 2021 16:37:28 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Penny Zheng <Penny.Zheng@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Wei Chen <Wei.Chen@arm.com>, Bertrand.Marquis@arm.com, 
    Volodymyr_Babchuk@epam.com, iwj@xenproject.org
Subject: Re: static-mem preventing dom0 from booting
In-Reply-To: <7e94c7a2-7b20-2fb7-ee0a-ca24f6044fcc@xen.org>
Message-ID: <alpine.DEB.2.22.394.2111081407290.3317@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2111041829300.284830@ubuntu-linux-20-04-desktop> <DU2PR08MB73256624607E7624CAAD38E5F78E9@DU2PR08MB7325.eurprd08.prod.outlook.com> <DU2PR08MB7325A7A5658B1EB7C6EB4DECF78E9@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2111050836580.284830@ubuntu-linux-20-04-desktop> <alpine.DEB.2.22.394.2111051554000.284830@ubuntu-linux-20-04-desktop> <alpine.DEB.2.22.394.2111051604530.284830@ubuntu-linux-20-04-desktop>
 <7e94c7a2-7b20-2fb7-ee0a-ca24f6044fcc@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 6 Nov 2021, Julien Grall wrote:
> Hi Stefano,
> 
> On 05/11/2021 23:05, Stefano Stabellini wrote:
> > On Fri, 5 Nov 2021, Stefano Stabellini wrote:
> > > On Fri, 5 Nov 2021, Stefano Stabellini wrote:
> > > > The scenario is extremely simple; you can see the full device tree
> > > > configuration in the attachment to my previous email.
> > > > 
> > > > - dom0
> > > > - dom0less domU with static-mem
> > > > 
> > > > That's it! So basically it is just a normal dom0 + dom0less domU
> > > > configuration, which already works fine, where I added static-mem to the
> > > > domU and suddenly dom0 (not the domU!) stopped working.
> > > 
> > > I did some more debugging today and I found the problem. The issue is
> > > that static-mem regions are added to the list of reserved_mem. However,
> > > reserved_mem is automatically assigned to Dom0 by default at the bottom
> > > of xen/arch/arm/domain_build.c:handle_node, see the second call to
> > > make_memory_node. Really, we shouldn't give to dom0 static-mem ranges
> > > meant for other domUs. E.g. the following change is sufficient to solve
> > > the problem:
> > > 
> > > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > > index 88a79247cb..dc609c4f0e 100644
> > > --- a/xen/arch/arm/domain_build.c
> > > +++ b/xen/arch/arm/domain_build.c
> > > @@ -891,6 +891,9 @@ static int __init make_memory_node(const struct domain
> > > *d,
> > >           u64 start = mem->bank[i].start;
> > >           u64 size = mem->bank[i].size;
> > >   +        if ( mem->bank[i].xen_domain )
> > > +            continue;
> > > +
> > >           dt_dprintk("  Bank %d: %#"PRIx64"->%#"PRIx64"\n",
> > >                      i, start, start + size);
> > >   However, maybe a better fix would be to purge reserved_mem of any
> > > xen_domain items before calling make_memory_node.
> 
> I would rather not modify boot_info.reserved_mem because it may be used
> afterwards. I think your approach is the right one.
> 
> Alternatively, we would rework make_memory_node() to create one node per range
> (rather than a node with multiple ranges). This would move the loop outside of
> make_memory_node(). The advantage is we have more flexibily how on to filter
> ranges (in the future we may need to pass some reserved ranges to a domain).

Thanks for the quick feedback, I'll send a proper patch. I'll follow the
first approach for now.


> > > 
> > > I found one additional issue regarding is_domain_direct_mapped which
> > > doesn't return true for static-mem domains. I think we need to add a
> > > direct_map bool to arch_domain and set it for both dom0 and static-mem
> > > dom0less domUs, so that we can change the implementation of
> > > is_domain_direct_mapped to:
> > > 
> > > #define is_domain_direct_mapped(d) (d->arch.direct_map)
> 
> In Xen 4.16, static-mem domains are not direct mapped (i.e MFN == GFN).
> Instead, the static memory is used to allocate memory for the domain at the
> default regions in the guest memory layout.

I see, I forgot that the memory is not already mapped 1:1. 


> If you want to direct map static-mem domains, then you would have to apply [1]
> from Penny which is still under review.
> 
> Cheers,
> 
> [1] <20211015030945.2082898-1-penny.zheng@arm.com>


