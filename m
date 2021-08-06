Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AAE3E1FEF
	for <lists+xen-devel@lfdr.de>; Fri,  6 Aug 2021 02:20:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.164611.300919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBnb2-0006Wz-3v; Fri, 06 Aug 2021 00:20:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 164611.300919; Fri, 06 Aug 2021 00:20:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBnb1-0006Up-VR; Fri, 06 Aug 2021 00:20:19 +0000
Received: by outflank-mailman (input) for mailman id 164611;
 Fri, 06 Aug 2021 00:20:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EHPq=M5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mBnaz-0006Ui-GV
 for xen-devel@lists.xenproject.org; Fri, 06 Aug 2021 00:20:17 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5262ac09-a1a0-4bbe-ae56-607ccf0927fe;
 Fri, 06 Aug 2021 00:20:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CC4A661164;
 Fri,  6 Aug 2021 00:20:14 +0000 (UTC)
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
X-Inumbo-ID: 5262ac09-a1a0-4bbe-ae56-607ccf0927fe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628209215;
	bh=3zW/trZsvEschAq4rmFi5JFsDyav3qrm2kK+IxKNzaM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mde4uJ/ydngaIQi++3IjQVFeIWRe2vcSf8MoxfqgFrW6lqH6YwjFWk85Jo78nwB1o
	 zy4Z3xYlFskJoFXztt3UEd93NqX3e1OR6o3rl+erbjzqoIPlsXmsHOMqvpX10RhWQd
	 s4i9Zj/n0zSoDFsI1SNhnXzizdN54o1RbexSS+O7jMCB9+YvvU0O8EgU8RkiQ8b07T
	 Q6fI1C9WDSyRc4SppWLIyjw8FGi1IuO7r41FsMsNmJdpGus9r7/KlLTKemi1WluIpW
	 5kuRiZOOoUrD5h5c+o+dL1CvV8jDeIOoAffJkSWCZQQce7jJRvEBp7V7YQmihSH0bb
	 KHhPG+yvnGZEQ==
Date: Thu, 5 Aug 2021 17:20:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Oleksandr <olekstysh@gmail.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Daniel De Graaf <dgdegra@tycho.nsa.gov>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
Subject: Re: [RFC PATCH] xen/memory: Introduce a hypercall to provide
 unallocated space
