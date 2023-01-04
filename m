Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 285A865E119
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 00:48:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471552.731442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDDUP-00087c-Lm; Wed, 04 Jan 2023 23:48:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471552.731442; Wed, 04 Jan 2023 23:48:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDDUP-000851-J1; Wed, 04 Jan 2023 23:48:09 +0000
Received: by outflank-mailman (input) for mailman id 471552;
 Wed, 04 Jan 2023 23:48:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eMRm=5B=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pDDUO-0007SD-Dt
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 23:48:08 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c679f56-8c8a-11ed-b8d0-410ff93cb8f0;
 Thu, 05 Jan 2023 00:48:06 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2AE95B81717;
 Wed,  4 Jan 2023 23:48:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5681C433D2;
 Wed,  4 Jan 2023 23:48:03 +0000 (UTC)
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
X-Inumbo-ID: 3c679f56-8c8a-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672876084;
	bh=fjUjCM6/dbAhaWVyakEsxbpi0WIuGmgOsRwOzF62oD0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oXOAFC6/JyOvB7WzvJ+IAdutVCqCBX2EcQZJeEm6iWJociOiZ/IJ1rXkWfckuc1iW
	 bwX/po1vMsNVr+VUzomE7vm5n2VOoM5oYVBjMssb30lozxzFb+H5mpekIqzQU/VMRm
	 K+crZSzrqKZ4O/aLkSSkneVYxmw85WW9tDn2BGPoh2GIioKPNEA7bbuJmboOpvzeo/
	 9ZqbIuKKzqqJg4QMOHn/gSJ22Iq4LRVXyYdZ3+cOyWwXQzol8frNanL58ynGQrcn93
	 0FU75BeZ7pBPE7FRqlPo/aP37PrdXY4+OPwpD3WVmNktV8kgRWZNSp4CkqWBlFXcNu
	 5a4Kw/PfnlbGQ==
Date: Wed, 4 Jan 2023 15:48:02 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Print memory size in decimal in
 construct_domU
In-Reply-To: <2a343532-d324-e1ac-418c-5b34967d8de2@xen.org>
Message-ID: <alpine.DEB.2.22.394.2301041547290.4079@ubuntu-linux-20-04-desktop>
References: <20230102144904.17619-1-michal.orzel@amd.com> <alpine.DEB.2.22.394.2301041541260.4079@ubuntu-linux-20-04-desktop> <2a343532-d324-e1ac-418c-5b34967d8de2@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 4 Jan 2023, Julien Grall wrote:
> Hi Stefano,
> 
> On 04/01/2023 23:41, Stefano Stabellini wrote:
> > On Mon, 2 Jan 2023, Michal Orzel wrote:
> > > Printing domain's memory size in hex without even prepending it
> > > with 0x is not very useful and can be misleading. Switch to decimal
> > > notation.
> > > 
> > > Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> > 
> > Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> Was this intended for v2 rather than v1?

I didn't notice v2 was already out. I did test v2 and made sure it is
working so go ahead and pick whichever version you prefer


> > > ---
> > >   xen/arch/arm/domain_build.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > > index 829cea8de84f..7e204372368c 100644
> > > --- a/xen/arch/arm/domain_build.c
> > > +++ b/xen/arch/arm/domain_build.c
> > > @@ -3774,7 +3774,7 @@ static int __init construct_domU(struct domain *d,
> > >       if ( rc != 0 )
> > >           return rc;
> > >   -    printk("*** LOADING DOMU cpus=%u memory=%"PRIx64"KB ***\n",
> > > d->max_vcpus, mem);
> > > +    printk("*** LOADING DOMU cpus=%u memory=%"PRIu64"KB ***\n",
> > > d->max_vcpus, mem);
> > >         kinfo.vpl011 = dt_property_read_bool(node, "vpl011");
> > >   
> > > -- 
> > > 2.25.1
> > > 
> 
> -- 
> Julien Grall
> 

