Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E50F380008
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 00:28:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127082.238766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhJo3-00055v-12; Thu, 13 May 2021 22:27:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127082.238766; Thu, 13 May 2021 22:27:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhJo2-000530-ST; Thu, 13 May 2021 22:27:46 +0000
Received: by outflank-mailman (input) for mailman id 127082;
 Thu, 13 May 2021 22:27:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J2h5=KI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lhJo0-00052u-Pu
 for xen-devel@lists.xenproject.org; Thu, 13 May 2021 22:27:44 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eca2f0c2-d48f-4ec2-b447-bda0ece8ea24;
 Thu, 13 May 2021 22:27:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0FC3161396;
 Thu, 13 May 2021 22:27:43 +0000 (UTC)
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
X-Inumbo-ID: eca2f0c2-d48f-4ec2-b447-bda0ece8ea24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620944863;
	bh=kSvMpuSvfKZ36WVRmixfgj1PowjjluhXCUNLL+3vFXY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Cp1AdoE028S7Gq+S03bu9kN1sqGyf268NlVt6EitqtiArJaZtndWwEwOOQFYrlyI5
	 ClSudX1mMAUOQhVahvwX7MKYaJnzy1Y/lkgOvwLllOvNa1DIDzyQm6dFwJKR7pkN8U
	 927RwggVajIqQGVOdECRq/ODZBV1lUN/hAmiWqpWevZm0Qpni7CLZRlNAyqKJ/6dRM
	 Xl97/Pl4WI8UjmNz+pMYkzjNl8XPOuWGnJlExAcvkvyL6wiK/V7SFQDfmCGUvlr2bv
	 YJ7TuNMMe1oaG4EXJIMZgWwvLEDHXBWZAMQ+dvcXonKG5v3ygXQHMaH7EJuk8Izigw
	 ohygEV4kQDISQ==
Date: Thu, 13 May 2021 15:27:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Wei.Chen@arm.com, Henry.Wang@arm.com, 
    Penny.Zheng@arm.com, Bertrand.Marquis@arm.com, 
    Julien Grall <jgrall@amazon.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH RFCv2 10/15] xen/arm: mm: Allocate xen page tables in
 domheap rather than xenheap
In-Reply-To: <9429bec0-8706-42b9-cda6-77adde961235@xen.org>
Message-ID: <alpine.DEB.2.21.2105131522030.5018@sstabellini-ThinkPad-T480s>
References: <20210425201318.15447-1-julien@xen.org> <20210425201318.15447-11-julien@xen.org> <alpine.DEB.2.21.2105121529180.5018@sstabellini-ThinkPad-T480s> <9429bec0-8706-42b9-cda6-77adde961235@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 13 May 2021, Julien Grall wrote:
> Hi Stefano,
> 
> On 12/05/2021 23:44, Stefano Stabellini wrote:
> > On Sun, 25 Apr 2021, Julien Grall wrote:
> > > From: Julien Grall <jgrall@amazon.com>
> > > 
> > > xen_{un,}map_table() already uses the helper to map/unmap pages
> > > on-demand (note this is currently a NOP on arm64). So switching to
> > > domheap don't have any disavantage.
> > > 
> > > But this as the benefit:
> > >      - to keep the page tables unmapped if an arch decided to do so
> > >      - reduce xenheap use on arm32 which can be pretty small
> > > 
> > > Signed-off-by: Julien Grall <jgrall@amazon.com>
> > 
> > Thanks for the patch. It looks OK but let me ask a couple of questions
> > to clarify my doubts.
> > 
> > This change should have no impact to arm64, right?
> > 
> > For arm32, I wonder why we were using map_domain_page before in
> > xen_map_table: it wasn't necessary, was it? In fact, one could even say
> > that it was wrong?
> In xen_map_table() we need to be able to map pages from Xen binary, xenheap...
> On arm64, we would be able to use mfn_to_virt() because everything is mapped
> in Xen. But that's not the case on arm32. So we need a way to map anything
> easily.
> 
> The only difference between xenheap and domheap are the former is always
> mapped while the latter may not be. So one can also view a xenheap page as a
> glorified domheap.
> 
> I also don't really want to create yet another interface to map pages (we have
> vmap(), map_domain_page(), map_domain_global_page()...). So, when I
> implemented xen_map_table() a couple of years ago, I came to the conclusion
> that this is a convenient (ab)use of the interface.

Got it. Repeating to check if I see the full picture. On ARM64 there are
no changes. On ARM32, at runtime there are no changes mapping/unmapping
pages because xen_map_table is already mapping all pages using domheap,
even xenheap pages are mapped as domheap; so this patch makes no
difference in mapping/unmapping, correct?

The only difference is that on arm32 we are using domheap to allocate
the pages, which is a different (larger) pool.