In-Reply-To: <cb1c8fd4-a4c5-c18e-c8db-f8e317d95526@xen.org>
Message-ID: <alpine.DEB.2.21.2108051716450.18743@sstabellini-ThinkPad-T480s>
References: <1627489110-25633-1-git-send-email-olekstysh@gmail.com> <80fafc01-f063-d6e5-1c08-7ad64550310c@citrix.com> <e8db3021-78a5-e040-a70b-62ca5b500149@xen.org> <4de5ed21-379e-b618-44c8-924d88b1a519@citrix.com> <bbc7f597-5249-20a0-cac9-13f594268299@xen.org>
 <6a633f4e-13e0-4a2b-cf6e-35ef90ae977c@gmail.com> <alpine.DEB.2.21.2107301630510.10122@sstabellini-ThinkPad-T480s> <f6b2e6c6-bf58-960f-4a09-f05ebcf1f566@gmail.com> <5643d414-0b76-74a4-2c37-c7a99338d547@gmail.com> <c83378af-4d3b-9256-0e0d-f88c43c6de2f@xen.org>
 <775a2c0b-fbcc-db6d-c2a1-4ad350448c92@gmail.com> <cb1c8fd4-a4c5-c18e-c8db-f8e317d95526@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1249848725-1628209215=:18743"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1249848725-1628209215=:18743
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 5 Aug 2021, Julien Grall wrote:
> Hi Oleksandr,
> 
> On 05/08/2021 15:52, Oleksandr wrote:
> > 
> > On 05.08.21 01:00, Julien Grall wrote:
> > > 
> > > 
> > > On 04/08/2021 21:56, Oleksandr wrote:
> > > > 
> > > > Hi Julien, Stefano.
> > > 
> > > Hi Oleksandr,
> > 
> > 
> > Hi, Julien
> > 
> > 
> > Thank you for the prompt reply and explanations.
> > 
> > 
> > > 
> > > > 
> > > > On 02.08.21 22:12, Oleksandr wrote:
> > > > I have done some experiments with Xen and toolstack according to the
> > > > discussion above. So, I re-used DTB to pass a safe range to the domain.
> > > > For the range I borrowed some space from the second RAM bank.
> > > > 
> > > > -#define GUEST_RAM1_BASE   xen_mk_ullong(0x0200000000) /* 1016GB of RAM
> > > > @ 8GB */
> > > > -#define GUEST_RAM1_SIZE   xen_mk_ullong(0xfe00000000)
> > > > +#define GUEST_RAM1_BASE   xen_mk_ullong(0x0200000000) /* 888GB of RAM @
> > > > 8GB */
> > > > +#define GUEST_RAM1_SIZE   xen_mk_ullong(0xDE00000000)
> > > > +
> > > 
> > > I am a bit split with reducing the amount of RAM. On one hand large guest
> > > is not unheard on the server side (at least in the x86 world). On the
> > > other hand, I am not aware of anyone using Xen on Arm in such setup.
> > > 
> > > So technically this will be a regression, but it may be OK.
> > 
> > I got it.
> > 
> > 
> > > 
> > > 
> > > Regarding the range, this will be a problem as Xen configure the number of
> > > the IPA bits based on the PA bits. The lowest possible address space ize
> > > on 64-bit is 4GB.
> > > 
> > > From my understanding, this is because the number of IPA bits supported is
> > > contrained by the PA bits. So the position and the size of the region
> > > would need to depend on the P2M configuration.
> > 
> > Indeed, I missed these bits that IPA bits on Arm64 might be < 40 bit, I
> > remember, we select p2m_ipa_bits in setup_virt_paging() depending on pabits,
> > moreover the p2m_ipa_bits might be even restricted by some external entity
> > (IOMMU, if P2M is shared).
> > 
> > 
> > > 
> > > For simplicity, this could be the last few X bytes of the supported
> > > address space.
> > ok, agree. To summarize, so it sounds like we can't use the fixed safe range
> > as in my example, it must be variable. Well, I hope, we will be able to
> > achieve this without reducing the total amount of domain RAM in front
> > (GUEST_RAM1_SIZE). After all, we know the IPA size and the domain RAM in
> > advance, so we certainly can choose the start and size of the range. In
> > case, we won't be able to find a suitable large chunk (for example, when IPA
> > bits = 32, and domain has a lot of RAM assigned and as the result - almost
> > all address space below 4GB is in use), we won't expose a safe range to a
> > domain at all, and domain will just fall back to use real pages instead
> > (actually, how it currently behaves on Arm).
> 
> I think it would be fine for a first approach. We can refine it in the future.
> What matters is that we correctly define the binding/hypercall.

I agree with Julien on both points. Looking at the existing device tree
binding, it is almost exactly what we need, so I think it would be OK to
use it.


> > > For 32-bit domain, we also need to make sure the address is usable for
> > > domain short page tables (not too long ago Debian was shipping the kernel
> > > with them rather than LPAE). I haven't yet checked what's the limit here.
> > 
> > Hmm, I didn't take this use-case into the account. So, I assume we need the
> > safe range to be located below 4GB if is_32bit_domain() returns true.
> 
> Yes. Or we can say that if you are using a 32-bit domain then we don't (yet)
> support a safe range for range.
> > > So we would need some heuristic to decide whether to stole some RAM or use
> > > the safe space.
> > > Another possibility would be to add a new compatible in the DT that
> > > indicates the region is "big" enough.
> > I like the last idea, did you perhaps mean new property (optional) rather
> > than new compatible? Let's say "xen, safe-range" or "xen, extended-regions" 
> > ...
> 
> I actually meant adding an extra compatible because this is technically a
> change of the binding (even though it is backward compatible).
> 
> Although, I would be OK with the property. You may first want to ask the
> Device-Tree folks how they expect a binding to be extended in a backward
> compatible way.

I think we should expand the description in
Documentation/devicetree/bindings/arm/xen.txt to cover things other than
the grant table.

I don't think we necessarely need a new compatible string because as you
said the change is fully compatible. At the same time it is trivial to
add compatible strings, so that could be done as well.
--8323329-1249848725-1628209215=:18743--

