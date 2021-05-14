Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5364C38016A
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 03:05:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127137.238874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhMG0-0005Q8-7x; Fri, 14 May 2021 01:04:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127137.238874; Fri, 14 May 2021 01:04:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhMG0-0005OG-4L; Fri, 14 May 2021 01:04:48 +0000
Received: by outflank-mailman (input) for mailman id 127137;
 Fri, 14 May 2021 01:04:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=saLk=KJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lhMFy-0005OA-KC
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 01:04:46 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f2364f62-8199-4894-a393-ec3e80e73e7a;
 Fri, 14 May 2021 01:04:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 08824613B5;
 Fri, 14 May 2021 01:04:44 +0000 (UTC)
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
X-Inumbo-ID: f2364f62-8199-4894-a393-ec3e80e73e7a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620954285;
	bh=h8ak1LFNpEuvvrnEcyltA6NYwXM3pDzQJjkY5k1zegM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pAWeeTTmkOE7ea830IPQIJN+SBeYpUarDv5wIeY1DmCdaSw0O85yDIUSYfmeP7DQT
	 Vo29uoYNHQNZD1dyinBccn/fVUttftU9ivrf8zRuJTOaVwd41rTt5EevpbywmtiTr+
	 eyKomCdFpN/L9N+ZvYyo3FMln03dduTzWCOXwLj6hGDqswg+puRh82FQNy6HU+bfX+
	 X0MkAU66eTKidHnrcFOK50e44ASsNrfpl6PmaZvviatrqK9XbPmAAV0skBc3klBSTS
	 T7uEBjgoYlOSLTyG9gl9brl9zAgHJvxbL4ggl7OPtnnGqpoWCGx0DRbMff/PCndPuw
	 6xcL+83MyXaKw==
Date: Thu, 13 May 2021 18:04:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall.oss@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, 
    Henry.Wang@arm.com, Penny.Zheng@arm.com, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Julien Grall <jgrall@amazon.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH RFCv2 08/15] xen/arm32: mm: Check if the virtual address
 is shared before updating it
In-Reply-To: <CAJ=z9a18zq06AKTGRJHHzR1JeabdO+-FKTmu77ZmdPdQQi=NMA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2105131801290.5018@sstabellini-ThinkPad-T480s>
References: <20210425201318.15447-1-julien@xen.org> <20210425201318.15447-9-julien@xen.org> <alpine.DEB.2.21.2105121448090.5018@sstabellini-ThinkPad-T480s> <caec9741-8c0e-b80a-1020-c985beb1e100@xen.org> <alpine.DEB.2.21.2105131528230.5018@sstabellini-ThinkPad-T480s>
 <CAJ=z9a18zq06AKTGRJHHzR1JeabdO+-FKTmu77ZmdPdQQi=NMA@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-835495777-1620954177=:5018"
Content-ID: <alpine.DEB.2.21.2105131803320.5018@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-835495777-1620954177=:5018
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2105131803321.5018@sstabellini-ThinkPad-T480s>

