Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 509E3425CEA
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 22:07:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203955.359133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYZfH-0004ZO-BP; Thu, 07 Oct 2021 20:06:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203955.359133; Thu, 07 Oct 2021 20:06:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYZfH-0004Vy-7J; Thu, 07 Oct 2021 20:06:51 +0000
Received: by outflank-mailman (input) for mailman id 203955;
 Thu, 07 Oct 2021 20:06:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ti8Z=O3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mYZfF-0004Vs-9X
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 20:06:49 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1986add6-27aa-11ec-bffc-12813bfff9fa;
 Thu, 07 Oct 2021 20:06:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4B0266105A;
 Thu,  7 Oct 2021 20:06:47 +0000 (UTC)
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
X-Inumbo-ID: 1986add6-27aa-11ec-bffc-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633637207;
	bh=l50GX8BRMPz7QLa9GLuAlpb90I7ccL1kjSWrfU1T7J8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NVh+aAvFqpmLs1vCXT8fMYPIxzKkaxc4HONxMOczxznzm67y6mprZR7eKR3YRBRdw
	 vU0pyJPI59qSWTyQ7AqJnxKtVGhmTbGYP8tuhlf843Nz6wBGvEqFb6rlFfLmNpjJhq
	 rx8GTcbTLJs0ITwBs2uwSkmxyQE7sg/G+BGFl74dGKypX0wBDPjIGKAb3+jKcpW+e7
	 NkYwcG6nFxzTLjaMjFf/9IHMymvFDAcj7kVo85EYJfd5I1VVTmFVmcoCsHwgXCzaXm
	 oYFAs4HDR+mMSR0AervP6q+X6Og6X7XPfIJLaoGtds6qpZBh6JLzlnMN/S1gWvEClK
	 ECZrCuGdolrKw==
Date: Thu, 7 Oct 2021 13:06:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr <olekstysh@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH V5 3/3] xen/arm: Updates for extended regions support
In-Reply-To: <a5a81348-4b18-6be6-ba85-4c31172459dc@gmail.com>
Message-ID: <alpine.DEB.2.21.2110071300380.414@sstabellini-ThinkPad-T480s>
References: <1633519346-3686-1-git-send-email-olekstysh@gmail.com> <1633519346-3686-4-git-send-email-olekstysh@gmail.com> <alpine.DEB.2.21.2110061843360.3209@sstabellini-ThinkPad-T480s> <a5a81348-4b18-6be6-ba85-4c31172459dc@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 7 Oct 2021, Oleksandr wrote:
> On 07.10.21 04:50, Stefano Stabellini wrote:
> 
> Hi Stefano
> 
> > On Wed, 6 Oct 2021, Oleksandr Tyshchenko wrote:
> > > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > 
> > > This is a follow-up of
> > > "b6fe410 xen/arm: Add handling of extended regions for Dom0"
> > > 
> > > Add various in-code comments, update Xen hypervisor device tree
> > > bindings text, change the log level for some prints and clarify
> > > format specifier, reuse dt_for_each_range() to avoid open-coding
> > > in find_memory_holes().
> > > 
> > > Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > Thanks for the patch, it looks like you addressed all Julien's comments
> > well.
> 
> I believe so)


[...]

> > > @@ -1193,8 +1215,8 @@ static int __init make_hypervisor_node(struct domain
> > > *d,
> > >           u64 start = ext_regions->bank[i].start;
> > >           u64 size = ext_regions->bank[i].size;
> > >   -        dt_dprintk("Extended region %d: %#"PRIx64"->%#"PRIx64"\n",
> > > -                   i, start, start + size);
> > > +        printk("Extended region %d: %#"PRIx64"->%#"PRIx64"\n",
> > > +               i, start, start + size);
> > Also should be PRIpaddr
> 
> I thought I needed to change specifier only for variables of type "paddr_t",
> but here "u64".

Sorry, you are right.

I added my reviewed-by and made the small typo changes on commit.