On Thu, 13 May 2021, Julien Grall wrote:
> On Thu, 13 May 2021, 23:32 Stefano Stabellini, <sstabellini@kernel.org> wrote:
>       On Wed, 12 May 2021, Julien Grall wrote:
>       > Hi Stefano,
>       >
>       > On 12/05/2021 23:00, Stefano Stabellini wrote:
>       > > On Sun, 25 Apr 2021, Julien Grall wrote:
>       > > > From: Julien Grall <jgrall@amazon.com>
>       > > >
>       > > > Only the first 2GB of the virtual address space is shared between all
>       > > > the page-tables on Arm32.
>       > > >
>       > > > There is a long outstanding TODO in xen_pt_update() stating that the
>       > > > function is can only work with shared mapping. Nobody has ever called
>       > >             ^ remove
>       > >
>       > > > the function with private mapping, however as we add more callers
>       > > > there is a risk to mess things up.
>       > > >
>       > > > Introduce a new define to mark the ened of the shared mappings and use
>       > >                                       ^end
>       > >
>       > > > it in xen_pt_update() to verify if the address is correct.
>       > > >
>       > > > Note that on Arm64, all the mappings are shared. Some compiler may
>       > > > complain about an always true check, so the new define is not introduced
>       > > > for arm64 and the code is protected with an #ifdef.
>       > >   On arm64 we could maybe define SHARED_VIRT_END to an arbitrarely large
>       > > value, such as:
>       > >
>       > > #define SHARED_VIRT_END (1UL<<48)
>       > >
>       > > or:
>       > >
>       > > #define SHARED_VIRT_END DIRECTMAP_VIRT_END
>       > >
>       > > ?
>       >
>       > I thought about it but I didn't want to define to a random value... I felt not
>       > define it was better.
> 
>       Yeah, I see your point: any restrictions in addressing (e.g. 48bits)
>       are physical address restrictions. Here we are talking about virtual
>       address restriction, and I don't think there are actually any
>       restrictions there?  We could validly map something at
>       0xffff_ffff_ffff_ffff. So even (1<<48) which makes sense at the physical
>       level, doesn't make sense in terms of virtual addresses.
> 
> 
> The limit for the virtual address is 2^64.
> 
> 
> 
>       > > > Signed-off-by: Julien Grall <jgrall@amazon.com>
>       > > >
>       > > > ---
>       > > >      Changes in v2:
>       > > >          - New patch
>       > > > ---
>       > > >   xen/arch/arm/mm.c            | 11 +++++++++--
>       > > >   xen/include/asm-arm/config.h |  4 ++++
>       > > >   2 files changed, 13 insertions(+), 2 deletions(-)
>       > > >
>       > > > diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
>       > > > index 8fac24d80086..5c17cafff847 100644
>       > > > --- a/xen/arch/arm/mm.c
>       > > > +++ b/xen/arch/arm/mm.c
>       > > > @@ -1275,11 +1275,18 @@ static int xen_pt_update(unsigned long virt,
>       > > >        * For arm32, page-tables are different on each CPUs. Yet, they
>       > > > share
>       > > >        * some common mappings. It is assumed that only common mappings
>       > > >        * will be modified with this function.
>       > > > -     *
>       > > > -     * XXX: Add a check.
>       > > >        */
>       > > >       const mfn_t root = virt_to_mfn(THIS_CPU_PGTABLE);
>       > > >   +#ifdef SHARED_VIRT_END
>       > > > +    if ( virt > SHARED_VIRT_END ||
>       > > > +         (SHARED_VIRT_END - virt) < nr_mfns )
>       > >
>       > > The following would be sufficient, right?
>       > >
>       > >      if ( virt + nr_mfns > SHARED_VIRT_END )
>       >
>       > This would not protect against an overflow. So I think it is best if we keep
>       > my version.
> 
>       But there can be no overflow with the way SHARED_VIRT_END is defined.
> 
>       Even if SHARED_VIRT_END was defined at (1<<48) there can be no overflow.
>       Only if we defined SHARED_VIRT_END as 0xffff_ffff_ffff_ffff we would
>       have an overflow, but you wrote above that your preference is not to do
>       that.
> 
> 
> You can have an overflow regardless the value of SHARED_VIRT_END.
> 
> Imagine virt = 2^64 - 1 and nr_mfs = 1. The addition would result to 0.
> 
> As a consequence the check would pass when it should not.

Yes you are right, I don't know how I missed it!


> One can argue that the caller will always provide sane values. However given the simplicity of the check, this is not worth the trouble if
> a caller is buggy.
> 
> Now, the problem with SHARED_VIRT_END equals to 2^64 - 1 is not the overflow but the compiler that may throw an error/warning for always
> true check. Hence the reason of not defining SHARED_VIRT_END on arm64.

OK, all checks out.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-835495777-1620954177=:5018--

